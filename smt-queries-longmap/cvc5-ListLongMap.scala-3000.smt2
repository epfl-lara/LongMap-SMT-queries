; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42318 () Bool)

(assert start!42318)

(declare-fun b_free!11809 () Bool)

(declare-fun b_next!11809 () Bool)

(assert (=> start!42318 (= b_free!11809 (not b_next!11809))))

(declare-fun tp!41458 () Bool)

(declare-fun b_and!20255 () Bool)

(assert (=> start!42318 (= tp!41458 b_and!20255)))

(declare-fun b!472132 () Bool)

(declare-fun e!276788 () Bool)

(declare-fun tp_is_empty!13237 () Bool)

(assert (=> b!472132 (= e!276788 tp_is_empty!13237)))

(declare-fun b!472133 () Bool)

(declare-fun e!276791 () Bool)

(assert (=> b!472133 (= e!276791 tp_is_empty!13237)))

(declare-fun b!472134 () Bool)

(declare-fun e!276792 () Bool)

(assert (=> b!472134 (= e!276792 true)))

(declare-datatypes ((V!18755 0))(
  ( (V!18756 (val!6663 Int)) )
))
(declare-fun minValueBefore!38 () V!18755)

(declare-fun zeroValue!794 () V!18755)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8770 0))(
  ( (tuple2!8771 (_1!4396 (_ BitVec 64)) (_2!4396 V!18755)) )
))
(declare-datatypes ((List!8854 0))(
  ( (Nil!8851) (Cons!8850 (h!9706 tuple2!8770) (t!14822 List!8854)) )
))
(declare-datatypes ((ListLongMap!7683 0))(
  ( (ListLongMap!7684 (toList!3857 List!8854)) )
))
(declare-fun lt!214192 () ListLongMap!7683)

(declare-datatypes ((array!30233 0))(
  ( (array!30234 (arr!14537 (Array (_ BitVec 32) (_ BitVec 64))) (size!14889 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30233)

(declare-datatypes ((ValueCell!6275 0))(
  ( (ValueCellFull!6275 (v!8954 V!18755)) (EmptyCell!6275) )
))
(declare-datatypes ((array!30235 0))(
  ( (array!30236 (arr!14538 (Array (_ BitVec 32) ValueCell!6275)) (size!14890 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30235)

(declare-fun getCurrentListMap!2228 (array!30233 array!30235 (_ BitVec 32) (_ BitVec 32) V!18755 V!18755 (_ BitVec 32) Int) ListLongMap!7683)

(assert (=> b!472134 (= lt!214192 (getCurrentListMap!2228 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21565 () Bool)

(declare-fun mapRes!21565 () Bool)

(declare-fun tp!41457 () Bool)

(assert (=> mapNonEmpty!21565 (= mapRes!21565 (and tp!41457 e!276791))))

(declare-fun mapValue!21565 () ValueCell!6275)

(declare-fun mapRest!21565 () (Array (_ BitVec 32) ValueCell!6275))

(declare-fun mapKey!21565 () (_ BitVec 32))

(assert (=> mapNonEmpty!21565 (= (arr!14538 _values!833) (store mapRest!21565 mapKey!21565 mapValue!21565))))

(declare-fun mapIsEmpty!21565 () Bool)

(assert (=> mapIsEmpty!21565 mapRes!21565))

(declare-fun b!472135 () Bool)

(declare-fun e!276793 () Bool)

(assert (=> b!472135 (= e!276793 (not e!276792))))

(declare-fun res!282017 () Bool)

(assert (=> b!472135 (=> res!282017 e!276792)))

(assert (=> b!472135 (= res!282017 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!214191 () ListLongMap!7683)

(declare-fun lt!214193 () ListLongMap!7683)

(assert (=> b!472135 (= lt!214191 lt!214193)))

(declare-datatypes ((Unit!13873 0))(
  ( (Unit!13874) )
))
(declare-fun lt!214194 () Unit!13873)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18755)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!200 (array!30233 array!30235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18755 V!18755 V!18755 V!18755 (_ BitVec 32) Int) Unit!13873)

(assert (=> b!472135 (= lt!214194 (lemmaNoChangeToArrayThenSameMapNoExtras!200 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2020 (array!30233 array!30235 (_ BitVec 32) (_ BitVec 32) V!18755 V!18755 (_ BitVec 32) Int) ListLongMap!7683)

(assert (=> b!472135 (= lt!214193 (getCurrentListMapNoExtraKeys!2020 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472135 (= lt!214191 (getCurrentListMapNoExtraKeys!2020 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472137 () Bool)

(declare-fun e!276789 () Bool)

(assert (=> b!472137 (= e!276789 (and e!276788 mapRes!21565))))

(declare-fun condMapEmpty!21565 () Bool)

(declare-fun mapDefault!21565 () ValueCell!6275)

