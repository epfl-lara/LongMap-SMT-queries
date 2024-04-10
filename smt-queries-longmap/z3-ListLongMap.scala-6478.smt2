; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82710 () Bool)

(assert start!82710)

(declare-fun b_free!18843 () Bool)

(declare-fun b_next!18843 () Bool)

(assert (=> start!82710 (= b_free!18843 (not b_next!18843))))

(declare-fun tp!65648 () Bool)

(declare-fun b_and!30331 () Bool)

(assert (=> start!82710 (= tp!65648 b_and!30331)))

(declare-fun b!964532 () Bool)

(declare-fun res!645609 () Bool)

(declare-fun e!543756 () Bool)

(assert (=> b!964532 (=> (not res!645609) (not e!543756))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33843 0))(
  ( (V!33844 (val!10873 Int)) )
))
(declare-datatypes ((ValueCell!10341 0))(
  ( (ValueCellFull!10341 (v!13431 V!33843)) (EmptyCell!10341) )
))
(declare-datatypes ((array!59377 0))(
  ( (array!59378 (arr!28557 (Array (_ BitVec 32) ValueCell!10341)) (size!29036 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59377)

(declare-datatypes ((array!59379 0))(
  ( (array!59380 (arr!28558 (Array (_ BitVec 32) (_ BitVec 64))) (size!29037 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59379)

(declare-fun minValue!1342 () V!33843)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33843)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13972 0))(
  ( (tuple2!13973 (_1!6997 (_ BitVec 64)) (_2!6997 V!33843)) )
))
(declare-datatypes ((List!19818 0))(
  ( (Nil!19815) (Cons!19814 (h!20976 tuple2!13972) (t!28181 List!19818)) )
))
(declare-datatypes ((ListLongMap!12669 0))(
  ( (ListLongMap!12670 (toList!6350 List!19818)) )
))
(declare-fun contains!5453 (ListLongMap!12669 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3583 (array!59379 array!59377 (_ BitVec 32) (_ BitVec 32) V!33843 V!33843 (_ BitVec 32) Int) ListLongMap!12669)

(assert (=> b!964532 (= res!645609 (contains!5453 (getCurrentListMap!3583 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28558 _keys!1686) i!803)))))

(declare-fun b!964533 () Bool)

(declare-fun e!543757 () Bool)

(declare-fun e!543761 () Bool)

(declare-fun mapRes!34462 () Bool)

(assert (=> b!964533 (= e!543757 (and e!543761 mapRes!34462))))

(declare-fun condMapEmpty!34462 () Bool)

(declare-fun mapDefault!34462 () ValueCell!10341)

(assert (=> b!964533 (= condMapEmpty!34462 (= (arr!28557 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10341)) mapDefault!34462)))))

(declare-fun b!964534 () Bool)

(declare-fun res!645606 () Bool)

(assert (=> b!964534 (=> (not res!645606) (not e!543756))))

(declare-datatypes ((List!19819 0))(
  ( (Nil!19816) (Cons!19815 (h!20977 (_ BitVec 64)) (t!28182 List!19819)) )
))
(declare-fun arrayNoDuplicates!0 (array!59379 (_ BitVec 32) List!19819) Bool)

(assert (=> b!964534 (= res!645606 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19816))))

(declare-fun mapIsEmpty!34462 () Bool)

(assert (=> mapIsEmpty!34462 mapRes!34462))

(declare-fun b!964535 () Bool)

(declare-fun e!543758 () Bool)

(assert (=> b!964535 (= e!543758 true)))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964535 (contains!5453 (getCurrentListMap!3583 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28558 _keys!1686) i!803))))

(declare-datatypes ((Unit!32283 0))(
  ( (Unit!32284) )
))
(declare-fun lt!431118 () Unit!32283)

