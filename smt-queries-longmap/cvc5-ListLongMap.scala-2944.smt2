; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41870 () Bool)

(assert start!41870)

(declare-fun b_free!11473 () Bool)

(declare-fun b_next!11473 () Bool)

(assert (=> start!41870 (= b_free!11473 (not b_next!11473))))

(declare-fun tp!40428 () Bool)

(declare-fun b_and!19853 () Bool)

(assert (=> start!41870 (= tp!40428 b_and!19853)))

(declare-fun mapIsEmpty!21040 () Bool)

(declare-fun mapRes!21040 () Bool)

(assert (=> mapIsEmpty!21040 mapRes!21040))

(declare-fun mapNonEmpty!21040 () Bool)

(declare-fun tp!40429 () Bool)

(declare-fun e!273489 () Bool)

(assert (=> mapNonEmpty!21040 (= mapRes!21040 (and tp!40429 e!273489))))

(declare-datatypes ((V!18307 0))(
  ( (V!18308 (val!6495 Int)) )
))
(declare-datatypes ((ValueCell!6107 0))(
  ( (ValueCellFull!6107 (v!8784 V!18307)) (EmptyCell!6107) )
))
(declare-fun mapRest!21040 () (Array (_ BitVec 32) ValueCell!6107))

(declare-fun mapKey!21040 () (_ BitVec 32))

(declare-datatypes ((array!29577 0))(
  ( (array!29578 (arr!14216 (Array (_ BitVec 32) ValueCell!6107)) (size!14568 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29577)

(declare-fun mapValue!21040 () ValueCell!6107)

(assert (=> mapNonEmpty!21040 (= (arr!14216 _values!833) (store mapRest!21040 mapKey!21040 mapValue!21040))))

(declare-fun b!467513 () Bool)

(declare-fun e!273487 () Bool)

(declare-fun tp_is_empty!12901 () Bool)

(assert (=> b!467513 (= e!273487 tp_is_empty!12901)))

(declare-fun b!467514 () Bool)

(assert (=> b!467514 (= e!273489 tp_is_empty!12901)))

(declare-fun res!279419 () Bool)

(declare-fun e!273488 () Bool)

(assert (=> start!41870 (=> (not res!279419) (not e!273488))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41870 (= res!279419 (validMask!0 mask!1365))))

(assert (=> start!41870 e!273488))

(assert (=> start!41870 tp_is_empty!12901))

(assert (=> start!41870 tp!40428))

(assert (=> start!41870 true))

(declare-datatypes ((array!29579 0))(
  ( (array!29580 (arr!14217 (Array (_ BitVec 32) (_ BitVec 64))) (size!14569 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29579)

(declare-fun array_inv!10260 (array!29579) Bool)

(assert (=> start!41870 (array_inv!10260 _keys!1025)))

(declare-fun e!273485 () Bool)

(declare-fun array_inv!10261 (array!29577) Bool)

(assert (=> start!41870 (and (array_inv!10261 _values!833) e!273485)))

(declare-fun b!467515 () Bool)

(declare-fun res!279417 () Bool)

(assert (=> b!467515 (=> (not res!279417) (not e!273488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29579 (_ BitVec 32)) Bool)

(assert (=> b!467515 (= res!279417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!467516 () Bool)

(declare-fun res!279420 () Bool)

(assert (=> b!467516 (=> (not res!279420) (not e!273488))))

(declare-datatypes ((List!8611 0))(
  ( (Nil!8608) (Cons!8607 (h!9463 (_ BitVec 64)) (t!14565 List!8611)) )
))
(declare-fun arrayNoDuplicates!0 (array!29579 (_ BitVec 32) List!8611) Bool)

(assert (=> b!467516 (= res!279420 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8608))))

(declare-fun b!467517 () Bool)

(assert (=> b!467517 (= e!273488 (not true))))

(declare-datatypes ((tuple2!8524 0))(
  ( (tuple2!8525 (_1!4273 (_ BitVec 64)) (_2!4273 V!18307)) )
))
(declare-datatypes ((List!8612 0))(
  ( (Nil!8609) (Cons!8608 (h!9464 tuple2!8524) (t!14566 List!8612)) )
))
(declare-datatypes ((ListLongMap!7437 0))(
  ( (ListLongMap!7438 (toList!3734 List!8612)) )
))
(declare-fun lt!211381 () ListLongMap!7437)

(declare-fun lt!211382 () ListLongMap!7437)

(assert (=> b!467517 (= lt!211381 lt!211382)))

(declare-fun minValueBefore!38 () V!18307)

(declare-fun zeroValue!794 () V!18307)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13628 0))(
  ( (Unit!13629) )
))
(declare-fun lt!211380 () Unit!13628)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18307)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!88 (array!29579 array!29577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18307 V!18307 V!18307 V!18307 (_ BitVec 32) Int) Unit!13628)

(assert (=> b!467517 (= lt!211380 (lemmaNoChangeToArrayThenSameMapNoExtras!88 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1908 (array!29579 array!29577 (_ BitVec 32) (_ BitVec 32) V!18307 V!18307 (_ BitVec 32) Int) ListLongMap!7437)

(assert (=> b!467517 (= lt!211382 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467517 (= lt!211381 (getCurrentListMapNoExtraKeys!1908 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467518 () Bool)

(declare-fun res!279418 () Bool)

(assert (=> b!467518 (=> (not res!279418) (not e!273488))))

(assert (=> b!467518 (= res!279418 (and (= (size!14568 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14569 _keys!1025) (size!14568 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!467519 () Bool)

(assert (=> b!467519 (= e!273485 (and e!273487 mapRes!21040))))

(declare-fun condMapEmpty!21040 () Bool)

(declare-fun mapDefault!21040 () ValueCell!6107)

