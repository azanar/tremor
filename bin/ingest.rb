#!/usr/bin/env ruby

$:.push("tremor", "config")

require 'ingestion'

Tremor::Ingestion.run
