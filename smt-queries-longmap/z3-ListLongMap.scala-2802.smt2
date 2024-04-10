; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40702 () Bool)

(assert start!40702)

(declare-fun b_free!10713 () Bool)

(declare-fun b_next!10713 () Bool)

(assert (=> start!40702 (= b_free!10713 (not b_next!10713))))

(declare-fun tp!37958 () Bool)

(declare-fun b_and!18721 () Bool)

(assert (=> start!40702 (= tp!37958 b_and!18721)))

(declare-fun b!450286 () Bool)

(declare-fun res!267991 () Bool)

(declare-fun e!263888 () Bool)

(assert (=> b!450286 (=> (not res!267991) (not e!263888))))

(declare-datatypes ((array!27909 0))(
  ( (array!27910 (arr!13400 (Array (_ BitVec 32) (_ BitVec 64))) (size!13752 (_ BitVec 32))) )
))
(declare-fun lt!204567 () array!27909)

(declare-datatypes ((List!8039 0))(
  ( (Nil!8036) (Cons!8035 (h!8891 (_ BitVec 64)) (t!13801 List!8039)) )
))
(declare-fun arrayNoDuplicates!0 (array!27909 (_ BitVec 32) List!8039) Bool)

(assert (=> b!450286 (= res!267991 (arrayNoDuplicates!0 lt!204567 #b00000000000000000000000000000000 Nil!8036))))

(declare-fun b!450287 () Bool)

(declare-fun res!267986 () Bool)

(declare-fun e!263886 () Bool)

(assert (=> b!450287 (=> (not res!267986) (not e!263886))))

(declare-fun _keys!709 () array!27909)

(assert (=> b!450287 (= res!267986 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8036))))

(declare-fun b!450288 () Bool)

(declare-fun e!263889 () Bool)

(declare-datatypes ((V!17173 0))(
  ( (V!17174 (val!6070 Int)) )
))
(declare-datatypes ((tuple2!7970 0))(
  ( (tuple2!7971 (_1!3996 (_ BitVec 64)) (_2!3996 V!17173)) )
))
(declare-datatypes ((List!8040 0))(
  ( (Nil!8037) (Cons!8036 (h!8892 tuple2!7970) (t!13802 List!8040)) )
))
(declare-datatypes ((ListLongMap!6883 0))(
  ( (ListLongMap!6884 (toList!3457 List!8040)) )
))
(declare-fun call!29732 () ListLongMap!6883)

(declare-fun call!29731 () ListLongMap!6883)

(assert (=> b!450288 (= e!263889 (= call!29732 call!29731))))

(declare-fun minValue!515 () V!17173)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5682 0))(
  ( (ValueCellFull!5682 (v!8325 V!17173)) (EmptyCell!5682) )
))
(declare-datatypes ((array!27911 0))(
  ( (array!27912 (arr!13401 (Array (_ BitVec 32) ValueCell!5682)) (size!13753 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27911)

(declare-fun zeroValue!515 () V!17173)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun bm!29728 () Bool)

(declare-fun c!55976 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!204566 () array!27911)

(declare-fun getCurrentListMapNoExtraKeys!1643 (array!27909 array!27911 (_ BitVec 32) (_ BitVec 32) V!17173 V!17173 (_ BitVec 32) Int) ListLongMap!6883)

(assert (=> bm!29728 (= call!29732 (getCurrentListMapNoExtraKeys!1643 (ite c!55976 _keys!709 lt!204567) (ite c!55976 _values!549 lt!204566) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!19710 () Bool)

(declare-fun mapRes!19710 () Bool)

(declare-fun tp!37959 () Bool)

(declare-fun e!263887 () Bool)

(assert (=> mapNonEmpty!19710 (= mapRes!19710 (and tp!37959 e!263887))))

(declare-fun mapRest!19710 () (Array (_ BitVec 32) ValueCell!5682))

(declare-fun mapValue!19710 () ValueCell!5682)

(declare-fun mapKey!19710 () (_ BitVec 32))

(assert (=> mapNonEmpty!19710 (= (arr!13401 _values!549) (store mapRest!19710 mapKey!19710 mapValue!19710))))

(declare-fun b!450290 () Bool)

(declare-fun res!267990 () Bool)

(assert (=> b!450290 (=> (not res!267990) (not e!263886))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450290 (= res!267990 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13752 _keys!709))))))

(declare-fun b!450291 () Bool)

(declare-fun e!263893 () Bool)

(assert (=> b!450291 (= e!263893 (bvslt i!563 (size!13753 _values!549)))))

(declare-fun b!450292 () Bool)

(declare-fun res!267981 () Bool)

(assert (=> b!450292 (=> (not res!267981) (not e!263886))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450292 (= res!267981 (validKeyInArray!0 k0!794))))

(declare-fun b!450293 () Bool)

(declare-fun e!263890 () Bool)

(declare-fun tp_is_empty!12051 () Bool)

(assert (=> b!450293 (= e!263890 tp_is_empty!12051)))

(declare-fun v!412 () V!17173)

(declare-fun b!450294 () Bool)

(declare-fun +!1540 (ListLongMap!6883 tuple2!7970) ListLongMap!6883)

(assert (=> b!450294 (= e!263889 (= call!29731 (+!1540 call!29732 (tuple2!7971 k0!794 v!412))))))

(declare-fun b!450295 () Bool)

(assert (=> b!450295 (= e!263887 tp_is_empty!12051)))

(declare-fun b!450296 () Bool)

(declare-fun e!263894 () Bool)

(assert (=> b!450296 (= e!263888 e!263894)))

(declare-fun res!267988 () Bool)

(assert (=> b!450296 (=> (not res!267988) (not e!263894))))

(assert (=> b!450296 (= res!267988 (= from!863 i!563))))

(declare-fun lt!204570 () ListLongMap!6883)

(assert (=> b!450296 (= lt!204570 (getCurrentListMapNoExtraKeys!1643 lt!204567 lt!204566 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!450296 (= lt!204566 (array!27912 (store (arr!13401 _values!549) i!563 (ValueCellFull!5682 v!412)) (size!13753 _values!549)))))

(declare-fun lt!204569 () ListLongMap!6883)

(assert (=> b!450296 (= lt!204569 (getCurrentListMapNoExtraKeys!1643 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450297 () Bool)

(assert (=> b!450297 (= e!263894 (not e!263893))))

(declare-fun res!267993 () Bool)

(assert (=> b!450297 (=> res!267993 e!263893)))

(assert (=> b!450297 (= res!267993 (validKeyInArray!0 (select (arr!13400 _keys!709) from!863)))))

(assert (=> b!450297 e!263889))

(assert (=> b!450297 (= c!55976 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13190 0))(
  ( (Unit!13191) )
))
(declare-fun lt!204568 () Unit!13190)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!710 (array!27909 array!27911 (_ BitVec 32) (_ BitVec 32) V!17173 V!17173 (_ BitVec 32) (_ BitVec 64) V!17173 (_ BitVec 32) Int) Unit!13190)

(assert (=> b!450297 (= lt!204568 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!710 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450298 () Bool)

(declare-fun res!267985 () Bool)

(assert (=> b!450298 (=> (not res!267985) (not e!263888))))

(assert (=> b!450298 (= res!267985 (bvsle from!863 i!563))))

(declare-fun b!450289 () Bool)

(declare-fun res!267984 () Bool)

(assert (=> b!450289 (=> (not res!267984) (not e!263886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27909 (_ BitVec 32)) Bool)

(assert (=> b!450289 (= res!267984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!267980 () Bool)

(assert (=> start!40702 (=> (not res!267980) (not e!263886))))

(assert (=> start!40702 (= res!267980 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13752 _keys!709))))))

(assert (=> start!40702 e!263886))

(assert (=> start!40702 tp_is_empty!12051))

(assert (=> start!40702 tp!37958))

(assert (=> start!40702 true))

(declare-fun e!263891 () Bool)

(declare-fun array_inv!9702 (array!27911) Bool)

(assert (=> start!40702 (and (array_inv!9702 _values!549) e!263891)))

(declare-fun array_inv!9703 (array!27909) Bool)

(assert (=> start!40702 (array_inv!9703 _keys!709)))

(declare-fun b!450299 () Bool)

(declare-fun res!267989 () Bool)

(assert (=> b!450299 (=> (not res!267989) (not e!263886))))

(assert (=> b!450299 (= res!267989 (and (= (size!13753 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13752 _keys!709) (size!13753 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19710 () Bool)

(assert (=> mapIsEmpty!19710 mapRes!19710))

(declare-fun bm!29729 () Bool)

(assert (=> bm!29729 (= call!29731 (getCurrentListMapNoExtraKeys!1643 (ite c!55976 lt!204567 _keys!709) (ite c!55976 lt!204566 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450300 () Bool)

(assert (=> b!450300 (= e!263891 (and e!263890 mapRes!19710))))

(declare-fun condMapEmpty!19710 () Bool)

(declare-fun mapDefault!19710 () ValueCell!5682)

(assert (=> b!450300 (= condMapEmpty!19710 (= (arr!13401 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5682)) mapDefault!19710)))))

(declare-fun b!450301 () Bool)

(assert (=> b!450301 (= e!263886 e!263888)))

(declare-fun res!267983 () Bool)

(assert (=> b!450301 (=> (not res!267983) (not e!263888))))

(assert (=> b!450301 (= res!267983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204567 mask!1025))))

(assert (=> b!450301 (= lt!204567 (array!27910 (store (arr!13400 _keys!709) i!563 k0!794) (size!13752 _keys!709)))))

(declare-fun b!450302 () Bool)

(declare-fun res!267992 () Bool)

(assert (=> b!450302 (=> (not res!267992) (not e!263886))))

(declare-fun arrayContainsKey!0 (array!27909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450302 (= res!267992 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!450303 () Bool)

(declare-fun res!267987 () Bool)

(assert (=> b!450303 (=> (not res!267987) (not e!263886))))

(assert (=> b!450303 (= res!267987 (or (= (select (arr!13400 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13400 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!450304 () Bool)

(declare-fun res!267982 () Bool)

(assert (=> b!450304 (=> (not res!267982) (not e!263886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450304 (= res!267982 (validMask!0 mask!1025))))

(assert (= (and start!40702 res!267980) b!450304))

(assert (= (and b!450304 res!267982) b!450299))

(assert (= (and b!450299 res!267989) b!450289))

(assert (= (and b!450289 res!267984) b!450287))

(assert (= (and b!450287 res!267986) b!450290))

(assert (= (and b!450290 res!267990) b!450292))

(assert (= (and b!450292 res!267981) b!450303))

(assert (= (and b!450303 res!267987) b!450302))

(assert (= (and b!450302 res!267992) b!450301))

(assert (= (and b!450301 res!267983) b!450286))

(assert (= (and b!450286 res!267991) b!450298))

(assert (= (and b!450298 res!267985) b!450296))

(assert (= (and b!450296 res!267988) b!450297))

(assert (= (and b!450297 c!55976) b!450294))

(assert (= (and b!450297 (not c!55976)) b!450288))

(assert (= (or b!450294 b!450288) bm!29729))

(assert (= (or b!450294 b!450288) bm!29728))

(assert (= (and b!450297 (not res!267993)) b!450291))

(assert (= (and b!450300 condMapEmpty!19710) mapIsEmpty!19710))

(assert (= (and b!450300 (not condMapEmpty!19710)) mapNonEmpty!19710))

(get-info :version)

(assert (= (and mapNonEmpty!19710 ((_ is ValueCellFull!5682) mapValue!19710)) b!450295))

(assert (= (and b!450300 ((_ is ValueCellFull!5682) mapDefault!19710)) b!450293))

(assert (= start!40702 b!450300))

(declare-fun m!434233 () Bool)

(assert (=> mapNonEmpty!19710 m!434233))

(declare-fun m!434235 () Bool)

(assert (=> bm!29728 m!434235))

(declare-fun m!434237 () Bool)

(assert (=> b!450302 m!434237))

(declare-fun m!434239 () Bool)

(assert (=> b!450289 m!434239))

(declare-fun m!434241 () Bool)

(assert (=> b!450287 m!434241))

(declare-fun m!434243 () Bool)

(assert (=> b!450297 m!434243))

(assert (=> b!450297 m!434243))

(declare-fun m!434245 () Bool)

(assert (=> b!450297 m!434245))

(declare-fun m!434247 () Bool)

(assert (=> b!450297 m!434247))

(declare-fun m!434249 () Bool)

(assert (=> b!450286 m!434249))

(declare-fun m!434251 () Bool)

(assert (=> b!450292 m!434251))

(declare-fun m!434253 () Bool)

(assert (=> b!450294 m!434253))

(declare-fun m!434255 () Bool)

(assert (=> b!450303 m!434255))

(declare-fun m!434257 () Bool)

(assert (=> start!40702 m!434257))

(declare-fun m!434259 () Bool)

(assert (=> start!40702 m!434259))

(declare-fun m!434261 () Bool)

(assert (=> b!450296 m!434261))

(declare-fun m!434263 () Bool)

(assert (=> b!450296 m!434263))

(declare-fun m!434265 () Bool)

(assert (=> b!450296 m!434265))

(declare-fun m!434267 () Bool)

(assert (=> b!450304 m!434267))

(declare-fun m!434269 () Bool)

(assert (=> b!450301 m!434269))

(declare-fun m!434271 () Bool)

(assert (=> b!450301 m!434271))

(declare-fun m!434273 () Bool)

(assert (=> bm!29729 m!434273))

(check-sat (not b!450292) (not b!450304) (not start!40702) (not b!450286) (not bm!29729) (not b!450289) (not b!450296) (not bm!29728) tp_is_empty!12051 (not b_next!10713) b_and!18721 (not b!450287) (not b!450302) (not b!450297) (not b!450301) (not mapNonEmpty!19710) (not b!450294))
(check-sat b_and!18721 (not b_next!10713))
