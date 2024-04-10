; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39274 () Bool)

(assert start!39274)

(declare-fun b_free!9541 () Bool)

(declare-fun b_next!9541 () Bool)

(assert (=> start!39274 (= b_free!9541 (not b_next!9541))))

(declare-fun tp!34152 () Bool)

(declare-fun b_and!16957 () Bool)

(assert (=> start!39274 (= tp!34152 b_and!16957)))

(declare-fun b!415247 () Bool)

(declare-fun res!241545 () Bool)

(declare-fun e!248059 () Bool)

(assert (=> b!415247 (=> (not res!241545) (not e!248059))))

(declare-datatypes ((array!25243 0))(
  ( (array!25244 (arr!12071 (Array (_ BitVec 32) (_ BitVec 64))) (size!12423 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25243)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15363 0))(
  ( (V!15364 (val!5391 Int)) )
))
(declare-datatypes ((ValueCell!5003 0))(
  ( (ValueCellFull!5003 (v!7638 V!15363)) (EmptyCell!5003) )
))
(declare-datatypes ((array!25245 0))(
  ( (array!25246 (arr!12072 (Array (_ BitVec 32) ValueCell!5003)) (size!12424 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25245)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!415247 (= res!241545 (and (= (size!12424 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12423 _keys!709) (size!12424 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17661 () Bool)

(declare-fun mapRes!17661 () Bool)

(declare-fun tp!34151 () Bool)

(declare-fun e!248057 () Bool)

(assert (=> mapNonEmpty!17661 (= mapRes!17661 (and tp!34151 e!248057))))

(declare-fun mapValue!17661 () ValueCell!5003)

(declare-fun mapRest!17661 () (Array (_ BitVec 32) ValueCell!5003))

(declare-fun mapKey!17661 () (_ BitVec 32))

(assert (=> mapNonEmpty!17661 (= (arr!12072 _values!549) (store mapRest!17661 mapKey!17661 mapValue!17661))))

(declare-fun b!415248 () Bool)

(declare-fun e!248061 () Bool)

(declare-fun e!248054 () Bool)

(assert (=> b!415248 (= e!248061 e!248054)))

(declare-fun res!241549 () Bool)

(assert (=> b!415248 (=> (not res!241549) (not e!248054))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!415248 (= res!241549 (= from!863 i!563))))

(declare-fun minValue!515 () V!15363)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15363)

(declare-fun lt!190204 () array!25245)

(declare-datatypes ((tuple2!7022 0))(
  ( (tuple2!7023 (_1!3522 (_ BitVec 64)) (_2!3522 V!15363)) )
))
(declare-datatypes ((List!7043 0))(
  ( (Nil!7040) (Cons!7039 (h!7895 tuple2!7022) (t!12249 List!7043)) )
))
(declare-datatypes ((ListLongMap!5935 0))(
  ( (ListLongMap!5936 (toList!2983 List!7043)) )
))
(declare-fun lt!190208 () ListLongMap!5935)

(declare-fun lt!190205 () array!25243)

(declare-fun getCurrentListMapNoExtraKeys!1189 (array!25243 array!25245 (_ BitVec 32) (_ BitVec 32) V!15363 V!15363 (_ BitVec 32) Int) ListLongMap!5935)

(assert (=> b!415248 (= lt!190208 (getCurrentListMapNoExtraKeys!1189 lt!190205 lt!190204 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15363)

(assert (=> b!415248 (= lt!190204 (array!25246 (store (arr!12072 _values!549) i!563 (ValueCellFull!5003 v!412)) (size!12424 _values!549)))))

(declare-fun lt!190207 () ListLongMap!5935)

(assert (=> b!415248 (= lt!190207 (getCurrentListMapNoExtraKeys!1189 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415249 () Bool)

(declare-fun e!248056 () Bool)

(declare-fun call!28802 () ListLongMap!5935)

(declare-fun call!28801 () ListLongMap!5935)

(assert (=> b!415249 (= e!248056 (= call!28802 call!28801))))

(declare-fun b!415250 () Bool)

(declare-fun e!248060 () Bool)

(assert (=> b!415250 (= e!248060 true)))

(declare-fun +!1187 (ListLongMap!5935 tuple2!7022) ListLongMap!5935)

(declare-fun get!5959 (ValueCell!5003 V!15363) V!15363)

(declare-fun dynLambda!664 (Int (_ BitVec 64)) V!15363)

(assert (=> b!415250 (= lt!190208 (+!1187 (getCurrentListMapNoExtraKeys!1189 lt!190205 lt!190204 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7023 (select (arr!12071 lt!190205) from!863) (get!5959 (select (arr!12072 lt!190204) from!863) (dynLambda!664 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415251 () Bool)

(declare-fun res!241554 () Bool)

(assert (=> b!415251 (=> (not res!241554) (not e!248059))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415251 (= res!241554 (validKeyInArray!0 k!794))))

(declare-fun b!415252 () Bool)

(declare-fun res!241555 () Bool)

(assert (=> b!415252 (=> (not res!241555) (not e!248059))))

(declare-datatypes ((List!7044 0))(
  ( (Nil!7041) (Cons!7040 (h!7896 (_ BitVec 64)) (t!12250 List!7044)) )
))
(declare-fun arrayNoDuplicates!0 (array!25243 (_ BitVec 32) List!7044) Bool)

(assert (=> b!415252 (= res!241555 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7041))))

(declare-fun b!415253 () Bool)

(assert (=> b!415253 (= e!248059 e!248061)))

(declare-fun res!241550 () Bool)

(assert (=> b!415253 (=> (not res!241550) (not e!248061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25243 (_ BitVec 32)) Bool)

(assert (=> b!415253 (= res!241550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190205 mask!1025))))

(assert (=> b!415253 (= lt!190205 (array!25244 (store (arr!12071 _keys!709) i!563 k!794) (size!12423 _keys!709)))))

(declare-fun b!415254 () Bool)

(declare-fun res!241556 () Bool)

(assert (=> b!415254 (=> (not res!241556) (not e!248061))))

(assert (=> b!415254 (= res!241556 (bvsle from!863 i!563))))

(declare-fun b!415255 () Bool)

(declare-fun tp_is_empty!10693 () Bool)

(assert (=> b!415255 (= e!248057 tp_is_empty!10693)))

(declare-fun b!415256 () Bool)

(declare-fun res!241551 () Bool)

(assert (=> b!415256 (=> (not res!241551) (not e!248059))))

(assert (=> b!415256 (= res!241551 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12423 _keys!709))))))

(declare-fun b!415257 () Bool)

(declare-fun e!248053 () Bool)

(assert (=> b!415257 (= e!248053 tp_is_empty!10693)))

(declare-fun b!415258 () Bool)

(declare-fun e!248055 () Bool)

(assert (=> b!415258 (= e!248055 (and e!248053 mapRes!17661))))

(declare-fun condMapEmpty!17661 () Bool)

(declare-fun mapDefault!17661 () ValueCell!5003)

