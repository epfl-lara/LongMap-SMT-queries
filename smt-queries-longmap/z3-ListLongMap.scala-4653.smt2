; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64692 () Bool)

(assert start!64692)

(declare-fun b!729442 () Bool)

(declare-fun res!489850 () Bool)

(declare-fun e!408264 () Bool)

(assert (=> b!729442 (=> (not res!489850) (not e!408264))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729442 (= res!489850 (validKeyInArray!0 k0!2102))))

(declare-datatypes ((array!41141 0))(
  ( (array!41142 (arr!19690 (Array (_ BitVec 32) (_ BitVec 64))) (size!20111 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41141)

(declare-datatypes ((SeekEntryResult!7290 0))(
  ( (MissingZero!7290 (index!31528 (_ BitVec 32))) (Found!7290 (index!31529 (_ BitVec 32))) (Intermediate!7290 (undefined!8102 Bool) (index!31530 (_ BitVec 32)) (x!62512 (_ BitVec 32))) (Undefined!7290) (MissingVacant!7290 (index!31531 (_ BitVec 32))) )
))
(declare-fun lt!323165 () SeekEntryResult!7290)

(declare-fun e!408271 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!729443 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41141 (_ BitVec 32)) SeekEntryResult!7290)

(assert (=> b!729443 (= e!408271 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19690 a!3186) j!159) a!3186 mask!3328) lt!323165))))

(declare-fun b!729444 () Bool)

(declare-fun res!489852 () Bool)

(assert (=> b!729444 (=> (not res!489852) (not e!408264))))

(assert (=> b!729444 (= res!489852 (validKeyInArray!0 (select (arr!19690 a!3186) j!159)))))

(declare-fun b!729445 () Bool)

(declare-fun res!489846 () Bool)

(declare-fun e!408270 () Bool)

(assert (=> b!729445 (=> (not res!489846) (not e!408270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41141 (_ BitVec 32)) Bool)

(assert (=> b!729445 (= res!489846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!729446 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41141 (_ BitVec 32)) SeekEntryResult!7290)

(assert (=> b!729446 (= e!408271 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19690 a!3186) j!159) a!3186 mask!3328) (Found!7290 j!159)))))

(declare-fun b!729447 () Bool)

(declare-fun res!489859 () Bool)

(assert (=> b!729447 (=> (not res!489859) (not e!408264))))

