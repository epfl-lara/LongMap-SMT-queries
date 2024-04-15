; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37050 () Bool)

(assert start!37050)

(declare-fun b_free!8191 () Bool)

(declare-fun b_next!8191 () Bool)

(assert (=> start!37050 (= b_free!8191 (not b_next!8191))))

(declare-fun tp!29288 () Bool)

(declare-fun b_and!15407 () Bool)

(assert (=> start!37050 (= tp!29288 b_and!15407)))

(declare-fun res!209690 () Bool)

(declare-fun e!227157 () Bool)

(assert (=> start!37050 (=> (not res!209690) (not e!227157))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37050 (= res!209690 (validMask!0 mask!970))))

(assert (=> start!37050 e!227157))

(declare-datatypes ((V!12891 0))(
  ( (V!12892 (val!4464 Int)) )
))
(declare-datatypes ((ValueCell!4076 0))(
  ( (ValueCellFull!4076 (v!6655 V!12891)) (EmptyCell!4076) )
))
(declare-datatypes ((array!21601 0))(
  ( (array!21602 (arr!10269 (Array (_ BitVec 32) ValueCell!4076)) (size!10622 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21601)

(declare-fun e!227158 () Bool)

(declare-fun array_inv!7584 (array!21601) Bool)

(assert (=> start!37050 (and (array_inv!7584 _values!506) e!227158)))

(assert (=> start!37050 tp!29288))

(assert (=> start!37050 true))

(declare-fun tp_is_empty!8839 () Bool)

(assert (=> start!37050 tp_is_empty!8839))

(declare-datatypes ((array!21603 0))(
  ( (array!21604 (arr!10270 (Array (_ BitVec 32) (_ BitVec 64))) (size!10623 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21603)

(declare-fun array_inv!7585 (array!21603) Bool)

(assert (=> start!37050 (array_inv!7585 _keys!658)))

(declare-fun b!372493 () Bool)

(declare-fun res!209686 () Bool)

(assert (=> b!372493 (=> (not res!209686) (not e!227157))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!372493 (= res!209686 (and (= (size!10622 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10623 _keys!658) (size!10622 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372494 () Bool)

(declare-fun res!209683 () Bool)

(assert (=> b!372494 (=> (not res!209683) (not e!227157))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372494 (= res!209683 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10623 _keys!658))))))

(declare-fun b!372495 () Bool)

(declare-fun res!209689 () Bool)

(assert (=> b!372495 (=> (not res!209689) (not e!227157))))

(assert (=> b!372495 (= res!209689 (or (= (select (arr!10270 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10270 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372496 () Bool)

(declare-fun res!209685 () Bool)

(assert (=> b!372496 (=> (not res!209685) (not e!227157))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372496 (= res!209685 (validKeyInArray!0 k0!778))))

(declare-fun b!372497 () Bool)

(declare-fun res!209682 () Bool)

(assert (=> b!372497 (=> (not res!209682) (not e!227157))))

(declare-fun arrayContainsKey!0 (array!21603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372497 (= res!209682 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372498 () Bool)

(declare-fun e!227155 () Bool)

(assert (=> b!372498 (= e!227157 e!227155)))

(declare-fun res!209687 () Bool)

(assert (=> b!372498 (=> (not res!209687) (not e!227155))))

(declare-fun lt!170694 () array!21603)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21603 (_ BitVec 32)) Bool)

(assert (=> b!372498 (= res!209687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170694 mask!970))))

(assert (=> b!372498 (= lt!170694 (array!21604 (store (arr!10270 _keys!658) i!548 k0!778) (size!10623 _keys!658)))))

(declare-fun b!372499 () Bool)

(assert (=> b!372499 (= e!227155 (not true))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12891)

(declare-fun lt!170692 () array!21601)

(declare-datatypes ((tuple2!5896 0))(
  ( (tuple2!5897 (_1!2959 (_ BitVec 64)) (_2!2959 V!12891)) )
))
(declare-datatypes ((List!5733 0))(
  ( (Nil!5730) (Cons!5729 (h!6585 tuple2!5896) (t!10874 List!5733)) )
))
(declare-datatypes ((ListLongMap!4799 0))(
  ( (ListLongMap!4800 (toList!2415 List!5733)) )
))
(declare-fun lt!170691 () ListLongMap!4799)

(declare-fun minValue!472 () V!12891)

(declare-fun getCurrentListMap!1841 (array!21603 array!21601 (_ BitVec 32) (_ BitVec 32) V!12891 V!12891 (_ BitVec 32) Int) ListLongMap!4799)

(assert (=> b!372499 (= lt!170691 (getCurrentListMap!1841 lt!170694 lt!170692 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170695 () ListLongMap!4799)

(declare-fun lt!170693 () ListLongMap!4799)

(assert (=> b!372499 (and (= lt!170695 lt!170693) (= lt!170693 lt!170695))))

(declare-fun lt!170696 () ListLongMap!4799)

(declare-fun v!373 () V!12891)

(declare-fun +!783 (ListLongMap!4799 tuple2!5896) ListLongMap!4799)

(assert (=> b!372499 (= lt!170693 (+!783 lt!170696 (tuple2!5897 k0!778 v!373)))))

(declare-datatypes ((Unit!11442 0))(
  ( (Unit!11443) )
))
(declare-fun lt!170697 () Unit!11442)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!34 (array!21603 array!21601 (_ BitVec 32) (_ BitVec 32) V!12891 V!12891 (_ BitVec 32) (_ BitVec 64) V!12891 (_ BitVec 32) Int) Unit!11442)

(assert (=> b!372499 (= lt!170697 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!34 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!706 (array!21603 array!21601 (_ BitVec 32) (_ BitVec 32) V!12891 V!12891 (_ BitVec 32) Int) ListLongMap!4799)

(assert (=> b!372499 (= lt!170695 (getCurrentListMapNoExtraKeys!706 lt!170694 lt!170692 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372499 (= lt!170692 (array!21602 (store (arr!10269 _values!506) i!548 (ValueCellFull!4076 v!373)) (size!10622 _values!506)))))

(assert (=> b!372499 (= lt!170696 (getCurrentListMapNoExtraKeys!706 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372500 () Bool)

(declare-fun res!209684 () Bool)

(assert (=> b!372500 (=> (not res!209684) (not e!227155))))

(declare-datatypes ((List!5734 0))(
  ( (Nil!5731) (Cons!5730 (h!6586 (_ BitVec 64)) (t!10875 List!5734)) )
))
(declare-fun arrayNoDuplicates!0 (array!21603 (_ BitVec 32) List!5734) Bool)

(assert (=> b!372500 (= res!209684 (arrayNoDuplicates!0 lt!170694 #b00000000000000000000000000000000 Nil!5731))))

(declare-fun mapIsEmpty!14823 () Bool)

(declare-fun mapRes!14823 () Bool)

(assert (=> mapIsEmpty!14823 mapRes!14823))

(declare-fun b!372501 () Bool)

(declare-fun e!227154 () Bool)

(assert (=> b!372501 (= e!227154 tp_is_empty!8839)))

(declare-fun b!372502 () Bool)

(declare-fun res!209688 () Bool)

(assert (=> b!372502 (=> (not res!209688) (not e!227157))))

(assert (=> b!372502 (= res!209688 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5731))))

(declare-fun b!372503 () Bool)

(declare-fun e!227156 () Bool)

(assert (=> b!372503 (= e!227156 tp_is_empty!8839)))

(declare-fun b!372504 () Bool)

(declare-fun res!209681 () Bool)

(assert (=> b!372504 (=> (not res!209681) (not e!227157))))

(assert (=> b!372504 (= res!209681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14823 () Bool)

(declare-fun tp!29289 () Bool)

(assert (=> mapNonEmpty!14823 (= mapRes!14823 (and tp!29289 e!227154))))

(declare-fun mapValue!14823 () ValueCell!4076)

(declare-fun mapRest!14823 () (Array (_ BitVec 32) ValueCell!4076))

(declare-fun mapKey!14823 () (_ BitVec 32))

(assert (=> mapNonEmpty!14823 (= (arr!10269 _values!506) (store mapRest!14823 mapKey!14823 mapValue!14823))))

(declare-fun b!372505 () Bool)

(assert (=> b!372505 (= e!227158 (and e!227156 mapRes!14823))))

(declare-fun condMapEmpty!14823 () Bool)

(declare-fun mapDefault!14823 () ValueCell!4076)

(assert (=> b!372505 (= condMapEmpty!14823 (= (arr!10269 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4076)) mapDefault!14823)))))

(assert (= (and start!37050 res!209690) b!372493))

(assert (= (and b!372493 res!209686) b!372504))

(assert (= (and b!372504 res!209681) b!372502))

(assert (= (and b!372502 res!209688) b!372494))

(assert (= (and b!372494 res!209683) b!372496))

(assert (= (and b!372496 res!209685) b!372495))

(assert (= (and b!372495 res!209689) b!372497))

(assert (= (and b!372497 res!209682) b!372498))

(assert (= (and b!372498 res!209687) b!372500))

(assert (= (and b!372500 res!209684) b!372499))

(assert (= (and b!372505 condMapEmpty!14823) mapIsEmpty!14823))

(assert (= (and b!372505 (not condMapEmpty!14823)) mapNonEmpty!14823))

(get-info :version)

(assert (= (and mapNonEmpty!14823 ((_ is ValueCellFull!4076) mapValue!14823)) b!372501))

(assert (= (and b!372505 ((_ is ValueCellFull!4076) mapDefault!14823)) b!372503))

(assert (= start!37050 b!372505))

(declare-fun m!367883 () Bool)

(assert (=> start!37050 m!367883))

(declare-fun m!367885 () Bool)

(assert (=> start!37050 m!367885))

(declare-fun m!367887 () Bool)

(assert (=> start!37050 m!367887))

(declare-fun m!367889 () Bool)

(assert (=> b!372500 m!367889))

(declare-fun m!367891 () Bool)

(assert (=> b!372498 m!367891))

(declare-fun m!367893 () Bool)

(assert (=> b!372498 m!367893))

(declare-fun m!367895 () Bool)

(assert (=> mapNonEmpty!14823 m!367895))

(declare-fun m!367897 () Bool)

(assert (=> b!372496 m!367897))

(declare-fun m!367899 () Bool)

(assert (=> b!372497 m!367899))

(declare-fun m!367901 () Bool)

(assert (=> b!372495 m!367901))

(declare-fun m!367903 () Bool)

(assert (=> b!372499 m!367903))

(declare-fun m!367905 () Bool)

(assert (=> b!372499 m!367905))

(declare-fun m!367907 () Bool)

(assert (=> b!372499 m!367907))

(declare-fun m!367909 () Bool)

(assert (=> b!372499 m!367909))

(declare-fun m!367911 () Bool)

(assert (=> b!372499 m!367911))

(declare-fun m!367913 () Bool)

(assert (=> b!372499 m!367913))

(declare-fun m!367915 () Bool)

(assert (=> b!372504 m!367915))

(declare-fun m!367917 () Bool)

(assert (=> b!372502 m!367917))

(check-sat (not b!372504) (not b!372496) (not b!372499) (not b!372497) (not mapNonEmpty!14823) (not b!372500) (not start!37050) tp_is_empty!8839 b_and!15407 (not b_next!8191) (not b!372502) (not b!372498))
(check-sat b_and!15407 (not b_next!8191))
