; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83382 () Bool)

(assert start!83382)

(declare-fun b_free!19393 () Bool)

(declare-fun b_next!19393 () Bool)

(assert (=> start!83382 (= b_free!19393 (not b_next!19393))))

(declare-fun tp!67458 () Bool)

(declare-fun b_and!30969 () Bool)

(assert (=> start!83382 (= tp!67458 b_and!30969)))

(declare-fun b!973745 () Bool)

(declare-fun res!651865 () Bool)

(declare-fun e!548851 () Bool)

(assert (=> b!973745 (=> (not res!651865) (not e!548851))))

(declare-datatypes ((array!60550 0))(
  ( (array!60551 (arr!29139 (Array (_ BitVec 32) (_ BitVec 64))) (size!29620 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60550)

(declare-datatypes ((List!20260 0))(
  ( (Nil!20257) (Cons!20256 (h!21418 (_ BitVec 64)) (t!28728 List!20260)) )
))
(declare-fun arrayNoDuplicates!0 (array!60550 (_ BitVec 32) List!20260) Bool)

(assert (=> b!973745 (= res!651865 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20257))))

(declare-fun b!973746 () Bool)

(assert (=> b!973746 (= e!548851 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34705 0))(
  ( (V!34706 (val!11196 Int)) )
))
(declare-datatypes ((tuple2!14454 0))(
  ( (tuple2!14455 (_1!7238 (_ BitVec 64)) (_2!7238 V!34705)) )
))
(declare-datatypes ((List!20261 0))(
  ( (Nil!20258) (Cons!20257 (h!21419 tuple2!14454) (t!28729 List!20261)) )
))
(declare-datatypes ((ListLongMap!13141 0))(
  ( (ListLongMap!13142 (toList!6586 List!20261)) )
))
(declare-fun lt!432489 () ListLongMap!13141)

(declare-datatypes ((ValueCell!10664 0))(
  ( (ValueCellFull!10664 (v!13754 V!34705)) (EmptyCell!10664) )
))
(declare-datatypes ((array!60552 0))(
  ( (array!60553 (arr!29140 (Array (_ BitVec 32) ValueCell!10664)) (size!29621 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60552)

(declare-fun zeroValue!1367 () V!34705)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34705)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun getCurrentListMap!3748 (array!60550 array!60552 (_ BitVec 32) (_ BitVec 32) V!34705 V!34705 (_ BitVec 32) Int) ListLongMap!13141)

(assert (=> b!973746 (= lt!432489 (getCurrentListMap!3748 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973747 () Bool)

(declare-fun res!651860 () Bool)

(assert (=> b!973747 (=> (not res!651860) (not e!548851))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5626 (ListLongMap!13141 (_ BitVec 64)) Bool)

(assert (=> b!973747 (= res!651860 (contains!5626 (getCurrentListMap!3748 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29139 _keys!1717) i!822)))))

(declare-fun b!973748 () Bool)

(declare-fun res!651859 () Bool)

(assert (=> b!973748 (=> (not res!651859) (not e!548851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973748 (= res!651859 (validKeyInArray!0 (select (arr!29139 _keys!1717) i!822)))))

(declare-fun b!973749 () Bool)

(declare-fun e!548849 () Bool)

(declare-fun tp_is_empty!22291 () Bool)

(assert (=> b!973749 (= e!548849 tp_is_empty!22291)))

(declare-fun b!973750 () Bool)

(declare-fun res!651864 () Bool)

(assert (=> b!973750 (=> (not res!651864) (not e!548851))))

(assert (=> b!973750 (= res!651864 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29620 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29620 _keys!1717))))))

(declare-fun res!651863 () Bool)

(assert (=> start!83382 (=> (not res!651863) (not e!548851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83382 (= res!651863 (validMask!0 mask!2147))))

(assert (=> start!83382 e!548851))

(assert (=> start!83382 true))

(declare-fun e!548852 () Bool)

(declare-fun array_inv!22591 (array!60552) Bool)

(assert (=> start!83382 (and (array_inv!22591 _values!1425) e!548852)))

(assert (=> start!83382 tp_is_empty!22291))

(assert (=> start!83382 tp!67458))

(declare-fun array_inv!22592 (array!60550) Bool)

(assert (=> start!83382 (array_inv!22592 _keys!1717)))

(declare-fun b!973751 () Bool)

(declare-fun e!548850 () Bool)

(assert (=> b!973751 (= e!548850 tp_is_empty!22291)))

(declare-fun b!973752 () Bool)

(declare-fun res!651862 () Bool)

(assert (=> b!973752 (=> (not res!651862) (not e!548851))))

(assert (=> b!973752 (= res!651862 (and (= (size!29621 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29620 _keys!1717) (size!29621 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35446 () Bool)

(declare-fun mapRes!35446 () Bool)

(declare-fun tp!67459 () Bool)

(assert (=> mapNonEmpty!35446 (= mapRes!35446 (and tp!67459 e!548849))))

(declare-fun mapValue!35446 () ValueCell!10664)

(declare-fun mapRest!35446 () (Array (_ BitVec 32) ValueCell!10664))

(declare-fun mapKey!35446 () (_ BitVec 32))

(assert (=> mapNonEmpty!35446 (= (arr!29140 _values!1425) (store mapRest!35446 mapKey!35446 mapValue!35446))))

(declare-fun mapIsEmpty!35446 () Bool)

(assert (=> mapIsEmpty!35446 mapRes!35446))

(declare-fun b!973753 () Bool)

(assert (=> b!973753 (= e!548852 (and e!548850 mapRes!35446))))

(declare-fun condMapEmpty!35446 () Bool)

(declare-fun mapDefault!35446 () ValueCell!10664)

(assert (=> b!973753 (= condMapEmpty!35446 (= (arr!29140 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10664)) mapDefault!35446)))))

(declare-fun b!973754 () Bool)

(declare-fun res!651861 () Bool)

(assert (=> b!973754 (=> (not res!651861) (not e!548851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60550 (_ BitVec 32)) Bool)

(assert (=> b!973754 (= res!651861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83382 res!651863) b!973752))

(assert (= (and b!973752 res!651862) b!973754))

(assert (= (and b!973754 res!651861) b!973745))

(assert (= (and b!973745 res!651865) b!973750))

(assert (= (and b!973750 res!651864) b!973748))

(assert (= (and b!973748 res!651859) b!973747))

(assert (= (and b!973747 res!651860) b!973746))

(assert (= (and b!973753 condMapEmpty!35446) mapIsEmpty!35446))

(assert (= (and b!973753 (not condMapEmpty!35446)) mapNonEmpty!35446))

(get-info :version)

(assert (= (and mapNonEmpty!35446 ((_ is ValueCellFull!10664) mapValue!35446)) b!973749))

(assert (= (and b!973753 ((_ is ValueCellFull!10664) mapDefault!35446)) b!973751))

(assert (= start!83382 b!973753))

(declare-fun m!900869 () Bool)

(assert (=> b!973747 m!900869))

(declare-fun m!900871 () Bool)

(assert (=> b!973747 m!900871))

(assert (=> b!973747 m!900869))

(assert (=> b!973747 m!900871))

(declare-fun m!900873 () Bool)

(assert (=> b!973747 m!900873))

(assert (=> b!973748 m!900871))

(assert (=> b!973748 m!900871))

(declare-fun m!900875 () Bool)

(assert (=> b!973748 m!900875))

(declare-fun m!900877 () Bool)

(assert (=> b!973745 m!900877))

(declare-fun m!900879 () Bool)

(assert (=> mapNonEmpty!35446 m!900879))

(declare-fun m!900881 () Bool)

(assert (=> b!973754 m!900881))

(declare-fun m!900883 () Bool)

(assert (=> b!973746 m!900883))

(declare-fun m!900885 () Bool)

(assert (=> start!83382 m!900885))

(declare-fun m!900887 () Bool)

(assert (=> start!83382 m!900887))

(declare-fun m!900889 () Bool)

(assert (=> start!83382 m!900889))

(check-sat (not b_next!19393) (not b!973754) b_and!30969 (not b!973747) (not b!973748) tp_is_empty!22291 (not b!973745) (not b!973746) (not mapNonEmpty!35446) (not start!83382))
(check-sat b_and!30969 (not b_next!19393))
