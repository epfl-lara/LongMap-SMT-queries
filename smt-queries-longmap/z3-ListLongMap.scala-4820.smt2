; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66380 () Bool)

(assert start!66380)

(declare-fun b!764024 () Bool)

(declare-fun e!425765 () Bool)

(assert (=> b!764024 (= e!425765 false)))

(declare-fun lt!340056 () Bool)

(declare-fun e!425764 () Bool)

(assert (=> b!764024 (= lt!340056 e!425764)))

(declare-fun c!84086 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764024 (= c!84086 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42163 0))(
  ( (array!42164 (arr!20185 (Array (_ BitVec 32) (_ BitVec 64))) (size!20605 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42163)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!764025 () Bool)

(declare-datatypes ((SeekEntryResult!7741 0))(
  ( (MissingZero!7741 (index!33332 (_ BitVec 32))) (Found!7741 (index!33333 (_ BitVec 32))) (Intermediate!7741 (undefined!8553 Bool) (index!33334 (_ BitVec 32)) (x!64396 (_ BitVec 32))) (Undefined!7741) (MissingVacant!7741 (index!33335 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42163 (_ BitVec 32)) SeekEntryResult!7741)

(assert (=> b!764025 (= e!425764 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20185 a!3186) j!159) a!3186 mask!3328) (Found!7741 j!159))))))

(declare-fun b!764026 () Bool)

(declare-fun res!516640 () Bool)

(declare-fun e!425761 () Bool)

(assert (=> b!764026 (=> (not res!516640) (not e!425761))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764026 (= res!516640 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764027 () Bool)

(declare-fun res!516633 () Bool)

(declare-fun e!425763 () Bool)

(assert (=> b!764027 (=> (not res!516633) (not e!425763))))

(assert (=> b!764027 (= res!516633 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20605 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20605 a!3186))))))

(declare-fun b!764028 () Bool)

(declare-fun res!516641 () Bool)

(assert (=> b!764028 (=> (not res!516641) (not e!425761))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764028 (= res!516641 (and (= (size!20605 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20605 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20605 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764029 () Bool)

(declare-fun res!516632 () Bool)

(assert (=> b!764029 (=> (not res!516632) (not e!425763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42163 (_ BitVec 32)) Bool)

(assert (=> b!764029 (= res!516632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764030 () Bool)

(declare-fun res!516637 () Bool)

(assert (=> b!764030 (=> (not res!516637) (not e!425765))))

(assert (=> b!764030 (= res!516637 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20185 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764032 () Bool)

(declare-fun res!516639 () Bool)

(assert (=> b!764032 (=> (not res!516639) (not e!425761))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764032 (= res!516639 (validKeyInArray!0 (select (arr!20185 a!3186) j!159)))))

(declare-fun b!764033 () Bool)

(declare-fun res!516634 () Bool)

(assert (=> b!764033 (=> (not res!516634) (not e!425761))))

(assert (=> b!764033 (= res!516634 (validKeyInArray!0 k0!2102))))

(declare-fun b!764034 () Bool)

(assert (=> b!764034 (= e!425763 e!425765)))

(declare-fun res!516638 () Bool)

(assert (=> b!764034 (=> (not res!516638) (not e!425765))))

(declare-fun lt!340055 () SeekEntryResult!7741)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42163 (_ BitVec 32)) SeekEntryResult!7741)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764034 (= res!516638 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20185 a!3186) j!159) mask!3328) (select (arr!20185 a!3186) j!159) a!3186 mask!3328) lt!340055))))

(assert (=> b!764034 (= lt!340055 (Intermediate!7741 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764035 () Bool)

(assert (=> b!764035 (= e!425764 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20185 a!3186) j!159) a!3186 mask!3328) lt!340055)))))

(declare-fun b!764036 () Bool)

(assert (=> b!764036 (= e!425761 e!425763)))

(declare-fun res!516631 () Bool)

