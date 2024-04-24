; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73528 () Bool)

(assert start!73528)

(declare-fun b_free!14275 () Bool)

(declare-fun b_next!14275 () Bool)

(assert (=> start!73528 (= b_free!14275 (not b_next!14275))))

(declare-fun tp!50329 () Bool)

(declare-fun b_and!23641 () Bool)

(assert (=> start!73528 (= tp!50329 b_and!23641)))

(declare-fun b!856977 () Bool)

(declare-fun res!581767 () Bool)

(declare-fun e!477799 () Bool)

(assert (=> b!856977 (=> (not res!581767) (not e!477799))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856977 (= res!581767 (validKeyInArray!0 k0!854))))

(declare-fun b!856978 () Bool)

(declare-fun res!581772 () Bool)

(assert (=> b!856978 (=> (not res!581772) (not e!477799))))

(declare-datatypes ((array!49063 0))(
  ( (array!49064 (arr!23558 (Array (_ BitVec 32) (_ BitVec 64))) (size!23999 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49063)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49063 (_ BitVec 32)) Bool)

(assert (=> b!856978 (= res!581772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856979 () Bool)

(declare-fun e!477798 () Bool)

(declare-fun tp_is_empty!16411 () Bool)

(assert (=> b!856979 (= e!477798 tp_is_empty!16411)))

(declare-fun b!856980 () Bool)

(declare-fun res!581769 () Bool)

(assert (=> b!856980 (=> (not res!581769) (not e!477799))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!856980 (= res!581769 (and (= (select (arr!23558 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856981 () Bool)

(declare-fun res!581766 () Bool)

(assert (=> b!856981 (=> (not res!581766) (not e!477799))))

(declare-datatypes ((List!16645 0))(
  ( (Nil!16642) (Cons!16641 (h!17778 (_ BitVec 64)) (t!23278 List!16645)) )
))
(declare-fun arrayNoDuplicates!0 (array!49063 (_ BitVec 32) List!16645) Bool)

(assert (=> b!856981 (= res!581766 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16642))))

(declare-fun b!856982 () Bool)

(declare-fun res!581773 () Bool)

(assert (=> b!856982 (=> (not res!581773) (not e!477799))))

(assert (=> b!856982 (= res!581773 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23999 _keys!868))))))

(declare-fun res!581770 () Bool)

(assert (=> start!73528 (=> (not res!581770) (not e!477799))))

(assert (=> start!73528 (= res!581770 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23999 _keys!868))))))

(assert (=> start!73528 e!477799))

(assert (=> start!73528 tp_is_empty!16411))

(assert (=> start!73528 true))

(assert (=> start!73528 tp!50329))

(declare-fun array_inv!18714 (array!49063) Bool)

(assert (=> start!73528 (array_inv!18714 _keys!868)))

(declare-datatypes ((V!26929 0))(
  ( (V!26930 (val!8253 Int)) )
))
(declare-datatypes ((ValueCell!7766 0))(
  ( (ValueCellFull!7766 (v!10678 V!26929)) (EmptyCell!7766) )
))
(declare-datatypes ((array!49065 0))(
  ( (array!49066 (arr!23559 (Array (_ BitVec 32) ValueCell!7766)) (size!24000 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49065)

(declare-fun e!477802 () Bool)

(declare-fun array_inv!18715 (array!49065) Bool)

(assert (=> start!73528 (and (array_inv!18715 _values!688) e!477802)))

(declare-fun b!856983 () Bool)

(declare-fun res!581768 () Bool)

(assert (=> b!856983 (=> (not res!581768) (not e!477799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856983 (= res!581768 (validMask!0 mask!1196))))

(declare-fun b!856984 () Bool)

(declare-fun res!581765 () Bool)

(assert (=> b!856984 (=> (not res!581765) (not e!477799))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!856984 (= res!581765 (and (= (size!24000 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23999 _keys!868) (size!24000 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856985 () Bool)

(declare-fun e!477800 () Bool)

(assert (=> b!856985 (= e!477800 (not true))))

(declare-fun v!557 () V!26929)

(declare-fun lt!386195 () array!49065)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26929)

(declare-fun zeroValue!654 () V!26929)

(declare-datatypes ((tuple2!10800 0))(
  ( (tuple2!10801 (_1!5411 (_ BitVec 64)) (_2!5411 V!26929)) )
))
(declare-datatypes ((List!16646 0))(
  ( (Nil!16643) (Cons!16642 (h!17779 tuple2!10800) (t!23279 List!16646)) )
))
(declare-datatypes ((ListLongMap!9571 0))(
  ( (ListLongMap!9572 (toList!4801 List!16646)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2857 (array!49063 array!49065 (_ BitVec 32) (_ BitVec 32) V!26929 V!26929 (_ BitVec 32) Int) ListLongMap!9571)

(declare-fun +!2216 (ListLongMap!9571 tuple2!10800) ListLongMap!9571)

(assert (=> b!856985 (= (getCurrentListMapNoExtraKeys!2857 _keys!868 lt!386195 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2216 (getCurrentListMapNoExtraKeys!2857 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10801 k0!854 v!557)))))

(declare-datatypes ((Unit!29188 0))(
  ( (Unit!29189) )
))
(declare-fun lt!386196 () Unit!29188)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!414 (array!49063 array!49065 (_ BitVec 32) (_ BitVec 32) V!26929 V!26929 (_ BitVec 32) (_ BitVec 64) V!26929 (_ BitVec 32) Int) Unit!29188)

(assert (=> b!856985 (= lt!386196 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!414 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856986 () Bool)

(declare-fun e!477801 () Bool)

(assert (=> b!856986 (= e!477801 tp_is_empty!16411)))

(declare-fun mapNonEmpty!26216 () Bool)

(declare-fun mapRes!26216 () Bool)

(declare-fun tp!50330 () Bool)

(assert (=> mapNonEmpty!26216 (= mapRes!26216 (and tp!50330 e!477801))))

(declare-fun mapKey!26216 () (_ BitVec 32))

(declare-fun mapRest!26216 () (Array (_ BitVec 32) ValueCell!7766))

(declare-fun mapValue!26216 () ValueCell!7766)

(assert (=> mapNonEmpty!26216 (= (arr!23559 _values!688) (store mapRest!26216 mapKey!26216 mapValue!26216))))

(declare-fun b!856987 () Bool)

(assert (=> b!856987 (= e!477802 (and e!477798 mapRes!26216))))

(declare-fun condMapEmpty!26216 () Bool)

(declare-fun mapDefault!26216 () ValueCell!7766)

(assert (=> b!856987 (= condMapEmpty!26216 (= (arr!23559 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7766)) mapDefault!26216)))))

(declare-fun mapIsEmpty!26216 () Bool)

(assert (=> mapIsEmpty!26216 mapRes!26216))

(declare-fun b!856988 () Bool)

(assert (=> b!856988 (= e!477799 e!477800)))

(declare-fun res!581771 () Bool)

(assert (=> b!856988 (=> (not res!581771) (not e!477800))))

(assert (=> b!856988 (= res!581771 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386198 () ListLongMap!9571)

(assert (=> b!856988 (= lt!386198 (getCurrentListMapNoExtraKeys!2857 _keys!868 lt!386195 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!856988 (= lt!386195 (array!49066 (store (arr!23559 _values!688) i!612 (ValueCellFull!7766 v!557)) (size!24000 _values!688)))))

(declare-fun lt!386197 () ListLongMap!9571)

(assert (=> b!856988 (= lt!386197 (getCurrentListMapNoExtraKeys!2857 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!73528 res!581770) b!856983))

(assert (= (and b!856983 res!581768) b!856984))

(assert (= (and b!856984 res!581765) b!856978))

(assert (= (and b!856978 res!581772) b!856981))

(assert (= (and b!856981 res!581766) b!856982))

(assert (= (and b!856982 res!581773) b!856977))

(assert (= (and b!856977 res!581767) b!856980))

(assert (= (and b!856980 res!581769) b!856988))

(assert (= (and b!856988 res!581771) b!856985))

(assert (= (and b!856987 condMapEmpty!26216) mapIsEmpty!26216))

(assert (= (and b!856987 (not condMapEmpty!26216)) mapNonEmpty!26216))

(get-info :version)

(assert (= (and mapNonEmpty!26216 ((_ is ValueCellFull!7766) mapValue!26216)) b!856986))

(assert (= (and b!856987 ((_ is ValueCellFull!7766) mapDefault!26216)) b!856979))

(assert (= start!73528 b!856987))

(declare-fun m!798371 () Bool)

(assert (=> b!856988 m!798371))

(declare-fun m!798373 () Bool)

(assert (=> b!856988 m!798373))

(declare-fun m!798375 () Bool)

(assert (=> b!856988 m!798375))

(declare-fun m!798377 () Bool)

(assert (=> start!73528 m!798377))

(declare-fun m!798379 () Bool)

(assert (=> start!73528 m!798379))

(declare-fun m!798381 () Bool)

(assert (=> b!856978 m!798381))

(declare-fun m!798383 () Bool)

(assert (=> b!856985 m!798383))

(declare-fun m!798385 () Bool)

(assert (=> b!856985 m!798385))

(assert (=> b!856985 m!798385))

(declare-fun m!798387 () Bool)

(assert (=> b!856985 m!798387))

(declare-fun m!798389 () Bool)

(assert (=> b!856985 m!798389))

(declare-fun m!798391 () Bool)

(assert (=> mapNonEmpty!26216 m!798391))

(declare-fun m!798393 () Bool)

(assert (=> b!856981 m!798393))

(declare-fun m!798395 () Bool)

(assert (=> b!856983 m!798395))

(declare-fun m!798397 () Bool)

(assert (=> b!856980 m!798397))

(declare-fun m!798399 () Bool)

(assert (=> b!856977 m!798399))

(check-sat (not b!856978) (not b!856988) (not b!856983) (not start!73528) (not b_next!14275) (not b!856981) (not mapNonEmpty!26216) (not b!856985) b_and!23641 (not b!856977) tp_is_empty!16411)
(check-sat b_and!23641 (not b_next!14275))
