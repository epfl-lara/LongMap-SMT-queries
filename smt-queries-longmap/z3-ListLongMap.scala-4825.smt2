; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66410 () Bool)

(assert start!66410)

(declare-fun b!764658 () Bool)

(declare-fun res!517177 () Bool)

(declare-fun e!425999 () Bool)

(assert (=> b!764658 (=> (not res!517177) (not e!425999))))

(declare-datatypes ((array!42193 0))(
  ( (array!42194 (arr!20200 (Array (_ BitVec 32) (_ BitVec 64))) (size!20620 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42193)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42193 (_ BitVec 32)) Bool)

(assert (=> b!764658 (= res!517177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!426002 () Bool)

(declare-fun b!764659 () Bool)

(declare-datatypes ((SeekEntryResult!7756 0))(
  ( (MissingZero!7756 (index!33392 (_ BitVec 32))) (Found!7756 (index!33393 (_ BitVec 32))) (Intermediate!7756 (undefined!8568 Bool) (index!33394 (_ BitVec 32)) (x!64451 (_ BitVec 32))) (Undefined!7756) (MissingVacant!7756 (index!33395 (_ BitVec 32))) )
))
(declare-fun lt!340283 () SeekEntryResult!7756)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42193 (_ BitVec 32)) SeekEntryResult!7756)

(assert (=> b!764659 (= e!426002 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20200 a!3186) j!159) a!3186 mask!3328) lt!340283))))

(declare-fun b!764660 () Bool)

(declare-fun e!425997 () Bool)

(assert (=> b!764660 (= e!425997 e!425999)))

(declare-fun res!517175 () Bool)

(assert (=> b!764660 (=> (not res!517175) (not e!425999))))

