; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135090 () Bool)

(assert start!135090)

(declare-fun res!1074573 () Bool)

(declare-fun e!876892 () Bool)

(assert (=> start!135090 (=> (not res!1074573) (not e!876892))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135090 (= res!1074573 (validMask!0 mask!889))))

(assert (=> start!135090 e!876892))

(assert (=> start!135090 true))

(declare-datatypes ((array!105003 0))(
  ( (array!105004 (arr!50663 (Array (_ BitVec 32) (_ BitVec 64))) (size!51215 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105003)

(declare-fun array_inv!39599 (array!105003) Bool)

(assert (=> start!135090 (array_inv!39599 _keys!600)))

(declare-fun b!1572576 () Bool)

(declare-fun res!1074572 () Bool)

(assert (=> b!1572576 (=> (not res!1074572) (not e!876892))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572576 (= res!1074572 (validKeyInArray!0 k0!754))))

(declare-fun b!1572575 () Bool)

(declare-fun res!1074571 () Bool)

(assert (=> b!1572575 (=> (not res!1074571) (not e!876892))))

(assert (=> b!1572575 (= res!1074571 (= (size!51215 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572577 () Bool)

(declare-fun e!876893 () Bool)

(assert (=> b!1572577 (= e!876892 e!876893)))

(declare-fun res!1074570 () Bool)

(assert (=> b!1572577 (=> (not res!1074570) (not e!876893))))

(declare-datatypes ((SeekEntryResult!13611 0))(
  ( (MissingZero!13611 (index!56842 (_ BitVec 32))) (Found!13611 (index!56843 (_ BitVec 32))) (Intermediate!13611 (undefined!14423 Bool) (index!56844 (_ BitVec 32)) (x!141622 (_ BitVec 32))) (Undefined!13611) (MissingVacant!13611 (index!56845 (_ BitVec 32))) )
))
(declare-fun lt!673884 () SeekEntryResult!13611)

(get-info :version)

(assert (=> b!1572577 (= res!1074570 (and (not (undefined!14423 lt!673884)) ((_ is Intermediate!13611) lt!673884) (not (= (select (arr!50663 _keys!600) (index!56844 lt!673884)) k0!754)) (not (= (select (arr!50663 _keys!600) (index!56844 lt!673884)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50663 _keys!600) (index!56844 lt!673884)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56844 lt!673884) #b00000000000000000000000000000000) (bvslt (index!56844 lt!673884) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105003 (_ BitVec 32)) SeekEntryResult!13611)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572577 (= lt!673884 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1572578 () Bool)

(assert (=> b!1572578 (= e!876893 false)))

(declare-fun lt!673883 () SeekEntryResult!13611)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105003 (_ BitVec 32)) SeekEntryResult!13611)

(assert (=> b!1572578 (= lt!673883 (seekKeyOrZeroReturnVacant!0 (x!141622 lt!673884) (index!56844 lt!673884) (index!56844 lt!673884) k0!754 _keys!600 mask!889))))

(assert (= (and start!135090 res!1074573) b!1572575))

(assert (= (and b!1572575 res!1074571) b!1572576))

(assert (= (and b!1572576 res!1074572) b!1572577))

(assert (= (and b!1572577 res!1074570) b!1572578))

(declare-fun m!1445631 () Bool)

(assert (=> start!135090 m!1445631))

(declare-fun m!1445633 () Bool)

(assert (=> start!135090 m!1445633))

(declare-fun m!1445635 () Bool)

(assert (=> b!1572576 m!1445635))

(declare-fun m!1445637 () Bool)

(assert (=> b!1572577 m!1445637))

(declare-fun m!1445639 () Bool)

(assert (=> b!1572577 m!1445639))

(assert (=> b!1572577 m!1445639))

(declare-fun m!1445641 () Bool)

(assert (=> b!1572577 m!1445641))

(declare-fun m!1445643 () Bool)

(assert (=> b!1572578 m!1445643))

(check-sat (not b!1572577) (not b!1572576) (not start!135090) (not b!1572578))
(check-sat)
