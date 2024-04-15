; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135408 () Bool)

(assert start!135408)

(declare-fun b!1573783 () Bool)

(declare-fun e!877629 () Bool)

(declare-fun e!877631 () Bool)

(assert (=> b!1573783 (= e!877629 (not e!877631))))

(declare-fun res!1075257 () Bool)

(assert (=> b!1573783 (=> res!1075257 e!877631)))

(declare-datatypes ((array!105114 0))(
  ( (array!105115 (arr!50708 (Array (_ BitVec 32) (_ BitVec 64))) (size!51260 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105114)

(declare-fun i!537 () (_ BitVec 32))

(declare-fun mask!877 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13644 0))(
  ( (MissingZero!13644 (index!56974 (_ BitVec 32))) (Found!13644 (index!56975 (_ BitVec 32))) (Intermediate!13644 (undefined!14456 Bool) (index!56976 (_ BitVec 32)) (x!141826 (_ BitVec 32))) (Undefined!13644) (MissingVacant!13644 (index!56977 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!105114 (_ BitVec 32)) SeekEntryResult!13644)

(assert (=> b!1573783 (= res!1075257 (not (= (seekEntryOrOpen!0 (select (arr!50708 _keys!591) i!537) _keys!591 mask!877) (Found!13644 i!537))))))

(declare-fun arrayContainsKey!0 (array!105114 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1573783 (arrayContainsKey!0 _keys!591 (select (arr!50708 _keys!591) i!537) #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!51959 0))(
  ( (Unit!51960) )
))
(declare-fun lt!674448 () Unit!51959)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105114 (_ BitVec 64) (_ BitVec 32)) Unit!51959)

(assert (=> b!1573783 (= lt!674448 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!591 (select (arr!50708 _keys!591) i!537) i!537))))

(declare-fun b!1573781 () Bool)

(declare-fun res!1075260 () Bool)

(assert (=> b!1573781 (=> (not res!1075260) (not e!877629))))

(assert (=> b!1573781 (= res!1075260 (and (= (size!51260 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51260 _keys!591)) (bvslt i!537 (size!51260 _keys!591))))))

(declare-fun res!1075258 () Bool)

(assert (=> start!135408 (=> (not res!1075258) (not e!877629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135408 (= res!1075258 (validMask!0 mask!877))))

(assert (=> start!135408 e!877629))

(assert (=> start!135408 true))

(declare-fun array_inv!39644 (array!105114) Bool)

(assert (=> start!135408 (array_inv!39644 _keys!591)))

(declare-fun b!1573782 () Bool)

(declare-fun res!1075259 () Bool)

(assert (=> b!1573782 (=> (not res!1075259) (not e!877629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573782 (= res!1075259 (validKeyInArray!0 (select (arr!50708 _keys!591) i!537)))))

(declare-fun b!1573784 () Bool)

(assert (=> b!1573784 (= e!877631 (bvsge (bvadd #b00000000000000000000000000000001 i!537) #b00000000000000000000000000000000))))

(assert (= (and start!135408 res!1075258) b!1573781))

(assert (= (and b!1573781 res!1075260) b!1573782))

(assert (= (and b!1573782 res!1075259) b!1573783))

(assert (= (and b!1573783 (not res!1075257)) b!1573784))

(declare-fun m!1446441 () Bool)

(assert (=> b!1573783 m!1446441))

(assert (=> b!1573783 m!1446441))

(declare-fun m!1446443 () Bool)

(assert (=> b!1573783 m!1446443))

(assert (=> b!1573783 m!1446441))

(declare-fun m!1446445 () Bool)

(assert (=> b!1573783 m!1446445))

(assert (=> b!1573783 m!1446441))

(declare-fun m!1446447 () Bool)

(assert (=> b!1573783 m!1446447))

(declare-fun m!1446449 () Bool)

(assert (=> start!135408 m!1446449))

(declare-fun m!1446451 () Bool)

(assert (=> start!135408 m!1446451))

(assert (=> b!1573782 m!1446441))

(assert (=> b!1573782 m!1446441))

(declare-fun m!1446453 () Bool)

(assert (=> b!1573782 m!1446453))

(check-sat (not start!135408) (not b!1573783) (not b!1573782))
(check-sat)
