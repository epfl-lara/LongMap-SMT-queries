; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67018 () Bool)

(assert start!67018)

(declare-fun b!773540 () Bool)

(declare-fun e!430594 () Bool)

(declare-fun e!430596 () Bool)

(assert (=> b!773540 (= e!430594 e!430596)))

(declare-fun res!523169 () Bool)

(assert (=> b!773540 (=> (not res!523169) (not e!430596))))

(declare-datatypes ((array!42442 0))(
  ( (array!42443 (arr!20318 (Array (_ BitVec 32) (_ BitVec 64))) (size!20739 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42442)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7918 0))(
  ( (MissingZero!7918 (index!34040 (_ BitVec 32))) (Found!7918 (index!34041 (_ BitVec 32))) (Intermediate!7918 (undefined!8730 Bool) (index!34042 (_ BitVec 32)) (x!64977 (_ BitVec 32))) (Undefined!7918) (MissingVacant!7918 (index!34043 (_ BitVec 32))) )
))
(declare-fun lt!344470 () SeekEntryResult!7918)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42442 (_ BitVec 32)) SeekEntryResult!7918)

(assert (=> b!773540 (= res!523169 (= (seekEntryOrOpen!0 (select (arr!20318 a!3186) j!159) a!3186 mask!3328) lt!344470))))

(assert (=> b!773540 (= lt!344470 (Found!7918 j!159))))

(declare-fun res!523174 () Bool)

(declare-fun e!430593 () Bool)

