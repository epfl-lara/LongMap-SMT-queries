; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74492 () Bool)

(assert start!74492)

(declare-fun b_free!15199 () Bool)

(declare-fun b_next!15199 () Bool)

(assert (=> start!74492 (= b_free!15199 (not b_next!15199))))

(declare-fun tp!53280 () Bool)

(declare-fun b_and!25049 () Bool)

(assert (=> start!74492 (= tp!53280 b_and!25049)))

(declare-fun res!596082 () Bool)

(declare-fun e!488380 () Bool)

(assert (=> start!74492 (=> (not res!596082) (not e!488380))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50993 0))(
  ( (array!50994 (arr!24523 (Array (_ BitVec 32) (_ BitVec 64))) (size!24965 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50993)

(assert (=> start!74492 (= res!596082 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24965 _keys!868))))))

(assert (=> start!74492 e!488380))

(declare-fun tp_is_empty!17443 () Bool)

(assert (=> start!74492 tp_is_empty!17443))

(assert (=> start!74492 true))

(assert (=> start!74492 tp!53280))

(declare-fun array_inv!19370 (array!50993) Bool)

(assert (=> start!74492 (array_inv!19370 _keys!868)))

(declare-datatypes ((V!28305 0))(
  ( (V!28306 (val!8769 Int)) )
))
(declare-datatypes ((ValueCell!8282 0))(
  ( (ValueCellFull!8282 (v!11203 V!28305)) (EmptyCell!8282) )
))
(declare-datatypes ((array!50995 0))(
  ( (array!50996 (arr!24524 (Array (_ BitVec 32) ValueCell!8282)) (size!24966 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50995)

(declare-fun e!488379 () Bool)

(declare-fun array_inv!19371 (array!50995) Bool)

(assert (=> start!74492 (and (array_inv!19371 _values!688) e!488379)))

(declare-fun b!877380 () Bool)

(declare-fun res!596080 () Bool)

(assert (=> b!877380 (=> (not res!596080) (not e!488380))))

(declare-datatypes ((List!17410 0))(
  ( (Nil!17407) (Cons!17406 (h!18537 (_ BitVec 64)) (t!24490 List!17410)) )
))
(declare-fun arrayNoDuplicates!0 (array!50993 (_ BitVec 32) List!17410) Bool)

(assert (=> b!877380 (= res!596080 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17407))))

(declare-fun b!877381 () Bool)

(declare-fun res!596081 () Bool)

(assert (=> b!877381 (=> (not res!596081) (not e!488380))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!877381 (= res!596081 (and (= (size!24966 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24965 _keys!868) (size!24966 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877382 () Bool)

(declare-fun res!596078 () Bool)

(assert (=> b!877382 (=> (not res!596078) (not e!488380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50993 (_ BitVec 32)) Bool)

(assert (=> b!877382 (= res!596078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27780 () Bool)

(declare-fun mapRes!27780 () Bool)

(declare-fun tp!53279 () Bool)

(declare-fun e!488378 () Bool)

(assert (=> mapNonEmpty!27780 (= mapRes!27780 (and tp!53279 e!488378))))

(declare-fun mapRest!27780 () (Array (_ BitVec 32) ValueCell!8282))

(declare-fun mapValue!27780 () ValueCell!8282)

(declare-fun mapKey!27780 () (_ BitVec 32))

(assert (=> mapNonEmpty!27780 (= (arr!24524 _values!688) (store mapRest!27780 mapKey!27780 mapValue!27780))))

(declare-fun b!877383 () Bool)

(declare-fun res!596075 () Bool)

(assert (=> b!877383 (=> (not res!596075) (not e!488380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877383 (= res!596075 (validMask!0 mask!1196))))

(declare-fun b!877384 () Bool)

(declare-fun res!596076 () Bool)

(assert (=> b!877384 (=> (not res!596076) (not e!488380))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!877384 (= res!596076 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24965 _keys!868))))))

(declare-fun b!877385 () Bool)

(assert (=> b!877385 (= e!488380 false)))

(declare-fun v!557 () V!28305)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11606 0))(
  ( (tuple2!11607 (_1!5814 (_ BitVec 64)) (_2!5814 V!28305)) )
))
(declare-datatypes ((List!17411 0))(
  ( (Nil!17408) (Cons!17407 (h!18538 tuple2!11606) (t!24491 List!17411)) )
))
(declare-datatypes ((ListLongMap!10365 0))(
  ( (ListLongMap!10366 (toList!5198 List!17411)) )
))
(declare-fun lt!396871 () ListLongMap!10365)

(declare-fun minValue!654 () V!28305)

(declare-fun zeroValue!654 () V!28305)

(declare-fun getCurrentListMapNoExtraKeys!3191 (array!50993 array!50995 (_ BitVec 32) (_ BitVec 32) V!28305 V!28305 (_ BitVec 32) Int) ListLongMap!10365)

(assert (=> b!877385 (= lt!396871 (getCurrentListMapNoExtraKeys!3191 _keys!868 (array!50996 (store (arr!24524 _values!688) i!612 (ValueCellFull!8282 v!557)) (size!24966 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396870 () ListLongMap!10365)

(assert (=> b!877385 (= lt!396870 (getCurrentListMapNoExtraKeys!3191 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877386 () Bool)

(declare-fun res!596077 () Bool)

(assert (=> b!877386 (=> (not res!596077) (not e!488380))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!877386 (= res!596077 (and (= (select (arr!24523 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27780 () Bool)

(assert (=> mapIsEmpty!27780 mapRes!27780))

(declare-fun b!877387 () Bool)

(declare-fun e!488381 () Bool)

(assert (=> b!877387 (= e!488381 tp_is_empty!17443)))

(declare-fun b!877388 () Bool)

(declare-fun res!596079 () Bool)

(assert (=> b!877388 (=> (not res!596079) (not e!488380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877388 (= res!596079 (validKeyInArray!0 k0!854))))

(declare-fun b!877389 () Bool)

(assert (=> b!877389 (= e!488378 tp_is_empty!17443)))

(declare-fun b!877390 () Bool)

(assert (=> b!877390 (= e!488379 (and e!488381 mapRes!27780))))

(declare-fun condMapEmpty!27780 () Bool)

(declare-fun mapDefault!27780 () ValueCell!8282)

(assert (=> b!877390 (= condMapEmpty!27780 (= (arr!24524 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8282)) mapDefault!27780)))))

(assert (= (and start!74492 res!596082) b!877383))

(assert (= (and b!877383 res!596075) b!877381))

(assert (= (and b!877381 res!596081) b!877382))

(assert (= (and b!877382 res!596078) b!877380))

(assert (= (and b!877380 res!596080) b!877384))

(assert (= (and b!877384 res!596076) b!877388))

(assert (= (and b!877388 res!596079) b!877386))

(assert (= (and b!877386 res!596077) b!877385))

(assert (= (and b!877390 condMapEmpty!27780) mapIsEmpty!27780))

(assert (= (and b!877390 (not condMapEmpty!27780)) mapNonEmpty!27780))

(get-info :version)

(assert (= (and mapNonEmpty!27780 ((_ is ValueCellFull!8282) mapValue!27780)) b!877389))

(assert (= (and b!877390 ((_ is ValueCellFull!8282) mapDefault!27780)) b!877387))

(assert (= start!74492 b!877390))

(declare-fun m!817005 () Bool)

(assert (=> b!877382 m!817005))

(declare-fun m!817007 () Bool)

(assert (=> b!877383 m!817007))

(declare-fun m!817009 () Bool)

(assert (=> mapNonEmpty!27780 m!817009))

(declare-fun m!817011 () Bool)

(assert (=> start!74492 m!817011))

(declare-fun m!817013 () Bool)

(assert (=> start!74492 m!817013))

(declare-fun m!817015 () Bool)

(assert (=> b!877380 m!817015))

(declare-fun m!817017 () Bool)

(assert (=> b!877386 m!817017))

(declare-fun m!817019 () Bool)

(assert (=> b!877385 m!817019))

(declare-fun m!817021 () Bool)

(assert (=> b!877385 m!817021))

(declare-fun m!817023 () Bool)

(assert (=> b!877385 m!817023))

(declare-fun m!817025 () Bool)

(assert (=> b!877388 m!817025))

(check-sat (not b!877385) (not b!877388) (not b!877382) (not b!877380) (not start!74492) (not mapNonEmpty!27780) (not b!877383) b_and!25049 (not b_next!15199) tp_is_empty!17443)
(check-sat b_and!25049 (not b_next!15199))
