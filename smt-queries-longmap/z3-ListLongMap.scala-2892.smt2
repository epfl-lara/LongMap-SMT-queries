; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41496 () Bool)

(assert start!41496)

(declare-fun b_free!11163 () Bool)

(declare-fun b_next!11163 () Bool)

(assert (=> start!41496 (= b_free!11163 (not b_next!11163))))

(declare-fun tp!39487 () Bool)

(declare-fun b_and!19503 () Bool)

(assert (=> start!41496 (= tp!39487 b_and!19503)))

(declare-fun res!277171 () Bool)

(declare-fun e!270671 () Bool)

(assert (=> start!41496 (=> (not res!277171) (not e!270671))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41496 (= res!277171 (validMask!0 mask!1365))))

(assert (=> start!41496 e!270671))

(declare-fun tp_is_empty!12591 () Bool)

(assert (=> start!41496 tp_is_empty!12591))

(assert (=> start!41496 tp!39487))

(assert (=> start!41496 true))

(declare-datatypes ((array!28977 0))(
  ( (array!28978 (arr!13920 (Array (_ BitVec 32) (_ BitVec 64))) (size!14272 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28977)

(declare-fun array_inv!10062 (array!28977) Bool)

(assert (=> start!41496 (array_inv!10062 _keys!1025)))

(declare-datatypes ((V!17893 0))(
  ( (V!17894 (val!6340 Int)) )
))
(declare-datatypes ((ValueCell!5952 0))(
  ( (ValueCellFull!5952 (v!8627 V!17893)) (EmptyCell!5952) )
))
(declare-datatypes ((array!28979 0))(
  ( (array!28980 (arr!13921 (Array (_ BitVec 32) ValueCell!5952)) (size!14273 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28979)

(declare-fun e!270672 () Bool)

(declare-fun array_inv!10063 (array!28979) Bool)

(assert (=> start!41496 (and (array_inv!10063 _values!833) e!270672)))

(declare-fun b!463558 () Bool)

(declare-fun e!270670 () Bool)

(declare-fun mapRes!20563 () Bool)

(assert (=> b!463558 (= e!270672 (and e!270670 mapRes!20563))))

(declare-fun condMapEmpty!20563 () Bool)

(declare-fun mapDefault!20563 () ValueCell!5952)

(assert (=> b!463558 (= condMapEmpty!20563 (= (arr!13921 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5952)) mapDefault!20563)))))

(declare-fun b!463559 () Bool)

(assert (=> b!463559 (= e!270670 tp_is_empty!12591)))

(declare-fun mapIsEmpty!20563 () Bool)

(assert (=> mapIsEmpty!20563 mapRes!20563))

(declare-fun b!463560 () Bool)

(declare-fun e!270668 () Bool)

(assert (=> b!463560 (= e!270668 tp_is_empty!12591)))

(declare-fun b!463561 () Bool)

(assert (=> b!463561 (= e!270671 false)))

(declare-fun zeroValue!794 () V!17893)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8306 0))(
  ( (tuple2!8307 (_1!4164 (_ BitVec 64)) (_2!4164 V!17893)) )
))
(declare-datatypes ((List!8398 0))(
  ( (Nil!8395) (Cons!8394 (h!9250 tuple2!8306) (t!14344 List!8398)) )
))
(declare-datatypes ((ListLongMap!7219 0))(
  ( (ListLongMap!7220 (toList!3625 List!8398)) )
))
(declare-fun lt!209414 () ListLongMap!7219)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!17893)

(declare-fun getCurrentListMapNoExtraKeys!1805 (array!28977 array!28979 (_ BitVec 32) (_ BitVec 32) V!17893 V!17893 (_ BitVec 32) Int) ListLongMap!7219)

(assert (=> b!463561 (= lt!209414 (getCurrentListMapNoExtraKeys!1805 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17893)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!209413 () ListLongMap!7219)

(assert (=> b!463561 (= lt!209413 (getCurrentListMapNoExtraKeys!1805 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20563 () Bool)

(declare-fun tp!39486 () Bool)

(assert (=> mapNonEmpty!20563 (= mapRes!20563 (and tp!39486 e!270668))))

(declare-fun mapRest!20563 () (Array (_ BitVec 32) ValueCell!5952))

(declare-fun mapValue!20563 () ValueCell!5952)

(declare-fun mapKey!20563 () (_ BitVec 32))

(assert (=> mapNonEmpty!20563 (= (arr!13921 _values!833) (store mapRest!20563 mapKey!20563 mapValue!20563))))

(declare-fun b!463562 () Bool)

(declare-fun res!277172 () Bool)

(assert (=> b!463562 (=> (not res!277172) (not e!270671))))

(declare-datatypes ((List!8399 0))(
  ( (Nil!8396) (Cons!8395 (h!9251 (_ BitVec 64)) (t!14345 List!8399)) )
))
(declare-fun arrayNoDuplicates!0 (array!28977 (_ BitVec 32) List!8399) Bool)

(assert (=> b!463562 (= res!277172 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8396))))

(declare-fun b!463563 () Bool)

(declare-fun res!277169 () Bool)

(assert (=> b!463563 (=> (not res!277169) (not e!270671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28977 (_ BitVec 32)) Bool)

(assert (=> b!463563 (= res!277169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463564 () Bool)

(declare-fun res!277170 () Bool)

(assert (=> b!463564 (=> (not res!277170) (not e!270671))))

(assert (=> b!463564 (= res!277170 (and (= (size!14273 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14272 _keys!1025) (size!14273 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41496 res!277171) b!463564))

(assert (= (and b!463564 res!277170) b!463563))

(assert (= (and b!463563 res!277169) b!463562))

(assert (= (and b!463562 res!277172) b!463561))

(assert (= (and b!463558 condMapEmpty!20563) mapIsEmpty!20563))

(assert (= (and b!463558 (not condMapEmpty!20563)) mapNonEmpty!20563))

(get-info :version)

(assert (= (and mapNonEmpty!20563 ((_ is ValueCellFull!5952) mapValue!20563)) b!463560))

(assert (= (and b!463558 ((_ is ValueCellFull!5952) mapDefault!20563)) b!463559))

(assert (= start!41496 b!463558))

(declare-fun m!446121 () Bool)

(assert (=> b!463563 m!446121))

(declare-fun m!446123 () Bool)

(assert (=> start!41496 m!446123))

(declare-fun m!446125 () Bool)

(assert (=> start!41496 m!446125))

(declare-fun m!446127 () Bool)

(assert (=> start!41496 m!446127))

(declare-fun m!446129 () Bool)

(assert (=> mapNonEmpty!20563 m!446129))

(declare-fun m!446131 () Bool)

(assert (=> b!463561 m!446131))

(declare-fun m!446133 () Bool)

(assert (=> b!463561 m!446133))

(declare-fun m!446135 () Bool)

(assert (=> b!463562 m!446135))

(check-sat b_and!19503 (not b!463563) (not start!41496) (not b!463562) (not b_next!11163) (not b!463561) (not mapNonEmpty!20563) tp_is_empty!12591)
(check-sat b_and!19503 (not b_next!11163))
