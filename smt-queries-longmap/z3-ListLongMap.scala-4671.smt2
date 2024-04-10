; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64944 () Bool)

(assert start!64944)

(declare-fun b!733332 () Bool)

(declare-fun e!410322 () Bool)

(assert (=> b!733332 (= e!410322 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41255 0))(
  ( (array!41256 (arr!19744 (Array (_ BitVec 32) (_ BitVec 64))) (size!20165 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41255)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7344 0))(
  ( (MissingZero!7344 (index!31744 (_ BitVec 32))) (Found!7344 (index!31745 (_ BitVec 32))) (Intermediate!7344 (undefined!8156 Bool) (index!31746 (_ BitVec 32)) (x!62734 (_ BitVec 32))) (Undefined!7344) (MissingVacant!7344 (index!31747 (_ BitVec 32))) )
))
(declare-fun lt!325026 () SeekEntryResult!7344)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41255 (_ BitVec 32)) SeekEntryResult!7344)

(assert (=> b!733332 (= lt!325026 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19744 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!492843 () Bool)

(declare-fun e!410329 () Bool)

(assert (=> start!64944 (=> (not res!492843) (not e!410329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64944 (= res!492843 (validMask!0 mask!3328))))

(assert (=> start!64944 e!410329))

(assert (=> start!64944 true))

(declare-fun array_inv!15540 (array!41255) Bool)

(assert (=> start!64944 (array_inv!15540 a!3186)))

(declare-fun b!733333 () Bool)

(declare-fun e!410321 () Bool)

(declare-fun e!410330 () Bool)

(assert (=> b!733333 (= e!410321 e!410330)))

(declare-fun res!492842 () Bool)

(assert (=> b!733333 (=> (not res!492842) (not e!410330))))

(declare-fun lt!325028 () SeekEntryResult!7344)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41255 (_ BitVec 32)) SeekEntryResult!7344)

(assert (=> b!733333 (= res!492842 (= (seekEntryOrOpen!0 (select (arr!19744 a!3186) j!159) a!3186 mask!3328) lt!325028))))

(assert (=> b!733333 (= lt!325028 (Found!7344 j!159))))

(declare-fun b!733334 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!733334 (= e!410330 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19744 a!3186) j!159) a!3186 mask!3328) lt!325028))))

(declare-fun b!733335 () Bool)

(declare-fun e!410326 () Bool)

(declare-fun e!410325 () Bool)

(assert (=> b!733335 (= e!410326 e!410325)))

(declare-fun res!492833 () Bool)

(assert (=> b!733335 (=> (not res!492833) (not e!410325))))

(declare-fun lt!325019 () SeekEntryResult!7344)

(declare-fun lt!325025 () SeekEntryResult!7344)

(assert (=> b!733335 (= res!492833 (= lt!325019 lt!325025))))

(declare-fun lt!325023 () array!41255)

(declare-fun lt!325022 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41255 (_ BitVec 32)) SeekEntryResult!7344)

(assert (=> b!733335 (= lt!325025 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325022 lt!325023 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733335 (= lt!325019 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325022 mask!3328) lt!325022 lt!325023 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!733335 (= lt!325022 (select (store (arr!19744 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!733335 (= lt!325023 (array!41256 (store (arr!19744 a!3186) i!1173 k0!2102) (size!20165 a!3186)))))

(declare-fun b!733336 () Bool)

(declare-fun e!410327 () Bool)

(assert (=> b!733336 (= e!410327 e!410326)))

(declare-fun res!492832 () Bool)

(assert (=> b!733336 (=> (not res!492832) (not e!410326))))

(declare-fun lt!325020 () SeekEntryResult!7344)

(assert (=> b!733336 (= res!492832 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19744 a!3186) j!159) mask!3328) (select (arr!19744 a!3186) j!159) a!3186 mask!3328) lt!325020))))

(assert (=> b!733336 (= lt!325020 (Intermediate!7344 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733337 () Bool)

(declare-fun e!410323 () Bool)

(assert (=> b!733337 (= e!410323 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19744 a!3186) j!159) a!3186 mask!3328) lt!325020))))

(declare-fun b!733338 () Bool)

(declare-fun res!492844 () Bool)

