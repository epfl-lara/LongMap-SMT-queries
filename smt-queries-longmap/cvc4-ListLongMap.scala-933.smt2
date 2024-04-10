; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20698 () Bool)

(assert start!20698)

(declare-fun b_free!5357 () Bool)

(declare-fun b_next!5357 () Bool)

(assert (=> start!20698 (= b_free!5357 (not b_next!5357))))

(declare-fun tp!19103 () Bool)

(declare-fun b_and!12103 () Bool)

(assert (=> start!20698 (= tp!19103 b_and!12103)))

(declare-fun b!206966 () Bool)

(declare-fun e!135194 () Bool)

(assert (=> b!206966 (= e!135194 (not true))))

(declare-datatypes ((V!6597 0))(
  ( (V!6598 (val!2651 Int)) )
))
(declare-datatypes ((tuple2!4026 0))(
  ( (tuple2!4027 (_1!2024 (_ BitVec 64)) (_2!2024 V!6597)) )
))
(declare-datatypes ((List!2916 0))(
  ( (Nil!2913) (Cons!2912 (h!3554 tuple2!4026) (t!7847 List!2916)) )
))
(declare-datatypes ((ListLongMap!2939 0))(
  ( (ListLongMap!2940 (toList!1485 List!2916)) )
))
(declare-fun lt!105944 () ListLongMap!2939)

(declare-datatypes ((ValueCell!2263 0))(
  ( (ValueCellFull!2263 (v!4621 V!6597)) (EmptyCell!2263) )
))
(declare-datatypes ((array!9635 0))(
  ( (array!9636 (arr!4568 (Array (_ BitVec 32) ValueCell!2263)) (size!4893 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9635)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6597)

(declare-datatypes ((array!9637 0))(
  ( (array!9638 (arr!4569 (Array (_ BitVec 32) (_ BitVec 64))) (size!4894 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9637)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6597)

(declare-fun getCurrentListMap!1052 (array!9637 array!9635 (_ BitVec 32) (_ BitVec 32) V!6597 V!6597 (_ BitVec 32) Int) ListLongMap!2939)

(assert (=> b!206966 (= lt!105944 (getCurrentListMap!1052 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105941 () ListLongMap!2939)

(declare-fun lt!105943 () array!9635)

(assert (=> b!206966 (= lt!105941 (getCurrentListMap!1052 _keys!825 lt!105943 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105942 () ListLongMap!2939)

(declare-fun lt!105945 () ListLongMap!2939)

(assert (=> b!206966 (and (= lt!105942 lt!105945) (= lt!105945 lt!105942))))

(declare-fun v!520 () V!6597)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun lt!105940 () ListLongMap!2939)

(declare-fun +!512 (ListLongMap!2939 tuple2!4026) ListLongMap!2939)

(assert (=> b!206966 (= lt!105945 (+!512 lt!105940 (tuple2!4027 k!843 v!520)))))

(declare-datatypes ((Unit!6312 0))(
  ( (Unit!6313) )
))
(declare-fun lt!105939 () Unit!6312)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!165 (array!9637 array!9635 (_ BitVec 32) (_ BitVec 32) V!6597 V!6597 (_ BitVec 32) (_ BitVec 64) V!6597 (_ BitVec 32) Int) Unit!6312)

(assert (=> b!206966 (= lt!105939 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!165 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!426 (array!9637 array!9635 (_ BitVec 32) (_ BitVec 32) V!6597 V!6597 (_ BitVec 32) Int) ListLongMap!2939)

(assert (=> b!206966 (= lt!105942 (getCurrentListMapNoExtraKeys!426 _keys!825 lt!105943 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206966 (= lt!105943 (array!9636 (store (arr!4568 _values!649) i!601 (ValueCellFull!2263 v!520)) (size!4893 _values!649)))))

(assert (=> b!206966 (= lt!105940 (getCurrentListMapNoExtraKeys!426 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206967 () Bool)

(declare-fun e!135192 () Bool)

(declare-fun tp_is_empty!5213 () Bool)

(assert (=> b!206967 (= e!135192 tp_is_empty!5213)))

(declare-fun b!206968 () Bool)

(declare-fun res!100380 () Bool)

(assert (=> b!206968 (=> (not res!100380) (not e!135194))))

(assert (=> b!206968 (= res!100380 (and (= (size!4893 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4894 _keys!825) (size!4893 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206969 () Bool)

(declare-fun e!135193 () Bool)

(declare-fun mapRes!8888 () Bool)

(assert (=> b!206969 (= e!135193 (and e!135192 mapRes!8888))))

(declare-fun condMapEmpty!8888 () Bool)

(declare-fun mapDefault!8888 () ValueCell!2263)

