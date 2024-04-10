; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26192 () Bool)

(assert start!26192)

(declare-fun b!270671 () Bool)

(declare-fun res!134665 () Bool)

(declare-fun e!174379 () Bool)

(assert (=> b!270671 (=> (not res!134665) (not e!174379))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270671 (= res!134665 (not (= startIndex!26 i!1267)))))

(declare-fun b!270673 () Bool)

(declare-fun res!134670 () Bool)

(assert (=> b!270673 (=> (not res!134670) (not e!174379))))

(declare-datatypes ((array!13289 0))(
  ( (array!13290 (arr!6294 (Array (_ BitVec 32) (_ BitVec 64))) (size!6646 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13289)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270673 (= res!134670 (validKeyInArray!0 (select (arr!6294 a!3325) startIndex!26)))))

(declare-fun b!270674 () Bool)

(declare-fun e!174378 () Bool)

(assert (=> b!270674 (= e!174378 e!174379)))

(declare-fun res!134671 () Bool)

(assert (=> b!270674 (=> (not res!134671) (not e!174379))))

(declare-datatypes ((SeekEntryResult!1452 0))(
  ( (MissingZero!1452 (index!7978 (_ BitVec 32))) (Found!1452 (index!7979 (_ BitVec 32))) (Intermediate!1452 (undefined!2264 Bool) (index!7980 (_ BitVec 32)) (x!26313 (_ BitVec 32))) (Undefined!1452) (MissingVacant!1452 (index!7981 (_ BitVec 32))) )
))
(declare-fun lt!135685 () SeekEntryResult!1452)

(assert (=> b!270674 (= res!134671 (or (= lt!135685 (MissingZero!1452 i!1267)) (= lt!135685 (MissingVacant!1452 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13289 (_ BitVec 32)) SeekEntryResult!1452)

(assert (=> b!270674 (= lt!135685 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!270675 () Bool)

(declare-fun res!134666 () Bool)

(assert (=> b!270675 (=> (not res!134666) (not e!174379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13289 (_ BitVec 32)) Bool)

(assert (=> b!270675 (= res!134666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270676 () Bool)

(declare-fun res!134673 () Bool)

(assert (=> b!270676 (=> (not res!134673) (not e!174379))))

(declare-datatypes ((List!4102 0))(
  ( (Nil!4099) (Cons!4098 (h!4765 (_ BitVec 64)) (t!9184 List!4102)) )
))
(declare-fun contains!1932 (List!4102 (_ BitVec 64)) Bool)

(assert (=> b!270676 (= res!134673 (not (contains!1932 Nil!4099 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270677 () Bool)

(declare-fun res!134668 () Bool)

(assert (=> b!270677 (=> (not res!134668) (not e!174378))))

(declare-fun arrayNoDuplicates!0 (array!13289 (_ BitVec 32) List!4102) Bool)

(assert (=> b!270677 (= res!134668 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4099))))

(declare-fun b!270678 () Bool)

(declare-fun res!134662 () Bool)

(assert (=> b!270678 (=> (not res!134662) (not e!174378))))

(assert (=> b!270678 (= res!134662 (and (= (size!6646 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6646 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6646 a!3325))))))

(declare-fun b!270679 () Bool)

(assert (=> b!270679 (= e!174379 false)))

(declare-fun lt!135684 () Bool)

(assert (=> b!270679 (= lt!135684 (contains!1932 Nil!4099 k0!2581))))

(declare-fun b!270680 () Bool)

(declare-fun res!134672 () Bool)

(assert (=> b!270680 (=> (not res!134672) (not e!174379))))

(assert (=> b!270680 (= res!134672 (not (contains!1932 Nil!4099 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270681 () Bool)

(declare-fun res!134664 () Bool)

(assert (=> b!270681 (=> (not res!134664) (not e!174378))))

(assert (=> b!270681 (= res!134664 (validKeyInArray!0 k0!2581))))

(declare-fun res!134667 () Bool)

(assert (=> start!26192 (=> (not res!134667) (not e!174378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26192 (= res!134667 (validMask!0 mask!3868))))

(assert (=> start!26192 e!174378))

(declare-fun array_inv!4257 (array!13289) Bool)

(assert (=> start!26192 (array_inv!4257 a!3325)))

(assert (=> start!26192 true))

(declare-fun b!270672 () Bool)

(declare-fun res!134663 () Bool)

(assert (=> b!270672 (=> (not res!134663) (not e!174379))))

(assert (=> b!270672 (= res!134663 (and (bvslt (size!6646 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6646 a!3325))))))

(declare-fun b!270682 () Bool)

(declare-fun res!134661 () Bool)

(assert (=> b!270682 (=> (not res!134661) (not e!174378))))

(declare-fun arrayContainsKey!0 (array!13289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270682 (= res!134661 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270683 () Bool)

(declare-fun res!134669 () Bool)

(assert (=> b!270683 (=> (not res!134669) (not e!174379))))

(declare-fun noDuplicate!120 (List!4102) Bool)

(assert (=> b!270683 (= res!134669 (noDuplicate!120 Nil!4099))))

(assert (= (and start!26192 res!134667) b!270678))

(assert (= (and b!270678 res!134662) b!270681))

(assert (= (and b!270681 res!134664) b!270677))

(assert (= (and b!270677 res!134668) b!270682))

(assert (= (and b!270682 res!134661) b!270674))

(assert (= (and b!270674 res!134671) b!270675))

(assert (= (and b!270675 res!134666) b!270671))

(assert (= (and b!270671 res!134665) b!270673))

(assert (= (and b!270673 res!134670) b!270672))

(assert (= (and b!270672 res!134663) b!270683))

(assert (= (and b!270683 res!134669) b!270680))

(assert (= (and b!270680 res!134672) b!270676))

(assert (= (and b!270676 res!134673) b!270679))

(declare-fun m!286211 () Bool)

(assert (=> b!270683 m!286211))

(declare-fun m!286213 () Bool)

(assert (=> b!270679 m!286213))

(declare-fun m!286215 () Bool)

(assert (=> b!270676 m!286215))

(declare-fun m!286217 () Bool)

(assert (=> b!270675 m!286217))

(declare-fun m!286219 () Bool)

(assert (=> b!270680 m!286219))

(declare-fun m!286221 () Bool)

(assert (=> b!270673 m!286221))

(assert (=> b!270673 m!286221))

(declare-fun m!286223 () Bool)

(assert (=> b!270673 m!286223))

(declare-fun m!286225 () Bool)

(assert (=> start!26192 m!286225))

(declare-fun m!286227 () Bool)

(assert (=> start!26192 m!286227))

(declare-fun m!286229 () Bool)

(assert (=> b!270674 m!286229))

(declare-fun m!286231 () Bool)

(assert (=> b!270681 m!286231))

(declare-fun m!286233 () Bool)

(assert (=> b!270677 m!286233))

(declare-fun m!286235 () Bool)

(assert (=> b!270682 m!286235))

(check-sat (not start!26192) (not b!270673) (not b!270683) (not b!270675) (not b!270681) (not b!270680) (not b!270679) (not b!270682) (not b!270677) (not b!270674) (not b!270676))
(check-sat)
