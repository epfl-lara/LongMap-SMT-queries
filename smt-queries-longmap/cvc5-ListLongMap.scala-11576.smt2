; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135304 () Bool)

(assert start!135304)

(declare-fun res!1074957 () Bool)

(declare-fun e!878069 () Bool)

(assert (=> start!135304 (=> (not res!1074957) (not e!878069))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135304 (= res!1074957 (validMask!0 mask!889))))

(assert (=> start!135304 e!878069))

(assert (=> start!135304 true))

(declare-datatypes ((array!105084 0))(
  ( (array!105085 (arr!50703 (Array (_ BitVec 32) (_ BitVec 64))) (size!51254 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105084)

(declare-fun array_inv!39658 (array!105084) Bool)

(assert (=> start!135304 (array_inv!39658 _keys!600)))

(declare-fun b!1574467 () Bool)

(declare-fun res!1074959 () Bool)

(assert (=> b!1574467 (=> (not res!1074959) (not e!878069))))

(assert (=> b!1574467 (= res!1074959 (= (size!51254 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574468 () Bool)

(declare-fun res!1074958 () Bool)

(assert (=> b!1574468 (=> (not res!1074958) (not e!878069))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574468 (= res!1074958 (validKeyInArray!0 k!754))))

(declare-fun b!1574469 () Bool)

(assert (=> b!1574469 (= e!878069 false)))

(declare-datatypes ((SeekEntryResult!13510 0))(
  ( (MissingZero!13510 (index!56438 (_ BitVec 32))) (Found!13510 (index!56439 (_ BitVec 32))) (Intermediate!13510 (undefined!14322 Bool) (index!56440 (_ BitVec 32)) (x!141411 (_ BitVec 32))) (Undefined!13510) (MissingVacant!13510 (index!56441 (_ BitVec 32))) )
))
(declare-fun lt!674739 () SeekEntryResult!13510)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105084 (_ BitVec 32)) SeekEntryResult!13510)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574469 (= lt!674739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135304 res!1074957) b!1574467))

(assert (= (and b!1574467 res!1074959) b!1574468))

(assert (= (and b!1574468 res!1074958) b!1574469))

(declare-fun m!1448135 () Bool)

(assert (=> start!135304 m!1448135))

(declare-fun m!1448137 () Bool)

(assert (=> start!135304 m!1448137))

(declare-fun m!1448139 () Bool)

(assert (=> b!1574468 m!1448139))

(declare-fun m!1448141 () Bool)

(assert (=> b!1574469 m!1448141))

(assert (=> b!1574469 m!1448141))

(declare-fun m!1448143 () Bool)

(assert (=> b!1574469 m!1448143))

(push 1)

(assert (not start!135304))

(assert (not b!1574469))

(assert (not b!1574468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

