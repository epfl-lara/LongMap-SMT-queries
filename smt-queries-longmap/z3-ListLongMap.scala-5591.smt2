; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73498 () Bool)

(assert start!73498)

(declare-fun b_free!14245 () Bool)

(declare-fun b_next!14245 () Bool)

(assert (=> start!73498 (= b_free!14245 (not b_next!14245))))

(declare-fun tp!50239 () Bool)

(declare-fun b_and!23611 () Bool)

(assert (=> start!73498 (= tp!50239 b_and!23611)))

(declare-fun b!856471 () Bool)

(declare-fun res!581394 () Bool)

(declare-fun e!477561 () Bool)

(assert (=> b!856471 (=> (not res!581394) (not e!477561))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856471 (= res!581394 (validKeyInArray!0 k0!854))))

(declare-fun b!856472 () Bool)

(declare-fun res!581399 () Bool)

(assert (=> b!856472 (=> (not res!581399) (not e!477561))))

(declare-datatypes ((array!49005 0))(
  ( (array!49006 (arr!23529 (Array (_ BitVec 32) (_ BitVec 64))) (size!23970 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49005)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49005 (_ BitVec 32)) Bool)

(assert (=> b!856472 (= res!581399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856473 () Bool)

(declare-fun e!477565 () Bool)

(declare-fun tp_is_empty!16381 () Bool)

(assert (=> b!856473 (= e!477565 tp_is_empty!16381)))

(declare-fun b!856474 () Bool)

(assert (=> b!856474 (= e!477561 false)))

(declare-datatypes ((V!26889 0))(
  ( (V!26890 (val!8238 Int)) )
))
(declare-fun v!557 () V!26889)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10778 0))(
  ( (tuple2!10779 (_1!5400 (_ BitVec 64)) (_2!5400 V!26889)) )
))
(declare-datatypes ((List!16624 0))(
  ( (Nil!16621) (Cons!16620 (h!17757 tuple2!10778) (t!23257 List!16624)) )
))
(declare-datatypes ((ListLongMap!9549 0))(
  ( (ListLongMap!9550 (toList!4790 List!16624)) )
))
(declare-fun lt!386083 () ListLongMap!9549)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7751 0))(
  ( (ValueCellFull!7751 (v!10663 V!26889)) (EmptyCell!7751) )
))
(declare-datatypes ((array!49007 0))(
  ( (array!49008 (arr!23530 (Array (_ BitVec 32) ValueCell!7751)) (size!23971 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49007)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26889)

(declare-fun zeroValue!654 () V!26889)

(declare-fun getCurrentListMapNoExtraKeys!2846 (array!49005 array!49007 (_ BitVec 32) (_ BitVec 32) V!26889 V!26889 (_ BitVec 32) Int) ListLongMap!9549)

(assert (=> b!856474 (= lt!386083 (getCurrentListMapNoExtraKeys!2846 _keys!868 (array!49008 (store (arr!23530 _values!688) i!612 (ValueCellFull!7751 v!557)) (size!23971 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!386084 () ListLongMap!9549)

(assert (=> b!856474 (= lt!386084 (getCurrentListMapNoExtraKeys!2846 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856475 () Bool)

(declare-fun res!581400 () Bool)

(assert (=> b!856475 (=> (not res!581400) (not e!477561))))

(assert (=> b!856475 (= res!581400 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23970 _keys!868))))))

(declare-fun b!856476 () Bool)

(declare-fun res!581396 () Bool)

(assert (=> b!856476 (=> (not res!581396) (not e!477561))))

(assert (=> b!856476 (= res!581396 (and (= (size!23971 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23970 _keys!868) (size!23971 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856477 () Bool)

(declare-fun e!477562 () Bool)

(assert (=> b!856477 (= e!477562 tp_is_empty!16381)))

(declare-fun b!856478 () Bool)

(declare-fun res!581401 () Bool)

(assert (=> b!856478 (=> (not res!581401) (not e!477561))))

(assert (=> b!856478 (= res!581401 (and (= (select (arr!23529 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!26171 () Bool)

(declare-fun mapRes!26171 () Bool)

(assert (=> mapIsEmpty!26171 mapRes!26171))

(declare-fun b!856480 () Bool)

(declare-fun res!581398 () Bool)

(assert (=> b!856480 (=> (not res!581398) (not e!477561))))

(declare-datatypes ((List!16625 0))(
  ( (Nil!16622) (Cons!16621 (h!17758 (_ BitVec 64)) (t!23258 List!16625)) )
))
(declare-fun arrayNoDuplicates!0 (array!49005 (_ BitVec 32) List!16625) Bool)

(assert (=> b!856480 (= res!581398 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16622))))

(declare-fun mapNonEmpty!26171 () Bool)

(declare-fun tp!50240 () Bool)

(assert (=> mapNonEmpty!26171 (= mapRes!26171 (and tp!50240 e!477565))))

(declare-fun mapKey!26171 () (_ BitVec 32))

(declare-fun mapRest!26171 () (Array (_ BitVec 32) ValueCell!7751))

(declare-fun mapValue!26171 () ValueCell!7751)

(assert (=> mapNonEmpty!26171 (= (arr!23530 _values!688) (store mapRest!26171 mapKey!26171 mapValue!26171))))

(declare-fun b!856481 () Bool)

(declare-fun res!581397 () Bool)

(assert (=> b!856481 (=> (not res!581397) (not e!477561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856481 (= res!581397 (validMask!0 mask!1196))))

(declare-fun b!856479 () Bool)

(declare-fun e!477564 () Bool)

(assert (=> b!856479 (= e!477564 (and e!477562 mapRes!26171))))

(declare-fun condMapEmpty!26171 () Bool)

(declare-fun mapDefault!26171 () ValueCell!7751)

(assert (=> b!856479 (= condMapEmpty!26171 (= (arr!23530 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7751)) mapDefault!26171)))))

(declare-fun res!581395 () Bool)

(assert (=> start!73498 (=> (not res!581395) (not e!477561))))

(assert (=> start!73498 (= res!581395 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23970 _keys!868))))))

(assert (=> start!73498 e!477561))

(assert (=> start!73498 tp_is_empty!16381))

(assert (=> start!73498 true))

(assert (=> start!73498 tp!50239))

(declare-fun array_inv!18692 (array!49005) Bool)

(assert (=> start!73498 (array_inv!18692 _keys!868)))

(declare-fun array_inv!18693 (array!49007) Bool)

(assert (=> start!73498 (and (array_inv!18693 _values!688) e!477564)))

(assert (= (and start!73498 res!581395) b!856481))

(assert (= (and b!856481 res!581397) b!856476))

(assert (= (and b!856476 res!581396) b!856472))

(assert (= (and b!856472 res!581399) b!856480))

(assert (= (and b!856480 res!581398) b!856475))

(assert (= (and b!856475 res!581400) b!856471))

(assert (= (and b!856471 res!581394) b!856478))

(assert (= (and b!856478 res!581401) b!856474))

(assert (= (and b!856479 condMapEmpty!26171) mapIsEmpty!26171))

(assert (= (and b!856479 (not condMapEmpty!26171)) mapNonEmpty!26171))

(get-info :version)

(assert (= (and mapNonEmpty!26171 ((_ is ValueCellFull!7751) mapValue!26171)) b!856473))

(assert (= (and b!856479 ((_ is ValueCellFull!7751) mapDefault!26171)) b!856477))

(assert (= start!73498 b!856479))

(declare-fun m!798017 () Bool)

(assert (=> start!73498 m!798017))

(declare-fun m!798019 () Bool)

(assert (=> start!73498 m!798019))

(declare-fun m!798021 () Bool)

(assert (=> b!856474 m!798021))

(declare-fun m!798023 () Bool)

(assert (=> b!856474 m!798023))

(declare-fun m!798025 () Bool)

(assert (=> b!856474 m!798025))

(declare-fun m!798027 () Bool)

(assert (=> b!856480 m!798027))

(declare-fun m!798029 () Bool)

(assert (=> b!856471 m!798029))

(declare-fun m!798031 () Bool)

(assert (=> mapNonEmpty!26171 m!798031))

(declare-fun m!798033 () Bool)

(assert (=> b!856481 m!798033))

(declare-fun m!798035 () Bool)

(assert (=> b!856472 m!798035))

(declare-fun m!798037 () Bool)

(assert (=> b!856478 m!798037))

(check-sat (not b!856481) (not b!856474) tp_is_empty!16381 b_and!23611 (not b!856472) (not b!856480) (not b_next!14245) (not b!856471) (not mapNonEmpty!26171) (not start!73498))
(check-sat b_and!23611 (not b_next!14245))
