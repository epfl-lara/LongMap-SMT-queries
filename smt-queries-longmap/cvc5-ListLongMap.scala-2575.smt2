; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39268 () Bool)

(assert start!39268)

(declare-fun b_free!9535 () Bool)

(declare-fun b_next!9535 () Bool)

(assert (=> start!39268 (= b_free!9535 (not b_next!9535))))

(declare-fun tp!34133 () Bool)

(declare-fun b_and!16945 () Bool)

(assert (=> start!39268 (= tp!34133 b_and!16945)))

(declare-fun b!415070 () Bool)

(declare-fun res!241424 () Bool)

(declare-fun e!247977 () Bool)

(assert (=> b!415070 (=> (not res!241424) (not e!247977))))

(declare-datatypes ((array!25231 0))(
  ( (array!25232 (arr!12065 (Array (_ BitVec 32) (_ BitVec 64))) (size!12417 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25231)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25231 (_ BitVec 32)) Bool)

(assert (=> b!415070 (= res!241424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!415071 () Bool)

(declare-fun e!247978 () Bool)

(declare-fun tp_is_empty!10687 () Bool)

(assert (=> b!415071 (= e!247978 tp_is_empty!10687)))

(declare-fun b!415072 () Bool)

(declare-fun res!241422 () Bool)

(declare-fun e!247975 () Bool)

(assert (=> b!415072 (=> (not res!241422) (not e!247975))))

(declare-fun lt!190162 () array!25231)

(declare-datatypes ((List!7038 0))(
  ( (Nil!7035) (Cons!7034 (h!7890 (_ BitVec 64)) (t!12238 List!7038)) )
))
(declare-fun arrayNoDuplicates!0 (array!25231 (_ BitVec 32) List!7038) Bool)

(assert (=> b!415072 (= res!241422 (arrayNoDuplicates!0 lt!190162 #b00000000000000000000000000000000 Nil!7035))))

(declare-fun b!415073 () Bool)

(declare-fun e!247976 () Bool)

(assert (=> b!415073 (= e!247975 e!247976)))

(declare-fun res!241428 () Bool)

(assert (=> b!415073 (=> (not res!241428) (not e!247976))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415073 (= res!241428 (= from!863 i!563))))

(declare-datatypes ((V!15355 0))(
  ( (V!15356 (val!5388 Int)) )
))
(declare-fun minValue!515 () V!15355)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5000 0))(
  ( (ValueCellFull!5000 (v!7635 V!15355)) (EmptyCell!5000) )
))
(declare-datatypes ((array!25233 0))(
  ( (array!25234 (arr!12066 (Array (_ BitVec 32) ValueCell!5000)) (size!12418 (_ BitVec 32))) )
))
(declare-fun lt!190159 () array!25233)

(declare-fun zeroValue!515 () V!15355)

(declare-datatypes ((tuple2!7016 0))(
  ( (tuple2!7017 (_1!3519 (_ BitVec 64)) (_2!3519 V!15355)) )
))
(declare-datatypes ((List!7039 0))(
  ( (Nil!7036) (Cons!7035 (h!7891 tuple2!7016) (t!12239 List!7039)) )
))
(declare-datatypes ((ListLongMap!5929 0))(
  ( (ListLongMap!5930 (toList!2980 List!7039)) )
))
(declare-fun lt!190160 () ListLongMap!5929)

(declare-fun getCurrentListMapNoExtraKeys!1186 (array!25231 array!25233 (_ BitVec 32) (_ BitVec 32) V!15355 V!15355 (_ BitVec 32) Int) ListLongMap!5929)

(assert (=> b!415073 (= lt!190160 (getCurrentListMapNoExtraKeys!1186 lt!190162 lt!190159 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25233)

(declare-fun v!412 () V!15355)

(assert (=> b!415073 (= lt!190159 (array!25234 (store (arr!12066 _values!549) i!563 (ValueCellFull!5000 v!412)) (size!12418 _values!549)))))

(declare-fun lt!190163 () ListLongMap!5929)

(assert (=> b!415073 (= lt!190163 (getCurrentListMapNoExtraKeys!1186 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415074 () Bool)

(declare-fun res!241430 () Bool)

(assert (=> b!415074 (=> (not res!241430) (not e!247977))))

(assert (=> b!415074 (= res!241430 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12417 _keys!709))))))

(declare-fun b!415075 () Bool)

(declare-fun e!247979 () Bool)

(declare-fun e!247980 () Bool)

(declare-fun mapRes!17652 () Bool)

(assert (=> b!415075 (= e!247979 (and e!247980 mapRes!17652))))

(declare-fun condMapEmpty!17652 () Bool)

(declare-fun mapDefault!17652 () ValueCell!5000)

