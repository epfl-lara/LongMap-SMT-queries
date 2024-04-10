; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64912 () Bool)

(assert start!64912)

(declare-fun b!732404 () Bool)

(declare-fun res!492002 () Bool)

(declare-fun e!409846 () Bool)

(assert (=> b!732404 (=> (not res!492002) (not e!409846))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41223 0))(
  ( (array!41224 (arr!19728 (Array (_ BitVec 32) (_ BitVec 64))) (size!20149 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41223)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!732404 (= res!492002 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20149 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20149 a!3186))))))

(declare-fun b!732405 () Bool)

(declare-fun res!492009 () Bool)

(declare-fun e!409843 () Bool)

(assert (=> b!732405 (=> (not res!492009) (not e!409843))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732405 (= res!492009 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!732407 () Bool)

(declare-fun res!492000 () Bool)

(assert (=> b!732407 (=> (not res!492000) (not e!409846))))

(declare-datatypes ((List!13730 0))(
  ( (Nil!13727) (Cons!13726 (h!14792 (_ BitVec 64)) (t!20045 List!13730)) )
))
(declare-fun arrayNoDuplicates!0 (array!41223 (_ BitVec 32) List!13730) Bool)

(assert (=> b!732407 (= res!492000 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13727))))

(declare-fun e!409849 () Bool)

(declare-fun b!732408 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7328 0))(
  ( (MissingZero!7328 (index!31680 (_ BitVec 32))) (Found!7328 (index!31681 (_ BitVec 32))) (Intermediate!7328 (undefined!8140 Bool) (index!31682 (_ BitVec 32)) (x!62678 (_ BitVec 32))) (Undefined!7328) (MissingVacant!7328 (index!31683 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41223 (_ BitVec 32)) SeekEntryResult!7328)

(assert (=> b!732408 (= e!409849 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19728 a!3186) j!159) a!3186 mask!3328) (Found!7328 j!159)))))

(declare-fun b!732409 () Bool)

(declare-fun res!492011 () Bool)

(assert (=> b!732409 (=> (not res!492011) (not e!409843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732409 (= res!492011 (validKeyInArray!0 (select (arr!19728 a!3186) j!159)))))

(declare-fun b!732410 () Bool)

(declare-fun e!409841 () Bool)

(assert (=> b!732410 (= e!409846 e!409841)))

(declare-fun res!492003 () Bool)

(assert (=> b!732410 (=> (not res!492003) (not e!409841))))

(declare-fun lt!324559 () SeekEntryResult!7328)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41223 (_ BitVec 32)) SeekEntryResult!7328)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732410 (= res!492003 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19728 a!3186) j!159) mask!3328) (select (arr!19728 a!3186) j!159) a!3186 mask!3328) lt!324559))))

