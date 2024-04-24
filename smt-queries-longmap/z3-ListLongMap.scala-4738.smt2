; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65616 () Bool)

(assert start!65616)

(declare-fun b!747380 () Bool)

(declare-fun res!503688 () Bool)

(declare-fun e!417418 () Bool)

(assert (=> b!747380 (=> (not res!503688) (not e!417418))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41659 0))(
  ( (array!41660 (arr!19939 (Array (_ BitVec 32) (_ BitVec 64))) (size!20359 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41659)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!747380 (= res!503688 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20359 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20359 a!3186))))))

(declare-fun b!747381 () Bool)

(declare-fun e!417425 () Bool)

(declare-fun e!417426 () Bool)

(assert (=> b!747381 (= e!417425 (not e!417426))))

(declare-fun res!503689 () Bool)

(assert (=> b!747381 (=> res!503689 e!417426)))

(declare-datatypes ((SeekEntryResult!7495 0))(
  ( (MissingZero!7495 (index!32348 (_ BitVec 32))) (Found!7495 (index!32349 (_ BitVec 32))) (Intermediate!7495 (undefined!8307 Bool) (index!32350 (_ BitVec 32)) (x!63457 (_ BitVec 32))) (Undefined!7495) (MissingVacant!7495 (index!32351 (_ BitVec 32))) )
))
(declare-fun lt!332139 () SeekEntryResult!7495)

(get-info :version)

(assert (=> b!747381 (= res!503689 (or (not ((_ is Intermediate!7495) lt!332139)) (bvslt x!1131 (x!63457 lt!332139)) (not (= x!1131 (x!63457 lt!332139))) (not (= index!1321 (index!32350 lt!332139)))))))

(declare-fun e!417421 () Bool)

(assert (=> b!747381 e!417421))

(declare-fun res!503686 () Bool)

(assert (=> b!747381 (=> (not res!503686) (not e!417421))))

(declare-fun lt!332140 () SeekEntryResult!7495)

(declare-fun lt!332148 () SeekEntryResult!7495)

(assert (=> b!747381 (= res!503686 (= lt!332140 lt!332148))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!747381 (= lt!332148 (Found!7495 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41659 (_ BitVec 32)) SeekEntryResult!7495)

(assert (=> b!747381 (= lt!332140 (seekEntryOrOpen!0 (select (arr!19939 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41659 (_ BitVec 32)) Bool)

(assert (=> b!747381 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25549 0))(
  ( (Unit!25550) )
))
(declare-fun lt!332141 () Unit!25549)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25549)

(assert (=> b!747381 (= lt!332141 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747382 () Bool)

(declare-fun res!503685 () Bool)

(declare-fun e!417423 () Bool)

(assert (=> b!747382 (=> (not res!503685) (not e!417423))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747382 (= res!503685 (validKeyInArray!0 k0!2102))))

(declare-fun e!417420 () Bool)

(declare-fun b!747383 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41659 (_ BitVec 32)) SeekEntryResult!7495)

(assert (=> b!747383 (= e!417420 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19939 a!3186) j!159) a!3186 mask!3328) (Found!7495 j!159)))))

(declare-fun b!747384 () Bool)

(declare-fun lt!332147 () SeekEntryResult!7495)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41659 (_ BitVec 32)) SeekEntryResult!7495)

(assert (=> b!747384 (= e!417420 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19939 a!3186) j!159) a!3186 mask!3328) lt!332147))))

(declare-fun b!747385 () Bool)

(declare-fun e!417419 () Bool)

(assert (=> b!747385 (= e!417419 true)))

(declare-fun lt!332142 () SeekEntryResult!7495)

(assert (=> b!747385 (= lt!332140 lt!332142)))

(declare-fun b!747386 () Bool)

(declare-fun e!417422 () Bool)

(assert (=> b!747386 (= e!417418 e!417422)))

(declare-fun res!503683 () Bool)

(assert (=> b!747386 (=> (not res!503683) (not e!417422))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747386 (= res!503683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19939 a!3186) j!159) mask!3328) (select (arr!19939 a!3186) j!159) a!3186 mask!3328) lt!332147))))

