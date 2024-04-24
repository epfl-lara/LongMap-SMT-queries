; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82834 () Bool)

(assert start!82834)

(declare-fun b_free!18799 () Bool)

(declare-fun b_next!18799 () Bool)

(assert (=> start!82834 (= b_free!18799 (not b_next!18799))))

(declare-fun tp!65518 () Bool)

(declare-fun b_and!30297 () Bool)

(assert (=> start!82834 (= tp!65518 b_and!30297)))

(declare-fun b!964659 () Bool)

(declare-fun res!645372 () Bool)

(declare-fun e!543960 () Bool)

(assert (=> b!964659 (=> (not res!645372) (not e!543960))))

(declare-datatypes ((array!59314 0))(
  ( (array!59315 (arr!28521 (Array (_ BitVec 32) (_ BitVec 64))) (size!29001 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59314)

(declare-datatypes ((List!19777 0))(
  ( (Nil!19774) (Cons!19773 (h!20941 (_ BitVec 64)) (t!28132 List!19777)) )
))
(declare-fun arrayNoDuplicates!0 (array!59314 (_ BitVec 32) List!19777) Bool)

(assert (=> b!964659 (= res!645372 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19774))))

(declare-fun res!645371 () Bool)

(assert (=> start!82834 (=> (not res!645371) (not e!543960))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82834 (= res!645371 (validMask!0 mask!2110))))

(assert (=> start!82834 e!543960))

(assert (=> start!82834 true))

(declare-datatypes ((V!33785 0))(
  ( (V!33786 (val!10851 Int)) )
))
(declare-datatypes ((ValueCell!10319 0))(
  ( (ValueCellFull!10319 (v!13406 V!33785)) (EmptyCell!10319) )
))
(declare-datatypes ((array!59316 0))(
  ( (array!59317 (arr!28522 (Array (_ BitVec 32) ValueCell!10319)) (size!29002 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59316)

(declare-fun e!543958 () Bool)

(declare-fun array_inv!22161 (array!59316) Bool)

(assert (=> start!82834 (and (array_inv!22161 _values!1400) e!543958)))

(declare-fun array_inv!22162 (array!59314) Bool)

(assert (=> start!82834 (array_inv!22162 _keys!1686)))

(assert (=> start!82834 tp!65518))

(declare-fun tp_is_empty!21601 () Bool)

(assert (=> start!82834 tp_is_empty!21601))

(declare-fun b!964660 () Bool)

(declare-fun e!543959 () Bool)

(declare-fun mapRes!34396 () Bool)

(assert (=> b!964660 (= e!543958 (and e!543959 mapRes!34396))))

(declare-fun condMapEmpty!34396 () Bool)

(declare-fun mapDefault!34396 () ValueCell!10319)

(assert (=> b!964660 (= condMapEmpty!34396 (= (arr!28522 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10319)) mapDefault!34396)))))

(declare-fun b!964661 () Bool)

(assert (=> b!964661 (= e!543959 tp_is_empty!21601)))

(declare-fun mapIsEmpty!34396 () Bool)

(assert (=> mapIsEmpty!34396 mapRes!34396))

(declare-fun b!964662 () Bool)

(declare-fun res!645369 () Bool)

(assert (=> b!964662 (=> (not res!645369) (not e!543960))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964662 (= res!645369 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964663 () Bool)

(declare-fun res!645373 () Bool)

(assert (=> b!964663 (=> (not res!645373) (not e!543960))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964663 (= res!645373 (validKeyInArray!0 (select (arr!28521 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34396 () Bool)

(declare-fun tp!65517 () Bool)

(declare-fun e!543962 () Bool)

(assert (=> mapNonEmpty!34396 (= mapRes!34396 (and tp!65517 e!543962))))

(declare-fun mapKey!34396 () (_ BitVec 32))

(declare-fun mapValue!34396 () ValueCell!10319)

(declare-fun mapRest!34396 () (Array (_ BitVec 32) ValueCell!10319))

(assert (=> mapNonEmpty!34396 (= (arr!28522 _values!1400) (store mapRest!34396 mapKey!34396 mapValue!34396))))

(declare-fun b!964664 () Bool)

(assert (=> b!964664 (= e!543962 tp_is_empty!21601)))

(declare-fun b!964665 () Bool)

(declare-fun res!645374 () Bool)

(assert (=> b!964665 (=> (not res!645374) (not e!543960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59314 (_ BitVec 32)) Bool)

(assert (=> b!964665 (= res!645374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964666 () Bool)

(declare-fun res!645375 () Bool)

(assert (=> b!964666 (=> (not res!645375) (not e!543960))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!964666 (= res!645375 (and (= (size!29002 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29001 _keys!1686) (size!29002 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964667 () Bool)

(assert (=> b!964667 (= e!543960 (not true))))

(declare-fun minValue!1342 () V!33785)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33785)

(declare-datatypes ((tuple2!13930 0))(
  ( (tuple2!13931 (_1!6976 (_ BitVec 64)) (_2!6976 V!33785)) )
))
(declare-datatypes ((List!19778 0))(
  ( (Nil!19775) (Cons!19774 (h!20942 tuple2!13930) (t!28133 List!19778)) )
))
(declare-datatypes ((ListLongMap!12629 0))(
  ( (ListLongMap!12630 (toList!6330 List!19778)) )
))
(declare-fun contains!5445 (ListLongMap!12629 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3563 (array!59314 array!59316 (_ BitVec 32) (_ BitVec 32) V!33785 V!33785 (_ BitVec 32) Int) ListLongMap!12629)

(assert (=> b!964667 (contains!5445 (getCurrentListMap!3563 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28521 _keys!1686) i!803))))

(declare-datatypes ((Unit!32216 0))(
  ( (Unit!32217) )
))
(declare-fun lt!431363 () Unit!32216)

(declare-fun lemmaInListMapFromThenInFromMinusOne!22 (array!59314 array!59316 (_ BitVec 32) (_ BitVec 32) V!33785 V!33785 (_ BitVec 32) (_ BitVec 32) Int) Unit!32216)

(assert (=> b!964667 (= lt!431363 (lemmaInListMapFromThenInFromMinusOne!22 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964668 () Bool)

(declare-fun res!645370 () Bool)

(assert (=> b!964668 (=> (not res!645370) (not e!543960))))

(assert (=> b!964668 (= res!645370 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29001 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29001 _keys!1686))))))

(declare-fun b!964669 () Bool)

(declare-fun res!645368 () Bool)

(assert (=> b!964669 (=> (not res!645368) (not e!543960))))

(assert (=> b!964669 (= res!645368 (contains!5445 (getCurrentListMap!3563 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28521 _keys!1686) i!803)))))

(assert (= (and start!82834 res!645371) b!964666))

(assert (= (and b!964666 res!645375) b!964665))

(assert (= (and b!964665 res!645374) b!964659))

(assert (= (and b!964659 res!645372) b!964668))

(assert (= (and b!964668 res!645370) b!964663))

(assert (= (and b!964663 res!645373) b!964669))

(assert (= (and b!964669 res!645368) b!964662))

(assert (= (and b!964662 res!645369) b!964667))

(assert (= (and b!964660 condMapEmpty!34396) mapIsEmpty!34396))

(assert (= (and b!964660 (not condMapEmpty!34396)) mapNonEmpty!34396))

(get-info :version)

(assert (= (and mapNonEmpty!34396 ((_ is ValueCellFull!10319) mapValue!34396)) b!964664))

(assert (= (and b!964660 ((_ is ValueCellFull!10319) mapDefault!34396)) b!964661))

(assert (= start!82834 b!964660))

(declare-fun m!894403 () Bool)

(assert (=> b!964665 m!894403))

(declare-fun m!894405 () Bool)

(assert (=> b!964669 m!894405))

(declare-fun m!894407 () Bool)

(assert (=> b!964669 m!894407))

(assert (=> b!964669 m!894405))

(assert (=> b!964669 m!894407))

(declare-fun m!894409 () Bool)

(assert (=> b!964669 m!894409))

(declare-fun m!894411 () Bool)

(assert (=> mapNonEmpty!34396 m!894411))

(declare-fun m!894413 () Bool)

(assert (=> b!964659 m!894413))

(assert (=> b!964663 m!894407))

(assert (=> b!964663 m!894407))

(declare-fun m!894415 () Bool)

(assert (=> b!964663 m!894415))

(declare-fun m!894417 () Bool)

(assert (=> b!964667 m!894417))

(assert (=> b!964667 m!894407))

(assert (=> b!964667 m!894417))

(assert (=> b!964667 m!894407))

(declare-fun m!894419 () Bool)

(assert (=> b!964667 m!894419))

(declare-fun m!894421 () Bool)

(assert (=> b!964667 m!894421))

(declare-fun m!894423 () Bool)

(assert (=> start!82834 m!894423))

(declare-fun m!894425 () Bool)

(assert (=> start!82834 m!894425))

(declare-fun m!894427 () Bool)

(assert (=> start!82834 m!894427))

(check-sat b_and!30297 tp_is_empty!21601 (not start!82834) (not b!964659) (not b!964665) (not mapNonEmpty!34396) (not b!964667) (not b!964663) (not b_next!18799) (not b!964669))
(check-sat b_and!30297 (not b_next!18799))
