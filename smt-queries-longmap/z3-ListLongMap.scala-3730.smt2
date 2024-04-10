; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51376 () Bool)

(assert start!51376)

(declare-fun b!561023 () Bool)

(declare-fun e!323270 () Bool)

(declare-fun e!323267 () Bool)

(assert (=> b!561023 (= e!323270 e!323267)))

(declare-fun res!352180 () Bool)

(assert (=> b!561023 (=> res!352180 e!323267)))

(declare-datatypes ((SeekEntryResult!5370 0))(
  ( (MissingZero!5370 (index!23707 (_ BitVec 32))) (Found!5370 (index!23708 (_ BitVec 32))) (Intermediate!5370 (undefined!6182 Bool) (index!23709 (_ BitVec 32)) (x!52617 (_ BitVec 32))) (Undefined!5370) (MissingVacant!5370 (index!23710 (_ BitVec 32))) )
))
(declare-fun lt!255223 () SeekEntryResult!5370)

(get-info :version)

(assert (=> b!561023 (= res!352180 (or (undefined!6182 lt!255223) (not ((_ is Intermediate!5370) lt!255223))))))

(declare-fun b!561024 () Bool)

(declare-fun res!352186 () Bool)

(declare-fun e!323266 () Bool)

(assert (=> b!561024 (=> (not res!352186) (not e!323266))))

