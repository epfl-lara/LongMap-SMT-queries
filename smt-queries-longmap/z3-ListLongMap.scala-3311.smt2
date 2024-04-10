; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45812 () Bool)

(assert start!45812)

(declare-fun b!507181 () Bool)

(declare-fun res!308150 () Bool)

(declare-fun e!296822 () Bool)

(assert (=> b!507181 (=> (not res!308150) (not e!296822))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32568 0))(
  ( (array!32569 (arr!15664 (Array (_ BitVec 32) (_ BitVec 64))) (size!16028 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32568)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507181 (= res!308150 (and (= (size!16028 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16028 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16028 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!308147 () Bool)

(assert (=> start!45812 (=> (not res!308147) (not e!296822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45812 (= res!308147 (validMask!0 mask!3524))))

(assert (=> start!45812 e!296822))

(assert (=> start!45812 true))

(declare-fun array_inv!11460 (array!32568) Bool)

(assert (=> start!45812 (array_inv!11460 a!3235)))

(declare-fun b!507182 () Bool)

(declare-fun e!296826 () Bool)

(assert (=> b!507182 (= e!296826 true)))

(declare-datatypes ((SeekEntryResult!4131 0))(
  ( (MissingZero!4131 (index!18712 (_ BitVec 32))) (Found!4131 (index!18713 (_ BitVec 32))) (Intermediate!4131 (undefined!4943 Bool) (index!18714 (_ BitVec 32)) (x!47708 (_ BitVec 32))) (Undefined!4131) (MissingVacant!4131 (index!18715 (_ BitVec 32))) )
))
(declare-fun lt!231518 () SeekEntryResult!4131)

(declare-fun lt!231512 () array!32568)

(declare-fun lt!231513 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32568 (_ BitVec 32)) SeekEntryResult!4131)

(assert (=> b!507182 (= lt!231518 (seekEntryOrOpen!0 lt!231513 lt!231512 mask!3524))))

(assert (=> b!507182 false))

(declare-fun b!507183 () Bool)

(declare-fun e!296824 () Bool)

(assert (=> b!507183 (= e!296822 e!296824)))

(declare-fun res!308148 () Bool)

(assert (=> b!507183 (=> (not res!308148) (not e!296824))))

(declare-fun lt!231516 () SeekEntryResult!4131)

(assert (=> b!507183 (= res!308148 (or (= lt!231516 (MissingZero!4131 i!1204)) (= lt!231516 (MissingVacant!4131 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!507183 (= lt!231516 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507184 () Bool)

(declare-fun res!308141 () Bool)

(assert (=> b!507184 (=> (not res!308141) (not e!296822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507184 (= res!308141 (validKeyInArray!0 (select (arr!15664 a!3235) j!176)))))

(declare-fun b!507185 () Bool)

(declare-fun e!296825 () Bool)

(assert (=> b!507185 (= e!296824 (not e!296825))))

(declare-fun res!308143 () Bool)

(assert (=> b!507185 (=> res!308143 e!296825)))

(declare-fun lt!231520 () (_ BitVec 32))

(declare-fun lt!231517 () SeekEntryResult!4131)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32568 (_ BitVec 32)) SeekEntryResult!4131)

(assert (=> b!507185 (= res!308143 (= lt!231517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231520 lt!231513 lt!231512 mask!3524)))))

(declare-fun lt!231515 () (_ BitVec 32))

(assert (=> b!507185 (= lt!231517 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231515 (select (arr!15664 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507185 (= lt!231520 (toIndex!0 lt!231513 mask!3524))))

(assert (=> b!507185 (= lt!231513 (select (store (arr!15664 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507185 (= lt!231515 (toIndex!0 (select (arr!15664 a!3235) j!176) mask!3524))))

(assert (=> b!507185 (= lt!231512 (array!32569 (store (arr!15664 a!3235) i!1204 k0!2280) (size!16028 a!3235)))))

(declare-fun e!296821 () Bool)

(assert (=> b!507185 e!296821))

(declare-fun res!308142 () Bool)

(assert (=> b!507185 (=> (not res!308142) (not e!296821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32568 (_ BitVec 32)) Bool)

(assert (=> b!507185 (= res!308142 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15550 0))(
  ( (Unit!15551) )
))
(declare-fun lt!231519 () Unit!15550)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15550)

(assert (=> b!507185 (= lt!231519 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507186 () Bool)

(declare-fun res!308146 () Bool)

(assert (=> b!507186 (=> (not res!308146) (not e!296824))))

(assert (=> b!507186 (= res!308146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507187 () Bool)

(assert (=> b!507187 (= e!296821 (= (seekEntryOrOpen!0 (select (arr!15664 a!3235) j!176) a!3235 mask!3524) (Found!4131 j!176)))))

(declare-fun b!507188 () Bool)

(declare-fun res!308149 () Bool)

(assert (=> b!507188 (=> (not res!308149) (not e!296822))))

(assert (=> b!507188 (= res!308149 (validKeyInArray!0 k0!2280))))

(declare-fun b!507189 () Bool)

(declare-fun res!308144 () Bool)

(assert (=> b!507189 (=> (not res!308144) (not e!296824))))

(declare-datatypes ((List!9822 0))(
  ( (Nil!9819) (Cons!9818 (h!10695 (_ BitVec 64)) (t!16050 List!9822)) )
))
(declare-fun arrayNoDuplicates!0 (array!32568 (_ BitVec 32) List!9822) Bool)

(assert (=> b!507189 (= res!308144 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9819))))

(declare-fun b!507190 () Bool)

(assert (=> b!507190 (= e!296825 e!296826)))

(declare-fun res!308140 () Bool)

(assert (=> b!507190 (=> res!308140 e!296826)))

(declare-fun lt!231514 () Bool)

(assert (=> b!507190 (= res!308140 (or (and (not lt!231514) (undefined!4943 lt!231517)) (and (not lt!231514) (not (undefined!4943 lt!231517)))))))

(get-info :version)

(assert (=> b!507190 (= lt!231514 (not ((_ is Intermediate!4131) lt!231517)))))

(declare-fun b!507191 () Bool)

(declare-fun res!308145 () Bool)

(assert (=> b!507191 (=> (not res!308145) (not e!296822))))

(declare-fun arrayContainsKey!0 (array!32568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507191 (= res!308145 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45812 res!308147) b!507181))

(assert (= (and b!507181 res!308150) b!507184))

(assert (= (and b!507184 res!308141) b!507188))

(assert (= (and b!507188 res!308149) b!507191))

(assert (= (and b!507191 res!308145) b!507183))

(assert (= (and b!507183 res!308148) b!507186))

(assert (= (and b!507186 res!308146) b!507189))

(assert (= (and b!507189 res!308144) b!507185))

(assert (= (and b!507185 res!308142) b!507187))

(assert (= (and b!507185 (not res!308143)) b!507190))

(assert (= (and b!507190 (not res!308140)) b!507182))

(declare-fun m!487913 () Bool)

(assert (=> b!507188 m!487913))

(declare-fun m!487915 () Bool)

(assert (=> b!507182 m!487915))

(declare-fun m!487917 () Bool)

(assert (=> b!507184 m!487917))

(assert (=> b!507184 m!487917))

(declare-fun m!487919 () Bool)

(assert (=> b!507184 m!487919))

(declare-fun m!487921 () Bool)

(assert (=> b!507189 m!487921))

(declare-fun m!487923 () Bool)

(assert (=> b!507183 m!487923))

(declare-fun m!487925 () Bool)

(assert (=> start!45812 m!487925))

(declare-fun m!487927 () Bool)

(assert (=> start!45812 m!487927))

(declare-fun m!487929 () Bool)

(assert (=> b!507191 m!487929))

(assert (=> b!507185 m!487917))

(declare-fun m!487931 () Bool)

(assert (=> b!507185 m!487931))

(declare-fun m!487933 () Bool)

(assert (=> b!507185 m!487933))

(declare-fun m!487935 () Bool)

(assert (=> b!507185 m!487935))

(declare-fun m!487937 () Bool)

(assert (=> b!507185 m!487937))

(declare-fun m!487939 () Bool)

(assert (=> b!507185 m!487939))

(assert (=> b!507185 m!487917))

(declare-fun m!487941 () Bool)

(assert (=> b!507185 m!487941))

(assert (=> b!507185 m!487917))

(declare-fun m!487943 () Bool)

(assert (=> b!507185 m!487943))

(declare-fun m!487945 () Bool)

(assert (=> b!507185 m!487945))

(assert (=> b!507187 m!487917))

(assert (=> b!507187 m!487917))

(declare-fun m!487947 () Bool)

(assert (=> b!507187 m!487947))

(declare-fun m!487949 () Bool)

(assert (=> b!507186 m!487949))

(check-sat (not b!507183) (not b!507187) (not b!507185) (not b!507182) (not b!507186) (not start!45812) (not b!507188) (not b!507191) (not b!507184) (not b!507189))
(check-sat)
