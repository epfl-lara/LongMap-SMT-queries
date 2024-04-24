; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70650 () Bool)

(assert start!70650)

(declare-fun b_free!12811 () Bool)

(declare-fun b_next!12811 () Bool)

(assert (=> start!70650 (= b_free!12811 (not b_next!12811))))

(declare-fun tp!45165 () Bool)

(declare-fun b_and!21651 () Bool)

(assert (=> start!70650 (= tp!45165 b_and!21651)))

(declare-fun res!559054 () Bool)

(declare-fun e!455092 () Bool)

(assert (=> start!70650 (=> (not res!559054) (not e!455092))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70650 (= res!559054 (validMask!0 mask!1312))))

(assert (=> start!70650 e!455092))

(declare-fun tp_is_empty!14521 () Bool)

(assert (=> start!70650 tp_is_empty!14521))

(declare-datatypes ((array!45243 0))(
  ( (array!45244 (arr!21671 (Array (_ BitVec 32) (_ BitVec 64))) (size!22091 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45243)

(declare-fun array_inv!17355 (array!45243) Bool)

(assert (=> start!70650 (array_inv!17355 _keys!976)))

(assert (=> start!70650 true))

(declare-datatypes ((V!24363 0))(
  ( (V!24364 (val!7308 Int)) )
))
(declare-datatypes ((ValueCell!6845 0))(
  ( (ValueCellFull!6845 (v!9737 V!24363)) (EmptyCell!6845) )
))
(declare-datatypes ((array!45245 0))(
  ( (array!45246 (arr!21672 (Array (_ BitVec 32) ValueCell!6845)) (size!22092 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45245)

(declare-fun e!455090 () Bool)

(declare-fun array_inv!17356 (array!45245) Bool)

(assert (=> start!70650 (and (array_inv!17356 _values!788) e!455090)))

(assert (=> start!70650 tp!45165))

(declare-fun b!819600 () Bool)

(declare-fun e!455086 () Bool)

(assert (=> b!819600 (= e!455086 tp_is_empty!14521)))

(declare-fun mapNonEmpty!23380 () Bool)

(declare-fun mapRes!23380 () Bool)

(declare-fun tp!45166 () Bool)

(declare-fun e!455087 () Bool)

(assert (=> mapNonEmpty!23380 (= mapRes!23380 (and tp!45166 e!455087))))

(declare-fun mapKey!23380 () (_ BitVec 32))

(declare-fun mapValue!23380 () ValueCell!6845)

(declare-fun mapRest!23380 () (Array (_ BitVec 32) ValueCell!6845))

(assert (=> mapNonEmpty!23380 (= (arr!21672 _values!788) (store mapRest!23380 mapKey!23380 mapValue!23380))))

(declare-fun b!819601 () Bool)

(declare-fun e!455091 () Bool)

(assert (=> b!819601 (= e!455092 (not e!455091))))

(declare-fun res!559051 () Bool)

(assert (=> b!819601 (=> res!559051 e!455091)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819601 (= res!559051 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9520 0))(
  ( (tuple2!9521 (_1!4771 (_ BitVec 64)) (_2!4771 V!24363)) )
))
(declare-datatypes ((List!15329 0))(
  ( (Nil!15326) (Cons!15325 (h!16460 tuple2!9520) (t!21650 List!15329)) )
))
(declare-datatypes ((ListLongMap!8345 0))(
  ( (ListLongMap!8346 (toList!4188 List!15329)) )
))
(declare-fun lt!367313 () ListLongMap!8345)

(declare-fun lt!367315 () ListLongMap!8345)

(assert (=> b!819601 (= lt!367313 lt!367315)))

(declare-fun zeroValueBefore!34 () V!24363)

(declare-fun zeroValueAfter!34 () V!24363)

(declare-fun minValue!754 () V!24363)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27928 0))(
  ( (Unit!27929) )
))
(declare-fun lt!367309 () Unit!27928)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!373 (array!45243 array!45245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24363 V!24363 V!24363 V!24363 (_ BitVec 32) Int) Unit!27928)

(assert (=> b!819601 (= lt!367309 (lemmaNoChangeToArrayThenSameMapNoExtras!373 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2285 (array!45243 array!45245 (_ BitVec 32) (_ BitVec 32) V!24363 V!24363 (_ BitVec 32) Int) ListLongMap!8345)

(assert (=> b!819601 (= lt!367315 (getCurrentListMapNoExtraKeys!2285 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819601 (= lt!367313 (getCurrentListMapNoExtraKeys!2285 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819602 () Bool)

(assert (=> b!819602 (= e!455090 (and e!455086 mapRes!23380))))

(declare-fun condMapEmpty!23380 () Bool)

(declare-fun mapDefault!23380 () ValueCell!6845)

(assert (=> b!819602 (= condMapEmpty!23380 (= (arr!21672 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6845)) mapDefault!23380)))))

(declare-fun b!819603 () Bool)

(declare-fun res!559049 () Bool)

(assert (=> b!819603 (=> (not res!559049) (not e!455092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45243 (_ BitVec 32)) Bool)

(assert (=> b!819603 (= res!559049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!819604 () Bool)

(declare-fun res!559053 () Bool)

(assert (=> b!819604 (=> (not res!559053) (not e!455092))))

(declare-datatypes ((List!15330 0))(
  ( (Nil!15327) (Cons!15326 (h!16461 (_ BitVec 64)) (t!21651 List!15330)) )
))
(declare-fun arrayNoDuplicates!0 (array!45243 (_ BitVec 32) List!15330) Bool)

(assert (=> b!819604 (= res!559053 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15327))))

(declare-fun mapIsEmpty!23380 () Bool)

(assert (=> mapIsEmpty!23380 mapRes!23380))

(declare-fun b!819605 () Bool)

(declare-fun e!455089 () Bool)

(declare-fun lt!367312 () ListLongMap!8345)

(declare-fun +!1827 (ListLongMap!8345 tuple2!9520) ListLongMap!8345)

(assert (=> b!819605 (= e!455089 (= lt!367312 (+!1827 lt!367315 (tuple2!9521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!819606 () Bool)

(declare-fun res!559052 () Bool)

(assert (=> b!819606 (=> (not res!559052) (not e!455092))))

(assert (=> b!819606 (= res!559052 (and (= (size!22092 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22091 _keys!976) (size!22092 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819607 () Bool)

(assert (=> b!819607 (= e!455091 true)))

(declare-fun lt!367314 () ListLongMap!8345)

(declare-fun lt!367308 () tuple2!9520)

(declare-fun lt!367311 () tuple2!9520)

(assert (=> b!819607 (= lt!367314 (+!1827 (+!1827 lt!367315 lt!367311) lt!367308))))

(declare-fun lt!367310 () ListLongMap!8345)

(assert (=> b!819607 (= (+!1827 lt!367313 lt!367308) (+!1827 lt!367310 lt!367308))))

(declare-fun lt!367316 () Unit!27928)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!169 (ListLongMap!8345 (_ BitVec 64) V!24363 V!24363) Unit!27928)

(assert (=> b!819607 (= lt!367316 (addSameAsAddTwiceSameKeyDiffValues!169 lt!367313 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819607 (= lt!367308 (tuple2!9521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!819607 e!455089))

(declare-fun res!559050 () Bool)

(assert (=> b!819607 (=> (not res!559050) (not e!455089))))

(declare-fun lt!367307 () ListLongMap!8345)

(assert (=> b!819607 (= res!559050 (= lt!367307 lt!367310))))

(assert (=> b!819607 (= lt!367310 (+!1827 lt!367313 lt!367311))))

(assert (=> b!819607 (= lt!367311 (tuple2!9521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2382 (array!45243 array!45245 (_ BitVec 32) (_ BitVec 32) V!24363 V!24363 (_ BitVec 32) Int) ListLongMap!8345)

(assert (=> b!819607 (= lt!367312 (getCurrentListMap!2382 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819607 (= lt!367307 (getCurrentListMap!2382 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819608 () Bool)

(assert (=> b!819608 (= e!455087 tp_is_empty!14521)))

(assert (= (and start!70650 res!559054) b!819606))

(assert (= (and b!819606 res!559052) b!819603))

(assert (= (and b!819603 res!559049) b!819604))

(assert (= (and b!819604 res!559053) b!819601))

(assert (= (and b!819601 (not res!559051)) b!819607))

(assert (= (and b!819607 res!559050) b!819605))

(assert (= (and b!819602 condMapEmpty!23380) mapIsEmpty!23380))

(assert (= (and b!819602 (not condMapEmpty!23380)) mapNonEmpty!23380))

(get-info :version)

(assert (= (and mapNonEmpty!23380 ((_ is ValueCellFull!6845) mapValue!23380)) b!819608))

(assert (= (and b!819602 ((_ is ValueCellFull!6845) mapDefault!23380)) b!819600))

(assert (= start!70650 b!819602))

(declare-fun m!761387 () Bool)

(assert (=> b!819605 m!761387))

(declare-fun m!761389 () Bool)

(assert (=> b!819607 m!761389))

(declare-fun m!761391 () Bool)

(assert (=> b!819607 m!761391))

(declare-fun m!761393 () Bool)

(assert (=> b!819607 m!761393))

(declare-fun m!761395 () Bool)

(assert (=> b!819607 m!761395))

(declare-fun m!761397 () Bool)

(assert (=> b!819607 m!761397))

(declare-fun m!761399 () Bool)

(assert (=> b!819607 m!761399))

(declare-fun m!761401 () Bool)

(assert (=> b!819607 m!761401))

(assert (=> b!819607 m!761393))

(declare-fun m!761403 () Bool)

(assert (=> b!819607 m!761403))

(declare-fun m!761405 () Bool)

(assert (=> b!819601 m!761405))

(declare-fun m!761407 () Bool)

(assert (=> b!819601 m!761407))

(declare-fun m!761409 () Bool)

(assert (=> b!819601 m!761409))

(declare-fun m!761411 () Bool)

(assert (=> b!819603 m!761411))

(declare-fun m!761413 () Bool)

(assert (=> start!70650 m!761413))

(declare-fun m!761415 () Bool)

(assert (=> start!70650 m!761415))

(declare-fun m!761417 () Bool)

(assert (=> start!70650 m!761417))

(declare-fun m!761419 () Bool)

(assert (=> b!819604 m!761419))

(declare-fun m!761421 () Bool)

(assert (=> mapNonEmpty!23380 m!761421))

(check-sat (not b!819601) b_and!21651 (not mapNonEmpty!23380) (not b!819607) (not b!819603) tp_is_empty!14521 (not b!819605) (not b_next!12811) (not start!70650) (not b!819604))
(check-sat b_and!21651 (not b_next!12811))
