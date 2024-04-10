; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50668 () Bool)

(assert start!50668)

(declare-fun b!553943 () Bool)

(declare-fun e!319469 () Bool)

(declare-fun e!319472 () Bool)

(assert (=> b!553943 (= e!319469 e!319472)))

(declare-fun res!346357 () Bool)

(assert (=> b!553943 (=> (not res!346357) (not e!319472))))

(declare-datatypes ((SeekEntryResult!5205 0))(
  ( (MissingZero!5205 (index!23047 (_ BitVec 32))) (Found!5205 (index!23048 (_ BitVec 32))) (Intermediate!5205 (undefined!6017 Bool) (index!23049 (_ BitVec 32)) (x!51967 (_ BitVec 32))) (Undefined!5205) (MissingVacant!5205 (index!23050 (_ BitVec 32))) )
))
(declare-fun lt!251629 () SeekEntryResult!5205)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553943 (= res!346357 (or (= lt!251629 (MissingZero!5205 i!1132)) (= lt!251629 (MissingVacant!5205 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34893 0))(
  ( (array!34894 (arr!16756 (Array (_ BitVec 32) (_ BitVec 64))) (size!17120 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34893)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34893 (_ BitVec 32)) SeekEntryResult!5205)

(assert (=> b!553943 (= lt!251629 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553944 () Bool)

(declare-fun res!346363 () Bool)

(assert (=> b!553944 (=> (not res!346363) (not e!319472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34893 (_ BitVec 32)) Bool)

(assert (=> b!553944 (= res!346363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553945 () Bool)

(declare-fun e!319470 () Bool)

(assert (=> b!553945 (= e!319472 e!319470)))

(declare-fun res!346359 () Bool)

(assert (=> b!553945 (=> (not res!346359) (not e!319470))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!251630 () SeekEntryResult!5205)

(declare-fun lt!251628 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34893 (_ BitVec 32)) SeekEntryResult!5205)

(assert (=> b!553945 (= res!346359 (= lt!251630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251628 (select (store (arr!16756 a!3118) i!1132 k0!1914) j!142) (array!34894 (store (arr!16756 a!3118) i!1132 k0!1914) (size!17120 a!3118)) mask!3119)))))

(declare-fun lt!251631 () (_ BitVec 32))

(assert (=> b!553945 (= lt!251630 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251631 (select (arr!16756 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553945 (= lt!251628 (toIndex!0 (select (store (arr!16756 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!553945 (= lt!251631 (toIndex!0 (select (arr!16756 a!3118) j!142) mask!3119))))

(declare-fun b!553947 () Bool)

(declare-fun res!346356 () Bool)

(assert (=> b!553947 (=> (not res!346356) (not e!319469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553947 (= res!346356 (validKeyInArray!0 (select (arr!16756 a!3118) j!142)))))

(declare-fun b!553948 () Bool)

(get-info :version)

(assert (=> b!553948 (= e!319470 (not (or (not ((_ is Intermediate!5205) lt!251630)) (undefined!6017 lt!251630) (not (= (select (arr!16756 a!3118) (index!23049 lt!251630)) (select (arr!16756 a!3118) j!142))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!319471 () Bool)

(assert (=> b!553948 e!319471))

(declare-fun res!346355 () Bool)

(assert (=> b!553948 (=> (not res!346355) (not e!319471))))

(assert (=> b!553948 (= res!346355 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17184 0))(
  ( (Unit!17185) )
))
(declare-fun lt!251632 () Unit!17184)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17184)

(assert (=> b!553948 (= lt!251632 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553949 () Bool)

(declare-fun res!346361 () Bool)

(assert (=> b!553949 (=> (not res!346361) (not e!319469))))

(assert (=> b!553949 (= res!346361 (validKeyInArray!0 k0!1914))))

(declare-fun b!553950 () Bool)

(declare-fun res!346362 () Bool)

(assert (=> b!553950 (=> (not res!346362) (not e!319469))))

(assert (=> b!553950 (= res!346362 (and (= (size!17120 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17120 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17120 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553951 () Bool)

(assert (=> b!553951 (= e!319471 (= (seekEntryOrOpen!0 (select (arr!16756 a!3118) j!142) a!3118 mask!3119) (Found!5205 j!142)))))

(declare-fun b!553952 () Bool)

(declare-fun res!346360 () Bool)

(assert (=> b!553952 (=> (not res!346360) (not e!319469))))

(declare-fun arrayContainsKey!0 (array!34893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553952 (= res!346360 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553946 () Bool)

(declare-fun res!346358 () Bool)

(assert (=> b!553946 (=> (not res!346358) (not e!319472))))

(declare-datatypes ((List!10836 0))(
  ( (Nil!10833) (Cons!10832 (h!11817 (_ BitVec 64)) (t!17064 List!10836)) )
))
(declare-fun arrayNoDuplicates!0 (array!34893 (_ BitVec 32) List!10836) Bool)

(assert (=> b!553946 (= res!346358 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10833))))

(declare-fun res!346364 () Bool)

(assert (=> start!50668 (=> (not res!346364) (not e!319469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50668 (= res!346364 (validMask!0 mask!3119))))

(assert (=> start!50668 e!319469))

(assert (=> start!50668 true))

(declare-fun array_inv!12552 (array!34893) Bool)

(assert (=> start!50668 (array_inv!12552 a!3118)))

(assert (= (and start!50668 res!346364) b!553950))

(assert (= (and b!553950 res!346362) b!553947))

(assert (= (and b!553947 res!346356) b!553949))

(assert (= (and b!553949 res!346361) b!553952))

(assert (= (and b!553952 res!346360) b!553943))

(assert (= (and b!553943 res!346357) b!553944))

(assert (= (and b!553944 res!346363) b!553946))

(assert (= (and b!553946 res!346358) b!553945))

(assert (= (and b!553945 res!346359) b!553948))

(assert (= (and b!553948 res!346355) b!553951))

(declare-fun m!531131 () Bool)

(assert (=> start!50668 m!531131))

(declare-fun m!531133 () Bool)

(assert (=> start!50668 m!531133))

(declare-fun m!531135 () Bool)

(assert (=> b!553951 m!531135))

(assert (=> b!553951 m!531135))

(declare-fun m!531137 () Bool)

(assert (=> b!553951 m!531137))

(declare-fun m!531139 () Bool)

(assert (=> b!553948 m!531139))

(assert (=> b!553948 m!531135))

(declare-fun m!531141 () Bool)

(assert (=> b!553948 m!531141))

(declare-fun m!531143 () Bool)

(assert (=> b!553948 m!531143))

(declare-fun m!531145 () Bool)

(assert (=> b!553944 m!531145))

(assert (=> b!553947 m!531135))

(assert (=> b!553947 m!531135))

(declare-fun m!531147 () Bool)

(assert (=> b!553947 m!531147))

(declare-fun m!531149 () Bool)

(assert (=> b!553943 m!531149))

(declare-fun m!531151 () Bool)

(assert (=> b!553952 m!531151))

(declare-fun m!531153 () Bool)

(assert (=> b!553949 m!531153))

(declare-fun m!531155 () Bool)

(assert (=> b!553946 m!531155))

(assert (=> b!553945 m!531135))

(assert (=> b!553945 m!531135))

(declare-fun m!531157 () Bool)

(assert (=> b!553945 m!531157))

(declare-fun m!531159 () Bool)

(assert (=> b!553945 m!531159))

(declare-fun m!531161 () Bool)

(assert (=> b!553945 m!531161))

(assert (=> b!553945 m!531159))

(declare-fun m!531163 () Bool)

(assert (=> b!553945 m!531163))

(assert (=> b!553945 m!531135))

(declare-fun m!531165 () Bool)

(assert (=> b!553945 m!531165))

(assert (=> b!553945 m!531159))

(declare-fun m!531167 () Bool)

(assert (=> b!553945 m!531167))

(check-sat (not b!553946) (not b!553949) (not b!553948) (not b!553952) (not b!553943) (not b!553945) (not b!553947) (not b!553944) (not start!50668) (not b!553951))
(check-sat)
