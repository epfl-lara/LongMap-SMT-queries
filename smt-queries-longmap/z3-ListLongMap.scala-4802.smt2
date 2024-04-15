; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65852 () Bool)

(assert start!65852)

(declare-fun b!759100 () Bool)

(declare-fun res!513758 () Bool)

(declare-fun e!423166 () Bool)

(assert (=> b!759100 (=> (not res!513758) (not e!423166))))

(declare-datatypes ((array!42042 0))(
  ( (array!42043 (arr!20135 (Array (_ BitVec 32) (_ BitVec 64))) (size!20556 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42042)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!759100 (= res!513758 (and (= (size!20556 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20556 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20556 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!423171 () Bool)

(declare-datatypes ((SeekEntryResult!7732 0))(
  ( (MissingZero!7732 (index!33296 (_ BitVec 32))) (Found!7732 (index!33297 (_ BitVec 32))) (Intermediate!7732 (undefined!8544 Bool) (index!33298 (_ BitVec 32)) (x!64189 (_ BitVec 32))) (Undefined!7732) (MissingVacant!7732 (index!33299 (_ BitVec 32))) )
))
(declare-fun lt!338131 () SeekEntryResult!7732)

(declare-fun b!759101 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42042 (_ BitVec 32)) SeekEntryResult!7732)

(assert (=> b!759101 (= e!423171 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20135 a!3186) j!159) a!3186 mask!3328) lt!338131))))

(declare-fun b!759102 () Bool)

(declare-fun res!513760 () Bool)

(declare-fun e!423168 () Bool)

(assert (=> b!759102 (=> (not res!513760) (not e!423168))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!759102 (= res!513760 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20556 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20556 a!3186))))))

(declare-fun b!759103 () Bool)

(declare-fun e!423165 () Bool)

(declare-fun e!423169 () Bool)

(assert (=> b!759103 (= e!423165 e!423169)))

(declare-fun res!513752 () Bool)

(assert (=> b!759103 (=> (not res!513752) (not e!423169))))

(declare-fun lt!338135 () (_ BitVec 64))

