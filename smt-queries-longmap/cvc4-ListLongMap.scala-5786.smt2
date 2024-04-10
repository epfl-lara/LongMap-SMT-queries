; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74662 () Bool)

(assert start!74662)

(declare-fun b_free!15311 () Bool)

(declare-fun b_next!15311 () Bool)

(assert (=> start!74662 (= b_free!15311 (not b_next!15311))))

(declare-fun tp!53620 () Bool)

(declare-fun b_and!25241 () Bool)

(assert (=> start!74662 (= tp!53620 b_and!25241)))

(declare-fun b!879882 () Bool)

(declare-fun res!597766 () Bool)

(declare-fun e!489668 () Bool)

(assert (=> b!879882 (=> (not res!597766) (not e!489668))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879882 (= res!597766 (validKeyInArray!0 k!854))))

(declare-fun b!879883 () Bool)

(declare-fun e!489666 () Bool)

(declare-fun e!489664 () Bool)

(assert (=> b!879883 (= e!489666 (not e!489664))))

(declare-fun res!597763 () Bool)

(assert (=> b!879883 (=> res!597763 e!489664)))

(declare-datatypes ((array!51240 0))(
  ( (array!51241 (arr!24644 (Array (_ BitVec 32) (_ BitVec 64))) (size!25084 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51240)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!879883 (= res!597763 (not (validKeyInArray!0 (select (arr!24644 _keys!868) from!1053))))))

(declare-datatypes ((V!28453 0))(
  ( (V!28454 (val!8825 Int)) )
))
(declare-datatypes ((tuple2!11674 0))(
  ( (tuple2!11675 (_1!5848 (_ BitVec 64)) (_2!5848 V!28453)) )
))
(declare-datatypes ((List!17490 0))(
  ( (Nil!17487) (Cons!17486 (h!18617 tuple2!11674) (t!24603 List!17490)) )
))
(declare-datatypes ((ListLongMap!10443 0))(
  ( (ListLongMap!10444 (toList!5237 List!17490)) )
))
(declare-fun lt!397831 () ListLongMap!10443)

(declare-fun lt!397835 () ListLongMap!10443)

(assert (=> b!879883 (= lt!397831 lt!397835)))

(declare-fun v!557 () V!28453)

(declare-fun lt!397832 () ListLongMap!10443)

(declare-fun +!2510 (ListLongMap!10443 tuple2!11674) ListLongMap!10443)

(assert (=> b!879883 (= lt!397835 (+!2510 lt!397832 (tuple2!11675 k!854 v!557)))))

(declare-datatypes ((ValueCell!8338 0))(
  ( (ValueCellFull!8338 (v!11273 V!28453)) (EmptyCell!8338) )
))
(declare-datatypes ((array!51242 0))(
  ( (array!51243 (arr!24645 (Array (_ BitVec 32) ValueCell!8338)) (size!25085 (_ BitVec 32))) )
))
(declare-fun lt!397830 () array!51242)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28453)

(declare-fun zeroValue!654 () V!28453)

(declare-fun getCurrentListMapNoExtraKeys!3203 (array!51240 array!51242 (_ BitVec 32) (_ BitVec 32) V!28453 V!28453 (_ BitVec 32) Int) ListLongMap!10443)

(assert (=> b!879883 (= lt!397831 (getCurrentListMapNoExtraKeys!3203 _keys!868 lt!397830 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51242)

(assert (=> b!879883 (= lt!397832 (getCurrentListMapNoExtraKeys!3203 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30042 0))(
  ( (Unit!30043) )
))
(declare-fun lt!397833 () Unit!30042)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!703 (array!51240 array!51242 (_ BitVec 32) (_ BitVec 32) V!28453 V!28453 (_ BitVec 32) (_ BitVec 64) V!28453 (_ BitVec 32) Int) Unit!30042)

(assert (=> b!879883 (= lt!397833 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!703 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!879884 () Bool)

(declare-fun res!597770 () Bool)

(assert (=> b!879884 (=> (not res!597770) (not e!489668))))

(assert (=> b!879884 (= res!597770 (and (= (select (arr!24644 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27954 () Bool)

(declare-fun mapRes!27954 () Bool)

(assert (=> mapIsEmpty!27954 mapRes!27954))

(declare-fun b!879885 () Bool)

(declare-fun res!597767 () Bool)

(assert (=> b!879885 (=> (not res!597767) (not e!489668))))

(assert (=> b!879885 (= res!597767 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25084 _keys!868))))))

(declare-fun b!879886 () Bool)

(declare-fun e!489665 () Bool)

(declare-fun tp_is_empty!17555 () Bool)

(assert (=> b!879886 (= e!489665 tp_is_empty!17555)))

(declare-fun b!879887 () Bool)

(declare-fun e!489667 () Bool)

(assert (=> b!879887 (= e!489667 tp_is_empty!17555)))

(declare-fun b!879888 () Bool)

(declare-fun res!597771 () Bool)

(assert (=> b!879888 (=> (not res!597771) (not e!489668))))

(declare-datatypes ((List!17491 0))(
  ( (Nil!17488) (Cons!17487 (h!18618 (_ BitVec 64)) (t!24604 List!17491)) )
))
(declare-fun arrayNoDuplicates!0 (array!51240 (_ BitVec 32) List!17491) Bool)

(assert (=> b!879888 (= res!597771 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17488))))

(declare-fun mapNonEmpty!27954 () Bool)

(declare-fun tp!53621 () Bool)

(assert (=> mapNonEmpty!27954 (= mapRes!27954 (and tp!53621 e!489667))))

(declare-fun mapRest!27954 () (Array (_ BitVec 32) ValueCell!8338))

(declare-fun mapKey!27954 () (_ BitVec 32))

(declare-fun mapValue!27954 () ValueCell!8338)

(assert (=> mapNonEmpty!27954 (= (arr!24645 _values!688) (store mapRest!27954 mapKey!27954 mapValue!27954))))

(declare-fun b!879889 () Bool)

(declare-fun e!489663 () Bool)

(assert (=> b!879889 (= e!489663 (and e!489665 mapRes!27954))))

(declare-fun condMapEmpty!27954 () Bool)

(declare-fun mapDefault!27954 () ValueCell!8338)

