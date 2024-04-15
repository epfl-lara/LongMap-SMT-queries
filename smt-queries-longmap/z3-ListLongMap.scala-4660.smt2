; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64712 () Bool)

(assert start!64712)

(declare-fun b!730272 () Bool)

(declare-fun res!490697 () Bool)

(declare-fun e!408653 () Bool)

(assert (=> b!730272 (=> (not res!490697) (not e!408653))))

(declare-datatypes ((array!41178 0))(
  ( (array!41179 (arr!19709 (Array (_ BitVec 32) (_ BitVec 64))) (size!20130 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41178)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!730272 (= res!490697 (and (= (size!20130 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20130 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20130 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!408654 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!730273 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7306 0))(
  ( (MissingZero!7306 (index!31592 (_ BitVec 32))) (Found!7306 (index!31593 (_ BitVec 32))) (Intermediate!7306 (undefined!8118 Bool) (index!31594 (_ BitVec 32)) (x!62579 (_ BitVec 32))) (Undefined!7306) (MissingVacant!7306 (index!31595 (_ BitVec 32))) )
))
(declare-fun lt!323463 () SeekEntryResult!7306)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41178 (_ BitVec 32)) SeekEntryResult!7306)

(assert (=> b!730273 (= e!408654 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19709 a!3186) j!159) a!3186 mask!3328) lt!323463))))

(declare-fun res!490709 () Bool)

(assert (=> start!64712 (=> (not res!490709) (not e!408653))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64712 (= res!490709 (validMask!0 mask!3328))))

(assert (=> start!64712 e!408653))

(assert (=> start!64712 true))

(declare-fun array_inv!15592 (array!41178) Bool)

(assert (=> start!64712 (array_inv!15592 a!3186)))

(declare-fun b!730274 () Bool)

(declare-fun e!408652 () Bool)

(assert (=> b!730274 (= e!408652 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!323468 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730274 (= lt!323468 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730275 () Bool)

(declare-fun res!490705 () Bool)

(declare-fun e!408650 () Bool)

(assert (=> b!730275 (=> (not res!490705) (not e!408650))))

(assert (=> b!730275 (= res!490705 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20130 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20130 a!3186))))))

(declare-fun b!730276 () Bool)

(declare-fun res!490702 () Bool)

(assert (=> b!730276 (=> (not res!490702) (not e!408653))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730276 (= res!490702 (validKeyInArray!0 (select (arr!19709 a!3186) j!159)))))

(declare-fun b!730277 () Bool)

(assert (=> b!730277 (= e!408653 e!408650)))

(declare-fun res!490708 () Bool)

(assert (=> b!730277 (=> (not res!490708) (not e!408650))))

(declare-fun lt!323466 () SeekEntryResult!7306)

(assert (=> b!730277 (= res!490708 (or (= lt!323466 (MissingZero!7306 i!1173)) (= lt!323466 (MissingVacant!7306 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41178 (_ BitVec 32)) SeekEntryResult!7306)

(assert (=> b!730277 (= lt!323466 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!730278 () Bool)

(declare-fun e!408656 () Bool)

(assert (=> b!730278 (= e!408650 e!408656)))

(declare-fun res!490701 () Bool)

(assert (=> b!730278 (=> (not res!490701) (not e!408656))))

(declare-fun lt!323469 () SeekEntryResult!7306)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41178 (_ BitVec 32)) SeekEntryResult!7306)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730278 (= res!490701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19709 a!3186) j!159) mask!3328) (select (arr!19709 a!3186) j!159) a!3186 mask!3328) lt!323469))))

