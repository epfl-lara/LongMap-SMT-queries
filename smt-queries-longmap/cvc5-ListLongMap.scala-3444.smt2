; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47784 () Bool)

(assert start!47784)

(declare-fun b!526264 () Bool)

(declare-datatypes ((array!33421 0))(
  ( (array!33422 (arr!16062 (Array (_ BitVec 32) (_ BitVec 64))) (size!16426 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33421)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!306777 () Bool)

(declare-datatypes ((SeekEntryResult!4529 0))(
  ( (MissingZero!4529 (index!20328 (_ BitVec 32))) (Found!4529 (index!20329 (_ BitVec 32))) (Intermediate!4529 (undefined!5341 Bool) (index!20330 (_ BitVec 32)) (x!49302 (_ BitVec 32))) (Undefined!4529) (MissingVacant!4529 (index!20331 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33421 (_ BitVec 32)) SeekEntryResult!4529)

(assert (=> b!526264 (= e!306777 (= (seekEntryOrOpen!0 (select (arr!16062 a!3235) j!176) a!3235 mask!3524) (Found!4529 j!176)))))

(declare-fun res!322919 () Bool)

(declare-fun e!306775 () Bool)

(assert (=> start!47784 (=> (not res!322919) (not e!306775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47784 (= res!322919 (validMask!0 mask!3524))))

(assert (=> start!47784 e!306775))

(assert (=> start!47784 true))

(declare-fun array_inv!11858 (array!33421) Bool)

(assert (=> start!47784 (array_inv!11858 a!3235)))

(declare-fun b!526265 () Bool)

(declare-fun res!322921 () Bool)

(assert (=> b!526265 (=> (not res!322921) (not e!306775))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526265 (= res!322921 (validKeyInArray!0 k!2280))))

(declare-fun b!526266 () Bool)

(declare-fun res!322917 () Bool)

(assert (=> b!526266 (=> (not res!322917) (not e!306775))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526266 (= res!322917 (and (= (size!16426 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16426 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16426 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526267 () Bool)

(declare-fun res!322911 () Bool)

(assert (=> b!526267 (=> (not res!322911) (not e!306775))))

(assert (=> b!526267 (= res!322911 (validKeyInArray!0 (select (arr!16062 a!3235) j!176)))))

(declare-fun b!526268 () Bool)

(declare-fun res!322922 () Bool)

(declare-fun e!306771 () Bool)

(assert (=> b!526268 (=> (not res!322922) (not e!306771))))

(declare-datatypes ((List!10220 0))(
  ( (Nil!10217) (Cons!10216 (h!11147 (_ BitVec 64)) (t!16448 List!10220)) )
))
(declare-fun arrayNoDuplicates!0 (array!33421 (_ BitVec 32) List!10220) Bool)

(assert (=> b!526268 (= res!322922 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10217))))

(declare-fun b!526269 () Bool)

(assert (=> b!526269 (= e!306775 e!306771)))

(declare-fun res!322914 () Bool)

(assert (=> b!526269 (=> (not res!322914) (not e!306771))))

(declare-fun lt!241989 () SeekEntryResult!4529)

(assert (=> b!526269 (= res!322914 (or (= lt!241989 (MissingZero!4529 i!1204)) (= lt!241989 (MissingVacant!4529 i!1204))))))

(assert (=> b!526269 (= lt!241989 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!526270 () Bool)

(declare-fun e!306773 () Bool)

(assert (=> b!526270 (= e!306773 true)))

(declare-fun lt!241988 () SeekEntryResult!4529)

(assert (=> b!526270 (= (index!20330 lt!241988) i!1204)))

(declare-datatypes ((Unit!16568 0))(
  ( (Unit!16569) )
))
(declare-fun lt!241984 () Unit!16568)

(declare-fun lt!241991 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33421 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16568)

(assert (=> b!526270 (= lt!241984 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241991 #b00000000000000000000000000000000 (index!20330 lt!241988) (x!49302 lt!241988) mask!3524))))

(assert (=> b!526270 (and (or (= (select (arr!16062 a!3235) (index!20330 lt!241988)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16062 a!3235) (index!20330 lt!241988)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16062 a!3235) (index!20330 lt!241988)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16062 a!3235) (index!20330 lt!241988)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241986 () Unit!16568)

(declare-fun e!306772 () Unit!16568)

(assert (=> b!526270 (= lt!241986 e!306772)))

(declare-fun c!61982 () Bool)

(assert (=> b!526270 (= c!61982 (= (select (arr!16062 a!3235) (index!20330 lt!241988)) (select (arr!16062 a!3235) j!176)))))

(assert (=> b!526270 (and (bvslt (x!49302 lt!241988) #b01111111111111111111111111111110) (or (= (select (arr!16062 a!3235) (index!20330 lt!241988)) (select (arr!16062 a!3235) j!176)) (= (select (arr!16062 a!3235) (index!20330 lt!241988)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16062 a!3235) (index!20330 lt!241988)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526271 () Bool)

(assert (=> b!526271 (= e!306771 (not e!306773))))

(declare-fun res!322918 () Bool)

(assert (=> b!526271 (=> res!322918 e!306773)))

(declare-fun lt!241990 () array!33421)

(declare-fun lt!241992 () (_ BitVec 64))

(declare-fun lt!241987 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33421 (_ BitVec 32)) SeekEntryResult!4529)

(assert (=> b!526271 (= res!322918 (= lt!241988 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241987 lt!241992 lt!241990 mask!3524)))))

(assert (=> b!526271 (= lt!241988 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241991 (select (arr!16062 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526271 (= lt!241987 (toIndex!0 lt!241992 mask!3524))))

(assert (=> b!526271 (= lt!241992 (select (store (arr!16062 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526271 (= lt!241991 (toIndex!0 (select (arr!16062 a!3235) j!176) mask!3524))))

(assert (=> b!526271 (= lt!241990 (array!33422 (store (arr!16062 a!3235) i!1204 k!2280) (size!16426 a!3235)))))

(assert (=> b!526271 e!306777))

(declare-fun res!322913 () Bool)

(assert (=> b!526271 (=> (not res!322913) (not e!306777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33421 (_ BitVec 32)) Bool)

(assert (=> b!526271 (= res!322913 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241985 () Unit!16568)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33421 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16568)

(assert (=> b!526271 (= lt!241985 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526272 () Bool)

(declare-fun Unit!16570 () Unit!16568)

(assert (=> b!526272 (= e!306772 Unit!16570)))

(declare-fun lt!241993 () Unit!16568)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33421 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16568)

(assert (=> b!526272 (= lt!241993 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241991 #b00000000000000000000000000000000 (index!20330 lt!241988) (x!49302 lt!241988) mask!3524))))

(declare-fun res!322920 () Bool)

(assert (=> b!526272 (= res!322920 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241991 lt!241992 lt!241990 mask!3524) (Intermediate!4529 false (index!20330 lt!241988) (x!49302 lt!241988))))))

(declare-fun e!306776 () Bool)

(assert (=> b!526272 (=> (not res!322920) (not e!306776))))

(assert (=> b!526272 e!306776))

(declare-fun b!526273 () Bool)

(declare-fun res!322916 () Bool)

(assert (=> b!526273 (=> res!322916 e!306773)))

(assert (=> b!526273 (= res!322916 (or (undefined!5341 lt!241988) (not (is-Intermediate!4529 lt!241988))))))

(declare-fun b!526274 () Bool)

(declare-fun res!322915 () Bool)

(assert (=> b!526274 (=> (not res!322915) (not e!306771))))

(assert (=> b!526274 (= res!322915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526275 () Bool)

(declare-fun res!322912 () Bool)

(assert (=> b!526275 (=> (not res!322912) (not e!306775))))

(declare-fun arrayContainsKey!0 (array!33421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526275 (= res!322912 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526276 () Bool)

(declare-fun Unit!16571 () Unit!16568)

(assert (=> b!526276 (= e!306772 Unit!16571)))

(declare-fun b!526277 () Bool)

(assert (=> b!526277 (= e!306776 false)))

(assert (= (and start!47784 res!322919) b!526266))

(assert (= (and b!526266 res!322917) b!526267))

(assert (= (and b!526267 res!322911) b!526265))

(assert (= (and b!526265 res!322921) b!526275))

(assert (= (and b!526275 res!322912) b!526269))

(assert (= (and b!526269 res!322914) b!526274))

(assert (= (and b!526274 res!322915) b!526268))

(assert (= (and b!526268 res!322922) b!526271))

(assert (= (and b!526271 res!322913) b!526264))

(assert (= (and b!526271 (not res!322918)) b!526273))

(assert (= (and b!526273 (not res!322916)) b!526270))

(assert (= (and b!526270 c!61982) b!526272))

(assert (= (and b!526270 (not c!61982)) b!526276))

(assert (= (and b!526272 res!322920) b!526277))

(declare-fun m!506961 () Bool)

(assert (=> b!526268 m!506961))

(declare-fun m!506963 () Bool)

(assert (=> b!526272 m!506963))

(declare-fun m!506965 () Bool)

(assert (=> b!526272 m!506965))

(declare-fun m!506967 () Bool)

(assert (=> b!526264 m!506967))

(assert (=> b!526264 m!506967))

(declare-fun m!506969 () Bool)

(assert (=> b!526264 m!506969))

(declare-fun m!506971 () Bool)

(assert (=> start!47784 m!506971))

(declare-fun m!506973 () Bool)

(assert (=> start!47784 m!506973))

(declare-fun m!506975 () Bool)

(assert (=> b!526265 m!506975))

(assert (=> b!526267 m!506967))

(assert (=> b!526267 m!506967))

(declare-fun m!506977 () Bool)

(assert (=> b!526267 m!506977))

(declare-fun m!506979 () Bool)

(assert (=> b!526271 m!506979))

(declare-fun m!506981 () Bool)

(assert (=> b!526271 m!506981))

(declare-fun m!506983 () Bool)

(assert (=> b!526271 m!506983))

(declare-fun m!506985 () Bool)

(assert (=> b!526271 m!506985))

(assert (=> b!526271 m!506967))

(declare-fun m!506987 () Bool)

(assert (=> b!526271 m!506987))

(assert (=> b!526271 m!506967))

(declare-fun m!506989 () Bool)

(assert (=> b!526271 m!506989))

(assert (=> b!526271 m!506967))

(declare-fun m!506991 () Bool)

(assert (=> b!526271 m!506991))

(declare-fun m!506993 () Bool)

(assert (=> b!526271 m!506993))

(declare-fun m!506995 () Bool)

(assert (=> b!526269 m!506995))

(declare-fun m!506997 () Bool)

(assert (=> b!526274 m!506997))

(declare-fun m!506999 () Bool)

(assert (=> b!526270 m!506999))

(declare-fun m!507001 () Bool)

(assert (=> b!526270 m!507001))

(assert (=> b!526270 m!506967))

(declare-fun m!507003 () Bool)

(assert (=> b!526275 m!507003))

(push 1)

