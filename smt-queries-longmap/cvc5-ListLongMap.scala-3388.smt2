; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46740 () Bool)

(assert start!46740)

(declare-fun b!516074 () Bool)

(declare-fun res!315645 () Bool)

(declare-fun e!301235 () Bool)

(assert (=> b!516074 (=> (not res!315645) (not e!301235))))

(declare-datatypes ((array!33052 0))(
  ( (array!33053 (arr!15894 (Array (_ BitVec 32) (_ BitVec 64))) (size!16258 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33052)

(declare-datatypes ((List!10052 0))(
  ( (Nil!10049) (Cons!10048 (h!10946 (_ BitVec 64)) (t!16280 List!10052)) )
))
(declare-fun arrayNoDuplicates!0 (array!33052 (_ BitVec 32) List!10052) Bool)

(assert (=> b!516074 (= res!315645 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10049))))

(declare-fun b!516075 () Bool)

(declare-fun res!315639 () Bool)

(declare-fun e!301238 () Bool)

(assert (=> b!516075 (=> (not res!315639) (not e!301238))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516075 (= res!315639 (validKeyInArray!0 (select (arr!15894 a!3235) j!176)))))

(declare-fun b!516076 () Bool)

(declare-fun res!315638 () Bool)

(assert (=> b!516076 (=> (not res!315638) (not e!301238))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516076 (= res!315638 (and (= (size!16258 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16258 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16258 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516077 () Bool)

(declare-fun e!301239 () Bool)

(assert (=> b!516077 (= e!301239 true)))

(declare-datatypes ((SeekEntryResult!4361 0))(
  ( (MissingZero!4361 (index!19632 (_ BitVec 32))) (Found!4361 (index!19633 (_ BitVec 32))) (Intermediate!4361 (undefined!5173 Bool) (index!19634 (_ BitVec 32)) (x!48596 (_ BitVec 32))) (Undefined!4361) (MissingVacant!4361 (index!19635 (_ BitVec 32))) )
))
(declare-fun lt!236251 () SeekEntryResult!4361)

(assert (=> b!516077 (and (bvslt (x!48596 lt!236251) #b01111111111111111111111111111110) (or (= (select (arr!15894 a!3235) (index!19634 lt!236251)) (select (arr!15894 a!3235) j!176)) (= (select (arr!15894 a!3235) (index!19634 lt!236251)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15894 a!3235) (index!19634 lt!236251)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516078 () Bool)

(assert (=> b!516078 (= e!301238 e!301235)))

(declare-fun res!315637 () Bool)

(assert (=> b!516078 (=> (not res!315637) (not e!301235))))

(declare-fun lt!236254 () SeekEntryResult!4361)

(assert (=> b!516078 (= res!315637 (or (= lt!236254 (MissingZero!4361 i!1204)) (= lt!236254 (MissingVacant!4361 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33052 (_ BitVec 32)) SeekEntryResult!4361)

(assert (=> b!516078 (= lt!236254 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun e!301236 () Bool)

(declare-fun b!516079 () Bool)

(assert (=> b!516079 (= e!301236 (= (seekEntryOrOpen!0 (select (arr!15894 a!3235) j!176) a!3235 mask!3524) (Found!4361 j!176)))))

(declare-fun b!516080 () Bool)

(declare-fun res!315643 () Bool)

(assert (=> b!516080 (=> (not res!315643) (not e!301235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33052 (_ BitVec 32)) Bool)

(assert (=> b!516080 (= res!315643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516081 () Bool)

(declare-fun res!315642 () Bool)

(assert (=> b!516081 (=> res!315642 e!301239)))

(assert (=> b!516081 (= res!315642 (or (undefined!5173 lt!236251) (not (is-Intermediate!4361 lt!236251))))))

(declare-fun res!315644 () Bool)

(assert (=> start!46740 (=> (not res!315644) (not e!301238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46740 (= res!315644 (validMask!0 mask!3524))))

(assert (=> start!46740 e!301238))

(assert (=> start!46740 true))

(declare-fun array_inv!11690 (array!33052) Bool)

(assert (=> start!46740 (array_inv!11690 a!3235)))

(declare-fun b!516073 () Bool)

(declare-fun res!315646 () Bool)

(assert (=> b!516073 (=> (not res!315646) (not e!301238))))

(declare-fun arrayContainsKey!0 (array!33052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516073 (= res!315646 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516082 () Bool)

(declare-fun res!315640 () Bool)

(assert (=> b!516082 (=> (not res!315640) (not e!301238))))

(assert (=> b!516082 (= res!315640 (validKeyInArray!0 k!2280))))

(declare-fun b!516083 () Bool)

(assert (=> b!516083 (= e!301235 (not e!301239))))

(declare-fun res!315647 () Bool)

(assert (=> b!516083 (=> res!315647 e!301239)))

(declare-fun lt!236252 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33052 (_ BitVec 32)) SeekEntryResult!4361)

(assert (=> b!516083 (= res!315647 (= lt!236251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236252 (select (store (arr!15894 a!3235) i!1204 k!2280) j!176) (array!33053 (store (arr!15894 a!3235) i!1204 k!2280) (size!16258 a!3235)) mask!3524)))))

(declare-fun lt!236253 () (_ BitVec 32))

(assert (=> b!516083 (= lt!236251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236253 (select (arr!15894 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516083 (= lt!236252 (toIndex!0 (select (store (arr!15894 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!516083 (= lt!236253 (toIndex!0 (select (arr!15894 a!3235) j!176) mask!3524))))

(assert (=> b!516083 e!301236))

(declare-fun res!315641 () Bool)

(assert (=> b!516083 (=> (not res!315641) (not e!301236))))

(assert (=> b!516083 (= res!315641 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15980 0))(
  ( (Unit!15981) )
))
(declare-fun lt!236250 () Unit!15980)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15980)

(assert (=> b!516083 (= lt!236250 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46740 res!315644) b!516076))

(assert (= (and b!516076 res!315638) b!516075))

(assert (= (and b!516075 res!315639) b!516082))

(assert (= (and b!516082 res!315640) b!516073))

(assert (= (and b!516073 res!315646) b!516078))

(assert (= (and b!516078 res!315637) b!516080))

(assert (= (and b!516080 res!315643) b!516074))

(assert (= (and b!516074 res!315645) b!516083))

(assert (= (and b!516083 res!315641) b!516079))

(assert (= (and b!516083 (not res!315647)) b!516081))

(assert (= (and b!516081 (not res!315642)) b!516077))

(declare-fun m!497505 () Bool)

(assert (=> b!516073 m!497505))

(declare-fun m!497507 () Bool)

(assert (=> b!516080 m!497507))

(declare-fun m!497509 () Bool)

(assert (=> b!516079 m!497509))

(assert (=> b!516079 m!497509))

(declare-fun m!497511 () Bool)

(assert (=> b!516079 m!497511))

(declare-fun m!497513 () Bool)

(assert (=> b!516078 m!497513))

(declare-fun m!497515 () Bool)

(assert (=> b!516074 m!497515))

(declare-fun m!497517 () Bool)

(assert (=> b!516077 m!497517))

(assert (=> b!516077 m!497509))

(declare-fun m!497519 () Bool)

(assert (=> b!516083 m!497519))

(declare-fun m!497521 () Bool)

(assert (=> b!516083 m!497521))

(declare-fun m!497523 () Bool)

(assert (=> b!516083 m!497523))

(declare-fun m!497525 () Bool)

(assert (=> b!516083 m!497525))

(assert (=> b!516083 m!497521))

(assert (=> b!516083 m!497509))

(declare-fun m!497527 () Bool)

(assert (=> b!516083 m!497527))

(assert (=> b!516083 m!497509))

(assert (=> b!516083 m!497521))

(declare-fun m!497529 () Bool)

(assert (=> b!516083 m!497529))

(declare-fun m!497531 () Bool)

(assert (=> b!516083 m!497531))

(assert (=> b!516083 m!497509))

(declare-fun m!497533 () Bool)

(assert (=> b!516083 m!497533))

(declare-fun m!497535 () Bool)

(assert (=> b!516082 m!497535))

(assert (=> b!516075 m!497509))

(assert (=> b!516075 m!497509))

(declare-fun m!497537 () Bool)

(assert (=> b!516075 m!497537))

(declare-fun m!497539 () Bool)

(assert (=> start!46740 m!497539))

(declare-fun m!497541 () Bool)

(assert (=> start!46740 m!497541))

(push 1)

