; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42354 () Bool)

(assert start!42354)

(declare-fun b_free!11845 () Bool)

(declare-fun b_next!11845 () Bool)

(assert (=> start!42354 (= b_free!11845 (not b_next!11845))))

(declare-fun tp!41565 () Bool)

(declare-fun b_and!20291 () Bool)

(assert (=> start!42354 (= tp!41565 b_and!20291)))

(declare-fun b!472564 () Bool)

(declare-fun e!277116 () Bool)

(assert (=> b!472564 (= e!277116 true)))

(declare-datatypes ((V!18803 0))(
  ( (V!18804 (val!6681 Int)) )
))
(declare-fun minValueBefore!38 () V!18803)

(declare-fun zeroValue!794 () V!18803)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((tuple2!8798 0))(
  ( (tuple2!8799 (_1!4410 (_ BitVec 64)) (_2!4410 V!18803)) )
))
(declare-datatypes ((List!8880 0))(
  ( (Nil!8877) (Cons!8876 (h!9732 tuple2!8798) (t!14848 List!8880)) )
))
(declare-datatypes ((ListLongMap!7711 0))(
  ( (ListLongMap!7712 (toList!3871 List!8880)) )
))
(declare-fun lt!214410 () ListLongMap!7711)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!30303 0))(
  ( (array!30304 (arr!14572 (Array (_ BitVec 32) (_ BitVec 64))) (size!14924 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30303)

(declare-datatypes ((ValueCell!6293 0))(
  ( (ValueCellFull!6293 (v!8972 V!18803)) (EmptyCell!6293) )
))
(declare-datatypes ((array!30305 0))(
  ( (array!30306 (arr!14573 (Array (_ BitVec 32) ValueCell!6293)) (size!14925 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30305)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMap!2241 (array!30303 array!30305 (_ BitVec 32) (_ BitVec 32) V!18803 V!18803 (_ BitVec 32) Int) ListLongMap!7711)

(assert (=> b!472564 (= lt!214410 (getCurrentListMap!2241 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472565 () Bool)

(declare-fun e!277113 () Bool)

(declare-fun tp_is_empty!13273 () Bool)

(assert (=> b!472565 (= e!277113 tp_is_empty!13273)))

(declare-fun res!282285 () Bool)

(declare-fun e!277117 () Bool)

(assert (=> start!42354 (=> (not res!282285) (not e!277117))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42354 (= res!282285 (validMask!0 mask!1365))))

(assert (=> start!42354 e!277117))

(assert (=> start!42354 tp_is_empty!13273))

(assert (=> start!42354 tp!41565))

(assert (=> start!42354 true))

(declare-fun array_inv!10506 (array!30303) Bool)

(assert (=> start!42354 (array_inv!10506 _keys!1025)))

(declare-fun e!277112 () Bool)

(declare-fun array_inv!10507 (array!30305) Bool)

(assert (=> start!42354 (and (array_inv!10507 _values!833) e!277112)))

(declare-fun b!472566 () Bool)

(declare-fun res!282288 () Bool)

(assert (=> b!472566 (=> (not res!282288) (not e!277117))))

(declare-datatypes ((List!8881 0))(
  ( (Nil!8878) (Cons!8877 (h!9733 (_ BitVec 64)) (t!14849 List!8881)) )
))
(declare-fun arrayNoDuplicates!0 (array!30303 (_ BitVec 32) List!8881) Bool)

(assert (=> b!472566 (= res!282288 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8878))))

(declare-fun b!472567 () Bool)

(declare-fun res!282284 () Bool)

(assert (=> b!472567 (=> (not res!282284) (not e!277117))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!472567 (= res!282284 (and (= (size!14925 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14924 _keys!1025) (size!14925 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472568 () Bool)

(declare-fun e!277115 () Bool)

(assert (=> b!472568 (= e!277115 tp_is_empty!13273)))

(declare-fun mapIsEmpty!21619 () Bool)

(declare-fun mapRes!21619 () Bool)

(assert (=> mapIsEmpty!21619 mapRes!21619))

(declare-fun b!472569 () Bool)

(assert (=> b!472569 (= e!277112 (and e!277115 mapRes!21619))))

(declare-fun condMapEmpty!21619 () Bool)

(declare-fun mapDefault!21619 () ValueCell!6293)

