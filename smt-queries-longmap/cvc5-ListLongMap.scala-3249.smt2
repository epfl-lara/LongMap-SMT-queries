; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45366 () Bool)

(assert start!45366)

(declare-fun res!300332 () Bool)

(declare-fun e!292007 () Bool)

(assert (=> start!45366 (=> (not res!300332) (not e!292007))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45366 (= res!300332 (validMask!0 mask!3524))))

(assert (=> start!45366 e!292007))

(assert (=> start!45366 true))

(declare-datatypes ((array!32191 0))(
  ( (array!32192 (arr!15477 (Array (_ BitVec 32) (_ BitVec 64))) (size!15841 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32191)

(declare-fun array_inv!11273 (array!32191) Bool)

(assert (=> start!45366 (array_inv!11273 a!3235)))

(declare-fun b!498198 () Bool)

(declare-fun e!292010 () Bool)

(assert (=> b!498198 (= e!292007 e!292010)))

(declare-fun res!300337 () Bool)

(assert (=> b!498198 (=> (not res!300337) (not e!292010))))

(declare-datatypes ((SeekEntryResult!3944 0))(
  ( (MissingZero!3944 (index!17958 (_ BitVec 32))) (Found!3944 (index!17959 (_ BitVec 32))) (Intermediate!3944 (undefined!4756 Bool) (index!17960 (_ BitVec 32)) (x!47013 (_ BitVec 32))) (Undefined!3944) (MissingVacant!3944 (index!17961 (_ BitVec 32))) )
))
(declare-fun lt!225626 () SeekEntryResult!3944)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!498198 (= res!300337 (or (= lt!225626 (MissingZero!3944 i!1204)) (= lt!225626 (MissingVacant!3944 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32191 (_ BitVec 32)) SeekEntryResult!3944)

(assert (=> b!498198 (= lt!225626 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!498199 () Bool)

(declare-datatypes ((Unit!14852 0))(
  ( (Unit!14853) )
))
(declare-fun e!292014 () Unit!14852)

(declare-fun Unit!14854 () Unit!14852)

(assert (=> b!498199 (= e!292014 Unit!14854)))

(declare-fun b!498200 () Bool)

(declare-fun res!300331 () Bool)

(assert (=> b!498200 (=> (not res!300331) (not e!292007))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!498200 (= res!300331 (and (= (size!15841 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15841 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15841 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!292012 () Bool)

(declare-fun b!498201 () Bool)

(assert (=> b!498201 (= e!292012 (= (seekEntryOrOpen!0 (select (arr!15477 a!3235) j!176) a!3235 mask!3524) (Found!3944 j!176)))))

(declare-fun b!498202 () Bool)

(declare-fun res!300338 () Bool)

(assert (=> b!498202 (=> (not res!300338) (not e!292007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498202 (= res!300338 (validKeyInArray!0 k!2280))))

(declare-fun b!498203 () Bool)

(declare-fun Unit!14855 () Unit!14852)

(assert (=> b!498203 (= e!292014 Unit!14855)))

(declare-fun lt!225620 () SeekEntryResult!3944)

(declare-fun lt!225624 () (_ BitVec 32))

(declare-fun lt!225625 () Unit!14852)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32191 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14852)

(assert (=> b!498203 (= lt!225625 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225624 #b00000000000000000000000000000000 (index!17960 lt!225620) (x!47013 lt!225620) mask!3524))))

(declare-fun lt!225623 () (_ BitVec 64))

(declare-fun res!300326 () Bool)

(declare-fun lt!225621 () array!32191)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32191 (_ BitVec 32)) SeekEntryResult!3944)

(assert (=> b!498203 (= res!300326 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225624 lt!225623 lt!225621 mask!3524) (Intermediate!3944 false (index!17960 lt!225620) (x!47013 lt!225620))))))

(declare-fun e!292011 () Bool)

(assert (=> b!498203 (=> (not res!300326) (not e!292011))))

(assert (=> b!498203 e!292011))

(declare-fun b!498204 () Bool)

(declare-fun res!300334 () Bool)

(assert (=> b!498204 (=> (not res!300334) (not e!292010))))

(declare-datatypes ((List!9635 0))(
  ( (Nil!9632) (Cons!9631 (h!10505 (_ BitVec 64)) (t!15863 List!9635)) )
))
(declare-fun arrayNoDuplicates!0 (array!32191 (_ BitVec 32) List!9635) Bool)

(assert (=> b!498204 (= res!300334 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9632))))

(declare-fun b!498205 () Bool)

(declare-fun e!292008 () Bool)

(assert (=> b!498205 (= e!292008 true)))

(declare-fun lt!225622 () SeekEntryResult!3944)

(assert (=> b!498205 (= lt!225622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225624 lt!225623 lt!225621 mask!3524))))

(declare-fun b!498206 () Bool)

(assert (=> b!498206 (= e!292011 false)))

(declare-fun b!498207 () Bool)

(declare-fun res!300328 () Bool)

(assert (=> b!498207 (=> (not res!300328) (not e!292010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32191 (_ BitVec 32)) Bool)

(assert (=> b!498207 (= res!300328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498208 () Bool)

(declare-fun res!300335 () Bool)

(declare-fun e!292013 () Bool)

(assert (=> b!498208 (=> res!300335 e!292013)))

(assert (=> b!498208 (= res!300335 (or (undefined!4756 lt!225620) (not (is-Intermediate!3944 lt!225620))))))

(declare-fun b!498209 () Bool)

(assert (=> b!498209 (= e!292013 e!292008)))

(declare-fun res!300333 () Bool)

(assert (=> b!498209 (=> res!300333 e!292008)))

(assert (=> b!498209 (= res!300333 (or (bvsgt #b00000000000000000000000000000000 (x!47013 lt!225620)) (bvsgt (x!47013 lt!225620) #b01111111111111111111111111111110) (bvslt lt!225624 #b00000000000000000000000000000000) (bvsge lt!225624 (size!15841 a!3235)) (bvslt (index!17960 lt!225620) #b00000000000000000000000000000000) (bvsge (index!17960 lt!225620) (size!15841 a!3235)) (not (= lt!225620 (Intermediate!3944 false (index!17960 lt!225620) (x!47013 lt!225620))))))))

(assert (=> b!498209 (and (or (= (select (arr!15477 a!3235) (index!17960 lt!225620)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15477 a!3235) (index!17960 lt!225620)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15477 a!3235) (index!17960 lt!225620)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15477 a!3235) (index!17960 lt!225620)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225619 () Unit!14852)

(assert (=> b!498209 (= lt!225619 e!292014)))

(declare-fun c!59213 () Bool)

(assert (=> b!498209 (= c!59213 (= (select (arr!15477 a!3235) (index!17960 lt!225620)) (select (arr!15477 a!3235) j!176)))))

(assert (=> b!498209 (and (bvslt (x!47013 lt!225620) #b01111111111111111111111111111110) (or (= (select (arr!15477 a!3235) (index!17960 lt!225620)) (select (arr!15477 a!3235) j!176)) (= (select (arr!15477 a!3235) (index!17960 lt!225620)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15477 a!3235) (index!17960 lt!225620)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498210 () Bool)

(declare-fun res!300327 () Bool)

(assert (=> b!498210 (=> (not res!300327) (not e!292007))))

(declare-fun arrayContainsKey!0 (array!32191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498210 (= res!300327 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498211 () Bool)

(assert (=> b!498211 (= e!292010 (not e!292013))))

(declare-fun res!300329 () Bool)

(assert (=> b!498211 (=> res!300329 e!292013)))

(declare-fun lt!225627 () (_ BitVec 32))

(assert (=> b!498211 (= res!300329 (= lt!225620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225627 lt!225623 lt!225621 mask!3524)))))

(assert (=> b!498211 (= lt!225620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225624 (select (arr!15477 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498211 (= lt!225627 (toIndex!0 lt!225623 mask!3524))))

(assert (=> b!498211 (= lt!225623 (select (store (arr!15477 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!498211 (= lt!225624 (toIndex!0 (select (arr!15477 a!3235) j!176) mask!3524))))

(assert (=> b!498211 (= lt!225621 (array!32192 (store (arr!15477 a!3235) i!1204 k!2280) (size!15841 a!3235)))))

(assert (=> b!498211 e!292012))

(declare-fun res!300330 () Bool)

(assert (=> b!498211 (=> (not res!300330) (not e!292012))))

(assert (=> b!498211 (= res!300330 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225628 () Unit!14852)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32191 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14852)

(assert (=> b!498211 (= lt!225628 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498212 () Bool)

(declare-fun res!300336 () Bool)

(assert (=> b!498212 (=> (not res!300336) (not e!292007))))

(assert (=> b!498212 (= res!300336 (validKeyInArray!0 (select (arr!15477 a!3235) j!176)))))

(assert (= (and start!45366 res!300332) b!498200))

(assert (= (and b!498200 res!300331) b!498212))

(assert (= (and b!498212 res!300336) b!498202))

(assert (= (and b!498202 res!300338) b!498210))

(assert (= (and b!498210 res!300327) b!498198))

(assert (= (and b!498198 res!300337) b!498207))

(assert (= (and b!498207 res!300328) b!498204))

(assert (= (and b!498204 res!300334) b!498211))

(assert (= (and b!498211 res!300330) b!498201))

(assert (= (and b!498211 (not res!300329)) b!498208))

(assert (= (and b!498208 (not res!300335)) b!498209))

(assert (= (and b!498209 c!59213) b!498203))

(assert (= (and b!498209 (not c!59213)) b!498199))

(assert (= (and b!498203 res!300326) b!498206))

(assert (= (and b!498209 (not res!300333)) b!498205))

(declare-fun m!479481 () Bool)

(assert (=> start!45366 m!479481))

(declare-fun m!479483 () Bool)

(assert (=> start!45366 m!479483))

(declare-fun m!479485 () Bool)

(assert (=> b!498204 m!479485))

(declare-fun m!479487 () Bool)

(assert (=> b!498211 m!479487))

(declare-fun m!479489 () Bool)

(assert (=> b!498211 m!479489))

(declare-fun m!479491 () Bool)

(assert (=> b!498211 m!479491))

(declare-fun m!479493 () Bool)

(assert (=> b!498211 m!479493))

(declare-fun m!479495 () Bool)

(assert (=> b!498211 m!479495))

(declare-fun m!479497 () Bool)

(assert (=> b!498211 m!479497))

(assert (=> b!498211 m!479495))

(declare-fun m!479499 () Bool)

(assert (=> b!498211 m!479499))

(declare-fun m!479501 () Bool)

(assert (=> b!498211 m!479501))

(declare-fun m!479503 () Bool)

(assert (=> b!498211 m!479503))

(assert (=> b!498211 m!479495))

(declare-fun m!479505 () Bool)

(assert (=> b!498210 m!479505))

(declare-fun m!479507 () Bool)

(assert (=> b!498203 m!479507))

(declare-fun m!479509 () Bool)

(assert (=> b!498203 m!479509))

(declare-fun m!479511 () Bool)

(assert (=> b!498209 m!479511))

(assert (=> b!498209 m!479495))

(declare-fun m!479513 () Bool)

(assert (=> b!498202 m!479513))

(declare-fun m!479515 () Bool)

(assert (=> b!498198 m!479515))

(declare-fun m!479517 () Bool)

(assert (=> b!498207 m!479517))

(assert (=> b!498205 m!479509))

(assert (=> b!498212 m!479495))

(assert (=> b!498212 m!479495))

(declare-fun m!479519 () Bool)

(assert (=> b!498212 m!479519))

(assert (=> b!498201 m!479495))

(assert (=> b!498201 m!479495))

(declare-fun m!479521 () Bool)

(assert (=> b!498201 m!479521))

(push 1)

