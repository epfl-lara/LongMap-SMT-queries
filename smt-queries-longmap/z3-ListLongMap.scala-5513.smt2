; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72844 () Bool)

(assert start!72844)

(declare-fun b_free!13777 () Bool)

(declare-fun b_next!13777 () Bool)

(assert (=> start!72844 (= b_free!13777 (not b_next!13777))))

(declare-fun tp!48835 () Bool)

(declare-fun b_and!22837 () Bool)

(assert (=> start!72844 (= tp!48835 b_and!22837)))

(declare-fun b!845465 () Bool)

(declare-fun res!574428 () Bool)

(declare-fun e!471936 () Bool)

(assert (=> b!845465 (=> (not res!574428) (not e!471936))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48045 0))(
  ( (array!48046 (arr!23054 (Array (_ BitVec 32) (_ BitVec 64))) (size!23496 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48045)

(declare-datatypes ((V!26265 0))(
  ( (V!26266 (val!8004 Int)) )
))
(declare-datatypes ((ValueCell!7517 0))(
  ( (ValueCellFull!7517 (v!10423 V!26265)) (EmptyCell!7517) )
))
(declare-datatypes ((array!48047 0))(
  ( (array!48048 (arr!23055 (Array (_ BitVec 32) ValueCell!7517)) (size!23497 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48047)

(assert (=> b!845465 (= res!574428 (and (= (size!23497 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23496 _keys!868) (size!23497 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25469 () Bool)

(declare-fun mapRes!25469 () Bool)

(declare-fun tp!48836 () Bool)

(declare-fun e!471939 () Bool)

(assert (=> mapNonEmpty!25469 (= mapRes!25469 (and tp!48836 e!471939))))

(declare-fun mapRest!25469 () (Array (_ BitVec 32) ValueCell!7517))

(declare-fun mapKey!25469 () (_ BitVec 32))

(declare-fun mapValue!25469 () ValueCell!7517)

(assert (=> mapNonEmpty!25469 (= (arr!23055 _values!688) (store mapRest!25469 mapKey!25469 mapValue!25469))))

(declare-fun b!845466 () Bool)

(declare-fun res!574427 () Bool)

(assert (=> b!845466 (=> (not res!574427) (not e!471936))))

(declare-datatypes ((List!16336 0))(
  ( (Nil!16333) (Cons!16332 (h!17463 (_ BitVec 64)) (t!22698 List!16336)) )
))
(declare-fun arrayNoDuplicates!0 (array!48045 (_ BitVec 32) List!16336) Bool)

(assert (=> b!845466 (= res!574427 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16333))))

(declare-fun b!845467 () Bool)

(declare-fun res!574431 () Bool)

(assert (=> b!845467 (=> (not res!574431) (not e!471936))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845467 (= res!574431 (validKeyInArray!0 k0!854))))

(declare-fun b!845468 () Bool)

(declare-fun e!471937 () Bool)

(declare-fun e!471938 () Bool)

(assert (=> b!845468 (= e!471937 (and e!471938 mapRes!25469))))

(declare-fun condMapEmpty!25469 () Bool)

(declare-fun mapDefault!25469 () ValueCell!7517)

(assert (=> b!845468 (= condMapEmpty!25469 (= (arr!23055 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7517)) mapDefault!25469)))))

(declare-fun res!574424 () Bool)

(assert (=> start!72844 (=> (not res!574424) (not e!471936))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72844 (= res!574424 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23496 _keys!868))))))

(assert (=> start!72844 e!471936))

(assert (=> start!72844 true))

(assert (=> start!72844 tp!48835))

(declare-fun array_inv!18392 (array!48045) Bool)

(assert (=> start!72844 (array_inv!18392 _keys!868)))

(declare-fun array_inv!18393 (array!48047) Bool)

(assert (=> start!72844 (and (array_inv!18393 _values!688) e!471937)))

(declare-fun tp_is_empty!15913 () Bool)

(assert (=> start!72844 tp_is_empty!15913))

(declare-fun b!845469 () Bool)

(declare-fun res!574430 () Bool)

(assert (=> b!845469 (=> (not res!574430) (not e!471936))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!845469 (= res!574430 (and (= (select (arr!23054 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!845470 () Bool)

(declare-fun res!574426 () Bool)

(assert (=> b!845470 (=> (not res!574426) (not e!471936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48045 (_ BitVec 32)) Bool)

(assert (=> b!845470 (= res!574426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!845471 () Bool)

(assert (=> b!845471 (= e!471938 tp_is_empty!15913)))

(declare-fun b!845472 () Bool)

(assert (=> b!845472 (= e!471936 false)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10476 0))(
  ( (tuple2!10477 (_1!5249 (_ BitVec 64)) (_2!5249 V!26265)) )
))
(declare-datatypes ((List!16337 0))(
  ( (Nil!16334) (Cons!16333 (h!17464 tuple2!10476) (t!22699 List!16337)) )
))
(declare-datatypes ((ListLongMap!9235 0))(
  ( (ListLongMap!9236 (toList!4633 List!16337)) )
))
(declare-fun lt!381200 () ListLongMap!9235)

(declare-fun minValue!654 () V!26265)

(declare-fun zeroValue!654 () V!26265)

(declare-fun getCurrentListMapNoExtraKeys!2647 (array!48045 array!48047 (_ BitVec 32) (_ BitVec 32) V!26265 V!26265 (_ BitVec 32) Int) ListLongMap!9235)

(assert (=> b!845472 (= lt!381200 (getCurrentListMapNoExtraKeys!2647 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845473 () Bool)

(declare-fun res!574429 () Bool)

(assert (=> b!845473 (=> (not res!574429) (not e!471936))))

(assert (=> b!845473 (= res!574429 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23496 _keys!868))))))

(declare-fun mapIsEmpty!25469 () Bool)

(assert (=> mapIsEmpty!25469 mapRes!25469))

(declare-fun b!845474 () Bool)

(assert (=> b!845474 (= e!471939 tp_is_empty!15913)))

(declare-fun b!845475 () Bool)

(declare-fun res!574425 () Bool)

(assert (=> b!845475 (=> (not res!574425) (not e!471936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845475 (= res!574425 (validMask!0 mask!1196))))

(assert (= (and start!72844 res!574424) b!845475))

(assert (= (and b!845475 res!574425) b!845465))

(assert (= (and b!845465 res!574428) b!845470))

(assert (= (and b!845470 res!574426) b!845466))

(assert (= (and b!845466 res!574427) b!845473))

(assert (= (and b!845473 res!574429) b!845467))

(assert (= (and b!845467 res!574431) b!845469))

(assert (= (and b!845469 res!574430) b!845472))

(assert (= (and b!845468 condMapEmpty!25469) mapIsEmpty!25469))

(assert (= (and b!845468 (not condMapEmpty!25469)) mapNonEmpty!25469))

(get-info :version)

(assert (= (and mapNonEmpty!25469 ((_ is ValueCellFull!7517) mapValue!25469)) b!845474))

(assert (= (and b!845468 ((_ is ValueCellFull!7517) mapDefault!25469)) b!845471))

(assert (= start!72844 b!845468))

(declare-fun m!786641 () Bool)

(assert (=> b!845469 m!786641))

(declare-fun m!786643 () Bool)

(assert (=> b!845475 m!786643))

(declare-fun m!786645 () Bool)

(assert (=> start!72844 m!786645))

(declare-fun m!786647 () Bool)

(assert (=> start!72844 m!786647))

(declare-fun m!786649 () Bool)

(assert (=> b!845467 m!786649))

(declare-fun m!786651 () Bool)

(assert (=> b!845472 m!786651))

(declare-fun m!786653 () Bool)

(assert (=> mapNonEmpty!25469 m!786653))

(declare-fun m!786655 () Bool)

(assert (=> b!845470 m!786655))

(declare-fun m!786657 () Bool)

(assert (=> b!845466 m!786657))

(check-sat (not start!72844) (not b!845475) (not b_next!13777) (not mapNonEmpty!25469) tp_is_empty!15913 b_and!22837 (not b!845466) (not b!845470) (not b!845467) (not b!845472))
(check-sat b_and!22837 (not b_next!13777))