(declare-fun lemmaInListMapFromThenInFromSmaller!33 (array!59379 array!59377 (_ BitVec 32) (_ BitVec 32) V!33843 V!33843 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32283)

(assert (=> b!964535 (= lt!431118 (lemmaInListMapFromThenInFromSmaller!33 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!964536 () Bool)

(assert (=> b!964536 (= e!543756 (not e!543758))))

(declare-fun res!645603 () Bool)

(assert (=> b!964536 (=> res!645603 e!543758)))

(assert (=> b!964536 (= res!645603 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29037 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!964536 (contains!5453 (getCurrentListMap!3583 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28558 _keys!1686) i!803))))

(declare-fun lt!431119 () Unit!32283)

(declare-fun lemmaInListMapFromThenInFromMinusOne!36 (array!59379 array!59377 (_ BitVec 32) (_ BitVec 32) V!33843 V!33843 (_ BitVec 32) (_ BitVec 32) Int) Unit!32283)

(assert (=> b!964536 (= lt!431119 (lemmaInListMapFromThenInFromMinusOne!36 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964537 () Bool)

(declare-fun res!645610 () Bool)

(assert (=> b!964537 (=> (not res!645610) (not e!543756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59379 (_ BitVec 32)) Bool)

(assert (=> b!964537 (= res!645610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964538 () Bool)

(declare-fun res!645602 () Bool)

(assert (=> b!964538 (=> (not res!645602) (not e!543756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964538 (= res!645602 (validKeyInArray!0 (select (arr!28558 _keys!1686) i!803)))))

(declare-fun b!964539 () Bool)

(declare-fun res!645604 () Bool)

(assert (=> b!964539 (=> (not res!645604) (not e!543756))))

(assert (=> b!964539 (= res!645604 (and (= (size!29036 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29037 _keys!1686) (size!29036 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964540 () Bool)

(declare-fun e!543760 () Bool)

(declare-fun tp_is_empty!21645 () Bool)

(assert (=> b!964540 (= e!543760 tp_is_empty!21645)))

(declare-fun res!645605 () Bool)

(assert (=> start!82710 (=> (not res!645605) (not e!543756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82710 (= res!645605 (validMask!0 mask!2110))))

(assert (=> start!82710 e!543756))

(assert (=> start!82710 true))

(declare-fun array_inv!22113 (array!59377) Bool)

(assert (=> start!82710 (and (array_inv!22113 _values!1400) e!543757)))

(declare-fun array_inv!22114 (array!59379) Bool)

(assert (=> start!82710 (array_inv!22114 _keys!1686)))

(assert (=> start!82710 tp!65648))

(assert (=> start!82710 tp_is_empty!21645))

(declare-fun b!964541 () Bool)

(assert (=> b!964541 (= e!543761 tp_is_empty!21645)))

(declare-fun b!964542 () Bool)

(declare-fun res!645607 () Bool)

(assert (=> b!964542 (=> (not res!645607) (not e!543756))))

(assert (=> b!964542 (= res!645607 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29037 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29037 _keys!1686))))))

(declare-fun b!964543 () Bool)

(declare-fun res!645608 () Bool)

(assert (=> b!964543 (=> (not res!645608) (not e!543756))))

(assert (=> b!964543 (= res!645608 (bvsgt from!2084 newFrom!159))))

(declare-fun mapNonEmpty!34462 () Bool)

(declare-fun tp!65649 () Bool)

(assert (=> mapNonEmpty!34462 (= mapRes!34462 (and tp!65649 e!543760))))

(declare-fun mapValue!34462 () ValueCell!10341)

(declare-fun mapKey!34462 () (_ BitVec 32))

(declare-fun mapRest!34462 () (Array (_ BitVec 32) ValueCell!10341))

(assert (=> mapNonEmpty!34462 (= (arr!28557 _values!1400) (store mapRest!34462 mapKey!34462 mapValue!34462))))

(assert (= (and start!82710 res!645605) b!964539))

(assert (= (and b!964539 res!645604) b!964537))

(assert (= (and b!964537 res!645610) b!964534))

(assert (= (and b!964534 res!645606) b!964542))

(assert (= (and b!964542 res!645607) b!964538))

(assert (= (and b!964538 res!645602) b!964532))

(assert (= (and b!964532 res!645609) b!964543))

(assert (= (and b!964543 res!645608) b!964536))

(assert (= (and b!964536 (not res!645603)) b!964535))

(assert (= (and b!964533 condMapEmpty!34462) mapIsEmpty!34462))

(assert (= (and b!964533 (not condMapEmpty!34462)) mapNonEmpty!34462))

(get-info :version)

(assert (= (and mapNonEmpty!34462 ((_ is ValueCellFull!10341) mapValue!34462)) b!964540))

(assert (= (and b!964533 ((_ is ValueCellFull!10341) mapDefault!34462)) b!964541))

(assert (= start!82710 b!964533))

(declare-fun m!893777 () Bool)

(assert (=> b!964537 m!893777))

(declare-fun m!893779 () Bool)

(assert (=> b!964534 m!893779))

(declare-fun m!893781 () Bool)

(assert (=> start!82710 m!893781))

(declare-fun m!893783 () Bool)

(assert (=> start!82710 m!893783))

(declare-fun m!893785 () Bool)

(assert (=> start!82710 m!893785))

(declare-fun m!893787 () Bool)

(assert (=> b!964532 m!893787))

(declare-fun m!893789 () Bool)

(assert (=> b!964532 m!893789))

(assert (=> b!964532 m!893787))

(assert (=> b!964532 m!893789))

(declare-fun m!893791 () Bool)

(assert (=> b!964532 m!893791))

(declare-fun m!893793 () Bool)

(assert (=> b!964535 m!893793))

(assert (=> b!964535 m!893789))

(assert (=> b!964535 m!893793))

(assert (=> b!964535 m!893789))

(declare-fun m!893795 () Bool)

(assert (=> b!964535 m!893795))

(declare-fun m!893797 () Bool)

(assert (=> b!964535 m!893797))

(assert (=> b!964538 m!893789))

(assert (=> b!964538 m!893789))

(declare-fun m!893799 () Bool)

(assert (=> b!964538 m!893799))

(declare-fun m!893801 () Bool)

(assert (=> b!964536 m!893801))

(assert (=> b!964536 m!893789))

(assert (=> b!964536 m!893801))

(assert (=> b!964536 m!893789))

(declare-fun m!893803 () Bool)

(assert (=> b!964536 m!893803))

(declare-fun m!893805 () Bool)

(assert (=> b!964536 m!893805))

(declare-fun m!893807 () Bool)

(assert (=> mapNonEmpty!34462 m!893807))

(check-sat b_and!30331 (not b_next!18843) (not b!964532) (not b!964538) (not start!82710) (not b!964534) tp_is_empty!21645 (not mapNonEmpty!34462) (not b!964537) (not b!964536) (not b!964535))
(check-sat b_and!30331 (not b_next!18843))
