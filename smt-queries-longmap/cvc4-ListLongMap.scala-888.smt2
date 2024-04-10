; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20428 () Bool)

(assert start!20428)

(declare-fun b_free!5087 () Bool)

(declare-fun b_next!5087 () Bool)

(assert (=> start!20428 (= b_free!5087 (not b_next!5087))))

(declare-fun tp!18293 () Bool)

(declare-fun b_and!11833 () Bool)

(assert (=> start!20428 (= tp!18293 b_and!11833)))

(declare-fun b!202194 () Bool)

(declare-fun e!132465 () Bool)

(declare-fun e!132463 () Bool)

(assert (=> b!202194 (= e!132465 (not e!132463))))

(declare-fun res!96826 () Bool)

(assert (=> b!202194 (=> res!96826 e!132463)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202194 (= res!96826 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6237 0))(
  ( (V!6238 (val!2516 Int)) )
))
(declare-datatypes ((tuple2!3812 0))(
  ( (tuple2!3813 (_1!1917 (_ BitVec 64)) (_2!1917 V!6237)) )
))
(declare-datatypes ((List!2721 0))(
  ( (Nil!2718) (Cons!2717 (h!3359 tuple2!3812) (t!7652 List!2721)) )
))
(declare-datatypes ((ListLongMap!2725 0))(
  ( (ListLongMap!2726 (toList!1378 List!2721)) )
))
(declare-fun lt!101388 () ListLongMap!2725)

(declare-datatypes ((ValueCell!2128 0))(
  ( (ValueCellFull!2128 (v!4486 V!6237)) (EmptyCell!2128) )
))
(declare-datatypes ((array!9111 0))(
  ( (array!9112 (arr!4306 (Array (_ BitVec 32) ValueCell!2128)) (size!4631 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9111)

(declare-fun zeroValue!615 () V!6237)

(declare-datatypes ((array!9113 0))(
  ( (array!9114 (arr!4307 (Array (_ BitVec 32) (_ BitVec 64))) (size!4632 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9113)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6237)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun getCurrentListMap!961 (array!9113 array!9111 (_ BitVec 32) (_ BitVec 32) V!6237 V!6237 (_ BitVec 32) Int) ListLongMap!2725)

(assert (=> b!202194 (= lt!101388 (getCurrentListMap!961 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101381 () ListLongMap!2725)

(declare-fun lt!101385 () array!9111)

(assert (=> b!202194 (= lt!101381 (getCurrentListMap!961 _keys!825 lt!101385 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101382 () ListLongMap!2725)

(declare-fun lt!101391 () ListLongMap!2725)

(assert (=> b!202194 (and (= lt!101382 lt!101391) (= lt!101391 lt!101382))))

(declare-fun lt!101387 () ListLongMap!2725)

(declare-fun lt!101386 () tuple2!3812)

(declare-fun +!405 (ListLongMap!2725 tuple2!3812) ListLongMap!2725)

(assert (=> b!202194 (= lt!101391 (+!405 lt!101387 lt!101386))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6237)

(assert (=> b!202194 (= lt!101386 (tuple2!3813 k!843 v!520))))

(declare-datatypes ((Unit!6110 0))(
  ( (Unit!6111) )
))
(declare-fun lt!101377 () Unit!6110)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!74 (array!9113 array!9111 (_ BitVec 32) (_ BitVec 32) V!6237 V!6237 (_ BitVec 32) (_ BitVec 64) V!6237 (_ BitVec 32) Int) Unit!6110)

(assert (=> b!202194 (= lt!101377 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!74 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!335 (array!9113 array!9111 (_ BitVec 32) (_ BitVec 32) V!6237 V!6237 (_ BitVec 32) Int) ListLongMap!2725)

(assert (=> b!202194 (= lt!101382 (getCurrentListMapNoExtraKeys!335 _keys!825 lt!101385 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202194 (= lt!101385 (array!9112 (store (arr!4306 _values!649) i!601 (ValueCellFull!2128 v!520)) (size!4631 _values!649)))))

(assert (=> b!202194 (= lt!101387 (getCurrentListMapNoExtraKeys!335 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!96825 () Bool)

(assert (=> start!20428 (=> (not res!96825) (not e!132465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20428 (= res!96825 (validMask!0 mask!1149))))

(assert (=> start!20428 e!132465))

(declare-fun e!132466 () Bool)

(declare-fun array_inv!2843 (array!9111) Bool)

(assert (=> start!20428 (and (array_inv!2843 _values!649) e!132466)))

(assert (=> start!20428 true))

(declare-fun tp_is_empty!4943 () Bool)

(assert (=> start!20428 tp_is_empty!4943))

(declare-fun array_inv!2844 (array!9113) Bool)

(assert (=> start!20428 (array_inv!2844 _keys!825)))

(assert (=> start!20428 tp!18293))

(declare-fun b!202195 () Bool)

(declare-fun e!132462 () Bool)

(assert (=> b!202195 (= e!132462 true)))

(declare-fun lt!101379 () tuple2!3812)

(declare-fun lt!101389 () ListLongMap!2725)

(declare-fun lt!101390 () ListLongMap!2725)

(assert (=> b!202195 (= (+!405 lt!101390 lt!101379) (+!405 lt!101389 lt!101386))))

(declare-fun lt!101376 () ListLongMap!2725)

(declare-fun lt!101383 () Unit!6110)

(declare-fun addCommutativeForDiffKeys!126 (ListLongMap!2725 (_ BitVec 64) V!6237 (_ BitVec 64) V!6237) Unit!6110)

(assert (=> b!202195 (= lt!101383 (addCommutativeForDiffKeys!126 lt!101376 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!202196 () Bool)

(assert (=> b!202196 (= e!132463 e!132462)))

(declare-fun res!96823 () Bool)

(assert (=> b!202196 (=> res!96823 e!132462)))

(assert (=> b!202196 (= res!96823 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101380 () ListLongMap!2725)

(assert (=> b!202196 (= lt!101380 lt!101390)))

(assert (=> b!202196 (= lt!101390 (+!405 lt!101376 lt!101386))))

(declare-fun lt!101384 () Unit!6110)

(assert (=> b!202196 (= lt!101384 (addCommutativeForDiffKeys!126 lt!101387 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!202196 (= lt!101381 (+!405 lt!101380 lt!101379))))

(declare-fun lt!101378 () tuple2!3812)

(assert (=> b!202196 (= lt!101380 (+!405 lt!101391 lt!101378))))

(assert (=> b!202196 (= lt!101388 lt!101389)))

(assert (=> b!202196 (= lt!101389 (+!405 lt!101376 lt!101379))))

(assert (=> b!202196 (= lt!101376 (+!405 lt!101387 lt!101378))))

(assert (=> b!202196 (= lt!101381 (+!405 (+!405 lt!101382 lt!101378) lt!101379))))

(assert (=> b!202196 (= lt!101379 (tuple2!3813 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!202196 (= lt!101378 (tuple2!3813 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202197 () Bool)

(declare-fun e!132461 () Bool)

(declare-fun mapRes!8483 () Bool)

(assert (=> b!202197 (= e!132466 (and e!132461 mapRes!8483))))

(declare-fun condMapEmpty!8483 () Bool)

(declare-fun mapDefault!8483 () ValueCell!2128)

