; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42216 () Bool)

(assert start!42216)

(declare-fun b_free!11735 () Bool)

(declare-fun b_next!11735 () Bool)

(assert (=> start!42216 (= b_free!11735 (not b_next!11735))))

(declare-fun tp!41230 () Bool)

(declare-fun b_and!20165 () Bool)

(assert (=> start!42216 (= tp!41230 b_and!20165)))

(declare-fun b!471183 () Bool)

(declare-fun res!281508 () Bool)

(declare-fun e!276125 () Bool)

(assert (=> b!471183 (=> (not res!281508) (not e!276125))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30091 0))(
  ( (array!30092 (arr!14468 (Array (_ BitVec 32) (_ BitVec 64))) (size!14820 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30091)

(declare-datatypes ((V!18655 0))(
  ( (V!18656 (val!6626 Int)) )
))
(declare-datatypes ((ValueCell!6238 0))(
  ( (ValueCellFull!6238 (v!8917 V!18655)) (EmptyCell!6238) )
))
(declare-datatypes ((array!30093 0))(
  ( (array!30094 (arr!14469 (Array (_ BitVec 32) ValueCell!6238)) (size!14821 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30093)

(assert (=> b!471183 (= res!281508 (and (= (size!14821 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14820 _keys!1025) (size!14821 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471184 () Bool)

(declare-fun e!276122 () Bool)

(declare-fun tp_is_empty!13163 () Bool)

(assert (=> b!471184 (= e!276122 tp_is_empty!13163)))

(declare-fun res!281507 () Bool)

(assert (=> start!42216 (=> (not res!281507) (not e!276125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42216 (= res!281507 (validMask!0 mask!1365))))

(assert (=> start!42216 e!276125))

(assert (=> start!42216 tp_is_empty!13163))

(assert (=> start!42216 tp!41230))

(assert (=> start!42216 true))

(declare-fun array_inv!10436 (array!30091) Bool)

(assert (=> start!42216 (array_inv!10436 _keys!1025)))

(declare-fun e!276123 () Bool)

(declare-fun array_inv!10437 (array!30093) Bool)

(assert (=> start!42216 (and (array_inv!10437 _values!833) e!276123)))

(declare-fun b!471185 () Bool)

(assert (=> b!471185 (= e!276125 (not true))))

(declare-datatypes ((tuple2!8726 0))(
  ( (tuple2!8727 (_1!4374 (_ BitVec 64)) (_2!4374 V!18655)) )
))
(declare-datatypes ((List!8806 0))(
  ( (Nil!8803) (Cons!8802 (h!9658 tuple2!8726) (t!14770 List!8806)) )
))
(declare-datatypes ((ListLongMap!7639 0))(
  ( (ListLongMap!7640 (toList!3835 List!8806)) )
))
(declare-fun lt!213778 () ListLongMap!7639)

(declare-fun lt!213776 () ListLongMap!7639)

(assert (=> b!471185 (= lt!213778 lt!213776)))

(declare-fun minValueBefore!38 () V!18655)

(declare-fun zeroValue!794 () V!18655)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13829 0))(
  ( (Unit!13830) )
))
(declare-fun lt!213777 () Unit!13829)

(declare-fun minValueAfter!38 () V!18655)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!178 (array!30091 array!30093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18655 V!18655 V!18655 V!18655 (_ BitVec 32) Int) Unit!13829)

(assert (=> b!471185 (= lt!213777 (lemmaNoChangeToArrayThenSameMapNoExtras!178 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1998 (array!30091 array!30093 (_ BitVec 32) (_ BitVec 32) V!18655 V!18655 (_ BitVec 32) Int) ListLongMap!7639)

(assert (=> b!471185 (= lt!213776 (getCurrentListMapNoExtraKeys!1998 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471185 (= lt!213778 (getCurrentListMapNoExtraKeys!1998 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471186 () Bool)

(declare-fun e!276124 () Bool)

(assert (=> b!471186 (= e!276124 tp_is_empty!13163)))

(declare-fun b!471187 () Bool)

(declare-fun res!281509 () Bool)

(assert (=> b!471187 (=> (not res!281509) (not e!276125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30091 (_ BitVec 32)) Bool)

(assert (=> b!471187 (= res!281509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471188 () Bool)

(declare-fun res!281506 () Bool)

(assert (=> b!471188 (=> (not res!281506) (not e!276125))))

(declare-datatypes ((List!8807 0))(
  ( (Nil!8804) (Cons!8803 (h!9659 (_ BitVec 64)) (t!14771 List!8807)) )
))
(declare-fun arrayNoDuplicates!0 (array!30091 (_ BitVec 32) List!8807) Bool)

(assert (=> b!471188 (= res!281506 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8804))))

(declare-fun mapNonEmpty!21448 () Bool)

(declare-fun mapRes!21448 () Bool)

(declare-fun tp!41229 () Bool)

(assert (=> mapNonEmpty!21448 (= mapRes!21448 (and tp!41229 e!276122))))

(declare-fun mapRest!21448 () (Array (_ BitVec 32) ValueCell!6238))

(declare-fun mapKey!21448 () (_ BitVec 32))

(declare-fun mapValue!21448 () ValueCell!6238)

(assert (=> mapNonEmpty!21448 (= (arr!14469 _values!833) (store mapRest!21448 mapKey!21448 mapValue!21448))))

(declare-fun mapIsEmpty!21448 () Bool)

(assert (=> mapIsEmpty!21448 mapRes!21448))

(declare-fun b!471189 () Bool)

(assert (=> b!471189 (= e!276123 (and e!276124 mapRes!21448))))

(declare-fun condMapEmpty!21448 () Bool)

(declare-fun mapDefault!21448 () ValueCell!6238)

