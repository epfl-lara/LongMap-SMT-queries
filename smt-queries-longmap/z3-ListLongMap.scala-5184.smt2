; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70092 () Bool)

(assert start!70092)

(declare-fun b_free!12513 () Bool)

(declare-fun b_next!12513 () Bool)

(assert (=> start!70092 (= b_free!12513 (not b_next!12513))))

(declare-fun tp!44253 () Bool)

(declare-fun b_and!21285 () Bool)

(assert (=> start!70092 (= tp!44253 b_and!21285)))

(declare-fun b!814541 () Bool)

(declare-fun res!556335 () Bool)

(declare-fun e!451531 () Bool)

(assert (=> b!814541 (=> (not res!556335) (not e!451531))))

(declare-datatypes ((array!44648 0))(
  ( (array!44649 (arr!21384 (Array (_ BitVec 32) (_ BitVec 64))) (size!21805 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44648)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44648 (_ BitVec 32)) Bool)

(assert (=> b!814541 (= res!556335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814542 () Bool)

(declare-fun res!556338 () Bool)

(assert (=> b!814542 (=> (not res!556338) (not e!451531))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23965 0))(
  ( (V!23966 (val!7159 Int)) )
))
(declare-datatypes ((ValueCell!6696 0))(
  ( (ValueCellFull!6696 (v!9586 V!23965)) (EmptyCell!6696) )
))
(declare-datatypes ((array!44650 0))(
  ( (array!44651 (arr!21385 (Array (_ BitVec 32) ValueCell!6696)) (size!21806 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44650)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814542 (= res!556338 (and (= (size!21806 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21805 _keys!976) (size!21806 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814543 () Bool)

(declare-fun e!451530 () Bool)

(declare-fun tp_is_empty!14223 () Bool)

(assert (=> b!814543 (= e!451530 tp_is_empty!14223)))

(declare-fun b!814544 () Bool)

(declare-fun res!556336 () Bool)

(assert (=> b!814544 (=> (not res!556336) (not e!451531))))

(declare-datatypes ((List!15215 0))(
  ( (Nil!15212) (Cons!15211 (h!16340 (_ BitVec 64)) (t!21532 List!15215)) )
))
(declare-fun arrayNoDuplicates!0 (array!44648 (_ BitVec 32) List!15215) Bool)

(assert (=> b!814544 (= res!556336 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15212))))

(declare-fun b!814545 () Bool)

(assert (=> b!814545 (= e!451531 (not true))))

(declare-datatypes ((tuple2!9384 0))(
  ( (tuple2!9385 (_1!4703 (_ BitVec 64)) (_2!4703 V!23965)) )
))
(declare-datatypes ((List!15216 0))(
  ( (Nil!15213) (Cons!15212 (h!16341 tuple2!9384) (t!21533 List!15216)) )
))
(declare-datatypes ((ListLongMap!8207 0))(
  ( (ListLongMap!8208 (toList!4119 List!15216)) )
))
(declare-fun lt!364662 () ListLongMap!8207)

(declare-fun lt!364660 () ListLongMap!8207)

(assert (=> b!814545 (= lt!364662 lt!364660)))

(declare-fun zeroValueBefore!34 () V!23965)

(declare-fun zeroValueAfter!34 () V!23965)

(declare-fun minValue!754 () V!23965)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27736 0))(
  ( (Unit!27737) )
))
(declare-fun lt!364661 () Unit!27736)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!279 (array!44648 array!44650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23965 V!23965 V!23965 V!23965 (_ BitVec 32) Int) Unit!27736)

(assert (=> b!814545 (= lt!364661 (lemmaNoChangeToArrayThenSameMapNoExtras!279 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2169 (array!44648 array!44650 (_ BitVec 32) (_ BitVec 32) V!23965 V!23965 (_ BitVec 32) Int) ListLongMap!8207)

(assert (=> b!814545 (= lt!364660 (getCurrentListMapNoExtraKeys!2169 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814545 (= lt!364662 (getCurrentListMapNoExtraKeys!2169 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22915 () Bool)

(declare-fun mapRes!22915 () Bool)

(declare-fun tp!44254 () Bool)

(assert (=> mapNonEmpty!22915 (= mapRes!22915 (and tp!44254 e!451530))))

(declare-fun mapRest!22915 () (Array (_ BitVec 32) ValueCell!6696))

(declare-fun mapValue!22915 () ValueCell!6696)

(declare-fun mapKey!22915 () (_ BitVec 32))

(assert (=> mapNonEmpty!22915 (= (arr!21385 _values!788) (store mapRest!22915 mapKey!22915 mapValue!22915))))

(declare-fun b!814546 () Bool)

(declare-fun e!451532 () Bool)

(declare-fun e!451533 () Bool)

(assert (=> b!814546 (= e!451532 (and e!451533 mapRes!22915))))

(declare-fun condMapEmpty!22915 () Bool)

(declare-fun mapDefault!22915 () ValueCell!6696)

(assert (=> b!814546 (= condMapEmpty!22915 (= (arr!21385 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6696)) mapDefault!22915)))))

(declare-fun res!556337 () Bool)

(assert (=> start!70092 (=> (not res!556337) (not e!451531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70092 (= res!556337 (validMask!0 mask!1312))))

(assert (=> start!70092 e!451531))

(assert (=> start!70092 tp_is_empty!14223))

(declare-fun array_inv!17111 (array!44648) Bool)

(assert (=> start!70092 (array_inv!17111 _keys!976)))

(assert (=> start!70092 true))

(declare-fun array_inv!17112 (array!44650) Bool)

(assert (=> start!70092 (and (array_inv!17112 _values!788) e!451532)))

(assert (=> start!70092 tp!44253))

(declare-fun b!814547 () Bool)

(assert (=> b!814547 (= e!451533 tp_is_empty!14223)))

(declare-fun mapIsEmpty!22915 () Bool)

(assert (=> mapIsEmpty!22915 mapRes!22915))

(assert (= (and start!70092 res!556337) b!814542))

(assert (= (and b!814542 res!556338) b!814541))

(assert (= (and b!814541 res!556335) b!814544))

(assert (= (and b!814544 res!556336) b!814545))

(assert (= (and b!814546 condMapEmpty!22915) mapIsEmpty!22915))

(assert (= (and b!814546 (not condMapEmpty!22915)) mapNonEmpty!22915))

(get-info :version)

(assert (= (and mapNonEmpty!22915 ((_ is ValueCellFull!6696) mapValue!22915)) b!814543))

(assert (= (and b!814546 ((_ is ValueCellFull!6696) mapDefault!22915)) b!814547))

(assert (= start!70092 b!814546))

(declare-fun m!756341 () Bool)

(assert (=> start!70092 m!756341))

(declare-fun m!756343 () Bool)

(assert (=> start!70092 m!756343))

(declare-fun m!756345 () Bool)

(assert (=> start!70092 m!756345))

(declare-fun m!756347 () Bool)

(assert (=> mapNonEmpty!22915 m!756347))

(declare-fun m!756349 () Bool)

(assert (=> b!814541 m!756349))

(declare-fun m!756351 () Bool)

(assert (=> b!814545 m!756351))

(declare-fun m!756353 () Bool)

(assert (=> b!814545 m!756353))

(declare-fun m!756355 () Bool)

(assert (=> b!814545 m!756355))

(declare-fun m!756357 () Bool)

(assert (=> b!814544 m!756357))

(check-sat b_and!21285 (not b!814541) (not b_next!12513) (not mapNonEmpty!22915) (not b!814544) (not start!70092) tp_is_empty!14223 (not b!814545))
(check-sat b_and!21285 (not b_next!12513))
