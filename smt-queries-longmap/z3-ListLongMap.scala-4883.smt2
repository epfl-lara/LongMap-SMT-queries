; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67346 () Bool)

(assert start!67346)

(declare-fun b!778744 () Bool)

(declare-fun e!433264 () Bool)

(declare-fun e!433268 () Bool)

(assert (=> b!778744 (= e!433264 e!433268)))

(declare-fun res!526786 () Bool)

(assert (=> b!778744 (=> (not res!526786) (not e!433268))))

(declare-datatypes ((SeekEntryResult!7980 0))(
  ( (MissingZero!7980 (index!34288 (_ BitVec 32))) (Found!7980 (index!34289 (_ BitVec 32))) (Intermediate!7980 (undefined!8792 Bool) (index!34290 (_ BitVec 32)) (x!65237 (_ BitVec 32))) (Undefined!7980) (MissingVacant!7980 (index!34291 (_ BitVec 32))) )
))
(declare-fun lt!346946 () SeekEntryResult!7980)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!778744 (= res!526786 (or (= lt!346946 (MissingZero!7980 i!1173)) (= lt!346946 (MissingVacant!7980 i!1173))))))

(declare-datatypes ((array!42575 0))(
  ( (array!42576 (arr!20380 (Array (_ BitVec 32) (_ BitVec 64))) (size!20801 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42575)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42575 (_ BitVec 32)) SeekEntryResult!7980)

(assert (=> b!778744 (= lt!346946 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!778745 () Bool)

(declare-fun e!433265 () Bool)

(assert (=> b!778745 (= e!433265 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!346943 () SeekEntryResult!7980)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42575 (_ BitVec 32)) SeekEntryResult!7980)

(assert (=> b!778745 (= lt!346943 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20380 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778746 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!433263 () Bool)

(declare-fun lt!346941 () SeekEntryResult!7980)

(assert (=> b!778746 (= e!433263 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20380 a!3186) j!159) a!3186 mask!3328) lt!346941))))

(declare-fun b!778747 () Bool)

(declare-fun res!526781 () Bool)

(declare-fun e!433260 () Bool)

(assert (=> b!778747 (=> (not res!526781) (not e!433260))))

(assert (=> b!778747 (= res!526781 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20380 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778748 () Bool)

(declare-fun e!433261 () Bool)

(assert (=> b!778748 (= e!433261 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20380 a!3186) j!159) a!3186 mask!3328) (Found!7980 j!159)))))

(declare-fun b!778749 () Bool)

(declare-fun e!433267 () Bool)

(assert (=> b!778749 (= e!433260 e!433267)))

(declare-fun res!526793 () Bool)

(assert (=> b!778749 (=> (not res!526793) (not e!433267))))

(declare-fun lt!346942 () SeekEntryResult!7980)

(declare-fun lt!346949 () SeekEntryResult!7980)

(assert (=> b!778749 (= res!526793 (= lt!346942 lt!346949))))

(declare-fun lt!346944 () array!42575)

(declare-fun lt!346945 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42575 (_ BitVec 32)) SeekEntryResult!7980)

(assert (=> b!778749 (= lt!346949 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346945 lt!346944 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778749 (= lt!346942 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346945 mask!3328) lt!346945 lt!346944 mask!3328))))

