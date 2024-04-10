; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74380 () Bool)

(assert start!74380)

(declare-fun b_free!15143 () Bool)

(declare-fun b_next!15143 () Bool)

(assert (=> start!74380 (= b_free!15143 (not b_next!15143))))

(declare-fun tp!53103 () Bool)

(declare-fun b_and!24923 () Bool)

(assert (=> start!74380 (= tp!53103 b_and!24923)))

(declare-fun mapNonEmpty!27689 () Bool)

(declare-fun mapRes!27689 () Bool)

(declare-fun tp!53104 () Bool)

(declare-fun e!487519 () Bool)

(assert (=> mapNonEmpty!27689 (= mapRes!27689 (and tp!53104 e!487519))))

(declare-fun mapKey!27689 () (_ BitVec 32))

(declare-datatypes ((V!28229 0))(
  ( (V!28230 (val!8741 Int)) )
))
(declare-datatypes ((ValueCell!8254 0))(
  ( (ValueCellFull!8254 (v!11170 V!28229)) (EmptyCell!8254) )
))
(declare-fun mapValue!27689 () ValueCell!8254)

(declare-datatypes ((array!50898 0))(
  ( (array!50899 (arr!24477 (Array (_ BitVec 32) ValueCell!8254)) (size!24917 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50898)

(declare-fun mapRest!27689 () (Array (_ BitVec 32) ValueCell!8254))

(assert (=> mapNonEmpty!27689 (= (arr!24477 _values!688) (store mapRest!27689 mapKey!27689 mapValue!27689))))

(declare-fun mapIsEmpty!27689 () Bool)

(assert (=> mapIsEmpty!27689 mapRes!27689))

(declare-fun b!875741 () Bool)

(declare-fun res!595145 () Bool)

(declare-fun e!487522 () Bool)

(assert (=> b!875741 (=> (not res!595145) (not e!487522))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50900 0))(
  ( (array!50901 (arr!24478 (Array (_ BitVec 32) (_ BitVec 64))) (size!24918 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50900)

(assert (=> b!875741 (= res!595145 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24918 _keys!868))))))

(declare-fun lt!396268 () array!50898)

(declare-datatypes ((tuple2!11550 0))(
  ( (tuple2!11551 (_1!5786 (_ BitVec 64)) (_2!5786 V!28229)) )
))
(declare-datatypes ((List!17371 0))(
  ( (Nil!17368) (Cons!17367 (h!18498 tuple2!11550) (t!24418 List!17371)) )
))
(declare-datatypes ((ListLongMap!10319 0))(
  ( (ListLongMap!10320 (toList!5175 List!17371)) )
))
(declare-fun call!38654 () ListLongMap!10319)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!38651 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28229)

(declare-fun zeroValue!654 () V!28229)

(declare-fun getCurrentListMapNoExtraKeys!3142 (array!50900 array!50898 (_ BitVec 32) (_ BitVec 32) V!28229 V!28229 (_ BitVec 32) Int) ListLongMap!10319)

(assert (=> bm!38651 (= call!38654 (getCurrentListMapNoExtraKeys!3142 _keys!868 lt!396268 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875742 () Bool)

(declare-fun e!487521 () Bool)

(declare-fun e!487516 () Bool)

(assert (=> b!875742 (= e!487521 (not e!487516))))

(declare-fun res!595142 () Bool)

(assert (=> b!875742 (=> res!595142 e!487516)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875742 (= res!595142 (not (validKeyInArray!0 (select (arr!24478 _keys!868) from!1053))))))

(declare-fun e!487523 () Bool)

(assert (=> b!875742 e!487523))

(declare-fun c!92528 () Bool)

(assert (=> b!875742 (= c!92528 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!28229)

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((Unit!29952 0))(
  ( (Unit!29953) )
))
(declare-fun lt!396266 () Unit!29952)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!669 (array!50900 array!50898 (_ BitVec 32) (_ BitVec 32) V!28229 V!28229 (_ BitVec 32) (_ BitVec 64) V!28229 (_ BitVec 32) Int) Unit!29952)

(assert (=> b!875742 (= lt!396266 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!669 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875743 () Bool)

(declare-fun call!38655 () ListLongMap!10319)

(assert (=> b!875743 (= e!487523 (= call!38654 call!38655))))

(declare-fun b!875744 () Bool)

(declare-fun tp_is_empty!17387 () Bool)

(assert (=> b!875744 (= e!487519 tp_is_empty!17387)))

(declare-fun b!875745 () Bool)

(declare-fun res!595148 () Bool)

(assert (=> b!875745 (=> (not res!595148) (not e!487522))))

(assert (=> b!875745 (= res!595148 (and (= (select (arr!24478 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun res!595143 () Bool)

(assert (=> start!74380 (=> (not res!595143) (not e!487522))))

(assert (=> start!74380 (= res!595143 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24918 _keys!868))))))

(assert (=> start!74380 e!487522))

(assert (=> start!74380 tp_is_empty!17387))

(assert (=> start!74380 true))

(assert (=> start!74380 tp!53103))

(declare-fun array_inv!19298 (array!50900) Bool)

(assert (=> start!74380 (array_inv!19298 _keys!868)))

(declare-fun e!487517 () Bool)

(declare-fun array_inv!19299 (array!50898) Bool)

(assert (=> start!74380 (and (array_inv!19299 _values!688) e!487517)))

(declare-fun b!875746 () Bool)

(declare-fun e!487520 () Bool)

(assert (=> b!875746 (= e!487517 (and e!487520 mapRes!27689))))

(declare-fun condMapEmpty!27689 () Bool)

(declare-fun mapDefault!27689 () ValueCell!8254)

