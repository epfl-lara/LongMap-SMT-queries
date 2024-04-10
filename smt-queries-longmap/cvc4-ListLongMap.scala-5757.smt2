; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74374 () Bool)

(assert start!74374)

(declare-fun b_free!15137 () Bool)

(declare-fun b_next!15137 () Bool)

(assert (=> start!74374 (= b_free!15137 (not b_next!15137))))

(declare-fun tp!53085 () Bool)

(declare-fun b_and!24913 () Bool)

(assert (=> start!74374 (= tp!53085 b_and!24913)))

(declare-fun b!875602 () Bool)

(declare-fun res!595054 () Bool)

(declare-fun e!487444 () Bool)

(assert (=> b!875602 (=> (not res!595054) (not e!487444))))

(declare-datatypes ((array!50886 0))(
  ( (array!50887 (arr!24471 (Array (_ BitVec 32) (_ BitVec 64))) (size!24911 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50886)

(declare-datatypes ((List!17366 0))(
  ( (Nil!17363) (Cons!17362 (h!18493 (_ BitVec 64)) (t!24407 List!17366)) )
))
(declare-fun arrayNoDuplicates!0 (array!50886 (_ BitVec 32) List!17366) Bool)

(assert (=> b!875602 (= res!595054 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17363))))

(declare-datatypes ((V!28221 0))(
  ( (V!28222 (val!8738 Int)) )
))
(declare-datatypes ((tuple2!11544 0))(
  ( (tuple2!11545 (_1!5783 (_ BitVec 64)) (_2!5783 V!28221)) )
))
(declare-datatypes ((List!17367 0))(
  ( (Nil!17364) (Cons!17363 (h!18494 tuple2!11544) (t!24408 List!17367)) )
))
(declare-datatypes ((ListLongMap!10313 0))(
  ( (ListLongMap!10314 (toList!5172 List!17367)) )
))
(declare-fun call!38636 () ListLongMap!10313)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!38633 () Bool)

(declare-datatypes ((ValueCell!8251 0))(
  ( (ValueCellFull!8251 (v!11167 V!28221)) (EmptyCell!8251) )
))
(declare-datatypes ((array!50888 0))(
  ( (array!50889 (arr!24472 (Array (_ BitVec 32) ValueCell!8251)) (size!24912 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50888)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28221)

(declare-fun zeroValue!654 () V!28221)

(declare-fun getCurrentListMapNoExtraKeys!3139 (array!50886 array!50888 (_ BitVec 32) (_ BitVec 32) V!28221 V!28221 (_ BitVec 32) Int) ListLongMap!10313)

(assert (=> bm!38633 (= call!38636 (getCurrentListMapNoExtraKeys!3139 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!38637 () ListLongMap!10313)

(declare-fun bm!38634 () Bool)

(declare-fun lt!396230 () array!50888)

(assert (=> bm!38634 (= call!38637 (getCurrentListMapNoExtraKeys!3139 _keys!868 lt!396230 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27680 () Bool)

(declare-fun mapRes!27680 () Bool)

(assert (=> mapIsEmpty!27680 mapRes!27680))

(declare-fun b!875603 () Bool)

(declare-fun e!487449 () Bool)

(assert (=> b!875603 (= e!487449 (= call!38637 call!38636))))

(declare-fun b!875604 () Bool)

(declare-fun e!487448 () Bool)

(assert (=> b!875604 (= e!487444 e!487448)))

(declare-fun res!595053 () Bool)

(assert (=> b!875604 (=> (not res!595053) (not e!487448))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!875604 (= res!595053 (= from!1053 i!612))))

(declare-fun lt!396231 () ListLongMap!10313)

(assert (=> b!875604 (= lt!396231 (getCurrentListMapNoExtraKeys!3139 _keys!868 lt!396230 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28221)

(assert (=> b!875604 (= lt!396230 (array!50889 (store (arr!24472 _values!688) i!612 (ValueCellFull!8251 v!557)) (size!24912 _values!688)))))

(declare-fun lt!396229 () ListLongMap!10313)

(assert (=> b!875604 (= lt!396229 (getCurrentListMapNoExtraKeys!3139 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875605 () Bool)

(declare-fun res!595058 () Bool)

(assert (=> b!875605 (=> (not res!595058) (not e!487444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50886 (_ BitVec 32)) Bool)

(assert (=> b!875605 (= res!595058 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875606 () Bool)

(declare-fun res!595057 () Bool)

(assert (=> b!875606 (=> (not res!595057) (not e!487444))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!875606 (= res!595057 (and (= (select (arr!24471 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!875607 () Bool)

(declare-fun res!595055 () Bool)

(assert (=> b!875607 (=> (not res!595055) (not e!487444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875607 (= res!595055 (validMask!0 mask!1196))))

(declare-fun res!595052 () Bool)

(assert (=> start!74374 (=> (not res!595052) (not e!487444))))

(assert (=> start!74374 (= res!595052 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24911 _keys!868))))))

(assert (=> start!74374 e!487444))

(declare-fun tp_is_empty!17381 () Bool)

(assert (=> start!74374 tp_is_empty!17381))

(assert (=> start!74374 true))

(assert (=> start!74374 tp!53085))

(declare-fun array_inv!19292 (array!50886) Bool)

(assert (=> start!74374 (array_inv!19292 _keys!868)))

(declare-fun e!487447 () Bool)

(declare-fun array_inv!19293 (array!50888) Bool)

(assert (=> start!74374 (and (array_inv!19293 _values!688) e!487447)))

(declare-fun b!875608 () Bool)

(declare-fun e!487450 () Bool)

(assert (=> b!875608 (= e!487450 (bvslt from!1053 (size!24912 _values!688)))))

(declare-fun lt!396233 () ListLongMap!10313)

(assert (=> b!875608 (= lt!396233 (getCurrentListMapNoExtraKeys!3139 _keys!868 lt!396230 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875609 () Bool)

(declare-fun +!2475 (ListLongMap!10313 tuple2!11544) ListLongMap!10313)

(assert (=> b!875609 (= e!487449 (= call!38637 (+!2475 call!38636 (tuple2!11545 k!854 v!557))))))

(declare-fun b!875610 () Bool)

(declare-fun e!487451 () Bool)

(assert (=> b!875610 (= e!487451 tp_is_empty!17381)))

(declare-fun b!875611 () Bool)

(assert (=> b!875611 (= e!487448 (not e!487450))))

(declare-fun res!595056 () Bool)

(assert (=> b!875611 (=> res!595056 e!487450)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875611 (= res!595056 (not (validKeyInArray!0 (select (arr!24471 _keys!868) from!1053))))))

(assert (=> b!875611 e!487449))

(declare-fun c!92519 () Bool)

(assert (=> b!875611 (= c!92519 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29946 0))(
  ( (Unit!29947) )
))
(declare-fun lt!396232 () Unit!29946)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!666 (array!50886 array!50888 (_ BitVec 32) (_ BitVec 32) V!28221 V!28221 (_ BitVec 32) (_ BitVec 64) V!28221 (_ BitVec 32) Int) Unit!29946)

(assert (=> b!875611 (= lt!396232 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!666 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875612 () Bool)

(declare-fun res!595059 () Bool)

(assert (=> b!875612 (=> (not res!595059) (not e!487444))))

(assert (=> b!875612 (= res!595059 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!27680 () Bool)

(declare-fun tp!53086 () Bool)

(assert (=> mapNonEmpty!27680 (= mapRes!27680 (and tp!53086 e!487451))))

(declare-fun mapValue!27680 () ValueCell!8251)

(declare-fun mapRest!27680 () (Array (_ BitVec 32) ValueCell!8251))

(declare-fun mapKey!27680 () (_ BitVec 32))

(assert (=> mapNonEmpty!27680 (= (arr!24472 _values!688) (store mapRest!27680 mapKey!27680 mapValue!27680))))

(declare-fun b!875613 () Bool)

(declare-fun res!595051 () Bool)

(assert (=> b!875613 (=> (not res!595051) (not e!487444))))

(assert (=> b!875613 (= res!595051 (and (= (size!24912 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24911 _keys!868) (size!24912 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875614 () Bool)

(declare-fun e!487445 () Bool)

(assert (=> b!875614 (= e!487447 (and e!487445 mapRes!27680))))

(declare-fun condMapEmpty!27680 () Bool)

(declare-fun mapDefault!27680 () ValueCell!8251)

