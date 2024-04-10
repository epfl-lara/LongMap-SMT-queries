; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42192 () Bool)

(assert start!42192)

(declare-fun b_free!11711 () Bool)

(declare-fun b_next!11711 () Bool)

(assert (=> start!42192 (= b_free!11711 (not b_next!11711))))

(declare-fun tp!41158 () Bool)

(declare-fun b_and!20141 () Bool)

(assert (=> start!42192 (= tp!41158 b_and!20141)))

(declare-fun b!470931 () Bool)

(declare-fun e!275941 () Bool)

(declare-fun tp_is_empty!13139 () Bool)

(assert (=> b!470931 (= e!275941 tp_is_empty!13139)))

(declare-fun mapNonEmpty!21412 () Bool)

(declare-fun mapRes!21412 () Bool)

(declare-fun tp!41157 () Bool)

(assert (=> mapNonEmpty!21412 (= mapRes!21412 (and tp!41157 e!275941))))

(declare-datatypes ((V!18623 0))(
  ( (V!18624 (val!6614 Int)) )
))
(declare-datatypes ((ValueCell!6226 0))(
  ( (ValueCellFull!6226 (v!8905 V!18623)) (EmptyCell!6226) )
))
(declare-datatypes ((array!30047 0))(
  ( (array!30048 (arr!14446 (Array (_ BitVec 32) ValueCell!6226)) (size!14798 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30047)

(declare-fun mapValue!21412 () ValueCell!6226)

(declare-fun mapKey!21412 () (_ BitVec 32))

(declare-fun mapRest!21412 () (Array (_ BitVec 32) ValueCell!6226))

(assert (=> mapNonEmpty!21412 (= (arr!14446 _values!833) (store mapRest!21412 mapKey!21412 mapValue!21412))))

(declare-fun res!281365 () Bool)

(declare-fun e!275944 () Bool)

(assert (=> start!42192 (=> (not res!281365) (not e!275944))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42192 (= res!281365 (validMask!0 mask!1365))))

(assert (=> start!42192 e!275944))

(assert (=> start!42192 tp_is_empty!13139))

(assert (=> start!42192 tp!41158))

(assert (=> start!42192 true))

(declare-datatypes ((array!30049 0))(
  ( (array!30050 (arr!14447 (Array (_ BitVec 32) (_ BitVec 64))) (size!14799 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30049)

(declare-fun array_inv!10420 (array!30049) Bool)

(assert (=> start!42192 (array_inv!10420 _keys!1025)))

(declare-fun e!275945 () Bool)

(declare-fun array_inv!10421 (array!30047) Bool)

(assert (=> start!42192 (and (array_inv!10421 _values!833) e!275945)))

(declare-fun b!470932 () Bool)

(assert (=> b!470932 (= e!275944 (not true))))

(declare-datatypes ((tuple2!8712 0))(
  ( (tuple2!8713 (_1!4367 (_ BitVec 64)) (_2!4367 V!18623)) )
))
(declare-datatypes ((List!8792 0))(
  ( (Nil!8789) (Cons!8788 (h!9644 tuple2!8712) (t!14756 List!8792)) )
))
(declare-datatypes ((ListLongMap!7625 0))(
  ( (ListLongMap!7626 (toList!3828 List!8792)) )
))
(declare-fun lt!213669 () ListLongMap!7625)

(declare-fun lt!213668 () ListLongMap!7625)

(assert (=> b!470932 (= lt!213669 lt!213668)))

(declare-fun minValueBefore!38 () V!18623)

(declare-fun zeroValue!794 () V!18623)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13815 0))(
  ( (Unit!13816) )
))
(declare-fun lt!213670 () Unit!13815)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18623)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!171 (array!30049 array!30047 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18623 V!18623 V!18623 V!18623 (_ BitVec 32) Int) Unit!13815)

(assert (=> b!470932 (= lt!213670 (lemmaNoChangeToArrayThenSameMapNoExtras!171 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1991 (array!30049 array!30047 (_ BitVec 32) (_ BitVec 32) V!18623 V!18623 (_ BitVec 32) Int) ListLongMap!7625)

(assert (=> b!470932 (= lt!213668 (getCurrentListMapNoExtraKeys!1991 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470932 (= lt!213669 (getCurrentListMapNoExtraKeys!1991 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470933 () Bool)

(declare-fun res!281363 () Bool)

(assert (=> b!470933 (=> (not res!281363) (not e!275944))))

(assert (=> b!470933 (= res!281363 (and (= (size!14798 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14799 _keys!1025) (size!14798 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470934 () Bool)

(declare-fun e!275942 () Bool)

(assert (=> b!470934 (= e!275945 (and e!275942 mapRes!21412))))

(declare-fun condMapEmpty!21412 () Bool)

(declare-fun mapDefault!21412 () ValueCell!6226)

