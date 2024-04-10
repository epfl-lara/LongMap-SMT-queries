; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50722 () Bool)

(assert start!50722)

(declare-fun b!554739 () Bool)

(declare-fun e!319824 () Bool)

(declare-fun e!319825 () Bool)

(assert (=> b!554739 (= e!319824 e!319825)))

(declare-fun res!347156 () Bool)

(assert (=> b!554739 (=> (not res!347156) (not e!319825))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!251948 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34947 0))(
  ( (array!34948 (arr!16783 (Array (_ BitVec 32) (_ BitVec 64))) (size!17147 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34947)

(declare-datatypes ((SeekEntryResult!5232 0))(
  ( (MissingZero!5232 (index!23155 (_ BitVec 32))) (Found!5232 (index!23156 (_ BitVec 32))) (Intermediate!5232 (undefined!6044 Bool) (index!23157 (_ BitVec 32)) (x!52066 (_ BitVec 32))) (Undefined!5232) (MissingVacant!5232 (index!23158 (_ BitVec 32))) )
))
(declare-fun lt!251953 () SeekEntryResult!5232)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34947 (_ BitVec 32)) SeekEntryResult!5232)

(assert (=> b!554739 (= res!347156 (= lt!251953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251948 (select (store (arr!16783 a!3118) i!1132 k0!1914) j!142) (array!34948 (store (arr!16783 a!3118) i!1132 k0!1914) (size!17147 a!3118)) mask!3119)))))

(declare-fun lt!251950 () (_ BitVec 32))

