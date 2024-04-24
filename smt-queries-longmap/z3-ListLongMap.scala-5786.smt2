; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74826 () Bool)

(assert start!74826)

(declare-fun b_free!15307 () Bool)

(declare-fun b_next!15307 () Bool)

(assert (=> start!74826 (= b_free!15307 (not b_next!15307))))

(declare-fun tp!53610 () Bool)

(declare-fun b_and!25243 () Bool)

(assert (=> start!74826 (= tp!53610 b_and!25243)))

(declare-fun b!880703 () Bool)

(declare-fun res!598047 () Bool)

(declare-fun e!490205 () Bool)

(assert (=> b!880703 (=> (not res!598047) (not e!490205))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51265 0))(
  ( (array!51266 (arr!24652 (Array (_ BitVec 32) (_ BitVec 64))) (size!25093 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51265)

(assert (=> b!880703 (= res!598047 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25093 _keys!868))))))

(declare-fun b!880704 () Bool)

(declare-fun e!490207 () Bool)

(assert (=> b!880704 (= e!490207 true)))

(declare-datatypes ((V!28449 0))(
  ( (V!28450 (val!8823 Int)) )
))
(declare-datatypes ((tuple2!11610 0))(
  ( (tuple2!11611 (_1!5816 (_ BitVec 64)) (_2!5816 V!28449)) )
))
(declare-datatypes ((List!17441 0))(
  ( (Nil!17438) (Cons!17437 (h!18574 tuple2!11610) (t!24542 List!17441)) )
))
(declare-datatypes ((ListLongMap!10381 0))(
  ( (ListLongMap!10382 (toList!5206 List!17441)) )
))
(declare-fun lt!398151 () ListLongMap!10381)

