; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105106 () Bool)

(assert start!105106)

(declare-fun b_free!26839 () Bool)

(declare-fun b_next!26839 () Bool)

(assert (=> start!105106 (= b_free!26839 (not b_next!26839))))

(declare-fun tp!94019 () Bool)

(declare-fun b_and!44643 () Bool)

(assert (=> start!105106 (= tp!94019 b_and!44643)))

(declare-fun mapNonEmpty!49384 () Bool)

(declare-fun mapRes!49384 () Bool)

(declare-fun tp!94018 () Bool)

(declare-fun e!711413 () Bool)

(assert (=> mapNonEmpty!49384 (= mapRes!49384 (and tp!94018 e!711413))))

(declare-fun mapKey!49384 () (_ BitVec 32))

(declare-datatypes ((V!47687 0))(
  ( (V!47688 (val!15933 Int)) )
))
(declare-datatypes ((ValueCell!15107 0))(
  ( (ValueCellFull!15107 (v!18631 V!47687)) (EmptyCell!15107) )
))
(declare-fun mapValue!49384 () ValueCell!15107)

(declare-datatypes ((array!81144 0))(
  ( (array!81145 (arr!39135 (Array (_ BitVec 32) ValueCell!15107)) (size!39671 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81144)

(declare-fun mapRest!49384 () (Array (_ BitVec 32) ValueCell!15107))

(assert (=> mapNonEmpty!49384 (= (arr!39135 _values!914) (store mapRest!49384 mapKey!49384 mapValue!49384))))

(declare-fun mapIsEmpty!49384 () Bool)

(assert (=> mapIsEmpty!49384 mapRes!49384))

(declare-fun b!1252536 () Bool)

(declare-fun e!711415 () Bool)

(declare-fun e!711411 () Bool)

(assert (=> b!1252536 (= e!711415 (not e!711411))))

(declare-fun res!835297 () Bool)

(assert (=> b!1252536 (=> res!835297 e!711411)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1252536 (= res!835297 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20552 0))(
  ( (tuple2!20553 (_1!10287 (_ BitVec 64)) (_2!10287 V!47687)) )
))
(declare-datatypes ((List!27785 0))(
  ( (Nil!27782) (Cons!27781 (h!28990 tuple2!20552) (t!41264 List!27785)) )
))
(declare-datatypes ((ListLongMap!18425 0))(
  ( (ListLongMap!18426 (toList!9228 List!27785)) )
))
(declare-fun lt!565379 () ListLongMap!18425)

(declare-fun lt!565381 () ListLongMap!18425)

(assert (=> b!1252536 (= lt!565379 lt!565381)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41645 0))(
  ( (Unit!41646) )
))
(declare-fun lt!565382 () Unit!41645)

(declare-fun minValueAfter!43 () V!47687)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47687)

(declare-datatypes ((array!81146 0))(
  ( (array!81147 (arr!39136 (Array (_ BitVec 32) (_ BitVec 64))) (size!39672 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81146)

(declare-fun minValueBefore!43 () V!47687)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!988 (array!81146 array!81144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47687 V!47687 V!47687 V!47687 (_ BitVec 32) Int) Unit!41645)

(assert (=> b!1252536 (= lt!565382 (lemmaNoChangeToArrayThenSameMapNoExtras!988 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5624 (array!81146 array!81144 (_ BitVec 32) (_ BitVec 32) V!47687 V!47687 (_ BitVec 32) Int) ListLongMap!18425)

(assert (=> b!1252536 (= lt!565381 (getCurrentListMapNoExtraKeys!5624 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1252536 (= lt!565379 (getCurrentListMapNoExtraKeys!5624 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252537 () Bool)

(declare-fun res!835294 () Bool)

(assert (=> b!1252537 (=> (not res!835294) (not e!711415))))

(assert (=> b!1252537 (= res!835294 (and (= (size!39671 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39672 _keys!1118) (size!39671 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252538 () Bool)

(assert (=> b!1252538 (= e!711411 true)))

(declare-fun lt!565380 () ListLongMap!18425)

(declare-fun getCurrentListMap!4476 (array!81146 array!81144 (_ BitVec 32) (_ BitVec 32) V!47687 V!47687 (_ BitVec 32) Int) ListLongMap!18425)

(assert (=> b!1252538 (= lt!565380 (getCurrentListMap!4476 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1252539 () Bool)

(declare-fun res!835293 () Bool)

(assert (=> b!1252539 (=> (not res!835293) (not e!711415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81146 (_ BitVec 32)) Bool)

(assert (=> b!1252539 (= res!835293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1252540 () Bool)

(declare-fun res!835295 () Bool)

(assert (=> b!1252540 (=> (not res!835295) (not e!711415))))

(declare-datatypes ((List!27786 0))(
  ( (Nil!27783) (Cons!27782 (h!28991 (_ BitVec 64)) (t!41265 List!27786)) )
))
(declare-fun arrayNoDuplicates!0 (array!81146 (_ BitVec 32) List!27786) Bool)

(assert (=> b!1252540 (= res!835295 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27783))))

(declare-fun b!1252541 () Bool)

(declare-fun e!711414 () Bool)

(declare-fun e!711412 () Bool)

(assert (=> b!1252541 (= e!711414 (and e!711412 mapRes!49384))))

(declare-fun condMapEmpty!49384 () Bool)

(declare-fun mapDefault!49384 () ValueCell!15107)