(assert (=> b!733338 (=> (not res!492844) (not e!410326))))

(assert (=> b!733338 (= res!492844 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19744 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733339 () Bool)

(declare-fun res!492841 () Bool)

(assert (=> b!733339 (=> (not res!492841) (not e!410329))))

(assert (=> b!733339 (= res!492841 (and (= (size!20165 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20165 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20165 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!733340 () Bool)

(declare-fun res!492838 () Bool)

(assert (=> b!733340 (=> (not res!492838) (not e!410329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733340 (= res!492838 (validKeyInArray!0 (select (arr!19744 a!3186) j!159)))))

(declare-fun b!733341 () Bool)

(declare-fun res!492829 () Bool)

(assert (=> b!733341 (=> (not res!492829) (not e!410327))))

(assert (=> b!733341 (= res!492829 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20165 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20165 a!3186))))))

(declare-fun b!733342 () Bool)

(declare-fun res!492840 () Bool)

(assert (=> b!733342 (=> (not res!492840) (not e!410329))))

(declare-fun arrayContainsKey!0 (array!41255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733342 (= res!492840 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733343 () Bool)

(assert (=> b!733343 (= e!410323 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19744 a!3186) j!159) a!3186 mask!3328) (Found!7344 j!159)))))

(declare-fun b!733344 () Bool)

(declare-fun e!410324 () Bool)

(assert (=> b!733344 (= e!410324 e!410322)))

(declare-fun res!492830 () Bool)

(assert (=> b!733344 (=> res!492830 e!410322)))

(assert (=> b!733344 (= res!492830 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325027 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733344 (= lt!325027 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!733345 () Bool)

(assert (=> b!733345 (= e!410329 e!410327)))

(declare-fun res!492831 () Bool)

(assert (=> b!733345 (=> (not res!492831) (not e!410327))))

(declare-fun lt!325021 () SeekEntryResult!7344)

(assert (=> b!733345 (= res!492831 (or (= lt!325021 (MissingZero!7344 i!1173)) (= lt!325021 (MissingVacant!7344 i!1173))))))

(assert (=> b!733345 (= lt!325021 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!733346 () Bool)

(declare-fun res!492836 () Bool)

(assert (=> b!733346 (=> (not res!492836) (not e!410326))))

(assert (=> b!733346 (= res!492836 e!410323)))

(declare-fun c!80629 () Bool)

(assert (=> b!733346 (= c!80629 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!733347 () Bool)

(assert (=> b!733347 (= e!410325 (not e!410324))))

(declare-fun res!492837 () Bool)

(assert (=> b!733347 (=> res!492837 e!410324)))

(get-info :version)

(assert (=> b!733347 (= res!492837 (or (not ((_ is Intermediate!7344) lt!325025)) (bvsge x!1131 (x!62734 lt!325025))))))

(assert (=> b!733347 e!410321))

(declare-fun res!492835 () Bool)

(assert (=> b!733347 (=> (not res!492835) (not e!410321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41255 (_ BitVec 32)) Bool)

(assert (=> b!733347 (= res!492835 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25006 0))(
  ( (Unit!25007) )
))
(declare-fun lt!325024 () Unit!25006)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25006)

(assert (=> b!733347 (= lt!325024 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!733348 () Bool)

(declare-fun res!492845 () Bool)

(assert (=> b!733348 (=> (not res!492845) (not e!410329))))

(assert (=> b!733348 (= res!492845 (validKeyInArray!0 k0!2102))))

(declare-fun b!733349 () Bool)

(declare-fun res!492839 () Bool)

(assert (=> b!733349 (=> (not res!492839) (not e!410327))))

(assert (=> b!733349 (= res!492839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!733350 () Bool)

(declare-fun res!492834 () Bool)

(assert (=> b!733350 (=> (not res!492834) (not e!410327))))

(declare-datatypes ((List!13746 0))(
  ( (Nil!13743) (Cons!13742 (h!14808 (_ BitVec 64)) (t!20061 List!13746)) )
))
(declare-fun arrayNoDuplicates!0 (array!41255 (_ BitVec 32) List!13746) Bool)

(assert (=> b!733350 (= res!492834 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13743))))

(assert (= (and start!64944 res!492843) b!733339))

(assert (= (and b!733339 res!492841) b!733340))

(assert (= (and b!733340 res!492838) b!733348))

(assert (= (and b!733348 res!492845) b!733342))

(assert (= (and b!733342 res!492840) b!733345))

(assert (= (and b!733345 res!492831) b!733349))

(assert (= (and b!733349 res!492839) b!733350))

(assert (= (and b!733350 res!492834) b!733341))

(assert (= (and b!733341 res!492829) b!733336))

(assert (= (and b!733336 res!492832) b!733338))

(assert (= (and b!733338 res!492844) b!733346))

(assert (= (and b!733346 c!80629) b!733337))

(assert (= (and b!733346 (not c!80629)) b!733343))

(assert (= (and b!733346 res!492836) b!733335))

(assert (= (and b!733335 res!492833) b!733347))

(assert (= (and b!733347 res!492835) b!733333))

(assert (= (and b!733333 res!492842) b!733334))

(assert (= (and b!733347 (not res!492837)) b!733344))

(assert (= (and b!733344 (not res!492830)) b!733332))

(declare-fun m!686239 () Bool)

(assert (=> b!733343 m!686239))

(assert (=> b!733343 m!686239))

(declare-fun m!686241 () Bool)

(assert (=> b!733343 m!686241))

(assert (=> b!733334 m!686239))

(assert (=> b!733334 m!686239))

(declare-fun m!686243 () Bool)

(assert (=> b!733334 m!686243))

(declare-fun m!686245 () Bool)

(assert (=> b!733335 m!686245))

(declare-fun m!686247 () Bool)

(assert (=> b!733335 m!686247))

(declare-fun m!686249 () Bool)

(assert (=> b!733335 m!686249))

(declare-fun m!686251 () Bool)

(assert (=> b!733335 m!686251))

(assert (=> b!733335 m!686245))

(declare-fun m!686253 () Bool)

(assert (=> b!733335 m!686253))

(declare-fun m!686255 () Bool)

(assert (=> b!733345 m!686255))

(declare-fun m!686257 () Bool)

(assert (=> b!733350 m!686257))

(assert (=> b!733337 m!686239))

(assert (=> b!733337 m!686239))

(declare-fun m!686259 () Bool)

(assert (=> b!733337 m!686259))

(declare-fun m!686261 () Bool)

(assert (=> b!733347 m!686261))

(declare-fun m!686263 () Bool)

(assert (=> b!733347 m!686263))

(assert (=> b!733340 m!686239))

(assert (=> b!733340 m!686239))

(declare-fun m!686265 () Bool)

(assert (=> b!733340 m!686265))

(declare-fun m!686267 () Bool)

(assert (=> b!733348 m!686267))

(declare-fun m!686269 () Bool)

(assert (=> b!733338 m!686269))

(declare-fun m!686271 () Bool)

(assert (=> b!733344 m!686271))

(assert (=> b!733332 m!686239))

(assert (=> b!733332 m!686239))

(assert (=> b!733332 m!686241))

(assert (=> b!733336 m!686239))

(assert (=> b!733336 m!686239))

(declare-fun m!686273 () Bool)

(assert (=> b!733336 m!686273))

(assert (=> b!733336 m!686273))

(assert (=> b!733336 m!686239))

(declare-fun m!686275 () Bool)

(assert (=> b!733336 m!686275))

(assert (=> b!733333 m!686239))

(assert (=> b!733333 m!686239))

(declare-fun m!686277 () Bool)

(assert (=> b!733333 m!686277))

(declare-fun m!686279 () Bool)

(assert (=> b!733342 m!686279))

(declare-fun m!686281 () Bool)

(assert (=> start!64944 m!686281))

(declare-fun m!686283 () Bool)

(assert (=> start!64944 m!686283))

(declare-fun m!686285 () Bool)

(assert (=> b!733349 m!686285))

(check-sat (not b!733350) (not b!733349) (not b!733344) (not b!733333) (not b!733343) (not start!64944) (not b!733345) (not b!733334) (not b!733342) (not b!733332) (not b!733347) (not b!733336) (not b!733348) (not b!733335) (not b!733340) (not b!733337))
(check-sat)
