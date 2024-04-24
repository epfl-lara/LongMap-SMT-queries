; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44528 () Bool)

(assert start!44528)

(declare-fun b!488831 () Bool)

(declare-fun e!287531 () Bool)

(declare-fun e!287532 () Bool)

(assert (=> b!488831 (= e!287531 e!287532)))

(declare-fun res!291940 () Bool)

(assert (=> b!488831 (=> (not res!291940) (not e!287532))))

(declare-datatypes ((SeekEntryResult!3631 0))(
  ( (MissingZero!3631 (index!16703 (_ BitVec 32))) (Found!3631 (index!16704 (_ BitVec 32))) (Intermediate!3631 (undefined!4443 Bool) (index!16705 (_ BitVec 32)) (x!45963 (_ BitVec 32))) (Undefined!3631) (MissingVacant!3631 (index!16706 (_ BitVec 32))) )
))
(declare-fun lt!220578 () SeekEntryResult!3631)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!488831 (= res!291940 (or (= lt!220578 (MissingZero!3631 i!1204)) (= lt!220578 (MissingVacant!3631 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31639 0))(
  ( (array!31640 (arr!15208 (Array (_ BitVec 32) (_ BitVec 64))) (size!15572 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31639)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31639 (_ BitVec 32)) SeekEntryResult!3631)

(assert (=> b!488831 (= lt!220578 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488832 () Bool)

(declare-fun res!291933 () Bool)

(assert (=> b!488832 (=> (not res!291933) (not e!287532))))

(declare-datatypes ((List!9273 0))(
  ( (Nil!9270) (Cons!9269 (h!10128 (_ BitVec 64)) (t!15493 List!9273)) )
))
(declare-fun arrayNoDuplicates!0 (array!31639 (_ BitVec 32) List!9273) Bool)

(assert (=> b!488832 (= res!291933 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9270))))

(declare-fun b!488833 () Bool)

(declare-fun res!291937 () Bool)

(assert (=> b!488833 (=> (not res!291937) (not e!287531))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!488833 (= res!291937 (and (= (size!15572 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15572 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15572 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!291938 () Bool)

(assert (=> start!44528 (=> (not res!291938) (not e!287531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44528 (= res!291938 (validMask!0 mask!3524))))

(assert (=> start!44528 e!287531))

(assert (=> start!44528 true))

(declare-fun array_inv!11067 (array!31639) Bool)

(assert (=> start!44528 (array_inv!11067 a!3235)))

(declare-fun b!488834 () Bool)

(declare-fun res!291932 () Bool)

(assert (=> b!488834 (=> (not res!291932) (not e!287532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31639 (_ BitVec 32)) Bool)

(assert (=> b!488834 (= res!291932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488835 () Bool)

(declare-fun res!291936 () Bool)

(assert (=> b!488835 (=> (not res!291936) (not e!287531))))

(declare-fun arrayContainsKey!0 (array!31639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488835 (= res!291936 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!488836 () Bool)

(declare-fun lt!220579 () (_ BitVec 32))

(assert (=> b!488836 (= e!287532 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (and (bvsge lt!220579 #b00000000000000000000000000000000) (bvslt lt!220579 (bvadd #b00000000000000000000000000000001 mask!3524))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488836 (= lt!220579 (toIndex!0 (select (store (arr!15208 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(declare-fun e!287530 () Bool)

(assert (=> b!488836 e!287530))

(declare-fun res!291935 () Bool)

(assert (=> b!488836 (=> (not res!291935) (not e!287530))))

(assert (=> b!488836 (= res!291935 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14269 0))(
  ( (Unit!14270) )
))
(declare-fun lt!220577 () Unit!14269)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14269)

(assert (=> b!488836 (= lt!220577 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488837 () Bool)

(declare-fun res!291939 () Bool)

(assert (=> b!488837 (=> (not res!291939) (not e!287531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488837 (= res!291939 (validKeyInArray!0 k0!2280))))

(declare-fun b!488838 () Bool)

(declare-fun res!291934 () Bool)

(assert (=> b!488838 (=> (not res!291934) (not e!287531))))

(assert (=> b!488838 (= res!291934 (validKeyInArray!0 (select (arr!15208 a!3235) j!176)))))

(declare-fun b!488839 () Bool)

(assert (=> b!488839 (= e!287530 (= (seekEntryOrOpen!0 (select (arr!15208 a!3235) j!176) a!3235 mask!3524) (Found!3631 j!176)))))

(assert (= (and start!44528 res!291938) b!488833))

(assert (= (and b!488833 res!291937) b!488838))

(assert (= (and b!488838 res!291934) b!488837))

(assert (= (and b!488837 res!291939) b!488835))

(assert (= (and b!488835 res!291936) b!488831))

(assert (= (and b!488831 res!291940) b!488834))

(assert (= (and b!488834 res!291932) b!488832))

(assert (= (and b!488832 res!291933) b!488836))

(assert (= (and b!488836 res!291935) b!488839))

(declare-fun m!468811 () Bool)

(assert (=> b!488837 m!468811))

(declare-fun m!468813 () Bool)

(assert (=> b!488831 m!468813))

(declare-fun m!468815 () Bool)

(assert (=> b!488838 m!468815))

(assert (=> b!488838 m!468815))

(declare-fun m!468817 () Bool)

(assert (=> b!488838 m!468817))

(declare-fun m!468819 () Bool)

(assert (=> b!488832 m!468819))

(declare-fun m!468821 () Bool)

(assert (=> b!488834 m!468821))

(declare-fun m!468823 () Bool)

(assert (=> b!488835 m!468823))

(declare-fun m!468825 () Bool)

(assert (=> b!488836 m!468825))

(declare-fun m!468827 () Bool)

(assert (=> b!488836 m!468827))

(declare-fun m!468829 () Bool)

(assert (=> b!488836 m!468829))

(declare-fun m!468831 () Bool)

(assert (=> b!488836 m!468831))

(assert (=> b!488836 m!468829))

(declare-fun m!468833 () Bool)

(assert (=> b!488836 m!468833))

(declare-fun m!468835 () Bool)

(assert (=> start!44528 m!468835))

(declare-fun m!468837 () Bool)

(assert (=> start!44528 m!468837))

(assert (=> b!488839 m!468815))

(assert (=> b!488839 m!468815))

(declare-fun m!468839 () Bool)

(assert (=> b!488839 m!468839))

(check-sat (not b!488837) (not b!488832) (not b!488834) (not b!488831) (not b!488839) (not b!488836) (not start!44528) (not b!488835) (not b!488838))
(check-sat)
(get-model)

(declare-fun d!77895 () Bool)

(declare-fun lt!220603 () (_ BitVec 32))

(declare-fun lt!220602 () (_ BitVec 32))

(assert (=> d!77895 (= lt!220603 (bvmul (bvxor lt!220602 (bvlshr lt!220602 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!77895 (= lt!220602 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15208 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15208 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!77895 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!291995 (let ((h!10131 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15208 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15208 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!45966 (bvmul (bvxor h!10131 (bvlshr h!10131 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!45966 (bvlshr x!45966 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!291995 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!291995 #b00000000000000000000000000000000))))))

(assert (=> d!77895 (= (toIndex!0 (select (store (arr!15208 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!220603 (bvlshr lt!220603 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!488836 d!77895))

(declare-fun b!488902 () Bool)

(declare-fun e!287565 () Bool)

(declare-fun call!31335 () Bool)

(assert (=> b!488902 (= e!287565 call!31335)))

(declare-fun d!77897 () Bool)

(declare-fun res!292001 () Bool)

(declare-fun e!287563 () Bool)

(assert (=> d!77897 (=> res!292001 e!287563)))

(assert (=> d!77897 (= res!292001 (bvsge j!176 (size!15572 a!3235)))))

(assert (=> d!77897 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!287563)))

(declare-fun b!488903 () Bool)

(declare-fun e!287564 () Bool)

(assert (=> b!488903 (= e!287564 e!287565)))

(declare-fun lt!220612 () (_ BitVec 64))

(assert (=> b!488903 (= lt!220612 (select (arr!15208 a!3235) j!176))))

(declare-fun lt!220610 () Unit!14269)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31639 (_ BitVec 64) (_ BitVec 32)) Unit!14269)

(assert (=> b!488903 (= lt!220610 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220612 j!176))))

(assert (=> b!488903 (arrayContainsKey!0 a!3235 lt!220612 #b00000000000000000000000000000000)))

(declare-fun lt!220611 () Unit!14269)

(assert (=> b!488903 (= lt!220611 lt!220610)))

(declare-fun res!292000 () Bool)

(assert (=> b!488903 (= res!292000 (= (seekEntryOrOpen!0 (select (arr!15208 a!3235) j!176) a!3235 mask!3524) (Found!3631 j!176)))))

(assert (=> b!488903 (=> (not res!292000) (not e!287565))))

(declare-fun bm!31332 () Bool)

(assert (=> bm!31332 (= call!31335 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!488904 () Bool)

(assert (=> b!488904 (= e!287564 call!31335)))

(declare-fun b!488905 () Bool)

(assert (=> b!488905 (= e!287563 e!287564)))

(declare-fun c!58721 () Bool)

(assert (=> b!488905 (= c!58721 (validKeyInArray!0 (select (arr!15208 a!3235) j!176)))))

(assert (= (and d!77897 (not res!292001)) b!488905))

(assert (= (and b!488905 c!58721) b!488903))

(assert (= (and b!488905 (not c!58721)) b!488904))

(assert (= (and b!488903 res!292000) b!488902))

(assert (= (or b!488902 b!488904) bm!31332))

(assert (=> b!488903 m!468815))

(declare-fun m!468901 () Bool)

(assert (=> b!488903 m!468901))

(declare-fun m!468903 () Bool)

(assert (=> b!488903 m!468903))

(assert (=> b!488903 m!468815))

(assert (=> b!488903 m!468839))

(declare-fun m!468905 () Bool)

(assert (=> bm!31332 m!468905))

(assert (=> b!488905 m!468815))

(assert (=> b!488905 m!468815))

(assert (=> b!488905 m!468817))

(assert (=> b!488836 d!77897))

(declare-fun d!77903 () Bool)

(assert (=> d!77903 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220615 () Unit!14269)

(declare-fun choose!38 (array!31639 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14269)

(assert (=> d!77903 (= lt!220615 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77903 (validMask!0 mask!3524)))

(assert (=> d!77903 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220615)))

(declare-fun bs!15599 () Bool)

(assert (= bs!15599 d!77903))

(assert (=> bs!15599 m!468831))

(declare-fun m!468907 () Bool)

(assert (=> bs!15599 m!468907))

(assert (=> bs!15599 m!468835))

(assert (=> b!488836 d!77903))

(declare-fun b!488948 () Bool)

(declare-fun e!287590 () SeekEntryResult!3631)

(declare-fun e!287592 () SeekEntryResult!3631)

(assert (=> b!488948 (= e!287590 e!287592)))

(declare-fun lt!220647 () (_ BitVec 64))

(declare-fun lt!220646 () SeekEntryResult!3631)

(assert (=> b!488948 (= lt!220647 (select (arr!15208 a!3235) (index!16705 lt!220646)))))

(declare-fun c!58741 () Bool)

(assert (=> b!488948 (= c!58741 (= lt!220647 k0!2280))))

(declare-fun d!77907 () Bool)

(declare-fun lt!220648 () SeekEntryResult!3631)

(get-info :version)

(assert (=> d!77907 (and (or ((_ is Undefined!3631) lt!220648) (not ((_ is Found!3631) lt!220648)) (and (bvsge (index!16704 lt!220648) #b00000000000000000000000000000000) (bvslt (index!16704 lt!220648) (size!15572 a!3235)))) (or ((_ is Undefined!3631) lt!220648) ((_ is Found!3631) lt!220648) (not ((_ is MissingZero!3631) lt!220648)) (and (bvsge (index!16703 lt!220648) #b00000000000000000000000000000000) (bvslt (index!16703 lt!220648) (size!15572 a!3235)))) (or ((_ is Undefined!3631) lt!220648) ((_ is Found!3631) lt!220648) ((_ is MissingZero!3631) lt!220648) (not ((_ is MissingVacant!3631) lt!220648)) (and (bvsge (index!16706 lt!220648) #b00000000000000000000000000000000) (bvslt (index!16706 lt!220648) (size!15572 a!3235)))) (or ((_ is Undefined!3631) lt!220648) (ite ((_ is Found!3631) lt!220648) (= (select (arr!15208 a!3235) (index!16704 lt!220648)) k0!2280) (ite ((_ is MissingZero!3631) lt!220648) (= (select (arr!15208 a!3235) (index!16703 lt!220648)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3631) lt!220648) (= (select (arr!15208 a!3235) (index!16706 lt!220648)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77907 (= lt!220648 e!287590)))

(declare-fun c!58742 () Bool)

(assert (=> d!77907 (= c!58742 (and ((_ is Intermediate!3631) lt!220646) (undefined!4443 lt!220646)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31639 (_ BitVec 32)) SeekEntryResult!3631)

(assert (=> d!77907 (= lt!220646 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77907 (validMask!0 mask!3524)))

(assert (=> d!77907 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!220648)))

(declare-fun b!488949 () Bool)

(assert (=> b!488949 (= e!287590 Undefined!3631)))

(declare-fun b!488950 () Bool)

(assert (=> b!488950 (= e!287592 (Found!3631 (index!16705 lt!220646)))))

(declare-fun b!488951 () Bool)

(declare-fun e!287591 () SeekEntryResult!3631)

(assert (=> b!488951 (= e!287591 (MissingZero!3631 (index!16705 lt!220646)))))

(declare-fun b!488952 () Bool)

(declare-fun c!58740 () Bool)

(assert (=> b!488952 (= c!58740 (= lt!220647 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!488952 (= e!287592 e!287591)))

(declare-fun b!488953 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31639 (_ BitVec 32)) SeekEntryResult!3631)

(assert (=> b!488953 (= e!287591 (seekKeyOrZeroReturnVacant!0 (x!45963 lt!220646) (index!16705 lt!220646) (index!16705 lt!220646) k0!2280 a!3235 mask!3524))))

(assert (= (and d!77907 c!58742) b!488949))

(assert (= (and d!77907 (not c!58742)) b!488948))

(assert (= (and b!488948 c!58741) b!488950))

(assert (= (and b!488948 (not c!58741)) b!488952))

(assert (= (and b!488952 c!58740) b!488951))

(assert (= (and b!488952 (not c!58740)) b!488953))

(declare-fun m!468935 () Bool)

(assert (=> b!488948 m!468935))

(declare-fun m!468937 () Bool)

(assert (=> d!77907 m!468937))

(declare-fun m!468939 () Bool)

(assert (=> d!77907 m!468939))

(declare-fun m!468941 () Bool)

(assert (=> d!77907 m!468941))

(assert (=> d!77907 m!468835))

(declare-fun m!468943 () Bool)

(assert (=> d!77907 m!468943))

(assert (=> d!77907 m!468939))

(declare-fun m!468945 () Bool)

(assert (=> d!77907 m!468945))

(declare-fun m!468947 () Bool)

(assert (=> b!488953 m!468947))

(assert (=> b!488831 d!77907))

(declare-fun d!77921 () Bool)

(assert (=> d!77921 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488837 d!77921))

(declare-fun d!77923 () Bool)

(declare-fun res!292014 () Bool)

(declare-fun e!287597 () Bool)

(assert (=> d!77923 (=> res!292014 e!287597)))

(assert (=> d!77923 (= res!292014 (= (select (arr!15208 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77923 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!287597)))

(declare-fun b!488958 () Bool)

(declare-fun e!287598 () Bool)

(assert (=> b!488958 (= e!287597 e!287598)))

(declare-fun res!292015 () Bool)

(assert (=> b!488958 (=> (not res!292015) (not e!287598))))

(assert (=> b!488958 (= res!292015 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15572 a!3235)))))

(declare-fun b!488959 () Bool)

(assert (=> b!488959 (= e!287598 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77923 (not res!292014)) b!488958))

(assert (= (and b!488958 res!292015) b!488959))

(declare-fun m!468949 () Bool)

(assert (=> d!77923 m!468949))

(declare-fun m!468951 () Bool)

(assert (=> b!488959 m!468951))

(assert (=> b!488835 d!77923))

(declare-fun d!77925 () Bool)

(assert (=> d!77925 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44528 d!77925))

(declare-fun d!77937 () Bool)

(assert (=> d!77937 (= (array_inv!11067 a!3235) (bvsge (size!15572 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44528 d!77937))

(declare-fun b!488982 () Bool)

(declare-fun e!287614 () SeekEntryResult!3631)

(declare-fun e!287616 () SeekEntryResult!3631)

(assert (=> b!488982 (= e!287614 e!287616)))

(declare-fun lt!220677 () (_ BitVec 64))

(declare-fun lt!220676 () SeekEntryResult!3631)

(assert (=> b!488982 (= lt!220677 (select (arr!15208 a!3235) (index!16705 lt!220676)))))

(declare-fun c!58751 () Bool)

(assert (=> b!488982 (= c!58751 (= lt!220677 (select (arr!15208 a!3235) j!176)))))

(declare-fun d!77943 () Bool)

(declare-fun lt!220678 () SeekEntryResult!3631)

(assert (=> d!77943 (and (or ((_ is Undefined!3631) lt!220678) (not ((_ is Found!3631) lt!220678)) (and (bvsge (index!16704 lt!220678) #b00000000000000000000000000000000) (bvslt (index!16704 lt!220678) (size!15572 a!3235)))) (or ((_ is Undefined!3631) lt!220678) ((_ is Found!3631) lt!220678) (not ((_ is MissingZero!3631) lt!220678)) (and (bvsge (index!16703 lt!220678) #b00000000000000000000000000000000) (bvslt (index!16703 lt!220678) (size!15572 a!3235)))) (or ((_ is Undefined!3631) lt!220678) ((_ is Found!3631) lt!220678) ((_ is MissingZero!3631) lt!220678) (not ((_ is MissingVacant!3631) lt!220678)) (and (bvsge (index!16706 lt!220678) #b00000000000000000000000000000000) (bvslt (index!16706 lt!220678) (size!15572 a!3235)))) (or ((_ is Undefined!3631) lt!220678) (ite ((_ is Found!3631) lt!220678) (= (select (arr!15208 a!3235) (index!16704 lt!220678)) (select (arr!15208 a!3235) j!176)) (ite ((_ is MissingZero!3631) lt!220678) (= (select (arr!15208 a!3235) (index!16703 lt!220678)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3631) lt!220678) (= (select (arr!15208 a!3235) (index!16706 lt!220678)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77943 (= lt!220678 e!287614)))

(declare-fun c!58752 () Bool)

(assert (=> d!77943 (= c!58752 (and ((_ is Intermediate!3631) lt!220676) (undefined!4443 lt!220676)))))

(assert (=> d!77943 (= lt!220676 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15208 a!3235) j!176) mask!3524) (select (arr!15208 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77943 (validMask!0 mask!3524)))

(assert (=> d!77943 (= (seekEntryOrOpen!0 (select (arr!15208 a!3235) j!176) a!3235 mask!3524) lt!220678)))

(declare-fun b!488983 () Bool)

(assert (=> b!488983 (= e!287614 Undefined!3631)))

(declare-fun b!488984 () Bool)

(assert (=> b!488984 (= e!287616 (Found!3631 (index!16705 lt!220676)))))

(declare-fun b!488985 () Bool)

(declare-fun e!287615 () SeekEntryResult!3631)

(assert (=> b!488985 (= e!287615 (MissingZero!3631 (index!16705 lt!220676)))))

(declare-fun b!488986 () Bool)

(declare-fun c!58750 () Bool)

(assert (=> b!488986 (= c!58750 (= lt!220677 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!488986 (= e!287616 e!287615)))

(declare-fun b!488987 () Bool)

(assert (=> b!488987 (= e!287615 (seekKeyOrZeroReturnVacant!0 (x!45963 lt!220676) (index!16705 lt!220676) (index!16705 lt!220676) (select (arr!15208 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!77943 c!58752) b!488983))

(assert (= (and d!77943 (not c!58752)) b!488982))

(assert (= (and b!488982 c!58751) b!488984))

(assert (= (and b!488982 (not c!58751)) b!488986))

(assert (= (and b!488986 c!58750) b!488985))

(assert (= (and b!488986 (not c!58750)) b!488987))

(declare-fun m!468983 () Bool)

(assert (=> b!488982 m!468983))

(declare-fun m!468985 () Bool)

(assert (=> d!77943 m!468985))

(declare-fun m!468987 () Bool)

(assert (=> d!77943 m!468987))

(assert (=> d!77943 m!468815))

(declare-fun m!468989 () Bool)

(assert (=> d!77943 m!468989))

(assert (=> d!77943 m!468835))

(declare-fun m!468991 () Bool)

(assert (=> d!77943 m!468991))

(assert (=> d!77943 m!468815))

(assert (=> d!77943 m!468987))

(declare-fun m!468993 () Bool)

(assert (=> d!77943 m!468993))

(assert (=> b!488987 m!468815))

(declare-fun m!468995 () Bool)

(assert (=> b!488987 m!468995))

(assert (=> b!488839 d!77943))

(declare-fun b!488988 () Bool)

(declare-fun e!287619 () Bool)

(declare-fun call!31343 () Bool)

(assert (=> b!488988 (= e!287619 call!31343)))

(declare-fun d!77945 () Bool)

(declare-fun res!292025 () Bool)

(declare-fun e!287617 () Bool)

(assert (=> d!77945 (=> res!292025 e!287617)))

(assert (=> d!77945 (= res!292025 (bvsge #b00000000000000000000000000000000 (size!15572 a!3235)))))

(assert (=> d!77945 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!287617)))

(declare-fun b!488989 () Bool)

(declare-fun e!287618 () Bool)

(assert (=> b!488989 (= e!287618 e!287619)))

(declare-fun lt!220681 () (_ BitVec 64))

(assert (=> b!488989 (= lt!220681 (select (arr!15208 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220679 () Unit!14269)

(assert (=> b!488989 (= lt!220679 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220681 #b00000000000000000000000000000000))))

(assert (=> b!488989 (arrayContainsKey!0 a!3235 lt!220681 #b00000000000000000000000000000000)))

(declare-fun lt!220680 () Unit!14269)

(assert (=> b!488989 (= lt!220680 lt!220679)))

(declare-fun res!292024 () Bool)

(assert (=> b!488989 (= res!292024 (= (seekEntryOrOpen!0 (select (arr!15208 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3631 #b00000000000000000000000000000000)))))

(assert (=> b!488989 (=> (not res!292024) (not e!287619))))

(declare-fun bm!31340 () Bool)

(assert (=> bm!31340 (= call!31343 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!488990 () Bool)

(assert (=> b!488990 (= e!287618 call!31343)))

(declare-fun b!488991 () Bool)

(assert (=> b!488991 (= e!287617 e!287618)))

(declare-fun c!58753 () Bool)

(assert (=> b!488991 (= c!58753 (validKeyInArray!0 (select (arr!15208 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!77945 (not res!292025)) b!488991))

(assert (= (and b!488991 c!58753) b!488989))

(assert (= (and b!488991 (not c!58753)) b!488990))

(assert (= (and b!488989 res!292024) b!488988))

(assert (= (or b!488988 b!488990) bm!31340))

(assert (=> b!488989 m!468949))

(declare-fun m!468997 () Bool)

(assert (=> b!488989 m!468997))

(declare-fun m!468999 () Bool)

(assert (=> b!488989 m!468999))

(assert (=> b!488989 m!468949))

(declare-fun m!469001 () Bool)

(assert (=> b!488989 m!469001))

(declare-fun m!469003 () Bool)

(assert (=> bm!31340 m!469003))

(assert (=> b!488991 m!468949))

(assert (=> b!488991 m!468949))

(declare-fun m!469005 () Bool)

(assert (=> b!488991 m!469005))

(assert (=> b!488834 d!77945))

(declare-fun b!489002 () Bool)

(declare-fun e!287629 () Bool)

(declare-fun call!31346 () Bool)

(assert (=> b!489002 (= e!287629 call!31346)))

(declare-fun b!489003 () Bool)

(declare-fun e!287630 () Bool)

(assert (=> b!489003 (= e!287630 e!287629)))

(declare-fun c!58756 () Bool)

(assert (=> b!489003 (= c!58756 (validKeyInArray!0 (select (arr!15208 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!489005 () Bool)

(declare-fun e!287628 () Bool)

(assert (=> b!489005 (= e!287628 e!287630)))

(declare-fun res!292032 () Bool)

(assert (=> b!489005 (=> (not res!292032) (not e!287630))))

(declare-fun e!287631 () Bool)

(assert (=> b!489005 (= res!292032 (not e!287631))))

(declare-fun res!292034 () Bool)

(assert (=> b!489005 (=> (not res!292034) (not e!287631))))

(assert (=> b!489005 (= res!292034 (validKeyInArray!0 (select (arr!15208 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31343 () Bool)

(assert (=> bm!31343 (= call!31346 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58756 (Cons!9269 (select (arr!15208 a!3235) #b00000000000000000000000000000000) Nil!9270) Nil!9270)))))

(declare-fun b!489006 () Bool)

(assert (=> b!489006 (= e!287629 call!31346)))

(declare-fun b!489004 () Bool)

(declare-fun contains!2683 (List!9273 (_ BitVec 64)) Bool)

(assert (=> b!489004 (= e!287631 (contains!2683 Nil!9270 (select (arr!15208 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77947 () Bool)

(declare-fun res!292033 () Bool)

(assert (=> d!77947 (=> res!292033 e!287628)))

(assert (=> d!77947 (= res!292033 (bvsge #b00000000000000000000000000000000 (size!15572 a!3235)))))

(assert (=> d!77947 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9270) e!287628)))

(assert (= (and d!77947 (not res!292033)) b!489005))

(assert (= (and b!489005 res!292034) b!489004))

(assert (= (and b!489005 res!292032) b!489003))

(assert (= (and b!489003 c!58756) b!489006))

(assert (= (and b!489003 (not c!58756)) b!489002))

(assert (= (or b!489006 b!489002) bm!31343))

(assert (=> b!489003 m!468949))

(assert (=> b!489003 m!468949))

(assert (=> b!489003 m!469005))

(assert (=> b!489005 m!468949))

(assert (=> b!489005 m!468949))

(assert (=> b!489005 m!469005))

(assert (=> bm!31343 m!468949))

(declare-fun m!469007 () Bool)

(assert (=> bm!31343 m!469007))

(assert (=> b!489004 m!468949))

(assert (=> b!489004 m!468949))

(declare-fun m!469009 () Bool)

(assert (=> b!489004 m!469009))

(assert (=> b!488832 d!77947))

(declare-fun d!77949 () Bool)

(assert (=> d!77949 (= (validKeyInArray!0 (select (arr!15208 a!3235) j!176)) (and (not (= (select (arr!15208 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15208 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!488838 d!77949))

(check-sat (not b!489005) (not b!488987) (not bm!31340) (not d!77907) (not d!77943) (not b!489004) (not b!488991) (not b!488959) (not bm!31332) (not d!77903) (not bm!31343) (not b!489003) (not b!488905) (not b!488903) (not b!488953) (not b!488989))
(check-sat)
