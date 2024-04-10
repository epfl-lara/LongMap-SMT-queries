; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20714 () Bool)

(assert start!20714)

(declare-fun b_free!5373 () Bool)

(declare-fun b_next!5373 () Bool)

(assert (=> start!20714 (= b_free!5373 (not b_next!5373))))

(declare-fun tp!19150 () Bool)

(declare-fun b_and!12119 () Bool)

(assert (=> start!20714 (= tp!19150 b_and!12119)))

(declare-fun res!100549 () Bool)

(declare-fun e!135313 () Bool)

(assert (=> start!20714 (=> (not res!100549) (not e!135313))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20714 (= res!100549 (validMask!0 mask!1149))))

(assert (=> start!20714 e!135313))

(declare-datatypes ((V!6619 0))(
  ( (V!6620 (val!2659 Int)) )
))
(declare-datatypes ((ValueCell!2271 0))(
  ( (ValueCellFull!2271 (v!4629 V!6619)) (EmptyCell!2271) )
))
(declare-datatypes ((array!9667 0))(
  ( (array!9668 (arr!4584 (Array (_ BitVec 32) ValueCell!2271)) (size!4909 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9667)

(declare-fun e!135311 () Bool)

(declare-fun array_inv!3035 (array!9667) Bool)

(assert (=> start!20714 (and (array_inv!3035 _values!649) e!135311)))

(assert (=> start!20714 true))

(declare-fun tp_is_empty!5229 () Bool)

(assert (=> start!20714 tp_is_empty!5229))

(declare-datatypes ((array!9669 0))(
  ( (array!9670 (arr!4585 (Array (_ BitVec 32) (_ BitVec 64))) (size!4910 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9669)

(declare-fun array_inv!3036 (array!9669) Bool)

(assert (=> start!20714 (array_inv!3036 _keys!825)))

(assert (=> start!20714 tp!19150))

(declare-fun b!207206 () Bool)

(declare-fun res!100543 () Bool)

(assert (=> b!207206 (=> (not res!100543) (not e!135313))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207206 (= res!100543 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8912 () Bool)

(declare-fun mapRes!8912 () Bool)

(declare-fun tp!19151 () Bool)

(declare-fun e!135314 () Bool)

(assert (=> mapNonEmpty!8912 (= mapRes!8912 (and tp!19151 e!135314))))

(declare-fun mapValue!8912 () ValueCell!2271)

(declare-fun mapRest!8912 () (Array (_ BitVec 32) ValueCell!2271))

(declare-fun mapKey!8912 () (_ BitVec 32))

(assert (=> mapNonEmpty!8912 (= (arr!4584 _values!649) (store mapRest!8912 mapKey!8912 mapValue!8912))))

(declare-fun b!207207 () Bool)

(declare-fun e!135310 () Bool)

(assert (=> b!207207 (= e!135311 (and e!135310 mapRes!8912))))

(declare-fun condMapEmpty!8912 () Bool)

(declare-fun mapDefault!8912 () ValueCell!2271)

(assert (=> b!207207 (= condMapEmpty!8912 (= (arr!4584 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2271)) mapDefault!8912)))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((tuple2!4038 0))(
  ( (tuple2!4039 (_1!2030 (_ BitVec 64)) (_2!2030 V!6619)) )
))
(declare-datatypes ((List!2929 0))(
  ( (Nil!2926) (Cons!2925 (h!3567 tuple2!4038) (t!7860 List!2929)) )
))
(declare-datatypes ((ListLongMap!2951 0))(
  ( (ListLongMap!2952 (toList!1491 List!2929)) )
))
(declare-fun lt!106112 () ListLongMap!2951)

(declare-fun b!207208 () Bool)

(declare-fun lt!106118 () Bool)

(declare-fun lt!106114 () ListLongMap!2951)

(assert (=> b!207208 (= e!135313 (not (or (and (not lt!106118) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!106118) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!106118) (not (= lt!106114 lt!106112)) (bvsle #b00000000000000000000000000000000 (size!4910 _keys!825)))))))

(assert (=> b!207208 (= lt!106118 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6619)

(declare-fun zeroValue!615 () V!6619)

(declare-fun lt!106116 () ListLongMap!2951)

(declare-fun getCurrentListMap!1058 (array!9669 array!9667 (_ BitVec 32) (_ BitVec 32) V!6619 V!6619 (_ BitVec 32) Int) ListLongMap!2951)

(assert (=> b!207208 (= lt!106116 (getCurrentListMap!1058 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106113 () array!9667)

(assert (=> b!207208 (= lt!106114 (getCurrentListMap!1058 _keys!825 lt!106113 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106117 () ListLongMap!2951)

(assert (=> b!207208 (and (= lt!106112 lt!106117) (= lt!106117 lt!106112))))

(declare-fun lt!106119 () ListLongMap!2951)

(declare-fun v!520 () V!6619)

(declare-fun +!518 (ListLongMap!2951 tuple2!4038) ListLongMap!2951)

(assert (=> b!207208 (= lt!106117 (+!518 lt!106119 (tuple2!4039 k0!843 v!520)))))

(declare-datatypes ((Unit!6324 0))(
  ( (Unit!6325) )
))
(declare-fun lt!106115 () Unit!6324)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!171 (array!9669 array!9667 (_ BitVec 32) (_ BitVec 32) V!6619 V!6619 (_ BitVec 32) (_ BitVec 64) V!6619 (_ BitVec 32) Int) Unit!6324)

(assert (=> b!207208 (= lt!106115 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!171 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!432 (array!9669 array!9667 (_ BitVec 32) (_ BitVec 32) V!6619 V!6619 (_ BitVec 32) Int) ListLongMap!2951)

(assert (=> b!207208 (= lt!106112 (getCurrentListMapNoExtraKeys!432 _keys!825 lt!106113 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207208 (= lt!106113 (array!9668 (store (arr!4584 _values!649) i!601 (ValueCellFull!2271 v!520)) (size!4909 _values!649)))))

(assert (=> b!207208 (= lt!106119 (getCurrentListMapNoExtraKeys!432 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207209 () Bool)

(declare-fun res!100544 () Bool)

(assert (=> b!207209 (=> (not res!100544) (not e!135313))))

(assert (=> b!207209 (= res!100544 (and (= (size!4909 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4910 _keys!825) (size!4909 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207210 () Bool)

(declare-fun res!100548 () Bool)

(assert (=> b!207210 (=> (not res!100548) (not e!135313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9669 (_ BitVec 32)) Bool)

(assert (=> b!207210 (= res!100548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207211 () Bool)

(assert (=> b!207211 (= e!135310 tp_is_empty!5229)))

(declare-fun b!207212 () Bool)

(declare-fun res!100546 () Bool)

(assert (=> b!207212 (=> (not res!100546) (not e!135313))))

(assert (=> b!207212 (= res!100546 (= (select (arr!4585 _keys!825) i!601) k0!843))))

(declare-fun b!207213 () Bool)

(declare-fun res!100545 () Bool)

(assert (=> b!207213 (=> (not res!100545) (not e!135313))))

(assert (=> b!207213 (= res!100545 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4910 _keys!825))))))

(declare-fun b!207214 () Bool)

(declare-fun res!100547 () Bool)

(assert (=> b!207214 (=> (not res!100547) (not e!135313))))

(declare-datatypes ((List!2930 0))(
  ( (Nil!2927) (Cons!2926 (h!3568 (_ BitVec 64)) (t!7861 List!2930)) )
))
(declare-fun arrayNoDuplicates!0 (array!9669 (_ BitVec 32) List!2930) Bool)

(assert (=> b!207214 (= res!100547 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2927))))

(declare-fun mapIsEmpty!8912 () Bool)

(assert (=> mapIsEmpty!8912 mapRes!8912))

(declare-fun b!207215 () Bool)

(assert (=> b!207215 (= e!135314 tp_is_empty!5229)))

(assert (= (and start!20714 res!100549) b!207209))

(assert (= (and b!207209 res!100544) b!207210))

(assert (= (and b!207210 res!100548) b!207214))

(assert (= (and b!207214 res!100547) b!207213))

(assert (= (and b!207213 res!100545) b!207206))

(assert (= (and b!207206 res!100543) b!207212))

(assert (= (and b!207212 res!100546) b!207208))

(assert (= (and b!207207 condMapEmpty!8912) mapIsEmpty!8912))

(assert (= (and b!207207 (not condMapEmpty!8912)) mapNonEmpty!8912))

(get-info :version)

(assert (= (and mapNonEmpty!8912 ((_ is ValueCellFull!2271) mapValue!8912)) b!207215))

(assert (= (and b!207207 ((_ is ValueCellFull!2271) mapDefault!8912)) b!207211))

(assert (= start!20714 b!207207))

(declare-fun m!234949 () Bool)

(assert (=> b!207214 m!234949))

(declare-fun m!234951 () Bool)

(assert (=> b!207212 m!234951))

(declare-fun m!234953 () Bool)

(assert (=> b!207210 m!234953))

(declare-fun m!234955 () Bool)

(assert (=> start!20714 m!234955))

(declare-fun m!234957 () Bool)

(assert (=> start!20714 m!234957))

(declare-fun m!234959 () Bool)

(assert (=> start!20714 m!234959))

(declare-fun m!234961 () Bool)

(assert (=> b!207208 m!234961))

(declare-fun m!234963 () Bool)

(assert (=> b!207208 m!234963))

(declare-fun m!234965 () Bool)

(assert (=> b!207208 m!234965))

(declare-fun m!234967 () Bool)

(assert (=> b!207208 m!234967))

(declare-fun m!234969 () Bool)

(assert (=> b!207208 m!234969))

(declare-fun m!234971 () Bool)

(assert (=> b!207208 m!234971))

(declare-fun m!234973 () Bool)

(assert (=> b!207208 m!234973))

(declare-fun m!234975 () Bool)

(assert (=> mapNonEmpty!8912 m!234975))

(declare-fun m!234977 () Bool)

(assert (=> b!207206 m!234977))

(check-sat (not b!207208) b_and!12119 (not b_next!5373) (not mapNonEmpty!8912) tp_is_empty!5229 (not start!20714) (not b!207206) (not b!207210) (not b!207214))
(check-sat b_and!12119 (not b_next!5373))
