; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66298 () Bool)

(assert start!66298)

(declare-fun b!764188 () Bool)

(declare-fun res!517058 () Bool)

(declare-fun e!425649 () Bool)

(assert (=> b!764188 (=> (not res!517058) (not e!425649))))

(declare-datatypes ((array!42203 0))(
  ( (array!42204 (arr!20209 (Array (_ BitVec 32) (_ BitVec 64))) (size!20630 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42203)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764188 (= res!517058 (validKeyInArray!0 (select (arr!20209 a!3186) j!159)))))

(declare-fun b!764189 () Bool)

(declare-fun res!517056 () Bool)

(declare-fun e!425650 () Bool)

(assert (=> b!764189 (=> (not res!517056) (not e!425650))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764189 (= res!517056 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20209 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764190 () Bool)

(declare-fun res!517060 () Bool)

(assert (=> b!764190 (=> (not res!517060) (not e!425649))))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!764190 (= res!517060 (and (= (size!20630 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20630 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20630 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764191 () Bool)

(declare-fun res!517064 () Bool)

(assert (=> b!764191 (=> (not res!517064) (not e!425649))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764191 (= res!517064 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764192 () Bool)

(declare-fun res!517066 () Bool)

(declare-fun e!425651 () Bool)

(assert (=> b!764192 (=> (not res!517066) (not e!425651))))

(declare-datatypes ((List!14211 0))(
  ( (Nil!14208) (Cons!14207 (h!15291 (_ BitVec 64)) (t!20526 List!14211)) )
))
(declare-fun arrayNoDuplicates!0 (array!42203 (_ BitVec 32) List!14211) Bool)

(assert (=> b!764192 (= res!517066 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14208))))

(declare-fun b!764193 () Bool)

(assert (=> b!764193 (= e!425650 false)))

(declare-datatypes ((SeekEntryResult!7809 0))(
  ( (MissingZero!7809 (index!33604 (_ BitVec 32))) (Found!7809 (index!33605 (_ BitVec 32))) (Intermediate!7809 (undefined!8621 Bool) (index!33606 (_ BitVec 32)) (x!64501 (_ BitVec 32))) (Undefined!7809) (MissingVacant!7809 (index!33607 (_ BitVec 32))) )
))
(declare-fun lt!340071 () SeekEntryResult!7809)

(declare-fun lt!340068 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!340069 () array!42203)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42203 (_ BitVec 32)) SeekEntryResult!7809)

(assert (=> b!764193 (= lt!340071 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340068 lt!340069 mask!3328))))

(declare-fun lt!340070 () SeekEntryResult!7809)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764193 (= lt!340070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340068 mask!3328) lt!340068 lt!340069 mask!3328))))

(assert (=> b!764193 (= lt!340068 (select (store (arr!20209 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!764193 (= lt!340069 (array!42204 (store (arr!20209 a!3186) i!1173 k0!2102) (size!20630 a!3186)))))

(declare-fun b!764194 () Bool)

(declare-fun e!425652 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42203 (_ BitVec 32)) SeekEntryResult!7809)

(assert (=> b!764194 (= e!425652 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20209 a!3186) j!159) a!3186 mask!3328) (Found!7809 j!159)))))

(declare-fun b!764195 () Bool)

(assert (=> b!764195 (= e!425651 e!425650)))

(declare-fun res!517059 () Bool)

(assert (=> b!764195 (=> (not res!517059) (not e!425650))))

(declare-fun lt!340073 () SeekEntryResult!7809)

(assert (=> b!764195 (= res!517059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20209 a!3186) j!159) mask!3328) (select (arr!20209 a!3186) j!159) a!3186 mask!3328) lt!340073))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764195 (= lt!340073 (Intermediate!7809 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764196 () Bool)

(assert (=> b!764196 (= e!425652 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20209 a!3186) j!159) a!3186 mask!3328) lt!340073))))

(declare-fun b!764197 () Bool)

(declare-fun res!517055 () Bool)