(declare-fun lt!340281 () SeekEntryResult!7756)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764660 (= res!517175 (or (= lt!340281 (MissingZero!7756 i!1173)) (= lt!340281 (MissingVacant!7756 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42193 (_ BitVec 32)) SeekEntryResult!7756)

(assert (=> b!764660 (= lt!340281 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!764661 () Bool)

(declare-fun res!517178 () Bool)

(assert (=> b!764661 (=> (not res!517178) (not e!425997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764661 (= res!517178 (validKeyInArray!0 k0!2102))))

(declare-fun b!764663 () Bool)

(declare-fun res!517181 () Bool)

(assert (=> b!764663 (=> (not res!517181) (not e!425997))))

(assert (=> b!764663 (= res!517181 (and (= (size!20620 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20620 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20620 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764664 () Bool)

(declare-fun res!517180 () Bool)

(assert (=> b!764664 (=> (not res!517180) (not e!425997))))

(assert (=> b!764664 (= res!517180 (validKeyInArray!0 (select (arr!20200 a!3186) j!159)))))

(declare-fun b!764665 () Bool)

(declare-fun res!517176 () Bool)

(assert (=> b!764665 (=> (not res!517176) (not e!425999))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764665 (= res!517176 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20620 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20620 a!3186))))))

(declare-fun b!764666 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42193 (_ BitVec 32)) SeekEntryResult!7756)

(assert (=> b!764666 (= e!426002 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20200 a!3186) j!159) a!3186 mask!3328) (Found!7756 j!159)))))

(declare-fun b!764667 () Bool)

(declare-fun res!517179 () Bool)

(assert (=> b!764667 (=> (not res!517179) (not e!425999))))

(declare-datatypes ((List!14109 0))(
  ( (Nil!14106) (Cons!14105 (h!15195 (_ BitVec 64)) (t!20416 List!14109)) )
))
(declare-fun arrayNoDuplicates!0 (array!42193 (_ BitVec 32) List!14109) Bool)

(assert (=> b!764667 (= res!517179 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14106))))

(declare-fun b!764668 () Bool)

(declare-fun e!426000 () Bool)

(assert (=> b!764668 (= e!426000 (and (bvsle #b00000000000000000000000000000000 (size!20620 a!3186)) (bvsgt j!159 (size!20620 a!3186))))))

(declare-fun b!764669 () Bool)

(declare-fun e!425998 () Bool)

(assert (=> b!764669 (= e!425999 e!425998)))

(declare-fun res!517187 () Bool)

(assert (=> b!764669 (=> (not res!517187) (not e!425998))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764669 (= res!517187 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20200 a!3186) j!159) mask!3328) (select (arr!20200 a!3186) j!159) a!3186 mask!3328) lt!340283))))

(assert (=> b!764669 (= lt!340283 (Intermediate!7756 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764670 () Bool)

(declare-fun res!517183 () Bool)

(assert (=> b!764670 (=> (not res!517183) (not e!425997))))

(declare-fun arrayContainsKey!0 (array!42193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764670 (= res!517183 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!517184 () Bool)

(assert (=> start!66410 (=> (not res!517184) (not e!425997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66410 (= res!517184 (validMask!0 mask!3328))))

(assert (=> start!66410 e!425997))

(assert (=> start!66410 true))

(declare-fun array_inv!16059 (array!42193) Bool)

(assert (=> start!66410 (array_inv!16059 a!3186)))

(declare-fun b!764662 () Bool)

(declare-fun res!517186 () Bool)

(assert (=> b!764662 (=> (not res!517186) (not e!425998))))

(assert (=> b!764662 (= res!517186 e!426002)))

(declare-fun c!84131 () Bool)

(assert (=> b!764662 (= c!84131 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764671 () Bool)

(assert (=> b!764671 (= e!425998 e!426000)))

(declare-fun res!517185 () Bool)

(assert (=> b!764671 (=> (not res!517185) (not e!426000))))

(declare-fun lt!340282 () array!42193)

(declare-fun lt!340284 () (_ BitVec 64))

(assert (=> b!764671 (= res!517185 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340284 mask!3328) lt!340284 lt!340282 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340284 lt!340282 mask!3328)))))

(assert (=> b!764671 (= lt!340284 (select (store (arr!20200 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!764671 (= lt!340282 (array!42194 (store (arr!20200 a!3186) i!1173 k0!2102) (size!20620 a!3186)))))

(declare-fun b!764672 () Bool)

(declare-fun res!517182 () Bool)

(assert (=> b!764672 (=> (not res!517182) (not e!425998))))

(assert (=> b!764672 (= res!517182 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20200 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!66410 res!517184) b!764663))

(assert (= (and b!764663 res!517181) b!764664))

(assert (= (and b!764664 res!517180) b!764661))

(assert (= (and b!764661 res!517178) b!764670))

(assert (= (and b!764670 res!517183) b!764660))

(assert (= (and b!764660 res!517175) b!764658))

(assert (= (and b!764658 res!517177) b!764667))

(assert (= (and b!764667 res!517179) b!764665))

(assert (= (and b!764665 res!517176) b!764669))

(assert (= (and b!764669 res!517187) b!764672))

(assert (= (and b!764672 res!517182) b!764662))

(assert (= (and b!764662 c!84131) b!764659))

(assert (= (and b!764662 (not c!84131)) b!764666))

(assert (= (and b!764662 res!517186) b!764671))

(assert (= (and b!764671 res!517185) b!764668))

(declare-fun m!711451 () Bool)

(assert (=> b!764667 m!711451))

(declare-fun m!711453 () Bool)

(assert (=> b!764664 m!711453))

(assert (=> b!764664 m!711453))

(declare-fun m!711455 () Bool)

(assert (=> b!764664 m!711455))

(declare-fun m!711457 () Bool)

(assert (=> b!764670 m!711457))

(declare-fun m!711459 () Bool)

(assert (=> b!764661 m!711459))

(assert (=> b!764666 m!711453))

(assert (=> b!764666 m!711453))

(declare-fun m!711461 () Bool)

(assert (=> b!764666 m!711461))

(declare-fun m!711463 () Bool)

(assert (=> b!764660 m!711463))

(declare-fun m!711465 () Bool)

(assert (=> b!764671 m!711465))

(declare-fun m!711467 () Bool)

(assert (=> b!764671 m!711467))

(declare-fun m!711469 () Bool)

(assert (=> b!764671 m!711469))

(declare-fun m!711471 () Bool)

(assert (=> b!764671 m!711471))

(declare-fun m!711473 () Bool)

(assert (=> b!764671 m!711473))

(assert (=> b!764671 m!711471))

(declare-fun m!711475 () Bool)

(assert (=> start!66410 m!711475))

(declare-fun m!711477 () Bool)

(assert (=> start!66410 m!711477))

(assert (=> b!764669 m!711453))

(assert (=> b!764669 m!711453))

(declare-fun m!711479 () Bool)

(assert (=> b!764669 m!711479))

(assert (=> b!764669 m!711479))

(assert (=> b!764669 m!711453))

(declare-fun m!711481 () Bool)

(assert (=> b!764669 m!711481))

(declare-fun m!711483 () Bool)

(assert (=> b!764672 m!711483))

(assert (=> b!764659 m!711453))

(assert (=> b!764659 m!711453))

(declare-fun m!711485 () Bool)

(assert (=> b!764659 m!711485))

(declare-fun m!711487 () Bool)

(assert (=> b!764658 m!711487))

(check-sat (not b!764667) (not b!764658) (not b!764670) (not b!764661) (not b!764664) (not b!764666) (not b!764660) (not b!764659) (not b!764671) (not b!764669) (not start!66410))
(check-sat)
