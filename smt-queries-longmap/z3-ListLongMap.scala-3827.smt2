; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52436 () Bool)

(assert start!52436)

(declare-fun b!572428 () Bool)

(declare-fun e!329266 () Bool)

(declare-fun e!329267 () Bool)

(assert (=> b!572428 (= e!329266 e!329267)))

(declare-fun res!362083 () Bool)

(assert (=> b!572428 (=> res!362083 e!329267)))

(declare-datatypes ((array!35842 0))(
  ( (array!35843 (arr!17210 (Array (_ BitVec 32) (_ BitVec 64))) (size!17575 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35842)

(declare-fun lt!261185 () (_ BitVec 64))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!572428 (= res!362083 (or (= lt!261185 (select (arr!17210 a!3118) j!142)) (= lt!261185 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5656 0))(
  ( (MissingZero!5656 (index!24851 (_ BitVec 32))) (Found!5656 (index!24852 (_ BitVec 32))) (Intermediate!5656 (undefined!6468 Bool) (index!24853 (_ BitVec 32)) (x!53728 (_ BitVec 32))) (Undefined!5656) (MissingVacant!5656 (index!24854 (_ BitVec 32))) )
))
(declare-fun lt!261183 () SeekEntryResult!5656)

(assert (=> b!572428 (= lt!261185 (select (arr!17210 a!3118) (index!24853 lt!261183)))))

(declare-fun b!572429 () Bool)

(declare-fun res!362090 () Bool)

(declare-fun e!329261 () Bool)

(assert (=> b!572429 (=> (not res!362090) (not e!329261))))

(declare-datatypes ((List!11329 0))(
  ( (Nil!11326) (Cons!11325 (h!12352 (_ BitVec 64)) (t!17548 List!11329)) )
))
(declare-fun arrayNoDuplicates!0 (array!35842 (_ BitVec 32) List!11329) Bool)

(assert (=> b!572429 (= res!362090 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11326))))

(declare-fun b!572430 () Bool)

(declare-fun e!329265 () Bool)

(assert (=> b!572430 (= e!329265 e!329261)))

(declare-fun res!362089 () Bool)

(assert (=> b!572430 (=> (not res!362089) (not e!329261))))

(declare-fun lt!261184 () SeekEntryResult!5656)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572430 (= res!362089 (or (= lt!261184 (MissingZero!5656 i!1132)) (= lt!261184 (MissingVacant!5656 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35842 (_ BitVec 32)) SeekEntryResult!5656)

(assert (=> b!572430 (= lt!261184 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572431 () Bool)

(declare-fun res!362087 () Bool)

(assert (=> b!572431 (=> (not res!362087) (not e!329265))))

(assert (=> b!572431 (= res!362087 (and (= (size!17575 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17575 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17575 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572433 () Bool)

(declare-fun e!329263 () Bool)

(assert (=> b!572433 (= e!329261 e!329263)))

(declare-fun res!362088 () Bool)

(assert (=> b!572433 (=> (not res!362088) (not e!329263))))

(declare-fun lt!261182 () (_ BitVec 64))

(declare-fun lt!261188 () array!35842)

(declare-fun lt!261187 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35842 (_ BitVec 32)) SeekEntryResult!5656)

(assert (=> b!572433 (= res!362088 (= lt!261183 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261187 lt!261182 lt!261188 mask!3119)))))

(declare-fun lt!261190 () (_ BitVec 32))

(assert (=> b!572433 (= lt!261183 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261190 (select (arr!17210 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572433 (= lt!261187 (toIndex!0 lt!261182 mask!3119))))

(assert (=> b!572433 (= lt!261182 (select (store (arr!17210 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572433 (= lt!261190 (toIndex!0 (select (arr!17210 a!3118) j!142) mask!3119))))

(assert (=> b!572433 (= lt!261188 (array!35843 (store (arr!17210 a!3118) i!1132 k0!1914) (size!17575 a!3118)))))

(declare-fun b!572434 () Bool)

(declare-fun res!362084 () Bool)

(assert (=> b!572434 (=> (not res!362084) (not e!329265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572434 (= res!362084 (validKeyInArray!0 (select (arr!17210 a!3118) j!142)))))

(declare-fun b!572435 () Bool)

(declare-fun e!329264 () Bool)

(assert (=> b!572435 (= e!329267 e!329264)))

(declare-fun res!362085 () Bool)

(assert (=> b!572435 (=> (not res!362085) (not e!329264))))

(declare-fun lt!261186 () SeekEntryResult!5656)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35842 (_ BitVec 32)) SeekEntryResult!5656)

(assert (=> b!572435 (= res!362085 (= lt!261186 (seekKeyOrZeroReturnVacant!0 (x!53728 lt!261183) (index!24853 lt!261183) (index!24853 lt!261183) (select (arr!17210 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572436 () Bool)

(assert (=> b!572436 (= e!329263 (not true))))

(declare-fun e!329262 () Bool)

(assert (=> b!572436 e!329262))

(declare-fun res!362082 () Bool)

(assert (=> b!572436 (=> (not res!362082) (not e!329262))))

(assert (=> b!572436 (= res!362082 (= lt!261186 (Found!5656 j!142)))))

(assert (=> b!572436 (= lt!261186 (seekEntryOrOpen!0 (select (arr!17210 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35842 (_ BitVec 32)) Bool)

(assert (=> b!572436 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18000 0))(
  ( (Unit!18001) )
))
(declare-fun lt!261189 () Unit!18000)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35842 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18000)

(assert (=> b!572436 (= lt!261189 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572437 () Bool)

(assert (=> b!572437 (= e!329262 e!329266)))

(declare-fun res!362081 () Bool)

(assert (=> b!572437 (=> res!362081 e!329266)))

(get-info :version)

(assert (=> b!572437 (= res!362081 (or (undefined!6468 lt!261183) (not ((_ is Intermediate!5656) lt!261183))))))

(declare-fun b!572438 () Bool)

(declare-fun res!362079 () Bool)

(assert (=> b!572438 (=> (not res!362079) (not e!329265))))

(declare-fun arrayContainsKey!0 (array!35842 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572438 (= res!362079 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!362080 () Bool)

(assert (=> start!52436 (=> (not res!362080) (not e!329265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52436 (= res!362080 (validMask!0 mask!3119))))

(assert (=> start!52436 e!329265))

(assert (=> start!52436 true))

(declare-fun array_inv!13093 (array!35842) Bool)

(assert (=> start!52436 (array_inv!13093 a!3118)))

(declare-fun b!572432 () Bool)

(declare-fun res!362078 () Bool)

(assert (=> b!572432 (=> (not res!362078) (not e!329261))))

(assert (=> b!572432 (= res!362078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572439 () Bool)

(assert (=> b!572439 (= e!329264 (= (seekEntryOrOpen!0 lt!261182 lt!261188 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53728 lt!261183) (index!24853 lt!261183) (index!24853 lt!261183) lt!261182 lt!261188 mask!3119)))))

(declare-fun b!572440 () Bool)

(declare-fun res!362086 () Bool)

(assert (=> b!572440 (=> (not res!362086) (not e!329265))))

(assert (=> b!572440 (= res!362086 (validKeyInArray!0 k0!1914))))

(assert (= (and start!52436 res!362080) b!572431))

(assert (= (and b!572431 res!362087) b!572434))

(assert (= (and b!572434 res!362084) b!572440))

(assert (= (and b!572440 res!362086) b!572438))

(assert (= (and b!572438 res!362079) b!572430))

(assert (= (and b!572430 res!362089) b!572432))

(assert (= (and b!572432 res!362078) b!572429))

(assert (= (and b!572429 res!362090) b!572433))

(assert (= (and b!572433 res!362088) b!572436))

(assert (= (and b!572436 res!362082) b!572437))

(assert (= (and b!572437 (not res!362081)) b!572428))

(assert (= (and b!572428 (not res!362083)) b!572435))

(assert (= (and b!572435 res!362085) b!572439))

(declare-fun m!550937 () Bool)

(assert (=> b!572440 m!550937))

(declare-fun m!550939 () Bool)

(assert (=> b!572435 m!550939))

(assert (=> b!572435 m!550939))

(declare-fun m!550941 () Bool)

(assert (=> b!572435 m!550941))

(declare-fun m!550943 () Bool)

(assert (=> b!572439 m!550943))

(declare-fun m!550945 () Bool)

(assert (=> b!572439 m!550945))

(declare-fun m!550947 () Bool)

(assert (=> b!572433 m!550947))

(assert (=> b!572433 m!550939))

(declare-fun m!550949 () Bool)

(assert (=> b!572433 m!550949))

(assert (=> b!572433 m!550939))

(declare-fun m!550951 () Bool)

(assert (=> b!572433 m!550951))

(declare-fun m!550953 () Bool)

(assert (=> b!572433 m!550953))

(assert (=> b!572433 m!550939))

(declare-fun m!550955 () Bool)

(assert (=> b!572433 m!550955))

(declare-fun m!550957 () Bool)

(assert (=> b!572433 m!550957))

(declare-fun m!550959 () Bool)

(assert (=> b!572429 m!550959))

(declare-fun m!550961 () Bool)

(assert (=> b!572430 m!550961))

(assert (=> b!572428 m!550939))

(declare-fun m!550963 () Bool)

(assert (=> b!572428 m!550963))

(assert (=> b!572436 m!550939))

(assert (=> b!572436 m!550939))

(declare-fun m!550965 () Bool)

(assert (=> b!572436 m!550965))

(declare-fun m!550967 () Bool)

(assert (=> b!572436 m!550967))

(declare-fun m!550969 () Bool)

(assert (=> b!572436 m!550969))

(declare-fun m!550971 () Bool)

(assert (=> start!52436 m!550971))

(declare-fun m!550973 () Bool)

(assert (=> start!52436 m!550973))

(assert (=> b!572434 m!550939))

(assert (=> b!572434 m!550939))

(declare-fun m!550975 () Bool)

(assert (=> b!572434 m!550975))

(declare-fun m!550977 () Bool)

(assert (=> b!572432 m!550977))

(declare-fun m!550979 () Bool)

(assert (=> b!572438 m!550979))

(check-sat (not b!572430) (not b!572434) (not b!572438) (not b!572439) (not b!572436) (not b!572429) (not b!572435) (not b!572440) (not b!572432) (not b!572433) (not start!52436))
(check-sat)
