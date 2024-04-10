; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41730 () Bool)

(assert start!41730)

(declare-fun b_free!11369 () Bool)

(declare-fun b_next!11369 () Bool)

(assert (=> start!41730 (= b_free!11369 (not b_next!11369))))

(declare-fun tp!40110 () Bool)

(declare-fun b_and!19725 () Bool)

(assert (=> start!41730 (= tp!40110 b_and!19725)))

(declare-fun b!465962 () Bool)

(declare-fun e!272394 () Bool)

(assert (=> b!465962 (= e!272394 true)))

(declare-datatypes ((V!18167 0))(
  ( (V!18168 (val!6443 Int)) )
))
(declare-fun zeroValue!794 () V!18167)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8442 0))(
  ( (tuple2!8443 (_1!4232 (_ BitVec 64)) (_2!4232 V!18167)) )
))
(declare-datatypes ((List!8535 0))(
  ( (Nil!8532) (Cons!8531 (h!9387 tuple2!8442) (t!14485 List!8535)) )
))
(declare-datatypes ((ListLongMap!7355 0))(
  ( (ListLongMap!7356 (toList!3693 List!8535)) )
))
(declare-fun lt!210489 () ListLongMap!7355)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29375 0))(
  ( (array!29376 (arr!14117 (Array (_ BitVec 32) (_ BitVec 64))) (size!14469 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29375)

(declare-datatypes ((ValueCell!6055 0))(
  ( (ValueCellFull!6055 (v!8730 V!18167)) (EmptyCell!6055) )
))
(declare-datatypes ((array!29377 0))(
  ( (array!29378 (arr!14118 (Array (_ BitVec 32) ValueCell!6055)) (size!14470 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29377)

(declare-fun minValueAfter!38 () V!18167)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2146 (array!29375 array!29377 (_ BitVec 32) (_ BitVec 32) V!18167 V!18167 (_ BitVec 32) Int) ListLongMap!7355)

(assert (=> b!465962 (= lt!210489 (getCurrentListMap!2146 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210487 () ListLongMap!7355)

(declare-fun minValueBefore!38 () V!18167)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun +!1652 (ListLongMap!7355 tuple2!8442) ListLongMap!7355)

(assert (=> b!465962 (= lt!210487 (+!1652 (getCurrentListMap!2146 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8443 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun mapNonEmpty!20878 () Bool)

(declare-fun mapRes!20878 () Bool)

(declare-fun tp!40111 () Bool)

(declare-fun e!272398 () Bool)

(assert (=> mapNonEmpty!20878 (= mapRes!20878 (and tp!40111 e!272398))))

(declare-fun mapKey!20878 () (_ BitVec 32))

(declare-fun mapRest!20878 () (Array (_ BitVec 32) ValueCell!6055))

(declare-fun mapValue!20878 () ValueCell!6055)

(assert (=> mapNonEmpty!20878 (= (arr!14118 _values!833) (store mapRest!20878 mapKey!20878 mapValue!20878))))

(declare-fun b!465963 () Bool)

(declare-fun res!278542 () Bool)

(declare-fun e!272396 () Bool)

(assert (=> b!465963 (=> (not res!278542) (not e!272396))))

(assert (=> b!465963 (= res!278542 (and (= (size!14470 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14469 _keys!1025) (size!14470 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465964 () Bool)

(declare-fun tp_is_empty!12797 () Bool)

(assert (=> b!465964 (= e!272398 tp_is_empty!12797)))

(declare-fun b!465965 () Bool)

(declare-fun e!272399 () Bool)

(assert (=> b!465965 (= e!272399 tp_is_empty!12797)))

(declare-fun mapIsEmpty!20878 () Bool)

(assert (=> mapIsEmpty!20878 mapRes!20878))

(declare-fun b!465967 () Bool)

(assert (=> b!465967 (= e!272396 (not e!272394))))

(declare-fun res!278541 () Bool)

(assert (=> b!465967 (=> res!278541 e!272394)))

(assert (=> b!465967 (= res!278541 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210488 () ListLongMap!7355)

(declare-fun lt!210490 () ListLongMap!7355)

(assert (=> b!465967 (= lt!210488 lt!210490)))

(declare-datatypes ((Unit!13552 0))(
  ( (Unit!13553) )
))
(declare-fun lt!210486 () Unit!13552)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!52 (array!29375 array!29377 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18167 V!18167 V!18167 V!18167 (_ BitVec 32) Int) Unit!13552)

(assert (=> b!465967 (= lt!210486 (lemmaNoChangeToArrayThenSameMapNoExtras!52 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1872 (array!29375 array!29377 (_ BitVec 32) (_ BitVec 32) V!18167 V!18167 (_ BitVec 32) Int) ListLongMap!7355)

(assert (=> b!465967 (= lt!210490 (getCurrentListMapNoExtraKeys!1872 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465967 (= lt!210488 (getCurrentListMapNoExtraKeys!1872 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465968 () Bool)

(declare-fun res!278539 () Bool)

(assert (=> b!465968 (=> (not res!278539) (not e!272396))))

(declare-datatypes ((List!8536 0))(
  ( (Nil!8533) (Cons!8532 (h!9388 (_ BitVec 64)) (t!14486 List!8536)) )
))
(declare-fun arrayNoDuplicates!0 (array!29375 (_ BitVec 32) List!8536) Bool)

(assert (=> b!465968 (= res!278539 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8533))))

(declare-fun b!465969 () Bool)

(declare-fun res!278540 () Bool)

(assert (=> b!465969 (=> (not res!278540) (not e!272396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29375 (_ BitVec 32)) Bool)

(assert (=> b!465969 (= res!278540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!278538 () Bool)

(assert (=> start!41730 (=> (not res!278538) (not e!272396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41730 (= res!278538 (validMask!0 mask!1365))))

(assert (=> start!41730 e!272396))

(assert (=> start!41730 tp_is_empty!12797))

(assert (=> start!41730 tp!40110))

(assert (=> start!41730 true))

(declare-fun array_inv!10196 (array!29375) Bool)

(assert (=> start!41730 (array_inv!10196 _keys!1025)))

(declare-fun e!272397 () Bool)

(declare-fun array_inv!10197 (array!29377) Bool)

(assert (=> start!41730 (and (array_inv!10197 _values!833) e!272397)))

(declare-fun b!465966 () Bool)

(assert (=> b!465966 (= e!272397 (and e!272399 mapRes!20878))))

(declare-fun condMapEmpty!20878 () Bool)

(declare-fun mapDefault!20878 () ValueCell!6055)

