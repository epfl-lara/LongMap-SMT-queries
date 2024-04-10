; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41574 () Bool)

(assert start!41574)

(declare-fun b_free!11241 () Bool)

(declare-fun b_next!11241 () Bool)

(assert (=> start!41574 (= b_free!11241 (not b_next!11241))))

(declare-fun tp!39720 () Bool)

(declare-fun b_and!19581 () Bool)

(assert (=> start!41574 (= tp!39720 b_and!19581)))

(declare-fun mapNonEmpty!20680 () Bool)

(declare-fun mapRes!20680 () Bool)

(declare-fun tp!39721 () Bool)

(declare-fun e!271255 () Bool)

(assert (=> mapNonEmpty!20680 (= mapRes!20680 (and tp!39721 e!271255))))

(declare-datatypes ((V!17997 0))(
  ( (V!17998 (val!6379 Int)) )
))
(declare-datatypes ((ValueCell!5991 0))(
  ( (ValueCellFull!5991 (v!8666 V!17997)) (EmptyCell!5991) )
))
(declare-datatypes ((array!29125 0))(
  ( (array!29126 (arr!13994 (Array (_ BitVec 32) ValueCell!5991)) (size!14346 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29125)

(declare-fun mapValue!20680 () ValueCell!5991)

(declare-fun mapKey!20680 () (_ BitVec 32))

(declare-fun mapRest!20680 () (Array (_ BitVec 32) ValueCell!5991))

(assert (=> mapNonEmpty!20680 (= (arr!13994 _values!833) (store mapRest!20680 mapKey!20680 mapValue!20680))))

(declare-fun res!277637 () Bool)

(declare-fun e!271254 () Bool)

(assert (=> start!41574 (=> (not res!277637) (not e!271254))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41574 (= res!277637 (validMask!0 mask!1365))))

(assert (=> start!41574 e!271254))

(declare-fun tp_is_empty!12669 () Bool)

(assert (=> start!41574 tp_is_empty!12669))

(assert (=> start!41574 tp!39720))

(assert (=> start!41574 true))

(declare-datatypes ((array!29127 0))(
  ( (array!29128 (arr!13995 (Array (_ BitVec 32) (_ BitVec 64))) (size!14347 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29127)

(declare-fun array_inv!10110 (array!29127) Bool)

(assert (=> start!41574 (array_inv!10110 _keys!1025)))

(declare-fun e!271257 () Bool)

(declare-fun array_inv!10111 (array!29125) Bool)

(assert (=> start!41574 (and (array_inv!10111 _values!833) e!271257)))

(declare-fun b!464377 () Bool)

(declare-fun res!277640 () Bool)

(assert (=> b!464377 (=> (not res!277640) (not e!271254))))

(declare-datatypes ((List!8450 0))(
  ( (Nil!8447) (Cons!8446 (h!9302 (_ BitVec 64)) (t!14396 List!8450)) )
))
(declare-fun arrayNoDuplicates!0 (array!29127 (_ BitVec 32) List!8450) Bool)

(assert (=> b!464377 (= res!277640 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8447))))

(declare-fun b!464378 () Bool)

(assert (=> b!464378 (= e!271255 tp_is_empty!12669)))

(declare-fun b!464379 () Bool)

(declare-fun res!277638 () Bool)

(assert (=> b!464379 (=> (not res!277638) (not e!271254))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!464379 (= res!277638 (and (= (size!14346 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14347 _keys!1025) (size!14346 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!464380 () Bool)

(assert (=> b!464380 (= e!271254 (not true))))

(declare-datatypes ((tuple2!8356 0))(
  ( (tuple2!8357 (_1!4189 (_ BitVec 64)) (_2!4189 V!17997)) )
))
(declare-datatypes ((List!8451 0))(
  ( (Nil!8448) (Cons!8447 (h!9303 tuple2!8356) (t!14397 List!8451)) )
))
(declare-datatypes ((ListLongMap!7269 0))(
  ( (ListLongMap!7270 (toList!3650 List!8451)) )
))
(declare-fun lt!209688 () ListLongMap!7269)

(declare-fun lt!209690 () ListLongMap!7269)

(assert (=> b!464380 (= lt!209688 lt!209690)))

(declare-fun minValueBefore!38 () V!17997)

(declare-fun zeroValue!794 () V!17997)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13468 0))(
  ( (Unit!13469) )
))
(declare-fun lt!209689 () Unit!13468)

(declare-fun minValueAfter!38 () V!17997)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!10 (array!29127 array!29125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17997 V!17997 V!17997 V!17997 (_ BitVec 32) Int) Unit!13468)

(assert (=> b!464380 (= lt!209689 (lemmaNoChangeToArrayThenSameMapNoExtras!10 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1830 (array!29127 array!29125 (_ BitVec 32) (_ BitVec 32) V!17997 V!17997 (_ BitVec 32) Int) ListLongMap!7269)

(assert (=> b!464380 (= lt!209690 (getCurrentListMapNoExtraKeys!1830 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464380 (= lt!209688 (getCurrentListMapNoExtraKeys!1830 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464381 () Bool)

(declare-fun e!271253 () Bool)

(assert (=> b!464381 (= e!271257 (and e!271253 mapRes!20680))))

(declare-fun condMapEmpty!20680 () Bool)

(declare-fun mapDefault!20680 () ValueCell!5991)

(assert (=> b!464381 (= condMapEmpty!20680 (= (arr!13994 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5991)) mapDefault!20680)))))

(declare-fun b!464382 () Bool)

(declare-fun res!277639 () Bool)

(assert (=> b!464382 (=> (not res!277639) (not e!271254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29127 (_ BitVec 32)) Bool)

(assert (=> b!464382 (= res!277639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464383 () Bool)

(assert (=> b!464383 (= e!271253 tp_is_empty!12669)))

(declare-fun mapIsEmpty!20680 () Bool)

(assert (=> mapIsEmpty!20680 mapRes!20680))

(assert (= (and start!41574 res!277637) b!464379))

(assert (= (and b!464379 res!277638) b!464382))

(assert (= (and b!464382 res!277639) b!464377))

(assert (= (and b!464377 res!277640) b!464380))

(assert (= (and b!464381 condMapEmpty!20680) mapIsEmpty!20680))

(assert (= (and b!464381 (not condMapEmpty!20680)) mapNonEmpty!20680))

(get-info :version)

(assert (= (and mapNonEmpty!20680 ((_ is ValueCellFull!5991) mapValue!20680)) b!464378))

(assert (= (and b!464381 ((_ is ValueCellFull!5991) mapDefault!20680)) b!464383))

(assert (= start!41574 b!464381))

(declare-fun m!446771 () Bool)

(assert (=> b!464382 m!446771))

(declare-fun m!446773 () Bool)

(assert (=> start!41574 m!446773))

(declare-fun m!446775 () Bool)

(assert (=> start!41574 m!446775))

(declare-fun m!446777 () Bool)

(assert (=> start!41574 m!446777))

(declare-fun m!446779 () Bool)

(assert (=> mapNonEmpty!20680 m!446779))

(declare-fun m!446781 () Bool)

(assert (=> b!464377 m!446781))

(declare-fun m!446783 () Bool)

(assert (=> b!464380 m!446783))

(declare-fun m!446785 () Bool)

(assert (=> b!464380 m!446785))

(declare-fun m!446787 () Bool)

(assert (=> b!464380 m!446787))

(check-sat (not start!41574) (not b_next!11241) (not mapNonEmpty!20680) (not b!464380) b_and!19581 (not b!464382) tp_is_empty!12669 (not b!464377))
(check-sat b_and!19581 (not b_next!11241))
