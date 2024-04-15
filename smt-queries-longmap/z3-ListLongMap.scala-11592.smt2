; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135084 () Bool)

(assert start!135084)

(declare-fun b!1572540 () Bool)

(declare-fun res!1074537 () Bool)

(declare-fun e!876866 () Bool)

(assert (=> b!1572540 (=> (not res!1074537) (not e!876866))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572540 (= res!1074537 (validKeyInArray!0 k0!754))))

(declare-fun b!1572542 () Bool)

(declare-fun e!876865 () Bool)

(assert (=> b!1572542 (= e!876865 false)))

(declare-datatypes ((SeekEntryResult!13608 0))(
  ( (MissingZero!13608 (index!56830 (_ BitVec 32))) (Found!13608 (index!56831 (_ BitVec 32))) (Intermediate!13608 (undefined!14420 Bool) (index!56832 (_ BitVec 32)) (x!141611 (_ BitVec 32))) (Undefined!13608) (MissingVacant!13608 (index!56833 (_ BitVec 32))) )
))
(declare-fun lt!673866 () SeekEntryResult!13608)

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!104997 0))(
  ( (array!104998 (arr!50660 (Array (_ BitVec 32) (_ BitVec 64))) (size!51212 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104997)

(declare-fun lt!673865 () SeekEntryResult!13608)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104997 (_ BitVec 32)) SeekEntryResult!13608)

(assert (=> b!1572542 (= lt!673866 (seekKeyOrZeroReturnVacant!0 (x!141611 lt!673865) (index!56832 lt!673865) (index!56832 lt!673865) k0!754 _keys!600 mask!889))))

(declare-fun b!1572541 () Bool)

(assert (=> b!1572541 (= e!876866 e!876865)))

(declare-fun res!1074534 () Bool)

(assert (=> b!1572541 (=> (not res!1074534) (not e!876865))))

(get-info :version)

(assert (=> b!1572541 (= res!1074534 (and (not (undefined!14420 lt!673865)) ((_ is Intermediate!13608) lt!673865) (not (= (select (arr!50660 _keys!600) (index!56832 lt!673865)) k0!754)) (not (= (select (arr!50660 _keys!600) (index!56832 lt!673865)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50660 _keys!600) (index!56832 lt!673865)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56832 lt!673865) #b00000000000000000000000000000000) (bvslt (index!56832 lt!673865) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104997 (_ BitVec 32)) SeekEntryResult!13608)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572541 (= lt!673865 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1572539 () Bool)

(declare-fun res!1074536 () Bool)

(assert (=> b!1572539 (=> (not res!1074536) (not e!876866))))

(assert (=> b!1572539 (= res!1074536 (= (size!51212 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun res!1074535 () Bool)

(assert (=> start!135084 (=> (not res!1074535) (not e!876866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135084 (= res!1074535 (validMask!0 mask!889))))

(assert (=> start!135084 e!876866))

(assert (=> start!135084 true))

(declare-fun array_inv!39596 (array!104997) Bool)

(assert (=> start!135084 (array_inv!39596 _keys!600)))

(assert (= (and start!135084 res!1074535) b!1572539))

(assert (= (and b!1572539 res!1074536) b!1572540))

(assert (= (and b!1572540 res!1074537) b!1572541))

(assert (= (and b!1572541 res!1074534) b!1572542))

(declare-fun m!1445589 () Bool)

(assert (=> b!1572540 m!1445589))

(declare-fun m!1445591 () Bool)

(assert (=> b!1572542 m!1445591))

(declare-fun m!1445593 () Bool)

(assert (=> b!1572541 m!1445593))

(declare-fun m!1445595 () Bool)

(assert (=> b!1572541 m!1445595))

(assert (=> b!1572541 m!1445595))

(declare-fun m!1445597 () Bool)

(assert (=> b!1572541 m!1445597))

(declare-fun m!1445599 () Bool)

(assert (=> start!135084 m!1445599))

(declare-fun m!1445601 () Bool)

(assert (=> start!135084 m!1445601))

(check-sat (not b!1572540) (not start!135084) (not b!1572542) (not b!1572541))
(check-sat)
