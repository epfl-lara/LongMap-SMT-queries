; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46696 () Bool)

(assert start!46696)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33008 0))(
  ( (array!33009 (arr!15872 (Array (_ BitVec 32) (_ BitVec 64))) (size!16236 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33008)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!515347 () Bool)

(declare-fun e!300909 () Bool)

(declare-datatypes ((SeekEntryResult!4339 0))(
  ( (MissingZero!4339 (index!19544 (_ BitVec 32))) (Found!4339 (index!19545 (_ BitVec 32))) (Intermediate!4339 (undefined!5151 Bool) (index!19546 (_ BitVec 32)) (x!48510 (_ BitVec 32))) (Undefined!4339) (MissingVacant!4339 (index!19547 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33008 (_ BitVec 32)) SeekEntryResult!4339)

(assert (=> b!515347 (= e!300909 (= (seekEntryOrOpen!0 (select (arr!15872 a!3235) j!176) a!3235 mask!3524) (Found!4339 j!176)))))

(declare-fun b!515348 () Bool)

(declare-fun e!300908 () Bool)

(declare-fun e!300905 () Bool)

(assert (=> b!515348 (= e!300908 (not e!300905))))

(declare-fun res!314919 () Bool)

(assert (=> b!515348 (=> res!314919 e!300905)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!235921 () SeekEntryResult!4339)

(declare-fun lt!235922 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33008 (_ BitVec 32)) SeekEntryResult!4339)

(assert (=> b!515348 (= res!314919 (= lt!235921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235922 (select (store (arr!15872 a!3235) i!1204 k!2280) j!176) (array!33009 (store (arr!15872 a!3235) i!1204 k!2280) (size!16236 a!3235)) mask!3524)))))

(declare-fun lt!235923 () (_ BitVec 32))

(assert (=> b!515348 (= lt!235921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235923 (select (arr!15872 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515348 (= lt!235922 (toIndex!0 (select (store (arr!15872 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515348 (= lt!235923 (toIndex!0 (select (arr!15872 a!3235) j!176) mask!3524))))

(assert (=> b!515348 e!300909))

(declare-fun res!314912 () Bool)

(assert (=> b!515348 (=> (not res!314912) (not e!300909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33008 (_ BitVec 32)) Bool)

(assert (=> b!515348 (= res!314912 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15936 0))(
  ( (Unit!15937) )
))
(declare-fun lt!235920 () Unit!15936)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15936)

(assert (=> b!515348 (= lt!235920 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515349 () Bool)

(declare-fun e!300906 () Bool)

(assert (=> b!515349 (= e!300906 e!300908)))

(declare-fun res!314915 () Bool)

(assert (=> b!515349 (=> (not res!314915) (not e!300908))))

(declare-fun lt!235924 () SeekEntryResult!4339)

(assert (=> b!515349 (= res!314915 (or (= lt!235924 (MissingZero!4339 i!1204)) (= lt!235924 (MissingVacant!4339 i!1204))))))

(assert (=> b!515349 (= lt!235924 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!314913 () Bool)

(assert (=> start!46696 (=> (not res!314913) (not e!300906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46696 (= res!314913 (validMask!0 mask!3524))))

(assert (=> start!46696 e!300906))

(assert (=> start!46696 true))

(declare-fun array_inv!11668 (array!33008) Bool)

(assert (=> start!46696 (array_inv!11668 a!3235)))

(declare-fun b!515350 () Bool)

(declare-fun res!314911 () Bool)

(assert (=> b!515350 (=> (not res!314911) (not e!300906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515350 (= res!314911 (validKeyInArray!0 (select (arr!15872 a!3235) j!176)))))

(declare-fun b!515351 () Bool)

(declare-fun res!314916 () Bool)

(assert (=> b!515351 (=> (not res!314916) (not e!300906))))

(assert (=> b!515351 (= res!314916 (and (= (size!16236 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16236 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16236 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515352 () Bool)

(declare-fun res!314914 () Bool)

(assert (=> b!515352 (=> (not res!314914) (not e!300908))))

(assert (=> b!515352 (= res!314914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515353 () Bool)

(declare-fun res!314920 () Bool)

(assert (=> b!515353 (=> (not res!314920) (not e!300906))))

(assert (=> b!515353 (= res!314920 (validKeyInArray!0 k!2280))))

(declare-fun b!515354 () Bool)

(declare-fun res!314921 () Bool)

(assert (=> b!515354 (=> (not res!314921) (not e!300908))))

(declare-datatypes ((List!10030 0))(
  ( (Nil!10027) (Cons!10026 (h!10924 (_ BitVec 64)) (t!16258 List!10030)) )
))
(declare-fun arrayNoDuplicates!0 (array!33008 (_ BitVec 32) List!10030) Bool)

(assert (=> b!515354 (= res!314921 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10027))))

(declare-fun b!515355 () Bool)

(assert (=> b!515355 (= e!300905 true)))

(assert (=> b!515355 (and (bvslt (x!48510 lt!235921) #b01111111111111111111111111111110) (or (= (select (arr!15872 a!3235) (index!19546 lt!235921)) (select (arr!15872 a!3235) j!176)) (= (select (arr!15872 a!3235) (index!19546 lt!235921)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15872 a!3235) (index!19546 lt!235921)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515356 () Bool)

(declare-fun res!314918 () Bool)

(assert (=> b!515356 (=> res!314918 e!300905)))

(assert (=> b!515356 (= res!314918 (or (undefined!5151 lt!235921) (not (is-Intermediate!4339 lt!235921))))))

(declare-fun b!515357 () Bool)

(declare-fun res!314917 () Bool)

(assert (=> b!515357 (=> (not res!314917) (not e!300906))))

(declare-fun arrayContainsKey!0 (array!33008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515357 (= res!314917 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46696 res!314913) b!515351))

(assert (= (and b!515351 res!314916) b!515350))

(assert (= (and b!515350 res!314911) b!515353))

(assert (= (and b!515353 res!314920) b!515357))

(assert (= (and b!515357 res!314917) b!515349))

(assert (= (and b!515349 res!314915) b!515352))

(assert (= (and b!515352 res!314914) b!515354))

(assert (= (and b!515354 res!314921) b!515348))

(assert (= (and b!515348 res!314912) b!515347))

(assert (= (and b!515348 (not res!314919)) b!515356))

(assert (= (and b!515356 (not res!314918)) b!515355))

(declare-fun m!496669 () Bool)

(assert (=> start!46696 m!496669))

(declare-fun m!496671 () Bool)

(assert (=> start!46696 m!496671))

(declare-fun m!496673 () Bool)

(assert (=> b!515357 m!496673))

(declare-fun m!496675 () Bool)

(assert (=> b!515349 m!496675))

(declare-fun m!496677 () Bool)

(assert (=> b!515355 m!496677))

(declare-fun m!496679 () Bool)

(assert (=> b!515355 m!496679))

(declare-fun m!496681 () Bool)

(assert (=> b!515354 m!496681))

(assert (=> b!515350 m!496679))

(assert (=> b!515350 m!496679))

(declare-fun m!496683 () Bool)

(assert (=> b!515350 m!496683))

(assert (=> b!515347 m!496679))

(assert (=> b!515347 m!496679))

(declare-fun m!496685 () Bool)

(assert (=> b!515347 m!496685))

(assert (=> b!515348 m!496679))

(declare-fun m!496687 () Bool)

(assert (=> b!515348 m!496687))

(declare-fun m!496689 () Bool)

(assert (=> b!515348 m!496689))

(declare-fun m!496691 () Bool)

(assert (=> b!515348 m!496691))

(assert (=> b!515348 m!496679))

(declare-fun m!496693 () Bool)

(assert (=> b!515348 m!496693))

(assert (=> b!515348 m!496679))

(declare-fun m!496695 () Bool)

(assert (=> b!515348 m!496695))

(assert (=> b!515348 m!496691))

(declare-fun m!496697 () Bool)

(assert (=> b!515348 m!496697))

(assert (=> b!515348 m!496691))

(declare-fun m!496699 () Bool)

(assert (=> b!515348 m!496699))

(declare-fun m!496701 () Bool)

(assert (=> b!515348 m!496701))

(declare-fun m!496703 () Bool)

(assert (=> b!515352 m!496703))

(declare-fun m!496705 () Bool)

(assert (=> b!515353 m!496705))

(push 1)

