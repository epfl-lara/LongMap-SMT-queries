; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42194 () Bool)

(assert start!42194)

(declare-fun b_free!11713 () Bool)

(declare-fun b_next!11713 () Bool)

(assert (=> start!42194 (= b_free!11713 (not b_next!11713))))

(declare-fun tp!41164 () Bool)

(declare-fun b_and!20143 () Bool)

(assert (=> start!42194 (= tp!41164 b_and!20143)))

(declare-fun b!470952 () Bool)

(declare-fun e!275958 () Bool)

(declare-fun tp_is_empty!13141 () Bool)

(assert (=> b!470952 (= e!275958 tp_is_empty!13141)))

(declare-fun b!470953 () Bool)

(declare-fun e!275956 () Bool)

(assert (=> b!470953 (= e!275956 tp_is_empty!13141)))

(declare-fun res!281375 () Bool)

(declare-fun e!275959 () Bool)

(assert (=> start!42194 (=> (not res!281375) (not e!275959))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42194 (= res!281375 (validMask!0 mask!1365))))

(assert (=> start!42194 e!275959))

(assert (=> start!42194 tp_is_empty!13141))

(assert (=> start!42194 tp!41164))

(assert (=> start!42194 true))

(declare-datatypes ((array!30051 0))(
  ( (array!30052 (arr!14448 (Array (_ BitVec 32) (_ BitVec 64))) (size!14800 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30051)

(declare-fun array_inv!10422 (array!30051) Bool)

(assert (=> start!42194 (array_inv!10422 _keys!1025)))

(declare-datatypes ((V!18627 0))(
  ( (V!18628 (val!6615 Int)) )
))
(declare-datatypes ((ValueCell!6227 0))(
  ( (ValueCellFull!6227 (v!8906 V!18627)) (EmptyCell!6227) )
))
(declare-datatypes ((array!30053 0))(
  ( (array!30054 (arr!14449 (Array (_ BitVec 32) ValueCell!6227)) (size!14801 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30053)

(declare-fun e!275957 () Bool)

(declare-fun array_inv!10423 (array!30053) Bool)

(assert (=> start!42194 (and (array_inv!10423 _values!833) e!275957)))

(declare-fun b!470954 () Bool)

(declare-fun res!281374 () Bool)

(assert (=> b!470954 (=> (not res!281374) (not e!275959))))

(declare-datatypes ((List!8793 0))(
  ( (Nil!8790) (Cons!8789 (h!9645 (_ BitVec 64)) (t!14757 List!8793)) )
))
(declare-fun arrayNoDuplicates!0 (array!30051 (_ BitVec 32) List!8793) Bool)

(assert (=> b!470954 (= res!281374 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8790))))

(declare-fun mapIsEmpty!21415 () Bool)

(declare-fun mapRes!21415 () Bool)

(assert (=> mapIsEmpty!21415 mapRes!21415))

(declare-fun b!470955 () Bool)

(assert (=> b!470955 (= e!275959 (not true))))

(declare-datatypes ((tuple2!8714 0))(
  ( (tuple2!8715 (_1!4368 (_ BitVec 64)) (_2!4368 V!18627)) )
))
(declare-datatypes ((List!8794 0))(
  ( (Nil!8791) (Cons!8790 (h!9646 tuple2!8714) (t!14758 List!8794)) )
))
(declare-datatypes ((ListLongMap!7627 0))(
  ( (ListLongMap!7628 (toList!3829 List!8794)) )
))
(declare-fun lt!213677 () ListLongMap!7627)

(declare-fun lt!213679 () ListLongMap!7627)

(assert (=> b!470955 (= lt!213677 lt!213679)))

(declare-fun minValueBefore!38 () V!18627)

(declare-datatypes ((Unit!13817 0))(
  ( (Unit!13818) )
))
(declare-fun lt!213678 () Unit!13817)

(declare-fun zeroValue!794 () V!18627)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18627)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!172 (array!30051 array!30053 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18627 V!18627 V!18627 V!18627 (_ BitVec 32) Int) Unit!13817)

(assert (=> b!470955 (= lt!213678 (lemmaNoChangeToArrayThenSameMapNoExtras!172 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1992 (array!30051 array!30053 (_ BitVec 32) (_ BitVec 32) V!18627 V!18627 (_ BitVec 32) Int) ListLongMap!7627)

(assert (=> b!470955 (= lt!213679 (getCurrentListMapNoExtraKeys!1992 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470955 (= lt!213677 (getCurrentListMapNoExtraKeys!1992 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21415 () Bool)

(declare-fun tp!41163 () Bool)

(assert (=> mapNonEmpty!21415 (= mapRes!21415 (and tp!41163 e!275958))))

(declare-fun mapRest!21415 () (Array (_ BitVec 32) ValueCell!6227))

(declare-fun mapKey!21415 () (_ BitVec 32))

(declare-fun mapValue!21415 () ValueCell!6227)

(assert (=> mapNonEmpty!21415 (= (arr!14449 _values!833) (store mapRest!21415 mapKey!21415 mapValue!21415))))

(declare-fun b!470956 () Bool)

(declare-fun res!281377 () Bool)

(assert (=> b!470956 (=> (not res!281377) (not e!275959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30051 (_ BitVec 32)) Bool)

(assert (=> b!470956 (= res!281377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470957 () Bool)

(declare-fun res!281376 () Bool)

(assert (=> b!470957 (=> (not res!281376) (not e!275959))))

(assert (=> b!470957 (= res!281376 (and (= (size!14801 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14800 _keys!1025) (size!14801 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470958 () Bool)

(assert (=> b!470958 (= e!275957 (and e!275956 mapRes!21415))))

(declare-fun condMapEmpty!21415 () Bool)

(declare-fun mapDefault!21415 () ValueCell!6227)

