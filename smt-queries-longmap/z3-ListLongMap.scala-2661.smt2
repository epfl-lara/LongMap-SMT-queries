; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39786 () Bool)

(assert start!39786)

(declare-fun b_free!10053 () Bool)

(declare-fun b_next!10053 () Bool)

(assert (=> start!39786 (= b_free!10053 (not b_next!10053))))

(declare-fun tp!35687 () Bool)

(declare-fun b_and!17765 () Bool)

(assert (=> start!39786 (= tp!35687 b_and!17765)))

(declare-fun b!428902 () Bool)

(declare-fun e!254111 () Bool)

(declare-fun tp_is_empty!11205 () Bool)

(assert (=> b!428902 (= e!254111 tp_is_empty!11205)))

(declare-fun b!428903 () Bool)

(declare-fun res!251829 () Bool)

(declare-fun e!254116 () Bool)

(assert (=> b!428903 (=> (not res!251829) (not e!254116))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428903 (= res!251829 (validMask!0 mask!1025))))

(declare-fun b!428904 () Bool)

(declare-fun res!251826 () Bool)

(assert (=> b!428904 (=> (not res!251826) (not e!254116))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26247 0))(
  ( (array!26248 (arr!12573 (Array (_ BitVec 32) (_ BitVec 64))) (size!12925 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26247)

(assert (=> b!428904 (= res!251826 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12925 _keys!709))))))

(declare-fun res!251827 () Bool)

(assert (=> start!39786 (=> (not res!251827) (not e!254116))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39786 (= res!251827 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12925 _keys!709))))))

(assert (=> start!39786 e!254116))

(assert (=> start!39786 tp_is_empty!11205))

(assert (=> start!39786 tp!35687))

(assert (=> start!39786 true))

