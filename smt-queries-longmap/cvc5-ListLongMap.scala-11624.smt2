; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135624 () Bool)

(assert start!135624)

(declare-fun res!1075866 () Bool)

(declare-fun e!878150 () Bool)

(assert (=> start!135624 (=> (not res!1075866) (not e!878150))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135624 (= res!1075866 (validMask!0 mask!898))))

(assert (=> start!135624 e!878150))

(assert (=> start!135624 true))

(declare-datatypes ((array!105291 0))(
  ( (array!105292 (arr!50791 (Array (_ BitVec 32) (_ BitVec 64))) (size!51341 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105291)

(declare-fun array_inv!39518 (array!105291) Bool)

(assert (=> start!135624 (array_inv!39518 _keys!605)))

(declare-fun b!1574569 () Bool)

(declare-fun res!1075865 () Bool)

(assert (=> b!1574569 (=> (not res!1075865) (not e!878150))))

(assert (=> b!1574569 (= res!1075865 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51341 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574570 () Bool)

(declare-fun res!1075864 () Bool)

(assert (=> b!1574570 (=> (not res!1075864) (not e!878150))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574570 (= res!1075864 (validKeyInArray!0 k!761))))

(declare-fun b!1574571 () Bool)

(assert (=> b!1574571 (= e!878150 false)))

(declare-datatypes ((SeekEntryResult!13656 0))(
  ( (MissingZero!13656 (index!57022 (_ BitVec 32))) (Found!13656 (index!57023 (_ BitVec 32))) (Intermediate!13656 (undefined!14468 Bool) (index!57024 (_ BitVec 32)) (x!141974 (_ BitVec 32))) (Undefined!13656) (MissingVacant!13656 (index!57025 (_ BitVec 32))) )
))
(declare-fun lt!674860 () SeekEntryResult!13656)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105291 (_ BitVec 32)) SeekEntryResult!13656)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574571 (= lt!674860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135624 res!1075866) b!1574569))

(assert (= (and b!1574569 res!1075865) b!1574570))

(assert (= (and b!1574570 res!1075864) b!1574571))

(declare-fun m!1447795 () Bool)

(assert (=> start!135624 m!1447795))

(declare-fun m!1447797 () Bool)

(assert (=> start!135624 m!1447797))

(declare-fun m!1447799 () Bool)

(assert (=> b!1574570 m!1447799))

(declare-fun m!1447801 () Bool)

(assert (=> b!1574571 m!1447801))

(assert (=> b!1574571 m!1447801))

(declare-fun m!1447803 () Bool)

(assert (=> b!1574571 m!1447803))

(push 1)

(assert (not b!1574571))

(assert (not start!135624))

(assert (not b!1574570))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