(assert (=> b!764197 (=> (not res!517055) (not e!425651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42203 (_ BitVec 32)) Bool)

(assert (=> b!764197 (= res!517055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!517065 () Bool)

(assert (=> start!66298 (=> (not res!517065) (not e!425649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66298 (= res!517065 (validMask!0 mask!3328))))

(assert (=> start!66298 e!425649))

(assert (=> start!66298 true))

(declare-fun array_inv!16005 (array!42203) Bool)

(assert (=> start!66298 (array_inv!16005 a!3186)))

(declare-fun b!764198 () Bool)

(declare-fun res!517061 () Bool)

(assert (=> b!764198 (=> (not res!517061) (not e!425650))))

(assert (=> b!764198 (= res!517061 e!425652)))

(declare-fun c!83953 () Bool)

(assert (=> b!764198 (= c!83953 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764199 () Bool)

(declare-fun res!517057 () Bool)

(assert (=> b!764199 (=> (not res!517057) (not e!425651))))

(assert (=> b!764199 (= res!517057 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20630 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20630 a!3186))))))

(declare-fun b!764200 () Bool)

(declare-fun res!517063 () Bool)

(assert (=> b!764200 (=> (not res!517063) (not e!425649))))

(assert (=> b!764200 (= res!517063 (validKeyInArray!0 k0!2102))))

(declare-fun b!764201 () Bool)

(assert (=> b!764201 (= e!425649 e!425651)))

(declare-fun res!517062 () Bool)

(assert (=> b!764201 (=> (not res!517062) (not e!425651))))

(declare-fun lt!340072 () SeekEntryResult!7809)

(assert (=> b!764201 (= res!517062 (or (= lt!340072 (MissingZero!7809 i!1173)) (= lt!340072 (MissingVacant!7809 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42203 (_ BitVec 32)) SeekEntryResult!7809)

(assert (=> b!764201 (= lt!340072 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!66298 res!517065) b!764190))

(assert (= (and b!764190 res!517060) b!764188))

(assert (= (and b!764188 res!517058) b!764200))

(assert (= (and b!764200 res!517063) b!764191))

(assert (= (and b!764191 res!517064) b!764201))

(assert (= (and b!764201 res!517062) b!764197))

(assert (= (and b!764197 res!517055) b!764192))

(assert (= (and b!764192 res!517066) b!764199))

(assert (= (and b!764199 res!517057) b!764195))

(assert (= (and b!764195 res!517059) b!764189))

(assert (= (and b!764189 res!517056) b!764198))

(assert (= (and b!764198 c!83953) b!764196))

(assert (= (and b!764198 (not c!83953)) b!764194))

(assert (= (and b!764198 res!517061) b!764193))

(declare-fun m!710579 () Bool)

(assert (=> b!764196 m!710579))

(assert (=> b!764196 m!710579))

(declare-fun m!710581 () Bool)

(assert (=> b!764196 m!710581))

(declare-fun m!710583 () Bool)

(assert (=> b!764197 m!710583))

(declare-fun m!710585 () Bool)

(assert (=> b!764200 m!710585))

(declare-fun m!710587 () Bool)

(assert (=> start!66298 m!710587))

(declare-fun m!710589 () Bool)

(assert (=> start!66298 m!710589))

(assert (=> b!764194 m!710579))

(assert (=> b!764194 m!710579))

(declare-fun m!710591 () Bool)

(assert (=> b!764194 m!710591))

(declare-fun m!710593 () Bool)

(assert (=> b!764193 m!710593))

(declare-fun m!710595 () Bool)

(assert (=> b!764193 m!710595))

(assert (=> b!764193 m!710593))

(declare-fun m!710597 () Bool)

(assert (=> b!764193 m!710597))

(declare-fun m!710599 () Bool)

(assert (=> b!764193 m!710599))

(declare-fun m!710601 () Bool)

(assert (=> b!764193 m!710601))

(declare-fun m!710603 () Bool)

(assert (=> b!764192 m!710603))

(declare-fun m!710605 () Bool)

(assert (=> b!764191 m!710605))

(assert (=> b!764188 m!710579))

(assert (=> b!764188 m!710579))

(declare-fun m!710607 () Bool)

(assert (=> b!764188 m!710607))

(declare-fun m!710609 () Bool)

(assert (=> b!764189 m!710609))

(assert (=> b!764195 m!710579))

(assert (=> b!764195 m!710579))

(declare-fun m!710611 () Bool)

(assert (=> b!764195 m!710611))

(assert (=> b!764195 m!710611))

(assert (=> b!764195 m!710579))

(declare-fun m!710613 () Bool)

(assert (=> b!764195 m!710613))

(declare-fun m!710615 () Bool)

(assert (=> b!764201 m!710615))

(check-sat (not b!764197) (not start!66298) (not b!764201) (not b!764192) (not b!764200) (not b!764195) (not b!764188) (not b!764196) (not b!764191) (not b!764194) (not b!764193))
(check-sat)
