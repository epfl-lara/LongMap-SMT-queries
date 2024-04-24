; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66602 () Bool)

(assert start!66602)

(declare-datatypes ((array!42259 0))(
  ( (array!42260 (arr!20230 (Array (_ BitVec 32) (_ BitVec 64))) (size!20650 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42259)

(declare-fun e!427135 () Bool)

(declare-fun b!766920 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7786 0))(
  ( (MissingZero!7786 (index!33512 (_ BitVec 32))) (Found!7786 (index!33513 (_ BitVec 32))) (Intermediate!7786 (undefined!8598 Bool) (index!33514 (_ BitVec 32)) (x!64579 (_ BitVec 32))) (Undefined!7786) (MissingVacant!7786 (index!33515 (_ BitVec 32))) )
))
(declare-fun lt!341133 () SeekEntryResult!7786)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42259 (_ BitVec 32)) SeekEntryResult!7786)

(assert (=> b!766920 (= e!427135 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20230 a!3186) j!159) a!3186 mask!3328) lt!341133))))

(declare-fun b!766921 () Bool)

(declare-fun res!518705 () Bool)

(declare-fun e!427128 () Bool)

(assert (=> b!766921 (=> (not res!518705) (not e!427128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766921 (= res!518705 (validKeyInArray!0 (select (arr!20230 a!3186) j!159)))))

(declare-fun b!766922 () Bool)

(declare-fun res!518693 () Bool)

(assert (=> b!766922 (=> (not res!518693) (not e!427128))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!766922 (= res!518693 (validKeyInArray!0 k0!2102))))

(declare-fun b!766923 () Bool)

(declare-fun e!427132 () Bool)

(declare-fun e!427130 () Bool)

(assert (=> b!766923 (= e!427132 e!427130)))

(declare-fun res!518702 () Bool)

(assert (=> b!766923 (=> (not res!518702) (not e!427130))))

(declare-fun lt!341131 () SeekEntryResult!7786)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42259 (_ BitVec 32)) SeekEntryResult!7786)

(assert (=> b!766923 (= res!518702 (= (seekEntryOrOpen!0 (select (arr!20230 a!3186) j!159) a!3186 mask!3328) lt!341131))))

(assert (=> b!766923 (= lt!341131 (Found!7786 j!159))))

(declare-fun b!766924 () Bool)

(declare-fun res!518694 () Bool)

(declare-fun e!427136 () Bool)

(assert (=> b!766924 (=> (not res!518694) (not e!427136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42259 (_ BitVec 32)) Bool)

(assert (=> b!766924 (= res!518694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766925 () Bool)

(declare-fun e!427134 () Bool)

(declare-fun e!427133 () Bool)

(assert (=> b!766925 (= e!427134 (not e!427133))))

(declare-fun res!518697 () Bool)

(assert (=> b!766925 (=> res!518697 e!427133)))

(declare-fun lt!341128 () SeekEntryResult!7786)

(get-info :version)

(assert (=> b!766925 (= res!518697 (or (not ((_ is Intermediate!7786) lt!341128)) (bvsge x!1131 (x!64579 lt!341128))))))

(assert (=> b!766925 e!427132))

(declare-fun res!518700 () Bool)

(assert (=> b!766925 (=> (not res!518700) (not e!427132))))

(assert (=> b!766925 (= res!518700 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26377 0))(
  ( (Unit!26378) )
))
(declare-fun lt!341136 () Unit!26377)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26377)

(assert (=> b!766925 (= lt!341136 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!766926 () Bool)

(declare-fun e!427129 () Bool)

(assert (=> b!766926 (= e!427136 e!427129)))

(declare-fun res!518699 () Bool)

(assert (=> b!766926 (=> (not res!518699) (not e!427129))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766926 (= res!518699 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20230 a!3186) j!159) mask!3328) (select (arr!20230 a!3186) j!159) a!3186 mask!3328) lt!341133))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766926 (= lt!341133 (Intermediate!7786 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766927 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42259 (_ BitVec 32)) SeekEntryResult!7786)

(assert (=> b!766927 (= e!427130 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20230 a!3186) j!159) a!3186 mask!3328) lt!341131))))

