; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134990 () Bool)

(assert start!134990)

(declare-fun res!1074329 () Bool)

(declare-fun e!876763 () Bool)

(assert (=> start!134990 (=> (not res!1074329) (not e!876763))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134990 (= res!1074329 (validMask!0 mask!889))))

(assert (=> start!134990 e!876763))

(assert (=> start!134990 true))

(declare-datatypes ((array!105006 0))(
  ( (array!105007 (arr!50668 (Array (_ BitVec 32) (_ BitVec 64))) (size!51218 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105006)

(declare-fun array_inv!39395 (array!105006) Bool)

(assert (=> start!134990 (array_inv!39395 _keys!600)))

(declare-fun b!1572364 () Bool)

(declare-fun res!1074330 () Bool)

(assert (=> b!1572364 (=> (not res!1074330) (not e!876763))))

(assert (=> b!1572364 (= res!1074330 (= (size!51218 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572365 () Bool)

(declare-fun res!1074328 () Bool)

(assert (=> b!1572365 (=> (not res!1074328) (not e!876763))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572365 (= res!1074328 (validKeyInArray!0 k!754))))

(declare-fun b!1572366 () Bool)

(assert (=> b!1572366 (= e!876763 false)))

(declare-datatypes ((SeekEntryResult!13581 0))(
  ( (MissingZero!13581 (index!56722 (_ BitVec 32))) (Found!13581 (index!56723 (_ BitVec 32))) (Intermediate!13581 (undefined!14393 Bool) (index!56724 (_ BitVec 32)) (x!141499 (_ BitVec 32))) (Undefined!13581) (MissingVacant!13581 (index!56725 (_ BitVec 32))) )
))
(declare-fun lt!673960 () SeekEntryResult!13581)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105006 (_ BitVec 32)) SeekEntryResult!13581)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572366 (= lt!673960 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134990 res!1074329) b!1572364))

(assert (= (and b!1572364 res!1074330) b!1572365))

(assert (= (and b!1572365 res!1074328) b!1572366))

(declare-fun m!1446127 () Bool)

(assert (=> start!134990 m!1446127))

(declare-fun m!1446129 () Bool)

(assert (=> start!134990 m!1446129))

(declare-fun m!1446131 () Bool)

(assert (=> b!1572365 m!1446131))

(declare-fun m!1446133 () Bool)

(assert (=> b!1572366 m!1446133))

(assert (=> b!1572366 m!1446133))

(declare-fun m!1446135 () Bool)

(assert (=> b!1572366 m!1446135))

(push 1)

(assert (not b!1572366))

(assert (not start!134990))

(assert (not b!1572365))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

