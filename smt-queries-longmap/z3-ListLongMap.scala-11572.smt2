; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134784 () Bool)

(assert start!134784)

(declare-fun res!1073814 () Bool)

(declare-fun e!876233 () Bool)

(assert (=> start!134784 (=> (not res!1073814) (not e!876233))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134784 (= res!1073814 (validMask!0 mask!889))))

(assert (=> start!134784 e!876233))

(assert (=> start!134784 true))

(declare-datatypes ((array!104859 0))(
  ( (array!104860 (arr!50600 (Array (_ BitVec 32) (_ BitVec 64))) (size!51152 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104859)

(declare-fun array_inv!39536 (array!104859) Bool)

(assert (=> start!134784 (array_inv!39536 _keys!600)))

(declare-fun b!1571511 () Bool)

(declare-fun res!1073812 () Bool)

(assert (=> b!1571511 (=> (not res!1073812) (not e!876233))))

(assert (=> b!1571511 (= res!1073812 (= (size!51152 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571512 () Bool)

(declare-fun res!1073813 () Bool)

(assert (=> b!1571512 (=> (not res!1073813) (not e!876233))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571512 (= res!1073813 (validKeyInArray!0 k0!754))))

(declare-datatypes ((SeekEntryResult!13548 0))(
  ( (MissingZero!13548 (index!56590 (_ BitVec 32))) (Found!13548 (index!56591 (_ BitVec 32))) (Intermediate!13548 (undefined!14360 Bool) (index!56592 (_ BitVec 32)) (x!141355 (_ BitVec 32))) (Undefined!13548) (MissingVacant!13548 (index!56593 (_ BitVec 32))) )
))
(declare-fun lt!673467 () SeekEntryResult!13548)

(declare-fun b!1571513 () Bool)

(get-info :version)

(assert (=> b!1571513 (= e!876233 (and ((_ is Intermediate!13548) lt!673467) (not (undefined!14360 lt!673467)) (not (= (select (arr!50600 _keys!600) (index!56592 lt!673467)) k0!754)) (not (= (select (arr!50600 _keys!600) (index!56592 lt!673467)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50600 _keys!600) (index!56592 lt!673467)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56592 lt!673467) #b00000000000000000000000000000000) (bvslt (index!56592 lt!673467) (bvadd #b00000000000000000000000000000001 mask!889)) (bvslt mask!889 #b00000000000000000000000000000000)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104859 (_ BitVec 32)) SeekEntryResult!13548)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571513 (= lt!673467 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!134784 res!1073814) b!1571511))

(assert (= (and b!1571511 res!1073812) b!1571512))

(assert (= (and b!1571512 res!1073813) b!1571513))

(declare-fun m!1444809 () Bool)

(assert (=> start!134784 m!1444809))

(declare-fun m!1444811 () Bool)

(assert (=> start!134784 m!1444811))

(declare-fun m!1444813 () Bool)

(assert (=> b!1571512 m!1444813))

(declare-fun m!1444815 () Bool)

(assert (=> b!1571513 m!1444815))

(declare-fun m!1444817 () Bool)

(assert (=> b!1571513 m!1444817))

(assert (=> b!1571513 m!1444817))

(declare-fun m!1444819 () Bool)

(assert (=> b!1571513 m!1444819))

(check-sat (not b!1571512) (not start!134784) (not b!1571513))
(check-sat)
