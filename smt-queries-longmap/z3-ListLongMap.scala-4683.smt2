; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65138 () Bool)

(assert start!65138)

(declare-fun b!736218 () Bool)

(declare-fun res!494855 () Bool)

(declare-fun e!411840 () Bool)

(assert (=> b!736218 (=> (not res!494855) (not e!411840))))

(declare-fun e!411839 () Bool)

(assert (=> b!736218 (= res!494855 e!411839)))

(declare-fun c!81071 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736218 (= c!81071 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736219 () Bool)

(declare-fun e!411844 () Bool)

(declare-fun e!411834 () Bool)

(assert (=> b!736219 (= e!411844 e!411834)))

(declare-fun res!494840 () Bool)

(assert (=> b!736219 (=> (not res!494840) (not e!411834))))

(declare-datatypes ((SeekEntryResult!7375 0))(
  ( (MissingZero!7375 (index!31868 (_ BitVec 32))) (Found!7375 (index!31869 (_ BitVec 32))) (Intermediate!7375 (undefined!8187 Bool) (index!31870 (_ BitVec 32)) (x!62880 (_ BitVec 32))) (Undefined!7375) (MissingVacant!7375 (index!31871 (_ BitVec 32))) )
))
(declare-fun lt!326378 () SeekEntryResult!7375)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736219 (= res!494840 (or (= lt!326378 (MissingZero!7375 i!1173)) (= lt!326378 (MissingVacant!7375 i!1173))))))

(declare-datatypes ((array!41328 0))(
  ( (array!41329 (arr!19778 (Array (_ BitVec 32) (_ BitVec 64))) (size!20199 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41328)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41328 (_ BitVec 32)) SeekEntryResult!7375)

(assert (=> b!736219 (= lt!326378 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!736220 () Bool)

(declare-datatypes ((Unit!25076 0))(
  ( (Unit!25077) )
))
(declare-fun e!411841 () Unit!25076)

(declare-fun Unit!25078 () Unit!25076)

(assert (=> b!736220 (= e!411841 Unit!25078)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!326381 () SeekEntryResult!7375)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41328 (_ BitVec 32)) SeekEntryResult!7375)

(assert (=> b!736220 (= lt!326381 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19778 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!326376 () (_ BitVec 32))

(declare-fun lt!326384 () SeekEntryResult!7375)

(assert (=> b!736220 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326376 resIntermediateIndex!5 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326384)))

(declare-fun b!736221 () Bool)

(declare-fun lt!326385 () SeekEntryResult!7375)

(declare-fun e!411838 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41328 (_ BitVec 32)) SeekEntryResult!7375)

(assert (=> b!736221 (= e!411838 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326376 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326385)))))

(declare-fun b!736222 () Bool)

(assert (=> b!736222 (= e!411834 e!411840)))

(declare-fun res!494848 () Bool)

(assert (=> b!736222 (=> (not res!494848) (not e!411840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736222 (= res!494848 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19778 a!3186) j!159) mask!3328) (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326385))))

