; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45710 () Bool)

(assert start!45710)

(declare-fun b!505227 () Bool)

(declare-fun e!295769 () Bool)

(declare-fun e!295762 () Bool)

(assert (=> b!505227 (= e!295769 (not e!295762))))

(declare-fun res!306368 () Bool)

(assert (=> b!505227 (=> res!306368 e!295762)))

(declare-datatypes ((SeekEntryResult!4036 0))(
  ( (MissingZero!4036 (index!18332 (_ BitVec 32))) (Found!4036 (index!18333 (_ BitVec 32))) (Intermediate!4036 (undefined!4848 Bool) (index!18334 (_ BitVec 32)) (x!47490 (_ BitVec 32))) (Undefined!4036) (MissingVacant!4036 (index!18335 (_ BitVec 32))) )
))
(declare-fun lt!230260 () SeekEntryResult!4036)

(declare-fun lt!230258 () SeekEntryResult!4036)

(get-info :version)

(assert (=> b!505227 (= res!306368 (or (= lt!230260 lt!230258) (undefined!4848 lt!230260) (not ((_ is Intermediate!4036) lt!230260))))))

(declare-fun lt!230266 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32467 0))(
  ( (array!32468 (arr!15613 (Array (_ BitVec 32) (_ BitVec 64))) (size!15977 (_ BitVec 32))) )
))
(declare-fun lt!230255 () array!32467)

(declare-fun lt!230259 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32467 (_ BitVec 32)) SeekEntryResult!4036)

(assert (=> b!505227 (= lt!230258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230266 lt!230259 lt!230255 mask!3524))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun a!3235 () array!32467)

(declare-fun lt!230264 () (_ BitVec 32))