(declare-datatypes ((V!16045 0))(
  ( (V!16046 (val!5647 Int)) )
))
(declare-datatypes ((ValueCell!5259 0))(
  ( (ValueCellFull!5259 (v!7894 V!16045)) (EmptyCell!5259) )
))
(declare-datatypes ((array!26249 0))(
  ( (array!26250 (arr!12574 (Array (_ BitVec 32) ValueCell!5259)) (size!12926 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26249)

(declare-fun e!254112 () Bool)

(declare-fun array_inv!9164 (array!26249) Bool)

(assert (=> start!39786 (and (array_inv!9164 _values!549) e!254112)))

(declare-fun array_inv!9165 (array!26247) Bool)

(assert (=> start!39786 (array_inv!9165 _keys!709)))

(declare-fun b!428905 () Bool)

(declare-fun res!251832 () Bool)

(assert (=> b!428905 (=> (not res!251832) (not e!254116))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428905 (= res!251832 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18429 () Bool)

(declare-fun mapRes!18429 () Bool)

(assert (=> mapIsEmpty!18429 mapRes!18429))

(declare-fun b!428906 () Bool)

(declare-fun res!251820 () Bool)

(assert (=> b!428906 (=> (not res!251820) (not e!254116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428906 (= res!251820 (validKeyInArray!0 k0!794))))

(declare-fun b!428907 () Bool)

(declare-fun e!254110 () Bool)

(assert (=> b!428907 (= e!254116 e!254110)))

(declare-fun res!251819 () Bool)

(assert (=> b!428907 (=> (not res!251819) (not e!254110))))

(declare-fun lt!195990 () array!26247)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26247 (_ BitVec 32)) Bool)

(assert (=> b!428907 (= res!251819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195990 mask!1025))))

(assert (=> b!428907 (= lt!195990 (array!26248 (store (arr!12573 _keys!709) i!563 k0!794) (size!12925 _keys!709)))))

(declare-fun mapNonEmpty!18429 () Bool)

(declare-fun tp!35688 () Bool)

(assert (=> mapNonEmpty!18429 (= mapRes!18429 (and tp!35688 e!254111))))

(declare-fun mapKey!18429 () (_ BitVec 32))

(declare-fun mapValue!18429 () ValueCell!5259)

(declare-fun mapRest!18429 () (Array (_ BitVec 32) ValueCell!5259))

(assert (=> mapNonEmpty!18429 (= (arr!12574 _values!549) (store mapRest!18429 mapKey!18429 mapValue!18429))))

(declare-fun b!428908 () Bool)

(declare-fun res!251823 () Bool)

(assert (=> b!428908 (=> (not res!251823) (not e!254116))))

(assert (=> b!428908 (= res!251823 (or (= (select (arr!12573 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12573 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428909 () Bool)

(declare-fun e!254118 () Bool)

(assert (=> b!428909 (= e!254110 e!254118)))

(declare-fun res!251828 () Bool)

(assert (=> b!428909 (=> (not res!251828) (not e!254118))))

(assert (=> b!428909 (= res!251828 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195994 () array!26249)

(declare-fun minValue!515 () V!16045)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7436 0))(
  ( (tuple2!7437 (_1!3729 (_ BitVec 64)) (_2!3729 V!16045)) )
))
(declare-datatypes ((List!7450 0))(
  ( (Nil!7447) (Cons!7446 (h!8302 tuple2!7436) (t!12952 List!7450)) )
))
(declare-datatypes ((ListLongMap!6349 0))(
  ( (ListLongMap!6350 (toList!3190 List!7450)) )
))
(declare-fun lt!195989 () ListLongMap!6349)

(declare-fun zeroValue!515 () V!16045)

(declare-fun getCurrentListMapNoExtraKeys!1392 (array!26247 array!26249 (_ BitVec 32) (_ BitVec 32) V!16045 V!16045 (_ BitVec 32) Int) ListLongMap!6349)

(assert (=> b!428909 (= lt!195989 (getCurrentListMapNoExtraKeys!1392 lt!195990 lt!195994 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16045)

(assert (=> b!428909 (= lt!195994 (array!26250 (store (arr!12574 _values!549) i!563 (ValueCellFull!5259 v!412)) (size!12926 _values!549)))))

(declare-fun lt!195992 () ListLongMap!6349)

(assert (=> b!428909 (= lt!195992 (getCurrentListMapNoExtraKeys!1392 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428910 () Bool)

(declare-datatypes ((Unit!12598 0))(
  ( (Unit!12599) )
))
(declare-fun e!254115 () Unit!12598)

(declare-fun Unit!12600 () Unit!12598)

(assert (=> b!428910 (= e!254115 Unit!12600)))

(declare-fun b!428911 () Bool)

(declare-fun res!251821 () Bool)

(assert (=> b!428911 (=> (not res!251821) (not e!254116))))

(assert (=> b!428911 (= res!251821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428912 () Bool)

(declare-fun e!254114 () Bool)

(assert (=> b!428912 (= e!254114 tp_is_empty!11205)))

(declare-fun b!428913 () Bool)

(declare-fun res!251825 () Bool)

(assert (=> b!428913 (=> (not res!251825) (not e!254110))))

(assert (=> b!428913 (= res!251825 (bvsle from!863 i!563))))

(declare-fun b!428914 () Bool)

(declare-fun e!254113 () Bool)

(assert (=> b!428914 (= e!254113 true)))

(assert (=> b!428914 (not (= (select (arr!12573 _keys!709) from!863) k0!794))))

(declare-fun lt!195993 () Unit!12598)

(assert (=> b!428914 (= lt!195993 e!254115)))

(declare-fun c!55415 () Bool)

(assert (=> b!428914 (= c!55415 (= (select (arr!12573 _keys!709) from!863) k0!794))))

(declare-fun lt!195995 () ListLongMap!6349)

(declare-fun +!1341 (ListLongMap!6349 tuple2!7436) ListLongMap!6349)

(declare-fun get!6233 (ValueCell!5259 V!16045) V!16045)

(declare-fun dynLambda!768 (Int (_ BitVec 64)) V!16045)

(assert (=> b!428914 (= lt!195989 (+!1341 lt!195995 (tuple2!7437 (select (arr!12573 _keys!709) from!863) (get!6233 (select (arr!12574 _values!549) from!863) (dynLambda!768 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428915 () Bool)

(declare-fun res!251830 () Bool)

(assert (=> b!428915 (=> (not res!251830) (not e!254116))))

(assert (=> b!428915 (= res!251830 (and (= (size!12926 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12925 _keys!709) (size!12926 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428916 () Bool)

(assert (=> b!428916 (= e!254118 (not e!254113))))

(declare-fun res!251831 () Bool)

(assert (=> b!428916 (=> res!251831 e!254113)))

(assert (=> b!428916 (= res!251831 (not (validKeyInArray!0 (select (arr!12573 _keys!709) from!863))))))

(declare-fun lt!195987 () ListLongMap!6349)

(assert (=> b!428916 (= lt!195987 lt!195995)))

(declare-fun lt!195986 () ListLongMap!6349)

(assert (=> b!428916 (= lt!195995 (+!1341 lt!195986 (tuple2!7437 k0!794 v!412)))))

(assert (=> b!428916 (= lt!195987 (getCurrentListMapNoExtraKeys!1392 lt!195990 lt!195994 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428916 (= lt!195986 (getCurrentListMapNoExtraKeys!1392 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!195988 () Unit!12598)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!531 (array!26247 array!26249 (_ BitVec 32) (_ BitVec 32) V!16045 V!16045 (_ BitVec 32) (_ BitVec 64) V!16045 (_ BitVec 32) Int) Unit!12598)

(assert (=> b!428916 (= lt!195988 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!531 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428917 () Bool)

(declare-fun res!251822 () Bool)

(assert (=> b!428917 (=> (not res!251822) (not e!254110))))

(declare-datatypes ((List!7451 0))(
  ( (Nil!7448) (Cons!7447 (h!8303 (_ BitVec 64)) (t!12953 List!7451)) )
))
(declare-fun arrayNoDuplicates!0 (array!26247 (_ BitVec 32) List!7451) Bool)

(assert (=> b!428917 (= res!251822 (arrayNoDuplicates!0 lt!195990 #b00000000000000000000000000000000 Nil!7448))))

(declare-fun b!428918 () Bool)

(assert (=> b!428918 (= e!254112 (and e!254114 mapRes!18429))))

(declare-fun condMapEmpty!18429 () Bool)

(declare-fun mapDefault!18429 () ValueCell!5259)

(assert (=> b!428918 (= condMapEmpty!18429 (= (arr!12574 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5259)) mapDefault!18429)))))

(declare-fun b!428919 () Bool)

(declare-fun Unit!12601 () Unit!12598)

(assert (=> b!428919 (= e!254115 Unit!12601)))

(declare-fun lt!195991 () Unit!12598)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26247 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12598)

(assert (=> b!428919 (= lt!195991 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428919 false))

(declare-fun b!428920 () Bool)

(declare-fun res!251824 () Bool)

(assert (=> b!428920 (=> (not res!251824) (not e!254116))))

(assert (=> b!428920 (= res!251824 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7448))))

(assert (= (and start!39786 res!251827) b!428903))

(assert (= (and b!428903 res!251829) b!428915))

(assert (= (and b!428915 res!251830) b!428911))

(assert (= (and b!428911 res!251821) b!428920))

(assert (= (and b!428920 res!251824) b!428904))

(assert (= (and b!428904 res!251826) b!428906))

(assert (= (and b!428906 res!251820) b!428908))

(assert (= (and b!428908 res!251823) b!428905))

(assert (= (and b!428905 res!251832) b!428907))

(assert (= (and b!428907 res!251819) b!428917))

(assert (= (and b!428917 res!251822) b!428913))

(assert (= (and b!428913 res!251825) b!428909))

(assert (= (and b!428909 res!251828) b!428916))

(assert (= (and b!428916 (not res!251831)) b!428914))

(assert (= (and b!428914 c!55415) b!428919))

(assert (= (and b!428914 (not c!55415)) b!428910))

(assert (= (and b!428918 condMapEmpty!18429) mapIsEmpty!18429))

(assert (= (and b!428918 (not condMapEmpty!18429)) mapNonEmpty!18429))

(get-info :version)

(assert (= (and mapNonEmpty!18429 ((_ is ValueCellFull!5259) mapValue!18429)) b!428902))

(assert (= (and b!428918 ((_ is ValueCellFull!5259) mapDefault!18429)) b!428912))

(assert (= start!39786 b!428918))

(declare-fun b_lambda!9141 () Bool)

(assert (=> (not b_lambda!9141) (not b!428914)))

(declare-fun t!12951 () Bool)

(declare-fun tb!3459 () Bool)

(assert (=> (and start!39786 (= defaultEntry!557 defaultEntry!557) t!12951) tb!3459))

(declare-fun result!6445 () Bool)

(assert (=> tb!3459 (= result!6445 tp_is_empty!11205)))

(assert (=> b!428914 t!12951))

(declare-fun b_and!17767 () Bool)

(assert (= b_and!17765 (and (=> t!12951 result!6445) b_and!17767)))

(declare-fun m!417277 () Bool)

(assert (=> b!428911 m!417277))

(declare-fun m!417279 () Bool)

(assert (=> b!428908 m!417279))

(declare-fun m!417281 () Bool)

(assert (=> b!428903 m!417281))

(declare-fun m!417283 () Bool)

(assert (=> start!39786 m!417283))

(declare-fun m!417285 () Bool)

(assert (=> start!39786 m!417285))

(declare-fun m!417287 () Bool)

(assert (=> b!428914 m!417287))

(declare-fun m!417289 () Bool)

(assert (=> b!428914 m!417289))

(declare-fun m!417291 () Bool)

(assert (=> b!428914 m!417291))

(declare-fun m!417293 () Bool)

(assert (=> b!428914 m!417293))

(assert (=> b!428914 m!417293))

(assert (=> b!428914 m!417289))

(declare-fun m!417295 () Bool)

(assert (=> b!428914 m!417295))

(declare-fun m!417297 () Bool)

(assert (=> b!428917 m!417297))

(declare-fun m!417299 () Bool)

(assert (=> b!428919 m!417299))

(declare-fun m!417301 () Bool)

(assert (=> b!428920 m!417301))

(declare-fun m!417303 () Bool)

(assert (=> mapNonEmpty!18429 m!417303))

(assert (=> b!428916 m!417287))

(declare-fun m!417305 () Bool)

(assert (=> b!428916 m!417305))

(declare-fun m!417307 () Bool)

(assert (=> b!428916 m!417307))

(assert (=> b!428916 m!417287))

(declare-fun m!417309 () Bool)

(assert (=> b!428916 m!417309))

(declare-fun m!417311 () Bool)

(assert (=> b!428916 m!417311))

(declare-fun m!417313 () Bool)

(assert (=> b!428916 m!417313))

(declare-fun m!417315 () Bool)

(assert (=> b!428909 m!417315))

(declare-fun m!417317 () Bool)

(assert (=> b!428909 m!417317))

(declare-fun m!417319 () Bool)

(assert (=> b!428909 m!417319))

(declare-fun m!417321 () Bool)

(assert (=> b!428906 m!417321))

(declare-fun m!417323 () Bool)

(assert (=> b!428905 m!417323))

(declare-fun m!417325 () Bool)

(assert (=> b!428907 m!417325))

(declare-fun m!417327 () Bool)

(assert (=> b!428907 m!417327))

(check-sat b_and!17767 tp_is_empty!11205 (not b!428914) (not b_lambda!9141) (not b!428920) (not b!428919) (not b!428916) (not b!428905) (not b!428907) (not b!428903) (not b!428911) (not mapNonEmpty!18429) (not start!39786) (not b_next!10053) (not b!428909) (not b!428917) (not b!428906))
(check-sat b_and!17767 (not b_next!10053))
