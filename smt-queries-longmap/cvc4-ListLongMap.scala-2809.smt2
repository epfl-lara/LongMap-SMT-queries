; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40768 () Bool)

(assert start!40768)

(declare-fun b_free!10757 () Bool)

(declare-fun b_next!10757 () Bool)

(assert (=> start!40768 (= b_free!10757 (not b_next!10757))))

(declare-fun tp!38094 () Bool)

(declare-fun b_and!18801 () Bool)

(assert (=> start!40768 (= tp!38094 b_and!18801)))

(declare-fun b!451704 () Bool)

(declare-fun e!264578 () Bool)

(declare-datatypes ((V!17231 0))(
  ( (V!17232 (val!6092 Int)) )
))
(declare-datatypes ((tuple2!8012 0))(
  ( (tuple2!8013 (_1!4017 (_ BitVec 64)) (_2!4017 V!17231)) )
))
(declare-datatypes ((List!8073 0))(
  ( (Nil!8070) (Cons!8069 (h!8925 tuple2!8012) (t!13853 List!8073)) )
))
(declare-datatypes ((ListLongMap!6925 0))(
  ( (ListLongMap!6926 (toList!3478 List!8073)) )
))
(declare-fun call!29885 () ListLongMap!6925)

(declare-fun call!29884 () ListLongMap!6925)

(assert (=> b!451704 (= e!264578 (= call!29885 call!29884))))

(declare-fun b!451705 () Bool)

(declare-fun res!268960 () Bool)

(declare-fun e!264576 () Bool)

(assert (=> b!451705 (=> (not res!268960) (not e!264576))))

(declare-datatypes ((array!27997 0))(
  ( (array!27998 (arr!13443 (Array (_ BitVec 32) (_ BitVec 64))) (size!13795 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27997)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451705 (= res!268960 (or (= (select (arr!13443 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13443 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451706 () Bool)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!17231)

(declare-fun +!1557 (ListLongMap!6925 tuple2!8012) ListLongMap!6925)

(assert (=> b!451706 (= e!264578 (= call!29884 (+!1557 call!29885 (tuple2!8013 k!794 v!412))))))

(declare-fun b!451707 () Bool)

(declare-fun e!264580 () Bool)

(assert (=> b!451707 (= e!264580 true)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17231)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17231)

(declare-datatypes ((ValueCell!5704 0))(
  ( (ValueCellFull!5704 (v!8351 V!17231)) (EmptyCell!5704) )
))
(declare-datatypes ((array!27999 0))(
  ( (array!28000 (arr!13444 (Array (_ BitVec 32) ValueCell!5704)) (size!13796 (_ BitVec 32))) )
))
(declare-fun lt!204996 () array!27999)

(declare-fun lt!204995 () ListLongMap!6925)

(declare-fun lt!204994 () array!27997)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1662 (array!27997 array!27999 (_ BitVec 32) (_ BitVec 32) V!17231 V!17231 (_ BitVec 32) Int) ListLongMap!6925)

(declare-fun get!6620 (ValueCell!5704 V!17231) V!17231)

(declare-fun dynLambda!857 (Int (_ BitVec 64)) V!17231)

(assert (=> b!451707 (= lt!204995 (+!1557 (getCurrentListMapNoExtraKeys!1662 lt!204994 lt!204996 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8013 (select (arr!13443 lt!204994) from!863) (get!6620 (select (arr!13444 lt!204996) from!863) (dynLambda!857 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451708 () Bool)

(declare-fun e!264577 () Bool)

(assert (=> b!451708 (= e!264576 e!264577)))

(declare-fun res!268969 () Bool)

(assert (=> b!451708 (=> (not res!268969) (not e!264577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27997 (_ BitVec 32)) Bool)

(assert (=> b!451708 (= res!268969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204994 mask!1025))))

(assert (=> b!451708 (= lt!204994 (array!27998 (store (arr!13443 _keys!709) i!563 k!794) (size!13795 _keys!709)))))

(declare-fun b!451709 () Bool)

(declare-fun e!264573 () Bool)

(declare-fun tp_is_empty!12095 () Bool)

(assert (=> b!451709 (= e!264573 tp_is_empty!12095)))

(declare-fun b!451710 () Bool)

(declare-fun res!268971 () Bool)

(assert (=> b!451710 (=> (not res!268971) (not e!264576))))

(declare-fun _values!549 () array!27999)

(assert (=> b!451710 (= res!268971 (and (= (size!13796 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13795 _keys!709) (size!13796 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451711 () Bool)

(declare-fun e!264581 () Bool)

(assert (=> b!451711 (= e!264581 tp_is_empty!12095)))

(declare-fun b!451712 () Bool)

(declare-fun res!268963 () Bool)

(assert (=> b!451712 (=> (not res!268963) (not e!264577))))

(assert (=> b!451712 (= res!268963 (bvsle from!863 i!563))))

(declare-fun c!56084 () Bool)

(declare-fun bm!29881 () Bool)

(assert (=> bm!29881 (= call!29885 (getCurrentListMapNoExtraKeys!1662 (ite c!56084 _keys!709 lt!204994) (ite c!56084 _values!549 lt!204996) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451713 () Bool)

(declare-fun e!264579 () Bool)

(declare-fun mapRes!19779 () Bool)

(assert (=> b!451713 (= e!264579 (and e!264581 mapRes!19779))))

(declare-fun condMapEmpty!19779 () Bool)

(declare-fun mapDefault!19779 () ValueCell!5704)

