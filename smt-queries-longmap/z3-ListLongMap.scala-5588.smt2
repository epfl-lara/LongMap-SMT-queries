; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73294 () Bool)

(assert start!73294)

(declare-fun b_free!14227 () Bool)

(declare-fun b_next!14227 () Bool)

(assert (=> start!73294 (= b_free!14227 (not b_next!14227))))

(declare-fun tp!50186 () Bool)

(declare-fun b_and!23557 () Bool)

(assert (=> start!73294 (= tp!50186 b_and!23557)))

(declare-fun b!855032 () Bool)

(declare-fun res!580730 () Bool)

(declare-fun e!476698 () Bool)

(assert (=> b!855032 (=> (not res!580730) (not e!476698))))

(declare-datatypes ((array!48909 0))(
  ( (array!48910 (arr!23486 (Array (_ BitVec 32) (_ BitVec 64))) (size!23928 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48909)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48909 (_ BitVec 32)) Bool)

(assert (=> b!855032 (= res!580730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855033 () Bool)

(declare-fun e!476696 () Bool)

(declare-fun tp_is_empty!16363 () Bool)

(assert (=> b!855033 (= e!476696 tp_is_empty!16363)))

(declare-fun b!855034 () Bool)

(declare-fun res!580729 () Bool)

(assert (=> b!855034 (=> (not res!580729) (not e!476698))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!855034 (= res!580729 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23928 _keys!868))))))

(declare-fun mapNonEmpty!26144 () Bool)

(declare-fun mapRes!26144 () Bool)

(declare-fun tp!50185 () Bool)

(declare-fun e!476700 () Bool)

(assert (=> mapNonEmpty!26144 (= mapRes!26144 (and tp!50185 e!476700))))

(declare-datatypes ((V!26865 0))(
  ( (V!26866 (val!8229 Int)) )
))
(declare-datatypes ((ValueCell!7742 0))(
  ( (ValueCellFull!7742 (v!10648 V!26865)) (EmptyCell!7742) )
))
(declare-fun mapValue!26144 () ValueCell!7742)

(declare-fun mapRest!26144 () (Array (_ BitVec 32) ValueCell!7742))

(declare-datatypes ((array!48911 0))(
  ( (array!48912 (arr!23487 (Array (_ BitVec 32) ValueCell!7742)) (size!23929 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48911)

(declare-fun mapKey!26144 () (_ BitVec 32))

(assert (=> mapNonEmpty!26144 (= (arr!23487 _values!688) (store mapRest!26144 mapKey!26144 mapValue!26144))))

(declare-fun b!855035 () Bool)

(assert (=> b!855035 (= e!476700 tp_is_empty!16363)))

(declare-fun b!855036 () Bool)

(assert (=> b!855036 (= e!476698 false)))

(declare-datatypes ((tuple2!10854 0))(
  ( (tuple2!10855 (_1!5438 (_ BitVec 64)) (_2!5438 V!26865)) )
))
(declare-datatypes ((List!16664 0))(
  ( (Nil!16661) (Cons!16660 (h!17791 tuple2!10854) (t!23296 List!16664)) )
))
(declare-datatypes ((ListLongMap!9613 0))(
  ( (ListLongMap!9614 (toList!4822 List!16664)) )
))
(declare-fun lt!385432 () ListLongMap!9613)

(declare-fun v!557 () V!26865)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26865)

(declare-fun zeroValue!654 () V!26865)

(declare-fun getCurrentListMapNoExtraKeys!2829 (array!48909 array!48911 (_ BitVec 32) (_ BitVec 32) V!26865 V!26865 (_ BitVec 32) Int) ListLongMap!9613)

(assert (=> b!855036 (= lt!385432 (getCurrentListMapNoExtraKeys!2829 _keys!868 (array!48912 (store (arr!23487 _values!688) i!612 (ValueCellFull!7742 v!557)) (size!23929 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385433 () ListLongMap!9613)

(assert (=> b!855036 (= lt!385433 (getCurrentListMapNoExtraKeys!2829 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26144 () Bool)

(assert (=> mapIsEmpty!26144 mapRes!26144))

(declare-fun res!580726 () Bool)

(assert (=> start!73294 (=> (not res!580726) (not e!476698))))

(assert (=> start!73294 (= res!580726 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23928 _keys!868))))))

(assert (=> start!73294 e!476698))

(assert (=> start!73294 tp_is_empty!16363))

(assert (=> start!73294 true))

(assert (=> start!73294 tp!50186))

(declare-fun array_inv!18684 (array!48909) Bool)

(assert (=> start!73294 (array_inv!18684 _keys!868)))

(declare-fun e!476697 () Bool)

(declare-fun array_inv!18685 (array!48911) Bool)

(assert (=> start!73294 (and (array_inv!18685 _values!688) e!476697)))

(declare-fun b!855037 () Bool)

(assert (=> b!855037 (= e!476697 (and e!476696 mapRes!26144))))

(declare-fun condMapEmpty!26144 () Bool)

(declare-fun mapDefault!26144 () ValueCell!7742)

(assert (=> b!855037 (= condMapEmpty!26144 (= (arr!23487 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7742)) mapDefault!26144)))))

(declare-fun b!855038 () Bool)

(declare-fun res!580725 () Bool)

(assert (=> b!855038 (=> (not res!580725) (not e!476698))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!855038 (= res!580725 (and (= (select (arr!23486 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855039 () Bool)

(declare-fun res!580724 () Bool)

(assert (=> b!855039 (=> (not res!580724) (not e!476698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855039 (= res!580724 (validKeyInArray!0 k0!854))))

(declare-fun b!855040 () Bool)

(declare-fun res!580728 () Bool)

(assert (=> b!855040 (=> (not res!580728) (not e!476698))))

(declare-datatypes ((List!16665 0))(
  ( (Nil!16662) (Cons!16661 (h!17792 (_ BitVec 64)) (t!23297 List!16665)) )
))
(declare-fun arrayNoDuplicates!0 (array!48909 (_ BitVec 32) List!16665) Bool)

(assert (=> b!855040 (= res!580728 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16662))))

(declare-fun b!855041 () Bool)

(declare-fun res!580731 () Bool)

(assert (=> b!855041 (=> (not res!580731) (not e!476698))))

(assert (=> b!855041 (= res!580731 (and (= (size!23929 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23928 _keys!868) (size!23929 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855042 () Bool)

(declare-fun res!580727 () Bool)

(assert (=> b!855042 (=> (not res!580727) (not e!476698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855042 (= res!580727 (validMask!0 mask!1196))))

(assert (= (and start!73294 res!580726) b!855042))

(assert (= (and b!855042 res!580727) b!855041))

(assert (= (and b!855041 res!580731) b!855032))

(assert (= (and b!855032 res!580730) b!855040))

(assert (= (and b!855040 res!580728) b!855034))

(assert (= (and b!855034 res!580729) b!855039))

(assert (= (and b!855039 res!580724) b!855038))

(assert (= (and b!855038 res!580725) b!855036))

(assert (= (and b!855037 condMapEmpty!26144) mapIsEmpty!26144))

(assert (= (and b!855037 (not condMapEmpty!26144)) mapNonEmpty!26144))

(get-info :version)

(assert (= (and mapNonEmpty!26144 ((_ is ValueCellFull!7742) mapValue!26144)) b!855035))

(assert (= (and b!855037 ((_ is ValueCellFull!7742) mapDefault!26144)) b!855033))

(assert (= start!73294 b!855037))

(declare-fun m!795771 () Bool)

(assert (=> b!855038 m!795771))

(declare-fun m!795773 () Bool)

(assert (=> b!855032 m!795773))

(declare-fun m!795775 () Bool)

(assert (=> b!855039 m!795775))

(declare-fun m!795777 () Bool)

(assert (=> b!855036 m!795777))

(declare-fun m!795779 () Bool)

(assert (=> b!855036 m!795779))

(declare-fun m!795781 () Bool)

(assert (=> b!855036 m!795781))

(declare-fun m!795783 () Bool)

(assert (=> b!855042 m!795783))

(declare-fun m!795785 () Bool)

(assert (=> start!73294 m!795785))

(declare-fun m!795787 () Bool)

(assert (=> start!73294 m!795787))

(declare-fun m!795789 () Bool)

(assert (=> mapNonEmpty!26144 m!795789))

(declare-fun m!795791 () Bool)

(assert (=> b!855040 m!795791))

(check-sat (not b!855032) (not b!855036) (not mapNonEmpty!26144) tp_is_empty!16363 b_and!23557 (not b!855040) (not b!855042) (not b!855039) (not b_next!14227) (not start!73294))
(check-sat b_and!23557 (not b_next!14227))