(declare-fun lt!338134 () array!42042)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42042 (_ BitVec 32)) SeekEntryResult!7732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759103 (= res!513752 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338135 mask!3328) lt!338135 lt!338134 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338135 lt!338134 mask!3328)))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!759103 (= lt!338135 (select (store (arr!20135 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!759103 (= lt!338134 (array!42043 (store (arr!20135 a!3186) i!1173 k0!2102) (size!20556 a!3186)))))

(declare-fun b!759104 () Bool)

(assert (=> b!759104 (= e!423169 (not true))))

(declare-fun e!423172 () Bool)

(assert (=> b!759104 e!423172))

(declare-fun res!513753 () Bool)

(assert (=> b!759104 (=> (not res!513753) (not e!423172))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42042 (_ BitVec 32)) Bool)

(assert (=> b!759104 (= res!513753 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26276 0))(
  ( (Unit!26277) )
))
(declare-fun lt!338130 () Unit!26276)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42042 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26276)

(assert (=> b!759104 (= lt!338130 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759105 () Bool)

(declare-fun res!513765 () Bool)

(assert (=> b!759105 (=> (not res!513765) (not e!423166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759105 (= res!513765 (validKeyInArray!0 k0!2102))))

(declare-fun b!759106 () Bool)

(assert (=> b!759106 (= e!423172 e!423171)))

(declare-fun res!513755 () Bool)

(assert (=> b!759106 (=> (not res!513755) (not e!423171))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42042 (_ BitVec 32)) SeekEntryResult!7732)

(assert (=> b!759106 (= res!513755 (= (seekEntryOrOpen!0 (select (arr!20135 a!3186) j!159) a!3186 mask!3328) lt!338131))))

(assert (=> b!759106 (= lt!338131 (Found!7732 j!159))))

(declare-fun b!759107 () Bool)

(declare-fun res!513762 () Bool)

(assert (=> b!759107 (=> (not res!513762) (not e!423166))))

(assert (=> b!759107 (= res!513762 (validKeyInArray!0 (select (arr!20135 a!3186) j!159)))))

(declare-fun res!513756 () Bool)

(assert (=> start!65852 (=> (not res!513756) (not e!423166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65852 (= res!513756 (validMask!0 mask!3328))))

(assert (=> start!65852 e!423166))

(assert (=> start!65852 true))

(declare-fun array_inv!16018 (array!42042) Bool)

(assert (=> start!65852 (array_inv!16018 a!3186)))

(declare-fun b!759108 () Bool)

(declare-fun res!513759 () Bool)

(assert (=> b!759108 (=> (not res!513759) (not e!423168))))

(assert (=> b!759108 (= res!513759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759109 () Bool)

(declare-fun e!423170 () Bool)

(declare-fun lt!338132 () SeekEntryResult!7732)

(assert (=> b!759109 (= e!423170 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20135 a!3186) j!159) a!3186 mask!3328) lt!338132))))

(declare-fun b!759110 () Bool)

(declare-fun res!513754 () Bool)

(assert (=> b!759110 (=> (not res!513754) (not e!423168))))

(declare-datatypes ((List!14176 0))(
  ( (Nil!14173) (Cons!14172 (h!15244 (_ BitVec 64)) (t!20482 List!14176)) )
))
(declare-fun arrayNoDuplicates!0 (array!42042 (_ BitVec 32) List!14176) Bool)

(assert (=> b!759110 (= res!513754 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14173))))

(declare-fun b!759111 () Bool)

(assert (=> b!759111 (= e!423166 e!423168)))

(declare-fun res!513757 () Bool)

(assert (=> b!759111 (=> (not res!513757) (not e!423168))))

(declare-fun lt!338133 () SeekEntryResult!7732)

(assert (=> b!759111 (= res!513757 (or (= lt!338133 (MissingZero!7732 i!1173)) (= lt!338133 (MissingVacant!7732 i!1173))))))

(assert (=> b!759111 (= lt!338133 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!759112 () Bool)

(declare-fun res!513764 () Bool)

(assert (=> b!759112 (=> (not res!513764) (not e!423165))))

(assert (=> b!759112 (= res!513764 e!423170)))

(declare-fun c!83055 () Bool)

(assert (=> b!759112 (= c!83055 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759113 () Bool)

(declare-fun res!513761 () Bool)

(assert (=> b!759113 (=> (not res!513761) (not e!423166))))

(declare-fun arrayContainsKey!0 (array!42042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759113 (= res!513761 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759114 () Bool)

(declare-fun res!513763 () Bool)

(assert (=> b!759114 (=> (not res!513763) (not e!423165))))

(assert (=> b!759114 (= res!513763 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20135 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759115 () Bool)

(assert (=> b!759115 (= e!423170 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20135 a!3186) j!159) a!3186 mask!3328) (Found!7732 j!159)))))

(declare-fun b!759116 () Bool)

(assert (=> b!759116 (= e!423168 e!423165)))

(declare-fun res!513751 () Bool)

(assert (=> b!759116 (=> (not res!513751) (not e!423165))))

(assert (=> b!759116 (= res!513751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20135 a!3186) j!159) mask!3328) (select (arr!20135 a!3186) j!159) a!3186 mask!3328) lt!338132))))

(assert (=> b!759116 (= lt!338132 (Intermediate!7732 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65852 res!513756) b!759100))

(assert (= (and b!759100 res!513758) b!759107))

(assert (= (and b!759107 res!513762) b!759105))

(assert (= (and b!759105 res!513765) b!759113))

(assert (= (and b!759113 res!513761) b!759111))

(assert (= (and b!759111 res!513757) b!759108))

(assert (= (and b!759108 res!513759) b!759110))

(assert (= (and b!759110 res!513754) b!759102))

(assert (= (and b!759102 res!513760) b!759116))

(assert (= (and b!759116 res!513751) b!759114))

(assert (= (and b!759114 res!513763) b!759112))

(assert (= (and b!759112 c!83055) b!759109))

(assert (= (and b!759112 (not c!83055)) b!759115))

(assert (= (and b!759112 res!513764) b!759103))

(assert (= (and b!759103 res!513752) b!759104))

(assert (= (and b!759104 res!513753) b!759106))

(assert (= (and b!759106 res!513755) b!759101))

(declare-fun m!705959 () Bool)

(assert (=> b!759108 m!705959))

(declare-fun m!705961 () Bool)

(assert (=> b!759103 m!705961))

(declare-fun m!705963 () Bool)

(assert (=> b!759103 m!705963))

(assert (=> b!759103 m!705961))

(declare-fun m!705965 () Bool)

(assert (=> b!759103 m!705965))

(declare-fun m!705967 () Bool)

(assert (=> b!759103 m!705967))

(declare-fun m!705969 () Bool)

(assert (=> b!759103 m!705969))

(declare-fun m!705971 () Bool)

(assert (=> b!759106 m!705971))

(assert (=> b!759106 m!705971))

(declare-fun m!705973 () Bool)

(assert (=> b!759106 m!705973))

(declare-fun m!705975 () Bool)

(assert (=> b!759105 m!705975))

(declare-fun m!705977 () Bool)

(assert (=> b!759113 m!705977))

(declare-fun m!705979 () Bool)

(assert (=> start!65852 m!705979))

(declare-fun m!705981 () Bool)

(assert (=> start!65852 m!705981))

(assert (=> b!759115 m!705971))

(assert (=> b!759115 m!705971))

(declare-fun m!705983 () Bool)

(assert (=> b!759115 m!705983))

(declare-fun m!705985 () Bool)

(assert (=> b!759110 m!705985))

(assert (=> b!759107 m!705971))

(assert (=> b!759107 m!705971))

(declare-fun m!705987 () Bool)

(assert (=> b!759107 m!705987))

(assert (=> b!759116 m!705971))

(assert (=> b!759116 m!705971))

(declare-fun m!705989 () Bool)

(assert (=> b!759116 m!705989))

(assert (=> b!759116 m!705989))

(assert (=> b!759116 m!705971))

(declare-fun m!705991 () Bool)

(assert (=> b!759116 m!705991))

(assert (=> b!759109 m!705971))

(assert (=> b!759109 m!705971))

(declare-fun m!705993 () Bool)

(assert (=> b!759109 m!705993))

(declare-fun m!705995 () Bool)

(assert (=> b!759111 m!705995))

(declare-fun m!705997 () Bool)

(assert (=> b!759104 m!705997))

(declare-fun m!705999 () Bool)

(assert (=> b!759104 m!705999))

(assert (=> b!759101 m!705971))

(assert (=> b!759101 m!705971))

(declare-fun m!706001 () Bool)

(assert (=> b!759101 m!706001))

(declare-fun m!706003 () Bool)

(assert (=> b!759114 m!706003))

(check-sat (not b!759111) (not start!65852) (not b!759113) (not b!759101) (not b!759105) (not b!759110) (not b!759103) (not b!759107) (not b!759106) (not b!759108) (not b!759115) (not b!759109) (not b!759104) (not b!759116))
(check-sat)
