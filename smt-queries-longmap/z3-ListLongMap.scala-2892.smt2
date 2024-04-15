; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41480 () Bool)

(assert start!41480)

(declare-fun b_free!11161 () Bool)

(declare-fun b_next!11161 () Bool)

(assert (=> start!41480 (= b_free!11161 (not b_next!11161))))

(declare-fun tp!39481 () Bool)

(declare-fun b_and!19475 () Bool)

(assert (=> start!41480 (= tp!39481 b_and!19475)))

(declare-fun res!277028 () Bool)

(declare-fun e!270482 () Bool)

(assert (=> start!41480 (=> (not res!277028) (not e!270482))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41480 (= res!277028 (validMask!0 mask!1365))))

(assert (=> start!41480 e!270482))

(declare-fun tp_is_empty!12589 () Bool)

(assert (=> start!41480 tp_is_empty!12589))

(assert (=> start!41480 tp!39481))

(assert (=> start!41480 true))

(declare-datatypes ((array!28971 0))(
  ( (array!28972 (arr!13917 (Array (_ BitVec 32) (_ BitVec 64))) (size!14270 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28971)

(declare-fun array_inv!10126 (array!28971) Bool)

(assert (=> start!41480 (array_inv!10126 _keys!1025)))

(declare-datatypes ((V!17891 0))(
  ( (V!17892 (val!6339 Int)) )
))
(declare-datatypes ((ValueCell!5951 0))(
  ( (ValueCellFull!5951 (v!8620 V!17891)) (EmptyCell!5951) )
))
(declare-datatypes ((array!28973 0))(
  ( (array!28974 (arr!13918 (Array (_ BitVec 32) ValueCell!5951)) (size!14271 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28973)

(declare-fun e!270479 () Bool)

(declare-fun array_inv!10127 (array!28973) Bool)

(assert (=> start!41480 (and (array_inv!10127 _values!833) e!270479)))

(declare-fun b!463266 () Bool)

(assert (=> b!463266 (= e!270482 false)))

(declare-fun zeroValue!794 () V!17891)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8336 0))(
  ( (tuple2!8337 (_1!4179 (_ BitVec 64)) (_2!4179 V!17891)) )
))
(declare-datatypes ((List!8421 0))(
  ( (Nil!8418) (Cons!8417 (h!9273 tuple2!8336) (t!14358 List!8421)) )
))
(declare-datatypes ((ListLongMap!7239 0))(
  ( (ListLongMap!7240 (toList!3635 List!8421)) )
))
(declare-fun lt!209174 () ListLongMap!7239)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!17891)

(declare-fun getCurrentListMapNoExtraKeys!1827 (array!28971 array!28973 (_ BitVec 32) (_ BitVec 32) V!17891 V!17891 (_ BitVec 32) Int) ListLongMap!7239)

(assert (=> b!463266 (= lt!209174 (getCurrentListMapNoExtraKeys!1827 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!209173 () ListLongMap!7239)

(declare-fun minValueBefore!38 () V!17891)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!463266 (= lt!209173 (getCurrentListMapNoExtraKeys!1827 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463267 () Bool)

(declare-fun res!277030 () Bool)

(assert (=> b!463267 (=> (not res!277030) (not e!270482))))

(declare-datatypes ((List!8422 0))(
  ( (Nil!8419) (Cons!8418 (h!9274 (_ BitVec 64)) (t!14359 List!8422)) )
))
(declare-fun arrayNoDuplicates!0 (array!28971 (_ BitVec 32) List!8422) Bool)

(assert (=> b!463267 (= res!277030 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8419))))

(declare-fun b!463268 () Bool)

(declare-fun e!270480 () Bool)

(assert (=> b!463268 (= e!270480 tp_is_empty!12589)))

(declare-fun b!463269 () Bool)

(declare-fun res!277029 () Bool)

(assert (=> b!463269 (=> (not res!277029) (not e!270482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28971 (_ BitVec 32)) Bool)

(assert (=> b!463269 (= res!277029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463270 () Bool)

(declare-fun e!270483 () Bool)

(declare-fun mapRes!20560 () Bool)

(assert (=> b!463270 (= e!270479 (and e!270483 mapRes!20560))))

(declare-fun condMapEmpty!20560 () Bool)

(declare-fun mapDefault!20560 () ValueCell!5951)

(assert (=> b!463270 (= condMapEmpty!20560 (= (arr!13918 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5951)) mapDefault!20560)))))

(declare-fun b!463271 () Bool)

(declare-fun res!277031 () Bool)

(assert (=> b!463271 (=> (not res!277031) (not e!270482))))

(assert (=> b!463271 (= res!277031 (and (= (size!14271 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14270 _keys!1025) (size!14271 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463272 () Bool)

(assert (=> b!463272 (= e!270483 tp_is_empty!12589)))

(declare-fun mapIsEmpty!20560 () Bool)

(assert (=> mapIsEmpty!20560 mapRes!20560))

(declare-fun mapNonEmpty!20560 () Bool)

(declare-fun tp!39480 () Bool)

(assert (=> mapNonEmpty!20560 (= mapRes!20560 (and tp!39480 e!270480))))

(declare-fun mapRest!20560 () (Array (_ BitVec 32) ValueCell!5951))

(declare-fun mapKey!20560 () (_ BitVec 32))

(declare-fun mapValue!20560 () ValueCell!5951)

(assert (=> mapNonEmpty!20560 (= (arr!13918 _values!833) (store mapRest!20560 mapKey!20560 mapValue!20560))))

(assert (= (and start!41480 res!277028) b!463271))

(assert (= (and b!463271 res!277031) b!463269))

(assert (= (and b!463269 res!277029) b!463267))

(assert (= (and b!463267 res!277030) b!463266))

(assert (= (and b!463270 condMapEmpty!20560) mapIsEmpty!20560))

(assert (= (and b!463270 (not condMapEmpty!20560)) mapNonEmpty!20560))

(get-info :version)

(assert (= (and mapNonEmpty!20560 ((_ is ValueCellFull!5951) mapValue!20560)) b!463268))

(assert (= (and b!463270 ((_ is ValueCellFull!5951) mapDefault!20560)) b!463272))

(assert (= start!41480 b!463270))

(declare-fun m!445371 () Bool)

(assert (=> start!41480 m!445371))

(declare-fun m!445373 () Bool)

(assert (=> start!41480 m!445373))

(declare-fun m!445375 () Bool)

(assert (=> start!41480 m!445375))

(declare-fun m!445377 () Bool)

(assert (=> mapNonEmpty!20560 m!445377))

(declare-fun m!445379 () Bool)

(assert (=> b!463267 m!445379))

(declare-fun m!445381 () Bool)

(assert (=> b!463269 m!445381))

(declare-fun m!445383 () Bool)

(assert (=> b!463266 m!445383))

(declare-fun m!445385 () Bool)

(assert (=> b!463266 m!445385))

(check-sat (not b!463266) (not b_next!11161) (not mapNonEmpty!20560) (not start!41480) b_and!19475 (not b!463269) tp_is_empty!12589 (not b!463267))
(check-sat b_and!19475 (not b_next!11161))
