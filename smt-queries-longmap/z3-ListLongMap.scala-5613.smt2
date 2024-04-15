; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73444 () Bool)

(assert start!73444)

(declare-fun b_free!14377 () Bool)

(declare-fun b_next!14377 () Bool)

(assert (=> start!73444 (= b_free!14377 (not b_next!14377))))

(declare-fun tp!50635 () Bool)

(declare-fun b_and!23707 () Bool)

(assert (=> start!73444 (= tp!50635 b_and!23707)))

(declare-fun b!857682 () Bool)

(declare-fun e!478000 () Bool)

(assert (=> b!857682 (= e!478000 true)))

(declare-datatypes ((V!27065 0))(
  ( (V!27066 (val!8304 Int)) )
))
(declare-datatypes ((tuple2!10962 0))(
  ( (tuple2!10963 (_1!5492 (_ BitVec 64)) (_2!5492 V!27065)) )
))
(declare-datatypes ((List!16765 0))(
  ( (Nil!16762) (Cons!16761 (h!17892 tuple2!10962) (t!23399 List!16765)) )
))
(declare-datatypes ((ListLongMap!9721 0))(
  ( (ListLongMap!9722 (toList!4876 List!16765)) )
))
(declare-fun lt!386217 () ListLongMap!9721)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!7817 0))(
  ( (ValueCellFull!7817 (v!10723 V!27065)) (EmptyCell!7817) )
))
(declare-datatypes ((array!49195 0))(
  ( (array!49196 (arr!23629 (Array (_ BitVec 32) ValueCell!7817)) (size!24071 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49195)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49197 0))(
  ( (array!49198 (arr!23630 (Array (_ BitVec 32) (_ BitVec 64))) (size!24072 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49197)

(declare-fun lt!386218 () ListLongMap!9721)

(declare-fun +!2251 (ListLongMap!9721 tuple2!10962) ListLongMap!9721)

(declare-fun get!12446 (ValueCell!7817 V!27065) V!27065)

(declare-fun dynLambda!1073 (Int (_ BitVec 64)) V!27065)

(assert (=> b!857682 (= lt!386218 (+!2251 lt!386217 (tuple2!10963 (select (arr!23630 _keys!868) from!1053) (get!12446 (select (arr!23629 _values!688) from!1053) (dynLambda!1073 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!582708 () Bool)

(declare-fun e!477997 () Bool)

(assert (=> start!73444 (=> (not res!582708) (not e!477997))))

(assert (=> start!73444 (= res!582708 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24072 _keys!868))))))

(assert (=> start!73444 e!477997))

(declare-fun tp_is_empty!16513 () Bool)

(assert (=> start!73444 tp_is_empty!16513))

(assert (=> start!73444 true))

(assert (=> start!73444 tp!50635))

(declare-fun array_inv!18776 (array!49197) Bool)

(assert (=> start!73444 (array_inv!18776 _keys!868)))

(declare-fun e!477998 () Bool)

(declare-fun array_inv!18777 (array!49195) Bool)

(assert (=> start!73444 (and (array_inv!18777 _values!688) e!477998)))

(declare-fun b!857683 () Bool)

(declare-fun e!477999 () Bool)

(assert (=> b!857683 (= e!477999 tp_is_empty!16513)))

(declare-fun mapNonEmpty!26369 () Bool)

(declare-fun mapRes!26369 () Bool)

(declare-fun tp!50636 () Bool)

(declare-fun e!477996 () Bool)

(assert (=> mapNonEmpty!26369 (= mapRes!26369 (and tp!50636 e!477996))))

(declare-fun mapRest!26369 () (Array (_ BitVec 32) ValueCell!7817))

(declare-fun mapValue!26369 () ValueCell!7817)

(declare-fun mapKey!26369 () (_ BitVec 32))

(assert (=> mapNonEmpty!26369 (= (arr!23629 _values!688) (store mapRest!26369 mapKey!26369 mapValue!26369))))

(declare-fun mapIsEmpty!26369 () Bool)

(assert (=> mapIsEmpty!26369 mapRes!26369))

(declare-fun b!857684 () Bool)

(declare-fun e!478002 () Bool)

(assert (=> b!857684 (= e!478002 (not e!478000))))

(declare-fun res!582705 () Bool)

(assert (=> b!857684 (=> res!582705 e!478000)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857684 (= res!582705 (not (validKeyInArray!0 (select (arr!23630 _keys!868) from!1053))))))

(declare-fun lt!386219 () ListLongMap!9721)

(assert (=> b!857684 (= lt!386219 lt!386217)))

(declare-fun v!557 () V!27065)

(declare-fun lt!386216 () ListLongMap!9721)

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!857684 (= lt!386217 (+!2251 lt!386216 (tuple2!10963 k0!854 v!557)))))

(declare-fun lt!386220 () array!49195)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27065)

(declare-fun zeroValue!654 () V!27065)

(declare-fun getCurrentListMapNoExtraKeys!2883 (array!49197 array!49195 (_ BitVec 32) (_ BitVec 32) V!27065 V!27065 (_ BitVec 32) Int) ListLongMap!9721)

(assert (=> b!857684 (= lt!386219 (getCurrentListMapNoExtraKeys!2883 _keys!868 lt!386220 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!857684 (= lt!386216 (getCurrentListMapNoExtraKeys!2883 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29171 0))(
  ( (Unit!29172) )
))
(declare-fun lt!386221 () Unit!29171)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!448 (array!49197 array!49195 (_ BitVec 32) (_ BitVec 32) V!27065 V!27065 (_ BitVec 32) (_ BitVec 64) V!27065 (_ BitVec 32) Int) Unit!29171)

(assert (=> b!857684 (= lt!386221 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!448 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857685 () Bool)

(declare-fun res!582700 () Bool)

(assert (=> b!857685 (=> (not res!582700) (not e!477997))))

(assert (=> b!857685 (= res!582700 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24072 _keys!868))))))

(declare-fun b!857686 () Bool)

(assert (=> b!857686 (= e!477997 e!478002)))

(declare-fun res!582701 () Bool)

(assert (=> b!857686 (=> (not res!582701) (not e!478002))))

(assert (=> b!857686 (= res!582701 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(assert (=> b!857686 (= lt!386218 (getCurrentListMapNoExtraKeys!2883 _keys!868 lt!386220 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!857686 (= lt!386220 (array!49196 (store (arr!23629 _values!688) i!612 (ValueCellFull!7817 v!557)) (size!24071 _values!688)))))

(declare-fun lt!386222 () ListLongMap!9721)

(assert (=> b!857686 (= lt!386222 (getCurrentListMapNoExtraKeys!2883 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857687 () Bool)

(declare-fun res!582704 () Bool)

(assert (=> b!857687 (=> (not res!582704) (not e!477997))))

(assert (=> b!857687 (= res!582704 (and (= (size!24071 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24072 _keys!868) (size!24071 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857688 () Bool)

(declare-fun res!582706 () Bool)

(assert (=> b!857688 (=> (not res!582706) (not e!477997))))

(assert (=> b!857688 (= res!582706 (and (= (select (arr!23630 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!857689 () Bool)

(declare-fun res!582703 () Bool)

(assert (=> b!857689 (=> (not res!582703) (not e!477997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857689 (= res!582703 (validMask!0 mask!1196))))

(declare-fun b!857690 () Bool)

(assert (=> b!857690 (= e!477996 tp_is_empty!16513)))

(declare-fun b!857691 () Bool)

(declare-fun res!582702 () Bool)

(assert (=> b!857691 (=> (not res!582702) (not e!477997))))

(declare-datatypes ((List!16766 0))(
  ( (Nil!16763) (Cons!16762 (h!17893 (_ BitVec 64)) (t!23400 List!16766)) )
))
(declare-fun arrayNoDuplicates!0 (array!49197 (_ BitVec 32) List!16766) Bool)

(assert (=> b!857691 (= res!582702 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16763))))

(declare-fun b!857692 () Bool)

(declare-fun res!582699 () Bool)

(assert (=> b!857692 (=> (not res!582699) (not e!477997))))

(assert (=> b!857692 (= res!582699 (validKeyInArray!0 k0!854))))

(declare-fun b!857693 () Bool)

(assert (=> b!857693 (= e!477998 (and e!477999 mapRes!26369))))

(declare-fun condMapEmpty!26369 () Bool)

(declare-fun mapDefault!26369 () ValueCell!7817)

(assert (=> b!857693 (= condMapEmpty!26369 (= (arr!23629 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7817)) mapDefault!26369)))))

(declare-fun b!857694 () Bool)

(declare-fun res!582707 () Bool)

(assert (=> b!857694 (=> (not res!582707) (not e!477997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49197 (_ BitVec 32)) Bool)

(assert (=> b!857694 (= res!582707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73444 res!582708) b!857689))

(assert (= (and b!857689 res!582703) b!857687))

(assert (= (and b!857687 res!582704) b!857694))

(assert (= (and b!857694 res!582707) b!857691))

(assert (= (and b!857691 res!582702) b!857685))

(assert (= (and b!857685 res!582700) b!857692))

(assert (= (and b!857692 res!582699) b!857688))

(assert (= (and b!857688 res!582706) b!857686))

(assert (= (and b!857686 res!582701) b!857684))

(assert (= (and b!857684 (not res!582705)) b!857682))

(assert (= (and b!857693 condMapEmpty!26369) mapIsEmpty!26369))

(assert (= (and b!857693 (not condMapEmpty!26369)) mapNonEmpty!26369))

(get-info :version)

(assert (= (and mapNonEmpty!26369 ((_ is ValueCellFull!7817) mapValue!26369)) b!857690))

(assert (= (and b!857693 ((_ is ValueCellFull!7817) mapDefault!26369)) b!857683))

(assert (= start!73444 b!857693))

(declare-fun b_lambda!11711 () Bool)

(assert (=> (not b_lambda!11711) (not b!857682)))

(declare-fun t!23398 () Bool)

(declare-fun tb!4491 () Bool)

(assert (=> (and start!73444 (= defaultEntry!696 defaultEntry!696) t!23398) tb!4491))

(declare-fun result!8601 () Bool)

(assert (=> tb!4491 (= result!8601 tp_is_empty!16513)))

(assert (=> b!857682 t!23398))

(declare-fun b_and!23709 () Bool)

(assert (= b_and!23707 (and (=> t!23398 result!8601) b_and!23709)))

(declare-fun m!797865 () Bool)

(assert (=> b!857684 m!797865))

(declare-fun m!797867 () Bool)

(assert (=> b!857684 m!797867))

(declare-fun m!797869 () Bool)

(assert (=> b!857684 m!797869))

(declare-fun m!797871 () Bool)

(assert (=> b!857684 m!797871))

(assert (=> b!857684 m!797869))

(declare-fun m!797873 () Bool)

(assert (=> b!857684 m!797873))

(declare-fun m!797875 () Bool)

(assert (=> b!857684 m!797875))

(declare-fun m!797877 () Bool)

(assert (=> b!857682 m!797877))

(declare-fun m!797879 () Bool)

(assert (=> b!857682 m!797879))

(declare-fun m!797881 () Bool)

(assert (=> b!857682 m!797881))

(declare-fun m!797883 () Bool)

(assert (=> b!857682 m!797883))

(assert (=> b!857682 m!797879))

(assert (=> b!857682 m!797869))

(assert (=> b!857682 m!797881))

(declare-fun m!797885 () Bool)

(assert (=> mapNonEmpty!26369 m!797885))

(declare-fun m!797887 () Bool)

(assert (=> start!73444 m!797887))

(declare-fun m!797889 () Bool)

(assert (=> start!73444 m!797889))

(declare-fun m!797891 () Bool)

(assert (=> b!857689 m!797891))

(declare-fun m!797893 () Bool)

(assert (=> b!857691 m!797893))

(declare-fun m!797895 () Bool)

(assert (=> b!857686 m!797895))

(declare-fun m!797897 () Bool)

(assert (=> b!857686 m!797897))

(declare-fun m!797899 () Bool)

(assert (=> b!857686 m!797899))

(declare-fun m!797901 () Bool)

(assert (=> b!857694 m!797901))

(declare-fun m!797903 () Bool)

(assert (=> b!857688 m!797903))

(declare-fun m!797905 () Bool)

(assert (=> b!857692 m!797905))

(check-sat (not b!857691) (not b!857692) (not b!857682) (not b_lambda!11711) (not b!857689) (not mapNonEmpty!26369) tp_is_empty!16513 b_and!23709 (not b!857684) (not b!857694) (not b_next!14377) (not b!857686) (not start!73444))
(check-sat b_and!23709 (not b_next!14377))
