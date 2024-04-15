; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40220 () Bool)

(assert start!40220)

(declare-fun b_free!10501 () Bool)

(declare-fun b_next!10501 () Bool)

(assert (=> start!40220 (= b_free!10501 (not b_next!10501))))

(declare-fun tp!37032 () Bool)

(declare-fun b_and!18443 () Bool)

(assert (=> start!40220 (= tp!37032 b_and!18443)))

(declare-fun res!261135 () Bool)

(declare-fun e!259730 () Bool)

(assert (=> start!40220 (=> (not res!261135) (not e!259730))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27121 0))(
  ( (array!27122 (arr!13010 (Array (_ BitVec 32) (_ BitVec 64))) (size!13363 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27121)

(assert (=> start!40220 (= res!261135 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13363 _keys!709))))))

(assert (=> start!40220 e!259730))

(declare-fun tp_is_empty!11653 () Bool)

(assert (=> start!40220 tp_is_empty!11653))

(assert (=> start!40220 tp!37032))

(assert (=> start!40220 true))

(declare-datatypes ((V!16643 0))(
  ( (V!16644 (val!5871 Int)) )
))
(declare-datatypes ((ValueCell!5483 0))(
  ( (ValueCellFull!5483 (v!8112 V!16643)) (EmptyCell!5483) )
))
(declare-datatypes ((array!27123 0))(
  ( (array!27124 (arr!13011 (Array (_ BitVec 32) ValueCell!5483)) (size!13364 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27123)

(declare-fun e!259729 () Bool)

(declare-fun array_inv!9486 (array!27123) Bool)

(assert (=> start!40220 (and (array_inv!9486 _values!549) e!259729)))

(declare-fun array_inv!9487 (array!27121) Bool)

(assert (=> start!40220 (array_inv!9487 _keys!709)))

(declare-fun b!441109 () Bool)

(declare-fun res!261142 () Bool)

(assert (=> b!441109 (=> (not res!261142) (not e!259730))))

(declare-datatypes ((List!7808 0))(
  ( (Nil!7805) (Cons!7804 (h!8660 (_ BitVec 64)) (t!13555 List!7808)) )
))
(declare-fun arrayNoDuplicates!0 (array!27121 (_ BitVec 32) List!7808) Bool)

(assert (=> b!441109 (= res!261142 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7805))))

(declare-fun b!441110 () Bool)

(declare-fun e!259734 () Bool)

(assert (=> b!441110 (= e!259734 (not true))))

(declare-fun lt!202642 () array!27123)

(declare-fun minValue!515 () V!16643)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16643)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!202644 () array!27121)

(declare-fun v!412 () V!16643)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7822 0))(
  ( (tuple2!7823 (_1!3922 (_ BitVec 64)) (_2!3922 V!16643)) )
))
(declare-datatypes ((List!7809 0))(
  ( (Nil!7806) (Cons!7805 (h!8661 tuple2!7822) (t!13556 List!7809)) )
))
(declare-datatypes ((ListLongMap!6725 0))(
  ( (ListLongMap!6726 (toList!3378 List!7809)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1577 (array!27121 array!27123 (_ BitVec 32) (_ BitVec 32) V!16643 V!16643 (_ BitVec 32) Int) ListLongMap!6725)

(declare-fun +!1538 (ListLongMap!6725 tuple2!7822) ListLongMap!6725)

(assert (=> b!441110 (= (getCurrentListMapNoExtraKeys!1577 lt!202644 lt!202642 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1538 (getCurrentListMapNoExtraKeys!1577 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7823 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13093 0))(
  ( (Unit!13094) )
))
(declare-fun lt!202643 () Unit!13093)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!676 (array!27121 array!27123 (_ BitVec 32) (_ BitVec 32) V!16643 V!16643 (_ BitVec 32) (_ BitVec 64) V!16643 (_ BitVec 32) Int) Unit!13093)

(assert (=> b!441110 (= lt!202643 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!676 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441111 () Bool)

(declare-fun e!259728 () Bool)

(assert (=> b!441111 (= e!259728 tp_is_empty!11653)))

(declare-fun b!441112 () Bool)

(declare-fun res!261133 () Bool)

(assert (=> b!441112 (=> (not res!261133) (not e!259730))))

(assert (=> b!441112 (= res!261133 (or (= (select (arr!13010 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13010 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441113 () Bool)

(declare-fun res!261136 () Bool)

(assert (=> b!441113 (=> (not res!261136) (not e!259730))))

(declare-fun arrayContainsKey!0 (array!27121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441113 (= res!261136 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441114 () Bool)

(declare-fun res!261143 () Bool)

(assert (=> b!441114 (=> (not res!261143) (not e!259730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27121 (_ BitVec 32)) Bool)

(assert (=> b!441114 (= res!261143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19101 () Bool)

(declare-fun mapRes!19101 () Bool)

(declare-fun tp!37031 () Bool)

(declare-fun e!259732 () Bool)

(assert (=> mapNonEmpty!19101 (= mapRes!19101 (and tp!37031 e!259732))))

(declare-fun mapKey!19101 () (_ BitVec 32))

(declare-fun mapValue!19101 () ValueCell!5483)

(declare-fun mapRest!19101 () (Array (_ BitVec 32) ValueCell!5483))

(assert (=> mapNonEmpty!19101 (= (arr!13011 _values!549) (store mapRest!19101 mapKey!19101 mapValue!19101))))

(declare-fun b!441115 () Bool)

(declare-fun res!261140 () Bool)

(assert (=> b!441115 (=> (not res!261140) (not e!259730))))

(assert (=> b!441115 (= res!261140 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13363 _keys!709))))))

(declare-fun b!441116 () Bool)

(declare-fun e!259733 () Bool)

(assert (=> b!441116 (= e!259733 e!259734)))

(declare-fun res!261132 () Bool)

(assert (=> b!441116 (=> (not res!261132) (not e!259734))))

(assert (=> b!441116 (= res!261132 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202645 () ListLongMap!6725)

(assert (=> b!441116 (= lt!202645 (getCurrentListMapNoExtraKeys!1577 lt!202644 lt!202642 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441116 (= lt!202642 (array!27124 (store (arr!13011 _values!549) i!563 (ValueCellFull!5483 v!412)) (size!13364 _values!549)))))

(declare-fun lt!202646 () ListLongMap!6725)

(assert (=> b!441116 (= lt!202646 (getCurrentListMapNoExtraKeys!1577 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!19101 () Bool)

(assert (=> mapIsEmpty!19101 mapRes!19101))

(declare-fun b!441117 () Bool)

(declare-fun res!261144 () Bool)

(assert (=> b!441117 (=> (not res!261144) (not e!259733))))

(assert (=> b!441117 (= res!261144 (arrayNoDuplicates!0 lt!202644 #b00000000000000000000000000000000 Nil!7805))))

(declare-fun b!441118 () Bool)

(declare-fun res!261134 () Bool)

(assert (=> b!441118 (=> (not res!261134) (not e!259733))))

(assert (=> b!441118 (= res!261134 (bvsle from!863 i!563))))

(declare-fun b!441119 () Bool)

(assert (=> b!441119 (= e!259732 tp_is_empty!11653)))

(declare-fun b!441120 () Bool)

(assert (=> b!441120 (= e!259730 e!259733)))

(declare-fun res!261137 () Bool)

(assert (=> b!441120 (=> (not res!261137) (not e!259733))))

(assert (=> b!441120 (= res!261137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202644 mask!1025))))

(assert (=> b!441120 (= lt!202644 (array!27122 (store (arr!13010 _keys!709) i!563 k0!794) (size!13363 _keys!709)))))

(declare-fun b!441121 () Bool)

(declare-fun res!261141 () Bool)

(assert (=> b!441121 (=> (not res!261141) (not e!259730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441121 (= res!261141 (validKeyInArray!0 k0!794))))

(declare-fun b!441122 () Bool)

(declare-fun res!261139 () Bool)

(assert (=> b!441122 (=> (not res!261139) (not e!259730))))

(assert (=> b!441122 (= res!261139 (and (= (size!13364 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13363 _keys!709) (size!13364 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441123 () Bool)

(declare-fun res!261138 () Bool)

(assert (=> b!441123 (=> (not res!261138) (not e!259730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441123 (= res!261138 (validMask!0 mask!1025))))

(declare-fun b!441124 () Bool)

(assert (=> b!441124 (= e!259729 (and e!259728 mapRes!19101))))

(declare-fun condMapEmpty!19101 () Bool)

(declare-fun mapDefault!19101 () ValueCell!5483)

(assert (=> b!441124 (= condMapEmpty!19101 (= (arr!13011 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5483)) mapDefault!19101)))))

(assert (= (and start!40220 res!261135) b!441123))

(assert (= (and b!441123 res!261138) b!441122))

(assert (= (and b!441122 res!261139) b!441114))

(assert (= (and b!441114 res!261143) b!441109))

(assert (= (and b!441109 res!261142) b!441115))

(assert (= (and b!441115 res!261140) b!441121))

(assert (= (and b!441121 res!261141) b!441112))

(assert (= (and b!441112 res!261133) b!441113))

(assert (= (and b!441113 res!261136) b!441120))

(assert (= (and b!441120 res!261137) b!441117))

(assert (= (and b!441117 res!261144) b!441118))

(assert (= (and b!441118 res!261134) b!441116))

(assert (= (and b!441116 res!261132) b!441110))

(assert (= (and b!441124 condMapEmpty!19101) mapIsEmpty!19101))

(assert (= (and b!441124 (not condMapEmpty!19101)) mapNonEmpty!19101))

(get-info :version)

(assert (= (and mapNonEmpty!19101 ((_ is ValueCellFull!5483) mapValue!19101)) b!441119))

(assert (= (and b!441124 ((_ is ValueCellFull!5483) mapDefault!19101)) b!441111))

(assert (= start!40220 b!441124))

(declare-fun m!427497 () Bool)

(assert (=> mapNonEmpty!19101 m!427497))

(declare-fun m!427499 () Bool)

(assert (=> b!441121 m!427499))

(declare-fun m!427501 () Bool)

(assert (=> b!441110 m!427501))

(declare-fun m!427503 () Bool)

(assert (=> b!441110 m!427503))

(assert (=> b!441110 m!427503))

(declare-fun m!427505 () Bool)

(assert (=> b!441110 m!427505))

(declare-fun m!427507 () Bool)

(assert (=> b!441110 m!427507))

(declare-fun m!427509 () Bool)

(assert (=> b!441113 m!427509))

(declare-fun m!427511 () Bool)

(assert (=> start!40220 m!427511))

(declare-fun m!427513 () Bool)

(assert (=> start!40220 m!427513))

(declare-fun m!427515 () Bool)

(assert (=> b!441114 m!427515))

(declare-fun m!427517 () Bool)

(assert (=> b!441120 m!427517))

(declare-fun m!427519 () Bool)

(assert (=> b!441120 m!427519))

(declare-fun m!427521 () Bool)

(assert (=> b!441123 m!427521))

(declare-fun m!427523 () Bool)

(assert (=> b!441117 m!427523))

(declare-fun m!427525 () Bool)

(assert (=> b!441112 m!427525))

(declare-fun m!427527 () Bool)

(assert (=> b!441109 m!427527))

(declare-fun m!427529 () Bool)

(assert (=> b!441116 m!427529))

(declare-fun m!427531 () Bool)

(assert (=> b!441116 m!427531))

(declare-fun m!427533 () Bool)

(assert (=> b!441116 m!427533))

(check-sat (not mapNonEmpty!19101) (not b_next!10501) (not b!441109) b_and!18443 (not b!441121) (not start!40220) (not b!441120) (not b!441116) (not b!441114) (not b!441110) (not b!441117) (not b!441123) tp_is_empty!11653 (not b!441113))
(check-sat b_and!18443 (not b_next!10501))
