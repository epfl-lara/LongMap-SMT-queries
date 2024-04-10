; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64376 () Bool)

(assert start!64376)

(declare-fun b!723993 () Bool)

(declare-fun res!485505 () Bool)

(declare-fun e!405539 () Bool)

(assert (=> b!723993 (=> (not res!485505) (not e!405539))))

(declare-datatypes ((array!40957 0))(
  ( (array!40958 (arr!19601 (Array (_ BitVec 32) (_ BitVec 64))) (size!20022 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40957)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723993 (= res!485505 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723994 () Bool)

(declare-fun res!485501 () Bool)

(declare-fun e!405543 () Bool)

(assert (=> b!723994 (=> (not res!485501) (not e!405543))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723994 (= res!485501 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19601 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!7201 0))(
  ( (MissingZero!7201 (index!31172 (_ BitVec 32))) (Found!7201 (index!31173 (_ BitVec 32))) (Intermediate!7201 (undefined!8013 Bool) (index!31174 (_ BitVec 32)) (x!62162 (_ BitVec 32))) (Undefined!7201) (MissingVacant!7201 (index!31175 (_ BitVec 32))) )
))
(declare-fun lt!320847 () SeekEntryResult!7201)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!723995 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!405544 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40957 (_ BitVec 32)) SeekEntryResult!7201)

(assert (=> b!723995 (= e!405544 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19601 a!3186) j!159) a!3186 mask!3328) lt!320847))))

(declare-fun b!723996 () Bool)

(declare-fun e!405541 () Bool)

(assert (=> b!723996 (= e!405541 (not true))))

(declare-fun e!405545 () Bool)

(assert (=> b!723996 e!405545))

(declare-fun res!485495 () Bool)

(assert (=> b!723996 (=> (not res!485495) (not e!405545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40957 (_ BitVec 32)) Bool)

(assert (=> b!723996 (= res!485495 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24720 0))(
  ( (Unit!24721) )
))
(declare-fun lt!320848 () Unit!24720)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24720)

(assert (=> b!723996 (= lt!320848 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723997 () Bool)

(assert (=> b!723997 (= e!405543 e!405541)))

(declare-fun res!485502 () Bool)

(assert (=> b!723997 (=> (not res!485502) (not e!405541))))

(declare-fun lt!320849 () array!40957)

(declare-fun lt!320846 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723997 (= res!485502 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320846 mask!3328) lt!320846 lt!320849 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320846 lt!320849 mask!3328)))))

(assert (=> b!723997 (= lt!320846 (select (store (arr!19601 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!723997 (= lt!320849 (array!40958 (store (arr!19601 a!3186) i!1173 k!2102) (size!20022 a!3186)))))

(declare-fun b!723998 () Bool)

(declare-fun res!485506 () Bool)

(assert (=> b!723998 (=> (not res!485506) (not e!405539))))

(assert (=> b!723998 (= res!485506 (and (= (size!20022 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20022 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20022 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723999 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40957 (_ BitVec 32)) SeekEntryResult!7201)

(assert (=> b!723999 (= e!405545 (= (seekEntryOrOpen!0 (select (arr!19601 a!3186) j!159) a!3186 mask!3328) (Found!7201 j!159)))))

(declare-fun b!724001 () Bool)

(declare-fun res!485503 () Bool)

(assert (=> b!724001 (=> (not res!485503) (not e!405539))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724001 (= res!485503 (validKeyInArray!0 k!2102))))

(declare-fun b!724002 () Bool)

(declare-fun res!485504 () Bool)

(declare-fun e!405540 () Bool)

(assert (=> b!724002 (=> (not res!485504) (not e!405540))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724002 (= res!485504 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20022 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20022 a!3186))))))

(declare-fun b!724003 () Bool)

(declare-fun res!485494 () Bool)

(assert (=> b!724003 (=> (not res!485494) (not e!405543))))

(assert (=> b!724003 (= res!485494 e!405544)))

(declare-fun c!79621 () Bool)

(assert (=> b!724003 (= c!79621 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724004 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40957 (_ BitVec 32)) SeekEntryResult!7201)

(assert (=> b!724004 (= e!405544 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19601 a!3186) j!159) a!3186 mask!3328) (Found!7201 j!159)))))

(declare-fun b!724005 () Bool)

(declare-fun res!485498 () Bool)

(assert (=> b!724005 (=> (not res!485498) (not e!405540))))

(assert (=> b!724005 (= res!485498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724006 () Bool)

(assert (=> b!724006 (= e!405540 e!405543)))

(declare-fun res!485500 () Bool)

(assert (=> b!724006 (=> (not res!485500) (not e!405543))))

(assert (=> b!724006 (= res!485500 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19601 a!3186) j!159) mask!3328) (select (arr!19601 a!3186) j!159) a!3186 mask!3328) lt!320847))))

