; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70228 () Bool)

(assert start!70228)

(declare-fun b_free!12621 () Bool)

(declare-fun b_next!12621 () Bool)

(assert (=> start!70228 (= b_free!12621 (not b_next!12621))))

(declare-fun tp!44583 () Bool)

(declare-fun b_and!21409 () Bool)

(assert (=> start!70228 (= tp!44583 b_and!21409)))

(declare-fun b!815895 () Bool)

(declare-fun e!452503 () Bool)

(declare-fun e!452504 () Bool)

(declare-fun mapRes!23083 () Bool)

(assert (=> b!815895 (= e!452503 (and e!452504 mapRes!23083))))

(declare-fun condMapEmpty!23083 () Bool)

(declare-datatypes ((V!24109 0))(
  ( (V!24110 (val!7213 Int)) )
))
(declare-datatypes ((ValueCell!6750 0))(
  ( (ValueCellFull!6750 (v!9640 V!24109)) (EmptyCell!6750) )
))
(declare-datatypes ((array!44862 0))(
  ( (array!44863 (arr!21489 (Array (_ BitVec 32) ValueCell!6750)) (size!21910 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44862)

(declare-fun mapDefault!23083 () ValueCell!6750)

(assert (=> b!815895 (= condMapEmpty!23083 (= (arr!21489 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6750)) mapDefault!23083)))))

(declare-fun res!557098 () Bool)

(declare-fun e!452499 () Bool)

(assert (=> start!70228 (=> (not res!557098) (not e!452499))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70228 (= res!557098 (validMask!0 mask!1312))))

(assert (=> start!70228 e!452499))

(declare-fun tp_is_empty!14331 () Bool)

(assert (=> start!70228 tp_is_empty!14331))

(declare-datatypes ((array!44864 0))(
  ( (array!44865 (arr!21490 (Array (_ BitVec 32) (_ BitVec 64))) (size!21911 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44864)

(declare-fun array_inv!17197 (array!44864) Bool)

(assert (=> start!70228 (array_inv!17197 _keys!976)))

(assert (=> start!70228 true))

(declare-fun array_inv!17198 (array!44862) Bool)

(assert (=> start!70228 (and (array_inv!17198 _values!788) e!452503)))

(assert (=> start!70228 tp!44583))

(declare-fun b!815896 () Bool)

(declare-fun e!452501 () Bool)

(assert (=> b!815896 (= e!452499 (not e!452501))))

(declare-fun res!557099 () Bool)

(assert (=> b!815896 (=> res!557099 e!452501)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!815896 (= res!557099 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9466 0))(
  ( (tuple2!9467 (_1!4744 (_ BitVec 64)) (_2!4744 V!24109)) )
))
(declare-datatypes ((List!15297 0))(
  ( (Nil!15294) (Cons!15293 (h!16422 tuple2!9466) (t!21618 List!15297)) )
))
(declare-datatypes ((ListLongMap!8289 0))(
  ( (ListLongMap!8290 (toList!4160 List!15297)) )
))
(declare-fun lt!365329 () ListLongMap!8289)

(declare-fun lt!365326 () ListLongMap!8289)

(assert (=> b!815896 (= lt!365329 lt!365326)))

(declare-fun zeroValueBefore!34 () V!24109)

(declare-fun zeroValueAfter!34 () V!24109)

(declare-fun minValue!754 () V!24109)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27814 0))(
  ( (Unit!27815) )
))
(declare-fun lt!365330 () Unit!27814)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!318 (array!44864 array!44862 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24109 V!24109 V!24109 V!24109 (_ BitVec 32) Int) Unit!27814)

(assert (=> b!815896 (= lt!365330 (lemmaNoChangeToArrayThenSameMapNoExtras!318 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2208 (array!44864 array!44862 (_ BitVec 32) (_ BitVec 32) V!24109 V!24109 (_ BitVec 32) Int) ListLongMap!8289)

(assert (=> b!815896 (= lt!365326 (getCurrentListMapNoExtraKeys!2208 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815896 (= lt!365329 (getCurrentListMapNoExtraKeys!2208 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815897 () Bool)

(declare-fun e!452502 () Bool)

(assert (=> b!815897 (= e!452502 tp_is_empty!14331)))

(declare-fun mapIsEmpty!23083 () Bool)

(assert (=> mapIsEmpty!23083 mapRes!23083))

(declare-fun mapNonEmpty!23083 () Bool)

(declare-fun tp!44584 () Bool)

(assert (=> mapNonEmpty!23083 (= mapRes!23083 (and tp!44584 e!452502))))

(declare-fun mapRest!23083 () (Array (_ BitVec 32) ValueCell!6750))

(declare-fun mapValue!23083 () ValueCell!6750)

(declare-fun mapKey!23083 () (_ BitVec 32))

(assert (=> mapNonEmpty!23083 (= (arr!21489 _values!788) (store mapRest!23083 mapKey!23083 mapValue!23083))))

(declare-fun b!815898 () Bool)

(declare-fun res!557095 () Bool)

(assert (=> b!815898 (=> (not res!557095) (not e!452499))))

(declare-datatypes ((List!15298 0))(
  ( (Nil!15295) (Cons!15294 (h!16423 (_ BitVec 64)) (t!21619 List!15298)) )
))
(declare-fun arrayNoDuplicates!0 (array!44864 (_ BitVec 32) List!15298) Bool)

(assert (=> b!815898 (= res!557095 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15295))))

(declare-fun b!815899 () Bool)

(declare-fun res!557097 () Bool)

(assert (=> b!815899 (=> (not res!557097) (not e!452499))))

(assert (=> b!815899 (= res!557097 (and (= (size!21910 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21911 _keys!976) (size!21910 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815900 () Bool)

(declare-fun res!557096 () Bool)

(assert (=> b!815900 (=> (not res!557096) (not e!452499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44864 (_ BitVec 32)) Bool)

(assert (=> b!815900 (= res!557096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815901 () Bool)

(assert (=> b!815901 (= e!452504 tp_is_empty!14331)))

(declare-fun b!815902 () Bool)

(assert (=> b!815902 (= e!452501 true)))

(declare-fun lt!365328 () ListLongMap!8289)

(declare-fun getCurrentListMap!2388 (array!44864 array!44862 (_ BitVec 32) (_ BitVec 32) V!24109 V!24109 (_ BitVec 32) Int) ListLongMap!8289)

(assert (=> b!815902 (= lt!365328 (getCurrentListMap!2388 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365327 () ListLongMap!8289)

(declare-fun +!1794 (ListLongMap!8289 tuple2!9466) ListLongMap!8289)

(assert (=> b!815902 (= lt!365327 (+!1794 (getCurrentListMap!2388 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9467 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and start!70228 res!557098) b!815899))

(assert (= (and b!815899 res!557097) b!815900))

(assert (= (and b!815900 res!557096) b!815898))

(assert (= (and b!815898 res!557095) b!815896))

(assert (= (and b!815896 (not res!557099)) b!815902))

(assert (= (and b!815895 condMapEmpty!23083) mapIsEmpty!23083))

(assert (= (and b!815895 (not condMapEmpty!23083)) mapNonEmpty!23083))

(get-info :version)

(assert (= (and mapNonEmpty!23083 ((_ is ValueCellFull!6750) mapValue!23083)) b!815897))

(assert (= (and b!815895 ((_ is ValueCellFull!6750) mapDefault!23083)) b!815901))

(assert (= start!70228 b!815895))

(declare-fun m!757541 () Bool)

(assert (=> b!815898 m!757541))

(declare-fun m!757543 () Bool)

(assert (=> b!815902 m!757543))

(declare-fun m!757545 () Bool)

(assert (=> b!815902 m!757545))

(assert (=> b!815902 m!757545))

(declare-fun m!757547 () Bool)

(assert (=> b!815902 m!757547))

(declare-fun m!757549 () Bool)

(assert (=> mapNonEmpty!23083 m!757549))

(declare-fun m!757551 () Bool)

(assert (=> b!815896 m!757551))

(declare-fun m!757553 () Bool)

(assert (=> b!815896 m!757553))

(declare-fun m!757555 () Bool)

(assert (=> b!815896 m!757555))

(declare-fun m!757557 () Bool)

(assert (=> b!815900 m!757557))

(declare-fun m!757559 () Bool)

(assert (=> start!70228 m!757559))

(declare-fun m!757561 () Bool)

(assert (=> start!70228 m!757561))

(declare-fun m!757563 () Bool)

(assert (=> start!70228 m!757563))

(check-sat (not start!70228) tp_is_empty!14331 (not mapNonEmpty!23083) (not b!815900) (not b_next!12621) (not b!815898) b_and!21409 (not b!815902) (not b!815896))
(check-sat b_and!21409 (not b_next!12621))
