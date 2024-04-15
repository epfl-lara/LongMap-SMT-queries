; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52598 () Bool)

(assert start!52598)

(declare-fun res!362881 () Bool)

(declare-fun e!330090 () Bool)

(assert (=> start!52598 (=> (not res!362881) (not e!330090))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52598 (= res!362881 (validMask!0 mask!3119))))

(assert (=> start!52598 e!330090))

(assert (=> start!52598 true))

(declare-datatypes ((array!35878 0))(
  ( (array!35879 (arr!17225 (Array (_ BitVec 32) (_ BitVec 64))) (size!17590 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35878)

(declare-fun array_inv!13108 (array!35878) Bool)

(assert (=> start!52598 (array_inv!13108 a!3118)))

(declare-fun b!573775 () Bool)

(declare-fun e!330083 () Bool)

(declare-fun e!330086 () Bool)

(assert (=> b!573775 (= e!330083 e!330086)))

(declare-fun res!362889 () Bool)

(assert (=> b!573775 (=> res!362889 e!330086)))

(declare-datatypes ((SeekEntryResult!5671 0))(
  ( (MissingZero!5671 (index!24911 (_ BitVec 32))) (Found!5671 (index!24912 (_ BitVec 32))) (Intermediate!5671 (undefined!6483 Bool) (index!24913 (_ BitVec 32)) (x!53801 (_ BitVec 32))) (Undefined!5671) (MissingVacant!5671 (index!24914 (_ BitVec 32))) )
))
(declare-fun lt!261914 () SeekEntryResult!5671)

(get-info :version)

(assert (=> b!573775 (= res!362889 (or (undefined!6483 lt!261914) (not ((_ is Intermediate!5671) lt!261914))))))

(declare-fun b!573776 () Bool)

(declare-fun res!362883 () Bool)

(assert (=> b!573776 (=> (not res!362883) (not e!330090))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!573776 (= res!362883 (and (= (size!17590 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17590 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17590 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!573777 () Bool)

(declare-fun res!362888 () Bool)

(assert (=> b!573777 (=> (not res!362888) (not e!330090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!573777 (= res!362888 (validKeyInArray!0 (select (arr!17225 a!3118) j!142)))))

(declare-fun b!573778 () Bool)

(declare-fun res!362890 () Bool)

(assert (=> b!573778 (=> (not res!362890) (not e!330090))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!573778 (= res!362890 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!573779 () Bool)

(declare-fun e!330087 () Bool)

(assert (=> b!573779 (= e!330090 e!330087)))

(declare-fun res!362886 () Bool)

(assert (=> b!573779 (=> (not res!362886) (not e!330087))))

(declare-fun lt!261915 () SeekEntryResult!5671)

(assert (=> b!573779 (= res!362886 (or (= lt!261915 (MissingZero!5671 i!1132)) (= lt!261915 (MissingVacant!5671 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35878 (_ BitVec 32)) SeekEntryResult!5671)

(assert (=> b!573779 (= lt!261915 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!573780 () Bool)

(declare-fun e!330084 () Bool)

(declare-fun e!330085 () Bool)

(assert (=> b!573780 (= e!330084 e!330085)))

(declare-fun res!362882 () Bool)

(assert (=> b!573780 (=> (not res!362882) (not e!330085))))

(declare-fun lt!261913 () SeekEntryResult!5671)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35878 (_ BitVec 32)) SeekEntryResult!5671)

(assert (=> b!573780 (= res!362882 (= lt!261913 (seekKeyOrZeroReturnVacant!0 (x!53801 lt!261914) (index!24913 lt!261914) (index!24913 lt!261914) (select (arr!17225 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!573781 () Bool)

(declare-fun res!362885 () Bool)

(assert (=> b!573781 (=> (not res!362885) (not e!330090))))

(assert (=> b!573781 (= res!362885 (validKeyInArray!0 k0!1914))))

(declare-fun b!573782 () Bool)

(declare-fun res!362884 () Bool)

(assert (=> b!573782 (=> (not res!362884) (not e!330087))))

(declare-datatypes ((List!11344 0))(
  ( (Nil!11341) (Cons!11340 (h!12373 (_ BitVec 64)) (t!17563 List!11344)) )
))
(declare-fun arrayNoDuplicates!0 (array!35878 (_ BitVec 32) List!11344) Bool)

(assert (=> b!573782 (= res!362884 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11341))))

(declare-fun b!573783 () Bool)

(declare-fun e!330088 () Bool)

(assert (=> b!573783 (= e!330088 (not true))))

(assert (=> b!573783 e!330083))

(declare-fun res!362891 () Bool)

(assert (=> b!573783 (=> (not res!362891) (not e!330083))))

(assert (=> b!573783 (= res!362891 (= lt!261913 (Found!5671 j!142)))))

(assert (=> b!573783 (= lt!261913 (seekEntryOrOpen!0 (select (arr!17225 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35878 (_ BitVec 32)) Bool)

(assert (=> b!573783 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18030 0))(
  ( (Unit!18031) )
))
(declare-fun lt!261919 () Unit!18030)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18030)

(assert (=> b!573783 (= lt!261919 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!573784 () Bool)

(assert (=> b!573784 (= e!330087 e!330088)))

(declare-fun res!362879 () Bool)

(assert (=> b!573784 (=> (not res!362879) (not e!330088))))

(declare-fun lt!261918 () array!35878)

(declare-fun lt!261912 () (_ BitVec 32))

(declare-fun lt!261916 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35878 (_ BitVec 32)) SeekEntryResult!5671)

(assert (=> b!573784 (= res!362879 (= lt!261914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261912 lt!261916 lt!261918 mask!3119)))))

(declare-fun lt!261917 () (_ BitVec 32))

(assert (=> b!573784 (= lt!261914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261917 (select (arr!17225 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573784 (= lt!261912 (toIndex!0 lt!261916 mask!3119))))

(assert (=> b!573784 (= lt!261916 (select (store (arr!17225 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!573784 (= lt!261917 (toIndex!0 (select (arr!17225 a!3118) j!142) mask!3119))))

(assert (=> b!573784 (= lt!261918 (array!35879 (store (arr!17225 a!3118) i!1132 k0!1914) (size!17590 a!3118)))))

(declare-fun b!573785 () Bool)

(declare-fun res!362880 () Bool)

(assert (=> b!573785 (=> (not res!362880) (not e!330087))))

(assert (=> b!573785 (= res!362880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!573786 () Bool)

(assert (=> b!573786 (= e!330086 e!330084)))

(declare-fun res!362887 () Bool)

(assert (=> b!573786 (=> res!362887 e!330084)))

(declare-fun lt!261911 () (_ BitVec 64))

(assert (=> b!573786 (= res!362887 (or (= lt!261911 (select (arr!17225 a!3118) j!142)) (= lt!261911 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!573786 (= lt!261911 (select (arr!17225 a!3118) (index!24913 lt!261914)))))

(declare-fun b!573787 () Bool)

(assert (=> b!573787 (= e!330085 (= (seekEntryOrOpen!0 lt!261916 lt!261918 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53801 lt!261914) (index!24913 lt!261914) (index!24913 lt!261914) lt!261916 lt!261918 mask!3119)))))

(assert (= (and start!52598 res!362881) b!573776))

(assert (= (and b!573776 res!362883) b!573777))

(assert (= (and b!573777 res!362888) b!573781))

(assert (= (and b!573781 res!362885) b!573778))

(assert (= (and b!573778 res!362890) b!573779))

(assert (= (and b!573779 res!362886) b!573785))

(assert (= (and b!573785 res!362880) b!573782))

(assert (= (and b!573782 res!362884) b!573784))

(assert (= (and b!573784 res!362879) b!573783))

(assert (= (and b!573783 res!362891) b!573775))

(assert (= (and b!573775 (not res!362889)) b!573786))

(assert (= (and b!573786 (not res!362887)) b!573780))

(assert (= (and b!573780 res!362882) b!573787))

(declare-fun m!552173 () Bool)

(assert (=> b!573785 m!552173))

(declare-fun m!552175 () Bool)

(assert (=> b!573784 m!552175))

(declare-fun m!552177 () Bool)

(assert (=> b!573784 m!552177))

(declare-fun m!552179 () Bool)

(assert (=> b!573784 m!552179))

(assert (=> b!573784 m!552175))

(declare-fun m!552181 () Bool)

(assert (=> b!573784 m!552181))

(declare-fun m!552183 () Bool)

(assert (=> b!573784 m!552183))

(declare-fun m!552185 () Bool)

(assert (=> b!573784 m!552185))

(declare-fun m!552187 () Bool)

(assert (=> b!573784 m!552187))

(assert (=> b!573784 m!552175))

(assert (=> b!573783 m!552175))

(assert (=> b!573783 m!552175))

(declare-fun m!552189 () Bool)

(assert (=> b!573783 m!552189))

(declare-fun m!552191 () Bool)

(assert (=> b!573783 m!552191))

(declare-fun m!552193 () Bool)

(assert (=> b!573783 m!552193))

(declare-fun m!552195 () Bool)

(assert (=> b!573778 m!552195))

(assert (=> b!573777 m!552175))

(assert (=> b!573777 m!552175))

(declare-fun m!552197 () Bool)

(assert (=> b!573777 m!552197))

(declare-fun m!552199 () Bool)

(assert (=> b!573787 m!552199))

(declare-fun m!552201 () Bool)

(assert (=> b!573787 m!552201))

(assert (=> b!573786 m!552175))

(declare-fun m!552203 () Bool)

(assert (=> b!573786 m!552203))

(declare-fun m!552205 () Bool)

(assert (=> b!573782 m!552205))

(assert (=> b!573780 m!552175))

(assert (=> b!573780 m!552175))

(declare-fun m!552207 () Bool)

(assert (=> b!573780 m!552207))

(declare-fun m!552209 () Bool)

(assert (=> b!573779 m!552209))

(declare-fun m!552211 () Bool)

(assert (=> start!52598 m!552211))

(declare-fun m!552213 () Bool)

(assert (=> start!52598 m!552213))

(declare-fun m!552215 () Bool)

(assert (=> b!573781 m!552215))

(check-sat (not b!573785) (not b!573782) (not b!573783) (not b!573778) (not start!52598) (not b!573784) (not b!573777) (not b!573780) (not b!573781) (not b!573787) (not b!573779))
(check-sat)
