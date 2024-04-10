; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40704 () Bool)

(assert start!40704)

(declare-fun b_free!10715 () Bool)

(declare-fun b_next!10715 () Bool)

(assert (=> start!40704 (= b_free!10715 (not b_next!10715))))

(declare-fun tp!37964 () Bool)

(declare-fun b_and!18723 () Bool)

(assert (=> start!40704 (= tp!37964 b_and!18723)))

(declare-datatypes ((V!17175 0))(
  ( (V!17176 (val!6071 Int)) )
))
(declare-fun minValue!515 () V!17175)

(declare-fun defaultEntry!557 () Int)

(declare-fun c!55979 () Bool)

(declare-datatypes ((ValueCell!5683 0))(
  ( (ValueCellFull!5683 (v!8326 V!17175)) (EmptyCell!5683) )
))
(declare-datatypes ((array!27913 0))(
  ( (array!27914 (arr!13402 (Array (_ BitVec 32) ValueCell!5683)) (size!13754 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27913)

(declare-fun zeroValue!515 () V!17175)

(declare-datatypes ((tuple2!7972 0))(
  ( (tuple2!7973 (_1!3997 (_ BitVec 64)) (_2!3997 V!17175)) )
))
(declare-datatypes ((List!8041 0))(
  ( (Nil!8038) (Cons!8037 (h!8893 tuple2!7972) (t!13803 List!8041)) )
))
(declare-datatypes ((ListLongMap!6885 0))(
  ( (ListLongMap!6886 (toList!3458 List!8041)) )
))
(declare-fun call!29738 () ListLongMap!6885)

(declare-fun lt!204581 () array!27913)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!27915 0))(
  ( (array!27916 (arr!13403 (Array (_ BitVec 32) (_ BitVec 64))) (size!13755 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27915)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!29734 () Bool)

(declare-fun lt!204582 () array!27915)

(declare-fun getCurrentListMapNoExtraKeys!1644 (array!27915 array!27913 (_ BitVec 32) (_ BitVec 32) V!17175 V!17175 (_ BitVec 32) Int) ListLongMap!6885)

(assert (=> bm!29734 (= call!29738 (getCurrentListMapNoExtraKeys!1644 (ite c!55979 _keys!709 lt!204582) (ite c!55979 _values!549 lt!204581) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450343 () Bool)

(declare-fun e!263915 () Bool)

(declare-fun tp_is_empty!12053 () Bool)

(assert (=> b!450343 (= e!263915 tp_is_empty!12053)))

(declare-fun call!29737 () ListLongMap!6885)

(declare-fun bm!29735 () Bool)

(assert (=> bm!29735 (= call!29737 (getCurrentListMapNoExtraKeys!1644 (ite c!55979 lt!204582 _keys!709) (ite c!55979 lt!204581 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450344 () Bool)

(declare-fun res!268027 () Bool)

(declare-fun e!263918 () Bool)

(assert (=> b!450344 (=> (not res!268027) (not e!263918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450344 (= res!268027 (validMask!0 mask!1025))))

(declare-fun res!268025 () Bool)

(assert (=> start!40704 (=> (not res!268025) (not e!263918))))

(assert (=> start!40704 (= res!268025 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13755 _keys!709))))))

(assert (=> start!40704 e!263918))

(assert (=> start!40704 tp_is_empty!12053))

(assert (=> start!40704 tp!37964))

(assert (=> start!40704 true))

(declare-fun e!263920 () Bool)

(declare-fun array_inv!9704 (array!27913) Bool)

(assert (=> start!40704 (and (array_inv!9704 _values!549) e!263920)))

(declare-fun array_inv!9705 (array!27915) Bool)

(assert (=> start!40704 (array_inv!9705 _keys!709)))

(declare-fun b!450345 () Bool)

(declare-fun e!263921 () Bool)

(declare-fun mapRes!19713 () Bool)

(assert (=> b!450345 (= e!263920 (and e!263921 mapRes!19713))))

(declare-fun condMapEmpty!19713 () Bool)

(declare-fun mapDefault!19713 () ValueCell!5683)

