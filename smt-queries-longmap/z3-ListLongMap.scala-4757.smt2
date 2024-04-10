; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65604 () Bool)

(assert start!65604)

(declare-fun b!750309 () Bool)

(declare-fun res!506400 () Bool)

(declare-fun e!418626 () Bool)

(assert (=> b!750309 (=> res!506400 e!418626)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41777 0))(
  ( (array!41778 (arr!20002 (Array (_ BitVec 32) (_ BitVec 64))) (size!20423 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41777)

(declare-datatypes ((SeekEntryResult!7602 0))(
  ( (MissingZero!7602 (index!32776 (_ BitVec 32))) (Found!7602 (index!32777 (_ BitVec 32))) (Intermediate!7602 (undefined!8414 Bool) (index!32778 (_ BitVec 32)) (x!63704 (_ BitVec 32))) (Undefined!7602) (MissingVacant!7602 (index!32779 (_ BitVec 32))) )
))
(declare-fun lt!333621 () SeekEntryResult!7602)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41777 (_ BitVec 32)) SeekEntryResult!7602)

(assert (=> b!750309 (= res!506400 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20002 a!3186) j!159) a!3186 mask!3328) lt!333621)))))

(declare-fun b!750310 () Bool)

(declare-fun res!506398 () Bool)

(declare-fun e!418634 () Bool)

(assert (=> b!750310 (=> (not res!506398) (not e!418634))))

(declare-fun e!418632 () Bool)

(assert (=> b!750310 (= res!506398 e!418632)))

(declare-fun c!82342 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!750310 (= c!82342 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750311 () Bool)

(declare-fun res!506397 () Bool)

(declare-fun e!418631 () Bool)

(assert (=> b!750311 (=> (not res!506397) (not e!418631))))

(declare-datatypes ((List!14004 0))(
  ( (Nil!14001) (Cons!14000 (h!15072 (_ BitVec 64)) (t!20319 List!14004)) )
))
(declare-fun arrayNoDuplicates!0 (array!41777 (_ BitVec 32) List!14004) Bool)

(assert (=> b!750311 (= res!506397 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14001))))

(declare-fun e!418633 () Bool)

(declare-fun lt!333618 () (_ BitVec 64))

(declare-fun lt!333622 () array!41777)

(declare-fun b!750312 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41777 (_ BitVec 32)) SeekEntryResult!7602)

(assert (=> b!750312 (= e!418633 (= (seekEntryOrOpen!0 lt!333618 lt!333622 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333618 lt!333622 mask!3328)))))

(declare-fun b!750313 () Bool)

(assert (=> b!750313 (= e!418631 e!418634)))

(declare-fun res!506395 () Bool)

(assert (=> b!750313 (=> (not res!506395) (not e!418634))))

(declare-fun lt!333624 () SeekEntryResult!7602)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41777 (_ BitVec 32)) SeekEntryResult!7602)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750313 (= res!506395 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20002 a!3186) j!159) mask!3328) (select (arr!20002 a!3186) j!159) a!3186 mask!3328) lt!333624))))

