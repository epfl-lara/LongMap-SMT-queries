; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40730 () Bool)

(assert start!40730)

(declare-fun b_free!10741 () Bool)

(declare-fun b_next!10741 () Bool)

(assert (=> start!40730 (= b_free!10741 (not b_next!10741))))

(declare-fun tp!38043 () Bool)

(declare-fun b_and!18749 () Bool)

(assert (=> start!40730 (= tp!38043 b_and!18749)))

(declare-fun b!451075 () Bool)

(declare-fun e!264261 () Bool)

(declare-fun e!264256 () Bool)

(assert (=> b!451075 (= e!264261 (not e!264256))))

(declare-fun res!268572 () Bool)

(assert (=> b!451075 (=> res!268572 e!264256)))

(declare-datatypes ((array!27963 0))(
  ( (array!27964 (arr!13427 (Array (_ BitVec 32) (_ BitVec 64))) (size!13779 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27963)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451075 (= res!268572 (validKeyInArray!0 (select (arr!13427 _keys!709) from!863)))))

(declare-fun e!264259 () Bool)

(assert (=> b!451075 e!264259))

(declare-fun c!56018 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451075 (= c!56018 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!17211 0))(
  ( (V!17212 (val!6084 Int)) )
))
(declare-fun minValue!515 () V!17211)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5696 0))(
  ( (ValueCellFull!5696 (v!8339 V!17211)) (EmptyCell!5696) )
))
(declare-datatypes ((array!27965 0))(
  ( (array!27966 (arr!13428 (Array (_ BitVec 32) ValueCell!5696)) (size!13780 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27965)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!17211)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((Unit!13206 0))(
  ( (Unit!13207) )
))
(declare-fun lt!204795 () Unit!13206)

(declare-fun zeroValue!515 () V!17211)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!718 (array!27963 array!27965 (_ BitVec 32) (_ BitVec 32) V!17211 V!17211 (_ BitVec 32) (_ BitVec 64) V!17211 (_ BitVec 32) Int) Unit!13206)

(assert (=> b!451075 (= lt!204795 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!718 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451076 () Bool)

(declare-datatypes ((tuple2!7996 0))(
  ( (tuple2!7997 (_1!4009 (_ BitVec 64)) (_2!4009 V!17211)) )
))
(declare-datatypes ((List!8060 0))(
  ( (Nil!8057) (Cons!8056 (h!8912 tuple2!7996) (t!13824 List!8060)) )
))
(declare-datatypes ((ListLongMap!6909 0))(
  ( (ListLongMap!6910 (toList!3470 List!8060)) )
))
(declare-fun call!29815 () ListLongMap!6909)

(declare-fun call!29816 () ListLongMap!6909)

(assert (=> b!451076 (= e!264259 (= call!29815 call!29816))))

(declare-fun lt!204798 () array!27963)

(declare-fun lt!204797 () array!27965)

(declare-fun bm!29812 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1654 (array!27963 array!27965 (_ BitVec 32) (_ BitVec 32) V!17211 V!17211 (_ BitVec 32) Int) ListLongMap!6909)

(assert (=> bm!29812 (= call!29816 (getCurrentListMapNoExtraKeys!1654 (ite c!56018 lt!204798 _keys!709) (ite c!56018 lt!204797 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451077 () Bool)

(declare-fun lt!204794 () ListLongMap!6909)

(declare-fun +!1550 (ListLongMap!6909 tuple2!7996) ListLongMap!6909)

(declare-fun get!6608 (ValueCell!5696 V!17211) V!17211)

(declare-fun dynLambda!851 (Int (_ BitVec 64)) V!17211)

(assert (=> b!451077 (= e!264256 (= lt!204794 (+!1550 (getCurrentListMapNoExtraKeys!1654 lt!204798 lt!204797 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7997 (select (arr!13427 lt!204798) from!863) (get!6608 (select (arr!13428 lt!204797) from!863) (dynLambda!851 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!451078 () Bool)

(declare-fun res!268564 () Bool)

(declare-fun e!264258 () Bool)

(assert (=> b!451078 (=> (not res!268564) (not e!264258))))

(declare-fun arrayContainsKey!0 (array!27963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451078 (= res!268564 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19752 () Bool)

(declare-fun mapRes!19752 () Bool)

(assert (=> mapIsEmpty!19752 mapRes!19752))

(declare-fun b!451079 () Bool)

(declare-fun e!264257 () Bool)

(declare-fun tp_is_empty!12079 () Bool)

(assert (=> b!451079 (= e!264257 tp_is_empty!12079)))

(declare-fun b!451080 () Bool)

(declare-fun res!268560 () Bool)

(assert (=> b!451080 (=> (not res!268560) (not e!264258))))

(declare-datatypes ((List!8061 0))(
  ( (Nil!8058) (Cons!8057 (h!8913 (_ BitVec 64)) (t!13825 List!8061)) )
))
(declare-fun arrayNoDuplicates!0 (array!27963 (_ BitVec 32) List!8061) Bool)

(assert (=> b!451080 (= res!268560 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8058))))

(declare-fun b!451081 () Bool)

(declare-fun e!264263 () Bool)

(assert (=> b!451081 (= e!264263 tp_is_empty!12079)))

(declare-fun b!451082 () Bool)

(declare-fun res!268570 () Bool)

(declare-fun e!264260 () Bool)

(assert (=> b!451082 (=> (not res!268570) (not e!264260))))

(assert (=> b!451082 (= res!268570 (arrayNoDuplicates!0 lt!204798 #b00000000000000000000000000000000 Nil!8058))))

(declare-fun b!451083 () Bool)

(declare-fun res!268571 () Bool)

(assert (=> b!451083 (=> (not res!268571) (not e!264258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451083 (= res!268571 (validMask!0 mask!1025))))

(declare-fun b!451084 () Bool)

(assert (=> b!451084 (= e!264260 e!264261)))

(declare-fun res!268567 () Bool)

(assert (=> b!451084 (=> (not res!268567) (not e!264261))))

(assert (=> b!451084 (= res!268567 (= from!863 i!563))))

(assert (=> b!451084 (= lt!204794 (getCurrentListMapNoExtraKeys!1654 lt!204798 lt!204797 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!451084 (= lt!204797 (array!27966 (store (arr!13428 _values!549) i!563 (ValueCellFull!5696 v!412)) (size!13780 _values!549)))))

(declare-fun lt!204796 () ListLongMap!6909)

(assert (=> b!451084 (= lt!204796 (getCurrentListMapNoExtraKeys!1654 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!451085 () Bool)

(declare-fun e!264262 () Bool)

(assert (=> b!451085 (= e!264262 (and e!264257 mapRes!19752))))

(declare-fun condMapEmpty!19752 () Bool)

(declare-fun mapDefault!19752 () ValueCell!5696)

