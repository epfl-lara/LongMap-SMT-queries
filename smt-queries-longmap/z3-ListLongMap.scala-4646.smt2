; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64628 () Bool)

(assert start!64628)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41094 0))(
  ( (array!41095 (arr!19667 (Array (_ BitVec 32) (_ BitVec 64))) (size!20088 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41094)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!728005 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!407524 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7264 0))(
  ( (MissingZero!7264 (index!31424 (_ BitVec 32))) (Found!7264 (index!31425 (_ BitVec 32))) (Intermediate!7264 (undefined!8076 Bool) (index!31426 (_ BitVec 32)) (x!62425 (_ BitVec 32))) (Undefined!7264) (MissingVacant!7264 (index!31427 (_ BitVec 32))) )
))
(declare-fun lt!322334 () SeekEntryResult!7264)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41094 (_ BitVec 32)) SeekEntryResult!7264)

(assert (=> b!728005 (= e!407524 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19667 a!3186) j!159) a!3186 mask!3328) lt!322334))))

(declare-fun b!728006 () Bool)

(declare-fun res!488686 () Bool)

(declare-fun e!407516 () Bool)

(assert (=> b!728006 (=> (not res!488686) (not e!407516))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!728006 (= res!488686 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20088 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20088 a!3186))))))

(declare-fun b!728007 () Bool)

(declare-fun res!488691 () Bool)

(assert (=> b!728007 (=> (not res!488691) (not e!407516))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41094 (_ BitVec 32)) Bool)

(assert (=> b!728007 (= res!488691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun e!407522 () Bool)

(declare-fun b!728008 () Bool)

(assert (=> b!728008 (= e!407522 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19667 a!3186) j!159) a!3186 mask!3328) (Found!7264 j!159)))))

(declare-fun b!728009 () Bool)

(declare-fun res!488680 () Bool)

(declare-fun e!407518 () Bool)

