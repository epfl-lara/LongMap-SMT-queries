; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39302 () Bool)

(assert start!39302)

(declare-fun b_free!9569 () Bool)

(declare-fun b_next!9569 () Bool)

(assert (=> start!39302 (= b_free!9569 (not b_next!9569))))

(declare-fun tp!34235 () Bool)

(declare-fun b_and!17013 () Bool)

(assert (=> start!39302 (= tp!34235 b_and!17013)))

(declare-datatypes ((V!15399 0))(
  ( (V!15400 (val!5405 Int)) )
))
(declare-fun minValue!515 () V!15399)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5017 0))(
  ( (ValueCellFull!5017 (v!7652 V!15399)) (EmptyCell!5017) )
))
(declare-datatypes ((array!25297 0))(
  ( (array!25298 (arr!12098 (Array (_ BitVec 32) ValueCell!5017)) (size!12450 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25297)

(declare-fun zeroValue!515 () V!15399)

(declare-fun c!55067 () Bool)

(declare-fun lt!190468 () array!25297)

(declare-datatypes ((tuple2!7044 0))(
  ( (tuple2!7045 (_1!3533 (_ BitVec 64)) (_2!3533 V!15399)) )
))
(declare-datatypes ((List!7064 0))(
  ( (Nil!7061) (Cons!7060 (h!7916 tuple2!7044) (t!12298 List!7064)) )
))
(declare-datatypes ((ListLongMap!5957 0))(
  ( (ListLongMap!5958 (toList!2994 List!7064)) )
))
(declare-fun call!28885 () ListLongMap!5957)

(declare-fun bm!28882 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!25299 0))(
  ( (array!25300 (arr!12099 (Array (_ BitVec 32) (_ BitVec 64))) (size!12451 (_ BitVec 32))) )
))
(declare-fun lt!190462 () array!25299)

(declare-fun _keys!709 () array!25299)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1199 (array!25299 array!25297 (_ BitVec 32) (_ BitVec 32) V!15399 V!15399 (_ BitVec 32) Int) ListLongMap!5957)

(assert (=> bm!28882 (= call!28885 (getCurrentListMapNoExtraKeys!1199 (ite c!55067 _keys!709 lt!190462) (ite c!55067 _values!549 lt!190468) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun e!248432 () Bool)

(declare-fun b!416073 () Bool)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun call!28886 () ListLongMap!5957)

(declare-fun v!412 () V!15399)

(declare-fun +!1196 (ListLongMap!5957 tuple2!7044) ListLongMap!5957)

(assert (=> b!416073 (= e!248432 (= call!28886 (+!1196 call!28885 (tuple2!7045 k!794 v!412))))))

(declare-fun b!416074 () Bool)

(declare-fun e!248437 () Bool)

(declare-fun e!248433 () Bool)

(assert (=> b!416074 (= e!248437 e!248433)))

(declare-fun res!242143 () Bool)

(assert (=> b!416074 (=> (not res!242143) (not e!248433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25299 (_ BitVec 32)) Bool)

(assert (=> b!416074 (= res!242143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190462 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416074 (= lt!190462 (array!25300 (store (arr!12099 _keys!709) i!563 k!794) (size!12451 _keys!709)))))

(declare-fun b!416075 () Bool)

(declare-fun e!248436 () Bool)

(declare-fun e!248438 () Bool)

(declare-fun mapRes!17703 () Bool)

(assert (=> b!416075 (= e!248436 (and e!248438 mapRes!17703))))

(declare-fun condMapEmpty!17703 () Bool)

(declare-fun mapDefault!17703 () ValueCell!5017)

