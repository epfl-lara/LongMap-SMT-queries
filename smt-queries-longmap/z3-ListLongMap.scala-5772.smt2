; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74702 () Bool)

(assert start!74702)

(declare-fun b_free!15223 () Bool)

(declare-fun b_next!15223 () Bool)

(assert (=> start!74702 (= b_free!15223 (not b_next!15223))))

(declare-fun tp!53351 () Bool)

(declare-fun b_and!25109 () Bool)

(assert (=> start!74702 (= tp!53351 b_and!25109)))

(declare-fun b!878918 () Bool)

(declare-fun res!596824 () Bool)

(declare-fun e!489291 () Bool)

(assert (=> b!878918 (=> (not res!596824) (not e!489291))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!51103 0))(
  ( (array!51104 (arr!24573 (Array (_ BitVec 32) (_ BitVec 64))) (size!25014 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51103)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!878918 (= res!596824 (and (= (select (arr!24573 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878919 () Bool)

(declare-fun e!489288 () Bool)

(declare-fun tp_is_empty!17467 () Bool)

(assert (=> b!878919 (= e!489288 tp_is_empty!17467)))

(declare-fun res!596817 () Bool)

(assert (=> start!74702 (=> (not res!596817) (not e!489291))))

(assert (=> start!74702 (= res!596817 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25014 _keys!868))))))

(assert (=> start!74702 e!489291))

(assert (=> start!74702 tp_is_empty!17467))

(assert (=> start!74702 true))

(assert (=> start!74702 tp!53351))

(declare-fun array_inv!19414 (array!51103) Bool)

(assert (=> start!74702 (array_inv!19414 _keys!868)))

(declare-datatypes ((V!28337 0))(
  ( (V!28338 (val!8781 Int)) )
))
(declare-datatypes ((ValueCell!8294 0))(
  ( (ValueCellFull!8294 (v!11221 V!28337)) (EmptyCell!8294) )
))
(declare-datatypes ((array!51105 0))(
  ( (array!51106 (arr!24574 (Array (_ BitVec 32) ValueCell!8294)) (size!25015 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51105)

(declare-fun e!489289 () Bool)

(declare-fun array_inv!19415 (array!51105) Bool)

(assert (=> start!74702 (and (array_inv!19415 _values!688) e!489289)))

(declare-fun b!878920 () Bool)

(declare-fun res!596820 () Bool)

(assert (=> b!878920 (=> (not res!596820) (not e!489291))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878920 (= res!596820 (validKeyInArray!0 k0!854))))

(declare-fun b!878921 () Bool)

(declare-fun res!596822 () Bool)

(assert (=> b!878921 (=> (not res!596822) (not e!489291))))

(assert (=> b!878921 (= res!596822 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25014 _keys!868))))))

(declare-fun b!878922 () Bool)

(declare-fun e!489290 () Bool)

(declare-fun mapRes!27816 () Bool)

(assert (=> b!878922 (= e!489289 (and e!489290 mapRes!27816))))

(declare-fun condMapEmpty!27816 () Bool)

(declare-fun mapDefault!27816 () ValueCell!8294)

(assert (=> b!878922 (= condMapEmpty!27816 (= (arr!24574 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8294)) mapDefault!27816)))))

(declare-fun mapIsEmpty!27816 () Bool)

(assert (=> mapIsEmpty!27816 mapRes!27816))

(declare-fun b!878923 () Bool)

(assert (=> b!878923 (= e!489291 false)))

(declare-fun v!557 () V!28337)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28337)

(declare-fun zeroValue!654 () V!28337)

(declare-datatypes ((tuple2!11548 0))(
  ( (tuple2!11549 (_1!5785 (_ BitVec 64)) (_2!5785 V!28337)) )
))
(declare-datatypes ((List!17382 0))(
  ( (Nil!17379) (Cons!17378 (h!18515 tuple2!11548) (t!24463 List!17382)) )
))
(declare-datatypes ((ListLongMap!10319 0))(
  ( (ListLongMap!10320 (toList!5175 List!17382)) )
))
(declare-fun lt!397540 () ListLongMap!10319)

(declare-fun getCurrentListMapNoExtraKeys!3217 (array!51103 array!51105 (_ BitVec 32) (_ BitVec 32) V!28337 V!28337 (_ BitVec 32) Int) ListLongMap!10319)

(assert (=> b!878923 (= lt!397540 (getCurrentListMapNoExtraKeys!3217 _keys!868 (array!51106 (store (arr!24574 _values!688) i!612 (ValueCellFull!8294 v!557)) (size!25015 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397539 () ListLongMap!10319)

(assert (=> b!878923 (= lt!397539 (getCurrentListMapNoExtraKeys!3217 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878924 () Bool)

(declare-fun res!596818 () Bool)

(assert (=> b!878924 (=> (not res!596818) (not e!489291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51103 (_ BitVec 32)) Bool)

(assert (=> b!878924 (= res!596818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27816 () Bool)

(declare-fun tp!53352 () Bool)

(assert (=> mapNonEmpty!27816 (= mapRes!27816 (and tp!53352 e!489288))))

(declare-fun mapRest!27816 () (Array (_ BitVec 32) ValueCell!8294))

(declare-fun mapValue!27816 () ValueCell!8294)

(declare-fun mapKey!27816 () (_ BitVec 32))

(assert (=> mapNonEmpty!27816 (= (arr!24574 _values!688) (store mapRest!27816 mapKey!27816 mapValue!27816))))

(declare-fun b!878925 () Bool)

(declare-fun res!596819 () Bool)

(assert (=> b!878925 (=> (not res!596819) (not e!489291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878925 (= res!596819 (validMask!0 mask!1196))))

(declare-fun b!878926 () Bool)

(assert (=> b!878926 (= e!489290 tp_is_empty!17467)))

(declare-fun b!878927 () Bool)

(declare-fun res!596821 () Bool)

(assert (=> b!878927 (=> (not res!596821) (not e!489291))))

(declare-datatypes ((List!17383 0))(
  ( (Nil!17380) (Cons!17379 (h!18516 (_ BitVec 64)) (t!24464 List!17383)) )
))
(declare-fun arrayNoDuplicates!0 (array!51103 (_ BitVec 32) List!17383) Bool)

(assert (=> b!878927 (= res!596821 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17380))))

(declare-fun b!878928 () Bool)

(declare-fun res!596823 () Bool)

(assert (=> b!878928 (=> (not res!596823) (not e!489291))))

(assert (=> b!878928 (= res!596823 (and (= (size!25015 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25014 _keys!868) (size!25015 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74702 res!596817) b!878925))

(assert (= (and b!878925 res!596819) b!878928))

(assert (= (and b!878928 res!596823) b!878924))

(assert (= (and b!878924 res!596818) b!878927))

(assert (= (and b!878927 res!596821) b!878921))

(assert (= (and b!878921 res!596822) b!878920))

(assert (= (and b!878920 res!596820) b!878918))

(assert (= (and b!878918 res!596824) b!878923))

(assert (= (and b!878922 condMapEmpty!27816) mapIsEmpty!27816))

(assert (= (and b!878922 (not condMapEmpty!27816)) mapNonEmpty!27816))

(get-info :version)

(assert (= (and mapNonEmpty!27816 ((_ is ValueCellFull!8294) mapValue!27816)) b!878919))

(assert (= (and b!878922 ((_ is ValueCellFull!8294) mapDefault!27816)) b!878926))

(assert (= start!74702 b!878922))

(declare-fun m!819321 () Bool)

(assert (=> mapNonEmpty!27816 m!819321))

(declare-fun m!819323 () Bool)

(assert (=> b!878923 m!819323))

(declare-fun m!819325 () Bool)

(assert (=> b!878923 m!819325))

(declare-fun m!819327 () Bool)

(assert (=> b!878923 m!819327))

(declare-fun m!819329 () Bool)

(assert (=> b!878918 m!819329))

(declare-fun m!819331 () Bool)

(assert (=> b!878924 m!819331))

(declare-fun m!819333 () Bool)

(assert (=> start!74702 m!819333))

(declare-fun m!819335 () Bool)

(assert (=> start!74702 m!819335))

(declare-fun m!819337 () Bool)

(assert (=> b!878925 m!819337))

(declare-fun m!819339 () Bool)

(assert (=> b!878920 m!819339))

(declare-fun m!819341 () Bool)

(assert (=> b!878927 m!819341))

(check-sat (not b!878925) (not b_next!15223) (not b!878923) (not mapNonEmpty!27816) (not b!878924) (not start!74702) (not b!878927) (not b!878920) tp_is_empty!17467 b_and!25109)
(check-sat b_and!25109 (not b_next!15223))
