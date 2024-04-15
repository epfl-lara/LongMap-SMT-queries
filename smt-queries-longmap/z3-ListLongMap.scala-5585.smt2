; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73276 () Bool)

(assert start!73276)

(declare-fun b_free!14209 () Bool)

(declare-fun b_next!14209 () Bool)

(assert (=> start!73276 (= b_free!14209 (not b_next!14209))))

(declare-fun tp!50132 () Bool)

(declare-fun b_and!23539 () Bool)

(assert (=> start!73276 (= tp!50132 b_and!23539)))

(declare-fun b!854735 () Bool)

(declare-fun res!580514 () Bool)

(declare-fun e!476564 () Bool)

(assert (=> b!854735 (=> (not res!580514) (not e!476564))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854735 (= res!580514 (validMask!0 mask!1196))))

(declare-fun b!854736 () Bool)

(declare-fun res!580508 () Bool)

(assert (=> b!854736 (=> (not res!580508) (not e!476564))))

(declare-datatypes ((array!48873 0))(
  ( (array!48874 (arr!23468 (Array (_ BitVec 32) (_ BitVec 64))) (size!23910 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48873)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48873 (_ BitVec 32)) Bool)

(assert (=> b!854736 (= res!580508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854737 () Bool)

(declare-fun res!580509 () Bool)

(assert (=> b!854737 (=> (not res!580509) (not e!476564))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26841 0))(
  ( (V!26842 (val!8220 Int)) )
))
(declare-datatypes ((ValueCell!7733 0))(
  ( (ValueCellFull!7733 (v!10639 V!26841)) (EmptyCell!7733) )
))
(declare-datatypes ((array!48875 0))(
  ( (array!48876 (arr!23469 (Array (_ BitVec 32) ValueCell!7733)) (size!23911 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48875)

(assert (=> b!854737 (= res!580509 (and (= (size!23911 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23910 _keys!868) (size!23911 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!580515 () Bool)

(assert (=> start!73276 (=> (not res!580515) (not e!476564))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73276 (= res!580515 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23910 _keys!868))))))

(assert (=> start!73276 e!476564))

(declare-fun tp_is_empty!16345 () Bool)

(assert (=> start!73276 tp_is_empty!16345))

(assert (=> start!73276 true))

(assert (=> start!73276 tp!50132))

(declare-fun array_inv!18674 (array!48873) Bool)

(assert (=> start!73276 (array_inv!18674 _keys!868)))

(declare-fun e!476562 () Bool)

(declare-fun array_inv!18675 (array!48875) Bool)

(assert (=> start!73276 (and (array_inv!18675 _values!688) e!476562)))

(declare-fun b!854738 () Bool)

(declare-fun e!476563 () Bool)

(declare-fun mapRes!26117 () Bool)

(assert (=> b!854738 (= e!476562 (and e!476563 mapRes!26117))))

(declare-fun condMapEmpty!26117 () Bool)

(declare-fun mapDefault!26117 () ValueCell!7733)

(assert (=> b!854738 (= condMapEmpty!26117 (= (arr!23469 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7733)) mapDefault!26117)))))

(declare-fun mapIsEmpty!26117 () Bool)

(assert (=> mapIsEmpty!26117 mapRes!26117))

(declare-fun b!854739 () Bool)

(declare-fun res!580512 () Bool)

(assert (=> b!854739 (=> (not res!580512) (not e!476564))))

(declare-datatypes ((List!16649 0))(
  ( (Nil!16646) (Cons!16645 (h!17776 (_ BitVec 64)) (t!23281 List!16649)) )
))
(declare-fun arrayNoDuplicates!0 (array!48873 (_ BitVec 32) List!16649) Bool)

(assert (=> b!854739 (= res!580512 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16646))))

(declare-fun b!854740 () Bool)

(declare-fun e!476561 () Bool)

(assert (=> b!854740 (= e!476561 tp_is_empty!16345)))

(declare-fun b!854741 () Bool)

(declare-fun res!580511 () Bool)

(assert (=> b!854741 (=> (not res!580511) (not e!476564))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854741 (= res!580511 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23910 _keys!868))))))

(declare-fun b!854742 () Bool)

(assert (=> b!854742 (= e!476564 false)))

(declare-datatypes ((tuple2!10838 0))(
  ( (tuple2!10839 (_1!5430 (_ BitVec 64)) (_2!5430 V!26841)) )
))
(declare-datatypes ((List!16650 0))(
  ( (Nil!16647) (Cons!16646 (h!17777 tuple2!10838) (t!23282 List!16650)) )
))
(declare-datatypes ((ListLongMap!9597 0))(
  ( (ListLongMap!9598 (toList!4814 List!16650)) )
))
(declare-fun lt!385378 () ListLongMap!9597)

(declare-fun v!557 () V!26841)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26841)

(declare-fun zeroValue!654 () V!26841)

(declare-fun getCurrentListMapNoExtraKeys!2821 (array!48873 array!48875 (_ BitVec 32) (_ BitVec 32) V!26841 V!26841 (_ BitVec 32) Int) ListLongMap!9597)

(assert (=> b!854742 (= lt!385378 (getCurrentListMapNoExtraKeys!2821 _keys!868 (array!48876 (store (arr!23469 _values!688) i!612 (ValueCellFull!7733 v!557)) (size!23911 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385379 () ListLongMap!9597)

(assert (=> b!854742 (= lt!385379 (getCurrentListMapNoExtraKeys!2821 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854743 () Bool)

(declare-fun res!580510 () Bool)

(assert (=> b!854743 (=> (not res!580510) (not e!476564))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!854743 (= res!580510 (and (= (select (arr!23468 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!854744 () Bool)

(assert (=> b!854744 (= e!476563 tp_is_empty!16345)))

(declare-fun b!854745 () Bool)

(declare-fun res!580513 () Bool)

(assert (=> b!854745 (=> (not res!580513) (not e!476564))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854745 (= res!580513 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!26117 () Bool)

(declare-fun tp!50131 () Bool)

(assert (=> mapNonEmpty!26117 (= mapRes!26117 (and tp!50131 e!476561))))

(declare-fun mapValue!26117 () ValueCell!7733)

(declare-fun mapKey!26117 () (_ BitVec 32))

(declare-fun mapRest!26117 () (Array (_ BitVec 32) ValueCell!7733))

(assert (=> mapNonEmpty!26117 (= (arr!23469 _values!688) (store mapRest!26117 mapKey!26117 mapValue!26117))))

(assert (= (and start!73276 res!580515) b!854735))

(assert (= (and b!854735 res!580514) b!854737))

(assert (= (and b!854737 res!580509) b!854736))

(assert (= (and b!854736 res!580508) b!854739))

(assert (= (and b!854739 res!580512) b!854741))

(assert (= (and b!854741 res!580511) b!854745))

(assert (= (and b!854745 res!580513) b!854743))

(assert (= (and b!854743 res!580510) b!854742))

(assert (= (and b!854738 condMapEmpty!26117) mapIsEmpty!26117))

(assert (= (and b!854738 (not condMapEmpty!26117)) mapNonEmpty!26117))

(get-info :version)

(assert (= (and mapNonEmpty!26117 ((_ is ValueCellFull!7733) mapValue!26117)) b!854740))

(assert (= (and b!854738 ((_ is ValueCellFull!7733) mapDefault!26117)) b!854744))

(assert (= start!73276 b!854738))

(declare-fun m!795573 () Bool)

(assert (=> mapNonEmpty!26117 m!795573))

(declare-fun m!795575 () Bool)

(assert (=> b!854745 m!795575))

(declare-fun m!795577 () Bool)

(assert (=> b!854742 m!795577))

(declare-fun m!795579 () Bool)

(assert (=> b!854742 m!795579))

(declare-fun m!795581 () Bool)

(assert (=> b!854742 m!795581))

(declare-fun m!795583 () Bool)

(assert (=> b!854743 m!795583))

(declare-fun m!795585 () Bool)

(assert (=> b!854735 m!795585))

(declare-fun m!795587 () Bool)

(assert (=> b!854739 m!795587))

(declare-fun m!795589 () Bool)

(assert (=> start!73276 m!795589))

(declare-fun m!795591 () Bool)

(assert (=> start!73276 m!795591))

(declare-fun m!795593 () Bool)

(assert (=> b!854736 m!795593))

(check-sat (not b!854745) (not start!73276) (not b_next!14209) (not b!854735) b_and!23539 (not b!854742) (not mapNonEmpty!26117) tp_is_empty!16345 (not b!854736) (not b!854739))
(check-sat b_and!23539 (not b_next!14209))
