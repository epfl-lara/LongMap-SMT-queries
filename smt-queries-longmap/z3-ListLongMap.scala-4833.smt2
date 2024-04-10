; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66472 () Bool)

(assert start!66472)

(declare-fun b!766009 () Bool)

(declare-fun res!518188 () Bool)

(declare-fun e!426584 () Bool)

(assert (=> b!766009 (=> (not res!518188) (not e!426584))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766009 (= res!518188 (validKeyInArray!0 k0!2102))))

(declare-fun res!518198 () Bool)

(assert (=> start!66472 (=> (not res!518198) (not e!426584))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66472 (= res!518198 (validMask!0 mask!3328))))

(assert (=> start!66472 e!426584))

(assert (=> start!66472 true))

(declare-datatypes ((array!42251 0))(
  ( (array!42252 (arr!20230 (Array (_ BitVec 32) (_ BitVec 64))) (size!20651 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42251)

(declare-fun array_inv!16026 (array!42251) Bool)

(assert (=> start!66472 (array_inv!16026 a!3186)))

(declare-fun b!766010 () Bool)

(declare-fun res!518195 () Bool)

(assert (=> b!766010 (=> (not res!518195) (not e!426584))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!766010 (= res!518195 (and (= (size!20651 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20651 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20651 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766011 () Bool)

(declare-fun e!426582 () Bool)

(assert (=> b!766011 (= e!426582 (not true))))

(declare-fun e!426583 () Bool)

(assert (=> b!766011 e!426583))

(declare-fun res!518197 () Bool)

(assert (=> b!766011 (=> (not res!518197) (not e!426583))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42251 (_ BitVec 32)) Bool)

(assert (=> b!766011 (= res!518197 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26386 0))(
  ( (Unit!26387) )
))
(declare-fun lt!340736 () Unit!26386)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42251 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26386)

(assert (=> b!766011 (= lt!340736 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!766012 () Bool)

(declare-fun res!518192 () Bool)

(declare-fun e!426586 () Bool)

(assert (=> b!766012 (=> (not res!518192) (not e!426586))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766012 (= res!518192 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20651 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20651 a!3186))))))

(declare-fun b!766013 () Bool)

(declare-fun res!518186 () Bool)

(assert (=> b!766013 (=> (not res!518186) (not e!426586))))

(assert (=> b!766013 (= res!518186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766014 () Bool)

(declare-fun res!518194 () Bool)

(assert (=> b!766014 (=> (not res!518194) (not e!426584))))

(declare-fun arrayContainsKey!0 (array!42251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766014 (= res!518194 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766015 () Bool)

(declare-fun res!518189 () Bool)

(declare-fun e!426587 () Bool)

(assert (=> b!766015 (=> (not res!518189) (not e!426587))))

(declare-fun e!426588 () Bool)

(assert (=> b!766015 (= res!518189 e!426588)))

(declare-fun c!84301 () Bool)

(assert (=> b!766015 (= c!84301 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!766016 () Bool)

(declare-datatypes ((SeekEntryResult!7830 0))(
  ( (MissingZero!7830 (index!33688 (_ BitVec 32))) (Found!7830 (index!33689 (_ BitVec 32))) (Intermediate!7830 (undefined!8642 Bool) (index!33690 (_ BitVec 32)) (x!64596 (_ BitVec 32))) (Undefined!7830) (MissingVacant!7830 (index!33691 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42251 (_ BitVec 32)) SeekEntryResult!7830)

(assert (=> b!766016 (= e!426588 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20230 a!3186) j!159) a!3186 mask!3328) (Found!7830 j!159)))))

(declare-fun b!766017 () Bool)

(assert (=> b!766017 (= e!426586 e!426587)))

(declare-fun res!518200 () Bool)

(assert (=> b!766017 (=> (not res!518200) (not e!426587))))

(declare-fun lt!340737 () SeekEntryResult!7830)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42251 (_ BitVec 32)) SeekEntryResult!7830)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766017 (= res!518200 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20230 a!3186) j!159) mask!3328) (select (arr!20230 a!3186) j!159) a!3186 mask!3328) lt!340737))))

(assert (=> b!766017 (= lt!340737 (Intermediate!7830 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766018 () Bool)

(declare-fun res!518199 () Bool)

(assert (=> b!766018 (=> (not res!518199) (not e!426584))))

(assert (=> b!766018 (= res!518199 (validKeyInArray!0 (select (arr!20230 a!3186) j!159)))))

(declare-fun b!766019 () Bool)

(assert (=> b!766019 (= e!426587 e!426582)))

(declare-fun res!518191 () Bool)

(assert (=> b!766019 (=> (not res!518191) (not e!426582))))

(declare-fun lt!340735 () array!42251)

(declare-fun lt!340739 () (_ BitVec 64))

(assert (=> b!766019 (= res!518191 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340739 mask!3328) lt!340739 lt!340735 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340739 lt!340735 mask!3328)))))

(assert (=> b!766019 (= lt!340739 (select (store (arr!20230 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!766019 (= lt!340735 (array!42252 (store (arr!20230 a!3186) i!1173 k0!2102) (size!20651 a!3186)))))

(declare-fun b!766020 () Bool)

(declare-fun res!518196 () Bool)

(assert (=> b!766020 (=> (not res!518196) (not e!426587))))

(assert (=> b!766020 (= res!518196 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20230 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766021 () Bool)

(assert (=> b!766021 (= e!426588 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20230 a!3186) j!159) a!3186 mask!3328) lt!340737))))

(declare-fun b!766022 () Bool)

(declare-fun e!426581 () Bool)

(assert (=> b!766022 (= e!426583 e!426581)))

(declare-fun res!518187 () Bool)

(assert (=> b!766022 (=> (not res!518187) (not e!426581))))

(declare-fun lt!340734 () SeekEntryResult!7830)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42251 (_ BitVec 32)) SeekEntryResult!7830)

(assert (=> b!766022 (= res!518187 (= (seekEntryOrOpen!0 (select (arr!20230 a!3186) j!159) a!3186 mask!3328) lt!340734))))

(assert (=> b!766022 (= lt!340734 (Found!7830 j!159))))

(declare-fun b!766023 () Bool)

(assert (=> b!766023 (= e!426584 e!426586)))

(declare-fun res!518190 () Bool)

(assert (=> b!766023 (=> (not res!518190) (not e!426586))))

(declare-fun lt!340738 () SeekEntryResult!7830)

(assert (=> b!766023 (= res!518190 (or (= lt!340738 (MissingZero!7830 i!1173)) (= lt!340738 (MissingVacant!7830 i!1173))))))

(assert (=> b!766023 (= lt!340738 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!766024 () Bool)

(declare-fun res!518193 () Bool)

(assert (=> b!766024 (=> (not res!518193) (not e!426586))))

(declare-datatypes ((List!14232 0))(
  ( (Nil!14229) (Cons!14228 (h!15318 (_ BitVec 64)) (t!20547 List!14232)) )
))
(declare-fun arrayNoDuplicates!0 (array!42251 (_ BitVec 32) List!14232) Bool)

(assert (=> b!766024 (= res!518193 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14229))))

(declare-fun b!766025 () Bool)

(assert (=> b!766025 (= e!426581 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20230 a!3186) j!159) a!3186 mask!3328) lt!340734))))