(assert (=> b!732410 (= lt!324559 (Intermediate!7328 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732411 () Bool)

(declare-fun e!409845 () Bool)

(assert (=> b!732411 (= e!409841 e!409845)))

(declare-fun res!492012 () Bool)

(assert (=> b!732411 (=> (not res!492012) (not e!409845))))

(declare-fun lt!324561 () SeekEntryResult!7328)

(declare-fun lt!324562 () SeekEntryResult!7328)

(assert (=> b!732411 (= res!492012 (= lt!324561 lt!324562))))

(declare-fun lt!324557 () (_ BitVec 64))

(declare-fun lt!324563 () array!41223)

(assert (=> b!732411 (= lt!324562 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324557 lt!324563 mask!3328))))

(assert (=> b!732411 (= lt!324561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324557 mask!3328) lt!324557 lt!324563 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!732411 (= lt!324557 (select (store (arr!19728 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!732411 (= lt!324563 (array!41224 (store (arr!19728 a!3186) i!1173 k!2102) (size!20149 a!3186)))))

(declare-fun b!732412 () Bool)

(assert (=> b!732412 (= e!409849 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19728 a!3186) j!159) a!3186 mask!3328) lt!324559))))

(declare-fun b!732413 () Bool)

(declare-fun res!492008 () Bool)

(assert (=> b!732413 (=> (not res!492008) (not e!409846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41223 (_ BitVec 32)) Bool)

(assert (=> b!732413 (= res!492008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!732414 () Bool)

(declare-fun res!492005 () Bool)

(assert (=> b!732414 (=> (not res!492005) (not e!409841))))

(assert (=> b!732414 (= res!492005 e!409849)))

(declare-fun c!80581 () Bool)

(assert (=> b!732414 (= c!80581 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!732415 () Bool)

(declare-fun res!492001 () Bool)

(declare-fun e!409847 () Bool)

(assert (=> b!732415 (=> res!492001 e!409847)))

(assert (=> b!732415 (= res!492001 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19728 a!3186) j!159) a!3186 mask!3328) (Found!7328 j!159))))))

(declare-fun b!732416 () Bool)

(declare-fun lt!324556 () (_ BitVec 32))

(assert (=> b!732416 (= e!409847 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt lt!324556 #b00000000000000000000000000000000) (bvsge lt!324556 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!732417 () Bool)

(assert (=> b!732417 (= e!409843 e!409846)))

(declare-fun res!492006 () Bool)

(assert (=> b!732417 (=> (not res!492006) (not e!409846))))

(declare-fun lt!324560 () SeekEntryResult!7328)

(assert (=> b!732417 (= res!492006 (or (= lt!324560 (MissingZero!7328 i!1173)) (= lt!324560 (MissingVacant!7328 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41223 (_ BitVec 32)) SeekEntryResult!7328)

(assert (=> b!732417 (= lt!324560 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!732418 () Bool)

(declare-fun res!492013 () Bool)

(assert (=> b!732418 (=> (not res!492013) (not e!409841))))

(assert (=> b!732418 (= res!492013 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19728 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732419 () Bool)

(declare-fun res!492010 () Bool)

(assert (=> b!732419 (=> (not res!492010) (not e!409843))))

(assert (=> b!732419 (= res!492010 (validKeyInArray!0 k!2102))))

(declare-fun b!732406 () Bool)

(declare-fun e!409848 () Bool)

(assert (=> b!732406 (= e!409845 (not e!409848))))

(declare-fun res!491999 () Bool)

(assert (=> b!732406 (=> res!491999 e!409848)))

(assert (=> b!732406 (= res!491999 (or (not (is-Intermediate!7328 lt!324562)) (bvsge x!1131 (x!62678 lt!324562))))))

(declare-fun e!409850 () Bool)

(assert (=> b!732406 e!409850))

(declare-fun res!492014 () Bool)

(assert (=> b!732406 (=> (not res!492014) (not e!409850))))

(assert (=> b!732406 (= res!492014 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24974 0))(
  ( (Unit!24975) )
))
(declare-fun lt!324558 () Unit!24974)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41223 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24974)

(assert (=> b!732406 (= lt!324558 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!491998 () Bool)

(assert (=> start!64912 (=> (not res!491998) (not e!409843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64912 (= res!491998 (validMask!0 mask!3328))))

(assert (=> start!64912 e!409843))

(assert (=> start!64912 true))

(declare-fun array_inv!15524 (array!41223) Bool)

(assert (=> start!64912 (array_inv!15524 a!3186)))

(declare-fun b!732420 () Bool)

(declare-fun res!491997 () Bool)

(assert (=> b!732420 (=> (not res!491997) (not e!409843))))

(assert (=> b!732420 (= res!491997 (and (= (size!20149 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20149 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20149 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!732421 () Bool)

(declare-fun e!409842 () Bool)

(assert (=> b!732421 (= e!409850 e!409842)))

(declare-fun res!492004 () Bool)

(assert (=> b!732421 (=> (not res!492004) (not e!409842))))

(declare-fun lt!324555 () SeekEntryResult!7328)

(assert (=> b!732421 (= res!492004 (= (seekEntryOrOpen!0 (select (arr!19728 a!3186) j!159) a!3186 mask!3328) lt!324555))))

(assert (=> b!732421 (= lt!324555 (Found!7328 j!159))))

(declare-fun b!732422 () Bool)

(assert (=> b!732422 (= e!409842 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19728 a!3186) j!159) a!3186 mask!3328) lt!324555))))

(declare-fun b!732423 () Bool)

(assert (=> b!732423 (= e!409848 e!409847)))

(declare-fun res!492007 () Bool)

(assert (=> b!732423 (=> res!492007 e!409847)))

(assert (=> b!732423 (= res!492007 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732423 (= lt!324556 (nextIndex!0 index!1321 x!1131 mask!3328))))

(assert (= (and start!64912 res!491998) b!732420))

(assert (= (and b!732420 res!491997) b!732409))

(assert (= (and b!732409 res!492011) b!732419))

(assert (= (and b!732419 res!492010) b!732405))

(assert (= (and b!732405 res!492009) b!732417))

(assert (= (and b!732417 res!492006) b!732413))

(assert (= (and b!732413 res!492008) b!732407))

(assert (= (and b!732407 res!492000) b!732404))

(assert (= (and b!732404 res!492002) b!732410))

(assert (= (and b!732410 res!492003) b!732418))

(assert (= (and b!732418 res!492013) b!732414))

(assert (= (and b!732414 c!80581) b!732412))

(assert (= (and b!732414 (not c!80581)) b!732408))

(assert (= (and b!732414 res!492005) b!732411))

(assert (= (and b!732411 res!492012) b!732406))

(assert (= (and b!732406 res!492014) b!732421))

(assert (= (and b!732421 res!492004) b!732422))

(assert (= (and b!732406 (not res!491999)) b!732423))

(assert (= (and b!732423 (not res!492007)) b!732415))

(assert (= (and b!732415 (not res!492001)) b!732416))

(declare-fun m!685471 () Bool)

(assert (=> b!732423 m!685471))

(declare-fun m!685473 () Bool)

(assert (=> b!732406 m!685473))

(declare-fun m!685475 () Bool)

(assert (=> b!732406 m!685475))

(declare-fun m!685477 () Bool)

(assert (=> b!732407 m!685477))

(declare-fun m!685479 () Bool)

(assert (=> b!732422 m!685479))

(assert (=> b!732422 m!685479))

(declare-fun m!685481 () Bool)

(assert (=> b!732422 m!685481))

(assert (=> b!732421 m!685479))

(assert (=> b!732421 m!685479))

(declare-fun m!685483 () Bool)

(assert (=> b!732421 m!685483))

(declare-fun m!685485 () Bool)

(assert (=> start!64912 m!685485))

(declare-fun m!685487 () Bool)

(assert (=> start!64912 m!685487))

(declare-fun m!685489 () Bool)

(assert (=> b!732405 m!685489))

(declare-fun m!685491 () Bool)

(assert (=> b!732417 m!685491))

(assert (=> b!732409 m!685479))

(assert (=> b!732409 m!685479))

(declare-fun m!685493 () Bool)

(assert (=> b!732409 m!685493))

(declare-fun m!685495 () Bool)

(assert (=> b!732411 m!685495))

(declare-fun m!685497 () Bool)

(assert (=> b!732411 m!685497))

(assert (=> b!732411 m!685495))

(declare-fun m!685499 () Bool)

(assert (=> b!732411 m!685499))

(declare-fun m!685501 () Bool)

(assert (=> b!732411 m!685501))

(declare-fun m!685503 () Bool)

(assert (=> b!732411 m!685503))

(assert (=> b!732415 m!685479))

(assert (=> b!732415 m!685479))

(declare-fun m!685505 () Bool)

(assert (=> b!732415 m!685505))

(assert (=> b!732412 m!685479))

(assert (=> b!732412 m!685479))

(declare-fun m!685507 () Bool)

(assert (=> b!732412 m!685507))

(assert (=> b!732408 m!685479))

(assert (=> b!732408 m!685479))

(assert (=> b!732408 m!685505))

(declare-fun m!685509 () Bool)

(assert (=> b!732413 m!685509))

(assert (=> b!732410 m!685479))

(assert (=> b!732410 m!685479))

(declare-fun m!685511 () Bool)

(assert (=> b!732410 m!685511))

(assert (=> b!732410 m!685511))

(assert (=> b!732410 m!685479))

(declare-fun m!685513 () Bool)

(assert (=> b!732410 m!685513))

(declare-fun m!685515 () Bool)

(assert (=> b!732419 m!685515))

(declare-fun m!685517 () Bool)

(assert (=> b!732418 m!685517))

(push 1)

(assert (not start!64912))

(assert (not b!732405))

(assert (not b!732410))

(assert (not b!732421))

(assert (not b!732419))

(assert (not b!732415))

(assert (not b!732412))

(assert (not b!732409))

(assert (not b!732407))

(assert (not b!732422))

(assert (not b!732417))

(assert (not b!732413))

(assert (not b!732408))

(assert (not b!732423))

(assert (not b!732406))

(assert (not b!732411))

(check-sat)

(pop 1)

(push 1)

(check-sat)

