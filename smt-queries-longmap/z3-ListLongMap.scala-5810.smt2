; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74934 () Bool)

(assert start!74934)

(declare-fun b_free!15453 () Bool)

(declare-fun b_next!15453 () Bool)

(assert (=> start!74934 (= b_free!15453 (not b_next!15453))))

(declare-fun tp!54061 () Bool)

(declare-fun b_and!25605 () Bool)

(assert (=> start!74934 (= tp!54061 b_and!25605)))

(declare-fun b!883837 () Bool)

(declare-fun e!491867 () Bool)

(declare-fun tp_is_empty!17697 () Bool)

(assert (=> b!883837 (= e!491867 tp_is_empty!17697)))

(declare-fun b!883838 () Bool)

(declare-datatypes ((Unit!30167 0))(
  ( (Unit!30168) )
))
(declare-fun e!491873 () Unit!30167)

(declare-fun Unit!30169 () Unit!30167)

(assert (=> b!883838 (= e!491873 Unit!30169)))

(declare-fun lt!400129 () Unit!30167)

(declare-datatypes ((array!51520 0))(
  ( (array!51521 (arr!24779 (Array (_ BitVec 32) (_ BitVec 64))) (size!25219 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51520)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51520 (_ BitVec 32) (_ BitVec 32)) Unit!30167)

(assert (=> b!883838 (= lt!400129 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17599 0))(
  ( (Nil!17596) (Cons!17595 (h!18726 (_ BitVec 64)) (t!24854 List!17599)) )
))
(declare-fun arrayNoDuplicates!0 (array!51520 (_ BitVec 32) List!17599) Bool)

(assert (=> b!883838 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17596)))

(declare-fun lt!400131 () Unit!30167)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51520 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30167)

(assert (=> b!883838 (= lt!400131 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883838 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!400126 () Unit!30167)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51520 (_ BitVec 64) (_ BitVec 32) List!17599) Unit!30167)

(assert (=> b!883838 (= lt!400126 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17596))))

(assert (=> b!883838 false))

(declare-fun b!883839 () Bool)

(declare-fun res!600444 () Bool)

(declare-fun e!491870 () Bool)

(assert (=> b!883839 (=> (not res!600444) (not e!491870))))

