; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67156 () Bool)

(assert start!67156)

(declare-fun b!776218 () Bool)

(declare-fun e!431959 () Bool)

(declare-fun e!431956 () Bool)

(assert (=> b!776218 (= e!431959 e!431956)))

(declare-fun res!525053 () Bool)

(assert (=> b!776218 (=> (not res!525053) (not e!431956))))

(declare-datatypes ((SeekEntryResult!7951 0))(
  ( (MissingZero!7951 (index!34172 (_ BitVec 32))) (Found!7951 (index!34173 (_ BitVec 32))) (Intermediate!7951 (undefined!8763 Bool) (index!34174 (_ BitVec 32)) (x!65110 (_ BitVec 32))) (Undefined!7951) (MissingVacant!7951 (index!34175 (_ BitVec 32))) )
))
(declare-fun lt!345816 () SeekEntryResult!7951)

(declare-fun lt!345814 () SeekEntryResult!7951)

(assert (=> b!776218 (= res!525053 (= lt!345816 lt!345814))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!42511 0))(
  ( (array!42512 (arr!20351 (Array (_ BitVec 32) (_ BitVec 64))) (size!20772 (_ BitVec 32))) )
))
(declare-fun lt!345813 () array!42511)

(declare-fun lt!345812 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42511 (_ BitVec 32)) SeekEntryResult!7951)

(assert (=> b!776218 (= lt!345814 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345812 lt!345813 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776218 (= lt!345816 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345812 mask!3328) lt!345812 lt!345813 mask!3328))))

(declare-fun a!3186 () array!42511)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!776218 (= lt!345812 (select (store (arr!20351 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!776218 (= lt!345813 (array!42512 (store (arr!20351 a!3186) i!1173 k!2102) (size!20772 a!3186)))))

(declare-fun b!776219 () Bool)

(declare-fun e!431958 () Bool)

(declare-fun e!431960 () Bool)

(assert (=> b!776219 (= e!431958 e!431960)))

(declare-fun res!525046 () Bool)

(assert (=> b!776219 (=> (not res!525046) (not e!431960))))

(declare-fun lt!345815 () SeekEntryResult!7951)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42511 (_ BitVec 32)) SeekEntryResult!7951)

(assert (=> b!776219 (= res!525046 (= (seekEntryOrOpen!0 (select (arr!20351 a!3186) j!159) a!3186 mask!3328) lt!345815))))

(assert (=> b!776219 (= lt!345815 (Found!7951 j!159))))

(declare-fun b!776220 () Bool)

(declare-fun res!525049 () Bool)

(declare-fun e!431955 () Bool)

(assert (=> b!776220 (=> (not res!525049) (not e!431955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776220 (= res!525049 (validKeyInArray!0 k!2102))))

(declare-fun b!776222 () Bool)

(declare-fun e!431961 () Bool)

(assert (=> b!776222 (= e!431956 (not e!431961))))

(declare-fun res!525047 () Bool)

(assert (=> b!776222 (=> res!525047 e!431961)))

(assert (=> b!776222 (= res!525047 (or (not (is-Intermediate!7951 lt!345814)) (bvslt x!1131 (x!65110 lt!345814)) (not (= x!1131 (x!65110 lt!345814))) (not (= index!1321 (index!34174 lt!345814)))))))

(assert (=> b!776222 e!431958))

(declare-fun res!525051 () Bool)

(assert (=> b!776222 (=> (not res!525051) (not e!431958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42511 (_ BitVec 32)) Bool)

(assert (=> b!776222 (= res!525051 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26796 0))(
  ( (Unit!26797) )
))
(declare-fun lt!345817 () Unit!26796)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26796)

(assert (=> b!776222 (= lt!345817 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!776223 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42511 (_ BitVec 32)) SeekEntryResult!7951)

(assert (=> b!776223 (= e!431960 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20351 a!3186) j!159) a!3186 mask!3328) lt!345815))))

(declare-fun b!776224 () Bool)

(declare-fun res!525050 () Bool)

