; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135644 () Bool)

(assert start!135644)

(declare-fun res!1075891 () Bool)

(declare-fun e!878080 () Bool)

(assert (=> start!135644 (=> (not res!1075891) (not e!878080))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135644 (= res!1075891 (validMask!0 mask!898))))

(assert (=> start!135644 e!878080))

(assert (=> start!135644 true))

(declare-datatypes ((array!105252 0))(
  ( (array!105253 (arr!50770 (Array (_ BitVec 32) (_ BitVec 64))) (size!51322 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105252)

(declare-fun array_inv!39706 (array!105252) Bool)

(assert (=> start!135644 (array_inv!39706 _keys!605)))

(declare-fun b!1574463 () Bool)

(declare-fun res!1075892 () Bool)

(assert (=> b!1574463 (=> (not res!1075892) (not e!878080))))

(assert (=> b!1574463 (= res!1075892 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51322 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574464 () Bool)

(declare-fun res!1075893 () Bool)

(assert (=> b!1574464 (=> (not res!1075893) (not e!878080))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574464 (= res!1075893 (validKeyInArray!0 k!761))))

(declare-fun b!1574465 () Bool)

(assert (=> b!1574465 (= e!878080 false)))

(declare-datatypes ((SeekEntryResult!13670 0))(
  ( (MissingZero!13670 (index!57078 (_ BitVec 32))) (Found!13670 (index!57079 (_ BitVec 32))) (Intermediate!13670 (undefined!14482 Bool) (index!57080 (_ BitVec 32)) (x!142021 (_ BitVec 32))) (Undefined!13670) (MissingVacant!13670 (index!57081 (_ BitVec 32))) )
))
(declare-fun lt!674652 () SeekEntryResult!13670)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105252 (_ BitVec 32)) SeekEntryResult!13670)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574465 (= lt!674652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!135644 res!1075891) b!1574463))

(assert (= (and b!1574463 res!1075892) b!1574464))

(assert (= (and b!1574464 res!1075893) b!1574465))

(declare-fun m!1447073 () Bool)

(assert (=> start!135644 m!1447073))

(declare-fun m!1447075 () Bool)

(assert (=> start!135644 m!1447075))

(declare-fun m!1447077 () Bool)

(assert (=> b!1574464 m!1447077))

(declare-fun m!1447079 () Bool)

(assert (=> b!1574465 m!1447079))

(assert (=> b!1574465 m!1447079))

(declare-fun m!1447081 () Bool)

(assert (=> b!1574465 m!1447081))

(push 1)

(assert (not b!1574465))

(assert (not start!135644))

(assert (not b!1574464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

