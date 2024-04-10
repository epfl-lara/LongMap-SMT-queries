; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46844 () Bool)

(assert start!46844)

(declare-fun b!517090 () Bool)

(declare-fun res!316472 () Bool)

(declare-fun e!301751 () Bool)

(assert (=> b!517090 (=> (not res!316472) (not e!301751))))

(declare-datatypes ((array!33099 0))(
  ( (array!33100 (arr!15916 (Array (_ BitVec 32) (_ BitVec 64))) (size!16280 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33099)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33099 (_ BitVec 32)) Bool)

(assert (=> b!517090 (= res!316472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!517091 () Bool)

(declare-fun res!316478 () Bool)

(declare-fun e!301752 () Bool)

(assert (=> b!517091 (=> res!316478 e!301752)))

(declare-datatypes ((SeekEntryResult!4383 0))(
  ( (MissingZero!4383 (index!19720 (_ BitVec 32))) (Found!4383 (index!19721 (_ BitVec 32))) (Intermediate!4383 (undefined!5195 Bool) (index!19722 (_ BitVec 32)) (x!48680 (_ BitVec 32))) (Undefined!4383) (MissingVacant!4383 (index!19723 (_ BitVec 32))) )
))
(declare-fun lt!236712 () SeekEntryResult!4383)

(get-info :version)

(assert (=> b!517091 (= res!316478 (or (undefined!5195 lt!236712) (not ((_ is Intermediate!4383) lt!236712))))))

(declare-fun b!517092 () Bool)

(declare-fun res!316479 () Bool)

(assert (=> b!517092 (=> (not res!316479) (not e!301751))))

(declare-datatypes ((List!10074 0))(
  ( (Nil!10071) (Cons!10070 (h!10971 (_ BitVec 64)) (t!16302 List!10074)) )
))
(declare-fun arrayNoDuplicates!0 (array!33099 (_ BitVec 32) List!10074) Bool)

(assert (=> b!517092 (= res!316479 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10071))))

(declare-fun b!517093 () Bool)

(assert (=> b!517093 (= e!301751 (not e!301752))))

(declare-fun res!316475 () Bool)

(assert (=> b!517093 (=> res!316475 e!301752)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!236711 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33099 (_ BitVec 32)) SeekEntryResult!4383)

(assert (=> b!517093 (= res!316475 (= lt!236712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236711 (select (store (arr!15916 a!3235) i!1204 k0!2280) j!176) (array!33100 (store (arr!15916 a!3235) i!1204 k0!2280) (size!16280 a!3235)) mask!3524)))))

(declare-fun lt!236713 () (_ BitVec 32))

(assert (=> b!517093 (= lt!236712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236713 (select (arr!15916 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517093 (= lt!236711 (toIndex!0 (select (store (arr!15916 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!517093 (= lt!236713 (toIndex!0 (select (arr!15916 a!3235) j!176) mask!3524))))

(declare-fun e!301755 () Bool)

(assert (=> b!517093 e!301755))

(declare-fun res!316471 () Bool)

(assert (=> b!517093 (=> (not res!316471) (not e!301755))))

(assert (=> b!517093 (= res!316471 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16024 0))(
  ( (Unit!16025) )
))
(declare-fun lt!236709 () Unit!16024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16024)

(assert (=> b!517093 (= lt!236709 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!316480 () Bool)

(declare-fun e!301753 () Bool)

(assert (=> start!46844 (=> (not res!316480) (not e!301753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46844 (= res!316480 (validMask!0 mask!3524))))

(assert (=> start!46844 e!301753))

(assert (=> start!46844 true))

(declare-fun array_inv!11712 (array!33099) Bool)

(assert (=> start!46844 (array_inv!11712 a!3235)))

(declare-fun b!517094 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33099 (_ BitVec 32)) SeekEntryResult!4383)

(assert (=> b!517094 (= e!301755 (= (seekEntryOrOpen!0 (select (arr!15916 a!3235) j!176) a!3235 mask!3524) (Found!4383 j!176)))))

(declare-fun b!517095 () Bool)

(declare-fun res!316474 () Bool)

(assert (=> b!517095 (=> (not res!316474) (not e!301753))))

(assert (=> b!517095 (= res!316474 (and (= (size!16280 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16280 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16280 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517096 () Bool)

(declare-fun res!316476 () Bool)

(assert (=> b!517096 (=> (not res!316476) (not e!301753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517096 (= res!316476 (validKeyInArray!0 k0!2280))))

(declare-fun b!517097 () Bool)

(assert (=> b!517097 (= e!301753 e!301751)))

(declare-fun res!316477 () Bool)

(assert (=> b!517097 (=> (not res!316477) (not e!301751))))

(declare-fun lt!236710 () SeekEntryResult!4383)

(assert (=> b!517097 (= res!316477 (or (= lt!236710 (MissingZero!4383 i!1204)) (= lt!236710 (MissingVacant!4383 i!1204))))))

(assert (=> b!517097 (= lt!236710 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!517098 () Bool)

(assert (=> b!517098 (= e!301752 true)))

(assert (=> b!517098 (and (bvslt (x!48680 lt!236712) #b01111111111111111111111111111110) (or (= (select (arr!15916 a!3235) (index!19722 lt!236712)) (select (arr!15916 a!3235) j!176)) (= (select (arr!15916 a!3235) (index!19722 lt!236712)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15916 a!3235) (index!19722 lt!236712)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517099 () Bool)

(declare-fun res!316481 () Bool)

(assert (=> b!517099 (=> (not res!316481) (not e!301753))))

(declare-fun arrayContainsKey!0 (array!33099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517099 (= res!316481 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517100 () Bool)

(declare-fun res!316473 () Bool)

(assert (=> b!517100 (=> (not res!316473) (not e!301753))))

(assert (=> b!517100 (= res!316473 (validKeyInArray!0 (select (arr!15916 a!3235) j!176)))))

(assert (= (and start!46844 res!316480) b!517095))

(assert (= (and b!517095 res!316474) b!517100))

(assert (= (and b!517100 res!316473) b!517096))

(assert (= (and b!517096 res!316476) b!517099))

(assert (= (and b!517099 res!316481) b!517097))

(assert (= (and b!517097 res!316477) b!517090))

(assert (= (and b!517090 res!316472) b!517092))

(assert (= (and b!517092 res!316479) b!517093))

(assert (= (and b!517093 res!316471) b!517094))

(assert (= (and b!517093 (not res!316475)) b!517091))

(assert (= (and b!517091 (not res!316478)) b!517098))

(declare-fun m!498545 () Bool)

(assert (=> start!46844 m!498545))

(declare-fun m!498547 () Bool)

(assert (=> start!46844 m!498547))

(declare-fun m!498549 () Bool)

(assert (=> b!517098 m!498549))

(declare-fun m!498551 () Bool)

(assert (=> b!517098 m!498551))

(assert (=> b!517100 m!498551))

(assert (=> b!517100 m!498551))

(declare-fun m!498553 () Bool)

(assert (=> b!517100 m!498553))

(assert (=> b!517094 m!498551))

(assert (=> b!517094 m!498551))

(declare-fun m!498555 () Bool)

(assert (=> b!517094 m!498555))

(declare-fun m!498557 () Bool)

(assert (=> b!517097 m!498557))

(declare-fun m!498559 () Bool)

(assert (=> b!517092 m!498559))

(declare-fun m!498561 () Bool)

(assert (=> b!517093 m!498561))

(declare-fun m!498563 () Bool)

(assert (=> b!517093 m!498563))

(assert (=> b!517093 m!498551))

(declare-fun m!498565 () Bool)

(assert (=> b!517093 m!498565))

(assert (=> b!517093 m!498551))

(declare-fun m!498567 () Bool)

(assert (=> b!517093 m!498567))

(assert (=> b!517093 m!498551))

(declare-fun m!498569 () Bool)

(assert (=> b!517093 m!498569))

(declare-fun m!498571 () Bool)

(assert (=> b!517093 m!498571))

(declare-fun m!498573 () Bool)

(assert (=> b!517093 m!498573))

(assert (=> b!517093 m!498571))

(declare-fun m!498575 () Bool)

(assert (=> b!517093 m!498575))

(assert (=> b!517093 m!498571))

(declare-fun m!498577 () Bool)

(assert (=> b!517099 m!498577))

(declare-fun m!498579 () Bool)

(assert (=> b!517090 m!498579))

(declare-fun m!498581 () Bool)

(assert (=> b!517096 m!498581))

(check-sat (not b!517096) (not b!517097) (not b!517099) (not b!517092) (not b!517093) (not start!46844) (not b!517100) (not b!517090) (not b!517094))
(check-sat)
