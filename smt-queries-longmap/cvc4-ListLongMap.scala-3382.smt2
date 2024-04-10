; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46708 () Bool)

(assert start!46708)

(declare-fun b!515546 () Bool)

(declare-fun res!315110 () Bool)

(declare-fun e!300998 () Bool)

(assert (=> b!515546 (=> (not res!315110) (not e!300998))))

(declare-datatypes ((array!33020 0))(
  ( (array!33021 (arr!15878 (Array (_ BitVec 32) (_ BitVec 64))) (size!16242 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33020)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515546 (= res!315110 (validKeyInArray!0 (select (arr!15878 a!3235) j!176)))))

(declare-fun b!515547 () Bool)

(declare-fun res!315113 () Bool)

(declare-fun e!300997 () Bool)

(assert (=> b!515547 (=> (not res!315113) (not e!300997))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33020 (_ BitVec 32)) Bool)

(assert (=> b!515547 (= res!315113 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515548 () Bool)

(declare-fun res!315111 () Bool)

(assert (=> b!515548 (=> (not res!315111) (not e!300997))))

(declare-datatypes ((List!10036 0))(
  ( (Nil!10033) (Cons!10032 (h!10930 (_ BitVec 64)) (t!16264 List!10036)) )
))
(declare-fun arrayNoDuplicates!0 (array!33020 (_ BitVec 32) List!10036) Bool)

(assert (=> b!515548 (= res!315111 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10033))))

(declare-fun b!515549 () Bool)

(assert (=> b!515549 (= e!300998 e!300997)))

(declare-fun res!315118 () Bool)

(assert (=> b!515549 (=> (not res!315118) (not e!300997))))

(declare-datatypes ((SeekEntryResult!4345 0))(
  ( (MissingZero!4345 (index!19568 (_ BitVec 32))) (Found!4345 (index!19569 (_ BitVec 32))) (Intermediate!4345 (undefined!5157 Bool) (index!19570 (_ BitVec 32)) (x!48532 (_ BitVec 32))) (Undefined!4345) (MissingVacant!4345 (index!19571 (_ BitVec 32))) )
))
(declare-fun lt!236014 () SeekEntryResult!4345)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515549 (= res!315118 (or (= lt!236014 (MissingZero!4345 i!1204)) (= lt!236014 (MissingVacant!4345 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33020 (_ BitVec 32)) SeekEntryResult!4345)

(assert (=> b!515549 (= lt!236014 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!515550 () Bool)

(declare-fun e!300995 () Bool)

(assert (=> b!515550 (= e!300995 (= (seekEntryOrOpen!0 (select (arr!15878 a!3235) j!176) a!3235 mask!3524) (Found!4345 j!176)))))

(declare-fun b!515551 () Bool)

(declare-fun res!315115 () Bool)

(assert (=> b!515551 (=> (not res!315115) (not e!300998))))

(assert (=> b!515551 (= res!315115 (validKeyInArray!0 k!2280))))

(declare-fun b!515552 () Bool)

(declare-fun res!315119 () Bool)

(assert (=> b!515552 (=> (not res!315119) (not e!300998))))

(assert (=> b!515552 (= res!315119 (and (= (size!16242 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16242 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16242 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515553 () Bool)

(declare-fun e!300996 () Bool)

(assert (=> b!515553 (= e!300996 true)))

(declare-fun lt!236013 () SeekEntryResult!4345)

(assert (=> b!515553 (and (bvslt (x!48532 lt!236013) #b01111111111111111111111111111110) (or (= (select (arr!15878 a!3235) (index!19570 lt!236013)) (select (arr!15878 a!3235) j!176)) (= (select (arr!15878 a!3235) (index!19570 lt!236013)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15878 a!3235) (index!19570 lt!236013)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515545 () Bool)

(assert (=> b!515545 (= e!300997 (not e!300996))))

(declare-fun res!315116 () Bool)

(assert (=> b!515545 (=> res!315116 e!300996)))

(declare-fun lt!236012 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33020 (_ BitVec 32)) SeekEntryResult!4345)

(assert (=> b!515545 (= res!315116 (= lt!236013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236012 (select (store (arr!15878 a!3235) i!1204 k!2280) j!176) (array!33021 (store (arr!15878 a!3235) i!1204 k!2280) (size!16242 a!3235)) mask!3524)))))

(declare-fun lt!236010 () (_ BitVec 32))

(assert (=> b!515545 (= lt!236013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236010 (select (arr!15878 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515545 (= lt!236012 (toIndex!0 (select (store (arr!15878 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515545 (= lt!236010 (toIndex!0 (select (arr!15878 a!3235) j!176) mask!3524))))

(assert (=> b!515545 e!300995))

(declare-fun res!315109 () Bool)

(assert (=> b!515545 (=> (not res!315109) (not e!300995))))

(assert (=> b!515545 (= res!315109 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15948 0))(
  ( (Unit!15949) )
))
(declare-fun lt!236011 () Unit!15948)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33020 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15948)

(assert (=> b!515545 (= lt!236011 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!315112 () Bool)

(assert (=> start!46708 (=> (not res!315112) (not e!300998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46708 (= res!315112 (validMask!0 mask!3524))))

(assert (=> start!46708 e!300998))

(assert (=> start!46708 true))

(declare-fun array_inv!11674 (array!33020) Bool)

(assert (=> start!46708 (array_inv!11674 a!3235)))

(declare-fun b!515554 () Bool)

(declare-fun res!315117 () Bool)

(assert (=> b!515554 (=> res!315117 e!300996)))

(assert (=> b!515554 (= res!315117 (or (undefined!5157 lt!236013) (not (is-Intermediate!4345 lt!236013))))))

(declare-fun b!515555 () Bool)

(declare-fun res!315114 () Bool)

(assert (=> b!515555 (=> (not res!315114) (not e!300998))))

(declare-fun arrayContainsKey!0 (array!33020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515555 (= res!315114 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!46708 res!315112) b!515552))

(assert (= (and b!515552 res!315119) b!515546))

(assert (= (and b!515546 res!315110) b!515551))

(assert (= (and b!515551 res!315115) b!515555))

(assert (= (and b!515555 res!315114) b!515549))

(assert (= (and b!515549 res!315118) b!515547))

(assert (= (and b!515547 res!315113) b!515548))

(assert (= (and b!515548 res!315111) b!515545))

(assert (= (and b!515545 res!315109) b!515550))

(assert (= (and b!515545 (not res!315116)) b!515554))

(assert (= (and b!515554 (not res!315117)) b!515553))

(declare-fun m!496897 () Bool)

(assert (=> b!515547 m!496897))

(declare-fun m!496899 () Bool)

(assert (=> b!515549 m!496899))

(declare-fun m!496901 () Bool)

(assert (=> b!515546 m!496901))

(assert (=> b!515546 m!496901))

(declare-fun m!496903 () Bool)

(assert (=> b!515546 m!496903))

(declare-fun m!496905 () Bool)

(assert (=> b!515548 m!496905))

(assert (=> b!515550 m!496901))

(assert (=> b!515550 m!496901))

(declare-fun m!496907 () Bool)

(assert (=> b!515550 m!496907))

(declare-fun m!496909 () Bool)

(assert (=> start!46708 m!496909))

(declare-fun m!496911 () Bool)

(assert (=> start!46708 m!496911))

(declare-fun m!496913 () Bool)

(assert (=> b!515555 m!496913))

(declare-fun m!496915 () Bool)

(assert (=> b!515551 m!496915))

(declare-fun m!496917 () Bool)

(assert (=> b!515553 m!496917))

(assert (=> b!515553 m!496901))

(declare-fun m!496919 () Bool)

(assert (=> b!515545 m!496919))

(declare-fun m!496921 () Bool)

(assert (=> b!515545 m!496921))

(assert (=> b!515545 m!496901))

(declare-fun m!496923 () Bool)

(assert (=> b!515545 m!496923))

(assert (=> b!515545 m!496901))

(declare-fun m!496925 () Bool)

(assert (=> b!515545 m!496925))

(assert (=> b!515545 m!496901))

(declare-fun m!496927 () Bool)

(assert (=> b!515545 m!496927))

(declare-fun m!496929 () Bool)

(assert (=> b!515545 m!496929))

(declare-fun m!496931 () Bool)

(assert (=> b!515545 m!496931))

(assert (=> b!515545 m!496929))

(declare-fun m!496933 () Bool)

(assert (=> b!515545 m!496933))

(assert (=> b!515545 m!496929))

(push 1)

