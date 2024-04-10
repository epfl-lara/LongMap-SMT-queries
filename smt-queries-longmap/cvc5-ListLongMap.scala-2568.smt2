; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39226 () Bool)

(assert start!39226)

(declare-fun b_free!9493 () Bool)

(declare-fun b_next!9493 () Bool)

(assert (=> start!39226 (= b_free!9493 (not b_next!9493))))

(declare-fun tp!34008 () Bool)

(declare-fun b_and!16879 () Bool)

(assert (=> start!39226 (= tp!34008 b_and!16879)))

(declare-fun b!413865 () Bool)

(declare-fun res!240553 () Bool)

(declare-fun e!247426 () Bool)

(assert (=> b!413865 (=> (not res!240553) (not e!247426))))

(declare-datatypes ((array!25147 0))(
  ( (array!25148 (arr!12023 (Array (_ BitVec 32) (_ BitVec 64))) (size!12375 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25147)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413865 (= res!240553 (or (= (select (arr!12023 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12023 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!240560 () Bool)

(assert (=> start!39226 (=> (not res!240560) (not e!247426))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39226 (= res!240560 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12375 _keys!709))))))

(assert (=> start!39226 e!247426))

(declare-fun tp_is_empty!10645 () Bool)

(assert (=> start!39226 tp_is_empty!10645))

(assert (=> start!39226 tp!34008))

(assert (=> start!39226 true))

(declare-datatypes ((V!15299 0))(
  ( (V!15300 (val!5367 Int)) )
))
(declare-datatypes ((ValueCell!4979 0))(
  ( (ValueCellFull!4979 (v!7614 V!15299)) (EmptyCell!4979) )
))
(declare-datatypes ((array!25149 0))(
  ( (array!25150 (arr!12024 (Array (_ BitVec 32) ValueCell!4979)) (size!12376 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25149)

(declare-fun e!247425 () Bool)

(declare-fun array_inv!8770 (array!25149) Bool)

(assert (=> start!39226 (and (array_inv!8770 _values!549) e!247425)))

(declare-fun array_inv!8771 (array!25147) Bool)

(assert (=> start!39226 (array_inv!8771 _keys!709)))

(declare-fun b!413866 () Bool)

(declare-fun e!247423 () Bool)

(assert (=> b!413866 (= e!247423 (not true))))

(declare-fun e!247424 () Bool)

(assert (=> b!413866 e!247424))

(declare-fun c!54953 () Bool)

(assert (=> b!413866 (= c!54953 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15299)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15299)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12244 0))(
  ( (Unit!12245) )
))
(declare-fun lt!189847 () Unit!12244)

(declare-fun v!412 () V!15299)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!380 (array!25147 array!25149 (_ BitVec 32) (_ BitVec 32) V!15299 V!15299 (_ BitVec 32) (_ BitVec 64) V!15299 (_ BitVec 32) Int) Unit!12244)

(assert (=> b!413866 (= lt!189847 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!380 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!189848 () array!25147)

(declare-fun bm!28654 () Bool)

(declare-fun lt!189845 () array!25149)

(declare-datatypes ((tuple2!6978 0))(
  ( (tuple2!6979 (_1!3500 (_ BitVec 64)) (_2!3500 V!15299)) )
))
(declare-datatypes ((List!7001 0))(
  ( (Nil!6998) (Cons!6997 (h!7853 tuple2!6978) (t!12175 List!7001)) )
))
(declare-datatypes ((ListLongMap!5891 0))(
  ( (ListLongMap!5892 (toList!2961 List!7001)) )
))
(declare-fun call!28658 () ListLongMap!5891)

(declare-fun getCurrentListMapNoExtraKeys!1168 (array!25147 array!25149 (_ BitVec 32) (_ BitVec 32) V!15299 V!15299 (_ BitVec 32) Int) ListLongMap!5891)

(assert (=> bm!28654 (= call!28658 (getCurrentListMapNoExtraKeys!1168 (ite c!54953 _keys!709 lt!189848) (ite c!54953 _values!549 lt!189845) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413867 () Bool)

(declare-fun res!240562 () Bool)

(assert (=> b!413867 (=> (not res!240562) (not e!247426))))

(assert (=> b!413867 (= res!240562 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12375 _keys!709))))))

(declare-fun b!413868 () Bool)

(declare-fun res!240559 () Bool)

(assert (=> b!413868 (=> (not res!240559) (not e!247426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413868 (= res!240559 (validMask!0 mask!1025))))

(declare-fun b!413869 () Bool)

(declare-fun e!247421 () Bool)

(assert (=> b!413869 (= e!247421 tp_is_empty!10645)))

(declare-fun b!413870 () Bool)

(declare-fun mapRes!17589 () Bool)

(assert (=> b!413870 (= e!247425 (and e!247421 mapRes!17589))))

(declare-fun condMapEmpty!17589 () Bool)

(declare-fun mapDefault!17589 () ValueCell!4979)

