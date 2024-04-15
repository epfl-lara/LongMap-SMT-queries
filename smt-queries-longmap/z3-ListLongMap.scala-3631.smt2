; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50102 () Bool)

(assert start!50102)

(declare-fun b!548568 () Bool)

(declare-fun res!341946 () Bool)

(declare-fun e!316887 () Bool)

(assert (=> b!548568 (=> (not res!341946) (not e!316887))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!548568 (= res!341946 (validKeyInArray!0 k0!1914))))

(declare-fun b!548569 () Bool)

(declare-fun res!341942 () Bool)

(assert (=> b!548569 (=> (not res!341942) (not e!316887))))

(declare-datatypes ((array!34609 0))(
  ( (array!34610 (arr!16622 (Array (_ BitVec 32) (_ BitVec 64))) (size!16987 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34609)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!548569 (= res!341942 (validKeyInArray!0 (select (arr!16622 a!3118) j!142)))))

(declare-fun b!548570 () Bool)

(declare-fun res!341948 () Bool)

(declare-fun e!316885 () Bool)

(assert (=> b!548570 (=> (not res!341948) (not e!316885))))

(declare-datatypes ((List!10741 0))(
  ( (Nil!10738) (Cons!10737 (h!11707 (_ BitVec 64)) (t!16960 List!10741)) )
))
(declare-fun arrayNoDuplicates!0 (array!34609 (_ BitVec 32) List!10741) Bool)

(assert (=> b!548570 (= res!341948 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10738))))

(declare-fun b!548571 () Bool)

(declare-fun res!341944 () Bool)

(assert (=> b!548571 (=> (not res!341944) (not e!316887))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!548571 (= res!341944 (and (= (size!16987 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16987 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16987 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!548572 () Bool)

(declare-fun res!341941 () Bool)

(assert (=> b!548572 (=> (not res!341941) (not e!316885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34609 (_ BitVec 32)) Bool)

(assert (=> b!548572 (= res!341941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!341945 () Bool)

(assert (=> start!50102 (=> (not res!341945) (not e!316887))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50102 (= res!341945 (validMask!0 mask!3119))))

(assert (=> start!50102 e!316887))

(assert (=> start!50102 true))

(declare-fun array_inv!12505 (array!34609) Bool)

(assert (=> start!50102 (array_inv!12505 a!3118)))

(declare-fun b!548573 () Bool)

(assert (=> b!548573 (= e!316887 e!316885)))

(declare-fun res!341943 () Bool)

(assert (=> b!548573 (=> (not res!341943) (not e!316885))))

(declare-datatypes ((SeekEntryResult!5068 0))(
  ( (MissingZero!5068 (index!22499 (_ BitVec 32))) (Found!5068 (index!22500 (_ BitVec 32))) (Intermediate!5068 (undefined!5880 Bool) (index!22501 (_ BitVec 32)) (x!51446 (_ BitVec 32))) (Undefined!5068) (MissingVacant!5068 (index!22502 (_ BitVec 32))) )
))
(declare-fun lt!249705 () SeekEntryResult!5068)

(assert (=> b!548573 (= res!341943 (or (= lt!249705 (MissingZero!5068 i!1132)) (= lt!249705 (MissingVacant!5068 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34609 (_ BitVec 32)) SeekEntryResult!5068)

(assert (=> b!548573 (= lt!249705 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!548574 () Bool)

(assert (=> b!548574 (= e!316885 false)))

(declare-fun lt!249706 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!548574 (= lt!249706 (toIndex!0 (select (store (arr!16622 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(declare-fun b!548575 () Bool)

(declare-fun res!341947 () Bool)

(assert (=> b!548575 (=> (not res!341947) (not e!316887))))

(declare-fun arrayContainsKey!0 (array!34609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!548575 (= res!341947 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50102 res!341945) b!548571))

(assert (= (and b!548571 res!341944) b!548569))

(assert (= (and b!548569 res!341942) b!548568))

(assert (= (and b!548568 res!341946) b!548575))

(assert (= (and b!548575 res!341947) b!548573))

(assert (= (and b!548573 res!341943) b!548572))

(assert (= (and b!548572 res!341941) b!548570))

(assert (= (and b!548570 res!341948) b!548574))

(declare-fun m!524975 () Bool)

(assert (=> b!548569 m!524975))

(assert (=> b!548569 m!524975))

(declare-fun m!524977 () Bool)

(assert (=> b!548569 m!524977))

(declare-fun m!524979 () Bool)

(assert (=> start!50102 m!524979))

(declare-fun m!524981 () Bool)

(assert (=> start!50102 m!524981))

(declare-fun m!524983 () Bool)

(assert (=> b!548570 m!524983))

(declare-fun m!524985 () Bool)

(assert (=> b!548573 m!524985))

(declare-fun m!524987 () Bool)

(assert (=> b!548568 m!524987))

(declare-fun m!524989 () Bool)

(assert (=> b!548572 m!524989))

(declare-fun m!524991 () Bool)

(assert (=> b!548574 m!524991))

(declare-fun m!524993 () Bool)

(assert (=> b!548574 m!524993))

(assert (=> b!548574 m!524993))

(declare-fun m!524995 () Bool)

(assert (=> b!548574 m!524995))

(declare-fun m!524997 () Bool)

(assert (=> b!548575 m!524997))

(check-sat (not b!548573) (not start!50102) (not b!548572) (not b!548569) (not b!548574) (not b!548568) (not b!548570) (not b!548575))
(check-sat)
