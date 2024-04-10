; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51748 () Bool)

(assert start!51748)

(declare-fun b!566213 () Bool)

(declare-fun res!357184 () Bool)

(declare-fun e!325870 () Bool)

(assert (=> b!566213 (=> (not res!357184) (not e!325870))))

(declare-datatypes ((array!35556 0))(
  ( (array!35557 (arr!17077 (Array (_ BitVec 32) (_ BitVec 64))) (size!17441 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35556)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566213 (= res!357184 (validKeyInArray!0 (select (arr!17077 a!3118) j!142)))))

(declare-fun res!357185 () Bool)

(assert (=> start!51748 (=> (not res!357185) (not e!325870))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51748 (= res!357185 (validMask!0 mask!3119))))

(assert (=> start!51748 e!325870))

(assert (=> start!51748 true))

(declare-fun array_inv!12873 (array!35556) Bool)

(assert (=> start!51748 (array_inv!12873 a!3118)))

(declare-fun b!566214 () Bool)

(declare-fun res!357186 () Bool)

(assert (=> b!566214 (=> (not res!357186) (not e!325870))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566214 (= res!357186 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566215 () Bool)

(declare-fun res!357187 () Bool)

(declare-fun e!325872 () Bool)

(assert (=> b!566215 (=> (not res!357187) (not e!325872))))

(declare-datatypes ((List!11157 0))(
  ( (Nil!11154) (Cons!11153 (h!12159 (_ BitVec 64)) (t!17385 List!11157)) )
))
(declare-fun arrayNoDuplicates!0 (array!35556 (_ BitVec 32) List!11157) Bool)

(assert (=> b!566215 (= res!357187 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11154))))

(declare-fun b!566216 () Bool)

(assert (=> b!566216 (= e!325870 e!325872)))

(declare-fun res!357182 () Bool)

(assert (=> b!566216 (=> (not res!357182) (not e!325872))))

(declare-datatypes ((SeekEntryResult!5526 0))(
  ( (MissingZero!5526 (index!24331 (_ BitVec 32))) (Found!5526 (index!24332 (_ BitVec 32))) (Intermediate!5526 (undefined!6338 Bool) (index!24333 (_ BitVec 32)) (x!53195 (_ BitVec 32))) (Undefined!5526) (MissingVacant!5526 (index!24334 (_ BitVec 32))) )
))
(declare-fun lt!258042 () SeekEntryResult!5526)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!566216 (= res!357182 (or (= lt!258042 (MissingZero!5526 i!1132)) (= lt!258042 (MissingVacant!5526 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35556 (_ BitVec 32)) SeekEntryResult!5526)

(assert (=> b!566216 (= lt!258042 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun e!325869 () Bool)

(declare-fun b!566217 () Bool)

(assert (=> b!566217 (= e!325869 (= (seekEntryOrOpen!0 (select (arr!17077 a!3118) j!142) a!3118 mask!3119) (Found!5526 j!142)))))

(declare-fun b!566218 () Bool)

(declare-fun res!357190 () Bool)

(assert (=> b!566218 (=> (not res!357190) (not e!325870))))

(assert (=> b!566218 (= res!357190 (validKeyInArray!0 k0!1914))))

(declare-fun b!566219 () Bool)

(declare-fun res!357191 () Bool)

(assert (=> b!566219 (=> (not res!357191) (not e!325870))))

(assert (=> b!566219 (= res!357191 (and (= (size!17441 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17441 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17441 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566220 () Bool)

(declare-fun res!357183 () Bool)

(assert (=> b!566220 (=> (not res!357183) (not e!325872))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35556 (_ BitVec 32)) SeekEntryResult!5526)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566220 (= res!357183 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17077 a!3118) j!142) mask!3119) (select (arr!17077 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17077 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17077 a!3118) i!1132 k0!1914) j!142) (array!35557 (store (arr!17077 a!3118) i!1132 k0!1914) (size!17441 a!3118)) mask!3119)))))

(declare-fun b!566221 () Bool)

(declare-fun res!357188 () Bool)

(assert (=> b!566221 (=> (not res!357188) (not e!325872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35556 (_ BitVec 32)) Bool)

(assert (=> b!566221 (= res!357188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!566222 () Bool)

(assert (=> b!566222 (= e!325872 (not true))))

(assert (=> b!566222 e!325869))

(declare-fun res!357189 () Bool)

(assert (=> b!566222 (=> (not res!357189) (not e!325869))))

(assert (=> b!566222 (= res!357189 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17754 0))(
  ( (Unit!17755) )
))
(declare-fun lt!258043 () Unit!17754)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17754)

(assert (=> b!566222 (= lt!258043 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51748 res!357185) b!566219))

(assert (= (and b!566219 res!357191) b!566213))

(assert (= (and b!566213 res!357184) b!566218))

(assert (= (and b!566218 res!357190) b!566214))

(assert (= (and b!566214 res!357186) b!566216))

(assert (= (and b!566216 res!357182) b!566221))

(assert (= (and b!566221 res!357188) b!566215))

(assert (= (and b!566215 res!357187) b!566220))

(assert (= (and b!566220 res!357183) b!566222))

(assert (= (and b!566222 res!357189) b!566217))

(declare-fun m!544827 () Bool)

(assert (=> b!566222 m!544827))

(declare-fun m!544829 () Bool)

(assert (=> b!566222 m!544829))

(declare-fun m!544831 () Bool)

(assert (=> start!51748 m!544831))

(declare-fun m!544833 () Bool)

(assert (=> start!51748 m!544833))

(declare-fun m!544835 () Bool)

(assert (=> b!566215 m!544835))

(declare-fun m!544837 () Bool)

(assert (=> b!566213 m!544837))

(assert (=> b!566213 m!544837))

(declare-fun m!544839 () Bool)

(assert (=> b!566213 m!544839))

(assert (=> b!566217 m!544837))

(assert (=> b!566217 m!544837))

(declare-fun m!544841 () Bool)

(assert (=> b!566217 m!544841))

(declare-fun m!544843 () Bool)

(assert (=> b!566218 m!544843))

(assert (=> b!566220 m!544837))

(declare-fun m!544845 () Bool)

(assert (=> b!566220 m!544845))

(assert (=> b!566220 m!544837))

(declare-fun m!544847 () Bool)

(assert (=> b!566220 m!544847))

(declare-fun m!544849 () Bool)

(assert (=> b!566220 m!544849))

(assert (=> b!566220 m!544847))

(declare-fun m!544851 () Bool)

(assert (=> b!566220 m!544851))

(assert (=> b!566220 m!544845))

(assert (=> b!566220 m!544837))

(declare-fun m!544853 () Bool)

(assert (=> b!566220 m!544853))

(declare-fun m!544855 () Bool)

(assert (=> b!566220 m!544855))

(assert (=> b!566220 m!544847))

(assert (=> b!566220 m!544849))

(declare-fun m!544857 () Bool)

(assert (=> b!566216 m!544857))

(declare-fun m!544859 () Bool)

(assert (=> b!566221 m!544859))

(declare-fun m!544861 () Bool)

(assert (=> b!566214 m!544861))

(check-sat (not b!566213) (not b!566218) (not b!566222) (not b!566214) (not b!566215) (not b!566221) (not start!51748) (not b!566217) (not b!566220) (not b!566216))
(check-sat)
