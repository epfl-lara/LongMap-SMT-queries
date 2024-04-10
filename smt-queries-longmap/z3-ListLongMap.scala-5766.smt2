; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74500 () Bool)

(assert start!74500)

(declare-fun b_free!15189 () Bool)

(declare-fun b_next!15189 () Bool)

(assert (=> start!74500 (= b_free!15189 (not b_next!15189))))

(declare-fun tp!53249 () Bool)

(declare-fun b_and!25065 () Bool)

(assert (=> start!74500 (= tp!53249 b_and!25065)))

(declare-fun res!596069 () Bool)

(declare-fun e!488451 () Bool)

(assert (=> start!74500 (=> (not res!596069) (not e!488451))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50994 0))(
  ( (array!50995 (arr!24523 (Array (_ BitVec 32) (_ BitVec 64))) (size!24963 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50994)

(assert (=> start!74500 (= res!596069 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24963 _keys!868))))))

(assert (=> start!74500 e!488451))

(declare-fun tp_is_empty!17433 () Bool)

(assert (=> start!74500 tp_is_empty!17433))

(assert (=> start!74500 true))

(assert (=> start!74500 tp!53249))

(declare-fun array_inv!19330 (array!50994) Bool)

(assert (=> start!74500 (array_inv!19330 _keys!868)))

(declare-datatypes ((V!28291 0))(
  ( (V!28292 (val!8764 Int)) )
))
(declare-datatypes ((ValueCell!8277 0))(
  ( (ValueCellFull!8277 (v!11204 V!28291)) (EmptyCell!8277) )
))
(declare-datatypes ((array!50996 0))(
  ( (array!50997 (arr!24524 (Array (_ BitVec 32) ValueCell!8277)) (size!24964 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50996)

(declare-fun e!488454 () Bool)

(declare-fun array_inv!19331 (array!50996) Bool)

(assert (=> start!74500 (and (array_inv!19331 _values!688) e!488454)))

(declare-fun b!877454 () Bool)

(declare-fun e!488452 () Bool)

(assert (=> b!877454 (= e!488452 tp_is_empty!17433)))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun b!877455 () Bool)

(assert (=> b!877455 (= e!488451 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612) (or (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24963 _keys!868)))))))

(declare-fun v!557 () V!28291)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28291)

(declare-fun zeroValue!654 () V!28291)

(declare-datatypes ((tuple2!11588 0))(
  ( (tuple2!11589 (_1!5805 (_ BitVec 64)) (_2!5805 V!28291)) )
))
(declare-datatypes ((List!17404 0))(
  ( (Nil!17401) (Cons!17400 (h!18531 tuple2!11588) (t!24493 List!17404)) )
))
(declare-datatypes ((ListLongMap!10357 0))(
  ( (ListLongMap!10358 (toList!5194 List!17404)) )
))
(declare-fun lt!397077 () ListLongMap!10357)

(declare-fun getCurrentListMapNoExtraKeys!3161 (array!50994 array!50996 (_ BitVec 32) (_ BitVec 32) V!28291 V!28291 (_ BitVec 32) Int) ListLongMap!10357)

