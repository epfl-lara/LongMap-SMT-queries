; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64948 () Bool)

(assert start!64948)

(declare-fun b!733448 () Bool)

(declare-fun res!492947 () Bool)

(declare-fun e!410384 () Bool)

(assert (=> b!733448 (=> (not res!492947) (not e!410384))))

(declare-datatypes ((array!41259 0))(
  ( (array!41260 (arr!19746 (Array (_ BitVec 32) (_ BitVec 64))) (size!20167 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41259)

(declare-datatypes ((List!13748 0))(
  ( (Nil!13745) (Cons!13744 (h!14810 (_ BitVec 64)) (t!20063 List!13748)) )
))
(declare-fun arrayNoDuplicates!0 (array!41259 (_ BitVec 32) List!13748) Bool)

(assert (=> b!733448 (= res!492947 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13745))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!410385 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!733449 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7346 0))(
  ( (MissingZero!7346 (index!31752 (_ BitVec 32))) (Found!7346 (index!31753 (_ BitVec 32))) (Intermediate!7346 (undefined!8158 Bool) (index!31754 (_ BitVec 32)) (x!62744 (_ BitVec 32))) (Undefined!7346) (MissingVacant!7346 (index!31755 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41259 (_ BitVec 32)) SeekEntryResult!7346)

(assert (=> b!733449 (= e!410385 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19746 a!3186) j!159) a!3186 mask!3328) (Found!7346 j!159)))))

(declare-fun b!733450 () Bool)

(declare-fun res!492941 () Bool)

(declare-fun e!410390 () Bool)

(assert (=> b!733450 (=> (not res!492941) (not e!410390))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!733450 (= res!492941 (and (= (size!20167 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20167 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20167 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!325077 () SeekEntryResult!7346)

(declare-fun b!733451 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41259 (_ BitVec 32)) SeekEntryResult!7346)

(assert (=> b!733451 (= e!410385 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19746 a!3186) j!159) a!3186 mask!3328) lt!325077))))

(declare-fun b!733452 () Bool)

(declare-fun res!492938 () Bool)

(declare-fun e!410381 () Bool)

(assert (=> b!733452 (=> (not res!492938) (not e!410381))))

(assert (=> b!733452 (= res!492938 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19746 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733453 () Bool)

(declare-fun res!492933 () Bool)

(assert (=> b!733453 (=> (not res!492933) (not e!410381))))

(assert (=> b!733453 (= res!492933 e!410385)))

(declare-fun c!80635 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!733453 (= c!80635 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!733454 () Bool)

(declare-fun e!410388 () Bool)

(declare-fun e!410386 () Bool)

(assert (=> b!733454 (= e!410388 e!410386)))

(declare-fun res!492937 () Bool)

(assert (=> b!733454 (=> (not res!492937) (not e!410386))))

(declare-fun lt!325078 () SeekEntryResult!7346)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41259 (_ BitVec 32)) SeekEntryResult!7346)

(assert (=> b!733454 (= res!492937 (= (seekEntryOrOpen!0 (select (arr!19746 a!3186) j!159) a!3186 mask!3328) lt!325078))))

(assert (=> b!733454 (= lt!325078 (Found!7346 j!159))))

(declare-fun b!733455 () Bool)

(assert (=> b!733455 (= e!410390 e!410384)))

(declare-fun res!492948 () Bool)

(assert (=> b!733455 (=> (not res!492948) (not e!410384))))

(declare-fun lt!325080 () SeekEntryResult!7346)

(assert (=> b!733455 (= res!492948 (or (= lt!325080 (MissingZero!7346 i!1173)) (= lt!325080 (MissingVacant!7346 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!733455 (= lt!325080 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!733456 () Bool)

(declare-fun res!492943 () Bool)

(assert (=> b!733456 (=> (not res!492943) (not e!410390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733456 (= res!492943 (validKeyInArray!0 k!2102))))

(declare-fun b!733457 () Bool)

(declare-fun res!492939 () Bool)

(assert (=> b!733457 (=> (not res!492939) (not e!410384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41259 (_ BitVec 32)) Bool)

(assert (=> b!733457 (= res!492939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!733458 () Bool)

(declare-fun e!410387 () Bool)

(declare-fun lt!325081 () (_ BitVec 32))

(assert (=> b!733458 (= e!410387 (or (bvslt mask!3328 #b00000000000000000000000000000000) (and (bvsge lt!325081 #b00000000000000000000000000000000) (bvslt lt!325081 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun b!733459 () Bool)

(declare-fun res!492946 () Bool)

(assert (=> b!733459 (=> res!492946 e!410387)))

(assert (=> b!733459 (= res!492946 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19746 a!3186) j!159) a!3186 mask!3328) (Found!7346 j!159)))))

(declare-fun b!733460 () Bool)

(declare-fun e!410389 () Bool)

(declare-fun e!410383 () Bool)

(assert (=> b!733460 (= e!410389 (not e!410383))))

(declare-fun res!492935 () Bool)

(assert (=> b!733460 (=> res!492935 e!410383)))

(declare-fun lt!325085 () SeekEntryResult!7346)

(assert (=> b!733460 (= res!492935 (or (not (is-Intermediate!7346 lt!325085)) (bvsge x!1131 (x!62744 lt!325085))))))

(assert (=> b!733460 e!410388))

(declare-fun res!492934 () Bool)

(assert (=> b!733460 (=> (not res!492934) (not e!410388))))

(assert (=> b!733460 (= res!492934 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25010 0))(
  ( (Unit!25011) )
))
(declare-fun lt!325079 () Unit!25010)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25010)

(assert (=> b!733460 (= lt!325079 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!733461 () Bool)

(assert (=> b!733461 (= e!410383 e!410387)))

(declare-fun res!492950 () Bool)

(assert (=> b!733461 (=> res!492950 e!410387)))

(assert (=> b!733461 (= res!492950 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733461 (= lt!325081 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!492949 () Bool)

(assert (=> start!64948 (=> (not res!492949) (not e!410390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64948 (= res!492949 (validMask!0 mask!3328))))

(assert (=> start!64948 e!410390))

(assert (=> start!64948 true))

(declare-fun array_inv!15542 (array!41259) Bool)

(assert (=> start!64948 (array_inv!15542 a!3186)))

(declare-fun b!733462 () Bool)

(assert (=> b!733462 (= e!410384 e!410381)))

(declare-fun res!492944 () Bool)

(assert (=> b!733462 (=> (not res!492944) (not e!410381))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733462 (= res!492944 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19746 a!3186) j!159) mask!3328) (select (arr!19746 a!3186) j!159) a!3186 mask!3328) lt!325077))))

(assert (=> b!733462 (= lt!325077 (Intermediate!7346 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733463 () Bool)

(assert (=> b!733463 (= e!410381 e!410389)))

(declare-fun res!492936 () Bool)

(assert (=> b!733463 (=> (not res!492936) (not e!410389))))

(declare-fun lt!325082 () SeekEntryResult!7346)

(assert (=> b!733463 (= res!492936 (= lt!325082 lt!325085))))

(declare-fun lt!325083 () (_ BitVec 64))

(declare-fun lt!325084 () array!41259)

(assert (=> b!733463 (= lt!325085 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325083 lt!325084 mask!3328))))

(assert (=> b!733463 (= lt!325082 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325083 mask!3328) lt!325083 lt!325084 mask!3328))))

(assert (=> b!733463 (= lt!325083 (select (store (arr!19746 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!733463 (= lt!325084 (array!41260 (store (arr!19746 a!3186) i!1173 k!2102) (size!20167 a!3186)))))

(declare-fun b!733464 () Bool)

(assert (=> b!733464 (= e!410386 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19746 a!3186) j!159) a!3186 mask!3328) lt!325078))))

(declare-fun b!733465 () Bool)

(declare-fun res!492940 () Bool)

(assert (=> b!733465 (=> (not res!492940) (not e!410390))))

(declare-fun arrayContainsKey!0 (array!41259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733465 (= res!492940 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733466 () Bool)

(declare-fun res!492945 () Bool)

(assert (=> b!733466 (=> (not res!492945) (not e!410390))))

(assert (=> b!733466 (= res!492945 (validKeyInArray!0 (select (arr!19746 a!3186) j!159)))))

(declare-fun b!733467 () Bool)

(declare-fun res!492942 () Bool)

(assert (=> b!733467 (=> (not res!492942) (not e!410384))))

(assert (=> b!733467 (= res!492942 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20167 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20167 a!3186))))))

(assert (= (and start!64948 res!492949) b!733450))

(assert (= (and b!733450 res!492941) b!733466))

(assert (= (and b!733466 res!492945) b!733456))

(assert (= (and b!733456 res!492943) b!733465))

(assert (= (and b!733465 res!492940) b!733455))

(assert (= (and b!733455 res!492948) b!733457))

(assert (= (and b!733457 res!492939) b!733448))

(assert (= (and b!733448 res!492947) b!733467))

(assert (= (and b!733467 res!492942) b!733462))

(assert (= (and b!733462 res!492944) b!733452))

(assert (= (and b!733452 res!492938) b!733453))

(assert (= (and b!733453 c!80635) b!733451))

(assert (= (and b!733453 (not c!80635)) b!733449))

(assert (= (and b!733453 res!492933) b!733463))

(assert (= (and b!733463 res!492936) b!733460))

(assert (= (and b!733460 res!492934) b!733454))

(assert (= (and b!733454 res!492937) b!733464))

(assert (= (and b!733460 (not res!492935)) b!733461))

(assert (= (and b!733461 (not res!492950)) b!733459))

(assert (= (and b!733459 (not res!492946)) b!733458))

(declare-fun m!686335 () Bool)

(assert (=> b!733456 m!686335))

(declare-fun m!686337 () Bool)

(assert (=> b!733455 m!686337))

(declare-fun m!686339 () Bool)

(assert (=> b!733462 m!686339))

(assert (=> b!733462 m!686339))

(declare-fun m!686341 () Bool)

(assert (=> b!733462 m!686341))

(assert (=> b!733462 m!686341))

(assert (=> b!733462 m!686339))

(declare-fun m!686343 () Bool)

(assert (=> b!733462 m!686343))

(declare-fun m!686345 () Bool)

(assert (=> b!733465 m!686345))

(declare-fun m!686347 () Bool)

(assert (=> b!733457 m!686347))

(declare-fun m!686349 () Bool)

(assert (=> b!733461 m!686349))

(assert (=> b!733451 m!686339))

(assert (=> b!733451 m!686339))

(declare-fun m!686351 () Bool)

(assert (=> b!733451 m!686351))

(assert (=> b!733454 m!686339))

(assert (=> b!733454 m!686339))

(declare-fun m!686353 () Bool)

(assert (=> b!733454 m!686353))

(assert (=> b!733459 m!686339))

(assert (=> b!733459 m!686339))

(declare-fun m!686355 () Bool)

(assert (=> b!733459 m!686355))

(declare-fun m!686357 () Bool)

(assert (=> b!733463 m!686357))

(declare-fun m!686359 () Bool)

(assert (=> b!733463 m!686359))

(declare-fun m!686361 () Bool)

(assert (=> b!733463 m!686361))

(declare-fun m!686363 () Bool)

(assert (=> b!733463 m!686363))

(assert (=> b!733463 m!686357))

(declare-fun m!686365 () Bool)

(assert (=> b!733463 m!686365))

(declare-fun m!686367 () Bool)

(assert (=> b!733460 m!686367))

(declare-fun m!686369 () Bool)

(assert (=> b!733460 m!686369))

(declare-fun m!686371 () Bool)

(assert (=> b!733448 m!686371))

(assert (=> b!733464 m!686339))

(assert (=> b!733464 m!686339))

(declare-fun m!686373 () Bool)

(assert (=> b!733464 m!686373))

(assert (=> b!733466 m!686339))

(assert (=> b!733466 m!686339))

(declare-fun m!686375 () Bool)

(assert (=> b!733466 m!686375))

(declare-fun m!686377 () Bool)

(assert (=> start!64948 m!686377))

(declare-fun m!686379 () Bool)

(assert (=> start!64948 m!686379))

(declare-fun m!686381 () Bool)

(assert (=> b!733452 m!686381))

(assert (=> b!733449 m!686339))

(assert (=> b!733449 m!686339))

(assert (=> b!733449 m!686355))

(push 1)

(assert (not b!733456))

(assert (not b!733462))

(assert (not b!733466))

(assert (not b!733455))

(assert (not b!733459))

(assert (not b!733451))

(assert (not b!733449))

(assert (not b!733457))

(assert (not b!733463))

(assert (not b!733465))

(assert (not b!733460))

(assert (not b!733454))

(assert (not b!733464))

(assert (not start!64948))

(assert (not b!733461))

(assert (not b!733448))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!99919 () Bool)

(declare-fun lt!325245 () SeekEntryResult!7346)

(assert (=> d!99919 (and (or (is-Undefined!7346 lt!325245) (not (is-Found!7346 lt!325245)) (and (bvsge (index!31753 lt!325245) #b00000000000000000000000000000000) (bvslt (index!31753 lt!325245) (size!20167 a!3186)))) (or (is-Undefined!7346 lt!325245) (is-Found!7346 lt!325245) (not (is-MissingZero!7346 lt!325245)) (and (bvsge (index!31752 lt!325245) #b00000000000000000000000000000000) (bvslt (index!31752 lt!325245) (size!20167 a!3186)))) (or (is-Undefined!7346 lt!325245) (is-Found!7346 lt!325245) (is-MissingZero!7346 lt!325245) (not (is-MissingVacant!7346 lt!325245)) (and (bvsge (index!31755 lt!325245) #b00000000000000000000000000000000) (bvslt (index!31755 lt!325245) (size!20167 a!3186)))) (or (is-Undefined!7346 lt!325245) (ite (is-Found!7346 lt!325245) (= (select (arr!19746 a!3186) (index!31753 lt!325245)) (select (arr!19746 a!3186) j!159)) (ite (is-MissingZero!7346 lt!325245) (= (select (arr!19746 a!3186) (index!31752 lt!325245)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7346 lt!325245) (= (select (arr!19746 a!3186) (index!31755 lt!325245)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!410604 () SeekEntryResult!7346)

(assert (=> d!99919 (= lt!325245 e!410604)))

(declare-fun c!80736 () Bool)

(declare-fun lt!325243 () SeekEntryResult!7346)

(assert (=> d!99919 (= c!80736 (and (is-Intermediate!7346 lt!325243) (undefined!8158 lt!325243)))))

(assert (=> d!99919 (= lt!325243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19746 a!3186) j!159) mask!3328) (select (arr!19746 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99919 (validMask!0 mask!3328)))

(assert (=> d!99919 (= (seekEntryOrOpen!0 (select (arr!19746 a!3186) j!159) a!3186 mask!3328) lt!325245)))

(declare-fun e!410603 () SeekEntryResult!7346)

(declare-fun b!733844 () Bool)

(assert (=> b!733844 (= e!410603 (seekKeyOrZeroReturnVacant!0 (x!62744 lt!325243) (index!31754 lt!325243) (index!31754 lt!325243) (select (arr!19746 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733845 () Bool)

(declare-fun e!410602 () SeekEntryResult!7346)

(assert (=> b!733845 (= e!410604 e!410602)))

(declare-fun lt!325244 () (_ BitVec 64))

(assert (=> b!733845 (= lt!325244 (select (arr!19746 a!3186) (index!31754 lt!325243)))))

(declare-fun c!80738 () Bool)

(assert (=> b!733845 (= c!80738 (= lt!325244 (select (arr!19746 a!3186) j!159)))))

(declare-fun b!733846 () Bool)

(assert (=> b!733846 (= e!410602 (Found!7346 (index!31754 lt!325243)))))

(declare-fun b!733847 () Bool)

(assert (=> b!733847 (= e!410603 (MissingZero!7346 (index!31754 lt!325243)))))

(declare-fun b!733848 () Bool)

(declare-fun c!80737 () Bool)

(assert (=> b!733848 (= c!80737 (= lt!325244 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!733848 (= e!410602 e!410603)))

(declare-fun b!733849 () Bool)

(assert (=> b!733849 (= e!410604 Undefined!7346)))

(assert (= (and d!99919 c!80736) b!733849))

(assert (= (and d!99919 (not c!80736)) b!733845))

(assert (= (and b!733845 c!80738) b!733846))

(assert (= (and b!733845 (not c!80738)) b!733848))

(assert (= (and b!733848 c!80737) b!733847))

(assert (= (and b!733848 (not c!80737)) b!733844))

(declare-fun m!686633 () Bool)

(assert (=> d!99919 m!686633))

(assert (=> d!99919 m!686341))

(assert (=> d!99919 m!686339))

(assert (=> d!99919 m!686343))

(declare-fun m!686635 () Bool)

(assert (=> d!99919 m!686635))

(assert (=> d!99919 m!686377))

(declare-fun m!686637 () Bool)

(assert (=> d!99919 m!686637))

(assert (=> d!99919 m!686339))

(assert (=> d!99919 m!686341))

(assert (=> b!733844 m!686339))

(declare-fun m!686639 () Bool)

(assert (=> b!733844 m!686639))

(declare-fun m!686641 () Bool)

(assert (=> b!733845 m!686641))

(assert (=> b!733454 d!99919))

(declare-fun d!99935 () Bool)

(declare-fun res!493133 () Bool)

(declare-fun e!410609 () Bool)

(assert (=> d!99935 (=> res!493133 e!410609)))

(assert (=> d!99935 (= res!493133 (= (select (arr!19746 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!99935 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!410609)))

(declare-fun b!733854 () Bool)

(declare-fun e!410610 () Bool)

(assert (=> b!733854 (= e!410609 e!410610)))

(declare-fun res!493134 () Bool)

(assert (=> b!733854 (=> (not res!493134) (not e!410610))))

(assert (=> b!733854 (= res!493134 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20167 a!3186)))))

(declare-fun b!733855 () Bool)

(assert (=> b!733855 (= e!410610 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99935 (not res!493133)) b!733854))

(assert (= (and b!733854 res!493134) b!733855))

(declare-fun m!686643 () Bool)

(assert (=> d!99935 m!686643))

(declare-fun m!686645 () Bool)

(assert (=> b!733855 m!686645))

(assert (=> b!733465 d!99935))

(declare-fun d!99939 () Bool)

(declare-fun lt!325254 () SeekEntryResult!7346)

(assert (=> d!99939 (and (or (is-Undefined!7346 lt!325254) (not (is-Found!7346 lt!325254)) (and (bvsge (index!31753 lt!325254) #b00000000000000000000000000000000) (bvslt (index!31753 lt!325254) (size!20167 a!3186)))) (or (is-Undefined!7346 lt!325254) (is-Found!7346 lt!325254) (not (is-MissingZero!7346 lt!325254)) (and (bvsge (index!31752 lt!325254) #b00000000000000000000000000000000) (bvslt (index!31752 lt!325254) (size!20167 a!3186)))) (or (is-Undefined!7346 lt!325254) (is-Found!7346 lt!325254) (is-MissingZero!7346 lt!325254) (not (is-MissingVacant!7346 lt!325254)) (and (bvsge (index!31755 lt!325254) #b00000000000000000000000000000000) (bvslt (index!31755 lt!325254) (size!20167 a!3186)))) (or (is-Undefined!7346 lt!325254) (ite (is-Found!7346 lt!325254) (= (select (arr!19746 a!3186) (index!31753 lt!325254)) k!2102) (ite (is-MissingZero!7346 lt!325254) (= (select (arr!19746 a!3186) (index!31752 lt!325254)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7346 lt!325254) (= (select (arr!19746 a!3186) (index!31755 lt!325254)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!410613 () SeekEntryResult!7346)

(assert (=> d!99939 (= lt!325254 e!410613)))

(declare-fun c!80739 () Bool)

(declare-fun lt!325252 () SeekEntryResult!7346)

(assert (=> d!99939 (= c!80739 (and (is-Intermediate!7346 lt!325252) (undefined!8158 lt!325252)))))

(assert (=> d!99939 (= lt!325252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!99939 (validMask!0 mask!3328)))

(assert (=> d!99939 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!325254)))

(declare-fun b!733856 () Bool)

(declare-fun e!410612 () SeekEntryResult!7346)

(assert (=> b!733856 (= e!410612 (seekKeyOrZeroReturnVacant!0 (x!62744 lt!325252) (index!31754 lt!325252) (index!31754 lt!325252) k!2102 a!3186 mask!3328))))

(declare-fun b!733857 () Bool)

(declare-fun e!410611 () SeekEntryResult!7346)

(assert (=> b!733857 (= e!410613 e!410611)))

(declare-fun lt!325253 () (_ BitVec 64))

(assert (=> b!733857 (= lt!325253 (select (arr!19746 a!3186) (index!31754 lt!325252)))))

(declare-fun c!80741 () Bool)

(assert (=> b!733857 (= c!80741 (= lt!325253 k!2102))))

(declare-fun b!733858 () Bool)

(assert (=> b!733858 (= e!410611 (Found!7346 (index!31754 lt!325252)))))

(declare-fun b!733859 () Bool)

(assert (=> b!733859 (= e!410612 (MissingZero!7346 (index!31754 lt!325252)))))

(declare-fun b!733860 () Bool)

(declare-fun c!80740 () Bool)

(assert (=> b!733860 (= c!80740 (= lt!325253 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!733860 (= e!410611 e!410612)))

(declare-fun b!733861 () Bool)

(assert (=> b!733861 (= e!410613 Undefined!7346)))

(assert (= (and d!99939 c!80739) b!733861))

(assert (= (and d!99939 (not c!80739)) b!733857))

(assert (= (and b!733857 c!80741) b!733858))

(assert (= (and b!733857 (not c!80741)) b!733860))

(assert (= (and b!733860 c!80740) b!733859))

(assert (= (and b!733860 (not c!80740)) b!733856))

(declare-fun m!686647 () Bool)

(assert (=> d!99939 m!686647))

(declare-fun m!686649 () Bool)

(assert (=> d!99939 m!686649))

(declare-fun m!686651 () Bool)

(assert (=> d!99939 m!686651))

(declare-fun m!686653 () Bool)

(assert (=> d!99939 m!686653))

(assert (=> d!99939 m!686377))

(declare-fun m!686655 () Bool)

(assert (=> d!99939 m!686655))

(assert (=> d!99939 m!686649))

(declare-fun m!686657 () Bool)

(assert (=> b!733856 m!686657))

(declare-fun m!686659 () Bool)

(assert (=> b!733857 m!686659))

(assert (=> b!733455 d!99939))

(declare-fun d!99941 () Bool)

(assert (=> d!99941 (= (validKeyInArray!0 (select (arr!19746 a!3186) j!159)) (and (not (= (select (arr!19746 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19746 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!733466 d!99941))

(declare-fun d!99943 () Bool)

(assert (=> d!99943 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!733456 d!99943))

(declare-fun d!99945 () Bool)

(declare-fun res!493154 () Bool)

(declare-fun e!410644 () Bool)

(assert (=> d!99945 (=> res!493154 e!410644)))

(assert (=> d!99945 (= res!493154 (bvsge #b00000000000000000000000000000000 (size!20167 a!3186)))))

(assert (=> d!99945 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!410644)))

(declare-fun b!733904 () Bool)

(declare-fun e!410643 () Bool)

(declare-fun e!410645 () Bool)

(assert (=> b!733904 (= e!410643 e!410645)))

(declare-fun lt!325276 () (_ BitVec 64))

(assert (=> b!733904 (= lt!325276 (select (arr!19746 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!325274 () Unit!25010)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41259 (_ BitVec 64) (_ BitVec 32)) Unit!25010)

(assert (=> b!733904 (= lt!325274 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!325276 #b00000000000000000000000000000000))))

(assert (=> b!733904 (arrayContainsKey!0 a!3186 lt!325276 #b00000000000000000000000000000000)))

(declare-fun lt!325275 () Unit!25010)

(assert (=> b!733904 (= lt!325275 lt!325274)))

(declare-fun res!493153 () Bool)

(assert (=> b!733904 (= res!493153 (= (seekEntryOrOpen!0 (select (arr!19746 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7346 #b00000000000000000000000000000000)))))

(assert (=> b!733904 (=> (not res!493153) (not e!410645))))

(declare-fun bm!34883 () Bool)

(declare-fun call!34886 () Bool)

(assert (=> bm!34883 (= call!34886 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!733905 () Bool)

(assert (=> b!733905 (= e!410644 e!410643)))

(declare-fun c!80754 () Bool)

(assert (=> b!733905 (= c!80754 (validKeyInArray!0 (select (arr!19746 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!733906 () Bool)

(assert (=> b!733906 (= e!410643 call!34886)))

(declare-fun b!733907 () Bool)

(assert (=> b!733907 (= e!410645 call!34886)))

(assert (= (and d!99945 (not res!493154)) b!733905))

(assert (= (and b!733905 c!80754) b!733904))

(assert (= (and b!733905 (not c!80754)) b!733906))

(assert (= (and b!733904 res!493153) b!733907))

(assert (= (or b!733907 b!733906) bm!34883))

(assert (=> b!733904 m!686643))

(declare-fun m!686695 () Bool)

(assert (=> b!733904 m!686695))

(declare-fun m!686697 () Bool)

(assert (=> b!733904 m!686697))

(assert (=> b!733904 m!686643))

(declare-fun m!686699 () Bool)

(assert (=> b!733904 m!686699))

(declare-fun m!686701 () Bool)

(assert (=> bm!34883 m!686701))

(assert (=> b!733905 m!686643))

(assert (=> b!733905 m!686643))

(declare-fun m!686703 () Bool)

(assert (=> b!733905 m!686703))

(assert (=> b!733457 d!99945))

(declare-fun b!733918 () Bool)

(declare-fun e!410657 () Bool)

(declare-fun e!410654 () Bool)

(assert (=> b!733918 (= e!410657 e!410654)))

(declare-fun c!80757 () Bool)

(assert (=> b!733918 (= c!80757 (validKeyInArray!0 (select (arr!19746 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34886 () Bool)

(declare-fun call!34889 () Bool)

(assert (=> bm!34886 (= call!34889 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80757 (Cons!13744 (select (arr!19746 a!3186) #b00000000000000000000000000000000) Nil!13745) Nil!13745)))))

(declare-fun d!99959 () Bool)

(declare-fun res!493161 () Bool)

(declare-fun e!410655 () Bool)

(assert (=> d!99959 (=> res!493161 e!410655)))

(assert (=> d!99959 (= res!493161 (bvsge #b00000000000000000000000000000000 (size!20167 a!3186)))))

(assert (=> d!99959 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13745) e!410655)))

(declare-fun b!733919 () Bool)

(assert (=> b!733919 (= e!410654 call!34889)))

(declare-fun b!733920 () Bool)

(assert (=> b!733920 (= e!410655 e!410657)))

(declare-fun res!493162 () Bool)

(assert (=> b!733920 (=> (not res!493162) (not e!410657))))

(declare-fun e!410656 () Bool)

(assert (=> b!733920 (= res!493162 (not e!410656))))

(declare-fun res!493163 () Bool)

(assert (=> b!733920 (=> (not res!493163) (not e!410656))))

(assert (=> b!733920 (= res!493163 (validKeyInArray!0 (select (arr!19746 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!733921 () Bool)

(assert (=> b!733921 (= e!410654 call!34889)))

(declare-fun b!733922 () Bool)

(declare-fun contains!4059 (List!13748 (_ BitVec 64)) Bool)

(assert (=> b!733922 (= e!410656 (contains!4059 Nil!13745 (select (arr!19746 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99959 (not res!493161)) b!733920))

(assert (= (and b!733920 res!493163) b!733922))

(assert (= (and b!733920 res!493162) b!733918))

(assert (= (and b!733918 c!80757) b!733919))

(assert (= (and b!733918 (not c!80757)) b!733921))

(assert (= (or b!733919 b!733921) bm!34886))

(assert (=> b!733918 m!686643))

(assert (=> b!733918 m!686643))

(assert (=> b!733918 m!686703))

(assert (=> bm!34886 m!686643))

(declare-fun m!686705 () Bool)

(assert (=> bm!34886 m!686705))

(assert (=> b!733920 m!686643))

(assert (=> b!733920 m!686643))

(assert (=> b!733920 m!686703))

(assert (=> b!733922 m!686643))

(assert (=> b!733922 m!686643))

(declare-fun m!686707 () Bool)

(assert (=> b!733922 m!686707))

(assert (=> b!733448 d!99959))

(declare-fun d!99961 () Bool)

(declare-fun lt!325281 () SeekEntryResult!7346)

(assert (=> d!99961 (and (or (is-Undefined!7346 lt!325281) (not (is-Found!7346 lt!325281)) (and (bvsge (index!31753 lt!325281) #b00000000000000000000000000000000) (bvslt (index!31753 lt!325281) (size!20167 a!3186)))) (or (is-Undefined!7346 lt!325281) (is-Found!7346 lt!325281) (not (is-MissingVacant!7346 lt!325281)) (not (= (index!31755 lt!325281) resIntermediateIndex!5)) (and (bvsge (index!31755 lt!325281) #b00000000000000000000000000000000) (bvslt (index!31755 lt!325281) (size!20167 a!3186)))) (or (is-Undefined!7346 lt!325281) (ite (is-Found!7346 lt!325281) (= (select (arr!19746 a!3186) (index!31753 lt!325281)) (select (arr!19746 a!3186) j!159)) (and (is-MissingVacant!7346 lt!325281) (= (index!31755 lt!325281) resIntermediateIndex!5) (= (select (arr!19746 a!3186) (index!31755 lt!325281)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!410666 () SeekEntryResult!7346)

(assert (=> d!99961 (= lt!325281 e!410666)))

(declare-fun c!80766 () Bool)

(assert (=> d!99961 (= c!80766 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!325282 () (_ BitVec 64))

(assert (=> d!99961 (= lt!325282 (select (arr!19746 a!3186) index!1321))))

(assert (=> d!99961 (validMask!0 mask!3328)))

(assert (=> d!99961 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19746 a!3186) j!159) a!3186 mask!3328) lt!325281)))

(declare-fun b!733935 () Bool)

(declare-fun e!410664 () SeekEntryResult!7346)

(assert (=> b!733935 (= e!410664 (MissingVacant!7346 resIntermediateIndex!5))))

(declare-fun b!733936 () Bool)

(declare-fun e!410665 () SeekEntryResult!7346)

(assert (=> b!733936 (= e!410666 e!410665)))

(declare-fun c!80764 () Bool)

(assert (=> b!733936 (= c!80764 (= lt!325282 (select (arr!19746 a!3186) j!159)))))

(declare-fun b!733937 () Bool)

(assert (=> b!733937 (= e!410664 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19746 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733938 () Bool)

(assert (=> b!733938 (= e!410665 (Found!7346 index!1321))))

(declare-fun b!733939 () Bool)

(assert (=> b!733939 (= e!410666 Undefined!7346)))

(declare-fun b!733940 () Bool)

(declare-fun c!80765 () Bool)

(assert (=> b!733940 (= c!80765 (= lt!325282 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!733940 (= e!410665 e!410664)))

(assert (= (and d!99961 c!80766) b!733939))

(assert (= (and d!99961 (not c!80766)) b!733936))

(assert (= (and b!733936 c!80764) b!733938))

(assert (= (and b!733936 (not c!80764)) b!733940))

(assert (= (and b!733940 c!80765) b!733935))

(assert (= (and b!733940 (not c!80765)) b!733937))

(declare-fun m!686709 () Bool)

(assert (=> d!99961 m!686709))

(declare-fun m!686711 () Bool)

(assert (=> d!99961 m!686711))

(declare-fun m!686713 () Bool)

(assert (=> d!99961 m!686713))

(assert (=> d!99961 m!686377))

(assert (=> b!733937 m!686349))

(assert (=> b!733937 m!686349))

(assert (=> b!733937 m!686339))

(declare-fun m!686715 () Bool)

(assert (=> b!733937 m!686715))

(assert (=> b!733459 d!99961))

(assert (=> b!733449 d!99961))

(declare-fun d!99963 () Bool)

(declare-fun res!493165 () Bool)

(declare-fun e!410668 () Bool)

(assert (=> d!99963 (=> res!493165 e!410668)))

(assert (=> d!99963 (= res!493165 (bvsge j!159 (size!20167 a!3186)))))

(assert (=> d!99963 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!410668)))

(declare-fun b!733941 () Bool)

(declare-fun e!410667 () Bool)

(declare-fun e!410669 () Bool)

(assert (=> b!733941 (= e!410667 e!410669)))

(declare-fun lt!325285 () (_ BitVec 64))

(assert (=> b!733941 (= lt!325285 (select (arr!19746 a!3186) j!159))))

(declare-fun lt!325283 () Unit!25010)

(assert (=> b!733941 (= lt!325283 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!325285 j!159))))

(assert (=> b!733941 (arrayContainsKey!0 a!3186 lt!325285 #b00000000000000000000000000000000)))

(declare-fun lt!325284 () Unit!25010)

(assert (=> b!733941 (= lt!325284 lt!325283)))

(declare-fun res!493164 () Bool)

(assert (=> b!733941 (= res!493164 (= (seekEntryOrOpen!0 (select (arr!19746 a!3186) j!159) a!3186 mask!3328) (Found!7346 j!159)))))

(assert (=> b!733941 (=> (not res!493164) (not e!410669))))

(declare-fun bm!34887 () Bool)

(declare-fun call!34890 () Bool)

(assert (=> bm!34887 (= call!34890 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!733942 () Bool)

(assert (=> b!733942 (= e!410668 e!410667)))

(declare-fun c!80767 () Bool)

(assert (=> b!733942 (= c!80767 (validKeyInArray!0 (select (arr!19746 a!3186) j!159)))))

(declare-fun b!733943 () Bool)

(assert (=> b!733943 (= e!410667 call!34890)))

(declare-fun b!733944 () Bool)

(assert (=> b!733944 (= e!410669 call!34890)))

(assert (= (and d!99963 (not res!493165)) b!733942))

(assert (= (and b!733942 c!80767) b!733941))

(assert (= (and b!733942 (not c!80767)) b!733943))

(assert (= (and b!733941 res!493164) b!733944))

(assert (= (or b!733944 b!733943) bm!34887))

(assert (=> b!733941 m!686339))

(declare-fun m!686717 () Bool)

(assert (=> b!733941 m!686717))

(declare-fun m!686719 () Bool)

(assert (=> b!733941 m!686719))

(assert (=> b!733941 m!686339))

(assert (=> b!733941 m!686353))

(declare-fun m!686721 () Bool)

(assert (=> bm!34887 m!686721))

(assert (=> b!733942 m!686339))

(assert (=> b!733942 m!686339))

(assert (=> b!733942 m!686375))

(assert (=> b!733460 d!99963))

(declare-fun d!99965 () Bool)

(assert (=> d!99965 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!325288 () Unit!25010)

(declare-fun choose!38 (array!41259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25010)

(assert (=> d!99965 (= lt!325288 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99965 (validMask!0 mask!3328)))

(assert (=> d!99965 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!325288)))

(declare-fun bs!20975 () Bool)

(assert (= bs!20975 d!99965))

(assert (=> bs!20975 m!686367))

(declare-fun m!686723 () Bool)

(assert (=> bs!20975 m!686723))

(assert (=> bs!20975 m!686377))

(assert (=> b!733460 d!99965))

(declare-fun d!99967 () Bool)

(declare-fun lt!325291 () (_ BitVec 32))

(assert (=> d!99967 (and (bvsge lt!325291 #b00000000000000000000000000000000) (bvslt lt!325291 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99967 (= lt!325291 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!99967 (validMask!0 mask!3328)))

(assert (=> d!99967 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!325291)))

(declare-fun bs!20976 () Bool)

(assert (= bs!20976 d!99967))

(declare-fun m!686725 () Bool)

(assert (=> bs!20976 m!686725))

(assert (=> bs!20976 m!686377))

(assert (=> b!733461 d!99967))

(declare-fun e!410682 () SeekEntryResult!7346)

(declare-fun b!733963 () Bool)

(assert (=> b!733963 (= e!410682 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19746 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733964 () Bool)

(declare-fun lt!325296 () SeekEntryResult!7346)

(assert (=> b!733964 (and (bvsge (index!31754 lt!325296) #b00000000000000000000000000000000) (bvslt (index!31754 lt!325296) (size!20167 a!3186)))))

(declare-fun res!493173 () Bool)

(assert (=> b!733964 (= res!493173 (= (select (arr!19746 a!3186) (index!31754 lt!325296)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410684 () Bool)

(assert (=> b!733964 (=> res!493173 e!410684)))

(declare-fun b!733965 () Bool)

(declare-fun e!410681 () Bool)

(assert (=> b!733965 (= e!410681 (bvsge (x!62744 lt!325296) #b01111111111111111111111111111110))))

(declare-fun d!99969 () Bool)

(assert (=> d!99969 e!410681))

(declare-fun c!80776 () Bool)

(assert (=> d!99969 (= c!80776 (and (is-Intermediate!7346 lt!325296) (undefined!8158 lt!325296)))))

(declare-fun e!410680 () SeekEntryResult!7346)

(assert (=> d!99969 (= lt!325296 e!410680)))

(declare-fun c!80774 () Bool)

(assert (=> d!99969 (= c!80774 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!325297 () (_ BitVec 64))

(assert (=> d!99969 (= lt!325297 (select (arr!19746 a!3186) index!1321))))

(assert (=> d!99969 (validMask!0 mask!3328)))

(assert (=> d!99969 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19746 a!3186) j!159) a!3186 mask!3328) lt!325296)))

(declare-fun b!733966 () Bool)

(assert (=> b!733966 (= e!410682 (Intermediate!7346 false index!1321 x!1131))))

(declare-fun b!733967 () Bool)

(assert (=> b!733967 (and (bvsge (index!31754 lt!325296) #b00000000000000000000000000000000) (bvslt (index!31754 lt!325296) (size!20167 a!3186)))))

(assert (=> b!733967 (= e!410684 (= (select (arr!19746 a!3186) (index!31754 lt!325296)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!733968 () Bool)

(assert (=> b!733968 (= e!410680 e!410682)))

(declare-fun c!80775 () Bool)

(assert (=> b!733968 (= c!80775 (or (= lt!325297 (select (arr!19746 a!3186) j!159)) (= (bvadd lt!325297 lt!325297) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733969 () Bool)

(assert (=> b!733969 (and (bvsge (index!31754 lt!325296) #b00000000000000000000000000000000) (bvslt (index!31754 lt!325296) (size!20167 a!3186)))))

(declare-fun res!493174 () Bool)

(assert (=> b!733969 (= res!493174 (= (select (arr!19746 a!3186) (index!31754 lt!325296)) (select (arr!19746 a!3186) j!159)))))

(assert (=> b!733969 (=> res!493174 e!410684)))

(declare-fun e!410683 () Bool)

(assert (=> b!733969 (= e!410683 e!410684)))

(declare-fun b!733970 () Bool)

(assert (=> b!733970 (= e!410680 (Intermediate!7346 true index!1321 x!1131))))

(declare-fun b!733971 () Bool)

(assert (=> b!733971 (= e!410681 e!410683)))

(declare-fun res!493172 () Bool)

(assert (=> b!733971 (= res!493172 (and (is-Intermediate!7346 lt!325296) (not (undefined!8158 lt!325296)) (bvslt (x!62744 lt!325296) #b01111111111111111111111111111110) (bvsge (x!62744 lt!325296) #b00000000000000000000000000000000) (bvsge (x!62744 lt!325296) x!1131)))))

(assert (=> b!733971 (=> (not res!493172) (not e!410683))))

(assert (= (and d!99969 c!80774) b!733970))

(assert (= (and d!99969 (not c!80774)) b!733968))

(assert (= (and b!733968 c!80775) b!733966))

(assert (= (and b!733968 (not c!80775)) b!733963))

(assert (= (and d!99969 c!80776) b!733965))

(assert (= (and d!99969 (not c!80776)) b!733971))

(assert (= (and b!733971 res!493172) b!733969))

(assert (= (and b!733969 (not res!493174)) b!733964))

(assert (= (and b!733964 (not res!493173)) b!733967))

(declare-fun m!686727 () Bool)

(assert (=> b!733964 m!686727))

(assert (=> d!99969 m!686713))

(assert (=> d!99969 m!686377))

(assert (=> b!733967 m!686727))

(assert (=> b!733963 m!686349))

(assert (=> b!733963 m!686349))

(assert (=> b!733963 m!686339))

(declare-fun m!686729 () Bool)

(assert (=> b!733963 m!686729))

(assert (=> b!733969 m!686727))

(assert (=> b!733451 d!99969))

(declare-fun e!410687 () SeekEntryResult!7346)

(declare-fun b!733972 () Bool)

(assert (=> b!733972 (= e!410687 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19746 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19746 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!733973 () Bool)

(declare-fun lt!325298 () SeekEntryResult!7346)

(assert (=> b!733973 (and (bvsge (index!31754 lt!325298) #b00000000000000000000000000000000) (bvslt (index!31754 lt!325298) (size!20167 a!3186)))))

(declare-fun res!493176 () Bool)

(assert (=> b!733973 (= res!493176 (= (select (arr!19746 a!3186) (index!31754 lt!325298)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!410689 () Bool)

(assert (=> b!733973 (=> res!493176 e!410689)))

(declare-fun b!733974 () Bool)

(declare-fun e!410686 () Bool)

(assert (=> b!733974 (= e!410686 (bvsge (x!62744 lt!325298) #b01111111111111111111111111111110))))

(declare-fun d!99971 () Bool)

(assert (=> d!99971 e!410686))

(declare-fun c!80779 () Bool)

(assert (=> d!99971 (= c!80779 (and (is-Intermediate!7346 lt!325298) (undefined!8158 lt!325298)))))

(declare-fun e!410685 () SeekEntryResult!7346)

(assert (=> d!99971 (= lt!325298 e!410685)))

(declare-fun c!80777 () Bool)

(assert (=> d!99971 (= c!80777 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!325299 () (_ BitVec 64))

(assert (=> d!99971 (= lt!325299 (select (arr!19746 a!3186) (toIndex!0 (select (arr!19746 a!3186) j!159) mask!3328)))))

(assert (=> d!99971 (validMask!0 mask!3328)))

(assert (=> d!99971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19746 a!3186) j!159) mask!3328) (select (arr!19746 a!3186) j!159) a!3186 mask!3328) lt!325298)))

(declare-fun b!733975 () Bool)

(assert (=> b!733975 (= e!410687 (Intermediate!7346 false (toIndex!0 (select (arr!19746 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!733976 () Bool)

(assert (=> b!733976 (and (bvsge (index!31754 lt!325298) #b00000000000000000000000000000000) (bvslt (index!31754 lt!325298) (size!20167 a!3186)))))

(assert (=> b!733976 (= e!410689 (= (select (arr!19746 a!3186) (index!31754 lt!325298)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!733977 () Bool)

(assert (=> b!733977 (= e!410685 e!410687)))

(declare-fun c!80778 () Bool)

(assert (=> b!733977 (= c!80778 (or (= lt!325299 (select (arr!19746 a!3186) j!159)) (= (bvadd lt!325299 lt!325299) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733978 () Bool)

(assert (=> b!733978 (and (bvsge (index!31754 lt!325298) #b00000000000000000000000000000000) (bvslt (index!31754 lt!325298) (size!20167 a!3186)))))

(declare-fun res!493177 () Bool)

(assert (=> b!733978 (= res!493177 (= (select (arr!19746 a!3186) (index!31754 lt!325298)) (select (arr!19746 a!3186) j!159)))))

(assert (=> b!733978 (=> res!493177 e!410689)))

(declare-fun e!410688 () Bool)

(assert (=> b!733978 (= e!410688 e!410689)))

(declare-fun b!733979 () Bool)

(assert (=> b!733979 (= e!410685 (Intermediate!7346 true (toIndex!0 (select (arr!19746 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!733980 () Bool)

(assert (=> b!733980 (= e!410686 e!410688)))

(declare-fun res!493175 () Bool)

(assert (=> b!733980 (= res!493175 (and (is-Intermediate!7346 lt!325298) (not (undefined!8158 lt!325298)) (bvslt (x!62744 lt!325298) #b01111111111111111111111111111110) (bvsge (x!62744 lt!325298) #b00000000000000000000000000000000) (bvsge (x!62744 lt!325298) #b00000000000000000000000000000000)))))

(assert (=> b!733980 (=> (not res!493175) (not e!410688))))

(assert (= (and d!99971 c!80777) b!733979))

(assert (= (and d!99971 (not c!80777)) b!733977))

(assert (= (and b!733977 c!80778) b!733975))

(assert (= (and b!733977 (not c!80778)) b!733972))

(assert (= (and d!99971 c!80779) b!733974))

(assert (= (and d!99971 (not c!80779)) b!733980))

(assert (= (and b!733980 res!493175) b!733978))

(assert (= (and b!733978 (not res!493177)) b!733973))

(assert (= (and b!733973 (not res!493176)) b!733976))

(declare-fun m!686731 () Bool)

(assert (=> b!733973 m!686731))

(assert (=> d!99971 m!686341))

