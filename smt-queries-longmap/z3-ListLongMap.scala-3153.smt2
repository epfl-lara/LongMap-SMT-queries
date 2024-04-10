; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44390 () Bool)

(assert start!44390)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!487905 () Bool)

(declare-datatypes ((array!31596 0))(
  ( (array!31597 (arr!15190 (Array (_ BitVec 32) (_ BitVec 64))) (size!15554 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31596)

(declare-fun e!287040 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3657 0))(
  ( (MissingZero!3657 (index!16807 (_ BitVec 32))) (Found!3657 (index!16808 (_ BitVec 32))) (Intermediate!3657 (undefined!4469 Bool) (index!16809 (_ BitVec 32)) (x!45925 (_ BitVec 32))) (Undefined!3657) (MissingVacant!3657 (index!16810 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31596 (_ BitVec 32)) SeekEntryResult!3657)

(assert (=> b!487905 (= e!287040 (= (seekEntryOrOpen!0 (select (arr!15190 a!3235) j!176) a!3235 mask!3524) (Found!3657 j!176)))))

(declare-fun b!487906 () Bool)

(declare-fun res!291182 () Bool)

(declare-fun e!287043 () Bool)

(assert (=> b!487906 (=> (not res!291182) (not e!287043))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487906 (= res!291182 (and (= (size!15554 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15554 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15554 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487907 () Bool)

(declare-fun res!291185 () Bool)

(assert (=> b!487907 (=> (not res!291185) (not e!287043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487907 (= res!291185 (validKeyInArray!0 (select (arr!15190 a!3235) j!176)))))

(declare-fun b!487908 () Bool)

(declare-fun res!291181 () Bool)

(assert (=> b!487908 (=> (not res!291181) (not e!287043))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487908 (= res!291181 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487909 () Bool)

(declare-fun e!287041 () Bool)

(assert (=> b!487909 (= e!287043 e!287041)))

(declare-fun res!291180 () Bool)

(assert (=> b!487909 (=> (not res!291180) (not e!287041))))

(declare-fun lt!220198 () SeekEntryResult!3657)

(assert (=> b!487909 (= res!291180 (or (= lt!220198 (MissingZero!3657 i!1204)) (= lt!220198 (MissingVacant!3657 i!1204))))))

(assert (=> b!487909 (= lt!220198 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487910 () Bool)

(declare-fun res!291178 () Bool)

(assert (=> b!487910 (=> (not res!291178) (not e!287041))))

(declare-datatypes ((List!9348 0))(
  ( (Nil!9345) (Cons!9344 (h!10200 (_ BitVec 64)) (t!15576 List!9348)) )
))
(declare-fun arrayNoDuplicates!0 (array!31596 (_ BitVec 32) List!9348) Bool)

(assert (=> b!487910 (= res!291178 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9345))))

(declare-fun b!487911 () Bool)

(declare-fun res!291183 () Bool)

(assert (=> b!487911 (=> (not res!291183) (not e!287043))))

(assert (=> b!487911 (= res!291183 (validKeyInArray!0 k0!2280))))

(declare-fun b!487912 () Bool)

(declare-fun res!291177 () Bool)

(assert (=> b!487912 (=> (not res!291177) (not e!287041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31596 (_ BitVec 32)) Bool)

(assert (=> b!487912 (= res!291177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!291184 () Bool)

(assert (=> start!44390 (=> (not res!291184) (not e!287043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44390 (= res!291184 (validMask!0 mask!3524))))

(assert (=> start!44390 e!287043))

(assert (=> start!44390 true))

(declare-fun array_inv!10986 (array!31596) Bool)

(assert (=> start!44390 (array_inv!10986 a!3235)))

(declare-fun b!487913 () Bool)

(declare-fun lt!220196 () (_ BitVec 32))

(assert (=> b!487913 (= e!287041 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (and (bvsge lt!220196 #b00000000000000000000000000000000) (bvslt lt!220196 (bvadd #b00000000000000000000000000000001 mask!3524))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487913 (= lt!220196 (toIndex!0 (select (arr!15190 a!3235) j!176) mask!3524))))

(assert (=> b!487913 e!287040))

(declare-fun res!291179 () Bool)

(assert (=> b!487913 (=> (not res!291179) (not e!287040))))

(assert (=> b!487913 (= res!291179 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14260 0))(
  ( (Unit!14261) )
))
(declare-fun lt!220197 () Unit!14260)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14260)

(assert (=> b!487913 (= lt!220197 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44390 res!291184) b!487906))

(assert (= (and b!487906 res!291182) b!487907))

(assert (= (and b!487907 res!291185) b!487911))

(assert (= (and b!487911 res!291183) b!487908))

(assert (= (and b!487908 res!291181) b!487909))

(assert (= (and b!487909 res!291180) b!487912))

(assert (= (and b!487912 res!291177) b!487910))

(assert (= (and b!487910 res!291178) b!487913))

(assert (= (and b!487913 res!291179) b!487905))

(declare-fun m!467687 () Bool)

(assert (=> b!487911 m!467687))

(declare-fun m!467689 () Bool)

(assert (=> b!487913 m!467689))

(assert (=> b!487913 m!467689))

(declare-fun m!467691 () Bool)

(assert (=> b!487913 m!467691))

(declare-fun m!467693 () Bool)

(assert (=> b!487913 m!467693))

(declare-fun m!467695 () Bool)

(assert (=> b!487913 m!467695))

(declare-fun m!467697 () Bool)

(assert (=> b!487912 m!467697))

(declare-fun m!467699 () Bool)

(assert (=> start!44390 m!467699))

(declare-fun m!467701 () Bool)

(assert (=> start!44390 m!467701))

(declare-fun m!467703 () Bool)

(assert (=> b!487910 m!467703))

(declare-fun m!467705 () Bool)

(assert (=> b!487909 m!467705))

(declare-fun m!467707 () Bool)

(assert (=> b!487908 m!467707))

(assert (=> b!487905 m!467689))

(assert (=> b!487905 m!467689))

(declare-fun m!467709 () Bool)

(assert (=> b!487905 m!467709))

(assert (=> b!487907 m!467689))

(assert (=> b!487907 m!467689))

(declare-fun m!467711 () Bool)

(assert (=> b!487907 m!467711))

(check-sat (not b!487905) (not b!487910) (not b!487908) (not b!487909) (not b!487912) (not b!487913) (not b!487907) (not b!487911) (not start!44390))
(check-sat)
(get-model)

(declare-fun d!77709 () Bool)

(declare-fun res!291227 () Bool)

(declare-fun e!287082 () Bool)

(assert (=> d!77709 (=> res!291227 e!287082)))

(assert (=> d!77709 (= res!291227 (bvsge #b00000000000000000000000000000000 (size!15554 a!3235)))))

(assert (=> d!77709 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9345) e!287082)))

(declare-fun bm!31307 () Bool)

(declare-fun call!31310 () Bool)

(declare-fun c!58643 () Bool)

(assert (=> bm!31307 (= call!31310 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58643 (Cons!9344 (select (arr!15190 a!3235) #b00000000000000000000000000000000) Nil!9345) Nil!9345)))))

(declare-fun b!487975 () Bool)

(declare-fun e!287079 () Bool)

(assert (=> b!487975 (= e!287079 call!31310)))

(declare-fun b!487976 () Bool)

(declare-fun e!287081 () Bool)

(assert (=> b!487976 (= e!287081 e!287079)))

(assert (=> b!487976 (= c!58643 (validKeyInArray!0 (select (arr!15190 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!487977 () Bool)

(assert (=> b!487977 (= e!287079 call!31310)))

(declare-fun b!487978 () Bool)

(declare-fun e!287080 () Bool)

(declare-fun contains!2702 (List!9348 (_ BitVec 64)) Bool)

(assert (=> b!487978 (= e!287080 (contains!2702 Nil!9345 (select (arr!15190 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!487979 () Bool)

(assert (=> b!487979 (= e!287082 e!287081)))

(declare-fun res!291228 () Bool)

(assert (=> b!487979 (=> (not res!291228) (not e!287081))))

(assert (=> b!487979 (= res!291228 (not e!287080))))

(declare-fun res!291226 () Bool)

(assert (=> b!487979 (=> (not res!291226) (not e!287080))))

(assert (=> b!487979 (= res!291226 (validKeyInArray!0 (select (arr!15190 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!77709 (not res!291227)) b!487979))

(assert (= (and b!487979 res!291226) b!487978))

(assert (= (and b!487979 res!291228) b!487976))

(assert (= (and b!487976 c!58643) b!487977))

(assert (= (and b!487976 (not c!58643)) b!487975))

(assert (= (or b!487977 b!487975) bm!31307))

(declare-fun m!467751 () Bool)

(assert (=> bm!31307 m!467751))

(declare-fun m!467753 () Bool)

(assert (=> bm!31307 m!467753))

(assert (=> b!487976 m!467751))

(assert (=> b!487976 m!467751))

(declare-fun m!467755 () Bool)

(assert (=> b!487976 m!467755))

(assert (=> b!487978 m!467751))

(assert (=> b!487978 m!467751))

(declare-fun m!467759 () Bool)

(assert (=> b!487978 m!467759))

(assert (=> b!487979 m!467751))

(assert (=> b!487979 m!467751))

(assert (=> b!487979 m!467755))

(assert (=> b!487910 d!77709))

(declare-fun b!488041 () Bool)

(declare-fun e!287126 () SeekEntryResult!3657)

(declare-fun lt!220258 () SeekEntryResult!3657)

(assert (=> b!488041 (= e!287126 (MissingZero!3657 (index!16809 lt!220258)))))

(declare-fun d!77719 () Bool)

(declare-fun lt!220256 () SeekEntryResult!3657)

(get-info :version)

(assert (=> d!77719 (and (or ((_ is Undefined!3657) lt!220256) (not ((_ is Found!3657) lt!220256)) (and (bvsge (index!16808 lt!220256) #b00000000000000000000000000000000) (bvslt (index!16808 lt!220256) (size!15554 a!3235)))) (or ((_ is Undefined!3657) lt!220256) ((_ is Found!3657) lt!220256) (not ((_ is MissingZero!3657) lt!220256)) (and (bvsge (index!16807 lt!220256) #b00000000000000000000000000000000) (bvslt (index!16807 lt!220256) (size!15554 a!3235)))) (or ((_ is Undefined!3657) lt!220256) ((_ is Found!3657) lt!220256) ((_ is MissingZero!3657) lt!220256) (not ((_ is MissingVacant!3657) lt!220256)) (and (bvsge (index!16810 lt!220256) #b00000000000000000000000000000000) (bvslt (index!16810 lt!220256) (size!15554 a!3235)))) (or ((_ is Undefined!3657) lt!220256) (ite ((_ is Found!3657) lt!220256) (= (select (arr!15190 a!3235) (index!16808 lt!220256)) (select (arr!15190 a!3235) j!176)) (ite ((_ is MissingZero!3657) lt!220256) (= (select (arr!15190 a!3235) (index!16807 lt!220256)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3657) lt!220256) (= (select (arr!15190 a!3235) (index!16810 lt!220256)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!287127 () SeekEntryResult!3657)

(assert (=> d!77719 (= lt!220256 e!287127)))

(declare-fun c!58663 () Bool)

(assert (=> d!77719 (= c!58663 (and ((_ is Intermediate!3657) lt!220258) (undefined!4469 lt!220258)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31596 (_ BitVec 32)) SeekEntryResult!3657)

(assert (=> d!77719 (= lt!220258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15190 a!3235) j!176) mask!3524) (select (arr!15190 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77719 (validMask!0 mask!3524)))

(assert (=> d!77719 (= (seekEntryOrOpen!0 (select (arr!15190 a!3235) j!176) a!3235 mask!3524) lt!220256)))

(declare-fun b!488042 () Bool)

(declare-fun e!287125 () SeekEntryResult!3657)

(assert (=> b!488042 (= e!287127 e!287125)))

(declare-fun lt!220257 () (_ BitVec 64))

(assert (=> b!488042 (= lt!220257 (select (arr!15190 a!3235) (index!16809 lt!220258)))))

(declare-fun c!58665 () Bool)

(assert (=> b!488042 (= c!58665 (= lt!220257 (select (arr!15190 a!3235) j!176)))))

(declare-fun b!488043 () Bool)

(assert (=> b!488043 (= e!287125 (Found!3657 (index!16809 lt!220258)))))

(declare-fun b!488044 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31596 (_ BitVec 32)) SeekEntryResult!3657)

(assert (=> b!488044 (= e!287126 (seekKeyOrZeroReturnVacant!0 (x!45925 lt!220258) (index!16809 lt!220258) (index!16809 lt!220258) (select (arr!15190 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!488045 () Bool)

(declare-fun c!58664 () Bool)

(assert (=> b!488045 (= c!58664 (= lt!220257 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!488045 (= e!287125 e!287126)))

(declare-fun b!488046 () Bool)

(assert (=> b!488046 (= e!287127 Undefined!3657)))

(assert (= (and d!77719 c!58663) b!488046))

(assert (= (and d!77719 (not c!58663)) b!488042))

(assert (= (and b!488042 c!58665) b!488043))

(assert (= (and b!488042 (not c!58665)) b!488045))

(assert (= (and b!488045 c!58664) b!488041))

(assert (= (and b!488045 (not c!58664)) b!488044))

(assert (=> d!77719 m!467689))

(assert (=> d!77719 m!467691))

(assert (=> d!77719 m!467699))

(declare-fun m!467811 () Bool)

(assert (=> d!77719 m!467811))

(declare-fun m!467813 () Bool)

(assert (=> d!77719 m!467813))

(declare-fun m!467815 () Bool)

(assert (=> d!77719 m!467815))

(assert (=> d!77719 m!467691))

(assert (=> d!77719 m!467689))

(declare-fun m!467817 () Bool)

(assert (=> d!77719 m!467817))

(declare-fun m!467819 () Bool)

(assert (=> b!488042 m!467819))

(assert (=> b!488044 m!467689))

(declare-fun m!467821 () Bool)

(assert (=> b!488044 m!467821))

(assert (=> b!487905 d!77719))

(declare-fun d!77743 () Bool)

(assert (=> d!77743 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487911 d!77743))

(declare-fun d!77745 () Bool)

(declare-fun res!291265 () Bool)

(declare-fun e!287149 () Bool)

(assert (=> d!77745 (=> res!291265 e!287149)))

(assert (=> d!77745 (= res!291265 (bvsge #b00000000000000000000000000000000 (size!15554 a!3235)))))

(assert (=> d!77745 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!287149)))

(declare-fun b!488077 () Bool)

(declare-fun e!287151 () Bool)

(declare-fun call!31321 () Bool)

(assert (=> b!488077 (= e!287151 call!31321)))

(declare-fun b!488078 () Bool)

(declare-fun e!287150 () Bool)

(assert (=> b!488078 (= e!287149 e!287150)))

(declare-fun c!58675 () Bool)

(assert (=> b!488078 (= c!58675 (validKeyInArray!0 (select (arr!15190 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!488079 () Bool)

(assert (=> b!488079 (= e!287150 call!31321)))

(declare-fun bm!31318 () Bool)

(assert (=> bm!31318 (= call!31321 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!488080 () Bool)

(assert (=> b!488080 (= e!287150 e!287151)))

(declare-fun lt!220280 () (_ BitVec 64))

(assert (=> b!488080 (= lt!220280 (select (arr!15190 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220282 () Unit!14260)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31596 (_ BitVec 64) (_ BitVec 32)) Unit!14260)

(assert (=> b!488080 (= lt!220282 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220280 #b00000000000000000000000000000000))))

(assert (=> b!488080 (arrayContainsKey!0 a!3235 lt!220280 #b00000000000000000000000000000000)))

(declare-fun lt!220281 () Unit!14260)

(assert (=> b!488080 (= lt!220281 lt!220282)))

(declare-fun res!291266 () Bool)

(assert (=> b!488080 (= res!291266 (= (seekEntryOrOpen!0 (select (arr!15190 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3657 #b00000000000000000000000000000000)))))

(assert (=> b!488080 (=> (not res!291266) (not e!287151))))

(assert (= (and d!77745 (not res!291265)) b!488078))

(assert (= (and b!488078 c!58675) b!488080))

(assert (= (and b!488078 (not c!58675)) b!488079))

(assert (= (and b!488080 res!291266) b!488077))

(assert (= (or b!488077 b!488079) bm!31318))

(assert (=> b!488078 m!467751))

(assert (=> b!488078 m!467751))

(assert (=> b!488078 m!467755))

(declare-fun m!467831 () Bool)

(assert (=> bm!31318 m!467831))

(assert (=> b!488080 m!467751))

(declare-fun m!467833 () Bool)

(assert (=> b!488080 m!467833))

(declare-fun m!467835 () Bool)

(assert (=> b!488080 m!467835))

(assert (=> b!488080 m!467751))

(declare-fun m!467837 () Bool)

(assert (=> b!488080 m!467837))

(assert (=> b!487912 d!77745))

(declare-fun d!77757 () Bool)

(assert (=> d!77757 (= (validKeyInArray!0 (select (arr!15190 a!3235) j!176)) (and (not (= (select (arr!15190 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15190 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487907 d!77757))

(declare-fun d!77759 () Bool)

(assert (=> d!77759 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44390 d!77759))

(declare-fun d!77767 () Bool)

(assert (=> d!77767 (= (array_inv!10986 a!3235) (bvsge (size!15554 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44390 d!77767))

(declare-fun d!77769 () Bool)

(declare-fun lt!220297 () (_ BitVec 32))

(declare-fun lt!220296 () (_ BitVec 32))

(assert (=> d!77769 (= lt!220297 (bvmul (bvxor lt!220296 (bvlshr lt!220296 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!77769 (= lt!220296 ((_ extract 31 0) (bvand (bvxor (select (arr!15190 a!3235) j!176) (bvlshr (select (arr!15190 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!77769 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!291276 (let ((h!10204 ((_ extract 31 0) (bvand (bvxor (select (arr!15190 a!3235) j!176) (bvlshr (select (arr!15190 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!45929 (bvmul (bvxor h!10204 (bvlshr h!10204 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!45929 (bvlshr x!45929 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!291276 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!291276 #b00000000000000000000000000000000))))))

(assert (=> d!77769 (= (toIndex!0 (select (arr!15190 a!3235) j!176) mask!3524) (bvand (bvxor lt!220297 (bvlshr lt!220297 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!487913 d!77769))

(declare-fun d!77771 () Bool)

(declare-fun res!291277 () Bool)

(declare-fun e!287170 () Bool)

(assert (=> d!77771 (=> res!291277 e!287170)))

(assert (=> d!77771 (= res!291277 (bvsge j!176 (size!15554 a!3235)))))

(assert (=> d!77771 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!287170)))

(declare-fun b!488108 () Bool)

(declare-fun e!287172 () Bool)

(declare-fun call!31325 () Bool)

(assert (=> b!488108 (= e!287172 call!31325)))

(declare-fun b!488109 () Bool)

(declare-fun e!287171 () Bool)

(assert (=> b!488109 (= e!287170 e!287171)))

(declare-fun c!58685 () Bool)

(assert (=> b!488109 (= c!58685 (validKeyInArray!0 (select (arr!15190 a!3235) j!176)))))

(declare-fun b!488110 () Bool)

(assert (=> b!488110 (= e!287171 call!31325)))

(declare-fun bm!31322 () Bool)

(assert (=> bm!31322 (= call!31325 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!488111 () Bool)

(assert (=> b!488111 (= e!287171 e!287172)))

(declare-fun lt!220298 () (_ BitVec 64))

(assert (=> b!488111 (= lt!220298 (select (arr!15190 a!3235) j!176))))

(declare-fun lt!220300 () Unit!14260)

(assert (=> b!488111 (= lt!220300 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220298 j!176))))

(assert (=> b!488111 (arrayContainsKey!0 a!3235 lt!220298 #b00000000000000000000000000000000)))

(declare-fun lt!220299 () Unit!14260)

(assert (=> b!488111 (= lt!220299 lt!220300)))

(declare-fun res!291278 () Bool)

(assert (=> b!488111 (= res!291278 (= (seekEntryOrOpen!0 (select (arr!15190 a!3235) j!176) a!3235 mask!3524) (Found!3657 j!176)))))

(assert (=> b!488111 (=> (not res!291278) (not e!287172))))

(assert (= (and d!77771 (not res!291277)) b!488109))

(assert (= (and b!488109 c!58685) b!488111))

(assert (= (and b!488109 (not c!58685)) b!488110))

(assert (= (and b!488111 res!291278) b!488108))

(assert (= (or b!488108 b!488110) bm!31322))

(assert (=> b!488109 m!467689))

(assert (=> b!488109 m!467689))

(assert (=> b!488109 m!467711))

(declare-fun m!467871 () Bool)

(assert (=> bm!31322 m!467871))

(assert (=> b!488111 m!467689))

(declare-fun m!467873 () Bool)

(assert (=> b!488111 m!467873))

(declare-fun m!467875 () Bool)

(assert (=> b!488111 m!467875))

(assert (=> b!488111 m!467689))

(assert (=> b!488111 m!467709))

(assert (=> b!487913 d!77771))

(declare-fun d!77773 () Bool)

(assert (=> d!77773 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220303 () Unit!14260)

(declare-fun choose!38 (array!31596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14260)

(assert (=> d!77773 (= lt!220303 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77773 (validMask!0 mask!3524)))

(assert (=> d!77773 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220303)))

(declare-fun bs!15555 () Bool)

(assert (= bs!15555 d!77773))

(assert (=> bs!15555 m!467693))

(declare-fun m!467877 () Bool)

(assert (=> bs!15555 m!467877))

(assert (=> bs!15555 m!467699))

(assert (=> b!487913 d!77773))

(declare-fun d!77775 () Bool)

(declare-fun res!291283 () Bool)

(declare-fun e!287177 () Bool)

(assert (=> d!77775 (=> res!291283 e!287177)))

(assert (=> d!77775 (= res!291283 (= (select (arr!15190 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77775 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!287177)))

(declare-fun b!488116 () Bool)

(declare-fun e!287178 () Bool)

(assert (=> b!488116 (= e!287177 e!287178)))

(declare-fun res!291284 () Bool)

(assert (=> b!488116 (=> (not res!291284) (not e!287178))))

(assert (=> b!488116 (= res!291284 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15554 a!3235)))))

(declare-fun b!488117 () Bool)

(assert (=> b!488117 (= e!287178 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77775 (not res!291283)) b!488116))

(assert (= (and b!488116 res!291284) b!488117))

(assert (=> d!77775 m!467751))

(declare-fun m!467879 () Bool)

(assert (=> b!488117 m!467879))

(assert (=> b!487908 d!77775))

(declare-fun b!488118 () Bool)

(declare-fun e!287180 () SeekEntryResult!3657)

(declare-fun lt!220306 () SeekEntryResult!3657)

(assert (=> b!488118 (= e!287180 (MissingZero!3657 (index!16809 lt!220306)))))

(declare-fun d!77777 () Bool)

(declare-fun lt!220304 () SeekEntryResult!3657)

(assert (=> d!77777 (and (or ((_ is Undefined!3657) lt!220304) (not ((_ is Found!3657) lt!220304)) (and (bvsge (index!16808 lt!220304) #b00000000000000000000000000000000) (bvslt (index!16808 lt!220304) (size!15554 a!3235)))) (or ((_ is Undefined!3657) lt!220304) ((_ is Found!3657) lt!220304) (not ((_ is MissingZero!3657) lt!220304)) (and (bvsge (index!16807 lt!220304) #b00000000000000000000000000000000) (bvslt (index!16807 lt!220304) (size!15554 a!3235)))) (or ((_ is Undefined!3657) lt!220304) ((_ is Found!3657) lt!220304) ((_ is MissingZero!3657) lt!220304) (not ((_ is MissingVacant!3657) lt!220304)) (and (bvsge (index!16810 lt!220304) #b00000000000000000000000000000000) (bvslt (index!16810 lt!220304) (size!15554 a!3235)))) (or ((_ is Undefined!3657) lt!220304) (ite ((_ is Found!3657) lt!220304) (= (select (arr!15190 a!3235) (index!16808 lt!220304)) k0!2280) (ite ((_ is MissingZero!3657) lt!220304) (= (select (arr!15190 a!3235) (index!16807 lt!220304)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3657) lt!220304) (= (select (arr!15190 a!3235) (index!16810 lt!220304)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!287181 () SeekEntryResult!3657)

(assert (=> d!77777 (= lt!220304 e!287181)))

(declare-fun c!58686 () Bool)

(assert (=> d!77777 (= c!58686 (and ((_ is Intermediate!3657) lt!220306) (undefined!4469 lt!220306)))))

(assert (=> d!77777 (= lt!220306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77777 (validMask!0 mask!3524)))

(assert (=> d!77777 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!220304)))

(declare-fun b!488119 () Bool)

(declare-fun e!287179 () SeekEntryResult!3657)

(assert (=> b!488119 (= e!287181 e!287179)))

(declare-fun lt!220305 () (_ BitVec 64))

(assert (=> b!488119 (= lt!220305 (select (arr!15190 a!3235) (index!16809 lt!220306)))))

(declare-fun c!58688 () Bool)

(assert (=> b!488119 (= c!58688 (= lt!220305 k0!2280))))

(declare-fun b!488120 () Bool)

(assert (=> b!488120 (= e!287179 (Found!3657 (index!16809 lt!220306)))))

(declare-fun b!488121 () Bool)

(assert (=> b!488121 (= e!287180 (seekKeyOrZeroReturnVacant!0 (x!45925 lt!220306) (index!16809 lt!220306) (index!16809 lt!220306) k0!2280 a!3235 mask!3524))))

(declare-fun b!488122 () Bool)

(declare-fun c!58687 () Bool)

(assert (=> b!488122 (= c!58687 (= lt!220305 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!488122 (= e!287179 e!287180)))

(declare-fun b!488123 () Bool)

(assert (=> b!488123 (= e!287181 Undefined!3657)))

(assert (= (and d!77777 c!58686) b!488123))

(assert (= (and d!77777 (not c!58686)) b!488119))

(assert (= (and b!488119 c!58688) b!488120))

(assert (= (and b!488119 (not c!58688)) b!488122))

(assert (= (and b!488122 c!58687) b!488118))

(assert (= (and b!488122 (not c!58687)) b!488121))

(declare-fun m!467881 () Bool)

(assert (=> d!77777 m!467881))

(assert (=> d!77777 m!467699))

(declare-fun m!467883 () Bool)

(assert (=> d!77777 m!467883))

(declare-fun m!467885 () Bool)

(assert (=> d!77777 m!467885))

(declare-fun m!467887 () Bool)

(assert (=> d!77777 m!467887))

(assert (=> d!77777 m!467881))

(declare-fun m!467889 () Bool)

(assert (=> d!77777 m!467889))

(declare-fun m!467891 () Bool)

(assert (=> b!488119 m!467891))

(declare-fun m!467893 () Bool)

(assert (=> b!488121 m!467893))

(assert (=> b!487909 d!77777))

(check-sat (not b!487978) (not b!487979) (not b!488080) (not b!488044) (not b!488078) (not d!77719) (not b!487976) (not bm!31322) (not d!77773) (not b!488111) (not b!488117) (not d!77777) (not bm!31318) (not b!488121) (not b!488109) (not bm!31307))
(check-sat)