(assert (=> b!728009 (=> (not res!488680) (not e!407518))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728009 (= res!488680 (and (= (size!20088 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20088 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20088 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728010 () Bool)

(declare-fun res!488692 () Bool)

(declare-fun e!407521 () Bool)

(assert (=> b!728010 (=> (not res!488692) (not e!407521))))

(assert (=> b!728010 (= res!488692 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19667 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728011 () Bool)

(declare-fun res!488684 () Bool)

(assert (=> b!728011 (=> (not res!488684) (not e!407518))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41094 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728011 (= res!488684 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728012 () Bool)

(declare-fun res!488689 () Bool)

(assert (=> b!728012 (=> (not res!488689) (not e!407521))))

(assert (=> b!728012 (= res!488689 e!407522)))

(declare-fun c!80037 () Bool)

(assert (=> b!728012 (= c!80037 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728013 () Bool)

(assert (=> b!728013 (= e!407516 e!407521)))

(declare-fun res!488682 () Bool)

(assert (=> b!728013 (=> (not res!488682) (not e!407521))))

(declare-fun lt!322330 () SeekEntryResult!7264)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41094 (_ BitVec 32)) SeekEntryResult!7264)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728013 (= res!488682 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19667 a!3186) j!159) mask!3328) (select (arr!19667 a!3186) j!159) a!3186 mask!3328) lt!322330))))

(assert (=> b!728013 (= lt!322330 (Intermediate!7264 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728014 () Bool)

(declare-fun e!407520 () Bool)

(assert (=> b!728014 (= e!407520 e!407524)))

(declare-fun res!488679 () Bool)

(assert (=> b!728014 (=> (not res!488679) (not e!407524))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41094 (_ BitVec 32)) SeekEntryResult!7264)

(assert (=> b!728014 (= res!488679 (= (seekEntryOrOpen!0 (select (arr!19667 a!3186) j!159) a!3186 mask!3328) lt!322334))))

(assert (=> b!728014 (= lt!322334 (Found!7264 j!159))))

(declare-fun b!728015 () Bool)

(declare-fun e!407523 () Bool)

(assert (=> b!728015 (= e!407521 e!407523)))

(declare-fun res!488690 () Bool)

(assert (=> b!728015 (=> (not res!488690) (not e!407523))))

(declare-fun lt!322329 () SeekEntryResult!7264)

(declare-fun lt!322335 () SeekEntryResult!7264)

(assert (=> b!728015 (= res!488690 (= lt!322329 lt!322335))))

(declare-fun lt!322336 () array!41094)

(declare-fun lt!322331 () (_ BitVec 64))

(assert (=> b!728015 (= lt!322335 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322331 lt!322336 mask!3328))))

(assert (=> b!728015 (= lt!322329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322331 mask!3328) lt!322331 lt!322336 mask!3328))))

(assert (=> b!728015 (= lt!322331 (select (store (arr!19667 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728015 (= lt!322336 (array!41095 (store (arr!19667 a!3186) i!1173 k0!2102) (size!20088 a!3186)))))

(declare-fun b!728004 () Bool)

(assert (=> b!728004 (= e!407518 e!407516)))

(declare-fun res!488694 () Bool)

(assert (=> b!728004 (=> (not res!488694) (not e!407516))))

(declare-fun lt!322337 () SeekEntryResult!7264)

(assert (=> b!728004 (= res!488694 (or (= lt!322337 (MissingZero!7264 i!1173)) (= lt!322337 (MissingVacant!7264 i!1173))))))

(assert (=> b!728004 (= lt!322337 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!488681 () Bool)

(assert (=> start!64628 (=> (not res!488681) (not e!407518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64628 (= res!488681 (validMask!0 mask!3328))))

(assert (=> start!64628 e!407518))

(assert (=> start!64628 true))

(declare-fun array_inv!15550 (array!41094) Bool)

(assert (=> start!64628 (array_inv!15550 a!3186)))

(declare-fun b!728016 () Bool)

(declare-fun res!488688 () Bool)

(assert (=> b!728016 (=> (not res!488688) (not e!407518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728016 (= res!488688 (validKeyInArray!0 (select (arr!19667 a!3186) j!159)))))

(declare-fun b!728017 () Bool)

(declare-fun e!407517 () Bool)

(assert (=> b!728017 (= e!407517 true)))

(declare-fun lt!322332 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728017 (= lt!322332 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728018 () Bool)

(assert (=> b!728018 (= e!407523 (not e!407517))))

(declare-fun res!488693 () Bool)

(assert (=> b!728018 (=> res!488693 e!407517)))

(get-info :version)

(assert (=> b!728018 (= res!488693 (or (not ((_ is Intermediate!7264) lt!322335)) (bvsge x!1131 (x!62425 lt!322335))))))

(assert (=> b!728018 e!407520))

(declare-fun res!488685 () Bool)

(assert (=> b!728018 (=> (not res!488685) (not e!407520))))

(assert (=> b!728018 (= res!488685 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24818 0))(
  ( (Unit!24819) )
))
(declare-fun lt!322333 () Unit!24818)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41094 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24818)

(assert (=> b!728018 (= lt!322333 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728019 () Bool)

(assert (=> b!728019 (= e!407522 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19667 a!3186) j!159) a!3186 mask!3328) lt!322330))))

(declare-fun b!728020 () Bool)

(declare-fun res!488687 () Bool)

(assert (=> b!728020 (=> (not res!488687) (not e!407516))))

(declare-datatypes ((List!13708 0))(
  ( (Nil!13705) (Cons!13704 (h!14764 (_ BitVec 64)) (t!20014 List!13708)) )
))
(declare-fun arrayNoDuplicates!0 (array!41094 (_ BitVec 32) List!13708) Bool)

(assert (=> b!728020 (= res!488687 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13705))))

(declare-fun b!728021 () Bool)

(declare-fun res!488683 () Bool)

(assert (=> b!728021 (=> (not res!488683) (not e!407518))))

(assert (=> b!728021 (= res!488683 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64628 res!488681) b!728009))

(assert (= (and b!728009 res!488680) b!728016))

(assert (= (and b!728016 res!488688) b!728021))

(assert (= (and b!728021 res!488683) b!728011))

(assert (= (and b!728011 res!488684) b!728004))

(assert (= (and b!728004 res!488694) b!728007))

(assert (= (and b!728007 res!488691) b!728020))

(assert (= (and b!728020 res!488687) b!728006))

(assert (= (and b!728006 res!488686) b!728013))

(assert (= (and b!728013 res!488682) b!728010))

(assert (= (and b!728010 res!488692) b!728012))

(assert (= (and b!728012 c!80037) b!728019))

(assert (= (and b!728012 (not c!80037)) b!728008))

(assert (= (and b!728012 res!488689) b!728015))

(assert (= (and b!728015 res!488690) b!728018))

(assert (= (and b!728018 res!488685) b!728014))

(assert (= (and b!728014 res!488679) b!728005))

(assert (= (and b!728018 (not res!488693)) b!728017))

(declare-fun m!681269 () Bool)

(assert (=> b!728018 m!681269))

(declare-fun m!681271 () Bool)

(assert (=> b!728018 m!681271))

(declare-fun m!681273 () Bool)

(assert (=> b!728011 m!681273))

(declare-fun m!681275 () Bool)

(assert (=> b!728016 m!681275))

(assert (=> b!728016 m!681275))

(declare-fun m!681277 () Bool)

(assert (=> b!728016 m!681277))

(declare-fun m!681279 () Bool)

(assert (=> b!728017 m!681279))

(assert (=> b!728008 m!681275))

(assert (=> b!728008 m!681275))

(declare-fun m!681281 () Bool)

(assert (=> b!728008 m!681281))

(declare-fun m!681283 () Bool)

(assert (=> b!728004 m!681283))

(declare-fun m!681285 () Bool)

(assert (=> b!728007 m!681285))

(declare-fun m!681287 () Bool)

(assert (=> b!728021 m!681287))

(assert (=> b!728005 m!681275))

(assert (=> b!728005 m!681275))

(declare-fun m!681289 () Bool)

(assert (=> b!728005 m!681289))

(declare-fun m!681291 () Bool)

(assert (=> b!728020 m!681291))

(assert (=> b!728014 m!681275))

(assert (=> b!728014 m!681275))

(declare-fun m!681293 () Bool)

(assert (=> b!728014 m!681293))

(declare-fun m!681295 () Bool)

(assert (=> b!728015 m!681295))

(declare-fun m!681297 () Bool)

(assert (=> b!728015 m!681297))

(declare-fun m!681299 () Bool)

(assert (=> b!728015 m!681299))

(declare-fun m!681301 () Bool)

(assert (=> b!728015 m!681301))

(declare-fun m!681303 () Bool)

(assert (=> b!728015 m!681303))

(assert (=> b!728015 m!681301))

(assert (=> b!728019 m!681275))

(assert (=> b!728019 m!681275))

(declare-fun m!681305 () Bool)

(assert (=> b!728019 m!681305))

(declare-fun m!681307 () Bool)

(assert (=> start!64628 m!681307))

(declare-fun m!681309 () Bool)

(assert (=> start!64628 m!681309))

(declare-fun m!681311 () Bool)

(assert (=> b!728010 m!681311))

(assert (=> b!728013 m!681275))

(assert (=> b!728013 m!681275))

(declare-fun m!681313 () Bool)

(assert (=> b!728013 m!681313))

(assert (=> b!728013 m!681313))

(assert (=> b!728013 m!681275))

(declare-fun m!681315 () Bool)

(assert (=> b!728013 m!681315))

(check-sat (not b!728017) (not b!728007) (not b!728019) (not b!728021) (not b!728016) (not b!728015) (not start!64628) (not b!728020) (not b!728008) (not b!728011) (not b!728013) (not b!728014) (not b!728005) (not b!728004) (not b!728018))
(check-sat)
