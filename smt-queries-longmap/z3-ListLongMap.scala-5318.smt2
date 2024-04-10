; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71150 () Bool)

(assert start!71150)

(declare-fun b_free!13317 () Bool)

(declare-fun b_next!13317 () Bool)

(assert (=> start!71150 (= b_free!13317 (not b_next!13317))))

(declare-fun tp!46711 () Bool)

(declare-fun b_and!22243 () Bool)

(assert (=> start!71150 (= tp!46711 b_and!22243)))

(declare-fun b!826424 () Bool)

(declare-fun res!563349 () Bool)

(declare-fun e!460191 () Bool)

(assert (=> b!826424 (=> (not res!563349) (not e!460191))))

(declare-datatypes ((array!46234 0))(
  ( (array!46235 (arr!22162 (Array (_ BitVec 32) (_ BitVec 64))) (size!22583 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46234)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46234 (_ BitVec 32)) Bool)

(assert (=> b!826424 (= res!563349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!24166 () Bool)

(declare-fun mapRes!24166 () Bool)

(assert (=> mapIsEmpty!24166 mapRes!24166))

(declare-datatypes ((V!25037 0))(
  ( (V!25038 (val!7561 Int)) )
))
(declare-datatypes ((tuple2!10016 0))(
  ( (tuple2!10017 (_1!5019 (_ BitVec 64)) (_2!5019 V!25037)) )
))
(declare-datatypes ((List!15815 0))(
  ( (Nil!15812) (Cons!15811 (h!16940 tuple2!10016) (t!22162 List!15815)) )
))
(declare-datatypes ((ListLongMap!8839 0))(
  ( (ListLongMap!8840 (toList!4435 List!15815)) )
))
(declare-fun lt!373952 () ListLongMap!8839)

(declare-fun lt!373941 () ListLongMap!8839)

(declare-fun lt!373942 () tuple2!10016)

(declare-fun b!826425 () Bool)

(declare-fun lt!373951 () tuple2!10016)

(declare-fun e!460189 () Bool)

(declare-fun +!1942 (ListLongMap!8839 tuple2!10016) ListLongMap!8839)

(assert (=> b!826425 (= e!460189 (= lt!373941 (+!1942 (+!1942 lt!373952 lt!373951) lt!373942)))))

(declare-fun mapNonEmpty!24166 () Bool)

(declare-fun tp!46710 () Bool)

(declare-fun e!460194 () Bool)

(assert (=> mapNonEmpty!24166 (= mapRes!24166 (and tp!46710 e!460194))))

(declare-fun mapKey!24166 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7098 0))(
  ( (ValueCellFull!7098 (v!9995 V!25037)) (EmptyCell!7098) )
))
(declare-fun mapRest!24166 () (Array (_ BitVec 32) ValueCell!7098))

(declare-datatypes ((array!46236 0))(
  ( (array!46237 (arr!22163 (Array (_ BitVec 32) ValueCell!7098)) (size!22584 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46236)

(declare-fun mapValue!24166 () ValueCell!7098)

(assert (=> mapNonEmpty!24166 (= (arr!22163 _values!788) (store mapRest!24166 mapKey!24166 mapValue!24166))))

(declare-fun b!826426 () Bool)

(declare-fun res!563346 () Bool)

(assert (=> b!826426 (=> (not res!563346) (not e!460191))))

(declare-datatypes ((List!15816 0))(
  ( (Nil!15813) (Cons!15812 (h!16941 (_ BitVec 64)) (t!22163 List!15816)) )
))
(declare-fun arrayNoDuplicates!0 (array!46234 (_ BitVec 32) List!15816) Bool)

(assert (=> b!826426 (= res!563346 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15813))))

(declare-fun b!826427 () Bool)

(declare-fun e!460193 () Bool)

(declare-fun e!460190 () Bool)

(assert (=> b!826427 (= e!460193 (and e!460190 mapRes!24166))))

(declare-fun condMapEmpty!24166 () Bool)

(declare-fun mapDefault!24166 () ValueCell!7098)

(assert (=> b!826427 (= condMapEmpty!24166 (= (arr!22163 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7098)) mapDefault!24166)))))

(declare-fun b!826428 () Bool)

(declare-fun e!460192 () Bool)

(assert (=> b!826428 (= e!460191 (not e!460192))))

(declare-fun res!563348 () Bool)

(assert (=> b!826428 (=> res!563348 e!460192)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826428 (= res!563348 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!373945 () ListLongMap!8839)

(assert (=> b!826428 (= lt!373945 lt!373952)))

(declare-fun zeroValueBefore!34 () V!25037)

(declare-fun zeroValueAfter!34 () V!25037)

(declare-fun minValue!754 () V!25037)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28333 0))(
  ( (Unit!28334) )
))
(declare-fun lt!373947 () Unit!28333)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!552 (array!46234 array!46236 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25037 V!25037 V!25037 V!25037 (_ BitVec 32) Int) Unit!28333)

(assert (=> b!826428 (= lt!373947 (lemmaNoChangeToArrayThenSameMapNoExtras!552 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2442 (array!46234 array!46236 (_ BitVec 32) (_ BitVec 32) V!25037 V!25037 (_ BitVec 32) Int) ListLongMap!8839)

(assert (=> b!826428 (= lt!373952 (getCurrentListMapNoExtraKeys!2442 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826428 (= lt!373945 (getCurrentListMapNoExtraKeys!2442 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826429 () Bool)

(assert (=> b!826429 (= e!460192 true)))

(declare-fun lt!373946 () ListLongMap!8839)

(assert (=> b!826429 (= lt!373946 (+!1942 (+!1942 lt!373945 lt!373942) lt!373951))))

(declare-fun lt!373944 () ListLongMap!8839)

(declare-fun lt!373949 () ListLongMap!8839)

(assert (=> b!826429 (and (= lt!373944 lt!373949) (= lt!373941 lt!373949) (= lt!373941 lt!373944))))

(declare-fun lt!373953 () ListLongMap!8839)

(assert (=> b!826429 (= lt!373949 (+!1942 lt!373953 lt!373942))))

(declare-fun lt!373954 () ListLongMap!8839)

(assert (=> b!826429 (= lt!373944 (+!1942 lt!373954 lt!373942))))

(declare-fun lt!373948 () Unit!28333)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!225 (ListLongMap!8839 (_ BitVec 64) V!25037 V!25037) Unit!28333)

(assert (=> b!826429 (= lt!373948 (addSameAsAddTwiceSameKeyDiffValues!225 lt!373954 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826429 e!460189))

(declare-fun res!563352 () Bool)

(assert (=> b!826429 (=> (not res!563352) (not e!460189))))

(declare-fun lt!373950 () ListLongMap!8839)

(assert (=> b!826429 (= res!563352 (= lt!373950 lt!373953))))

(declare-fun lt!373943 () tuple2!10016)

(assert (=> b!826429 (= lt!373953 (+!1942 lt!373954 lt!373943))))

(assert (=> b!826429 (= lt!373954 (+!1942 lt!373945 lt!373951))))

(assert (=> b!826429 (= lt!373942 (tuple2!10017 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460188 () Bool)

(assert (=> b!826429 e!460188))

(declare-fun res!563351 () Bool)

(assert (=> b!826429 (=> (not res!563351) (not e!460188))))

(assert (=> b!826429 (= res!563351 (= lt!373950 (+!1942 (+!1942 lt!373945 lt!373943) lt!373951)))))

(assert (=> b!826429 (= lt!373951 (tuple2!10017 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826429 (= lt!373943 (tuple2!10017 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2565 (array!46234 array!46236 (_ BitVec 32) (_ BitVec 32) V!25037 V!25037 (_ BitVec 32) Int) ListLongMap!8839)

(assert (=> b!826429 (= lt!373941 (getCurrentListMap!2565 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826429 (= lt!373950 (getCurrentListMap!2565 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826430 () Bool)

(declare-fun tp_is_empty!15027 () Bool)

(assert (=> b!826430 (= e!460194 tp_is_empty!15027)))

(declare-fun res!563350 () Bool)

(assert (=> start!71150 (=> (not res!563350) (not e!460191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71150 (= res!563350 (validMask!0 mask!1312))))

(assert (=> start!71150 e!460191))

(assert (=> start!71150 tp_is_empty!15027))

(declare-fun array_inv!17665 (array!46234) Bool)

(assert (=> start!71150 (array_inv!17665 _keys!976)))

(assert (=> start!71150 true))

(declare-fun array_inv!17666 (array!46236) Bool)

(assert (=> start!71150 (and (array_inv!17666 _values!788) e!460193)))

(assert (=> start!71150 tp!46711))

(declare-fun b!826431 () Bool)

(assert (=> b!826431 (= e!460190 tp_is_empty!15027)))

(declare-fun b!826432 () Bool)

(declare-fun res!563347 () Bool)

(assert (=> b!826432 (=> (not res!563347) (not e!460191))))

(assert (=> b!826432 (= res!563347 (and (= (size!22584 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22583 _keys!976) (size!22584 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826433 () Bool)

(assert (=> b!826433 (= e!460188 (= lt!373941 (+!1942 (+!1942 lt!373952 (tuple2!10017 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373951)))))

(assert (= (and start!71150 res!563350) b!826432))

(assert (= (and b!826432 res!563347) b!826424))

(assert (= (and b!826424 res!563349) b!826426))

(assert (= (and b!826426 res!563346) b!826428))

(assert (= (and b!826428 (not res!563348)) b!826429))

(assert (= (and b!826429 res!563351) b!826433))

(assert (= (and b!826429 res!563352) b!826425))

(assert (= (and b!826427 condMapEmpty!24166) mapIsEmpty!24166))

(assert (= (and b!826427 (not condMapEmpty!24166)) mapNonEmpty!24166))

(get-info :version)

(assert (= (and mapNonEmpty!24166 ((_ is ValueCellFull!7098) mapValue!24166)) b!826430))

(assert (= (and b!826427 ((_ is ValueCellFull!7098) mapDefault!24166)) b!826431))

(assert (= start!71150 b!826427))

(declare-fun m!769155 () Bool)

(assert (=> b!826426 m!769155))

(declare-fun m!769157 () Bool)

(assert (=> b!826429 m!769157))

(declare-fun m!769159 () Bool)

(assert (=> b!826429 m!769159))

(declare-fun m!769161 () Bool)

(assert (=> b!826429 m!769161))

(assert (=> b!826429 m!769157))

(declare-fun m!769163 () Bool)

(assert (=> b!826429 m!769163))

(declare-fun m!769165 () Bool)

(assert (=> b!826429 m!769165))

(declare-fun m!769167 () Bool)

(assert (=> b!826429 m!769167))

(declare-fun m!769169 () Bool)

(assert (=> b!826429 m!769169))

(declare-fun m!769171 () Bool)

(assert (=> b!826429 m!769171))

(declare-fun m!769173 () Bool)

(assert (=> b!826429 m!769173))

(declare-fun m!769175 () Bool)

(assert (=> b!826429 m!769175))

(assert (=> b!826429 m!769173))

(declare-fun m!769177 () Bool)

(assert (=> b!826429 m!769177))

(declare-fun m!769179 () Bool)

(assert (=> start!71150 m!769179))

(declare-fun m!769181 () Bool)

(assert (=> start!71150 m!769181))

(declare-fun m!769183 () Bool)

(assert (=> start!71150 m!769183))

(declare-fun m!769185 () Bool)

(assert (=> b!826433 m!769185))

(assert (=> b!826433 m!769185))

(declare-fun m!769187 () Bool)

(assert (=> b!826433 m!769187))

(declare-fun m!769189 () Bool)

(assert (=> b!826424 m!769189))

(declare-fun m!769191 () Bool)

(assert (=> b!826425 m!769191))

(assert (=> b!826425 m!769191))

(declare-fun m!769193 () Bool)

(assert (=> b!826425 m!769193))

(declare-fun m!769195 () Bool)

(assert (=> b!826428 m!769195))

(declare-fun m!769197 () Bool)

(assert (=> b!826428 m!769197))

(declare-fun m!769199 () Bool)

(assert (=> b!826428 m!769199))

(declare-fun m!769201 () Bool)

(assert (=> mapNonEmpty!24166 m!769201))

(check-sat (not b!826428) (not b!826429) (not b!826424) (not start!71150) (not b!826426) (not mapNonEmpty!24166) b_and!22243 (not b!826425) (not b!826433) (not b_next!13317) tp_is_empty!15027)
(check-sat b_and!22243 (not b_next!13317))
