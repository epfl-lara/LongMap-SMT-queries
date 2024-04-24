; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66584 () Bool)

(assert start!66584)

(declare-fun b!766450 () Bool)

(declare-fun res!518286 () Bool)

(declare-fun e!426902 () Bool)

(assert (=> b!766450 (=> (not res!518286) (not e!426902))))

(declare-datatypes ((array!42241 0))(
  ( (array!42242 (arr!20221 (Array (_ BitVec 32) (_ BitVec 64))) (size!20641 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42241)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766450 (= res!518286 (validKeyInArray!0 (select (arr!20221 a!3186) j!159)))))

(declare-fun b!766451 () Bool)

(declare-fun res!518282 () Bool)

(declare-fun e!426901 () Bool)

(assert (=> b!766451 (=> (not res!518282) (not e!426901))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!766451 (= res!518282 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20221 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766452 () Bool)

(declare-fun res!518280 () Bool)

(assert (=> b!766452 (=> (not res!518280) (not e!426902))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766452 (= res!518280 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!518287 () Bool)

(assert (=> start!66584 (=> (not res!518287) (not e!426902))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66584 (= res!518287 (validMask!0 mask!3328))))

(assert (=> start!66584 e!426902))

(assert (=> start!66584 true))

(declare-fun array_inv!16080 (array!42241) Bool)

(assert (=> start!66584 (array_inv!16080 a!3186)))

(declare-fun b!766453 () Bool)

(declare-fun e!426906 () Bool)

(assert (=> b!766453 (= e!426906 (not true))))

(declare-fun e!426903 () Bool)

(assert (=> b!766453 e!426903))

(declare-fun res!518281 () Bool)

(assert (=> b!766453 (=> (not res!518281) (not e!426903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42241 (_ BitVec 32)) Bool)

(assert (=> b!766453 (= res!518281 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26359 0))(
  ( (Unit!26360) )
))
(declare-fun lt!340936 () Unit!26359)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42241 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26359)

(assert (=> b!766453 (= lt!340936 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!766454 () Bool)

(declare-fun res!518289 () Bool)

(assert (=> b!766454 (=> (not res!518289) (not e!426901))))

(declare-fun e!426907 () Bool)

(assert (=> b!766454 (= res!518289 e!426907)))

(declare-fun c!84479 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766454 (= c!84479 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!766455 () Bool)

(declare-fun res!518284 () Bool)

(declare-fun e!426904 () Bool)

(assert (=> b!766455 (=> (not res!518284) (not e!426904))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!766455 (= res!518284 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20641 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20641 a!3186))))))

(declare-fun b!766456 () Bool)

(declare-fun res!518291 () Bool)

(assert (=> b!766456 (=> (not res!518291) (not e!426904))))

(assert (=> b!766456 (= res!518291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766457 () Bool)

(declare-fun e!426908 () Bool)

(declare-datatypes ((SeekEntryResult!7777 0))(
  ( (MissingZero!7777 (index!33476 (_ BitVec 32))) (Found!7777 (index!33477 (_ BitVec 32))) (Intermediate!7777 (undefined!8589 Bool) (index!33478 (_ BitVec 32)) (x!64546 (_ BitVec 32))) (Undefined!7777) (MissingVacant!7777 (index!33479 (_ BitVec 32))) )
))
(declare-fun lt!340934 () SeekEntryResult!7777)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42241 (_ BitVec 32)) SeekEntryResult!7777)

(assert (=> b!766457 (= e!426908 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20221 a!3186) j!159) a!3186 mask!3328) lt!340934))))

(declare-fun b!766458 () Bool)

(declare-fun res!518283 () Bool)

(assert (=> b!766458 (=> (not res!518283) (not e!426902))))

(assert (=> b!766458 (= res!518283 (and (= (size!20641 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20641 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20641 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766459 () Bool)

(assert (=> b!766459 (= e!426904 e!426901)))

(declare-fun res!518279 () Bool)

(assert (=> b!766459 (=> (not res!518279) (not e!426901))))

(declare-fun lt!340937 () SeekEntryResult!7777)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42241 (_ BitVec 32)) SeekEntryResult!7777)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766459 (= res!518279 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20221 a!3186) j!159) mask!3328) (select (arr!20221 a!3186) j!159) a!3186 mask!3328) lt!340937))))

(assert (=> b!766459 (= lt!340937 (Intermediate!7777 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766460 () Bool)

(assert (=> b!766460 (= e!426907 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20221 a!3186) j!159) a!3186 mask!3328) (Found!7777 j!159)))))

(declare-fun b!766461 () Bool)

(assert (=> b!766461 (= e!426903 e!426908)))

(declare-fun res!518290 () Bool)

(assert (=> b!766461 (=> (not res!518290) (not e!426908))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42241 (_ BitVec 32)) SeekEntryResult!7777)

(assert (=> b!766461 (= res!518290 (= (seekEntryOrOpen!0 (select (arr!20221 a!3186) j!159) a!3186 mask!3328) lt!340934))))

(assert (=> b!766461 (= lt!340934 (Found!7777 j!159))))

(declare-fun b!766462 () Bool)

(assert (=> b!766462 (= e!426907 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20221 a!3186) j!159) a!3186 mask!3328) lt!340937))))

(declare-fun b!766463 () Bool)

(declare-fun res!518288 () Bool)

(assert (=> b!766463 (=> (not res!518288) (not e!426902))))

(assert (=> b!766463 (= res!518288 (validKeyInArray!0 k0!2102))))