(declare-fun arrayContainsKey!0 (array!41141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729447 (= res!489859 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729448 () Bool)

(assert (=> b!729448 (= e!408264 e!408270)))

(declare-fun res!489847 () Bool)

(assert (=> b!729448 (=> (not res!489847) (not e!408270))))

(declare-fun lt!323164 () SeekEntryResult!7290)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729448 (= res!489847 (or (= lt!323164 (MissingZero!7290 i!1173)) (= lt!323164 (MissingVacant!7290 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41141 (_ BitVec 32)) SeekEntryResult!7290)

(assert (=> b!729448 (= lt!323164 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!489845 () Bool)

(assert (=> start!64692 (=> (not res!489845) (not e!408264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64692 (= res!489845 (validMask!0 mask!3328))))

(assert (=> start!64692 e!408264))

(assert (=> start!64692 true))

(declare-fun array_inv!15486 (array!41141) Bool)

(assert (=> start!64692 (array_inv!15486 a!3186)))

(declare-fun b!729449 () Bool)

(declare-fun res!489856 () Bool)

(assert (=> b!729449 (=> (not res!489856) (not e!408270))))

(declare-datatypes ((List!13692 0))(
  ( (Nil!13689) (Cons!13688 (h!14748 (_ BitVec 64)) (t!20007 List!13692)) )
))
(declare-fun arrayNoDuplicates!0 (array!41141 (_ BitVec 32) List!13692) Bool)

(assert (=> b!729449 (= res!489856 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13689))))

(declare-fun b!729450 () Bool)

(declare-fun e!408269 () Bool)

(assert (=> b!729450 (= e!408269 true)))

(declare-fun lt!323171 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729450 (= lt!323171 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729451 () Bool)

(declare-fun res!489860 () Bool)

(declare-fun e!408268 () Bool)

(assert (=> b!729451 (=> (not res!489860) (not e!408268))))

(assert (=> b!729451 (= res!489860 e!408271)))

(declare-fun c!80173 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729451 (= c!80173 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729452 () Bool)

(declare-fun e!408265 () Bool)

(assert (=> b!729452 (= e!408268 e!408265)))

(declare-fun res!489854 () Bool)

(assert (=> b!729452 (=> (not res!489854) (not e!408265))))

(declare-fun lt!323168 () SeekEntryResult!7290)

(declare-fun lt!323166 () SeekEntryResult!7290)

(assert (=> b!729452 (= res!489854 (= lt!323168 lt!323166))))

(declare-fun lt!323170 () array!41141)

(declare-fun lt!323163 () (_ BitVec 64))

(assert (=> b!729452 (= lt!323166 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323163 lt!323170 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729452 (= lt!323168 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323163 mask!3328) lt!323163 lt!323170 mask!3328))))

(assert (=> b!729452 (= lt!323163 (select (store (arr!19690 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729452 (= lt!323170 (array!41142 (store (arr!19690 a!3186) i!1173 k0!2102) (size!20111 a!3186)))))

(declare-fun b!729453 () Bool)

(assert (=> b!729453 (= e!408270 e!408268)))

(declare-fun res!489851 () Bool)

(assert (=> b!729453 (=> (not res!489851) (not e!408268))))

(assert (=> b!729453 (= res!489851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19690 a!3186) j!159) mask!3328) (select (arr!19690 a!3186) j!159) a!3186 mask!3328) lt!323165))))

(assert (=> b!729453 (= lt!323165 (Intermediate!7290 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729454 () Bool)

(declare-fun res!489857 () Bool)

(assert (=> b!729454 (=> (not res!489857) (not e!408270))))

(assert (=> b!729454 (= res!489857 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20111 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20111 a!3186))))))

(declare-fun b!729455 () Bool)

(assert (=> b!729455 (= e!408265 (not e!408269))))

(declare-fun res!489848 () Bool)

(assert (=> b!729455 (=> res!489848 e!408269)))

(get-info :version)

(assert (=> b!729455 (= res!489848 (or (not ((_ is Intermediate!7290) lt!323166)) (bvsge x!1131 (x!62512 lt!323166))))))

(declare-fun e!408266 () Bool)

(assert (=> b!729455 e!408266))

(declare-fun res!489849 () Bool)

(assert (=> b!729455 (=> (not res!489849) (not e!408266))))

(assert (=> b!729455 (= res!489849 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24898 0))(
  ( (Unit!24899) )
))
(declare-fun lt!323167 () Unit!24898)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41141 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24898)

(assert (=> b!729455 (= lt!323167 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729456 () Bool)

(declare-fun res!489853 () Bool)

(assert (=> b!729456 (=> (not res!489853) (not e!408268))))

(assert (=> b!729456 (= res!489853 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19690 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!408272 () Bool)

(declare-fun b!729457 () Bool)

(declare-fun lt!323169 () SeekEntryResult!7290)

(assert (=> b!729457 (= e!408272 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19690 a!3186) j!159) a!3186 mask!3328) lt!323169))))

(declare-fun b!729458 () Bool)

(declare-fun res!489855 () Bool)

(assert (=> b!729458 (=> (not res!489855) (not e!408264))))

(assert (=> b!729458 (= res!489855 (and (= (size!20111 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20111 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20111 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729459 () Bool)

(assert (=> b!729459 (= e!408266 e!408272)))

(declare-fun res!489858 () Bool)

(assert (=> b!729459 (=> (not res!489858) (not e!408272))))

(assert (=> b!729459 (= res!489858 (= (seekEntryOrOpen!0 (select (arr!19690 a!3186) j!159) a!3186 mask!3328) lt!323169))))

(assert (=> b!729459 (= lt!323169 (Found!7290 j!159))))

(assert (= (and start!64692 res!489845) b!729458))

(assert (= (and b!729458 res!489855) b!729444))

(assert (= (and b!729444 res!489852) b!729442))

(assert (= (and b!729442 res!489850) b!729447))

(assert (= (and b!729447 res!489859) b!729448))

(assert (= (and b!729448 res!489847) b!729445))

(assert (= (and b!729445 res!489846) b!729449))

(assert (= (and b!729449 res!489856) b!729454))

(assert (= (and b!729454 res!489857) b!729453))

(assert (= (and b!729453 res!489851) b!729456))

(assert (= (and b!729456 res!489853) b!729451))

(assert (= (and b!729451 c!80173) b!729443))

(assert (= (and b!729451 (not c!80173)) b!729446))

(assert (= (and b!729451 res!489860) b!729452))

(assert (= (and b!729452 res!489854) b!729455))

(assert (= (and b!729455 res!489849) b!729459))

(assert (= (and b!729459 res!489858) b!729457))

(assert (= (and b!729455 (not res!489848)) b!729450))

(declare-fun m!683083 () Bool)

(assert (=> b!729459 m!683083))

(assert (=> b!729459 m!683083))

(declare-fun m!683085 () Bool)

(assert (=> b!729459 m!683085))

(declare-fun m!683087 () Bool)

(assert (=> start!64692 m!683087))

(declare-fun m!683089 () Bool)

(assert (=> start!64692 m!683089))

(declare-fun m!683091 () Bool)

(assert (=> b!729448 m!683091))

(declare-fun m!683093 () Bool)

(assert (=> b!729447 m!683093))

(declare-fun m!683095 () Bool)

(assert (=> b!729445 m!683095))

(assert (=> b!729446 m!683083))

(assert (=> b!729446 m!683083))

(declare-fun m!683097 () Bool)

(assert (=> b!729446 m!683097))

(assert (=> b!729443 m!683083))

(assert (=> b!729443 m!683083))

(declare-fun m!683099 () Bool)

(assert (=> b!729443 m!683099))

(declare-fun m!683101 () Bool)

(assert (=> b!729442 m!683101))

(assert (=> b!729457 m!683083))

(assert (=> b!729457 m!683083))

(declare-fun m!683103 () Bool)

(assert (=> b!729457 m!683103))

(assert (=> b!729444 m!683083))

(assert (=> b!729444 m!683083))

(declare-fun m!683105 () Bool)

(assert (=> b!729444 m!683105))

(declare-fun m!683107 () Bool)

(assert (=> b!729449 m!683107))

(declare-fun m!683109 () Bool)

(assert (=> b!729452 m!683109))

(declare-fun m!683111 () Bool)

(assert (=> b!729452 m!683111))

(declare-fun m!683113 () Bool)

(assert (=> b!729452 m!683113))

(assert (=> b!729452 m!683111))

(declare-fun m!683115 () Bool)

(assert (=> b!729452 m!683115))

(declare-fun m!683117 () Bool)

(assert (=> b!729452 m!683117))

(declare-fun m!683119 () Bool)

(assert (=> b!729455 m!683119))

(declare-fun m!683121 () Bool)

(assert (=> b!729455 m!683121))

(declare-fun m!683123 () Bool)

(assert (=> b!729456 m!683123))

(declare-fun m!683125 () Bool)

(assert (=> b!729450 m!683125))

(assert (=> b!729453 m!683083))

(assert (=> b!729453 m!683083))

(declare-fun m!683127 () Bool)

(assert (=> b!729453 m!683127))

(assert (=> b!729453 m!683127))

(assert (=> b!729453 m!683083))

(declare-fun m!683129 () Bool)

(assert (=> b!729453 m!683129))

(check-sat (not b!729459) (not b!729453) (not b!729455) (not b!729444) (not b!729442) (not b!729449) (not b!729443) (not b!729446) (not b!729448) (not b!729457) (not start!64692) (not b!729450) (not b!729447) (not b!729452) (not b!729445))
(check-sat)
