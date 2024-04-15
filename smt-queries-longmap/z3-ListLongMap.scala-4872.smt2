; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67124 () Bool)

(assert start!67124)

(declare-fun b!775698 () Bool)

(declare-fun res!524701 () Bool)

(declare-fun e!431666 () Bool)

(assert (=> b!775698 (=> (not res!524701) (not e!431666))))

(declare-datatypes ((array!42498 0))(
  ( (array!42499 (arr!20345 (Array (_ BitVec 32) (_ BitVec 64))) (size!20766 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42498)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775698 (= res!524701 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775699 () Bool)

(declare-fun e!431668 () Bool)

(assert (=> b!775699 (= e!431666 e!431668)))

(declare-fun res!524697 () Bool)

(assert (=> b!775699 (=> (not res!524697) (not e!431668))))

(declare-datatypes ((SeekEntryResult!7942 0))(
  ( (MissingZero!7942 (index!34136 (_ BitVec 32))) (Found!7942 (index!34137 (_ BitVec 32))) (Intermediate!7942 (undefined!8754 Bool) (index!34138 (_ BitVec 32)) (x!65088 (_ BitVec 32))) (Undefined!7942) (MissingVacant!7942 (index!34139 (_ BitVec 32))) )
))
(declare-fun lt!345435 () SeekEntryResult!7942)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775699 (= res!524697 (or (= lt!345435 (MissingZero!7942 i!1173)) (= lt!345435 (MissingVacant!7942 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42498 (_ BitVec 32)) SeekEntryResult!7942)

(assert (=> b!775699 (= lt!345435 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!775700 () Bool)

(declare-fun res!524707 () Bool)

(assert (=> b!775700 (=> (not res!524707) (not e!431666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775700 (= res!524707 (validKeyInArray!0 k0!2102))))

(declare-fun b!775701 () Bool)

(declare-fun res!524702 () Bool)

(assert (=> b!775701 (=> (not res!524702) (not e!431668))))

(declare-datatypes ((List!14386 0))(
  ( (Nil!14383) (Cons!14382 (h!15490 (_ BitVec 64)) (t!20692 List!14386)) )
))
(declare-fun arrayNoDuplicates!0 (array!42498 (_ BitVec 32) List!14386) Bool)

(assert (=> b!775701 (= res!524702 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14383))))

(declare-fun b!775702 () Bool)

(declare-fun res!524704 () Bool)

(declare-fun e!431673 () Bool)

(assert (=> b!775702 (=> (not res!524704) (not e!431673))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!775702 (= res!524704 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20345 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775703 () Bool)

(declare-fun res!524694 () Bool)

(assert (=> b!775703 (=> (not res!524694) (not e!431668))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775703 (= res!524694 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20766 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20766 a!3186))))))

(declare-fun b!775704 () Bool)

(declare-fun e!431671 () Bool)

(assert (=> b!775704 (= e!431673 e!431671)))

(declare-fun res!524706 () Bool)

(assert (=> b!775704 (=> (not res!524706) (not e!431671))))

(declare-fun lt!345443 () SeekEntryResult!7942)

(declare-fun lt!345439 () SeekEntryResult!7942)

(assert (=> b!775704 (= res!524706 (= lt!345443 lt!345439))))

(declare-fun lt!345436 () array!42498)

(declare-fun lt!345441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42498 (_ BitVec 32)) SeekEntryResult!7942)

(assert (=> b!775704 (= lt!345439 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345441 lt!345436 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775704 (= lt!345443 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345441 mask!3328) lt!345441 lt!345436 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!775704 (= lt!345441 (select (store (arr!20345 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!775704 (= lt!345436 (array!42499 (store (arr!20345 a!3186) i!1173 k0!2102) (size!20766 a!3186)))))

(declare-fun lt!345442 () SeekEntryResult!7942)

(declare-fun e!431667 () Bool)

(declare-fun b!775705 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42498 (_ BitVec 32)) SeekEntryResult!7942)

(assert (=> b!775705 (= e!431667 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20345 a!3186) j!159) a!3186 mask!3328) lt!345442))))

(declare-fun b!775706 () Bool)

(declare-fun e!431669 () Bool)

(assert (=> b!775706 (= e!431671 (not e!431669))))

(declare-fun res!524696 () Bool)

(assert (=> b!775706 (=> res!524696 e!431669)))

(get-info :version)

(assert (=> b!775706 (= res!524696 (or (not ((_ is Intermediate!7942) lt!345439)) (bvslt x!1131 (x!65088 lt!345439)) (not (= x!1131 (x!65088 lt!345439))) (not (= index!1321 (index!34138 lt!345439)))))))

(declare-fun e!431672 () Bool)

(assert (=> b!775706 e!431672))

(declare-fun res!524695 () Bool)

(assert (=> b!775706 (=> (not res!524695) (not e!431672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42498 (_ BitVec 32)) Bool)

(assert (=> b!775706 (= res!524695 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26750 0))(
  ( (Unit!26751) )
))
(declare-fun lt!345437 () Unit!26750)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42498 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26750)

(assert (=> b!775706 (= lt!345437 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775707 () Bool)

(declare-fun res!524698 () Bool)

(assert (=> b!775707 (=> (not res!524698) (not e!431666))))

(assert (=> b!775707 (= res!524698 (and (= (size!20766 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20766 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20766 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775708 () Bool)

(declare-fun e!431670 () Bool)

(assert (=> b!775708 (= e!431670 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20345 a!3186) j!159) a!3186 mask!3328) (Found!7942 j!159)))))

(declare-fun b!775709 () Bool)

(declare-fun res!524700 () Bool)

(assert (=> b!775709 (=> (not res!524700) (not e!431673))))

(assert (=> b!775709 (= res!524700 e!431670)))

(declare-fun c!85902 () Bool)

(assert (=> b!775709 (= c!85902 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775710 () Bool)

(assert (=> b!775710 (= e!431669 true)))

(declare-fun lt!345438 () SeekEntryResult!7942)

(assert (=> b!775710 (= lt!345438 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20345 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!775711 () Bool)

(declare-fun lt!345440 () SeekEntryResult!7942)

(assert (=> b!775711 (= e!431670 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20345 a!3186) j!159) a!3186 mask!3328) lt!345440))))

(declare-fun res!524705 () Bool)

(assert (=> start!67124 (=> (not res!524705) (not e!431666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67124 (= res!524705 (validMask!0 mask!3328))))

(assert (=> start!67124 e!431666))

(assert (=> start!67124 true))

(declare-fun array_inv!16228 (array!42498) Bool)

(assert (=> start!67124 (array_inv!16228 a!3186)))

(declare-fun b!775712 () Bool)

(assert (=> b!775712 (= e!431668 e!431673)))

(declare-fun res!524709 () Bool)

(assert (=> b!775712 (=> (not res!524709) (not e!431673))))

(assert (=> b!775712 (= res!524709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20345 a!3186) j!159) mask!3328) (select (arr!20345 a!3186) j!159) a!3186 mask!3328) lt!345440))))

(assert (=> b!775712 (= lt!345440 (Intermediate!7942 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775713 () Bool)

(assert (=> b!775713 (= e!431672 e!431667)))

(declare-fun res!524708 () Bool)

(assert (=> b!775713 (=> (not res!524708) (not e!431667))))

(assert (=> b!775713 (= res!524708 (= (seekEntryOrOpen!0 (select (arr!20345 a!3186) j!159) a!3186 mask!3328) lt!345442))))

(assert (=> b!775713 (= lt!345442 (Found!7942 j!159))))

(declare-fun b!775714 () Bool)

(declare-fun res!524699 () Bool)

(assert (=> b!775714 (=> (not res!524699) (not e!431668))))

(assert (=> b!775714 (= res!524699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775715 () Bool)

(declare-fun res!524703 () Bool)

(assert (=> b!775715 (=> (not res!524703) (not e!431666))))

(assert (=> b!775715 (= res!524703 (validKeyInArray!0 (select (arr!20345 a!3186) j!159)))))

(assert (= (and start!67124 res!524705) b!775707))

(assert (= (and b!775707 res!524698) b!775715))

(assert (= (and b!775715 res!524703) b!775700))

(assert (= (and b!775700 res!524707) b!775698))

(assert (= (and b!775698 res!524701) b!775699))

(assert (= (and b!775699 res!524697) b!775714))

(assert (= (and b!775714 res!524699) b!775701))

(assert (= (and b!775701 res!524702) b!775703))

(assert (= (and b!775703 res!524694) b!775712))

(assert (= (and b!775712 res!524709) b!775702))

(assert (= (and b!775702 res!524704) b!775709))

(assert (= (and b!775709 c!85902) b!775711))

(assert (= (and b!775709 (not c!85902)) b!775708))

(assert (= (and b!775709 res!524700) b!775704))

(assert (= (and b!775704 res!524706) b!775706))

(assert (= (and b!775706 res!524695) b!775713))

(assert (= (and b!775713 res!524708) b!775705))

(assert (= (and b!775706 (not res!524696)) b!775710))

(declare-fun m!719343 () Bool)

(assert (=> b!775705 m!719343))

(assert (=> b!775705 m!719343))

(declare-fun m!719345 () Bool)

(assert (=> b!775705 m!719345))

(declare-fun m!719347 () Bool)

(assert (=> b!775700 m!719347))

(assert (=> b!775708 m!719343))

(assert (=> b!775708 m!719343))

(declare-fun m!719349 () Bool)

(assert (=> b!775708 m!719349))

(assert (=> b!775715 m!719343))

(assert (=> b!775715 m!719343))

(declare-fun m!719351 () Bool)

(assert (=> b!775715 m!719351))

(declare-fun m!719353 () Bool)

(assert (=> b!775704 m!719353))

(declare-fun m!719355 () Bool)

(assert (=> b!775704 m!719355))

(declare-fun m!719357 () Bool)

(assert (=> b!775704 m!719357))

(declare-fun m!719359 () Bool)

(assert (=> b!775704 m!719359))

(assert (=> b!775704 m!719355))

(declare-fun m!719361 () Bool)

(assert (=> b!775704 m!719361))

(declare-fun m!719363 () Bool)

(assert (=> start!67124 m!719363))

(declare-fun m!719365 () Bool)

(assert (=> start!67124 m!719365))

(declare-fun m!719367 () Bool)

(assert (=> b!775701 m!719367))

(declare-fun m!719369 () Bool)

(assert (=> b!775699 m!719369))

(assert (=> b!775712 m!719343))

(assert (=> b!775712 m!719343))

(declare-fun m!719371 () Bool)

(assert (=> b!775712 m!719371))

(assert (=> b!775712 m!719371))

(assert (=> b!775712 m!719343))

(declare-fun m!719373 () Bool)

(assert (=> b!775712 m!719373))

(assert (=> b!775713 m!719343))

(assert (=> b!775713 m!719343))

(declare-fun m!719375 () Bool)

(assert (=> b!775713 m!719375))

(assert (=> b!775711 m!719343))

(assert (=> b!775711 m!719343))

(declare-fun m!719377 () Bool)

(assert (=> b!775711 m!719377))

(declare-fun m!719379 () Bool)

(assert (=> b!775702 m!719379))

(declare-fun m!719381 () Bool)

(assert (=> b!775714 m!719381))

(declare-fun m!719383 () Bool)

(assert (=> b!775706 m!719383))

(declare-fun m!719385 () Bool)

(assert (=> b!775706 m!719385))

(declare-fun m!719387 () Bool)

(assert (=> b!775698 m!719387))

(assert (=> b!775710 m!719343))

(assert (=> b!775710 m!719343))

(assert (=> b!775710 m!719349))

(check-sat (not b!775698) (not b!775708) (not b!775706) (not b!775713) (not b!775715) (not b!775710) (not start!67124) (not b!775699) (not b!775711) (not b!775704) (not b!775701) (not b!775700) (not b!775714) (not b!775705) (not b!775712))
(check-sat)
