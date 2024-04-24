; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49378 () Bool)

(assert start!49378)

(declare-fun b!543674 () Bool)

(declare-fun res!338123 () Bool)

(declare-fun e!314441 () Bool)

(assert (=> b!543674 (=> (not res!338123) (not e!314441))))

(declare-datatypes ((SeekEntryResult!4912 0))(
  ( (MissingZero!4912 (index!21872 (_ BitVec 32))) (Found!4912 (index!21873 (_ BitVec 32))) (Intermediate!4912 (undefined!5724 Bool) (index!21874 (_ BitVec 32)) (x!50930 (_ BitVec 32))) (Undefined!4912) (MissingVacant!4912 (index!21875 (_ BitVec 32))) )
))
(declare-fun lt!248288 () SeekEntryResult!4912)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34334 0))(
  ( (array!34335 (arr!16498 (Array (_ BitVec 32) (_ BitVec 64))) (size!16862 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34334)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34334 (_ BitVec 32)) SeekEntryResult!4912)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543674 (= res!338123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16498 a!3154) j!147) mask!3216) (select (arr!16498 a!3154) j!147) a!3154 mask!3216) lt!248288))))

(declare-fun b!543675 () Bool)

(declare-fun res!338129 () Bool)

(assert (=> b!543675 (=> (not res!338129) (not e!314441))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!543675 (= res!338129 (and (not (= (select (arr!16498 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16498 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16498 a!3154) index!1177) (select (arr!16498 a!3154) j!147)))))))

(declare-fun b!543676 () Bool)

(declare-fun res!338125 () Bool)

(declare-fun e!314442 () Bool)

(assert (=> b!543676 (=> (not res!338125) (not e!314442))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543676 (= res!338125 (and (= (size!16862 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16862 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16862 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543677 () Bool)

(declare-fun res!338130 () Bool)

(assert (=> b!543677 (=> (not res!338130) (not e!314442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543677 (= res!338130 (validKeyInArray!0 (select (arr!16498 a!3154) j!147)))))

(declare-fun b!543678 () Bool)

(declare-fun res!338122 () Bool)

(declare-fun e!314440 () Bool)

(assert (=> b!543678 (=> (not res!338122) (not e!314440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34334 (_ BitVec 32)) Bool)

(assert (=> b!543678 (= res!338122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543679 () Bool)

(declare-fun res!338126 () Bool)

(assert (=> b!543679 (=> (not res!338126) (not e!314440))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!543679 (= res!338126 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16862 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16862 a!3154)) (= (select (arr!16498 a!3154) resIndex!32) (select (arr!16498 a!3154) j!147))))))

(declare-fun b!543680 () Bool)

(assert (=> b!543680 (= e!314440 e!314441)))

(declare-fun res!338128 () Bool)

(assert (=> b!543680 (=> (not res!338128) (not e!314441))))

(assert (=> b!543680 (= res!338128 (= lt!248288 (Intermediate!4912 false resIndex!32 resX!32)))))

(assert (=> b!543680 (= lt!248288 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16498 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543681 () Bool)

(declare-fun res!338124 () Bool)

(assert (=> b!543681 (=> (not res!338124) (not e!314442))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!543681 (= res!338124 (validKeyInArray!0 k0!1998))))

(declare-fun b!543682 () Bool)

(declare-fun res!338121 () Bool)

(assert (=> b!543682 (=> (not res!338121) (not e!314440))))

(declare-datatypes ((List!10524 0))(
  ( (Nil!10521) (Cons!10520 (h!11478 (_ BitVec 64)) (t!16744 List!10524)) )
))
(declare-fun arrayNoDuplicates!0 (array!34334 (_ BitVec 32) List!10524) Bool)

(assert (=> b!543682 (= res!338121 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10521))))

(declare-fun b!543683 () Bool)

(declare-fun res!338127 () Bool)

(assert (=> b!543683 (=> (not res!338127) (not e!314442))))

(declare-fun arrayContainsKey!0 (array!34334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543683 (= res!338127 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!338131 () Bool)

(assert (=> start!49378 (=> (not res!338131) (not e!314442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49378 (= res!338131 (validMask!0 mask!3216))))

(assert (=> start!49378 e!314442))

(assert (=> start!49378 true))

(declare-fun array_inv!12357 (array!34334) Bool)

(assert (=> start!49378 (array_inv!12357 a!3154)))

(declare-fun b!543684 () Bool)

(assert (=> b!543684 (= e!314441 false)))

(declare-fun lt!248289 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543684 (= lt!248289 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!543685 () Bool)

(assert (=> b!543685 (= e!314442 e!314440)))

(declare-fun res!338120 () Bool)

(assert (=> b!543685 (=> (not res!338120) (not e!314440))))

(declare-fun lt!248290 () SeekEntryResult!4912)

(assert (=> b!543685 (= res!338120 (or (= lt!248290 (MissingZero!4912 i!1153)) (= lt!248290 (MissingVacant!4912 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34334 (_ BitVec 32)) SeekEntryResult!4912)

(assert (=> b!543685 (= lt!248290 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!49378 res!338131) b!543676))

(assert (= (and b!543676 res!338125) b!543677))

(assert (= (and b!543677 res!338130) b!543681))

(assert (= (and b!543681 res!338124) b!543683))

(assert (= (and b!543683 res!338127) b!543685))

(assert (= (and b!543685 res!338120) b!543678))

(assert (= (and b!543678 res!338122) b!543682))

(assert (= (and b!543682 res!338121) b!543679))

(assert (= (and b!543679 res!338126) b!543680))

(assert (= (and b!543680 res!338128) b!543674))

(assert (= (and b!543674 res!338123) b!543675))

(assert (= (and b!543675 res!338129) b!543684))

(declare-fun m!521881 () Bool)

(assert (=> b!543679 m!521881))

(declare-fun m!521883 () Bool)

(assert (=> b!543679 m!521883))

(declare-fun m!521885 () Bool)

(assert (=> b!543684 m!521885))

(declare-fun m!521887 () Bool)

(assert (=> b!543682 m!521887))

(declare-fun m!521889 () Bool)

(assert (=> b!543681 m!521889))

(declare-fun m!521891 () Bool)

(assert (=> start!49378 m!521891))

(declare-fun m!521893 () Bool)

(assert (=> start!49378 m!521893))

(declare-fun m!521895 () Bool)

(assert (=> b!543678 m!521895))

(assert (=> b!543680 m!521883))

(assert (=> b!543680 m!521883))

(declare-fun m!521897 () Bool)

(assert (=> b!543680 m!521897))

(assert (=> b!543677 m!521883))

(assert (=> b!543677 m!521883))

(declare-fun m!521899 () Bool)

(assert (=> b!543677 m!521899))

(declare-fun m!521901 () Bool)

(assert (=> b!543683 m!521901))

(assert (=> b!543674 m!521883))

(assert (=> b!543674 m!521883))

(declare-fun m!521903 () Bool)

(assert (=> b!543674 m!521903))

(assert (=> b!543674 m!521903))

(assert (=> b!543674 m!521883))

(declare-fun m!521905 () Bool)

(assert (=> b!543674 m!521905))

(declare-fun m!521907 () Bool)

(assert (=> b!543685 m!521907))

(declare-fun m!521909 () Bool)

(assert (=> b!543675 m!521909))

(assert (=> b!543675 m!521883))

(check-sat (not b!543674) (not b!543681) (not start!49378) (not b!543680) (not b!543683) (not b!543677) (not b!543685) (not b!543682) (not b!543684) (not b!543678))
(check-sat)