(declare-fun b!766464 () Bool)

(assert (=> b!766464 (= e!426902 e!426904)))

(declare-fun res!518278 () Bool)

(assert (=> b!766464 (=> (not res!518278) (not e!426904))))

(declare-fun lt!340938 () SeekEntryResult!7777)

(assert (=> b!766464 (= res!518278 (or (= lt!340938 (MissingZero!7777 i!1173)) (= lt!340938 (MissingVacant!7777 i!1173))))))

(assert (=> b!766464 (= lt!340938 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!766465 () Bool)

(declare-fun res!518285 () Bool)

(assert (=> b!766465 (=> (not res!518285) (not e!426904))))

(declare-datatypes ((List!14130 0))(
  ( (Nil!14127) (Cons!14126 (h!15222 (_ BitVec 64)) (t!20437 List!14130)) )
))
(declare-fun arrayNoDuplicates!0 (array!42241 (_ BitVec 32) List!14130) Bool)

(assert (=> b!766465 (= res!518285 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14127))))

(declare-fun b!766466 () Bool)

(assert (=> b!766466 (= e!426901 e!426906)))

(declare-fun res!518277 () Bool)

(assert (=> b!766466 (=> (not res!518277) (not e!426906))))

(declare-fun lt!340933 () (_ BitVec 64))

(declare-fun lt!340935 () array!42241)

(assert (=> b!766466 (= res!518277 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340933 mask!3328) lt!340933 lt!340935 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340933 lt!340935 mask!3328)))))

(assert (=> b!766466 (= lt!340933 (select (store (arr!20221 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!766466 (= lt!340935 (array!42242 (store (arr!20221 a!3186) i!1173 k0!2102) (size!20641 a!3186)))))

(assert (= (and start!66584 res!518287) b!766458))

(assert (= (and b!766458 res!518283) b!766450))

(assert (= (and b!766450 res!518286) b!766463))

(assert (= (and b!766463 res!518288) b!766452))

(assert (= (and b!766452 res!518280) b!766464))

(assert (= (and b!766464 res!518278) b!766456))

(assert (= (and b!766456 res!518291) b!766465))

(assert (= (and b!766465 res!518285) b!766455))

(assert (= (and b!766455 res!518284) b!766459))

(assert (= (and b!766459 res!518279) b!766451))

(assert (= (and b!766451 res!518282) b!766454))

(assert (= (and b!766454 c!84479) b!766462))

(assert (= (and b!766454 (not c!84479)) b!766460))

(assert (= (and b!766454 res!518289) b!766466))

(assert (= (and b!766466 res!518277) b!766453))

(assert (= (and b!766453 res!518281) b!766461))

(assert (= (and b!766461 res!518290) b!766457))

(declare-fun m!712885 () Bool)

(assert (=> b!766452 m!712885))

(declare-fun m!712887 () Bool)

(assert (=> b!766456 m!712887))

(declare-fun m!712889 () Bool)

(assert (=> b!766461 m!712889))

(assert (=> b!766461 m!712889))

(declare-fun m!712891 () Bool)

(assert (=> b!766461 m!712891))

(declare-fun m!712893 () Bool)

(assert (=> b!766464 m!712893))

(declare-fun m!712895 () Bool)

(assert (=> b!766451 m!712895))

(declare-fun m!712897 () Bool)

(assert (=> b!766463 m!712897))

(assert (=> b!766460 m!712889))

(assert (=> b!766460 m!712889))

(declare-fun m!712899 () Bool)

(assert (=> b!766460 m!712899))

(assert (=> b!766462 m!712889))

(assert (=> b!766462 m!712889))

(declare-fun m!712901 () Bool)

(assert (=> b!766462 m!712901))

(assert (=> b!766450 m!712889))

(assert (=> b!766450 m!712889))

(declare-fun m!712903 () Bool)

(assert (=> b!766450 m!712903))

(assert (=> b!766459 m!712889))

(assert (=> b!766459 m!712889))

(declare-fun m!712905 () Bool)

(assert (=> b!766459 m!712905))

(assert (=> b!766459 m!712905))

(assert (=> b!766459 m!712889))

(declare-fun m!712907 () Bool)

(assert (=> b!766459 m!712907))

(declare-fun m!712909 () Bool)

(assert (=> b!766453 m!712909))

(declare-fun m!712911 () Bool)

(assert (=> b!766453 m!712911))

(declare-fun m!712913 () Bool)

(assert (=> b!766465 m!712913))

(declare-fun m!712915 () Bool)

(assert (=> b!766466 m!712915))

(declare-fun m!712917 () Bool)

(assert (=> b!766466 m!712917))

(assert (=> b!766466 m!712915))

(declare-fun m!712919 () Bool)

(assert (=> b!766466 m!712919))

(declare-fun m!712921 () Bool)

(assert (=> b!766466 m!712921))

(declare-fun m!712923 () Bool)

(assert (=> b!766466 m!712923))

(assert (=> b!766457 m!712889))

(assert (=> b!766457 m!712889))

(declare-fun m!712925 () Bool)

(assert (=> b!766457 m!712925))

(declare-fun m!712927 () Bool)

(assert (=> start!66584 m!712927))

(declare-fun m!712929 () Bool)

(assert (=> start!66584 m!712929))

(check-sat (not b!766452) (not b!766456) (not b!766464) (not b!766466) (not b!766463) (not b!766461) (not b!766453) (not b!766459) (not b!766460) (not b!766462) (not b!766457) (not b!766465) (not b!766450) (not start!66584))
(check-sat)
