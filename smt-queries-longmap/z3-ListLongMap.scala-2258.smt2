; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36996 () Bool)

(assert start!36996)

(declare-fun b_free!8137 () Bool)

(declare-fun b_next!8137 () Bool)

(assert (=> start!36996 (= b_free!8137 (not b_next!8137))))

(declare-fun tp!29127 () Bool)

(declare-fun b_and!15353 () Bool)

(assert (=> start!36996 (= tp!29127 b_and!15353)))

(declare-fun res!208878 () Bool)

(declare-fun e!226671 () Bool)

(assert (=> start!36996 (=> (not res!208878) (not e!226671))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36996 (= res!208878 (validMask!0 mask!970))))

(assert (=> start!36996 e!226671))

(declare-datatypes ((V!12819 0))(
  ( (V!12820 (val!4437 Int)) )
))
(declare-datatypes ((ValueCell!4049 0))(
  ( (ValueCellFull!4049 (v!6628 V!12819)) (EmptyCell!4049) )
))
(declare-datatypes ((array!21495 0))(
  ( (array!21496 (arr!10216 (Array (_ BitVec 32) ValueCell!4049)) (size!10569 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21495)

(declare-fun e!226668 () Bool)

(declare-fun array_inv!7550 (array!21495) Bool)

(assert (=> start!36996 (and (array_inv!7550 _values!506) e!226668)))

(assert (=> start!36996 tp!29127))

(assert (=> start!36996 true))

(declare-fun tp_is_empty!8785 () Bool)

(assert (=> start!36996 tp_is_empty!8785))

(declare-datatypes ((array!21497 0))(
  ( (array!21498 (arr!10217 (Array (_ BitVec 32) (_ BitVec 64))) (size!10570 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21497)

(declare-fun array_inv!7551 (array!21497) Bool)

(assert (=> start!36996 (array_inv!7551 _keys!658)))

(declare-fun mapIsEmpty!14742 () Bool)

(declare-fun mapRes!14742 () Bool)

(assert (=> mapIsEmpty!14742 mapRes!14742))

(declare-fun b!371440 () Bool)

(declare-fun res!208872 () Bool)

(assert (=> b!371440 (=> (not res!208872) (not e!226671))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!371440 (= res!208872 (and (= (size!10569 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10570 _keys!658) (size!10569 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371441 () Bool)

(declare-fun res!208876 () Bool)

(assert (=> b!371441 (=> (not res!208876) (not e!226671))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371441 (= res!208876 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10570 _keys!658))))))

(declare-fun b!371442 () Bool)

(declare-fun res!208879 () Bool)

(assert (=> b!371442 (=> (not res!208879) (not e!226671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21497 (_ BitVec 32)) Bool)

(assert (=> b!371442 (= res!208879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371443 () Bool)

(declare-fun res!208880 () Bool)

(assert (=> b!371443 (=> (not res!208880) (not e!226671))))

(declare-datatypes ((List!5694 0))(
  ( (Nil!5691) (Cons!5690 (h!6546 (_ BitVec 64)) (t!10835 List!5694)) )
))
(declare-fun arrayNoDuplicates!0 (array!21497 (_ BitVec 32) List!5694) Bool)

(assert (=> b!371443 (= res!208880 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5691))))

(declare-fun b!371444 () Bool)

(declare-fun e!226670 () Bool)

(assert (=> b!371444 (= e!226670 tp_is_empty!8785)))

(declare-fun b!371445 () Bool)

(assert (=> b!371445 (= e!226668 (and e!226670 mapRes!14742))))

(declare-fun condMapEmpty!14742 () Bool)

(declare-fun mapDefault!14742 () ValueCell!4049)

(assert (=> b!371445 (= condMapEmpty!14742 (= (arr!10216 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4049)) mapDefault!14742)))))

(declare-fun b!371446 () Bool)

(declare-fun res!208877 () Bool)

(assert (=> b!371446 (=> (not res!208877) (not e!226671))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371446 (= res!208877 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!371447 () Bool)

(declare-fun res!208875 () Bool)

(assert (=> b!371447 (=> (not res!208875) (not e!226671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371447 (= res!208875 (validKeyInArray!0 k0!778))))

(declare-fun b!371448 () Bool)

(declare-fun e!226673 () Bool)

(assert (=> b!371448 (= e!226671 e!226673)))

(declare-fun res!208871 () Bool)

(assert (=> b!371448 (=> (not res!208871) (not e!226673))))

(declare-fun lt!170156 () array!21497)

(assert (=> b!371448 (= res!208871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170156 mask!970))))

(assert (=> b!371448 (= lt!170156 (array!21498 (store (arr!10217 _keys!658) i!548 k0!778) (size!10570 _keys!658)))))

(declare-fun b!371449 () Bool)

(declare-fun e!226672 () Bool)

(assert (=> b!371449 (= e!226672 tp_is_empty!8785)))

(declare-fun b!371450 () Bool)

(declare-fun res!208874 () Bool)

(assert (=> b!371450 (=> (not res!208874) (not e!226671))))

(assert (=> b!371450 (= res!208874 (or (= (select (arr!10217 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10217 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371451 () Bool)

(declare-fun res!208873 () Bool)

(assert (=> b!371451 (=> (not res!208873) (not e!226673))))

(assert (=> b!371451 (= res!208873 (arrayNoDuplicates!0 lt!170156 #b00000000000000000000000000000000 Nil!5691))))

(declare-fun b!371452 () Bool)

(assert (=> b!371452 (= e!226673 (not true))))

(declare-datatypes ((tuple2!5858 0))(
  ( (tuple2!5859 (_1!2940 (_ BitVec 64)) (_2!2940 V!12819)) )
))
(declare-datatypes ((List!5695 0))(
  ( (Nil!5692) (Cons!5691 (h!6547 tuple2!5858) (t!10836 List!5695)) )
))
(declare-datatypes ((ListLongMap!4761 0))(
  ( (ListLongMap!4762 (toList!2396 List!5695)) )
))
(declare-fun lt!170160 () ListLongMap!4761)

(declare-fun lt!170157 () ListLongMap!4761)

(assert (=> b!371452 (and (= lt!170160 lt!170157) (= lt!170157 lt!170160))))

(declare-fun v!373 () V!12819)

(declare-fun lt!170159 () ListLongMap!4761)

(declare-fun +!764 (ListLongMap!4761 tuple2!5858) ListLongMap!4761)

(assert (=> b!371452 (= lt!170157 (+!764 lt!170159 (tuple2!5859 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12819)

(declare-datatypes ((Unit!11404 0))(
  ( (Unit!11405) )
))
(declare-fun lt!170158 () Unit!11404)

(declare-fun minValue!472 () V!12819)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!15 (array!21497 array!21495 (_ BitVec 32) (_ BitVec 32) V!12819 V!12819 (_ BitVec 32) (_ BitVec 64) V!12819 (_ BitVec 32) Int) Unit!11404)

(assert (=> b!371452 (= lt!170158 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!15 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!687 (array!21497 array!21495 (_ BitVec 32) (_ BitVec 32) V!12819 V!12819 (_ BitVec 32) Int) ListLongMap!4761)

(assert (=> b!371452 (= lt!170160 (getCurrentListMapNoExtraKeys!687 lt!170156 (array!21496 (store (arr!10216 _values!506) i!548 (ValueCellFull!4049 v!373)) (size!10569 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371452 (= lt!170159 (getCurrentListMapNoExtraKeys!687 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!14742 () Bool)

(declare-fun tp!29126 () Bool)

(assert (=> mapNonEmpty!14742 (= mapRes!14742 (and tp!29126 e!226672))))

(declare-fun mapKey!14742 () (_ BitVec 32))

(declare-fun mapValue!14742 () ValueCell!4049)

(declare-fun mapRest!14742 () (Array (_ BitVec 32) ValueCell!4049))

(assert (=> mapNonEmpty!14742 (= (arr!10216 _values!506) (store mapRest!14742 mapKey!14742 mapValue!14742))))

(assert (= (and start!36996 res!208878) b!371440))

(assert (= (and b!371440 res!208872) b!371442))

(assert (= (and b!371442 res!208879) b!371443))

(assert (= (and b!371443 res!208880) b!371441))

(assert (= (and b!371441 res!208876) b!371447))

(assert (= (and b!371447 res!208875) b!371450))

(assert (= (and b!371450 res!208874) b!371446))

(assert (= (and b!371446 res!208877) b!371448))

(assert (= (and b!371448 res!208871) b!371451))

(assert (= (and b!371451 res!208873) b!371452))

(assert (= (and b!371445 condMapEmpty!14742) mapIsEmpty!14742))

(assert (= (and b!371445 (not condMapEmpty!14742)) mapNonEmpty!14742))

(get-info :version)

(assert (= (and mapNonEmpty!14742 ((_ is ValueCellFull!4049) mapValue!14742)) b!371449))

(assert (= (and b!371445 ((_ is ValueCellFull!4049) mapDefault!14742)) b!371444))

(assert (= start!36996 b!371445))

(declare-fun m!366923 () Bool)

(assert (=> b!371443 m!366923))

(declare-fun m!366925 () Bool)

(assert (=> start!36996 m!366925))

(declare-fun m!366927 () Bool)

(assert (=> start!36996 m!366927))

(declare-fun m!366929 () Bool)

(assert (=> start!36996 m!366929))

(declare-fun m!366931 () Bool)

(assert (=> b!371452 m!366931))

(declare-fun m!366933 () Bool)

(assert (=> b!371452 m!366933))

(declare-fun m!366935 () Bool)

(assert (=> b!371452 m!366935))

(declare-fun m!366937 () Bool)

(assert (=> b!371452 m!366937))

(declare-fun m!366939 () Bool)

(assert (=> b!371452 m!366939))

(declare-fun m!366941 () Bool)

(assert (=> b!371448 m!366941))

(declare-fun m!366943 () Bool)

(assert (=> b!371448 m!366943))

(declare-fun m!366945 () Bool)

(assert (=> b!371446 m!366945))

(declare-fun m!366947 () Bool)

(assert (=> b!371442 m!366947))

(declare-fun m!366949 () Bool)

(assert (=> b!371450 m!366949))

(declare-fun m!366951 () Bool)

(assert (=> b!371451 m!366951))

(declare-fun m!366953 () Bool)

(assert (=> mapNonEmpty!14742 m!366953))

(declare-fun m!366955 () Bool)

(assert (=> b!371447 m!366955))

(check-sat (not start!36996) (not b!371442) (not b!371446) (not b!371452) tp_is_empty!8785 (not b!371448) (not mapNonEmpty!14742) (not b_next!8137) (not b!371447) b_and!15353 (not b!371451) (not b!371443))
(check-sat b_and!15353 (not b_next!8137))
