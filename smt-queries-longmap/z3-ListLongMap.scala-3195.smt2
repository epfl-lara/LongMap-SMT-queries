; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44786 () Bool)

(assert start!44786)

(declare-fun b!491806 () Bool)

(declare-fun res!294798 () Bool)

(declare-fun e!288919 () Bool)

(assert (=> b!491806 (=> (not res!294798) (not e!288919))))

(declare-datatypes ((array!31846 0))(
  ( (array!31847 (arr!15310 (Array (_ BitVec 32) (_ BitVec 64))) (size!15674 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31846)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491806 (= res!294798 (validKeyInArray!0 (select (arr!15310 a!3235) j!176)))))

(declare-fun b!491807 () Bool)

(declare-fun res!294805 () Bool)

(assert (=> b!491807 (=> (not res!294805) (not e!288919))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491807 (= res!294805 (and (= (size!15674 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15674 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15674 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!294801 () Bool)

(assert (=> start!44786 (=> (not res!294801) (not e!288919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44786 (= res!294801 (validMask!0 mask!3524))))

(assert (=> start!44786 e!288919))

(assert (=> start!44786 true))

(declare-fun array_inv!11169 (array!31846) Bool)

(assert (=> start!44786 (array_inv!11169 a!3235)))

(declare-fun b!491808 () Bool)

(declare-fun e!288921 () Bool)

(assert (=> b!491808 (= e!288921 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(declare-fun b!491809 () Bool)

(declare-fun e!288918 () Bool)

(assert (=> b!491809 (= e!288918 (not e!288921))))

(declare-fun res!294804 () Bool)

(assert (=> b!491809 (=> res!294804 e!288921)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3733 0))(
  ( (MissingZero!3733 (index!17111 (_ BitVec 32))) (Found!3733 (index!17112 (_ BitVec 32))) (Intermediate!3733 (undefined!4545 Bool) (index!17113 (_ BitVec 32)) (x!46340 (_ BitVec 32))) (Undefined!3733) (MissingVacant!3733 (index!17114 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31846 (_ BitVec 32)) SeekEntryResult!3733)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491809 (= res!294804 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15310 a!3235) j!176) mask!3524) (select (arr!15310 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176) (array!31847 (store (arr!15310 a!3235) i!1204 k0!2280) (size!15674 a!3235)) mask!3524)))))

(declare-fun e!288917 () Bool)

(assert (=> b!491809 e!288917))

(declare-fun res!294797 () Bool)

(assert (=> b!491809 (=> (not res!294797) (not e!288917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31846 (_ BitVec 32)) Bool)

(assert (=> b!491809 (= res!294797 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14473 0))(
  ( (Unit!14474) )
))
(declare-fun lt!222393 () Unit!14473)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14473)

(assert (=> b!491809 (= lt!222393 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491810 () Bool)

(declare-fun res!294802 () Bool)

(assert (=> b!491810 (=> (not res!294802) (not e!288918))))

(declare-datatypes ((List!9375 0))(
  ( (Nil!9372) (Cons!9371 (h!10233 (_ BitVec 64)) (t!15595 List!9375)) )
))
(declare-fun arrayNoDuplicates!0 (array!31846 (_ BitVec 32) List!9375) Bool)

(assert (=> b!491810 (= res!294802 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9372))))

(declare-fun b!491811 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31846 (_ BitVec 32)) SeekEntryResult!3733)

(assert (=> b!491811 (= e!288917 (= (seekEntryOrOpen!0 (select (arr!15310 a!3235) j!176) a!3235 mask!3524) (Found!3733 j!176)))))

(declare-fun b!491812 () Bool)

(assert (=> b!491812 (= e!288919 e!288918)))

(declare-fun res!294799 () Bool)

(assert (=> b!491812 (=> (not res!294799) (not e!288918))))

(declare-fun lt!222394 () SeekEntryResult!3733)

(assert (=> b!491812 (= res!294799 (or (= lt!222394 (MissingZero!3733 i!1204)) (= lt!222394 (MissingVacant!3733 i!1204))))))

(assert (=> b!491812 (= lt!222394 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491813 () Bool)

(declare-fun res!294796 () Bool)

(assert (=> b!491813 (=> (not res!294796) (not e!288919))))

(declare-fun arrayContainsKey!0 (array!31846 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491813 (= res!294796 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491814 () Bool)

(declare-fun res!294803 () Bool)

(assert (=> b!491814 (=> (not res!294803) (not e!288918))))

(assert (=> b!491814 (= res!294803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491815 () Bool)

(declare-fun res!294800 () Bool)

(assert (=> b!491815 (=> (not res!294800) (not e!288919))))

(assert (=> b!491815 (= res!294800 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44786 res!294801) b!491807))

(assert (= (and b!491807 res!294805) b!491806))

(assert (= (and b!491806 res!294798) b!491815))

(assert (= (and b!491815 res!294800) b!491813))

(assert (= (and b!491813 res!294796) b!491812))

(assert (= (and b!491812 res!294799) b!491814))

(assert (= (and b!491814 res!294803) b!491810))

(assert (= (and b!491810 res!294802) b!491809))

(assert (= (and b!491809 res!294797) b!491811))

(assert (= (and b!491809 (not res!294804)) b!491808))

(declare-fun m!472801 () Bool)

(assert (=> b!491811 m!472801))

(assert (=> b!491811 m!472801))

(declare-fun m!472803 () Bool)

(assert (=> b!491811 m!472803))

(assert (=> b!491806 m!472801))

(assert (=> b!491806 m!472801))

(declare-fun m!472805 () Bool)

(assert (=> b!491806 m!472805))

(declare-fun m!472807 () Bool)

(assert (=> b!491815 m!472807))

(declare-fun m!472809 () Bool)

(assert (=> b!491809 m!472809))

(declare-fun m!472811 () Bool)

(assert (=> b!491809 m!472811))

(declare-fun m!472813 () Bool)

(assert (=> b!491809 m!472813))

(declare-fun m!472815 () Bool)

(assert (=> b!491809 m!472815))

(assert (=> b!491809 m!472801))

(declare-fun m!472817 () Bool)

(assert (=> b!491809 m!472817))

(assert (=> b!491809 m!472801))

(assert (=> b!491809 m!472815))

(declare-fun m!472819 () Bool)

(assert (=> b!491809 m!472819))

(assert (=> b!491809 m!472813))

(declare-fun m!472821 () Bool)

(assert (=> b!491809 m!472821))

(assert (=> b!491809 m!472801))

(declare-fun m!472823 () Bool)

(assert (=> b!491809 m!472823))

(assert (=> b!491809 m!472813))

(assert (=> b!491809 m!472819))

(declare-fun m!472825 () Bool)

(assert (=> b!491813 m!472825))

(declare-fun m!472827 () Bool)

(assert (=> start!44786 m!472827))

(declare-fun m!472829 () Bool)

(assert (=> start!44786 m!472829))

(declare-fun m!472831 () Bool)

(assert (=> b!491810 m!472831))

(declare-fun m!472833 () Bool)

(assert (=> b!491812 m!472833))

(declare-fun m!472835 () Bool)

(assert (=> b!491814 m!472835))

(check-sat (not start!44786) (not b!491813) (not b!491806) (not b!491812) (not b!491811) (not b!491809) (not b!491814) (not b!491810) (not b!491815))
(check-sat)
(get-model)

(declare-fun b!491888 () Bool)

(declare-fun e!288958 () SeekEntryResult!3733)

(declare-fun lt!222413 () SeekEntryResult!3733)

(assert (=> b!491888 (= e!288958 (Found!3733 (index!17113 lt!222413)))))

(declare-fun b!491889 () Bool)

(declare-fun e!288959 () SeekEntryResult!3733)

(assert (=> b!491889 (= e!288959 Undefined!3733)))

(declare-fun b!491890 () Bool)

(declare-fun e!288960 () SeekEntryResult!3733)

(assert (=> b!491890 (= e!288960 (MissingZero!3733 (index!17113 lt!222413)))))

(declare-fun b!491892 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31846 (_ BitVec 32)) SeekEntryResult!3733)

(assert (=> b!491892 (= e!288960 (seekKeyOrZeroReturnVacant!0 (x!46340 lt!222413) (index!17113 lt!222413) (index!17113 lt!222413) k0!2280 a!3235 mask!3524))))

(declare-fun b!491893 () Bool)

(assert (=> b!491893 (= e!288959 e!288958)))

(declare-fun lt!222415 () (_ BitVec 64))

(assert (=> b!491893 (= lt!222415 (select (arr!15310 a!3235) (index!17113 lt!222413)))))

(declare-fun c!58783 () Bool)

(assert (=> b!491893 (= c!58783 (= lt!222415 k0!2280))))

(declare-fun b!491891 () Bool)

(declare-fun c!58784 () Bool)

(assert (=> b!491891 (= c!58784 (= lt!222415 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!491891 (= e!288958 e!288960)))

(declare-fun d!78035 () Bool)

(declare-fun lt!222414 () SeekEntryResult!3733)

(get-info :version)

(assert (=> d!78035 (and (or ((_ is Undefined!3733) lt!222414) (not ((_ is Found!3733) lt!222414)) (and (bvsge (index!17112 lt!222414) #b00000000000000000000000000000000) (bvslt (index!17112 lt!222414) (size!15674 a!3235)))) (or ((_ is Undefined!3733) lt!222414) ((_ is Found!3733) lt!222414) (not ((_ is MissingZero!3733) lt!222414)) (and (bvsge (index!17111 lt!222414) #b00000000000000000000000000000000) (bvslt (index!17111 lt!222414) (size!15674 a!3235)))) (or ((_ is Undefined!3733) lt!222414) ((_ is Found!3733) lt!222414) ((_ is MissingZero!3733) lt!222414) (not ((_ is MissingVacant!3733) lt!222414)) (and (bvsge (index!17114 lt!222414) #b00000000000000000000000000000000) (bvslt (index!17114 lt!222414) (size!15674 a!3235)))) (or ((_ is Undefined!3733) lt!222414) (ite ((_ is Found!3733) lt!222414) (= (select (arr!15310 a!3235) (index!17112 lt!222414)) k0!2280) (ite ((_ is MissingZero!3733) lt!222414) (= (select (arr!15310 a!3235) (index!17111 lt!222414)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3733) lt!222414) (= (select (arr!15310 a!3235) (index!17114 lt!222414)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78035 (= lt!222414 e!288959)))

(declare-fun c!58782 () Bool)

(assert (=> d!78035 (= c!58782 (and ((_ is Intermediate!3733) lt!222413) (undefined!4545 lt!222413)))))

(assert (=> d!78035 (= lt!222413 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78035 (validMask!0 mask!3524)))

(assert (=> d!78035 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!222414)))

(assert (= (and d!78035 c!58782) b!491889))

(assert (= (and d!78035 (not c!58782)) b!491893))

(assert (= (and b!491893 c!58783) b!491888))

(assert (= (and b!491893 (not c!58783)) b!491891))

(assert (= (and b!491891 c!58784) b!491890))

(assert (= (and b!491891 (not c!58784)) b!491892))

(declare-fun m!472909 () Bool)

(assert (=> b!491892 m!472909))

(declare-fun m!472911 () Bool)

(assert (=> b!491893 m!472911))

(declare-fun m!472913 () Bool)

(assert (=> d!78035 m!472913))

(assert (=> d!78035 m!472827))

(declare-fun m!472915 () Bool)

(assert (=> d!78035 m!472915))

(declare-fun m!472917 () Bool)

(assert (=> d!78035 m!472917))

(declare-fun m!472919 () Bool)

(assert (=> d!78035 m!472919))

(declare-fun m!472921 () Bool)

(assert (=> d!78035 m!472921))

(assert (=> d!78035 m!472919))

(assert (=> b!491812 d!78035))

(declare-fun d!78037 () Bool)

(declare-fun res!294870 () Bool)

(declare-fun e!288965 () Bool)

(assert (=> d!78037 (=> res!294870 e!288965)))

(assert (=> d!78037 (= res!294870 (= (select (arr!15310 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78037 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!288965)))

(declare-fun b!491898 () Bool)

(declare-fun e!288966 () Bool)

(assert (=> b!491898 (= e!288965 e!288966)))

(declare-fun res!294871 () Bool)

(assert (=> b!491898 (=> (not res!294871) (not e!288966))))

(assert (=> b!491898 (= res!294871 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15674 a!3235)))))

(declare-fun b!491899 () Bool)

(assert (=> b!491899 (= e!288966 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78037 (not res!294870)) b!491898))

(assert (= (and b!491898 res!294871) b!491899))

(declare-fun m!472923 () Bool)

(assert (=> d!78037 m!472923))

(declare-fun m!472925 () Bool)

(assert (=> b!491899 m!472925))

(assert (=> b!491813 d!78037))

(declare-fun b!491923 () Bool)

(declare-fun e!288986 () Bool)

(declare-fun e!288985 () Bool)

(assert (=> b!491923 (= e!288986 e!288985)))

(declare-fun c!58790 () Bool)

(assert (=> b!491923 (= c!58790 (validKeyInArray!0 (select (arr!15310 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78039 () Bool)

(declare-fun res!294886 () Bool)

(assert (=> d!78039 (=> res!294886 e!288986)))

(assert (=> d!78039 (= res!294886 (bvsge #b00000000000000000000000000000000 (size!15674 a!3235)))))

(assert (=> d!78039 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!288986)))

(declare-fun b!491924 () Bool)

(declare-fun call!31359 () Bool)

(assert (=> b!491924 (= e!288985 call!31359)))

(declare-fun bm!31356 () Bool)

(assert (=> bm!31356 (= call!31359 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!491925 () Bool)

(declare-fun e!288987 () Bool)

(assert (=> b!491925 (= e!288987 call!31359)))

(declare-fun b!491926 () Bool)

(assert (=> b!491926 (= e!288985 e!288987)))

(declare-fun lt!222422 () (_ BitVec 64))

(assert (=> b!491926 (= lt!222422 (select (arr!15310 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!222424 () Unit!14473)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31846 (_ BitVec 64) (_ BitVec 32)) Unit!14473)

(assert (=> b!491926 (= lt!222424 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222422 #b00000000000000000000000000000000))))

(assert (=> b!491926 (arrayContainsKey!0 a!3235 lt!222422 #b00000000000000000000000000000000)))

(declare-fun lt!222423 () Unit!14473)

(assert (=> b!491926 (= lt!222423 lt!222424)))

(declare-fun res!294885 () Bool)

(assert (=> b!491926 (= res!294885 (= (seekEntryOrOpen!0 (select (arr!15310 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3733 #b00000000000000000000000000000000)))))

(assert (=> b!491926 (=> (not res!294885) (not e!288987))))

(assert (= (and d!78039 (not res!294886)) b!491923))

(assert (= (and b!491923 c!58790) b!491926))

(assert (= (and b!491923 (not c!58790)) b!491924))

(assert (= (and b!491926 res!294885) b!491925))

(assert (= (or b!491925 b!491924) bm!31356))

(assert (=> b!491923 m!472923))

(assert (=> b!491923 m!472923))

(declare-fun m!472935 () Bool)

(assert (=> b!491923 m!472935))

(declare-fun m!472937 () Bool)

(assert (=> bm!31356 m!472937))

(assert (=> b!491926 m!472923))

(declare-fun m!472939 () Bool)

(assert (=> b!491926 m!472939))

(declare-fun m!472941 () Bool)

(assert (=> b!491926 m!472941))

(assert (=> b!491926 m!472923))

(declare-fun m!472943 () Bool)

(assert (=> b!491926 m!472943))

(assert (=> b!491814 d!78039))

(declare-fun d!78047 () Bool)

(assert (=> d!78047 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44786 d!78047))

(declare-fun d!78051 () Bool)

(assert (=> d!78051 (= (array_inv!11169 a!3235) (bvsge (size!15674 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44786 d!78051))

(declare-fun d!78053 () Bool)

(declare-fun e!289023 () Bool)

(assert (=> d!78053 e!289023))

(declare-fun c!58812 () Bool)

(declare-fun lt!222444 () SeekEntryResult!3733)

(assert (=> d!78053 (= c!58812 (and ((_ is Intermediate!3733) lt!222444) (undefined!4545 lt!222444)))))

(declare-fun e!289019 () SeekEntryResult!3733)

(assert (=> d!78053 (= lt!222444 e!289019)))

(declare-fun c!58814 () Bool)

(assert (=> d!78053 (= c!58814 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!222445 () (_ BitVec 64))

(assert (=> d!78053 (= lt!222445 (select (arr!15310 a!3235) (toIndex!0 (select (arr!15310 a!3235) j!176) mask!3524)))))

(assert (=> d!78053 (validMask!0 mask!3524)))

(assert (=> d!78053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15310 a!3235) j!176) mask!3524) (select (arr!15310 a!3235) j!176) a!3235 mask!3524) lt!222444)))

(declare-fun e!289022 () SeekEntryResult!3733)

(declare-fun b!491981 () Bool)

(assert (=> b!491981 (= e!289022 (Intermediate!3733 false (toIndex!0 (select (arr!15310 a!3235) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!491982 () Bool)

(assert (=> b!491982 (and (bvsge (index!17113 lt!222444) #b00000000000000000000000000000000) (bvslt (index!17113 lt!222444) (size!15674 a!3235)))))

(declare-fun res!294900 () Bool)

(assert (=> b!491982 (= res!294900 (= (select (arr!15310 a!3235) (index!17113 lt!222444)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!289020 () Bool)

(assert (=> b!491982 (=> res!294900 e!289020)))

(declare-fun b!491983 () Bool)

(assert (=> b!491983 (= e!289023 (bvsge (x!46340 lt!222444) #b01111111111111111111111111111110))))

(declare-fun b!491984 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491984 (= e!289022 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!15310 a!3235) j!176) mask!3524) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15310 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!491985 () Bool)

(declare-fun e!289021 () Bool)

(assert (=> b!491985 (= e!289023 e!289021)))

(declare-fun res!294901 () Bool)

(assert (=> b!491985 (= res!294901 (and ((_ is Intermediate!3733) lt!222444) (not (undefined!4545 lt!222444)) (bvslt (x!46340 lt!222444) #b01111111111111111111111111111110) (bvsge (x!46340 lt!222444) #b00000000000000000000000000000000) (bvsge (x!46340 lt!222444) #b00000000000000000000000000000000)))))

(assert (=> b!491985 (=> (not res!294901) (not e!289021))))

(declare-fun b!491986 () Bool)

(assert (=> b!491986 (= e!289019 (Intermediate!3733 true (toIndex!0 (select (arr!15310 a!3235) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!491987 () Bool)

(assert (=> b!491987 (and (bvsge (index!17113 lt!222444) #b00000000000000000000000000000000) (bvslt (index!17113 lt!222444) (size!15674 a!3235)))))

(assert (=> b!491987 (= e!289020 (= (select (arr!15310 a!3235) (index!17113 lt!222444)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!491988 () Bool)

(assert (=> b!491988 (and (bvsge (index!17113 lt!222444) #b00000000000000000000000000000000) (bvslt (index!17113 lt!222444) (size!15674 a!3235)))))

(declare-fun res!294899 () Bool)

(assert (=> b!491988 (= res!294899 (= (select (arr!15310 a!3235) (index!17113 lt!222444)) (select (arr!15310 a!3235) j!176)))))

(assert (=> b!491988 (=> res!294899 e!289020)))

(assert (=> b!491988 (= e!289021 e!289020)))

(declare-fun b!491989 () Bool)

(assert (=> b!491989 (= e!289019 e!289022)))

(declare-fun c!58813 () Bool)

(assert (=> b!491989 (= c!58813 (or (= lt!222445 (select (arr!15310 a!3235) j!176)) (= (bvadd lt!222445 lt!222445) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!78053 c!58814) b!491986))

(assert (= (and d!78053 (not c!58814)) b!491989))

(assert (= (and b!491989 c!58813) b!491981))

(assert (= (and b!491989 (not c!58813)) b!491984))

(assert (= (and d!78053 c!58812) b!491983))

(assert (= (and d!78053 (not c!58812)) b!491985))

(assert (= (and b!491985 res!294901) b!491988))

(assert (= (and b!491988 (not res!294899)) b!491982))

(assert (= (and b!491982 (not res!294900)) b!491987))

(declare-fun m!472963 () Bool)

(assert (=> b!491987 m!472963))

(assert (=> b!491984 m!472815))

(declare-fun m!472967 () Bool)

(assert (=> b!491984 m!472967))

(assert (=> b!491984 m!472967))

(assert (=> b!491984 m!472801))

(declare-fun m!472971 () Bool)

(assert (=> b!491984 m!472971))

(assert (=> b!491982 m!472963))

(assert (=> b!491988 m!472963))

(assert (=> d!78053 m!472815))

(declare-fun m!472977 () Bool)

(assert (=> d!78053 m!472977))

(assert (=> d!78053 m!472827))

(assert (=> b!491809 d!78053))

(declare-fun d!78071 () Bool)

(declare-fun lt!222460 () (_ BitVec 32))

(declare-fun lt!222459 () (_ BitVec 32))

(assert (=> d!78071 (= lt!222460 (bvmul (bvxor lt!222459 (bvlshr lt!222459 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78071 (= lt!222459 ((_ extract 31 0) (bvand (bvxor (select (arr!15310 a!3235) j!176) (bvlshr (select (arr!15310 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78071 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!294902 (let ((h!10236 ((_ extract 31 0) (bvand (bvxor (select (arr!15310 a!3235) j!176) (bvlshr (select (arr!15310 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46344 (bvmul (bvxor h!10236 (bvlshr h!10236 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46344 (bvlshr x!46344 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!294902 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!294902 #b00000000000000000000000000000000))))))

(assert (=> d!78071 (= (toIndex!0 (select (arr!15310 a!3235) j!176) mask!3524) (bvand (bvxor lt!222460 (bvlshr lt!222460 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!491809 d!78071))

(declare-fun b!492014 () Bool)

(declare-fun e!289040 () Bool)

(declare-fun e!289039 () Bool)

(assert (=> b!492014 (= e!289040 e!289039)))

(declare-fun c!58824 () Bool)

(assert (=> b!492014 (= c!58824 (validKeyInArray!0 (select (arr!15310 a!3235) j!176)))))

(declare-fun d!78079 () Bool)

(declare-fun res!294910 () Bool)

(assert (=> d!78079 (=> res!294910 e!289040)))

(assert (=> d!78079 (= res!294910 (bvsge j!176 (size!15674 a!3235)))))

(assert (=> d!78079 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!289040)))

(declare-fun b!492015 () Bool)

(declare-fun call!31360 () Bool)

(assert (=> b!492015 (= e!289039 call!31360)))

(declare-fun bm!31357 () Bool)

(assert (=> bm!31357 (= call!31360 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!492016 () Bool)

(declare-fun e!289041 () Bool)

(assert (=> b!492016 (= e!289041 call!31360)))

(declare-fun b!492017 () Bool)

(assert (=> b!492017 (= e!289039 e!289041)))

(declare-fun lt!222461 () (_ BitVec 64))

(assert (=> b!492017 (= lt!222461 (select (arr!15310 a!3235) j!176))))

(declare-fun lt!222463 () Unit!14473)

(assert (=> b!492017 (= lt!222463 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222461 j!176))))

(assert (=> b!492017 (arrayContainsKey!0 a!3235 lt!222461 #b00000000000000000000000000000000)))

(declare-fun lt!222462 () Unit!14473)

(assert (=> b!492017 (= lt!222462 lt!222463)))

(declare-fun res!294909 () Bool)

(assert (=> b!492017 (= res!294909 (= (seekEntryOrOpen!0 (select (arr!15310 a!3235) j!176) a!3235 mask!3524) (Found!3733 j!176)))))

(assert (=> b!492017 (=> (not res!294909) (not e!289041))))

(assert (= (and d!78079 (not res!294910)) b!492014))

(assert (= (and b!492014 c!58824) b!492017))

(assert (= (and b!492014 (not c!58824)) b!492015))

(assert (= (and b!492017 res!294909) b!492016))

(assert (= (or b!492016 b!492015) bm!31357))

(assert (=> b!492014 m!472801))

(assert (=> b!492014 m!472801))

(assert (=> b!492014 m!472805))

(declare-fun m!473007 () Bool)

(assert (=> bm!31357 m!473007))

(assert (=> b!492017 m!472801))

(declare-fun m!473009 () Bool)

(assert (=> b!492017 m!473009))

(declare-fun m!473011 () Bool)

(assert (=> b!492017 m!473011))

(assert (=> b!492017 m!472801))

(assert (=> b!492017 m!472803))

(assert (=> b!491809 d!78079))

(declare-fun d!78081 () Bool)

(assert (=> d!78081 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222466 () Unit!14473)

(declare-fun choose!38 (array!31846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14473)

(assert (=> d!78081 (= lt!222466 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78081 (validMask!0 mask!3524)))

(assert (=> d!78081 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!222466)))

(declare-fun bs!15704 () Bool)

(assert (= bs!15704 d!78081))

(assert (=> bs!15704 m!472823))

(declare-fun m!473013 () Bool)

(assert (=> bs!15704 m!473013))

(assert (=> bs!15704 m!472827))

(assert (=> b!491809 d!78081))

(declare-fun d!78083 () Bool)

(declare-fun lt!222468 () (_ BitVec 32))

(declare-fun lt!222467 () (_ BitVec 32))

(assert (=> d!78083 (= lt!222468 (bvmul (bvxor lt!222467 (bvlshr lt!222467 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78083 (= lt!222467 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78083 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!294902 (let ((h!10236 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46344 (bvmul (bvxor h!10236 (bvlshr h!10236 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46344 (bvlshr x!46344 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!294902 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!294902 #b00000000000000000000000000000000))))))

(assert (=> d!78083 (= (toIndex!0 (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!222468 (bvlshr lt!222468 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!491809 d!78083))

(declare-fun d!78085 () Bool)

(declare-fun e!289046 () Bool)

(assert (=> d!78085 e!289046))

(declare-fun c!58825 () Bool)

(declare-fun lt!222469 () SeekEntryResult!3733)

(assert (=> d!78085 (= c!58825 (and ((_ is Intermediate!3733) lt!222469) (undefined!4545 lt!222469)))))

(declare-fun e!289042 () SeekEntryResult!3733)

(assert (=> d!78085 (= lt!222469 e!289042)))

(declare-fun c!58827 () Bool)

(assert (=> d!78085 (= c!58827 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!222470 () (_ BitVec 64))

(assert (=> d!78085 (= lt!222470 (select (arr!15310 (array!31847 (store (arr!15310 a!3235) i!1204 k0!2280) (size!15674 a!3235))) (toIndex!0 (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176) mask!3524)))))

(assert (=> d!78085 (validMask!0 mask!3524)))

(assert (=> d!78085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176) (array!31847 (store (arr!15310 a!3235) i!1204 k0!2280) (size!15674 a!3235)) mask!3524) lt!222469)))

(declare-fun e!289045 () SeekEntryResult!3733)

(declare-fun b!492018 () Bool)

(assert (=> b!492018 (= e!289045 (Intermediate!3733 false (toIndex!0 (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!492019 () Bool)

(assert (=> b!492019 (and (bvsge (index!17113 lt!222469) #b00000000000000000000000000000000) (bvslt (index!17113 lt!222469) (size!15674 (array!31847 (store (arr!15310 a!3235) i!1204 k0!2280) (size!15674 a!3235)))))))

(declare-fun res!294912 () Bool)

(assert (=> b!492019 (= res!294912 (= (select (arr!15310 (array!31847 (store (arr!15310 a!3235) i!1204 k0!2280) (size!15674 a!3235))) (index!17113 lt!222469)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!289043 () Bool)

(assert (=> b!492019 (=> res!294912 e!289043)))

(declare-fun b!492020 () Bool)

(assert (=> b!492020 (= e!289046 (bvsge (x!46340 lt!222469) #b01111111111111111111111111111110))))

(declare-fun b!492021 () Bool)

(assert (=> b!492021 (= e!289045 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176) (array!31847 (store (arr!15310 a!3235) i!1204 k0!2280) (size!15674 a!3235)) mask!3524))))

(declare-fun b!492022 () Bool)

(declare-fun e!289044 () Bool)

(assert (=> b!492022 (= e!289046 e!289044)))

(declare-fun res!294913 () Bool)

(assert (=> b!492022 (= res!294913 (and ((_ is Intermediate!3733) lt!222469) (not (undefined!4545 lt!222469)) (bvslt (x!46340 lt!222469) #b01111111111111111111111111111110) (bvsge (x!46340 lt!222469) #b00000000000000000000000000000000) (bvsge (x!46340 lt!222469) #b00000000000000000000000000000000)))))

(assert (=> b!492022 (=> (not res!294913) (not e!289044))))

(declare-fun b!492023 () Bool)

(assert (=> b!492023 (= e!289042 (Intermediate!3733 true (toIndex!0 (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!492024 () Bool)

(assert (=> b!492024 (and (bvsge (index!17113 lt!222469) #b00000000000000000000000000000000) (bvslt (index!17113 lt!222469) (size!15674 (array!31847 (store (arr!15310 a!3235) i!1204 k0!2280) (size!15674 a!3235)))))))

(assert (=> b!492024 (= e!289043 (= (select (arr!15310 (array!31847 (store (arr!15310 a!3235) i!1204 k0!2280) (size!15674 a!3235))) (index!17113 lt!222469)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!492025 () Bool)

(assert (=> b!492025 (and (bvsge (index!17113 lt!222469) #b00000000000000000000000000000000) (bvslt (index!17113 lt!222469) (size!15674 (array!31847 (store (arr!15310 a!3235) i!1204 k0!2280) (size!15674 a!3235)))))))

(declare-fun res!294911 () Bool)

(assert (=> b!492025 (= res!294911 (= (select (arr!15310 (array!31847 (store (arr!15310 a!3235) i!1204 k0!2280) (size!15674 a!3235))) (index!17113 lt!222469)) (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!492025 (=> res!294911 e!289043)))

(assert (=> b!492025 (= e!289044 e!289043)))

(declare-fun b!492026 () Bool)

(assert (=> b!492026 (= e!289042 e!289045)))

(declare-fun c!58826 () Bool)

(assert (=> b!492026 (= c!58826 (or (= lt!222470 (select (store (arr!15310 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!222470 lt!222470) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!78085 c!58827) b!492023))

(assert (= (and d!78085 (not c!58827)) b!492026))

(assert (= (and b!492026 c!58826) b!492018))

(assert (= (and b!492026 (not c!58826)) b!492021))

(assert (= (and d!78085 c!58825) b!492020))

(assert (= (and d!78085 (not c!58825)) b!492022))

(assert (= (and b!492022 res!294913) b!492025))

(assert (= (and b!492025 (not res!294911)) b!492019))

(assert (= (and b!492019 (not res!294912)) b!492024))

(declare-fun m!473015 () Bool)

(assert (=> b!492024 m!473015))

(assert (=> b!492021 m!472819))

(declare-fun m!473017 () Bool)

(assert (=> b!492021 m!473017))

(assert (=> b!492021 m!473017))

(assert (=> b!492021 m!472813))

(declare-fun m!473019 () Bool)

(assert (=> b!492021 m!473019))

(assert (=> b!492019 m!473015))

(assert (=> b!492025 m!473015))

(assert (=> d!78085 m!472819))

(declare-fun m!473021 () Bool)

(assert (=> d!78085 m!473021))

(assert (=> d!78085 m!472827))

(assert (=> b!491809 d!78085))

(declare-fun d!78087 () Bool)

(assert (=> d!78087 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!491815 d!78087))

(declare-fun b!492061 () Bool)

(declare-fun e!289067 () Bool)

(declare-fun e!289069 () Bool)

(assert (=> b!492061 (= e!289067 e!289069)))

(declare-fun c!58842 () Bool)

(assert (=> b!492061 (= c!58842 (validKeyInArray!0 (select (arr!15310 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31360 () Bool)

(declare-fun call!31363 () Bool)

(assert (=> bm!31360 (= call!31363 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58842 (Cons!9371 (select (arr!15310 a!3235) #b00000000000000000000000000000000) Nil!9372) Nil!9372)))))

(declare-fun b!492062 () Bool)

(declare-fun e!289070 () Bool)

(declare-fun contains!2687 (List!9375 (_ BitVec 64)) Bool)

(assert (=> b!492062 (= e!289070 (contains!2687 Nil!9372 (select (arr!15310 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!492063 () Bool)

(assert (=> b!492063 (= e!289069 call!31363)))

(declare-fun b!492064 () Bool)

(declare-fun e!289068 () Bool)

(assert (=> b!492064 (= e!289068 e!289067)))

(declare-fun res!294921 () Bool)

(assert (=> b!492064 (=> (not res!294921) (not e!289067))))

(assert (=> b!492064 (= res!294921 (not e!289070))))

(declare-fun res!294920 () Bool)

(assert (=> b!492064 (=> (not res!294920) (not e!289070))))

(assert (=> b!492064 (= res!294920 (validKeyInArray!0 (select (arr!15310 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!492065 () Bool)

(assert (=> b!492065 (= e!289069 call!31363)))

(declare-fun d!78089 () Bool)

(declare-fun res!294922 () Bool)

(assert (=> d!78089 (=> res!294922 e!289068)))

(assert (=> d!78089 (= res!294922 (bvsge #b00000000000000000000000000000000 (size!15674 a!3235)))))

(assert (=> d!78089 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9372) e!289068)))

(assert (= (and d!78089 (not res!294922)) b!492064))

(assert (= (and b!492064 res!294920) b!492062))

(assert (= (and b!492064 res!294921) b!492061))

(assert (= (and b!492061 c!58842) b!492065))

(assert (= (and b!492061 (not c!58842)) b!492063))

(assert (= (or b!492065 b!492063) bm!31360))

(assert (=> b!492061 m!472923))

(assert (=> b!492061 m!472923))

(assert (=> b!492061 m!472935))

(assert (=> bm!31360 m!472923))

(declare-fun m!473023 () Bool)

(assert (=> bm!31360 m!473023))

(assert (=> b!492062 m!472923))

(assert (=> b!492062 m!472923))

(declare-fun m!473025 () Bool)

(assert (=> b!492062 m!473025))

(assert (=> b!492064 m!472923))

(assert (=> b!492064 m!472923))

(assert (=> b!492064 m!472935))

(assert (=> b!491810 d!78089))

(declare-fun b!492078 () Bool)

(declare-fun e!289079 () SeekEntryResult!3733)

(declare-fun lt!222479 () SeekEntryResult!3733)

(assert (=> b!492078 (= e!289079 (Found!3733 (index!17113 lt!222479)))))

(declare-fun b!492079 () Bool)

(declare-fun e!289080 () SeekEntryResult!3733)

(assert (=> b!492079 (= e!289080 Undefined!3733)))

(declare-fun b!492080 () Bool)

(declare-fun e!289081 () SeekEntryResult!3733)

(assert (=> b!492080 (= e!289081 (MissingZero!3733 (index!17113 lt!222479)))))

(declare-fun b!492082 () Bool)

(assert (=> b!492082 (= e!289081 (seekKeyOrZeroReturnVacant!0 (x!46340 lt!222479) (index!17113 lt!222479) (index!17113 lt!222479) (select (arr!15310 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!492083 () Bool)

(assert (=> b!492083 (= e!289080 e!289079)))

(declare-fun lt!222481 () (_ BitVec 64))

(assert (=> b!492083 (= lt!222481 (select (arr!15310 a!3235) (index!17113 lt!222479)))))

(declare-fun c!58844 () Bool)

(assert (=> b!492083 (= c!58844 (= lt!222481 (select (arr!15310 a!3235) j!176)))))

(declare-fun b!492081 () Bool)

(declare-fun c!58845 () Bool)

(assert (=> b!492081 (= c!58845 (= lt!222481 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492081 (= e!289079 e!289081)))

(declare-fun d!78091 () Bool)

(declare-fun lt!222480 () SeekEntryResult!3733)

(assert (=> d!78091 (and (or ((_ is Undefined!3733) lt!222480) (not ((_ is Found!3733) lt!222480)) (and (bvsge (index!17112 lt!222480) #b00000000000000000000000000000000) (bvslt (index!17112 lt!222480) (size!15674 a!3235)))) (or ((_ is Undefined!3733) lt!222480) ((_ is Found!3733) lt!222480) (not ((_ is MissingZero!3733) lt!222480)) (and (bvsge (index!17111 lt!222480) #b00000000000000000000000000000000) (bvslt (index!17111 lt!222480) (size!15674 a!3235)))) (or ((_ is Undefined!3733) lt!222480) ((_ is Found!3733) lt!222480) ((_ is MissingZero!3733) lt!222480) (not ((_ is MissingVacant!3733) lt!222480)) (and (bvsge (index!17114 lt!222480) #b00000000000000000000000000000000) (bvslt (index!17114 lt!222480) (size!15674 a!3235)))) (or ((_ is Undefined!3733) lt!222480) (ite ((_ is Found!3733) lt!222480) (= (select (arr!15310 a!3235) (index!17112 lt!222480)) (select (arr!15310 a!3235) j!176)) (ite ((_ is MissingZero!3733) lt!222480) (= (select (arr!15310 a!3235) (index!17111 lt!222480)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3733) lt!222480) (= (select (arr!15310 a!3235) (index!17114 lt!222480)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78091 (= lt!222480 e!289080)))

(declare-fun c!58843 () Bool)

(assert (=> d!78091 (= c!58843 (and ((_ is Intermediate!3733) lt!222479) (undefined!4545 lt!222479)))))

(assert (=> d!78091 (= lt!222479 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15310 a!3235) j!176) mask!3524) (select (arr!15310 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78091 (validMask!0 mask!3524)))

(assert (=> d!78091 (= (seekEntryOrOpen!0 (select (arr!15310 a!3235) j!176) a!3235 mask!3524) lt!222480)))

(assert (= (and d!78091 c!58843) b!492079))

(assert (= (and d!78091 (not c!58843)) b!492083))

(assert (= (and b!492083 c!58844) b!492078))

(assert (= (and b!492083 (not c!58844)) b!492081))

(assert (= (and b!492081 c!58845) b!492080))

(assert (= (and b!492081 (not c!58845)) b!492082))

(assert (=> b!492082 m!472801))

(declare-fun m!473027 () Bool)

(assert (=> b!492082 m!473027))

(declare-fun m!473029 () Bool)

(assert (=> b!492083 m!473029))

(declare-fun m!473031 () Bool)

(assert (=> d!78091 m!473031))

(assert (=> d!78091 m!472827))

(declare-fun m!473033 () Bool)

(assert (=> d!78091 m!473033))

(declare-fun m!473035 () Bool)

(assert (=> d!78091 m!473035))

(assert (=> d!78091 m!472815))

(assert (=> d!78091 m!472801))

(assert (=> d!78091 m!472817))

(assert (=> d!78091 m!472801))

(assert (=> d!78091 m!472815))

(assert (=> b!491811 d!78091))

(declare-fun d!78093 () Bool)

(assert (=> d!78093 (= (validKeyInArray!0 (select (arr!15310 a!3235) j!176)) (and (not (= (select (arr!15310 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15310 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!491806 d!78093))

(check-sat (not b!492062) (not d!78035) (not b!492064) (not b!491984) (not bm!31356) (not b!492082) (not b!492061) (not b!491923) (not b!491926) (not d!78091) (not b!492021) (not b!491899) (not d!78081) (not b!492014) (not d!78085) (not bm!31360) (not b!492017) (not b!491892) (not d!78053) (not bm!31357))
(check-sat)