(assert (=> b!554739 (= lt!251953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251950 (select (arr!16783 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554739 (= lt!251948 (toIndex!0 (select (store (arr!16783 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!554739 (= lt!251950 (toIndex!0 (select (arr!16783 a!3118) j!142) mask!3119))))

(declare-fun res!347153 () Bool)

(declare-fun e!319827 () Bool)

(assert (=> start!50722 (=> (not res!347153) (not e!319827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50722 (= res!347153 (validMask!0 mask!3119))))

(assert (=> start!50722 e!319827))

(assert (=> start!50722 true))

(declare-fun array_inv!12579 (array!34947) Bool)

(assert (=> start!50722 (array_inv!12579 a!3118)))

(declare-fun b!554740 () Bool)

(declare-fun res!347152 () Bool)

(assert (=> b!554740 (=> (not res!347152) (not e!319824))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34947 (_ BitVec 32)) Bool)

(assert (=> b!554740 (= res!347152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554741 () Bool)

(declare-fun res!347159 () Bool)

(assert (=> b!554741 (=> (not res!347159) (not e!319824))))

(declare-datatypes ((List!10863 0))(
  ( (Nil!10860) (Cons!10859 (h!11844 (_ BitVec 64)) (t!17091 List!10863)) )
))
(declare-fun arrayNoDuplicates!0 (array!34947 (_ BitVec 32) List!10863) Bool)

(assert (=> b!554741 (= res!347159 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10860))))

(declare-fun b!554742 () Bool)

(assert (=> b!554742 (= e!319827 e!319824)))

(declare-fun res!347154 () Bool)

(assert (=> b!554742 (=> (not res!347154) (not e!319824))))

(declare-fun lt!251952 () SeekEntryResult!5232)

(assert (=> b!554742 (= res!347154 (or (= lt!251952 (MissingZero!5232 i!1132)) (= lt!251952 (MissingVacant!5232 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34947 (_ BitVec 32)) SeekEntryResult!5232)

(assert (=> b!554742 (= lt!251952 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!554743 () Bool)

(declare-fun res!347155 () Bool)

(assert (=> b!554743 (=> (not res!347155) (not e!319827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554743 (= res!347155 (validKeyInArray!0 k0!1914))))

(declare-fun b!554744 () Bool)

(declare-fun res!347157 () Bool)

(assert (=> b!554744 (=> (not res!347157) (not e!319827))))

(assert (=> b!554744 (= res!347157 (and (= (size!17147 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17147 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17147 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554745 () Bool)

(assert (=> b!554745 (= e!319825 (not true))))

(declare-fun lt!251951 () SeekEntryResult!5232)

(get-info :version)

(assert (=> b!554745 (and (= lt!251951 (Found!5232 j!142)) (or (undefined!6044 lt!251953) (not ((_ is Intermediate!5232) lt!251953)) (= (select (arr!16783 a!3118) (index!23157 lt!251953)) (select (arr!16783 a!3118) j!142)) (not (= (select (arr!16783 a!3118) (index!23157 lt!251953)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!251951 (MissingZero!5232 (index!23157 lt!251953)))))))

(assert (=> b!554745 (= lt!251951 (seekEntryOrOpen!0 (select (arr!16783 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!554745 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17238 0))(
  ( (Unit!17239) )
))
(declare-fun lt!251949 () Unit!17238)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34947 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17238)

(assert (=> b!554745 (= lt!251949 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554746 () Bool)

(declare-fun res!347158 () Bool)

(assert (=> b!554746 (=> (not res!347158) (not e!319827))))

(declare-fun arrayContainsKey!0 (array!34947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554746 (= res!347158 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554747 () Bool)

(declare-fun res!347151 () Bool)

(assert (=> b!554747 (=> (not res!347151) (not e!319827))))

(assert (=> b!554747 (= res!347151 (validKeyInArray!0 (select (arr!16783 a!3118) j!142)))))

(assert (= (and start!50722 res!347153) b!554744))

(assert (= (and b!554744 res!347157) b!554747))

(assert (= (and b!554747 res!347151) b!554743))

(assert (= (and b!554743 res!347155) b!554746))

(assert (= (and b!554746 res!347158) b!554742))

(assert (= (and b!554742 res!347154) b!554740))

(assert (= (and b!554740 res!347152) b!554741))

(assert (= (and b!554741 res!347159) b!554739))

(assert (= (and b!554739 res!347156) b!554745))

(declare-fun m!532139 () Bool)

(assert (=> b!554743 m!532139))

(declare-fun m!532141 () Bool)

(assert (=> b!554741 m!532141))

(declare-fun m!532143 () Bool)

(assert (=> b!554742 m!532143))

(declare-fun m!532145 () Bool)

(assert (=> b!554745 m!532145))

(declare-fun m!532147 () Bool)

(assert (=> b!554745 m!532147))

(declare-fun m!532149 () Bool)

(assert (=> b!554745 m!532149))

(declare-fun m!532151 () Bool)

(assert (=> b!554745 m!532151))

(assert (=> b!554745 m!532145))

(declare-fun m!532153 () Bool)

(assert (=> b!554745 m!532153))

(declare-fun m!532155 () Bool)

(assert (=> b!554740 m!532155))

(declare-fun m!532157 () Bool)

(assert (=> b!554746 m!532157))

(declare-fun m!532159 () Bool)

(assert (=> start!50722 m!532159))

(declare-fun m!532161 () Bool)

(assert (=> start!50722 m!532161))

(assert (=> b!554747 m!532145))

(assert (=> b!554747 m!532145))

(declare-fun m!532163 () Bool)

(assert (=> b!554747 m!532163))

(assert (=> b!554739 m!532145))

(declare-fun m!532165 () Bool)

(assert (=> b!554739 m!532165))

(declare-fun m!532167 () Bool)

(assert (=> b!554739 m!532167))

(declare-fun m!532169 () Bool)

(assert (=> b!554739 m!532169))

(declare-fun m!532171 () Bool)

(assert (=> b!554739 m!532171))

(assert (=> b!554739 m!532145))

(assert (=> b!554739 m!532145))

(declare-fun m!532173 () Bool)

(assert (=> b!554739 m!532173))

(assert (=> b!554739 m!532169))

(assert (=> b!554739 m!532169))

(declare-fun m!532175 () Bool)

(assert (=> b!554739 m!532175))

(check-sat (not b!554743) (not b!554740) (not start!50722) (not b!554739) (not b!554741) (not b!554742) (not b!554745) (not b!554746) (not b!554747))
(check-sat)
