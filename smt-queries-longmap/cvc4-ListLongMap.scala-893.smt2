; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20458 () Bool)

(assert start!20458)

(declare-fun b_free!5117 () Bool)

(declare-fun b_next!5117 () Bool)

(assert (=> start!20458 (= b_free!5117 (not b_next!5117))))

(declare-fun tp!18382 () Bool)

(declare-fun b_and!11863 () Bool)

(assert (=> start!20458 (= tp!18382 b_and!11863)))

(declare-fun b!202743 () Bool)

(declare-fun res!97232 () Bool)

(declare-fun e!132781 () Bool)

(assert (=> b!202743 (=> (not res!97232) (not e!132781))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9171 0))(
  ( (array!9172 (arr!4336 (Array (_ BitVec 32) (_ BitVec 64))) (size!4661 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9171)

(assert (=> b!202743 (= res!97232 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4661 _keys!825))))))

(declare-fun b!202744 () Bool)

(declare-fun e!132778 () Bool)

(declare-fun tp_is_empty!4973 () Bool)

(assert (=> b!202744 (= e!132778 tp_is_empty!4973)))

(declare-fun b!202745 () Bool)

(declare-fun res!97237 () Bool)

(assert (=> b!202745 (=> (not res!97237) (not e!132781))))

(declare-datatypes ((List!2743 0))(
  ( (Nil!2740) (Cons!2739 (h!3381 (_ BitVec 64)) (t!7674 List!2743)) )
))
(declare-fun arrayNoDuplicates!0 (array!9171 (_ BitVec 32) List!2743) Bool)

(assert (=> b!202745 (= res!97237 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2740))))

(declare-fun b!202746 () Bool)

(declare-fun res!97239 () Bool)

(assert (=> b!202746 (=> (not res!97239) (not e!132781))))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!202746 (= res!97239 (= (select (arr!4336 _keys!825) i!601) k!843))))

(declare-fun mapNonEmpty!8528 () Bool)

(declare-fun mapRes!8528 () Bool)

(declare-fun tp!18383 () Bool)

(assert (=> mapNonEmpty!8528 (= mapRes!8528 (and tp!18383 e!132778))))

