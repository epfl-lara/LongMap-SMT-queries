; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6236 () Bool)

(assert start!6236)

(declare-fun res!25206 () Bool)

(declare-fun e!26824 () Bool)

(assert (=> start!6236 (=> (not res!25206) (not e!26824))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6236 (= res!25206 (validMask!0 mask!853))))

(assert (=> start!6236 e!26824))

(assert (=> start!6236 true))

(declare-fun b!42370 () Bool)

(assert (=> b!42370 (= e!26824 (not true))))

(declare-datatypes ((array!2811 0))(
  ( (array!2812 (arr!1349 (Array (_ BitVec 32) (_ BitVec 64))) (size!1519 (_ BitVec 32))) )
))
(declare-fun lt!17575 () array!2811)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2811 (_ BitVec 32)) Bool)

(assert (=> b!42370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17575 mask!853)))

(declare-datatypes ((Unit!1129 0))(
  ( (Unit!1130) )
))
(declare-fun lt!17576 () Unit!1129)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2811 (_ BitVec 32) (_ BitVec 32)) Unit!1129)

(assert (=> b!42370 (= lt!17576 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17575 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2811 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42370 (= (arrayCountValidKeys!0 lt!17575 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17574 () Unit!1129)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2811 (_ BitVec 32) (_ BitVec 32)) Unit!1129)

(assert (=> b!42370 (= lt!17574 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17575 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42370 (= lt!17575 (array!2812 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6236 res!25206) b!42370))

(declare-fun m!36007 () Bool)

(assert (=> start!6236 m!36007))

(declare-fun m!36009 () Bool)

(assert (=> b!42370 m!36009))

(declare-fun m!36011 () Bool)

(assert (=> b!42370 m!36011))

(declare-fun m!36013 () Bool)

(assert (=> b!42370 m!36013))

(declare-fun m!36015 () Bool)

(assert (=> b!42370 m!36015))

(push 1)

(assert (not start!6236))

(assert (not b!42370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

