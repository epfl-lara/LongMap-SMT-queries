; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75064 () Bool)

(assert start!75064)

(declare-fun b_free!15415 () Bool)

(declare-fun b_next!15415 () Bool)

(assert (=> start!75064 (= b_free!15415 (not b_next!15415))))

(declare-fun tp!53949 () Bool)

(declare-fun b_and!25539 () Bool)

(assert (=> start!75064 (= tp!53949 b_and!25539)))

(declare-fun res!600182 () Bool)

(declare-fun e!491988 () Bool)

(assert (=> start!75064 (=> (not res!600182) (not e!491988))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!51485 0))(
  ( (array!51486 (arr!24757 (Array (_ BitVec 32) (_ BitVec 64))) (size!25198 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51485)

(assert (=> start!75064 (= res!600182 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25198 _keys!868))))))

(assert (=> start!75064 e!491988))

(declare-fun tp_is_empty!17659 () Bool)

(assert (=> start!75064 tp_is_empty!17659))

(assert (=> start!75064 true))

(assert (=> start!75064 tp!53949))

(declare-fun array_inv!19538 (array!51485) Bool)

(assert (=> start!75064 (array_inv!19538 _keys!868)))

(declare-datatypes ((V!28593 0))(
  ( (V!28594 (val!8877 Int)) )
))
(declare-datatypes ((ValueCell!8390 0))(
  ( (ValueCellFull!8390 (v!11346 V!28593)) (EmptyCell!8390) )
))
(declare-datatypes ((array!51487 0))(
  ( (array!51488 (arr!24758 (Array (_ BitVec 32) ValueCell!8390)) (size!25199 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51487)

(declare-fun e!491989 () Bool)

(declare-fun array_inv!19539 (array!51487) Bool)

(assert (=> start!75064 (and (array_inv!19539 _values!688) e!491989)))

(declare-fun mapNonEmpty!28125 () Bool)

(declare-fun mapRes!28125 () Bool)

(declare-fun tp!53948 () Bool)

(declare-fun e!491994 () Bool)

(assert (=> mapNonEmpty!28125 (= mapRes!28125 (and tp!53948 e!491994))))

(declare-fun mapValue!28125 () ValueCell!8390)

(declare-fun mapKey!28125 () (_ BitVec 32))

(declare-fun mapRest!28125 () (Array (_ BitVec 32) ValueCell!8390))

(assert (=> mapNonEmpty!28125 (= (arr!24758 _values!688) (store mapRest!28125 mapKey!28125 mapValue!28125))))

(declare-fun b!883842 () Bool)

(assert (=> b!883842 (= e!491994 tp_is_empty!17659)))

(declare-fun b!883843 () Bool)

(declare-fun e!491986 () Bool)

(assert (=> b!883843 (= e!491989 (and e!491986 mapRes!28125))))

(declare-fun condMapEmpty!28125 () Bool)

(declare-fun mapDefault!28125 () ValueCell!8390)

(assert (=> b!883843 (= condMapEmpty!28125 (= (arr!24758 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8390)) mapDefault!28125)))))

(declare-fun b!883844 () Bool)

(declare-fun res!600188 () Bool)

(assert (=> b!883844 (=> (not res!600188) (not e!491988))))

(declare-datatypes ((List!17527 0))(
  ( (Nil!17524) (Cons!17523 (h!18660 (_ BitVec 64)) (t!24736 List!17527)) )
))
(declare-fun arrayNoDuplicates!0 (array!51485 (_ BitVec 32) List!17527) Bool)

(assert (=> b!883844 (= res!600188 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17524))))

(declare-fun b!883845 () Bool)

(declare-fun e!491993 () Bool)

(assert (=> b!883845 (= e!491993 true)))

(declare-fun lt!399878 () Bool)

(declare-fun contains!4254 (List!17527 (_ BitVec 64)) Bool)

(assert (=> b!883845 (= lt!399878 (contains!4254 Nil!17524 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!883846 () Bool)

(declare-fun res!600190 () Bool)

(assert (=> b!883846 (=> (not res!600190) (not e!491988))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883846 (= res!600190 (validKeyInArray!0 k0!854))))

(declare-fun b!883847 () Bool)

(declare-fun res!600193 () Bool)

(assert (=> b!883847 (=> (not res!600193) (not e!491988))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51485 (_ BitVec 32)) Bool)

(assert (=> b!883847 (= res!600193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883848 () Bool)

(declare-fun res!600181 () Bool)

(assert (=> b!883848 (=> res!600181 e!491993)))

(assert (=> b!883848 (= res!600181 (contains!4254 Nil!17524 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!883849 () Bool)

(declare-fun e!491992 () Bool)

(assert (=> b!883849 (= e!491988 e!491992)))

(declare-fun res!600187 () Bool)

(assert (=> b!883849 (=> (not res!600187) (not e!491992))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!883849 (= res!600187 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399880 () array!51487)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28593)

(declare-fun zeroValue!654 () V!28593)

(declare-datatypes ((tuple2!11696 0))(
  ( (tuple2!11697 (_1!5859 (_ BitVec 64)) (_2!5859 V!28593)) )
))
(declare-datatypes ((List!17528 0))(
  ( (Nil!17525) (Cons!17524 (h!18661 tuple2!11696) (t!24737 List!17528)) )
))
(declare-datatypes ((ListLongMap!10467 0))(
  ( (ListLongMap!10468 (toList!5249 List!17528)) )
))
(declare-fun lt!399877 () ListLongMap!10467)

(declare-fun getCurrentListMapNoExtraKeys!3288 (array!51485 array!51487 (_ BitVec 32) (_ BitVec 32) V!28593 V!28593 (_ BitVec 32) Int) ListLongMap!10467)

(assert (=> b!883849 (= lt!399877 (getCurrentListMapNoExtraKeys!3288 _keys!868 lt!399880 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28593)

(assert (=> b!883849 (= lt!399880 (array!51488 (store (arr!24758 _values!688) i!612 (ValueCellFull!8390 v!557)) (size!25199 _values!688)))))

(declare-fun lt!399879 () ListLongMap!10467)

(assert (=> b!883849 (= lt!399879 (getCurrentListMapNoExtraKeys!3288 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883850 () Bool)

(declare-fun res!600192 () Bool)

(assert (=> b!883850 (=> (not res!600192) (not e!491988))))

(assert (=> b!883850 (= res!600192 (and (= (size!25199 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25198 _keys!868) (size!25199 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883851 () Bool)

(assert (=> b!883851 (= e!491986 tp_is_empty!17659)))

(declare-fun b!883852 () Bool)

(declare-fun res!600184 () Bool)

(assert (=> b!883852 (=> res!600184 e!491993)))

(declare-fun noDuplicate!1325 (List!17527) Bool)

(assert (=> b!883852 (= res!600184 (not (noDuplicate!1325 Nil!17524)))))

(declare-fun mapIsEmpty!28125 () Bool)

(assert (=> mapIsEmpty!28125 mapRes!28125))

(declare-fun b!883853 () Bool)

(declare-fun res!600189 () Bool)

(assert (=> b!883853 (=> (not res!600189) (not e!491988))))

(assert (=> b!883853 (= res!600189 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25198 _keys!868))))))

(declare-fun b!883854 () Bool)

(declare-fun res!600194 () Bool)

(assert (=> b!883854 (=> (not res!600194) (not e!491988))))

(assert (=> b!883854 (= res!600194 (and (= (select (arr!24757 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!883855 () Bool)

(declare-fun e!491991 () Bool)

(assert (=> b!883855 (= e!491992 (not e!491991))))

(declare-fun res!600183 () Bool)

(assert (=> b!883855 (=> res!600183 e!491991)))

(assert (=> b!883855 (= res!600183 (not (validKeyInArray!0 (select (arr!24757 _keys!868) from!1053))))))

(declare-fun lt!399875 () ListLongMap!10467)

(declare-fun lt!399881 () ListLongMap!10467)

(assert (=> b!883855 (= lt!399875 lt!399881)))

(declare-fun lt!399873 () ListLongMap!10467)

(declare-fun +!2563 (ListLongMap!10467 tuple2!11696) ListLongMap!10467)

(assert (=> b!883855 (= lt!399881 (+!2563 lt!399873 (tuple2!11697 k0!854 v!557)))))

(assert (=> b!883855 (= lt!399875 (getCurrentListMapNoExtraKeys!3288 _keys!868 lt!399880 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883855 (= lt!399873 (getCurrentListMapNoExtraKeys!3288 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30096 0))(
  ( (Unit!30097) )
))
(declare-fun lt!399882 () Unit!30096)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!727 (array!51485 array!51487 (_ BitVec 32) (_ BitVec 32) V!28593 V!28593 (_ BitVec 32) (_ BitVec 64) V!28593 (_ BitVec 32) Int) Unit!30096)

(assert (=> b!883855 (= lt!399882 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!727 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883856 () Bool)

(declare-fun res!600185 () Bool)

(assert (=> b!883856 (=> (not res!600185) (not e!491988))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883856 (= res!600185 (validMask!0 mask!1196))))

(declare-fun b!883857 () Bool)

(declare-fun e!491990 () Bool)

(assert (=> b!883857 (= e!491991 e!491990)))

(declare-fun res!600186 () Bool)

(assert (=> b!883857 (=> res!600186 e!491990)))

(assert (=> b!883857 (= res!600186 (not (= (select (arr!24757 _keys!868) from!1053) k0!854)))))

(declare-fun get!13058 (ValueCell!8390 V!28593) V!28593)

(declare-fun dynLambda!1281 (Int (_ BitVec 64)) V!28593)

(assert (=> b!883857 (= lt!399877 (+!2563 lt!399881 (tuple2!11697 (select (arr!24757 _keys!868) from!1053) (get!13058 (select (arr!24758 _values!688) from!1053) (dynLambda!1281 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!883858 () Bool)

(assert (=> b!883858 (= e!491990 e!491993)))

(declare-fun res!600191 () Bool)

(assert (=> b!883858 (=> res!600191 e!491993)))

(assert (=> b!883858 (= res!600191 (or (bvsge (size!25198 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!25198 _keys!868)) (bvsge from!1053 (size!25198 _keys!868))))))

(declare-fun arrayContainsKey!0 (array!51485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883858 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399876 () Unit!30096)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51485 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30096)

(assert (=> b!883858 (= lt!399876 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!883858 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17524)))

(declare-fun lt!399874 () Unit!30096)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51485 (_ BitVec 32) (_ BitVec 32)) Unit!30096)

(assert (=> b!883858 (= lt!399874 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (= (and start!75064 res!600182) b!883856))

(assert (= (and b!883856 res!600185) b!883850))

(assert (= (and b!883850 res!600192) b!883847))

(assert (= (and b!883847 res!600193) b!883844))

(assert (= (and b!883844 res!600188) b!883853))

(assert (= (and b!883853 res!600189) b!883846))

(assert (= (and b!883846 res!600190) b!883854))

(assert (= (and b!883854 res!600194) b!883849))

(assert (= (and b!883849 res!600187) b!883855))

(assert (= (and b!883855 (not res!600183)) b!883857))

(assert (= (and b!883857 (not res!600186)) b!883858))

(assert (= (and b!883858 (not res!600191)) b!883852))

(assert (= (and b!883852 (not res!600184)) b!883848))

(assert (= (and b!883848 (not res!600181)) b!883845))

(assert (= (and b!883843 condMapEmpty!28125) mapIsEmpty!28125))

(assert (= (and b!883843 (not condMapEmpty!28125)) mapNonEmpty!28125))

(get-info :version)

(assert (= (and mapNonEmpty!28125 ((_ is ValueCellFull!8390) mapValue!28125)) b!883842))

(assert (= (and b!883843 ((_ is ValueCellFull!8390) mapDefault!28125)) b!883851))

(assert (= start!75064 b!883843))

(declare-fun b_lambda!12707 () Bool)

(assert (=> (not b_lambda!12707) (not b!883857)))

(declare-fun t!24735 () Bool)

(declare-fun tb!5065 () Bool)

(assert (=> (and start!75064 (= defaultEntry!696 defaultEntry!696) t!24735) tb!5065))

(declare-fun result!9773 () Bool)

(assert (=> tb!5065 (= result!9773 tp_is_empty!17659)))

(assert (=> b!883857 t!24735))

(declare-fun b_and!25541 () Bool)

(assert (= b_and!25539 (and (=> t!24735 result!9773) b_and!25541)))

(declare-fun m!824235 () Bool)

(assert (=> b!883844 m!824235))

(declare-fun m!824237 () Bool)

(assert (=> b!883845 m!824237))

(declare-fun m!824239 () Bool)

(assert (=> b!883856 m!824239))

(declare-fun m!824241 () Bool)

(assert (=> start!75064 m!824241))

(declare-fun m!824243 () Bool)

(assert (=> start!75064 m!824243))

(declare-fun m!824245 () Bool)

(assert (=> b!883847 m!824245))

(declare-fun m!824247 () Bool)

(assert (=> b!883846 m!824247))

(declare-fun m!824249 () Bool)

(assert (=> mapNonEmpty!28125 m!824249))

(declare-fun m!824251 () Bool)

(assert (=> b!883857 m!824251))

(declare-fun m!824253 () Bool)

(assert (=> b!883857 m!824253))

(declare-fun m!824255 () Bool)

(assert (=> b!883857 m!824255))

(declare-fun m!824257 () Bool)

(assert (=> b!883857 m!824257))

(assert (=> b!883857 m!824253))

(declare-fun m!824259 () Bool)

(assert (=> b!883857 m!824259))

(assert (=> b!883857 m!824255))

(declare-fun m!824261 () Bool)

(assert (=> b!883852 m!824261))

(declare-fun m!824263 () Bool)

(assert (=> b!883848 m!824263))

(declare-fun m!824265 () Bool)

(assert (=> b!883858 m!824265))

(declare-fun m!824267 () Bool)

(assert (=> b!883858 m!824267))

(declare-fun m!824269 () Bool)

(assert (=> b!883858 m!824269))

(declare-fun m!824271 () Bool)

(assert (=> b!883858 m!824271))

(declare-fun m!824273 () Bool)

(assert (=> b!883854 m!824273))

(declare-fun m!824275 () Bool)

(assert (=> b!883855 m!824275))

(declare-fun m!824277 () Bool)

(assert (=> b!883855 m!824277))

(declare-fun m!824279 () Bool)

(assert (=> b!883855 m!824279))

(assert (=> b!883855 m!824259))

(declare-fun m!824281 () Bool)

(assert (=> b!883855 m!824281))

(assert (=> b!883855 m!824259))

(declare-fun m!824283 () Bool)

(assert (=> b!883855 m!824283))

(declare-fun m!824285 () Bool)

(assert (=> b!883849 m!824285))

(declare-fun m!824287 () Bool)

(assert (=> b!883849 m!824287))

(declare-fun m!824289 () Bool)

(assert (=> b!883849 m!824289))

(check-sat tp_is_empty!17659 (not b!883855) (not b!883857) (not b_lambda!12707) (not b!883844) (not b_next!15415) (not b!883852) (not b!883856) (not b!883845) (not b!883846) (not mapNonEmpty!28125) (not b!883848) (not b!883847) (not start!75064) (not b!883849) b_and!25541 (not b!883858))
(check-sat b_and!25541 (not b_next!15415))
