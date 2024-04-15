; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45462 () Bool)

(assert start!45462)

(declare-fun b!500357 () Bool)

(declare-fun res!302311 () Bool)

(declare-fun e!293133 () Bool)

(assert (=> b!500357 (=> (not res!302311) (not e!293133))))

(declare-datatypes ((array!32297 0))(
  ( (array!32298 (arr!15530 (Array (_ BitVec 32) (_ BitVec 64))) (size!15895 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32297)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500357 (= res!302311 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!500358 () Bool)

(declare-fun e!293131 () Bool)

(assert (=> b!500358 (= e!293131 true)))

(declare-fun lt!227010 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!227014 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3994 0))(
  ( (MissingZero!3994 (index!18158 (_ BitVec 32))) (Found!3994 (index!18159 (_ BitVec 32))) (Intermediate!3994 (undefined!4806 Bool) (index!18160 (_ BitVec 32)) (x!47202 (_ BitVec 32))) (Undefined!3994) (MissingVacant!3994 (index!18161 (_ BitVec 32))) )
))
(declare-fun lt!227006 () SeekEntryResult!3994)

(declare-fun lt!227012 () array!32297)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32297 (_ BitVec 32)) SeekEntryResult!3994)

(assert (=> b!500358 (= lt!227006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227014 lt!227010 lt!227012 mask!3524))))

(declare-fun b!500359 () Bool)

(declare-fun e!293129 () Bool)

(assert (=> b!500359 (= e!293133 e!293129)))

(declare-fun res!302313 () Bool)

(assert (=> b!500359 (=> (not res!302313) (not e!293129))))

