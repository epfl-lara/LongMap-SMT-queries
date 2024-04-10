; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66824 () Bool)

(assert start!66824)

(declare-fun b!771116 () Bool)

(declare-fun res!521694 () Bool)

(declare-fun e!429290 () Bool)

(assert (=> b!771116 (=> (not res!521694) (not e!429290))))

(declare-datatypes ((array!42386 0))(
  ( (array!42387 (arr!20293 (Array (_ BitVec 32) (_ BitVec 64))) (size!20714 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42386)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!771116 (= res!521694 (and (= (size!20714 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20714 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20714 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!521699 () Bool)

(assert (=> start!66824 (=> (not res!521699) (not e!429290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66824 (= res!521699 (validMask!0 mask!3328))))

(assert (=> start!66824 e!429290))

(assert (=> start!66824 true))

(declare-fun array_inv!16089 (array!42386) Bool)

(assert (=> start!66824 (array_inv!16089 a!3186)))

(declare-fun e!429293 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!771117 () Bool)

(declare-datatypes ((SeekEntryResult!7893 0))(
  ( (MissingZero!7893 (index!33940 (_ BitVec 32))) (Found!7893 (index!33941 (_ BitVec 32))) (Intermediate!7893 (undefined!8705 Bool) (index!33942 (_ BitVec 32)) (x!64864 (_ BitVec 32))) (Undefined!7893) (MissingVacant!7893 (index!33943 (_ BitVec 32))) )
))
(declare-fun lt!343268 () SeekEntryResult!7893)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42386 (_ BitVec 32)) SeekEntryResult!7893)

(assert (=> b!771117 (= e!429293 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20293 a!3186) j!159) a!3186 mask!3328) lt!343268))))

(declare-fun b!771118 () Bool)

(declare-fun res!521706 () Bool)

(assert (=> b!771118 (=> (not res!521706) (not e!429290))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771118 (= res!521706 (validKeyInArray!0 k0!2102))))

(declare-fun b!771119 () Bool)

(declare-fun e!429299 () Bool)

(declare-fun e!429292 () Bool)

(assert (=> b!771119 (= e!429299 (not e!429292))))

(declare-fun res!521697 () Bool)

(assert (=> b!771119 (=> res!521697 e!429292)))

(declare-fun lt!343277 () SeekEntryResult!7893)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!771119 (= res!521697 (or (not ((_ is Intermediate!7893) lt!343277)) (bvsge x!1131 (x!64864 lt!343277))))))

(declare-fun e!429298 () Bool)

(assert (=> b!771119 e!429298))

(declare-fun res!521705 () Bool)

(assert (=> b!771119 (=> (not res!521705) (not e!429298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42386 (_ BitVec 32)) Bool)

(assert (=> b!771119 (= res!521705 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26586 0))(
  ( (Unit!26587) )
))
(declare-fun lt!343276 () Unit!26586)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26586)

(assert (=> b!771119 (= lt!343276 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!771120 () Bool)

(declare-fun res!521702 () Bool)

(declare-fun e!429296 () Bool)

(assert (=> b!771120 (=> (not res!521702) (not e!429296))))

(assert (=> b!771120 (= res!521702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!771121 () Bool)

(declare-fun res!521701 () Bool)

(declare-fun e!429295 () Bool)

(assert (=> b!771121 (=> (not res!521701) (not e!429295))))

(assert (=> b!771121 (= res!521701 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20293 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771122 () Bool)

(assert (=> b!771122 (= e!429295 e!429299)))

(declare-fun res!521704 () Bool)

(assert (=> b!771122 (=> (not res!521704) (not e!429299))))

(declare-fun lt!343270 () SeekEntryResult!7893)

(assert (=> b!771122 (= res!521704 (= lt!343270 lt!343277))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!343275 () (_ BitVec 64))

(declare-fun lt!343271 () array!42386)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42386 (_ BitVec 32)) SeekEntryResult!7893)

(assert (=> b!771122 (= lt!343277 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343275 lt!343271 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771122 (= lt!343270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343275 mask!3328) lt!343275 lt!343271 mask!3328))))

(assert (=> b!771122 (= lt!343275 (select (store (arr!20293 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!771122 (= lt!343271 (array!42387 (store (arr!20293 a!3186) i!1173 k0!2102) (size!20714 a!3186)))))

(declare-fun b!771123 () Bool)

(declare-fun res!521703 () Bool)

(assert (=> b!771123 (=> (not res!521703) (not e!429296))))

(assert (=> b!771123 (= res!521703 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20714 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20714 a!3186))))))

(declare-fun b!771124 () Bool)

(declare-fun lt!343272 () SeekEntryResult!7893)

(declare-fun e!429297 () Bool)

(assert (=> b!771124 (= e!429297 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20293 a!3186) j!159) a!3186 mask!3328) lt!343272))))

(declare-fun b!771125 () Bool)

(declare-fun res!521707 () Bool)

(assert (=> b!771125 (=> (not res!521707) (not e!429296))))

(declare-datatypes ((List!14295 0))(
  ( (Nil!14292) (Cons!14291 (h!15390 (_ BitVec 64)) (t!20610 List!14295)) )
))
(declare-fun arrayNoDuplicates!0 (array!42386 (_ BitVec 32) List!14295) Bool)

(assert (=> b!771125 (= res!521707 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14292))))

(declare-fun b!771126 () Bool)

(assert (=> b!771126 (= e!429298 e!429293)))

(declare-fun res!521700 () Bool)

(assert (=> b!771126 (=> (not res!521700) (not e!429293))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42386 (_ BitVec 32)) SeekEntryResult!7893)

(assert (=> b!771126 (= res!521700 (= (seekEntryOrOpen!0 (select (arr!20293 a!3186) j!159) a!3186 mask!3328) lt!343268))))

(assert (=> b!771126 (= lt!343268 (Found!7893 j!159))))

(declare-fun b!771127 () Bool)

(assert (=> b!771127 (= e!429292 true)))

(declare-fun lt!343273 () Unit!26586)

(declare-fun e!429291 () Unit!26586)

(assert (=> b!771127 (= lt!343273 e!429291)))

(declare-fun c!85107 () Bool)

(assert (=> b!771127 (= c!85107 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!343267 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771127 (= lt!343267 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!771128 () Bool)

(declare-fun res!521698 () Bool)

(assert (=> b!771128 (=> (not res!521698) (not e!429290))))

(declare-fun arrayContainsKey!0 (array!42386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771128 (= res!521698 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!771129 () Bool)

(declare-fun Unit!26588 () Unit!26586)

(assert (=> b!771129 (= e!429291 Unit!26588)))

(declare-fun lt!343269 () SeekEntryResult!7893)

(assert (=> b!771129 (= lt!343269 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20293 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!771129 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343267 resIntermediateIndex!5 (select (arr!20293 a!3186) j!159) a!3186 mask!3328) (Found!7893 j!159))))

(declare-fun b!771130 () Bool)

(assert (=> b!771130 (= e!429297 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20293 a!3186) j!159) a!3186 mask!3328) (Found!7893 j!159)))))

(declare-fun b!771131 () Bool)

(declare-fun Unit!26589 () Unit!26586)

(assert (=> b!771131 (= e!429291 Unit!26589)))

(assert (=> b!771131 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343267 (select (arr!20293 a!3186) j!159) a!3186 mask!3328) lt!343272)))

