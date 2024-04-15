; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73018 () Bool)

(assert start!73018)

(declare-fun b_free!13951 () Bool)

(declare-fun b_next!13951 () Bool)

(assert (=> start!73018 (= b_free!13951 (not b_next!13951))))

(declare-fun tp!49357 () Bool)

(declare-fun b_and!23035 () Bool)

(assert (=> start!73018 (= tp!49357 b_and!23035)))

(declare-fun mapNonEmpty!25730 () Bool)

(declare-fun mapRes!25730 () Bool)

(declare-fun tp!49358 () Bool)

(declare-fun e!473532 () Bool)

(assert (=> mapNonEmpty!25730 (= mapRes!25730 (and tp!49358 e!473532))))

(declare-fun mapKey!25730 () (_ BitVec 32))

(declare-datatypes ((V!26497 0))(
  ( (V!26498 (val!8091 Int)) )
))
(declare-datatypes ((ValueCell!7604 0))(
  ( (ValueCellFull!7604 (v!10510 V!26497)) (EmptyCell!7604) )
))
(declare-fun mapValue!25730 () ValueCell!7604)

(declare-datatypes ((array!48379 0))(
  ( (array!48380 (arr!23221 (Array (_ BitVec 32) ValueCell!7604)) (size!23663 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48379)

(declare-fun mapRest!25730 () (Array (_ BitVec 32) ValueCell!7604))

(assert (=> mapNonEmpty!25730 (= (arr!23221 _values!688) (store mapRest!25730 mapKey!25730 mapValue!25730))))

(declare-fun b!848764 () Bool)

(declare-fun e!473527 () Bool)

(declare-fun tp_is_empty!16087 () Bool)

(assert (=> b!848764 (= e!473527 tp_is_empty!16087)))

(declare-fun b!848765 () Bool)

(declare-fun e!473531 () Bool)

(declare-fun e!473529 () Bool)

(assert (=> b!848765 (= e!473531 e!473529)))

(declare-fun res!576685 () Bool)

(assert (=> b!848765 (=> (not res!576685) (not e!473529))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848765 (= res!576685 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!381927 () array!48379)

(declare-datatypes ((array!48381 0))(
  ( (array!48382 (arr!23222 (Array (_ BitVec 32) (_ BitVec 64))) (size!23664 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48381)

(declare-fun minValue!654 () V!26497)

(declare-fun zeroValue!654 () V!26497)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10616 0))(
  ( (tuple2!10617 (_1!5319 (_ BitVec 64)) (_2!5319 V!26497)) )
))
(declare-datatypes ((List!16463 0))(
  ( (Nil!16460) (Cons!16459 (h!17590 tuple2!10616) (t!22851 List!16463)) )
))
(declare-datatypes ((ListLongMap!9375 0))(
  ( (ListLongMap!9376 (toList!4703 List!16463)) )
))
(declare-fun lt!381928 () ListLongMap!9375)

(declare-fun getCurrentListMapNoExtraKeys!2713 (array!48381 array!48379 (_ BitVec 32) (_ BitVec 32) V!26497 V!26497 (_ BitVec 32) Int) ListLongMap!9375)

(assert (=> b!848765 (= lt!381928 (getCurrentListMapNoExtraKeys!2713 _keys!868 lt!381927 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26497)

(assert (=> b!848765 (= lt!381927 (array!48380 (store (arr!23221 _values!688) i!612 (ValueCellFull!7604 v!557)) (size!23663 _values!688)))))

(declare-fun lt!381929 () ListLongMap!9375)

(assert (=> b!848765 (= lt!381929 (getCurrentListMapNoExtraKeys!2713 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848766 () Bool)

(declare-fun e!473530 () Bool)

(assert (=> b!848766 (= e!473530 true)))

(declare-fun +!2130 (ListLongMap!9375 tuple2!10616) ListLongMap!9375)

(declare-fun get!12227 (ValueCell!7604 V!26497) V!26497)

(declare-fun dynLambda!996 (Int (_ BitVec 64)) V!26497)

(assert (=> b!848766 (= lt!381928 (+!2130 (getCurrentListMapNoExtraKeys!2713 _keys!868 lt!381927 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10617 (select (arr!23222 _keys!868) from!1053) (get!12227 (select (arr!23221 lt!381927) from!1053) (dynLambda!996 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!848767 () Bool)

(declare-fun res!576679 () Bool)

(assert (=> b!848767 (=> (not res!576679) (not e!473531))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848767 (= res!576679 (validKeyInArray!0 k0!854))))

(declare-fun b!848768 () Bool)

(declare-fun e!473526 () Bool)

(declare-fun call!37682 () ListLongMap!9375)

(declare-fun call!37683 () ListLongMap!9375)

(assert (=> b!848768 (= e!473526 (= call!37682 call!37683))))

(declare-fun b!848769 () Bool)

(assert (=> b!848769 (= e!473529 (not e!473530))))

(declare-fun res!576683 () Bool)

(assert (=> b!848769 (=> res!576683 e!473530)))

(assert (=> b!848769 (= res!576683 (not (validKeyInArray!0 (select (arr!23222 _keys!868) from!1053))))))

(assert (=> b!848769 e!473526))

(declare-fun c!91532 () Bool)

(assert (=> b!848769 (= c!91532 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28937 0))(
  ( (Unit!28938) )
))
(declare-fun lt!381926 () Unit!28937)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!343 (array!48381 array!48379 (_ BitVec 32) (_ BitVec 32) V!26497 V!26497 (_ BitVec 32) (_ BitVec 64) V!26497 (_ BitVec 32) Int) Unit!28937)

(assert (=> b!848769 (= lt!381926 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!343 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848770 () Bool)

(declare-fun res!576681 () Bool)

(assert (=> b!848770 (=> (not res!576681) (not e!473531))))

(declare-datatypes ((List!16464 0))(
  ( (Nil!16461) (Cons!16460 (h!17591 (_ BitVec 64)) (t!22852 List!16464)) )
))
(declare-fun arrayNoDuplicates!0 (array!48381 (_ BitVec 32) List!16464) Bool)

(assert (=> b!848770 (= res!576681 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16461))))

(declare-fun mapIsEmpty!25730 () Bool)

(assert (=> mapIsEmpty!25730 mapRes!25730))

(declare-fun res!576686 () Bool)

(assert (=> start!73018 (=> (not res!576686) (not e!473531))))

(assert (=> start!73018 (= res!576686 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23664 _keys!868))))))

(assert (=> start!73018 e!473531))

(assert (=> start!73018 tp_is_empty!16087))

(assert (=> start!73018 true))

(assert (=> start!73018 tp!49357))

(declare-fun array_inv!18514 (array!48381) Bool)

(assert (=> start!73018 (array_inv!18514 _keys!868)))

(declare-fun e!473525 () Bool)

(declare-fun array_inv!18515 (array!48379) Bool)

(assert (=> start!73018 (and (array_inv!18515 _values!688) e!473525)))

(declare-fun b!848771 () Bool)

(declare-fun res!576687 () Bool)

(assert (=> b!848771 (=> (not res!576687) (not e!473531))))

(assert (=> b!848771 (= res!576687 (and (= (size!23663 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23664 _keys!868) (size!23663 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848772 () Bool)

(declare-fun res!576678 () Bool)

(assert (=> b!848772 (=> (not res!576678) (not e!473531))))

(assert (=> b!848772 (= res!576678 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23664 _keys!868))))))

(declare-fun b!848773 () Bool)

(declare-fun res!576682 () Bool)

(assert (=> b!848773 (=> (not res!576682) (not e!473531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48381 (_ BitVec 32)) Bool)

(assert (=> b!848773 (= res!576682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848774 () Bool)

(assert (=> b!848774 (= e!473532 tp_is_empty!16087)))

(declare-fun b!848775 () Bool)

(declare-fun res!576680 () Bool)

(assert (=> b!848775 (=> (not res!576680) (not e!473531))))

(assert (=> b!848775 (= res!576680 (and (= (select (arr!23222 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun bm!37679 () Bool)

(assert (=> bm!37679 (= call!37682 (getCurrentListMapNoExtraKeys!2713 _keys!868 lt!381927 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848776 () Bool)

(declare-fun res!576684 () Bool)

(assert (=> b!848776 (=> (not res!576684) (not e!473531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848776 (= res!576684 (validMask!0 mask!1196))))

(declare-fun b!848777 () Bool)

(assert (=> b!848777 (= e!473526 (= call!37682 (+!2130 call!37683 (tuple2!10617 k0!854 v!557))))))

(declare-fun b!848778 () Bool)

(assert (=> b!848778 (= e!473525 (and e!473527 mapRes!25730))))

(declare-fun condMapEmpty!25730 () Bool)

(declare-fun mapDefault!25730 () ValueCell!7604)

(assert (=> b!848778 (= condMapEmpty!25730 (= (arr!23221 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7604)) mapDefault!25730)))))

(declare-fun bm!37680 () Bool)

(assert (=> bm!37680 (= call!37683 (getCurrentListMapNoExtraKeys!2713 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!73018 res!576686) b!848776))

(assert (= (and b!848776 res!576684) b!848771))

(assert (= (and b!848771 res!576687) b!848773))

(assert (= (and b!848773 res!576682) b!848770))

(assert (= (and b!848770 res!576681) b!848772))

(assert (= (and b!848772 res!576678) b!848767))

(assert (= (and b!848767 res!576679) b!848775))

(assert (= (and b!848775 res!576680) b!848765))

(assert (= (and b!848765 res!576685) b!848769))

(assert (= (and b!848769 c!91532) b!848777))

(assert (= (and b!848769 (not c!91532)) b!848768))

(assert (= (or b!848777 b!848768) bm!37679))

(assert (= (or b!848777 b!848768) bm!37680))

(assert (= (and b!848769 (not res!576683)) b!848766))

(assert (= (and b!848778 condMapEmpty!25730) mapIsEmpty!25730))

(assert (= (and b!848778 (not condMapEmpty!25730)) mapNonEmpty!25730))

(get-info :version)

(assert (= (and mapNonEmpty!25730 ((_ is ValueCellFull!7604) mapValue!25730)) b!848774))

(assert (= (and b!848778 ((_ is ValueCellFull!7604) mapDefault!25730)) b!848764))

(assert (= start!73018 b!848778))

(declare-fun b_lambda!11465 () Bool)

(assert (=> (not b_lambda!11465) (not b!848766)))

(declare-fun t!22850 () Bool)

(declare-fun tb!4245 () Bool)

(assert (=> (and start!73018 (= defaultEntry!696 defaultEntry!696) t!22850) tb!4245))

(declare-fun result!8109 () Bool)

(assert (=> tb!4245 (= result!8109 tp_is_empty!16087)))

(assert (=> b!848766 t!22850))

(declare-fun b_and!23037 () Bool)

(assert (= b_and!23035 (and (=> t!22850 result!8109) b_and!23037)))

(declare-fun m!788975 () Bool)

(assert (=> start!73018 m!788975))

(declare-fun m!788977 () Bool)

(assert (=> start!73018 m!788977))

(declare-fun m!788979 () Bool)

(assert (=> bm!37680 m!788979))

(declare-fun m!788981 () Bool)

(assert (=> b!848777 m!788981))

(declare-fun m!788983 () Bool)

(assert (=> b!848776 m!788983))

(declare-fun m!788985 () Bool)

(assert (=> mapNonEmpty!25730 m!788985))

(declare-fun m!788987 () Bool)

(assert (=> b!848770 m!788987))

(declare-fun m!788989 () Bool)

(assert (=> b!848769 m!788989))

(assert (=> b!848769 m!788989))

(declare-fun m!788991 () Bool)

(assert (=> b!848769 m!788991))

(declare-fun m!788993 () Bool)

(assert (=> b!848769 m!788993))

(declare-fun m!788995 () Bool)

(assert (=> b!848775 m!788995))

(declare-fun m!788997 () Bool)

(assert (=> b!848767 m!788997))

(declare-fun m!788999 () Bool)

(assert (=> b!848766 m!788999))

(declare-fun m!789001 () Bool)

(assert (=> b!848766 m!789001))

(assert (=> b!848766 m!788999))

(declare-fun m!789003 () Bool)

(assert (=> b!848766 m!789003))

(declare-fun m!789005 () Bool)

(assert (=> b!848766 m!789005))

(assert (=> b!848766 m!789001))

(declare-fun m!789007 () Bool)

(assert (=> b!848766 m!789007))

(assert (=> b!848766 m!788989))

(assert (=> b!848766 m!789003))

(assert (=> bm!37679 m!789001))

(declare-fun m!789009 () Bool)

(assert (=> b!848765 m!789009))

(declare-fun m!789011 () Bool)

(assert (=> b!848765 m!789011))

(declare-fun m!789013 () Bool)

(assert (=> b!848765 m!789013))

(declare-fun m!789015 () Bool)

(assert (=> b!848773 m!789015))

(check-sat (not mapNonEmpty!25730) (not bm!37680) (not b!848767) (not b_next!13951) (not b!848770) (not start!73018) tp_is_empty!16087 (not b!848776) b_and!23037 (not b!848765) (not bm!37679) (not b!848777) (not b!848769) (not b!848766) (not b_lambda!11465) (not b!848773))
(check-sat b_and!23037 (not b_next!13951))
