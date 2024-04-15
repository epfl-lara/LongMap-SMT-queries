; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72856 () Bool)

(assert start!72856)

(declare-fun b_free!13789 () Bool)

(declare-fun b_next!13789 () Bool)

(assert (=> start!72856 (= b_free!13789 (not b_next!13789))))

(declare-fun tp!48872 () Bool)

(declare-fun b_and!22849 () Bool)

(assert (=> start!72856 (= tp!48872 b_and!22849)))

(declare-fun b!845663 () Bool)

(declare-fun e!472026 () Bool)

(assert (=> b!845663 (= e!472026 false)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26281 0))(
  ( (V!26282 (val!8010 Int)) )
))
(declare-datatypes ((tuple2!10488 0))(
  ( (tuple2!10489 (_1!5255 (_ BitVec 64)) (_2!5255 V!26281)) )
))
(declare-datatypes ((List!16348 0))(
  ( (Nil!16345) (Cons!16344 (h!17475 tuple2!10488) (t!22710 List!16348)) )
))
(declare-datatypes ((ListLongMap!9247 0))(
  ( (ListLongMap!9248 (toList!4639 List!16348)) )
))
(declare-fun lt!381218 () ListLongMap!9247)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48069 0))(
  ( (array!48070 (arr!23066 (Array (_ BitVec 32) (_ BitVec 64))) (size!23508 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48069)

(declare-datatypes ((ValueCell!7523 0))(
  ( (ValueCellFull!7523 (v!10429 V!26281)) (EmptyCell!7523) )
))
(declare-datatypes ((array!48071 0))(
  ( (array!48072 (arr!23067 (Array (_ BitVec 32) ValueCell!7523)) (size!23509 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48071)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26281)

(declare-fun zeroValue!654 () V!26281)

(declare-fun getCurrentListMapNoExtraKeys!2653 (array!48069 array!48071 (_ BitVec 32) (_ BitVec 32) V!26281 V!26281 (_ BitVec 32) Int) ListLongMap!9247)

(assert (=> b!845663 (= lt!381218 (getCurrentListMapNoExtraKeys!2653 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!845664 () Bool)

(declare-fun res!574574 () Bool)

(assert (=> b!845664 (=> (not res!574574) (not e!472026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845664 (= res!574574 (validMask!0 mask!1196))))

(declare-fun b!845665 () Bool)

(declare-fun res!574569 () Bool)

(assert (=> b!845665 (=> (not res!574569) (not e!472026))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!845665 (= res!574569 (and (= (select (arr!23066 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!845666 () Bool)

(declare-fun e!472027 () Bool)

(declare-fun tp_is_empty!15925 () Bool)

(assert (=> b!845666 (= e!472027 tp_is_empty!15925)))

(declare-fun b!845667 () Bool)

(declare-fun res!574568 () Bool)

(assert (=> b!845667 (=> (not res!574568) (not e!472026))))

(declare-datatypes ((List!16349 0))(
  ( (Nil!16346) (Cons!16345 (h!17476 (_ BitVec 64)) (t!22711 List!16349)) )
))
(declare-fun arrayNoDuplicates!0 (array!48069 (_ BitVec 32) List!16349) Bool)

(assert (=> b!845667 (= res!574568 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16346))))

(declare-fun b!845668 () Bool)

(declare-fun res!574575 () Bool)

(assert (=> b!845668 (=> (not res!574575) (not e!472026))))

(assert (=> b!845668 (= res!574575 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23508 _keys!868))))))

(declare-fun res!574570 () Bool)

(assert (=> start!72856 (=> (not res!574570) (not e!472026))))

(assert (=> start!72856 (= res!574570 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23508 _keys!868))))))

(assert (=> start!72856 e!472026))

(assert (=> start!72856 true))

(assert (=> start!72856 tp!48872))

(declare-fun array_inv!18402 (array!48069) Bool)

(assert (=> start!72856 (array_inv!18402 _keys!868)))

(declare-fun e!472029 () Bool)

(declare-fun array_inv!18403 (array!48071) Bool)

(assert (=> start!72856 (and (array_inv!18403 _values!688) e!472029)))

(assert (=> start!72856 tp_is_empty!15925))

(declare-fun b!845669 () Bool)

(declare-fun res!574571 () Bool)

(assert (=> b!845669 (=> (not res!574571) (not e!472026))))

(assert (=> b!845669 (= res!574571 (and (= (size!23509 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23508 _keys!868) (size!23509 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!845670 () Bool)

(declare-fun res!574573 () Bool)

(assert (=> b!845670 (=> (not res!574573) (not e!472026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48069 (_ BitVec 32)) Bool)

(assert (=> b!845670 (= res!574573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25487 () Bool)

(declare-fun mapRes!25487 () Bool)

(assert (=> mapIsEmpty!25487 mapRes!25487))

(declare-fun b!845671 () Bool)

(declare-fun e!472025 () Bool)

(assert (=> b!845671 (= e!472025 tp_is_empty!15925)))

(declare-fun mapNonEmpty!25487 () Bool)

(declare-fun tp!48871 () Bool)

(assert (=> mapNonEmpty!25487 (= mapRes!25487 (and tp!48871 e!472027))))

(declare-fun mapRest!25487 () (Array (_ BitVec 32) ValueCell!7523))

(declare-fun mapValue!25487 () ValueCell!7523)

(declare-fun mapKey!25487 () (_ BitVec 32))

(assert (=> mapNonEmpty!25487 (= (arr!23067 _values!688) (store mapRest!25487 mapKey!25487 mapValue!25487))))

(declare-fun b!845672 () Bool)

(declare-fun res!574572 () Bool)

(assert (=> b!845672 (=> (not res!574572) (not e!472026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!845672 (= res!574572 (validKeyInArray!0 k0!854))))

(declare-fun b!845673 () Bool)

(assert (=> b!845673 (= e!472029 (and e!472025 mapRes!25487))))

(declare-fun condMapEmpty!25487 () Bool)

(declare-fun mapDefault!25487 () ValueCell!7523)

(assert (=> b!845673 (= condMapEmpty!25487 (= (arr!23067 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7523)) mapDefault!25487)))))

(assert (= (and start!72856 res!574570) b!845664))

(assert (= (and b!845664 res!574574) b!845669))

(assert (= (and b!845669 res!574571) b!845670))

(assert (= (and b!845670 res!574573) b!845667))

(assert (= (and b!845667 res!574568) b!845668))

(assert (= (and b!845668 res!574575) b!845672))

(assert (= (and b!845672 res!574572) b!845665))

(assert (= (and b!845665 res!574569) b!845663))

(assert (= (and b!845673 condMapEmpty!25487) mapIsEmpty!25487))

(assert (= (and b!845673 (not condMapEmpty!25487)) mapNonEmpty!25487))

(get-info :version)

(assert (= (and mapNonEmpty!25487 ((_ is ValueCellFull!7523) mapValue!25487)) b!845666))

(assert (= (and b!845673 ((_ is ValueCellFull!7523) mapDefault!25487)) b!845671))

(assert (= start!72856 b!845673))

(declare-fun m!786749 () Bool)

(assert (=> b!845670 m!786749))

(declare-fun m!786751 () Bool)

(assert (=> b!845664 m!786751))

(declare-fun m!786753 () Bool)

(assert (=> b!845663 m!786753))

(declare-fun m!786755 () Bool)

(assert (=> b!845665 m!786755))

(declare-fun m!786757 () Bool)

(assert (=> b!845672 m!786757))

(declare-fun m!786759 () Bool)

(assert (=> b!845667 m!786759))

(declare-fun m!786761 () Bool)

(assert (=> mapNonEmpty!25487 m!786761))

(declare-fun m!786763 () Bool)

(assert (=> start!72856 m!786763))

(declare-fun m!786765 () Bool)

(assert (=> start!72856 m!786765))

(check-sat (not b!845663) (not mapNonEmpty!25487) (not b!845667) (not b!845672) b_and!22849 tp_is_empty!15925 (not b!845670) (not start!72856) (not b!845664) (not b_next!13789))
(check-sat b_and!22849 (not b_next!13789))