(assert (=> b!778749 (= lt!346945 (select (store (arr!20380 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!778749 (= lt!346944 (array!42576 (store (arr!20380 a!3186) i!1173 k0!2102) (size!20801 a!3186)))))

(declare-fun b!778750 () Bool)

(declare-fun res!526788 () Bool)

(assert (=> b!778750 (=> (not res!526788) (not e!433268))))

(assert (=> b!778750 (= res!526788 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20801 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20801 a!3186))))))

(declare-fun b!778751 () Bool)

(assert (=> b!778751 (= e!433267 (not e!433265))))

(declare-fun res!526792 () Bool)

(assert (=> b!778751 (=> res!526792 e!433265)))

(get-info :version)

(assert (=> b!778751 (= res!526792 (or (not ((_ is Intermediate!7980) lt!346949)) (bvslt x!1131 (x!65237 lt!346949)) (not (= x!1131 (x!65237 lt!346949))) (not (= index!1321 (index!34290 lt!346949)))))))

(declare-fun e!433266 () Bool)

(assert (=> b!778751 e!433266))

(declare-fun res!526778 () Bool)

(assert (=> b!778751 (=> (not res!526778) (not e!433266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42575 (_ BitVec 32)) Bool)

(assert (=> b!778751 (= res!526778 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26854 0))(
  ( (Unit!26855) )
))
(declare-fun lt!346948 () Unit!26854)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42575 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26854)

(assert (=> b!778751 (= lt!346948 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!778752 () Bool)

(declare-fun res!526785 () Bool)

(assert (=> b!778752 (=> (not res!526785) (not e!433268))))

(declare-datatypes ((List!14382 0))(
  ( (Nil!14379) (Cons!14378 (h!15492 (_ BitVec 64)) (t!20697 List!14382)) )
))
(declare-fun arrayNoDuplicates!0 (array!42575 (_ BitVec 32) List!14382) Bool)

(assert (=> b!778752 (= res!526785 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14379))))

(declare-fun b!778753 () Bool)

(declare-fun res!526782 () Bool)

(assert (=> b!778753 (=> (not res!526782) (not e!433264))))

(assert (=> b!778753 (= res!526782 (and (= (size!20801 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20801 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20801 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!778754 () Bool)

(assert (=> b!778754 (= e!433268 e!433260)))

(declare-fun res!526790 () Bool)

(assert (=> b!778754 (=> (not res!526790) (not e!433260))))

(declare-fun lt!346947 () SeekEntryResult!7980)

(assert (=> b!778754 (= res!526790 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20380 a!3186) j!159) mask!3328) (select (arr!20380 a!3186) j!159) a!3186 mask!3328) lt!346947))))

(assert (=> b!778754 (= lt!346947 (Intermediate!7980 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!778755 () Bool)

(declare-fun res!526789 () Bool)

(assert (=> b!778755 (=> (not res!526789) (not e!433264))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778755 (= res!526789 (validKeyInArray!0 (select (arr!20380 a!3186) j!159)))))

(declare-fun b!778756 () Bool)

(declare-fun res!526783 () Bool)

(assert (=> b!778756 (=> (not res!526783) (not e!433264))))

(assert (=> b!778756 (= res!526783 (validKeyInArray!0 k0!2102))))

(declare-fun res!526791 () Bool)

(assert (=> start!67346 (=> (not res!526791) (not e!433264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67346 (= res!526791 (validMask!0 mask!3328))))

(assert (=> start!67346 e!433264))

(assert (=> start!67346 true))

(declare-fun array_inv!16176 (array!42575) Bool)

(assert (=> start!67346 (array_inv!16176 a!3186)))

(declare-fun b!778757 () Bool)

(declare-fun res!526780 () Bool)

(assert (=> b!778757 (=> (not res!526780) (not e!433260))))

(assert (=> b!778757 (= res!526780 e!433261)))

(declare-fun c!86386 () Bool)

(assert (=> b!778757 (= c!86386 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778758 () Bool)

(declare-fun res!526779 () Bool)

(assert (=> b!778758 (=> (not res!526779) (not e!433264))))

(declare-fun arrayContainsKey!0 (array!42575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778758 (= res!526779 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!778759 () Bool)

(assert (=> b!778759 (= e!433261 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20380 a!3186) j!159) a!3186 mask!3328) lt!346947))))

(declare-fun b!778760 () Bool)

(assert (=> b!778760 (= e!433266 e!433263)))

(declare-fun res!526784 () Bool)

(assert (=> b!778760 (=> (not res!526784) (not e!433263))))

(assert (=> b!778760 (= res!526784 (= (seekEntryOrOpen!0 (select (arr!20380 a!3186) j!159) a!3186 mask!3328) lt!346941))))

(assert (=> b!778760 (= lt!346941 (Found!7980 j!159))))

(declare-fun b!778761 () Bool)

(declare-fun res!526787 () Bool)

(assert (=> b!778761 (=> (not res!526787) (not e!433268))))

(assert (=> b!778761 (= res!526787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67346 res!526791) b!778753))

(assert (= (and b!778753 res!526782) b!778755))

(assert (= (and b!778755 res!526789) b!778756))

(assert (= (and b!778756 res!526783) b!778758))

(assert (= (and b!778758 res!526779) b!778744))

(assert (= (and b!778744 res!526786) b!778761))

(assert (= (and b!778761 res!526787) b!778752))

(assert (= (and b!778752 res!526785) b!778750))

(assert (= (and b!778750 res!526788) b!778754))

(assert (= (and b!778754 res!526790) b!778747))

(assert (= (and b!778747 res!526781) b!778757))

(assert (= (and b!778757 c!86386) b!778759))

(assert (= (and b!778757 (not c!86386)) b!778748))

(assert (= (and b!778757 res!526780) b!778749))

(assert (= (and b!778749 res!526793) b!778751))

(assert (= (and b!778751 res!526778) b!778760))

(assert (= (and b!778760 res!526784) b!778746))

(assert (= (and b!778751 (not res!526792)) b!778745))

(declare-fun m!722349 () Bool)

(assert (=> b!778751 m!722349))

(declare-fun m!722351 () Bool)

(assert (=> b!778751 m!722351))

(declare-fun m!722353 () Bool)

(assert (=> b!778752 m!722353))

(declare-fun m!722355 () Bool)

(assert (=> b!778759 m!722355))

(assert (=> b!778759 m!722355))

(declare-fun m!722357 () Bool)

(assert (=> b!778759 m!722357))

(declare-fun m!722359 () Bool)

(assert (=> b!778747 m!722359))

(assert (=> b!778754 m!722355))

(assert (=> b!778754 m!722355))

(declare-fun m!722361 () Bool)

(assert (=> b!778754 m!722361))

(assert (=> b!778754 m!722361))

(assert (=> b!778754 m!722355))

(declare-fun m!722363 () Bool)

(assert (=> b!778754 m!722363))

(assert (=> b!778760 m!722355))

(assert (=> b!778760 m!722355))

(declare-fun m!722365 () Bool)

(assert (=> b!778760 m!722365))

(declare-fun m!722367 () Bool)

(assert (=> b!778749 m!722367))

(declare-fun m!722369 () Bool)

(assert (=> b!778749 m!722369))

(declare-fun m!722371 () Bool)

(assert (=> b!778749 m!722371))

(declare-fun m!722373 () Bool)

(assert (=> b!778749 m!722373))

(declare-fun m!722375 () Bool)

(assert (=> b!778749 m!722375))

(assert (=> b!778749 m!722367))

(assert (=> b!778748 m!722355))

(assert (=> b!778748 m!722355))

(declare-fun m!722377 () Bool)

(assert (=> b!778748 m!722377))

(assert (=> b!778746 m!722355))

(assert (=> b!778746 m!722355))

(declare-fun m!722379 () Bool)

(assert (=> b!778746 m!722379))

(declare-fun m!722381 () Bool)

(assert (=> b!778744 m!722381))

(declare-fun m!722383 () Bool)

(assert (=> b!778761 m!722383))

(declare-fun m!722385 () Bool)

(assert (=> start!67346 m!722385))

(declare-fun m!722387 () Bool)

(assert (=> start!67346 m!722387))

(assert (=> b!778755 m!722355))

(assert (=> b!778755 m!722355))

(declare-fun m!722389 () Bool)

(assert (=> b!778755 m!722389))

(declare-fun m!722391 () Bool)

(assert (=> b!778758 m!722391))

(declare-fun m!722393 () Bool)

(assert (=> b!778756 m!722393))

(assert (=> b!778745 m!722355))

(assert (=> b!778745 m!722355))

(assert (=> b!778745 m!722377))

(check-sat (not b!778748) (not b!778754) (not b!778749) (not b!778751) (not b!778752) (not b!778760) (not b!778755) (not b!778745) (not b!778756) (not b!778746) (not b!778758) (not b!778744) (not start!67346) (not b!778759) (not b!778761))
(check-sat)