(declare-fun lt!227007 () SeekEntryResult!3994)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500359 (= res!302313 (or (= lt!227007 (MissingZero!3994 i!1204)) (= lt!227007 (MissingVacant!3994 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32297 (_ BitVec 32)) SeekEntryResult!3994)

(assert (=> b!500359 (= lt!227007 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500361 () Bool)

(declare-fun res!302309 () Bool)

(assert (=> b!500361 (=> (not res!302309) (not e!293133))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!500361 (= res!302309 (and (= (size!15895 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15895 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15895 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500362 () Bool)

(declare-fun e!293132 () Bool)

(assert (=> b!500362 (= e!293132 (= (seekEntryOrOpen!0 (select (arr!15530 a!3235) j!176) a!3235 mask!3524) (Found!3994 j!176)))))

(declare-fun b!500363 () Bool)

(declare-datatypes ((Unit!15046 0))(
  ( (Unit!15047) )
))
(declare-fun e!293135 () Unit!15046)

(declare-fun Unit!15048 () Unit!15046)

(assert (=> b!500363 (= e!293135 Unit!15048)))

(declare-fun lt!227005 () Unit!15046)

(declare-fun lt!227011 () SeekEntryResult!3994)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32297 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15046)

(assert (=> b!500363 (= lt!227005 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227014 #b00000000000000000000000000000000 (index!18160 lt!227011) (x!47202 lt!227011) mask!3524))))

(declare-fun res!302307 () Bool)

(assert (=> b!500363 (= res!302307 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227014 lt!227010 lt!227012 mask!3524) (Intermediate!3994 false (index!18160 lt!227011) (x!47202 lt!227011))))))

(declare-fun e!293130 () Bool)

(assert (=> b!500363 (=> (not res!302307) (not e!293130))))

(assert (=> b!500363 e!293130))

(declare-fun b!500364 () Bool)

(declare-fun e!293134 () Bool)

(assert (=> b!500364 (= e!293134 e!293131)))

(declare-fun res!302312 () Bool)

(assert (=> b!500364 (=> res!302312 e!293131)))

(assert (=> b!500364 (= res!302312 (or (bvsgt #b00000000000000000000000000000000 (x!47202 lt!227011)) (bvsgt (x!47202 lt!227011) #b01111111111111111111111111111110) (bvslt lt!227014 #b00000000000000000000000000000000) (bvsge lt!227014 (size!15895 a!3235)) (bvslt (index!18160 lt!227011) #b00000000000000000000000000000000) (bvsge (index!18160 lt!227011) (size!15895 a!3235)) (not (= lt!227011 (Intermediate!3994 false (index!18160 lt!227011) (x!47202 lt!227011))))))))

(assert (=> b!500364 (and (or (= (select (arr!15530 a!3235) (index!18160 lt!227011)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15530 a!3235) (index!18160 lt!227011)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15530 a!3235) (index!18160 lt!227011)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15530 a!3235) (index!18160 lt!227011)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227009 () Unit!15046)

(assert (=> b!500364 (= lt!227009 e!293135)))

(declare-fun c!59304 () Bool)

(assert (=> b!500364 (= c!59304 (= (select (arr!15530 a!3235) (index!18160 lt!227011)) (select (arr!15530 a!3235) j!176)))))

(assert (=> b!500364 (and (bvslt (x!47202 lt!227011) #b01111111111111111111111111111110) (or (= (select (arr!15530 a!3235) (index!18160 lt!227011)) (select (arr!15530 a!3235) j!176)) (= (select (arr!15530 a!3235) (index!18160 lt!227011)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15530 a!3235) (index!18160 lt!227011)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500365 () Bool)

(assert (=> b!500365 (= e!293129 (not e!293134))))

(declare-fun res!302303 () Bool)

(assert (=> b!500365 (=> res!302303 e!293134)))

(declare-fun lt!227008 () (_ BitVec 32))

(assert (=> b!500365 (= res!302303 (= lt!227011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227008 lt!227010 lt!227012 mask!3524)))))

(assert (=> b!500365 (= lt!227011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227014 (select (arr!15530 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500365 (= lt!227008 (toIndex!0 lt!227010 mask!3524))))

(assert (=> b!500365 (= lt!227010 (select (store (arr!15530 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500365 (= lt!227014 (toIndex!0 (select (arr!15530 a!3235) j!176) mask!3524))))

(assert (=> b!500365 (= lt!227012 (array!32298 (store (arr!15530 a!3235) i!1204 k0!2280) (size!15895 a!3235)))))

(assert (=> b!500365 e!293132))

(declare-fun res!302315 () Bool)

(assert (=> b!500365 (=> (not res!302315) (not e!293132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32297 (_ BitVec 32)) Bool)

(assert (=> b!500365 (= res!302315 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227013 () Unit!15046)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15046)

(assert (=> b!500365 (= lt!227013 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500366 () Bool)

(declare-fun res!302310 () Bool)

(assert (=> b!500366 (=> res!302310 e!293134)))

(get-info :version)

(assert (=> b!500366 (= res!302310 (or (undefined!4806 lt!227011) (not ((_ is Intermediate!3994) lt!227011))))))

(declare-fun b!500367 () Bool)

(assert (=> b!500367 (= e!293130 false)))

(declare-fun b!500368 () Bool)

(declare-fun res!302308 () Bool)

(assert (=> b!500368 (=> (not res!302308) (not e!293129))))

(assert (=> b!500368 (= res!302308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500369 () Bool)

(declare-fun res!302305 () Bool)

(assert (=> b!500369 (=> (not res!302305) (not e!293129))))

(declare-datatypes ((List!9727 0))(
  ( (Nil!9724) (Cons!9723 (h!10597 (_ BitVec 64)) (t!15946 List!9727)) )
))
(declare-fun arrayNoDuplicates!0 (array!32297 (_ BitVec 32) List!9727) Bool)

(assert (=> b!500369 (= res!302305 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9724))))

(declare-fun b!500360 () Bool)

(declare-fun Unit!15049 () Unit!15046)

(assert (=> b!500360 (= e!293135 Unit!15049)))

(declare-fun res!302314 () Bool)

(assert (=> start!45462 (=> (not res!302314) (not e!293133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45462 (= res!302314 (validMask!0 mask!3524))))

(assert (=> start!45462 e!293133))

(assert (=> start!45462 true))

(declare-fun array_inv!11413 (array!32297) Bool)

(assert (=> start!45462 (array_inv!11413 a!3235)))

(declare-fun b!500370 () Bool)

(declare-fun res!302304 () Bool)

(assert (=> b!500370 (=> (not res!302304) (not e!293133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500370 (= res!302304 (validKeyInArray!0 k0!2280))))

(declare-fun b!500371 () Bool)

(declare-fun res!302306 () Bool)

(assert (=> b!500371 (=> (not res!302306) (not e!293133))))

(assert (=> b!500371 (= res!302306 (validKeyInArray!0 (select (arr!15530 a!3235) j!176)))))

(assert (= (and start!45462 res!302314) b!500361))

(assert (= (and b!500361 res!302309) b!500371))

(assert (= (and b!500371 res!302306) b!500370))

(assert (= (and b!500370 res!302304) b!500357))

(assert (= (and b!500357 res!302311) b!500359))

(assert (= (and b!500359 res!302313) b!500368))

(assert (= (and b!500368 res!302308) b!500369))

(assert (= (and b!500369 res!302305) b!500365))

(assert (= (and b!500365 res!302315) b!500362))

(assert (= (and b!500365 (not res!302303)) b!500366))

(assert (= (and b!500366 (not res!302310)) b!500364))

(assert (= (and b!500364 c!59304) b!500363))

(assert (= (and b!500364 (not c!59304)) b!500360))

(assert (= (and b!500363 res!302307) b!500367))

(assert (= (and b!500364 (not res!302312)) b!500358))

(declare-fun m!480997 () Bool)

(assert (=> b!500357 m!480997))

(declare-fun m!480999 () Bool)

(assert (=> b!500359 m!480999))

(declare-fun m!481001 () Bool)

(assert (=> b!500362 m!481001))

(assert (=> b!500362 m!481001))

(declare-fun m!481003 () Bool)

(assert (=> b!500362 m!481003))

(declare-fun m!481005 () Bool)

(assert (=> b!500364 m!481005))

(assert (=> b!500364 m!481001))

(declare-fun m!481007 () Bool)

(assert (=> b!500363 m!481007))

(declare-fun m!481009 () Bool)

(assert (=> b!500363 m!481009))

(declare-fun m!481011 () Bool)

(assert (=> b!500370 m!481011))

(declare-fun m!481013 () Bool)

(assert (=> b!500365 m!481013))

(declare-fun m!481015 () Bool)

(assert (=> b!500365 m!481015))

(declare-fun m!481017 () Bool)

(assert (=> b!500365 m!481017))

(declare-fun m!481019 () Bool)

(assert (=> b!500365 m!481019))

(assert (=> b!500365 m!481001))

(declare-fun m!481021 () Bool)

(assert (=> b!500365 m!481021))

(declare-fun m!481023 () Bool)

(assert (=> b!500365 m!481023))

(assert (=> b!500365 m!481001))

(declare-fun m!481025 () Bool)

(assert (=> b!500365 m!481025))

(assert (=> b!500365 m!481001))

(declare-fun m!481027 () Bool)

(assert (=> b!500365 m!481027))

(declare-fun m!481029 () Bool)

(assert (=> b!500368 m!481029))

(assert (=> b!500358 m!481009))

(declare-fun m!481031 () Bool)

(assert (=> start!45462 m!481031))

(declare-fun m!481033 () Bool)

(assert (=> start!45462 m!481033))

(declare-fun m!481035 () Bool)

(assert (=> b!500369 m!481035))

(assert (=> b!500371 m!481001))

(assert (=> b!500371 m!481001))

(declare-fun m!481037 () Bool)

(assert (=> b!500371 m!481037))

(check-sat (not b!500362) (not b!500365) (not b!500358) (not b!500359) (not b!500371) (not b!500369) (not b!500368) (not b!500370) (not b!500363) (not b!500357) (not start!45462))
(check-sat)
