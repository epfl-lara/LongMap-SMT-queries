; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74124 () Bool)

(assert start!74124)

(declare-fun b!872005 () Bool)

(declare-fun res!592707 () Bool)

(declare-fun e!485530 () Bool)

(assert (=> b!872005 (=> (not res!592707) (not e!485530))))

(declare-datatypes ((array!50460 0))(
  ( (array!50461 (arr!24260 (Array (_ BitVec 32) (_ BitVec 64))) (size!24700 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50460)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50460 (_ BitVec 32)) Bool)

(assert (=> b!872005 (= res!592707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!27347 () Bool)

(declare-fun mapRes!27347 () Bool)

(declare-fun tp!52546 () Bool)

(declare-fun e!485527 () Bool)

(assert (=> mapNonEmpty!27347 (= mapRes!27347 (and tp!52546 e!485527))))

(declare-fun mapKey!27347 () (_ BitVec 32))

(declare-datatypes ((V!27931 0))(
  ( (V!27932 (val!8629 Int)) )
))
(declare-datatypes ((ValueCell!8142 0))(
  ( (ValueCellFull!8142 (v!11054 V!27931)) (EmptyCell!8142) )
))
(declare-fun mapRest!27347 () (Array (_ BitVec 32) ValueCell!8142))

(declare-fun mapValue!27347 () ValueCell!8142)

(declare-datatypes ((array!50462 0))(
  ( (array!50463 (arr!24261 (Array (_ BitVec 32) ValueCell!8142)) (size!24701 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50462)

(assert (=> mapNonEmpty!27347 (= (arr!24261 _values!688) (store mapRest!27347 mapKey!27347 mapValue!27347))))

(declare-fun b!872006 () Bool)

(declare-fun e!485528 () Bool)

(declare-fun tp_is_empty!17163 () Bool)

(assert (=> b!872006 (= e!485528 tp_is_empty!17163)))

(declare-fun b!872007 () Bool)

(declare-fun res!592706 () Bool)

(assert (=> b!872007 (=> (not res!592706) (not e!485530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872007 (= res!592706 (validMask!0 mask!1196))))

(declare-fun res!592709 () Bool)

(assert (=> start!74124 (=> (not res!592709) (not e!485530))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74124 (= res!592709 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24700 _keys!868))))))

(assert (=> start!74124 e!485530))

(assert (=> start!74124 true))

(declare-fun array_inv!19152 (array!50460) Bool)

(assert (=> start!74124 (array_inv!19152 _keys!868)))

(declare-fun e!485529 () Bool)

(declare-fun array_inv!19153 (array!50462) Bool)

(assert (=> start!74124 (and (array_inv!19153 _values!688) e!485529)))

(declare-fun mapIsEmpty!27347 () Bool)

(assert (=> mapIsEmpty!27347 mapRes!27347))

(declare-fun b!872008 () Bool)

(assert (=> b!872008 (= e!485530 false)))

(declare-fun lt!395560 () Bool)

(declare-datatypes ((List!17248 0))(
  ( (Nil!17245) (Cons!17244 (h!18375 (_ BitVec 64)) (t!24285 List!17248)) )
))
(declare-fun arrayNoDuplicates!0 (array!50460 (_ BitVec 32) List!17248) Bool)

(assert (=> b!872008 (= lt!395560 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17245))))

(declare-fun b!872009 () Bool)

(declare-fun res!592708 () Bool)

(assert (=> b!872009 (=> (not res!592708) (not e!485530))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!872009 (= res!592708 (and (= (size!24701 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24700 _keys!868) (size!24701 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872010 () Bool)

(assert (=> b!872010 (= e!485527 tp_is_empty!17163)))

(declare-fun b!872011 () Bool)

(assert (=> b!872011 (= e!485529 (and e!485528 mapRes!27347))))

(declare-fun condMapEmpty!27347 () Bool)

(declare-fun mapDefault!27347 () ValueCell!8142)

(assert (=> b!872011 (= condMapEmpty!27347 (= (arr!24261 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8142)) mapDefault!27347)))))

(assert (= (and start!74124 res!592709) b!872007))

(assert (= (and b!872007 res!592706) b!872009))

(assert (= (and b!872009 res!592708) b!872005))

(assert (= (and b!872005 res!592707) b!872008))

(assert (= (and b!872011 condMapEmpty!27347) mapIsEmpty!27347))

(assert (= (and b!872011 (not condMapEmpty!27347)) mapNonEmpty!27347))

(get-info :version)

(assert (= (and mapNonEmpty!27347 ((_ is ValueCellFull!8142) mapValue!27347)) b!872010))

(assert (= (and b!872011 ((_ is ValueCellFull!8142) mapDefault!27347)) b!872006))

(assert (= start!74124 b!872011))

(declare-fun m!813011 () Bool)

(assert (=> mapNonEmpty!27347 m!813011))

(declare-fun m!813013 () Bool)

(assert (=> b!872008 m!813013))

(declare-fun m!813015 () Bool)

(assert (=> b!872005 m!813015))

(declare-fun m!813017 () Bool)

(assert (=> start!74124 m!813017))

(declare-fun m!813019 () Bool)

(assert (=> start!74124 m!813019))

(declare-fun m!813021 () Bool)

(assert (=> b!872007 m!813021))

(check-sat (not mapNonEmpty!27347) (not start!74124) (not b!872008) tp_is_empty!17163 (not b!872005) (not b!872007))
(check-sat)
