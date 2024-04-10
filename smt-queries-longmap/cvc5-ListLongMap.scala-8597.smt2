; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104812 () Bool)

(assert start!104812)

(declare-fun b_free!26617 () Bool)

(declare-fun b_next!26617 () Bool)

(assert (=> start!104812 (= b_free!26617 (not b_next!26617))))

(declare-fun tp!93341 () Bool)

(declare-fun b_and!44385 () Bool)

(assert (=> start!104812 (= tp!93341 b_and!44385)))

(declare-fun b!1249368 () Bool)

(declare-fun res!833424 () Bool)

(declare-fun e!709084 () Bool)

(assert (=> b!1249368 (=> (not res!833424) (not e!709084))))

(declare-datatypes ((array!80720 0))(
  ( (array!80721 (arr!38927 (Array (_ BitVec 32) (_ BitVec 64))) (size!39463 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80720)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80720 (_ BitVec 32)) Bool)

(assert (=> b!1249368 (= res!833424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!49039 () Bool)

(declare-fun mapRes!49039 () Bool)

(assert (=> mapIsEmpty!49039 mapRes!49039))

(declare-fun mapNonEmpty!49039 () Bool)

(declare-fun tp!93340 () Bool)

(declare-fun e!709086 () Bool)

(assert (=> mapNonEmpty!49039 (= mapRes!49039 (and tp!93340 e!709086))))

(declare-datatypes ((V!47391 0))(
  ( (V!47392 (val!15822 Int)) )
))
(declare-datatypes ((ValueCell!14996 0))(
  ( (ValueCellFull!14996 (v!18518 V!47391)) (EmptyCell!14996) )
))
(declare-datatypes ((array!80722 0))(
  ( (array!80723 (arr!38928 (Array (_ BitVec 32) ValueCell!14996)) (size!39464 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80722)

(declare-fun mapValue!49039 () ValueCell!14996)

(declare-fun mapRest!49039 () (Array (_ BitVec 32) ValueCell!14996))

(declare-fun mapKey!49039 () (_ BitVec 32))

(assert (=> mapNonEmpty!49039 (= (arr!38928 _values!914) (store mapRest!49039 mapKey!49039 mapValue!49039))))

(declare-fun b!1249369 () Bool)

(declare-fun res!833427 () Bool)

(assert (=> b!1249369 (=> (not res!833427) (not e!709084))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249369 (= res!833427 (and (= (size!39464 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39463 _keys!1118) (size!39464 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!833426 () Bool)

(assert (=> start!104812 (=> (not res!833426) (not e!709084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104812 (= res!833426 (validMask!0 mask!1466))))

(assert (=> start!104812 e!709084))

(assert (=> start!104812 true))

(assert (=> start!104812 tp!93341))

(declare-fun tp_is_empty!31519 () Bool)

(assert (=> start!104812 tp_is_empty!31519))

(declare-fun array_inv!29705 (array!80720) Bool)

(assert (=> start!104812 (array_inv!29705 _keys!1118)))

(declare-fun e!709083 () Bool)

(declare-fun array_inv!29706 (array!80722) Bool)

(assert (=> start!104812 (and (array_inv!29706 _values!914) e!709083)))

(declare-fun b!1249370 () Bool)

(declare-fun res!833425 () Bool)

(assert (=> b!1249370 (=> (not res!833425) (not e!709084))))

(declare-datatypes ((List!27628 0))(
  ( (Nil!27625) (Cons!27624 (h!28833 (_ BitVec 64)) (t!41099 List!27628)) )
))
(declare-fun arrayNoDuplicates!0 (array!80720 (_ BitVec 32) List!27628) Bool)

(assert (=> b!1249370 (= res!833425 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27625))))

(declare-fun b!1249371 () Bool)

(declare-fun e!709087 () Bool)

(assert (=> b!1249371 (= e!709087 tp_is_empty!31519)))

(declare-fun b!1249372 () Bool)

(assert (=> b!1249372 (= e!709086 tp_is_empty!31519)))

(declare-fun b!1249373 () Bool)

(assert (=> b!1249373 (= e!709084 (not true))))

(declare-datatypes ((tuple2!20384 0))(
  ( (tuple2!20385 (_1!10203 (_ BitVec 64)) (_2!10203 V!47391)) )
))
(declare-datatypes ((List!27629 0))(
  ( (Nil!27626) (Cons!27625 (h!28834 tuple2!20384) (t!41100 List!27629)) )
))
(declare-datatypes ((ListLongMap!18257 0))(
  ( (ListLongMap!18258 (toList!9144 List!27629)) )
))
(declare-fun lt!563700 () ListLongMap!18257)

(declare-fun lt!563701 () ListLongMap!18257)

(assert (=> b!1249373 (= lt!563700 lt!563701)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41485 0))(
  ( (Unit!41486) )
))
(declare-fun lt!563699 () Unit!41485)

(declare-fun minValueAfter!43 () V!47391)

(declare-fun zeroValue!871 () V!47391)

(declare-fun minValueBefore!43 () V!47391)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!915 (array!80720 array!80722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47391 V!47391 V!47391 V!47391 (_ BitVec 32) Int) Unit!41485)

(assert (=> b!1249373 (= lt!563699 (lemmaNoChangeToArrayThenSameMapNoExtras!915 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5551 (array!80720 array!80722 (_ BitVec 32) (_ BitVec 32) V!47391 V!47391 (_ BitVec 32) Int) ListLongMap!18257)

(assert (=> b!1249373 (= lt!563701 (getCurrentListMapNoExtraKeys!5551 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249373 (= lt!563700 (getCurrentListMapNoExtraKeys!5551 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249374 () Bool)

(assert (=> b!1249374 (= e!709083 (and e!709087 mapRes!49039))))

(declare-fun condMapEmpty!49039 () Bool)

(declare-fun mapDefault!49039 () ValueCell!14996)