(assert (=> b!747386 (= lt!332147 (Intermediate!7495 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747387 () Bool)

(declare-fun res!503698 () Bool)

(assert (=> b!747387 (=> (not res!503698) (not e!417423))))

(declare-fun arrayContainsKey!0 (array!41659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747387 (= res!503698 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747388 () Bool)

(declare-fun res!503693 () Bool)

(assert (=> b!747388 (=> (not res!503693) (not e!417422))))

(assert (=> b!747388 (= res!503693 e!417420)))

(declare-fun c!82232 () Bool)

(assert (=> b!747388 (= c!82232 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747389 () Bool)

(assert (=> b!747389 (= e!417426 e!417419)))

(declare-fun res!503690 () Bool)

(assert (=> b!747389 (=> res!503690 e!417419)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!332146 () (_ BitVec 64))

(assert (=> b!747389 (= res!503690 (or (not (= lt!332142 lt!332148)) (= (select (store (arr!19939 a!3186) i!1173 k0!2102) index!1321) lt!332146) (not (= (select (store (arr!19939 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!747389 (= lt!332142 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19939 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!747390 () Bool)

(assert (=> b!747390 (= e!417421 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19939 a!3186) j!159) a!3186 mask!3328) lt!332148))))

(declare-fun res!503695 () Bool)

(assert (=> start!65616 (=> (not res!503695) (not e!417423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65616 (= res!503695 (validMask!0 mask!3328))))

(assert (=> start!65616 e!417423))

(assert (=> start!65616 true))

(declare-fun array_inv!15798 (array!41659) Bool)

(assert (=> start!65616 (array_inv!15798 a!3186)))

(declare-fun b!747391 () Bool)

(declare-fun res!503696 () Bool)

(assert (=> b!747391 (=> (not res!503696) (not e!417422))))

(assert (=> b!747391 (= res!503696 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19939 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!747392 () Bool)

(declare-fun res!503684 () Bool)

(assert (=> b!747392 (=> (not res!503684) (not e!417423))))

(assert (=> b!747392 (= res!503684 (validKeyInArray!0 (select (arr!19939 a!3186) j!159)))))

(declare-fun b!747393 () Bool)

(declare-fun res!503691 () Bool)

(assert (=> b!747393 (=> (not res!503691) (not e!417418))))

(assert (=> b!747393 (= res!503691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747394 () Bool)

(assert (=> b!747394 (= e!417422 e!417425)))

(declare-fun res!503697 () Bool)

(assert (=> b!747394 (=> (not res!503697) (not e!417425))))

(declare-fun lt!332144 () SeekEntryResult!7495)

(assert (=> b!747394 (= res!503697 (= lt!332144 lt!332139))))

(declare-fun lt!332145 () array!41659)

(assert (=> b!747394 (= lt!332139 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332146 lt!332145 mask!3328))))

(assert (=> b!747394 (= lt!332144 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332146 mask!3328) lt!332146 lt!332145 mask!3328))))

(assert (=> b!747394 (= lt!332146 (select (store (arr!19939 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747394 (= lt!332145 (array!41660 (store (arr!19939 a!3186) i!1173 k0!2102) (size!20359 a!3186)))))

(declare-fun b!747395 () Bool)

(declare-fun res!503687 () Bool)

(assert (=> b!747395 (=> (not res!503687) (not e!417423))))

(assert (=> b!747395 (= res!503687 (and (= (size!20359 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20359 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20359 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747396 () Bool)

(declare-fun res!503692 () Bool)

(assert (=> b!747396 (=> (not res!503692) (not e!417418))))

(declare-datatypes ((List!13848 0))(
  ( (Nil!13845) (Cons!13844 (h!14922 (_ BitVec 64)) (t!20155 List!13848)) )
))
(declare-fun arrayNoDuplicates!0 (array!41659 (_ BitVec 32) List!13848) Bool)

(assert (=> b!747396 (= res!503692 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13845))))

(declare-fun b!747397 () Bool)

(assert (=> b!747397 (= e!417423 e!417418)))

(declare-fun res!503694 () Bool)

(assert (=> b!747397 (=> (not res!503694) (not e!417418))))

(declare-fun lt!332143 () SeekEntryResult!7495)

(assert (=> b!747397 (= res!503694 (or (= lt!332143 (MissingZero!7495 i!1173)) (= lt!332143 (MissingVacant!7495 i!1173))))))

(assert (=> b!747397 (= lt!332143 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65616 res!503695) b!747395))

(assert (= (and b!747395 res!503687) b!747392))

(assert (= (and b!747392 res!503684) b!747382))

(assert (= (and b!747382 res!503685) b!747387))

(assert (= (and b!747387 res!503698) b!747397))

(assert (= (and b!747397 res!503694) b!747393))

(assert (= (and b!747393 res!503691) b!747396))

(assert (= (and b!747396 res!503692) b!747380))

(assert (= (and b!747380 res!503688) b!747386))

(assert (= (and b!747386 res!503683) b!747391))

(assert (= (and b!747391 res!503696) b!747388))

(assert (= (and b!747388 c!82232) b!747384))

(assert (= (and b!747388 (not c!82232)) b!747383))

(assert (= (and b!747388 res!503693) b!747394))

(assert (= (and b!747394 res!503697) b!747381))

(assert (= (and b!747381 res!503686) b!747390))

(assert (= (and b!747381 (not res!503689)) b!747389))

(assert (= (and b!747389 (not res!503690)) b!747385))

(declare-fun m!698031 () Bool)

(assert (=> b!747390 m!698031))

(assert (=> b!747390 m!698031))

(declare-fun m!698033 () Bool)

(assert (=> b!747390 m!698033))

(declare-fun m!698035 () Bool)

(assert (=> start!65616 m!698035))

(declare-fun m!698037 () Bool)

(assert (=> start!65616 m!698037))

(declare-fun m!698039 () Bool)

(assert (=> b!747397 m!698039))

(declare-fun m!698041 () Bool)

(assert (=> b!747391 m!698041))

(assert (=> b!747381 m!698031))

(assert (=> b!747381 m!698031))

(declare-fun m!698043 () Bool)

(assert (=> b!747381 m!698043))

(declare-fun m!698045 () Bool)

(assert (=> b!747381 m!698045))

(declare-fun m!698047 () Bool)

(assert (=> b!747381 m!698047))

(declare-fun m!698049 () Bool)

(assert (=> b!747393 m!698049))

(declare-fun m!698051 () Bool)

(assert (=> b!747394 m!698051))

(declare-fun m!698053 () Bool)

(assert (=> b!747394 m!698053))

(declare-fun m!698055 () Bool)

(assert (=> b!747394 m!698055))

(declare-fun m!698057 () Bool)

(assert (=> b!747394 m!698057))

(declare-fun m!698059 () Bool)

(assert (=> b!747394 m!698059))

(assert (=> b!747394 m!698055))

(assert (=> b!747386 m!698031))

(assert (=> b!747386 m!698031))

(declare-fun m!698061 () Bool)

(assert (=> b!747386 m!698061))

(assert (=> b!747386 m!698061))

(assert (=> b!747386 m!698031))

(declare-fun m!698063 () Bool)

(assert (=> b!747386 m!698063))

(assert (=> b!747389 m!698051))

(declare-fun m!698065 () Bool)

(assert (=> b!747389 m!698065))

(assert (=> b!747389 m!698031))

(assert (=> b!747389 m!698031))

(declare-fun m!698067 () Bool)

(assert (=> b!747389 m!698067))

(declare-fun m!698069 () Bool)

(assert (=> b!747396 m!698069))

(assert (=> b!747392 m!698031))

(assert (=> b!747392 m!698031))

(declare-fun m!698071 () Bool)

(assert (=> b!747392 m!698071))

(declare-fun m!698073 () Bool)

(assert (=> b!747387 m!698073))

(declare-fun m!698075 () Bool)

(assert (=> b!747382 m!698075))

(assert (=> b!747383 m!698031))

(assert (=> b!747383 m!698031))

(assert (=> b!747383 m!698067))

(assert (=> b!747384 m!698031))

(assert (=> b!747384 m!698031))

(declare-fun m!698077 () Bool)

(assert (=> b!747384 m!698077))

(check-sat (not b!747386) (not b!747392) (not b!747393) (not b!747396) (not b!747381) (not start!65616) (not b!747397) (not b!747383) (not b!747384) (not b!747390) (not b!747382) (not b!747389) (not b!747394) (not b!747387))
(check-sat)
