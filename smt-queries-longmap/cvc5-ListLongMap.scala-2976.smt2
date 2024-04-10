; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42132 () Bool)

(assert start!42132)

(declare-fun b_free!11665 () Bool)

(declare-fun b_next!11665 () Bool)

(assert (=> start!42132 (= b_free!11665 (not b_next!11665))))

(declare-fun tp!41016 () Bool)

(declare-fun b_and!20087 () Bool)

(assert (=> start!42132 (= tp!41016 b_and!20087)))

(declare-fun mapIsEmpty!21340 () Bool)

(declare-fun mapRes!21340 () Bool)

(assert (=> mapIsEmpty!21340 mapRes!21340))

(declare-fun res!281056 () Bool)

(declare-fun e!275542 () Bool)

(assert (=> start!42132 (=> (not res!281056) (not e!275542))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42132 (= res!281056 (validMask!0 mask!1365))))

(assert (=> start!42132 e!275542))

(declare-fun tp_is_empty!13093 () Bool)

(assert (=> start!42132 tp_is_empty!13093))

(assert (=> start!42132 tp!41016))

(assert (=> start!42132 true))

(declare-datatypes ((array!29957 0))(
  ( (array!29958 (arr!14402 (Array (_ BitVec 32) (_ BitVec 64))) (size!14754 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29957)

(declare-fun array_inv!10392 (array!29957) Bool)

(assert (=> start!42132 (array_inv!10392 _keys!1025)))

(declare-datatypes ((V!18563 0))(
  ( (V!18564 (val!6591 Int)) )
))
(declare-datatypes ((ValueCell!6203 0))(
  ( (ValueCellFull!6203 (v!8882 V!18563)) (EmptyCell!6203) )
))
(declare-datatypes ((array!29959 0))(
  ( (array!29960 (arr!14403 (Array (_ BitVec 32) ValueCell!6203)) (size!14755 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29959)

(declare-fun e!275545 () Bool)

(declare-fun array_inv!10393 (array!29959) Bool)

(assert (=> start!42132 (and (array_inv!10393 _values!833) e!275545)))

(declare-fun b!470363 () Bool)

(declare-fun e!275543 () Bool)

(assert (=> b!470363 (= e!275543 tp_is_empty!13093)))

(declare-fun b!470364 () Bool)

(declare-fun res!281057 () Bool)

(assert (=> b!470364 (=> (not res!281057) (not e!275542))))

(declare-datatypes ((List!8760 0))(
  ( (Nil!8757) (Cons!8756 (h!9612 (_ BitVec 64)) (t!14722 List!8760)) )
))
(declare-fun arrayNoDuplicates!0 (array!29957 (_ BitVec 32) List!8760) Bool)

(assert (=> b!470364 (= res!281057 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8757))))

(declare-fun b!470365 () Bool)

(assert (=> b!470365 (= e!275542 (not true))))

(declare-datatypes ((tuple2!8680 0))(
  ( (tuple2!8681 (_1!4351 (_ BitVec 64)) (_2!4351 V!18563)) )
))
(declare-datatypes ((List!8761 0))(
  ( (Nil!8758) (Cons!8757 (h!9613 tuple2!8680) (t!14723 List!8761)) )
))
(declare-datatypes ((ListLongMap!7593 0))(
  ( (ListLongMap!7594 (toList!3812 List!8761)) )
))
(declare-fun lt!213422 () ListLongMap!7593)

(declare-fun lt!213423 () ListLongMap!7593)

(assert (=> b!470365 (= lt!213422 lt!213423)))

(declare-fun minValueBefore!38 () V!18563)

(declare-fun zeroValue!794 () V!18563)

(declare-datatypes ((Unit!13783 0))(
  ( (Unit!13784) )
))
(declare-fun lt!213421 () Unit!13783)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18563)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!155 (array!29957 array!29959 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18563 V!18563 V!18563 V!18563 (_ BitVec 32) Int) Unit!13783)

(assert (=> b!470365 (= lt!213421 (lemmaNoChangeToArrayThenSameMapNoExtras!155 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1975 (array!29957 array!29959 (_ BitVec 32) (_ BitVec 32) V!18563 V!18563 (_ BitVec 32) Int) ListLongMap!7593)

(assert (=> b!470365 (= lt!213423 (getCurrentListMapNoExtraKeys!1975 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470365 (= lt!213422 (getCurrentListMapNoExtraKeys!1975 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470366 () Bool)

(declare-fun res!281058 () Bool)

(assert (=> b!470366 (=> (not res!281058) (not e!275542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29957 (_ BitVec 32)) Bool)

(assert (=> b!470366 (= res!281058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470367 () Bool)

(declare-fun e!275541 () Bool)

(assert (=> b!470367 (= e!275541 tp_is_empty!13093)))

(declare-fun b!470368 () Bool)

(declare-fun res!281055 () Bool)

(assert (=> b!470368 (=> (not res!281055) (not e!275542))))

(assert (=> b!470368 (= res!281055 (and (= (size!14755 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14754 _keys!1025) (size!14755 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470369 () Bool)

(assert (=> b!470369 (= e!275545 (and e!275543 mapRes!21340))))

(declare-fun condMapEmpty!21340 () Bool)

(declare-fun mapDefault!21340 () ValueCell!6203)

