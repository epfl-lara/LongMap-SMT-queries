; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39410 () Bool)

(assert start!39410)

(declare-fun b_free!9677 () Bool)

(declare-fun b_next!9677 () Bool)

(assert (=> start!39410 (= b_free!9677 (not b_next!9677))))

(declare-fun tp!34559 () Bool)

(declare-fun b_and!17229 () Bool)

(assert (=> start!39410 (= tp!34559 b_and!17229)))

(declare-fun b!419259 () Bool)

(declare-fun e!249894 () Bool)

(declare-fun tp_is_empty!10829 () Bool)

(assert (=> b!419259 (= e!249894 tp_is_empty!10829)))

(declare-fun b!419260 () Bool)

(declare-fun e!249892 () Bool)

(assert (=> b!419260 (= e!249892 true)))

(declare-datatypes ((V!15543 0))(
  ( (V!15544 (val!5459 Int)) )
))
(declare-datatypes ((tuple2!7144 0))(
  ( (tuple2!7145 (_1!3583 (_ BitVec 64)) (_2!3583 V!15543)) )
))
(declare-datatypes ((List!7154 0))(
  ( (Nil!7151) (Cons!7150 (h!8006 tuple2!7144) (t!12496 List!7154)) )
))
(declare-datatypes ((ListLongMap!6057 0))(
  ( (ListLongMap!6058 (toList!3044 List!7154)) )
))
(declare-fun lt!192254 () ListLongMap!6057)

(declare-fun lt!192251 () V!15543)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!192245 () tuple2!7144)

(declare-fun +!1242 (ListLongMap!6057 tuple2!7144) ListLongMap!6057)

(assert (=> b!419260 (= (+!1242 lt!192254 lt!192245) (+!1242 (+!1242 lt!192254 (tuple2!7145 k!794 lt!192251)) lt!192245))))

(declare-fun lt!192252 () V!15543)

(assert (=> b!419260 (= lt!192245 (tuple2!7145 k!794 lt!192252))))

(declare-datatypes ((Unit!12390 0))(
  ( (Unit!12391) )
))
(declare-fun lt!192248 () Unit!12390)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!41 (ListLongMap!6057 (_ BitVec 64) V!15543 V!15543) Unit!12390)

(assert (=> b!419260 (= lt!192248 (addSameAsAddTwiceSameKeyDiffValues!41 lt!192254 k!794 lt!192251 lt!192252))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5071 0))(
  ( (ValueCellFull!5071 (v!7706 V!15543)) (EmptyCell!5071) )
))
(declare-datatypes ((array!25507 0))(
  ( (array!25508 (arr!12203 (Array (_ BitVec 32) ValueCell!5071)) (size!12555 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25507)

(declare-fun lt!192250 () V!15543)

(declare-fun get!6051 (ValueCell!5071 V!15543) V!15543)

(assert (=> b!419260 (= lt!192251 (get!6051 (select (arr!12203 _values!549) from!863) lt!192250))))

(declare-datatypes ((array!25509 0))(
  ( (array!25510 (arr!12204 (Array (_ BitVec 32) (_ BitVec 64))) (size!12556 (_ BitVec 32))) )
))
(declare-fun lt!192249 () array!25509)

(declare-fun lt!192246 () ListLongMap!6057)

(assert (=> b!419260 (= lt!192246 (+!1242 lt!192254 (tuple2!7145 (select (arr!12204 lt!192249) from!863) lt!192252)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15543)

(assert (=> b!419260 (= lt!192252 (get!6051 (select (store (arr!12203 _values!549) i!563 (ValueCellFull!5071 v!412)) from!863) lt!192250))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!712 (Int (_ BitVec 64)) V!15543)

(assert (=> b!419260 (= lt!192250 (dynLambda!712 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15543)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!192247 () array!25507)

(declare-fun zeroValue!515 () V!15543)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1249 (array!25509 array!25507 (_ BitVec 32) (_ BitVec 32) V!15543 V!15543 (_ BitVec 32) Int) ListLongMap!6057)

(assert (=> b!419260 (= lt!192254 (getCurrentListMapNoExtraKeys!1249 lt!192249 lt!192247 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!419261 () Bool)

(declare-fun e!249889 () Bool)

(declare-fun e!249890 () Bool)

(assert (=> b!419261 (= e!249889 e!249890)))

(declare-fun res!244402 () Bool)

(assert (=> b!419261 (=> (not res!244402) (not e!249890))))

(assert (=> b!419261 (= res!244402 (= from!863 i!563))))

(assert (=> b!419261 (= lt!192246 (getCurrentListMapNoExtraKeys!1249 lt!192249 lt!192247 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!419261 (= lt!192247 (array!25508 (store (arr!12203 _values!549) i!563 (ValueCellFull!5071 v!412)) (size!12555 _values!549)))))

(declare-fun lt!192253 () ListLongMap!6057)

(declare-fun _keys!709 () array!25509)

(assert (=> b!419261 (= lt!192253 (getCurrentListMapNoExtraKeys!1249 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!419262 () Bool)

(declare-fun res!244400 () Bool)

(declare-fun e!249893 () Bool)

(assert (=> b!419262 (=> (not res!244400) (not e!249893))))

(assert (=> b!419262 (= res!244400 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12556 _keys!709))))))

(declare-fun b!419263 () Bool)

(declare-fun e!249896 () Bool)

(assert (=> b!419263 (= e!249896 tp_is_empty!10829)))

(declare-fun b!419264 () Bool)

(declare-fun res!244411 () Bool)

(assert (=> b!419264 (=> (not res!244411) (not e!249893))))

(assert (=> b!419264 (= res!244411 (or (= (select (arr!12204 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12204 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!419265 () Bool)

(declare-fun e!249895 () Bool)

(declare-fun call!29209 () ListLongMap!6057)

(declare-fun call!29210 () ListLongMap!6057)

(assert (=> b!419265 (= e!249895 (= call!29209 call!29210))))

(declare-fun b!419266 () Bool)

(declare-fun e!249897 () Bool)

(declare-fun mapRes!17865 () Bool)

(assert (=> b!419266 (= e!249897 (and e!249894 mapRes!17865))))

(declare-fun condMapEmpty!17865 () Bool)

(declare-fun mapDefault!17865 () ValueCell!5071)