(declare-datatypes ((array!35241 0))(
  ( (array!35242 (arr!16921 (Array (_ BitVec 32) (_ BitVec 64))) (size!17285 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35241)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35241 (_ BitVec 32)) Bool)

(assert (=> b!561024 (= res!352186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561025 () Bool)

(declare-fun res!352179 () Bool)

(declare-fun e!323269 () Bool)

(assert (=> b!561025 (=> (not res!352179) (not e!323269))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561025 (= res!352179 (validKeyInArray!0 (select (arr!16921 a!3118) j!142)))))

(declare-fun b!561026 () Bool)

(declare-fun e!323268 () Bool)

(assert (=> b!561026 (= e!323266 e!323268)))

(declare-fun res!352185 () Bool)

(assert (=> b!561026 (=> (not res!352185) (not e!323268))))

(declare-fun lt!255226 () (_ BitVec 64))

(declare-fun lt!255224 () array!35241)

(declare-fun lt!255221 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35241 (_ BitVec 32)) SeekEntryResult!5370)

(assert (=> b!561026 (= res!352185 (= lt!255223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255221 lt!255226 lt!255224 mask!3119)))))

(declare-fun lt!255227 () (_ BitVec 32))

(assert (=> b!561026 (= lt!255223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255227 (select (arr!16921 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561026 (= lt!255221 (toIndex!0 lt!255226 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561026 (= lt!255226 (select (store (arr!16921 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561026 (= lt!255227 (toIndex!0 (select (arr!16921 a!3118) j!142) mask!3119))))

(assert (=> b!561026 (= lt!255224 (array!35242 (store (arr!16921 a!3118) i!1132 k0!1914) (size!17285 a!3118)))))

(declare-fun b!561027 () Bool)

(declare-fun res!352183 () Bool)

(assert (=> b!561027 (=> (not res!352183) (not e!323269))))

(assert (=> b!561027 (= res!352183 (validKeyInArray!0 k0!1914))))

(declare-fun b!561028 () Bool)

(assert (=> b!561028 (= e!323269 e!323266)))

(declare-fun res!352182 () Bool)

(assert (=> b!561028 (=> (not res!352182) (not e!323266))))

(declare-fun lt!255225 () SeekEntryResult!5370)

(assert (=> b!561028 (= res!352182 (or (= lt!255225 (MissingZero!5370 i!1132)) (= lt!255225 (MissingVacant!5370 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35241 (_ BitVec 32)) SeekEntryResult!5370)

(assert (=> b!561028 (= lt!255225 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561029 () Bool)

(declare-fun res!352177 () Bool)

(assert (=> b!561029 (=> (not res!352177) (not e!323266))))

(declare-datatypes ((List!11001 0))(
  ( (Nil!10998) (Cons!10997 (h!12000 (_ BitVec 64)) (t!17229 List!11001)) )
))
(declare-fun arrayNoDuplicates!0 (array!35241 (_ BitVec 32) List!11001) Bool)

(assert (=> b!561029 (= res!352177 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10998))))

(declare-fun b!561030 () Bool)

(declare-fun e!323264 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35241 (_ BitVec 32)) SeekEntryResult!5370)

(assert (=> b!561030 (= e!323264 (= (seekEntryOrOpen!0 lt!255226 lt!255224 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52617 lt!255223) (index!23709 lt!255223) (index!23709 lt!255223) lt!255226 lt!255224 mask!3119)))))

(declare-fun res!352178 () Bool)

(assert (=> start!51376 (=> (not res!352178) (not e!323269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51376 (= res!352178 (validMask!0 mask!3119))))

(assert (=> start!51376 e!323269))

(assert (=> start!51376 true))

(declare-fun array_inv!12717 (array!35241) Bool)

(assert (=> start!51376 (array_inv!12717 a!3118)))

(declare-fun b!561031 () Bool)

(declare-fun res!352176 () Bool)

(assert (=> b!561031 (=> (not res!352176) (not e!323269))))

(declare-fun arrayContainsKey!0 (array!35241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561031 (= res!352176 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561032 () Bool)

(declare-fun e!323271 () Bool)

(assert (=> b!561032 (= e!323271 e!323264)))

(declare-fun res!352187 () Bool)

(assert (=> b!561032 (=> (not res!352187) (not e!323264))))

(declare-fun lt!255228 () SeekEntryResult!5370)

(assert (=> b!561032 (= res!352187 (= lt!255228 (seekKeyOrZeroReturnVacant!0 (x!52617 lt!255223) (index!23709 lt!255223) (index!23709 lt!255223) (select (arr!16921 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561033 () Bool)

(assert (=> b!561033 (= e!323268 (not true))))

(assert (=> b!561033 e!323270))

(declare-fun res!352181 () Bool)

(assert (=> b!561033 (=> (not res!352181) (not e!323270))))

(assert (=> b!561033 (= res!352181 (= lt!255228 (Found!5370 j!142)))))

(assert (=> b!561033 (= lt!255228 (seekEntryOrOpen!0 (select (arr!16921 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561033 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17514 0))(
  ( (Unit!17515) )
))
(declare-fun lt!255222 () Unit!17514)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35241 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17514)

(assert (=> b!561033 (= lt!255222 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561034 () Bool)

(assert (=> b!561034 (= e!323267 e!323271)))

(declare-fun res!352175 () Bool)

(assert (=> b!561034 (=> res!352175 e!323271)))

(declare-fun lt!255229 () (_ BitVec 64))

(assert (=> b!561034 (= res!352175 (or (= lt!255229 (select (arr!16921 a!3118) j!142)) (= lt!255229 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561034 (= lt!255229 (select (arr!16921 a!3118) (index!23709 lt!255223)))))

(declare-fun b!561035 () Bool)

(declare-fun res!352184 () Bool)

(assert (=> b!561035 (=> (not res!352184) (not e!323269))))

(assert (=> b!561035 (= res!352184 (and (= (size!17285 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17285 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17285 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51376 res!352178) b!561035))

(assert (= (and b!561035 res!352184) b!561025))

(assert (= (and b!561025 res!352179) b!561027))

(assert (= (and b!561027 res!352183) b!561031))

(assert (= (and b!561031 res!352176) b!561028))

(assert (= (and b!561028 res!352182) b!561024))

(assert (= (and b!561024 res!352186) b!561029))

(assert (= (and b!561029 res!352177) b!561026))

(assert (= (and b!561026 res!352185) b!561033))

(assert (= (and b!561033 res!352181) b!561023))

(assert (= (and b!561023 (not res!352180)) b!561034))

(assert (= (and b!561034 (not res!352175)) b!561032))

(assert (= (and b!561032 res!352187) b!561030))

(declare-fun m!538865 () Bool)

(assert (=> b!561034 m!538865))

(declare-fun m!538867 () Bool)

(assert (=> b!561034 m!538867))

(assert (=> b!561026 m!538865))

(declare-fun m!538869 () Bool)

(assert (=> b!561026 m!538869))

(assert (=> b!561026 m!538865))

(declare-fun m!538871 () Bool)

(assert (=> b!561026 m!538871))

(declare-fun m!538873 () Bool)

(assert (=> b!561026 m!538873))

(declare-fun m!538875 () Bool)

(assert (=> b!561026 m!538875))

(declare-fun m!538877 () Bool)

(assert (=> b!561026 m!538877))

(assert (=> b!561026 m!538865))

(declare-fun m!538879 () Bool)

(assert (=> b!561026 m!538879))

(assert (=> b!561025 m!538865))

(assert (=> b!561025 m!538865))

(declare-fun m!538881 () Bool)

(assert (=> b!561025 m!538881))

(declare-fun m!538883 () Bool)

(assert (=> b!561024 m!538883))

(declare-fun m!538885 () Bool)

(assert (=> b!561028 m!538885))

(declare-fun m!538887 () Bool)

(assert (=> start!51376 m!538887))

(declare-fun m!538889 () Bool)

(assert (=> start!51376 m!538889))

(declare-fun m!538891 () Bool)

(assert (=> b!561030 m!538891))

(declare-fun m!538893 () Bool)

(assert (=> b!561030 m!538893))

(declare-fun m!538895 () Bool)

(assert (=> b!561031 m!538895))

(assert (=> b!561032 m!538865))

(assert (=> b!561032 m!538865))

(declare-fun m!538897 () Bool)

(assert (=> b!561032 m!538897))

(assert (=> b!561033 m!538865))

(assert (=> b!561033 m!538865))

(declare-fun m!538899 () Bool)

(assert (=> b!561033 m!538899))

(declare-fun m!538901 () Bool)

(assert (=> b!561033 m!538901))

(declare-fun m!538903 () Bool)

(assert (=> b!561033 m!538903))

(declare-fun m!538905 () Bool)

(assert (=> b!561029 m!538905))

(declare-fun m!538907 () Bool)

(assert (=> b!561027 m!538907))

(check-sat (not b!561025) (not b!561027) (not b!561033) (not b!561030) (not b!561024) (not start!51376) (not b!561028) (not b!561029) (not b!561026) (not b!561031) (not b!561032))
(check-sat)
