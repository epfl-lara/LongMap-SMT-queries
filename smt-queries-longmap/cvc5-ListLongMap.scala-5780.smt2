; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74582 () Bool)

(assert start!74582)

(declare-fun b_free!15271 () Bool)

(declare-fun b_next!15271 () Bool)

(assert (=> start!74582 (= b_free!15271 (not b_next!15271))))

(declare-fun tp!53495 () Bool)

(declare-fun b_and!25147 () Bool)

(assert (=> start!74582 (= tp!53495 b_and!25147)))

(declare-fun b!878820 () Bool)

(declare-fun res!597063 () Bool)

(declare-fun e!489085 () Bool)

(assert (=> b!878820 (=> (not res!597063) (not e!489085))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878820 (= res!597063 (validMask!0 mask!1196))))

(declare-fun b!878821 () Bool)

(declare-fun res!597067 () Bool)

(assert (=> b!878821 (=> (not res!597067) (not e!489085))))

(declare-datatypes ((array!51156 0))(
  ( (array!51157 (arr!24604 (Array (_ BitVec 32) (_ BitVec 64))) (size!25044 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51156)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51156 (_ BitVec 32)) Bool)

(assert (=> b!878821 (= res!597067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27888 () Bool)

(declare-fun mapRes!27888 () Bool)

(assert (=> mapIsEmpty!27888 mapRes!27888))

(declare-fun b!878822 () Bool)

(declare-fun res!597068 () Bool)

(assert (=> b!878822 (=> (not res!597068) (not e!489085))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878822 (= res!597068 (validKeyInArray!0 k!854))))

(declare-fun b!878823 () Bool)

(declare-fun e!489084 () Bool)

(declare-fun tp_is_empty!17515 () Bool)

(assert (=> b!878823 (= e!489084 tp_is_empty!17515)))

(declare-fun b!878824 () Bool)

(declare-fun res!597071 () Bool)

(assert (=> b!878824 (=> (not res!597071) (not e!489085))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28401 0))(
  ( (V!28402 (val!8805 Int)) )
))
(declare-datatypes ((ValueCell!8318 0))(
  ( (ValueCellFull!8318 (v!11245 V!28401)) (EmptyCell!8318) )
))
(declare-datatypes ((array!51158 0))(
  ( (array!51159 (arr!24605 (Array (_ BitVec 32) ValueCell!8318)) (size!25045 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51158)

(assert (=> b!878824 (= res!597071 (and (= (size!25045 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25044 _keys!868) (size!25045 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878825 () Bool)

(declare-fun e!489080 () Bool)

(declare-fun e!489083 () Bool)

(assert (=> b!878825 (= e!489080 (not e!489083))))

(declare-fun res!597062 () Bool)

(assert (=> b!878825 (=> res!597062 e!489083)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!878825 (= res!597062 (not (validKeyInArray!0 (select (arr!24604 _keys!868) from!1053))))))

(declare-fun v!557 () V!28401)

(declare-fun lt!397345 () array!51158)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28401)

(declare-fun zeroValue!654 () V!28401)

(declare-datatypes ((tuple2!11642 0))(
  ( (tuple2!11643 (_1!5832 (_ BitVec 64)) (_2!5832 V!28401)) )
))
(declare-datatypes ((List!17459 0))(
  ( (Nil!17456) (Cons!17455 (h!18586 tuple2!11642) (t!24548 List!17459)) )
))
(declare-datatypes ((ListLongMap!10411 0))(
  ( (ListLongMap!10412 (toList!5221 List!17459)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3188 (array!51156 array!51158 (_ BitVec 32) (_ BitVec 32) V!28401 V!28401 (_ BitVec 32) Int) ListLongMap!10411)

(declare-fun +!2495 (ListLongMap!10411 tuple2!11642) ListLongMap!10411)

(assert (=> b!878825 (= (getCurrentListMapNoExtraKeys!3188 _keys!868 lt!397345 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2495 (getCurrentListMapNoExtraKeys!3188 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11643 k!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!30016 0))(
  ( (Unit!30017) )
))
(declare-fun lt!397344 () Unit!30016)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!690 (array!51156 array!51158 (_ BitVec 32) (_ BitVec 32) V!28401 V!28401 (_ BitVec 32) (_ BitVec 64) V!28401 (_ BitVec 32) Int) Unit!30016)

(assert (=> b!878825 (= lt!397344 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!690 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!878826 () Bool)

(assert (=> b!878826 (= e!489085 e!489080)))

(declare-fun res!597064 () Bool)

(assert (=> b!878826 (=> (not res!597064) (not e!489080))))

(assert (=> b!878826 (= res!597064 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!397347 () ListLongMap!10411)

(assert (=> b!878826 (= lt!397347 (getCurrentListMapNoExtraKeys!3188 _keys!868 lt!397345 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!878826 (= lt!397345 (array!51159 (store (arr!24605 _values!688) i!612 (ValueCellFull!8318 v!557)) (size!25045 _values!688)))))

(declare-fun lt!397346 () ListLongMap!10411)

(assert (=> b!878826 (= lt!397346 (getCurrentListMapNoExtraKeys!3188 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!597066 () Bool)

(assert (=> start!74582 (=> (not res!597066) (not e!489085))))

(assert (=> start!74582 (= res!597066 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25044 _keys!868))))))

(assert (=> start!74582 e!489085))

(assert (=> start!74582 tp_is_empty!17515))

(assert (=> start!74582 true))

(assert (=> start!74582 tp!53495))

(declare-fun array_inv!19388 (array!51156) Bool)

(assert (=> start!74582 (array_inv!19388 _keys!868)))

(declare-fun e!489082 () Bool)

(declare-fun array_inv!19389 (array!51158) Bool)

(assert (=> start!74582 (and (array_inv!19389 _values!688) e!489082)))

(declare-fun b!878827 () Bool)

(declare-fun e!489079 () Bool)

(assert (=> b!878827 (= e!489079 tp_is_empty!17515)))

(declare-fun b!878828 () Bool)

(declare-fun res!597069 () Bool)

(assert (=> b!878828 (=> (not res!597069) (not e!489085))))

(declare-datatypes ((List!17460 0))(
  ( (Nil!17457) (Cons!17456 (h!18587 (_ BitVec 64)) (t!24549 List!17460)) )
))
(declare-fun arrayNoDuplicates!0 (array!51156 (_ BitVec 32) List!17460) Bool)

(assert (=> b!878828 (= res!597069 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17457))))

(declare-fun b!878829 () Bool)

(assert (=> b!878829 (= e!489083 (bvslt i!612 (size!25045 _values!688)))))

(declare-fun b!878830 () Bool)

(assert (=> b!878830 (= e!489082 (and e!489084 mapRes!27888))))

(declare-fun condMapEmpty!27888 () Bool)

(declare-fun mapDefault!27888 () ValueCell!8318)

