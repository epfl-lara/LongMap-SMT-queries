; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20742 () Bool)

(assert start!20742)

(declare-fun b_free!5401 () Bool)

(declare-fun b_next!5401 () Bool)

(assert (=> start!20742 (= b_free!5401 (not b_next!5401))))

(declare-fun tp!19234 () Bool)

(declare-fun b_and!12147 () Bool)

(assert (=> start!20742 (= tp!19234 b_and!12147)))

(declare-fun b!207626 () Bool)

(declare-fun e!135523 () Bool)

(assert (=> b!207626 (= e!135523 (not true))))

(declare-datatypes ((V!6657 0))(
  ( (V!6658 (val!2673 Int)) )
))
(declare-datatypes ((tuple2!4056 0))(
  ( (tuple2!4057 (_1!2039 (_ BitVec 64)) (_2!2039 V!6657)) )
))
(declare-datatypes ((List!2949 0))(
  ( (Nil!2946) (Cons!2945 (h!3587 tuple2!4056) (t!7880 List!2949)) )
))
(declare-datatypes ((ListLongMap!2969 0))(
  ( (ListLongMap!2970 (toList!1500 List!2949)) )
))
(declare-fun lt!106411 () ListLongMap!2969)

(declare-datatypes ((ValueCell!2285 0))(
  ( (ValueCellFull!2285 (v!4643 V!6657)) (EmptyCell!2285) )
))
(declare-datatypes ((array!9721 0))(
  ( (array!9722 (arr!4611 (Array (_ BitVec 32) ValueCell!2285)) (size!4936 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9721)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!9723 0))(
  ( (array!9724 (arr!4612 (Array (_ BitVec 32) (_ BitVec 64))) (size!4937 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9723)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6657)

(declare-fun zeroValue!615 () V!6657)

(declare-fun getCurrentListMap!1067 (array!9723 array!9721 (_ BitVec 32) (_ BitVec 32) V!6657 V!6657 (_ BitVec 32) Int) ListLongMap!2969)

(assert (=> b!207626 (= lt!106411 (getCurrentListMap!1067 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106413 () array!9721)

(declare-fun lt!106416 () ListLongMap!2969)

(assert (=> b!207626 (= lt!106416 (getCurrentListMap!1067 _keys!825 lt!106413 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106412 () ListLongMap!2969)

(declare-fun lt!106410 () ListLongMap!2969)

(assert (=> b!207626 (and (= lt!106412 lt!106410) (= lt!106410 lt!106412))))

(declare-fun lt!106415 () ListLongMap!2969)

(declare-fun v!520 () V!6657)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun +!527 (ListLongMap!2969 tuple2!4056) ListLongMap!2969)

(assert (=> b!207626 (= lt!106410 (+!527 lt!106415 (tuple2!4057 k!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6342 0))(
  ( (Unit!6343) )
))
(declare-fun lt!106414 () Unit!6342)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!180 (array!9723 array!9721 (_ BitVec 32) (_ BitVec 32) V!6657 V!6657 (_ BitVec 32) (_ BitVec 64) V!6657 (_ BitVec 32) Int) Unit!6342)

(assert (=> b!207626 (= lt!106414 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!180 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!441 (array!9723 array!9721 (_ BitVec 32) (_ BitVec 32) V!6657 V!6657 (_ BitVec 32) Int) ListLongMap!2969)

(assert (=> b!207626 (= lt!106412 (getCurrentListMapNoExtraKeys!441 _keys!825 lt!106413 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207626 (= lt!106413 (array!9722 (store (arr!4611 _values!649) i!601 (ValueCellFull!2285 v!520)) (size!4936 _values!649)))))

(assert (=> b!207626 (= lt!106415 (getCurrentListMapNoExtraKeys!441 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207627 () Bool)

(declare-fun res!100841 () Bool)

(assert (=> b!207627 (=> (not res!100841) (not e!135523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207627 (= res!100841 (validKeyInArray!0 k!843))))

(declare-fun b!207628 () Bool)

(declare-fun e!135522 () Bool)

(declare-fun e!135524 () Bool)

(declare-fun mapRes!8954 () Bool)

(assert (=> b!207628 (= e!135522 (and e!135524 mapRes!8954))))

(declare-fun condMapEmpty!8954 () Bool)

(declare-fun mapDefault!8954 () ValueCell!2285)

