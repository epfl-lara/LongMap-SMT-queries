; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71132 () Bool)

(assert start!71132)

(declare-fun b_free!13299 () Bool)

(declare-fun b_next!13299 () Bool)

(assert (=> start!71132 (= b_free!13299 (not b_next!13299))))

(declare-fun tp!46657 () Bool)

(declare-fun b_and!22225 () Bool)

(assert (=> start!71132 (= tp!46657 b_and!22225)))

(declare-fun b!826154 () Bool)

(declare-fun e!459979 () Bool)

(declare-fun e!459976 () Bool)

(declare-fun mapRes!24139 () Bool)

(assert (=> b!826154 (= e!459979 (and e!459976 mapRes!24139))))

(declare-fun condMapEmpty!24139 () Bool)

(declare-datatypes ((V!25013 0))(
  ( (V!25014 (val!7552 Int)) )
))
(declare-datatypes ((ValueCell!7089 0))(
  ( (ValueCellFull!7089 (v!9986 V!25013)) (EmptyCell!7089) )
))
(declare-datatypes ((array!46202 0))(
  ( (array!46203 (arr!22146 (Array (_ BitVec 32) ValueCell!7089)) (size!22567 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46202)

(declare-fun mapDefault!24139 () ValueCell!7089)

(assert (=> b!826154 (= condMapEmpty!24139 (= (arr!22146 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7089)) mapDefault!24139)))))

(declare-fun b!826155 () Bool)

(declare-fun e!459975 () Bool)

(declare-fun e!459977 () Bool)

(assert (=> b!826155 (= e!459975 (not e!459977))))

(declare-fun res!563158 () Bool)

(assert (=> b!826155 (=> res!563158 e!459977)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826155 (= res!563158 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!10004 0))(
  ( (tuple2!10005 (_1!5013 (_ BitVec 64)) (_2!5013 V!25013)) )
))
(declare-datatypes ((List!15803 0))(
  ( (Nil!15800) (Cons!15799 (h!16928 tuple2!10004) (t!22150 List!15803)) )
))
(declare-datatypes ((ListLongMap!8827 0))(
  ( (ListLongMap!8828 (toList!4429 List!15803)) )
))
(declare-fun lt!373570 () ListLongMap!8827)

(declare-fun lt!373567 () ListLongMap!8827)

(assert (=> b!826155 (= lt!373570 lt!373567)))

(declare-datatypes ((Unit!28321 0))(
  ( (Unit!28322) )
))
(declare-fun lt!373566 () Unit!28321)

(declare-fun zeroValueBefore!34 () V!25013)

(declare-datatypes ((array!46204 0))(
  ( (array!46205 (arr!22147 (Array (_ BitVec 32) (_ BitVec 64))) (size!22568 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46204)

(declare-fun zeroValueAfter!34 () V!25013)

(declare-fun minValue!754 () V!25013)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!548 (array!46204 array!46202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25013 V!25013 V!25013 V!25013 (_ BitVec 32) Int) Unit!28321)

(assert (=> b!826155 (= lt!373566 (lemmaNoChangeToArrayThenSameMapNoExtras!548 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2438 (array!46204 array!46202 (_ BitVec 32) (_ BitVec 32) V!25013 V!25013 (_ BitVec 32) Int) ListLongMap!8827)

(assert (=> b!826155 (= lt!373567 (getCurrentListMapNoExtraKeys!2438 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826155 (= lt!373570 (getCurrentListMapNoExtraKeys!2438 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373573 () tuple2!10004)

(declare-fun b!826156 () Bool)

(declare-fun lt!373565 () tuple2!10004)

(declare-fun e!459974 () Bool)

(declare-fun lt!373574 () ListLongMap!8827)

(declare-fun +!1936 (ListLongMap!8827 tuple2!10004) ListLongMap!8827)

(assert (=> b!826156 (= e!459974 (= lt!373574 (+!1936 (+!1936 lt!373567 lt!373565) lt!373573)))))

(declare-fun res!563162 () Bool)

(assert (=> start!71132 (=> (not res!563162) (not e!459975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71132 (= res!563162 (validMask!0 mask!1312))))

(assert (=> start!71132 e!459975))

(declare-fun tp_is_empty!15009 () Bool)

(assert (=> start!71132 tp_is_empty!15009))

(declare-fun array_inv!17655 (array!46204) Bool)

(assert (=> start!71132 (array_inv!17655 _keys!976)))

(assert (=> start!71132 true))

(declare-fun array_inv!17656 (array!46202) Bool)

(assert (=> start!71132 (and (array_inv!17656 _values!788) e!459979)))

(assert (=> start!71132 tp!46657))

(declare-fun b!826157 () Bool)

(declare-fun res!563157 () Bool)

(assert (=> b!826157 (=> (not res!563157) (not e!459975))))

(declare-datatypes ((List!15804 0))(
  ( (Nil!15801) (Cons!15800 (h!16929 (_ BitVec 64)) (t!22151 List!15804)) )
))
(declare-fun arrayNoDuplicates!0 (array!46204 (_ BitVec 32) List!15804) Bool)

(assert (=> b!826157 (= res!563157 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15801))))

(declare-fun b!826158 () Bool)

(assert (=> b!826158 (= e!459976 tp_is_empty!15009)))

(declare-fun b!826159 () Bool)

(declare-fun res!563160 () Bool)

(assert (=> b!826159 (=> (not res!563160) (not e!459975))))

(assert (=> b!826159 (= res!563160 (and (= (size!22567 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22568 _keys!976) (size!22567 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826160 () Bool)

(declare-fun e!459972 () Bool)

(assert (=> b!826160 (= e!459972 tp_is_empty!15009)))

(declare-fun mapNonEmpty!24139 () Bool)

(declare-fun tp!46656 () Bool)

(assert (=> mapNonEmpty!24139 (= mapRes!24139 (and tp!46656 e!459972))))

(declare-fun mapRest!24139 () (Array (_ BitVec 32) ValueCell!7089))

(declare-fun mapKey!24139 () (_ BitVec 32))

(declare-fun mapValue!24139 () ValueCell!7089)

(assert (=> mapNonEmpty!24139 (= (arr!22146 _values!788) (store mapRest!24139 mapKey!24139 mapValue!24139))))

(declare-fun b!826161 () Bool)

(assert (=> b!826161 (= e!459977 true)))

(declare-fun lt!373564 () ListLongMap!8827)

(assert (=> b!826161 (= lt!373564 (+!1936 (+!1936 lt!373570 lt!373573) lt!373565))))

(declare-fun lt!373575 () ListLongMap!8827)

(declare-fun lt!373576 () ListLongMap!8827)

(assert (=> b!826161 (and (= lt!373575 lt!373576) (= lt!373574 lt!373576) (= lt!373574 lt!373575))))

(declare-fun lt!373569 () ListLongMap!8827)

(assert (=> b!826161 (= lt!373576 (+!1936 lt!373569 lt!373573))))

(declare-fun lt!373563 () ListLongMap!8827)

(assert (=> b!826161 (= lt!373575 (+!1936 lt!373563 lt!373573))))

(declare-fun lt!373571 () Unit!28321)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!219 (ListLongMap!8827 (_ BitVec 64) V!25013 V!25013) Unit!28321)

(assert (=> b!826161 (= lt!373571 (addSameAsAddTwiceSameKeyDiffValues!219 lt!373563 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826161 e!459974))

(declare-fun res!563159 () Bool)

(assert (=> b!826161 (=> (not res!563159) (not e!459974))))

(declare-fun lt!373572 () ListLongMap!8827)

(assert (=> b!826161 (= res!563159 (= lt!373572 lt!373569))))

(declare-fun lt!373568 () tuple2!10004)

(assert (=> b!826161 (= lt!373569 (+!1936 lt!373563 lt!373568))))

(assert (=> b!826161 (= lt!373563 (+!1936 lt!373570 lt!373565))))

(assert (=> b!826161 (= lt!373573 (tuple2!10005 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459978 () Bool)

(assert (=> b!826161 e!459978))

(declare-fun res!563161 () Bool)

(assert (=> b!826161 (=> (not res!563161) (not e!459978))))

(assert (=> b!826161 (= res!563161 (= lt!373572 (+!1936 (+!1936 lt!373570 lt!373568) lt!373565)))))

(assert (=> b!826161 (= lt!373565 (tuple2!10005 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826161 (= lt!373568 (tuple2!10005 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2559 (array!46204 array!46202 (_ BitVec 32) (_ BitVec 32) V!25013 V!25013 (_ BitVec 32) Int) ListLongMap!8827)

(assert (=> b!826161 (= lt!373574 (getCurrentListMap!2559 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826161 (= lt!373572 (getCurrentListMap!2559 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24139 () Bool)

(assert (=> mapIsEmpty!24139 mapRes!24139))

(declare-fun b!826162 () Bool)

(assert (=> b!826162 (= e!459978 (= lt!373574 (+!1936 (+!1936 lt!373567 (tuple2!10005 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373565)))))

(declare-fun b!826163 () Bool)

(declare-fun res!563163 () Bool)

(assert (=> b!826163 (=> (not res!563163) (not e!459975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46204 (_ BitVec 32)) Bool)

(assert (=> b!826163 (= res!563163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71132 res!563162) b!826159))

(assert (= (and b!826159 res!563160) b!826163))

(assert (= (and b!826163 res!563163) b!826157))

(assert (= (and b!826157 res!563157) b!826155))

(assert (= (and b!826155 (not res!563158)) b!826161))

(assert (= (and b!826161 res!563161) b!826162))

(assert (= (and b!826161 res!563159) b!826156))

(assert (= (and b!826154 condMapEmpty!24139) mapIsEmpty!24139))

(assert (= (and b!826154 (not condMapEmpty!24139)) mapNonEmpty!24139))

(get-info :version)

(assert (= (and mapNonEmpty!24139 ((_ is ValueCellFull!7089) mapValue!24139)) b!826160))

(assert (= (and b!826154 ((_ is ValueCellFull!7089) mapDefault!24139)) b!826158))

(assert (= start!71132 b!826154))

(declare-fun m!768723 () Bool)

(assert (=> b!826161 m!768723))

(declare-fun m!768725 () Bool)

(assert (=> b!826161 m!768725))

(declare-fun m!768727 () Bool)

(assert (=> b!826161 m!768727))

(declare-fun m!768729 () Bool)

(assert (=> b!826161 m!768729))

(declare-fun m!768731 () Bool)

(assert (=> b!826161 m!768731))

(declare-fun m!768733 () Bool)

(assert (=> b!826161 m!768733))

(assert (=> b!826161 m!768729))

(declare-fun m!768735 () Bool)

(assert (=> b!826161 m!768735))

(declare-fun m!768737 () Bool)

(assert (=> b!826161 m!768737))

(assert (=> b!826161 m!768723))

(declare-fun m!768739 () Bool)

(assert (=> b!826161 m!768739))

(declare-fun m!768741 () Bool)

(assert (=> b!826161 m!768741))

(declare-fun m!768743 () Bool)

(assert (=> b!826161 m!768743))

(declare-fun m!768745 () Bool)

(assert (=> mapNonEmpty!24139 m!768745))

(declare-fun m!768747 () Bool)

(assert (=> b!826162 m!768747))

(assert (=> b!826162 m!768747))

(declare-fun m!768749 () Bool)

(assert (=> b!826162 m!768749))

(declare-fun m!768751 () Bool)

(assert (=> b!826157 m!768751))

(declare-fun m!768753 () Bool)

(assert (=> start!71132 m!768753))

(declare-fun m!768755 () Bool)

(assert (=> start!71132 m!768755))

(declare-fun m!768757 () Bool)

(assert (=> start!71132 m!768757))

(declare-fun m!768759 () Bool)

(assert (=> b!826156 m!768759))

(assert (=> b!826156 m!768759))

(declare-fun m!768761 () Bool)

(assert (=> b!826156 m!768761))

(declare-fun m!768763 () Bool)

(assert (=> b!826163 m!768763))

(declare-fun m!768765 () Bool)

(assert (=> b!826155 m!768765))

(declare-fun m!768767 () Bool)

(assert (=> b!826155 m!768767))

(declare-fun m!768769 () Bool)

(assert (=> b!826155 m!768769))

(check-sat (not b!826163) (not b_next!13299) b_and!22225 (not start!71132) (not mapNonEmpty!24139) (not b!826162) (not b!826156) (not b!826161) (not b!826157) (not b!826155) tp_is_empty!15009)
(check-sat b_and!22225 (not b_next!13299))
