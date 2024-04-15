; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64478 () Bool)

(assert start!64478)

(declare-fun b!725524 () Bool)

(declare-fun e!406257 () Bool)

(declare-fun e!406255 () Bool)

(assert (=> b!725524 (= e!406257 e!406255)))

(declare-fun res!486726 () Bool)

(assert (=> b!725524 (=> (not res!486726) (not e!406255))))

(declare-datatypes ((array!41013 0))(
  ( (array!41014 (arr!19628 (Array (_ BitVec 32) (_ BitVec 64))) (size!20049 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41013)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7225 0))(
  ( (MissingZero!7225 (index!31268 (_ BitVec 32))) (Found!7225 (index!31269 (_ BitVec 32))) (Intermediate!7225 (undefined!8037 Bool) (index!31270 (_ BitVec 32)) (x!62270 (_ BitVec 32))) (Undefined!7225) (MissingVacant!7225 (index!31271 (_ BitVec 32))) )
))
(declare-fun lt!321225 () SeekEntryResult!7225)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41013 (_ BitVec 32)) SeekEntryResult!7225)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725524 (= res!486726 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19628 a!3186) j!159) mask!3328) (select (arr!19628 a!3186) j!159) a!3186 mask!3328) lt!321225))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725524 (= lt!321225 (Intermediate!7225 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725525 () Bool)

(declare-fun res!486731 () Bool)

(declare-fun e!406260 () Bool)

(assert (=> b!725525 (=> (not res!486731) (not e!406260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725525 (= res!486731 (validKeyInArray!0 (select (arr!19628 a!3186) j!159)))))

(declare-fun b!725526 () Bool)

(declare-fun res!486728 () Bool)

(assert (=> b!725526 (=> (not res!486728) (not e!406260))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!725526 (= res!486728 (validKeyInArray!0 k0!2102))))

(declare-fun b!725527 () Bool)

(assert (=> b!725527 (= e!406260 e!406257)))

(declare-fun res!486736 () Bool)

(assert (=> b!725527 (=> (not res!486736) (not e!406257))))

(declare-fun lt!321223 () SeekEntryResult!7225)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725527 (= res!486736 (or (= lt!321223 (MissingZero!7225 i!1173)) (= lt!321223 (MissingVacant!7225 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41013 (_ BitVec 32)) SeekEntryResult!7225)

(assert (=> b!725527 (= lt!321223 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!725528 () Bool)

(declare-fun e!406259 () Bool)

(assert (=> b!725528 (= e!406259 (not true))))

(declare-fun e!406256 () Bool)

(assert (=> b!725528 e!406256))

(declare-fun res!486730 () Bool)

(assert (=> b!725528 (=> (not res!486730) (not e!406256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41013 (_ BitVec 32)) Bool)

(assert (=> b!725528 (= res!486730 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24740 0))(
  ( (Unit!24741) )
))
(declare-fun lt!321226 () Unit!24740)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24740)

(assert (=> b!725528 (= lt!321226 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!406261 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!725529 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!725529 (= e!406261 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19628 a!3186) j!159) a!3186 mask!3328) lt!321225))))

(declare-fun b!725530 () Bool)

(declare-fun res!486727 () Bool)

(assert (=> b!725530 (=> (not res!486727) (not e!406257))))

(assert (=> b!725530 (= res!486727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725531 () Bool)

(assert (=> b!725531 (= e!406255 e!406259)))

(declare-fun res!486725 () Bool)

(assert (=> b!725531 (=> (not res!486725) (not e!406259))))

(declare-fun lt!321227 () (_ BitVec 64))

(declare-fun lt!321222 () array!41013)

(assert (=> b!725531 (= res!486725 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321227 mask!3328) lt!321227 lt!321222 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321227 lt!321222 mask!3328)))))

(assert (=> b!725531 (= lt!321227 (select (store (arr!19628 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725531 (= lt!321222 (array!41014 (store (arr!19628 a!3186) i!1173 k0!2102) (size!20049 a!3186)))))

(declare-fun b!725532 () Bool)

(declare-fun e!406258 () Bool)

(assert (=> b!725532 (= e!406256 e!406258)))

(declare-fun res!486729 () Bool)

(assert (=> b!725532 (=> (not res!486729) (not e!406258))))

(declare-fun lt!321224 () SeekEntryResult!7225)

(assert (=> b!725532 (= res!486729 (= (seekEntryOrOpen!0 (select (arr!19628 a!3186) j!159) a!3186 mask!3328) lt!321224))))

(assert (=> b!725532 (= lt!321224 (Found!7225 j!159))))

(declare-fun res!486738 () Bool)

(assert (=> start!64478 (=> (not res!486738) (not e!406260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64478 (= res!486738 (validMask!0 mask!3328))))

(assert (=> start!64478 e!406260))

(assert (=> start!64478 true))

(declare-fun array_inv!15511 (array!41013) Bool)

(assert (=> start!64478 (array_inv!15511 a!3186)))

(declare-fun b!725533 () Bool)

(declare-fun res!486735 () Bool)

(assert (=> b!725533 (=> (not res!486735) (not e!406260))))

(declare-fun arrayContainsKey!0 (array!41013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725533 (= res!486735 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725534 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41013 (_ BitVec 32)) SeekEntryResult!7225)

(assert (=> b!725534 (= e!406258 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19628 a!3186) j!159) a!3186 mask!3328) lt!321224))))

(declare-fun b!725535 () Bool)

(declare-fun res!486724 () Bool)

(assert (=> b!725535 (=> (not res!486724) (not e!406255))))

(assert (=> b!725535 (= res!486724 e!406261)))

(declare-fun c!79773 () Bool)

(assert (=> b!725535 (= c!79773 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725536 () Bool)

(declare-fun res!486733 () Bool)

(assert (=> b!725536 (=> (not res!486733) (not e!406260))))

(assert (=> b!725536 (= res!486733 (and (= (size!20049 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20049 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20049 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725537 () Bool)

(declare-fun res!486734 () Bool)

(assert (=> b!725537 (=> (not res!486734) (not e!406257))))

(assert (=> b!725537 (= res!486734 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20049 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20049 a!3186))))))

(declare-fun b!725538 () Bool)

(declare-fun res!486737 () Bool)

(assert (=> b!725538 (=> (not res!486737) (not e!406257))))

(declare-datatypes ((List!13669 0))(
  ( (Nil!13666) (Cons!13665 (h!14722 (_ BitVec 64)) (t!19975 List!13669)) )
))
(declare-fun arrayNoDuplicates!0 (array!41013 (_ BitVec 32) List!13669) Bool)

(assert (=> b!725538 (= res!486737 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13666))))

(declare-fun b!725539 () Bool)

(assert (=> b!725539 (= e!406261 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19628 a!3186) j!159) a!3186 mask!3328) (Found!7225 j!159)))))

(declare-fun b!725540 () Bool)

(declare-fun res!486732 () Bool)

(assert (=> b!725540 (=> (not res!486732) (not e!406255))))

(assert (=> b!725540 (= res!486732 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19628 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64478 res!486738) b!725536))

(assert (= (and b!725536 res!486733) b!725525))

(assert (= (and b!725525 res!486731) b!725526))

(assert (= (and b!725526 res!486728) b!725533))

(assert (= (and b!725533 res!486735) b!725527))

(assert (= (and b!725527 res!486736) b!725530))

(assert (= (and b!725530 res!486727) b!725538))

(assert (= (and b!725538 res!486737) b!725537))

(assert (= (and b!725537 res!486734) b!725524))

(assert (= (and b!725524 res!486726) b!725540))

(assert (= (and b!725540 res!486732) b!725535))

(assert (= (and b!725535 c!79773) b!725529))

(assert (= (and b!725535 (not c!79773)) b!725539))

(assert (= (and b!725535 res!486724) b!725531))

(assert (= (and b!725531 res!486725) b!725528))

(assert (= (and b!725528 res!486730) b!725532))

(assert (= (and b!725532 res!486729) b!725534))

(declare-fun m!679145 () Bool)

(assert (=> b!725529 m!679145))

(assert (=> b!725529 m!679145))

(declare-fun m!679147 () Bool)

(assert (=> b!725529 m!679147))

(declare-fun m!679149 () Bool)

(assert (=> b!725528 m!679149))

(declare-fun m!679151 () Bool)

(assert (=> b!725528 m!679151))

(declare-fun m!679153 () Bool)

(assert (=> b!725531 m!679153))

(declare-fun m!679155 () Bool)

(assert (=> b!725531 m!679155))

(declare-fun m!679157 () Bool)

(assert (=> b!725531 m!679157))

(declare-fun m!679159 () Bool)

(assert (=> b!725531 m!679159))

(declare-fun m!679161 () Bool)

(assert (=> b!725531 m!679161))

(assert (=> b!725531 m!679157))

(assert (=> b!725524 m!679145))

(assert (=> b!725524 m!679145))

(declare-fun m!679163 () Bool)

(assert (=> b!725524 m!679163))

(assert (=> b!725524 m!679163))

(assert (=> b!725524 m!679145))

(declare-fun m!679165 () Bool)

(assert (=> b!725524 m!679165))

(declare-fun m!679167 () Bool)

(assert (=> b!725540 m!679167))

(declare-fun m!679169 () Bool)

(assert (=> b!725533 m!679169))

(declare-fun m!679171 () Bool)

(assert (=> b!725538 m!679171))

(declare-fun m!679173 () Bool)

(assert (=> b!725530 m!679173))

(assert (=> b!725532 m!679145))

(assert (=> b!725532 m!679145))

(declare-fun m!679175 () Bool)

(assert (=> b!725532 m!679175))

(assert (=> b!725539 m!679145))

(assert (=> b!725539 m!679145))

(declare-fun m!679177 () Bool)

(assert (=> b!725539 m!679177))

(assert (=> b!725525 m!679145))

(assert (=> b!725525 m!679145))

(declare-fun m!679179 () Bool)

(assert (=> b!725525 m!679179))

(declare-fun m!679181 () Bool)

(assert (=> b!725527 m!679181))

(declare-fun m!679183 () Bool)

(assert (=> b!725526 m!679183))

(assert (=> b!725534 m!679145))

(assert (=> b!725534 m!679145))

(declare-fun m!679185 () Bool)

(assert (=> b!725534 m!679185))

(declare-fun m!679187 () Bool)

(assert (=> start!64478 m!679187))

(declare-fun m!679189 () Bool)

(assert (=> start!64478 m!679189))

(check-sat (not b!725534) (not b!725538) (not b!725528) (not b!725524) (not b!725529) (not b!725527) (not b!725526) (not start!64478) (not b!725525) (not b!725533) (not b!725530) (not b!725539) (not b!725531) (not b!725532))
(check-sat)