(declare-fun b!766928 () Bool)

(declare-fun res!518703 () Bool)

(assert (=> b!766928 (=> (not res!518703) (not e!427129))))

(assert (=> b!766928 (= res!518703 e!427135)))

(declare-fun c!84506 () Bool)

(assert (=> b!766928 (= c!84506 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!766929 () Bool)

(declare-fun res!518704 () Bool)

(assert (=> b!766929 (=> (not res!518704) (not e!427129))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!766929 (= res!518704 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20230 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766930 () Bool)

(declare-fun res!518706 () Bool)

(assert (=> b!766930 (=> (not res!518706) (not e!427128))))

(assert (=> b!766930 (= res!518706 (and (= (size!20650 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20650 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20650 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!766931 () Bool)

(declare-fun res!518701 () Bool)

(assert (=> b!766931 (=> (not res!518701) (not e!427136))))

(assert (=> b!766931 (= res!518701 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20650 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20650 a!3186))))))

(declare-fun b!766932 () Bool)

(declare-fun res!518707 () Bool)

(assert (=> b!766932 (=> (not res!518707) (not e!427136))))

(declare-datatypes ((List!14139 0))(
  ( (Nil!14136) (Cons!14135 (h!15231 (_ BitVec 64)) (t!20446 List!14139)) )
))
(declare-fun arrayNoDuplicates!0 (array!42259 (_ BitVec 32) List!14139) Bool)

(assert (=> b!766932 (= res!518707 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14136))))

(declare-fun b!766933 () Bool)

(assert (=> b!766933 (= e!427128 e!427136)))

(declare-fun res!518695 () Bool)

(assert (=> b!766933 (=> (not res!518695) (not e!427136))))

(declare-fun lt!341129 () SeekEntryResult!7786)

(assert (=> b!766933 (= res!518695 (or (= lt!341129 (MissingZero!7786 i!1173)) (= lt!341129 (MissingVacant!7786 i!1173))))))

(assert (=> b!766933 (= lt!341129 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!766934 () Bool)

(assert (=> b!766934 (= e!427135 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20230 a!3186) j!159) a!3186 mask!3328) (Found!7786 j!159)))))

(declare-fun res!518698 () Bool)

(assert (=> start!66602 (=> (not res!518698) (not e!427128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66602 (= res!518698 (validMask!0 mask!3328))))

(assert (=> start!66602 e!427128))

(assert (=> start!66602 true))

(declare-fun array_inv!16089 (array!42259) Bool)

(assert (=> start!66602 (array_inv!16089 a!3186)))

(declare-fun b!766935 () Bool)

(assert (=> b!766935 (= e!427133 true)))

(declare-fun lt!341132 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766935 (= lt!341132 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!766936 () Bool)

(declare-fun res!518696 () Bool)

(assert (=> b!766936 (=> (not res!518696) (not e!427128))))

(declare-fun arrayContainsKey!0 (array!42259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766936 (= res!518696 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766937 () Bool)

(assert (=> b!766937 (= e!427129 e!427134)))

(declare-fun res!518708 () Bool)

(assert (=> b!766937 (=> (not res!518708) (not e!427134))))

(declare-fun lt!341134 () SeekEntryResult!7786)

(assert (=> b!766937 (= res!518708 (= lt!341134 lt!341128))))

(declare-fun lt!341130 () array!42259)

(declare-fun lt!341135 () (_ BitVec 64))

(assert (=> b!766937 (= lt!341128 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341135 lt!341130 mask!3328))))

(assert (=> b!766937 (= lt!341134 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341135 mask!3328) lt!341135 lt!341130 mask!3328))))

(assert (=> b!766937 (= lt!341135 (select (store (arr!20230 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!766937 (= lt!341130 (array!42260 (store (arr!20230 a!3186) i!1173 k0!2102) (size!20650 a!3186)))))

(assert (= (and start!66602 res!518698) b!766930))

(assert (= (and b!766930 res!518706) b!766921))

(assert (= (and b!766921 res!518705) b!766922))

(assert (= (and b!766922 res!518693) b!766936))

(assert (= (and b!766936 res!518696) b!766933))

(assert (= (and b!766933 res!518695) b!766924))

(assert (= (and b!766924 res!518694) b!766932))

(assert (= (and b!766932 res!518707) b!766931))

(assert (= (and b!766931 res!518701) b!766926))

(assert (= (and b!766926 res!518699) b!766929))

(assert (= (and b!766929 res!518704) b!766928))

(assert (= (and b!766928 c!84506) b!766920))

(assert (= (and b!766928 (not c!84506)) b!766934))

(assert (= (and b!766928 res!518703) b!766937))

(assert (= (and b!766937 res!518708) b!766925))

(assert (= (and b!766925 res!518700) b!766923))

(assert (= (and b!766923 res!518702) b!766927))

(assert (= (and b!766925 (not res!518697)) b!766935))

(declare-fun m!713305 () Bool)

(assert (=> b!766935 m!713305))

(declare-fun m!713307 () Bool)

(assert (=> b!766925 m!713307))

(declare-fun m!713309 () Bool)

(assert (=> b!766925 m!713309))

(declare-fun m!713311 () Bool)

(assert (=> b!766926 m!713311))

(assert (=> b!766926 m!713311))

(declare-fun m!713313 () Bool)

(assert (=> b!766926 m!713313))

(assert (=> b!766926 m!713313))

(assert (=> b!766926 m!713311))

(declare-fun m!713315 () Bool)

(assert (=> b!766926 m!713315))

(declare-fun m!713317 () Bool)

(assert (=> b!766922 m!713317))

(assert (=> b!766927 m!713311))

(assert (=> b!766927 m!713311))

(declare-fun m!713319 () Bool)

(assert (=> b!766927 m!713319))

(declare-fun m!713321 () Bool)

(assert (=> b!766924 m!713321))

(declare-fun m!713323 () Bool)

(assert (=> b!766936 m!713323))

(assert (=> b!766920 m!713311))

(assert (=> b!766920 m!713311))

(declare-fun m!713325 () Bool)

(assert (=> b!766920 m!713325))

(declare-fun m!713327 () Bool)

(assert (=> b!766929 m!713327))

(declare-fun m!713329 () Bool)

(assert (=> b!766933 m!713329))

(declare-fun m!713331 () Bool)

(assert (=> b!766932 m!713331))

(assert (=> b!766934 m!713311))

(assert (=> b!766934 m!713311))

(declare-fun m!713333 () Bool)

(assert (=> b!766934 m!713333))

(assert (=> b!766921 m!713311))

(assert (=> b!766921 m!713311))

(declare-fun m!713335 () Bool)

(assert (=> b!766921 m!713335))

(assert (=> b!766923 m!713311))

(assert (=> b!766923 m!713311))

(declare-fun m!713337 () Bool)

(assert (=> b!766923 m!713337))

(declare-fun m!713339 () Bool)

(assert (=> start!66602 m!713339))

(declare-fun m!713341 () Bool)

(assert (=> start!66602 m!713341))

(declare-fun m!713343 () Bool)

(assert (=> b!766937 m!713343))

(declare-fun m!713345 () Bool)

(assert (=> b!766937 m!713345))

(assert (=> b!766937 m!713343))

(declare-fun m!713347 () Bool)

(assert (=> b!766937 m!713347))

(declare-fun m!713349 () Bool)

(assert (=> b!766937 m!713349))

(declare-fun m!713351 () Bool)

(assert (=> b!766937 m!713351))

(check-sat (not b!766921) (not b!766932) (not b!766926) (not b!766923) (not b!766925) (not b!766934) (not b!766927) (not b!766924) (not b!766935) (not b!766933) (not b!766922) (not b!766936) (not b!766937) (not start!66602) (not b!766920))
(check-sat)