(assert (=> b!764036 (=> (not res!516631) (not e!425763))))

(declare-fun lt!340054 () SeekEntryResult!7741)

(assert (=> b!764036 (= res!516631 (or (= lt!340054 (MissingZero!7741 i!1173)) (= lt!340054 (MissingVacant!7741 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42163 (_ BitVec 32)) SeekEntryResult!7741)

(assert (=> b!764036 (= lt!340054 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!764031 () Bool)

(declare-fun res!516636 () Bool)

(assert (=> b!764031 (=> (not res!516636) (not e!425763))))

(declare-datatypes ((List!14094 0))(
  ( (Nil!14091) (Cons!14090 (h!15180 (_ BitVec 64)) (t!20401 List!14094)) )
))
(declare-fun arrayNoDuplicates!0 (array!42163 (_ BitVec 32) List!14094) Bool)

(assert (=> b!764031 (= res!516636 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14091))))

(declare-fun res!516635 () Bool)

(assert (=> start!66380 (=> (not res!516635) (not e!425761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66380 (= res!516635 (validMask!0 mask!3328))))

(assert (=> start!66380 e!425761))

(assert (=> start!66380 true))

(declare-fun array_inv!16044 (array!42163) Bool)

(assert (=> start!66380 (array_inv!16044 a!3186)))

(assert (= (and start!66380 res!516635) b!764028))

(assert (= (and b!764028 res!516641) b!764032))

(assert (= (and b!764032 res!516639) b!764033))

(assert (= (and b!764033 res!516634) b!764026))

(assert (= (and b!764026 res!516640) b!764036))

(assert (= (and b!764036 res!516631) b!764029))

(assert (= (and b!764029 res!516632) b!764031))

(assert (= (and b!764031 res!516636) b!764027))

(assert (= (and b!764027 res!516633) b!764034))

(assert (= (and b!764034 res!516638) b!764030))

(assert (= (and b!764030 res!516637) b!764024))

(assert (= (and b!764024 c!84086) b!764035))

(assert (= (and b!764024 (not c!84086)) b!764025))

(declare-fun m!710911 () Bool)

(assert (=> b!764033 m!710911))

(declare-fun m!710913 () Bool)

(assert (=> b!764031 m!710913))

(declare-fun m!710915 () Bool)

(assert (=> b!764036 m!710915))

(declare-fun m!710917 () Bool)

(assert (=> b!764034 m!710917))

(assert (=> b!764034 m!710917))

(declare-fun m!710919 () Bool)

(assert (=> b!764034 m!710919))

(assert (=> b!764034 m!710919))

(assert (=> b!764034 m!710917))

(declare-fun m!710921 () Bool)

(assert (=> b!764034 m!710921))

(assert (=> b!764025 m!710917))

(assert (=> b!764025 m!710917))

(declare-fun m!710923 () Bool)

(assert (=> b!764025 m!710923))

(assert (=> b!764032 m!710917))

(assert (=> b!764032 m!710917))

(declare-fun m!710925 () Bool)

(assert (=> b!764032 m!710925))

(declare-fun m!710927 () Bool)

(assert (=> b!764029 m!710927))

(declare-fun m!710929 () Bool)

(assert (=> start!66380 m!710929))

(declare-fun m!710931 () Bool)

(assert (=> start!66380 m!710931))

(declare-fun m!710933 () Bool)

(assert (=> b!764026 m!710933))

(declare-fun m!710935 () Bool)

(assert (=> b!764030 m!710935))

(assert (=> b!764035 m!710917))

(assert (=> b!764035 m!710917))

(declare-fun m!710937 () Bool)

(assert (=> b!764035 m!710937))

(check-sat (not start!66380) (not b!764026) (not b!764032) (not b!764036) (not b!764033) (not b!764025) (not b!764034) (not b!764029) (not b!764035) (not b!764031))
(check-sat)
