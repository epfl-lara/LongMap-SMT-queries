; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135492 () Bool)

(assert start!135492)

(declare-fun res!1075385 () Bool)

(declare-fun e!878452 () Bool)

(assert (=> start!135492 (=> (not res!1075385) (not e!878452))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135492 (= res!1075385 (validMask!0 mask!889))))

(assert (=> start!135492 e!878452))

(assert (=> start!135492 true))

(declare-datatypes ((array!105164 0))(
  ( (array!105165 (arr!50737 (Array (_ BitVec 32) (_ BitVec 64))) (size!51288 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105164)

(declare-fun array_inv!39692 (array!105164) Bool)

(assert (=> start!135492 (array_inv!39692 _keys!600)))

(declare-fun b!1575097 () Bool)

(declare-fun res!1075383 () Bool)

(assert (=> b!1575097 (=> (not res!1075383) (not e!878452))))

(assert (=> b!1575097 (= res!1075383 (= (size!51288 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1575098 () Bool)

(declare-fun res!1075384 () Bool)

(assert (=> b!1575098 (=> (not res!1075384) (not e!878452))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575098 (= res!1075384 (validKeyInArray!0 k0!754))))

(declare-fun b!1575099 () Bool)

(assert (=> b!1575099 (= e!878452 false)))

(declare-datatypes ((SeekEntryResult!13544 0))(
  ( (MissingZero!13544 (index!56574 (_ BitVec 32))) (Found!13544 (index!56575 (_ BitVec 32))) (Intermediate!13544 (undefined!14356 Bool) (index!56576 (_ BitVec 32)) (x!141565 (_ BitVec 32))) (Undefined!13544) (MissingVacant!13544 (index!56577 (_ BitVec 32))) )
))
(declare-fun lt!674985 () SeekEntryResult!13544)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105164 (_ BitVec 32)) SeekEntryResult!13544)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575099 (= lt!674985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135492 res!1075385) b!1575097))

(assert (= (and b!1575097 res!1075383) b!1575098))

(assert (= (and b!1575098 res!1075384) b!1575099))

(declare-fun m!1448589 () Bool)

(assert (=> start!135492 m!1448589))

(declare-fun m!1448591 () Bool)

(assert (=> start!135492 m!1448591))

(declare-fun m!1448593 () Bool)

(assert (=> b!1575098 m!1448593))

(declare-fun m!1448595 () Bool)

(assert (=> b!1575099 m!1448595))

(assert (=> b!1575099 m!1448595))

(declare-fun m!1448597 () Bool)

(assert (=> b!1575099 m!1448597))

(check-sat (not b!1575099) (not start!135492) (not b!1575098))
(check-sat)
