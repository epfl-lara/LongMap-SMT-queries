; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74556 () Bool)

(assert start!74556)

(declare-fun b_free!15245 () Bool)

(declare-fun b_next!15245 () Bool)

(assert (=> start!74556 (= b_free!15245 (not b_next!15245))))

(declare-fun tp!53417 () Bool)

(declare-fun b_and!25121 () Bool)

(assert (=> start!74556 (= tp!53417 b_and!25121)))

(declare-fun b!878378 () Bool)

(declare-fun e!488872 () Bool)

(declare-fun tp_is_empty!17489 () Bool)

(assert (=> b!878378 (= e!488872 tp_is_empty!17489)))

(declare-fun b!878379 () Bool)

(declare-fun res!596738 () Bool)

(declare-fun e!488875 () Bool)

(assert (=> b!878379 (=> (not res!596738) (not e!488875))))

(declare-datatypes ((array!51104 0))(
  ( (array!51105 (arr!24578 (Array (_ BitVec 32) (_ BitVec 64))) (size!25018 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51104)

(declare-datatypes ((List!17443 0))(
  ( (Nil!17440) (Cons!17439 (h!18570 (_ BitVec 64)) (t!24532 List!17443)) )
))
(declare-fun arrayNoDuplicates!0 (array!51104 (_ BitVec 32) List!17443) Bool)

(assert (=> b!878379 (= res!596738 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17440))))

(declare-fun mapIsEmpty!27849 () Bool)

(declare-fun mapRes!27849 () Bool)

(assert (=> mapIsEmpty!27849 mapRes!27849))

(declare-fun b!878380 () Bool)

(declare-fun res!596743 () Bool)

(assert (=> b!878380 (=> (not res!596743) (not e!488875))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!878380 (= res!596743 (and (= (select (arr!24578 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!27849 () Bool)

(declare-fun tp!53416 () Bool)

(declare-fun e!488873 () Bool)

(assert (=> mapNonEmpty!27849 (= mapRes!27849 (and tp!53416 e!488873))))

(declare-datatypes ((V!28365 0))(
  ( (V!28366 (val!8792 Int)) )
))
(declare-datatypes ((ValueCell!8305 0))(
  ( (ValueCellFull!8305 (v!11232 V!28365)) (EmptyCell!8305) )
))
(declare-fun mapRest!27849 () (Array (_ BitVec 32) ValueCell!8305))

(declare-fun mapKey!27849 () (_ BitVec 32))

(declare-fun mapValue!27849 () ValueCell!8305)

(declare-datatypes ((array!51106 0))(
  ( (array!51107 (arr!24579 (Array (_ BitVec 32) ValueCell!8305)) (size!25019 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51106)

(assert (=> mapNonEmpty!27849 (= (arr!24579 _values!688) (store mapRest!27849 mapKey!27849 mapValue!27849))))

(declare-fun b!878381 () Bool)

(declare-fun res!596742 () Bool)

(assert (=> b!878381 (=> (not res!596742) (not e!488875))))

(assert (=> b!878381 (= res!596742 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25018 _keys!868))))))

(declare-fun b!878382 () Bool)

(declare-fun res!596739 () Bool)

(assert (=> b!878382 (=> (not res!596739) (not e!488875))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878382 (= res!596739 (validMask!0 mask!1196))))

(declare-fun b!878383 () Bool)

(declare-fun res!596737 () Bool)

(assert (=> b!878383 (=> (not res!596737) (not e!488875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878383 (= res!596737 (validKeyInArray!0 k!854))))

(declare-fun b!878384 () Bool)

(declare-fun res!596740 () Bool)

(assert (=> b!878384 (=> (not res!596740) (not e!488875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51104 (_ BitVec 32)) Bool)

(assert (=> b!878384 (= res!596740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878385 () Bool)

(assert (=> b!878385 (= e!488873 tp_is_empty!17489)))

(declare-fun b!878386 () Bool)

(declare-fun res!596741 () Bool)

(assert (=> b!878386 (=> (not res!596741) (not e!488875))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!878386 (= res!596741 (and (= (size!25019 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25018 _keys!868) (size!25019 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878387 () Bool)

(assert (=> b!878387 (= e!488875 false)))

(declare-fun v!557 () V!28365)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11628 0))(
  ( (tuple2!11629 (_1!5825 (_ BitVec 64)) (_2!5825 V!28365)) )
))
(declare-datatypes ((List!17444 0))(
  ( (Nil!17441) (Cons!17440 (h!18571 tuple2!11628) (t!24533 List!17444)) )
))
(declare-datatypes ((ListLongMap!10397 0))(
  ( (ListLongMap!10398 (toList!5214 List!17444)) )
))
(declare-fun lt!397245 () ListLongMap!10397)

(declare-fun minValue!654 () V!28365)

(declare-fun zeroValue!654 () V!28365)

(declare-fun getCurrentListMapNoExtraKeys!3181 (array!51104 array!51106 (_ BitVec 32) (_ BitVec 32) V!28365 V!28365 (_ BitVec 32) Int) ListLongMap!10397)

(assert (=> b!878387 (= lt!397245 (getCurrentListMapNoExtraKeys!3181 _keys!868 (array!51107 (store (arr!24579 _values!688) i!612 (ValueCellFull!8305 v!557)) (size!25019 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397244 () ListLongMap!10397)

(assert (=> b!878387 (= lt!397244 (getCurrentListMapNoExtraKeys!3181 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878388 () Bool)

(declare-fun e!488874 () Bool)

(assert (=> b!878388 (= e!488874 (and e!488872 mapRes!27849))))

(declare-fun condMapEmpty!27849 () Bool)

(declare-fun mapDefault!27849 () ValueCell!8305)