(declare-datatypes ((V!6277 0))(
  ( (V!6278 (val!2531 Int)) )
))
(declare-datatypes ((ValueCell!2143 0))(
  ( (ValueCellFull!2143 (v!4501 V!6277)) (EmptyCell!2143) )
))
(declare-datatypes ((array!9173 0))(
  ( (array!9174 (arr!4337 (Array (_ BitVec 32) ValueCell!2143)) (size!4662 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9173)

(declare-fun mapValue!8528 () ValueCell!2143)

(declare-fun mapKey!8528 () (_ BitVec 32))

(declare-fun mapRest!8528 () (Array (_ BitVec 32) ValueCell!2143))

(assert (=> mapNonEmpty!8528 (= (arr!4337 _values!649) (store mapRest!8528 mapKey!8528 mapValue!8528))))

(declare-fun b!202747 () Bool)

(declare-fun e!132777 () Bool)

(assert (=> b!202747 (= e!132777 true)))

(declare-datatypes ((tuple2!3840 0))(
  ( (tuple2!3841 (_1!1931 (_ BitVec 64)) (_2!1931 V!6277)) )
))
(declare-datatypes ((List!2744 0))(
  ( (Nil!2741) (Cons!2740 (h!3382 tuple2!3840) (t!7675 List!2744)) )
))
(declare-datatypes ((ListLongMap!2753 0))(
  ( (ListLongMap!2754 (toList!1392 List!2744)) )
))
(declare-fun lt!101930 () ListLongMap!2753)

(declare-fun lt!101920 () ListLongMap!2753)

(declare-fun lt!101931 () tuple2!3840)

(declare-fun +!419 (ListLongMap!2753 tuple2!3840) ListLongMap!2753)

(assert (=> b!202747 (= lt!101930 (+!419 lt!101920 lt!101931))))

(declare-fun v!520 () V!6277)

(declare-datatypes ((Unit!6132 0))(
  ( (Unit!6133) )
))
(declare-fun lt!101922 () Unit!6132)

(declare-fun zeroValue!615 () V!6277)

(declare-fun lt!101924 () ListLongMap!2753)

(declare-fun addCommutativeForDiffKeys!135 (ListLongMap!2753 (_ BitVec 64) V!6277 (_ BitVec 64) V!6277) Unit!6132)

(assert (=> b!202747 (= lt!101922 (addCommutativeForDiffKeys!135 lt!101924 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202748 () Bool)

(declare-fun e!132780 () Bool)

(assert (=> b!202748 (= e!132781 (not e!132780))))

(declare-fun res!97236 () Bool)

(assert (=> b!202748 (=> res!97236 e!132780)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202748 (= res!97236 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!101926 () ListLongMap!2753)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6277)

(declare-fun getCurrentListMap!971 (array!9171 array!9173 (_ BitVec 32) (_ BitVec 32) V!6277 V!6277 (_ BitVec 32) Int) ListLongMap!2753)

(assert (=> b!202748 (= lt!101926 (getCurrentListMap!971 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101923 () array!9173)

(declare-fun lt!101925 () ListLongMap!2753)

(assert (=> b!202748 (= lt!101925 (getCurrentListMap!971 _keys!825 lt!101923 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101927 () ListLongMap!2753)

(declare-fun lt!101928 () ListLongMap!2753)

(assert (=> b!202748 (and (= lt!101927 lt!101928) (= lt!101928 lt!101927))))

(assert (=> b!202748 (= lt!101928 (+!419 lt!101924 lt!101931))))

(assert (=> b!202748 (= lt!101931 (tuple2!3841 k!843 v!520))))

(declare-fun lt!101929 () Unit!6132)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!84 (array!9171 array!9173 (_ BitVec 32) (_ BitVec 32) V!6277 V!6277 (_ BitVec 32) (_ BitVec 64) V!6277 (_ BitVec 32) Int) Unit!6132)

(assert (=> b!202748 (= lt!101929 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!84 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!345 (array!9171 array!9173 (_ BitVec 32) (_ BitVec 32) V!6277 V!6277 (_ BitVec 32) Int) ListLongMap!2753)

(assert (=> b!202748 (= lt!101927 (getCurrentListMapNoExtraKeys!345 _keys!825 lt!101923 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202748 (= lt!101923 (array!9174 (store (arr!4337 _values!649) i!601 (ValueCellFull!2143 v!520)) (size!4662 _values!649)))))

(assert (=> b!202748 (= lt!101924 (getCurrentListMapNoExtraKeys!345 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202749 () Bool)

(assert (=> b!202749 (= e!132780 e!132777)))

(declare-fun res!97238 () Bool)

(assert (=> b!202749 (=> res!97238 e!132777)))

(assert (=> b!202749 (= res!97238 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!202749 (= lt!101925 lt!101930)))

(declare-fun lt!101921 () tuple2!3840)

(assert (=> b!202749 (= lt!101930 (+!419 lt!101928 lt!101921))))

(assert (=> b!202749 (= lt!101926 lt!101920)))

(assert (=> b!202749 (= lt!101920 (+!419 lt!101924 lt!101921))))

(assert (=> b!202749 (= lt!101925 (+!419 lt!101927 lt!101921))))

(assert (=> b!202749 (= lt!101921 (tuple2!3841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!8528 () Bool)

(assert (=> mapIsEmpty!8528 mapRes!8528))

(declare-fun b!202750 () Bool)

(declare-fun e!132782 () Bool)

(assert (=> b!202750 (= e!132782 tp_is_empty!4973)))

(declare-fun b!202751 () Bool)

(declare-fun e!132776 () Bool)

(assert (=> b!202751 (= e!132776 (and e!132782 mapRes!8528))))

(declare-fun condMapEmpty!8528 () Bool)

(declare-fun mapDefault!8528 () ValueCell!2143)

