; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70176 () Bool)

(assert start!70176)

(declare-fun b_free!12589 () Bool)

(declare-fun b_next!12589 () Bool)

(assert (=> start!70176 (= b_free!12589 (not b_next!12589))))

(declare-fun tp!44487 () Bool)

(declare-fun b_and!21351 () Bool)

(assert (=> start!70176 (= tp!44487 b_and!21351)))

(declare-fun mapIsEmpty!23035 () Bool)

(declare-fun mapRes!23035 () Bool)

(assert (=> mapIsEmpty!23035 mapRes!23035))

(declare-fun b!815265 () Bool)

(declare-fun e!452063 () Bool)

(declare-fun e!452065 () Bool)

(assert (=> b!815265 (= e!452063 (and e!452065 mapRes!23035))))

(declare-fun condMapEmpty!23035 () Bool)

(declare-datatypes ((V!24067 0))(
  ( (V!24068 (val!7197 Int)) )
))
(declare-datatypes ((ValueCell!6734 0))(
  ( (ValueCellFull!6734 (v!9618 V!24067)) (EmptyCell!6734) )
))
(declare-datatypes ((array!44789 0))(
  ( (array!44790 (arr!21453 (Array (_ BitVec 32) ValueCell!6734)) (size!21874 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44789)

(declare-fun mapDefault!23035 () ValueCell!6734)

(assert (=> b!815265 (= condMapEmpty!23035 (= (arr!21453 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6734)) mapDefault!23035)))))

(declare-fun b!815266 () Bool)

(declare-fun res!556753 () Bool)

(declare-fun e!452061 () Bool)

(assert (=> b!815266 (=> (not res!556753) (not e!452061))))

(declare-datatypes ((array!44791 0))(
  ( (array!44792 (arr!21454 (Array (_ BitVec 32) (_ BitVec 64))) (size!21875 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44791)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!815266 (= res!556753 (and (= (size!21874 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21875 _keys!976) (size!21874 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23035 () Bool)

(declare-fun tp!44488 () Bool)

(declare-fun e!452062 () Bool)

(assert (=> mapNonEmpty!23035 (= mapRes!23035 (and tp!44488 e!452062))))

(declare-fun mapRest!23035 () (Array (_ BitVec 32) ValueCell!6734))

(declare-fun mapKey!23035 () (_ BitVec 32))

(declare-fun mapValue!23035 () ValueCell!6734)

(assert (=> mapNonEmpty!23035 (= (arr!21453 _values!788) (store mapRest!23035 mapKey!23035 mapValue!23035))))

(declare-fun b!815267 () Bool)

(declare-fun tp_is_empty!14299 () Bool)

(assert (=> b!815267 (= e!452062 tp_is_empty!14299)))

(declare-fun b!815268 () Bool)

(declare-fun e!452066 () Bool)

(assert (=> b!815268 (= e!452066 true)))

(declare-fun zeroValueAfter!34 () V!24067)

(declare-fun minValue!754 () V!24067)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9460 0))(
  ( (tuple2!9461 (_1!4741 (_ BitVec 64)) (_2!4741 V!24067)) )
))
(declare-datatypes ((List!15288 0))(
  ( (Nil!15285) (Cons!15284 (h!16413 tuple2!9460) (t!21600 List!15288)) )
))
(declare-datatypes ((ListLongMap!8273 0))(
  ( (ListLongMap!8274 (toList!4152 List!15288)) )
))
(declare-fun lt!364844 () ListLongMap!8273)

(declare-fun getCurrentListMap!2330 (array!44791 array!44789 (_ BitVec 32) (_ BitVec 32) V!24067 V!24067 (_ BitVec 32) Int) ListLongMap!8273)

(assert (=> b!815268 (= lt!364844 (getCurrentListMap!2330 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24067)

(declare-fun lt!364845 () ListLongMap!8273)

(declare-fun +!1818 (ListLongMap!8273 tuple2!9460) ListLongMap!8273)

(assert (=> b!815268 (= lt!364845 (+!1818 (getCurrentListMap!2330 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9461 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!815269 () Bool)

(assert (=> b!815269 (= e!452061 (not e!452066))))

(declare-fun res!556752 () Bool)

(assert (=> b!815269 (=> res!556752 e!452066)))

(assert (=> b!815269 (= res!556752 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!364843 () ListLongMap!8273)

(declare-fun lt!364847 () ListLongMap!8273)

(assert (=> b!815269 (= lt!364843 lt!364847)))

(declare-datatypes ((Unit!27738 0))(
  ( (Unit!27739) )
))
(declare-fun lt!364846 () Unit!27738)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!310 (array!44791 array!44789 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24067 V!24067 V!24067 V!24067 (_ BitVec 32) Int) Unit!27738)

(assert (=> b!815269 (= lt!364846 (lemmaNoChangeToArrayThenSameMapNoExtras!310 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2217 (array!44791 array!44789 (_ BitVec 32) (_ BitVec 32) V!24067 V!24067 (_ BitVec 32) Int) ListLongMap!8273)

(assert (=> b!815269 (= lt!364847 (getCurrentListMapNoExtraKeys!2217 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815269 (= lt!364843 (getCurrentListMapNoExtraKeys!2217 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!556750 () Bool)

(assert (=> start!70176 (=> (not res!556750) (not e!452061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70176 (= res!556750 (validMask!0 mask!1312))))

(assert (=> start!70176 e!452061))

(assert (=> start!70176 tp_is_empty!14299))

(declare-fun array_inv!17245 (array!44791) Bool)

(assert (=> start!70176 (array_inv!17245 _keys!976)))

(assert (=> start!70176 true))

(declare-fun array_inv!17246 (array!44789) Bool)

(assert (=> start!70176 (and (array_inv!17246 _values!788) e!452063)))

(assert (=> start!70176 tp!44487))

(declare-fun b!815270 () Bool)

(declare-fun res!556751 () Bool)

(assert (=> b!815270 (=> (not res!556751) (not e!452061))))

(declare-datatypes ((List!15289 0))(
  ( (Nil!15286) (Cons!15285 (h!16414 (_ BitVec 64)) (t!21601 List!15289)) )
))
(declare-fun arrayNoDuplicates!0 (array!44791 (_ BitVec 32) List!15289) Bool)

(assert (=> b!815270 (= res!556751 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15286))))

(declare-fun b!815271 () Bool)

(assert (=> b!815271 (= e!452065 tp_is_empty!14299)))

(declare-fun b!815272 () Bool)

(declare-fun res!556749 () Bool)

(assert (=> b!815272 (=> (not res!556749) (not e!452061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44791 (_ BitVec 32)) Bool)

(assert (=> b!815272 (= res!556749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70176 res!556750) b!815266))

(assert (= (and b!815266 res!556753) b!815272))

(assert (= (and b!815272 res!556749) b!815270))

(assert (= (and b!815270 res!556751) b!815269))

(assert (= (and b!815269 (not res!556752)) b!815268))

(assert (= (and b!815265 condMapEmpty!23035) mapIsEmpty!23035))

(assert (= (and b!815265 (not condMapEmpty!23035)) mapNonEmpty!23035))

(get-info :version)

(assert (= (and mapNonEmpty!23035 ((_ is ValueCellFull!6734) mapValue!23035)) b!815267))

(assert (= (and b!815265 ((_ is ValueCellFull!6734) mapDefault!23035)) b!815271))

(assert (= start!70176 b!815265))

(declare-fun m!756405 () Bool)

(assert (=> mapNonEmpty!23035 m!756405))

(declare-fun m!756407 () Bool)

(assert (=> b!815269 m!756407))

(declare-fun m!756409 () Bool)

(assert (=> b!815269 m!756409))

(declare-fun m!756411 () Bool)

(assert (=> b!815269 m!756411))

(declare-fun m!756413 () Bool)

(assert (=> b!815270 m!756413))

(declare-fun m!756415 () Bool)

(assert (=> b!815272 m!756415))

(declare-fun m!756417 () Bool)

(assert (=> b!815268 m!756417))

(declare-fun m!756419 () Bool)

(assert (=> b!815268 m!756419))

(assert (=> b!815268 m!756419))

(declare-fun m!756421 () Bool)

(assert (=> b!815268 m!756421))

(declare-fun m!756423 () Bool)

(assert (=> start!70176 m!756423))

(declare-fun m!756425 () Bool)

(assert (=> start!70176 m!756425))

(declare-fun m!756427 () Bool)

(assert (=> start!70176 m!756427))

(check-sat (not b_next!12589) (not start!70176) b_and!21351 (not mapNonEmpty!23035) (not b!815269) (not b!815272) (not b!815270) (not b!815268) tp_is_empty!14299)
(check-sat b_and!21351 (not b_next!12589))
