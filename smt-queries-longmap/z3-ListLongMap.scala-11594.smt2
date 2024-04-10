; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135148 () Bool)

(assert start!135148)

(declare-fun b!1572939 () Bool)

(declare-fun e!877126 () Bool)

(assert (=> b!1572939 (= e!877126 false)))

(declare-datatypes ((SeekEntryResult!13615 0))(
  ( (MissingZero!13615 (index!56858 (_ BitVec 32))) (Found!13615 (index!56859 (_ BitVec 32))) (Intermediate!13615 (undefined!14427 Bool) (index!56860 (_ BitVec 32)) (x!141639 (_ BitVec 32))) (Undefined!13615) (MissingVacant!13615 (index!56861 (_ BitVec 32))) )
))
(declare-fun lt!674194 () SeekEntryResult!13615)

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun lt!674193 () SeekEntryResult!13615)

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!105083 0))(
  ( (array!105084 (arr!50702 (Array (_ BitVec 32) (_ BitVec 64))) (size!51252 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105083)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105083 (_ BitVec 32)) SeekEntryResult!13615)

(assert (=> b!1572939 (= lt!674193 (seekKeyOrZeroReturnVacant!0 (x!141639 lt!674194) (index!56860 lt!674194) (index!56860 lt!674194) k0!754 _keys!600 mask!889))))

(declare-fun b!1572937 () Bool)

(declare-fun res!1074749 () Bool)

(declare-fun e!877125 () Bool)

(assert (=> b!1572937 (=> (not res!1074749) (not e!877125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572937 (= res!1074749 (validKeyInArray!0 k0!754))))

(declare-fun b!1572938 () Bool)

(assert (=> b!1572938 (= e!877125 e!877126)))

(declare-fun res!1074750 () Bool)

(assert (=> b!1572938 (=> (not res!1074750) (not e!877126))))

(get-info :version)

(assert (=> b!1572938 (= res!1074750 (and (not (undefined!14427 lt!674194)) ((_ is Intermediate!13615) lt!674194) (not (= (select (arr!50702 _keys!600) (index!56860 lt!674194)) k0!754)) (not (= (select (arr!50702 _keys!600) (index!56860 lt!674194)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50702 _keys!600) (index!56860 lt!674194)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56860 lt!674194) #b00000000000000000000000000000000) (bvslt (index!56860 lt!674194) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105083 (_ BitVec 32)) SeekEntryResult!13615)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572938 (= lt!674194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1572936 () Bool)

(declare-fun res!1074748 () Bool)

(assert (=> b!1572936 (=> (not res!1074748) (not e!877125))))

(assert (=> b!1572936 (= res!1074748 (= (size!51252 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun res!1074747 () Bool)

(assert (=> start!135148 (=> (not res!1074747) (not e!877125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135148 (= res!1074747 (validMask!0 mask!889))))

(assert (=> start!135148 e!877125))

(assert (=> start!135148 true))

(declare-fun array_inv!39429 (array!105083) Bool)

(assert (=> start!135148 (array_inv!39429 _keys!600)))

(assert (= (and start!135148 res!1074747) b!1572936))

(assert (= (and b!1572936 res!1074748) b!1572937))

(assert (= (and b!1572937 res!1074749) b!1572938))

(assert (= (and b!1572938 res!1074750) b!1572939))

(declare-fun m!1446579 () Bool)

(assert (=> b!1572939 m!1446579))

(declare-fun m!1446581 () Bool)

(assert (=> b!1572937 m!1446581))

(declare-fun m!1446583 () Bool)

(assert (=> b!1572938 m!1446583))

(declare-fun m!1446585 () Bool)

(assert (=> b!1572938 m!1446585))

(assert (=> b!1572938 m!1446585))

(declare-fun m!1446587 () Bool)

(assert (=> b!1572938 m!1446587))

(declare-fun m!1446589 () Bool)

(assert (=> start!135148 m!1446589))

(declare-fun m!1446591 () Bool)

(assert (=> start!135148 m!1446591))

(check-sat (not start!135148) (not b!1572938) (not b!1572939) (not b!1572937))
(check-sat)