(assert (=> b!750313 (= lt!333624 (Intermediate!7602 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750314 () Bool)

(declare-fun e!418624 () Bool)

(assert (=> b!750314 (= e!418624 e!418631)))

(declare-fun res!506389 () Bool)

(assert (=> b!750314 (=> (not res!506389) (not e!418631))))

(declare-fun lt!333617 () SeekEntryResult!7602)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750314 (= res!506389 (or (= lt!333617 (MissingZero!7602 i!1173)) (= lt!333617 (MissingVacant!7602 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!750314 (= lt!333617 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!750315 () Bool)

(declare-fun res!506401 () Bool)

(assert (=> b!750315 (=> (not res!506401) (not e!418624))))

(declare-fun arrayContainsKey!0 (array!41777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750315 (= res!506401 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750317 () Bool)

(assert (=> b!750317 (= e!418632 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20002 a!3186) j!159) a!3186 mask!3328) lt!333624))))

(declare-fun b!750318 () Bool)

(declare-fun res!506394 () Bool)

(assert (=> b!750318 (=> (not res!506394) (not e!418624))))

(assert (=> b!750318 (= res!506394 (and (= (size!20423 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20423 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20423 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750319 () Bool)

(declare-datatypes ((Unit!25788 0))(
  ( (Unit!25789) )
))
(declare-fun e!418630 () Unit!25788)

(declare-fun Unit!25790 () Unit!25788)

(assert (=> b!750319 (= e!418630 Unit!25790)))

(declare-fun b!750320 () Bool)

(declare-fun res!506393 () Bool)

(assert (=> b!750320 (=> (not res!506393) (not e!418631))))

(assert (=> b!750320 (= res!506393 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20423 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20423 a!3186))))))

(declare-fun b!750321 () Bool)

(declare-fun e!418628 () Bool)

(assert (=> b!750321 (= e!418626 e!418628)))

(declare-fun res!506392 () Bool)

(assert (=> b!750321 (=> res!506392 e!418628)))

(declare-fun lt!333619 () (_ BitVec 64))

(assert (=> b!750321 (= res!506392 (= lt!333619 lt!333618))))

(assert (=> b!750321 (= lt!333619 (select (store (arr!20002 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!750322 () Bool)

(declare-fun Unit!25791 () Unit!25788)

(assert (=> b!750322 (= e!418630 Unit!25791)))

(assert (=> b!750322 false))

(declare-fun b!750323 () Bool)

(declare-fun e!418629 () Bool)

(assert (=> b!750323 (= e!418634 e!418629)))

(declare-fun res!506404 () Bool)

(assert (=> b!750323 (=> (not res!506404) (not e!418629))))

(declare-fun lt!333616 () SeekEntryResult!7602)

(declare-fun lt!333626 () SeekEntryResult!7602)

(assert (=> b!750323 (= res!506404 (= lt!333616 lt!333626))))

(assert (=> b!750323 (= lt!333626 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333618 lt!333622 mask!3328))))

(assert (=> b!750323 (= lt!333616 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333618 mask!3328) lt!333618 lt!333622 mask!3328))))

(assert (=> b!750323 (= lt!333618 (select (store (arr!20002 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!750323 (= lt!333622 (array!41778 (store (arr!20002 a!3186) i!1173 k0!2102) (size!20423 a!3186)))))

(declare-fun b!750324 () Bool)

(assert (=> b!750324 (= e!418628 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!750324 e!418633))

(declare-fun res!506402 () Bool)

(assert (=> b!750324 (=> (not res!506402) (not e!418633))))

(assert (=> b!750324 (= res!506402 (= lt!333619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333625 () Unit!25788)

(assert (=> b!750324 (= lt!333625 e!418630)))

(declare-fun c!82341 () Bool)

(assert (=> b!750324 (= c!82341 (= lt!333619 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750325 () Bool)

(assert (=> b!750325 (= e!418629 (not e!418626))))

(declare-fun res!506391 () Bool)

(assert (=> b!750325 (=> res!506391 e!418626)))

(get-info :version)

(assert (=> b!750325 (= res!506391 (or (not ((_ is Intermediate!7602) lt!333626)) (bvslt x!1131 (x!63704 lt!333626)) (not (= x!1131 (x!63704 lt!333626))) (not (= index!1321 (index!32778 lt!333626)))))))

(declare-fun e!418627 () Bool)

(assert (=> b!750325 e!418627))

(declare-fun res!506405 () Bool)

(assert (=> b!750325 (=> (not res!506405) (not e!418627))))

(declare-fun lt!333620 () SeekEntryResult!7602)

(assert (=> b!750325 (= res!506405 (= lt!333620 lt!333621))))

(assert (=> b!750325 (= lt!333621 (Found!7602 j!159))))

(assert (=> b!750325 (= lt!333620 (seekEntryOrOpen!0 (select (arr!20002 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41777 (_ BitVec 32)) Bool)

(assert (=> b!750325 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333623 () Unit!25788)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25788)

(assert (=> b!750325 (= lt!333623 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750326 () Bool)

(declare-fun res!506399 () Bool)

(assert (=> b!750326 (=> (not res!506399) (not e!418624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750326 (= res!506399 (validKeyInArray!0 (select (arr!20002 a!3186) j!159)))))

(declare-fun b!750327 () Bool)

(declare-fun res!506388 () Bool)

(assert (=> b!750327 (=> (not res!506388) (not e!418634))))

(assert (=> b!750327 (= res!506388 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20002 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750328 () Bool)

(assert (=> b!750328 (= e!418632 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20002 a!3186) j!159) a!3186 mask!3328) (Found!7602 j!159)))))

(declare-fun b!750316 () Bool)

(declare-fun res!506390 () Bool)

(assert (=> b!750316 (=> (not res!506390) (not e!418624))))

(assert (=> b!750316 (= res!506390 (validKeyInArray!0 k0!2102))))

(declare-fun res!506396 () Bool)

(assert (=> start!65604 (=> (not res!506396) (not e!418624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65604 (= res!506396 (validMask!0 mask!3328))))

(assert (=> start!65604 e!418624))

(assert (=> start!65604 true))

(declare-fun array_inv!15798 (array!41777) Bool)

(assert (=> start!65604 (array_inv!15798 a!3186)))

(declare-fun b!750329 () Bool)

(assert (=> b!750329 (= e!418627 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20002 a!3186) j!159) a!3186 mask!3328) lt!333621))))

(declare-fun b!750330 () Bool)

(declare-fun res!506403 () Bool)

(assert (=> b!750330 (=> (not res!506403) (not e!418631))))

(assert (=> b!750330 (= res!506403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65604 res!506396) b!750318))

(assert (= (and b!750318 res!506394) b!750326))

(assert (= (and b!750326 res!506399) b!750316))

(assert (= (and b!750316 res!506390) b!750315))

(assert (= (and b!750315 res!506401) b!750314))

(assert (= (and b!750314 res!506389) b!750330))

(assert (= (and b!750330 res!506403) b!750311))

(assert (= (and b!750311 res!506397) b!750320))

(assert (= (and b!750320 res!506393) b!750313))

(assert (= (and b!750313 res!506395) b!750327))

(assert (= (and b!750327 res!506388) b!750310))

(assert (= (and b!750310 c!82342) b!750317))

(assert (= (and b!750310 (not c!82342)) b!750328))

(assert (= (and b!750310 res!506398) b!750323))

(assert (= (and b!750323 res!506404) b!750325))

(assert (= (and b!750325 res!506405) b!750329))

(assert (= (and b!750325 (not res!506391)) b!750309))

(assert (= (and b!750309 (not res!506400)) b!750321))

(assert (= (and b!750321 (not res!506392)) b!750324))

(assert (= (and b!750324 c!82341) b!750322))

(assert (= (and b!750324 (not c!82341)) b!750319))

(assert (= (and b!750324 res!506402) b!750312))

(declare-fun m!699731 () Bool)

(assert (=> b!750317 m!699731))

(assert (=> b!750317 m!699731))

(declare-fun m!699733 () Bool)

(assert (=> b!750317 m!699733))

(declare-fun m!699735 () Bool)

(assert (=> b!750311 m!699735))

(declare-fun m!699737 () Bool)

(assert (=> b!750321 m!699737))

(declare-fun m!699739 () Bool)

(assert (=> b!750321 m!699739))

(assert (=> b!750323 m!699737))

(declare-fun m!699741 () Bool)

(assert (=> b!750323 m!699741))

(declare-fun m!699743 () Bool)

(assert (=> b!750323 m!699743))

(assert (=> b!750323 m!699743))

(declare-fun m!699745 () Bool)

(assert (=> b!750323 m!699745))

(declare-fun m!699747 () Bool)

(assert (=> b!750323 m!699747))

(declare-fun m!699749 () Bool)

(assert (=> b!750316 m!699749))

(assert (=> b!750309 m!699731))

(assert (=> b!750309 m!699731))

(declare-fun m!699751 () Bool)

(assert (=> b!750309 m!699751))

(declare-fun m!699753 () Bool)

(assert (=> b!750330 m!699753))

(declare-fun m!699755 () Bool)

(assert (=> b!750314 m!699755))

(assert (=> b!750313 m!699731))

(assert (=> b!750313 m!699731))

(declare-fun m!699757 () Bool)

(assert (=> b!750313 m!699757))

(assert (=> b!750313 m!699757))

(assert (=> b!750313 m!699731))

(declare-fun m!699759 () Bool)

(assert (=> b!750313 m!699759))

(assert (=> b!750325 m!699731))

(assert (=> b!750325 m!699731))

(declare-fun m!699761 () Bool)

(assert (=> b!750325 m!699761))

(declare-fun m!699763 () Bool)

(assert (=> b!750325 m!699763))

(declare-fun m!699765 () Bool)

(assert (=> b!750325 m!699765))

(assert (=> b!750329 m!699731))

(assert (=> b!750329 m!699731))

(declare-fun m!699767 () Bool)

(assert (=> b!750329 m!699767))

(declare-fun m!699769 () Bool)

(assert (=> b!750312 m!699769))

(declare-fun m!699771 () Bool)

(assert (=> b!750312 m!699771))

(declare-fun m!699773 () Bool)

(assert (=> start!65604 m!699773))

(declare-fun m!699775 () Bool)

(assert (=> start!65604 m!699775))

(assert (=> b!750326 m!699731))

(assert (=> b!750326 m!699731))

(declare-fun m!699777 () Bool)

(assert (=> b!750326 m!699777))

(declare-fun m!699779 () Bool)

(assert (=> b!750315 m!699779))

(declare-fun m!699781 () Bool)

(assert (=> b!750327 m!699781))

(assert (=> b!750328 m!699731))

(assert (=> b!750328 m!699731))

(assert (=> b!750328 m!699751))

(check-sat (not b!750309) (not b!750317) (not b!750313) (not b!750312) (not b!750325) (not b!750316) (not b!750314) (not b!750329) (not b!750323) (not b!750328) (not b!750326) (not b!750315) (not start!65604) (not b!750311) (not b!750330))
(check-sat)
