; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32052 () Bool)

(assert start!32052)

(declare-fun b!319788 () Bool)

(declare-fun res!174100 () Bool)

(declare-fun e!198568 () Bool)

(assert (=> b!319788 (=> (not res!174100) (not e!198568))))

(declare-datatypes ((array!16326 0))(
  ( (array!16327 (arr!7725 (Array (_ BitVec 32) (_ BitVec 64))) (size!8077 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16326)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16326 (_ BitVec 32)) Bool)

(assert (=> b!319788 (= res!174100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319789 () Bool)

(declare-fun res!174102 () Bool)

(assert (=> b!319789 (=> (not res!174102) (not e!198568))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319789 (= res!174102 (and (= (size!8077 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8077 a!3305))))))

(declare-fun b!319790 () Bool)

(declare-fun res!174103 () Bool)

(assert (=> b!319790 (=> (not res!174103) (not e!198568))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2856 0))(
  ( (MissingZero!2856 (index!13600 (_ BitVec 32))) (Found!2856 (index!13601 (_ BitVec 32))) (Intermediate!2856 (undefined!3668 Bool) (index!13602 (_ BitVec 32)) (x!31874 (_ BitVec 32))) (Undefined!2856) (MissingVacant!2856 (index!13603 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16326 (_ BitVec 32)) SeekEntryResult!2856)

(assert (=> b!319790 (= res!174103 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2856 i!1250)))))

(declare-fun b!319791 () Bool)

(assert (=> b!319791 (= e!198568 false)))

(declare-fun lt!155874 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319791 (= lt!155874 (toIndex!0 k0!2497 mask!3777))))

(declare-fun res!174105 () Bool)

(assert (=> start!32052 (=> (not res!174105) (not e!198568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32052 (= res!174105 (validMask!0 mask!3777))))

(assert (=> start!32052 e!198568))

(assert (=> start!32052 true))

(declare-fun array_inv!5688 (array!16326) Bool)

(assert (=> start!32052 (array_inv!5688 a!3305)))

(declare-fun b!319792 () Bool)

(declare-fun res!174101 () Bool)

(assert (=> b!319792 (=> (not res!174101) (not e!198568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319792 (= res!174101 (validKeyInArray!0 k0!2497))))

(declare-fun b!319793 () Bool)

(declare-fun res!174104 () Bool)

(assert (=> b!319793 (=> (not res!174104) (not e!198568))))

(declare-fun arrayContainsKey!0 (array!16326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319793 (= res!174104 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32052 res!174105) b!319789))

(assert (= (and b!319789 res!174102) b!319792))

(assert (= (and b!319792 res!174101) b!319793))

(assert (= (and b!319793 res!174104) b!319790))

(assert (= (and b!319790 res!174103) b!319788))

(assert (= (and b!319788 res!174100) b!319791))

(declare-fun m!328297 () Bool)

(assert (=> b!319788 m!328297))

(declare-fun m!328299 () Bool)

(assert (=> b!319792 m!328299))

(declare-fun m!328301 () Bool)

(assert (=> b!319793 m!328301))

(declare-fun m!328303 () Bool)

(assert (=> b!319791 m!328303))

(declare-fun m!328305 () Bool)

(assert (=> start!32052 m!328305))

(declare-fun m!328307 () Bool)

(assert (=> start!32052 m!328307))

(declare-fun m!328309 () Bool)

(assert (=> b!319790 m!328309))

(check-sat (not start!32052) (not b!319792) (not b!319793) (not b!319791) (not b!319788) (not b!319790))
