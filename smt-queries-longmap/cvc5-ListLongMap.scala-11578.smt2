; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135316 () Bool)

(assert start!135316)

(declare-fun res!1075013 () Bool)

(declare-fun e!878105 () Bool)

(assert (=> start!135316 (=> (not res!1075013) (not e!878105))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135316 (= res!1075013 (validMask!0 mask!889))))

(assert (=> start!135316 e!878105))

(assert (=> start!135316 true))

(declare-datatypes ((array!105096 0))(
  ( (array!105097 (arr!50709 (Array (_ BitVec 32) (_ BitVec 64))) (size!51260 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105096)

(declare-fun array_inv!39664 (array!105096) Bool)

(assert (=> start!135316 (array_inv!39664 _keys!600)))

(declare-fun b!1574521 () Bool)

(declare-fun res!1075012 () Bool)

(assert (=> b!1574521 (=> (not res!1075012) (not e!878105))))

(assert (=> b!1574521 (= res!1075012 (= (size!51260 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574522 () Bool)

(declare-fun res!1075011 () Bool)

(assert (=> b!1574522 (=> (not res!1075011) (not e!878105))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574522 (= res!1075011 (validKeyInArray!0 k!754))))

(declare-fun b!1574523 () Bool)

(assert (=> b!1574523 (= e!878105 false)))

(declare-datatypes ((SeekEntryResult!13516 0))(
  ( (MissingZero!13516 (index!56462 (_ BitVec 32))) (Found!13516 (index!56463 (_ BitVec 32))) (Intermediate!13516 (undefined!14328 Bool) (index!56464 (_ BitVec 32)) (x!141433 (_ BitVec 32))) (Undefined!13516) (MissingVacant!13516 (index!56465 (_ BitVec 32))) )
))
(declare-fun lt!674757 () SeekEntryResult!13516)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105096 (_ BitVec 32)) SeekEntryResult!13516)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574523 (= lt!674757 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!135316 res!1075013) b!1574521))

(assert (= (and b!1574521 res!1075012) b!1574522))

(assert (= (and b!1574522 res!1075011) b!1574523))

(declare-fun m!1448195 () Bool)

(assert (=> start!135316 m!1448195))

(declare-fun m!1448197 () Bool)

(assert (=> start!135316 m!1448197))

(declare-fun m!1448199 () Bool)

(assert (=> b!1574522 m!1448199))

(declare-fun m!1448201 () Bool)

(assert (=> b!1574523 m!1448201))

(assert (=> b!1574523 m!1448201))

(declare-fun m!1448203 () Bool)

(assert (=> b!1574523 m!1448203))

(push 1)

(assert (not b!1574523))

(assert (not start!135316))

(assert (not b!1574522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