(declare-fun e!431963 () Bool)

(assert (=> b!776224 (=> (not res!525050) (not e!431963))))

(assert (=> b!776224 (= res!525050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776225 () Bool)

(declare-fun e!431957 () Bool)

(declare-fun lt!345818 () SeekEntryResult!7951)

(assert (=> b!776225 (= e!431957 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20351 a!3186) j!159) a!3186 mask!3328) lt!345818))))

(declare-fun b!776226 () Bool)

(declare-fun res!525048 () Bool)

(assert (=> b!776226 (=> (not res!525048) (not e!431959))))

(assert (=> b!776226 (= res!525048 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20351 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776227 () Bool)

(declare-fun res!525054 () Bool)

(assert (=> b!776227 (=> (not res!525054) (not e!431955))))

(assert (=> b!776227 (= res!525054 (validKeyInArray!0 (select (arr!20351 a!3186) j!159)))))

(declare-fun b!776228 () Bool)

(declare-fun res!525059 () Bool)

(assert (=> b!776228 (=> (not res!525059) (not e!431963))))

(assert (=> b!776228 (= res!525059 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20772 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20772 a!3186))))))

(declare-fun b!776229 () Bool)

(declare-fun res!525044 () Bool)

(assert (=> b!776229 (=> (not res!525044) (not e!431955))))

