; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70040 () Bool)

(assert start!70040)

(declare-fun b_free!12481 () Bool)

(declare-fun b_next!12481 () Bool)

(assert (=> start!70040 (= b_free!12481 (not b_next!12481))))

(declare-fun tp!44158 () Bool)

(declare-fun b_and!21227 () Bool)

(assert (=> start!70040 (= tp!44158 b_and!21227)))

(declare-fun mapNonEmpty!22867 () Bool)

(declare-fun mapRes!22867 () Bool)

(declare-fun tp!44157 () Bool)

(declare-fun e!451142 () Bool)

(assert (=> mapNonEmpty!22867 (= mapRes!22867 (and tp!44157 e!451142))))

(declare-datatypes ((V!23923 0))(
  ( (V!23924 (val!7143 Int)) )
))
(declare-datatypes ((ValueCell!6680 0))(
  ( (ValueCellFull!6680 (v!9564 V!23923)) (EmptyCell!6680) )
))
(declare-datatypes ((array!44581 0))(
  ( (array!44582 (arr!21351 (Array (_ BitVec 32) ValueCell!6680)) (size!21772 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44581)

(declare-fun mapRest!22867 () (Array (_ BitVec 32) ValueCell!6680))

(declare-fun mapValue!22867 () ValueCell!6680)

(declare-fun mapKey!22867 () (_ BitVec 32))

(assert (=> mapNonEmpty!22867 (= (arr!21351 _values!788) (store mapRest!22867 mapKey!22867 mapValue!22867))))

(declare-fun b!813959 () Bool)

(declare-fun e!451143 () Bool)

(assert (=> b!813959 (= e!451143 (not true))))

(declare-datatypes ((tuple2!9394 0))(
  ( (tuple2!9395 (_1!4708 (_ BitVec 64)) (_2!4708 V!23923)) )
))
(declare-datatypes ((List!15221 0))(
  ( (Nil!15218) (Cons!15217 (h!16346 tuple2!9394) (t!21529 List!15221)) )
))
(declare-datatypes ((ListLongMap!8207 0))(
  ( (ListLongMap!8208 (toList!4119 List!15221)) )
))
(declare-fun lt!364275 () ListLongMap!8207)

(declare-fun lt!364273 () ListLongMap!8207)

(assert (=> b!813959 (= lt!364275 lt!364273)))

(declare-fun zeroValueBefore!34 () V!23923)

(declare-datatypes ((array!44583 0))(
  ( (array!44584 (arr!21352 (Array (_ BitVec 32) (_ BitVec 64))) (size!21773 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44583)

(declare-fun zeroValueAfter!34 () V!23923)

(declare-fun minValue!754 () V!23923)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((Unit!27672 0))(
  ( (Unit!27673) )
))
(declare-fun lt!364274 () Unit!27672)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!277 (array!44583 array!44581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23923 V!23923 V!23923 V!23923 (_ BitVec 32) Int) Unit!27672)

(assert (=> b!813959 (= lt!364274 (lemmaNoChangeToArrayThenSameMapNoExtras!277 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2184 (array!44583 array!44581 (_ BitVec 32) (_ BitVec 32) V!23923 V!23923 (_ BitVec 32) Int) ListLongMap!8207)

(assert (=> b!813959 (= lt!364273 (getCurrentListMapNoExtraKeys!2184 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!813959 (= lt!364275 (getCurrentListMapNoExtraKeys!2184 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813960 () Bool)

(declare-fun res!556040 () Bool)

(assert (=> b!813960 (=> (not res!556040) (not e!451143))))

(assert (=> b!813960 (= res!556040 (and (= (size!21772 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21773 _keys!976) (size!21772 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22867 () Bool)

(assert (=> mapIsEmpty!22867 mapRes!22867))

(declare-fun b!813961 () Bool)

(declare-fun tp_is_empty!14191 () Bool)

(assert (=> b!813961 (= e!451142 tp_is_empty!14191)))

(declare-fun b!813962 () Bool)

(declare-fun res!556037 () Bool)

(assert (=> b!813962 (=> (not res!556037) (not e!451143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44583 (_ BitVec 32)) Bool)

(assert (=> b!813962 (= res!556037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813964 () Bool)

(declare-fun res!556038 () Bool)

(assert (=> b!813964 (=> (not res!556038) (not e!451143))))

(declare-datatypes ((List!15222 0))(
  ( (Nil!15219) (Cons!15218 (h!16347 (_ BitVec 64)) (t!21530 List!15222)) )
))
(declare-fun arrayNoDuplicates!0 (array!44583 (_ BitVec 32) List!15222) Bool)

(assert (=> b!813964 (= res!556038 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15219))))

(declare-fun b!813965 () Bool)

(declare-fun e!451141 () Bool)

(assert (=> b!813965 (= e!451141 tp_is_empty!14191)))

(declare-fun b!813963 () Bool)

(declare-fun e!451139 () Bool)

(assert (=> b!813963 (= e!451139 (and e!451141 mapRes!22867))))

(declare-fun condMapEmpty!22867 () Bool)

(declare-fun mapDefault!22867 () ValueCell!6680)

(assert (=> b!813963 (= condMapEmpty!22867 (= (arr!21351 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6680)) mapDefault!22867)))))

(declare-fun res!556039 () Bool)

(assert (=> start!70040 (=> (not res!556039) (not e!451143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70040 (= res!556039 (validMask!0 mask!1312))))

(assert (=> start!70040 e!451143))

(assert (=> start!70040 tp_is_empty!14191))

(declare-fun array_inv!17173 (array!44583) Bool)

(assert (=> start!70040 (array_inv!17173 _keys!976)))

(assert (=> start!70040 true))

(declare-fun array_inv!17174 (array!44581) Bool)

(assert (=> start!70040 (and (array_inv!17174 _values!788) e!451139)))

(assert (=> start!70040 tp!44158))

(assert (= (and start!70040 res!556039) b!813960))

(assert (= (and b!813960 res!556040) b!813962))

(assert (= (and b!813962 res!556037) b!813964))

(assert (= (and b!813964 res!556038) b!813959))

(assert (= (and b!813963 condMapEmpty!22867) mapIsEmpty!22867))

(assert (= (and b!813963 (not condMapEmpty!22867)) mapNonEmpty!22867))

(get-info :version)

(assert (= (and mapNonEmpty!22867 ((_ is ValueCellFull!6680) mapValue!22867)) b!813961))

(assert (= (and b!813963 ((_ is ValueCellFull!6680) mapDefault!22867)) b!813965))

(assert (= start!70040 b!813963))

(declare-fun m!755301 () Bool)

(assert (=> b!813959 m!755301))

(declare-fun m!755303 () Bool)

(assert (=> b!813959 m!755303))

(declare-fun m!755305 () Bool)

(assert (=> b!813959 m!755305))

(declare-fun m!755307 () Bool)

(assert (=> b!813964 m!755307))

(declare-fun m!755309 () Bool)

(assert (=> b!813962 m!755309))

(declare-fun m!755311 () Bool)

(assert (=> mapNonEmpty!22867 m!755311))

(declare-fun m!755313 () Bool)

(assert (=> start!70040 m!755313))

(declare-fun m!755315 () Bool)

(assert (=> start!70040 m!755315))

(declare-fun m!755317 () Bool)

(assert (=> start!70040 m!755317))

(check-sat (not b!813964) (not start!70040) (not b!813959) (not b!813962) b_and!21227 tp_is_empty!14191 (not mapNonEmpty!22867) (not b_next!12481))
(check-sat b_and!21227 (not b_next!12481))
