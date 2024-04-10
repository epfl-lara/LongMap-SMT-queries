; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7888 () Bool)

(assert start!7888)

(declare-fun res!28751 () Bool)

(declare-fun e!32004 () Bool)

(assert (=> start!7888 (=> (not res!28751) (not e!32004))))

(declare-fun mask!2234 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7888 (= res!28751 (validMask!0 mask!2234))))

(assert (=> start!7888 e!32004))

(assert (=> start!7888 true))

(declare-datatypes ((array!3239 0))(
  ( (array!3240 (arr!1552 (Array (_ BitVec 32) (_ BitVec 64))) (size!1774 (_ BitVec 32))) )
))
(declare-fun _keys!1794 () array!3239)

(declare-fun array_inv!948 (array!3239) Bool)

(assert (=> start!7888 (array_inv!948 _keys!1794)))

(declare-fun b!49693 () Bool)

(declare-fun res!28750 () Bool)

(assert (=> b!49693 (=> (not res!28750) (not e!32004))))

(declare-fun i!836 () (_ BitVec 32))

(assert (=> b!49693 (= res!28750 (and (= (size!1774 _keys!1794) (bvadd #b00000000000000000000000000000001 mask!2234)) (= _keys!1794 (array!3240 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!2234))) (bvsge i!836 #b00000000000000000000000000000000) (bvsle i!836 (size!1774 _keys!1794)) (bvslt i!836 (size!1774 _keys!1794)) (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))))

(declare-fun b!49694 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3239 (_ BitVec 32)) Bool)

(assert (=> b!49694 (= e!32004 (not (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234)))))

(assert (=> b!49694 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-datatypes ((Unit!1407 0))(
  ( (Unit!1408) )
))
(declare-fun lt!20861 () Unit!1407)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!3239 (_ BitVec 32) (_ BitVec 32)) Unit!1407)

(assert (=> b!49694 (= lt!20861 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (= (and start!7888 res!28751) b!49693))

(assert (= (and b!49693 res!28750) b!49694))

(declare-fun m!43081 () Bool)

(assert (=> start!7888 m!43081))

(declare-fun m!43083 () Bool)

(assert (=> start!7888 m!43083))

(declare-fun m!43085 () Bool)

(assert (=> b!49694 m!43085))

(declare-fun m!43087 () Bool)

(assert (=> b!49694 m!43087))

(declare-fun m!43089 () Bool)

(assert (=> b!49694 m!43089))

(check-sat (not start!7888) (not b!49694))
(check-sat)
(get-model)

(declare-fun d!9967 () Bool)

(assert (=> d!9967 (= (validMask!0 mask!2234) (and (or (= mask!2234 #b00000000000000000000000000000111) (= mask!2234 #b00000000000000000000000000001111) (= mask!2234 #b00000000000000000000000000011111) (= mask!2234 #b00000000000000000000000000111111) (= mask!2234 #b00000000000000000000000001111111) (= mask!2234 #b00000000000000000000000011111111) (= mask!2234 #b00000000000000000000000111111111) (= mask!2234 #b00000000000000000000001111111111) (= mask!2234 #b00000000000000000000011111111111) (= mask!2234 #b00000000000000000000111111111111) (= mask!2234 #b00000000000000000001111111111111) (= mask!2234 #b00000000000000000011111111111111) (= mask!2234 #b00000000000000000111111111111111) (= mask!2234 #b00000000000000001111111111111111) (= mask!2234 #b00000000000000011111111111111111) (= mask!2234 #b00000000000000111111111111111111) (= mask!2234 #b00000000000001111111111111111111) (= mask!2234 #b00000000000011111111111111111111) (= mask!2234 #b00000000000111111111111111111111) (= mask!2234 #b00000000001111111111111111111111) (= mask!2234 #b00000000011111111111111111111111) (= mask!2234 #b00000000111111111111111111111111) (= mask!2234 #b00000001111111111111111111111111) (= mask!2234 #b00000011111111111111111111111111) (= mask!2234 #b00000111111111111111111111111111) (= mask!2234 #b00001111111111111111111111111111) (= mask!2234 #b00011111111111111111111111111111) (= mask!2234 #b00111111111111111111111111111111)) (bvsle mask!2234 #b00111111111111111111111111111111)))))

(assert (=> start!7888 d!9967))

(declare-fun d!9973 () Bool)

(assert (=> d!9973 (= (array_inv!948 _keys!1794) (bvsge (size!1774 _keys!1794) #b00000000000000000000000000000000))))

(assert (=> start!7888 d!9973))

(declare-fun d!9975 () Bool)

(declare-fun res!28762 () Bool)

(declare-fun e!32020 () Bool)

(assert (=> d!9975 (=> res!28762 e!32020)))

(assert (=> d!9975 (= res!28762 (bvsge i!836 (size!1774 _keys!1794)))))

(assert (=> d!9975 (= (arrayForallSeekEntryOrOpenFound!0 i!836 _keys!1794 mask!2234) e!32020)))

(declare-fun call!3847 () Bool)

(declare-fun bm!3844 () Bool)

(assert (=> bm!3844 (= call!3847 (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49709 () Bool)

(declare-fun e!32018 () Bool)

(declare-fun e!32019 () Bool)

(assert (=> b!49709 (= e!32018 e!32019)))

(declare-fun lt!20872 () (_ BitVec 64))

(assert (=> b!49709 (= lt!20872 (select (arr!1552 _keys!1794) i!836))))

(declare-fun lt!20871 () Unit!1407)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3239 (_ BitVec 64) (_ BitVec 32)) Unit!1407)

(assert (=> b!49709 (= lt!20871 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20872 i!836))))

(declare-fun arrayContainsKey!0 (array!3239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!49709 (arrayContainsKey!0 _keys!1794 lt!20872 #b00000000000000000000000000000000)))

(declare-fun lt!20873 () Unit!1407)

(assert (=> b!49709 (= lt!20873 lt!20871)))

(declare-fun res!28763 () Bool)

(declare-datatypes ((SeekEntryResult!212 0))(
  ( (MissingZero!212 (index!2970 (_ BitVec 32))) (Found!212 (index!2971 (_ BitVec 32))) (Intermediate!212 (undefined!1024 Bool) (index!2972 (_ BitVec 32)) (x!9102 (_ BitVec 32))) (Undefined!212) (MissingVacant!212 (index!2973 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3239 (_ BitVec 32)) SeekEntryResult!212)

(assert (=> b!49709 (= res!28763 (= (seekEntryOrOpen!0 (select (arr!1552 _keys!1794) i!836) _keys!1794 mask!2234) (Found!212 i!836)))))

(assert (=> b!49709 (=> (not res!28763) (not e!32019))))

(declare-fun b!49710 () Bool)

(assert (=> b!49710 (= e!32020 e!32018)))

(declare-fun c!6699 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!49710 (= c!6699 (validKeyInArray!0 (select (arr!1552 _keys!1794) i!836)))))

(declare-fun b!49711 () Bool)

(assert (=> b!49711 (= e!32018 call!3847)))

(declare-fun b!49712 () Bool)

(assert (=> b!49712 (= e!32019 call!3847)))

(assert (= (and d!9975 (not res!28762)) b!49710))

(assert (= (and b!49710 c!6699) b!49709))

(assert (= (and b!49710 (not c!6699)) b!49711))

(assert (= (and b!49709 res!28763) b!49712))

(assert (= (or b!49712 b!49711) bm!3844))

(declare-fun m!43101 () Bool)

(assert (=> bm!3844 m!43101))

(declare-fun m!43103 () Bool)

(assert (=> b!49709 m!43103))

(declare-fun m!43105 () Bool)

(assert (=> b!49709 m!43105))

(declare-fun m!43107 () Bool)

(assert (=> b!49709 m!43107))

(assert (=> b!49709 m!43103))

(declare-fun m!43109 () Bool)

(assert (=> b!49709 m!43109))

(assert (=> b!49710 m!43103))

(assert (=> b!49710 m!43103))

(declare-fun m!43111 () Bool)

(assert (=> b!49710 m!43111))

(assert (=> b!49694 d!9975))

(declare-fun d!9985 () Bool)

(declare-fun res!28768 () Bool)

(declare-fun e!32029 () Bool)

(assert (=> d!9985 (=> res!28768 e!32029)))

(assert (=> d!9985 (= res!28768 (bvsge (bvadd #b00000000000000000000000000000001 i!836) (size!1774 _keys!1794)))))

(assert (=> d!9985 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234) e!32029)))

(declare-fun bm!3845 () Bool)

(declare-fun call!3850 () Bool)

(assert (=> bm!3845 (= call!3850 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49721 () Bool)

(declare-fun e!32027 () Bool)

(declare-fun e!32028 () Bool)

(assert (=> b!49721 (= e!32027 e!32028)))

(declare-fun lt!20881 () (_ BitVec 64))

(assert (=> b!49721 (= lt!20881 (select (arr!1552 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)))))

(declare-fun lt!20880 () Unit!1407)

(assert (=> b!49721 (= lt!20880 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20881 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (=> b!49721 (arrayContainsKey!0 _keys!1794 lt!20881 #b00000000000000000000000000000000)))

(declare-fun lt!20882 () Unit!1407)

(assert (=> b!49721 (= lt!20882 lt!20880)))

(declare-fun res!28769 () Bool)

(assert (=> b!49721 (= res!28769 (= (seekEntryOrOpen!0 (select (arr!1552 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234) (Found!212 (bvadd #b00000000000000000000000000000001 i!836))))))

(assert (=> b!49721 (=> (not res!28769) (not e!32028))))

(declare-fun b!49722 () Bool)

(assert (=> b!49722 (= e!32029 e!32027)))

(declare-fun c!6702 () Bool)

(assert (=> b!49722 (= c!6702 (validKeyInArray!0 (select (arr!1552 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))))))

(declare-fun b!49723 () Bool)

(assert (=> b!49723 (= e!32027 call!3850)))

(declare-fun b!49724 () Bool)

(assert (=> b!49724 (= e!32028 call!3850)))

(assert (= (and d!9985 (not res!28768)) b!49722))

(assert (= (and b!49722 c!6702) b!49721))

(assert (= (and b!49722 (not c!6702)) b!49723))

(assert (= (and b!49721 res!28769) b!49724))

(assert (= (or b!49724 b!49723) bm!3845))

(declare-fun m!43113 () Bool)

(assert (=> bm!3845 m!43113))

(declare-fun m!43115 () Bool)

(assert (=> b!49721 m!43115))

(declare-fun m!43117 () Bool)

(assert (=> b!49721 m!43117))

(declare-fun m!43119 () Bool)

(assert (=> b!49721 m!43119))

(assert (=> b!49721 m!43115))

(declare-fun m!43121 () Bool)

(assert (=> b!49721 m!43121))

(assert (=> b!49722 m!43115))

(assert (=> b!49722 m!43115))

(declare-fun m!43123 () Bool)

(assert (=> b!49722 m!43123))

(assert (=> b!49694 d!9985))

(declare-fun d!9987 () Bool)

(assert (=> d!9987 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(declare-fun lt!20900 () Unit!1407)

(declare-fun choose!34 (array!3239 (_ BitVec 32) (_ BitVec 32)) Unit!1407)

(assert (=> d!9987 (= lt!20900 (choose!34 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (=> d!9987 (validMask!0 mask!2234)))

(assert (=> d!9987 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)) lt!20900)))

(declare-fun bs!2332 () Bool)

(assert (= bs!2332 d!9987))

(assert (=> bs!2332 m!43087))

(declare-fun m!43161 () Bool)

(assert (=> bs!2332 m!43161))

(assert (=> bs!2332 m!43081))

(assert (=> b!49694 d!9987))

(check-sat (not d!9987) (not bm!3844) (not bm!3845) (not b!49709) (not b!49710) (not b!49721) (not b!49722))
(check-sat)
(get-model)

(declare-fun d!9997 () Bool)

(assert (=> d!9997 (arrayContainsKey!0 _keys!1794 lt!20881 #b00000000000000000000000000000000)))

(declare-fun lt!20912 () Unit!1407)

(declare-fun choose!13 (array!3239 (_ BitVec 64) (_ BitVec 32)) Unit!1407)

(assert (=> d!9997 (= lt!20912 (choose!13 _keys!1794 lt!20881 (bvadd #b00000000000000000000000000000001 i!836)))))

(assert (=> d!9997 (bvsge (bvadd #b00000000000000000000000000000001 i!836) #b00000000000000000000000000000000)))

(assert (=> d!9997 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20881 (bvadd #b00000000000000000000000000000001 i!836)) lt!20912)))

(declare-fun bs!2335 () Bool)

(assert (= bs!2335 d!9997))

(assert (=> bs!2335 m!43119))

(declare-fun m!43179 () Bool)

(assert (=> bs!2335 m!43179))

(assert (=> b!49721 d!9997))

(declare-fun d!10001 () Bool)

(declare-fun res!28788 () Bool)

(declare-fun e!32055 () Bool)

(assert (=> d!10001 (=> res!28788 e!32055)))

(assert (=> d!10001 (= res!28788 (= (select (arr!1552 _keys!1794) #b00000000000000000000000000000000) lt!20881))))

(assert (=> d!10001 (= (arrayContainsKey!0 _keys!1794 lt!20881 #b00000000000000000000000000000000) e!32055)))

(declare-fun b!49757 () Bool)

(declare-fun e!32056 () Bool)

(assert (=> b!49757 (= e!32055 e!32056)))

(declare-fun res!28789 () Bool)

(assert (=> b!49757 (=> (not res!28789) (not e!32056))))

(assert (=> b!49757 (= res!28789 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1774 _keys!1794)))))

(declare-fun b!49758 () Bool)

(assert (=> b!49758 (= e!32056 (arrayContainsKey!0 _keys!1794 lt!20881 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10001 (not res!28788)) b!49757))

(assert (= (and b!49757 res!28789) b!49758))

(declare-fun m!43193 () Bool)

(assert (=> d!10001 m!43193))

(declare-fun m!43195 () Bool)

(assert (=> b!49758 m!43195))

(assert (=> b!49721 d!10001))

(declare-fun d!10007 () Bool)

(declare-fun lt!20934 () SeekEntryResult!212)

(get-info :version)

(assert (=> d!10007 (and (or ((_ is Undefined!212) lt!20934) (not ((_ is Found!212) lt!20934)) (and (bvsge (index!2971 lt!20934) #b00000000000000000000000000000000) (bvslt (index!2971 lt!20934) (size!1774 _keys!1794)))) (or ((_ is Undefined!212) lt!20934) ((_ is Found!212) lt!20934) (not ((_ is MissingZero!212) lt!20934)) (and (bvsge (index!2970 lt!20934) #b00000000000000000000000000000000) (bvslt (index!2970 lt!20934) (size!1774 _keys!1794)))) (or ((_ is Undefined!212) lt!20934) ((_ is Found!212) lt!20934) ((_ is MissingZero!212) lt!20934) (not ((_ is MissingVacant!212) lt!20934)) (and (bvsge (index!2973 lt!20934) #b00000000000000000000000000000000) (bvslt (index!2973 lt!20934) (size!1774 _keys!1794)))) (or ((_ is Undefined!212) lt!20934) (ite ((_ is Found!212) lt!20934) (= (select (arr!1552 _keys!1794) (index!2971 lt!20934)) (select (arr!1552 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))) (ite ((_ is MissingZero!212) lt!20934) (= (select (arr!1552 _keys!1794) (index!2970 lt!20934)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!212) lt!20934) (= (select (arr!1552 _keys!1794) (index!2973 lt!20934)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!32083 () SeekEntryResult!212)

(assert (=> d!10007 (= lt!20934 e!32083)))

(declare-fun c!6723 () Bool)

(declare-fun lt!20936 () SeekEntryResult!212)

(assert (=> d!10007 (= c!6723 (and ((_ is Intermediate!212) lt!20936) (undefined!1024 lt!20936)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3239 (_ BitVec 32)) SeekEntryResult!212)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!10007 (= lt!20936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1552 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) mask!2234) (select (arr!1552 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234))))

(assert (=> d!10007 (validMask!0 mask!2234)))

(assert (=> d!10007 (= (seekEntryOrOpen!0 (select (arr!1552 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234) lt!20934)))

(declare-fun b!49795 () Bool)

(declare-fun c!6722 () Bool)

(declare-fun lt!20935 () (_ BitVec 64))

(assert (=> b!49795 (= c!6722 (= lt!20935 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32082 () SeekEntryResult!212)

(declare-fun e!32081 () SeekEntryResult!212)

(assert (=> b!49795 (= e!32082 e!32081)))

(declare-fun b!49796 () Bool)

(assert (=> b!49796 (= e!32083 Undefined!212)))

(declare-fun b!49797 () Bool)

(assert (=> b!49797 (= e!32083 e!32082)))

(assert (=> b!49797 (= lt!20935 (select (arr!1552 _keys!1794) (index!2972 lt!20936)))))

(declare-fun c!6724 () Bool)

(assert (=> b!49797 (= c!6724 (= lt!20935 (select (arr!1552 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))))))

(declare-fun b!49798 () Bool)

(assert (=> b!49798 (= e!32082 (Found!212 (index!2972 lt!20936)))))

(declare-fun b!49799 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3239 (_ BitVec 32)) SeekEntryResult!212)

(assert (=> b!49799 (= e!32081 (seekKeyOrZeroReturnVacant!0 (x!9102 lt!20936) (index!2972 lt!20936) (index!2972 lt!20936) (select (arr!1552 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) _keys!1794 mask!2234))))

(declare-fun b!49800 () Bool)

(assert (=> b!49800 (= e!32081 (MissingZero!212 (index!2972 lt!20936)))))

(assert (= (and d!10007 c!6723) b!49796))

(assert (= (and d!10007 (not c!6723)) b!49797))

(assert (= (and b!49797 c!6724) b!49798))

(assert (= (and b!49797 (not c!6724)) b!49795))

(assert (= (and b!49795 c!6722) b!49800))

(assert (= (and b!49795 (not c!6722)) b!49799))

(declare-fun m!43209 () Bool)

(assert (=> d!10007 m!43209))

(declare-fun m!43211 () Bool)

(assert (=> d!10007 m!43211))

(assert (=> d!10007 m!43115))

(declare-fun m!43213 () Bool)

(assert (=> d!10007 m!43213))

(declare-fun m!43215 () Bool)

(assert (=> d!10007 m!43215))

(assert (=> d!10007 m!43115))

(assert (=> d!10007 m!43211))

(declare-fun m!43217 () Bool)

(assert (=> d!10007 m!43217))

(assert (=> d!10007 m!43081))

(declare-fun m!43219 () Bool)

(assert (=> b!49797 m!43219))

(assert (=> b!49799 m!43115))

(declare-fun m!43221 () Bool)

(assert (=> b!49799 m!43221))

(assert (=> b!49721 d!10007))

(assert (=> d!9987 d!9985))

(declare-fun d!10019 () Bool)

(assert (=> d!10019 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836) _keys!1794 mask!2234)))

(assert (=> d!10019 true))

(declare-fun _$30!78 () Unit!1407)

(assert (=> d!10019 (= (choose!34 _keys!1794 mask!2234 (bvadd #b00000000000000000000000000000001 i!836)) _$30!78)))

(declare-fun bs!2338 () Bool)

(assert (= bs!2338 d!10019))

(assert (=> bs!2338 m!43087))

(assert (=> d!9987 d!10019))

(assert (=> d!9987 d!9967))

(declare-fun d!10021 () Bool)

(declare-fun res!28802 () Bool)

(declare-fun e!32089 () Bool)

(assert (=> d!10021 (=> res!28802 e!32089)))

(assert (=> d!10021 (= res!28802 (bvsge (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001) (size!1774 _keys!1794)))))

(assert (=> d!10021 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234) e!32089)))

(declare-fun bm!3855 () Bool)

(declare-fun call!3858 () Bool)

(assert (=> bm!3855 (= call!3858 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49807 () Bool)

(declare-fun e!32087 () Bool)

(declare-fun e!32088 () Bool)

(assert (=> b!49807 (= e!32087 e!32088)))

(declare-fun lt!20941 () (_ BitVec 64))

(assert (=> b!49807 (= lt!20941 (select (arr!1552 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001)))))

(declare-fun lt!20940 () Unit!1407)

(assert (=> b!49807 (= lt!20940 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20941 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001)))))

(assert (=> b!49807 (arrayContainsKey!0 _keys!1794 lt!20941 #b00000000000000000000000000000000)))

(declare-fun lt!20942 () Unit!1407)

(assert (=> b!49807 (= lt!20942 lt!20940)))

(declare-fun res!28803 () Bool)

(assert (=> b!49807 (= res!28803 (= (seekEntryOrOpen!0 (select (arr!1552 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001)) _keys!1794 mask!2234) (Found!212 (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001))))))

(assert (=> b!49807 (=> (not res!28803) (not e!32088))))

(declare-fun b!49808 () Bool)

(assert (=> b!49808 (= e!32089 e!32087)))

(declare-fun c!6728 () Bool)

(assert (=> b!49808 (= c!6728 (validKeyInArray!0 (select (arr!1552 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836 #b00000000000000000000000000000001))))))

(declare-fun b!49809 () Bool)

(assert (=> b!49809 (= e!32087 call!3858)))

(declare-fun b!49810 () Bool)

(assert (=> b!49810 (= e!32088 call!3858)))

(assert (= (and d!10021 (not res!28802)) b!49808))

(assert (= (and b!49808 c!6728) b!49807))

(assert (= (and b!49808 (not c!6728)) b!49809))

(assert (= (and b!49807 res!28803) b!49810))

(assert (= (or b!49810 b!49809) bm!3855))

(declare-fun m!43237 () Bool)

(assert (=> bm!3855 m!43237))

(declare-fun m!43239 () Bool)

(assert (=> b!49807 m!43239))

(declare-fun m!43241 () Bool)

(assert (=> b!49807 m!43241))

(declare-fun m!43243 () Bool)

(assert (=> b!49807 m!43243))

(assert (=> b!49807 m!43239))

(declare-fun m!43245 () Bool)

(assert (=> b!49807 m!43245))

(assert (=> b!49808 m!43239))

(assert (=> b!49808 m!43239))

(declare-fun m!43247 () Bool)

(assert (=> b!49808 m!43247))

(assert (=> bm!3845 d!10021))

(declare-fun d!10025 () Bool)

(assert (=> d!10025 (= (validKeyInArray!0 (select (arr!1552 _keys!1794) i!836)) (and (not (= (select (arr!1552 _keys!1794) i!836) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1552 _keys!1794) i!836) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!49710 d!10025))

(declare-fun d!10027 () Bool)

(assert (=> d!10027 (= (validKeyInArray!0 (select (arr!1552 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836))) (and (not (= (select (arr!1552 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1552 _keys!1794) (bvadd #b00000000000000000000000000000001 i!836)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!49722 d!10027))

(declare-fun d!10029 () Bool)

(declare-fun res!28804 () Bool)

(declare-fun e!32092 () Bool)

(assert (=> d!10029 (=> res!28804 e!32092)))

(assert (=> d!10029 (= res!28804 (bvsge (bvadd i!836 #b00000000000000000000000000000001) (size!1774 _keys!1794)))))

(assert (=> d!10029 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001) _keys!1794 mask!2234) e!32092)))

(declare-fun bm!3856 () Bool)

(declare-fun call!3859 () Bool)

(assert (=> bm!3856 (= call!3859 (arrayForallSeekEntryOrOpenFound!0 (bvadd i!836 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1794 mask!2234))))

(declare-fun b!49811 () Bool)

(declare-fun e!32090 () Bool)

(declare-fun e!32091 () Bool)

(assert (=> b!49811 (= e!32090 e!32091)))

(declare-fun lt!20944 () (_ BitVec 64))

(assert (=> b!49811 (= lt!20944 (select (arr!1552 _keys!1794) (bvadd i!836 #b00000000000000000000000000000001)))))

(declare-fun lt!20943 () Unit!1407)

(assert (=> b!49811 (= lt!20943 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20944 (bvadd i!836 #b00000000000000000000000000000001)))))

(assert (=> b!49811 (arrayContainsKey!0 _keys!1794 lt!20944 #b00000000000000000000000000000000)))

(declare-fun lt!20945 () Unit!1407)

(assert (=> b!49811 (= lt!20945 lt!20943)))

(declare-fun res!28805 () Bool)

(assert (=> b!49811 (= res!28805 (= (seekEntryOrOpen!0 (select (arr!1552 _keys!1794) (bvadd i!836 #b00000000000000000000000000000001)) _keys!1794 mask!2234) (Found!212 (bvadd i!836 #b00000000000000000000000000000001))))))

(assert (=> b!49811 (=> (not res!28805) (not e!32091))))

(declare-fun b!49812 () Bool)

(assert (=> b!49812 (= e!32092 e!32090)))

(declare-fun c!6729 () Bool)

(assert (=> b!49812 (= c!6729 (validKeyInArray!0 (select (arr!1552 _keys!1794) (bvadd i!836 #b00000000000000000000000000000001))))))

(declare-fun b!49813 () Bool)

(assert (=> b!49813 (= e!32090 call!3859)))

(declare-fun b!49814 () Bool)

(assert (=> b!49814 (= e!32091 call!3859)))

(assert (= (and d!10029 (not res!28804)) b!49812))

(assert (= (and b!49812 c!6729) b!49811))

(assert (= (and b!49812 (not c!6729)) b!49813))

(assert (= (and b!49811 res!28805) b!49814))

(assert (= (or b!49814 b!49813) bm!3856))

(declare-fun m!43249 () Bool)

(assert (=> bm!3856 m!43249))

(declare-fun m!43251 () Bool)

(assert (=> b!49811 m!43251))

(declare-fun m!43253 () Bool)

(assert (=> b!49811 m!43253))

(declare-fun m!43255 () Bool)

(assert (=> b!49811 m!43255))

(assert (=> b!49811 m!43251))

(declare-fun m!43257 () Bool)

(assert (=> b!49811 m!43257))

(assert (=> b!49812 m!43251))

(assert (=> b!49812 m!43251))

(declare-fun m!43259 () Bool)

(assert (=> b!49812 m!43259))

(assert (=> bm!3844 d!10029))

(declare-fun d!10031 () Bool)

(assert (=> d!10031 (arrayContainsKey!0 _keys!1794 lt!20872 #b00000000000000000000000000000000)))

(declare-fun lt!20946 () Unit!1407)

(assert (=> d!10031 (= lt!20946 (choose!13 _keys!1794 lt!20872 i!836))))

(assert (=> d!10031 (bvsge i!836 #b00000000000000000000000000000000)))

(assert (=> d!10031 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1794 lt!20872 i!836) lt!20946)))

(declare-fun bs!2340 () Bool)

(assert (= bs!2340 d!10031))

(assert (=> bs!2340 m!43107))

(declare-fun m!43261 () Bool)

(assert (=> bs!2340 m!43261))

(assert (=> b!49709 d!10031))

(declare-fun d!10035 () Bool)

(declare-fun res!28806 () Bool)

(declare-fun e!32093 () Bool)

(assert (=> d!10035 (=> res!28806 e!32093)))

(assert (=> d!10035 (= res!28806 (= (select (arr!1552 _keys!1794) #b00000000000000000000000000000000) lt!20872))))

(assert (=> d!10035 (= (arrayContainsKey!0 _keys!1794 lt!20872 #b00000000000000000000000000000000) e!32093)))

(declare-fun b!49815 () Bool)

(declare-fun e!32094 () Bool)

(assert (=> b!49815 (= e!32093 e!32094)))

(declare-fun res!28807 () Bool)

(assert (=> b!49815 (=> (not res!28807) (not e!32094))))

(assert (=> b!49815 (= res!28807 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1774 _keys!1794)))))

(declare-fun b!49816 () Bool)

(assert (=> b!49816 (= e!32094 (arrayContainsKey!0 _keys!1794 lt!20872 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!10035 (not res!28806)) b!49815))

(assert (= (and b!49815 res!28807) b!49816))

(assert (=> d!10035 m!43193))

(declare-fun m!43265 () Bool)

(assert (=> b!49816 m!43265))

(assert (=> b!49709 d!10035))

(declare-fun d!10039 () Bool)

(declare-fun lt!20948 () SeekEntryResult!212)

(assert (=> d!10039 (and (or ((_ is Undefined!212) lt!20948) (not ((_ is Found!212) lt!20948)) (and (bvsge (index!2971 lt!20948) #b00000000000000000000000000000000) (bvslt (index!2971 lt!20948) (size!1774 _keys!1794)))) (or ((_ is Undefined!212) lt!20948) ((_ is Found!212) lt!20948) (not ((_ is MissingZero!212) lt!20948)) (and (bvsge (index!2970 lt!20948) #b00000000000000000000000000000000) (bvslt (index!2970 lt!20948) (size!1774 _keys!1794)))) (or ((_ is Undefined!212) lt!20948) ((_ is Found!212) lt!20948) ((_ is MissingZero!212) lt!20948) (not ((_ is MissingVacant!212) lt!20948)) (and (bvsge (index!2973 lt!20948) #b00000000000000000000000000000000) (bvslt (index!2973 lt!20948) (size!1774 _keys!1794)))) (or ((_ is Undefined!212) lt!20948) (ite ((_ is Found!212) lt!20948) (= (select (arr!1552 _keys!1794) (index!2971 lt!20948)) (select (arr!1552 _keys!1794) i!836)) (ite ((_ is MissingZero!212) lt!20948) (= (select (arr!1552 _keys!1794) (index!2970 lt!20948)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!212) lt!20948) (= (select (arr!1552 _keys!1794) (index!2973 lt!20948)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!32099 () SeekEntryResult!212)

(assert (=> d!10039 (= lt!20948 e!32099)))

(declare-fun c!6731 () Bool)

(declare-fun lt!20950 () SeekEntryResult!212)

(assert (=> d!10039 (= c!6731 (and ((_ is Intermediate!212) lt!20950) (undefined!1024 lt!20950)))))

(assert (=> d!10039 (= lt!20950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1552 _keys!1794) i!836) mask!2234) (select (arr!1552 _keys!1794) i!836) _keys!1794 mask!2234))))

(assert (=> d!10039 (validMask!0 mask!2234)))

(assert (=> d!10039 (= (seekEntryOrOpen!0 (select (arr!1552 _keys!1794) i!836) _keys!1794 mask!2234) lt!20948)))

(declare-fun b!49819 () Bool)

(declare-fun c!6730 () Bool)

(declare-fun lt!20949 () (_ BitVec 64))

(assert (=> b!49819 (= c!6730 (= lt!20949 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!32098 () SeekEntryResult!212)

(declare-fun e!32097 () SeekEntryResult!212)

(assert (=> b!49819 (= e!32098 e!32097)))

(declare-fun b!49820 () Bool)

(assert (=> b!49820 (= e!32099 Undefined!212)))

(declare-fun b!49821 () Bool)

(assert (=> b!49821 (= e!32099 e!32098)))

(assert (=> b!49821 (= lt!20949 (select (arr!1552 _keys!1794) (index!2972 lt!20950)))))

(declare-fun c!6732 () Bool)

(assert (=> b!49821 (= c!6732 (= lt!20949 (select (arr!1552 _keys!1794) i!836)))))

(declare-fun b!49822 () Bool)

(assert (=> b!49822 (= e!32098 (Found!212 (index!2972 lt!20950)))))

(declare-fun b!49823 () Bool)

(assert (=> b!49823 (= e!32097 (seekKeyOrZeroReturnVacant!0 (x!9102 lt!20950) (index!2972 lt!20950) (index!2972 lt!20950) (select (arr!1552 _keys!1794) i!836) _keys!1794 mask!2234))))

(declare-fun b!49824 () Bool)

(assert (=> b!49824 (= e!32097 (MissingZero!212 (index!2972 lt!20950)))))

(assert (= (and d!10039 c!6731) b!49820))

(assert (= (and d!10039 (not c!6731)) b!49821))

(assert (= (and b!49821 c!6732) b!49822))

(assert (= (and b!49821 (not c!6732)) b!49819))

(assert (= (and b!49819 c!6730) b!49824))

(assert (= (and b!49819 (not c!6730)) b!49823))

(declare-fun m!43269 () Bool)

(assert (=> d!10039 m!43269))

(declare-fun m!43271 () Bool)

(assert (=> d!10039 m!43271))

(assert (=> d!10039 m!43103))

(declare-fun m!43273 () Bool)

(assert (=> d!10039 m!43273))

(declare-fun m!43275 () Bool)

(assert (=> d!10039 m!43275))

(assert (=> d!10039 m!43103))

(assert (=> d!10039 m!43271))

(declare-fun m!43279 () Bool)

(assert (=> d!10039 m!43279))

(assert (=> d!10039 m!43081))

(declare-fun m!43283 () Bool)

(assert (=> b!49821 m!43283))

(assert (=> b!49823 m!43103))

(declare-fun m!43287 () Bool)

(assert (=> b!49823 m!43287))

(assert (=> b!49709 d!10039))

(check-sat (not b!49816) (not b!49808) (not d!9997) (not b!49799) (not b!49812) (not d!10007) (not d!10019) (not b!49823) (not bm!3856) (not d!10039) (not b!49758) (not bm!3855) (not b!49807) (not b!49811) (not d!10031))
(check-sat)
