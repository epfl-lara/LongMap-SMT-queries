; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135088 () Bool)

(assert start!135088)

(declare-fun res!1074561 () Bool)

(declare-fun e!876967 () Bool)

(assert (=> start!135088 (=> (not res!1074561) (not e!876967))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135088 (= res!1074561 (validMask!0 mask!889))))

(assert (=> start!135088 e!876967))

(assert (=> start!135088 true))

(declare-datatypes ((array!105050 0))(
  ( (array!105051 (arr!50687 (Array (_ BitVec 32) (_ BitVec 64))) (size!51237 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105050)

(declare-fun array_inv!39414 (array!105050) Bool)

(assert (=> start!135088 (array_inv!39414 _keys!600)))

(declare-fun b!1572697 () Bool)

(declare-fun res!1074560 () Bool)

(assert (=> b!1572697 (=> (not res!1074560) (not e!876967))))

(assert (=> b!1572697 (= res!1074560 (= (size!51237 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572698 () Bool)

(declare-fun res!1074559 () Bool)

(assert (=> b!1572698 (=> (not res!1074559) (not e!876967))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572698 (= res!1074559 (validKeyInArray!0 k0!754))))

(declare-fun b!1572699 () Bool)

(assert (=> b!1572699 (= e!876967 false)))

(declare-datatypes ((SeekEntryResult!13600 0))(
  ( (MissingZero!13600 (index!56798 (_ BitVec 32))) (Found!13600 (index!56799 (_ BitVec 32))) (Intermediate!13600 (undefined!14412 Bool) (index!56800 (_ BitVec 32)) (x!141578 (_ BitVec 32))) (Undefined!13600) (MissingVacant!13600 (index!56801 (_ BitVec 32))) )
))
(declare-fun lt!674089 () SeekEntryResult!13600)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105050 (_ BitVec 32)) SeekEntryResult!13600)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572699 (= lt!674089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135088 res!1074561) b!1572697))

(assert (= (and b!1572697 res!1074560) b!1572698))

(assert (= (and b!1572698 res!1074559) b!1572699))

(declare-fun m!1446371 () Bool)

(assert (=> start!135088 m!1446371))

(declare-fun m!1446373 () Bool)

(assert (=> start!135088 m!1446373))

(declare-fun m!1446375 () Bool)

(assert (=> b!1572698 m!1446375))

(declare-fun m!1446377 () Bool)

(assert (=> b!1572699 m!1446377))

(assert (=> b!1572699 m!1446377))

(declare-fun m!1446379 () Bool)

(assert (=> b!1572699 m!1446379))

(check-sat (not b!1572699) (not start!135088) (not b!1572698))
(check-sat)
