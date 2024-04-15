; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64694 () Bool)

(assert start!64694)

(declare-fun b!729786 () Bool)

(declare-fun res!490273 () Bool)

(declare-fun e!408411 () Bool)

(assert (=> b!729786 (=> (not res!490273) (not e!408411))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41160 0))(
  ( (array!41161 (arr!19700 (Array (_ BitVec 32) (_ BitVec 64))) (size!20121 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41160)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!729786 (= res!490273 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19700 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!490263 () Bool)

(declare-fun e!408414 () Bool)

(assert (=> start!64694 (=> (not res!490263) (not e!408414))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64694 (= res!490263 (validMask!0 mask!3328))))

(assert (=> start!64694 e!408414))

(assert (=> start!64694 true))

(declare-fun array_inv!15583 (array!41160) Bool)

(assert (=> start!64694 (array_inv!15583 a!3186)))

(declare-fun b!729787 () Bool)

(declare-fun e!408415 () Bool)

(assert (=> b!729787 (= e!408411 e!408415)))

(declare-fun res!490269 () Bool)

(assert (=> b!729787 (=> (not res!490269) (not e!408415))))

(declare-datatypes ((SeekEntryResult!7297 0))(
  ( (MissingZero!7297 (index!31556 (_ BitVec 32))) (Found!7297 (index!31557 (_ BitVec 32))) (Intermediate!7297 (undefined!8109 Bool) (index!31558 (_ BitVec 32)) (x!62546 (_ BitVec 32))) (Undefined!7297) (MissingVacant!7297 (index!31559 (_ BitVec 32))) )
))
(declare-fun lt!323224 () SeekEntryResult!7297)

(declare-fun lt!323222 () SeekEntryResult!7297)

(assert (=> b!729787 (= res!490269 (= lt!323224 lt!323222))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!323221 () (_ BitVec 64))

(declare-fun lt!323225 () array!41160)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41160 (_ BitVec 32)) SeekEntryResult!7297)

(assert (=> b!729787 (= lt!323222 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323221 lt!323225 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729787 (= lt!323224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323221 mask!3328) lt!323221 lt!323225 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!729787 (= lt!323221 (select (store (arr!19700 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729787 (= lt!323225 (array!41161 (store (arr!19700 a!3186) i!1173 k0!2102) (size!20121 a!3186)))))

(declare-fun b!729788 () Bool)

(declare-fun res!490275 () Bool)

(assert (=> b!729788 (=> (not res!490275) (not e!408411))))

(declare-fun e!408413 () Bool)

(assert (=> b!729788 (= res!490275 e!408413)))

(declare-fun c!80136 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729788 (= c!80136 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729789 () Bool)

(declare-fun res!490270 () Bool)

(assert (=> b!729789 (=> (not res!490270) (not e!408414))))

(declare-fun arrayContainsKey!0 (array!41160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729789 (= res!490270 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729790 () Bool)

(declare-fun lt!323220 () SeekEntryResult!7297)

(assert (=> b!729790 (= e!408413 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19700 a!3186) j!159) a!3186 mask!3328) lt!323220))))

(declare-fun b!729791 () Bool)

(declare-fun res!490264 () Bool)

(assert (=> b!729791 (=> (not res!490264) (not e!408414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729791 (= res!490264 (validKeyInArray!0 k0!2102))))

(declare-fun b!729792 () Bool)

(declare-fun res!490268 () Bool)

(declare-fun e!408409 () Bool)

(assert (=> b!729792 (=> (not res!490268) (not e!408409))))

(declare-datatypes ((List!13741 0))(
  ( (Nil!13738) (Cons!13737 (h!14797 (_ BitVec 64)) (t!20047 List!13741)) )
))
(declare-fun arrayNoDuplicates!0 (array!41160 (_ BitVec 32) List!13741) Bool)

(assert (=> b!729792 (= res!490268 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13738))))

(declare-fun b!729793 () Bool)

(assert (=> b!729793 (= e!408414 e!408409)))

(declare-fun res!490272 () Bool)

(assert (=> b!729793 (=> (not res!490272) (not e!408409))))

(declare-fun lt!323227 () SeekEntryResult!7297)

(assert (=> b!729793 (= res!490272 (or (= lt!323227 (MissingZero!7297 i!1173)) (= lt!323227 (MissingVacant!7297 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41160 (_ BitVec 32)) SeekEntryResult!7297)

(assert (=> b!729793 (= lt!323227 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun lt!323226 () SeekEntryResult!7297)

(declare-fun b!729794 () Bool)

(declare-fun e!408412 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41160 (_ BitVec 32)) SeekEntryResult!7297)

(assert (=> b!729794 (= e!408412 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19700 a!3186) j!159) a!3186 mask!3328) lt!323226))))

(declare-fun b!729795 () Bool)

(declare-fun res!490277 () Bool)

(assert (=> b!729795 (=> (not res!490277) (not e!408409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41160 (_ BitVec 32)) Bool)

(assert (=> b!729795 (= res!490277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729796 () Bool)

(declare-fun e!408407 () Bool)

(assert (=> b!729796 (= e!408407 true)))

(declare-fun lt!323223 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729796 (= lt!323223 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729797 () Bool)

(declare-fun e!408408 () Bool)

(assert (=> b!729797 (= e!408408 e!408412)))

(declare-fun res!490267 () Bool)

(assert (=> b!729797 (=> (not res!490267) (not e!408412))))

(assert (=> b!729797 (= res!490267 (= (seekEntryOrOpen!0 (select (arr!19700 a!3186) j!159) a!3186 mask!3328) lt!323226))))

(assert (=> b!729797 (= lt!323226 (Found!7297 j!159))))

(declare-fun b!729798 () Bool)

(declare-fun res!490266 () Bool)

(assert (=> b!729798 (=> (not res!490266) (not e!408414))))

(assert (=> b!729798 (= res!490266 (and (= (size!20121 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20121 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20121 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729799 () Bool)

(assert (=> b!729799 (= e!408409 e!408411)))

(declare-fun res!490265 () Bool)

(assert (=> b!729799 (=> (not res!490265) (not e!408411))))

(assert (=> b!729799 (= res!490265 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19700 a!3186) j!159) mask!3328) (select (arr!19700 a!3186) j!159) a!3186 mask!3328) lt!323220))))

(assert (=> b!729799 (= lt!323220 (Intermediate!7297 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729800 () Bool)

(declare-fun res!490274 () Bool)

(assert (=> b!729800 (=> (not res!490274) (not e!408409))))

(assert (=> b!729800 (= res!490274 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20121 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20121 a!3186))))))

(declare-fun b!729801 () Bool)

(assert (=> b!729801 (= e!408415 (not e!408407))))

(declare-fun res!490276 () Bool)

(assert (=> b!729801 (=> res!490276 e!408407)))

(get-info :version)

(assert (=> b!729801 (= res!490276 (or (not ((_ is Intermediate!7297) lt!323222)) (bvsge x!1131 (x!62546 lt!323222))))))

(assert (=> b!729801 e!408408))

(declare-fun res!490271 () Bool)

(assert (=> b!729801 (=> (not res!490271) (not e!408408))))

(assert (=> b!729801 (= res!490271 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24884 0))(
  ( (Unit!24885) )
))
(declare-fun lt!323228 () Unit!24884)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24884)

(assert (=> b!729801 (= lt!323228 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729802 () Bool)

(assert (=> b!729802 (= e!408413 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19700 a!3186) j!159) a!3186 mask!3328) (Found!7297 j!159)))))

(declare-fun b!729803 () Bool)

(declare-fun res!490278 () Bool)

(assert (=> b!729803 (=> (not res!490278) (not e!408414))))

(assert (=> b!729803 (= res!490278 (validKeyInArray!0 (select (arr!19700 a!3186) j!159)))))

(assert (= (and start!64694 res!490263) b!729798))

(assert (= (and b!729798 res!490266) b!729803))

(assert (= (and b!729803 res!490278) b!729791))

(assert (= (and b!729791 res!490264) b!729789))

(assert (= (and b!729789 res!490270) b!729793))

(assert (= (and b!729793 res!490272) b!729795))

(assert (= (and b!729795 res!490277) b!729792))

(assert (= (and b!729792 res!490268) b!729800))

(assert (= (and b!729800 res!490274) b!729799))

(assert (= (and b!729799 res!490265) b!729786))

(assert (= (and b!729786 res!490273) b!729788))

(assert (= (and b!729788 c!80136) b!729790))

(assert (= (and b!729788 (not c!80136)) b!729802))

(assert (= (and b!729788 res!490275) b!729787))

(assert (= (and b!729787 res!490269) b!729801))

(assert (= (and b!729801 res!490271) b!729797))

(assert (= (and b!729797 res!490267) b!729794))

(assert (= (and b!729801 (not res!490276)) b!729796))

(declare-fun m!682853 () Bool)

(assert (=> b!729791 m!682853))

(declare-fun m!682855 () Bool)

(assert (=> start!64694 m!682855))

(declare-fun m!682857 () Bool)

(assert (=> start!64694 m!682857))

(declare-fun m!682859 () Bool)

(assert (=> b!729802 m!682859))

(assert (=> b!729802 m!682859))

(declare-fun m!682861 () Bool)

(assert (=> b!729802 m!682861))

(declare-fun m!682863 () Bool)

(assert (=> b!729789 m!682863))

(declare-fun m!682865 () Bool)

(assert (=> b!729793 m!682865))

(assert (=> b!729794 m!682859))

(assert (=> b!729794 m!682859))

(declare-fun m!682867 () Bool)

(assert (=> b!729794 m!682867))

(assert (=> b!729790 m!682859))

(assert (=> b!729790 m!682859))

(declare-fun m!682869 () Bool)

(assert (=> b!729790 m!682869))

(declare-fun m!682871 () Bool)

(assert (=> b!729786 m!682871))

(declare-fun m!682873 () Bool)

(assert (=> b!729801 m!682873))

(declare-fun m!682875 () Bool)

(assert (=> b!729801 m!682875))

(assert (=> b!729803 m!682859))

(assert (=> b!729803 m!682859))

(declare-fun m!682877 () Bool)

(assert (=> b!729803 m!682877))

(assert (=> b!729799 m!682859))

(assert (=> b!729799 m!682859))

(declare-fun m!682879 () Bool)

(assert (=> b!729799 m!682879))

(assert (=> b!729799 m!682879))

(assert (=> b!729799 m!682859))

(declare-fun m!682881 () Bool)

(assert (=> b!729799 m!682881))

(assert (=> b!729797 m!682859))

(assert (=> b!729797 m!682859))

(declare-fun m!682883 () Bool)

(assert (=> b!729797 m!682883))

(declare-fun m!682885 () Bool)

(assert (=> b!729787 m!682885))

(declare-fun m!682887 () Bool)

(assert (=> b!729787 m!682887))

(declare-fun m!682889 () Bool)

(assert (=> b!729787 m!682889))

(declare-fun m!682891 () Bool)

(assert (=> b!729787 m!682891))

(assert (=> b!729787 m!682889))

(declare-fun m!682893 () Bool)

(assert (=> b!729787 m!682893))

(declare-fun m!682895 () Bool)

(assert (=> b!729795 m!682895))

(declare-fun m!682897 () Bool)

(assert (=> b!729792 m!682897))

(declare-fun m!682899 () Bool)

(assert (=> b!729796 m!682899))

(check-sat (not b!729797) (not b!729790) (not b!729801) (not b!729799) (not b!729793) (not b!729791) (not start!64694) (not b!729803) (not b!729802) (not b!729787) (not b!729789) (not b!729792) (not b!729794) (not b!729796) (not b!729795))
(check-sat)
