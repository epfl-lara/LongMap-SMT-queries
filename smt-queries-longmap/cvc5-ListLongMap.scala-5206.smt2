; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70268 () Bool)

(assert start!70268)

(declare-fun b_free!12643 () Bool)

(declare-fun b_next!12643 () Bool)

(assert (=> start!70268 (= b_free!12643 (not b_next!12643))))

(declare-fun tp!44653 () Bool)

(declare-fun b_and!21443 () Bool)

(assert (=> start!70268 (= tp!44653 b_and!21443)))

(declare-fun res!557346 () Bool)

(declare-fun e!452810 () Bool)

(assert (=> start!70268 (=> (not res!557346) (not e!452810))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70268 (= res!557346 (validMask!0 mask!1312))))

(assert (=> start!70268 e!452810))

(declare-fun tp_is_empty!14353 () Bool)

(assert (=> start!70268 tp_is_empty!14353))

(declare-datatypes ((array!44908 0))(
  ( (array!44909 (arr!21511 (Array (_ BitVec 32) (_ BitVec 64))) (size!21932 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44908)

(declare-fun array_inv!17211 (array!44908) Bool)

(assert (=> start!70268 (array_inv!17211 _keys!976)))

(assert (=> start!70268 true))

(declare-datatypes ((V!24139 0))(
  ( (V!24140 (val!7224 Int)) )
))
(declare-datatypes ((ValueCell!6761 0))(
  ( (ValueCellFull!6761 (v!9652 V!24139)) (EmptyCell!6761) )
))
(declare-datatypes ((array!44910 0))(
  ( (array!44911 (arr!21512 (Array (_ BitVec 32) ValueCell!6761)) (size!21933 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44910)

(declare-fun e!452807 () Bool)

(declare-fun array_inv!17212 (array!44910) Bool)

(assert (=> start!70268 (and (array_inv!17212 _values!788) e!452807)))

(assert (=> start!70268 tp!44653))

(declare-fun mapNonEmpty!23119 () Bool)

(declare-fun mapRes!23119 () Bool)

(declare-fun tp!44652 () Bool)

(declare-fun e!452808 () Bool)

(assert (=> mapNonEmpty!23119 (= mapRes!23119 (and tp!44652 e!452808))))

(declare-fun mapKey!23119 () (_ BitVec 32))

(declare-fun mapValue!23119 () ValueCell!6761)

(declare-fun mapRest!23119 () (Array (_ BitVec 32) ValueCell!6761))

(assert (=> mapNonEmpty!23119 (= (arr!21512 _values!788) (store mapRest!23119 mapKey!23119 mapValue!23119))))

(declare-fun mapIsEmpty!23119 () Bool)

(assert (=> mapIsEmpty!23119 mapRes!23119))

(declare-fun b!816343 () Bool)

(declare-fun res!557345 () Bool)

(assert (=> b!816343 (=> (not res!557345) (not e!452810))))

(declare-datatypes ((List!15317 0))(
  ( (Nil!15314) (Cons!15313 (h!16442 (_ BitVec 64)) (t!21640 List!15317)) )
))
(declare-fun arrayNoDuplicates!0 (array!44908 (_ BitVec 32) List!15317) Bool)

(assert (=> b!816343 (= res!557345 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15314))))

(declare-fun b!816344 () Bool)

(declare-fun e!452809 () Bool)

(assert (=> b!816344 (= e!452809 true)))

(declare-fun zeroValueAfter!34 () V!24139)

(declare-fun minValue!754 () V!24139)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!9488 0))(
  ( (tuple2!9489 (_1!4755 (_ BitVec 64)) (_2!4755 V!24139)) )
))
(declare-datatypes ((List!15318 0))(
  ( (Nil!15315) (Cons!15314 (h!16443 tuple2!9488) (t!21641 List!15318)) )
))
(declare-datatypes ((ListLongMap!8311 0))(
  ( (ListLongMap!8312 (toList!4171 List!15318)) )
))
(declare-fun lt!365616 () ListLongMap!8311)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2397 (array!44908 array!44910 (_ BitVec 32) (_ BitVec 32) V!24139 V!24139 (_ BitVec 32) Int) ListLongMap!8311)

(assert (=> b!816344 (= lt!365616 (getCurrentListMap!2397 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24139)

(declare-fun lt!365615 () ListLongMap!8311)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun +!1803 (ListLongMap!8311 tuple2!9488) ListLongMap!8311)

(assert (=> b!816344 (= lt!365615 (+!1803 (getCurrentListMap!2397 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816345 () Bool)

(assert (=> b!816345 (= e!452808 tp_is_empty!14353)))

(declare-fun b!816346 () Bool)

(declare-fun e!452812 () Bool)

(assert (=> b!816346 (= e!452812 tp_is_empty!14353)))

(declare-fun b!816347 () Bool)

(assert (=> b!816347 (= e!452810 (not e!452809))))

(declare-fun res!557343 () Bool)

(assert (=> b!816347 (=> res!557343 e!452809)))

(assert (=> b!816347 (= res!557343 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365614 () ListLongMap!8311)

(declare-fun lt!365613 () ListLongMap!8311)

(assert (=> b!816347 (= lt!365614 lt!365613)))

(declare-datatypes ((Unit!27832 0))(
  ( (Unit!27833) )
))
(declare-fun lt!365617 () Unit!27832)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!326 (array!44908 array!44910 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24139 V!24139 V!24139 V!24139 (_ BitVec 32) Int) Unit!27832)

(assert (=> b!816347 (= lt!365617 (lemmaNoChangeToArrayThenSameMapNoExtras!326 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2216 (array!44908 array!44910 (_ BitVec 32) (_ BitVec 32) V!24139 V!24139 (_ BitVec 32) Int) ListLongMap!8311)

(assert (=> b!816347 (= lt!365613 (getCurrentListMapNoExtraKeys!2216 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816347 (= lt!365614 (getCurrentListMapNoExtraKeys!2216 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816348 () Bool)

(assert (=> b!816348 (= e!452807 (and e!452812 mapRes!23119))))

(declare-fun condMapEmpty!23119 () Bool)

(declare-fun mapDefault!23119 () ValueCell!6761)

