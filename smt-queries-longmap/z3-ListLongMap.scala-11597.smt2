; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135648 () Bool)

(assert start!135648)

(declare-fun res!1075764 () Bool)

(declare-fun e!878850 () Bool)

(assert (=> start!135648 (=> (not res!1075764) (not e!878850))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135648 (= res!1075764 (validMask!0 mask!889))))

(assert (=> start!135648 e!878850))

(assert (=> start!135648 true))

(declare-datatypes ((array!105227 0))(
  ( (array!105228 (arr!50764 (Array (_ BitVec 32) (_ BitVec 64))) (size!51315 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105227)

(declare-fun array_inv!39719 (array!105227) Bool)

(assert (=> start!135648 (array_inv!39719 _keys!600)))

(declare-fun b!1575738 () Bool)

(declare-fun res!1075765 () Bool)

(assert (=> b!1575738 (=> (not res!1075765) (not e!878850))))

(assert (=> b!1575738 (= res!1075765 (= (size!51315 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun e!878852 () Bool)

(declare-datatypes ((SeekEntryResult!13571 0))(
  ( (MissingZero!13571 (index!56682 (_ BitVec 32))) (Found!13571 (index!56683 (_ BitVec 32))) (Intermediate!13571 (undefined!14383 Bool) (index!56684 (_ BitVec 32)) (x!141688 (_ BitVec 32))) (Undefined!13571) (MissingVacant!13571 (index!56685 (_ BitVec 32))) )
))
(declare-fun lt!675257 () SeekEntryResult!13571)

(declare-fun b!1575741 () Bool)

(get-info :version)

(assert (=> b!1575741 (= e!878852 (and (not ((_ is MissingVacant!13571) lt!675257)) ((_ is Found!13571) lt!675257) (not (= (select (arr!50764 _keys!600) (index!56683 lt!675257)) k0!754))))))

(declare-fun lt!675258 () SeekEntryResult!13571)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105227 (_ BitVec 32)) SeekEntryResult!13571)

(assert (=> b!1575741 (= lt!675257 (seekKeyOrZeroReturnVacant!0 (x!141688 lt!675258) (index!56684 lt!675258) (index!56684 lt!675258) k0!754 _keys!600 mask!889))))

(declare-fun b!1575740 () Bool)

(assert (=> b!1575740 (= e!878850 e!878852)))

(declare-fun res!1075763 () Bool)

(assert (=> b!1575740 (=> (not res!1075763) (not e!878852))))

(assert (=> b!1575740 (= res!1075763 (and (not (undefined!14383 lt!675258)) ((_ is Intermediate!13571) lt!675258) (not (= (select (arr!50764 _keys!600) (index!56684 lt!675258)) k0!754)) (not (= (select (arr!50764 _keys!600) (index!56684 lt!675258)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50764 _keys!600) (index!56684 lt!675258)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56684 lt!675258) #b00000000000000000000000000000000) (bvslt (index!56684 lt!675258) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105227 (_ BitVec 32)) SeekEntryResult!13571)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575740 (= lt!675258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1575739 () Bool)

(declare-fun res!1075766 () Bool)

(assert (=> b!1575739 (=> (not res!1075766) (not e!878850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575739 (= res!1075766 (validKeyInArray!0 k0!754))))

(assert (= (and start!135648 res!1075764) b!1575738))

(assert (= (and b!1575738 res!1075765) b!1575739))

(assert (= (and b!1575739 res!1075766) b!1575740))

(assert (= (and b!1575740 res!1075763) b!1575741))

(declare-fun m!1449045 () Bool)

(assert (=> start!135648 m!1449045))

(declare-fun m!1449047 () Bool)

(assert (=> start!135648 m!1449047))

(declare-fun m!1449049 () Bool)

(assert (=> b!1575741 m!1449049))

(declare-fun m!1449051 () Bool)

(assert (=> b!1575741 m!1449051))

(declare-fun m!1449053 () Bool)

(assert (=> b!1575740 m!1449053))

(declare-fun m!1449055 () Bool)

(assert (=> b!1575740 m!1449055))

(assert (=> b!1575740 m!1449055))

(declare-fun m!1449057 () Bool)

(assert (=> b!1575740 m!1449057))

(declare-fun m!1449059 () Bool)

(assert (=> b!1575739 m!1449059))

(check-sat (not b!1575741) (not start!135648) (not b!1575740) (not b!1575739))
(check-sat)
(get-model)

(declare-fun b!1575778 () Bool)

(declare-fun e!878879 () SeekEntryResult!13571)

(declare-fun e!878877 () SeekEntryResult!13571)

(assert (=> b!1575778 (= e!878879 e!878877)))

(declare-fun c!146256 () Bool)

(declare-fun lt!675276 () (_ BitVec 64))

(assert (=> b!1575778 (= c!146256 (= lt!675276 k0!754))))

(declare-fun b!1575779 () Bool)

(assert (=> b!1575779 (= e!878877 (Found!13571 (index!56684 lt!675258)))))

(declare-fun b!1575780 () Bool)

(declare-fun e!878878 () SeekEntryResult!13571)

(assert (=> b!1575780 (= e!878878 (MissingVacant!13571 (index!56684 lt!675258)))))

(declare-fun d!165671 () Bool)

(declare-fun lt!675275 () SeekEntryResult!13571)

(assert (=> d!165671 (and (or ((_ is Undefined!13571) lt!675275) (not ((_ is Found!13571) lt!675275)) (and (bvsge (index!56683 lt!675275) #b00000000000000000000000000000000) (bvslt (index!56683 lt!675275) (size!51315 _keys!600)))) (or ((_ is Undefined!13571) lt!675275) ((_ is Found!13571) lt!675275) (not ((_ is MissingVacant!13571) lt!675275)) (not (= (index!56685 lt!675275) (index!56684 lt!675258))) (and (bvsge (index!56685 lt!675275) #b00000000000000000000000000000000) (bvslt (index!56685 lt!675275) (size!51315 _keys!600)))) (or ((_ is Undefined!13571) lt!675275) (ite ((_ is Found!13571) lt!675275) (= (select (arr!50764 _keys!600) (index!56683 lt!675275)) k0!754) (and ((_ is MissingVacant!13571) lt!675275) (= (index!56685 lt!675275) (index!56684 lt!675258)) (= (select (arr!50764 _keys!600) (index!56685 lt!675275)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!165671 (= lt!675275 e!878879)))

(declare-fun c!146258 () Bool)

(assert (=> d!165671 (= c!146258 (bvsge (x!141688 lt!675258) #b01111111111111111111111111111110))))

(assert (=> d!165671 (= lt!675276 (select (arr!50764 _keys!600) (index!56684 lt!675258)))))

(assert (=> d!165671 (validMask!0 mask!889)))

(assert (=> d!165671 (= (seekKeyOrZeroReturnVacant!0 (x!141688 lt!675258) (index!56684 lt!675258) (index!56684 lt!675258) k0!754 _keys!600 mask!889) lt!675275)))

(declare-fun b!1575781 () Bool)

(assert (=> b!1575781 (= e!878879 Undefined!13571)))

(declare-fun b!1575782 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575782 (= e!878878 (seekKeyOrZeroReturnVacant!0 (bvadd (x!141688 lt!675258) #b00000000000000000000000000000001) (nextIndex!0 (index!56684 lt!675258) (bvadd (x!141688 lt!675258) #b00000000000000000000000000000001) mask!889) (index!56684 lt!675258) k0!754 _keys!600 mask!889))))

(declare-fun b!1575783 () Bool)

(declare-fun c!146257 () Bool)

(assert (=> b!1575783 (= c!146257 (= lt!675276 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575783 (= e!878877 e!878878)))

(assert (= (and d!165671 c!146258) b!1575781))

(assert (= (and d!165671 (not c!146258)) b!1575778))

(assert (= (and b!1575778 c!146256) b!1575779))

(assert (= (and b!1575778 (not c!146256)) b!1575783))

(assert (= (and b!1575783 c!146257) b!1575780))

(assert (= (and b!1575783 (not c!146257)) b!1575782))

(declare-fun m!1449093 () Bool)

(assert (=> d!165671 m!1449093))

(declare-fun m!1449095 () Bool)

(assert (=> d!165671 m!1449095))

(assert (=> d!165671 m!1449053))

(assert (=> d!165671 m!1449045))

(declare-fun m!1449097 () Bool)

(assert (=> b!1575782 m!1449097))

(assert (=> b!1575782 m!1449097))

(declare-fun m!1449099 () Bool)

(assert (=> b!1575782 m!1449099))

(assert (=> b!1575741 d!165671))

(declare-fun d!165677 () Bool)

(assert (=> d!165677 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135648 d!165677))

(declare-fun d!165681 () Bool)

(assert (=> d!165681 (= (array_inv!39719 _keys!600) (bvsge (size!51315 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135648 d!165681))

(declare-fun b!1575865 () Bool)

(declare-fun e!878926 () SeekEntryResult!13571)

(declare-fun e!878925 () SeekEntryResult!13571)

(assert (=> b!1575865 (= e!878926 e!878925)))

(declare-fun c!146292 () Bool)

(declare-fun lt!675305 () (_ BitVec 64))

(assert (=> b!1575865 (= c!146292 (or (= lt!675305 k0!754) (= (bvadd lt!675305 lt!675305) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575866 () Bool)

(declare-fun e!878924 () Bool)

(declare-fun lt!675306 () SeekEntryResult!13571)

(assert (=> b!1575866 (= e!878924 (bvsge (x!141688 lt!675306) #b01111111111111111111111111111110))))

(declare-fun b!1575867 () Bool)

(assert (=> b!1575867 (= e!878926 (Intermediate!13571 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!165683 () Bool)

(assert (=> d!165683 e!878924))

(declare-fun c!146293 () Bool)

(assert (=> d!165683 (= c!146293 (and ((_ is Intermediate!13571) lt!675306) (undefined!14383 lt!675306)))))

(assert (=> d!165683 (= lt!675306 e!878926)))

(declare-fun c!146294 () Bool)

(assert (=> d!165683 (= c!146294 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165683 (= lt!675305 (select (arr!50764 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!165683 (validMask!0 mask!889)))

(assert (=> d!165683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!675306)))

(declare-fun b!1575868 () Bool)

(assert (=> b!1575868 (and (bvsge (index!56684 lt!675306) #b00000000000000000000000000000000) (bvslt (index!56684 lt!675306) (size!51315 _keys!600)))))

(declare-fun e!878927 () Bool)

(assert (=> b!1575868 (= e!878927 (= (select (arr!50764 _keys!600) (index!56684 lt!675306)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575869 () Bool)

(assert (=> b!1575869 (= e!878925 (Intermediate!13571 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1575870 () Bool)

(assert (=> b!1575870 (and (bvsge (index!56684 lt!675306) #b00000000000000000000000000000000) (bvslt (index!56684 lt!675306) (size!51315 _keys!600)))))

(declare-fun res!1075809 () Bool)

(assert (=> b!1575870 (= res!1075809 (= (select (arr!50764 _keys!600) (index!56684 lt!675306)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575870 (=> res!1075809 e!878927)))

(declare-fun b!1575871 () Bool)

(assert (=> b!1575871 (and (bvsge (index!56684 lt!675306) #b00000000000000000000000000000000) (bvslt (index!56684 lt!675306) (size!51315 _keys!600)))))

(declare-fun res!1075808 () Bool)

(assert (=> b!1575871 (= res!1075808 (= (select (arr!50764 _keys!600) (index!56684 lt!675306)) k0!754))))

(assert (=> b!1575871 (=> res!1075808 e!878927)))

(declare-fun e!878923 () Bool)

(assert (=> b!1575871 (= e!878923 e!878927)))

(declare-fun b!1575872 () Bool)

(assert (=> b!1575872 (= e!878925 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1575873 () Bool)

(assert (=> b!1575873 (= e!878924 e!878923)))

(declare-fun res!1075807 () Bool)

(assert (=> b!1575873 (= res!1075807 (and ((_ is Intermediate!13571) lt!675306) (not (undefined!14383 lt!675306)) (bvslt (x!141688 lt!675306) #b01111111111111111111111111111110) (bvsge (x!141688 lt!675306) #b00000000000000000000000000000000) (bvsge (x!141688 lt!675306) #b00000000000000000000000000000000)))))

(assert (=> b!1575873 (=> (not res!1075807) (not e!878923))))

(assert (= (and d!165683 c!146294) b!1575867))

(assert (= (and d!165683 (not c!146294)) b!1575865))

(assert (= (and b!1575865 c!146292) b!1575869))

(assert (= (and b!1575865 (not c!146292)) b!1575872))

(assert (= (and d!165683 c!146293) b!1575866))

(assert (= (and d!165683 (not c!146293)) b!1575873))

(assert (= (and b!1575873 res!1075807) b!1575871))

(assert (= (and b!1575871 (not res!1075808)) b!1575870))

(assert (= (and b!1575870 (not res!1075809)) b!1575868))

(assert (=> d!165683 m!1449055))

(declare-fun m!1449125 () Bool)

(assert (=> d!165683 m!1449125))

(assert (=> d!165683 m!1449045))

(assert (=> b!1575872 m!1449055))

(declare-fun m!1449127 () Bool)

(assert (=> b!1575872 m!1449127))

(assert (=> b!1575872 m!1449127))

(declare-fun m!1449129 () Bool)

(assert (=> b!1575872 m!1449129))

(declare-fun m!1449131 () Bool)

(assert (=> b!1575871 m!1449131))

(assert (=> b!1575870 m!1449131))

(assert (=> b!1575868 m!1449131))

(assert (=> b!1575740 d!165683))

(declare-fun d!165697 () Bool)

(declare-fun lt!675312 () (_ BitVec 32))

(declare-fun lt!675311 () (_ BitVec 32))

(assert (=> d!165697 (= lt!675312 (bvmul (bvxor lt!675311 (bvlshr lt!675311 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165697 (= lt!675311 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165697 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075810 (let ((h!38285 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141697 (bvmul (bvxor h!38285 (bvlshr h!38285 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141697 (bvlshr x!141697 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075810 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075810 #b00000000000000000000000000000000))))))

(assert (=> d!165697 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!675312 (bvlshr lt!675312 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1575740 d!165697))

(declare-fun d!165701 () Bool)

(assert (=> d!165701 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575739 d!165701))

(check-sat (not b!1575872) (not d!165671) (not d!165683) (not b!1575782))
(check-sat)