(assert (= (and start!66472 res!518198) b!766010))

(assert (= (and b!766010 res!518195) b!766018))

(assert (= (and b!766018 res!518199) b!766009))

(assert (= (and b!766009 res!518188) b!766014))

(assert (= (and b!766014 res!518194) b!766023))

(assert (= (and b!766023 res!518190) b!766013))

(assert (= (and b!766013 res!518186) b!766024))

(assert (= (and b!766024 res!518193) b!766012))

(assert (= (and b!766012 res!518192) b!766017))

(assert (= (and b!766017 res!518200) b!766020))

(assert (= (and b!766020 res!518196) b!766015))

(assert (= (and b!766015 c!84301) b!766021))

(assert (= (and b!766015 (not c!84301)) b!766016))

(assert (= (and b!766015 res!518189) b!766019))

(assert (= (and b!766019 res!518191) b!766011))

(assert (= (and b!766011 res!518197) b!766022))

(assert (= (and b!766022 res!518187) b!766025))

(declare-fun m!712045 () Bool)

(assert (=> b!766022 m!712045))

(assert (=> b!766022 m!712045))

(declare-fun m!712047 () Bool)

(assert (=> b!766022 m!712047))

(declare-fun m!712049 () Bool)

(assert (=> b!766013 m!712049))

(assert (=> b!766017 m!712045))

(assert (=> b!766017 m!712045))

(declare-fun m!712051 () Bool)

(assert (=> b!766017 m!712051))

(assert (=> b!766017 m!712051))

(assert (=> b!766017 m!712045))

(declare-fun m!712053 () Bool)

(assert (=> b!766017 m!712053))

(declare-fun m!712055 () Bool)

(assert (=> b!766014 m!712055))

(declare-fun m!712057 () Bool)

(assert (=> b!766019 m!712057))

(declare-fun m!712059 () Bool)

(assert (=> b!766019 m!712059))

(declare-fun m!712061 () Bool)

(assert (=> b!766019 m!712061))

(declare-fun m!712063 () Bool)

(assert (=> b!766019 m!712063))

(assert (=> b!766019 m!712059))

(declare-fun m!712065 () Bool)

(assert (=> b!766019 m!712065))

(declare-fun m!712067 () Bool)

(assert (=> b!766024 m!712067))

(assert (=> b!766025 m!712045))

(assert (=> b!766025 m!712045))

(declare-fun m!712069 () Bool)

(assert (=> b!766025 m!712069))

(declare-fun m!712071 () Bool)

(assert (=> b!766009 m!712071))

(declare-fun m!712073 () Bool)

(assert (=> b!766020 m!712073))

(assert (=> b!766021 m!712045))

(assert (=> b!766021 m!712045))

(declare-fun m!712075 () Bool)

(assert (=> b!766021 m!712075))

(declare-fun m!712077 () Bool)

(assert (=> b!766011 m!712077))

(declare-fun m!712079 () Bool)

(assert (=> b!766011 m!712079))

(assert (=> b!766016 m!712045))

(assert (=> b!766016 m!712045))

(declare-fun m!712081 () Bool)

(assert (=> b!766016 m!712081))

(declare-fun m!712083 () Bool)

(assert (=> start!66472 m!712083))

(declare-fun m!712085 () Bool)

(assert (=> start!66472 m!712085))

(declare-fun m!712087 () Bool)

(assert (=> b!766023 m!712087))

(assert (=> b!766018 m!712045))

(assert (=> b!766018 m!712045))

(declare-fun m!712089 () Bool)

(assert (=> b!766018 m!712089))

(check-sat (not start!66472) (not b!766019) (not b!766023) (not b!766016) (not b!766021) (not b!766025) (not b!766014) (not b!766018) (not b!766024) (not b!766017) (not b!766011) (not b!766022) (not b!766013) (not b!766009))
(check-sat)