(declare-datatypes ((ValueCell!8336 0))(
  ( (ValueCellFull!8336 (v!11271 V!28449)) (EmptyCell!8336) )
))
(declare-datatypes ((array!51267 0))(
  ( (array!51268 (arr!24653 (Array (_ BitVec 32) ValueCell!8336)) (size!25094 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51267)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!398148 () ListLongMap!10381)

(declare-fun defaultEntry!696 () Int)

(declare-fun +!2523 (ListLongMap!10381 tuple2!11610) ListLongMap!10381)

(declare-fun get!12979 (ValueCell!8336 V!28449) V!28449)

(declare-fun dynLambda!1248 (Int (_ BitVec 64)) V!28449)

(assert (=> b!880704 (= lt!398148 (+!2523 lt!398151 (tuple2!11611 (select (arr!24652 _keys!868) from!1053) (get!12979 (select (arr!24653 _values!688) from!1053) (dynLambda!1248 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!880705 () Bool)

(declare-fun e!490209 () Bool)

(declare-fun e!490206 () Bool)

(declare-fun mapRes!27948 () Bool)

(assert (=> b!880705 (= e!490209 (and e!490206 mapRes!27948))))

(declare-fun condMapEmpty!27948 () Bool)

(declare-fun mapDefault!27948 () ValueCell!8336)

(assert (=> b!880705 (= condMapEmpty!27948 (= (arr!24653 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8336)) mapDefault!27948)))))

(declare-fun b!880706 () Bool)

(declare-fun res!598051 () Bool)

(assert (=> b!880706 (=> (not res!598051) (not e!490205))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880706 (= res!598051 (validMask!0 mask!1196))))

(declare-fun b!880707 () Bool)

(declare-fun res!598046 () Bool)

(assert (=> b!880707 (=> (not res!598046) (not e!490205))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!880707 (= res!598046 (and (= (select (arr!24652 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!880708 () Bool)

(declare-fun res!598049 () Bool)

(assert (=> b!880708 (=> (not res!598049) (not e!490205))))

(declare-datatypes ((List!17442 0))(
  ( (Nil!17439) (Cons!17438 (h!18575 (_ BitVec 64)) (t!24543 List!17442)) )
))
(declare-fun arrayNoDuplicates!0 (array!51265 (_ BitVec 32) List!17442) Bool)

(assert (=> b!880708 (= res!598049 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17439))))

(declare-fun mapIsEmpty!27948 () Bool)

(assert (=> mapIsEmpty!27948 mapRes!27948))

(declare-fun b!880709 () Bool)

(declare-fun res!598053 () Bool)

(assert (=> b!880709 (=> (not res!598053) (not e!490205))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!880709 (= res!598053 (and (= (size!25094 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25093 _keys!868) (size!25094 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!880710 () Bool)

(declare-fun res!598050 () Bool)

(assert (=> b!880710 (=> (not res!598050) (not e!490205))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880710 (= res!598050 (validKeyInArray!0 k0!854))))

(declare-fun b!880712 () Bool)

(declare-fun tp_is_empty!17551 () Bool)

(assert (=> b!880712 (= e!490206 tp_is_empty!17551)))

(declare-fun b!880711 () Bool)

(declare-fun e!490204 () Bool)

(assert (=> b!880711 (= e!490204 (not e!490207))))

(declare-fun res!598048 () Bool)

(assert (=> b!880711 (=> res!598048 e!490207)))

(assert (=> b!880711 (= res!598048 (not (validKeyInArray!0 (select (arr!24652 _keys!868) from!1053))))))

(declare-fun lt!398149 () ListLongMap!10381)

(assert (=> b!880711 (= lt!398149 lt!398151)))

(declare-fun v!557 () V!28449)

(declare-fun lt!398154 () ListLongMap!10381)

(assert (=> b!880711 (= lt!398151 (+!2523 lt!398154 (tuple2!11611 k0!854 v!557)))))

(declare-fun lt!398150 () array!51267)

(declare-fun minValue!654 () V!28449)

(declare-fun zeroValue!654 () V!28449)

(declare-fun getCurrentListMapNoExtraKeys!3248 (array!51265 array!51267 (_ BitVec 32) (_ BitVec 32) V!28449 V!28449 (_ BitVec 32) Int) ListLongMap!10381)

(assert (=> b!880711 (= lt!398149 (getCurrentListMapNoExtraKeys!3248 _keys!868 lt!398150 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880711 (= lt!398154 (getCurrentListMapNoExtraKeys!3248 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30016 0))(
  ( (Unit!30017) )
))
(declare-fun lt!398152 () Unit!30016)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!690 (array!51265 array!51267 (_ BitVec 32) (_ BitVec 32) V!28449 V!28449 (_ BitVec 32) (_ BitVec 64) V!28449 (_ BitVec 32) Int) Unit!30016)

(assert (=> b!880711 (= lt!398152 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!690 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!598055 () Bool)

(assert (=> start!74826 (=> (not res!598055) (not e!490205))))

(assert (=> start!74826 (= res!598055 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25093 _keys!868))))))

(assert (=> start!74826 e!490205))

(assert (=> start!74826 tp_is_empty!17551))

(assert (=> start!74826 true))

(assert (=> start!74826 tp!53610))

(declare-fun array_inv!19462 (array!51265) Bool)

(assert (=> start!74826 (array_inv!19462 _keys!868)))

(declare-fun array_inv!19463 (array!51267) Bool)

(assert (=> start!74826 (and (array_inv!19463 _values!688) e!490209)))

(declare-fun mapNonEmpty!27948 () Bool)

(declare-fun tp!53609 () Bool)

(declare-fun e!490203 () Bool)

(assert (=> mapNonEmpty!27948 (= mapRes!27948 (and tp!53609 e!490203))))

(declare-fun mapValue!27948 () ValueCell!8336)

(declare-fun mapRest!27948 () (Array (_ BitVec 32) ValueCell!8336))

(declare-fun mapKey!27948 () (_ BitVec 32))

(assert (=> mapNonEmpty!27948 (= (arr!24653 _values!688) (store mapRest!27948 mapKey!27948 mapValue!27948))))

(declare-fun b!880713 () Bool)

(assert (=> b!880713 (= e!490205 e!490204)))

(declare-fun res!598052 () Bool)

(assert (=> b!880713 (=> (not res!598052) (not e!490204))))

(assert (=> b!880713 (= res!598052 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!880713 (= lt!398148 (getCurrentListMapNoExtraKeys!3248 _keys!868 lt!398150 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!880713 (= lt!398150 (array!51268 (store (arr!24653 _values!688) i!612 (ValueCellFull!8336 v!557)) (size!25094 _values!688)))))

(declare-fun lt!398153 () ListLongMap!10381)

(assert (=> b!880713 (= lt!398153 (getCurrentListMapNoExtraKeys!3248 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880714 () Bool)

(assert (=> b!880714 (= e!490203 tp_is_empty!17551)))

(declare-fun b!880715 () Bool)

(declare-fun res!598054 () Bool)

(assert (=> b!880715 (=> (not res!598054) (not e!490205))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51265 (_ BitVec 32)) Bool)

(assert (=> b!880715 (= res!598054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74826 res!598055) b!880706))

(assert (= (and b!880706 res!598051) b!880709))

(assert (= (and b!880709 res!598053) b!880715))

(assert (= (and b!880715 res!598054) b!880708))

(assert (= (and b!880708 res!598049) b!880703))

(assert (= (and b!880703 res!598047) b!880710))

(assert (= (and b!880710 res!598050) b!880707))

(assert (= (and b!880707 res!598046) b!880713))

(assert (= (and b!880713 res!598052) b!880711))

(assert (= (and b!880711 (not res!598048)) b!880704))

(assert (= (and b!880705 condMapEmpty!27948) mapIsEmpty!27948))

(assert (= (and b!880705 (not condMapEmpty!27948)) mapNonEmpty!27948))

(get-info :version)

(assert (= (and mapNonEmpty!27948 ((_ is ValueCellFull!8336) mapValue!27948)) b!880714))

(assert (= (and b!880705 ((_ is ValueCellFull!8336) mapDefault!27948)) b!880712))

(assert (= start!74826 b!880705))

(declare-fun b_lambda!12429 () Bool)

(assert (=> (not b_lambda!12429) (not b!880704)))

(declare-fun t!24541 () Bool)

(declare-fun tb!4957 () Bool)

(assert (=> (and start!74826 (= defaultEntry!696 defaultEntry!696) t!24541) tb!4957))

(declare-fun result!9547 () Bool)

(assert (=> tb!4957 (= result!9547 tp_is_empty!17551)))

(assert (=> b!880704 t!24541))

(declare-fun b_and!25245 () Bool)

(assert (= b_and!25243 (and (=> t!24541 result!9547) b_and!25245)))

(declare-fun m!820853 () Bool)

(assert (=> b!880713 m!820853))

(declare-fun m!820855 () Bool)

(assert (=> b!880713 m!820855))

(declare-fun m!820857 () Bool)

(assert (=> b!880713 m!820857))

(declare-fun m!820859 () Bool)

(assert (=> mapNonEmpty!27948 m!820859))

(declare-fun m!820861 () Bool)

(assert (=> b!880710 m!820861))

(declare-fun m!820863 () Bool)

(assert (=> start!74826 m!820863))

(declare-fun m!820865 () Bool)

(assert (=> start!74826 m!820865))

(declare-fun m!820867 () Bool)

(assert (=> b!880707 m!820867))

(declare-fun m!820869 () Bool)

(assert (=> b!880708 m!820869))

(declare-fun m!820871 () Bool)

(assert (=> b!880711 m!820871))

(declare-fun m!820873 () Bool)

(assert (=> b!880711 m!820873))

(assert (=> b!880711 m!820871))

(declare-fun m!820875 () Bool)

(assert (=> b!880711 m!820875))

(declare-fun m!820877 () Bool)

(assert (=> b!880711 m!820877))

(declare-fun m!820879 () Bool)

(assert (=> b!880711 m!820879))

(declare-fun m!820881 () Bool)

(assert (=> b!880711 m!820881))

(declare-fun m!820883 () Bool)

(assert (=> b!880704 m!820883))

(declare-fun m!820885 () Bool)

(assert (=> b!880704 m!820885))

(declare-fun m!820887 () Bool)

(assert (=> b!880704 m!820887))

(assert (=> b!880704 m!820883))

(declare-fun m!820889 () Bool)

(assert (=> b!880704 m!820889))

(assert (=> b!880704 m!820871))

(assert (=> b!880704 m!820885))

(declare-fun m!820891 () Bool)

(assert (=> b!880706 m!820891))

(declare-fun m!820893 () Bool)

(assert (=> b!880715 m!820893))

(check-sat (not start!74826) (not b_next!15307) tp_is_empty!17551 (not b!880706) (not b!880704) (not mapNonEmpty!27948) (not b!880710) (not b!880713) (not b!880711) (not b!880708) b_and!25245 (not b_lambda!12429) (not b!880715))
(check-sat b_and!25245 (not b_next!15307))
