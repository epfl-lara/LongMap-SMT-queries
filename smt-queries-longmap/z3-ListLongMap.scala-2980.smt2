; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42142 () Bool)

(assert start!42142)

(declare-fun b_free!11689 () Bool)

(declare-fun b_next!11689 () Bool)

(assert (=> start!42142 (= b_free!11689 (not b_next!11689))))

(declare-fun tp!41088 () Bool)

(declare-fun b_and!20085 () Bool)

(assert (=> start!42142 (= tp!41088 b_and!20085)))

(declare-fun res!281072 () Bool)

(declare-fun e!275549 () Bool)

(assert (=> start!42142 (=> (not res!281072) (not e!275549))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42142 (= res!281072 (validMask!0 mask!1365))))

(assert (=> start!42142 e!275549))

(declare-fun tp_is_empty!13117 () Bool)

(assert (=> start!42142 tp_is_empty!13117))

(assert (=> start!42142 tp!41088))

(assert (=> start!42142 true))

(declare-datatypes ((array!29983 0))(
  ( (array!29984 (arr!14415 (Array (_ BitVec 32) (_ BitVec 64))) (size!14768 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29983)

(declare-fun array_inv!10484 (array!29983) Bool)

(assert (=> start!42142 (array_inv!10484 _keys!1025)))

(declare-datatypes ((V!18595 0))(
  ( (V!18596 (val!6603 Int)) )
))
(declare-datatypes ((ValueCell!6215 0))(
  ( (ValueCellFull!6215 (v!8888 V!18595)) (EmptyCell!6215) )
))
(declare-datatypes ((array!29985 0))(
  ( (array!29986 (arr!14416 (Array (_ BitVec 32) ValueCell!6215)) (size!14769 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29985)

(declare-fun e!275551 () Bool)

(declare-fun array_inv!10485 (array!29985) Bool)

(assert (=> start!42142 (and (array_inv!10485 _values!833) e!275551)))

(declare-fun mapNonEmpty!21376 () Bool)

(declare-fun mapRes!21376 () Bool)

(declare-fun tp!41089 () Bool)

(declare-fun e!275550 () Bool)

(assert (=> mapNonEmpty!21376 (= mapRes!21376 (and tp!41089 e!275550))))

(declare-fun mapValue!21376 () ValueCell!6215)

(declare-fun mapRest!21376 () (Array (_ BitVec 32) ValueCell!6215))

(declare-fun mapKey!21376 () (_ BitVec 32))

(assert (=> mapNonEmpty!21376 (= (arr!14416 _values!833) (store mapRest!21376 mapKey!21376 mapValue!21376))))

(declare-fun b!470344 () Bool)

(assert (=> b!470344 (= e!275549 (not true))))

(declare-datatypes ((tuple2!8730 0))(
  ( (tuple2!8731 (_1!4376 (_ BitVec 64)) (_2!4376 V!18595)) )
))
(declare-datatypes ((List!8799 0))(
  ( (Nil!8796) (Cons!8795 (h!9651 tuple2!8730) (t!14752 List!8799)) )
))
(declare-datatypes ((ListLongMap!7633 0))(
  ( (ListLongMap!7634 (toList!3832 List!8799)) )
))
(declare-fun lt!213296 () ListLongMap!7633)

(declare-fun lt!213295 () ListLongMap!7633)

(assert (=> b!470344 (= lt!213296 lt!213295)))

(declare-fun minValueBefore!38 () V!18595)

(declare-fun zeroValue!794 () V!18595)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18595)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13765 0))(
  ( (Unit!13766) )
))
(declare-fun lt!213297 () Unit!13765)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!164 (array!29983 array!29985 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18595 V!18595 V!18595 V!18595 (_ BitVec 32) Int) Unit!13765)

(assert (=> b!470344 (= lt!213297 (lemmaNoChangeToArrayThenSameMapNoExtras!164 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2007 (array!29983 array!29985 (_ BitVec 32) (_ BitVec 32) V!18595 V!18595 (_ BitVec 32) Int) ListLongMap!7633)

(assert (=> b!470344 (= lt!213295 (getCurrentListMapNoExtraKeys!2007 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470344 (= lt!213296 (getCurrentListMapNoExtraKeys!2007 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470345 () Bool)

(declare-fun e!275548 () Bool)

(assert (=> b!470345 (= e!275551 (and e!275548 mapRes!21376))))

(declare-fun condMapEmpty!21376 () Bool)

(declare-fun mapDefault!21376 () ValueCell!6215)

(assert (=> b!470345 (= condMapEmpty!21376 (= (arr!14416 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6215)) mapDefault!21376)))))

(declare-fun mapIsEmpty!21376 () Bool)

(assert (=> mapIsEmpty!21376 mapRes!21376))

(declare-fun b!470346 () Bool)

(declare-fun res!281070 () Bool)

(assert (=> b!470346 (=> (not res!281070) (not e!275549))))

(declare-datatypes ((List!8800 0))(
  ( (Nil!8797) (Cons!8796 (h!9652 (_ BitVec 64)) (t!14753 List!8800)) )
))
(declare-fun arrayNoDuplicates!0 (array!29983 (_ BitVec 32) List!8800) Bool)

(assert (=> b!470346 (= res!281070 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8797))))

(declare-fun b!470347 () Bool)

(assert (=> b!470347 (= e!275550 tp_is_empty!13117)))

(declare-fun b!470348 () Bool)

(assert (=> b!470348 (= e!275548 tp_is_empty!13117)))

(declare-fun b!470349 () Bool)

(declare-fun res!281073 () Bool)

(assert (=> b!470349 (=> (not res!281073) (not e!275549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29983 (_ BitVec 32)) Bool)

(assert (=> b!470349 (= res!281073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470350 () Bool)

(declare-fun res!281071 () Bool)

(assert (=> b!470350 (=> (not res!281071) (not e!275549))))

(assert (=> b!470350 (= res!281071 (and (= (size!14769 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14768 _keys!1025) (size!14769 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42142 res!281072) b!470350))

(assert (= (and b!470350 res!281071) b!470349))

(assert (= (and b!470349 res!281073) b!470346))

(assert (= (and b!470346 res!281070) b!470344))

(assert (= (and b!470345 condMapEmpty!21376) mapIsEmpty!21376))

(assert (= (and b!470345 (not condMapEmpty!21376)) mapNonEmpty!21376))

(get-info :version)

(assert (= (and mapNonEmpty!21376 ((_ is ValueCellFull!6215) mapValue!21376)) b!470347))

(assert (= (and b!470345 ((_ is ValueCellFull!6215) mapDefault!21376)) b!470348))

(assert (= start!42142 b!470345))

(declare-fun m!452145 () Bool)

(assert (=> b!470344 m!452145))

(declare-fun m!452147 () Bool)

(assert (=> b!470344 m!452147))

(declare-fun m!452149 () Bool)

(assert (=> b!470344 m!452149))

(declare-fun m!452151 () Bool)

(assert (=> b!470346 m!452151))

(declare-fun m!452153 () Bool)

(assert (=> mapNonEmpty!21376 m!452153))

(declare-fun m!452155 () Bool)

(assert (=> start!42142 m!452155))

(declare-fun m!452157 () Bool)

(assert (=> start!42142 m!452157))

(declare-fun m!452159 () Bool)

(assert (=> start!42142 m!452159))

(declare-fun m!452161 () Bool)

(assert (=> b!470349 m!452161))

(check-sat tp_is_empty!13117 (not start!42142) (not b!470344) (not b!470349) b_and!20085 (not mapNonEmpty!21376) (not b_next!11689) (not b!470346))
(check-sat b_and!20085 (not b_next!11689))
