; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74152 () Bool)

(assert start!74152)

(declare-fun b!872249 () Bool)

(declare-fun e!485725 () Bool)

(declare-fun e!485726 () Bool)

(declare-fun mapRes!27416 () Bool)

(assert (=> b!872249 (= e!485725 (and e!485726 mapRes!27416))))

(declare-fun condMapEmpty!27416 () Bool)

(declare-datatypes ((V!27993 0))(
  ( (V!27994 (val!8652 Int)) )
))
(declare-datatypes ((ValueCell!8165 0))(
  ( (ValueCellFull!8165 (v!11071 V!27993)) (EmptyCell!8165) )
))
(declare-datatypes ((array!50537 0))(
  ( (array!50538 (arr!24299 (Array (_ BitVec 32) ValueCell!8165)) (size!24741 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50537)

(declare-fun mapDefault!27416 () ValueCell!8165)

(assert (=> b!872249 (= condMapEmpty!27416 (= (arr!24299 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8165)) mapDefault!27416)))))

(declare-fun b!872250 () Bool)

(declare-fun res!592874 () Bool)

(declare-fun e!485727 () Bool)

(assert (=> b!872250 (=> (not res!592874) (not e!485727))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872250 (= res!592874 (validMask!0 mask!1196))))

(declare-fun b!872251 () Bool)

(declare-fun tp_is_empty!17209 () Bool)

(assert (=> b!872251 (= e!485726 tp_is_empty!17209)))

(declare-fun mapNonEmpty!27416 () Bool)

(declare-fun tp!52616 () Bool)

(declare-fun e!485723 () Bool)

(assert (=> mapNonEmpty!27416 (= mapRes!27416 (and tp!52616 e!485723))))

(declare-fun mapValue!27416 () ValueCell!8165)

(declare-fun mapKey!27416 () (_ BitVec 32))

(declare-fun mapRest!27416 () (Array (_ BitVec 32) ValueCell!8165))

(assert (=> mapNonEmpty!27416 (= (arr!24299 _values!688) (store mapRest!27416 mapKey!27416 mapValue!27416))))

(declare-fun b!872252 () Bool)

(declare-fun res!592873 () Bool)

(assert (=> b!872252 (=> (not res!592873) (not e!485727))))

(declare-datatypes ((array!50539 0))(
  ( (array!50540 (arr!24300 (Array (_ BitVec 32) (_ BitVec 64))) (size!24742 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50539)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50539 (_ BitVec 32)) Bool)

(assert (=> b!872252 (= res!592873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872253 () Bool)

(assert (=> b!872253 (= e!485727 false)))

(declare-fun lt!395393 () Bool)

(declare-datatypes ((List!17269 0))(
  ( (Nil!17266) (Cons!17265 (h!18396 (_ BitVec 64)) (t!24297 List!17269)) )
))
(declare-fun arrayNoDuplicates!0 (array!50539 (_ BitVec 32) List!17269) Bool)

(assert (=> b!872253 (= lt!395393 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17266))))

(declare-fun b!872254 () Bool)

(declare-fun res!592875 () Bool)

(assert (=> b!872254 (=> (not res!592875) (not e!485727))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872254 (= res!592875 (and (= (size!24741 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24742 _keys!868) (size!24741 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!592872 () Bool)

(assert (=> start!74152 (=> (not res!592872) (not e!485727))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74152 (= res!592872 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24742 _keys!868))))))

(assert (=> start!74152 e!485727))

(assert (=> start!74152 true))

(declare-fun array_inv!19242 (array!50539) Bool)

(assert (=> start!74152 (array_inv!19242 _keys!868)))

(declare-fun array_inv!19243 (array!50537) Bool)

(assert (=> start!74152 (and (array_inv!19243 _values!688) e!485725)))

(declare-fun b!872255 () Bool)

(assert (=> b!872255 (= e!485723 tp_is_empty!17209)))

(declare-fun mapIsEmpty!27416 () Bool)

(assert (=> mapIsEmpty!27416 mapRes!27416))

(assert (= (and start!74152 res!592872) b!872250))

(assert (= (and b!872250 res!592874) b!872254))

(assert (= (and b!872254 res!592875) b!872252))

(assert (= (and b!872252 res!592873) b!872253))

(assert (= (and b!872249 condMapEmpty!27416) mapIsEmpty!27416))

(assert (= (and b!872249 (not condMapEmpty!27416)) mapNonEmpty!27416))

(get-info :version)

(assert (= (and mapNonEmpty!27416 ((_ is ValueCellFull!8165) mapValue!27416)) b!872255))

(assert (= (and b!872249 ((_ is ValueCellFull!8165) mapDefault!27416)) b!872251))

(assert (= start!74152 b!872249))

(declare-fun m!812529 () Bool)

(assert (=> b!872253 m!812529))

(declare-fun m!812531 () Bool)

(assert (=> mapNonEmpty!27416 m!812531))

(declare-fun m!812533 () Bool)

(assert (=> b!872250 m!812533))

(declare-fun m!812535 () Bool)

(assert (=> b!872252 m!812535))

(declare-fun m!812537 () Bool)

(assert (=> start!74152 m!812537))

(declare-fun m!812539 () Bool)

(assert (=> start!74152 m!812539))

(check-sat (not start!74152) tp_is_empty!17209 (not b!872250) (not b!872253) (not mapNonEmpty!27416) (not b!872252))
(check-sat)
