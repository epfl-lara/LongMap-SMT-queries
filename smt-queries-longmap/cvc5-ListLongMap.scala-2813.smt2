; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40788 () Bool)

(assert start!40788)

(declare-fun b_free!10777 () Bool)

(declare-fun b_next!10777 () Bool)

(assert (=> start!40788 (= b_free!10777 (not b_next!10777))))

(declare-fun tp!38154 () Bool)

(declare-fun b_and!18841 () Bool)

(assert (=> start!40788 (= tp!38154 b_and!18841)))

(declare-fun b!452294 () Bool)

(declare-fun res!269387 () Bool)

(declare-fun e!264850 () Bool)

(assert (=> b!452294 (=> (not res!269387) (not e!264850))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28037 0))(
  ( (array!28038 (arr!13463 (Array (_ BitVec 32) (_ BitVec 64))) (size!13815 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28037)

(assert (=> b!452294 (= res!269387 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13815 _keys!709))))))

(declare-fun b!452295 () Bool)

(declare-fun res!269381 () Bool)

(assert (=> b!452295 (=> (not res!269381) (not e!264850))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452295 (= res!269381 (validKeyInArray!0 k!794))))

(declare-fun c!56114 () Bool)

(declare-datatypes ((V!17259 0))(
  ( (V!17260 (val!6102 Int)) )
))
(declare-fun minValue!515 () V!17259)

(declare-fun defaultEntry!557 () Int)

(declare-fun bm!29941 () Bool)

