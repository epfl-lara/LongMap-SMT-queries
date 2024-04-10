; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38390 () Bool)

(assert start!38390)

(declare-fun b!396023 () Bool)

(declare-fun res!227125 () Bool)

(declare-fun e!239683 () Bool)

(assert (=> b!396023 (=> (not res!227125) (not e!239683))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396023 (= res!227125 (validKeyInArray!0 k0!794))))

(declare-fun b!396024 () Bool)

(declare-fun res!227124 () Bool)

(assert (=> b!396024 (=> (not res!227124) (not e!239683))))

(declare-datatypes ((array!23595 0))(
  ( (array!23596 (arr!11249 (Array (_ BitVec 32) (_ BitVec 64))) (size!11601 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23595)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14229 0))(
  ( (V!14230 (val!4966 Int)) )
))
(declare-datatypes ((ValueCell!4578 0))(
  ( (ValueCellFull!4578 (v!7212 V!14229)) (EmptyCell!4578) )
))
(declare-datatypes ((array!23597 0))(
  ( (array!23598 (arr!11250 (Array (_ BitVec 32) ValueCell!4578)) (size!11602 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23597)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!396024 (= res!227124 (and (= (size!11602 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11601 _keys!709) (size!11602 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396025 () Bool)

(declare-fun res!227126 () Bool)

(assert (=> b!396025 (=> (not res!227126) (not e!239683))))

(assert (=> b!396025 (= res!227126 (and (bvsle #b00000000000000000000000000000000 (size!11601 _keys!709)) (bvslt (size!11601 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!396026 () Bool)

(declare-fun res!227130 () Bool)

(assert (=> b!396026 (=> (not res!227130) (not e!239683))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23595 (_ BitVec 32)) Bool)

(assert (=> b!396026 (= res!227130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23596 (store (arr!11249 _keys!709) i!563 k0!794) (size!11601 _keys!709)) mask!1025))))

(declare-fun res!227132 () Bool)

(assert (=> start!38390 (=> (not res!227132) (not e!239683))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38390 (= res!227132 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11601 _keys!709))))))

(assert (=> start!38390 e!239683))

(assert (=> start!38390 true))

(declare-fun e!239680 () Bool)

(declare-fun array_inv!8256 (array!23597) Bool)

(assert (=> start!38390 (and (array_inv!8256 _values!549) e!239680)))

(declare-fun array_inv!8257 (array!23595) Bool)

(assert (=> start!38390 (array_inv!8257 _keys!709)))

(declare-fun mapIsEmpty!16380 () Bool)

(declare-fun mapRes!16380 () Bool)

(assert (=> mapIsEmpty!16380 mapRes!16380))

(declare-fun b!396027 () Bool)

(declare-fun res!227128 () Bool)

(assert (=> b!396027 (=> (not res!227128) (not e!239683))))

(assert (=> b!396027 (= res!227128 (or (= (select (arr!11249 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11249 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396028 () Bool)

(declare-fun res!227133 () Bool)

(assert (=> b!396028 (=> (not res!227133) (not e!239683))))

(assert (=> b!396028 (= res!227133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396029 () Bool)

(declare-fun res!227129 () Bool)

(assert (=> b!396029 (=> (not res!227129) (not e!239683))))

(declare-datatypes ((List!6520 0))(
  ( (Nil!6517) (Cons!6516 (h!7372 (_ BitVec 64)) (t!11694 List!6520)) )
))
(declare-fun arrayNoDuplicates!0 (array!23595 (_ BitVec 32) List!6520) Bool)

(assert (=> b!396029 (= res!227129 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6517))))

(declare-fun b!396030 () Bool)

(declare-fun res!227127 () Bool)

(assert (=> b!396030 (=> (not res!227127) (not e!239683))))

(declare-fun arrayContainsKey!0 (array!23595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396030 (= res!227127 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!396031 () Bool)

(declare-fun e!239682 () Bool)

(assert (=> b!396031 (= e!239680 (and e!239682 mapRes!16380))))

(declare-fun condMapEmpty!16380 () Bool)

(declare-fun mapDefault!16380 () ValueCell!4578)

(assert (=> b!396031 (= condMapEmpty!16380 (= (arr!11250 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4578)) mapDefault!16380)))))

(declare-fun mapNonEmpty!16380 () Bool)

(declare-fun tp!32175 () Bool)

(declare-fun e!239679 () Bool)

(assert (=> mapNonEmpty!16380 (= mapRes!16380 (and tp!32175 e!239679))))

(declare-fun mapKey!16380 () (_ BitVec 32))

(declare-fun mapValue!16380 () ValueCell!4578)

(declare-fun mapRest!16380 () (Array (_ BitVec 32) ValueCell!4578))

(assert (=> mapNonEmpty!16380 (= (arr!11250 _values!549) (store mapRest!16380 mapKey!16380 mapValue!16380))))

(declare-fun b!396032 () Bool)

(declare-fun noDuplicate!198 (List!6520) Bool)

(assert (=> b!396032 (= e!239683 (not (noDuplicate!198 Nil!6517)))))

(declare-fun b!396033 () Bool)

(declare-fun tp_is_empty!9843 () Bool)

(assert (=> b!396033 (= e!239679 tp_is_empty!9843)))

(declare-fun b!396034 () Bool)

(assert (=> b!396034 (= e!239682 tp_is_empty!9843)))

(declare-fun b!396035 () Bool)

(declare-fun res!227123 () Bool)

(assert (=> b!396035 (=> (not res!227123) (not e!239683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396035 (= res!227123 (validMask!0 mask!1025))))

(declare-fun b!396036 () Bool)

(declare-fun res!227131 () Bool)

(assert (=> b!396036 (=> (not res!227131) (not e!239683))))

(assert (=> b!396036 (= res!227131 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11601 _keys!709))))))

(assert (= (and start!38390 res!227132) b!396035))

(assert (= (and b!396035 res!227123) b!396024))

(assert (= (and b!396024 res!227124) b!396028))

(assert (= (and b!396028 res!227133) b!396029))

(assert (= (and b!396029 res!227129) b!396036))

(assert (= (and b!396036 res!227131) b!396023))

(assert (= (and b!396023 res!227125) b!396027))

(assert (= (and b!396027 res!227128) b!396030))

(assert (= (and b!396030 res!227127) b!396026))

(assert (= (and b!396026 res!227130) b!396025))

(assert (= (and b!396025 res!227126) b!396032))

(assert (= (and b!396031 condMapEmpty!16380) mapIsEmpty!16380))

(assert (= (and b!396031 (not condMapEmpty!16380)) mapNonEmpty!16380))

(get-info :version)

(assert (= (and mapNonEmpty!16380 ((_ is ValueCellFull!4578) mapValue!16380)) b!396033))

(assert (= (and b!396031 ((_ is ValueCellFull!4578) mapDefault!16380)) b!396034))

(assert (= start!38390 b!396031))

(declare-fun m!391809 () Bool)

(assert (=> b!396026 m!391809))

(declare-fun m!391811 () Bool)

(assert (=> b!396026 m!391811))

(declare-fun m!391813 () Bool)

(assert (=> b!396035 m!391813))

(declare-fun m!391815 () Bool)

(assert (=> b!396030 m!391815))

(declare-fun m!391817 () Bool)

(assert (=> mapNonEmpty!16380 m!391817))

(declare-fun m!391819 () Bool)

(assert (=> b!396032 m!391819))

(declare-fun m!391821 () Bool)

(assert (=> b!396023 m!391821))

(declare-fun m!391823 () Bool)

(assert (=> b!396029 m!391823))

(declare-fun m!391825 () Bool)

(assert (=> b!396027 m!391825))

(declare-fun m!391827 () Bool)

(assert (=> start!38390 m!391827))

(declare-fun m!391829 () Bool)

(assert (=> start!38390 m!391829))

(declare-fun m!391831 () Bool)

(assert (=> b!396028 m!391831))

(check-sat (not b!396028) (not b!396035) (not b!396026) (not b!396030) tp_is_empty!9843 (not b!396023) (not mapNonEmpty!16380) (not b!396032) (not start!38390) (not b!396029))
(check-sat)
(get-model)

(declare-fun d!73375 () Bool)

(assert (=> d!73375 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!396035 d!73375))

(declare-fun b!396087 () Bool)

(declare-fun e!239707 () Bool)

(declare-fun e!239705 () Bool)

(assert (=> b!396087 (= e!239707 e!239705)))

(declare-fun lt!187114 () (_ BitVec 64))

(assert (=> b!396087 (= lt!187114 (select (arr!11249 (array!23596 (store (arr!11249 _keys!709) i!563 k0!794) (size!11601 _keys!709))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12074 0))(
  ( (Unit!12075) )
))
(declare-fun lt!187112 () Unit!12074)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23595 (_ BitVec 64) (_ BitVec 32)) Unit!12074)

(assert (=> b!396087 (= lt!187112 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23596 (store (arr!11249 _keys!709) i!563 k0!794) (size!11601 _keys!709)) lt!187114 #b00000000000000000000000000000000))))

(assert (=> b!396087 (arrayContainsKey!0 (array!23596 (store (arr!11249 _keys!709) i!563 k0!794) (size!11601 _keys!709)) lt!187114 #b00000000000000000000000000000000)))

(declare-fun lt!187113 () Unit!12074)

(assert (=> b!396087 (= lt!187113 lt!187112)))

(declare-fun res!227171 () Bool)

(declare-datatypes ((SeekEntryResult!3525 0))(
  ( (MissingZero!3525 (index!16279 (_ BitVec 32))) (Found!3525 (index!16280 (_ BitVec 32))) (Intermediate!3525 (undefined!4337 Bool) (index!16281 (_ BitVec 32)) (x!38683 (_ BitVec 32))) (Undefined!3525) (MissingVacant!3525 (index!16282 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23595 (_ BitVec 32)) SeekEntryResult!3525)

(assert (=> b!396087 (= res!227171 (= (seekEntryOrOpen!0 (select (arr!11249 (array!23596 (store (arr!11249 _keys!709) i!563 k0!794) (size!11601 _keys!709))) #b00000000000000000000000000000000) (array!23596 (store (arr!11249 _keys!709) i!563 k0!794) (size!11601 _keys!709)) mask!1025) (Found!3525 #b00000000000000000000000000000000)))))

(assert (=> b!396087 (=> (not res!227171) (not e!239705))))

(declare-fun b!396088 () Bool)

(declare-fun call!27885 () Bool)

(assert (=> b!396088 (= e!239705 call!27885)))

(declare-fun bm!27882 () Bool)

(assert (=> bm!27882 (= call!27885 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!23596 (store (arr!11249 _keys!709) i!563 k0!794) (size!11601 _keys!709)) mask!1025))))

(declare-fun d!73377 () Bool)

(declare-fun res!227172 () Bool)

(declare-fun e!239706 () Bool)

(assert (=> d!73377 (=> res!227172 e!239706)))

(assert (=> d!73377 (= res!227172 (bvsge #b00000000000000000000000000000000 (size!11601 (array!23596 (store (arr!11249 _keys!709) i!563 k0!794) (size!11601 _keys!709)))))))

(assert (=> d!73377 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!23596 (store (arr!11249 _keys!709) i!563 k0!794) (size!11601 _keys!709)) mask!1025) e!239706)))

(declare-fun b!396089 () Bool)

(assert (=> b!396089 (= e!239707 call!27885)))

(declare-fun b!396090 () Bool)

(assert (=> b!396090 (= e!239706 e!239707)))

(declare-fun c!54561 () Bool)

(assert (=> b!396090 (= c!54561 (validKeyInArray!0 (select (arr!11249 (array!23596 (store (arr!11249 _keys!709) i!563 k0!794) (size!11601 _keys!709))) #b00000000000000000000000000000000)))))

(assert (= (and d!73377 (not res!227172)) b!396090))

(assert (= (and b!396090 c!54561) b!396087))

(assert (= (and b!396090 (not c!54561)) b!396089))

(assert (= (and b!396087 res!227171) b!396088))

(assert (= (or b!396088 b!396089) bm!27882))

(declare-fun m!391857 () Bool)

(assert (=> b!396087 m!391857))

(declare-fun m!391859 () Bool)

(assert (=> b!396087 m!391859))

(declare-fun m!391861 () Bool)

(assert (=> b!396087 m!391861))

(assert (=> b!396087 m!391857))

(declare-fun m!391863 () Bool)

(assert (=> b!396087 m!391863))

(declare-fun m!391865 () Bool)

(assert (=> bm!27882 m!391865))

(assert (=> b!396090 m!391857))

(assert (=> b!396090 m!391857))

(declare-fun m!391867 () Bool)

(assert (=> b!396090 m!391867))

(assert (=> b!396026 d!73377))

(declare-fun d!73379 () Bool)

(assert (=> d!73379 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!396023 d!73379))

(declare-fun b!396091 () Bool)

(declare-fun e!239710 () Bool)

(declare-fun e!239708 () Bool)

(assert (=> b!396091 (= e!239710 e!239708)))

(declare-fun lt!187117 () (_ BitVec 64))

(assert (=> b!396091 (= lt!187117 (select (arr!11249 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!187115 () Unit!12074)

(assert (=> b!396091 (= lt!187115 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!187117 #b00000000000000000000000000000000))))

(assert (=> b!396091 (arrayContainsKey!0 _keys!709 lt!187117 #b00000000000000000000000000000000)))

(declare-fun lt!187116 () Unit!12074)

(assert (=> b!396091 (= lt!187116 lt!187115)))

(declare-fun res!227173 () Bool)

(assert (=> b!396091 (= res!227173 (= (seekEntryOrOpen!0 (select (arr!11249 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3525 #b00000000000000000000000000000000)))))

(assert (=> b!396091 (=> (not res!227173) (not e!239708))))

(declare-fun b!396092 () Bool)

(declare-fun call!27886 () Bool)

(assert (=> b!396092 (= e!239708 call!27886)))

(declare-fun bm!27883 () Bool)

(assert (=> bm!27883 (= call!27886 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun d!73381 () Bool)

(declare-fun res!227174 () Bool)

(declare-fun e!239709 () Bool)

(assert (=> d!73381 (=> res!227174 e!239709)))

(assert (=> d!73381 (= res!227174 (bvsge #b00000000000000000000000000000000 (size!11601 _keys!709)))))

(assert (=> d!73381 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239709)))

(declare-fun b!396093 () Bool)

(assert (=> b!396093 (= e!239710 call!27886)))

(declare-fun b!396094 () Bool)

(assert (=> b!396094 (= e!239709 e!239710)))

(declare-fun c!54562 () Bool)

(assert (=> b!396094 (= c!54562 (validKeyInArray!0 (select (arr!11249 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!73381 (not res!227174)) b!396094))

(assert (= (and b!396094 c!54562) b!396091))

(assert (= (and b!396094 (not c!54562)) b!396093))

(assert (= (and b!396091 res!227173) b!396092))

(assert (= (or b!396092 b!396093) bm!27883))

(declare-fun m!391869 () Bool)

(assert (=> b!396091 m!391869))

(declare-fun m!391871 () Bool)

(assert (=> b!396091 m!391871))

(declare-fun m!391873 () Bool)

(assert (=> b!396091 m!391873))

(assert (=> b!396091 m!391869))

(declare-fun m!391875 () Bool)

(assert (=> b!396091 m!391875))

(declare-fun m!391877 () Bool)

(assert (=> bm!27883 m!391877))

(assert (=> b!396094 m!391869))

(assert (=> b!396094 m!391869))

(declare-fun m!391879 () Bool)

(assert (=> b!396094 m!391879))

(assert (=> b!396028 d!73381))

(declare-fun d!73383 () Bool)

(declare-fun res!227179 () Bool)

(declare-fun e!239715 () Bool)

(assert (=> d!73383 (=> res!227179 e!239715)))

(assert (=> d!73383 (= res!227179 ((_ is Nil!6517) Nil!6517))))

(assert (=> d!73383 (= (noDuplicate!198 Nil!6517) e!239715)))

(declare-fun b!396099 () Bool)

(declare-fun e!239716 () Bool)

(assert (=> b!396099 (= e!239715 e!239716)))

(declare-fun res!227180 () Bool)

(assert (=> b!396099 (=> (not res!227180) (not e!239716))))

(declare-fun contains!2482 (List!6520 (_ BitVec 64)) Bool)

(assert (=> b!396099 (= res!227180 (not (contains!2482 (t!11694 Nil!6517) (h!7372 Nil!6517))))))

(declare-fun b!396100 () Bool)

(assert (=> b!396100 (= e!239716 (noDuplicate!198 (t!11694 Nil!6517)))))

(assert (= (and d!73383 (not res!227179)) b!396099))

(assert (= (and b!396099 res!227180) b!396100))

(declare-fun m!391881 () Bool)

(assert (=> b!396099 m!391881))

(declare-fun m!391883 () Bool)

(assert (=> b!396100 m!391883))

(assert (=> b!396032 d!73383))

(declare-fun b!396111 () Bool)

(declare-fun e!239728 () Bool)

(declare-fun e!239727 () Bool)

(assert (=> b!396111 (= e!239728 e!239727)))

(declare-fun c!54565 () Bool)

(assert (=> b!396111 (= c!54565 (validKeyInArray!0 (select (arr!11249 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!396112 () Bool)

(declare-fun e!239725 () Bool)

(assert (=> b!396112 (= e!239725 e!239728)))

(declare-fun res!227189 () Bool)

(assert (=> b!396112 (=> (not res!227189) (not e!239728))))

(declare-fun e!239726 () Bool)

(assert (=> b!396112 (= res!227189 (not e!239726))))

(declare-fun res!227187 () Bool)

(assert (=> b!396112 (=> (not res!227187) (not e!239726))))

(assert (=> b!396112 (= res!227187 (validKeyInArray!0 (select (arr!11249 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!396113 () Bool)

(declare-fun call!27889 () Bool)

(assert (=> b!396113 (= e!239727 call!27889)))

(declare-fun b!396114 () Bool)

(assert (=> b!396114 (= e!239726 (contains!2482 Nil!6517 (select (arr!11249 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!73385 () Bool)

(declare-fun res!227188 () Bool)

(assert (=> d!73385 (=> res!227188 e!239725)))

(assert (=> d!73385 (= res!227188 (bvsge #b00000000000000000000000000000000 (size!11601 _keys!709)))))

(assert (=> d!73385 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6517) e!239725)))

(declare-fun b!396115 () Bool)

(assert (=> b!396115 (= e!239727 call!27889)))

(declare-fun bm!27886 () Bool)

(assert (=> bm!27886 (= call!27889 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54565 (Cons!6516 (select (arr!11249 _keys!709) #b00000000000000000000000000000000) Nil!6517) Nil!6517)))))

(assert (= (and d!73385 (not res!227188)) b!396112))

(assert (= (and b!396112 res!227187) b!396114))

(assert (= (and b!396112 res!227189) b!396111))

(assert (= (and b!396111 c!54565) b!396115))

(assert (= (and b!396111 (not c!54565)) b!396113))

(assert (= (or b!396115 b!396113) bm!27886))

(assert (=> b!396111 m!391869))

(assert (=> b!396111 m!391869))

(assert (=> b!396111 m!391879))

(assert (=> b!396112 m!391869))

(assert (=> b!396112 m!391869))

(assert (=> b!396112 m!391879))

(assert (=> b!396114 m!391869))

(assert (=> b!396114 m!391869))

(declare-fun m!391885 () Bool)

(assert (=> b!396114 m!391885))

(assert (=> bm!27886 m!391869))

(declare-fun m!391887 () Bool)

(assert (=> bm!27886 m!391887))

(assert (=> b!396029 d!73385))

(declare-fun d!73387 () Bool)

(declare-fun res!227194 () Bool)

(declare-fun e!239733 () Bool)

(assert (=> d!73387 (=> res!227194 e!239733)))

(assert (=> d!73387 (= res!227194 (= (select (arr!11249 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!73387 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!239733)))

(declare-fun b!396120 () Bool)

(declare-fun e!239734 () Bool)

(assert (=> b!396120 (= e!239733 e!239734)))

(declare-fun res!227195 () Bool)

(assert (=> b!396120 (=> (not res!227195) (not e!239734))))

(assert (=> b!396120 (= res!227195 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11601 _keys!709)))))

(declare-fun b!396121 () Bool)

(assert (=> b!396121 (= e!239734 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73387 (not res!227194)) b!396120))

(assert (= (and b!396120 res!227195) b!396121))

(assert (=> d!73387 m!391869))

(declare-fun m!391889 () Bool)

(assert (=> b!396121 m!391889))

(assert (=> b!396030 d!73387))

(declare-fun d!73389 () Bool)

(assert (=> d!73389 (= (array_inv!8256 _values!549) (bvsge (size!11602 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38390 d!73389))

(declare-fun d!73391 () Bool)

(assert (=> d!73391 (= (array_inv!8257 _keys!709) (bvsge (size!11601 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38390 d!73391))

(declare-fun b!396129 () Bool)

(declare-fun e!239740 () Bool)

(assert (=> b!396129 (= e!239740 tp_is_empty!9843)))

(declare-fun mapIsEmpty!16386 () Bool)

(declare-fun mapRes!16386 () Bool)

(assert (=> mapIsEmpty!16386 mapRes!16386))

(declare-fun b!396128 () Bool)

(declare-fun e!239739 () Bool)

(assert (=> b!396128 (= e!239739 tp_is_empty!9843)))

(declare-fun mapNonEmpty!16386 () Bool)

(declare-fun tp!32181 () Bool)

(assert (=> mapNonEmpty!16386 (= mapRes!16386 (and tp!32181 e!239739))))

(declare-fun mapKey!16386 () (_ BitVec 32))

(declare-fun mapValue!16386 () ValueCell!4578)

(declare-fun mapRest!16386 () (Array (_ BitVec 32) ValueCell!4578))

(assert (=> mapNonEmpty!16386 (= mapRest!16380 (store mapRest!16386 mapKey!16386 mapValue!16386))))

(declare-fun condMapEmpty!16386 () Bool)

(declare-fun mapDefault!16386 () ValueCell!4578)

(assert (=> mapNonEmpty!16380 (= condMapEmpty!16386 (= mapRest!16380 ((as const (Array (_ BitVec 32) ValueCell!4578)) mapDefault!16386)))))

(assert (=> mapNonEmpty!16380 (= tp!32175 (and e!239740 mapRes!16386))))

(assert (= (and mapNonEmpty!16380 condMapEmpty!16386) mapIsEmpty!16386))

(assert (= (and mapNonEmpty!16380 (not condMapEmpty!16386)) mapNonEmpty!16386))

(assert (= (and mapNonEmpty!16386 ((_ is ValueCellFull!4578) mapValue!16386)) b!396128))

(assert (= (and mapNonEmpty!16380 ((_ is ValueCellFull!4578) mapDefault!16386)) b!396129))

(declare-fun m!391891 () Bool)

(assert (=> mapNonEmpty!16386 m!391891))

(check-sat (not b!396099) (not b!396087) (not b!396114) (not bm!27886) (not b!396091) (not b!396111) (not b!396112) (not mapNonEmpty!16386) (not bm!27883) (not bm!27882) (not b!396121) (not b!396090) (not b!396094) (not b!396100) tp_is_empty!9843)
(check-sat)
