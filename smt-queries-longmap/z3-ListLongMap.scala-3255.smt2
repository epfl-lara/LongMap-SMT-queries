; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45392 () Bool)

(assert start!45392)

(declare-fun b!498947 () Bool)

(declare-fun res!301022 () Bool)

(declare-fun e!292400 () Bool)

(assert (=> b!498947 (=> res!301022 e!292400)))

(declare-datatypes ((SeekEntryResult!3913 0))(
  ( (MissingZero!3913 (index!17834 (_ BitVec 32))) (Found!3913 (index!17835 (_ BitVec 32))) (Intermediate!3913 (undefined!4725 Bool) (index!17836 (_ BitVec 32)) (x!47027 (_ BitVec 32))) (Undefined!3913) (MissingVacant!3913 (index!17837 (_ BitVec 32))) )
))
(declare-fun lt!226179 () SeekEntryResult!3913)

(get-info :version)

(assert (=> b!498947 (= res!301022 (or (undefined!4725 lt!226179) (not ((_ is Intermediate!3913) lt!226179))))))

(declare-fun e!292404 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32218 0))(
  ( (array!32219 (arr!15490 (Array (_ BitVec 32) (_ BitVec 64))) (size!15854 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32218)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!498948 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32218 (_ BitVec 32)) SeekEntryResult!3913)

(assert (=> b!498948 (= e!292404 (= (seekEntryOrOpen!0 (select (arr!15490 a!3235) j!176) a!3235 mask!3524) (Found!3913 j!176)))))

(declare-fun b!498949 () Bool)

(declare-datatypes ((Unit!14887 0))(
  ( (Unit!14888) )
))
(declare-fun e!292405 () Unit!14887)

(declare-fun Unit!14889 () Unit!14887)

(assert (=> b!498949 (= e!292405 Unit!14889)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!226180 () (_ BitVec 32))

(declare-fun lt!226175 () Unit!14887)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32218 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14887)

(assert (=> b!498949 (= lt!226175 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226180 #b00000000000000000000000000000000 (index!17836 lt!226179) (x!47027 lt!226179) mask!3524))))

(declare-fun lt!226172 () array!32218)

(declare-fun res!301031 () Bool)

(declare-fun lt!226177 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32218 (_ BitVec 32)) SeekEntryResult!3913)

(assert (=> b!498949 (= res!301031 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226180 lt!226177 lt!226172 mask!3524) (Intermediate!3913 false (index!17836 lt!226179) (x!47027 lt!226179))))))

(declare-fun e!292403 () Bool)

(assert (=> b!498949 (=> (not res!301031) (not e!292403))))

(assert (=> b!498949 e!292403))

(declare-fun b!498951 () Bool)

(declare-fun e!292407 () Bool)

(assert (=> b!498951 (= e!292400 e!292407)))

(declare-fun res!301021 () Bool)

(assert (=> b!498951 (=> res!301021 e!292407)))

(assert (=> b!498951 (= res!301021 (or (bvsgt #b00000000000000000000000000000000 (x!47027 lt!226179)) (bvsgt (x!47027 lt!226179) #b01111111111111111111111111111110) (bvslt lt!226180 #b00000000000000000000000000000000) (bvsge lt!226180 (size!15854 a!3235)) (bvslt (index!17836 lt!226179) #b00000000000000000000000000000000) (bvsge (index!17836 lt!226179) (size!15854 a!3235)) (not (= lt!226179 (Intermediate!3913 false (index!17836 lt!226179) (x!47027 lt!226179))))))))

(assert (=> b!498951 (and (or (= (select (arr!15490 a!3235) (index!17836 lt!226179)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15490 a!3235) (index!17836 lt!226179)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15490 a!3235) (index!17836 lt!226179)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15490 a!3235) (index!17836 lt!226179)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226173 () Unit!14887)

(assert (=> b!498951 (= lt!226173 e!292405)))

(declare-fun c!59240 () Bool)

(assert (=> b!498951 (= c!59240 (= (select (arr!15490 a!3235) (index!17836 lt!226179)) (select (arr!15490 a!3235) j!176)))))

(assert (=> b!498951 (and (bvslt (x!47027 lt!226179) #b01111111111111111111111111111110) (or (= (select (arr!15490 a!3235) (index!17836 lt!226179)) (select (arr!15490 a!3235) j!176)) (= (select (arr!15490 a!3235) (index!17836 lt!226179)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15490 a!3235) (index!17836 lt!226179)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498952 () Bool)

(declare-fun res!301032 () Bool)

(declare-fun e!292401 () Bool)

(assert (=> b!498952 (=> (not res!301032) (not e!292401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498952 (= res!301032 (validKeyInArray!0 (select (arr!15490 a!3235) j!176)))))

(declare-fun b!498953 () Bool)

(declare-fun Unit!14890 () Unit!14887)

(assert (=> b!498953 (= e!292405 Unit!14890)))

(declare-fun b!498954 () Bool)

(declare-fun res!301024 () Bool)

(declare-fun e!292406 () Bool)

(assert (=> b!498954 (=> (not res!301024) (not e!292406))))

(declare-datatypes ((List!9555 0))(
  ( (Nil!9552) (Cons!9551 (h!10425 (_ BitVec 64)) (t!15775 List!9555)) )
))
(declare-fun arrayNoDuplicates!0 (array!32218 (_ BitVec 32) List!9555) Bool)

(assert (=> b!498954 (= res!301024 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9552))))

(declare-fun b!498955 () Bool)

(assert (=> b!498955 (= e!292407 true)))

(declare-fun lt!226178 () SeekEntryResult!3913)

(assert (=> b!498955 (= lt!226178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226180 lt!226177 lt!226172 mask!3524))))

(declare-fun b!498956 () Bool)

(declare-fun res!301026 () Bool)

(assert (=> b!498956 (=> (not res!301026) (not e!292401))))

(assert (=> b!498956 (= res!301026 (validKeyInArray!0 k0!2280))))

(declare-fun b!498957 () Bool)

(assert (=> b!498957 (= e!292401 e!292406)))

(declare-fun res!301029 () Bool)

(assert (=> b!498957 (=> (not res!301029) (not e!292406))))

(declare-fun lt!226171 () SeekEntryResult!3913)

(assert (=> b!498957 (= res!301029 (or (= lt!226171 (MissingZero!3913 i!1204)) (= lt!226171 (MissingVacant!3913 i!1204))))))

(assert (=> b!498957 (= lt!226171 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498950 () Bool)

(assert (=> b!498950 (= e!292406 (not e!292400))))

(declare-fun res!301025 () Bool)

(assert (=> b!498950 (=> res!301025 e!292400)))

(declare-fun lt!226174 () (_ BitVec 32))

(assert (=> b!498950 (= res!301025 (= lt!226179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226174 lt!226177 lt!226172 mask!3524)))))

(assert (=> b!498950 (= lt!226179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226180 (select (arr!15490 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498950 (= lt!226174 (toIndex!0 lt!226177 mask!3524))))

(assert (=> b!498950 (= lt!226177 (select (store (arr!15490 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498950 (= lt!226180 (toIndex!0 (select (arr!15490 a!3235) j!176) mask!3524))))

(assert (=> b!498950 (= lt!226172 (array!32219 (store (arr!15490 a!3235) i!1204 k0!2280) (size!15854 a!3235)))))

(assert (=> b!498950 e!292404))

(declare-fun res!301030 () Bool)

(assert (=> b!498950 (=> (not res!301030) (not e!292404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32218 (_ BitVec 32)) Bool)

(assert (=> b!498950 (= res!301030 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226176 () Unit!14887)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14887)

(assert (=> b!498950 (= lt!226176 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!301028 () Bool)

(assert (=> start!45392 (=> (not res!301028) (not e!292401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45392 (= res!301028 (validMask!0 mask!3524))))

(assert (=> start!45392 e!292401))

(assert (=> start!45392 true))

(declare-fun array_inv!11349 (array!32218) Bool)

(assert (=> start!45392 (array_inv!11349 a!3235)))

(declare-fun b!498958 () Bool)

(declare-fun res!301027 () Bool)

(assert (=> b!498958 (=> (not res!301027) (not e!292406))))

(assert (=> b!498958 (= res!301027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498959 () Bool)

(assert (=> b!498959 (= e!292403 false)))

(declare-fun b!498960 () Bool)

(declare-fun res!301023 () Bool)

(assert (=> b!498960 (=> (not res!301023) (not e!292401))))

(assert (=> b!498960 (= res!301023 (and (= (size!15854 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15854 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15854 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498961 () Bool)

(declare-fun res!301033 () Bool)

(assert (=> b!498961 (=> (not res!301033) (not e!292401))))

(declare-fun arrayContainsKey!0 (array!32218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498961 (= res!301033 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45392 res!301028) b!498960))

(assert (= (and b!498960 res!301023) b!498952))

(assert (= (and b!498952 res!301032) b!498956))

(assert (= (and b!498956 res!301026) b!498961))

(assert (= (and b!498961 res!301033) b!498957))

(assert (= (and b!498957 res!301029) b!498958))

(assert (= (and b!498958 res!301027) b!498954))

(assert (= (and b!498954 res!301024) b!498950))

(assert (= (and b!498950 res!301030) b!498948))

(assert (= (and b!498950 (not res!301025)) b!498947))

(assert (= (and b!498947 (not res!301022)) b!498951))

(assert (= (and b!498951 c!59240) b!498949))

(assert (= (and b!498951 (not c!59240)) b!498953))

(assert (= (and b!498949 res!301031) b!498959))

(assert (= (and b!498951 (not res!301021)) b!498955))

(declare-fun m!480421 () Bool)

(assert (=> b!498956 m!480421))

(declare-fun m!480423 () Bool)

(assert (=> b!498954 m!480423))

(declare-fun m!480425 () Bool)

(assert (=> b!498952 m!480425))

(assert (=> b!498952 m!480425))

(declare-fun m!480427 () Bool)

(assert (=> b!498952 m!480427))

(declare-fun m!480429 () Bool)

(assert (=> b!498950 m!480429))

(declare-fun m!480431 () Bool)

(assert (=> b!498950 m!480431))

(declare-fun m!480433 () Bool)

(assert (=> b!498950 m!480433))

(declare-fun m!480435 () Bool)

(assert (=> b!498950 m!480435))

(declare-fun m!480437 () Bool)

(assert (=> b!498950 m!480437))

(assert (=> b!498950 m!480425))

(declare-fun m!480439 () Bool)

(assert (=> b!498950 m!480439))

(assert (=> b!498950 m!480425))

(declare-fun m!480441 () Bool)

(assert (=> b!498950 m!480441))

(assert (=> b!498950 m!480425))

(declare-fun m!480443 () Bool)

(assert (=> b!498950 m!480443))

(declare-fun m!480445 () Bool)

(assert (=> b!498949 m!480445))

(declare-fun m!480447 () Bool)

(assert (=> b!498949 m!480447))

(declare-fun m!480449 () Bool)

(assert (=> b!498958 m!480449))

(assert (=> b!498948 m!480425))

(assert (=> b!498948 m!480425))

(declare-fun m!480451 () Bool)

(assert (=> b!498948 m!480451))

(declare-fun m!480453 () Bool)

(assert (=> start!45392 m!480453))

(declare-fun m!480455 () Bool)

(assert (=> start!45392 m!480455))

(declare-fun m!480457 () Bool)

(assert (=> b!498957 m!480457))

(declare-fun m!480459 () Bool)

(assert (=> b!498961 m!480459))

(declare-fun m!480461 () Bool)

(assert (=> b!498951 m!480461))

(assert (=> b!498951 m!480425))

(assert (=> b!498955 m!480447))

(check-sat (not b!498956) (not b!498957) (not b!498949) (not b!498955) (not b!498952) (not b!498958) (not b!498948) (not b!498954) (not start!45392) (not b!498961) (not b!498950))
(check-sat)
