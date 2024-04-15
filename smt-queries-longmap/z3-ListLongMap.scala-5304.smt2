; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71008 () Bool)

(assert start!71008)

(declare-fun b_free!13231 () Bool)

(declare-fun b_next!13231 () Bool)

(assert (=> start!71008 (= b_free!13231 (not b_next!13231))))

(declare-fun tp!46447 () Bool)

(declare-fun b_and!22109 () Bool)

(assert (=> start!71008 (= tp!46447 b_and!22109)))

(declare-fun mapIsEmpty!24031 () Bool)

(declare-fun mapRes!24031 () Bool)

(assert (=> mapIsEmpty!24031 mapRes!24031))

(declare-fun b!824566 () Bool)

(declare-fun res!562207 () Bool)

(declare-fun e!458816 () Bool)

(assert (=> b!824566 (=> (not res!562207) (not e!458816))))

(declare-datatypes ((array!46037 0))(
  ( (array!46038 (arr!22066 (Array (_ BitVec 32) (_ BitVec 64))) (size!22487 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46037)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46037 (_ BitVec 32)) Bool)

(assert (=> b!824566 (= res!562207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824567 () Bool)

(declare-fun e!458814 () Bool)

(declare-fun tp_is_empty!14941 () Bool)

(assert (=> b!824567 (= e!458814 tp_is_empty!14941)))

(declare-fun b!824568 () Bool)

(declare-fun res!562211 () Bool)

(assert (=> b!824568 (=> (not res!562211) (not e!458816))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24923 0))(
  ( (V!24924 (val!7518 Int)) )
))
(declare-datatypes ((ValueCell!7055 0))(
  ( (ValueCellFull!7055 (v!9945 V!24923)) (EmptyCell!7055) )
))
(declare-datatypes ((array!46039 0))(
  ( (array!46040 (arr!22067 (Array (_ BitVec 32) ValueCell!7055)) (size!22488 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46039)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824568 (= res!562211 (and (= (size!22488 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22487 _keys!976) (size!22488 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824569 () Bool)

(declare-fun e!458819 () Bool)

(assert (=> b!824569 (= e!458819 tp_is_empty!14941)))

(declare-fun b!824570 () Bool)

(declare-fun e!458817 () Bool)

(assert (=> b!824570 (= e!458817 (and e!458819 mapRes!24031))))

(declare-fun condMapEmpty!24031 () Bool)

(declare-fun mapDefault!24031 () ValueCell!7055)

(assert (=> b!824570 (= condMapEmpty!24031 (= (arr!22067 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7055)) mapDefault!24031)))))

(declare-fun b!824571 () Bool)

(declare-fun e!458818 () Bool)

(assert (=> b!824571 (= e!458818 true)))

(declare-fun zeroValueBefore!34 () V!24923)

(declare-fun minValue!754 () V!24923)

(declare-datatypes ((tuple2!9954 0))(
  ( (tuple2!9955 (_1!4988 (_ BitVec 64)) (_2!4988 V!24923)) )
))
(declare-datatypes ((List!15754 0))(
  ( (Nil!15751) (Cons!15750 (h!16879 tuple2!9954) (t!22088 List!15754)) )
))
(declare-datatypes ((ListLongMap!8767 0))(
  ( (ListLongMap!8768 (toList!4399 List!15754)) )
))
(declare-fun lt!371768 () ListLongMap!8767)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2493 (array!46037 array!46039 (_ BitVec 32) (_ BitVec 32) V!24923 V!24923 (_ BitVec 32) Int) ListLongMap!8767)

(assert (=> b!824571 (= lt!371768 (getCurrentListMap!2493 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824572 () Bool)

(assert (=> b!824572 (= e!458816 (not e!458818))))

(declare-fun res!562210 () Bool)

(assert (=> b!824572 (=> res!562210 e!458818)))

(assert (=> b!824572 (= res!562210 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!371771 () ListLongMap!8767)

(declare-fun lt!371770 () ListLongMap!8767)

(assert (=> b!824572 (= lt!371771 lt!371770)))

(declare-datatypes ((Unit!28222 0))(
  ( (Unit!28223) )
))
(declare-fun lt!371769 () Unit!28222)

(declare-fun zeroValueAfter!34 () V!24923)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!536 (array!46037 array!46039 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24923 V!24923 V!24923 V!24923 (_ BitVec 32) Int) Unit!28222)

(assert (=> b!824572 (= lt!371769 (lemmaNoChangeToArrayThenSameMapNoExtras!536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2443 (array!46037 array!46039 (_ BitVec 32) (_ BitVec 32) V!24923 V!24923 (_ BitVec 32) Int) ListLongMap!8767)

(assert (=> b!824572 (= lt!371770 (getCurrentListMapNoExtraKeys!2443 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824572 (= lt!371771 (getCurrentListMapNoExtraKeys!2443 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!562208 () Bool)

(assert (=> start!71008 (=> (not res!562208) (not e!458816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71008 (= res!562208 (validMask!0 mask!1312))))

(assert (=> start!71008 e!458816))

(assert (=> start!71008 tp_is_empty!14941))

(declare-fun array_inv!17671 (array!46037) Bool)

(assert (=> start!71008 (array_inv!17671 _keys!976)))

(assert (=> start!71008 true))

(declare-fun array_inv!17672 (array!46039) Bool)

(assert (=> start!71008 (and (array_inv!17672 _values!788) e!458817)))

(assert (=> start!71008 tp!46447))

(declare-fun b!824573 () Bool)

(declare-fun res!562209 () Bool)

(assert (=> b!824573 (=> (not res!562209) (not e!458816))))

(declare-datatypes ((List!15755 0))(
  ( (Nil!15752) (Cons!15751 (h!16880 (_ BitVec 64)) (t!22089 List!15755)) )
))
(declare-fun arrayNoDuplicates!0 (array!46037 (_ BitVec 32) List!15755) Bool)

(assert (=> b!824573 (= res!562209 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15752))))

(declare-fun mapNonEmpty!24031 () Bool)

(declare-fun tp!46446 () Bool)

(assert (=> mapNonEmpty!24031 (= mapRes!24031 (and tp!46446 e!458814))))

(declare-fun mapValue!24031 () ValueCell!7055)

(declare-fun mapRest!24031 () (Array (_ BitVec 32) ValueCell!7055))

(declare-fun mapKey!24031 () (_ BitVec 32))

(assert (=> mapNonEmpty!24031 (= (arr!22067 _values!788) (store mapRest!24031 mapKey!24031 mapValue!24031))))

(assert (= (and start!71008 res!562208) b!824568))

(assert (= (and b!824568 res!562211) b!824566))

(assert (= (and b!824566 res!562207) b!824573))

(assert (= (and b!824573 res!562209) b!824572))

(assert (= (and b!824572 (not res!562210)) b!824571))

(assert (= (and b!824570 condMapEmpty!24031) mapIsEmpty!24031))

(assert (= (and b!824570 (not condMapEmpty!24031)) mapNonEmpty!24031))

(get-info :version)

(assert (= (and mapNonEmpty!24031 ((_ is ValueCellFull!7055) mapValue!24031)) b!824567))

(assert (= (and b!824570 ((_ is ValueCellFull!7055) mapDefault!24031)) b!824569))

(assert (= start!71008 b!824570))

(declare-fun m!766085 () Bool)

(assert (=> b!824566 m!766085))

(declare-fun m!766087 () Bool)

(assert (=> b!824571 m!766087))

(declare-fun m!766089 () Bool)

(assert (=> b!824573 m!766089))

(declare-fun m!766091 () Bool)

(assert (=> start!71008 m!766091))

(declare-fun m!766093 () Bool)

(assert (=> start!71008 m!766093))

(declare-fun m!766095 () Bool)

(assert (=> start!71008 m!766095))

(declare-fun m!766097 () Bool)

(assert (=> b!824572 m!766097))

(declare-fun m!766099 () Bool)

(assert (=> b!824572 m!766099))

(declare-fun m!766101 () Bool)

(assert (=> b!824572 m!766101))

(declare-fun m!766103 () Bool)

(assert (=> mapNonEmpty!24031 m!766103))

(check-sat b_and!22109 (not start!71008) (not b_next!13231) (not b!824566) (not b!824571) (not b!824572) (not mapNonEmpty!24031) tp_is_empty!14941 (not b!824573))
(check-sat b_and!22109 (not b_next!13231))