(assert (=> start!67018 (=> (not res!523174) (not e!430593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67018 (= res!523174 (validMask!0 mask!3328))))

(assert (=> start!67018 e!430593))

(assert (=> start!67018 true))

(declare-fun array_inv!16114 (array!42442) Bool)

(assert (=> start!67018 (array_inv!16114 a!3186)))

(declare-fun b!773541 () Bool)

(declare-fun e!430600 () Bool)

(declare-fun e!430595 () Bool)

(assert (=> b!773541 (= e!430600 e!430595)))

(declare-fun res!523177 () Bool)

(assert (=> b!773541 (=> (not res!523177) (not e!430595))))

(declare-fun lt!344468 () SeekEntryResult!7918)

(declare-fun lt!344474 () SeekEntryResult!7918)

(assert (=> b!773541 (= res!523177 (= lt!344468 lt!344474))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!344464 () (_ BitVec 64))

(declare-fun lt!344466 () array!42442)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42442 (_ BitVec 32)) SeekEntryResult!7918)

(assert (=> b!773541 (= lt!344474 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344464 lt!344466 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773541 (= lt!344468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344464 mask!3328) lt!344464 lt!344466 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!773541 (= lt!344464 (select (store (arr!20318 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!773541 (= lt!344466 (array!42443 (store (arr!20318 a!3186) i!1173 k!2102) (size!20739 a!3186)))))

(declare-fun b!773542 () Bool)

(declare-fun res!523165 () Bool)

(assert (=> b!773542 (=> (not res!523165) (not e!430593))))

(declare-fun arrayContainsKey!0 (array!42442 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773542 (= res!523165 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773543 () Bool)

(declare-fun res!523171 () Bool)

(declare-fun e!430601 () Bool)

(assert (=> b!773543 (=> (not res!523171) (not e!430601))))

(declare-datatypes ((List!14320 0))(
  ( (Nil!14317) (Cons!14316 (h!15421 (_ BitVec 64)) (t!20635 List!14320)) )
))
(declare-fun arrayNoDuplicates!0 (array!42442 (_ BitVec 32) List!14320) Bool)

(assert (=> b!773543 (= res!523171 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14317))))

(declare-fun b!773544 () Bool)

(declare-fun e!430598 () Bool)

(assert (=> b!773544 (= e!430598 true)))

(declare-datatypes ((Unit!26686 0))(
  ( (Unit!26687) )
))
(declare-fun lt!344471 () Unit!26686)

(declare-fun e!430599 () Unit!26686)

(assert (=> b!773544 (= lt!344471 e!430599)))

(declare-fun c!85587 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773544 (= c!85587 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!344467 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773544 (= lt!344467 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773545 () Bool)

(declare-fun res!523173 () Bool)

(assert (=> b!773545 (=> (not res!523173) (not e!430593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773545 (= res!523173 (validKeyInArray!0 k!2102))))

(declare-fun b!773546 () Bool)

(declare-fun res!523175 () Bool)

(assert (=> b!773546 (=> (not res!523175) (not e!430600))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!773546 (= res!523175 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20318 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773547 () Bool)

(declare-fun Unit!26688 () Unit!26686)

(assert (=> b!773547 (= e!430599 Unit!26688)))

(declare-fun lt!344469 () SeekEntryResult!7918)

(assert (=> b!773547 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344467 (select (arr!20318 a!3186) j!159) a!3186 mask!3328) lt!344469)))

(declare-fun b!773548 () Bool)

(assert (=> b!773548 (= e!430593 e!430601)))

(declare-fun res!523176 () Bool)

(assert (=> b!773548 (=> (not res!523176) (not e!430601))))

(declare-fun lt!344465 () SeekEntryResult!7918)

(assert (=> b!773548 (= res!523176 (or (= lt!344465 (MissingZero!7918 i!1173)) (= lt!344465 (MissingVacant!7918 i!1173))))))

(assert (=> b!773548 (= lt!344465 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!773549 () Bool)

(assert (=> b!773549 (= e!430595 (not e!430598))))

(declare-fun res!523167 () Bool)

(assert (=> b!773549 (=> res!523167 e!430598)))

(assert (=> b!773549 (= res!523167 (or (not (is-Intermediate!7918 lt!344474)) (bvsge x!1131 (x!64977 lt!344474))))))

(assert (=> b!773549 e!430594))

(declare-fun res!523166 () Bool)

(assert (=> b!773549 (=> (not res!523166) (not e!430594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42442 (_ BitVec 32)) Bool)

(assert (=> b!773549 (= res!523166 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344473 () Unit!26686)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42442 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26686)

(assert (=> b!773549 (= lt!344473 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773550 () Bool)

(declare-fun res!523178 () Bool)

(assert (=> b!773550 (=> (not res!523178) (not e!430593))))

(assert (=> b!773550 (= res!523178 (validKeyInArray!0 (select (arr!20318 a!3186) j!159)))))

(declare-fun b!773551 () Bool)

(declare-fun res!523172 () Bool)

(assert (=> b!773551 (=> (not res!523172) (not e!430593))))

(assert (=> b!773551 (= res!523172 (and (= (size!20739 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20739 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20739 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773552 () Bool)

(assert (=> b!773552 (= e!430601 e!430600)))

(declare-fun res!523164 () Bool)

(assert (=> b!773552 (=> (not res!523164) (not e!430600))))

(assert (=> b!773552 (= res!523164 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20318 a!3186) j!159) mask!3328) (select (arr!20318 a!3186) j!159) a!3186 mask!3328) lt!344469))))

(assert (=> b!773552 (= lt!344469 (Intermediate!7918 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773553 () Bool)

(declare-fun Unit!26689 () Unit!26686)

(assert (=> b!773553 (= e!430599 Unit!26689)))

(declare-fun lt!344472 () SeekEntryResult!7918)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42442 (_ BitVec 32)) SeekEntryResult!7918)

(assert (=> b!773553 (= lt!344472 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20318 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773553 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344467 resIntermediateIndex!5 (select (arr!20318 a!3186) j!159) a!3186 mask!3328) (Found!7918 j!159))))

(declare-fun e!430592 () Bool)

(declare-fun b!773554 () Bool)

(assert (=> b!773554 (= e!430592 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20318 a!3186) j!159) a!3186 mask!3328) lt!344469))))

(declare-fun b!773555 () Bool)

(declare-fun res!523168 () Bool)

(assert (=> b!773555 (=> (not res!523168) (not e!430601))))

(assert (=> b!773555 (= res!523168 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20739 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20739 a!3186))))))

(declare-fun b!773556 () Bool)

(assert (=> b!773556 (= e!430596 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20318 a!3186) j!159) a!3186 mask!3328) lt!344470))))

(declare-fun b!773557 () Bool)

(declare-fun res!523163 () Bool)

(assert (=> b!773557 (=> (not res!523163) (not e!430601))))

(assert (=> b!773557 (= res!523163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773558 () Bool)

(declare-fun res!523170 () Bool)

(assert (=> b!773558 (=> (not res!523170) (not e!430600))))

(assert (=> b!773558 (= res!523170 e!430592)))

(declare-fun c!85588 () Bool)

(assert (=> b!773558 (= c!85588 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773559 () Bool)

(assert (=> b!773559 (= e!430592 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20318 a!3186) j!159) a!3186 mask!3328) (Found!7918 j!159)))))

(assert (= (and start!67018 res!523174) b!773551))

(assert (= (and b!773551 res!523172) b!773550))

(assert (= (and b!773550 res!523178) b!773545))

(assert (= (and b!773545 res!523173) b!773542))

(assert (= (and b!773542 res!523165) b!773548))

(assert (= (and b!773548 res!523176) b!773557))

(assert (= (and b!773557 res!523163) b!773543))

(assert (= (and b!773543 res!523171) b!773555))

(assert (= (and b!773555 res!523168) b!773552))

(assert (= (and b!773552 res!523164) b!773546))

(assert (= (and b!773546 res!523175) b!773558))

(assert (= (and b!773558 c!85588) b!773554))

(assert (= (and b!773558 (not c!85588)) b!773559))

(assert (= (and b!773558 res!523170) b!773541))

(assert (= (and b!773541 res!523177) b!773549))

(assert (= (and b!773549 res!523166) b!773540))

(assert (= (and b!773540 res!523169) b!773556))

(assert (= (and b!773549 (not res!523167)) b!773544))

(assert (= (and b!773544 c!85587) b!773547))

(assert (= (and b!773544 (not c!85587)) b!773553))

(declare-fun m!718255 () Bool)

(assert (=> b!773549 m!718255))

(declare-fun m!718257 () Bool)

(assert (=> b!773549 m!718257))

(declare-fun m!718259 () Bool)

(assert (=> b!773553 m!718259))

(assert (=> b!773553 m!718259))

(declare-fun m!718261 () Bool)

(assert (=> b!773553 m!718261))

(assert (=> b!773553 m!718259))

(declare-fun m!718263 () Bool)

(assert (=> b!773553 m!718263))

(declare-fun m!718265 () Bool)

(assert (=> b!773544 m!718265))

(assert (=> b!773547 m!718259))

(assert (=> b!773547 m!718259))

(declare-fun m!718267 () Bool)

(assert (=> b!773547 m!718267))

(declare-fun m!718269 () Bool)

(assert (=> b!773548 m!718269))

(assert (=> b!773554 m!718259))

(assert (=> b!773554 m!718259))

(declare-fun m!718271 () Bool)

(assert (=> b!773554 m!718271))

(assert (=> b!773552 m!718259))

(assert (=> b!773552 m!718259))

(declare-fun m!718273 () Bool)

(assert (=> b!773552 m!718273))

(assert (=> b!773552 m!718273))

(assert (=> b!773552 m!718259))

(declare-fun m!718275 () Bool)

(assert (=> b!773552 m!718275))

(assert (=> b!773550 m!718259))

(assert (=> b!773550 m!718259))

(declare-fun m!718277 () Bool)

(assert (=> b!773550 m!718277))

(declare-fun m!718279 () Bool)

(assert (=> b!773543 m!718279))

(assert (=> b!773556 m!718259))

(assert (=> b!773556 m!718259))

(declare-fun m!718281 () Bool)

(assert (=> b!773556 m!718281))

(declare-fun m!718283 () Bool)

(assert (=> b!773545 m!718283))

(declare-fun m!718285 () Bool)

(assert (=> b!773541 m!718285))

(declare-fun m!718287 () Bool)

(assert (=> b!773541 m!718287))

(declare-fun m!718289 () Bool)

(assert (=> b!773541 m!718289))

(declare-fun m!718291 () Bool)

(assert (=> b!773541 m!718291))

(declare-fun m!718293 () Bool)

(assert (=> b!773541 m!718293))

(assert (=> b!773541 m!718287))

(assert (=> b!773540 m!718259))

(assert (=> b!773540 m!718259))

(declare-fun m!718295 () Bool)

(assert (=> b!773540 m!718295))

(declare-fun m!718297 () Bool)

(assert (=> b!773542 m!718297))

(declare-fun m!718299 () Bool)

(assert (=> b!773557 m!718299))

(declare-fun m!718301 () Bool)

(assert (=> start!67018 m!718301))

(declare-fun m!718303 () Bool)

(assert (=> start!67018 m!718303))

(declare-fun m!718305 () Bool)

(assert (=> b!773546 m!718305))

(assert (=> b!773559 m!718259))

(assert (=> b!773559 m!718259))

(assert (=> b!773559 m!718261))

(push 1)

