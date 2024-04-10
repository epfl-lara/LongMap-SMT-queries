; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73992 () Bool)

(assert start!73992)

(declare-fun b_free!14907 () Bool)

(declare-fun b_next!14907 () Bool)

(assert (=> start!73992 (= b_free!14907 (not b_next!14907))))

(declare-fun tp!52225 () Bool)

(declare-fun b_and!24659 () Bool)

(assert (=> start!73992 (= tp!52225 b_and!24659)))

(declare-fun b!869979 () Bool)

(declare-fun e!484463 () Bool)

(assert (=> b!869979 (= e!484463 (not true))))

(declare-datatypes ((V!27771 0))(
  ( (V!27772 (val!8569 Int)) )
))
(declare-fun v!557 () V!27771)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8082 0))(
  ( (ValueCellFull!8082 (v!10994 V!27771)) (EmptyCell!8082) )
))
(declare-datatypes ((array!50232 0))(
  ( (array!50233 (arr!24147 (Array (_ BitVec 32) ValueCell!8082)) (size!24587 (_ BitVec 32))) )
))
(declare-fun lt!394984 () array!50232)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50234 0))(
  ( (array!50235 (arr!24148 (Array (_ BitVec 32) (_ BitVec 64))) (size!24588 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50234)

(declare-fun _values!688 () array!50232)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!27771)

(declare-fun zeroValue!654 () V!27771)

(declare-datatypes ((tuple2!11386 0))(
  ( (tuple2!11387 (_1!5704 (_ BitVec 64)) (_2!5704 V!27771)) )
))
(declare-datatypes ((List!17177 0))(
  ( (Nil!17174) (Cons!17173 (h!18304 tuple2!11386) (t!24214 List!17177)) )
))
(declare-datatypes ((ListLongMap!10155 0))(
  ( (ListLongMap!10156 (toList!5093 List!17177)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3062 (array!50234 array!50232 (_ BitVec 32) (_ BitVec 32) V!27771 V!27771 (_ BitVec 32) Int) ListLongMap!10155)

(declare-fun +!2433 (ListLongMap!10155 tuple2!11386) ListLongMap!10155)

(assert (=> b!869979 (= (getCurrentListMapNoExtraKeys!3062 _keys!868 lt!394984 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2433 (getCurrentListMapNoExtraKeys!3062 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11387 k0!854 v!557)))))

(declare-datatypes ((Unit!29864 0))(
  ( (Unit!29865) )
))
(declare-fun lt!394983 () Unit!29864)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!627 (array!50234 array!50232 (_ BitVec 32) (_ BitVec 32) V!27771 V!27771 (_ BitVec 32) (_ BitVec 64) V!27771 (_ BitVec 32) Int) Unit!29864)

(assert (=> b!869979 (= lt!394983 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!627 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!869980 () Bool)

(declare-fun e!484461 () Bool)

(declare-fun tp_is_empty!17043 () Bool)

(assert (=> b!869980 (= e!484461 tp_is_empty!17043)))

(declare-fun b!869981 () Bool)

(declare-fun res!591258 () Bool)

(declare-fun e!484465 () Bool)

(assert (=> b!869981 (=> (not res!591258) (not e!484465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50234 (_ BitVec 32)) Bool)

(assert (=> b!869981 (= res!591258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!591259 () Bool)

(assert (=> start!73992 (=> (not res!591259) (not e!484465))))

(assert (=> start!73992 (= res!591259 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24588 _keys!868))))))

(assert (=> start!73992 e!484465))

(assert (=> start!73992 tp_is_empty!17043))

(assert (=> start!73992 true))

(assert (=> start!73992 tp!52225))

(declare-fun array_inv!19076 (array!50234) Bool)

(assert (=> start!73992 (array_inv!19076 _keys!868)))

(declare-fun e!484462 () Bool)

(declare-fun array_inv!19077 (array!50232) Bool)

(assert (=> start!73992 (and (array_inv!19077 _values!688) e!484462)))

(declare-fun b!869982 () Bool)

(declare-fun res!591262 () Bool)

(assert (=> b!869982 (=> (not res!591262) (not e!484465))))

(assert (=> b!869982 (= res!591262 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24588 _keys!868))))))

(declare-fun b!869983 () Bool)

(declare-fun res!591261 () Bool)

(assert (=> b!869983 (=> (not res!591261) (not e!484465))))

(assert (=> b!869983 (= res!591261 (and (= (select (arr!24148 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!869984 () Bool)

(declare-fun res!591266 () Bool)

(assert (=> b!869984 (=> (not res!591266) (not e!484465))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!869984 (= res!591266 (validKeyInArray!0 k0!854))))

(declare-fun b!869985 () Bool)

(assert (=> b!869985 (= e!484465 e!484463)))

(declare-fun res!591264 () Bool)

(assert (=> b!869985 (=> (not res!591264) (not e!484463))))

(assert (=> b!869985 (= res!591264 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!394981 () ListLongMap!10155)

(assert (=> b!869985 (= lt!394981 (getCurrentListMapNoExtraKeys!3062 _keys!868 lt!394984 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!869985 (= lt!394984 (array!50233 (store (arr!24147 _values!688) i!612 (ValueCellFull!8082 v!557)) (size!24587 _values!688)))))

(declare-fun lt!394982 () ListLongMap!10155)

(assert (=> b!869985 (= lt!394982 (getCurrentListMapNoExtraKeys!3062 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!27164 () Bool)

(declare-fun mapRes!27164 () Bool)

(declare-fun tp!52224 () Bool)

(declare-fun e!484464 () Bool)

(assert (=> mapNonEmpty!27164 (= mapRes!27164 (and tp!52224 e!484464))))

(declare-fun mapRest!27164 () (Array (_ BitVec 32) ValueCell!8082))

(declare-fun mapValue!27164 () ValueCell!8082)

(declare-fun mapKey!27164 () (_ BitVec 32))

(assert (=> mapNonEmpty!27164 (= (arr!24147 _values!688) (store mapRest!27164 mapKey!27164 mapValue!27164))))

(declare-fun mapIsEmpty!27164 () Bool)

(assert (=> mapIsEmpty!27164 mapRes!27164))

(declare-fun b!869986 () Bool)

(declare-fun res!591263 () Bool)

(assert (=> b!869986 (=> (not res!591263) (not e!484465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!869986 (= res!591263 (validMask!0 mask!1196))))

(declare-fun b!869987 () Bool)

(assert (=> b!869987 (= e!484464 tp_is_empty!17043)))

(declare-fun b!869988 () Bool)

(declare-fun res!591265 () Bool)

(assert (=> b!869988 (=> (not res!591265) (not e!484465))))

(assert (=> b!869988 (= res!591265 (and (= (size!24587 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24588 _keys!868) (size!24587 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!869989 () Bool)

(declare-fun res!591260 () Bool)

(assert (=> b!869989 (=> (not res!591260) (not e!484465))))

(declare-datatypes ((List!17178 0))(
  ( (Nil!17175) (Cons!17174 (h!18305 (_ BitVec 64)) (t!24215 List!17178)) )
))
(declare-fun arrayNoDuplicates!0 (array!50234 (_ BitVec 32) List!17178) Bool)

(assert (=> b!869989 (= res!591260 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17175))))

(declare-fun b!869990 () Bool)

(assert (=> b!869990 (= e!484462 (and e!484461 mapRes!27164))))

(declare-fun condMapEmpty!27164 () Bool)

(declare-fun mapDefault!27164 () ValueCell!8082)

(assert (=> b!869990 (= condMapEmpty!27164 (= (arr!24147 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8082)) mapDefault!27164)))))

(assert (= (and start!73992 res!591259) b!869986))

(assert (= (and b!869986 res!591263) b!869988))

(assert (= (and b!869988 res!591265) b!869981))

(assert (= (and b!869981 res!591258) b!869989))

(assert (= (and b!869989 res!591260) b!869982))

(assert (= (and b!869982 res!591262) b!869984))

(assert (= (and b!869984 res!591266) b!869983))

(assert (= (and b!869983 res!591261) b!869985))

(assert (= (and b!869985 res!591264) b!869979))

(assert (= (and b!869990 condMapEmpty!27164) mapIsEmpty!27164))

(assert (= (and b!869990 (not condMapEmpty!27164)) mapNonEmpty!27164))

(get-info :version)

(assert (= (and mapNonEmpty!27164 ((_ is ValueCellFull!8082) mapValue!27164)) b!869987))

(assert (= (and b!869990 ((_ is ValueCellFull!8082) mapDefault!27164)) b!869980))

(assert (= start!73992 b!869990))

(declare-fun m!811427 () Bool)

(assert (=> start!73992 m!811427))

(declare-fun m!811429 () Bool)

(assert (=> start!73992 m!811429))

(declare-fun m!811431 () Bool)

(assert (=> b!869983 m!811431))

(declare-fun m!811433 () Bool)

(assert (=> b!869979 m!811433))

(declare-fun m!811435 () Bool)

(assert (=> b!869979 m!811435))

(assert (=> b!869979 m!811435))

(declare-fun m!811437 () Bool)

(assert (=> b!869979 m!811437))

(declare-fun m!811439 () Bool)

(assert (=> b!869979 m!811439))

(declare-fun m!811441 () Bool)

(assert (=> b!869985 m!811441))

(declare-fun m!811443 () Bool)

(assert (=> b!869985 m!811443))

(declare-fun m!811445 () Bool)

(assert (=> b!869985 m!811445))

(declare-fun m!811447 () Bool)

(assert (=> b!869981 m!811447))

(declare-fun m!811449 () Bool)

(assert (=> b!869986 m!811449))

(declare-fun m!811451 () Bool)

(assert (=> mapNonEmpty!27164 m!811451))

(declare-fun m!811453 () Bool)

(assert (=> b!869984 m!811453))

(declare-fun m!811455 () Bool)

(assert (=> b!869989 m!811455))

(check-sat b_and!24659 (not b!869985) (not b!869981) (not mapNonEmpty!27164) (not b_next!14907) (not b!869989) tp_is_empty!17043 (not b!869979) (not start!73992) (not b!869986) (not b!869984))
(check-sat b_and!24659 (not b_next!14907))
