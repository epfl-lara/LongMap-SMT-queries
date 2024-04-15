; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135144 () Bool)

(assert start!135144)

(declare-fun b!1572820 () Bool)

(declare-fun e!877045 () Bool)

(declare-fun e!877044 () Bool)

(assert (=> b!1572820 (= e!877045 e!877044)))

(declare-fun res!1074710 () Bool)

(assert (=> b!1572820 (=> (not res!1074710) (not e!877044))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!105024 0))(
  ( (array!105025 (arr!50672 (Array (_ BitVec 32) (_ BitVec 64))) (size!51224 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105024)

(declare-datatypes ((SeekEntryResult!13620 0))(
  ( (MissingZero!13620 (index!56878 (_ BitVec 32))) (Found!13620 (index!56879 (_ BitVec 32))) (Intermediate!13620 (undefined!14432 Bool) (index!56880 (_ BitVec 32)) (x!141664 (_ BitVec 32))) (Undefined!13620) (MissingVacant!13620 (index!56881 (_ BitVec 32))) )
))
(declare-fun lt!673992 () SeekEntryResult!13620)

(declare-fun k0!754 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1572820 (= res!1074710 (and (not (undefined!14432 lt!673992)) ((_ is Intermediate!13620) lt!673992) (not (= (select (arr!50672 _keys!600) (index!56880 lt!673992)) k0!754)) (not (= (select (arr!50672 _keys!600) (index!56880 lt!673992)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50672 _keys!600) (index!56880 lt!673992)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56880 lt!673992) #b00000000000000000000000000000000) (bvslt (index!56880 lt!673992) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105024 (_ BitVec 32)) SeekEntryResult!13620)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572820 (= lt!673992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun res!1074708 () Bool)

(assert (=> start!135144 (=> (not res!1074708) (not e!877045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135144 (= res!1074708 (validMask!0 mask!889))))

(assert (=> start!135144 e!877045))

(assert (=> start!135144 true))

(declare-fun array_inv!39608 (array!105024) Bool)

(assert (=> start!135144 (array_inv!39608 _keys!600)))

(declare-fun b!1572818 () Bool)

(declare-fun res!1074711 () Bool)

(assert (=> b!1572818 (=> (not res!1074711) (not e!877045))))

(assert (=> b!1572818 (= res!1074711 (= (size!51224 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572821 () Bool)

(declare-fun lt!673991 () SeekEntryResult!13620)

(assert (=> b!1572821 (= e!877044 (and (not ((_ is MissingVacant!13620) lt!673991)) (not ((_ is Found!13620) lt!673991)) (not ((_ is MissingZero!13620) lt!673991)) (not ((_ is Undefined!13620) lt!673991))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105024 (_ BitVec 32)) SeekEntryResult!13620)

(assert (=> b!1572821 (= lt!673991 (seekKeyOrZeroReturnVacant!0 (x!141664 lt!673992) (index!56880 lt!673992) (index!56880 lt!673992) k0!754 _keys!600 mask!889))))

(declare-fun b!1572819 () Bool)

(declare-fun res!1074709 () Bool)

(assert (=> b!1572819 (=> (not res!1074709) (not e!877045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572819 (= res!1074709 (validKeyInArray!0 k0!754))))

(assert (= (and start!135144 res!1074708) b!1572818))

(assert (= (and b!1572818 res!1074711) b!1572819))

(assert (= (and b!1572819 res!1074709) b!1572820))

(assert (= (and b!1572820 res!1074710) b!1572821))

(declare-fun m!1445805 () Bool)

(assert (=> b!1572820 m!1445805))

(declare-fun m!1445807 () Bool)

(assert (=> b!1572820 m!1445807))

(assert (=> b!1572820 m!1445807))

(declare-fun m!1445809 () Bool)

(assert (=> b!1572820 m!1445809))

(declare-fun m!1445811 () Bool)

(assert (=> start!135144 m!1445811))

(declare-fun m!1445813 () Bool)

(assert (=> start!135144 m!1445813))

(declare-fun m!1445815 () Bool)

(assert (=> b!1572821 m!1445815))

(declare-fun m!1445817 () Bool)

(assert (=> b!1572819 m!1445817))

(check-sat (not b!1572821) (not b!1572820) (not start!135144) (not b!1572819))
(check-sat)
(get-model)

(declare-fun b!1572858 () Bool)

(declare-fun c!145314 () Bool)

(declare-fun lt!674009 () (_ BitVec 64))

(assert (=> b!1572858 (= c!145314 (= lt!674009 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!877072 () SeekEntryResult!13620)

(declare-fun e!877073 () SeekEntryResult!13620)

(assert (=> b!1572858 (= e!877072 e!877073)))

(declare-fun b!1572859 () Bool)

(assert (=> b!1572859 (= e!877072 (Found!13620 (index!56880 lt!673992)))))

(declare-fun b!1572860 () Bool)

(declare-fun e!877071 () SeekEntryResult!13620)

(assert (=> b!1572860 (= e!877071 Undefined!13620)))

(declare-fun b!1572861 () Bool)

(assert (=> b!1572861 (= e!877073 (MissingVacant!13620 (index!56880 lt!673992)))))

(declare-fun b!1572863 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572863 (= e!877073 (seekKeyOrZeroReturnVacant!0 (bvadd (x!141664 lt!673992) #b00000000000000000000000000000001) (nextIndex!0 (index!56880 lt!673992) (x!141664 lt!673992) mask!889) (index!56880 lt!673992) k0!754 _keys!600 mask!889))))

(declare-fun d!164677 () Bool)

(declare-fun lt!674010 () SeekEntryResult!13620)

(assert (=> d!164677 (and (or ((_ is Undefined!13620) lt!674010) (not ((_ is Found!13620) lt!674010)) (and (bvsge (index!56879 lt!674010) #b00000000000000000000000000000000) (bvslt (index!56879 lt!674010) (size!51224 _keys!600)))) (or ((_ is Undefined!13620) lt!674010) ((_ is Found!13620) lt!674010) (not ((_ is MissingVacant!13620) lt!674010)) (not (= (index!56881 lt!674010) (index!56880 lt!673992))) (and (bvsge (index!56881 lt!674010) #b00000000000000000000000000000000) (bvslt (index!56881 lt!674010) (size!51224 _keys!600)))) (or ((_ is Undefined!13620) lt!674010) (ite ((_ is Found!13620) lt!674010) (= (select (arr!50672 _keys!600) (index!56879 lt!674010)) k0!754) (and ((_ is MissingVacant!13620) lt!674010) (= (index!56881 lt!674010) (index!56880 lt!673992)) (= (select (arr!50672 _keys!600) (index!56881 lt!674010)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!164677 (= lt!674010 e!877071)))

(declare-fun c!145313 () Bool)

(assert (=> d!164677 (= c!145313 (bvsge (x!141664 lt!673992) #b01111111111111111111111111111110))))

(assert (=> d!164677 (= lt!674009 (select (arr!50672 _keys!600) (index!56880 lt!673992)))))

(assert (=> d!164677 (validMask!0 mask!889)))

(assert (=> d!164677 (= (seekKeyOrZeroReturnVacant!0 (x!141664 lt!673992) (index!56880 lt!673992) (index!56880 lt!673992) k0!754 _keys!600 mask!889) lt!674010)))

(declare-fun b!1572862 () Bool)

(assert (=> b!1572862 (= e!877071 e!877072)))

(declare-fun c!145315 () Bool)

(assert (=> b!1572862 (= c!145315 (= lt!674009 k0!754))))

(assert (= (and d!164677 c!145313) b!1572860))

(assert (= (and d!164677 (not c!145313)) b!1572862))

(assert (= (and b!1572862 c!145315) b!1572859))

(assert (= (and b!1572862 (not c!145315)) b!1572858))

(assert (= (and b!1572858 c!145314) b!1572861))

(assert (= (and b!1572858 (not c!145314)) b!1572863))

(declare-fun m!1445847 () Bool)

(assert (=> b!1572863 m!1445847))

(assert (=> b!1572863 m!1445847))

(declare-fun m!1445849 () Bool)

(assert (=> b!1572863 m!1445849))

(declare-fun m!1445851 () Bool)

(assert (=> d!164677 m!1445851))

(declare-fun m!1445853 () Bool)

(assert (=> d!164677 m!1445853))

(assert (=> d!164677 m!1445805))

(assert (=> d!164677 m!1445811))

(assert (=> b!1572821 d!164677))

(declare-fun b!1572900 () Bool)

(declare-fun lt!674021 () SeekEntryResult!13620)

(assert (=> b!1572900 (and (bvsge (index!56880 lt!674021) #b00000000000000000000000000000000) (bvslt (index!56880 lt!674021) (size!51224 _keys!600)))))

(declare-fun e!877097 () Bool)

(assert (=> b!1572900 (= e!877097 (= (select (arr!50672 _keys!600) (index!56880 lt!674021)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!164683 () Bool)

(declare-fun e!877093 () Bool)

(assert (=> d!164683 e!877093))

(declare-fun c!145333 () Bool)

(assert (=> d!164683 (= c!145333 (and ((_ is Intermediate!13620) lt!674021) (undefined!14432 lt!674021)))))

(declare-fun e!877094 () SeekEntryResult!13620)

(assert (=> d!164683 (= lt!674021 e!877094)))

(declare-fun c!145332 () Bool)

(assert (=> d!164683 (= c!145332 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674022 () (_ BitVec 64))

(assert (=> d!164683 (= lt!674022 (select (arr!50672 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164683 (validMask!0 mask!889)))

(assert (=> d!164683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674021)))

(declare-fun b!1572901 () Bool)

(assert (=> b!1572901 (= e!877094 (Intermediate!13620 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572902 () Bool)

(assert (=> b!1572902 (and (bvsge (index!56880 lt!674021) #b00000000000000000000000000000000) (bvslt (index!56880 lt!674021) (size!51224 _keys!600)))))

(declare-fun res!1074742 () Bool)

(assert (=> b!1572902 (= res!1074742 (= (select (arr!50672 _keys!600) (index!56880 lt!674021)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1572902 (=> res!1074742 e!877097)))

(declare-fun b!1572903 () Bool)

(declare-fun e!877096 () Bool)

(assert (=> b!1572903 (= e!877093 e!877096)))

(declare-fun res!1074744 () Bool)

(assert (=> b!1572903 (= res!1074744 (and ((_ is Intermediate!13620) lt!674021) (not (undefined!14432 lt!674021)) (bvslt (x!141664 lt!674021) #b01111111111111111111111111111110) (bvsge (x!141664 lt!674021) #b00000000000000000000000000000000) (bvsge (x!141664 lt!674021) #b00000000000000000000000000000000)))))

(assert (=> b!1572903 (=> (not res!1074744) (not e!877096))))

(declare-fun b!1572904 () Bool)

(declare-fun e!877095 () SeekEntryResult!13620)

(assert (=> b!1572904 (= e!877095 (Intermediate!13620 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572905 () Bool)

(assert (=> b!1572905 (= e!877094 e!877095)))

(declare-fun c!145331 () Bool)

(assert (=> b!1572905 (= c!145331 (or (= lt!674022 k0!754) (= (bvadd lt!674022 lt!674022) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1572906 () Bool)

(assert (=> b!1572906 (and (bvsge (index!56880 lt!674021) #b00000000000000000000000000000000) (bvslt (index!56880 lt!674021) (size!51224 _keys!600)))))

(declare-fun res!1074743 () Bool)

(assert (=> b!1572906 (= res!1074743 (= (select (arr!50672 _keys!600) (index!56880 lt!674021)) k0!754))))

(assert (=> b!1572906 (=> res!1074743 e!877097)))

(assert (=> b!1572906 (= e!877096 e!877097)))

(declare-fun b!1572907 () Bool)

(assert (=> b!1572907 (= e!877093 (bvsge (x!141664 lt!674021) #b01111111111111111111111111111110))))

(declare-fun b!1572908 () Bool)

(assert (=> b!1572908 (= e!877095 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and d!164683 c!145332) b!1572901))

(assert (= (and d!164683 (not c!145332)) b!1572905))

(assert (= (and b!1572905 c!145331) b!1572904))

(assert (= (and b!1572905 (not c!145331)) b!1572908))

(assert (= (and d!164683 c!145333) b!1572907))

(assert (= (and d!164683 (not c!145333)) b!1572903))

(assert (= (and b!1572903 res!1074744) b!1572906))

(assert (= (and b!1572906 (not res!1074743)) b!1572902))

(assert (= (and b!1572902 (not res!1074742)) b!1572900))

(declare-fun m!1445863 () Bool)

(assert (=> b!1572900 m!1445863))

(assert (=> b!1572902 m!1445863))

(assert (=> b!1572908 m!1445807))

(declare-fun m!1445865 () Bool)

(assert (=> b!1572908 m!1445865))

(assert (=> b!1572908 m!1445865))

(declare-fun m!1445867 () Bool)

(assert (=> b!1572908 m!1445867))

(assert (=> b!1572906 m!1445863))

(assert (=> d!164683 m!1445807))

(declare-fun m!1445869 () Bool)

(assert (=> d!164683 m!1445869))

(assert (=> d!164683 m!1445811))

(assert (=> b!1572820 d!164683))

(declare-fun d!164693 () Bool)

(declare-fun lt!674038 () (_ BitVec 32))

(declare-fun lt!674037 () (_ BitVec 32))

(assert (=> d!164693 (= lt!674038 (bvmul (bvxor lt!674037 (bvlshr lt!674037 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164693 (= lt!674037 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164693 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074745 (let ((h!38273 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141672 (bvmul (bvxor h!38273 (bvlshr h!38273 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141672 (bvlshr x!141672 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074745 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074745 #b00000000000000000000000000000000))))))

(assert (=> d!164693 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!674038 (bvlshr lt!674038 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572820 d!164693))

(declare-fun d!164695 () Bool)

(assert (=> d!164695 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135144 d!164695))

(declare-fun d!164703 () Bool)

(assert (=> d!164703 (= (array_inv!39608 _keys!600) (bvsge (size!51224 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135144 d!164703))

(declare-fun d!164705 () Bool)

(assert (=> d!164705 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572819 d!164705))

(check-sat (not d!164683) (not d!164677) (not b!1572863) (not b!1572908))
(check-sat)
