; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50666 () Bool)

(assert start!50666)

(declare-fun b!553824 () Bool)

(declare-fun res!346385 () Bool)

(declare-fun e!319364 () Bool)

(assert (=> b!553824 (=> (not res!346385) (not e!319364))))

(declare-datatypes ((array!34900 0))(
  ( (array!34901 (arr!16760 (Array (_ BitVec 32) (_ BitVec 64))) (size!17125 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34900)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553824 (= res!346385 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun b!553825 () Bool)

(declare-fun e!319367 () Bool)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553825 (= e!319367 (validKeyInArray!0 (select (store (arr!16760 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun b!553826 () Bool)

(declare-fun res!346387 () Bool)

(assert (=> b!553826 (=> (not res!346387) (not e!319364))))

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!553826 (= res!346387 (and (= (size!17125 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17125 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17125 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553828 () Bool)

(declare-fun e!319363 () Bool)

(assert (=> b!553828 (= e!319363 (not e!319367))))

(declare-fun res!346382 () Bool)

(assert (=> b!553828 (=> res!346382 e!319367)))

(declare-datatypes ((SeekEntryResult!5206 0))(
  ( (MissingZero!5206 (index!23051 (_ BitVec 32))) (Found!5206 (index!23052 (_ BitVec 32))) (Intermediate!5206 (undefined!6018 Bool) (index!23053 (_ BitVec 32)) (x!51979 (_ BitVec 32))) (Undefined!5206) (MissingVacant!5206 (index!23054 (_ BitVec 32))) )
))
(declare-fun lt!251444 () SeekEntryResult!5206)

(get-info :version)

(assert (=> b!553828 (= res!346382 (or (not ((_ is Intermediate!5206) lt!251444)) (undefined!6018 lt!251444) (not (= (select (arr!16760 a!3118) (index!23053 lt!251444)) (select (arr!16760 a!3118) j!142))) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!319365 () Bool)

(assert (=> b!553828 e!319365))

(declare-fun res!346378 () Bool)

(assert (=> b!553828 (=> (not res!346378) (not e!319365))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34900 (_ BitVec 32)) Bool)

(assert (=> b!553828 (= res!346378 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17172 0))(
  ( (Unit!17173) )
))
(declare-fun lt!251442 () Unit!17172)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34900 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17172)

(assert (=> b!553828 (= lt!251442 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553829 () Bool)

(declare-fun res!346383 () Bool)

(declare-fun e!319368 () Bool)

(assert (=> b!553829 (=> (not res!346383) (not e!319368))))

(declare-datatypes ((List!10879 0))(
  ( (Nil!10876) (Cons!10875 (h!11860 (_ BitVec 64)) (t!17098 List!10879)) )
))
(declare-fun arrayNoDuplicates!0 (array!34900 (_ BitVec 32) List!10879) Bool)

(assert (=> b!553829 (= res!346383 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10876))))

(declare-fun b!553830 () Bool)

(assert (=> b!553830 (= e!319364 e!319368)))

(declare-fun res!346381 () Bool)

(assert (=> b!553830 (=> (not res!346381) (not e!319368))))

(declare-fun lt!251443 () SeekEntryResult!5206)

(assert (=> b!553830 (= res!346381 (or (= lt!251443 (MissingZero!5206 i!1132)) (= lt!251443 (MissingVacant!5206 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34900 (_ BitVec 32)) SeekEntryResult!5206)

(assert (=> b!553830 (= lt!251443 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553831 () Bool)

(declare-fun res!346380 () Bool)

(assert (=> b!553831 (=> (not res!346380) (not e!319368))))

(assert (=> b!553831 (= res!346380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553832 () Bool)

(assert (=> b!553832 (= e!319365 (= (seekEntryOrOpen!0 (select (arr!16760 a!3118) j!142) a!3118 mask!3119) (Found!5206 j!142)))))

(declare-fun b!553833 () Bool)

(declare-fun res!346384 () Bool)

(assert (=> b!553833 (=> (not res!346384) (not e!319364))))

(assert (=> b!553833 (= res!346384 (validKeyInArray!0 (select (arr!16760 a!3118) j!142)))))

(declare-fun b!553834 () Bool)

(declare-fun res!346379 () Bool)

(assert (=> b!553834 (=> (not res!346379) (not e!319364))))

(assert (=> b!553834 (= res!346379 (validKeyInArray!0 k0!1914))))

(declare-fun res!346388 () Bool)

(assert (=> start!50666 (=> (not res!346388) (not e!319364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50666 (= res!346388 (validMask!0 mask!3119))))

(assert (=> start!50666 e!319364))

(assert (=> start!50666 true))

(declare-fun array_inv!12643 (array!34900) Bool)

(assert (=> start!50666 (array_inv!12643 a!3118)))

(declare-fun b!553827 () Bool)

(assert (=> b!553827 (= e!319368 e!319363)))

(declare-fun res!346386 () Bool)

(assert (=> b!553827 (=> (not res!346386) (not e!319363))))

(declare-fun lt!251446 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34900 (_ BitVec 32)) SeekEntryResult!5206)

(assert (=> b!553827 (= res!346386 (= lt!251444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251446 (select (store (arr!16760 a!3118) i!1132 k0!1914) j!142) (array!34901 (store (arr!16760 a!3118) i!1132 k0!1914) (size!17125 a!3118)) mask!3119)))))

(declare-fun lt!251445 () (_ BitVec 32))

(assert (=> b!553827 (= lt!251444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251445 (select (arr!16760 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553827 (= lt!251446 (toIndex!0 (select (store (arr!16760 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!553827 (= lt!251445 (toIndex!0 (select (arr!16760 a!3118) j!142) mask!3119))))

(assert (= (and start!50666 res!346388) b!553826))

(assert (= (and b!553826 res!346387) b!553833))

(assert (= (and b!553833 res!346384) b!553834))

(assert (= (and b!553834 res!346379) b!553824))

(assert (= (and b!553824 res!346385) b!553830))

(assert (= (and b!553830 res!346381) b!553831))

(assert (= (and b!553831 res!346380) b!553829))

(assert (= (and b!553829 res!346383) b!553827))

(assert (= (and b!553827 res!346386) b!553828))

(assert (= (and b!553828 res!346378) b!553832))

(assert (= (and b!553828 (not res!346382)) b!553825))

(declare-fun m!530543 () Bool)

(assert (=> b!553827 m!530543))

(declare-fun m!530545 () Bool)

(assert (=> b!553827 m!530545))

(assert (=> b!553827 m!530543))

(declare-fun m!530547 () Bool)

(assert (=> b!553827 m!530547))

(assert (=> b!553827 m!530547))

(declare-fun m!530549 () Bool)

(assert (=> b!553827 m!530549))

(assert (=> b!553827 m!530547))

(declare-fun m!530551 () Bool)

(assert (=> b!553827 m!530551))

(declare-fun m!530553 () Bool)

(assert (=> b!553827 m!530553))

(assert (=> b!553827 m!530543))

(declare-fun m!530555 () Bool)

(assert (=> b!553827 m!530555))

(assert (=> b!553825 m!530553))

(assert (=> b!553825 m!530547))

(assert (=> b!553825 m!530547))

(declare-fun m!530557 () Bool)

(assert (=> b!553825 m!530557))

(declare-fun m!530559 () Bool)

(assert (=> b!553829 m!530559))

(declare-fun m!530561 () Bool)

(assert (=> b!553828 m!530561))

(assert (=> b!553828 m!530543))

(declare-fun m!530563 () Bool)

(assert (=> b!553828 m!530563))

(declare-fun m!530565 () Bool)

(assert (=> b!553828 m!530565))

(declare-fun m!530567 () Bool)

(assert (=> start!50666 m!530567))

(declare-fun m!530569 () Bool)

(assert (=> start!50666 m!530569))

(assert (=> b!553833 m!530543))

(assert (=> b!553833 m!530543))

(declare-fun m!530571 () Bool)

(assert (=> b!553833 m!530571))

(declare-fun m!530573 () Bool)

(assert (=> b!553834 m!530573))

(declare-fun m!530575 () Bool)

(assert (=> b!553824 m!530575))

(assert (=> b!553832 m!530543))

(assert (=> b!553832 m!530543))

(declare-fun m!530577 () Bool)

(assert (=> b!553832 m!530577))

(declare-fun m!530579 () Bool)

(assert (=> b!553830 m!530579))

(declare-fun m!530581 () Bool)

(assert (=> b!553831 m!530581))

(check-sat (not b!553828) (not b!553832) (not b!553829) (not b!553833) (not b!553827) (not b!553825) (not b!553834) (not start!50666) (not b!553831) (not b!553824) (not b!553830))
(check-sat)