(assert (=> b!877455 (= lt!397077 (getCurrentListMapNoExtraKeys!3161 _keys!868 (array!50997 (store (arr!24524 _values!688) i!612 (ValueCellFull!8277 v!557)) (size!24964 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!397076 () ListLongMap!10357)

(assert (=> b!877455 (= lt!397076 (getCurrentListMapNoExtraKeys!3161 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!877456 () Bool)

(declare-fun res!596072 () Bool)

(assert (=> b!877456 (=> (not res!596072) (not e!488451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!877456 (= res!596072 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!27765 () Bool)

(declare-fun mapRes!27765 () Bool)

(declare-fun tp!53248 () Bool)

(assert (=> mapNonEmpty!27765 (= mapRes!27765 (and tp!53248 e!488452))))

(declare-fun mapKey!27765 () (_ BitVec 32))

(declare-fun mapValue!27765 () ValueCell!8277)

(declare-fun mapRest!27765 () (Array (_ BitVec 32) ValueCell!8277))

(assert (=> mapNonEmpty!27765 (= (arr!24524 _values!688) (store mapRest!27765 mapKey!27765 mapValue!27765))))

(declare-fun mapIsEmpty!27765 () Bool)

(assert (=> mapIsEmpty!27765 mapRes!27765))

(declare-fun b!877457 () Bool)

(declare-fun res!596070 () Bool)

(assert (=> b!877457 (=> (not res!596070) (not e!488451))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!877457 (= res!596070 (validKeyInArray!0 k0!854))))

(declare-fun b!877458 () Bool)

(declare-fun res!596066 () Bool)

(assert (=> b!877458 (=> (not res!596066) (not e!488451))))

(assert (=> b!877458 (= res!596066 (and (= (select (arr!24523 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!877459 () Bool)

(declare-fun res!596071 () Bool)

(assert (=> b!877459 (=> (not res!596071) (not e!488451))))

(assert (=> b!877459 (= res!596071 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24963 _keys!868))))))

(declare-fun b!877460 () Bool)

(declare-fun res!596067 () Bool)

(assert (=> b!877460 (=> (not res!596067) (not e!488451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50994 (_ BitVec 32)) Bool)

(assert (=> b!877460 (= res!596067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!877461 () Bool)

(declare-fun e!488453 () Bool)

(assert (=> b!877461 (= e!488454 (and e!488453 mapRes!27765))))

(declare-fun condMapEmpty!27765 () Bool)

(declare-fun mapDefault!27765 () ValueCell!8277)

(assert (=> b!877461 (= condMapEmpty!27765 (= (arr!24524 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8277)) mapDefault!27765)))))

(declare-fun b!877462 () Bool)

(declare-fun res!596068 () Bool)

(assert (=> b!877462 (=> (not res!596068) (not e!488451))))

(declare-datatypes ((List!17405 0))(
  ( (Nil!17402) (Cons!17401 (h!18532 (_ BitVec 64)) (t!24494 List!17405)) )
))
(declare-fun arrayNoDuplicates!0 (array!50994 (_ BitVec 32) List!17405) Bool)

(assert (=> b!877462 (= res!596068 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17402))))

(declare-fun b!877463 () Bool)

(declare-fun res!596065 () Bool)

(assert (=> b!877463 (=> (not res!596065) (not e!488451))))

(assert (=> b!877463 (= res!596065 (and (= (size!24964 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24963 _keys!868) (size!24964 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!877464 () Bool)

(assert (=> b!877464 (= e!488453 tp_is_empty!17433)))

(assert (= (and start!74500 res!596069) b!877456))

(assert (= (and b!877456 res!596072) b!877463))

(assert (= (and b!877463 res!596065) b!877460))

(assert (= (and b!877460 res!596067) b!877462))

(assert (= (and b!877462 res!596068) b!877459))

(assert (= (and b!877459 res!596071) b!877457))

(assert (= (and b!877457 res!596070) b!877458))

(assert (= (and b!877458 res!596066) b!877455))

(assert (= (and b!877461 condMapEmpty!27765) mapIsEmpty!27765))

(assert (= (and b!877461 (not condMapEmpty!27765)) mapNonEmpty!27765))

(get-info :version)

(assert (= (and mapNonEmpty!27765 ((_ is ValueCellFull!8277) mapValue!27765)) b!877454))

(assert (= (and b!877461 ((_ is ValueCellFull!8277) mapDefault!27765)) b!877464))

(assert (= start!74500 b!877461))

(declare-fun m!817653 () Bool)

(assert (=> mapNonEmpty!27765 m!817653))

(declare-fun m!817655 () Bool)

(assert (=> start!74500 m!817655))

(declare-fun m!817657 () Bool)

(assert (=> start!74500 m!817657))

(declare-fun m!817659 () Bool)

(assert (=> b!877458 m!817659))

(declare-fun m!817661 () Bool)

(assert (=> b!877456 m!817661))

(declare-fun m!817663 () Bool)

(assert (=> b!877455 m!817663))

(declare-fun m!817665 () Bool)

(assert (=> b!877455 m!817665))

(declare-fun m!817667 () Bool)

(assert (=> b!877455 m!817667))

(declare-fun m!817669 () Bool)

(assert (=> b!877460 m!817669))

(declare-fun m!817671 () Bool)

(assert (=> b!877457 m!817671))

(declare-fun m!817673 () Bool)

(assert (=> b!877462 m!817673))

(check-sat b_and!25065 (not b!877462) (not mapNonEmpty!27765) (not start!74500) (not b_next!15189) tp_is_empty!17433 (not b!877456) (not b!877457) (not b!877455) (not b!877460))
(check-sat b_and!25065 (not b_next!15189))
