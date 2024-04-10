; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40542 () Bool)

(assert start!40542)

(declare-fun b_free!10569 () Bool)

(declare-fun b_next!10569 () Bool)

(assert (=> start!40542 (= b_free!10569 (not b_next!10569))))

(declare-fun tp!37524 () Bool)

(declare-fun b_and!18569 () Bool)

(assert (=> start!40542 (= tp!37524 b_and!18569)))

(declare-fun b!446872 () Bool)

(declare-fun e!262472 () Bool)

(declare-fun e!262471 () Bool)

(declare-fun mapRes!19491 () Bool)

(assert (=> b!446872 (= e!262472 (and e!262471 mapRes!19491))))

(declare-fun condMapEmpty!19491 () Bool)

(declare-datatypes ((V!16981 0))(
  ( (V!16982 (val!5998 Int)) )
))
(declare-datatypes ((ValueCell!5610 0))(
  ( (ValueCellFull!5610 (v!8253 V!16981)) (EmptyCell!5610) )
))
(declare-datatypes ((array!27619 0))(
  ( (array!27620 (arr!13256 (Array (_ BitVec 32) ValueCell!5610)) (size!13608 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27619)

(declare-fun mapDefault!19491 () ValueCell!5610)

(assert (=> b!446872 (= condMapEmpty!19491 (= (arr!13256 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5610)) mapDefault!19491)))))

(declare-fun b!446873 () Bool)

(declare-fun tp_is_empty!11907 () Bool)

(assert (=> b!446873 (= e!262471 tp_is_empty!11907)))

(declare-fun minValue!515 () V!16981)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16981)

(declare-datatypes ((array!27621 0))(
  ( (array!27622 (arr!13257 (Array (_ BitVec 32) (_ BitVec 64))) (size!13609 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27621)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!203858 () array!27621)

(declare-fun b!446874 () Bool)

(declare-fun v!412 () V!16981)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun e!262475 () Bool)

(declare-datatypes ((tuple2!7866 0))(
  ( (tuple2!7867 (_1!3944 (_ BitVec 64)) (_2!3944 V!16981)) )
))
(declare-datatypes ((List!7928 0))(
  ( (Nil!7925) (Cons!7924 (h!8780 tuple2!7866) (t!13688 List!7928)) )
))
(declare-datatypes ((ListLongMap!6779 0))(
  ( (ListLongMap!6780 (toList!3405 List!7928)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1591 (array!27621 array!27619 (_ BitVec 32) (_ BitVec 32) V!16981 V!16981 (_ BitVec 32) Int) ListLongMap!6779)

(assert (=> b!446874 (= e!262475 (not (= (getCurrentListMapNoExtraKeys!1591 lt!203858 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5610 v!412)) (size!13608 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) (getCurrentListMapNoExtraKeys!1591 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))))

(declare-fun mapNonEmpty!19491 () Bool)

(declare-fun tp!37523 () Bool)

(declare-fun e!262474 () Bool)

(assert (=> mapNonEmpty!19491 (= mapRes!19491 (and tp!37523 e!262474))))

(declare-fun mapRest!19491 () (Array (_ BitVec 32) ValueCell!5610))

(declare-fun mapKey!19491 () (_ BitVec 32))

(declare-fun mapValue!19491 () ValueCell!5610)

(assert (=> mapNonEmpty!19491 (= (arr!13256 _values!549) (store mapRest!19491 mapKey!19491 mapValue!19491))))

(declare-fun mapIsEmpty!19491 () Bool)

(assert (=> mapIsEmpty!19491 mapRes!19491))

(declare-fun b!446875 () Bool)

(declare-fun e!262476 () Bool)

(assert (=> b!446875 (= e!262476 e!262475)))

(declare-fun res!265329 () Bool)

(assert (=> b!446875 (=> (not res!265329) (not e!262475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27621 (_ BitVec 32)) Bool)

(assert (=> b!446875 (= res!265329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203858 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!446875 (= lt!203858 (array!27622 (store (arr!13257 _keys!709) i!563 k0!794) (size!13609 _keys!709)))))

(declare-fun b!446876 () Bool)

(declare-fun res!265320 () Bool)

(assert (=> b!446876 (=> (not res!265320) (not e!262475))))

(declare-datatypes ((List!7929 0))(
  ( (Nil!7926) (Cons!7925 (h!8781 (_ BitVec 64)) (t!13689 List!7929)) )
))
(declare-fun arrayNoDuplicates!0 (array!27621 (_ BitVec 32) List!7929) Bool)

(assert (=> b!446876 (= res!265320 (arrayNoDuplicates!0 lt!203858 #b00000000000000000000000000000000 Nil!7926))))

(declare-fun b!446877 () Bool)

(declare-fun res!265328 () Bool)

(assert (=> b!446877 (=> (not res!265328) (not e!262476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446877 (= res!265328 (validMask!0 mask!1025))))

(declare-fun b!446878 () Bool)

(declare-fun res!265324 () Bool)

(assert (=> b!446878 (=> (not res!265324) (not e!262476))))

(assert (=> b!446878 (= res!265324 (and (= (size!13608 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13609 _keys!709) (size!13608 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446879 () Bool)

(declare-fun res!265321 () Bool)

(assert (=> b!446879 (=> (not res!265321) (not e!262475))))

(assert (=> b!446879 (= res!265321 (and (bvsgt from!863 i!563) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13609 _keys!709))))))

(declare-fun b!446881 () Bool)

(declare-fun res!265319 () Bool)

(assert (=> b!446881 (=> (not res!265319) (not e!262476))))

(assert (=> b!446881 (= res!265319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446882 () Bool)

(assert (=> b!446882 (= e!262474 tp_is_empty!11907)))

(declare-fun b!446883 () Bool)

(declare-fun res!265327 () Bool)

(assert (=> b!446883 (=> (not res!265327) (not e!262476))))

(declare-fun arrayContainsKey!0 (array!27621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446883 (= res!265327 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446884 () Bool)

(declare-fun res!265318 () Bool)

(assert (=> b!446884 (=> (not res!265318) (not e!262476))))

(assert (=> b!446884 (= res!265318 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13609 _keys!709))))))

(declare-fun b!446885 () Bool)

(declare-fun res!265325 () Bool)

(assert (=> b!446885 (=> (not res!265325) (not e!262476))))

(assert (=> b!446885 (= res!265325 (or (= (select (arr!13257 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13257 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446886 () Bool)

(declare-fun res!265323 () Bool)

(assert (=> b!446886 (=> (not res!265323) (not e!262476))))

(assert (=> b!446886 (= res!265323 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7926))))

(declare-fun res!265326 () Bool)

(assert (=> start!40542 (=> (not res!265326) (not e!262476))))

(assert (=> start!40542 (= res!265326 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13609 _keys!709))))))

(assert (=> start!40542 e!262476))

(assert (=> start!40542 tp_is_empty!11907))

(assert (=> start!40542 tp!37524))

(assert (=> start!40542 true))

(declare-fun array_inv!9612 (array!27619) Bool)

(assert (=> start!40542 (and (array_inv!9612 _values!549) e!262472)))

(declare-fun array_inv!9613 (array!27621) Bool)

(assert (=> start!40542 (array_inv!9613 _keys!709)))

(declare-fun b!446880 () Bool)

(declare-fun res!265322 () Bool)

(assert (=> b!446880 (=> (not res!265322) (not e!262476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446880 (= res!265322 (validKeyInArray!0 k0!794))))

(assert (= (and start!40542 res!265326) b!446877))

(assert (= (and b!446877 res!265328) b!446878))

(assert (= (and b!446878 res!265324) b!446881))

(assert (= (and b!446881 res!265319) b!446886))

(assert (= (and b!446886 res!265323) b!446884))

(assert (= (and b!446884 res!265318) b!446880))

(assert (= (and b!446880 res!265322) b!446885))

(assert (= (and b!446885 res!265325) b!446883))

(assert (= (and b!446883 res!265327) b!446875))

(assert (= (and b!446875 res!265329) b!446876))

(assert (= (and b!446876 res!265320) b!446879))

(assert (= (and b!446879 res!265321) b!446874))

(assert (= (and b!446872 condMapEmpty!19491) mapIsEmpty!19491))

(assert (= (and b!446872 (not condMapEmpty!19491)) mapNonEmpty!19491))

(get-info :version)

(assert (= (and mapNonEmpty!19491 ((_ is ValueCellFull!5610) mapValue!19491)) b!446882))

(assert (= (and b!446872 ((_ is ValueCellFull!5610) mapDefault!19491)) b!446873))

(assert (= start!40542 b!446872))

(declare-fun m!431943 () Bool)

(assert (=> b!446876 m!431943))

(declare-fun m!431945 () Bool)

(assert (=> b!446883 m!431945))

(declare-fun m!431947 () Bool)

(assert (=> b!446881 m!431947))

(declare-fun m!431949 () Bool)

(assert (=> b!446880 m!431949))

(declare-fun m!431951 () Bool)

(assert (=> b!446886 m!431951))

(declare-fun m!431953 () Bool)

(assert (=> b!446877 m!431953))

(declare-fun m!431955 () Bool)

(assert (=> mapNonEmpty!19491 m!431955))

(declare-fun m!431957 () Bool)

(assert (=> b!446885 m!431957))

(declare-fun m!431959 () Bool)

(assert (=> b!446874 m!431959))

(declare-fun m!431961 () Bool)

(assert (=> b!446874 m!431961))

(declare-fun m!431963 () Bool)

(assert (=> b!446874 m!431963))

(declare-fun m!431965 () Bool)

(assert (=> start!40542 m!431965))

(declare-fun m!431967 () Bool)

(assert (=> start!40542 m!431967))

(declare-fun m!431969 () Bool)

(assert (=> b!446875 m!431969))

(declare-fun m!431971 () Bool)

(assert (=> b!446875 m!431971))

(check-sat (not b!446877) b_and!18569 (not b!446880) (not b_next!10569) (not b!446874) tp_is_empty!11907 (not start!40542) (not b!446875) (not b!446883) (not b!446886) (not b!446876) (not mapNonEmpty!19491) (not b!446881))
(check-sat b_and!18569 (not b_next!10569))
(get-model)

(declare-fun b!446942 () Bool)

(declare-fun e!262505 () Bool)

(declare-fun e!262504 () Bool)

(assert (=> b!446942 (= e!262505 e!262504)))

(declare-fun c!55931 () Bool)

(assert (=> b!446942 (= c!55931 (validKeyInArray!0 (select (arr!13257 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74183 () Bool)

(declare-fun res!265372 () Bool)

(declare-fun e!262506 () Bool)

(assert (=> d!74183 (=> res!265372 e!262506)))

(assert (=> d!74183 (= res!265372 (bvsge #b00000000000000000000000000000000 (size!13609 _keys!709)))))

(assert (=> d!74183 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7926) e!262506)))

(declare-fun bm!29672 () Bool)

(declare-fun call!29675 () Bool)

(assert (=> bm!29672 (= call!29675 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55931 (Cons!7925 (select (arr!13257 _keys!709) #b00000000000000000000000000000000) Nil!7926) Nil!7926)))))

(declare-fun b!446943 () Bool)

(assert (=> b!446943 (= e!262504 call!29675)))

(declare-fun b!446944 () Bool)

(assert (=> b!446944 (= e!262504 call!29675)))

(declare-fun b!446945 () Bool)

(assert (=> b!446945 (= e!262506 e!262505)))

(declare-fun res!265373 () Bool)

(assert (=> b!446945 (=> (not res!265373) (not e!262505))))

(declare-fun e!262503 () Bool)

(assert (=> b!446945 (= res!265373 (not e!262503))))

(declare-fun res!265374 () Bool)

(assert (=> b!446945 (=> (not res!265374) (not e!262503))))

(assert (=> b!446945 (= res!265374 (validKeyInArray!0 (select (arr!13257 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!446946 () Bool)

(declare-fun contains!2492 (List!7929 (_ BitVec 64)) Bool)

(assert (=> b!446946 (= e!262503 (contains!2492 Nil!7926 (select (arr!13257 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74183 (not res!265372)) b!446945))

(assert (= (and b!446945 res!265374) b!446946))

(assert (= (and b!446945 res!265373) b!446942))

(assert (= (and b!446942 c!55931) b!446944))

(assert (= (and b!446942 (not c!55931)) b!446943))

(assert (= (or b!446944 b!446943) bm!29672))

(declare-fun m!432003 () Bool)

(assert (=> b!446942 m!432003))

(assert (=> b!446942 m!432003))

(declare-fun m!432005 () Bool)

(assert (=> b!446942 m!432005))

(assert (=> bm!29672 m!432003))

(declare-fun m!432007 () Bool)

(assert (=> bm!29672 m!432007))

(assert (=> b!446945 m!432003))

(assert (=> b!446945 m!432003))

(assert (=> b!446945 m!432005))

(assert (=> b!446946 m!432003))

(assert (=> b!446946 m!432003))

(declare-fun m!432009 () Bool)

(assert (=> b!446946 m!432009))

(assert (=> b!446886 d!74183))

(declare-fun b!446955 () Bool)

(declare-fun e!262515 () Bool)

(declare-fun call!29678 () Bool)

(assert (=> b!446955 (= e!262515 call!29678)))

(declare-fun b!446956 () Bool)

(declare-fun e!262514 () Bool)

(assert (=> b!446956 (= e!262514 call!29678)))

(declare-fun b!446958 () Bool)

(declare-fun e!262513 () Bool)

(assert (=> b!446958 (= e!262513 e!262514)))

(declare-fun c!55934 () Bool)

(assert (=> b!446958 (= c!55934 (validKeyInArray!0 (select (arr!13257 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!29675 () Bool)

(assert (=> bm!29675 (= call!29678 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun d!74185 () Bool)

(declare-fun res!265380 () Bool)

(assert (=> d!74185 (=> res!265380 e!262513)))

(assert (=> d!74185 (= res!265380 (bvsge #b00000000000000000000000000000000 (size!13609 _keys!709)))))

(assert (=> d!74185 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!262513)))

(declare-fun b!446957 () Bool)

(assert (=> b!446957 (= e!262514 e!262515)))

(declare-fun lt!203869 () (_ BitVec 64))

(assert (=> b!446957 (= lt!203869 (select (arr!13257 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13180 0))(
  ( (Unit!13181) )
))
(declare-fun lt!203870 () Unit!13180)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!27621 (_ BitVec 64) (_ BitVec 32)) Unit!13180)

(assert (=> b!446957 (= lt!203870 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!203869 #b00000000000000000000000000000000))))

(assert (=> b!446957 (arrayContainsKey!0 _keys!709 lt!203869 #b00000000000000000000000000000000)))

(declare-fun lt!203868 () Unit!13180)

(assert (=> b!446957 (= lt!203868 lt!203870)))

(declare-fun res!265379 () Bool)

(declare-datatypes ((SeekEntryResult!3530 0))(
  ( (MissingZero!3530 (index!16299 (_ BitVec 32))) (Found!3530 (index!16300 (_ BitVec 32))) (Intermediate!3530 (undefined!4342 Bool) (index!16301 (_ BitVec 32)) (x!42059 (_ BitVec 32))) (Undefined!3530) (MissingVacant!3530 (index!16302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!27621 (_ BitVec 32)) SeekEntryResult!3530)

(assert (=> b!446957 (= res!265379 (= (seekEntryOrOpen!0 (select (arr!13257 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3530 #b00000000000000000000000000000000)))))

(assert (=> b!446957 (=> (not res!265379) (not e!262515))))

(assert (= (and d!74185 (not res!265380)) b!446958))

(assert (= (and b!446958 c!55934) b!446957))

(assert (= (and b!446958 (not c!55934)) b!446956))

(assert (= (and b!446957 res!265379) b!446955))

(assert (= (or b!446955 b!446956) bm!29675))

(assert (=> b!446958 m!432003))

(assert (=> b!446958 m!432003))

(assert (=> b!446958 m!432005))

(declare-fun m!432011 () Bool)

(assert (=> bm!29675 m!432011))

(assert (=> b!446957 m!432003))

(declare-fun m!432013 () Bool)

(assert (=> b!446957 m!432013))

(declare-fun m!432015 () Bool)

(assert (=> b!446957 m!432015))

(assert (=> b!446957 m!432003))

(declare-fun m!432017 () Bool)

(assert (=> b!446957 m!432017))

(assert (=> b!446881 d!74185))

(declare-fun b!446959 () Bool)

(declare-fun e!262518 () Bool)

(declare-fun e!262517 () Bool)

(assert (=> b!446959 (= e!262518 e!262517)))

(declare-fun c!55935 () Bool)

(assert (=> b!446959 (= c!55935 (validKeyInArray!0 (select (arr!13257 lt!203858) #b00000000000000000000000000000000)))))

(declare-fun d!74187 () Bool)

(declare-fun res!265381 () Bool)

(declare-fun e!262519 () Bool)

(assert (=> d!74187 (=> res!265381 e!262519)))

(assert (=> d!74187 (= res!265381 (bvsge #b00000000000000000000000000000000 (size!13609 lt!203858)))))

(assert (=> d!74187 (= (arrayNoDuplicates!0 lt!203858 #b00000000000000000000000000000000 Nil!7926) e!262519)))

(declare-fun bm!29676 () Bool)

(declare-fun call!29679 () Bool)

(assert (=> bm!29676 (= call!29679 (arrayNoDuplicates!0 lt!203858 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55935 (Cons!7925 (select (arr!13257 lt!203858) #b00000000000000000000000000000000) Nil!7926) Nil!7926)))))

(declare-fun b!446960 () Bool)

(assert (=> b!446960 (= e!262517 call!29679)))

(declare-fun b!446961 () Bool)

(assert (=> b!446961 (= e!262517 call!29679)))

(declare-fun b!446962 () Bool)

(assert (=> b!446962 (= e!262519 e!262518)))

(declare-fun res!265382 () Bool)

(assert (=> b!446962 (=> (not res!265382) (not e!262518))))

(declare-fun e!262516 () Bool)

(assert (=> b!446962 (= res!265382 (not e!262516))))

(declare-fun res!265383 () Bool)

(assert (=> b!446962 (=> (not res!265383) (not e!262516))))

(assert (=> b!446962 (= res!265383 (validKeyInArray!0 (select (arr!13257 lt!203858) #b00000000000000000000000000000000)))))

(declare-fun b!446963 () Bool)

(assert (=> b!446963 (= e!262516 (contains!2492 Nil!7926 (select (arr!13257 lt!203858) #b00000000000000000000000000000000)))))

(assert (= (and d!74187 (not res!265381)) b!446962))

(assert (= (and b!446962 res!265383) b!446963))

(assert (= (and b!446962 res!265382) b!446959))

(assert (= (and b!446959 c!55935) b!446961))

(assert (= (and b!446959 (not c!55935)) b!446960))

(assert (= (or b!446961 b!446960) bm!29676))

(declare-fun m!432019 () Bool)

(assert (=> b!446959 m!432019))

(assert (=> b!446959 m!432019))

(declare-fun m!432021 () Bool)

(assert (=> b!446959 m!432021))

(assert (=> bm!29676 m!432019))

(declare-fun m!432023 () Bool)

(assert (=> bm!29676 m!432023))

(assert (=> b!446962 m!432019))

(assert (=> b!446962 m!432019))

(assert (=> b!446962 m!432021))

(assert (=> b!446963 m!432019))

(assert (=> b!446963 m!432019))

(declare-fun m!432025 () Bool)

(assert (=> b!446963 m!432025))

(assert (=> b!446876 d!74187))

(declare-fun d!74189 () Bool)

(assert (=> d!74189 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!446880 d!74189))

(declare-fun d!74191 () Bool)

(assert (=> d!74191 (= (array_inv!9612 _values!549) (bvsge (size!13608 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40542 d!74191))

(declare-fun d!74193 () Bool)

(assert (=> d!74193 (= (array_inv!9613 _keys!709) (bvsge (size!13609 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40542 d!74193))

(declare-fun b!446964 () Bool)

(declare-fun e!262522 () Bool)

(declare-fun call!29680 () Bool)

(assert (=> b!446964 (= e!262522 call!29680)))

(declare-fun b!446965 () Bool)

(declare-fun e!262521 () Bool)

(assert (=> b!446965 (= e!262521 call!29680)))

(declare-fun b!446967 () Bool)

(declare-fun e!262520 () Bool)

(assert (=> b!446967 (= e!262520 e!262521)))

(declare-fun c!55936 () Bool)

(assert (=> b!446967 (= c!55936 (validKeyInArray!0 (select (arr!13257 lt!203858) #b00000000000000000000000000000000)))))

(declare-fun bm!29677 () Bool)

(assert (=> bm!29677 (= call!29680 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!203858 mask!1025))))

(declare-fun d!74195 () Bool)

(declare-fun res!265385 () Bool)

(assert (=> d!74195 (=> res!265385 e!262520)))

(assert (=> d!74195 (= res!265385 (bvsge #b00000000000000000000000000000000 (size!13609 lt!203858)))))

(assert (=> d!74195 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203858 mask!1025) e!262520)))

(declare-fun b!446966 () Bool)

(assert (=> b!446966 (= e!262521 e!262522)))

(declare-fun lt!203872 () (_ BitVec 64))

(assert (=> b!446966 (= lt!203872 (select (arr!13257 lt!203858) #b00000000000000000000000000000000))))

(declare-fun lt!203873 () Unit!13180)

(assert (=> b!446966 (= lt!203873 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!203858 lt!203872 #b00000000000000000000000000000000))))

(assert (=> b!446966 (arrayContainsKey!0 lt!203858 lt!203872 #b00000000000000000000000000000000)))

(declare-fun lt!203871 () Unit!13180)

(assert (=> b!446966 (= lt!203871 lt!203873)))

(declare-fun res!265384 () Bool)

(assert (=> b!446966 (= res!265384 (= (seekEntryOrOpen!0 (select (arr!13257 lt!203858) #b00000000000000000000000000000000) lt!203858 mask!1025) (Found!3530 #b00000000000000000000000000000000)))))

(assert (=> b!446966 (=> (not res!265384) (not e!262522))))

(assert (= (and d!74195 (not res!265385)) b!446967))

(assert (= (and b!446967 c!55936) b!446966))

(assert (= (and b!446967 (not c!55936)) b!446965))

(assert (= (and b!446966 res!265384) b!446964))

(assert (= (or b!446964 b!446965) bm!29677))

(assert (=> b!446967 m!432019))

(assert (=> b!446967 m!432019))

(assert (=> b!446967 m!432021))

(declare-fun m!432027 () Bool)

(assert (=> bm!29677 m!432027))

(assert (=> b!446966 m!432019))

(declare-fun m!432029 () Bool)

(assert (=> b!446966 m!432029))

(declare-fun m!432031 () Bool)

(assert (=> b!446966 m!432031))

(assert (=> b!446966 m!432019))

(declare-fun m!432033 () Bool)

(assert (=> b!446966 m!432033))

(assert (=> b!446875 d!74195))

(declare-fun d!74197 () Bool)

(assert (=> d!74197 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!446877 d!74197))

(declare-fun e!262540 () Bool)

(declare-fun b!446992 () Bool)

(declare-fun lt!203894 () ListLongMap!6779)

(assert (=> b!446992 (= e!262540 (= lt!203894 (getCurrentListMapNoExtraKeys!1591 lt!203858 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5610 v!412)) (size!13608 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!446994 () Bool)

(declare-fun e!262537 () ListLongMap!6779)

(declare-fun call!29683 () ListLongMap!6779)

(assert (=> b!446994 (= e!262537 call!29683)))

(declare-fun b!446995 () Bool)

(declare-fun isEmpty!557 (ListLongMap!6779) Bool)

(assert (=> b!446995 (= e!262540 (isEmpty!557 lt!203894))))

(declare-fun b!446996 () Bool)

(assert (=> b!446996 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13609 lt!203858)))))

(assert (=> b!446996 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13608 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5610 v!412)) (size!13608 _values!549)))))))

(declare-fun e!262539 () Bool)

(declare-fun apply!311 (ListLongMap!6779 (_ BitVec 64)) V!16981)

(declare-fun get!6549 (ValueCell!5610 V!16981) V!16981)

(declare-fun dynLambda!850 (Int (_ BitVec 64)) V!16981)

(assert (=> b!446996 (= e!262539 (= (apply!311 lt!203894 (select (arr!13257 lt!203858) from!863)) (get!6549 (select (arr!13256 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5610 v!412)) (size!13608 _values!549))) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!29680 () Bool)

(assert (=> bm!29680 (= call!29683 (getCurrentListMapNoExtraKeys!1591 lt!203858 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5610 v!412)) (size!13608 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!446997 () Bool)

(declare-fun e!262541 () Bool)

(assert (=> b!446997 (= e!262541 e!262540)))

(declare-fun c!55947 () Bool)

(assert (=> b!446997 (= c!55947 (bvslt from!863 (size!13609 lt!203858)))))

(declare-fun b!446998 () Bool)

(declare-fun lt!203891 () Unit!13180)

(declare-fun lt!203890 () Unit!13180)

(assert (=> b!446998 (= lt!203891 lt!203890)))

(declare-fun lt!203893 () (_ BitVec 64))

(declare-fun lt!203888 () (_ BitVec 64))

(declare-fun lt!203889 () ListLongMap!6779)

(declare-fun lt!203892 () V!16981)

(declare-fun contains!2493 (ListLongMap!6779 (_ BitVec 64)) Bool)

(declare-fun +!1535 (ListLongMap!6779 tuple2!7866) ListLongMap!6779)

(assert (=> b!446998 (not (contains!2493 (+!1535 lt!203889 (tuple2!7867 lt!203893 lt!203892)) lt!203888))))

(declare-fun addStillNotContains!144 (ListLongMap!6779 (_ BitVec 64) V!16981 (_ BitVec 64)) Unit!13180)

(assert (=> b!446998 (= lt!203890 (addStillNotContains!144 lt!203889 lt!203893 lt!203892 lt!203888))))

(assert (=> b!446998 (= lt!203888 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!446998 (= lt!203892 (get!6549 (select (arr!13256 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5610 v!412)) (size!13608 _values!549))) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!446998 (= lt!203893 (select (arr!13257 lt!203858) from!863))))

(assert (=> b!446998 (= lt!203889 call!29683)))

(assert (=> b!446998 (= e!262537 (+!1535 call!29683 (tuple2!7867 (select (arr!13257 lt!203858) from!863) (get!6549 (select (arr!13256 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5610 v!412)) (size!13608 _values!549))) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!446999 () Bool)

(declare-fun e!262543 () ListLongMap!6779)

(assert (=> b!446999 (= e!262543 (ListLongMap!6780 Nil!7925))))

(declare-fun b!446993 () Bool)

(assert (=> b!446993 (= e!262543 e!262537)))

(declare-fun c!55946 () Bool)

(assert (=> b!446993 (= c!55946 (validKeyInArray!0 (select (arr!13257 lt!203858) from!863)))))

(declare-fun d!74199 () Bool)

(declare-fun e!262542 () Bool)

(assert (=> d!74199 e!262542))

(declare-fun res!265395 () Bool)

(assert (=> d!74199 (=> (not res!265395) (not e!262542))))

(assert (=> d!74199 (= res!265395 (not (contains!2493 lt!203894 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74199 (= lt!203894 e!262543)))

(declare-fun c!55945 () Bool)

(assert (=> d!74199 (= c!55945 (bvsge from!863 (size!13609 lt!203858)))))

(assert (=> d!74199 (validMask!0 mask!1025)))

(assert (=> d!74199 (= (getCurrentListMapNoExtraKeys!1591 lt!203858 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5610 v!412)) (size!13608 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203894)))

(declare-fun b!447000 () Bool)

(declare-fun e!262538 () Bool)

(assert (=> b!447000 (= e!262538 (validKeyInArray!0 (select (arr!13257 lt!203858) from!863)))))

(assert (=> b!447000 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!447001 () Bool)

(assert (=> b!447001 (= e!262542 e!262541)))

(declare-fun c!55948 () Bool)

(assert (=> b!447001 (= c!55948 e!262538)))

(declare-fun res!265397 () Bool)

(assert (=> b!447001 (=> (not res!265397) (not e!262538))))

(assert (=> b!447001 (= res!265397 (bvslt from!863 (size!13609 lt!203858)))))

(declare-fun b!447002 () Bool)

(declare-fun res!265396 () Bool)

(assert (=> b!447002 (=> (not res!265396) (not e!262542))))

(assert (=> b!447002 (= res!265396 (not (contains!2493 lt!203894 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447003 () Bool)

(assert (=> b!447003 (= e!262541 e!262539)))

(assert (=> b!447003 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13609 lt!203858)))))

(declare-fun res!265394 () Bool)

(assert (=> b!447003 (= res!265394 (contains!2493 lt!203894 (select (arr!13257 lt!203858) from!863)))))

(assert (=> b!447003 (=> (not res!265394) (not e!262539))))

(assert (= (and d!74199 c!55945) b!446999))

(assert (= (and d!74199 (not c!55945)) b!446993))

(assert (= (and b!446993 c!55946) b!446998))

(assert (= (and b!446993 (not c!55946)) b!446994))

(assert (= (or b!446998 b!446994) bm!29680))

(assert (= (and d!74199 res!265395) b!447002))

(assert (= (and b!447002 res!265396) b!447001))

(assert (= (and b!447001 res!265397) b!447000))

(assert (= (and b!447001 c!55948) b!447003))

(assert (= (and b!447001 (not c!55948)) b!446997))

(assert (= (and b!447003 res!265394) b!446996))

(assert (= (and b!446997 c!55947) b!446992))

(assert (= (and b!446997 (not c!55947)) b!446995))

(declare-fun b_lambda!9461 () Bool)

(assert (=> (not b_lambda!9461) (not b!446996)))

(declare-fun t!13693 () Bool)

(declare-fun tb!3719 () Bool)

(assert (=> (and start!40542 (= defaultEntry!557 defaultEntry!557) t!13693) tb!3719))

(declare-fun result!6971 () Bool)

(assert (=> tb!3719 (= result!6971 tp_is_empty!11907)))

(assert (=> b!446996 t!13693))

(declare-fun b_and!18573 () Bool)

(assert (= b_and!18569 (and (=> t!13693 result!6971) b_and!18573)))

(declare-fun b_lambda!9463 () Bool)

(assert (=> (not b_lambda!9463) (not b!446998)))

(assert (=> b!446998 t!13693))

(declare-fun b_and!18575 () Bool)

(assert (= b_and!18573 (and (=> t!13693 result!6971) b_and!18575)))

(declare-fun m!432035 () Bool)

(assert (=> b!447000 m!432035))

(assert (=> b!447000 m!432035))

(declare-fun m!432037 () Bool)

(assert (=> b!447000 m!432037))

(declare-fun m!432039 () Bool)

(assert (=> b!446998 m!432039))

(declare-fun m!432041 () Bool)

(assert (=> b!446998 m!432041))

(assert (=> b!446998 m!432041))

(declare-fun m!432043 () Bool)

(assert (=> b!446998 m!432043))

(declare-fun m!432045 () Bool)

(assert (=> b!446998 m!432045))

(assert (=> b!446998 m!432035))

(declare-fun m!432047 () Bool)

(assert (=> b!446998 m!432047))

(declare-fun m!432049 () Bool)

(assert (=> b!446998 m!432049))

(assert (=> b!446998 m!432039))

(assert (=> b!446998 m!432045))

(declare-fun m!432051 () Bool)

(assert (=> b!446998 m!432051))

(assert (=> b!447003 m!432035))

(assert (=> b!447003 m!432035))

(declare-fun m!432053 () Bool)

(assert (=> b!447003 m!432053))

(declare-fun m!432055 () Bool)

(assert (=> d!74199 m!432055))

(assert (=> d!74199 m!431953))

(declare-fun m!432057 () Bool)

(assert (=> b!446995 m!432057))

(declare-fun m!432059 () Bool)

(assert (=> b!447002 m!432059))

(declare-fun m!432061 () Bool)

(assert (=> bm!29680 m!432061))

(assert (=> b!446992 m!432061))

(assert (=> b!446993 m!432035))

(assert (=> b!446993 m!432035))

(assert (=> b!446993 m!432037))

(assert (=> b!446996 m!432039))

(assert (=> b!446996 m!432045))

(assert (=> b!446996 m!432051))

(assert (=> b!446996 m!432039))

(assert (=> b!446996 m!432045))

(assert (=> b!446996 m!432035))

(assert (=> b!446996 m!432035))

(declare-fun m!432063 () Bool)

(assert (=> b!446996 m!432063))

(assert (=> b!446874 d!74199))

(declare-fun e!262547 () Bool)

(declare-fun b!447006 () Bool)

(declare-fun lt!203901 () ListLongMap!6779)

(assert (=> b!447006 (= e!262547 (= lt!203901 (getCurrentListMapNoExtraKeys!1591 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!447008 () Bool)

(declare-fun e!262544 () ListLongMap!6779)

(declare-fun call!29684 () ListLongMap!6779)

(assert (=> b!447008 (= e!262544 call!29684)))

(declare-fun b!447009 () Bool)

(assert (=> b!447009 (= e!262547 (isEmpty!557 lt!203901))))

(declare-fun b!447010 () Bool)

(assert (=> b!447010 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13609 _keys!709)))))

(assert (=> b!447010 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13608 _values!549)))))

(declare-fun e!262546 () Bool)

(assert (=> b!447010 (= e!262546 (= (apply!311 lt!203901 (select (arr!13257 _keys!709) from!863)) (get!6549 (select (arr!13256 _values!549) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!29681 () Bool)

(assert (=> bm!29681 (= call!29684 (getCurrentListMapNoExtraKeys!1591 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!447011 () Bool)

(declare-fun e!262548 () Bool)

(assert (=> b!447011 (= e!262548 e!262547)))

(declare-fun c!55951 () Bool)

(assert (=> b!447011 (= c!55951 (bvslt from!863 (size!13609 _keys!709)))))

(declare-fun b!447012 () Bool)

(declare-fun lt!203898 () Unit!13180)

(declare-fun lt!203897 () Unit!13180)

(assert (=> b!447012 (= lt!203898 lt!203897)))

(declare-fun lt!203899 () V!16981)

(declare-fun lt!203895 () (_ BitVec 64))

(declare-fun lt!203896 () ListLongMap!6779)

(declare-fun lt!203900 () (_ BitVec 64))

(assert (=> b!447012 (not (contains!2493 (+!1535 lt!203896 (tuple2!7867 lt!203900 lt!203899)) lt!203895))))

(assert (=> b!447012 (= lt!203897 (addStillNotContains!144 lt!203896 lt!203900 lt!203899 lt!203895))))

(assert (=> b!447012 (= lt!203895 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!447012 (= lt!203899 (get!6549 (select (arr!13256 _values!549) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!447012 (= lt!203900 (select (arr!13257 _keys!709) from!863))))

(assert (=> b!447012 (= lt!203896 call!29684)))

(assert (=> b!447012 (= e!262544 (+!1535 call!29684 (tuple2!7867 (select (arr!13257 _keys!709) from!863) (get!6549 (select (arr!13256 _values!549) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!447013 () Bool)

(declare-fun e!262550 () ListLongMap!6779)

(assert (=> b!447013 (= e!262550 (ListLongMap!6780 Nil!7925))))

(declare-fun b!447007 () Bool)

(assert (=> b!447007 (= e!262550 e!262544)))

(declare-fun c!55950 () Bool)

(assert (=> b!447007 (= c!55950 (validKeyInArray!0 (select (arr!13257 _keys!709) from!863)))))

(declare-fun d!74201 () Bool)

(declare-fun e!262549 () Bool)

(assert (=> d!74201 e!262549))

(declare-fun res!265399 () Bool)

(assert (=> d!74201 (=> (not res!265399) (not e!262549))))

(assert (=> d!74201 (= res!265399 (not (contains!2493 lt!203901 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74201 (= lt!203901 e!262550)))

(declare-fun c!55949 () Bool)

(assert (=> d!74201 (= c!55949 (bvsge from!863 (size!13609 _keys!709)))))

(assert (=> d!74201 (validMask!0 mask!1025)))

(assert (=> d!74201 (= (getCurrentListMapNoExtraKeys!1591 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203901)))

(declare-fun b!447014 () Bool)

(declare-fun e!262545 () Bool)

(assert (=> b!447014 (= e!262545 (validKeyInArray!0 (select (arr!13257 _keys!709) from!863)))))

(assert (=> b!447014 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!447015 () Bool)

(assert (=> b!447015 (= e!262549 e!262548)))

(declare-fun c!55952 () Bool)

(assert (=> b!447015 (= c!55952 e!262545)))

(declare-fun res!265401 () Bool)

(assert (=> b!447015 (=> (not res!265401) (not e!262545))))

(assert (=> b!447015 (= res!265401 (bvslt from!863 (size!13609 _keys!709)))))

(declare-fun b!447016 () Bool)

(declare-fun res!265400 () Bool)

(assert (=> b!447016 (=> (not res!265400) (not e!262549))))

(assert (=> b!447016 (= res!265400 (not (contains!2493 lt!203901 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447017 () Bool)

(assert (=> b!447017 (= e!262548 e!262546)))

(assert (=> b!447017 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13609 _keys!709)))))

(declare-fun res!265398 () Bool)

(assert (=> b!447017 (= res!265398 (contains!2493 lt!203901 (select (arr!13257 _keys!709) from!863)))))

(assert (=> b!447017 (=> (not res!265398) (not e!262546))))

(assert (= (and d!74201 c!55949) b!447013))

(assert (= (and d!74201 (not c!55949)) b!447007))

(assert (= (and b!447007 c!55950) b!447012))

(assert (= (and b!447007 (not c!55950)) b!447008))

(assert (= (or b!447012 b!447008) bm!29681))

(assert (= (and d!74201 res!265399) b!447016))

(assert (= (and b!447016 res!265400) b!447015))

(assert (= (and b!447015 res!265401) b!447014))

(assert (= (and b!447015 c!55952) b!447017))

(assert (= (and b!447015 (not c!55952)) b!447011))

(assert (= (and b!447017 res!265398) b!447010))

(assert (= (and b!447011 c!55951) b!447006))

(assert (= (and b!447011 (not c!55951)) b!447009))

(declare-fun b_lambda!9465 () Bool)

(assert (=> (not b_lambda!9465) (not b!447010)))

(assert (=> b!447010 t!13693))

(declare-fun b_and!18577 () Bool)

(assert (= b_and!18575 (and (=> t!13693 result!6971) b_and!18577)))

(declare-fun b_lambda!9467 () Bool)

(assert (=> (not b_lambda!9467) (not b!447012)))

(assert (=> b!447012 t!13693))

(declare-fun b_and!18579 () Bool)

(assert (= b_and!18577 (and (=> t!13693 result!6971) b_and!18579)))

(declare-fun m!432065 () Bool)

(assert (=> b!447014 m!432065))

(assert (=> b!447014 m!432065))

(declare-fun m!432067 () Bool)

(assert (=> b!447014 m!432067))

(declare-fun m!432069 () Bool)

(assert (=> b!447012 m!432069))

(declare-fun m!432071 () Bool)

(assert (=> b!447012 m!432071))

(assert (=> b!447012 m!432071))

(declare-fun m!432073 () Bool)

(assert (=> b!447012 m!432073))

(assert (=> b!447012 m!432045))

(assert (=> b!447012 m!432065))

(declare-fun m!432075 () Bool)

(assert (=> b!447012 m!432075))

(declare-fun m!432077 () Bool)

(assert (=> b!447012 m!432077))

(assert (=> b!447012 m!432069))

(assert (=> b!447012 m!432045))

(declare-fun m!432079 () Bool)

(assert (=> b!447012 m!432079))

(assert (=> b!447017 m!432065))

(assert (=> b!447017 m!432065))

(declare-fun m!432081 () Bool)

(assert (=> b!447017 m!432081))

(declare-fun m!432083 () Bool)

(assert (=> d!74201 m!432083))

(assert (=> d!74201 m!431953))

(declare-fun m!432085 () Bool)

(assert (=> b!447009 m!432085))

(declare-fun m!432087 () Bool)

(assert (=> b!447016 m!432087))

(declare-fun m!432089 () Bool)

(assert (=> bm!29681 m!432089))

(assert (=> b!447006 m!432089))

(assert (=> b!447007 m!432065))

(assert (=> b!447007 m!432065))

(assert (=> b!447007 m!432067))

(assert (=> b!447010 m!432069))

(assert (=> b!447010 m!432045))

(assert (=> b!447010 m!432079))

(assert (=> b!447010 m!432069))

(assert (=> b!447010 m!432045))

(assert (=> b!447010 m!432065))

(assert (=> b!447010 m!432065))

(declare-fun m!432091 () Bool)

(assert (=> b!447010 m!432091))

(assert (=> b!446874 d!74201))

(declare-fun d!74203 () Bool)

(declare-fun res!265406 () Bool)

(declare-fun e!262555 () Bool)

(assert (=> d!74203 (=> res!265406 e!262555)))

(assert (=> d!74203 (= res!265406 (= (select (arr!13257 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74203 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!262555)))

(declare-fun b!447022 () Bool)

(declare-fun e!262556 () Bool)

(assert (=> b!447022 (= e!262555 e!262556)))

(declare-fun res!265407 () Bool)

(assert (=> b!447022 (=> (not res!265407) (not e!262556))))

(assert (=> b!447022 (= res!265407 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13609 _keys!709)))))

(declare-fun b!447023 () Bool)

(assert (=> b!447023 (= e!262556 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74203 (not res!265406)) b!447022))

(assert (= (and b!447022 res!265407) b!447023))

(assert (=> d!74203 m!432003))

(declare-fun m!432093 () Bool)

(assert (=> b!447023 m!432093))

(assert (=> b!446883 d!74203))

(declare-fun condMapEmpty!19497 () Bool)

(declare-fun mapDefault!19497 () ValueCell!5610)

(assert (=> mapNonEmpty!19491 (= condMapEmpty!19497 (= mapRest!19491 ((as const (Array (_ BitVec 32) ValueCell!5610)) mapDefault!19497)))))

(declare-fun e!262562 () Bool)

(declare-fun mapRes!19497 () Bool)

(assert (=> mapNonEmpty!19491 (= tp!37523 (and e!262562 mapRes!19497))))

(declare-fun mapIsEmpty!19497 () Bool)

(assert (=> mapIsEmpty!19497 mapRes!19497))

(declare-fun b!447030 () Bool)

(declare-fun e!262561 () Bool)

(assert (=> b!447030 (= e!262561 tp_is_empty!11907)))

(declare-fun b!447031 () Bool)

(assert (=> b!447031 (= e!262562 tp_is_empty!11907)))

(declare-fun mapNonEmpty!19497 () Bool)

(declare-fun tp!37533 () Bool)

(assert (=> mapNonEmpty!19497 (= mapRes!19497 (and tp!37533 e!262561))))

(declare-fun mapRest!19497 () (Array (_ BitVec 32) ValueCell!5610))

(declare-fun mapValue!19497 () ValueCell!5610)

(declare-fun mapKey!19497 () (_ BitVec 32))

(assert (=> mapNonEmpty!19497 (= mapRest!19491 (store mapRest!19497 mapKey!19497 mapValue!19497))))

(assert (= (and mapNonEmpty!19491 condMapEmpty!19497) mapIsEmpty!19497))

(assert (= (and mapNonEmpty!19491 (not condMapEmpty!19497)) mapNonEmpty!19497))

(assert (= (and mapNonEmpty!19497 ((_ is ValueCellFull!5610) mapValue!19497)) b!447030))

(assert (= (and mapNonEmpty!19491 ((_ is ValueCellFull!5610) mapDefault!19497)) b!447031))

(declare-fun m!432095 () Bool)

(assert (=> mapNonEmpty!19497 m!432095))

(declare-fun b_lambda!9469 () Bool)

(assert (= b_lambda!9463 (or (and start!40542 b_free!10569) b_lambda!9469)))

(declare-fun b_lambda!9471 () Bool)

(assert (= b_lambda!9465 (or (and start!40542 b_free!10569) b_lambda!9471)))

(declare-fun b_lambda!9473 () Bool)

(assert (= b_lambda!9461 (or (and start!40542 b_free!10569) b_lambda!9473)))

(declare-fun b_lambda!9475 () Bool)

(assert (= b_lambda!9467 (or (and start!40542 b_free!10569) b_lambda!9475)))

(check-sat (not b!447003) (not b!447014) (not bm!29677) (not bm!29681) (not b_lambda!9471) (not d!74199) (not d!74201) (not b!447016) (not b_lambda!9473) tp_is_empty!11907 (not b!446958) (not mapNonEmpty!19497) (not b!447012) (not b!447017) (not b!447000) (not b!446942) b_and!18579 (not b!447023) (not bm!29680) (not b!446945) (not b_lambda!9469) (not b_lambda!9475) (not b!447007) (not bm!29676) (not b!447010) (not b!446995) (not b!447009) (not b!446993) (not b!446967) (not b!446957) (not b!446946) (not b!446963) (not b!447002) (not b_next!10569) (not bm!29675) (not b!446959) (not bm!29672) (not b!446962) (not b!446996) (not b!446998) (not b!446992) (not b!447006) (not b!446966))
(check-sat b_and!18579 (not b_next!10569))