(assert (=> b!724006 (= lt!320847 (Intermediate!7201 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!485496 () Bool)

(assert (=> start!64376 (=> (not res!485496) (not e!405539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64376 (= res!485496 (validMask!0 mask!3328))))

(assert (=> start!64376 e!405539))

(assert (=> start!64376 true))

(declare-fun array_inv!15397 (array!40957) Bool)

(assert (=> start!64376 (array_inv!15397 a!3186)))

(declare-fun b!724000 () Bool)

(declare-fun res!485497 () Bool)

(assert (=> b!724000 (=> (not res!485497) (not e!405540))))

(declare-datatypes ((List!13603 0))(
  ( (Nil!13600) (Cons!13599 (h!14653 (_ BitVec 64)) (t!19918 List!13603)) )
))
(declare-fun arrayNoDuplicates!0 (array!40957 (_ BitVec 32) List!13603) Bool)

(assert (=> b!724000 (= res!485497 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13600))))

(declare-fun b!724007 () Bool)

(assert (=> b!724007 (= e!405539 e!405540)))

(declare-fun res!485507 () Bool)

(assert (=> b!724007 (=> (not res!485507) (not e!405540))))

(declare-fun lt!320845 () SeekEntryResult!7201)

(assert (=> b!724007 (= res!485507 (or (= lt!320845 (MissingZero!7201 i!1173)) (= lt!320845 (MissingVacant!7201 i!1173))))))

(assert (=> b!724007 (= lt!320845 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!724008 () Bool)

(declare-fun res!485499 () Bool)

(assert (=> b!724008 (=> (not res!485499) (not e!405539))))

(assert (=> b!724008 (= res!485499 (validKeyInArray!0 (select (arr!19601 a!3186) j!159)))))

(assert (= (and start!64376 res!485496) b!723998))

(assert (= (and b!723998 res!485506) b!724008))

(assert (= (and b!724008 res!485499) b!724001))

(assert (= (and b!724001 res!485503) b!723993))

(assert (= (and b!723993 res!485505) b!724007))

(assert (= (and b!724007 res!485507) b!724005))

(assert (= (and b!724005 res!485498) b!724000))

(assert (= (and b!724000 res!485497) b!724002))

(assert (= (and b!724002 res!485504) b!724006))

(assert (= (and b!724006 res!485500) b!723994))

(assert (= (and b!723994 res!485501) b!724003))

(assert (= (and b!724003 c!79621) b!723995))

(assert (= (and b!724003 (not c!79621)) b!724004))

(assert (= (and b!724003 res!485494) b!723997))

(assert (= (and b!723997 res!485502) b!723996))

(assert (= (and b!723996 res!485495) b!723999))

(declare-fun m!678389 () Bool)

(assert (=> start!64376 m!678389))

(declare-fun m!678391 () Bool)

(assert (=> start!64376 m!678391))

(declare-fun m!678393 () Bool)

(assert (=> b!723996 m!678393))

(declare-fun m!678395 () Bool)

(assert (=> b!723996 m!678395))

(declare-fun m!678397 () Bool)

(assert (=> b!724007 m!678397))

(declare-fun m!678399 () Bool)

(assert (=> b!723993 m!678399))

(declare-fun m!678401 () Bool)

(assert (=> b!724000 m!678401))

(declare-fun m!678403 () Bool)

(assert (=> b!723997 m!678403))

(declare-fun m!678405 () Bool)

(assert (=> b!723997 m!678405))

(assert (=> b!723997 m!678403))

(declare-fun m!678407 () Bool)

(assert (=> b!723997 m!678407))

(declare-fun m!678409 () Bool)

(assert (=> b!723997 m!678409))

(declare-fun m!678411 () Bool)

(assert (=> b!723997 m!678411))

(declare-fun m!678413 () Bool)

(assert (=> b!724001 m!678413))

(declare-fun m!678415 () Bool)

(assert (=> b!723994 m!678415))

(declare-fun m!678417 () Bool)

(assert (=> b!723995 m!678417))

(assert (=> b!723995 m!678417))

(declare-fun m!678419 () Bool)

(assert (=> b!723995 m!678419))

(assert (=> b!724008 m!678417))

(assert (=> b!724008 m!678417))

(declare-fun m!678421 () Bool)

(assert (=> b!724008 m!678421))

(assert (=> b!724006 m!678417))

(assert (=> b!724006 m!678417))

(declare-fun m!678423 () Bool)

(assert (=> b!724006 m!678423))

(assert (=> b!724006 m!678423))

(assert (=> b!724006 m!678417))

(declare-fun m!678425 () Bool)

(assert (=> b!724006 m!678425))

(assert (=> b!724004 m!678417))

(assert (=> b!724004 m!678417))

(declare-fun m!678427 () Bool)

(assert (=> b!724004 m!678427))

(declare-fun m!678429 () Bool)

(assert (=> b!724005 m!678429))

(assert (=> b!723999 m!678417))

(assert (=> b!723999 m!678417))

(declare-fun m!678431 () Bool)

(assert (=> b!723999 m!678431))

(push 1)

