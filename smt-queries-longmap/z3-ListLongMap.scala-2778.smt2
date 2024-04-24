; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40526 () Bool)

(assert start!40526)

(declare-fun b_free!10567 () Bool)

(declare-fun b_next!10567 () Bool)

(assert (=> start!40526 (= b_free!10567 (not b_next!10567))))

(declare-fun tp!37518 () Bool)

(declare-fun b_and!18581 () Bool)

(assert (=> start!40526 (= tp!37518 b_and!18581)))

(declare-fun res!265286 () Bool)

(declare-fun e!262421 () Bool)

(assert (=> start!40526 (=> (not res!265286) (not e!262421))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27620 0))(
  ( (array!27621 (arr!13256 (Array (_ BitVec 32) (_ BitVec 64))) (size!13608 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27620)

(assert (=> start!40526 (= res!265286 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13608 _keys!709))))))

(assert (=> start!40526 e!262421))

(declare-fun tp_is_empty!11905 () Bool)

(assert (=> start!40526 tp_is_empty!11905))

(assert (=> start!40526 tp!37518))

(assert (=> start!40526 true))

(declare-datatypes ((V!16979 0))(
  ( (V!16980 (val!5997 Int)) )
))
(declare-datatypes ((ValueCell!5609 0))(
  ( (ValueCellFull!5609 (v!8253 V!16979)) (EmptyCell!5609) )
))
(declare-datatypes ((array!27622 0))(
  ( (array!27623 (arr!13257 (Array (_ BitVec 32) ValueCell!5609)) (size!13609 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27622)

(declare-fun e!262423 () Bool)

(declare-fun array_inv!9688 (array!27622) Bool)

(assert (=> start!40526 (and (array_inv!9688 _values!549) e!262423)))

(declare-fun array_inv!9689 (array!27620) Bool)

(assert (=> start!40526 (array_inv!9689 _keys!709)))

(declare-fun b!446778 () Bool)

(declare-fun res!265282 () Bool)

(assert (=> b!446778 (=> (not res!265282) (not e!262421))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446778 (= res!265282 (or (= (select (arr!13256 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13256 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19488 () Bool)

(declare-fun mapRes!19488 () Bool)

(declare-fun tp!37517 () Bool)

(declare-fun e!262426 () Bool)

(assert (=> mapNonEmpty!19488 (= mapRes!19488 (and tp!37517 e!262426))))

(declare-fun mapRest!19488 () (Array (_ BitVec 32) ValueCell!5609))

(declare-fun mapValue!19488 () ValueCell!5609)

(declare-fun mapKey!19488 () (_ BitVec 32))

(assert (=> mapNonEmpty!19488 (= (arr!13257 _values!549) (store mapRest!19488 mapKey!19488 mapValue!19488))))

(declare-fun b!446779 () Bool)

(declare-fun e!262425 () Bool)

(assert (=> b!446779 (= e!262425 tp_is_empty!11905)))

(declare-fun b!446780 () Bool)

(declare-fun res!265283 () Bool)

(assert (=> b!446780 (=> (not res!265283) (not e!262421))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446780 (= res!265283 (validMask!0 mask!1025))))

(declare-fun b!446781 () Bool)

(declare-fun res!265284 () Bool)

(assert (=> b!446781 (=> (not res!265284) (not e!262421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27620 (_ BitVec 32)) Bool)

(assert (=> b!446781 (= res!265284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446782 () Bool)

(declare-fun res!265287 () Bool)

(assert (=> b!446782 (=> (not res!265287) (not e!262421))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446782 (= res!265287 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446783 () Bool)

(declare-fun res!265285 () Bool)

(declare-fun e!262422 () Bool)

(assert (=> b!446783 (=> (not res!265285) (not e!262422))))

(declare-fun lt!203874 () array!27620)

(declare-datatypes ((List!7840 0))(
  ( (Nil!7837) (Cons!7836 (h!8692 (_ BitVec 64)) (t!13592 List!7840)) )
))
(declare-fun arrayNoDuplicates!0 (array!27620 (_ BitVec 32) List!7840) Bool)

(assert (=> b!446783 (= res!265285 (arrayNoDuplicates!0 lt!203874 #b00000000000000000000000000000000 Nil!7837))))

(declare-fun b!446784 () Bool)

(declare-fun res!265280 () Bool)

(assert (=> b!446784 (=> (not res!265280) (not e!262421))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!446784 (= res!265280 (and (= (size!13609 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13608 _keys!709) (size!13609 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446785 () Bool)

(declare-fun res!265289 () Bool)

(assert (=> b!446785 (=> (not res!265289) (not e!262422))))

(assert (=> b!446785 (= res!265289 (and (bvsgt from!863 i!563) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13608 _keys!709))))))

(declare-fun b!446786 () Bool)

(declare-fun res!265288 () Bool)

(assert (=> b!446786 (=> (not res!265288) (not e!262421))))

(assert (=> b!446786 (= res!265288 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13608 _keys!709))))))

(declare-fun minValue!515 () V!16979)

(declare-fun defaultEntry!557 () Int)

(declare-fun v!412 () V!16979)

(declare-fun b!446787 () Bool)

(declare-fun zeroValue!515 () V!16979)

(declare-datatypes ((tuple2!7770 0))(
  ( (tuple2!7771 (_1!3896 (_ BitVec 64)) (_2!3896 V!16979)) )
))
(declare-datatypes ((List!7841 0))(
  ( (Nil!7838) (Cons!7837 (h!8693 tuple2!7770) (t!13593 List!7841)) )
))
(declare-datatypes ((ListLongMap!6685 0))(
  ( (ListLongMap!6686 (toList!3358 List!7841)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1588 (array!27620 array!27622 (_ BitVec 32) (_ BitVec 32) V!16979 V!16979 (_ BitVec 32) Int) ListLongMap!6685)

(assert (=> b!446787 (= e!262422 (not (= (getCurrentListMapNoExtraKeys!1588 lt!203874 (array!27623 (store (arr!13257 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) (getCurrentListMapNoExtraKeys!1588 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))))

(declare-fun b!446788 () Bool)

(assert (=> b!446788 (= e!262421 e!262422)))

(declare-fun res!265290 () Bool)

(assert (=> b!446788 (=> (not res!265290) (not e!262422))))

(assert (=> b!446788 (= res!265290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203874 mask!1025))))

(assert (=> b!446788 (= lt!203874 (array!27621 (store (arr!13256 _keys!709) i!563 k0!794) (size!13608 _keys!709)))))

(declare-fun b!446789 () Bool)

(declare-fun res!265279 () Bool)

(assert (=> b!446789 (=> (not res!265279) (not e!262421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446789 (= res!265279 (validKeyInArray!0 k0!794))))

(declare-fun b!446790 () Bool)

(declare-fun res!265281 () Bool)

(assert (=> b!446790 (=> (not res!265281) (not e!262421))))

(assert (=> b!446790 (= res!265281 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7837))))

(declare-fun b!446791 () Bool)

(assert (=> b!446791 (= e!262423 (and e!262425 mapRes!19488))))

(declare-fun condMapEmpty!19488 () Bool)

(declare-fun mapDefault!19488 () ValueCell!5609)

(assert (=> b!446791 (= condMapEmpty!19488 (= (arr!13257 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5609)) mapDefault!19488)))))

(declare-fun mapIsEmpty!19488 () Bool)

(assert (=> mapIsEmpty!19488 mapRes!19488))

(declare-fun b!446792 () Bool)

(assert (=> b!446792 (= e!262426 tp_is_empty!11905)))

(assert (= (and start!40526 res!265286) b!446780))

(assert (= (and b!446780 res!265283) b!446784))

(assert (= (and b!446784 res!265280) b!446781))

(assert (= (and b!446781 res!265284) b!446790))

(assert (= (and b!446790 res!265281) b!446786))

(assert (= (and b!446786 res!265288) b!446789))

(assert (= (and b!446789 res!265279) b!446778))

(assert (= (and b!446778 res!265282) b!446782))

(assert (= (and b!446782 res!265287) b!446788))

(assert (= (and b!446788 res!265290) b!446783))

(assert (= (and b!446783 res!265285) b!446785))

(assert (= (and b!446785 res!265289) b!446787))

(assert (= (and b!446791 condMapEmpty!19488) mapIsEmpty!19488))

(assert (= (and b!446791 (not condMapEmpty!19488)) mapNonEmpty!19488))

(get-info :version)

(assert (= (and mapNonEmpty!19488 ((_ is ValueCellFull!5609) mapValue!19488)) b!446792))

(assert (= (and b!446791 ((_ is ValueCellFull!5609) mapDefault!19488)) b!446779))

(assert (= start!40526 b!446791))

(declare-fun m!432131 () Bool)

(assert (=> b!446778 m!432131))

(declare-fun m!432133 () Bool)

(assert (=> start!40526 m!432133))

(declare-fun m!432135 () Bool)

(assert (=> start!40526 m!432135))

(declare-fun m!432137 () Bool)

(assert (=> b!446787 m!432137))

(declare-fun m!432139 () Bool)

(assert (=> b!446787 m!432139))

(declare-fun m!432141 () Bool)

(assert (=> b!446787 m!432141))

(declare-fun m!432143 () Bool)

(assert (=> b!446789 m!432143))

(declare-fun m!432145 () Bool)

(assert (=> b!446781 m!432145))

(declare-fun m!432147 () Bool)

(assert (=> b!446782 m!432147))

(declare-fun m!432149 () Bool)

(assert (=> b!446790 m!432149))

(declare-fun m!432151 () Bool)

(assert (=> b!446783 m!432151))

(declare-fun m!432153 () Bool)

(assert (=> b!446780 m!432153))

(declare-fun m!432155 () Bool)

(assert (=> b!446788 m!432155))

(declare-fun m!432157 () Bool)

(assert (=> b!446788 m!432157))

(declare-fun m!432159 () Bool)

(assert (=> mapNonEmpty!19488 m!432159))

(check-sat (not b!446790) (not b!446781) (not b_next!10567) tp_is_empty!11905 (not b!446787) (not mapNonEmpty!19488) (not b!446780) (not b!446783) (not b!446782) (not b!446788) (not b!446789) (not start!40526) b_and!18581)
(check-sat b_and!18581 (not b_next!10567))
(get-model)

(declare-fun d!74213 () Bool)

(assert (=> d!74213 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!446789 d!74213))

(declare-fun b!446893 () Bool)

(declare-fun e!262474 () Bool)

(declare-fun contains!2472 (List!7840 (_ BitVec 64)) Bool)

(assert (=> b!446893 (= e!262474 (contains!2472 Nil!7837 (select (arr!13256 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!29659 () Bool)

(declare-fun call!29662 () Bool)

(declare-fun c!55908 () Bool)

(assert (=> bm!29659 (= call!29662 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55908 (Cons!7836 (select (arr!13256 _keys!709) #b00000000000000000000000000000000) Nil!7837) Nil!7837)))))

(declare-fun d!74215 () Bool)

(declare-fun res!265370 () Bool)

(declare-fun e!262472 () Bool)

(assert (=> d!74215 (=> res!265370 e!262472)))

(assert (=> d!74215 (= res!265370 (bvsge #b00000000000000000000000000000000 (size!13608 _keys!709)))))

(assert (=> d!74215 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7837) e!262472)))

(declare-fun b!446894 () Bool)

(declare-fun e!262473 () Bool)

(assert (=> b!446894 (= e!262473 call!29662)))

(declare-fun b!446895 () Bool)

(assert (=> b!446895 (= e!262473 call!29662)))

(declare-fun b!446896 () Bool)

(declare-fun e!262471 () Bool)

(assert (=> b!446896 (= e!262471 e!262473)))

(assert (=> b!446896 (= c!55908 (validKeyInArray!0 (select (arr!13256 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!446897 () Bool)

(assert (=> b!446897 (= e!262472 e!262471)))

(declare-fun res!265371 () Bool)

(assert (=> b!446897 (=> (not res!265371) (not e!262471))))

(assert (=> b!446897 (= res!265371 (not e!262474))))

(declare-fun res!265369 () Bool)

(assert (=> b!446897 (=> (not res!265369) (not e!262474))))

(assert (=> b!446897 (= res!265369 (validKeyInArray!0 (select (arr!13256 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74215 (not res!265370)) b!446897))

(assert (= (and b!446897 res!265369) b!446893))

(assert (= (and b!446897 res!265371) b!446896))

(assert (= (and b!446896 c!55908) b!446895))

(assert (= (and b!446896 (not c!55908)) b!446894))

(assert (= (or b!446895 b!446894) bm!29659))

(declare-fun m!432221 () Bool)

(assert (=> b!446893 m!432221))

(assert (=> b!446893 m!432221))

(declare-fun m!432223 () Bool)

(assert (=> b!446893 m!432223))

(assert (=> bm!29659 m!432221))

(declare-fun m!432225 () Bool)

(assert (=> bm!29659 m!432225))

(assert (=> b!446896 m!432221))

(assert (=> b!446896 m!432221))

(declare-fun m!432227 () Bool)

(assert (=> b!446896 m!432227))

(assert (=> b!446897 m!432221))

(assert (=> b!446897 m!432221))

(assert (=> b!446897 m!432227))

(assert (=> b!446790 d!74215))

(declare-fun b!446906 () Bool)

(declare-fun e!262483 () Bool)

(declare-fun call!29665 () Bool)

(assert (=> b!446906 (= e!262483 call!29665)))

(declare-fun b!446907 () Bool)

(declare-fun e!262482 () Bool)

(assert (=> b!446907 (= e!262483 e!262482)))

(declare-fun lt!203888 () (_ BitVec 64))

(assert (=> b!446907 (= lt!203888 (select (arr!13256 lt!203874) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13153 0))(
  ( (Unit!13154) )
))
(declare-fun lt!203887 () Unit!13153)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!27620 (_ BitVec 64) (_ BitVec 32)) Unit!13153)

(assert (=> b!446907 (= lt!203887 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!203874 lt!203888 #b00000000000000000000000000000000))))

(assert (=> b!446907 (arrayContainsKey!0 lt!203874 lt!203888 #b00000000000000000000000000000000)))

(declare-fun lt!203889 () Unit!13153)

(assert (=> b!446907 (= lt!203889 lt!203887)))

(declare-fun res!265376 () Bool)

(declare-datatypes ((SeekEntryResult!3479 0))(
  ( (MissingZero!3479 (index!16095 (_ BitVec 32))) (Found!3479 (index!16096 (_ BitVec 32))) (Intermediate!3479 (undefined!4291 Bool) (index!16097 (_ BitVec 32)) (x!42005 (_ BitVec 32))) (Undefined!3479) (MissingVacant!3479 (index!16098 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!27620 (_ BitVec 32)) SeekEntryResult!3479)

(assert (=> b!446907 (= res!265376 (= (seekEntryOrOpen!0 (select (arr!13256 lt!203874) #b00000000000000000000000000000000) lt!203874 mask!1025) (Found!3479 #b00000000000000000000000000000000)))))

(assert (=> b!446907 (=> (not res!265376) (not e!262482))))

(declare-fun b!446908 () Bool)

(declare-fun e!262481 () Bool)

(assert (=> b!446908 (= e!262481 e!262483)))

(declare-fun c!55911 () Bool)

(assert (=> b!446908 (= c!55911 (validKeyInArray!0 (select (arr!13256 lt!203874) #b00000000000000000000000000000000)))))

(declare-fun d!74217 () Bool)

(declare-fun res!265377 () Bool)

(assert (=> d!74217 (=> res!265377 e!262481)))

(assert (=> d!74217 (= res!265377 (bvsge #b00000000000000000000000000000000 (size!13608 lt!203874)))))

(assert (=> d!74217 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203874 mask!1025) e!262481)))

(declare-fun b!446909 () Bool)

(assert (=> b!446909 (= e!262482 call!29665)))

(declare-fun bm!29662 () Bool)

(assert (=> bm!29662 (= call!29665 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!203874 mask!1025))))

(assert (= (and d!74217 (not res!265377)) b!446908))

(assert (= (and b!446908 c!55911) b!446907))

(assert (= (and b!446908 (not c!55911)) b!446906))

(assert (= (and b!446907 res!265376) b!446909))

(assert (= (or b!446909 b!446906) bm!29662))

(declare-fun m!432229 () Bool)

(assert (=> b!446907 m!432229))

(declare-fun m!432231 () Bool)

(assert (=> b!446907 m!432231))

(declare-fun m!432233 () Bool)

(assert (=> b!446907 m!432233))

(assert (=> b!446907 m!432229))

(declare-fun m!432235 () Bool)

(assert (=> b!446907 m!432235))

(assert (=> b!446908 m!432229))

(assert (=> b!446908 m!432229))

(declare-fun m!432237 () Bool)

(assert (=> b!446908 m!432237))

(declare-fun m!432239 () Bool)

(assert (=> bm!29662 m!432239))

(assert (=> b!446788 d!74217))

(declare-fun b!446910 () Bool)

(declare-fun e!262487 () Bool)

(assert (=> b!446910 (= e!262487 (contains!2472 Nil!7837 (select (arr!13256 lt!203874) #b00000000000000000000000000000000)))))

(declare-fun bm!29663 () Bool)

(declare-fun call!29666 () Bool)

(declare-fun c!55912 () Bool)

(assert (=> bm!29663 (= call!29666 (arrayNoDuplicates!0 lt!203874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55912 (Cons!7836 (select (arr!13256 lt!203874) #b00000000000000000000000000000000) Nil!7837) Nil!7837)))))

(declare-fun d!74219 () Bool)

(declare-fun res!265379 () Bool)

(declare-fun e!262485 () Bool)

(assert (=> d!74219 (=> res!265379 e!262485)))

(assert (=> d!74219 (= res!265379 (bvsge #b00000000000000000000000000000000 (size!13608 lt!203874)))))

(assert (=> d!74219 (= (arrayNoDuplicates!0 lt!203874 #b00000000000000000000000000000000 Nil!7837) e!262485)))

(declare-fun b!446911 () Bool)

(declare-fun e!262486 () Bool)

(assert (=> b!446911 (= e!262486 call!29666)))

(declare-fun b!446912 () Bool)

(assert (=> b!446912 (= e!262486 call!29666)))

(declare-fun b!446913 () Bool)

(declare-fun e!262484 () Bool)

(assert (=> b!446913 (= e!262484 e!262486)))

(assert (=> b!446913 (= c!55912 (validKeyInArray!0 (select (arr!13256 lt!203874) #b00000000000000000000000000000000)))))

(declare-fun b!446914 () Bool)

(assert (=> b!446914 (= e!262485 e!262484)))

(declare-fun res!265380 () Bool)

(assert (=> b!446914 (=> (not res!265380) (not e!262484))))

(assert (=> b!446914 (= res!265380 (not e!262487))))

(declare-fun res!265378 () Bool)

(assert (=> b!446914 (=> (not res!265378) (not e!262487))))

(assert (=> b!446914 (= res!265378 (validKeyInArray!0 (select (arr!13256 lt!203874) #b00000000000000000000000000000000)))))

(assert (= (and d!74219 (not res!265379)) b!446914))

(assert (= (and b!446914 res!265378) b!446910))

(assert (= (and b!446914 res!265380) b!446913))

(assert (= (and b!446913 c!55912) b!446912))

(assert (= (and b!446913 (not c!55912)) b!446911))

(assert (= (or b!446912 b!446911) bm!29663))

(assert (=> b!446910 m!432229))

(assert (=> b!446910 m!432229))

(declare-fun m!432241 () Bool)

(assert (=> b!446910 m!432241))

(assert (=> bm!29663 m!432229))

(declare-fun m!432243 () Bool)

(assert (=> bm!29663 m!432243))

(assert (=> b!446913 m!432229))

(assert (=> b!446913 m!432229))

(assert (=> b!446913 m!432237))

(assert (=> b!446914 m!432229))

(assert (=> b!446914 m!432229))

(assert (=> b!446914 m!432237))

(assert (=> b!446783 d!74219))

(declare-fun b!446915 () Bool)

(declare-fun e!262490 () Bool)

(declare-fun call!29667 () Bool)

(assert (=> b!446915 (= e!262490 call!29667)))

(declare-fun b!446916 () Bool)

(declare-fun e!262489 () Bool)

(assert (=> b!446916 (= e!262490 e!262489)))

(declare-fun lt!203891 () (_ BitVec 64))

(assert (=> b!446916 (= lt!203891 (select (arr!13256 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!203890 () Unit!13153)

(assert (=> b!446916 (= lt!203890 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!203891 #b00000000000000000000000000000000))))

(assert (=> b!446916 (arrayContainsKey!0 _keys!709 lt!203891 #b00000000000000000000000000000000)))

(declare-fun lt!203892 () Unit!13153)

(assert (=> b!446916 (= lt!203892 lt!203890)))

(declare-fun res!265381 () Bool)

(assert (=> b!446916 (= res!265381 (= (seekEntryOrOpen!0 (select (arr!13256 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3479 #b00000000000000000000000000000000)))))

(assert (=> b!446916 (=> (not res!265381) (not e!262489))))

(declare-fun b!446917 () Bool)

(declare-fun e!262488 () Bool)

(assert (=> b!446917 (= e!262488 e!262490)))

(declare-fun c!55913 () Bool)

(assert (=> b!446917 (= c!55913 (validKeyInArray!0 (select (arr!13256 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74221 () Bool)

(declare-fun res!265382 () Bool)

(assert (=> d!74221 (=> res!265382 e!262488)))

(assert (=> d!74221 (= res!265382 (bvsge #b00000000000000000000000000000000 (size!13608 _keys!709)))))

(assert (=> d!74221 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!262488)))

(declare-fun b!446918 () Bool)

(assert (=> b!446918 (= e!262489 call!29667)))

(declare-fun bm!29664 () Bool)

(assert (=> bm!29664 (= call!29667 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(assert (= (and d!74221 (not res!265382)) b!446917))

(assert (= (and b!446917 c!55913) b!446916))

(assert (= (and b!446917 (not c!55913)) b!446915))

(assert (= (and b!446916 res!265381) b!446918))

(assert (= (or b!446918 b!446915) bm!29664))

(assert (=> b!446916 m!432221))

(declare-fun m!432245 () Bool)

(assert (=> b!446916 m!432245))

(declare-fun m!432247 () Bool)

(assert (=> b!446916 m!432247))

(assert (=> b!446916 m!432221))

(declare-fun m!432249 () Bool)

(assert (=> b!446916 m!432249))

(assert (=> b!446917 m!432221))

(assert (=> b!446917 m!432221))

(assert (=> b!446917 m!432227))

(declare-fun m!432251 () Bool)

(assert (=> bm!29664 m!432251))

(assert (=> b!446781 d!74221))

(declare-fun d!74223 () Bool)

(declare-fun res!265387 () Bool)

(declare-fun e!262495 () Bool)

(assert (=> d!74223 (=> res!265387 e!262495)))

(assert (=> d!74223 (= res!265387 (= (select (arr!13256 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74223 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!262495)))

(declare-fun b!446923 () Bool)

(declare-fun e!262496 () Bool)

(assert (=> b!446923 (= e!262495 e!262496)))

(declare-fun res!265388 () Bool)

(assert (=> b!446923 (=> (not res!265388) (not e!262496))))

(assert (=> b!446923 (= res!265388 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13608 _keys!709)))))

(declare-fun b!446924 () Bool)

(assert (=> b!446924 (= e!262496 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74223 (not res!265387)) b!446923))

(assert (= (and b!446923 res!265388) b!446924))

(assert (=> d!74223 m!432221))

(declare-fun m!432253 () Bool)

(assert (=> b!446924 m!432253))

(assert (=> b!446782 d!74223))

(declare-fun b!446949 () Bool)

(declare-fun lt!203909 () Unit!13153)

(declare-fun lt!203907 () Unit!13153)

(assert (=> b!446949 (= lt!203909 lt!203907)))

(declare-fun lt!203908 () (_ BitVec 64))

(declare-fun lt!203913 () ListLongMap!6685)

(declare-fun lt!203912 () (_ BitVec 64))

(declare-fun lt!203911 () V!16979)

(declare-fun contains!2473 (ListLongMap!6685 (_ BitVec 64)) Bool)

(declare-fun +!1536 (ListLongMap!6685 tuple2!7770) ListLongMap!6685)

(assert (=> b!446949 (not (contains!2473 (+!1536 lt!203913 (tuple2!7771 lt!203912 lt!203911)) lt!203908))))

(declare-fun addStillNotContains!146 (ListLongMap!6685 (_ BitVec 64) V!16979 (_ BitVec 64)) Unit!13153)

(assert (=> b!446949 (= lt!203907 (addStillNotContains!146 lt!203913 lt!203912 lt!203911 lt!203908))))

(assert (=> b!446949 (= lt!203908 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!6559 (ValueCell!5609 V!16979) V!16979)

(declare-fun dynLambda!854 (Int (_ BitVec 64)) V!16979)

(assert (=> b!446949 (= lt!203911 (get!6559 (select (arr!13257 (array!27623 (store (arr!13257 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549))) from!863) (dynLambda!854 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!446949 (= lt!203912 (select (arr!13256 lt!203874) from!863))))

(declare-fun call!29670 () ListLongMap!6685)

(assert (=> b!446949 (= lt!203913 call!29670)))

(declare-fun e!262513 () ListLongMap!6685)

(assert (=> b!446949 (= e!262513 (+!1536 call!29670 (tuple2!7771 (select (arr!13256 lt!203874) from!863) (get!6559 (select (arr!13257 (array!27623 (store (arr!13257 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549))) from!863) (dynLambda!854 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!446950 () Bool)

(declare-fun e!262511 () Bool)

(declare-fun e!262512 () Bool)

(assert (=> b!446950 (= e!262511 e!262512)))

(declare-fun c!55924 () Bool)

(declare-fun e!262514 () Bool)

(assert (=> b!446950 (= c!55924 e!262514)))

(declare-fun res!265399 () Bool)

(assert (=> b!446950 (=> (not res!265399) (not e!262514))))

(assert (=> b!446950 (= res!265399 (bvslt from!863 (size!13608 lt!203874)))))

(declare-fun d!74225 () Bool)

(assert (=> d!74225 e!262511))

(declare-fun res!265400 () Bool)

(assert (=> d!74225 (=> (not res!265400) (not e!262511))))

(declare-fun lt!203910 () ListLongMap!6685)

(assert (=> d!74225 (= res!265400 (not (contains!2473 lt!203910 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!262515 () ListLongMap!6685)

(assert (=> d!74225 (= lt!203910 e!262515)))

(declare-fun c!55923 () Bool)

(assert (=> d!74225 (= c!55923 (bvsge from!863 (size!13608 lt!203874)))))

(assert (=> d!74225 (validMask!0 mask!1025)))

(assert (=> d!74225 (= (getCurrentListMapNoExtraKeys!1588 lt!203874 (array!27623 (store (arr!13257 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203910)))

(declare-fun bm!29667 () Bool)

(assert (=> bm!29667 (= call!29670 (getCurrentListMapNoExtraKeys!1588 lt!203874 (array!27623 (store (arr!13257 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!446951 () Bool)

(declare-fun res!265398 () Bool)

(assert (=> b!446951 (=> (not res!265398) (not e!262511))))

(assert (=> b!446951 (= res!265398 (not (contains!2473 lt!203910 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446952 () Bool)

(assert (=> b!446952 (= e!262515 (ListLongMap!6686 Nil!7838))))

(declare-fun b!446953 () Bool)

(assert (=> b!446953 (= e!262515 e!262513)))

(declare-fun c!55922 () Bool)

(assert (=> b!446953 (= c!55922 (validKeyInArray!0 (select (arr!13256 lt!203874) from!863)))))

(declare-fun b!446954 () Bool)

(assert (=> b!446954 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13608 lt!203874)))))

(assert (=> b!446954 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13609 (array!27623 (store (arr!13257 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549)))))))

(declare-fun e!262516 () Bool)

(declare-fun apply!311 (ListLongMap!6685 (_ BitVec 64)) V!16979)

(assert (=> b!446954 (= e!262516 (= (apply!311 lt!203910 (select (arr!13256 lt!203874) from!863)) (get!6559 (select (arr!13257 (array!27623 (store (arr!13257 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549))) from!863) (dynLambda!854 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!446955 () Bool)

(declare-fun e!262517 () Bool)

(assert (=> b!446955 (= e!262512 e!262517)))

(declare-fun c!55925 () Bool)

(assert (=> b!446955 (= c!55925 (bvslt from!863 (size!13608 lt!203874)))))

(declare-fun b!446956 () Bool)

(assert (=> b!446956 (= e!262514 (validKeyInArray!0 (select (arr!13256 lt!203874) from!863)))))

(assert (=> b!446956 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!446957 () Bool)

(declare-fun isEmpty!563 (ListLongMap!6685) Bool)

(assert (=> b!446957 (= e!262517 (isEmpty!563 lt!203910))))

(declare-fun b!446958 () Bool)

(assert (=> b!446958 (= e!262517 (= lt!203910 (getCurrentListMapNoExtraKeys!1588 lt!203874 (array!27623 (store (arr!13257 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!446959 () Bool)

(assert (=> b!446959 (= e!262513 call!29670)))

(declare-fun b!446960 () Bool)

(assert (=> b!446960 (= e!262512 e!262516)))

(assert (=> b!446960 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13608 lt!203874)))))

(declare-fun res!265397 () Bool)

(assert (=> b!446960 (= res!265397 (contains!2473 lt!203910 (select (arr!13256 lt!203874) from!863)))))

(assert (=> b!446960 (=> (not res!265397) (not e!262516))))

(assert (= (and d!74225 c!55923) b!446952))

(assert (= (and d!74225 (not c!55923)) b!446953))

(assert (= (and b!446953 c!55922) b!446949))

(assert (= (and b!446953 (not c!55922)) b!446959))

(assert (= (or b!446949 b!446959) bm!29667))

(assert (= (and d!74225 res!265400) b!446951))

(assert (= (and b!446951 res!265398) b!446950))

(assert (= (and b!446950 res!265399) b!446956))

(assert (= (and b!446950 c!55924) b!446960))

(assert (= (and b!446950 (not c!55924)) b!446955))

(assert (= (and b!446960 res!265397) b!446954))

(assert (= (and b!446955 c!55925) b!446958))

(assert (= (and b!446955 (not c!55925)) b!446957))

(declare-fun b_lambda!9483 () Bool)

(assert (=> (not b_lambda!9483) (not b!446949)))

(declare-fun t!13598 () Bool)

(declare-fun tb!3711 () Bool)

(assert (=> (and start!40526 (= defaultEntry!557 defaultEntry!557) t!13598) tb!3711))

(declare-fun result!6963 () Bool)

(assert (=> tb!3711 (= result!6963 tp_is_empty!11905)))

(assert (=> b!446949 t!13598))

(declare-fun b_and!18587 () Bool)

(assert (= b_and!18581 (and (=> t!13598 result!6963) b_and!18587)))

(declare-fun b_lambda!9485 () Bool)

(assert (=> (not b_lambda!9485) (not b!446954)))

(assert (=> b!446954 t!13598))

(declare-fun b_and!18589 () Bool)

(assert (= b_and!18587 (and (=> t!13598 result!6963) b_and!18589)))

(declare-fun m!432255 () Bool)

(assert (=> d!74225 m!432255))

(assert (=> d!74225 m!432153))

(declare-fun m!432257 () Bool)

(assert (=> b!446956 m!432257))

(assert (=> b!446956 m!432257))

(declare-fun m!432259 () Bool)

(assert (=> b!446956 m!432259))

(assert (=> b!446953 m!432257))

(assert (=> b!446953 m!432257))

(assert (=> b!446953 m!432259))

(declare-fun m!432261 () Bool)

(assert (=> bm!29667 m!432261))

(assert (=> b!446960 m!432257))

(assert (=> b!446960 m!432257))

(declare-fun m!432263 () Bool)

(assert (=> b!446960 m!432263))

(declare-fun m!432265 () Bool)

(assert (=> b!446954 m!432265))

(assert (=> b!446954 m!432257))

(declare-fun m!432267 () Bool)

(assert (=> b!446954 m!432267))

(assert (=> b!446954 m!432257))

(assert (=> b!446954 m!432265))

(declare-fun m!432269 () Bool)

(assert (=> b!446954 m!432269))

(declare-fun m!432271 () Bool)

(assert (=> b!446954 m!432271))

(assert (=> b!446954 m!432269))

(declare-fun m!432273 () Bool)

(assert (=> b!446957 m!432273))

(declare-fun m!432275 () Bool)

(assert (=> b!446949 m!432275))

(declare-fun m!432277 () Bool)

(assert (=> b!446949 m!432277))

(assert (=> b!446949 m!432265))

(declare-fun m!432279 () Bool)

(assert (=> b!446949 m!432279))

(assert (=> b!446949 m!432257))

(assert (=> b!446949 m!432269))

(assert (=> b!446949 m!432275))

(declare-fun m!432281 () Bool)

(assert (=> b!446949 m!432281))

(assert (=> b!446949 m!432265))

(assert (=> b!446949 m!432269))

(assert (=> b!446949 m!432271))

(declare-fun m!432283 () Bool)

(assert (=> b!446951 m!432283))

(assert (=> b!446958 m!432261))

(assert (=> b!446787 d!74225))

(declare-fun b!446963 () Bool)

(declare-fun lt!203916 () Unit!13153)

(declare-fun lt!203914 () Unit!13153)

(assert (=> b!446963 (= lt!203916 lt!203914)))

(declare-fun lt!203918 () V!16979)

(declare-fun lt!203919 () (_ BitVec 64))

(declare-fun lt!203915 () (_ BitVec 64))

(declare-fun lt!203920 () ListLongMap!6685)

(assert (=> b!446963 (not (contains!2473 (+!1536 lt!203920 (tuple2!7771 lt!203919 lt!203918)) lt!203915))))

(assert (=> b!446963 (= lt!203914 (addStillNotContains!146 lt!203920 lt!203919 lt!203918 lt!203915))))

(assert (=> b!446963 (= lt!203915 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!446963 (= lt!203918 (get!6559 (select (arr!13257 _values!549) from!863) (dynLambda!854 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!446963 (= lt!203919 (select (arr!13256 _keys!709) from!863))))

(declare-fun call!29671 () ListLongMap!6685)

(assert (=> b!446963 (= lt!203920 call!29671)))

(declare-fun e!262520 () ListLongMap!6685)

(assert (=> b!446963 (= e!262520 (+!1536 call!29671 (tuple2!7771 (select (arr!13256 _keys!709) from!863) (get!6559 (select (arr!13257 _values!549) from!863) (dynLambda!854 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!446964 () Bool)

(declare-fun e!262518 () Bool)

(declare-fun e!262519 () Bool)

(assert (=> b!446964 (= e!262518 e!262519)))

(declare-fun c!55928 () Bool)

(declare-fun e!262521 () Bool)

(assert (=> b!446964 (= c!55928 e!262521)))

(declare-fun res!265403 () Bool)

(assert (=> b!446964 (=> (not res!265403) (not e!262521))))

(assert (=> b!446964 (= res!265403 (bvslt from!863 (size!13608 _keys!709)))))

(declare-fun d!74227 () Bool)

(assert (=> d!74227 e!262518))

(declare-fun res!265404 () Bool)

(assert (=> d!74227 (=> (not res!265404) (not e!262518))))

(declare-fun lt!203917 () ListLongMap!6685)

(assert (=> d!74227 (= res!265404 (not (contains!2473 lt!203917 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!262522 () ListLongMap!6685)

(assert (=> d!74227 (= lt!203917 e!262522)))

(declare-fun c!55927 () Bool)

(assert (=> d!74227 (= c!55927 (bvsge from!863 (size!13608 _keys!709)))))

(assert (=> d!74227 (validMask!0 mask!1025)))

(assert (=> d!74227 (= (getCurrentListMapNoExtraKeys!1588 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203917)))

(declare-fun bm!29668 () Bool)

(assert (=> bm!29668 (= call!29671 (getCurrentListMapNoExtraKeys!1588 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!446965 () Bool)

(declare-fun res!265402 () Bool)

(assert (=> b!446965 (=> (not res!265402) (not e!262518))))

(assert (=> b!446965 (= res!265402 (not (contains!2473 lt!203917 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446966 () Bool)

(assert (=> b!446966 (= e!262522 (ListLongMap!6686 Nil!7838))))

(declare-fun b!446967 () Bool)

(assert (=> b!446967 (= e!262522 e!262520)))

(declare-fun c!55926 () Bool)

(assert (=> b!446967 (= c!55926 (validKeyInArray!0 (select (arr!13256 _keys!709) from!863)))))

(declare-fun b!446968 () Bool)

(assert (=> b!446968 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13608 _keys!709)))))

(assert (=> b!446968 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13609 _values!549)))))

(declare-fun e!262523 () Bool)

(assert (=> b!446968 (= e!262523 (= (apply!311 lt!203917 (select (arr!13256 _keys!709) from!863)) (get!6559 (select (arr!13257 _values!549) from!863) (dynLambda!854 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!446969 () Bool)

(declare-fun e!262524 () Bool)

(assert (=> b!446969 (= e!262519 e!262524)))

(declare-fun c!55929 () Bool)

(assert (=> b!446969 (= c!55929 (bvslt from!863 (size!13608 _keys!709)))))

(declare-fun b!446970 () Bool)

(assert (=> b!446970 (= e!262521 (validKeyInArray!0 (select (arr!13256 _keys!709) from!863)))))

(assert (=> b!446970 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!446971 () Bool)

(assert (=> b!446971 (= e!262524 (isEmpty!563 lt!203917))))

(declare-fun b!446972 () Bool)

(assert (=> b!446972 (= e!262524 (= lt!203917 (getCurrentListMapNoExtraKeys!1588 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!446973 () Bool)

(assert (=> b!446973 (= e!262520 call!29671)))

(declare-fun b!446974 () Bool)

(assert (=> b!446974 (= e!262519 e!262523)))

(assert (=> b!446974 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13608 _keys!709)))))

(declare-fun res!265401 () Bool)

(assert (=> b!446974 (= res!265401 (contains!2473 lt!203917 (select (arr!13256 _keys!709) from!863)))))

(assert (=> b!446974 (=> (not res!265401) (not e!262523))))

(assert (= (and d!74227 c!55927) b!446966))

(assert (= (and d!74227 (not c!55927)) b!446967))

(assert (= (and b!446967 c!55926) b!446963))

(assert (= (and b!446967 (not c!55926)) b!446973))

(assert (= (or b!446963 b!446973) bm!29668))

(assert (= (and d!74227 res!265404) b!446965))

(assert (= (and b!446965 res!265402) b!446964))

(assert (= (and b!446964 res!265403) b!446970))

(assert (= (and b!446964 c!55928) b!446974))

(assert (= (and b!446964 (not c!55928)) b!446969))

(assert (= (and b!446974 res!265401) b!446968))

(assert (= (and b!446969 c!55929) b!446972))

(assert (= (and b!446969 (not c!55929)) b!446971))

(declare-fun b_lambda!9487 () Bool)

(assert (=> (not b_lambda!9487) (not b!446963)))

(assert (=> b!446963 t!13598))

(declare-fun b_and!18591 () Bool)

(assert (= b_and!18589 (and (=> t!13598 result!6963) b_and!18591)))

(declare-fun b_lambda!9489 () Bool)

(assert (=> (not b_lambda!9489) (not b!446968)))

(assert (=> b!446968 t!13598))

(declare-fun b_and!18593 () Bool)

(assert (= b_and!18591 (and (=> t!13598 result!6963) b_and!18593)))

(declare-fun m!432285 () Bool)

(assert (=> d!74227 m!432285))

(assert (=> d!74227 m!432153))

(declare-fun m!432287 () Bool)

(assert (=> b!446970 m!432287))

(assert (=> b!446970 m!432287))

(declare-fun m!432289 () Bool)

(assert (=> b!446970 m!432289))

(assert (=> b!446967 m!432287))

(assert (=> b!446967 m!432287))

(assert (=> b!446967 m!432289))

(declare-fun m!432291 () Bool)

(assert (=> bm!29668 m!432291))

(assert (=> b!446974 m!432287))

(assert (=> b!446974 m!432287))

(declare-fun m!432293 () Bool)

(assert (=> b!446974 m!432293))

(declare-fun m!432295 () Bool)

(assert (=> b!446968 m!432295))

(assert (=> b!446968 m!432287))

(declare-fun m!432297 () Bool)

(assert (=> b!446968 m!432297))

(assert (=> b!446968 m!432287))

(assert (=> b!446968 m!432295))

(assert (=> b!446968 m!432269))

(declare-fun m!432299 () Bool)

(assert (=> b!446968 m!432299))

(assert (=> b!446968 m!432269))

(declare-fun m!432301 () Bool)

(assert (=> b!446971 m!432301))

(declare-fun m!432303 () Bool)

(assert (=> b!446963 m!432303))

(declare-fun m!432305 () Bool)

(assert (=> b!446963 m!432305))

(assert (=> b!446963 m!432295))

(declare-fun m!432307 () Bool)

(assert (=> b!446963 m!432307))

(assert (=> b!446963 m!432287))

(assert (=> b!446963 m!432269))

(assert (=> b!446963 m!432303))

(declare-fun m!432309 () Bool)

(assert (=> b!446963 m!432309))

(assert (=> b!446963 m!432295))

(assert (=> b!446963 m!432269))

(assert (=> b!446963 m!432299))

(declare-fun m!432311 () Bool)

(assert (=> b!446965 m!432311))

(assert (=> b!446972 m!432291))

(assert (=> b!446787 d!74227))

(declare-fun d!74229 () Bool)

(assert (=> d!74229 (= (array_inv!9688 _values!549) (bvsge (size!13609 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40526 d!74229))

(declare-fun d!74231 () Bool)

(assert (=> d!74231 (= (array_inv!9689 _keys!709) (bvsge (size!13608 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40526 d!74231))

(declare-fun d!74233 () Bool)

(assert (=> d!74233 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!446780 d!74233))

(declare-fun b!446982 () Bool)

(declare-fun e!262530 () Bool)

(assert (=> b!446982 (= e!262530 tp_is_empty!11905)))

(declare-fun mapNonEmpty!19497 () Bool)

(declare-fun mapRes!19497 () Bool)

(declare-fun tp!37533 () Bool)

(declare-fun e!262529 () Bool)

(assert (=> mapNonEmpty!19497 (= mapRes!19497 (and tp!37533 e!262529))))

(declare-fun mapRest!19497 () (Array (_ BitVec 32) ValueCell!5609))

(declare-fun mapValue!19497 () ValueCell!5609)

(declare-fun mapKey!19497 () (_ BitVec 32))

(assert (=> mapNonEmpty!19497 (= mapRest!19488 (store mapRest!19497 mapKey!19497 mapValue!19497))))

(declare-fun b!446981 () Bool)

(assert (=> b!446981 (= e!262529 tp_is_empty!11905)))

(declare-fun condMapEmpty!19497 () Bool)

(declare-fun mapDefault!19497 () ValueCell!5609)

(assert (=> mapNonEmpty!19488 (= condMapEmpty!19497 (= mapRest!19488 ((as const (Array (_ BitVec 32) ValueCell!5609)) mapDefault!19497)))))

(assert (=> mapNonEmpty!19488 (= tp!37517 (and e!262530 mapRes!19497))))

(declare-fun mapIsEmpty!19497 () Bool)

(assert (=> mapIsEmpty!19497 mapRes!19497))

(assert (= (and mapNonEmpty!19488 condMapEmpty!19497) mapIsEmpty!19497))

(assert (= (and mapNonEmpty!19488 (not condMapEmpty!19497)) mapNonEmpty!19497))

(assert (= (and mapNonEmpty!19497 ((_ is ValueCellFull!5609) mapValue!19497)) b!446981))

(assert (= (and mapNonEmpty!19488 ((_ is ValueCellFull!5609) mapDefault!19497)) b!446982))

(declare-fun m!432313 () Bool)

(assert (=> mapNonEmpty!19497 m!432313))

(declare-fun b_lambda!9491 () Bool)

(assert (= b_lambda!9489 (or (and start!40526 b_free!10567) b_lambda!9491)))

(declare-fun b_lambda!9493 () Bool)

(assert (= b_lambda!9483 (or (and start!40526 b_free!10567) b_lambda!9493)))

(declare-fun b_lambda!9495 () Bool)

(assert (= b_lambda!9487 (or (and start!40526 b_free!10567) b_lambda!9495)))

(declare-fun b_lambda!9497 () Bool)

(assert (= b_lambda!9485 (or (and start!40526 b_free!10567) b_lambda!9497)))

(check-sat (not b!446965) (not b!446968) (not b!446908) (not b!446914) (not bm!29664) (not b!446893) (not b_lambda!9491) (not b!446951) (not b!446956) (not b!446954) (not b!446963) (not b!446953) (not b!446916) (not b_lambda!9495) (not b_lambda!9497) (not bm!29663) (not b!446960) (not bm!29667) (not b_next!10567) (not b!446907) (not d!74227) tp_is_empty!11905 (not bm!29668) (not b!446913) (not b!446897) (not b_lambda!9493) (not b!446896) (not d!74225) (not b!446949) (not b!446967) (not bm!29659) (not b!446972) (not bm!29662) (not b!446910) (not b!446924) (not b!446970) b_and!18593 (not b!446971) (not b!446974) (not b!446957) (not b!446917) (not mapNonEmpty!19497) (not b!446958))
(check-sat b_and!18593 (not b_next!10567))
