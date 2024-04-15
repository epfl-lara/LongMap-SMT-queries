; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134778 () Bool)

(assert start!134778)

(declare-fun res!1073786 () Bool)

(declare-fun e!876214 () Bool)

(assert (=> start!134778 (=> (not res!1073786) (not e!876214))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134778 (= res!1073786 (validMask!0 mask!889))))

(assert (=> start!134778 e!876214))

(assert (=> start!134778 true))

(declare-datatypes ((array!104853 0))(
  ( (array!104854 (arr!50597 (Array (_ BitVec 32) (_ BitVec 64))) (size!51149 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104853)

(declare-fun array_inv!39533 (array!104853) Bool)

(assert (=> start!134778 (array_inv!39533 _keys!600)))

(declare-fun b!1571484 () Bool)

(declare-fun res!1073787 () Bool)

(assert (=> b!1571484 (=> (not res!1073787) (not e!876214))))

(assert (=> b!1571484 (= res!1073787 (= (size!51149 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571485 () Bool)

(declare-fun res!1073785 () Bool)

(assert (=> b!1571485 (=> (not res!1073785) (not e!876214))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571485 (= res!1073785 (validKeyInArray!0 k0!754))))

(declare-fun b!1571486 () Bool)

(assert (=> b!1571486 (= e!876214 false)))

(declare-datatypes ((SeekEntryResult!13545 0))(
  ( (MissingZero!13545 (index!56578 (_ BitVec 32))) (Found!13545 (index!56579 (_ BitVec 32))) (Intermediate!13545 (undefined!14357 Bool) (index!56580 (_ BitVec 32)) (x!141344 (_ BitVec 32))) (Undefined!13545) (MissingVacant!13545 (index!56581 (_ BitVec 32))) )
))
(declare-fun lt!673458 () SeekEntryResult!13545)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104853 (_ BitVec 32)) SeekEntryResult!13545)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571486 (= lt!673458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134778 res!1073786) b!1571484))

(assert (= (and b!1571484 res!1073787) b!1571485))

(assert (= (and b!1571485 res!1073785) b!1571486))

(declare-fun m!1444779 () Bool)

(assert (=> start!134778 m!1444779))

(declare-fun m!1444781 () Bool)

(assert (=> start!134778 m!1444781))

(declare-fun m!1444783 () Bool)

(assert (=> b!1571485 m!1444783))

(declare-fun m!1444785 () Bool)

(assert (=> b!1571486 m!1444785))

(assert (=> b!1571486 m!1444785))

(declare-fun m!1444787 () Bool)

(assert (=> b!1571486 m!1444787))

(check-sat (not start!134778) (not b!1571486) (not b!1571485))
(check-sat)
