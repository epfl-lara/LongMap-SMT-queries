; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74438 () Bool)

(assert start!74438)

(declare-fun b_free!15181 () Bool)

(declare-fun b_next!15181 () Bool)

(assert (=> start!74438 (= b_free!15181 (not b_next!15181))))

(declare-fun tp!53221 () Bool)

(declare-fun b_and!25015 () Bool)

(assert (=> start!74438 (= tp!53221 b_and!25015)))

(declare-fun b!876764 () Bool)

(declare-fun e!488057 () Bool)

(declare-fun tp_is_empty!17425 () Bool)

(assert (=> b!876764 (= e!488057 tp_is_empty!17425)))

(declare-fun mapNonEmpty!27749 () Bool)

(declare-fun mapRes!27749 () Bool)

(declare-fun tp!53220 () Bool)

(declare-fun e!488061 () Bool)

(assert (=> mapNonEmpty!27749 (= mapRes!27749 (and tp!53220 e!488061))))

(declare-fun mapKey!27749 () (_ BitVec 32))

(declare-datatypes ((V!28281 0))(
  ( (V!28282 (val!8760 Int)) )
))
(declare-datatypes ((ValueCell!8273 0))(
  ( (ValueCellFull!8273 (v!11193 V!28281)) (EmptyCell!8273) )
))
(declare-datatypes ((array!50976 0))(
  ( (array!50977 (arr!24515 (Array (_ BitVec 32) ValueCell!8273)) (size!24955 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50976)

(declare-fun mapValue!27749 () ValueCell!8273)

(declare-fun mapRest!27749 () (Array (_ BitVec 32) ValueCell!8273))

(assert (=> mapNonEmpty!27749 (= (arr!24515 _values!688) (store mapRest!27749 mapKey!27749 mapValue!27749))))

(declare-fun mapIsEmpty!27749 () Bool)

(assert (=> mapIsEmpty!27749 mapRes!27749))

(declare-fun b!876765 () Bool)

(declare-fun res!595761 () Bool)

(declare-fun e!488059 () Bool)

(assert (=> b!876765 (=> (not res!595761) (not e!488059))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876765 (= res!595761 (validMask!0 mask!1196))))

(declare-fun b!876767 () Bool)

(declare-fun res!595767 () Bool)

(assert (=> b!876767 (=> (not res!595767) (not e!488059))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!50978 0))(
  ( (array!50979 (arr!24516 (Array (_ BitVec 32) (_ BitVec 64))) (size!24956 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50978)

(assert (=> b!876767 (= res!595767 (and (= (size!24955 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24956 _keys!868) (size!24955 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!876768 () Bool)

(declare-fun res!595762 () Bool)

(assert (=> b!876768 (=> (not res!595762) (not e!488059))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!876768 (= res!595762 (and (= (select (arr!24516 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!876769 () Bool)

(declare-fun res!595765 () Bool)

(assert (=> b!876769 (=> (not res!595765) (not e!488059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876769 (= res!595765 (validKeyInArray!0 k!854))))

(declare-fun b!876770 () Bool)

(declare-fun e!488060 () Bool)

(declare-fun e!488054 () Bool)

(assert (=> b!876770 (= e!488060 (not e!488054))))

(declare-fun res!595763 () Bool)

(assert (=> b!876770 (=> res!595763 e!488054)))

(assert (=> b!876770 (= res!595763 (not (validKeyInArray!0 (select (arr!24516 _keys!868) from!1053))))))

(declare-fun e!488058 () Bool)

(assert (=> b!876770 e!488058))

(declare-fun c!92621 () Bool)

(assert (=> b!876770 (= c!92621 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29984 0))(
  ( (Unit!29985) )
))
(declare-fun lt!396691 () Unit!29984)

(declare-fun v!557 () V!28281)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28281)

(declare-fun zeroValue!654 () V!28281)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!685 (array!50978 array!50976 (_ BitVec 32) (_ BitVec 32) V!28281 V!28281 (_ BitVec 32) (_ BitVec 64) V!28281 (_ BitVec 32) Int) Unit!29984)

(assert (=> b!876770 (= lt!396691 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!685 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876771 () Bool)

(declare-datatypes ((tuple2!11580 0))(
  ( (tuple2!11581 (_1!5801 (_ BitVec 64)) (_2!5801 V!28281)) )
))
(declare-datatypes ((List!17398 0))(
  ( (Nil!17395) (Cons!17394 (h!18525 tuple2!11580) (t!24483 List!17398)) )
))
(declare-datatypes ((ListLongMap!10349 0))(
  ( (ListLongMap!10350 (toList!5190 List!17398)) )
))
(declare-fun call!38787 () ListLongMap!10349)

(declare-fun call!38786 () ListLongMap!10349)

(assert (=> b!876771 (= e!488058 (= call!38787 call!38786))))

(declare-fun b!876772 () Bool)

(declare-fun +!2490 (ListLongMap!10349 tuple2!11580) ListLongMap!10349)

(assert (=> b!876772 (= e!488058 (= call!38787 (+!2490 call!38786 (tuple2!11581 k!854 v!557))))))

(declare-fun b!876773 () Bool)

(assert (=> b!876773 (= e!488061 tp_is_empty!17425)))

(declare-fun b!876774 () Bool)

(declare-fun lt!396684 () ListLongMap!10349)

(declare-fun lt!396687 () ListLongMap!10349)

(assert (=> b!876774 (= e!488054 (= lt!396684 (+!2490 lt!396687 (tuple2!11581 k!854 v!557))))))

(declare-fun lt!396685 () ListLongMap!10349)

(declare-fun lt!396688 () tuple2!11580)

(declare-fun lt!396689 () V!28281)

(assert (=> b!876774 (= (+!2490 lt!396685 lt!396688) (+!2490 (+!2490 lt!396685 (tuple2!11581 k!854 lt!396689)) lt!396688))))

(declare-fun lt!396690 () V!28281)

(assert (=> b!876774 (= lt!396688 (tuple2!11581 k!854 lt!396690))))

(declare-fun lt!396686 () Unit!29984)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!323 (ListLongMap!10349 (_ BitVec 64) V!28281 V!28281) Unit!29984)

(assert (=> b!876774 (= lt!396686 (addSameAsAddTwiceSameKeyDiffValues!323 lt!396685 k!854 lt!396689 lt!396690))))

(declare-fun lt!396693 () V!28281)

(declare-fun get!12893 (ValueCell!8273 V!28281) V!28281)

(assert (=> b!876774 (= lt!396689 (get!12893 (select (arr!24515 _values!688) from!1053) lt!396693))))

(assert (=> b!876774 (= lt!396684 (+!2490 lt!396685 (tuple2!11581 (select (arr!24516 _keys!868) from!1053) lt!396690)))))

(assert (=> b!876774 (= lt!396690 (get!12893 (select (store (arr!24515 _values!688) i!612 (ValueCellFull!8273 v!557)) from!1053) lt!396693))))

(declare-fun dynLambda!1217 (Int (_ BitVec 64)) V!28281)

(assert (=> b!876774 (= lt!396693 (dynLambda!1217 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!396692 () array!50976)

(declare-fun getCurrentListMapNoExtraKeys!3157 (array!50978 array!50976 (_ BitVec 32) (_ BitVec 32) V!28281 V!28281 (_ BitVec 32) Int) ListLongMap!10349)

(assert (=> b!876774 (= lt!396685 (getCurrentListMapNoExtraKeys!3157 _keys!868 lt!396692 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876775 () Bool)

(declare-fun e!488056 () Bool)

(assert (=> b!876775 (= e!488056 (and e!488057 mapRes!27749))))

(declare-fun condMapEmpty!27749 () Bool)

(declare-fun mapDefault!27749 () ValueCell!8273)