(declare-datatypes ((ValueCell!5714 0))(
  ( (ValueCellFull!5714 (v!8361 V!17259)) (EmptyCell!5714) )
))
(declare-datatypes ((array!28039 0))(
  ( (array!28040 (arr!13464 (Array (_ BitVec 32) ValueCell!5714)) (size!13816 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28039)

(declare-fun zeroValue!515 () V!17259)

(declare-fun lt!205156 () array!28039)

(declare-datatypes ((tuple2!8030 0))(
  ( (tuple2!8031 (_1!4026 (_ BitVec 64)) (_2!4026 V!17259)) )
))
(declare-datatypes ((List!8089 0))(
  ( (Nil!8086) (Cons!8085 (h!8941 tuple2!8030) (t!13889 List!8089)) )
))
(declare-datatypes ((ListLongMap!6943 0))(
  ( (ListLongMap!6944 (toList!3487 List!8089)) )
))
(declare-fun call!29945 () ListLongMap!6943)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!205159 () array!28037)

(declare-fun getCurrentListMapNoExtraKeys!1671 (array!28037 array!28039 (_ BitVec 32) (_ BitVec 32) V!17259 V!17259 (_ BitVec 32) Int) ListLongMap!6943)

(assert (=> bm!29941 (= call!29945 (getCurrentListMapNoExtraKeys!1671 (ite c!56114 _keys!709 lt!205159) (ite c!56114 _values!549 lt!205156) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452297 () Bool)

(declare-fun e!264846 () Bool)

(declare-fun e!264849 () Bool)

(assert (=> b!452297 (= e!264846 e!264849)))

(declare-fun res!269393 () Bool)

(assert (=> b!452297 (=> (not res!269393) (not e!264849))))

(assert (=> b!452297 (= res!269393 (= from!863 i!563))))

(declare-fun lt!205164 () ListLongMap!6943)

(assert (=> b!452297 (= lt!205164 (getCurrentListMapNoExtraKeys!1671 lt!205159 lt!205156 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17259)

(assert (=> b!452297 (= lt!205156 (array!28040 (store (arr!13464 _values!549) i!563 (ValueCellFull!5714 v!412)) (size!13816 _values!549)))))

(declare-fun lt!205163 () ListLongMap!6943)

(assert (=> b!452297 (= lt!205163 (getCurrentListMapNoExtraKeys!1671 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun call!29944 () ListLongMap!6943)

(declare-fun e!264847 () Bool)

(declare-fun b!452298 () Bool)

(declare-fun +!1564 (ListLongMap!6943 tuple2!8030) ListLongMap!6943)

(assert (=> b!452298 (= e!264847 (= call!29944 (+!1564 call!29945 (tuple2!8031 k!794 v!412))))))

(declare-fun b!452299 () Bool)

(declare-fun e!264851 () Bool)

(declare-fun tp_is_empty!12115 () Bool)

(assert (=> b!452299 (= e!264851 tp_is_empty!12115)))

(declare-fun b!452300 () Bool)

(assert (=> b!452300 (= e!264847 (= call!29945 call!29944))))

(declare-fun b!452301 () Bool)

(declare-fun e!264844 () Bool)

(assert (=> b!452301 (= e!264844 true)))

(declare-fun lt!205160 () V!17259)

(declare-fun lt!205162 () ListLongMap!6943)

(declare-fun lt!205165 () tuple2!8030)

(assert (=> b!452301 (= (+!1564 lt!205162 lt!205165) (+!1564 (+!1564 lt!205162 (tuple2!8031 k!794 lt!205160)) lt!205165))))

(declare-fun lt!205166 () V!17259)

(assert (=> b!452301 (= lt!205165 (tuple2!8031 k!794 lt!205166))))

(declare-datatypes ((Unit!13224 0))(
  ( (Unit!13225) )
))
(declare-fun lt!205158 () Unit!13224)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!77 (ListLongMap!6943 (_ BitVec 64) V!17259 V!17259) Unit!13224)

(assert (=> b!452301 (= lt!205158 (addSameAsAddTwiceSameKeyDiffValues!77 lt!205162 k!794 lt!205160 lt!205166))))

(declare-fun lt!205157 () V!17259)

(declare-fun get!6635 (ValueCell!5714 V!17259) V!17259)

(assert (=> b!452301 (= lt!205160 (get!6635 (select (arr!13464 _values!549) from!863) lt!205157))))

(assert (=> b!452301 (= lt!205164 (+!1564 lt!205162 (tuple2!8031 (select (arr!13463 lt!205159) from!863) lt!205166)))))

(assert (=> b!452301 (= lt!205166 (get!6635 (select (store (arr!13464 _values!549) i!563 (ValueCellFull!5714 v!412)) from!863) lt!205157))))

(declare-fun dynLambda!864 (Int (_ BitVec 64)) V!17259)

(assert (=> b!452301 (= lt!205157 (dynLambda!864 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!452301 (= lt!205162 (getCurrentListMapNoExtraKeys!1671 lt!205159 lt!205156 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19809 () Bool)

(declare-fun mapRes!19809 () Bool)

(assert (=> mapIsEmpty!19809 mapRes!19809))

(declare-fun b!452302 () Bool)

(declare-fun e!264845 () Bool)

(assert (=> b!452302 (= e!264845 tp_is_empty!12115)))

(declare-fun res!269390 () Bool)

(assert (=> start!40788 (=> (not res!269390) (not e!264850))))

(assert (=> start!40788 (= res!269390 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13815 _keys!709))))))

(assert (=> start!40788 e!264850))

(assert (=> start!40788 tp_is_empty!12115))

(assert (=> start!40788 tp!38154))

(assert (=> start!40788 true))

(declare-fun e!264848 () Bool)

(declare-fun array_inv!9748 (array!28039) Bool)

(assert (=> start!40788 (and (array_inv!9748 _values!549) e!264848)))

(declare-fun array_inv!9749 (array!28037) Bool)

(assert (=> start!40788 (array_inv!9749 _keys!709)))

(declare-fun b!452296 () Bool)

(assert (=> b!452296 (= e!264848 (and e!264845 mapRes!19809))))

(declare-fun condMapEmpty!19809 () Bool)

(declare-fun mapDefault!19809 () ValueCell!5714)