(declare-fun arrayContainsKey!0 (array!42511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776229 (= res!525044 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!525052 () Bool)

(assert (=> start!67156 (=> (not res!525052) (not e!431955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67156 (= res!525052 (validMask!0 mask!3328))))

(assert (=> start!67156 e!431955))

(assert (=> start!67156 true))

(declare-fun array_inv!16147 (array!42511) Bool)

(assert (=> start!67156 (array_inv!16147 a!3186)))

(declare-fun b!776221 () Bool)

(declare-fun res!525056 () Bool)

(assert (=> b!776221 (=> (not res!525056) (not e!431955))))

(assert (=> b!776221 (= res!525056 (and (= (size!20772 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20772 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20772 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776230 () Bool)

(assert (=> b!776230 (= e!431955 e!431963)))

(declare-fun res!525057 () Bool)

(assert (=> b!776230 (=> (not res!525057) (not e!431963))))

(declare-fun lt!345810 () SeekEntryResult!7951)

(assert (=> b!776230 (= res!525057 (or (= lt!345810 (MissingZero!7951 i!1173)) (= lt!345810 (MissingVacant!7951 i!1173))))))

(assert (=> b!776230 (= lt!345810 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!776231 () Bool)

(declare-fun res!525055 () Bool)

(assert (=> b!776231 (=> (not res!525055) (not e!431963))))

(declare-datatypes ((List!14353 0))(
  ( (Nil!14350) (Cons!14349 (h!15457 (_ BitVec 64)) (t!20668 List!14353)) )
))
(declare-fun arrayNoDuplicates!0 (array!42511 (_ BitVec 32) List!14353) Bool)

(assert (=> b!776231 (= res!525055 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14350))))

(declare-fun b!776232 () Bool)

(assert (=> b!776232 (= e!431957 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20351 a!3186) j!159) a!3186 mask!3328) (Found!7951 j!159)))))

(declare-fun b!776233 () Bool)

(declare-fun res!525058 () Bool)

(assert (=> b!776233 (=> (not res!525058) (not e!431959))))

(assert (=> b!776233 (= res!525058 e!431957)))

(declare-fun c!85987 () Bool)

(assert (=> b!776233 (= c!85987 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776234 () Bool)

(assert (=> b!776234 (= e!431963 e!431959)))

(declare-fun res!525045 () Bool)

(assert (=> b!776234 (=> (not res!525045) (not e!431959))))

(assert (=> b!776234 (= res!525045 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20351 a!3186) j!159) mask!3328) (select (arr!20351 a!3186) j!159) a!3186 mask!3328) lt!345818))))

(assert (=> b!776234 (= lt!345818 (Intermediate!7951 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776235 () Bool)

(assert (=> b!776235 (= e!431961 true)))

(declare-fun lt!345811 () SeekEntryResult!7951)

(assert (=> b!776235 (= lt!345811 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20351 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and start!67156 res!525052) b!776221))

(assert (= (and b!776221 res!525056) b!776227))

(assert (= (and b!776227 res!525054) b!776220))

(assert (= (and b!776220 res!525049) b!776229))

(assert (= (and b!776229 res!525044) b!776230))

(assert (= (and b!776230 res!525057) b!776224))

(assert (= (and b!776224 res!525050) b!776231))

(assert (= (and b!776231 res!525055) b!776228))

(assert (= (and b!776228 res!525059) b!776234))

(assert (= (and b!776234 res!525045) b!776226))

(assert (= (and b!776226 res!525048) b!776233))

(assert (= (and b!776233 c!85987) b!776225))

(assert (= (and b!776233 (not c!85987)) b!776232))

(assert (= (and b!776233 res!525058) b!776218))

(assert (= (and b!776218 res!525053) b!776222))

(assert (= (and b!776222 res!525051) b!776219))

(assert (= (and b!776219 res!525046) b!776223))

(assert (= (and b!776222 (not res!525047)) b!776235))

(declare-fun m!720331 () Bool)

(assert (=> b!776226 m!720331))

(declare-fun m!720333 () Bool)

(assert (=> start!67156 m!720333))

(declare-fun m!720335 () Bool)

(assert (=> start!67156 m!720335))

(declare-fun m!720337 () Bool)

(assert (=> b!776235 m!720337))

(assert (=> b!776235 m!720337))

(declare-fun m!720339 () Bool)

(assert (=> b!776235 m!720339))

(assert (=> b!776225 m!720337))

(assert (=> b!776225 m!720337))

(declare-fun m!720341 () Bool)

(assert (=> b!776225 m!720341))

(assert (=> b!776227 m!720337))

(assert (=> b!776227 m!720337))

(declare-fun m!720343 () Bool)

(assert (=> b!776227 m!720343))

(declare-fun m!720345 () Bool)

(assert (=> b!776231 m!720345))

(declare-fun m!720347 () Bool)

(assert (=> b!776220 m!720347))

(assert (=> b!776219 m!720337))

(assert (=> b!776219 m!720337))

(declare-fun m!720349 () Bool)

(assert (=> b!776219 m!720349))

(assert (=> b!776223 m!720337))

(assert (=> b!776223 m!720337))

(declare-fun m!720351 () Bool)

(assert (=> b!776223 m!720351))

(declare-fun m!720353 () Bool)

(assert (=> b!776229 m!720353))

(declare-fun m!720355 () Bool)

(assert (=> b!776218 m!720355))

(declare-fun m!720357 () Bool)

(assert (=> b!776218 m!720357))

(declare-fun m!720359 () Bool)

(assert (=> b!776218 m!720359))

(assert (=> b!776218 m!720355))

(declare-fun m!720361 () Bool)

(assert (=> b!776218 m!720361))

(declare-fun m!720363 () Bool)

(assert (=> b!776218 m!720363))

(assert (=> b!776232 m!720337))

(assert (=> b!776232 m!720337))

(assert (=> b!776232 m!720339))

(declare-fun m!720365 () Bool)

(assert (=> b!776222 m!720365))

(declare-fun m!720367 () Bool)

(assert (=> b!776222 m!720367))

(declare-fun m!720369 () Bool)

(assert (=> b!776230 m!720369))

(declare-fun m!720371 () Bool)

(assert (=> b!776224 m!720371))

(assert (=> b!776234 m!720337))

(assert (=> b!776234 m!720337))

(declare-fun m!720373 () Bool)

(assert (=> b!776234 m!720373))

(assert (=> b!776234 m!720373))

(assert (=> b!776234 m!720337))

(declare-fun m!720375 () Bool)

(assert (=> b!776234 m!720375))

(push 1)

