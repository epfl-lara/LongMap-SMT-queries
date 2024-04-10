; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20730 () Bool)

(assert start!20730)

(declare-fun b_free!5389 () Bool)

(declare-fun b_next!5389 () Bool)

(assert (=> start!20730 (= b_free!5389 (not b_next!5389))))

(declare-fun tp!19199 () Bool)

(declare-fun b_and!12135 () Bool)

(assert (=> start!20730 (= tp!19199 b_and!12135)))

(declare-fun mapIsEmpty!8936 () Bool)

(declare-fun mapRes!8936 () Bool)

(assert (=> mapIsEmpty!8936 mapRes!8936))

(declare-fun b!207446 () Bool)

(declare-fun e!135431 () Bool)

(assert (=> b!207446 (= e!135431 (not true))))

(declare-datatypes ((V!6641 0))(
  ( (V!6642 (val!2667 Int)) )
))
(declare-datatypes ((ValueCell!2279 0))(
  ( (ValueCellFull!2279 (v!4637 V!6641)) (EmptyCell!2279) )
))
(declare-datatypes ((array!9697 0))(
  ( (array!9698 (arr!4599 (Array (_ BitVec 32) ValueCell!2279)) (size!4924 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9697)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!4048 0))(
  ( (tuple2!4049 (_1!2035 (_ BitVec 64)) (_2!2035 V!6641)) )
))
(declare-datatypes ((List!2939 0))(
  ( (Nil!2936) (Cons!2935 (h!3577 tuple2!4048) (t!7870 List!2939)) )
))
(declare-datatypes ((ListLongMap!2961 0))(
  ( (ListLongMap!2962 (toList!1496 List!2939)) )
))
(declare-fun lt!106289 () ListLongMap!2961)

(declare-fun zeroValue!615 () V!6641)

(declare-datatypes ((array!9699 0))(
  ( (array!9700 (arr!4600 (Array (_ BitVec 32) (_ BitVec 64))) (size!4925 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9699)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6641)

(declare-fun getCurrentListMap!1063 (array!9699 array!9697 (_ BitVec 32) (_ BitVec 32) V!6641 V!6641 (_ BitVec 32) Int) ListLongMap!2961)

(assert (=> b!207446 (= lt!106289 (getCurrentListMap!1063 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106286 () ListLongMap!2961)

(declare-fun lt!106287 () array!9697)

(assert (=> b!207446 (= lt!106286 (getCurrentListMap!1063 _keys!825 lt!106287 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106288 () ListLongMap!2961)

(declare-fun lt!106290 () ListLongMap!2961)

(assert (=> b!207446 (and (= lt!106288 lt!106290) (= lt!106290 lt!106288))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6641)

(declare-fun lt!106285 () ListLongMap!2961)

(declare-fun +!523 (ListLongMap!2961 tuple2!4048) ListLongMap!2961)

(assert (=> b!207446 (= lt!106290 (+!523 lt!106285 (tuple2!4049 k!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6334 0))(
  ( (Unit!6335) )
))
(declare-fun lt!106284 () Unit!6334)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!176 (array!9699 array!9697 (_ BitVec 32) (_ BitVec 32) V!6641 V!6641 (_ BitVec 32) (_ BitVec 64) V!6641 (_ BitVec 32) Int) Unit!6334)

(assert (=> b!207446 (= lt!106284 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!176 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!437 (array!9699 array!9697 (_ BitVec 32) (_ BitVec 32) V!6641 V!6641 (_ BitVec 32) Int) ListLongMap!2961)

(assert (=> b!207446 (= lt!106288 (getCurrentListMapNoExtraKeys!437 _keys!825 lt!106287 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207446 (= lt!106287 (array!9698 (store (arr!4599 _values!649) i!601 (ValueCellFull!2279 v!520)) (size!4924 _values!649)))))

(assert (=> b!207446 (= lt!106285 (getCurrentListMapNoExtraKeys!437 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207447 () Bool)

(declare-fun e!135434 () Bool)

(declare-fun tp_is_empty!5245 () Bool)

(assert (=> b!207447 (= e!135434 tp_is_empty!5245)))

(declare-fun b!207448 () Bool)

(declare-fun e!135432 () Bool)

(assert (=> b!207448 (= e!135432 tp_is_empty!5245)))

(declare-fun b!207449 () Bool)

(declare-fun res!100715 () Bool)

(assert (=> b!207449 (=> (not res!100715) (not e!135431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9699 (_ BitVec 32)) Bool)

(assert (=> b!207449 (= res!100715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207450 () Bool)

(declare-fun res!100712 () Bool)

(assert (=> b!207450 (=> (not res!100712) (not e!135431))))

(assert (=> b!207450 (= res!100712 (and (= (size!4924 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4925 _keys!825) (size!4924 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207451 () Bool)

(declare-fun res!100716 () Bool)

(assert (=> b!207451 (=> (not res!100716) (not e!135431))))

(assert (=> b!207451 (= res!100716 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4925 _keys!825))))))

(declare-fun b!207452 () Bool)

(declare-fun res!100717 () Bool)

(assert (=> b!207452 (=> (not res!100717) (not e!135431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207452 (= res!100717 (validKeyInArray!0 k!843))))

(declare-fun res!100711 () Bool)

(assert (=> start!20730 (=> (not res!100711) (not e!135431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20730 (= res!100711 (validMask!0 mask!1149))))

(assert (=> start!20730 e!135431))

(declare-fun e!135433 () Bool)

(declare-fun array_inv!3045 (array!9697) Bool)

(assert (=> start!20730 (and (array_inv!3045 _values!649) e!135433)))

(assert (=> start!20730 true))

(assert (=> start!20730 tp_is_empty!5245))

(declare-fun array_inv!3046 (array!9699) Bool)

(assert (=> start!20730 (array_inv!3046 _keys!825)))

(assert (=> start!20730 tp!19199))

(declare-fun b!207453 () Bool)

(declare-fun res!100713 () Bool)

(assert (=> b!207453 (=> (not res!100713) (not e!135431))))

(assert (=> b!207453 (= res!100713 (= (select (arr!4600 _keys!825) i!601) k!843))))

(declare-fun b!207454 () Bool)

(declare-fun res!100714 () Bool)

(assert (=> b!207454 (=> (not res!100714) (not e!135431))))

(declare-datatypes ((List!2940 0))(
  ( (Nil!2937) (Cons!2936 (h!3578 (_ BitVec 64)) (t!7871 List!2940)) )
))
(declare-fun arrayNoDuplicates!0 (array!9699 (_ BitVec 32) List!2940) Bool)

(assert (=> b!207454 (= res!100714 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2937))))

(declare-fun b!207455 () Bool)

(assert (=> b!207455 (= e!135433 (and e!135432 mapRes!8936))))

(declare-fun condMapEmpty!8936 () Bool)

(declare-fun mapDefault!8936 () ValueCell!2279)