(assert (=> b!883839 (= res!600444 (and (= (select (arr!24779 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!883840 () Bool)

(declare-fun res!600452 () Bool)

(assert (=> b!883840 (=> (not res!600452) (not e!491870))))

(assert (=> b!883840 (= res!600452 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17596))))

(declare-fun b!883841 () Bool)

(declare-fun res!600446 () Bool)

(assert (=> b!883841 (=> (not res!600446) (not e!491870))))

(assert (=> b!883841 (= res!600446 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25219 _keys!868))))))

(declare-fun mapIsEmpty!28182 () Bool)

(declare-fun mapRes!28182 () Bool)

(assert (=> mapIsEmpty!28182 mapRes!28182))

(declare-fun b!883842 () Bool)

(declare-fun res!600451 () Bool)

(assert (=> b!883842 (=> (not res!600451) (not e!491870))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883842 (= res!600451 (validMask!0 mask!1196))))

(declare-fun e!491871 () Bool)

(declare-fun b!883843 () Bool)

(assert (=> b!883843 (= e!491871 (not (= k0!854 (select (arr!24779 _keys!868) from!1053))))))

(assert (=> b!883843 (not (= (select (arr!24779 _keys!868) from!1053) k0!854))))

(declare-fun lt!400125 () Unit!30167)

(assert (=> b!883843 (= lt!400125 e!491873)))

(declare-fun c!93085 () Bool)

(assert (=> b!883843 (= c!93085 (= (select (arr!24779 _keys!868) from!1053) k0!854))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!28643 0))(
  ( (V!28644 (val!8896 Int)) )
))
(declare-datatypes ((tuple2!11792 0))(
  ( (tuple2!11793 (_1!5907 (_ BitVec 64)) (_2!5907 V!28643)) )
))
(declare-datatypes ((List!17600 0))(
  ( (Nil!17597) (Cons!17596 (h!18727 tuple2!11792) (t!24855 List!17600)) )
))
(declare-datatypes ((ListLongMap!10561 0))(
  ( (ListLongMap!10562 (toList!5296 List!17600)) )
))
(declare-fun lt!400133 () ListLongMap!10561)

(declare-fun lt!400124 () ListLongMap!10561)

(declare-datatypes ((ValueCell!8409 0))(
  ( (ValueCellFull!8409 (v!11365 V!28643)) (EmptyCell!8409) )
))
(declare-datatypes ((array!51522 0))(
  ( (array!51523 (arr!24780 (Array (_ BitVec 32) ValueCell!8409)) (size!25220 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51522)

(declare-fun +!2565 (ListLongMap!10561 tuple2!11792) ListLongMap!10561)

(declare-fun get!13059 (ValueCell!8409 V!28643) V!28643)

(declare-fun dynLambda!1276 (Int (_ BitVec 64)) V!28643)

(assert (=> b!883843 (= lt!400124 (+!2565 lt!400133 (tuple2!11793 (select (arr!24779 _keys!868) from!1053) (get!13059 (select (arr!24780 _values!688) from!1053) (dynLambda!1276 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!28182 () Bool)

(declare-fun tp!54062 () Bool)

(assert (=> mapNonEmpty!28182 (= mapRes!28182 (and tp!54062 e!491867))))

(declare-fun mapRest!28182 () (Array (_ BitVec 32) ValueCell!8409))

(declare-fun mapKey!28182 () (_ BitVec 32))

(declare-fun mapValue!28182 () ValueCell!8409)

(assert (=> mapNonEmpty!28182 (= (arr!24780 _values!688) (store mapRest!28182 mapKey!28182 mapValue!28182))))

(declare-fun b!883844 () Bool)

(declare-fun res!600447 () Bool)

(assert (=> b!883844 (=> (not res!600447) (not e!491870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883844 (= res!600447 (validKeyInArray!0 k0!854))))

(declare-fun b!883845 () Bool)

(declare-fun e!491868 () Bool)

(declare-fun e!491874 () Bool)

(assert (=> b!883845 (= e!491868 (and e!491874 mapRes!28182))))

(declare-fun condMapEmpty!28182 () Bool)

(declare-fun mapDefault!28182 () ValueCell!8409)

(assert (=> b!883845 (= condMapEmpty!28182 (= (arr!24780 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8409)) mapDefault!28182)))))

(declare-fun b!883846 () Bool)

(declare-fun res!600453 () Bool)

(assert (=> b!883846 (=> (not res!600453) (not e!491870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51520 (_ BitVec 32)) Bool)

(assert (=> b!883846 (= res!600453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883847 () Bool)

(declare-fun e!491872 () Bool)

(assert (=> b!883847 (= e!491870 e!491872)))

(declare-fun res!600448 () Bool)

(assert (=> b!883847 (=> (not res!600448) (not e!491872))))

(assert (=> b!883847 (= res!600448 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!400127 () array!51522)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28643)

(declare-fun zeroValue!654 () V!28643)

(declare-fun getCurrentListMapNoExtraKeys!3255 (array!51520 array!51522 (_ BitVec 32) (_ BitVec 32) V!28643 V!28643 (_ BitVec 32) Int) ListLongMap!10561)

(assert (=> b!883847 (= lt!400124 (getCurrentListMapNoExtraKeys!3255 _keys!868 lt!400127 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28643)

(assert (=> b!883847 (= lt!400127 (array!51523 (store (arr!24780 _values!688) i!612 (ValueCellFull!8409 v!557)) (size!25220 _values!688)))))

(declare-fun lt!400123 () ListLongMap!10561)

(assert (=> b!883847 (= lt!400123 (getCurrentListMapNoExtraKeys!3255 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!600449 () Bool)

(assert (=> start!74934 (=> (not res!600449) (not e!491870))))

(assert (=> start!74934 (= res!600449 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25219 _keys!868))))))

(assert (=> start!74934 e!491870))

(assert (=> start!74934 tp_is_empty!17697))

(assert (=> start!74934 true))

(assert (=> start!74934 tp!54061))

(declare-fun array_inv!19508 (array!51520) Bool)

(assert (=> start!74934 (array_inv!19508 _keys!868)))

(declare-fun array_inv!19509 (array!51522) Bool)

(assert (=> start!74934 (and (array_inv!19509 _values!688) e!491868)))

(declare-fun b!883848 () Bool)

(declare-fun Unit!30170 () Unit!30167)

(assert (=> b!883848 (= e!491873 Unit!30170)))

(declare-fun b!883849 () Bool)

(assert (=> b!883849 (= e!491874 tp_is_empty!17697)))

(declare-fun b!883850 () Bool)

(assert (=> b!883850 (= e!491872 (not e!491871))))

(declare-fun res!600450 () Bool)

(assert (=> b!883850 (=> res!600450 e!491871)))

(assert (=> b!883850 (= res!600450 (not (validKeyInArray!0 (select (arr!24779 _keys!868) from!1053))))))

(declare-fun lt!400132 () ListLongMap!10561)

(assert (=> b!883850 (= lt!400132 lt!400133)))

(declare-fun lt!400130 () ListLongMap!10561)

(assert (=> b!883850 (= lt!400133 (+!2565 lt!400130 (tuple2!11793 k0!854 v!557)))))

(assert (=> b!883850 (= lt!400132 (getCurrentListMapNoExtraKeys!3255 _keys!868 lt!400127 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883850 (= lt!400130 (getCurrentListMapNoExtraKeys!3255 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!400128 () Unit!30167)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!749 (array!51520 array!51522 (_ BitVec 32) (_ BitVec 32) V!28643 V!28643 (_ BitVec 32) (_ BitVec 64) V!28643 (_ BitVec 32) Int) Unit!30167)

(assert (=> b!883850 (= lt!400128 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!749 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883851 () Bool)

(declare-fun res!600445 () Bool)

(assert (=> b!883851 (=> (not res!600445) (not e!491870))))

(assert (=> b!883851 (= res!600445 (and (= (size!25220 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25219 _keys!868) (size!25220 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74934 res!600449) b!883842))

(assert (= (and b!883842 res!600451) b!883851))

(assert (= (and b!883851 res!600445) b!883846))

(assert (= (and b!883846 res!600453) b!883840))

(assert (= (and b!883840 res!600452) b!883841))

(assert (= (and b!883841 res!600446) b!883844))

(assert (= (and b!883844 res!600447) b!883839))

(assert (= (and b!883839 res!600444) b!883847))

(assert (= (and b!883847 res!600448) b!883850))

(assert (= (and b!883850 (not res!600450)) b!883843))

(assert (= (and b!883843 c!93085) b!883838))

(assert (= (and b!883843 (not c!93085)) b!883848))

(assert (= (and b!883845 condMapEmpty!28182) mapIsEmpty!28182))

(assert (= (and b!883845 (not condMapEmpty!28182)) mapNonEmpty!28182))

(get-info :version)

(assert (= (and mapNonEmpty!28182 ((_ is ValueCellFull!8409) mapValue!28182)) b!883837))

(assert (= (and b!883845 ((_ is ValueCellFull!8409) mapDefault!28182)) b!883849))

(assert (= start!74934 b!883845))

(declare-fun b_lambda!12731 () Bool)

(assert (=> (not b_lambda!12731) (not b!883843)))

(declare-fun t!24853 () Bool)

(declare-fun tb!5111 () Bool)

(assert (=> (and start!74934 (= defaultEntry!696 defaultEntry!696) t!24853) tb!5111))

(declare-fun result!9857 () Bool)

(assert (=> tb!5111 (= result!9857 tp_is_empty!17697)))

(assert (=> b!883843 t!24853))

(declare-fun b_and!25607 () Bool)

(assert (= b_and!25605 (and (=> t!24853 result!9857) b_and!25607)))

(declare-fun m!823941 () Bool)

(assert (=> b!883839 m!823941))

(declare-fun m!823943 () Bool)

(assert (=> b!883850 m!823943))

(declare-fun m!823945 () Bool)

(assert (=> b!883850 m!823945))

(declare-fun m!823947 () Bool)

(assert (=> b!883850 m!823947))

(declare-fun m!823949 () Bool)

(assert (=> b!883850 m!823949))

(declare-fun m!823951 () Bool)

(assert (=> b!883850 m!823951))

(assert (=> b!883850 m!823945))

(declare-fun m!823953 () Bool)

(assert (=> b!883850 m!823953))

(declare-fun m!823955 () Bool)

(assert (=> b!883847 m!823955))

(declare-fun m!823957 () Bool)

(assert (=> b!883847 m!823957))

(declare-fun m!823959 () Bool)

(assert (=> b!883847 m!823959))

(declare-fun m!823961 () Bool)

(assert (=> b!883843 m!823961))

(declare-fun m!823963 () Bool)

(assert (=> b!883843 m!823963))

(declare-fun m!823965 () Bool)

(assert (=> b!883843 m!823965))

(declare-fun m!823967 () Bool)

(assert (=> b!883843 m!823967))

(assert (=> b!883843 m!823963))

(assert (=> b!883843 m!823945))

(assert (=> b!883843 m!823965))

(declare-fun m!823969 () Bool)

(assert (=> b!883842 m!823969))

(declare-fun m!823971 () Bool)

(assert (=> b!883838 m!823971))

(declare-fun m!823973 () Bool)

(assert (=> b!883838 m!823973))

(declare-fun m!823975 () Bool)

(assert (=> b!883838 m!823975))

(declare-fun m!823977 () Bool)

(assert (=> b!883838 m!823977))

(declare-fun m!823979 () Bool)

(assert (=> b!883838 m!823979))

(declare-fun m!823981 () Bool)

(assert (=> b!883846 m!823981))

(declare-fun m!823983 () Bool)

(assert (=> b!883844 m!823983))

(declare-fun m!823985 () Bool)

(assert (=> mapNonEmpty!28182 m!823985))

(declare-fun m!823987 () Bool)

(assert (=> b!883840 m!823987))

(declare-fun m!823989 () Bool)

(assert (=> start!74934 m!823989))

(declare-fun m!823991 () Bool)

(assert (=> start!74934 m!823991))

(check-sat (not b!883844) (not b!883840) tp_is_empty!17697 (not mapNonEmpty!28182) (not b_lambda!12731) (not b!883847) (not b!883846) (not b_next!15453) b_and!25607 (not start!74934) (not b!883850) (not b!883842) (not b!883838) (not b!883843))
(check-sat b_and!25607 (not b_next!15453))
