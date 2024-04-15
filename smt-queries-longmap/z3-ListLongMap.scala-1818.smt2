; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32702 () Bool)

(assert start!32702)

(declare-fun b!326766 () Bool)

(declare-fun res!179948 () Bool)

(declare-fun e!201032 () Bool)

(assert (=> b!326766 (=> (not res!179948) (not e!201032))))

(declare-datatypes ((array!16743 0))(
  ( (array!16744 (arr!7926 (Array (_ BitVec 32) (_ BitVec 64))) (size!8279 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16743)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!326766 (= res!179948 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7926 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326767 () Bool)

(declare-fun res!179943 () Bool)

(assert (=> b!326767 (=> (not res!179943) (not e!201032))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326767 (= res!179943 (and (= (select (arr!7926 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8279 a!3305))))))

(declare-fun b!326768 () Bool)

(declare-fun res!179946 () Bool)

(assert (=> b!326768 (=> (not res!179946) (not e!201032))))

(declare-datatypes ((SeekEntryResult!3056 0))(
  ( (MissingZero!3056 (index!14400 (_ BitVec 32))) (Found!3056 (index!14401 (_ BitVec 32))) (Intermediate!3056 (undefined!3868 Bool) (index!14402 (_ BitVec 32)) (x!32657 (_ BitVec 32))) (Undefined!3056) (MissingVacant!3056 (index!14403 (_ BitVec 32))) )
))
(declare-fun lt!157210 () SeekEntryResult!3056)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16743 (_ BitVec 32)) SeekEntryResult!3056)

(assert (=> b!326768 (= res!179946 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157210))))

(declare-fun b!326769 () Bool)

(assert (=> b!326769 (= e!201032 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-datatypes ((Unit!10124 0))(
  ( (Unit!10125) )
))
(declare-fun lt!157211 () Unit!10124)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16743 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10124)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326769 (= lt!157211 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326770 () Bool)

(declare-fun res!179947 () Bool)

(declare-fun e!201030 () Bool)

(assert (=> b!326770 (=> (not res!179947) (not e!201030))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326770 (= res!179947 (validKeyInArray!0 k0!2497))))

(declare-fun b!326771 () Bool)

(declare-fun res!179949 () Bool)

(assert (=> b!326771 (=> (not res!179949) (not e!201030))))

(assert (=> b!326771 (= res!179949 (and (= (size!8279 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8279 a!3305))))))

(declare-fun b!326772 () Bool)

(declare-fun res!179952 () Bool)

(assert (=> b!326772 (=> (not res!179952) (not e!201030))))

(declare-fun arrayContainsKey!0 (array!16743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326772 (= res!179952 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!179950 () Bool)

(assert (=> start!32702 (=> (not res!179950) (not e!201030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32702 (= res!179950 (validMask!0 mask!3777))))

(assert (=> start!32702 e!201030))

(declare-fun array_inv!5898 (array!16743) Bool)

(assert (=> start!32702 (array_inv!5898 a!3305)))

(assert (=> start!32702 true))

(declare-fun b!326773 () Bool)

(declare-fun res!179944 () Bool)

(assert (=> b!326773 (=> (not res!179944) (not e!201030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16743 (_ BitVec 32)) Bool)

(assert (=> b!326773 (= res!179944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326774 () Bool)

(declare-fun res!179951 () Bool)

(assert (=> b!326774 (=> (not res!179951) (not e!201030))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16743 (_ BitVec 32)) SeekEntryResult!3056)

(assert (=> b!326774 (= res!179951 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3056 i!1250)))))

(declare-fun b!326775 () Bool)

(assert (=> b!326775 (= e!201030 e!201032)))

(declare-fun res!179945 () Bool)

(assert (=> b!326775 (=> (not res!179945) (not e!201032))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326775 (= res!179945 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157210))))

(assert (=> b!326775 (= lt!157210 (Intermediate!3056 false resIndex!58 resX!58))))

(assert (= (and start!32702 res!179950) b!326771))

(assert (= (and b!326771 res!179949) b!326770))

(assert (= (and b!326770 res!179947) b!326772))

(assert (= (and b!326772 res!179952) b!326774))

(assert (= (and b!326774 res!179951) b!326773))

(assert (= (and b!326773 res!179944) b!326775))

(assert (= (and b!326775 res!179945) b!326767))

(assert (= (and b!326767 res!179943) b!326768))

(assert (= (and b!326768 res!179946) b!326766))

(assert (= (and b!326766 res!179948) b!326769))

(declare-fun m!332779 () Bool)

(assert (=> b!326774 m!332779))

(declare-fun m!332781 () Bool)

(assert (=> start!32702 m!332781))

(declare-fun m!332783 () Bool)

(assert (=> start!32702 m!332783))

(declare-fun m!332785 () Bool)

(assert (=> b!326766 m!332785))

(declare-fun m!332787 () Bool)

(assert (=> b!326775 m!332787))

(assert (=> b!326775 m!332787))

(declare-fun m!332789 () Bool)

(assert (=> b!326775 m!332789))

(declare-fun m!332791 () Bool)

(assert (=> b!326772 m!332791))

(declare-fun m!332793 () Bool)

(assert (=> b!326773 m!332793))

(declare-fun m!332795 () Bool)

(assert (=> b!326768 m!332795))

(declare-fun m!332797 () Bool)

(assert (=> b!326767 m!332797))

(declare-fun m!332799 () Bool)

(assert (=> b!326770 m!332799))

(declare-fun m!332801 () Bool)

(assert (=> b!326769 m!332801))

(assert (=> b!326769 m!332801))

(declare-fun m!332803 () Bool)

(assert (=> b!326769 m!332803))

(check-sat (not b!326769) (not b!326775) (not start!32702) (not b!326768) (not b!326774) (not b!326772) (not b!326770) (not b!326773))
(check-sat)
