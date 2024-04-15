; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47736 () Bool)

(assert start!47736)

(declare-fun b!525237 () Bool)

(declare-fun e!306225 () Bool)

(assert (=> b!525237 (= e!306225 false)))

(declare-fun e!306220 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33383 0))(
  ( (array!33384 (arr!16043 (Array (_ BitVec 32) (_ BitVec 64))) (size!16408 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33383)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!525238 () Bool)

(declare-datatypes ((SeekEntryResult!4507 0))(
  ( (MissingZero!4507 (index!20240 (_ BitVec 32))) (Found!4507 (index!20241 (_ BitVec 32))) (Intermediate!4507 (undefined!5319 Bool) (index!20242 (_ BitVec 32)) (x!49227 (_ BitVec 32))) (Undefined!4507) (MissingVacant!4507 (index!20243 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33383 (_ BitVec 32)) SeekEntryResult!4507)

(assert (=> b!525238 (= e!306220 (= (seekEntryOrOpen!0 (select (arr!16043 a!3235) j!176) a!3235 mask!3524) (Found!4507 j!176)))))

(declare-fun b!525239 () Bool)

(declare-fun e!306222 () Bool)

(declare-fun e!306224 () Bool)

(assert (=> b!525239 (= e!306222 e!306224)))

(declare-fun res!322136 () Bool)

(assert (=> b!525239 (=> (not res!322136) (not e!306224))))

(declare-fun lt!241216 () SeekEntryResult!4507)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525239 (= res!322136 (or (= lt!241216 (MissingZero!4507 i!1204)) (= lt!241216 (MissingVacant!4507 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!525239 (= lt!241216 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525240 () Bool)

(declare-fun e!306219 () Bool)

(assert (=> b!525240 (= e!306219 true)))

(declare-fun lt!241214 () SeekEntryResult!4507)

(assert (=> b!525240 (= (index!20242 lt!241214) i!1204)))

(declare-fun lt!241219 () (_ BitVec 32))

(declare-datatypes ((Unit!16474 0))(
  ( (Unit!16475) )
))
(declare-fun lt!241217 () Unit!16474)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33383 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16474)

(assert (=> b!525240 (= lt!241217 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241219 #b00000000000000000000000000000000 (index!20242 lt!241214) (x!49227 lt!241214) mask!3524))))

(assert (=> b!525240 (and (or (= (select (arr!16043 a!3235) (index!20242 lt!241214)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16043 a!3235) (index!20242 lt!241214)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16043 a!3235) (index!20242 lt!241214)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16043 a!3235) (index!20242 lt!241214)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241212 () Unit!16474)

(declare-fun e!306223 () Unit!16474)

(assert (=> b!525240 (= lt!241212 e!306223)))

(declare-fun c!61857 () Bool)

(assert (=> b!525240 (= c!61857 (= (select (arr!16043 a!3235) (index!20242 lt!241214)) (select (arr!16043 a!3235) j!176)))))

(assert (=> b!525240 (and (bvslt (x!49227 lt!241214) #b01111111111111111111111111111110) (or (= (select (arr!16043 a!3235) (index!20242 lt!241214)) (select (arr!16043 a!3235) j!176)) (= (select (arr!16043 a!3235) (index!20242 lt!241214)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16043 a!3235) (index!20242 lt!241214)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525241 () Bool)

(declare-fun res!322140 () Bool)

(assert (=> b!525241 (=> (not res!322140) (not e!306222))))

(assert (=> b!525241 (= res!322140 (and (= (size!16408 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16408 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16408 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525242 () Bool)

(declare-fun res!322137 () Bool)

(assert (=> b!525242 (=> (not res!322137) (not e!306224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33383 (_ BitVec 32)) Bool)

(assert (=> b!525242 (= res!322137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525243 () Bool)

(declare-fun Unit!16476 () Unit!16474)

(assert (=> b!525243 (= e!306223 Unit!16476)))

(declare-fun b!525244 () Bool)

(declare-fun res!322142 () Bool)

(assert (=> b!525244 (=> (not res!322142) (not e!306222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525244 (= res!322142 (validKeyInArray!0 k0!2280))))

(declare-fun b!525245 () Bool)

(declare-fun res!322135 () Bool)

(assert (=> b!525245 (=> (not res!322135) (not e!306222))))

(assert (=> b!525245 (= res!322135 (validKeyInArray!0 (select (arr!16043 a!3235) j!176)))))

(declare-fun b!525246 () Bool)

(declare-fun Unit!16477 () Unit!16474)

(assert (=> b!525246 (= e!306223 Unit!16477)))

(declare-fun lt!241213 () Unit!16474)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33383 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16474)

(assert (=> b!525246 (= lt!241213 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241219 #b00000000000000000000000000000000 (index!20242 lt!241214) (x!49227 lt!241214) mask!3524))))

(declare-fun lt!241215 () array!33383)

(declare-fun lt!241211 () (_ BitVec 64))

(declare-fun res!322139 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33383 (_ BitVec 32)) SeekEntryResult!4507)

(assert (=> b!525246 (= res!322139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241219 lt!241211 lt!241215 mask!3524) (Intermediate!4507 false (index!20242 lt!241214) (x!49227 lt!241214))))))

(assert (=> b!525246 (=> (not res!322139) (not e!306225))))

(assert (=> b!525246 e!306225))

(declare-fun res!322143 () Bool)

(assert (=> start!47736 (=> (not res!322143) (not e!306222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47736 (= res!322143 (validMask!0 mask!3524))))

(assert (=> start!47736 e!306222))

(assert (=> start!47736 true))

(declare-fun array_inv!11926 (array!33383) Bool)

(assert (=> start!47736 (array_inv!11926 a!3235)))

(declare-fun b!525247 () Bool)

(declare-fun res!322138 () Bool)

(assert (=> b!525247 (=> (not res!322138) (not e!306222))))

(declare-fun arrayContainsKey!0 (array!33383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525247 (= res!322138 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525248 () Bool)

(declare-fun res!322134 () Bool)

(assert (=> b!525248 (=> (not res!322134) (not e!306224))))

(declare-datatypes ((List!10240 0))(
  ( (Nil!10237) (Cons!10236 (h!11167 (_ BitVec 64)) (t!16459 List!10240)) )
))
(declare-fun arrayNoDuplicates!0 (array!33383 (_ BitVec 32) List!10240) Bool)

(assert (=> b!525248 (= res!322134 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10237))))

(declare-fun b!525249 () Bool)

(declare-fun res!322144 () Bool)

(assert (=> b!525249 (=> res!322144 e!306219)))

(get-info :version)

(assert (=> b!525249 (= res!322144 (or (undefined!5319 lt!241214) (not ((_ is Intermediate!4507) lt!241214))))))

(declare-fun b!525250 () Bool)

(assert (=> b!525250 (= e!306224 (not e!306219))))

(declare-fun res!322145 () Bool)

(assert (=> b!525250 (=> res!322145 e!306219)))

(declare-fun lt!241218 () (_ BitVec 32))

(assert (=> b!525250 (= res!322145 (= lt!241214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241218 lt!241211 lt!241215 mask!3524)))))

(assert (=> b!525250 (= lt!241214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241219 (select (arr!16043 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525250 (= lt!241218 (toIndex!0 lt!241211 mask!3524))))

(assert (=> b!525250 (= lt!241211 (select (store (arr!16043 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525250 (= lt!241219 (toIndex!0 (select (arr!16043 a!3235) j!176) mask!3524))))

(assert (=> b!525250 (= lt!241215 (array!33384 (store (arr!16043 a!3235) i!1204 k0!2280) (size!16408 a!3235)))))

(assert (=> b!525250 e!306220))

(declare-fun res!322141 () Bool)

(assert (=> b!525250 (=> (not res!322141) (not e!306220))))

(assert (=> b!525250 (= res!322141 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241210 () Unit!16474)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33383 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16474)

(assert (=> b!525250 (= lt!241210 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!47736 res!322143) b!525241))

(assert (= (and b!525241 res!322140) b!525245))

(assert (= (and b!525245 res!322135) b!525244))

(assert (= (and b!525244 res!322142) b!525247))

(assert (= (and b!525247 res!322138) b!525239))

(assert (= (and b!525239 res!322136) b!525242))

(assert (= (and b!525242 res!322137) b!525248))

(assert (= (and b!525248 res!322134) b!525250))

(assert (= (and b!525250 res!322141) b!525238))

(assert (= (and b!525250 (not res!322145)) b!525249))

(assert (= (and b!525249 (not res!322144)) b!525240))

(assert (= (and b!525240 c!61857) b!525246))

(assert (= (and b!525240 (not c!61857)) b!525243))

(assert (= (and b!525246 res!322139) b!525237))

(declare-fun m!505417 () Bool)

(assert (=> b!525245 m!505417))

(assert (=> b!525245 m!505417))

(declare-fun m!505419 () Bool)

(assert (=> b!525245 m!505419))

(declare-fun m!505421 () Bool)

(assert (=> b!525250 m!505421))

(declare-fun m!505423 () Bool)

(assert (=> b!525250 m!505423))

(assert (=> b!525250 m!505417))

(declare-fun m!505425 () Bool)

(assert (=> b!525250 m!505425))

(assert (=> b!525250 m!505417))

(declare-fun m!505427 () Bool)

(assert (=> b!525250 m!505427))

(declare-fun m!505429 () Bool)

(assert (=> b!525250 m!505429))

(declare-fun m!505431 () Bool)

(assert (=> b!525250 m!505431))

(assert (=> b!525250 m!505417))

(declare-fun m!505433 () Bool)

(assert (=> b!525250 m!505433))

(declare-fun m!505435 () Bool)

(assert (=> b!525250 m!505435))

(declare-fun m!505437 () Bool)

(assert (=> b!525240 m!505437))

(declare-fun m!505439 () Bool)

(assert (=> b!525240 m!505439))

(assert (=> b!525240 m!505417))

(declare-fun m!505441 () Bool)

(assert (=> b!525239 m!505441))

(declare-fun m!505443 () Bool)

(assert (=> b!525247 m!505443))

(assert (=> b!525238 m!505417))

(assert (=> b!525238 m!505417))

(declare-fun m!505445 () Bool)

(assert (=> b!525238 m!505445))

(declare-fun m!505447 () Bool)

(assert (=> b!525248 m!505447))

(declare-fun m!505449 () Bool)

(assert (=> start!47736 m!505449))

(declare-fun m!505451 () Bool)

(assert (=> start!47736 m!505451))

(declare-fun m!505453 () Bool)

(assert (=> b!525244 m!505453))

(declare-fun m!505455 () Bool)

(assert (=> b!525246 m!505455))

(declare-fun m!505457 () Bool)

(assert (=> b!525246 m!505457))

(declare-fun m!505459 () Bool)

(assert (=> b!525242 m!505459))

(check-sat (not b!525244) (not b!525240) (not b!525239) (not b!525245) (not b!525246) (not b!525242) (not b!525247) (not b!525238) (not b!525250) (not start!47736) (not b!525248))
(check-sat)