(assert (=> b!505227 (= lt!230260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230264 (select (arr!15613 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505227 (= lt!230266 (toIndex!0 lt!230259 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505227 (= lt!230259 (select (store (arr!15613 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505227 (= lt!230264 (toIndex!0 (select (arr!15613 a!3235) j!176) mask!3524))))

(assert (=> b!505227 (= lt!230255 (array!32468 (store (arr!15613 a!3235) i!1204 k0!2280) (size!15977 a!3235)))))

(declare-fun lt!230256 () SeekEntryResult!4036)

(assert (=> b!505227 (= lt!230256 (Found!4036 j!176))))

(declare-fun e!295767 () Bool)

(assert (=> b!505227 e!295767))

(declare-fun res!306374 () Bool)

(assert (=> b!505227 (=> (not res!306374) (not e!295767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32467 (_ BitVec 32)) Bool)

(assert (=> b!505227 (= res!306374 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15379 0))(
  ( (Unit!15380) )
))
(declare-fun lt!230265 () Unit!15379)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32467 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15379)

(assert (=> b!505227 (= lt!230265 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505228 () Bool)

(declare-fun res!306373 () Bool)

(assert (=> b!505228 (=> (not res!306373) (not e!295769))))

(declare-datatypes ((List!9678 0))(
  ( (Nil!9675) (Cons!9674 (h!10551 (_ BitVec 64)) (t!15898 List!9678)) )
))
(declare-fun arrayNoDuplicates!0 (array!32467 (_ BitVec 32) List!9678) Bool)

(assert (=> b!505228 (= res!306373 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9675))))

(declare-fun res!306371 () Bool)

(declare-fun e!295766 () Bool)

(assert (=> start!45710 (=> (not res!306371) (not e!295766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45710 (= res!306371 (validMask!0 mask!3524))))

(assert (=> start!45710 e!295766))

(assert (=> start!45710 true))

(declare-fun array_inv!11472 (array!32467) Bool)

(assert (=> start!45710 (array_inv!11472 a!3235)))

(declare-fun b!505229 () Bool)

(declare-fun res!306376 () Bool)

(declare-fun e!295763 () Bool)

(assert (=> b!505229 (=> res!306376 e!295763)))

(assert (=> b!505229 (= res!306376 (not (= lt!230258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230264 lt!230259 lt!230255 mask!3524))))))

(declare-fun b!505230 () Bool)

(declare-fun res!306362 () Bool)

(assert (=> b!505230 (=> res!306362 e!295763)))

(declare-fun e!295768 () Bool)

(assert (=> b!505230 (= res!306362 e!295768)))

(declare-fun res!306369 () Bool)

(assert (=> b!505230 (=> (not res!306369) (not e!295768))))

(assert (=> b!505230 (= res!306369 (bvsgt #b00000000000000000000000000000000 (x!47490 lt!230260)))))

(declare-fun b!505231 () Bool)

(assert (=> b!505231 (= e!295766 e!295769)))

(declare-fun res!306372 () Bool)

(assert (=> b!505231 (=> (not res!306372) (not e!295769))))

(declare-fun lt!230257 () SeekEntryResult!4036)

(assert (=> b!505231 (= res!306372 (or (= lt!230257 (MissingZero!4036 i!1204)) (= lt!230257 (MissingVacant!4036 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32467 (_ BitVec 32)) SeekEntryResult!4036)

(assert (=> b!505231 (= lt!230257 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505232 () Bool)

(assert (=> b!505232 (= e!295762 e!295763)))

(declare-fun res!306364 () Bool)

(assert (=> b!505232 (=> res!306364 e!295763)))

(assert (=> b!505232 (= res!306364 (or (bvsgt (x!47490 lt!230260) #b01111111111111111111111111111110) (bvslt lt!230264 #b00000000000000000000000000000000) (bvsge lt!230264 (size!15977 a!3235)) (bvslt (index!18334 lt!230260) #b00000000000000000000000000000000) (bvsge (index!18334 lt!230260) (size!15977 a!3235)) (not (= lt!230260 (Intermediate!4036 false (index!18334 lt!230260) (x!47490 lt!230260))))))))

(assert (=> b!505232 (= (index!18334 lt!230260) i!1204)))

(declare-fun lt!230254 () Unit!15379)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32467 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15379)

(assert (=> b!505232 (= lt!230254 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230264 #b00000000000000000000000000000000 (index!18334 lt!230260) (x!47490 lt!230260) mask!3524))))

(assert (=> b!505232 (and (or (= (select (arr!15613 a!3235) (index!18334 lt!230260)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15613 a!3235) (index!18334 lt!230260)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15613 a!3235) (index!18334 lt!230260)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15613 a!3235) (index!18334 lt!230260)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230262 () Unit!15379)

(declare-fun e!295770 () Unit!15379)

(assert (=> b!505232 (= lt!230262 e!295770)))

(declare-fun c!59711 () Bool)

(assert (=> b!505232 (= c!59711 (= (select (arr!15613 a!3235) (index!18334 lt!230260)) (select (arr!15613 a!3235) j!176)))))

(assert (=> b!505232 (and (bvslt (x!47490 lt!230260) #b01111111111111111111111111111110) (or (= (select (arr!15613 a!3235) (index!18334 lt!230260)) (select (arr!15613 a!3235) j!176)) (= (select (arr!15613 a!3235) (index!18334 lt!230260)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15613 a!3235) (index!18334 lt!230260)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505233 () Bool)

(declare-fun res!306375 () Bool)

(assert (=> b!505233 (=> (not res!306375) (not e!295766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505233 (= res!306375 (validKeyInArray!0 (select (arr!15613 a!3235) j!176)))))

(declare-fun b!505234 () Bool)

(assert (=> b!505234 (= e!295767 (= (seekEntryOrOpen!0 (select (arr!15613 a!3235) j!176) a!3235 mask!3524) (Found!4036 j!176)))))

(declare-fun b!505235 () Bool)

(declare-fun e!295764 () Bool)

(assert (=> b!505235 (= e!295764 false)))

(declare-fun b!505236 () Bool)

(declare-fun res!306365 () Bool)

(assert (=> b!505236 (=> (not res!306365) (not e!295766))))

(declare-fun arrayContainsKey!0 (array!32467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505236 (= res!306365 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505237 () Bool)

(declare-fun res!306370 () Bool)

(assert (=> b!505237 (=> (not res!306370) (not e!295769))))

(assert (=> b!505237 (= res!306370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505238 () Bool)

(assert (=> b!505238 (= e!295763 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!505238 (= (seekEntryOrOpen!0 lt!230259 lt!230255 mask!3524) lt!230256)))

(declare-fun lt!230263 () Unit!15379)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32467 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15379)

(assert (=> b!505238 (= lt!230263 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230264 #b00000000000000000000000000000000 (index!18334 lt!230260) (x!47490 lt!230260) mask!3524))))

(declare-fun b!505239 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32467 (_ BitVec 32)) SeekEntryResult!4036)

(assert (=> b!505239 (= e!295768 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230264 (index!18334 lt!230260) (select (arr!15613 a!3235) j!176) a!3235 mask!3524) lt!230256)))))

(declare-fun b!505240 () Bool)

(declare-fun Unit!15381 () Unit!15379)

(assert (=> b!505240 (= e!295770 Unit!15381)))

(declare-fun lt!230261 () Unit!15379)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32467 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15379)

(assert (=> b!505240 (= lt!230261 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230264 #b00000000000000000000000000000000 (index!18334 lt!230260) (x!47490 lt!230260) mask!3524))))

(declare-fun res!306367 () Bool)

(assert (=> b!505240 (= res!306367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230264 lt!230259 lt!230255 mask!3524) (Intermediate!4036 false (index!18334 lt!230260) (x!47490 lt!230260))))))

(assert (=> b!505240 (=> (not res!306367) (not e!295764))))

(assert (=> b!505240 e!295764))

(declare-fun b!505241 () Bool)

(declare-fun Unit!15382 () Unit!15379)

(assert (=> b!505241 (= e!295770 Unit!15382)))

(declare-fun b!505242 () Bool)

(declare-fun res!306363 () Bool)

(assert (=> b!505242 (=> (not res!306363) (not e!295766))))

(assert (=> b!505242 (= res!306363 (validKeyInArray!0 k0!2280))))

(declare-fun b!505243 () Bool)

(declare-fun res!306366 () Bool)

(assert (=> b!505243 (=> (not res!306366) (not e!295766))))

(assert (=> b!505243 (= res!306366 (and (= (size!15977 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15977 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15977 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45710 res!306371) b!505243))

(assert (= (and b!505243 res!306366) b!505233))

(assert (= (and b!505233 res!306375) b!505242))

(assert (= (and b!505242 res!306363) b!505236))

(assert (= (and b!505236 res!306365) b!505231))

(assert (= (and b!505231 res!306372) b!505237))

(assert (= (and b!505237 res!306370) b!505228))

(assert (= (and b!505228 res!306373) b!505227))

(assert (= (and b!505227 res!306374) b!505234))

(assert (= (and b!505227 (not res!306368)) b!505232))

(assert (= (and b!505232 c!59711) b!505240))

(assert (= (and b!505232 (not c!59711)) b!505241))

(assert (= (and b!505240 res!306367) b!505235))

(assert (= (and b!505232 (not res!306364)) b!505230))

(assert (= (and b!505230 res!306369) b!505239))

(assert (= (and b!505230 (not res!306362)) b!505229))

(assert (= (and b!505229 (not res!306376)) b!505238))

(declare-fun m!486139 () Bool)

(assert (=> b!505227 m!486139))

(declare-fun m!486141 () Bool)

(assert (=> b!505227 m!486141))

(declare-fun m!486143 () Bool)

(assert (=> b!505227 m!486143))

(declare-fun m!486145 () Bool)

(assert (=> b!505227 m!486145))

(declare-fun m!486147 () Bool)

(assert (=> b!505227 m!486147))

(declare-fun m!486149 () Bool)

(assert (=> b!505227 m!486149))

(declare-fun m!486151 () Bool)

(assert (=> b!505227 m!486151))

(assert (=> b!505227 m!486149))

(declare-fun m!486153 () Bool)

(assert (=> b!505227 m!486153))

(assert (=> b!505227 m!486149))

(declare-fun m!486155 () Bool)

(assert (=> b!505227 m!486155))

(declare-fun m!486157 () Bool)

(assert (=> b!505229 m!486157))

(declare-fun m!486159 () Bool)

(assert (=> b!505236 m!486159))

(declare-fun m!486161 () Bool)

(assert (=> start!45710 m!486161))

(declare-fun m!486163 () Bool)

(assert (=> start!45710 m!486163))

(declare-fun m!486165 () Bool)

(assert (=> b!505240 m!486165))

(assert (=> b!505240 m!486157))

(assert (=> b!505234 m!486149))

(assert (=> b!505234 m!486149))

(declare-fun m!486167 () Bool)

(assert (=> b!505234 m!486167))

(assert (=> b!505239 m!486149))

(assert (=> b!505239 m!486149))

(declare-fun m!486169 () Bool)

(assert (=> b!505239 m!486169))

(declare-fun m!486171 () Bool)

(assert (=> b!505237 m!486171))

(declare-fun m!486173 () Bool)

(assert (=> b!505242 m!486173))

(declare-fun m!486175 () Bool)

(assert (=> b!505238 m!486175))

(declare-fun m!486177 () Bool)

(assert (=> b!505238 m!486177))

(declare-fun m!486179 () Bool)

(assert (=> b!505232 m!486179))

(declare-fun m!486181 () Bool)

(assert (=> b!505232 m!486181))

(assert (=> b!505232 m!486149))

(declare-fun m!486183 () Bool)

(assert (=> b!505231 m!486183))

(declare-fun m!486185 () Bool)

(assert (=> b!505228 m!486185))

(assert (=> b!505233 m!486149))

(assert (=> b!505233 m!486149))

(declare-fun m!486187 () Bool)

(assert (=> b!505233 m!486187))

(check-sat (not start!45710) (not b!505234) (not b!505236) (not b!505237) (not b!505229) (not b!505227) (not b!505240) (not b!505239) (not b!505228) (not b!505231) (not b!505233) (not b!505242) (not b!505232) (not b!505238))
(check-sat)
