; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74536 () Bool)

(assert start!74536)

(declare-fun b_free!15225 () Bool)

(declare-fun b_next!15225 () Bool)

(assert (=> start!74536 (= b_free!15225 (not b_next!15225))))

(declare-fun tp!53357 () Bool)

(declare-fun b_and!25101 () Bool)

(assert (=> start!74536 (= tp!53357 b_and!25101)))

(declare-fun b!878048 () Bool)

(declare-fun e!488725 () Bool)

(declare-fun e!488722 () Bool)

(declare-fun mapRes!27819 () Bool)

(assert (=> b!878048 (= e!488725 (and e!488722 mapRes!27819))))

(declare-fun condMapEmpty!27819 () Bool)

(declare-datatypes ((V!28339 0))(
  ( (V!28340 (val!8782 Int)) )
))
(declare-datatypes ((ValueCell!8295 0))(
  ( (ValueCellFull!8295 (v!11222 V!28339)) (EmptyCell!8295) )
))
(declare-datatypes ((array!51066 0))(
  ( (array!51067 (arr!24559 (Array (_ BitVec 32) ValueCell!8295)) (size!24999 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51066)

(declare-fun mapDefault!27819 () ValueCell!8295)

(assert (=> b!878048 (= condMapEmpty!27819 (= (arr!24559 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8295)) mapDefault!27819)))))

(declare-fun mapNonEmpty!27819 () Bool)

(declare-fun tp!53356 () Bool)

(declare-fun e!488724 () Bool)

(assert (=> mapNonEmpty!27819 (= mapRes!27819 (and tp!53356 e!488724))))

(declare-fun mapKey!27819 () (_ BitVec 32))

(declare-fun mapValue!27819 () ValueCell!8295)

(declare-fun mapRest!27819 () (Array (_ BitVec 32) ValueCell!8295))

(assert (=> mapNonEmpty!27819 (= (arr!24559 _values!688) (store mapRest!27819 mapKey!27819 mapValue!27819))))

(declare-fun b!878050 () Bool)

(declare-fun res!596503 () Bool)

(declare-fun e!488723 () Bool)

(assert (=> b!878050 (=> (not res!596503) (not e!488723))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!51068 0))(
  ( (array!51069 (arr!24560 (Array (_ BitVec 32) (_ BitVec 64))) (size!25000 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51068)

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!878050 (= res!596503 (and (= (size!24999 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25000 _keys!868) (size!24999 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!878051 () Bool)

(declare-fun res!596499 () Bool)

(assert (=> b!878051 (=> (not res!596499) (not e!488723))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!878051 (= res!596499 (validKeyInArray!0 k0!854))))

(declare-fun b!878052 () Bool)

(declare-fun res!596500 () Bool)

(assert (=> b!878052 (=> (not res!596500) (not e!488723))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!878052 (= res!596500 (and (= (select (arr!24560 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!878053 () Bool)

(declare-fun res!596498 () Bool)

(assert (=> b!878053 (=> (not res!596498) (not e!488723))))

(assert (=> b!878053 (= res!596498 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25000 _keys!868))))))

(declare-fun b!878054 () Bool)

(assert (=> b!878054 (= e!488723 false)))

(declare-datatypes ((tuple2!11612 0))(
  ( (tuple2!11613 (_1!5817 (_ BitVec 64)) (_2!5817 V!28339)) )
))
(declare-datatypes ((List!17427 0))(
  ( (Nil!17424) (Cons!17423 (h!18554 tuple2!11612) (t!24516 List!17427)) )
))
(declare-datatypes ((ListLongMap!10381 0))(
  ( (ListLongMap!10382 (toList!5206 List!17427)) )
))
(declare-fun lt!397184 () ListLongMap!10381)

(declare-fun v!557 () V!28339)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28339)

(declare-fun zeroValue!654 () V!28339)

(declare-fun getCurrentListMapNoExtraKeys!3173 (array!51068 array!51066 (_ BitVec 32) (_ BitVec 32) V!28339 V!28339 (_ BitVec 32) Int) ListLongMap!10381)

(assert (=> b!878054 (= lt!397184 (getCurrentListMapNoExtraKeys!3173 _keys!868 (array!51067 (store (arr!24559 _values!688) i!612 (ValueCellFull!8295 v!557)) (size!24999 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397185 () ListLongMap!10381)

(assert (=> b!878054 (= lt!397185 (getCurrentListMapNoExtraKeys!3173 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!878055 () Bool)

(declare-fun res!596504 () Bool)

(assert (=> b!878055 (=> (not res!596504) (not e!488723))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!878055 (= res!596504 (validMask!0 mask!1196))))

(declare-fun b!878056 () Bool)

(declare-fun tp_is_empty!17469 () Bool)

(assert (=> b!878056 (= e!488722 tp_is_empty!17469)))

(declare-fun mapIsEmpty!27819 () Bool)

(assert (=> mapIsEmpty!27819 mapRes!27819))

(declare-fun b!878049 () Bool)

(declare-fun res!596502 () Bool)

(assert (=> b!878049 (=> (not res!596502) (not e!488723))))

(declare-datatypes ((List!17428 0))(
  ( (Nil!17425) (Cons!17424 (h!18555 (_ BitVec 64)) (t!24517 List!17428)) )
))
(declare-fun arrayNoDuplicates!0 (array!51068 (_ BitVec 32) List!17428) Bool)

(assert (=> b!878049 (= res!596502 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17425))))

(declare-fun res!596497 () Bool)

(assert (=> start!74536 (=> (not res!596497) (not e!488723))))

(assert (=> start!74536 (= res!596497 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25000 _keys!868))))))

(assert (=> start!74536 e!488723))

(assert (=> start!74536 tp_is_empty!17469))

(assert (=> start!74536 true))

(assert (=> start!74536 tp!53357))

(declare-fun array_inv!19356 (array!51068) Bool)

(assert (=> start!74536 (array_inv!19356 _keys!868)))

(declare-fun array_inv!19357 (array!51066) Bool)

(assert (=> start!74536 (and (array_inv!19357 _values!688) e!488725)))

(declare-fun b!878057 () Bool)

(declare-fun res!596501 () Bool)

(assert (=> b!878057 (=> (not res!596501) (not e!488723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51068 (_ BitVec 32)) Bool)

(assert (=> b!878057 (= res!596501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!878058 () Bool)

(assert (=> b!878058 (= e!488724 tp_is_empty!17469)))

(assert (= (and start!74536 res!596497) b!878055))

(assert (= (and b!878055 res!596504) b!878050))

(assert (= (and b!878050 res!596503) b!878057))

(assert (= (and b!878057 res!596501) b!878049))

(assert (= (and b!878049 res!596502) b!878053))

(assert (= (and b!878053 res!596498) b!878051))

(assert (= (and b!878051 res!596499) b!878052))

(assert (= (and b!878052 res!596500) b!878054))

(assert (= (and b!878048 condMapEmpty!27819) mapIsEmpty!27819))

(assert (= (and b!878048 (not condMapEmpty!27819)) mapNonEmpty!27819))

(get-info :version)

(assert (= (and mapNonEmpty!27819 ((_ is ValueCellFull!8295) mapValue!27819)) b!878058))

(assert (= (and b!878048 ((_ is ValueCellFull!8295) mapDefault!27819)) b!878056))

(assert (= start!74536 b!878048))

(declare-fun m!818049 () Bool)

(assert (=> b!878055 m!818049))

(declare-fun m!818051 () Bool)

(assert (=> mapNonEmpty!27819 m!818051))

(declare-fun m!818053 () Bool)

(assert (=> b!878049 m!818053))

(declare-fun m!818055 () Bool)

(assert (=> b!878052 m!818055))

(declare-fun m!818057 () Bool)

(assert (=> b!878051 m!818057))

(declare-fun m!818059 () Bool)

(assert (=> start!74536 m!818059))

(declare-fun m!818061 () Bool)

(assert (=> start!74536 m!818061))

(declare-fun m!818063 () Bool)

(assert (=> b!878054 m!818063))

(declare-fun m!818065 () Bool)

(assert (=> b!878054 m!818065))

(declare-fun m!818067 () Bool)

(assert (=> b!878054 m!818067))

(declare-fun m!818069 () Bool)

(assert (=> b!878057 m!818069))

(check-sat tp_is_empty!17469 (not b!878057) b_and!25101 (not b!878051) (not b_next!15225) (not b!878054) (not start!74536) (not b!878049) (not b!878055) (not mapNonEmpty!27819))
(check-sat b_and!25101 (not b_next!15225))
