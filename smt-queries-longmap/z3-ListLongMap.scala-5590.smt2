; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73326 () Bool)

(assert start!73326)

(declare-fun b_free!14241 () Bool)

(declare-fun b_next!14241 () Bool)

(assert (=> start!73326 (= b_free!14241 (not b_next!14241))))

(declare-fun tp!50226 () Bool)

(declare-fun b_and!23597 () Bool)

(assert (=> start!73326 (= tp!50226 b_and!23597)))

(declare-fun mapIsEmpty!26165 () Bool)

(declare-fun mapRes!26165 () Bool)

(assert (=> mapIsEmpty!26165 mapRes!26165))

(declare-fun b!855502 () Bool)

(declare-fun e!476951 () Bool)

(declare-fun tp_is_empty!16377 () Bool)

(assert (=> b!855502 (= e!476951 tp_is_empty!16377)))

(declare-fun res!581009 () Bool)

(declare-fun e!476953 () Bool)

(assert (=> start!73326 (=> (not res!581009) (not e!476953))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48950 0))(
  ( (array!48951 (arr!23506 (Array (_ BitVec 32) (_ BitVec 64))) (size!23946 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48950)

(assert (=> start!73326 (= res!581009 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23946 _keys!868))))))

(assert (=> start!73326 e!476953))

(assert (=> start!73326 tp_is_empty!16377))

(assert (=> start!73326 true))

(assert (=> start!73326 tp!50226))

(declare-fun array_inv!18624 (array!48950) Bool)

(assert (=> start!73326 (array_inv!18624 _keys!868)))

