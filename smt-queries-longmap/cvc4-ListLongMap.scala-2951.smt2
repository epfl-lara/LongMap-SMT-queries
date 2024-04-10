; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41930 () Bool)

(assert start!41930)

(declare-fun b_free!11519 () Bool)

(declare-fun b_next!11519 () Bool)

(assert (=> start!41930 (= b_free!11519 (not b_next!11519))))

(declare-fun tp!40569 () Bool)

(declare-fun b_and!19907 () Bool)

(assert (=> start!41930 (= tp!40569 b_and!19907)))

(declare-fun b!468134 () Bool)

(declare-fun e!273938 () Bool)

(declare-fun e!273943 () Bool)

(assert (=> b!468134 (= e!273938 (not e!273943))))

(declare-fun res!279780 () Bool)

(assert (=> b!468134 (=> res!279780 e!273943)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468134 (= res!279780 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18367 0))(
  ( (V!18368 (val!6518 Int)) )
))
(declare-datatypes ((tuple2!8562 0))(
  ( (tuple2!8563 (_1!4292 (_ BitVec 64)) (_2!4292 V!18367)) )
))
(declare-datatypes ((List!8651 0))(
  ( (Nil!8648) (Cons!8647 (h!9503 tuple2!8562) (t!14607 List!8651)) )
))
(declare-datatypes ((ListLongMap!7475 0))(
  ( (ListLongMap!7476 (toList!3753 List!8651)) )
))
(declare-fun lt!211681 () ListLongMap!7475)

(declare-fun lt!211683 () ListLongMap!7475)

(assert (=> b!468134 (= lt!211681 lt!211683)))

(declare-fun minValueBefore!38 () V!18367)

(declare-fun zeroValue!794 () V!18367)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29671 0))(
  ( (array!29672 (arr!14262 (Array (_ BitVec 32) (_ BitVec 64))) (size!14614 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29671)

(declare-datatypes ((ValueCell!6130 0))(
  ( (ValueCellFull!6130 (v!8807 V!18367)) (EmptyCell!6130) )
))
(declare-datatypes ((array!29673 0))(
  ( (array!29674 (arr!14263 (Array (_ BitVec 32) ValueCell!6130)) (size!14615 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29673)

(declare-fun minValueAfter!38 () V!18367)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((Unit!13664 0))(
  ( (Unit!13665) )
))
(declare-fun lt!211682 () Unit!13664)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!106 (array!29671 array!29673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18367 V!18367 V!18367 V!18367 (_ BitVec 32) Int) Unit!13664)

(assert (=> b!468134 (= lt!211682 (lemmaNoChangeToArrayThenSameMapNoExtras!106 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1926 (array!29671 array!29673 (_ BitVec 32) (_ BitVec 32) V!18367 V!18367 (_ BitVec 32) Int) ListLongMap!7475)

(assert (=> b!468134 (= lt!211683 (getCurrentListMapNoExtraKeys!1926 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468134 (= lt!211681 (getCurrentListMapNoExtraKeys!1926 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21112 () Bool)

(declare-fun mapRes!21112 () Bool)

(declare-fun tp!40570 () Bool)

(declare-fun e!273940 () Bool)

(assert (=> mapNonEmpty!21112 (= mapRes!21112 (and tp!40570 e!273940))))

(declare-fun mapValue!21112 () ValueCell!6130)

(declare-fun mapRest!21112 () (Array (_ BitVec 32) ValueCell!6130))

(declare-fun mapKey!21112 () (_ BitVec 32))

(assert (=> mapNonEmpty!21112 (= (arr!14263 _values!833) (store mapRest!21112 mapKey!21112 mapValue!21112))))

(declare-fun mapIsEmpty!21112 () Bool)

(assert (=> mapIsEmpty!21112 mapRes!21112))

(declare-fun b!468135 () Bool)

(declare-fun e!273939 () Bool)

(declare-fun e!273942 () Bool)

(assert (=> b!468135 (= e!273939 (and e!273942 mapRes!21112))))

(declare-fun condMapEmpty!21112 () Bool)

(declare-fun mapDefault!21112 () ValueCell!6130)

