; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50656 () Bool)

(assert start!50656)

(declare-fun b!553763 () Bool)

(declare-fun res!346175 () Bool)

(declare-fun e!319392 () Bool)

(assert (=> b!553763 (=> (not res!346175) (not e!319392))))

(declare-datatypes ((array!34881 0))(
  ( (array!34882 (arr!16750 (Array (_ BitVec 32) (_ BitVec 64))) (size!17114 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34881)

(declare-datatypes ((List!10830 0))(
  ( (Nil!10827) (Cons!10826 (h!11811 (_ BitVec 64)) (t!17058 List!10830)) )
))
(declare-fun arrayNoDuplicates!0 (array!34881 (_ BitVec 32) List!10830) Bool)

(assert (=> b!553763 (= res!346175 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10827))))

(declare-fun b!553764 () Bool)

(assert (=> b!553764 (= e!319392 (not true))))

(declare-fun e!319393 () Bool)

(assert (=> b!553764 e!319393))

(declare-fun res!346177 () Bool)

(assert (=> b!553764 (=> (not res!346177) (not e!319393))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34881 (_ BitVec 32)) Bool)

(assert (=> b!553764 (= res!346177 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17172 0))(
  ( (Unit!17173) )
))
(declare-fun lt!251578 () Unit!17172)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34881 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17172)

(assert (=> b!553764 (= lt!251578 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!553765 () Bool)

(declare-fun res!346179 () Bool)

(assert (=> b!553765 (=> (not res!346179) (not e!319392))))

(assert (=> b!553765 (= res!346179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!346178 () Bool)

(declare-fun e!319394 () Bool)

(assert (=> start!50656 (=> (not res!346178) (not e!319394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50656 (= res!346178 (validMask!0 mask!3119))))

(assert (=> start!50656 e!319394))

(assert (=> start!50656 true))

(declare-fun array_inv!12546 (array!34881) Bool)

(assert (=> start!50656 (array_inv!12546 a!3118)))

(declare-fun b!553766 () Bool)

(declare-fun res!346184 () Bool)

(assert (=> b!553766 (=> (not res!346184) (not e!319392))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5199 0))(
  ( (MissingZero!5199 (index!23023 (_ BitVec 32))) (Found!5199 (index!23024 (_ BitVec 32))) (Intermediate!5199 (undefined!6011 Bool) (index!23025 (_ BitVec 32)) (x!51945 (_ BitVec 32))) (Undefined!5199) (MissingVacant!5199 (index!23026 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34881 (_ BitVec 32)) SeekEntryResult!5199)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553766 (= res!346184 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16750 a!3118) j!142) mask!3119) (select (arr!16750 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16750 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16750 a!3118) i!1132 k0!1914) j!142) (array!34882 (store (arr!16750 a!3118) i!1132 k0!1914) (size!17114 a!3118)) mask!3119)))))

(declare-fun b!553767 () Bool)

(assert (=> b!553767 (= e!319394 e!319392)))

(declare-fun res!346176 () Bool)

(assert (=> b!553767 (=> (not res!346176) (not e!319392))))

(declare-fun lt!251577 () SeekEntryResult!5199)

(assert (=> b!553767 (= res!346176 (or (= lt!251577 (MissingZero!5199 i!1132)) (= lt!251577 (MissingVacant!5199 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34881 (_ BitVec 32)) SeekEntryResult!5199)

(assert (=> b!553767 (= lt!251577 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553768 () Bool)

(declare-fun res!346183 () Bool)

(assert (=> b!553768 (=> (not res!346183) (not e!319394))))

(declare-fun arrayContainsKey!0 (array!34881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553768 (= res!346183 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553769 () Bool)

(declare-fun res!346181 () Bool)

(assert (=> b!553769 (=> (not res!346181) (not e!319394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553769 (= res!346181 (validKeyInArray!0 k0!1914))))

(declare-fun b!553770 () Bool)

(declare-fun res!346182 () Bool)

(assert (=> b!553770 (=> (not res!346182) (not e!319394))))

(assert (=> b!553770 (= res!346182 (and (= (size!17114 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17114 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17114 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553771 () Bool)

(assert (=> b!553771 (= e!319393 (= (seekEntryOrOpen!0 (select (arr!16750 a!3118) j!142) a!3118 mask!3119) (Found!5199 j!142)))))

(declare-fun b!553772 () Bool)

(declare-fun res!346180 () Bool)

(assert (=> b!553772 (=> (not res!346180) (not e!319394))))

(assert (=> b!553772 (= res!346180 (validKeyInArray!0 (select (arr!16750 a!3118) j!142)))))

(assert (= (and start!50656 res!346178) b!553770))

(assert (= (and b!553770 res!346182) b!553772))

(assert (= (and b!553772 res!346180) b!553769))

(assert (= (and b!553769 res!346181) b!553768))

(assert (= (and b!553768 res!346183) b!553767))

(assert (= (and b!553767 res!346176) b!553765))

(assert (= (and b!553765 res!346179) b!553763))

(assert (= (and b!553763 res!346175) b!553766))

(assert (= (and b!553766 res!346184) b!553764))

(assert (= (and b!553764 res!346177) b!553771))

(declare-fun m!530913 () Bool)

(assert (=> b!553766 m!530913))

(declare-fun m!530915 () Bool)

(assert (=> b!553766 m!530915))

(assert (=> b!553766 m!530913))

(declare-fun m!530917 () Bool)

(assert (=> b!553766 m!530917))

(declare-fun m!530919 () Bool)

(assert (=> b!553766 m!530919))

(assert (=> b!553766 m!530917))

(declare-fun m!530921 () Bool)

(assert (=> b!553766 m!530921))

(assert (=> b!553766 m!530915))

(assert (=> b!553766 m!530913))

(declare-fun m!530923 () Bool)

(assert (=> b!553766 m!530923))

(declare-fun m!530925 () Bool)

(assert (=> b!553766 m!530925))

(assert (=> b!553766 m!530917))

(assert (=> b!553766 m!530919))

(declare-fun m!530927 () Bool)

(assert (=> b!553763 m!530927))

(assert (=> b!553772 m!530913))

(assert (=> b!553772 m!530913))

(declare-fun m!530929 () Bool)

(assert (=> b!553772 m!530929))

(declare-fun m!530931 () Bool)

(assert (=> b!553764 m!530931))

(declare-fun m!530933 () Bool)

(assert (=> b!553764 m!530933))

(declare-fun m!530935 () Bool)

(assert (=> b!553769 m!530935))

(declare-fun m!530937 () Bool)

(assert (=> b!553765 m!530937))

(declare-fun m!530939 () Bool)

(assert (=> start!50656 m!530939))

(declare-fun m!530941 () Bool)

(assert (=> start!50656 m!530941))

(declare-fun m!530943 () Bool)

(assert (=> b!553768 m!530943))

(declare-fun m!530945 () Bool)

(assert (=> b!553767 m!530945))

(assert (=> b!553771 m!530913))

(assert (=> b!553771 m!530913))

(declare-fun m!530947 () Bool)

(assert (=> b!553771 m!530947))

(check-sat (not b!553772) (not b!553763) (not b!553764) (not b!553765) (not start!50656) (not b!553767) (not b!553768) (not b!553766) (not b!553771) (not b!553769))
(check-sat)
