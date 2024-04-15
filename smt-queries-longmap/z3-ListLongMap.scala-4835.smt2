; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66462 () Bool)

(assert start!66462)

(declare-fun b!766025 () Bool)

(declare-fun e!426564 () Bool)

(assert (=> b!766025 (= e!426564 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!340618 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766025 (= lt!340618 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!766026 () Bool)

(declare-fun res!518315 () Bool)

(declare-fun e!426562 () Bool)

(assert (=> b!766026 (=> (not res!518315) (not e!426562))))

(declare-datatypes ((array!42258 0))(
  ( (array!42259 (arr!20234 (Array (_ BitVec 32) (_ BitVec 64))) (size!20655 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42258)

(declare-datatypes ((List!14275 0))(
  ( (Nil!14272) (Cons!14271 (h!15361 (_ BitVec 64)) (t!20581 List!14275)) )
))
(declare-fun arrayNoDuplicates!0 (array!42258 (_ BitVec 32) List!14275) Bool)

(assert (=> b!766026 (= res!518315 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14272))))

(declare-fun e!426560 () Bool)

(declare-datatypes ((SeekEntryResult!7831 0))(
  ( (MissingZero!7831 (index!33692 (_ BitVec 32))) (Found!7831 (index!33693 (_ BitVec 32))) (Intermediate!7831 (undefined!8643 Bool) (index!33694 (_ BitVec 32)) (x!64608 (_ BitVec 32))) (Undefined!7831) (MissingVacant!7831 (index!33695 (_ BitVec 32))) )
))
(declare-fun lt!340619 () SeekEntryResult!7831)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!766027 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42258 (_ BitVec 32)) SeekEntryResult!7831)

(assert (=> b!766027 (= e!426560 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20234 a!3186) j!159) a!3186 mask!3328) lt!340619))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!766028 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42258 (_ BitVec 32)) SeekEntryResult!7831)

(assert (=> b!766028 (= e!426560 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20234 a!3186) j!159) a!3186 mask!3328) (Found!7831 j!159)))))

(declare-fun b!766029 () Bool)

(declare-fun e!426559 () Bool)

(declare-fun e!426558 () Bool)

(assert (=> b!766029 (= e!426559 e!426558)))

(declare-fun res!518326 () Bool)

(assert (=> b!766029 (=> (not res!518326) (not e!426558))))

(declare-fun lt!340622 () SeekEntryResult!7831)

(declare-fun lt!340625 () SeekEntryResult!7831)

(assert (=> b!766029 (= res!518326 (= lt!340622 lt!340625))))

(declare-fun lt!340624 () array!42258)

(declare-fun lt!340617 () (_ BitVec 64))

