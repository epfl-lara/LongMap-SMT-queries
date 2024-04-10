; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5304 () Bool)

(assert start!5304)

(declare-fun res!23007 () Bool)

(declare-fun e!24313 () Bool)

(assert (=> start!5304 (=> (not res!23007) (not e!24313))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5304 (= res!23007 (validMask!0 mask!853))))

(assert (=> start!5304 e!24313))

(assert (=> start!5304 true))

(declare-fun b!38257 () Bool)

(assert (=> b!38257 (= e!24313 (not true))))

(declare-datatypes ((array!2509 0))(
  ( (array!2510 (arr!1198 (Array (_ BitVec 32) (_ BitVec 64))) (size!1305 (_ BitVec 32))) )
))
(declare-fun lt!14116 () array!2509)

(declare-fun arrayCountValidKeys!0 (array!2509 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38257 (= (arrayCountValidKeys!0 lt!14116 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!901 0))(
  ( (Unit!902) )
))
(declare-fun lt!14117 () Unit!901)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2509 (_ BitVec 32) (_ BitVec 32)) Unit!901)

(assert (=> b!38257 (= lt!14117 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14116 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38257 (= lt!14116 (array!2510 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5304 res!23007) b!38257))

(declare-fun m!30847 () Bool)

(assert (=> start!5304 m!30847))

(declare-fun m!30849 () Bool)

(assert (=> b!38257 m!30849))

(declare-fun m!30851 () Bool)

(assert (=> b!38257 m!30851))

(check-sat (not start!5304) (not b!38257))
(check-sat)
