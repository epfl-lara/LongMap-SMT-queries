; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47732 () Bool)

(assert start!47732)

(declare-fun b!525321 () Bool)

(declare-fun res!322153 () Bool)

(declare-fun e!306294 () Bool)

(assert (=> b!525321 (=> (not res!322153) (not e!306294))))

(declare-datatypes ((array!33370 0))(
  ( (array!33371 (arr!16036 (Array (_ BitVec 32) (_ BitVec 64))) (size!16400 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33370)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525321 (= res!322153 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!322156 () Bool)

(assert (=> start!47732 (=> (not res!322156) (not e!306294))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47732 (= res!322156 (validMask!0 mask!3524))))

(assert (=> start!47732 e!306294))

(assert (=> start!47732 true))

(declare-fun array_inv!11895 (array!33370) Bool)

(assert (=> start!47732 (array_inv!11895 a!3235)))

(declare-fun b!525322 () Bool)

(declare-fun e!306291 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4459 0))(
  ( (MissingZero!4459 (index!20048 (_ BitVec 32))) (Found!4459 (index!20049 (_ BitVec 32))) (Intermediate!4459 (undefined!5271 Bool) (index!20050 (_ BitVec 32)) (x!49173 (_ BitVec 32))) (Undefined!4459) (MissingVacant!4459 (index!20051 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33370 (_ BitVec 32)) SeekEntryResult!4459)

(assert (=> b!525322 (= e!306291 (= (seekEntryOrOpen!0 (select (arr!16036 a!3235) j!176) a!3235 mask!3524) (Found!4459 j!176)))))

(declare-fun b!525323 () Bool)

(declare-fun res!322149 () Bool)

(declare-fun e!306297 () Bool)

(assert (=> b!525323 (=> (not res!322149) (not e!306297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33370 (_ BitVec 32)) Bool)

(assert (=> b!525323 (= res!322149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525324 () Bool)

(assert (=> b!525324 (= e!306294 e!306297)))

(declare-fun res!322158 () Bool)

(assert (=> b!525324 (=> (not res!322158) (not e!306297))))

(declare-fun lt!241367 () SeekEntryResult!4459)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525324 (= res!322158 (or (= lt!241367 (MissingZero!4459 i!1204)) (= lt!241367 (MissingVacant!4459 i!1204))))))

(assert (=> b!525324 (= lt!241367 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525325 () Bool)

(declare-fun e!306293 () Bool)

(assert (=> b!525325 (= e!306293 false)))

(declare-fun b!525326 () Bool)

(declare-datatypes ((Unit!16447 0))(
  ( (Unit!16448) )
))
(declare-fun e!306295 () Unit!16447)

(declare-fun Unit!16449 () Unit!16447)

(assert (=> b!525326 (= e!306295 Unit!16449)))

(declare-fun lt!241371 () Unit!16447)

(declare-fun lt!241374 () (_ BitVec 32))

(declare-fun lt!241369 () SeekEntryResult!4459)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33370 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16447)

(assert (=> b!525326 (= lt!241371 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241374 #b00000000000000000000000000000000 (index!20050 lt!241369) (x!49173 lt!241369) mask!3524))))

(declare-fun lt!241368 () array!33370)

(declare-fun res!322150 () Bool)

(declare-fun lt!241375 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33370 (_ BitVec 32)) SeekEntryResult!4459)

(assert (=> b!525326 (= res!322150 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241374 lt!241375 lt!241368 mask!3524) (Intermediate!4459 false (index!20050 lt!241369) (x!49173 lt!241369))))))

(assert (=> b!525326 (=> (not res!322150) (not e!306293))))

(assert (=> b!525326 e!306293))

(declare-fun b!525327 () Bool)

(declare-fun res!322157 () Bool)

(assert (=> b!525327 (=> (not res!322157) (not e!306294))))

(assert (=> b!525327 (= res!322157 (and (= (size!16400 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16400 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16400 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525328 () Bool)

(declare-fun res!322154 () Bool)

(assert (=> b!525328 (=> (not res!322154) (not e!306297))))

(declare-datatypes ((List!10101 0))(
  ( (Nil!10098) (Cons!10097 (h!11028 (_ BitVec 64)) (t!16321 List!10101)) )
))
(declare-fun arrayNoDuplicates!0 (array!33370 (_ BitVec 32) List!10101) Bool)

(assert (=> b!525328 (= res!322154 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10098))))

(declare-fun b!525329 () Bool)

(declare-fun e!306296 () Bool)

(assert (=> b!525329 (= e!306296 true)))

(assert (=> b!525329 (= (index!20050 lt!241369) i!1204)))

(declare-fun lt!241370 () Unit!16447)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33370 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16447)

(assert (=> b!525329 (= lt!241370 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241374 #b00000000000000000000000000000000 (index!20050 lt!241369) (x!49173 lt!241369) mask!3524))))

(assert (=> b!525329 (and (or (= (select (arr!16036 a!3235) (index!20050 lt!241369)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16036 a!3235) (index!20050 lt!241369)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16036 a!3235) (index!20050 lt!241369)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16036 a!3235) (index!20050 lt!241369)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241372 () Unit!16447)

(assert (=> b!525329 (= lt!241372 e!306295)))

(declare-fun c!61892 () Bool)

(assert (=> b!525329 (= c!61892 (= (select (arr!16036 a!3235) (index!20050 lt!241369)) (select (arr!16036 a!3235) j!176)))))

(assert (=> b!525329 (and (bvslt (x!49173 lt!241369) #b01111111111111111111111111111110) (or (= (select (arr!16036 a!3235) (index!20050 lt!241369)) (select (arr!16036 a!3235) j!176)) (= (select (arr!16036 a!3235) (index!20050 lt!241369)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16036 a!3235) (index!20050 lt!241369)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525330 () Bool)

(assert (=> b!525330 (= e!306297 (not e!306296))))

(declare-fun res!322155 () Bool)

(assert (=> b!525330 (=> res!322155 e!306296)))

(declare-fun lt!241366 () (_ BitVec 32))

(assert (=> b!525330 (= res!322155 (= lt!241369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241366 lt!241375 lt!241368 mask!3524)))))

(assert (=> b!525330 (= lt!241369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241374 (select (arr!16036 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525330 (= lt!241366 (toIndex!0 lt!241375 mask!3524))))

(assert (=> b!525330 (= lt!241375 (select (store (arr!16036 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525330 (= lt!241374 (toIndex!0 (select (arr!16036 a!3235) j!176) mask!3524))))

(assert (=> b!525330 (= lt!241368 (array!33371 (store (arr!16036 a!3235) i!1204 k0!2280) (size!16400 a!3235)))))

(assert (=> b!525330 e!306291))

(declare-fun res!322152 () Bool)

(assert (=> b!525330 (=> (not res!322152) (not e!306291))))

(assert (=> b!525330 (= res!322152 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241373 () Unit!16447)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16447)

(assert (=> b!525330 (= lt!241373 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525331 () Bool)

(declare-fun res!322148 () Bool)

(assert (=> b!525331 (=> (not res!322148) (not e!306294))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525331 (= res!322148 (validKeyInArray!0 (select (arr!16036 a!3235) j!176)))))

(declare-fun b!525332 () Bool)

(declare-fun Unit!16450 () Unit!16447)

(assert (=> b!525332 (= e!306295 Unit!16450)))

(declare-fun b!525333 () Bool)

(declare-fun res!322151 () Bool)

(assert (=> b!525333 (=> res!322151 e!306296)))

(get-info :version)

(assert (=> b!525333 (= res!322151 (or (undefined!5271 lt!241369) (not ((_ is Intermediate!4459) lt!241369))))))

(declare-fun b!525334 () Bool)

(declare-fun res!322159 () Bool)

(assert (=> b!525334 (=> (not res!322159) (not e!306294))))

(assert (=> b!525334 (= res!322159 (validKeyInArray!0 k0!2280))))

(assert (= (and start!47732 res!322156) b!525327))

(assert (= (and b!525327 res!322157) b!525331))

(assert (= (and b!525331 res!322148) b!525334))

(assert (= (and b!525334 res!322159) b!525321))

(assert (= (and b!525321 res!322153) b!525324))

(assert (= (and b!525324 res!322158) b!525323))

(assert (= (and b!525323 res!322149) b!525328))

(assert (= (and b!525328 res!322154) b!525330))

(assert (= (and b!525330 res!322152) b!525322))

(assert (= (and b!525330 (not res!322155)) b!525333))

(assert (= (and b!525333 (not res!322151)) b!525329))

(assert (= (and b!525329 c!61892) b!525326))

(assert (= (and b!525329 (not c!61892)) b!525332))

(assert (= (and b!525326 res!322150) b!525325))

(declare-fun m!506221 () Bool)

(assert (=> b!525331 m!506221))

(assert (=> b!525331 m!506221))

(declare-fun m!506223 () Bool)

(assert (=> b!525331 m!506223))

(declare-fun m!506225 () Bool)

(assert (=> b!525326 m!506225))

(declare-fun m!506227 () Bool)

(assert (=> b!525326 m!506227))

(assert (=> b!525330 m!506221))

(declare-fun m!506229 () Bool)

(assert (=> b!525330 m!506229))

(declare-fun m!506231 () Bool)

(assert (=> b!525330 m!506231))

(declare-fun m!506233 () Bool)

(assert (=> b!525330 m!506233))

(declare-fun m!506235 () Bool)

(assert (=> b!525330 m!506235))

(assert (=> b!525330 m!506221))

(declare-fun m!506237 () Bool)

(assert (=> b!525330 m!506237))

(assert (=> b!525330 m!506221))

(declare-fun m!506239 () Bool)

(assert (=> b!525330 m!506239))

(declare-fun m!506241 () Bool)

(assert (=> b!525330 m!506241))

(declare-fun m!506243 () Bool)

(assert (=> b!525330 m!506243))

(declare-fun m!506245 () Bool)

(assert (=> b!525334 m!506245))

(declare-fun m!506247 () Bool)

(assert (=> b!525329 m!506247))

(declare-fun m!506249 () Bool)

(assert (=> b!525329 m!506249))

(assert (=> b!525329 m!506221))

(declare-fun m!506251 () Bool)

(assert (=> start!47732 m!506251))

(declare-fun m!506253 () Bool)

(assert (=> start!47732 m!506253))

(declare-fun m!506255 () Bool)

(assert (=> b!525324 m!506255))

(declare-fun m!506257 () Bool)

(assert (=> b!525323 m!506257))

(declare-fun m!506259 () Bool)

(assert (=> b!525328 m!506259))

(declare-fun m!506261 () Bool)

(assert (=> b!525321 m!506261))

(assert (=> b!525322 m!506221))

(assert (=> b!525322 m!506221))

(declare-fun m!506263 () Bool)

(assert (=> b!525322 m!506263))

(check-sat (not b!525322) (not b!525321) (not b!525324) (not b!525334) (not start!47732) (not b!525326) (not b!525331) (not b!525328) (not b!525323) (not b!525330) (not b!525329))
(check-sat)
