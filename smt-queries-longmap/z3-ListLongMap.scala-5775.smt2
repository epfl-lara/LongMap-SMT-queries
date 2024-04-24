; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74720 () Bool)

(assert start!74720)

(declare-fun b_free!15241 () Bool)

(declare-fun b_next!15241 () Bool)

(assert (=> start!74720 (= b_free!15241 (not b_next!15241))))

(declare-fun tp!53405 () Bool)

(declare-fun b_and!25127 () Bool)

(assert (=> start!74720 (= tp!53405 b_and!25127)))

(declare-fun res!597033 () Bool)

(declare-fun e!489424 () Bool)

(assert (=> start!74720 (=> (not res!597033) (not e!489424))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51137 0))(
  ( (array!51138 (arr!24590 (Array (_ BitVec 32) (_ BitVec 64))) (size!25031 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51137)

(assert (=> start!74720 (= res!597033 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25031 _keys!868))))))

(assert (=> start!74720 e!489424))

(declare-fun tp_is_empty!17485 () Bool)

(assert (=> start!74720 tp_is_empty!17485))

(assert (=> start!74720 true))

(assert (=> start!74720 tp!53405))

(declare-fun array_inv!19424 (array!51137) Bool)

(assert (=> start!74720 (array_inv!19424 _keys!868)))

(declare-datatypes ((V!28361 0))(
  ( (V!28362 (val!8790 Int)) )
))
(declare-datatypes ((ValueCell!8303 0))(
  ( (ValueCellFull!8303 (v!11230 V!28361)) (EmptyCell!8303) )
))
(declare-datatypes ((array!51139 0))(
  ( (array!51140 (arr!24591 (Array (_ BitVec 32) ValueCell!8303)) (size!25032 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51139)

(declare-fun e!489427 () Bool)

(declare-fun array_inv!19425 (array!51139) Bool)

(assert (=> start!74720 (and (array_inv!19425 _values!688) e!489427)))

(declare-fun b!879215 () Bool)

(declare-fun e!489425 () Bool)

(declare-fun mapRes!27843 () Bool)

(assert (=> b!879215 (= e!489427 (and e!489425 mapRes!27843))))

(declare-fun condMapEmpty!27843 () Bool)

(declare-fun mapDefault!27843 () ValueCell!8303)

(assert (=> b!879215 (= condMapEmpty!27843 (= (arr!24591 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8303)) mapDefault!27843)))))

(declare-fun b!879216 () Bool)

(declare-fun e!489423 () Bool)

(assert (=> b!879216 (= e!489423 tp_is_empty!17485)))

(declare-fun b!879217 () Bool)

(assert (=> b!879217 (= e!489424 false)))

(declare-fun v!557 () V!28361)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11562 0))(
  ( (tuple2!11563 (_1!5792 (_ BitVec 64)) (_2!5792 V!28361)) )
))
(declare-datatypes ((List!17395 0))(
  ( (Nil!17392) (Cons!17391 (h!18528 tuple2!11562) (t!24476 List!17395)) )
))
(declare-datatypes ((ListLongMap!10333 0))(
  ( (ListLongMap!10334 (toList!5182 List!17395)) )
))
(declare-fun lt!397594 () ListLongMap!10333)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28361)

(declare-fun zeroValue!654 () V!28361)

(declare-fun getCurrentListMapNoExtraKeys!3224 (array!51137 array!51139 (_ BitVec 32) (_ BitVec 32) V!28361 V!28361 (_ BitVec 32) Int) ListLongMap!10333)

