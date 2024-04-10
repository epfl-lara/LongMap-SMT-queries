; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47386 () Bool)

(assert start!47386)

(declare-fun b!521074 () Bool)

(declare-fun res!318930 () Bool)

(declare-fun e!304034 () Bool)

(assert (=> b!521074 (=> (not res!318930) (not e!304034))))

(declare-datatypes ((array!33212 0))(
  ( (array!33213 (arr!15962 (Array (_ BitVec 32) (_ BitVec 64))) (size!16326 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33212)

(declare-datatypes ((List!10120 0))(
  ( (Nil!10117) (Cons!10116 (h!11038 (_ BitVec 64)) (t!16348 List!10120)) )
))
(declare-fun arrayNoDuplicates!0 (array!33212 (_ BitVec 32) List!10120) Bool)

(assert (=> b!521074 (= res!318930 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10117))))

(declare-fun res!318929 () Bool)

(declare-fun e!304038 () Bool)

(assert (=> start!47386 (=> (not res!318929) (not e!304038))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47386 (= res!318929 (validMask!0 mask!3524))))

(assert (=> start!47386 e!304038))

(assert (=> start!47386 true))

(declare-fun array_inv!11758 (array!33212) Bool)

(assert (=> start!47386 (array_inv!11758 a!3235)))

(declare-fun b!521075 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!304036 () Bool)

(declare-datatypes ((SeekEntryResult!4429 0))(
  ( (MissingZero!4429 (index!19919 (_ BitVec 32))) (Found!4429 (index!19920 (_ BitVec 32))) (Intermediate!4429 (undefined!5241 Bool) (index!19921 (_ BitVec 32)) (x!48903 (_ BitVec 32))) (Undefined!4429) (MissingVacant!4429 (index!19922 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33212 (_ BitVec 32)) SeekEntryResult!4429)

(assert (=> b!521075 (= e!304036 (= (seekEntryOrOpen!0 (select (arr!15962 a!3235) j!176) a!3235 mask!3524) (Found!4429 j!176)))))

(declare-fun b!521076 () Bool)

(declare-fun res!318928 () Bool)

(assert (=> b!521076 (=> (not res!318928) (not e!304038))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521076 (= res!318928 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521077 () Bool)

(declare-fun res!318932 () Bool)

(assert (=> b!521077 (=> (not res!318932) (not e!304038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521077 (= res!318932 (validKeyInArray!0 (select (arr!15962 a!3235) j!176)))))

(declare-fun b!521078 () Bool)

(declare-fun res!318926 () Bool)

(declare-fun e!304032 () Bool)

(assert (=> b!521078 (=> res!318926 e!304032)))

(declare-fun lt!238731 () SeekEntryResult!4429)

(assert (=> b!521078 (= res!318926 (or (undefined!5241 lt!238731) (not (is-Intermediate!4429 lt!238731))))))

(declare-fun b!521079 () Bool)

(assert (=> b!521079 (= e!304034 (not e!304032))))

(declare-fun res!318931 () Bool)

(assert (=> b!521079 (=> res!318931 e!304032)))

(declare-fun lt!238724 () (_ BitVec 32))

(declare-fun lt!238725 () (_ BitVec 64))

(declare-fun lt!238729 () array!33212)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33212 (_ BitVec 32)) SeekEntryResult!4429)

(assert (=> b!521079 (= res!318931 (= lt!238731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238724 lt!238725 lt!238729 mask!3524)))))

(declare-fun lt!238730 () (_ BitVec 32))

(assert (=> b!521079 (= lt!238731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238730 (select (arr!15962 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521079 (= lt!238724 (toIndex!0 lt!238725 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521079 (= lt!238725 (select (store (arr!15962 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!521079 (= lt!238730 (toIndex!0 (select (arr!15962 a!3235) j!176) mask!3524))))

(assert (=> b!521079 (= lt!238729 (array!33213 (store (arr!15962 a!3235) i!1204 k!2280) (size!16326 a!3235)))))

(assert (=> b!521079 e!304036))

(declare-fun res!318925 () Bool)

(assert (=> b!521079 (=> (not res!318925) (not e!304036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33212 (_ BitVec 32)) Bool)

(assert (=> b!521079 (= res!318925 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16168 0))(
  ( (Unit!16169) )
))
(declare-fun lt!238726 () Unit!16168)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33212 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16168)

(assert (=> b!521079 (= lt!238726 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521080 () Bool)

(declare-fun res!318933 () Bool)

(assert (=> b!521080 (=> (not res!318933) (not e!304034))))

(assert (=> b!521080 (= res!318933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521081 () Bool)

(assert (=> b!521081 (= e!304032 true)))

(assert (=> b!521081 (and (or (= (select (arr!15962 a!3235) (index!19921 lt!238731)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15962 a!3235) (index!19921 lt!238731)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15962 a!3235) (index!19921 lt!238731)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15962 a!3235) (index!19921 lt!238731)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238727 () Unit!16168)

(declare-fun e!304035 () Unit!16168)

(assert (=> b!521081 (= lt!238727 e!304035)))

(declare-fun c!61376 () Bool)

(assert (=> b!521081 (= c!61376 (= (select (arr!15962 a!3235) (index!19921 lt!238731)) (select (arr!15962 a!3235) j!176)))))

(assert (=> b!521081 (and (bvslt (x!48903 lt!238731) #b01111111111111111111111111111110) (or (= (select (arr!15962 a!3235) (index!19921 lt!238731)) (select (arr!15962 a!3235) j!176)) (= (select (arr!15962 a!3235) (index!19921 lt!238731)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15962 a!3235) (index!19921 lt!238731)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521082 () Bool)

(declare-fun res!318935 () Bool)

(assert (=> b!521082 (=> (not res!318935) (not e!304038))))

(assert (=> b!521082 (= res!318935 (and (= (size!16326 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16326 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16326 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521083 () Bool)

(declare-fun Unit!16170 () Unit!16168)

(assert (=> b!521083 (= e!304035 Unit!16170)))

(declare-fun lt!238728 () Unit!16168)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33212 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16168)

(assert (=> b!521083 (= lt!238728 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238730 #b00000000000000000000000000000000 (index!19921 lt!238731) (x!48903 lt!238731) mask!3524))))

(declare-fun res!318924 () Bool)

(assert (=> b!521083 (= res!318924 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238730 lt!238725 lt!238729 mask!3524) (Intermediate!4429 false (index!19921 lt!238731) (x!48903 lt!238731))))))

(declare-fun e!304033 () Bool)

(assert (=> b!521083 (=> (not res!318924) (not e!304033))))

(assert (=> b!521083 e!304033))

(declare-fun b!521084 () Bool)

(declare-fun res!318927 () Bool)

(assert (=> b!521084 (=> (not res!318927) (not e!304038))))

(assert (=> b!521084 (= res!318927 (validKeyInArray!0 k!2280))))

(declare-fun b!521085 () Bool)

(declare-fun Unit!16171 () Unit!16168)

(assert (=> b!521085 (= e!304035 Unit!16171)))

(declare-fun b!521086 () Bool)

(assert (=> b!521086 (= e!304033 false)))

(declare-fun b!521087 () Bool)

(assert (=> b!521087 (= e!304038 e!304034)))

(declare-fun res!318934 () Bool)

(assert (=> b!521087 (=> (not res!318934) (not e!304034))))

(declare-fun lt!238732 () SeekEntryResult!4429)

(assert (=> b!521087 (= res!318934 (or (= lt!238732 (MissingZero!4429 i!1204)) (= lt!238732 (MissingVacant!4429 i!1204))))))

(assert (=> b!521087 (= lt!238732 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!47386 res!318929) b!521082))

(assert (= (and b!521082 res!318935) b!521077))

(assert (= (and b!521077 res!318932) b!521084))

(assert (= (and b!521084 res!318927) b!521076))

(assert (= (and b!521076 res!318928) b!521087))

(assert (= (and b!521087 res!318934) b!521080))

(assert (= (and b!521080 res!318933) b!521074))

(assert (= (and b!521074 res!318930) b!521079))

(assert (= (and b!521079 res!318925) b!521075))

(assert (= (and b!521079 (not res!318931)) b!521078))

(assert (= (and b!521078 (not res!318926)) b!521081))

(assert (= (and b!521081 c!61376) b!521083))

(assert (= (and b!521081 (not c!61376)) b!521085))

(assert (= (and b!521083 res!318924) b!521086))

(declare-fun m!501987 () Bool)

(assert (=> b!521083 m!501987))

(declare-fun m!501989 () Bool)

(assert (=> b!521083 m!501989))

(declare-fun m!501991 () Bool)

(assert (=> b!521081 m!501991))

(declare-fun m!501993 () Bool)

(assert (=> b!521081 m!501993))

(declare-fun m!501995 () Bool)

(assert (=> b!521087 m!501995))

(assert (=> b!521075 m!501993))

(assert (=> b!521075 m!501993))

(declare-fun m!501997 () Bool)

(assert (=> b!521075 m!501997))

(assert (=> b!521077 m!501993))

(assert (=> b!521077 m!501993))

(declare-fun m!501999 () Bool)

(assert (=> b!521077 m!501999))

(declare-fun m!502001 () Bool)

(assert (=> b!521079 m!502001))

(declare-fun m!502003 () Bool)

(assert (=> b!521079 m!502003))

(assert (=> b!521079 m!501993))

(declare-fun m!502005 () Bool)

(assert (=> b!521079 m!502005))

(assert (=> b!521079 m!501993))

(assert (=> b!521079 m!501993))

(declare-fun m!502007 () Bool)

(assert (=> b!521079 m!502007))

(declare-fun m!502009 () Bool)

(assert (=> b!521079 m!502009))

(declare-fun m!502011 () Bool)

(assert (=> b!521079 m!502011))

(declare-fun m!502013 () Bool)

(assert (=> b!521079 m!502013))

(declare-fun m!502015 () Bool)

(assert (=> b!521079 m!502015))

(declare-fun m!502017 () Bool)

(assert (=> b!521084 m!502017))

(declare-fun m!502019 () Bool)

(assert (=> b!521080 m!502019))

(declare-fun m!502021 () Bool)

(assert (=> start!47386 m!502021))

(declare-fun m!502023 () Bool)

(assert (=> start!47386 m!502023))

(declare-fun m!502025 () Bool)

(assert (=> b!521076 m!502025))

(declare-fun m!502027 () Bool)

(assert (=> b!521074 m!502027))

(push 1)

