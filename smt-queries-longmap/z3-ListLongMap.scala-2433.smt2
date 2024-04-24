; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38354 () Bool)

(assert start!38354)

(declare-fun b!395768 () Bool)

(declare-fun res!226976 () Bool)

(declare-fun e!239555 () Bool)

(assert (=> b!395768 (=> (not res!226976) (not e!239555))))

(declare-datatypes ((array!23568 0))(
  ( (array!23569 (arr!11236 (Array (_ BitVec 32) (_ BitVec 64))) (size!11588 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23568)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395768 (= res!226976 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16365 () Bool)

(declare-fun mapRes!16365 () Bool)

(declare-fun tp!32160 () Bool)

(declare-fun e!239554 () Bool)

(assert (=> mapNonEmpty!16365 (= mapRes!16365 (and tp!32160 e!239554))))

(declare-datatypes ((V!14219 0))(
  ( (V!14220 (val!4962 Int)) )
))
(declare-datatypes ((ValueCell!4574 0))(
  ( (ValueCellFull!4574 (v!7209 V!14219)) (EmptyCell!4574) )
))
(declare-fun mapValue!16365 () ValueCell!4574)

(declare-fun mapRest!16365 () (Array (_ BitVec 32) ValueCell!4574))

(declare-datatypes ((array!23570 0))(
  ( (array!23571 (arr!11237 (Array (_ BitVec 32) ValueCell!4574)) (size!11589 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23570)

(declare-fun mapKey!16365 () (_ BitVec 32))

(assert (=> mapNonEmpty!16365 (= (arr!11237 _values!549) (store mapRest!16365 mapKey!16365 mapValue!16365))))

(declare-fun b!395769 () Bool)

(declare-fun res!226980 () Bool)

(assert (=> b!395769 (=> (not res!226980) (not e!239555))))

(declare-datatypes ((List!6383 0))(
  ( (Nil!6380) (Cons!6379 (h!7235 (_ BitVec 64)) (t!11549 List!6383)) )
))
(declare-fun arrayNoDuplicates!0 (array!23568 (_ BitVec 32) List!6383) Bool)

(assert (=> b!395769 (= res!226980 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6380))))

(declare-fun b!395770 () Bool)

(declare-fun e!239552 () Bool)

(declare-fun e!239551 () Bool)

(assert (=> b!395770 (= e!239552 (and e!239551 mapRes!16365))))

(declare-fun condMapEmpty!16365 () Bool)

(declare-fun mapDefault!16365 () ValueCell!4574)

(assert (=> b!395770 (= condMapEmpty!16365 (= (arr!11237 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4574)) mapDefault!16365)))))

(declare-fun b!395771 () Bool)

(declare-fun res!226979 () Bool)

(assert (=> b!395771 (=> (not res!226979) (not e!239555))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23568 (_ BitVec 32)) Bool)

(assert (=> b!395771 (= res!226979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395772 () Bool)

(declare-fun res!226977 () Bool)

(assert (=> b!395772 (=> (not res!226977) (not e!239555))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395772 (= res!226977 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11588 _keys!709))))))

(declare-fun b!395773 () Bool)

(declare-fun tp_is_empty!9835 () Bool)

(assert (=> b!395773 (= e!239554 tp_is_empty!9835)))

(declare-fun b!395774 () Bool)

(declare-fun res!226973 () Bool)

(assert (=> b!395774 (=> (not res!226973) (not e!239555))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395774 (= res!226973 (and (= (size!11589 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11588 _keys!709) (size!11589 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395775 () Bool)

(assert (=> b!395775 (= e!239555 (and (bvsle #b00000000000000000000000000000000 (size!11588 _keys!709)) (bvsge (size!11588 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!395776 () Bool)

(assert (=> b!395776 (= e!239551 tp_is_empty!9835)))

(declare-fun mapIsEmpty!16365 () Bool)

(assert (=> mapIsEmpty!16365 mapRes!16365))

(declare-fun b!395777 () Bool)

(declare-fun res!226981 () Bool)

(assert (=> b!395777 (=> (not res!226981) (not e!239555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395777 (= res!226981 (validMask!0 mask!1025))))

(declare-fun res!226978 () Bool)

(assert (=> start!38354 (=> (not res!226978) (not e!239555))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38354 (= res!226978 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11588 _keys!709))))))

(assert (=> start!38354 e!239555))

(assert (=> start!38354 true))

(declare-fun array_inv!8306 (array!23570) Bool)

(assert (=> start!38354 (and (array_inv!8306 _values!549) e!239552)))

(declare-fun array_inv!8307 (array!23568) Bool)

(assert (=> start!38354 (array_inv!8307 _keys!709)))

(declare-fun b!395778 () Bool)

(declare-fun res!226974 () Bool)

(assert (=> b!395778 (=> (not res!226974) (not e!239555))))

(assert (=> b!395778 (= res!226974 (or (= (select (arr!11236 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11236 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!395779 () Bool)

(declare-fun res!226975 () Bool)

(assert (=> b!395779 (=> (not res!226975) (not e!239555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395779 (= res!226975 (validKeyInArray!0 k0!794))))

(declare-fun b!395780 () Bool)

(declare-fun res!226972 () Bool)

(assert (=> b!395780 (=> (not res!226972) (not e!239555))))

(assert (=> b!395780 (= res!226972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23569 (store (arr!11236 _keys!709) i!563 k0!794) (size!11588 _keys!709)) mask!1025))))

(assert (= (and start!38354 res!226978) b!395777))

(assert (= (and b!395777 res!226981) b!395774))

(assert (= (and b!395774 res!226973) b!395771))

(assert (= (and b!395771 res!226979) b!395769))

(assert (= (and b!395769 res!226980) b!395772))

(assert (= (and b!395772 res!226977) b!395779))

(assert (= (and b!395779 res!226975) b!395778))

(assert (= (and b!395778 res!226974) b!395768))

(assert (= (and b!395768 res!226976) b!395780))

(assert (= (and b!395780 res!226972) b!395775))

(assert (= (and b!395770 condMapEmpty!16365) mapIsEmpty!16365))

(assert (= (and b!395770 (not condMapEmpty!16365)) mapNonEmpty!16365))

(get-info :version)

(assert (= (and mapNonEmpty!16365 ((_ is ValueCellFull!4574) mapValue!16365)) b!395773))

(assert (= (and b!395770 ((_ is ValueCellFull!4574) mapDefault!16365)) b!395776))

(assert (= start!38354 b!395770))

(declare-fun m!391917 () Bool)

(assert (=> b!395778 m!391917))

(declare-fun m!391919 () Bool)

(assert (=> b!395771 m!391919))

(declare-fun m!391921 () Bool)

(assert (=> b!395779 m!391921))

(declare-fun m!391923 () Bool)

(assert (=> b!395769 m!391923))

(declare-fun m!391925 () Bool)

(assert (=> b!395768 m!391925))

(declare-fun m!391927 () Bool)

(assert (=> b!395777 m!391927))

(declare-fun m!391929 () Bool)

(assert (=> start!38354 m!391929))

(declare-fun m!391931 () Bool)

(assert (=> start!38354 m!391931))

(declare-fun m!391933 () Bool)

(assert (=> mapNonEmpty!16365 m!391933))

(declare-fun m!391935 () Bool)

(assert (=> b!395780 m!391935))

(declare-fun m!391937 () Bool)

(assert (=> b!395780 m!391937))

(check-sat tp_is_empty!9835 (not start!38354) (not b!395780) (not b!395777) (not mapNonEmpty!16365) (not b!395768) (not b!395769) (not b!395771) (not b!395779))
(check-sat)
(get-model)

(declare-fun b!395869 () Bool)

(declare-fun e!239595 () Bool)

(declare-fun contains!2460 (List!6383 (_ BitVec 64)) Bool)

(assert (=> b!395869 (= e!239595 (contains!2460 Nil!6380 (select (arr!11236 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395870 () Bool)

(declare-fun e!239597 () Bool)

(declare-fun call!27865 () Bool)

(assert (=> b!395870 (= e!239597 call!27865)))

(declare-fun b!395871 () Bool)

(declare-fun e!239596 () Bool)

(declare-fun e!239594 () Bool)

(assert (=> b!395871 (= e!239596 e!239594)))

(declare-fun res!227048 () Bool)

(assert (=> b!395871 (=> (not res!227048) (not e!239594))))

(assert (=> b!395871 (= res!227048 (not e!239595))))

(declare-fun res!227049 () Bool)

(assert (=> b!395871 (=> (not res!227049) (not e!239595))))

(assert (=> b!395871 (= res!227049 (validKeyInArray!0 (select (arr!11236 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395872 () Bool)

(assert (=> b!395872 (= e!239597 call!27865)))

(declare-fun b!395873 () Bool)

(assert (=> b!395873 (= e!239594 e!239597)))

(declare-fun c!54531 () Bool)

(assert (=> b!395873 (= c!54531 (validKeyInArray!0 (select (arr!11236 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!73387 () Bool)

(declare-fun res!227050 () Bool)

(assert (=> d!73387 (=> res!227050 e!239596)))

(assert (=> d!73387 (= res!227050 (bvsge #b00000000000000000000000000000000 (size!11588 _keys!709)))))

(assert (=> d!73387 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6380) e!239596)))

(declare-fun bm!27862 () Bool)

(assert (=> bm!27862 (= call!27865 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54531 (Cons!6379 (select (arr!11236 _keys!709) #b00000000000000000000000000000000) Nil!6380) Nil!6380)))))

(assert (= (and d!73387 (not res!227050)) b!395871))

(assert (= (and b!395871 res!227049) b!395869))

(assert (= (and b!395871 res!227048) b!395873))

(assert (= (and b!395873 c!54531) b!395872))

(assert (= (and b!395873 (not c!54531)) b!395870))

(assert (= (or b!395872 b!395870) bm!27862))

(declare-fun m!391983 () Bool)

(assert (=> b!395869 m!391983))

(assert (=> b!395869 m!391983))

(declare-fun m!391985 () Bool)

(assert (=> b!395869 m!391985))

(assert (=> b!395871 m!391983))

(assert (=> b!395871 m!391983))

(declare-fun m!391987 () Bool)

(assert (=> b!395871 m!391987))

(assert (=> b!395873 m!391983))

(assert (=> b!395873 m!391983))

(assert (=> b!395873 m!391987))

(assert (=> bm!27862 m!391983))

(declare-fun m!391989 () Bool)

(assert (=> bm!27862 m!391989))

(assert (=> b!395769 d!73387))

(declare-fun b!395882 () Bool)

(declare-fun e!239605 () Bool)

(declare-fun call!27868 () Bool)

(assert (=> b!395882 (= e!239605 call!27868)))

(declare-fun d!73389 () Bool)

(declare-fun res!227055 () Bool)

(declare-fun e!239604 () Bool)

(assert (=> d!73389 (=> res!227055 e!239604)))

(assert (=> d!73389 (= res!227055 (bvsge #b00000000000000000000000000000000 (size!11588 (array!23569 (store (arr!11236 _keys!709) i!563 k0!794) (size!11588 _keys!709)))))))

(assert (=> d!73389 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23569 (store (arr!11236 _keys!709) i!563 k0!794) (size!11588 _keys!709)) mask!1025) e!239604)))

(declare-fun b!395883 () Bool)

(declare-fun e!239606 () Bool)

(assert (=> b!395883 (= e!239606 call!27868)))

(declare-fun b!395884 () Bool)

(assert (=> b!395884 (= e!239606 e!239605)))

(declare-fun lt!187120 () (_ BitVec 64))

(assert (=> b!395884 (= lt!187120 (select (arr!11236 (array!23569 (store (arr!11236 _keys!709) i!563 k0!794) (size!11588 _keys!709))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12041 0))(
  ( (Unit!12042) )
))
(declare-fun lt!187119 () Unit!12041)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23568 (_ BitVec 64) (_ BitVec 32)) Unit!12041)

(assert (=> b!395884 (= lt!187119 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23569 (store (arr!11236 _keys!709) i!563 k0!794) (size!11588 _keys!709)) lt!187120 #b00000000000000000000000000000000))))

(assert (=> b!395884 (arrayContainsKey!0 (array!23569 (store (arr!11236 _keys!709) i!563 k0!794) (size!11588 _keys!709)) lt!187120 #b00000000000000000000000000000000)))

(declare-fun lt!187121 () Unit!12041)

(assert (=> b!395884 (= lt!187121 lt!187119)))

(declare-fun res!227056 () Bool)

(declare-datatypes ((SeekEntryResult!3473 0))(
  ( (MissingZero!3473 (index!16071 (_ BitVec 32))) (Found!3473 (index!16072 (_ BitVec 32))) (Intermediate!3473 (undefined!4285 Bool) (index!16073 (_ BitVec 32)) (x!38618 (_ BitVec 32))) (Undefined!3473) (MissingVacant!3473 (index!16074 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23568 (_ BitVec 32)) SeekEntryResult!3473)

(assert (=> b!395884 (= res!227056 (= (seekEntryOrOpen!0 (select (arr!11236 (array!23569 (store (arr!11236 _keys!709) i!563 k0!794) (size!11588 _keys!709))) #b00000000000000000000000000000000) (array!23569 (store (arr!11236 _keys!709) i!563 k0!794) (size!11588 _keys!709)) mask!1025) (Found!3473 #b00000000000000000000000000000000)))))

(assert (=> b!395884 (=> (not res!227056) (not e!239605))))

(declare-fun b!395885 () Bool)

(assert (=> b!395885 (= e!239604 e!239606)))

(declare-fun c!54534 () Bool)

(assert (=> b!395885 (= c!54534 (validKeyInArray!0 (select (arr!11236 (array!23569 (store (arr!11236 _keys!709) i!563 k0!794) (size!11588 _keys!709))) #b00000000000000000000000000000000)))))

(declare-fun bm!27865 () Bool)

(assert (=> bm!27865 (= call!27868 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!23569 (store (arr!11236 _keys!709) i!563 k0!794) (size!11588 _keys!709)) mask!1025))))

(assert (= (and d!73389 (not res!227055)) b!395885))

(assert (= (and b!395885 c!54534) b!395884))

(assert (= (and b!395885 (not c!54534)) b!395883))

(assert (= (and b!395884 res!227056) b!395882))

(assert (= (or b!395882 b!395883) bm!27865))

(declare-fun m!391991 () Bool)

(assert (=> b!395884 m!391991))

(declare-fun m!391993 () Bool)

(assert (=> b!395884 m!391993))

(declare-fun m!391995 () Bool)

(assert (=> b!395884 m!391995))

(assert (=> b!395884 m!391991))

(declare-fun m!391997 () Bool)

(assert (=> b!395884 m!391997))

(assert (=> b!395885 m!391991))

(assert (=> b!395885 m!391991))

(declare-fun m!391999 () Bool)

(assert (=> b!395885 m!391999))

(declare-fun m!392001 () Bool)

(assert (=> bm!27865 m!392001))

(assert (=> b!395780 d!73389))

(declare-fun d!73391 () Bool)

(assert (=> d!73391 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!395779 d!73391))

(declare-fun d!73393 () Bool)

(assert (=> d!73393 (= (array_inv!8306 _values!549) (bvsge (size!11589 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38354 d!73393))

(declare-fun d!73395 () Bool)

(assert (=> d!73395 (= (array_inv!8307 _keys!709) (bvsge (size!11588 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38354 d!73395))

(declare-fun b!395886 () Bool)

(declare-fun e!239608 () Bool)

(declare-fun call!27869 () Bool)

(assert (=> b!395886 (= e!239608 call!27869)))

(declare-fun d!73397 () Bool)

(declare-fun res!227057 () Bool)

(declare-fun e!239607 () Bool)

(assert (=> d!73397 (=> res!227057 e!239607)))

(assert (=> d!73397 (= res!227057 (bvsge #b00000000000000000000000000000000 (size!11588 _keys!709)))))

(assert (=> d!73397 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239607)))

(declare-fun b!395887 () Bool)

(declare-fun e!239609 () Bool)

(assert (=> b!395887 (= e!239609 call!27869)))

(declare-fun b!395888 () Bool)

(assert (=> b!395888 (= e!239609 e!239608)))

(declare-fun lt!187123 () (_ BitVec 64))

(assert (=> b!395888 (= lt!187123 (select (arr!11236 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!187122 () Unit!12041)

(assert (=> b!395888 (= lt!187122 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!187123 #b00000000000000000000000000000000))))

(assert (=> b!395888 (arrayContainsKey!0 _keys!709 lt!187123 #b00000000000000000000000000000000)))

(declare-fun lt!187124 () Unit!12041)

(assert (=> b!395888 (= lt!187124 lt!187122)))

(declare-fun res!227058 () Bool)

(assert (=> b!395888 (= res!227058 (= (seekEntryOrOpen!0 (select (arr!11236 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3473 #b00000000000000000000000000000000)))))

(assert (=> b!395888 (=> (not res!227058) (not e!239608))))

(declare-fun b!395889 () Bool)

(assert (=> b!395889 (= e!239607 e!239609)))

(declare-fun c!54535 () Bool)

(assert (=> b!395889 (= c!54535 (validKeyInArray!0 (select (arr!11236 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!27866 () Bool)

(assert (=> bm!27866 (= call!27869 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(assert (= (and d!73397 (not res!227057)) b!395889))

(assert (= (and b!395889 c!54535) b!395888))

(assert (= (and b!395889 (not c!54535)) b!395887))

(assert (= (and b!395888 res!227058) b!395886))

(assert (= (or b!395886 b!395887) bm!27866))

(assert (=> b!395888 m!391983))

(declare-fun m!392003 () Bool)

(assert (=> b!395888 m!392003))

(declare-fun m!392005 () Bool)

(assert (=> b!395888 m!392005))

(assert (=> b!395888 m!391983))

(declare-fun m!392007 () Bool)

(assert (=> b!395888 m!392007))

(assert (=> b!395889 m!391983))

(assert (=> b!395889 m!391983))

(assert (=> b!395889 m!391987))

(declare-fun m!392009 () Bool)

(assert (=> bm!27866 m!392009))

(assert (=> b!395771 d!73397))

(declare-fun d!73399 () Bool)

(assert (=> d!73399 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!395777 d!73399))

(declare-fun d!73401 () Bool)

(declare-fun res!227063 () Bool)

(declare-fun e!239614 () Bool)

(assert (=> d!73401 (=> res!227063 e!239614)))

(assert (=> d!73401 (= res!227063 (= (select (arr!11236 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!73401 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!239614)))

(declare-fun b!395894 () Bool)

(declare-fun e!239615 () Bool)

(assert (=> b!395894 (= e!239614 e!239615)))

(declare-fun res!227064 () Bool)

(assert (=> b!395894 (=> (not res!227064) (not e!239615))))

(assert (=> b!395894 (= res!227064 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11588 _keys!709)))))

(declare-fun b!395895 () Bool)

(assert (=> b!395895 (= e!239615 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73401 (not res!227063)) b!395894))

(assert (= (and b!395894 res!227064) b!395895))

(assert (=> d!73401 m!391983))

(declare-fun m!392011 () Bool)

(assert (=> b!395895 m!392011))

(assert (=> b!395768 d!73401))

(declare-fun mapIsEmpty!16374 () Bool)

(declare-fun mapRes!16374 () Bool)

(assert (=> mapIsEmpty!16374 mapRes!16374))

(declare-fun b!395903 () Bool)

(declare-fun e!239621 () Bool)

(assert (=> b!395903 (= e!239621 tp_is_empty!9835)))

(declare-fun mapNonEmpty!16374 () Bool)

(declare-fun tp!32169 () Bool)

(declare-fun e!239620 () Bool)

(assert (=> mapNonEmpty!16374 (= mapRes!16374 (and tp!32169 e!239620))))

(declare-fun mapKey!16374 () (_ BitVec 32))

(declare-fun mapRest!16374 () (Array (_ BitVec 32) ValueCell!4574))

(declare-fun mapValue!16374 () ValueCell!4574)

(assert (=> mapNonEmpty!16374 (= mapRest!16365 (store mapRest!16374 mapKey!16374 mapValue!16374))))

(declare-fun b!395902 () Bool)

(assert (=> b!395902 (= e!239620 tp_is_empty!9835)))

(declare-fun condMapEmpty!16374 () Bool)

(declare-fun mapDefault!16374 () ValueCell!4574)

(assert (=> mapNonEmpty!16365 (= condMapEmpty!16374 (= mapRest!16365 ((as const (Array (_ BitVec 32) ValueCell!4574)) mapDefault!16374)))))

(assert (=> mapNonEmpty!16365 (= tp!32160 (and e!239621 mapRes!16374))))

(assert (= (and mapNonEmpty!16365 condMapEmpty!16374) mapIsEmpty!16374))

(assert (= (and mapNonEmpty!16365 (not condMapEmpty!16374)) mapNonEmpty!16374))

(assert (= (and mapNonEmpty!16374 ((_ is ValueCellFull!4574) mapValue!16374)) b!395902))

(assert (= (and mapNonEmpty!16365 ((_ is ValueCellFull!4574) mapDefault!16374)) b!395903))

(declare-fun m!392013 () Bool)

(assert (=> mapNonEmpty!16374 m!392013))

(check-sat (not bm!27865) tp_is_empty!9835 (not mapNonEmpty!16374) (not b!395871) (not bm!27862) (not b!395885) (not b!395889) (not bm!27866) (not b!395895) (not b!395869) (not b!395888) (not b!395884) (not b!395873))
(check-sat)
