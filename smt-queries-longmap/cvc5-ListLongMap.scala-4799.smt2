; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65854 () Bool)

(assert start!65854)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42027 0))(
  ( (array!42028 (arr!20127 (Array (_ BitVec 32) (_ BitVec 64))) (size!20548 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42027)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!423071 () Bool)

(declare-fun b!758849 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7727 0))(
  ( (MissingZero!7727 (index!33276 (_ BitVec 32))) (Found!7727 (index!33277 (_ BitVec 32))) (Intermediate!7727 (undefined!8539 Bool) (index!33278 (_ BitVec 32)) (x!64165 (_ BitVec 32))) (Undefined!7727) (MissingVacant!7727 (index!33279 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42027 (_ BitVec 32)) SeekEntryResult!7727)

(assert (=> b!758849 (= e!423071 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20127 a!3186) j!159) a!3186 mask!3328) (Found!7727 j!159)))))

(declare-fun b!758850 () Bool)

(declare-fun res!513442 () Bool)

(declare-fun e!423072 () Bool)

(assert (=> b!758850 (=> (not res!513442) (not e!423072))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758850 (= res!513442 (validKeyInArray!0 k!2102))))

(declare-fun b!758851 () Bool)

(declare-fun res!513429 () Bool)

(declare-fun e!423068 () Bool)

(assert (=> b!758851 (=> (not res!513429) (not e!423068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42027 (_ BitVec 32)) Bool)

(assert (=> b!758851 (= res!513429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!423069 () Bool)

(declare-fun b!758852 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!338156 () SeekEntryResult!7727)

(assert (=> b!758852 (= e!423069 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20127 a!3186) j!159) a!3186 mask!3328) lt!338156))))

(declare-fun b!758853 () Bool)

(declare-datatypes ((Unit!26288 0))(
  ( (Unit!26289) )
))
(declare-fun e!423080 () Unit!26288)

(declare-fun Unit!26290 () Unit!26288)

(assert (=> b!758853 (= e!423080 Unit!26290)))

(declare-fun b!758854 () Bool)

(declare-fun res!513443 () Bool)

(declare-fun e!423078 () Bool)

(assert (=> b!758854 (=> (not res!513443) (not e!423078))))

(assert (=> b!758854 (= res!513443 e!423071)))

(declare-fun c!83091 () Bool)

(assert (=> b!758854 (= c!83091 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758855 () Bool)

(declare-fun res!513430 () Bool)

(assert (=> b!758855 (=> (not res!513430) (not e!423078))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758855 (= res!513430 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20127 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758856 () Bool)

(declare-fun res!513439 () Bool)

(assert (=> b!758856 (=> (not res!513439) (not e!423068))))

(declare-datatypes ((List!14129 0))(
  ( (Nil!14126) (Cons!14125 (h!15197 (_ BitVec 64)) (t!20444 List!14129)) )
))
(declare-fun arrayNoDuplicates!0 (array!42027 (_ BitVec 32) List!14129) Bool)

(assert (=> b!758856 (= res!513439 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14126))))

(declare-fun b!758857 () Bool)

(declare-fun e!423077 () Bool)

(declare-fun e!423076 () Bool)

(assert (=> b!758857 (= e!423077 e!423076)))

(declare-fun res!513445 () Bool)

(assert (=> b!758857 (=> res!513445 e!423076)))

(declare-fun lt!338153 () SeekEntryResult!7727)

(assert (=> b!758857 (= res!513445 (not (= lt!338153 lt!338156)))))

(assert (=> b!758857 (= lt!338153 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20127 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758858 () Bool)

(assert (=> b!758858 (= e!423068 e!423078)))

(declare-fun res!513428 () Bool)

(assert (=> b!758858 (=> (not res!513428) (not e!423078))))

(declare-fun lt!338147 () SeekEntryResult!7727)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42027 (_ BitVec 32)) SeekEntryResult!7727)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758858 (= res!513428 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20127 a!3186) j!159) mask!3328) (select (arr!20127 a!3186) j!159) a!3186 mask!3328) lt!338147))))

