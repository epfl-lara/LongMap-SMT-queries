; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74534 () Bool)

(assert start!74534)

(declare-fun b_free!15241 () Bool)

(declare-fun b_next!15241 () Bool)

(assert (=> start!74534 (= b_free!15241 (not b_next!15241))))

(declare-fun tp!53406 () Bool)

(declare-fun b_and!25091 () Bool)

(assert (=> start!74534 (= tp!53406 b_and!25091)))

(declare-fun b!878073 () Bool)

(declare-fun res!596584 () Bool)

(declare-fun e!488697 () Bool)

(assert (=> b!878073 (=> (not res!596584) (not e!488697))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51077 0))(
  ( (array!51078 (arr!24565 (Array (_ BitVec 32) (_ BitVec 64))) (size!25007 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51077)

(declare-datatypes ((V!28361 0))(
  ( (V!28362 (val!8790 Int)) )
))
(declare-datatypes ((ValueCell!8303 0))(
  ( (ValueCellFull!8303 (v!11224 V!28361)) (EmptyCell!8303) )
))
(declare-datatypes ((array!51079 0))(
  ( (array!51080 (arr!24566 (Array (_ BitVec 32) ValueCell!8303)) (size!25008 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51079)

(assert (=> b!878073 (= res!596584 (and (= (size!25008 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25007 _keys!868) (size!25008 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878074 () Bool)

(declare-fun res!596583 () Bool)

(assert (=> b!878074 (=> (not res!596583) (not e!488697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51077 (_ BitVec 32)) Bool)

(assert (=> b!878074 (= res!596583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27843 () Bool)

(declare-fun mapRes!27843 () Bool)

(assert (=> mapIsEmpty!27843 mapRes!27843))

(declare-fun b!878075 () Bool)

(declare-fun res!596580 () Bool)

(assert (=> b!878075 (=> (not res!596580) (not e!488697))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878075 (= res!596580 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27843 () Bool)

(declare-fun tp!53405 () Bool)

(declare-fun e!488694 () Bool)

(assert (=> mapNonEmpty!27843 (= mapRes!27843 (and tp!53405 e!488694))))

(declare-fun mapRest!27843 () (Array (_ BitVec 32) ValueCell!8303))

(declare-fun mapValue!27843 () ValueCell!8303)

(declare-fun mapKey!27843 () (_ BitVec 32))

(assert (=> mapNonEmpty!27843 (= (arr!24566 _values!688) (store mapRest!27843 mapKey!27843 mapValue!27843))))

(declare-fun res!596579 () Bool)

(assert (=> start!74534 (=> (not res!596579) (not e!488697))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74534 (= res!596579 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25007 _keys!868))))))

(assert (=> start!74534 e!488697))

(declare-fun tp_is_empty!17485 () Bool)

(assert (=> start!74534 tp_is_empty!17485))

(assert (=> start!74534 true))

(assert (=> start!74534 tp!53406))

(declare-fun array_inv!19404 (array!51077) Bool)

(assert (=> start!74534 (array_inv!19404 _keys!868)))

(declare-fun e!488696 () Bool)

(declare-fun array_inv!19405 (array!51079) Bool)

(assert (=> start!74534 (and (array_inv!19405 _values!688) e!488696)))

(declare-fun b!878076 () Bool)

(assert (=> b!878076 (= e!488694 tp_is_empty!17485)))

(declare-fun b!878077 () Bool)

(declare-fun res!596586 () Bool)

(assert (=> b!878077 (=> (not res!596586) (not e!488697))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!878077 (= res!596586 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25007 _keys!868))))))

(declare-fun b!878078 () Bool)

(declare-fun e!488695 () Bool)

(assert (=> b!878078 (= e!488696 (and e!488695 mapRes!27843))))

(declare-fun condMapEmpty!27843 () Bool)

(declare-fun mapDefault!27843 () ValueCell!8303)

(assert (=> b!878078 (= condMapEmpty!27843 (= (arr!24566 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8303)) mapDefault!27843)))))

(declare-fun b!878079 () Bool)

(assert (=> b!878079 (= e!488695 tp_is_empty!17485)))

(declare-fun b!878080 () Bool)

(assert (=> b!878080 (= e!488697 false)))

(declare-fun v!557 () V!28361)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11642 0))(
  ( (tuple2!11643 (_1!5832 (_ BitVec 64)) (_2!5832 V!28361)) )
))
(declare-datatypes ((List!17443 0))(
  ( (Nil!17440) (Cons!17439 (h!18570 tuple2!11642) (t!24523 List!17443)) )
))
(declare-datatypes ((ListLongMap!10401 0))(
  ( (ListLongMap!10402 (toList!5216 List!17443)) )
))
(declare-fun lt!396996 () ListLongMap!10401)

(declare-fun minValue!654 () V!28361)

(declare-fun zeroValue!654 () V!28361)

(declare-fun getCurrentListMapNoExtraKeys!3209 (array!51077 array!51079 (_ BitVec 32) (_ BitVec 32) V!28361 V!28361 (_ BitVec 32) Int) ListLongMap!10401)

(assert (=> b!878080 (= lt!396996 (getCurrentListMapNoExtraKeys!3209 _keys!868 (array!51080 (store (arr!24566 _values!688) i!612 (ValueCellFull!8303 v!557)) (size!25008 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396997 () ListLongMap!10401)

(assert (=> b!878080 (= lt!396997 (getCurrentListMapNoExtraKeys!3209 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878081 () Bool)

(declare-fun res!596585 () Bool)

(assert (=> b!878081 (=> (not res!596585) (not e!488697))))

(assert (=> b!878081 (= res!596585 (and (= (select (arr!24565 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878082 () Bool)

(declare-fun res!596582 () Bool)

(assert (=> b!878082 (=> (not res!596582) (not e!488697))))

(declare-datatypes ((List!17444 0))(
  ( (Nil!17441) (Cons!17440 (h!18571 (_ BitVec 64)) (t!24524 List!17444)) )
))
(declare-fun arrayNoDuplicates!0 (array!51077 (_ BitVec 32) List!17444) Bool)

(assert (=> b!878082 (= res!596582 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17441))))

(declare-fun b!878083 () Bool)

(declare-fun res!596581 () Bool)

(assert (=> b!878083 (=> (not res!596581) (not e!488697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878083 (= res!596581 (validMask!0 mask!1196))))

(assert (= (and start!74534 res!596579) b!878083))

(assert (= (and b!878083 res!596581) b!878073))

(assert (= (and b!878073 res!596584) b!878074))

(assert (= (and b!878074 res!596583) b!878082))

(assert (= (and b!878082 res!596582) b!878077))

(assert (= (and b!878077 res!596586) b!878075))

(assert (= (and b!878075 res!596580) b!878081))

(assert (= (and b!878081 res!596585) b!878080))

(assert (= (and b!878078 condMapEmpty!27843) mapIsEmpty!27843))

(assert (= (and b!878078 (not condMapEmpty!27843)) mapNonEmpty!27843))

(get-info :version)

(assert (= (and mapNonEmpty!27843 ((_ is ValueCellFull!8303) mapValue!27843)) b!878076))

(assert (= (and b!878078 ((_ is ValueCellFull!8303) mapDefault!27843)) b!878079))

(assert (= start!74534 b!878078))

(declare-fun m!817467 () Bool)

(assert (=> b!878082 m!817467))

(declare-fun m!817469 () Bool)

(assert (=> b!878075 m!817469))

(declare-fun m!817471 () Bool)

(assert (=> b!878083 m!817471))

(declare-fun m!817473 () Bool)

(assert (=> b!878081 m!817473))

(declare-fun m!817475 () Bool)

(assert (=> mapNonEmpty!27843 m!817475))

(declare-fun m!817477 () Bool)

(assert (=> b!878080 m!817477))

(declare-fun m!817479 () Bool)

(assert (=> b!878080 m!817479))

(declare-fun m!817481 () Bool)

(assert (=> b!878080 m!817481))

(declare-fun m!817483 () Bool)

(assert (=> b!878074 m!817483))

(declare-fun m!817485 () Bool)

(assert (=> start!74534 m!817485))

(declare-fun m!817487 () Bool)

(assert (=> start!74534 m!817487))

(check-sat (not b!878080) (not b_next!15241) (not b!878082) tp_is_empty!17485 (not b!878074) (not start!74534) b_and!25091 (not b!878083) (not mapNonEmpty!27843) (not b!878075))
(check-sat b_and!25091 (not b_next!15241))
