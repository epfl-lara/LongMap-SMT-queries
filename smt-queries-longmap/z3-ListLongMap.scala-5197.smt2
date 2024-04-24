; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70362 () Bool)

(assert start!70362)

(declare-fun b_free!12589 () Bool)

(declare-fun b_next!12589 () Bool)

(assert (=> start!70362 (= b_free!12589 (not b_next!12589))))

(declare-fun tp!44487 () Bool)

(declare-fun b_and!21387 () Bool)

(assert (=> start!70362 (= tp!44487 b_and!21387)))

(declare-fun mapIsEmpty!23035 () Bool)

(declare-fun mapRes!23035 () Bool)

(assert (=> mapIsEmpty!23035 mapRes!23035))

(declare-fun b!816405 () Bool)

(declare-fun e!452793 () Bool)

(declare-fun tp_is_empty!14299 () Bool)

(assert (=> b!816405 (= e!452793 tp_is_empty!14299)))

(declare-fun b!816406 () Bool)

(declare-fun res!557202 () Bool)

(declare-fun e!452790 () Bool)

(assert (=> b!816406 (=> (not res!557202) (not e!452790))))

(declare-datatypes ((array!44799 0))(
  ( (array!44800 (arr!21453 (Array (_ BitVec 32) (_ BitVec 64))) (size!21873 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44799)

(declare-datatypes ((List!15175 0))(
  ( (Nil!15172) (Cons!15171 (h!16306 (_ BitVec 64)) (t!21488 List!15175)) )
))
(declare-fun arrayNoDuplicates!0 (array!44799 (_ BitVec 32) List!15175) Bool)

(assert (=> b!816406 (= res!557202 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15172))))

(declare-fun res!557204 () Bool)

(assert (=> start!70362 (=> (not res!557204) (not e!452790))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70362 (= res!557204 (validMask!0 mask!1312))))

(assert (=> start!70362 e!452790))

(assert (=> start!70362 tp_is_empty!14299))

(declare-fun array_inv!17205 (array!44799) Bool)

(assert (=> start!70362 (array_inv!17205 _keys!976)))

(assert (=> start!70362 true))

(declare-datatypes ((V!24067 0))(
  ( (V!24068 (val!7197 Int)) )
))
(declare-datatypes ((ValueCell!6734 0))(
  ( (ValueCellFull!6734 (v!9624 V!24067)) (EmptyCell!6734) )
))
(declare-datatypes ((array!44801 0))(
  ( (array!44802 (arr!21454 (Array (_ BitVec 32) ValueCell!6734)) (size!21874 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44801)

(declare-fun e!452791 () Bool)

(declare-fun array_inv!17206 (array!44801) Bool)

(assert (=> start!70362 (and (array_inv!17206 _values!788) e!452791)))

(assert (=> start!70362 tp!44487))

(declare-fun mapNonEmpty!23035 () Bool)

(declare-fun tp!44488 () Bool)

(declare-fun e!452792 () Bool)

(assert (=> mapNonEmpty!23035 (= mapRes!23035 (and tp!44488 e!452792))))

(declare-fun mapRest!23035 () (Array (_ BitVec 32) ValueCell!6734))

(declare-fun mapKey!23035 () (_ BitVec 32))

(declare-fun mapValue!23035 () ValueCell!6734)

(assert (=> mapNonEmpty!23035 (= (arr!21454 _values!788) (store mapRest!23035 mapKey!23035 mapValue!23035))))

(declare-fun b!816407 () Bool)

(assert (=> b!816407 (= e!452792 tp_is_empty!14299)))

(declare-fun b!816408 () Bool)

(declare-fun res!557205 () Bool)

(assert (=> b!816408 (=> (not res!557205) (not e!452790))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816408 (= res!557205 (and (= (size!21874 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21873 _keys!976) (size!21874 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816409 () Bool)

(assert (=> b!816409 (= e!452791 (and e!452793 mapRes!23035))))

(declare-fun condMapEmpty!23035 () Bool)

(declare-fun mapDefault!23035 () ValueCell!6734)

(assert (=> b!816409 (= condMapEmpty!23035 (= (arr!21454 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6734)) mapDefault!23035)))))

(declare-fun b!816410 () Bool)

(declare-fun e!452794 () Bool)

(assert (=> b!816410 (= e!452794 true)))

(declare-fun zeroValueAfter!34 () V!24067)

(declare-fun minValue!754 () V!24067)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9360 0))(
  ( (tuple2!9361 (_1!4691 (_ BitVec 64)) (_2!4691 V!24067)) )
))
(declare-datatypes ((List!15176 0))(
  ( (Nil!15173) (Cons!15172 (h!16307 tuple2!9360) (t!21489 List!15176)) )
))
(declare-datatypes ((ListLongMap!8185 0))(
  ( (ListLongMap!8186 (toList!4108 List!15176)) )
))
(declare-fun lt!365441 () ListLongMap!8185)

(declare-fun getCurrentListMap!2329 (array!44799 array!44801 (_ BitVec 32) (_ BitVec 32) V!24067 V!24067 (_ BitVec 32) Int) ListLongMap!8185)

(assert (=> b!816410 (= lt!365441 (getCurrentListMap!2329 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365444 () ListLongMap!8185)

(declare-fun zeroValueBefore!34 () V!24067)

(declare-fun +!1789 (ListLongMap!8185 tuple2!9360) ListLongMap!8185)

(assert (=> b!816410 (= lt!365444 (+!1789 (getCurrentListMap!2329 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9361 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816411 () Bool)

(declare-fun res!557201 () Bool)

(assert (=> b!816411 (=> (not res!557201) (not e!452790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44799 (_ BitVec 32)) Bool)

(assert (=> b!816411 (= res!557201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816412 () Bool)

(assert (=> b!816412 (= e!452790 (not e!452794))))

(declare-fun res!557203 () Bool)

(assert (=> b!816412 (=> res!557203 e!452794)))

(assert (=> b!816412 (= res!557203 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365440 () ListLongMap!8185)

(declare-fun lt!365443 () ListLongMap!8185)

(assert (=> b!816412 (= lt!365440 lt!365443)))

(declare-datatypes ((Unit!27783 0))(
  ( (Unit!27784) )
))
(declare-fun lt!365442 () Unit!27783)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!303 (array!44799 array!44801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24067 V!24067 V!24067 V!24067 (_ BitVec 32) Int) Unit!27783)

(assert (=> b!816412 (= lt!365442 (lemmaNoChangeToArrayThenSameMapNoExtras!303 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2215 (array!44799 array!44801 (_ BitVec 32) (_ BitVec 32) V!24067 V!24067 (_ BitVec 32) Int) ListLongMap!8185)

(assert (=> b!816412 (= lt!365443 (getCurrentListMapNoExtraKeys!2215 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816412 (= lt!365440 (getCurrentListMapNoExtraKeys!2215 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70362 res!557204) b!816408))

(assert (= (and b!816408 res!557205) b!816411))

(assert (= (and b!816411 res!557201) b!816406))

(assert (= (and b!816406 res!557202) b!816412))

(assert (= (and b!816412 (not res!557203)) b!816410))

(assert (= (and b!816409 condMapEmpty!23035) mapIsEmpty!23035))

(assert (= (and b!816409 (not condMapEmpty!23035)) mapNonEmpty!23035))

(get-info :version)

(assert (= (and mapNonEmpty!23035 ((_ is ValueCellFull!6734) mapValue!23035)) b!816407))

(assert (= (and b!816409 ((_ is ValueCellFull!6734) mapDefault!23035)) b!816405))

(assert (= start!70362 b!816409))

(declare-fun m!758439 () Bool)

(assert (=> mapNonEmpty!23035 m!758439))

(declare-fun m!758441 () Bool)

(assert (=> b!816412 m!758441))

(declare-fun m!758443 () Bool)

(assert (=> b!816412 m!758443))

(declare-fun m!758445 () Bool)

(assert (=> b!816412 m!758445))

(declare-fun m!758447 () Bool)

(assert (=> start!70362 m!758447))

(declare-fun m!758449 () Bool)

(assert (=> start!70362 m!758449))

(declare-fun m!758451 () Bool)

(assert (=> start!70362 m!758451))

(declare-fun m!758453 () Bool)

(assert (=> b!816406 m!758453))

(declare-fun m!758455 () Bool)

(assert (=> b!816410 m!758455))

(declare-fun m!758457 () Bool)

(assert (=> b!816410 m!758457))

(assert (=> b!816410 m!758457))

(declare-fun m!758459 () Bool)

(assert (=> b!816410 m!758459))

(declare-fun m!758461 () Bool)

(assert (=> b!816411 m!758461))

(check-sat (not start!70362) (not b!816412) tp_is_empty!14299 b_and!21387 (not b!816411) (not mapNonEmpty!23035) (not b!816410) (not b_next!12589) (not b!816406))
(check-sat b_and!21387 (not b_next!12589))