(assert (=> b!758858 (= lt!338147 (Intermediate!7727 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758859 () Bool)

(declare-fun res!513441 () Bool)

(assert (=> b!758859 (=> (not res!513441) (not e!423072))))

(declare-fun arrayContainsKey!0 (array!42027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758859 (= res!513441 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758860 () Bool)

(declare-fun e!423074 () Bool)

(assert (=> b!758860 (= e!423076 e!423074)))

(declare-fun res!513434 () Bool)

(assert (=> b!758860 (=> res!513434 e!423074)))

(declare-fun lt!338145 () (_ BitVec 64))

(declare-fun lt!338150 () (_ BitVec 64))

(assert (=> b!758860 (= res!513434 (= lt!338145 lt!338150))))

(assert (=> b!758860 (= lt!338145 (select (store (arr!20127 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!758861 () Bool)

(declare-fun res!513433 () Bool)

(assert (=> b!758861 (=> (not res!513433) (not e!423072))))

(assert (=> b!758861 (= res!513433 (and (= (size!20548 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20548 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20548 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758862 () Bool)

(declare-fun e!423075 () Bool)

(assert (=> b!758862 (= e!423075 (not e!423077))))

(declare-fun res!513431 () Bool)

(assert (=> b!758862 (=> res!513431 e!423077)))

(declare-fun lt!338149 () SeekEntryResult!7727)

(assert (=> b!758862 (= res!513431 (or (not (is-Intermediate!7727 lt!338149)) (bvslt x!1131 (x!64165 lt!338149)) (not (= x!1131 (x!64165 lt!338149))) (not (= index!1321 (index!33278 lt!338149)))))))

(assert (=> b!758862 e!423069))

(declare-fun res!513437 () Bool)

(assert (=> b!758862 (=> (not res!513437) (not e!423069))))

(declare-fun lt!338157 () SeekEntryResult!7727)

(assert (=> b!758862 (= res!513437 (= lt!338157 lt!338156))))

(assert (=> b!758862 (= lt!338156 (Found!7727 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42027 (_ BitVec 32)) SeekEntryResult!7727)

(assert (=> b!758862 (= lt!338157 (seekEntryOrOpen!0 (select (arr!20127 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!758862 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!338158 () Unit!26288)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42027 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26288)

(assert (=> b!758862 (= lt!338158 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758863 () Bool)

(declare-fun res!513440 () Bool)

(assert (=> b!758863 (=> (not res!513440) (not e!423068))))

(assert (=> b!758863 (= res!513440 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20548 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20548 a!3186))))))

(declare-fun b!758864 () Bool)

(declare-fun e!423073 () Bool)

(assert (=> b!758864 (= e!423074 e!423073)))

(declare-fun res!513444 () Bool)

(assert (=> b!758864 (=> res!513444 e!423073)))

(assert (=> b!758864 (= res!513444 (or (not (= (select (arr!20127 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!338148 () SeekEntryResult!7727)

(declare-fun lt!338151 () SeekEntryResult!7727)

(assert (=> b!758864 (and (= lt!338151 lt!338148) (= lt!338157 lt!338153))))

(declare-fun lt!338159 () array!42027)

(assert (=> b!758864 (= lt!338148 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!338150 lt!338159 mask!3328))))

(assert (=> b!758864 (= lt!338151 (seekEntryOrOpen!0 lt!338150 lt!338159 mask!3328))))

(assert (=> b!758864 (= lt!338145 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!338146 () Unit!26288)

(assert (=> b!758864 (= lt!338146 e!423080)))

(declare-fun c!83092 () Bool)

(assert (=> b!758864 (= c!83092 (= lt!338145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758865 () Bool)

(declare-fun e!423079 () Bool)

(assert (=> b!758865 (= e!423073 e!423079)))

(declare-fun res!513436 () Bool)

(assert (=> b!758865 (=> res!513436 e!423079)))

(assert (=> b!758865 (= res!513436 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!758865 (= lt!338148 lt!338153)))

(declare-fun lt!338152 () Unit!26288)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42027 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26288)

(assert (=> b!758865 (= lt!338152 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!758866 () Bool)

(assert (=> b!758866 (= e!423078 e!423075)))

(declare-fun res!513435 () Bool)

(assert (=> b!758866 (=> (not res!513435) (not e!423075))))

(declare-fun lt!338155 () SeekEntryResult!7727)

(assert (=> b!758866 (= res!513435 (= lt!338155 lt!338149))))

(assert (=> b!758866 (= lt!338149 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338150 lt!338159 mask!3328))))

(assert (=> b!758866 (= lt!338155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338150 mask!3328) lt!338150 lt!338159 mask!3328))))

(assert (=> b!758866 (= lt!338150 (select (store (arr!20127 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!758866 (= lt!338159 (array!42028 (store (arr!20127 a!3186) i!1173 k!2102) (size!20548 a!3186)))))

(declare-fun b!758867 () Bool)

(declare-fun res!513446 () Bool)

(assert (=> b!758867 (=> (not res!513446) (not e!423072))))

(assert (=> b!758867 (= res!513446 (validKeyInArray!0 (select (arr!20127 a!3186) j!159)))))

(declare-fun b!758868 () Bool)

(assert (=> b!758868 (= e!423071 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20127 a!3186) j!159) a!3186 mask!3328) lt!338147))))

(declare-fun res!513438 () Bool)

(assert (=> start!65854 (=> (not res!513438) (not e!423072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65854 (= res!513438 (validMask!0 mask!3328))))

(assert (=> start!65854 e!423072))

(assert (=> start!65854 true))

(declare-fun array_inv!15923 (array!42027) Bool)

(assert (=> start!65854 (array_inv!15923 a!3186)))

(declare-fun b!758869 () Bool)

(declare-fun Unit!26291 () Unit!26288)

(assert (=> b!758869 (= e!423080 Unit!26291)))

(assert (=> b!758869 false))

(declare-fun b!758870 () Bool)

(assert (=> b!758870 (= e!423072 e!423068)))

(declare-fun res!513432 () Bool)

(assert (=> b!758870 (=> (not res!513432) (not e!423068))))

(declare-fun lt!338154 () SeekEntryResult!7727)

(assert (=> b!758870 (= res!513432 (or (= lt!338154 (MissingZero!7727 i!1173)) (= lt!338154 (MissingVacant!7727 i!1173))))))

(assert (=> b!758870 (= lt!338154 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!758871 () Bool)

(assert (=> b!758871 (= e!423079 (validKeyInArray!0 lt!338150))))

(assert (= (and start!65854 res!513438) b!758861))

(assert (= (and b!758861 res!513433) b!758867))

(assert (= (and b!758867 res!513446) b!758850))

(assert (= (and b!758850 res!513442) b!758859))

(assert (= (and b!758859 res!513441) b!758870))

(assert (= (and b!758870 res!513432) b!758851))

(assert (= (and b!758851 res!513429) b!758856))

(assert (= (and b!758856 res!513439) b!758863))

(assert (= (and b!758863 res!513440) b!758858))

(assert (= (and b!758858 res!513428) b!758855))

(assert (= (and b!758855 res!513430) b!758854))

(assert (= (and b!758854 c!83091) b!758868))

(assert (= (and b!758854 (not c!83091)) b!758849))

(assert (= (and b!758854 res!513443) b!758866))

(assert (= (and b!758866 res!513435) b!758862))

(assert (= (and b!758862 res!513437) b!758852))

(assert (= (and b!758862 (not res!513431)) b!758857))

(assert (= (and b!758857 (not res!513445)) b!758860))

(assert (= (and b!758860 (not res!513434)) b!758864))

(assert (= (and b!758864 c!83092) b!758869))

(assert (= (and b!758864 (not c!83092)) b!758853))

(assert (= (and b!758864 (not res!513444)) b!758865))

(assert (= (and b!758865 (not res!513436)) b!758871))

(declare-fun m!706267 () Bool)

(assert (=> b!758849 m!706267))

(assert (=> b!758849 m!706267))

(declare-fun m!706269 () Bool)

(assert (=> b!758849 m!706269))

(declare-fun m!706271 () Bool)

(assert (=> b!758856 m!706271))

(assert (=> b!758857 m!706267))

(assert (=> b!758857 m!706267))

(assert (=> b!758857 m!706269))

(assert (=> b!758852 m!706267))

(assert (=> b!758852 m!706267))

(declare-fun m!706273 () Bool)

(assert (=> b!758852 m!706273))

(declare-fun m!706275 () Bool)

(assert (=> b!758871 m!706275))

(declare-fun m!706277 () Bool)

(assert (=> b!758864 m!706277))

(declare-fun m!706279 () Bool)

(assert (=> b!758864 m!706279))

(declare-fun m!706281 () Bool)

(assert (=> b!758864 m!706281))

(assert (=> b!758862 m!706267))

(assert (=> b!758862 m!706267))

(declare-fun m!706283 () Bool)

(assert (=> b!758862 m!706283))

(declare-fun m!706285 () Bool)

(assert (=> b!758862 m!706285))

(declare-fun m!706287 () Bool)

(assert (=> b!758862 m!706287))

(declare-fun m!706289 () Bool)

(assert (=> start!65854 m!706289))

(declare-fun m!706291 () Bool)

(assert (=> start!65854 m!706291))

(declare-fun m!706293 () Bool)

(assert (=> b!758866 m!706293))

(declare-fun m!706295 () Bool)

(assert (=> b!758866 m!706295))

(declare-fun m!706297 () Bool)

(assert (=> b!758866 m!706297))

(declare-fun m!706299 () Bool)

(assert (=> b!758866 m!706299))

(declare-fun m!706301 () Bool)

(assert (=> b!758866 m!706301))

(assert (=> b!758866 m!706293))

(declare-fun m!706303 () Bool)

(assert (=> b!758870 m!706303))

(declare-fun m!706305 () Bool)

(assert (=> b!758851 m!706305))

(declare-fun m!706307 () Bool)

(assert (=> b!758850 m!706307))

(assert (=> b!758860 m!706299))

(declare-fun m!706309 () Bool)

(assert (=> b!758860 m!706309))

(assert (=> b!758868 m!706267))

(assert (=> b!758868 m!706267))

(declare-fun m!706311 () Bool)

(assert (=> b!758868 m!706311))

(declare-fun m!706313 () Bool)

(assert (=> b!758859 m!706313))

(assert (=> b!758867 m!706267))

(assert (=> b!758867 m!706267))

(declare-fun m!706315 () Bool)

(assert (=> b!758867 m!706315))

(assert (=> b!758858 m!706267))

(assert (=> b!758858 m!706267))

(declare-fun m!706317 () Bool)

(assert (=> b!758858 m!706317))

(assert (=> b!758858 m!706317))

(assert (=> b!758858 m!706267))

(declare-fun m!706319 () Bool)

(assert (=> b!758858 m!706319))

(declare-fun m!706321 () Bool)

(assert (=> b!758865 m!706321))

(declare-fun m!706323 () Bool)

(assert (=> b!758855 m!706323))

(push 1)

