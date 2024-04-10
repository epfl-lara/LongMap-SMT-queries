; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51526 () Bool)

(assert start!51526)

(declare-fun b!563735 () Bool)

(declare-fun res!354891 () Bool)

(declare-fun e!324819 () Bool)

(assert (=> b!563735 (=> (not res!354891) (not e!324819))))

(declare-datatypes ((array!35391 0))(
  ( (array!35392 (arr!16996 (Array (_ BitVec 32) (_ BitVec 64))) (size!17360 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35391)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563735 (= res!354891 (validKeyInArray!0 (select (arr!16996 a!3118) j!142)))))

(declare-fun e!324816 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5445 0))(
  ( (MissingZero!5445 (index!24007 (_ BitVec 32))) (Found!5445 (index!24008 (_ BitVec 32))) (Intermediate!5445 (undefined!6257 Bool) (index!24009 (_ BitVec 32)) (x!52892 (_ BitVec 32))) (Undefined!5445) (MissingVacant!5445 (index!24010 (_ BitVec 32))) )
))
(declare-fun lt!257315 () SeekEntryResult!5445)

(declare-fun lt!257314 () Bool)

(declare-fun b!563736 () Bool)

(assert (=> b!563736 (= e!324816 (not (or (and (not lt!257314) (undefined!6257 lt!257315)) (and (not lt!257314) (not (undefined!6257 lt!257315))) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(get-info :version)

(assert (=> b!563736 (= lt!257314 (not ((_ is Intermediate!5445) lt!257315)))))

(declare-fun e!324817 () Bool)

(assert (=> b!563736 e!324817))

(declare-fun res!354888 () Bool)

(assert (=> b!563736 (=> (not res!354888) (not e!324817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35391 (_ BitVec 32)) Bool)

(assert (=> b!563736 (= res!354888 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17664 0))(
  ( (Unit!17665) )
))
(declare-fun lt!257313 () Unit!17664)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35391 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17664)

(assert (=> b!563736 (= lt!257313 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563737 () Bool)

(declare-fun res!354894 () Bool)

(declare-fun e!324818 () Bool)

(assert (=> b!563737 (=> (not res!354894) (not e!324818))))

(assert (=> b!563737 (= res!354894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!563738 () Bool)

(declare-fun res!354895 () Bool)

(assert (=> b!563738 (=> (not res!354895) (not e!324819))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563738 (= res!354895 (and (= (size!17360 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17360 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17360 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563739 () Bool)

(assert (=> b!563739 (= e!324819 e!324818)))

(declare-fun res!354893 () Bool)

(assert (=> b!563739 (=> (not res!354893) (not e!324818))))

(declare-fun lt!257317 () SeekEntryResult!5445)

(assert (=> b!563739 (= res!354893 (or (= lt!257317 (MissingZero!5445 i!1132)) (= lt!257317 (MissingVacant!5445 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35391 (_ BitVec 32)) SeekEntryResult!5445)

(assert (=> b!563739 (= lt!257317 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563740 () Bool)

(declare-fun res!354892 () Bool)

(assert (=> b!563740 (=> (not res!354892) (not e!324819))))

(assert (=> b!563740 (= res!354892 (validKeyInArray!0 k0!1914))))

(declare-fun res!354896 () Bool)

(assert (=> start!51526 (=> (not res!354896) (not e!324819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51526 (= res!354896 (validMask!0 mask!3119))))

(assert (=> start!51526 e!324819))

(assert (=> start!51526 true))

(declare-fun array_inv!12792 (array!35391) Bool)

(assert (=> start!51526 (array_inv!12792 a!3118)))

(declare-fun b!563741 () Bool)

(assert (=> b!563741 (= e!324817 (= (seekEntryOrOpen!0 (select (arr!16996 a!3118) j!142) a!3118 mask!3119) (Found!5445 j!142)))))

(declare-fun b!563742 () Bool)

(assert (=> b!563742 (= e!324818 e!324816)))

(declare-fun res!354887 () Bool)

(assert (=> b!563742 (=> (not res!354887) (not e!324816))))

(declare-fun lt!257312 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35391 (_ BitVec 32)) SeekEntryResult!5445)

(assert (=> b!563742 (= res!354887 (= lt!257315 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257312 (select (store (arr!16996 a!3118) i!1132 k0!1914) j!142) (array!35392 (store (arr!16996 a!3118) i!1132 k0!1914) (size!17360 a!3118)) mask!3119)))))

(declare-fun lt!257316 () (_ BitVec 32))

(assert (=> b!563742 (= lt!257315 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257316 (select (arr!16996 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563742 (= lt!257312 (toIndex!0 (select (store (arr!16996 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!563742 (= lt!257316 (toIndex!0 (select (arr!16996 a!3118) j!142) mask!3119))))

(declare-fun b!563743 () Bool)

(declare-fun res!354889 () Bool)

(assert (=> b!563743 (=> (not res!354889) (not e!324818))))

(declare-datatypes ((List!11076 0))(
  ( (Nil!11073) (Cons!11072 (h!12075 (_ BitVec 64)) (t!17304 List!11076)) )
))
(declare-fun arrayNoDuplicates!0 (array!35391 (_ BitVec 32) List!11076) Bool)

(assert (=> b!563743 (= res!354889 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11073))))

(declare-fun b!563744 () Bool)

(declare-fun res!354890 () Bool)

(assert (=> b!563744 (=> (not res!354890) (not e!324819))))

(declare-fun arrayContainsKey!0 (array!35391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563744 (= res!354890 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51526 res!354896) b!563738))

(assert (= (and b!563738 res!354895) b!563735))

(assert (= (and b!563735 res!354891) b!563740))

(assert (= (and b!563740 res!354892) b!563744))

(assert (= (and b!563744 res!354890) b!563739))

(assert (= (and b!563739 res!354893) b!563737))

(assert (= (and b!563737 res!354894) b!563743))

(assert (= (and b!563743 res!354889) b!563742))

(assert (= (and b!563742 res!354887) b!563736))

(assert (= (and b!563736 res!354888) b!563741))

(declare-fun m!542139 () Bool)

(assert (=> b!563741 m!542139))

(assert (=> b!563741 m!542139))

(declare-fun m!542141 () Bool)

(assert (=> b!563741 m!542141))

(declare-fun m!542143 () Bool)

(assert (=> b!563744 m!542143))

(assert (=> b!563735 m!542139))

(assert (=> b!563735 m!542139))

(declare-fun m!542145 () Bool)

(assert (=> b!563735 m!542145))

(declare-fun m!542147 () Bool)

(assert (=> b!563736 m!542147))

(declare-fun m!542149 () Bool)

(assert (=> b!563736 m!542149))

(declare-fun m!542151 () Bool)

(assert (=> b!563743 m!542151))

(assert (=> b!563742 m!542139))

(declare-fun m!542153 () Bool)

(assert (=> b!563742 m!542153))

(assert (=> b!563742 m!542139))

(declare-fun m!542155 () Bool)

(assert (=> b!563742 m!542155))

(assert (=> b!563742 m!542155))

(declare-fun m!542157 () Bool)

(assert (=> b!563742 m!542157))

(declare-fun m!542159 () Bool)

(assert (=> b!563742 m!542159))

(assert (=> b!563742 m!542139))

(declare-fun m!542161 () Bool)

(assert (=> b!563742 m!542161))

(assert (=> b!563742 m!542155))

(declare-fun m!542163 () Bool)

(assert (=> b!563742 m!542163))

(declare-fun m!542165 () Bool)

(assert (=> b!563740 m!542165))

(declare-fun m!542167 () Bool)

(assert (=> b!563737 m!542167))

(declare-fun m!542169 () Bool)

(assert (=> start!51526 m!542169))

(declare-fun m!542171 () Bool)

(assert (=> start!51526 m!542171))

(declare-fun m!542173 () Bool)

(assert (=> b!563739 m!542173))

(check-sat (not b!563741) (not b!563742) (not b!563739) (not b!563736) (not start!51526) (not b!563737) (not b!563743) (not b!563744) (not b!563740) (not b!563735))
(check-sat)
