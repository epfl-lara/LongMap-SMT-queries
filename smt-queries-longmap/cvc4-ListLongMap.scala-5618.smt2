; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73496 () Bool)

(assert start!73496)

(declare-fun b_free!14411 () Bool)

(declare-fun b_next!14411 () Bool)

(assert (=> start!73496 (= b_free!14411 (not b_next!14411))))

(declare-fun tp!50736 () Bool)

(declare-fun b_and!23801 () Bool)

(assert (=> start!73496 (= tp!50736 b_and!23801)))

(declare-fun b!858626 () Bool)

(declare-fun e!478510 () Bool)

(declare-fun e!478514 () Bool)

(assert (=> b!858626 (= e!478510 e!478514)))

(declare-fun res!583335 () Bool)

(assert (=> b!858626 (=> (not res!583335) (not e!478514))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!858626 (= res!583335 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49278 0))(
  ( (array!49279 (arr!23670 (Array (_ BitVec 32) (_ BitVec 64))) (size!24110 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49278)

(declare-datatypes ((V!27109 0))(
  ( (V!27110 (val!8321 Int)) )
))
(declare-datatypes ((ValueCell!7834 0))(
  ( (ValueCellFull!7834 (v!10746 V!27109)) (EmptyCell!7834) )
))
(declare-datatypes ((array!49280 0))(
  ( (array!49281 (arr!23671 (Array (_ BitVec 32) ValueCell!7834)) (size!24111 (_ BitVec 32))) )
))
(declare-fun lt!386822 () array!49280)

(declare-datatypes ((tuple2!10984 0))(
  ( (tuple2!10985 (_1!5503 (_ BitVec 64)) (_2!5503 V!27109)) )
))
(declare-datatypes ((List!16792 0))(
  ( (Nil!16789) (Cons!16788 (h!17919 tuple2!10984) (t!23469 List!16792)) )
))
(declare-datatypes ((ListLongMap!9753 0))(
  ( (ListLongMap!9754 (toList!4892 List!16792)) )
))
(declare-fun lt!386817 () ListLongMap!9753)

(declare-fun minValue!654 () V!27109)

(declare-fun zeroValue!654 () V!27109)

(declare-fun getCurrentListMapNoExtraKeys!2872 (array!49278 array!49280 (_ BitVec 32) (_ BitVec 32) V!27109 V!27109 (_ BitVec 32) Int) ListLongMap!9753)

(assert (=> b!858626 (= lt!386817 (getCurrentListMapNoExtraKeys!2872 _keys!868 lt!386822 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun _values!688 () array!49280)

(declare-fun v!557 () V!27109)

(assert (=> b!858626 (= lt!386822 (array!49281 (store (arr!23671 _values!688) i!612 (ValueCellFull!7834 v!557)) (size!24111 _values!688)))))

(declare-fun lt!386818 () ListLongMap!9753)

(assert (=> b!858626 (= lt!386818 (getCurrentListMapNoExtraKeys!2872 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!858627 () Bool)

(declare-fun e!478512 () Bool)

(declare-fun tp_is_empty!16547 () Bool)

(assert (=> b!858627 (= e!478512 tp_is_empty!16547)))

(declare-fun b!858628 () Bool)

(declare-fun e!478511 () Bool)

(declare-fun e!478515 () Bool)

(assert (=> b!858628 (= e!478511 e!478515)))

(declare-fun res!583329 () Bool)

(assert (=> b!858628 (=> res!583329 e!478515)))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!858628 (= res!583329 (not (= (select (arr!23670 _keys!868) from!1053) k!854)))))

(declare-fun lt!386821 () ListLongMap!9753)

(declare-fun +!2245 (ListLongMap!9753 tuple2!10984) ListLongMap!9753)

(declare-fun get!12465 (ValueCell!7834 V!27109) V!27109)

(declare-fun dynLambda!1085 (Int (_ BitVec 64)) V!27109)

(assert (=> b!858628 (= lt!386817 (+!2245 lt!386821 (tuple2!10985 (select (arr!23670 _keys!868) from!1053) (get!12465 (select (arr!23671 _values!688) from!1053) (dynLambda!1085 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!858629 () Bool)

(declare-fun res!583332 () Bool)

(assert (=> b!858629 (=> (not res!583332) (not e!478510))))

(assert (=> b!858629 (= res!583332 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24110 _keys!868))))))

(declare-fun mapNonEmpty!26420 () Bool)

(declare-fun mapRes!26420 () Bool)

(declare-fun tp!50737 () Bool)

(assert (=> mapNonEmpty!26420 (= mapRes!26420 (and tp!50737 e!478512))))

(declare-fun mapValue!26420 () ValueCell!7834)

(declare-fun mapRest!26420 () (Array (_ BitVec 32) ValueCell!7834))

(declare-fun mapKey!26420 () (_ BitVec 32))

(assert (=> mapNonEmpty!26420 (= (arr!23671 _values!688) (store mapRest!26420 mapKey!26420 mapValue!26420))))

(declare-fun b!858630 () Bool)

(declare-fun res!583330 () Bool)

(assert (=> b!858630 (=> (not res!583330) (not e!478510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49278 (_ BitVec 32)) Bool)

(assert (=> b!858630 (= res!583330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!858631 () Bool)

(declare-fun res!583336 () Bool)

(assert (=> b!858631 (=> (not res!583336) (not e!478510))))

(declare-datatypes ((List!16793 0))(
  ( (Nil!16790) (Cons!16789 (h!17920 (_ BitVec 64)) (t!23470 List!16793)) )
))
(declare-fun arrayNoDuplicates!0 (array!49278 (_ BitVec 32) List!16793) Bool)

(assert (=> b!858631 (= res!583336 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16790))))

(declare-fun b!858633 () Bool)

(declare-fun e!478516 () Bool)

(assert (=> b!858633 (= e!478516 tp_is_empty!16547)))

(declare-fun b!858634 () Bool)

(declare-fun res!583327 () Bool)

(assert (=> b!858634 (=> (not res!583327) (not e!478510))))

(assert (=> b!858634 (= res!583327 (and (= (select (arr!23670 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!858635 () Bool)

(declare-fun res!583328 () Bool)

(assert (=> b!858635 (=> (not res!583328) (not e!478510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!858635 (= res!583328 (validKeyInArray!0 k!854))))

(declare-fun b!858636 () Bool)

(declare-fun e!478509 () Bool)

(assert (=> b!858636 (= e!478509 (and e!478516 mapRes!26420))))

(declare-fun condMapEmpty!26420 () Bool)

(declare-fun mapDefault!26420 () ValueCell!7834)

