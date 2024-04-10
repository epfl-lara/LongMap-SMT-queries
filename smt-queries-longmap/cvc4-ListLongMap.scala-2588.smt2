; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39350 () Bool)

(assert start!39350)

(declare-fun b_free!9617 () Bool)

(declare-fun b_next!9617 () Bool)

(assert (=> start!39350 (= b_free!9617 (not b_next!9617))))

(declare-fun tp!34380 () Bool)

(declare-fun b_and!17109 () Bool)

(assert (=> start!39350 (= tp!34380 b_and!17109)))

(declare-datatypes ((V!15463 0))(
  ( (V!15464 (val!5429 Int)) )
))
(declare-fun minValue!515 () V!15463)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5041 0))(
  ( (ValueCellFull!5041 (v!7676 V!15463)) (EmptyCell!5041) )
))
(declare-datatypes ((array!25389 0))(
  ( (array!25390 (arr!12144 (Array (_ BitVec 32) ValueCell!5041)) (size!12496 (_ BitVec 32))) )
))
(declare-fun lt!191258 () array!25389)

(declare-datatypes ((array!25391 0))(
  ( (array!25392 (arr!12145 (Array (_ BitVec 32) (_ BitVec 64))) (size!12497 (_ BitVec 32))) )
))
(declare-fun lt!191256 () array!25391)

(declare-datatypes ((tuple2!7088 0))(
  ( (tuple2!7089 (_1!3555 (_ BitVec 64)) (_2!3555 V!15463)) )
))
(declare-datatypes ((List!7106 0))(
  ( (Nil!7103) (Cons!7102 (h!7958 tuple2!7088) (t!12388 List!7106)) )
))
(declare-datatypes ((ListLongMap!6001 0))(
  ( (ListLongMap!6002 (toList!3016 List!7106)) )
))
(declare-fun call!29029 () ListLongMap!6001)

(declare-fun _values!549 () array!25389)

(declare-fun zeroValue!515 () V!15463)

(declare-fun bm!29026 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25391)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun c!55139 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1221 (array!25391 array!25389 (_ BitVec 32) (_ BitVec 32) V!15463 V!15463 (_ BitVec 32) Int) ListLongMap!6001)

(assert (=> bm!29026 (= call!29029 (getCurrentListMapNoExtraKeys!1221 (ite c!55139 _keys!709 lt!191256) (ite c!55139 _values!549 lt!191258) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417489 () Bool)

(declare-fun call!29030 () ListLongMap!6001)

(declare-fun e!249085 () Bool)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!15463)

(declare-fun +!1218 (ListLongMap!6001 tuple2!7088) ListLongMap!6001)

(assert (=> b!417489 (= e!249085 (= call!29030 (+!1218 call!29029 (tuple2!7089 k!794 v!412))))))

(declare-fun b!417490 () Bool)

(declare-fun e!249083 () Bool)

(declare-fun e!249081 () Bool)

(declare-fun mapRes!17775 () Bool)

(assert (=> b!417490 (= e!249083 (and e!249081 mapRes!17775))))

(declare-fun condMapEmpty!17775 () Bool)

(declare-fun mapDefault!17775 () ValueCell!5041)