(declare-datatypes ((V!26883 0))(
  ( (V!26884 (val!8236 Int)) )
))
(declare-datatypes ((ValueCell!7749 0))(
  ( (ValueCellFull!7749 (v!10661 V!26883)) (EmptyCell!7749) )
))
(declare-datatypes ((array!48952 0))(
  ( (array!48953 (arr!23507 (Array (_ BitVec 32) ValueCell!7749)) (size!23947 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48952)

(declare-fun e!476952 () Bool)

(declare-fun array_inv!18625 (array!48952) Bool)

(assert (=> start!73326 (and (array_inv!18625 _values!688) e!476952)))

(declare-fun b!855503 () Bool)

(declare-fun e!476950 () Bool)

(assert (=> b!855503 (= e!476950 tp_is_empty!16377)))

(declare-fun b!855504 () Bool)

(declare-fun res!581002 () Bool)

(assert (=> b!855504 (=> (not res!581002) (not e!476953))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48950 (_ BitVec 32)) Bool)

(assert (=> b!855504 (= res!581002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855505 () Bool)

(declare-fun res!581004 () Bool)

(assert (=> b!855505 (=> (not res!581004) (not e!476953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855505 (= res!581004 (validMask!0 mask!1196))))

(declare-fun b!855506 () Bool)

(declare-fun res!581003 () Bool)

(assert (=> b!855506 (=> (not res!581003) (not e!476953))))

(declare-datatypes ((List!16666 0))(
  ( (Nil!16663) (Cons!16662 (h!17793 (_ BitVec 64)) (t!23307 List!16666)) )
))
(declare-fun arrayNoDuplicates!0 (array!48950 (_ BitVec 32) List!16666) Bool)

(assert (=> b!855506 (= res!581003 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16663))))

(declare-fun b!855507 () Bool)

(declare-fun res!581006 () Bool)

(assert (=> b!855507 (=> (not res!581006) (not e!476953))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!855507 (= res!581006 (and (= (select (arr!23506 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26165 () Bool)

(declare-fun tp!50227 () Bool)

(assert (=> mapNonEmpty!26165 (= mapRes!26165 (and tp!50227 e!476951))))

(declare-fun mapKey!26165 () (_ BitVec 32))

(declare-fun mapValue!26165 () ValueCell!7749)

(declare-fun mapRest!26165 () (Array (_ BitVec 32) ValueCell!7749))

(assert (=> mapNonEmpty!26165 (= (arr!23507 _values!688) (store mapRest!26165 mapKey!26165 mapValue!26165))))

(declare-fun b!855508 () Bool)

(declare-fun res!581005 () Bool)

(assert (=> b!855508 (=> (not res!581005) (not e!476953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855508 (= res!581005 (validKeyInArray!0 k0!854))))

(declare-fun b!855509 () Bool)

(assert (=> b!855509 (= e!476953 false)))

(declare-fun v!557 () V!26883)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10854 0))(
  ( (tuple2!10855 (_1!5438 (_ BitVec 64)) (_2!5438 V!26883)) )
))
(declare-datatypes ((List!16667 0))(
  ( (Nil!16664) (Cons!16663 (h!17794 tuple2!10854) (t!23308 List!16667)) )
))
(declare-datatypes ((ListLongMap!9623 0))(
  ( (ListLongMap!9624 (toList!4827 List!16667)) )
))
(declare-fun lt!385710 () ListLongMap!9623)

(declare-fun minValue!654 () V!26883)

(declare-fun zeroValue!654 () V!26883)

(declare-fun getCurrentListMapNoExtraKeys!2808 (array!48950 array!48952 (_ BitVec 32) (_ BitVec 32) V!26883 V!26883 (_ BitVec 32) Int) ListLongMap!9623)

(assert (=> b!855509 (= lt!385710 (getCurrentListMapNoExtraKeys!2808 _keys!868 (array!48953 (store (arr!23507 _values!688) i!612 (ValueCellFull!7749 v!557)) (size!23947 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385711 () ListLongMap!9623)

(assert (=> b!855509 (= lt!385711 (getCurrentListMapNoExtraKeys!2808 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855510 () Bool)

(declare-fun res!581008 () Bool)

(assert (=> b!855510 (=> (not res!581008) (not e!476953))))

(assert (=> b!855510 (= res!581008 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23946 _keys!868))))))

(declare-fun b!855511 () Bool)

(assert (=> b!855511 (= e!476952 (and e!476950 mapRes!26165))))

(declare-fun condMapEmpty!26165 () Bool)

(declare-fun mapDefault!26165 () ValueCell!7749)

(assert (=> b!855511 (= condMapEmpty!26165 (= (arr!23507 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7749)) mapDefault!26165)))))

(declare-fun b!855512 () Bool)

(declare-fun res!581007 () Bool)

(assert (=> b!855512 (=> (not res!581007) (not e!476953))))

(assert (=> b!855512 (= res!581007 (and (= (size!23947 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23946 _keys!868) (size!23947 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73326 res!581009) b!855505))

(assert (= (and b!855505 res!581004) b!855512))

(assert (= (and b!855512 res!581007) b!855504))

(assert (= (and b!855504 res!581002) b!855506))

(assert (= (and b!855506 res!581003) b!855510))

(assert (= (and b!855510 res!581008) b!855508))

(assert (= (and b!855508 res!581005) b!855507))

(assert (= (and b!855507 res!581006) b!855509))

(assert (= (and b!855511 condMapEmpty!26165) mapIsEmpty!26165))

(assert (= (and b!855511 (not condMapEmpty!26165)) mapNonEmpty!26165))

(get-info :version)

(assert (= (and mapNonEmpty!26165 ((_ is ValueCellFull!7749) mapValue!26165)) b!855502))

(assert (= (and b!855511 ((_ is ValueCellFull!7749) mapDefault!26165)) b!855503))

(assert (= start!73326 b!855511))

(declare-fun m!796683 () Bool)

(assert (=> b!855504 m!796683))

(declare-fun m!796685 () Bool)

(assert (=> b!855505 m!796685))

(declare-fun m!796687 () Bool)

(assert (=> start!73326 m!796687))

(declare-fun m!796689 () Bool)

(assert (=> start!73326 m!796689))

(declare-fun m!796691 () Bool)

(assert (=> b!855509 m!796691))

(declare-fun m!796693 () Bool)

(assert (=> b!855509 m!796693))

(declare-fun m!796695 () Bool)

(assert (=> b!855509 m!796695))

(declare-fun m!796697 () Bool)

(assert (=> mapNonEmpty!26165 m!796697))

(declare-fun m!796699 () Bool)

(assert (=> b!855506 m!796699))

(declare-fun m!796701 () Bool)

(assert (=> b!855507 m!796701))

(declare-fun m!796703 () Bool)

(assert (=> b!855508 m!796703))

(check-sat (not b!855505) (not mapNonEmpty!26165) b_and!23597 (not b!855504) (not b_next!14241) (not b!855508) (not b!855509) tp_is_empty!16377 (not b!855506) (not start!73326))
(check-sat b_and!23597 (not b_next!14241))