(assert (=> b!879217 (= lt!397594 (getCurrentListMapNoExtraKeys!3224 _keys!868 (array!51140 (store (arr!24591 _values!688) i!612 (ValueCellFull!8303 v!557)) (size!25032 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397593 () ListLongMap!10333)

(assert (=> b!879217 (= lt!397593 (getCurrentListMapNoExtraKeys!3224 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!879218 () Bool)

(declare-fun res!597036 () Bool)

(assert (=> b!879218 (=> (not res!597036) (not e!489424))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!879218 (= res!597036 (and (= (select (arr!24590 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!879219 () Bool)

(declare-fun res!597034 () Bool)

(assert (=> b!879219 (=> (not res!597034) (not e!489424))))

(assert (=> b!879219 (= res!597034 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25031 _keys!868))))))

(declare-fun b!879220 () Bool)

(declare-fun res!597040 () Bool)

(assert (=> b!879220 (=> (not res!597040) (not e!489424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51137 (_ BitVec 32)) Bool)

(assert (=> b!879220 (= res!597040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27843 () Bool)

(assert (=> mapIsEmpty!27843 mapRes!27843))

(declare-fun b!879221 () Bool)

(declare-fun res!597039 () Bool)

(assert (=> b!879221 (=> (not res!597039) (not e!489424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!879221 (= res!597039 (validMask!0 mask!1196))))

(declare-fun b!879222 () Bool)

(declare-fun res!597035 () Bool)

(assert (=> b!879222 (=> (not res!597035) (not e!489424))))

(declare-datatypes ((List!17396 0))(
  ( (Nil!17393) (Cons!17392 (h!18529 (_ BitVec 64)) (t!24477 List!17396)) )
))
(declare-fun arrayNoDuplicates!0 (array!51137 (_ BitVec 32) List!17396) Bool)

(assert (=> b!879222 (= res!597035 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17393))))

(declare-fun b!879223 () Bool)

(declare-fun res!597037 () Bool)

(assert (=> b!879223 (=> (not res!597037) (not e!489424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!879223 (= res!597037 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27843 () Bool)

(declare-fun tp!53406 () Bool)

(assert (=> mapNonEmpty!27843 (= mapRes!27843 (and tp!53406 e!489423))))

(declare-fun mapRest!27843 () (Array (_ BitVec 32) ValueCell!8303))

(declare-fun mapKey!27843 () (_ BitVec 32))

(declare-fun mapValue!27843 () ValueCell!8303)

(assert (=> mapNonEmpty!27843 (= (arr!24591 _values!688) (store mapRest!27843 mapKey!27843 mapValue!27843))))

(declare-fun b!879224 () Bool)

(declare-fun res!597038 () Bool)

(assert (=> b!879224 (=> (not res!597038) (not e!489424))))

(assert (=> b!879224 (= res!597038 (and (= (size!25032 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25031 _keys!868) (size!25032 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!879225 () Bool)

(assert (=> b!879225 (= e!489425 tp_is_empty!17485)))

(assert (= (and start!74720 res!597033) b!879221))

(assert (= (and b!879221 res!597039) b!879224))

(assert (= (and b!879224 res!597038) b!879220))

(assert (= (and b!879220 res!597040) b!879222))

(assert (= (and b!879222 res!597035) b!879219))

(assert (= (and b!879219 res!597034) b!879223))

(assert (= (and b!879223 res!597037) b!879218))

(assert (= (and b!879218 res!597036) b!879217))

(assert (= (and b!879215 condMapEmpty!27843) mapIsEmpty!27843))

(assert (= (and b!879215 (not condMapEmpty!27843)) mapNonEmpty!27843))

(get-info :version)

(assert (= (and mapNonEmpty!27843 ((_ is ValueCellFull!8303) mapValue!27843)) b!879216))

(assert (= (and b!879215 ((_ is ValueCellFull!8303) mapDefault!27843)) b!879225))

(assert (= start!74720 b!879215))

(declare-fun m!819519 () Bool)

(assert (=> b!879222 m!819519))

(declare-fun m!819521 () Bool)

(assert (=> mapNonEmpty!27843 m!819521))

(declare-fun m!819523 () Bool)

(assert (=> b!879223 m!819523))

(declare-fun m!819525 () Bool)

(assert (=> b!879218 m!819525))

(declare-fun m!819527 () Bool)

(assert (=> b!879217 m!819527))

(declare-fun m!819529 () Bool)

(assert (=> b!879217 m!819529))

(declare-fun m!819531 () Bool)

(assert (=> b!879217 m!819531))

(declare-fun m!819533 () Bool)

(assert (=> b!879220 m!819533))

(declare-fun m!819535 () Bool)

(assert (=> b!879221 m!819535))

(declare-fun m!819537 () Bool)

(assert (=> start!74720 m!819537))

(declare-fun m!819539 () Bool)

(assert (=> start!74720 m!819539))

(check-sat (not b!879223) (not b!879222) (not start!74720) (not b!879217) (not b_next!15241) (not b!879221) (not mapNonEmpty!27843) (not b!879220) b_and!25127 tp_is_empty!17485)
(check-sat b_and!25127 (not b_next!15241))
