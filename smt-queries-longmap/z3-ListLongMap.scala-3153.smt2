; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44378 () Bool)

(assert start!44378)

(declare-fun b!487817 () Bool)

(declare-fun res!291146 () Bool)

(declare-fun e!286989 () Bool)

(assert (=> b!487817 (=> (not res!291146) (not e!286989))))

(declare-datatypes ((array!31585 0))(
  ( (array!31586 (arr!15184 (Array (_ BitVec 32) (_ BitVec 64))) (size!15548 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31585)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31585 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487817 (= res!291146 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487818 () Bool)

(declare-fun res!291149 () Bool)

(assert (=> b!487818 (=> (not res!291149) (not e!286989))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487818 (= res!291149 (and (= (size!15548 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15548 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15548 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487819 () Bool)

(declare-fun res!291150 () Bool)

(assert (=> b!487819 (=> (not res!291150) (not e!286989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487819 (= res!291150 (validKeyInArray!0 k0!2280))))

(declare-fun b!487820 () Bool)

(declare-fun res!291145 () Bool)

(declare-fun e!286990 () Bool)

(assert (=> b!487820 (=> (not res!291145) (not e!286990))))

(declare-datatypes ((List!9249 0))(
  ( (Nil!9246) (Cons!9245 (h!10101 (_ BitVec 64)) (t!15469 List!9249)) )
))
(declare-fun arrayNoDuplicates!0 (array!31585 (_ BitVec 32) List!9249) Bool)

(assert (=> b!487820 (= res!291145 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9246))))

(declare-fun b!487821 () Bool)

(declare-fun res!291151 () Bool)

(assert (=> b!487821 (=> (not res!291151) (not e!286990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31585 (_ BitVec 32)) Bool)

(assert (=> b!487821 (= res!291151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!291143 () Bool)

(assert (=> start!44378 (=> (not res!291143) (not e!286989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44378 (= res!291143 (validMask!0 mask!3524))))

(assert (=> start!44378 e!286989))

(assert (=> start!44378 true))

(declare-fun array_inv!11043 (array!31585) Bool)

(assert (=> start!44378 (array_inv!11043 a!3235)))

(declare-fun b!487822 () Bool)

(declare-fun lt!220201 () (_ BitVec 32))

(assert (=> b!487822 (= e!286990 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (and (bvsge lt!220201 #b00000000000000000000000000000000) (bvslt lt!220201 (bvadd #b00000000000000000000000000000001 mask!3524))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487822 (= lt!220201 (toIndex!0 (select (arr!15184 a!3235) j!176) mask!3524))))

(declare-fun e!286991 () Bool)

(assert (=> b!487822 e!286991))

(declare-fun res!291144 () Bool)

(assert (=> b!487822 (=> (not res!291144) (not e!286991))))

(assert (=> b!487822 (= res!291144 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14221 0))(
  ( (Unit!14222) )
))
(declare-fun lt!220200 () Unit!14221)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31585 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14221)

(assert (=> b!487822 (= lt!220200 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487823 () Bool)

(declare-datatypes ((SeekEntryResult!3607 0))(
  ( (MissingZero!3607 (index!16607 (_ BitVec 32))) (Found!3607 (index!16608 (_ BitVec 32))) (Intermediate!3607 (undefined!4419 Bool) (index!16609 (_ BitVec 32)) (x!45872 (_ BitVec 32))) (Undefined!3607) (MissingVacant!3607 (index!16610 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31585 (_ BitVec 32)) SeekEntryResult!3607)

(assert (=> b!487823 (= e!286991 (= (seekEntryOrOpen!0 (select (arr!15184 a!3235) j!176) a!3235 mask!3524) (Found!3607 j!176)))))

(declare-fun b!487824 () Bool)

(assert (=> b!487824 (= e!286989 e!286990)))

(declare-fun res!291148 () Bool)

(assert (=> b!487824 (=> (not res!291148) (not e!286990))))

(declare-fun lt!220199 () SeekEntryResult!3607)

(assert (=> b!487824 (= res!291148 (or (= lt!220199 (MissingZero!3607 i!1204)) (= lt!220199 (MissingVacant!3607 i!1204))))))

(assert (=> b!487824 (= lt!220199 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487825 () Bool)

(declare-fun res!291147 () Bool)

(assert (=> b!487825 (=> (not res!291147) (not e!286989))))

(assert (=> b!487825 (= res!291147 (validKeyInArray!0 (select (arr!15184 a!3235) j!176)))))

(assert (= (and start!44378 res!291143) b!487818))

(assert (= (and b!487818 res!291149) b!487825))

(assert (= (and b!487825 res!291147) b!487819))

(assert (= (and b!487819 res!291150) b!487817))

(assert (= (and b!487817 res!291146) b!487824))

(assert (= (and b!487824 res!291148) b!487821))

(assert (= (and b!487821 res!291151) b!487820))

(assert (= (and b!487820 res!291145) b!487822))

(assert (= (and b!487822 res!291144) b!487823))

(declare-fun m!467845 () Bool)

(assert (=> b!487825 m!467845))

(assert (=> b!487825 m!467845))

(declare-fun m!467847 () Bool)

(assert (=> b!487825 m!467847))

(assert (=> b!487823 m!467845))

(assert (=> b!487823 m!467845))

(declare-fun m!467849 () Bool)

(assert (=> b!487823 m!467849))

(declare-fun m!467851 () Bool)

(assert (=> start!44378 m!467851))

(declare-fun m!467853 () Bool)

(assert (=> start!44378 m!467853))

(declare-fun m!467855 () Bool)

(assert (=> b!487817 m!467855))

(declare-fun m!467857 () Bool)

(assert (=> b!487819 m!467857))

(assert (=> b!487822 m!467845))

(assert (=> b!487822 m!467845))

(declare-fun m!467859 () Bool)

(assert (=> b!487822 m!467859))

(declare-fun m!467861 () Bool)

(assert (=> b!487822 m!467861))

(declare-fun m!467863 () Bool)

(assert (=> b!487822 m!467863))

(declare-fun m!467865 () Bool)

(assert (=> b!487820 m!467865))

(declare-fun m!467867 () Bool)

(assert (=> b!487824 m!467867))

(declare-fun m!467869 () Bool)

(assert (=> b!487821 m!467869))

(check-sat (not b!487821) (not b!487824) (not start!44378) (not b!487819) (not b!487817) (not b!487820) (not b!487823) (not b!487825) (not b!487822))
(check-sat)
(get-model)

(declare-fun d!77741 () Bool)

(declare-fun res!291210 () Bool)

(declare-fun e!287021 () Bool)

(assert (=> d!77741 (=> res!291210 e!287021)))

(assert (=> d!77741 (= res!291210 (= (select (arr!15184 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77741 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!287021)))

(declare-fun b!487884 () Bool)

(declare-fun e!287022 () Bool)

(assert (=> b!487884 (= e!287021 e!287022)))

(declare-fun res!291211 () Bool)

(assert (=> b!487884 (=> (not res!291211) (not e!287022))))

(assert (=> b!487884 (= res!291211 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15548 a!3235)))))

(declare-fun b!487885 () Bool)

(assert (=> b!487885 (= e!287022 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77741 (not res!291210)) b!487884))

(assert (= (and b!487884 res!291211) b!487885))

(declare-fun m!467923 () Bool)

(assert (=> d!77741 m!467923))

(declare-fun m!467925 () Bool)

(assert (=> b!487885 m!467925))

(assert (=> b!487817 d!77741))

(declare-fun b!487911 () Bool)

(declare-fun e!287039 () SeekEntryResult!3607)

(declare-fun e!287038 () SeekEntryResult!3607)

(assert (=> b!487911 (= e!287039 e!287038)))

(declare-fun lt!220241 () (_ BitVec 64))

(declare-fun lt!220242 () SeekEntryResult!3607)

(assert (=> b!487911 (= lt!220241 (select (arr!15184 a!3235) (index!16609 lt!220242)))))

(declare-fun c!58616 () Bool)

(assert (=> b!487911 (= c!58616 (= lt!220241 (select (arr!15184 a!3235) j!176)))))

(declare-fun b!487912 () Bool)

(declare-fun c!58615 () Bool)

(assert (=> b!487912 (= c!58615 (= lt!220241 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!287040 () SeekEntryResult!3607)

(assert (=> b!487912 (= e!287038 e!287040)))

(declare-fun b!487913 () Bool)

(assert (=> b!487913 (= e!287040 (MissingZero!3607 (index!16609 lt!220242)))))

(declare-fun b!487914 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31585 (_ BitVec 32)) SeekEntryResult!3607)

(assert (=> b!487914 (= e!287040 (seekKeyOrZeroReturnVacant!0 (x!45872 lt!220242) (index!16609 lt!220242) (index!16609 lt!220242) (select (arr!15184 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!487915 () Bool)

(assert (=> b!487915 (= e!287039 Undefined!3607)))

(declare-fun d!77743 () Bool)

(declare-fun lt!220243 () SeekEntryResult!3607)

(get-info :version)

(assert (=> d!77743 (and (or ((_ is Undefined!3607) lt!220243) (not ((_ is Found!3607) lt!220243)) (and (bvsge (index!16608 lt!220243) #b00000000000000000000000000000000) (bvslt (index!16608 lt!220243) (size!15548 a!3235)))) (or ((_ is Undefined!3607) lt!220243) ((_ is Found!3607) lt!220243) (not ((_ is MissingZero!3607) lt!220243)) (and (bvsge (index!16607 lt!220243) #b00000000000000000000000000000000) (bvslt (index!16607 lt!220243) (size!15548 a!3235)))) (or ((_ is Undefined!3607) lt!220243) ((_ is Found!3607) lt!220243) ((_ is MissingZero!3607) lt!220243) (not ((_ is MissingVacant!3607) lt!220243)) (and (bvsge (index!16610 lt!220243) #b00000000000000000000000000000000) (bvslt (index!16610 lt!220243) (size!15548 a!3235)))) (or ((_ is Undefined!3607) lt!220243) (ite ((_ is Found!3607) lt!220243) (= (select (arr!15184 a!3235) (index!16608 lt!220243)) (select (arr!15184 a!3235) j!176)) (ite ((_ is MissingZero!3607) lt!220243) (= (select (arr!15184 a!3235) (index!16607 lt!220243)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3607) lt!220243) (= (select (arr!15184 a!3235) (index!16610 lt!220243)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77743 (= lt!220243 e!287039)))

(declare-fun c!58614 () Bool)

(assert (=> d!77743 (= c!58614 (and ((_ is Intermediate!3607) lt!220242) (undefined!4419 lt!220242)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31585 (_ BitVec 32)) SeekEntryResult!3607)

(assert (=> d!77743 (= lt!220242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15184 a!3235) j!176) mask!3524) (select (arr!15184 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77743 (validMask!0 mask!3524)))

(assert (=> d!77743 (= (seekEntryOrOpen!0 (select (arr!15184 a!3235) j!176) a!3235 mask!3524) lt!220243)))

(declare-fun b!487910 () Bool)

(assert (=> b!487910 (= e!287038 (Found!3607 (index!16609 lt!220242)))))

(assert (= (and d!77743 c!58614) b!487915))

(assert (= (and d!77743 (not c!58614)) b!487911))

(assert (= (and b!487911 c!58616) b!487910))

(assert (= (and b!487911 (not c!58616)) b!487912))

(assert (= (and b!487912 c!58615) b!487913))

(assert (= (and b!487912 (not c!58615)) b!487914))

(declare-fun m!467933 () Bool)

(assert (=> b!487911 m!467933))

(assert (=> b!487914 m!467845))

(declare-fun m!467935 () Bool)

(assert (=> b!487914 m!467935))

(assert (=> d!77743 m!467845))

(assert (=> d!77743 m!467859))

(declare-fun m!467937 () Bool)

(assert (=> d!77743 m!467937))

(declare-fun m!467939 () Bool)

(assert (=> d!77743 m!467939))

(assert (=> d!77743 m!467859))

(assert (=> d!77743 m!467845))

(declare-fun m!467941 () Bool)

(assert (=> d!77743 m!467941))

(declare-fun m!467943 () Bool)

(assert (=> d!77743 m!467943))

(assert (=> d!77743 m!467851))

(assert (=> b!487823 d!77743))

(declare-fun b!487917 () Bool)

(declare-fun e!287042 () SeekEntryResult!3607)

(declare-fun e!287041 () SeekEntryResult!3607)

(assert (=> b!487917 (= e!287042 e!287041)))

(declare-fun lt!220244 () (_ BitVec 64))

(declare-fun lt!220245 () SeekEntryResult!3607)

(assert (=> b!487917 (= lt!220244 (select (arr!15184 a!3235) (index!16609 lt!220245)))))

(declare-fun c!58619 () Bool)

(assert (=> b!487917 (= c!58619 (= lt!220244 k0!2280))))

(declare-fun b!487918 () Bool)

(declare-fun c!58618 () Bool)

(assert (=> b!487918 (= c!58618 (= lt!220244 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!287043 () SeekEntryResult!3607)

(assert (=> b!487918 (= e!287041 e!287043)))

(declare-fun b!487919 () Bool)

(assert (=> b!487919 (= e!287043 (MissingZero!3607 (index!16609 lt!220245)))))

(declare-fun b!487920 () Bool)

(assert (=> b!487920 (= e!287043 (seekKeyOrZeroReturnVacant!0 (x!45872 lt!220245) (index!16609 lt!220245) (index!16609 lt!220245) k0!2280 a!3235 mask!3524))))

(declare-fun b!487921 () Bool)

(assert (=> b!487921 (= e!287042 Undefined!3607)))

(declare-fun d!77761 () Bool)

(declare-fun lt!220246 () SeekEntryResult!3607)

(assert (=> d!77761 (and (or ((_ is Undefined!3607) lt!220246) (not ((_ is Found!3607) lt!220246)) (and (bvsge (index!16608 lt!220246) #b00000000000000000000000000000000) (bvslt (index!16608 lt!220246) (size!15548 a!3235)))) (or ((_ is Undefined!3607) lt!220246) ((_ is Found!3607) lt!220246) (not ((_ is MissingZero!3607) lt!220246)) (and (bvsge (index!16607 lt!220246) #b00000000000000000000000000000000) (bvslt (index!16607 lt!220246) (size!15548 a!3235)))) (or ((_ is Undefined!3607) lt!220246) ((_ is Found!3607) lt!220246) ((_ is MissingZero!3607) lt!220246) (not ((_ is MissingVacant!3607) lt!220246)) (and (bvsge (index!16610 lt!220246) #b00000000000000000000000000000000) (bvslt (index!16610 lt!220246) (size!15548 a!3235)))) (or ((_ is Undefined!3607) lt!220246) (ite ((_ is Found!3607) lt!220246) (= (select (arr!15184 a!3235) (index!16608 lt!220246)) k0!2280) (ite ((_ is MissingZero!3607) lt!220246) (= (select (arr!15184 a!3235) (index!16607 lt!220246)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3607) lt!220246) (= (select (arr!15184 a!3235) (index!16610 lt!220246)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77761 (= lt!220246 e!287042)))

(declare-fun c!58617 () Bool)

(assert (=> d!77761 (= c!58617 (and ((_ is Intermediate!3607) lt!220245) (undefined!4419 lt!220245)))))

(assert (=> d!77761 (= lt!220245 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77761 (validMask!0 mask!3524)))

(assert (=> d!77761 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!220246)))

(declare-fun b!487916 () Bool)

(assert (=> b!487916 (= e!287041 (Found!3607 (index!16609 lt!220245)))))

(assert (= (and d!77761 c!58617) b!487921))

(assert (= (and d!77761 (not c!58617)) b!487917))

(assert (= (and b!487917 c!58619) b!487916))

(assert (= (and b!487917 (not c!58619)) b!487918))

(assert (= (and b!487918 c!58618) b!487919))

(assert (= (and b!487918 (not c!58618)) b!487920))

(declare-fun m!467945 () Bool)

(assert (=> b!487917 m!467945))

(declare-fun m!467947 () Bool)

(assert (=> b!487920 m!467947))

(declare-fun m!467949 () Bool)

(assert (=> d!77761 m!467949))

(declare-fun m!467951 () Bool)

(assert (=> d!77761 m!467951))

(declare-fun m!467953 () Bool)

(assert (=> d!77761 m!467953))

(assert (=> d!77761 m!467949))

(declare-fun m!467955 () Bool)

(assert (=> d!77761 m!467955))

(declare-fun m!467957 () Bool)

(assert (=> d!77761 m!467957))

(assert (=> d!77761 m!467851))

(assert (=> b!487824 d!77761))

(declare-fun d!77763 () Bool)

(assert (=> d!77763 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44378 d!77763))

(declare-fun d!77769 () Bool)

(assert (=> d!77769 (= (array_inv!11043 a!3235) (bvsge (size!15548 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44378 d!77769))

(declare-fun d!77771 () Bool)

(assert (=> d!77771 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487819 d!77771))

(declare-fun b!487969 () Bool)

(declare-fun e!287076 () Bool)

(declare-fun call!31300 () Bool)

(assert (=> b!487969 (= e!287076 call!31300)))

(declare-fun b!487970 () Bool)

(assert (=> b!487970 (= e!287076 call!31300)))

(declare-fun bm!31297 () Bool)

(declare-fun c!58635 () Bool)

(assert (=> bm!31297 (= call!31300 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58635 (Cons!9245 (select (arr!15184 a!3235) #b00000000000000000000000000000000) Nil!9246) Nil!9246)))))

(declare-fun b!487971 () Bool)

(declare-fun e!287078 () Bool)

(declare-fun e!287079 () Bool)

(assert (=> b!487971 (= e!287078 e!287079)))

(declare-fun res!291239 () Bool)

(assert (=> b!487971 (=> (not res!291239) (not e!287079))))

(declare-fun e!287077 () Bool)

(assert (=> b!487971 (= res!291239 (not e!287077))))

(declare-fun res!291238 () Bool)

(assert (=> b!487971 (=> (not res!291238) (not e!287077))))

(assert (=> b!487971 (= res!291238 (validKeyInArray!0 (select (arr!15184 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77775 () Bool)

(declare-fun res!291237 () Bool)

(assert (=> d!77775 (=> res!291237 e!287078)))

(assert (=> d!77775 (= res!291237 (bvsge #b00000000000000000000000000000000 (size!15548 a!3235)))))

(assert (=> d!77775 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9246) e!287078)))

(declare-fun b!487972 () Bool)

(assert (=> b!487972 (= e!287079 e!287076)))

(assert (=> b!487972 (= c!58635 (validKeyInArray!0 (select (arr!15184 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!487973 () Bool)

(declare-fun contains!2677 (List!9249 (_ BitVec 64)) Bool)

(assert (=> b!487973 (= e!287077 (contains!2677 Nil!9246 (select (arr!15184 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!77775 (not res!291237)) b!487971))

(assert (= (and b!487971 res!291238) b!487973))

(assert (= (and b!487971 res!291239) b!487972))

(assert (= (and b!487972 c!58635) b!487969))

(assert (= (and b!487972 (not c!58635)) b!487970))

(assert (= (or b!487969 b!487970) bm!31297))

(assert (=> bm!31297 m!467923))

(declare-fun m!467989 () Bool)

(assert (=> bm!31297 m!467989))

(assert (=> b!487971 m!467923))

(assert (=> b!487971 m!467923))

(declare-fun m!467991 () Bool)

(assert (=> b!487971 m!467991))

(assert (=> b!487972 m!467923))

(assert (=> b!487972 m!467923))

(assert (=> b!487972 m!467991))

(assert (=> b!487973 m!467923))

(assert (=> b!487973 m!467923))

(declare-fun m!467993 () Bool)

(assert (=> b!487973 m!467993))

(assert (=> b!487820 d!77775))

(declare-fun d!77779 () Bool)

(assert (=> d!77779 (= (validKeyInArray!0 (select (arr!15184 a!3235) j!176)) (and (not (= (select (arr!15184 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15184 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487825 d!77779))

(declare-fun b!487996 () Bool)

(declare-fun e!287098 () Bool)

(declare-fun call!31305 () Bool)

(assert (=> b!487996 (= e!287098 call!31305)))

(declare-fun d!77781 () Bool)

(declare-fun res!291255 () Bool)

(declare-fun e!287099 () Bool)

(assert (=> d!77781 (=> res!291255 e!287099)))

(assert (=> d!77781 (= res!291255 (bvsge #b00000000000000000000000000000000 (size!15548 a!3235)))))

(assert (=> d!77781 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!287099)))

(declare-fun b!487997 () Bool)

(declare-fun e!287100 () Bool)

(assert (=> b!487997 (= e!287099 e!287100)))

(declare-fun c!58640 () Bool)

(assert (=> b!487997 (= c!58640 (validKeyInArray!0 (select (arr!15184 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!487998 () Bool)

(assert (=> b!487998 (= e!287100 e!287098)))

(declare-fun lt!220282 () (_ BitVec 64))

(assert (=> b!487998 (= lt!220282 (select (arr!15184 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220280 () Unit!14221)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31585 (_ BitVec 64) (_ BitVec 32)) Unit!14221)

(assert (=> b!487998 (= lt!220280 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220282 #b00000000000000000000000000000000))))

(assert (=> b!487998 (arrayContainsKey!0 a!3235 lt!220282 #b00000000000000000000000000000000)))

(declare-fun lt!220281 () Unit!14221)

(assert (=> b!487998 (= lt!220281 lt!220280)))

(declare-fun res!291254 () Bool)

(assert (=> b!487998 (= res!291254 (= (seekEntryOrOpen!0 (select (arr!15184 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3607 #b00000000000000000000000000000000)))))

(assert (=> b!487998 (=> (not res!291254) (not e!287098))))

(declare-fun b!487999 () Bool)

(assert (=> b!487999 (= e!287100 call!31305)))

(declare-fun bm!31302 () Bool)

(assert (=> bm!31302 (= call!31305 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!77781 (not res!291255)) b!487997))

(assert (= (and b!487997 c!58640) b!487998))

(assert (= (and b!487997 (not c!58640)) b!487999))

(assert (= (and b!487998 res!291254) b!487996))

(assert (= (or b!487996 b!487999) bm!31302))

(assert (=> b!487997 m!467923))

(assert (=> b!487997 m!467923))

(assert (=> b!487997 m!467991))

(assert (=> b!487998 m!467923))

(declare-fun m!467997 () Bool)

(assert (=> b!487998 m!467997))

(declare-fun m!467999 () Bool)

(assert (=> b!487998 m!467999))

(assert (=> b!487998 m!467923))

(declare-fun m!468001 () Bool)

(assert (=> b!487998 m!468001))

(declare-fun m!468003 () Bool)

(assert (=> bm!31302 m!468003))

(assert (=> b!487821 d!77781))

(declare-fun d!77791 () Bool)

(declare-fun lt!220291 () (_ BitVec 32))

(declare-fun lt!220290 () (_ BitVec 32))

(assert (=> d!77791 (= lt!220291 (bvmul (bvxor lt!220290 (bvlshr lt!220290 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!77791 (= lt!220290 ((_ extract 31 0) (bvand (bvxor (select (arr!15184 a!3235) j!176) (bvlshr (select (arr!15184 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!77791 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!291256 (let ((h!10106 ((_ extract 31 0) (bvand (bvxor (select (arr!15184 a!3235) j!176) (bvlshr (select (arr!15184 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!45877 (bvmul (bvxor h!10106 (bvlshr h!10106 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!45877 (bvlshr x!45877 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!291256 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!291256 #b00000000000000000000000000000000))))))

(assert (=> d!77791 (= (toIndex!0 (select (arr!15184 a!3235) j!176) mask!3524) (bvand (bvxor lt!220291 (bvlshr lt!220291 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!487822 d!77791))

(declare-fun b!488004 () Bool)

(declare-fun e!287104 () Bool)

(declare-fun call!31307 () Bool)

(assert (=> b!488004 (= e!287104 call!31307)))

(declare-fun d!77795 () Bool)

(declare-fun res!291260 () Bool)

(declare-fun e!287105 () Bool)

(assert (=> d!77795 (=> res!291260 e!287105)))

(assert (=> d!77795 (= res!291260 (bvsge j!176 (size!15548 a!3235)))))

(assert (=> d!77795 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!287105)))

(declare-fun b!488005 () Bool)

(declare-fun e!287106 () Bool)

(assert (=> b!488005 (= e!287105 e!287106)))

(declare-fun c!58642 () Bool)

(assert (=> b!488005 (= c!58642 (validKeyInArray!0 (select (arr!15184 a!3235) j!176)))))

(declare-fun b!488006 () Bool)

(assert (=> b!488006 (= e!287106 e!287104)))

(declare-fun lt!220294 () (_ BitVec 64))

(assert (=> b!488006 (= lt!220294 (select (arr!15184 a!3235) j!176))))

(declare-fun lt!220292 () Unit!14221)

(assert (=> b!488006 (= lt!220292 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220294 j!176))))

(assert (=> b!488006 (arrayContainsKey!0 a!3235 lt!220294 #b00000000000000000000000000000000)))

(declare-fun lt!220293 () Unit!14221)

(assert (=> b!488006 (= lt!220293 lt!220292)))

(declare-fun res!291259 () Bool)

(assert (=> b!488006 (= res!291259 (= (seekEntryOrOpen!0 (select (arr!15184 a!3235) j!176) a!3235 mask!3524) (Found!3607 j!176)))))

(assert (=> b!488006 (=> (not res!291259) (not e!287104))))

(declare-fun b!488007 () Bool)

(assert (=> b!488007 (= e!287106 call!31307)))

(declare-fun bm!31304 () Bool)

(assert (=> bm!31304 (= call!31307 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!77795 (not res!291260)) b!488005))

(assert (= (and b!488005 c!58642) b!488006))

(assert (= (and b!488005 (not c!58642)) b!488007))

(assert (= (and b!488006 res!291259) b!488004))

(assert (= (or b!488004 b!488007) bm!31304))

(assert (=> b!488005 m!467845))

(assert (=> b!488005 m!467845))

(assert (=> b!488005 m!467847))

(assert (=> b!488006 m!467845))

(declare-fun m!468011 () Bool)

(assert (=> b!488006 m!468011))

(declare-fun m!468013 () Bool)

(assert (=> b!488006 m!468013))

(assert (=> b!488006 m!467845))

(assert (=> b!488006 m!467849))

(declare-fun m!468015 () Bool)

(assert (=> bm!31304 m!468015))

(assert (=> b!487822 d!77795))

(declare-fun d!77797 () Bool)

(assert (=> d!77797 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220303 () Unit!14221)

(declare-fun choose!38 (array!31585 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14221)

(assert (=> d!77797 (= lt!220303 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77797 (validMask!0 mask!3524)))

(assert (=> d!77797 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220303)))

(declare-fun bs!15571 () Bool)

(assert (= bs!15571 d!77797))

(assert (=> bs!15571 m!467861))

(declare-fun m!468031 () Bool)

(assert (=> bs!15571 m!468031))

(assert (=> bs!15571 m!467851))

(assert (=> b!487822 d!77797))

(check-sat (not d!77743) (not bm!31302) (not b!487972) (not b!487997) (not b!488006) (not b!487914) (not d!77761) (not bm!31297) (not b!487973) (not bm!31304) (not b!487998) (not b!488005) (not b!487885) (not d!77797) (not b!487920) (not b!487971))
(check-sat)
