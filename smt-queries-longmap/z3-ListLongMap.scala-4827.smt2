; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66304 () Bool)

(assert start!66304)

(declare-fun b!764319 () Bool)

(declare-fun e!425701 () Bool)

(declare-fun e!425703 () Bool)

(assert (=> b!764319 (= e!425701 e!425703)))

(declare-fun res!517173 () Bool)

(assert (=> b!764319 (=> (not res!517173) (not e!425703))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!340121 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42209 0))(
  ( (array!42210 (arr!20212 (Array (_ BitVec 32) (_ BitVec 64))) (size!20633 (_ BitVec 32))) )
))
(declare-fun lt!340118 () array!42209)

(declare-datatypes ((SeekEntryResult!7812 0))(
  ( (MissingZero!7812 (index!33616 (_ BitVec 32))) (Found!7812 (index!33617 (_ BitVec 32))) (Intermediate!7812 (undefined!8624 Bool) (index!33618 (_ BitVec 32)) (x!64512 (_ BitVec 32))) (Undefined!7812) (MissingVacant!7812 (index!33619 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42209 (_ BitVec 32)) SeekEntryResult!7812)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764319 (= res!517173 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340121 mask!3328) lt!340121 lt!340118 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340121 lt!340118 mask!3328)))))

(declare-fun a!3186 () array!42209)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!764319 (= lt!340121 (select (store (arr!20212 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!764319 (= lt!340118 (array!42210 (store (arr!20212 a!3186) i!1173 k0!2102) (size!20633 a!3186)))))

(declare-fun b!764320 () Bool)

(declare-fun e!425699 () Bool)

(declare-fun e!425702 () Bool)

(assert (=> b!764320 (= e!425699 e!425702)))

(declare-fun res!517169 () Bool)

(assert (=> b!764320 (=> (not res!517169) (not e!425702))))

(declare-fun lt!340120 () SeekEntryResult!7812)

(assert (=> b!764320 (= res!517169 (or (= lt!340120 (MissingZero!7812 i!1173)) (= lt!340120 (MissingVacant!7812 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42209 (_ BitVec 32)) SeekEntryResult!7812)

(assert (=> b!764320 (= lt!340120 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!517175 () Bool)

(assert (=> start!66304 (=> (not res!517175) (not e!425699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66304 (= res!517175 (validMask!0 mask!3328))))

(assert (=> start!66304 e!425699))

(assert (=> start!66304 true))

(declare-fun array_inv!16008 (array!42209) Bool)

(assert (=> start!66304 (array_inv!16008 a!3186)))

(declare-fun b!764321 () Bool)

(declare-fun res!517170 () Bool)

(assert (=> b!764321 (=> (not res!517170) (not e!425699))))

(assert (=> b!764321 (= res!517170 (and (= (size!20633 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20633 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20633 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764322 () Bool)

(declare-fun res!517172 () Bool)

(assert (=> b!764322 (=> (not res!517172) (not e!425702))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764322 (= res!517172 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20633 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20633 a!3186))))))

(declare-fun b!764323 () Bool)

(declare-fun res!517176 () Bool)

(assert (=> b!764323 (=> (not res!517176) (not e!425699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764323 (= res!517176 (validKeyInArray!0 (select (arr!20212 a!3186) j!159)))))

(declare-fun b!764324 () Bool)

(declare-fun res!517179 () Bool)

(assert (=> b!764324 (=> (not res!517179) (not e!425699))))

(declare-fun arrayContainsKey!0 (array!42209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764324 (= res!517179 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764325 () Bool)

(declare-fun res!517174 () Bool)

(assert (=> b!764325 (=> (not res!517174) (not e!425702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42209 (_ BitVec 32)) Bool)

(assert (=> b!764325 (= res!517174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764326 () Bool)

(declare-fun res!517168 () Bool)

(assert (=> b!764326 (=> (not res!517168) (not e!425702))))

(declare-datatypes ((List!14214 0))(
  ( (Nil!14211) (Cons!14210 (h!15294 (_ BitVec 64)) (t!20529 List!14214)) )
))
(declare-fun arrayNoDuplicates!0 (array!42209 (_ BitVec 32) List!14214) Bool)

(assert (=> b!764326 (= res!517168 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14211))))

(declare-fun b!764327 () Bool)

(declare-fun res!517171 () Bool)

(assert (=> b!764327 (=> (not res!517171) (not e!425699))))

(assert (=> b!764327 (= res!517171 (validKeyInArray!0 k0!2102))))

(declare-fun e!425700 () Bool)

(declare-fun b!764328 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42209 (_ BitVec 32)) SeekEntryResult!7812)

(assert (=> b!764328 (= e!425700 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20212 a!3186) j!159) a!3186 mask!3328) (Found!7812 j!159)))))

(declare-fun b!764329 () Bool)

(declare-fun res!517177 () Bool)

(assert (=> b!764329 (=> (not res!517177) (not e!425701))))

(assert (=> b!764329 (= res!517177 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20212 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764330 () Bool)

(assert (=> b!764330 (= e!425702 e!425701)))

(declare-fun res!517178 () Bool)

(assert (=> b!764330 (=> (not res!517178) (not e!425701))))

(declare-fun lt!340117 () SeekEntryResult!7812)

(assert (=> b!764330 (= res!517178 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20212 a!3186) j!159) mask!3328) (select (arr!20212 a!3186) j!159) a!3186 mask!3328) lt!340117))))

(assert (=> b!764330 (= lt!340117 (Intermediate!7812 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764331 () Bool)

(declare-fun res!517180 () Bool)

(assert (=> b!764331 (=> (not res!517180) (not e!425701))))

(assert (=> b!764331 (= res!517180 e!425700)))

(declare-fun c!83962 () Bool)

(assert (=> b!764331 (= c!83962 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764332 () Bool)

(assert (=> b!764332 (= e!425703 (not true))))

(assert (=> b!764332 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26350 0))(
  ( (Unit!26351) )
))
(declare-fun lt!340119 () Unit!26350)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26350)

(assert (=> b!764332 (= lt!340119 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!764333 () Bool)

(assert (=> b!764333 (= e!425700 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20212 a!3186) j!159) a!3186 mask!3328) lt!340117))))

(assert (= (and start!66304 res!517175) b!764321))

(assert (= (and b!764321 res!517170) b!764323))

(assert (= (and b!764323 res!517176) b!764327))

(assert (= (and b!764327 res!517171) b!764324))

(assert (= (and b!764324 res!517179) b!764320))

(assert (= (and b!764320 res!517169) b!764325))

(assert (= (and b!764325 res!517174) b!764326))

(assert (= (and b!764326 res!517168) b!764322))

(assert (= (and b!764322 res!517172) b!764330))

(assert (= (and b!764330 res!517178) b!764329))

(assert (= (and b!764329 res!517177) b!764331))

(assert (= (and b!764331 c!83962) b!764333))

(assert (= (and b!764331 (not c!83962)) b!764328))

(assert (= (and b!764331 res!517180) b!764319))

(assert (= (and b!764319 res!517173) b!764332))

(declare-fun m!710697 () Bool)

(assert (=> b!764319 m!710697))

(assert (=> b!764319 m!710697))

(declare-fun m!710699 () Bool)

(assert (=> b!764319 m!710699))

(declare-fun m!710701 () Bool)

(assert (=> b!764319 m!710701))

(declare-fun m!710703 () Bool)

(assert (=> b!764319 m!710703))

(declare-fun m!710705 () Bool)

(assert (=> b!764319 m!710705))

(declare-fun m!710707 () Bool)

(assert (=> b!764325 m!710707))

(declare-fun m!710709 () Bool)

(assert (=> b!764327 m!710709))

(declare-fun m!710711 () Bool)

(assert (=> start!66304 m!710711))

(declare-fun m!710713 () Bool)

(assert (=> start!66304 m!710713))

(declare-fun m!710715 () Bool)

(assert (=> b!764328 m!710715))

(assert (=> b!764328 m!710715))

(declare-fun m!710717 () Bool)

(assert (=> b!764328 m!710717))

(assert (=> b!764333 m!710715))

(assert (=> b!764333 m!710715))

(declare-fun m!710719 () Bool)

(assert (=> b!764333 m!710719))

(declare-fun m!710721 () Bool)

(assert (=> b!764332 m!710721))

(declare-fun m!710723 () Bool)

(assert (=> b!764332 m!710723))

(assert (=> b!764323 m!710715))

(assert (=> b!764323 m!710715))

(declare-fun m!710725 () Bool)

(assert (=> b!764323 m!710725))

(declare-fun m!710727 () Bool)

(assert (=> b!764329 m!710727))

(assert (=> b!764330 m!710715))

(assert (=> b!764330 m!710715))

(declare-fun m!710729 () Bool)

(assert (=> b!764330 m!710729))

(assert (=> b!764330 m!710729))

(assert (=> b!764330 m!710715))

(declare-fun m!710731 () Bool)

(assert (=> b!764330 m!710731))

(declare-fun m!710733 () Bool)

(assert (=> b!764324 m!710733))

(declare-fun m!710735 () Bool)

(assert (=> b!764326 m!710735))

(declare-fun m!710737 () Bool)

(assert (=> b!764320 m!710737))

(check-sat (not b!764323) (not b!764326) (not b!764324) (not b!764327) (not b!764330) (not b!764333) (not b!764328) (not start!66304) (not b!764320) (not b!764325) (not b!764319) (not b!764332))
(check-sat)
