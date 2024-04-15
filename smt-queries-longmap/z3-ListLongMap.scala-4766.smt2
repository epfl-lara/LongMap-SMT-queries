; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65636 () Bool)

(assert start!65636)

(declare-fun b!751795 () Bool)

(declare-fun res!507717 () Bool)

(declare-fun e!419358 () Bool)

(assert (=> b!751795 (=> (not res!507717) (not e!419358))))

(declare-datatypes ((array!41826 0))(
  ( (array!41827 (arr!20027 (Array (_ BitVec 32) (_ BitVec 64))) (size!20448 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41826)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41826 (_ BitVec 32)) Bool)

(assert (=> b!751795 (= res!507717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!419354 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!751796 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7624 0))(
  ( (MissingZero!7624 (index!32864 (_ BitVec 32))) (Found!7624 (index!32865 (_ BitVec 32))) (Intermediate!7624 (undefined!8436 Bool) (index!32866 (_ BitVec 32)) (x!63793 (_ BitVec 32))) (Undefined!7624) (MissingVacant!7624 (index!32867 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41826 (_ BitVec 32)) SeekEntryResult!7624)

(assert (=> b!751796 (= e!419354 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20027 a!3186) j!159) a!3186 mask!3328) (Found!7624 j!159)))))

(declare-fun b!751797 () Bool)

(declare-fun res!507708 () Bool)

(declare-fun e!419359 () Bool)

(assert (=> b!751797 (=> (not res!507708) (not e!419359))))

(assert (=> b!751797 (= res!507708 e!419354)))

(declare-fun c!82428 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751797 (= c!82428 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751798 () Bool)

(declare-fun e!419351 () Bool)

(declare-fun e!419355 () Bool)

(assert (=> b!751798 (= e!419351 e!419355)))

(declare-fun res!507713 () Bool)

(assert (=> b!751798 (=> res!507713 e!419355)))

(declare-fun lt!334261 () SeekEntryResult!7624)

(declare-fun lt!334262 () SeekEntryResult!7624)

(assert (=> b!751798 (= res!507713 (not (= lt!334261 lt!334262)))))

(assert (=> b!751798 (= lt!334261 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20027 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!751799 () Bool)

(declare-fun res!507706 () Bool)

(declare-fun e!419348 () Bool)

(assert (=> b!751799 (=> (not res!507706) (not e!419348))))

(declare-fun lt!334263 () (_ BitVec 64))

(declare-fun lt!334265 () array!41826)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41826 (_ BitVec 32)) SeekEntryResult!7624)

(assert (=> b!751799 (= res!507706 (= (seekEntryOrOpen!0 lt!334263 lt!334265 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334263 lt!334265 mask!3328)))))

(declare-fun b!751801 () Bool)

(declare-fun res!507720 () Bool)

(assert (=> b!751801 (=> (not res!507720) (not e!419359))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!751801 (= res!507720 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20027 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751802 () Bool)

(declare-fun res!507710 () Bool)

(declare-fun e!419353 () Bool)

(assert (=> b!751802 (=> (not res!507710) (not e!419353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751802 (= res!507710 (validKeyInArray!0 (select (arr!20027 a!3186) j!159)))))

(declare-fun b!751803 () Bool)

(declare-fun res!507709 () Bool)

(assert (=> b!751803 (=> (not res!507709) (not e!419353))))

(assert (=> b!751803 (= res!507709 (and (= (size!20448 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20448 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20448 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751804 () Bool)

(declare-fun lt!334256 () SeekEntryResult!7624)

(assert (=> b!751804 (= e!419348 (= lt!334256 lt!334261))))

(declare-fun b!751805 () Bool)

(declare-fun res!507707 () Bool)

(assert (=> b!751805 (=> (not res!507707) (not e!419358))))

(assert (=> b!751805 (= res!507707 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20448 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20448 a!3186))))))

(declare-fun b!751806 () Bool)

(declare-datatypes ((Unit!25856 0))(
  ( (Unit!25857) )
))
(declare-fun e!419356 () Unit!25856)

(declare-fun Unit!25858 () Unit!25856)

(assert (=> b!751806 (= e!419356 Unit!25858)))

(declare-fun b!751807 () Bool)

(declare-fun e!419350 () Bool)

(assert (=> b!751807 (= e!419359 e!419350)))

(declare-fun res!507719 () Bool)

(assert (=> b!751807 (=> (not res!507719) (not e!419350))))

(declare-fun lt!334259 () SeekEntryResult!7624)

(declare-fun lt!334255 () SeekEntryResult!7624)

(assert (=> b!751807 (= res!507719 (= lt!334259 lt!334255))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41826 (_ BitVec 32)) SeekEntryResult!7624)

(assert (=> b!751807 (= lt!334255 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334263 lt!334265 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751807 (= lt!334259 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334263 mask!3328) lt!334263 lt!334265 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!751807 (= lt!334263 (select (store (arr!20027 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751807 (= lt!334265 (array!41827 (store (arr!20027 a!3186) i!1173 k0!2102) (size!20448 a!3186)))))

(declare-fun b!751808 () Bool)

(assert (=> b!751808 (= e!419358 e!419359)))

(declare-fun res!507704 () Bool)

(assert (=> b!751808 (=> (not res!507704) (not e!419359))))

(declare-fun lt!334264 () SeekEntryResult!7624)

(assert (=> b!751808 (= res!507704 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20027 a!3186) j!159) mask!3328) (select (arr!20027 a!3186) j!159) a!3186 mask!3328) lt!334264))))

(assert (=> b!751808 (= lt!334264 (Intermediate!7624 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751809 () Bool)

(declare-fun e!419352 () Bool)

(assert (=> b!751809 (= e!419352 true)))

(assert (=> b!751809 e!419348))

(declare-fun res!507711 () Bool)

(assert (=> b!751809 (=> (not res!507711) (not e!419348))))

(declare-fun lt!334254 () (_ BitVec 64))

(assert (=> b!751809 (= res!507711 (= lt!334254 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334258 () Unit!25856)

(assert (=> b!751809 (= lt!334258 e!419356)))

(declare-fun c!82427 () Bool)

(assert (=> b!751809 (= c!82427 (= lt!334254 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!419349 () Bool)

(declare-fun b!751810 () Bool)

(assert (=> b!751810 (= e!419349 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20027 a!3186) j!159) a!3186 mask!3328) lt!334262))))

(declare-fun b!751811 () Bool)

(declare-fun Unit!25859 () Unit!25856)

(assert (=> b!751811 (= e!419356 Unit!25859)))

(assert (=> b!751811 false))

(declare-fun b!751812 () Bool)

(declare-fun res!507716 () Bool)

(assert (=> b!751812 (=> (not res!507716) (not e!419353))))

(declare-fun arrayContainsKey!0 (array!41826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751812 (= res!507716 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751813 () Bool)

(assert (=> b!751813 (= e!419354 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20027 a!3186) j!159) a!3186 mask!3328) lt!334264))))

(declare-fun res!507712 () Bool)

(assert (=> start!65636 (=> (not res!507712) (not e!419353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65636 (= res!507712 (validMask!0 mask!3328))))

(assert (=> start!65636 e!419353))

(assert (=> start!65636 true))

(declare-fun array_inv!15910 (array!41826) Bool)

(assert (=> start!65636 (array_inv!15910 a!3186)))

(declare-fun b!751800 () Bool)

(declare-fun res!507714 () Bool)

(assert (=> b!751800 (=> (not res!507714) (not e!419353))))

(assert (=> b!751800 (= res!507714 (validKeyInArray!0 k0!2102))))

(declare-fun b!751814 () Bool)

(assert (=> b!751814 (= e!419353 e!419358)))

(declare-fun res!507715 () Bool)

(assert (=> b!751814 (=> (not res!507715) (not e!419358))))

(declare-fun lt!334260 () SeekEntryResult!7624)

(assert (=> b!751814 (= res!507715 (or (= lt!334260 (MissingZero!7624 i!1173)) (= lt!334260 (MissingVacant!7624 i!1173))))))

(assert (=> b!751814 (= lt!334260 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!751815 () Bool)

(assert (=> b!751815 (= e!419350 (not e!419351))))

(declare-fun res!507702 () Bool)

(assert (=> b!751815 (=> res!507702 e!419351)))

(get-info :version)

(assert (=> b!751815 (= res!507702 (or (not ((_ is Intermediate!7624) lt!334255)) (bvslt x!1131 (x!63793 lt!334255)) (not (= x!1131 (x!63793 lt!334255))) (not (= index!1321 (index!32866 lt!334255)))))))

(assert (=> b!751815 e!419349))

(declare-fun res!507705 () Bool)

(assert (=> b!751815 (=> (not res!507705) (not e!419349))))

(assert (=> b!751815 (= res!507705 (= lt!334256 lt!334262))))

(assert (=> b!751815 (= lt!334262 (Found!7624 j!159))))

(assert (=> b!751815 (= lt!334256 (seekEntryOrOpen!0 (select (arr!20027 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!751815 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334257 () Unit!25856)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25856)

(assert (=> b!751815 (= lt!334257 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751816 () Bool)

(declare-fun res!507718 () Bool)

(assert (=> b!751816 (=> (not res!507718) (not e!419358))))

(declare-datatypes ((List!14068 0))(
  ( (Nil!14065) (Cons!14064 (h!15136 (_ BitVec 64)) (t!20374 List!14068)) )
))
(declare-fun arrayNoDuplicates!0 (array!41826 (_ BitVec 32) List!14068) Bool)

(assert (=> b!751816 (= res!507718 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14065))))

(declare-fun b!751817 () Bool)

(assert (=> b!751817 (= e!419355 e!419352)))

(declare-fun res!507703 () Bool)

(assert (=> b!751817 (=> res!507703 e!419352)))

(assert (=> b!751817 (= res!507703 (= lt!334254 lt!334263))))

(assert (=> b!751817 (= lt!334254 (select (store (arr!20027 a!3186) i!1173 k0!2102) index!1321))))

(assert (= (and start!65636 res!507712) b!751803))

(assert (= (and b!751803 res!507709) b!751802))

(assert (= (and b!751802 res!507710) b!751800))

(assert (= (and b!751800 res!507714) b!751812))

(assert (= (and b!751812 res!507716) b!751814))

(assert (= (and b!751814 res!507715) b!751795))

(assert (= (and b!751795 res!507717) b!751816))

(assert (= (and b!751816 res!507718) b!751805))

(assert (= (and b!751805 res!507707) b!751808))

(assert (= (and b!751808 res!507704) b!751801))

(assert (= (and b!751801 res!507720) b!751797))

(assert (= (and b!751797 c!82428) b!751813))

(assert (= (and b!751797 (not c!82428)) b!751796))

(assert (= (and b!751797 res!507708) b!751807))

(assert (= (and b!751807 res!507719) b!751815))

(assert (= (and b!751815 res!507705) b!751810))

(assert (= (and b!751815 (not res!507702)) b!751798))

(assert (= (and b!751798 (not res!507713)) b!751817))

(assert (= (and b!751817 (not res!507703)) b!751809))

(assert (= (and b!751809 c!82427) b!751811))

(assert (= (and b!751809 (not c!82427)) b!751806))

(assert (= (and b!751809 res!507711) b!751799))

(assert (= (and b!751799 res!507706) b!751804))

(declare-fun m!700325 () Bool)

(assert (=> b!751810 m!700325))

(assert (=> b!751810 m!700325))

(declare-fun m!700327 () Bool)

(assert (=> b!751810 m!700327))

(assert (=> b!751813 m!700325))

(assert (=> b!751813 m!700325))

(declare-fun m!700329 () Bool)

(assert (=> b!751813 m!700329))

(declare-fun m!700331 () Bool)

(assert (=> b!751814 m!700331))

(assert (=> b!751802 m!700325))

(assert (=> b!751802 m!700325))

(declare-fun m!700333 () Bool)

(assert (=> b!751802 m!700333))

(declare-fun m!700335 () Bool)

(assert (=> b!751795 m!700335))

(declare-fun m!700337 () Bool)

(assert (=> b!751801 m!700337))

(assert (=> b!751796 m!700325))

(assert (=> b!751796 m!700325))

(declare-fun m!700339 () Bool)

(assert (=> b!751796 m!700339))

(assert (=> b!751798 m!700325))

(assert (=> b!751798 m!700325))

(assert (=> b!751798 m!700339))

(declare-fun m!700341 () Bool)

(assert (=> b!751812 m!700341))

(declare-fun m!700343 () Bool)

(assert (=> b!751817 m!700343))

(declare-fun m!700345 () Bool)

(assert (=> b!751817 m!700345))

(assert (=> b!751815 m!700325))

(assert (=> b!751815 m!700325))

(declare-fun m!700347 () Bool)

(assert (=> b!751815 m!700347))

(declare-fun m!700349 () Bool)

(assert (=> b!751815 m!700349))

(declare-fun m!700351 () Bool)

(assert (=> b!751815 m!700351))

(assert (=> b!751808 m!700325))

(assert (=> b!751808 m!700325))

(declare-fun m!700353 () Bool)

(assert (=> b!751808 m!700353))

(assert (=> b!751808 m!700353))

(assert (=> b!751808 m!700325))

(declare-fun m!700355 () Bool)

(assert (=> b!751808 m!700355))

(declare-fun m!700357 () Bool)

(assert (=> start!65636 m!700357))

(declare-fun m!700359 () Bool)

(assert (=> start!65636 m!700359))

(declare-fun m!700361 () Bool)

(assert (=> b!751800 m!700361))

(declare-fun m!700363 () Bool)

(assert (=> b!751807 m!700363))

(assert (=> b!751807 m!700343))

(declare-fun m!700365 () Bool)

(assert (=> b!751807 m!700365))

(assert (=> b!751807 m!700363))

(declare-fun m!700367 () Bool)

(assert (=> b!751807 m!700367))

(declare-fun m!700369 () Bool)

(assert (=> b!751807 m!700369))

(declare-fun m!700371 () Bool)

(assert (=> b!751816 m!700371))

(declare-fun m!700373 () Bool)

(assert (=> b!751799 m!700373))

(declare-fun m!700375 () Bool)

(assert (=> b!751799 m!700375))

(check-sat (not b!751796) (not b!751816) (not b!751812) (not start!65636) (not b!751798) (not b!751800) (not b!751808) (not b!751799) (not b!751813) (not b!751815) (not b!751814) (not b!751807) (not b!751795) (not b!751810) (not b!751802))
(check-sat)