(assert (=> b!730278 (= lt!323469 (Intermediate!7306 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730279 () Bool)

(declare-fun res!490698 () Bool)

(assert (=> b!730279 (=> (not res!490698) (not e!408653))))

(declare-fun arrayContainsKey!0 (array!41178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730279 (= res!490698 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730280 () Bool)

(declare-fun e!408658 () Bool)

(assert (=> b!730280 (= e!408658 e!408654)))

(declare-fun res!490703 () Bool)

(assert (=> b!730280 (=> (not res!490703) (not e!408654))))

(assert (=> b!730280 (= res!490703 (= (seekEntryOrOpen!0 (select (arr!19709 a!3186) j!159) a!3186 mask!3328) lt!323463))))

(assert (=> b!730280 (= lt!323463 (Found!7306 j!159))))

(declare-fun e!408651 () Bool)

(declare-fun b!730281 () Bool)

(assert (=> b!730281 (= e!408651 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19709 a!3186) j!159) a!3186 mask!3328) lt!323469))))

(declare-fun b!730282 () Bool)

(declare-fun res!490706 () Bool)

(assert (=> b!730282 (=> (not res!490706) (not e!408653))))

(assert (=> b!730282 (= res!490706 (validKeyInArray!0 k0!2102))))

(declare-fun b!730283 () Bool)

(declare-fun e!408657 () Bool)

(assert (=> b!730283 (= e!408657 (not e!408652))))

(declare-fun res!490695 () Bool)

(assert (=> b!730283 (=> res!490695 e!408652)))

(declare-fun lt!323464 () SeekEntryResult!7306)

(get-info :version)

(assert (=> b!730283 (= res!490695 (or (not ((_ is Intermediate!7306) lt!323464)) (bvsge x!1131 (x!62579 lt!323464))))))

(assert (=> b!730283 e!408658))

(declare-fun res!490699 () Bool)

(assert (=> b!730283 (=> (not res!490699) (not e!408658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41178 (_ BitVec 32)) Bool)

(assert (=> b!730283 (= res!490699 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24902 0))(
  ( (Unit!24903) )
))
(declare-fun lt!323470 () Unit!24902)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24902)

(assert (=> b!730283 (= lt!323470 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730284 () Bool)

(declare-fun res!490696 () Bool)

(assert (=> b!730284 (=> (not res!490696) (not e!408650))))

(assert (=> b!730284 (= res!490696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730285 () Bool)

(assert (=> b!730285 (= e!408651 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19709 a!3186) j!159) a!3186 mask!3328) (Found!7306 j!159)))))

(declare-fun b!730286 () Bool)

(declare-fun res!490700 () Bool)

(assert (=> b!730286 (=> (not res!490700) (not e!408656))))

(assert (=> b!730286 (= res!490700 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19709 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730287 () Bool)

(declare-fun res!490710 () Bool)

(assert (=> b!730287 (=> (not res!490710) (not e!408656))))

(assert (=> b!730287 (= res!490710 e!408651)))

(declare-fun c!80163 () Bool)

(assert (=> b!730287 (= c!80163 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730288 () Bool)

(assert (=> b!730288 (= e!408656 e!408657)))

(declare-fun res!490704 () Bool)

(assert (=> b!730288 (=> (not res!490704) (not e!408657))))

(declare-fun lt!323467 () SeekEntryResult!7306)

(assert (=> b!730288 (= res!490704 (= lt!323467 lt!323464))))

(declare-fun lt!323465 () array!41178)

(declare-fun lt!323471 () (_ BitVec 64))

(assert (=> b!730288 (= lt!323464 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323471 lt!323465 mask!3328))))

(assert (=> b!730288 (= lt!323467 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323471 mask!3328) lt!323471 lt!323465 mask!3328))))

(assert (=> b!730288 (= lt!323471 (select (store (arr!19709 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730288 (= lt!323465 (array!41179 (store (arr!19709 a!3186) i!1173 k0!2102) (size!20130 a!3186)))))

(declare-fun b!730289 () Bool)

(declare-fun res!490707 () Bool)

(assert (=> b!730289 (=> (not res!490707) (not e!408650))))

(declare-datatypes ((List!13750 0))(
  ( (Nil!13747) (Cons!13746 (h!14806 (_ BitVec 64)) (t!20056 List!13750)) )
))
(declare-fun arrayNoDuplicates!0 (array!41178 (_ BitVec 32) List!13750) Bool)

(assert (=> b!730289 (= res!490707 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13747))))

(assert (= (and start!64712 res!490709) b!730272))

(assert (= (and b!730272 res!490697) b!730276))

(assert (= (and b!730276 res!490702) b!730282))

(assert (= (and b!730282 res!490706) b!730279))

(assert (= (and b!730279 res!490698) b!730277))

(assert (= (and b!730277 res!490708) b!730284))

(assert (= (and b!730284 res!490696) b!730289))

(assert (= (and b!730289 res!490707) b!730275))

(assert (= (and b!730275 res!490705) b!730278))

(assert (= (and b!730278 res!490701) b!730286))

(assert (= (and b!730286 res!490700) b!730287))

(assert (= (and b!730287 c!80163) b!730281))

(assert (= (and b!730287 (not c!80163)) b!730285))

(assert (= (and b!730287 res!490710) b!730288))

(assert (= (and b!730288 res!490704) b!730283))

(assert (= (and b!730283 res!490699) b!730280))

(assert (= (and b!730280 res!490703) b!730273))

(assert (= (and b!730283 (not res!490695)) b!730274))

(declare-fun m!683285 () Bool)

(assert (=> b!730289 m!683285))

(declare-fun m!683287 () Bool)

(assert (=> b!730276 m!683287))

(assert (=> b!730276 m!683287))

(declare-fun m!683289 () Bool)

(assert (=> b!730276 m!683289))

(declare-fun m!683291 () Bool)

(assert (=> b!730282 m!683291))

(declare-fun m!683293 () Bool)

(assert (=> b!730286 m!683293))

(assert (=> b!730285 m!683287))

(assert (=> b!730285 m!683287))

(declare-fun m!683295 () Bool)

(assert (=> b!730285 m!683295))

(assert (=> b!730273 m!683287))

(assert (=> b!730273 m!683287))

(declare-fun m!683297 () Bool)

(assert (=> b!730273 m!683297))

(declare-fun m!683299 () Bool)

(assert (=> b!730279 m!683299))

(declare-fun m!683301 () Bool)

(assert (=> b!730284 m!683301))

(assert (=> b!730280 m!683287))

(assert (=> b!730280 m!683287))

(declare-fun m!683303 () Bool)

(assert (=> b!730280 m!683303))

(declare-fun m!683305 () Bool)

(assert (=> b!730288 m!683305))

(declare-fun m!683307 () Bool)

(assert (=> b!730288 m!683307))

(declare-fun m!683309 () Bool)

(assert (=> b!730288 m!683309))

(assert (=> b!730288 m!683307))

(declare-fun m!683311 () Bool)

(assert (=> b!730288 m!683311))

(declare-fun m!683313 () Bool)

(assert (=> b!730288 m!683313))

(assert (=> b!730281 m!683287))

(assert (=> b!730281 m!683287))

(declare-fun m!683315 () Bool)

(assert (=> b!730281 m!683315))

(declare-fun m!683317 () Bool)

(assert (=> start!64712 m!683317))

(declare-fun m!683319 () Bool)

(assert (=> start!64712 m!683319))

(assert (=> b!730278 m!683287))

(assert (=> b!730278 m!683287))

(declare-fun m!683321 () Bool)

(assert (=> b!730278 m!683321))

(assert (=> b!730278 m!683321))

(assert (=> b!730278 m!683287))

(declare-fun m!683323 () Bool)

(assert (=> b!730278 m!683323))

(declare-fun m!683325 () Bool)

(assert (=> b!730277 m!683325))

(declare-fun m!683327 () Bool)

(assert (=> b!730274 m!683327))

(declare-fun m!683329 () Bool)

(assert (=> b!730283 m!683329))

(declare-fun m!683331 () Bool)

(assert (=> b!730283 m!683331))

(check-sat (not b!730283) (not b!730284) (not b!730280) (not b!730282) (not start!64712) (not b!730278) (not b!730277) (not b!730274) (not b!730288) (not b!730276) (not b!730279) (not b!730273) (not b!730281) (not b!730285) (not b!730289))
(check-sat)
