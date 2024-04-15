; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71116 () Bool)

(assert start!71116)

(declare-fun b_free!13303 () Bool)

(declare-fun b_next!13303 () Bool)

(assert (=> start!71116 (= b_free!13303 (not b_next!13303))))

(declare-fun tp!46668 () Bool)

(declare-fun b_and!22203 () Bool)

(assert (=> start!71116 (= tp!46668 b_and!22203)))

(declare-fun mapNonEmpty!24145 () Bool)

(declare-fun mapRes!24145 () Bool)

(declare-fun tp!46669 () Bool)

(declare-fun e!459873 () Bool)

(assert (=> mapNonEmpty!24145 (= mapRes!24145 (and tp!46669 e!459873))))

(declare-datatypes ((V!25019 0))(
  ( (V!25020 (val!7554 Int)) )
))
(declare-datatypes ((ValueCell!7091 0))(
  ( (ValueCellFull!7091 (v!9982 V!25019)) (EmptyCell!7091) )
))
(declare-datatypes ((array!46173 0))(
  ( (array!46174 (arr!22132 (Array (_ BitVec 32) ValueCell!7091)) (size!22553 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46173)

(declare-fun mapKey!24145 () (_ BitVec 32))

(declare-fun mapRest!24145 () (Array (_ BitVec 32) ValueCell!7091))

(declare-fun mapValue!24145 () ValueCell!7091)

(assert (=> mapNonEmpty!24145 (= (arr!22132 _values!788) (store mapRest!24145 mapKey!24145 mapValue!24145))))

(declare-fun b!825968 () Bool)

(declare-fun res!563097 () Bool)

(declare-fun e!459876 () Bool)

(assert (=> b!825968 (=> (not res!563097) (not e!459876))))

(declare-datatypes ((array!46175 0))(
  ( (array!46176 (arr!22133 (Array (_ BitVec 32) (_ BitVec 64))) (size!22554 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46175)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46175 (_ BitVec 32)) Bool)

(assert (=> b!825968 (= res!563097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825969 () Bool)

(declare-fun zeroValueAfter!34 () V!25019)

(declare-datatypes ((tuple2!10012 0))(
  ( (tuple2!10013 (_1!5017 (_ BitVec 64)) (_2!5017 V!25019)) )
))
(declare-datatypes ((List!15805 0))(
  ( (Nil!15802) (Cons!15801 (h!16930 tuple2!10012) (t!22143 List!15805)) )
))
(declare-datatypes ((ListLongMap!8825 0))(
  ( (ListLongMap!8826 (toList!4428 List!15805)) )
))
(declare-fun lt!373414 () ListLongMap!8825)

(declare-fun lt!373409 () ListLongMap!8825)

(declare-fun lt!373405 () tuple2!10012)

(declare-fun e!459874 () Bool)

(declare-fun +!1964 (ListLongMap!8825 tuple2!10012) ListLongMap!8825)

(assert (=> b!825969 (= e!459874 (= lt!373409 (+!1964 (+!1964 lt!373414 (tuple2!10013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373405)))))

(declare-fun b!825970 () Bool)

(declare-fun e!459875 () Bool)

(assert (=> b!825970 (= e!459876 (not e!459875))))

(declare-fun res!563095 () Bool)

(assert (=> b!825970 (=> res!563095 e!459875)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825970 (= res!563095 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!373406 () ListLongMap!8825)

(assert (=> b!825970 (= lt!373406 lt!373414)))

(declare-fun zeroValueBefore!34 () V!25019)

(declare-fun minValue!754 () V!25019)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28271 0))(
  ( (Unit!28272) )
))
(declare-fun lt!373404 () Unit!28271)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!558 (array!46175 array!46173 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25019 V!25019 V!25019 V!25019 (_ BitVec 32) Int) Unit!28271)

(assert (=> b!825970 (= lt!373404 (lemmaNoChangeToArrayThenSameMapNoExtras!558 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2465 (array!46175 array!46173 (_ BitVec 32) (_ BitVec 32) V!25019 V!25019 (_ BitVec 32) Int) ListLongMap!8825)

(assert (=> b!825970 (= lt!373414 (getCurrentListMapNoExtraKeys!2465 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825970 (= lt!373406 (getCurrentListMapNoExtraKeys!2465 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825971 () Bool)

(declare-fun e!459877 () Bool)

(declare-fun e!459870 () Bool)

(assert (=> b!825971 (= e!459877 (and e!459870 mapRes!24145))))

(declare-fun condMapEmpty!24145 () Bool)

(declare-fun mapDefault!24145 () ValueCell!7091)

(assert (=> b!825971 (= condMapEmpty!24145 (= (arr!22132 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7091)) mapDefault!24145)))))

(declare-fun b!825972 () Bool)

(declare-fun res!563093 () Bool)

(assert (=> b!825972 (=> (not res!563093) (not e!459876))))

(assert (=> b!825972 (= res!563093 (and (= (size!22553 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22554 _keys!976) (size!22553 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825973 () Bool)

(declare-fun tp_is_empty!15013 () Bool)

(assert (=> b!825973 (= e!459870 tp_is_empty!15013)))

(declare-fun b!825974 () Bool)

(declare-fun res!563099 () Bool)

(assert (=> b!825974 (=> (not res!563099) (not e!459876))))

(declare-datatypes ((List!15806 0))(
  ( (Nil!15803) (Cons!15802 (h!16931 (_ BitVec 64)) (t!22144 List!15806)) )
))
(declare-fun arrayNoDuplicates!0 (array!46175 (_ BitVec 32) List!15806) Bool)

(assert (=> b!825974 (= res!563099 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15803))))

(declare-fun b!825975 () Bool)

(assert (=> b!825975 (= e!459875 true)))

(declare-fun lt!373416 () tuple2!10012)

(declare-fun lt!373412 () ListLongMap!8825)

(assert (=> b!825975 (= lt!373412 (+!1964 (+!1964 lt!373406 lt!373416) lt!373405))))

(declare-fun lt!373408 () ListLongMap!8825)

(declare-fun lt!373413 () ListLongMap!8825)

(assert (=> b!825975 (and (= lt!373408 lt!373413) (= lt!373409 lt!373413) (= lt!373409 lt!373408))))

(declare-fun lt!373417 () ListLongMap!8825)

(assert (=> b!825975 (= lt!373413 (+!1964 lt!373417 lt!373416))))

(declare-fun lt!373410 () ListLongMap!8825)

(assert (=> b!825975 (= lt!373408 (+!1964 lt!373410 lt!373416))))

(declare-fun lt!373407 () Unit!28271)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!230 (ListLongMap!8825 (_ BitVec 64) V!25019 V!25019) Unit!28271)

(assert (=> b!825975 (= lt!373407 (addSameAsAddTwiceSameKeyDiffValues!230 lt!373410 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459871 () Bool)

(assert (=> b!825975 e!459871))

(declare-fun res!563098 () Bool)

(assert (=> b!825975 (=> (not res!563098) (not e!459871))))

(declare-fun lt!373411 () ListLongMap!8825)

(assert (=> b!825975 (= res!563098 (= lt!373411 lt!373417))))

(declare-fun lt!373415 () tuple2!10012)

(assert (=> b!825975 (= lt!373417 (+!1964 lt!373410 lt!373415))))

(assert (=> b!825975 (= lt!373410 (+!1964 lt!373406 lt!373405))))

(assert (=> b!825975 (= lt!373416 (tuple2!10013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!825975 e!459874))

(declare-fun res!563094 () Bool)

(assert (=> b!825975 (=> (not res!563094) (not e!459874))))

(assert (=> b!825975 (= res!563094 (= lt!373411 (+!1964 (+!1964 lt!373406 lt!373415) lt!373405)))))

(assert (=> b!825975 (= lt!373405 (tuple2!10013 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825975 (= lt!373415 (tuple2!10013 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2513 (array!46175 array!46173 (_ BitVec 32) (_ BitVec 32) V!25019 V!25019 (_ BitVec 32) Int) ListLongMap!8825)

(assert (=> b!825975 (= lt!373409 (getCurrentListMap!2513 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825975 (= lt!373411 (getCurrentListMap!2513 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825976 () Bool)

(assert (=> b!825976 (= e!459873 tp_is_empty!15013)))

(declare-fun b!825977 () Bool)

(assert (=> b!825977 (= e!459871 (= lt!373409 (+!1964 (+!1964 lt!373414 lt!373405) lt!373416)))))

(declare-fun res!563096 () Bool)

(assert (=> start!71116 (=> (not res!563096) (not e!459876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71116 (= res!563096 (validMask!0 mask!1312))))

(assert (=> start!71116 e!459876))

(assert (=> start!71116 tp_is_empty!15013))

(declare-fun array_inv!17711 (array!46175) Bool)

(assert (=> start!71116 (array_inv!17711 _keys!976)))

(assert (=> start!71116 true))

(declare-fun array_inv!17712 (array!46173) Bool)

(assert (=> start!71116 (and (array_inv!17712 _values!788) e!459877)))

(assert (=> start!71116 tp!46668))

(declare-fun mapIsEmpty!24145 () Bool)

(assert (=> mapIsEmpty!24145 mapRes!24145))

(assert (= (and start!71116 res!563096) b!825972))

(assert (= (and b!825972 res!563093) b!825968))

(assert (= (and b!825968 res!563097) b!825974))

(assert (= (and b!825974 res!563099) b!825970))

(assert (= (and b!825970 (not res!563095)) b!825975))

(assert (= (and b!825975 res!563094) b!825969))

(assert (= (and b!825975 res!563098) b!825977))

(assert (= (and b!825971 condMapEmpty!24145) mapIsEmpty!24145))

(assert (= (and b!825971 (not condMapEmpty!24145)) mapNonEmpty!24145))

(get-info :version)

(assert (= (and mapNonEmpty!24145 ((_ is ValueCellFull!7091) mapValue!24145)) b!825976))

(assert (= (and b!825971 ((_ is ValueCellFull!7091) mapDefault!24145)) b!825973))

(assert (= start!71116 b!825971))

(declare-fun m!768067 () Bool)

(assert (=> b!825977 m!768067))

(assert (=> b!825977 m!768067))

(declare-fun m!768069 () Bool)

(assert (=> b!825977 m!768069))

(declare-fun m!768071 () Bool)

(assert (=> b!825975 m!768071))

(declare-fun m!768073 () Bool)

(assert (=> b!825975 m!768073))

(assert (=> b!825975 m!768071))

(declare-fun m!768075 () Bool)

(assert (=> b!825975 m!768075))

(declare-fun m!768077 () Bool)

(assert (=> b!825975 m!768077))

(declare-fun m!768079 () Bool)

(assert (=> b!825975 m!768079))

(declare-fun m!768081 () Bool)

(assert (=> b!825975 m!768081))

(declare-fun m!768083 () Bool)

(assert (=> b!825975 m!768083))

(declare-fun m!768085 () Bool)

(assert (=> b!825975 m!768085))

(declare-fun m!768087 () Bool)

(assert (=> b!825975 m!768087))

(assert (=> b!825975 m!768077))

(declare-fun m!768089 () Bool)

(assert (=> b!825975 m!768089))

(declare-fun m!768091 () Bool)

(assert (=> b!825975 m!768091))

(declare-fun m!768093 () Bool)

(assert (=> start!71116 m!768093))

(declare-fun m!768095 () Bool)

(assert (=> start!71116 m!768095))

(declare-fun m!768097 () Bool)

(assert (=> start!71116 m!768097))

(declare-fun m!768099 () Bool)

(assert (=> b!825970 m!768099))

(declare-fun m!768101 () Bool)

(assert (=> b!825970 m!768101))

(declare-fun m!768103 () Bool)

(assert (=> b!825970 m!768103))

(declare-fun m!768105 () Bool)

(assert (=> mapNonEmpty!24145 m!768105))

(declare-fun m!768107 () Bool)

(assert (=> b!825968 m!768107))

(declare-fun m!768109 () Bool)

(assert (=> b!825974 m!768109))

(declare-fun m!768111 () Bool)

(assert (=> b!825969 m!768111))

(assert (=> b!825969 m!768111))

(declare-fun m!768113 () Bool)

(assert (=> b!825969 m!768113))

(check-sat (not b!825970) (not b_next!13303) (not b!825977) (not b!825974) (not mapNonEmpty!24145) b_and!22203 tp_is_empty!15013 (not b!825969) (not b!825968) (not start!71116) (not b!825975))
(check-sat b_and!22203 (not b_next!13303))