(assert (=> b!736222 (= lt!326385 (Intermediate!7375 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736223 () Bool)

(declare-fun e!411835 () Bool)

(declare-fun e!411836 () Bool)

(assert (=> b!736223 (= e!411835 e!411836)))

(declare-fun res!494850 () Bool)

(assert (=> b!736223 (=> res!494850 e!411836)))

(assert (=> b!736223 (= res!494850 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326376 #b00000000000000000000000000000000) (bvsge lt!326376 (size!20199 a!3186))))))

(declare-fun lt!326379 () Unit!25076)

(assert (=> b!736223 (= lt!326379 e!411841)))

(declare-fun c!81070 () Bool)

(declare-fun lt!326377 () Bool)

(assert (=> b!736223 (= c!81070 lt!326377)))

(assert (=> b!736223 (= lt!326377 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736223 (= lt!326376 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736224 () Bool)

(assert (=> b!736224 (= e!411839 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326385))))

(declare-fun b!736225 () Bool)

(declare-fun res!494851 () Bool)

(assert (=> b!736225 (=> (not res!494851) (not e!411834))))

(assert (=> b!736225 (= res!494851 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20199 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20199 a!3186))))))

(declare-fun b!736226 () Bool)

(declare-fun res!494854 () Bool)

(assert (=> b!736226 (=> (not res!494854) (not e!411844))))

(assert (=> b!736226 (= res!494854 (and (= (size!20199 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20199 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20199 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736227 () Bool)

(declare-fun res!494842 () Bool)

(assert (=> b!736227 (=> (not res!494842) (not e!411844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736227 (= res!494842 (validKeyInArray!0 (select (arr!19778 a!3186) j!159)))))

(declare-fun b!736228 () Bool)

(assert (=> b!736228 (= e!411838 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326376 resIntermediateIndex!5 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326384)))))

(declare-fun b!736229 () Bool)

(declare-fun res!494852 () Bool)

(assert (=> b!736229 (=> (not res!494852) (not e!411844))))

(declare-fun arrayContainsKey!0 (array!41328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736229 (= res!494852 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736230 () Bool)

(assert (=> b!736230 (= e!411836 true)))

(declare-fun lt!326383 () (_ BitVec 64))

(declare-fun lt!326380 () SeekEntryResult!7375)

(declare-fun lt!326374 () array!41328)

(assert (=> b!736230 (= lt!326380 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326376 lt!326383 lt!326374 mask!3328))))

(declare-fun b!736231 () Bool)

(declare-fun res!494853 () Bool)

(assert (=> b!736231 (=> res!494853 e!411836)))

(assert (=> b!736231 (= res!494853 e!411838)))

(declare-fun c!81072 () Bool)

(assert (=> b!736231 (= c!81072 lt!326377)))

(declare-fun b!736232 () Bool)

(declare-fun e!411837 () Bool)

(assert (=> b!736232 (= e!411840 e!411837)))

(declare-fun res!494856 () Bool)

(assert (=> b!736232 (=> (not res!494856) (not e!411837))))

(declare-fun lt!326375 () SeekEntryResult!7375)

(declare-fun lt!326386 () SeekEntryResult!7375)

(assert (=> b!736232 (= res!494856 (= lt!326375 lt!326386))))

(assert (=> b!736232 (= lt!326386 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326383 lt!326374 mask!3328))))

(assert (=> b!736232 (= lt!326375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326383 mask!3328) lt!326383 lt!326374 mask!3328))))

(assert (=> b!736232 (= lt!326383 (select (store (arr!19778 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!736232 (= lt!326374 (array!41329 (store (arr!19778 a!3186) i!1173 k0!2102) (size!20199 a!3186)))))

(declare-fun b!736233 () Bool)

(declare-fun res!494843 () Bool)

(assert (=> b!736233 (=> (not res!494843) (not e!411834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41328 (_ BitVec 32)) Bool)

(assert (=> b!736233 (= res!494843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun lt!326387 () SeekEntryResult!7375)

(declare-fun e!411833 () Bool)

(declare-fun b!736234 () Bool)

(assert (=> b!736234 (= e!411833 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326387))))

(declare-fun b!736235 () Bool)

(assert (=> b!736235 (= e!411837 (not e!411835))))

(declare-fun res!494844 () Bool)

(assert (=> b!736235 (=> res!494844 e!411835)))

(get-info :version)

(assert (=> b!736235 (= res!494844 (or (not ((_ is Intermediate!7375) lt!326386)) (bvsge x!1131 (x!62880 lt!326386))))))

(assert (=> b!736235 (= lt!326384 (Found!7375 j!159))))

(declare-fun e!411842 () Bool)

(assert (=> b!736235 e!411842))

(declare-fun res!494839 () Bool)

(assert (=> b!736235 (=> (not res!494839) (not e!411842))))

(assert (=> b!736235 (= res!494839 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326382 () Unit!25076)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25076)

(assert (=> b!736235 (= lt!326382 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736236 () Bool)

(declare-fun res!494847 () Bool)

(assert (=> b!736236 (=> (not res!494847) (not e!411834))))

(declare-datatypes ((List!13819 0))(
  ( (Nil!13816) (Cons!13815 (h!14887 (_ BitVec 64)) (t!20125 List!13819)) )
))
(declare-fun arrayNoDuplicates!0 (array!41328 (_ BitVec 32) List!13819) Bool)

(assert (=> b!736236 (= res!494847 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13816))))

(declare-fun b!736237 () Bool)

(declare-fun Unit!25079 () Unit!25076)

(assert (=> b!736237 (= e!411841 Unit!25079)))

(assert (=> b!736237 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326376 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326385)))

(declare-fun b!736238 () Bool)

(declare-fun res!494845 () Bool)

(assert (=> b!736238 (=> (not res!494845) (not e!411844))))

(assert (=> b!736238 (= res!494845 (validKeyInArray!0 k0!2102))))

(declare-fun res!494849 () Bool)

(assert (=> start!65138 (=> (not res!494849) (not e!411844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65138 (= res!494849 (validMask!0 mask!3328))))

(assert (=> start!65138 e!411844))

(assert (=> start!65138 true))

(declare-fun array_inv!15661 (array!41328) Bool)

(assert (=> start!65138 (array_inv!15661 a!3186)))

(declare-fun b!736239 () Bool)

(declare-fun res!494846 () Bool)

(assert (=> b!736239 (=> (not res!494846) (not e!411840))))

(assert (=> b!736239 (= res!494846 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19778 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736240 () Bool)

(assert (=> b!736240 (= e!411842 e!411833)))

(declare-fun res!494841 () Bool)

(assert (=> b!736240 (=> (not res!494841) (not e!411833))))

(assert (=> b!736240 (= res!494841 (= (seekEntryOrOpen!0 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) lt!326387))))

(assert (=> b!736240 (= lt!326387 (Found!7375 j!159))))

(declare-fun b!736241 () Bool)

(assert (=> b!736241 (= e!411839 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19778 a!3186) j!159) a!3186 mask!3328) (Found!7375 j!159)))))

(assert (= (and start!65138 res!494849) b!736226))

(assert (= (and b!736226 res!494854) b!736227))

(assert (= (and b!736227 res!494842) b!736238))

(assert (= (and b!736238 res!494845) b!736229))

(assert (= (and b!736229 res!494852) b!736219))

(assert (= (and b!736219 res!494840) b!736233))

(assert (= (and b!736233 res!494843) b!736236))

(assert (= (and b!736236 res!494847) b!736225))

(assert (= (and b!736225 res!494851) b!736222))

(assert (= (and b!736222 res!494848) b!736239))

(assert (= (and b!736239 res!494846) b!736218))

(assert (= (and b!736218 c!81071) b!736224))

(assert (= (and b!736218 (not c!81071)) b!736241))

(assert (= (and b!736218 res!494855) b!736232))

(assert (= (and b!736232 res!494856) b!736235))

(assert (= (and b!736235 res!494839) b!736240))

(assert (= (and b!736240 res!494841) b!736234))

(assert (= (and b!736235 (not res!494844)) b!736223))

(assert (= (and b!736223 c!81070) b!736237))

(assert (= (and b!736223 (not c!81070)) b!736220))

(assert (= (and b!736223 (not res!494850)) b!736231))

(assert (= (and b!736231 c!81072) b!736221))

(assert (= (and b!736231 (not c!81072)) b!736228))

(assert (= (and b!736231 (not res!494853)) b!736230))

(declare-fun m!687833 () Bool)

(assert (=> b!736220 m!687833))

(assert (=> b!736220 m!687833))

(declare-fun m!687835 () Bool)

(assert (=> b!736220 m!687835))

(assert (=> b!736220 m!687833))

(declare-fun m!687837 () Bool)

(assert (=> b!736220 m!687837))

(declare-fun m!687839 () Bool)

(assert (=> b!736233 m!687839))

(declare-fun m!687841 () Bool)

(assert (=> start!65138 m!687841))

(declare-fun m!687843 () Bool)

(assert (=> start!65138 m!687843))

(assert (=> b!736224 m!687833))

(assert (=> b!736224 m!687833))

(declare-fun m!687845 () Bool)

(assert (=> b!736224 m!687845))

(declare-fun m!687847 () Bool)

(assert (=> b!736223 m!687847))

(assert (=> b!736228 m!687833))

(assert (=> b!736228 m!687833))

(assert (=> b!736228 m!687837))

(assert (=> b!736221 m!687833))

(assert (=> b!736221 m!687833))

(declare-fun m!687849 () Bool)

(assert (=> b!736221 m!687849))

(declare-fun m!687851 () Bool)

(assert (=> b!736236 m!687851))

(assert (=> b!736227 m!687833))

(assert (=> b!736227 m!687833))

(declare-fun m!687853 () Bool)

(assert (=> b!736227 m!687853))

(assert (=> b!736237 m!687833))

(assert (=> b!736237 m!687833))

(assert (=> b!736237 m!687849))

(declare-fun m!687855 () Bool)

(assert (=> b!736235 m!687855))

(declare-fun m!687857 () Bool)

(assert (=> b!736235 m!687857))

(declare-fun m!687859 () Bool)

(assert (=> b!736229 m!687859))

(assert (=> b!736240 m!687833))

(assert (=> b!736240 m!687833))

(declare-fun m!687861 () Bool)

(assert (=> b!736240 m!687861))

(declare-fun m!687863 () Bool)

(assert (=> b!736230 m!687863))

(declare-fun m!687865 () Bool)

(assert (=> b!736238 m!687865))

(assert (=> b!736234 m!687833))

(assert (=> b!736234 m!687833))

(declare-fun m!687867 () Bool)

(assert (=> b!736234 m!687867))

(assert (=> b!736241 m!687833))

(assert (=> b!736241 m!687833))

(assert (=> b!736241 m!687835))

(declare-fun m!687869 () Bool)

(assert (=> b!736232 m!687869))

(declare-fun m!687871 () Bool)

(assert (=> b!736232 m!687871))

(declare-fun m!687873 () Bool)

(assert (=> b!736232 m!687873))

(declare-fun m!687875 () Bool)

(assert (=> b!736232 m!687875))

(declare-fun m!687877 () Bool)

(assert (=> b!736232 m!687877))

(assert (=> b!736232 m!687873))

(declare-fun m!687879 () Bool)

(assert (=> b!736219 m!687879))

(assert (=> b!736222 m!687833))

(assert (=> b!736222 m!687833))

(declare-fun m!687881 () Bool)

(assert (=> b!736222 m!687881))

(assert (=> b!736222 m!687881))

(assert (=> b!736222 m!687833))

(declare-fun m!687883 () Bool)

(assert (=> b!736222 m!687883))

(declare-fun m!687885 () Bool)

(assert (=> b!736239 m!687885))

(check-sat (not b!736230) (not b!736229) (not b!736237) (not b!736221) (not b!736228) (not b!736224) (not b!736232) (not b!736233) (not b!736223) (not b!736235) (not b!736241) (not b!736222) (not b!736236) (not b!736240) (not b!736234) (not b!736227) (not b!736220) (not b!736219) (not start!65138) (not b!736238))
(check-sat)
