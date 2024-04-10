; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104804 () Bool)

(assert start!104804)

(declare-fun b_free!26609 () Bool)

(declare-fun b_next!26609 () Bool)

(assert (=> start!104804 (= b_free!26609 (not b_next!26609))))

(declare-fun tp!93317 () Bool)

(declare-fun b_and!44377 () Bool)

(assert (=> start!104804 (= tp!93317 b_and!44377)))

(declare-fun b!1249284 () Bool)

(declare-fun e!709023 () Bool)

(declare-fun tp_is_empty!31511 () Bool)

(assert (=> b!1249284 (= e!709023 tp_is_empty!31511)))

(declare-fun res!833376 () Bool)

(declare-fun e!709027 () Bool)

(assert (=> start!104804 (=> (not res!833376) (not e!709027))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104804 (= res!833376 (validMask!0 mask!1466))))

(assert (=> start!104804 e!709027))

(assert (=> start!104804 true))

(assert (=> start!104804 tp!93317))

(assert (=> start!104804 tp_is_empty!31511))

(declare-datatypes ((array!80704 0))(
  ( (array!80705 (arr!38919 (Array (_ BitVec 32) (_ BitVec 64))) (size!39455 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80704)

(declare-fun array_inv!29701 (array!80704) Bool)

(assert (=> start!104804 (array_inv!29701 _keys!1118)))

(declare-datatypes ((V!47379 0))(
  ( (V!47380 (val!15818 Int)) )
))
(declare-datatypes ((ValueCell!14992 0))(
  ( (ValueCellFull!14992 (v!18514 V!47379)) (EmptyCell!14992) )
))
(declare-datatypes ((array!80706 0))(
  ( (array!80707 (arr!38920 (Array (_ BitVec 32) ValueCell!14992)) (size!39456 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80706)

(declare-fun e!709025 () Bool)

(declare-fun array_inv!29702 (array!80706) Bool)

(assert (=> start!104804 (and (array_inv!29702 _values!914) e!709025)))

(declare-fun mapNonEmpty!49027 () Bool)

(declare-fun mapRes!49027 () Bool)

(declare-fun tp!93316 () Bool)

(declare-fun e!709026 () Bool)

(assert (=> mapNonEmpty!49027 (= mapRes!49027 (and tp!93316 e!709026))))

(declare-fun mapKey!49027 () (_ BitVec 32))

(declare-fun mapValue!49027 () ValueCell!14992)

(declare-fun mapRest!49027 () (Array (_ BitVec 32) ValueCell!14992))

(assert (=> mapNonEmpty!49027 (= (arr!38920 _values!914) (store mapRest!49027 mapKey!49027 mapValue!49027))))

(declare-fun mapIsEmpty!49027 () Bool)

(assert (=> mapIsEmpty!49027 mapRes!49027))

(declare-fun b!1249285 () Bool)

(declare-fun res!833378 () Bool)

(assert (=> b!1249285 (=> (not res!833378) (not e!709027))))

(declare-datatypes ((List!27624 0))(
  ( (Nil!27621) (Cons!27620 (h!28829 (_ BitVec 64)) (t!41095 List!27624)) )
))
(declare-fun arrayNoDuplicates!0 (array!80704 (_ BitVec 32) List!27624) Bool)

(assert (=> b!1249285 (= res!833378 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27621))))

(declare-fun b!1249286 () Bool)

(declare-fun res!833377 () Bool)

(assert (=> b!1249286 (=> (not res!833377) (not e!709027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80704 (_ BitVec 32)) Bool)

(assert (=> b!1249286 (= res!833377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249287 () Bool)

(declare-fun res!833379 () Bool)

(assert (=> b!1249287 (=> (not res!833379) (not e!709027))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249287 (= res!833379 (and (= (size!39456 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39455 _keys!1118) (size!39456 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249288 () Bool)

(assert (=> b!1249288 (= e!709027 (not true))))

(declare-datatypes ((tuple2!20380 0))(
  ( (tuple2!20381 (_1!10201 (_ BitVec 64)) (_2!10201 V!47379)) )
))
(declare-datatypes ((List!27625 0))(
  ( (Nil!27622) (Cons!27621 (h!28830 tuple2!20380) (t!41096 List!27625)) )
))
(declare-datatypes ((ListLongMap!18253 0))(
  ( (ListLongMap!18254 (toList!9142 List!27625)) )
))
(declare-fun lt!563663 () ListLongMap!18253)

(declare-fun lt!563664 () ListLongMap!18253)

(assert (=> b!1249288 (= lt!563663 lt!563664)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47379)

(declare-datatypes ((Unit!41481 0))(
  ( (Unit!41482) )
))
(declare-fun lt!563665 () Unit!41481)

(declare-fun zeroValue!871 () V!47379)

(declare-fun minValueBefore!43 () V!47379)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!913 (array!80704 array!80706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47379 V!47379 V!47379 V!47379 (_ BitVec 32) Int) Unit!41481)

(assert (=> b!1249288 (= lt!563665 (lemmaNoChangeToArrayThenSameMapNoExtras!913 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5549 (array!80704 array!80706 (_ BitVec 32) (_ BitVec 32) V!47379 V!47379 (_ BitVec 32) Int) ListLongMap!18253)

(assert (=> b!1249288 (= lt!563664 (getCurrentListMapNoExtraKeys!5549 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1249288 (= lt!563663 (getCurrentListMapNoExtraKeys!5549 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1249289 () Bool)

(assert (=> b!1249289 (= e!709026 tp_is_empty!31511)))

(declare-fun b!1249290 () Bool)

(assert (=> b!1249290 (= e!709025 (and e!709023 mapRes!49027))))

(declare-fun condMapEmpty!49027 () Bool)

(declare-fun mapDefault!49027 () ValueCell!14992)