(declare-fun b!771132 () Bool)

(declare-fun res!521695 () Bool)

(assert (=> b!771132 (=> (not res!521695) (not e!429290))))

(assert (=> b!771132 (= res!521695 (validKeyInArray!0 (select (arr!20293 a!3186) j!159)))))

(declare-fun b!771133 () Bool)

(assert (=> b!771133 (= e!429296 e!429295)))

(declare-fun res!521708 () Bool)

(assert (=> b!771133 (=> (not res!521708) (not e!429295))))

(assert (=> b!771133 (= res!521708 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20293 a!3186) j!159) mask!3328) (select (arr!20293 a!3186) j!159) a!3186 mask!3328) lt!343272))))

(assert (=> b!771133 (= lt!343272 (Intermediate!7893 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771134 () Bool)

(assert (=> b!771134 (= e!429290 e!429296)))

(declare-fun res!521693 () Bool)

(assert (=> b!771134 (=> (not res!521693) (not e!429296))))

(declare-fun lt!343274 () SeekEntryResult!7893)

(assert (=> b!771134 (= res!521693 (or (= lt!343274 (MissingZero!7893 i!1173)) (= lt!343274 (MissingVacant!7893 i!1173))))))

(assert (=> b!771134 (= lt!343274 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!771135 () Bool)

(declare-fun res!521696 () Bool)

(assert (=> b!771135 (=> (not res!521696) (not e!429295))))

(assert (=> b!771135 (= res!521696 e!429297)))

(declare-fun c!85108 () Bool)

(assert (=> b!771135 (= c!85108 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66824 res!521699) b!771116))

(assert (= (and b!771116 res!521694) b!771132))

(assert (= (and b!771132 res!521695) b!771118))

(assert (= (and b!771118 res!521706) b!771128))

(assert (= (and b!771128 res!521698) b!771134))

(assert (= (and b!771134 res!521693) b!771120))

(assert (= (and b!771120 res!521702) b!771125))

(assert (= (and b!771125 res!521707) b!771123))

(assert (= (and b!771123 res!521703) b!771133))

(assert (= (and b!771133 res!521708) b!771121))

(assert (= (and b!771121 res!521701) b!771135))

(assert (= (and b!771135 c!85108) b!771124))

(assert (= (and b!771135 (not c!85108)) b!771130))

(assert (= (and b!771135 res!521696) b!771122))

(assert (= (and b!771122 res!521704) b!771119))

(assert (= (and b!771119 res!521705) b!771126))

(assert (= (and b!771126 res!521700) b!771117))

(assert (= (and b!771119 (not res!521697)) b!771127))

(assert (= (and b!771127 c!85107) b!771131))

(assert (= (and b!771127 (not c!85107)) b!771129))

(declare-fun m!716307 () Bool)

(assert (=> b!771125 m!716307))

(declare-fun m!716309 () Bool)

(assert (=> b!771134 m!716309))

(declare-fun m!716311 () Bool)

(assert (=> b!771129 m!716311))

(assert (=> b!771129 m!716311))

(declare-fun m!716313 () Bool)

(assert (=> b!771129 m!716313))

(assert (=> b!771129 m!716311))

(declare-fun m!716315 () Bool)

(assert (=> b!771129 m!716315))

(assert (=> b!771124 m!716311))

(assert (=> b!771124 m!716311))

(declare-fun m!716317 () Bool)

(assert (=> b!771124 m!716317))

(assert (=> b!771131 m!716311))

(assert (=> b!771131 m!716311))

(declare-fun m!716319 () Bool)

(assert (=> b!771131 m!716319))

(declare-fun m!716321 () Bool)

(assert (=> b!771128 m!716321))

(declare-fun m!716323 () Bool)

(assert (=> b!771127 m!716323))

(assert (=> b!771117 m!716311))

(assert (=> b!771117 m!716311))

(declare-fun m!716325 () Bool)

(assert (=> b!771117 m!716325))

(assert (=> b!771130 m!716311))

(assert (=> b!771130 m!716311))

(assert (=> b!771130 m!716313))

(declare-fun m!716327 () Bool)

(assert (=> b!771122 m!716327))

(declare-fun m!716329 () Bool)

(assert (=> b!771122 m!716329))

(declare-fun m!716331 () Bool)

(assert (=> b!771122 m!716331))

(declare-fun m!716333 () Bool)

(assert (=> b!771122 m!716333))

(assert (=> b!771122 m!716331))

(declare-fun m!716335 () Bool)

(assert (=> b!771122 m!716335))

(assert (=> b!771126 m!716311))

(assert (=> b!771126 m!716311))

(declare-fun m!716337 () Bool)

(assert (=> b!771126 m!716337))

(declare-fun m!716339 () Bool)

(assert (=> b!771120 m!716339))

(assert (=> b!771133 m!716311))

(assert (=> b!771133 m!716311))

(declare-fun m!716341 () Bool)

(assert (=> b!771133 m!716341))

(assert (=> b!771133 m!716341))

(assert (=> b!771133 m!716311))

(declare-fun m!716343 () Bool)

(assert (=> b!771133 m!716343))

(declare-fun m!716345 () Bool)

(assert (=> b!771119 m!716345))

(declare-fun m!716347 () Bool)

(assert (=> b!771119 m!716347))

(declare-fun m!716349 () Bool)

(assert (=> b!771121 m!716349))

(assert (=> b!771132 m!716311))

(assert (=> b!771132 m!716311))

(declare-fun m!716351 () Bool)

(assert (=> b!771132 m!716351))

(declare-fun m!716353 () Bool)

(assert (=> start!66824 m!716353))

(declare-fun m!716355 () Bool)

(assert (=> start!66824 m!716355))

(declare-fun m!716357 () Bool)

(assert (=> b!771118 m!716357))

(check-sat (not b!771126) (not b!771128) (not b!771133) (not b!771117) (not b!771119) (not b!771131) (not b!771120) (not b!771132) (not b!771125) (not b!771124) (not b!771118) (not start!66824) (not b!771127) (not b!771129) (not b!771122) (not b!771134) (not b!771130))
(check-sat)
