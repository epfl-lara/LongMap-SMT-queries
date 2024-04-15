; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41924 () Bool)

(assert start!41924)

(declare-fun b_free!11527 () Bool)

(declare-fun b_next!11527 () Bool)

(assert (=> start!41924 (= b_free!11527 (not b_next!11527))))

(declare-fun tp!40593 () Bool)

(declare-fun b_and!19889 () Bool)

(assert (=> start!41924 (= tp!40593 b_and!19889)))

(declare-fun b!467959 () Bool)

(declare-fun res!279712 () Bool)

(declare-fun e!273837 () Bool)

(assert (=> b!467959 (=> (not res!279712) (not e!273837))))

(declare-datatypes ((array!29671 0))(
  ( (array!29672 (arr!14262 (Array (_ BitVec 32) (_ BitVec 64))) (size!14615 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29671)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29671 (_ BitVec 32)) Bool)

(assert (=> b!467959 (= res!279712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467960 () Bool)

(declare-fun e!273840 () Bool)

(declare-fun e!273836 () Bool)

(declare-fun mapRes!21124 () Bool)

(assert (=> b!467960 (= e!273840 (and e!273836 mapRes!21124))))

(declare-fun condMapEmpty!21124 () Bool)

(declare-datatypes ((V!18379 0))(
  ( (V!18380 (val!6522 Int)) )
))
(declare-datatypes ((ValueCell!6134 0))(
  ( (ValueCellFull!6134 (v!8805 V!18379)) (EmptyCell!6134) )
))
(declare-datatypes ((array!29673 0))(
  ( (array!29674 (arr!14263 (Array (_ BitVec 32) ValueCell!6134)) (size!14616 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29673)

(declare-fun mapDefault!21124 () ValueCell!6134)

(assert (=> b!467960 (= condMapEmpty!21124 (= (arr!14263 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6134)) mapDefault!21124)))))

(declare-fun b!467961 () Bool)

(declare-fun e!273838 () Bool)

(assert (=> b!467961 (= e!273838 true)))

(declare-fun minValueBefore!38 () V!18379)

(declare-fun zeroValue!794 () V!18379)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8606 0))(
  ( (tuple2!8607 (_1!4314 (_ BitVec 64)) (_2!4314 V!18379)) )
))
(declare-datatypes ((List!8681 0))(
  ( (Nil!8678) (Cons!8677 (h!9533 tuple2!8606) (t!14628 List!8681)) )
))
(declare-datatypes ((ListLongMap!7509 0))(
  ( (ListLongMap!7510 (toList!3770 List!8681)) )
))
(declare-fun lt!211496 () ListLongMap!7509)

(declare-fun getCurrentListMap!2139 (array!29671 array!29673 (_ BitVec 32) (_ BitVec 32) V!18379 V!18379 (_ BitVec 32) Int) ListLongMap!7509)

(assert (=> b!467961 (= lt!211496 (getCurrentListMap!2139 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467962 () Bool)

(assert (=> b!467962 (= e!273837 (not e!273838))))

(declare-fun res!279708 () Bool)

(assert (=> b!467962 (=> res!279708 e!273838)))

(assert (=> b!467962 (= res!279708 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211497 () ListLongMap!7509)

(declare-fun lt!211495 () ListLongMap!7509)

(assert (=> b!467962 (= lt!211497 lt!211495)))

(declare-datatypes ((Unit!13640 0))(
  ( (Unit!13641) )
))
(declare-fun lt!211494 () Unit!13640)

(declare-fun minValueAfter!38 () V!18379)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!109 (array!29671 array!29673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18379 V!18379 V!18379 V!18379 (_ BitVec 32) Int) Unit!13640)

(assert (=> b!467962 (= lt!211494 (lemmaNoChangeToArrayThenSameMapNoExtras!109 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1952 (array!29671 array!29673 (_ BitVec 32) (_ BitVec 32) V!18379 V!18379 (_ BitVec 32) Int) ListLongMap!7509)

(assert (=> b!467962 (= lt!211495 (getCurrentListMapNoExtraKeys!1952 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467962 (= lt!211497 (getCurrentListMapNoExtraKeys!1952 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21124 () Bool)

(declare-fun tp!40594 () Bool)

(declare-fun e!273841 () Bool)

(assert (=> mapNonEmpty!21124 (= mapRes!21124 (and tp!40594 e!273841))))

(declare-fun mapValue!21124 () ValueCell!6134)

(declare-fun mapRest!21124 () (Array (_ BitVec 32) ValueCell!6134))

(declare-fun mapKey!21124 () (_ BitVec 32))

(assert (=> mapNonEmpty!21124 (= (arr!14263 _values!833) (store mapRest!21124 mapKey!21124 mapValue!21124))))

(declare-fun b!467963 () Bool)

(declare-fun tp_is_empty!12955 () Bool)

(assert (=> b!467963 (= e!273841 tp_is_empty!12955)))

(declare-fun res!279711 () Bool)

(assert (=> start!41924 (=> (not res!279711) (not e!273837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41924 (= res!279711 (validMask!0 mask!1365))))

(assert (=> start!41924 e!273837))

(assert (=> start!41924 tp_is_empty!12955))

(assert (=> start!41924 tp!40593))

(assert (=> start!41924 true))

(declare-fun array_inv!10378 (array!29671) Bool)

(assert (=> start!41924 (array_inv!10378 _keys!1025)))

(declare-fun array_inv!10379 (array!29673) Bool)

(assert (=> start!41924 (and (array_inv!10379 _values!833) e!273840)))

(declare-fun b!467964 () Bool)

(declare-fun res!279710 () Bool)

(assert (=> b!467964 (=> (not res!279710) (not e!273837))))

(assert (=> b!467964 (= res!279710 (and (= (size!14616 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14615 _keys!1025) (size!14616 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21124 () Bool)

(assert (=> mapIsEmpty!21124 mapRes!21124))

(declare-fun b!467965 () Bool)

(declare-fun res!279709 () Bool)

(assert (=> b!467965 (=> (not res!279709) (not e!273837))))

(declare-datatypes ((List!8682 0))(
  ( (Nil!8679) (Cons!8678 (h!9534 (_ BitVec 64)) (t!14629 List!8682)) )
))
(declare-fun arrayNoDuplicates!0 (array!29671 (_ BitVec 32) List!8682) Bool)

(assert (=> b!467965 (= res!279709 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8679))))

(declare-fun b!467966 () Bool)

(assert (=> b!467966 (= e!273836 tp_is_empty!12955)))

(assert (= (and start!41924 res!279711) b!467964))

(assert (= (and b!467964 res!279710) b!467959))

(assert (= (and b!467959 res!279712) b!467965))

(assert (= (and b!467965 res!279709) b!467962))

(assert (= (and b!467962 (not res!279708)) b!467961))

(assert (= (and b!467960 condMapEmpty!21124) mapIsEmpty!21124))

(assert (= (and b!467960 (not condMapEmpty!21124)) mapNonEmpty!21124))

(get-info :version)

(assert (= (and mapNonEmpty!21124 ((_ is ValueCellFull!6134) mapValue!21124)) b!467963))

(assert (= (and b!467960 ((_ is ValueCellFull!6134) mapDefault!21124)) b!467966))

(assert (= start!41924 b!467960))

(declare-fun m!449515 () Bool)

(assert (=> b!467959 m!449515))

(declare-fun m!449517 () Bool)

(assert (=> b!467961 m!449517))

(declare-fun m!449519 () Bool)

(assert (=> b!467965 m!449519))

(declare-fun m!449521 () Bool)

(assert (=> b!467962 m!449521))

(declare-fun m!449523 () Bool)

(assert (=> b!467962 m!449523))

(declare-fun m!449525 () Bool)

(assert (=> b!467962 m!449525))

(declare-fun m!449527 () Bool)

(assert (=> mapNonEmpty!21124 m!449527))

(declare-fun m!449529 () Bool)

(assert (=> start!41924 m!449529))

(declare-fun m!449531 () Bool)

(assert (=> start!41924 m!449531))

(declare-fun m!449533 () Bool)

(assert (=> start!41924 m!449533))

(check-sat (not start!41924) tp_is_empty!12955 (not b!467959) (not b_next!11527) (not b!467961) b_and!19889 (not mapNonEmpty!21124) (not b!467965) (not b!467962))
(check-sat b_and!19889 (not b_next!11527))
