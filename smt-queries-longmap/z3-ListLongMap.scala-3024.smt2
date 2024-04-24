; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42484 () Bool)

(assert start!42484)

(declare-fun b_free!11953 () Bool)

(declare-fun b_next!11953 () Bool)

(assert (=> start!42484 (= b_free!11953 (not b_next!11953))))

(declare-fun tp!41896 () Bool)

(declare-fun b_and!20431 () Bool)

(assert (=> start!42484 (= tp!41896 b_and!20431)))

(declare-fun b!474128 () Bool)

(declare-fun res!283224 () Bool)

(declare-fun e!278255 () Bool)

(assert (=> b!474128 (=> (not res!283224) (not e!278255))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30488 0))(
  ( (array!30489 (arr!14662 (Array (_ BitVec 32) (_ BitVec 64))) (size!15014 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30488)

(declare-datatypes ((V!18947 0))(
  ( (V!18948 (val!6735 Int)) )
))
(declare-datatypes ((ValueCell!6347 0))(
  ( (ValueCellFull!6347 (v!9028 V!18947)) (EmptyCell!6347) )
))
(declare-datatypes ((array!30490 0))(
  ( (array!30491 (arr!14663 (Array (_ BitVec 32) ValueCell!6347)) (size!15015 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30490)

(assert (=> b!474128 (= res!283224 (and (= (size!15015 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15014 _keys!1025) (size!15015 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474129 () Bool)

(declare-fun e!278256 () Bool)

(assert (=> b!474129 (= e!278255 (not e!278256))))

(declare-fun res!283226 () Bool)

(assert (=> b!474129 (=> res!283226 e!278256)))

(assert (=> b!474129 (= res!283226 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8802 0))(
  ( (tuple2!8803 (_1!4412 (_ BitVec 64)) (_2!4412 V!18947)) )
))
(declare-datatypes ((List!8863 0))(
  ( (Nil!8860) (Cons!8859 (h!9715 tuple2!8802) (t!14827 List!8863)) )
))
(declare-datatypes ((ListLongMap!7717 0))(
  ( (ListLongMap!7718 (toList!3874 List!8863)) )
))
(declare-fun lt!215879 () ListLongMap!7717)

(declare-fun lt!215881 () ListLongMap!7717)

(assert (=> b!474129 (= lt!215879 lt!215881)))

(declare-fun minValueBefore!38 () V!18947)

(declare-fun zeroValue!794 () V!18947)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18947)

(declare-datatypes ((Unit!13954 0))(
  ( (Unit!13955) )
))
(declare-fun lt!215876 () Unit!13954)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!243 (array!30488 array!30490 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18947 V!18947 V!18947 V!18947 (_ BitVec 32) Int) Unit!13954)

(assert (=> b!474129 (= lt!215876 (lemmaNoChangeToArrayThenSameMapNoExtras!243 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2083 (array!30488 array!30490 (_ BitVec 32) (_ BitVec 32) V!18947 V!18947 (_ BitVec 32) Int) ListLongMap!7717)

(assert (=> b!474129 (= lt!215881 (getCurrentListMapNoExtraKeys!2083 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!474129 (= lt!215879 (getCurrentListMapNoExtraKeys!2083 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474130 () Bool)

(assert (=> b!474130 (= e!278256 true)))

(declare-fun lt!215882 () ListLongMap!7717)

(declare-fun lt!215883 () tuple2!8802)

(declare-fun +!1756 (ListLongMap!7717 tuple2!8802) ListLongMap!7717)

(assert (=> b!474130 (= (+!1756 lt!215882 lt!215883) (+!1756 (+!1756 lt!215882 (tuple2!8803 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215883))))

(assert (=> b!474130 (= lt!215883 (tuple2!8803 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!215878 () Unit!13954)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!158 (ListLongMap!7717 (_ BitVec 64) V!18947 V!18947) Unit!13954)

(assert (=> b!474130 (= lt!215878 (addSameAsAddTwiceSameKeyDiffValues!158 lt!215882 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(assert (=> b!474130 (= lt!215882 (+!1756 lt!215879 (tuple2!8803 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun lt!215877 () ListLongMap!7717)

(declare-fun getCurrentListMap!2236 (array!30488 array!30490 (_ BitVec 32) (_ BitVec 32) V!18947 V!18947 (_ BitVec 32) Int) ListLongMap!7717)

(assert (=> b!474130 (= lt!215877 (getCurrentListMap!2236 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215880 () ListLongMap!7717)

(assert (=> b!474130 (= lt!215880 (getCurrentListMap!2236 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474131 () Bool)

(declare-fun e!278252 () Bool)

(declare-fun tp_is_empty!13381 () Bool)

(assert (=> b!474131 (= e!278252 tp_is_empty!13381)))

(declare-fun res!283225 () Bool)

(assert (=> start!42484 (=> (not res!283225) (not e!278255))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42484 (= res!283225 (validMask!0 mask!1365))))

(assert (=> start!42484 e!278255))

(assert (=> start!42484 tp_is_empty!13381))

(assert (=> start!42484 tp!41896))

(assert (=> start!42484 true))

(declare-fun array_inv!10660 (array!30488) Bool)

(assert (=> start!42484 (array_inv!10660 _keys!1025)))

(declare-fun e!278254 () Bool)

(declare-fun array_inv!10661 (array!30490) Bool)

(assert (=> start!42484 (and (array_inv!10661 _values!833) e!278254)))

(declare-fun b!474132 () Bool)

(declare-fun e!278257 () Bool)

(assert (=> b!474132 (= e!278257 tp_is_empty!13381)))

(declare-fun mapIsEmpty!21787 () Bool)

(declare-fun mapRes!21787 () Bool)

(assert (=> mapIsEmpty!21787 mapRes!21787))

(declare-fun b!474133 () Bool)

(declare-fun res!283228 () Bool)

(assert (=> b!474133 (=> (not res!283228) (not e!278255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30488 (_ BitVec 32)) Bool)

(assert (=> b!474133 (= res!283228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21787 () Bool)

(declare-fun tp!41895 () Bool)

(assert (=> mapNonEmpty!21787 (= mapRes!21787 (and tp!41895 e!278257))))

(declare-fun mapKey!21787 () (_ BitVec 32))

(declare-fun mapRest!21787 () (Array (_ BitVec 32) ValueCell!6347))

(declare-fun mapValue!21787 () ValueCell!6347)

(assert (=> mapNonEmpty!21787 (= (arr!14663 _values!833) (store mapRest!21787 mapKey!21787 mapValue!21787))))

(declare-fun b!474134 () Bool)

(assert (=> b!474134 (= e!278254 (and e!278252 mapRes!21787))))

(declare-fun condMapEmpty!21787 () Bool)

(declare-fun mapDefault!21787 () ValueCell!6347)

(assert (=> b!474134 (= condMapEmpty!21787 (= (arr!14663 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6347)) mapDefault!21787)))))

(declare-fun b!474135 () Bool)

(declare-fun res!283227 () Bool)

(assert (=> b!474135 (=> (not res!283227) (not e!278255))))

(declare-datatypes ((List!8864 0))(
  ( (Nil!8861) (Cons!8860 (h!9716 (_ BitVec 64)) (t!14828 List!8864)) )
))
(declare-fun arrayNoDuplicates!0 (array!30488 (_ BitVec 32) List!8864) Bool)

(assert (=> b!474135 (= res!283227 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8861))))

(assert (= (and start!42484 res!283225) b!474128))

(assert (= (and b!474128 res!283224) b!474133))

(assert (= (and b!474133 res!283228) b!474135))

(assert (= (and b!474135 res!283227) b!474129))

(assert (= (and b!474129 (not res!283226)) b!474130))

(assert (= (and b!474134 condMapEmpty!21787) mapIsEmpty!21787))

(assert (= (and b!474134 (not condMapEmpty!21787)) mapNonEmpty!21787))

(get-info :version)

(assert (= (and mapNonEmpty!21787 ((_ is ValueCellFull!6347) mapValue!21787)) b!474132))

(assert (= (and b!474134 ((_ is ValueCellFull!6347) mapDefault!21787)) b!474131))

(assert (= start!42484 b!474134))

(declare-fun m!456643 () Bool)

(assert (=> mapNonEmpty!21787 m!456643))

(declare-fun m!456645 () Bool)

(assert (=> b!474133 m!456645))

(declare-fun m!456647 () Bool)

(assert (=> b!474129 m!456647))

(declare-fun m!456649 () Bool)

(assert (=> b!474129 m!456649))

(declare-fun m!456651 () Bool)

(assert (=> b!474129 m!456651))

(declare-fun m!456653 () Bool)

(assert (=> b!474130 m!456653))

(declare-fun m!456655 () Bool)

(assert (=> b!474130 m!456655))

(declare-fun m!456657 () Bool)

(assert (=> b!474130 m!456657))

(declare-fun m!456659 () Bool)

(assert (=> b!474130 m!456659))

(assert (=> b!474130 m!456655))

(declare-fun m!456661 () Bool)

(assert (=> b!474130 m!456661))

(declare-fun m!456663 () Bool)

(assert (=> b!474130 m!456663))

(declare-fun m!456665 () Bool)

(assert (=> b!474130 m!456665))

(declare-fun m!456667 () Bool)

(assert (=> b!474135 m!456667))

(declare-fun m!456669 () Bool)

(assert (=> start!42484 m!456669))

(declare-fun m!456671 () Bool)

(assert (=> start!42484 m!456671))

(declare-fun m!456673 () Bool)

(assert (=> start!42484 m!456673))

(check-sat (not b!474130) (not start!42484) (not mapNonEmpty!21787) b_and!20431 (not b!474135) (not b!474129) tp_is_empty!13381 (not b_next!11953) (not b!474133))
(check-sat b_and!20431 (not b_next!11953))