(assert (=> b!766029 (= lt!340625 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340617 lt!340624 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766029 (= lt!340622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340617 mask!3328) lt!340617 lt!340624 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!766029 (= lt!340617 (select (store (arr!20234 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!766029 (= lt!340624 (array!42259 (store (arr!20234 a!3186) i!1173 k0!2102) (size!20655 a!3186)))))

(declare-fun b!766030 () Bool)

(declare-fun res!518324 () Bool)

(declare-fun e!426561 () Bool)

(assert (=> b!766030 (=> (not res!518324) (not e!426561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766030 (= res!518324 (validKeyInArray!0 k0!2102))))

(declare-fun b!766031 () Bool)

(assert (=> b!766031 (= e!426561 e!426562)))

(declare-fun res!518319 () Bool)

(assert (=> b!766031 (=> (not res!518319) (not e!426562))))

(declare-fun lt!340620 () SeekEntryResult!7831)

(assert (=> b!766031 (= res!518319 (or (= lt!340620 (MissingZero!7831 i!1173)) (= lt!340620 (MissingVacant!7831 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42258 (_ BitVec 32)) SeekEntryResult!7831)

(assert (=> b!766031 (= lt!340620 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!766032 () Bool)

(assert (=> b!766032 (= e!426558 (not e!426564))))

(declare-fun res!518316 () Bool)

(assert (=> b!766032 (=> res!518316 e!426564)))

(get-info :version)

(assert (=> b!766032 (= res!518316 (or (not ((_ is Intermediate!7831) lt!340625)) (bvsge x!1131 (x!64608 lt!340625))))))

(declare-fun e!426563 () Bool)

(assert (=> b!766032 e!426563))

(declare-fun res!518314 () Bool)

(assert (=> b!766032 (=> (not res!518314) (not e!426563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42258 (_ BitVec 32)) Bool)

(assert (=> b!766032 (= res!518314 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26360 0))(
  ( (Unit!26361) )
))
(declare-fun lt!340621 () Unit!26360)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42258 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26360)

(assert (=> b!766032 (= lt!340621 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!766033 () Bool)

(declare-fun e!426565 () Bool)

(assert (=> b!766033 (= e!426563 e!426565)))

(declare-fun res!518325 () Bool)

(assert (=> b!766033 (=> (not res!518325) (not e!426565))))

(declare-fun lt!340623 () SeekEntryResult!7831)

(assert (=> b!766033 (= res!518325 (= (seekEntryOrOpen!0 (select (arr!20234 a!3186) j!159) a!3186 mask!3328) lt!340623))))

(assert (=> b!766033 (= lt!340623 (Found!7831 j!159))))

(declare-fun b!766034 () Bool)

(declare-fun res!518317 () Bool)

(assert (=> b!766034 (=> (not res!518317) (not e!426562))))

(assert (=> b!766034 (= res!518317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766035 () Bool)

(declare-fun res!518321 () Bool)

(assert (=> b!766035 (=> (not res!518321) (not e!426562))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766035 (= res!518321 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20655 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20655 a!3186))))))

(declare-fun b!766036 () Bool)

(declare-fun res!518322 () Bool)

(assert (=> b!766036 (=> (not res!518322) (not e!426559))))

(assert (=> b!766036 (= res!518322 e!426560)))

(declare-fun c!84246 () Bool)

(assert (=> b!766036 (= c!84246 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!518312 () Bool)

(assert (=> start!66462 (=> (not res!518312) (not e!426561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66462 (= res!518312 (validMask!0 mask!3328))))

(assert (=> start!66462 e!426561))

(assert (=> start!66462 true))

(declare-fun array_inv!16117 (array!42258) Bool)

(assert (=> start!66462 (array_inv!16117 a!3186)))

(declare-fun b!766037 () Bool)

(declare-fun res!518327 () Bool)

(assert (=> b!766037 (=> (not res!518327) (not e!426561))))

(assert (=> b!766037 (= res!518327 (and (= (size!20655 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20655 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20655 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766038 () Bool)

(assert (=> b!766038 (= e!426565 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20234 a!3186) j!159) a!3186 mask!3328) lt!340623))))

(declare-fun b!766039 () Bool)

(assert (=> b!766039 (= e!426562 e!426559)))

(declare-fun res!518320 () Bool)

(assert (=> b!766039 (=> (not res!518320) (not e!426559))))

(assert (=> b!766039 (= res!518320 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20234 a!3186) j!159) mask!3328) (select (arr!20234 a!3186) j!159) a!3186 mask!3328) lt!340619))))

(assert (=> b!766039 (= lt!340619 (Intermediate!7831 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766040 () Bool)

(declare-fun res!518318 () Bool)

(assert (=> b!766040 (=> (not res!518318) (not e!426559))))

(assert (=> b!766040 (= res!518318 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20234 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766041 () Bool)

(declare-fun res!518313 () Bool)

(assert (=> b!766041 (=> (not res!518313) (not e!426561))))

(assert (=> b!766041 (= res!518313 (validKeyInArray!0 (select (arr!20234 a!3186) j!159)))))

(declare-fun b!766042 () Bool)

(declare-fun res!518323 () Bool)

(assert (=> b!766042 (=> (not res!518323) (not e!426561))))

(declare-fun arrayContainsKey!0 (array!42258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766042 (= res!518323 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66462 res!518312) b!766037))

(assert (= (and b!766037 res!518327) b!766041))

(assert (= (and b!766041 res!518313) b!766030))

(assert (= (and b!766030 res!518324) b!766042))

(assert (= (and b!766042 res!518323) b!766031))

(assert (= (and b!766031 res!518319) b!766034))

(assert (= (and b!766034 res!518317) b!766026))

(assert (= (and b!766026 res!518315) b!766035))

(assert (= (and b!766035 res!518321) b!766039))

(assert (= (and b!766039 res!518320) b!766040))

(assert (= (and b!766040 res!518318) b!766036))

(assert (= (and b!766036 c!84246) b!766027))

(assert (= (and b!766036 (not c!84246)) b!766028))

(assert (= (and b!766036 res!518322) b!766029))

(assert (= (and b!766029 res!518326) b!766032))

(assert (= (and b!766032 res!518314) b!766033))

(assert (= (and b!766033 res!518325) b!766038))

(assert (= (and b!766032 (not res!518316)) b!766025))

(declare-fun m!711523 () Bool)

(assert (=> b!766041 m!711523))

(assert (=> b!766041 m!711523))

(declare-fun m!711525 () Bool)

(assert (=> b!766041 m!711525))

(assert (=> b!766039 m!711523))

(assert (=> b!766039 m!711523))

(declare-fun m!711527 () Bool)

(assert (=> b!766039 m!711527))

(assert (=> b!766039 m!711527))

(assert (=> b!766039 m!711523))

(declare-fun m!711529 () Bool)

(assert (=> b!766039 m!711529))

(declare-fun m!711531 () Bool)

(assert (=> b!766031 m!711531))

(declare-fun m!711533 () Bool)

(assert (=> b!766025 m!711533))

(declare-fun m!711535 () Bool)

(assert (=> start!66462 m!711535))

(declare-fun m!711537 () Bool)

(assert (=> start!66462 m!711537))

(declare-fun m!711539 () Bool)

(assert (=> b!766032 m!711539))

(declare-fun m!711541 () Bool)

(assert (=> b!766032 m!711541))

(assert (=> b!766027 m!711523))

(assert (=> b!766027 m!711523))

(declare-fun m!711543 () Bool)

(assert (=> b!766027 m!711543))

(assert (=> b!766033 m!711523))

(assert (=> b!766033 m!711523))

(declare-fun m!711545 () Bool)

(assert (=> b!766033 m!711545))

(declare-fun m!711547 () Bool)

(assert (=> b!766029 m!711547))

(declare-fun m!711549 () Bool)

(assert (=> b!766029 m!711549))

(declare-fun m!711551 () Bool)

(assert (=> b!766029 m!711551))

(declare-fun m!711553 () Bool)

(assert (=> b!766029 m!711553))

(declare-fun m!711555 () Bool)

(assert (=> b!766029 m!711555))

(assert (=> b!766029 m!711547))

(assert (=> b!766028 m!711523))

(assert (=> b!766028 m!711523))

(declare-fun m!711557 () Bool)

(assert (=> b!766028 m!711557))

(assert (=> b!766038 m!711523))

(assert (=> b!766038 m!711523))

(declare-fun m!711559 () Bool)

(assert (=> b!766038 m!711559))

(declare-fun m!711561 () Bool)

(assert (=> b!766040 m!711561))

(declare-fun m!711563 () Bool)

(assert (=> b!766042 m!711563))

(declare-fun m!711565 () Bool)

(assert (=> b!766026 m!711565))

(declare-fun m!711567 () Bool)

(assert (=> b!766030 m!711567))

(declare-fun m!711569 () Bool)

(assert (=> b!766034 m!711569))

(check-sat (not b!766028) (not b!766041) (not start!66462) (not b!766032) (not b!766042) (not b!766025) (not b!766039) (not b!766038) (not b!766033) (not b!766029) (not b!766027) (not b!766034) (not b!766026) (not b!766031) (not b!766030))
(check-sat)
