; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65324 () Bool)

(assert start!65324)

(declare-fun b!742344 () Bool)

(declare-fun res!499671 () Bool)

(declare-fun e!414850 () Bool)

(assert (=> b!742344 (=> (not res!499671) (not e!414850))))

(declare-fun e!414844 () Bool)

(assert (=> b!742344 (= res!499671 e!414844)))

(declare-fun c!81723 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742344 (= c!81723 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742345 () Bool)

(declare-fun res!499665 () Bool)

(declare-fun e!414847 () Bool)

(assert (=> b!742345 (=> (not res!499665) (not e!414847))))

(declare-datatypes ((array!41514 0))(
  ( (array!41515 (arr!19871 (Array (_ BitVec 32) (_ BitVec 64))) (size!20292 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41514)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!742345 (= res!499665 (and (= (size!20292 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20292 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20292 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742346 () Bool)

(declare-fun res!499667 () Bool)

(declare-fun e!414845 () Bool)

(assert (=> b!742346 (=> (not res!499667) (not e!414845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41514 (_ BitVec 32)) Bool)

(assert (=> b!742346 (= res!499667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742347 () Bool)

(declare-fun e!414843 () Bool)

(declare-fun e!414848 () Bool)

(assert (=> b!742347 (= e!414843 e!414848)))

(declare-fun res!499662 () Bool)

(assert (=> b!742347 (=> (not res!499662) (not e!414848))))

(declare-datatypes ((SeekEntryResult!7468 0))(
  ( (MissingZero!7468 (index!32240 (_ BitVec 32))) (Found!7468 (index!32241 (_ BitVec 32))) (Intermediate!7468 (undefined!8280 Bool) (index!32242 (_ BitVec 32)) (x!63221 (_ BitVec 32))) (Undefined!7468) (MissingVacant!7468 (index!32243 (_ BitVec 32))) )
))
(declare-fun lt!329657 () SeekEntryResult!7468)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41514 (_ BitVec 32)) SeekEntryResult!7468)

(assert (=> b!742347 (= res!499662 (= (seekEntryOrOpen!0 (select (arr!19871 a!3186) j!159) a!3186 mask!3328) lt!329657))))

(assert (=> b!742347 (= lt!329657 (Found!7468 j!159))))

(declare-fun b!742348 () Bool)

(assert (=> b!742348 (= e!414847 e!414845)))

(declare-fun res!499670 () Bool)

(assert (=> b!742348 (=> (not res!499670) (not e!414845))))

(declare-fun lt!329649 () SeekEntryResult!7468)

(assert (=> b!742348 (= res!499670 (or (= lt!329649 (MissingZero!7468 i!1173)) (= lt!329649 (MissingVacant!7468 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!742348 (= lt!329649 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742349 () Bool)

(declare-fun res!499659 () Bool)

(assert (=> b!742349 (=> (not res!499659) (not e!414845))))

(declare-datatypes ((List!13912 0))(
  ( (Nil!13909) (Cons!13908 (h!14980 (_ BitVec 64)) (t!20218 List!13912)) )
))
(declare-fun arrayNoDuplicates!0 (array!41514 (_ BitVec 32) List!13912) Bool)

(assert (=> b!742349 (= res!499659 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13909))))

(declare-fun b!742350 () Bool)

(declare-fun res!499664 () Bool)

(assert (=> b!742350 (=> (not res!499664) (not e!414850))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!742350 (= res!499664 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19871 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742351 () Bool)

(declare-fun res!499672 () Bool)

(assert (=> b!742351 (=> (not res!499672) (not e!414847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742351 (= res!499672 (validKeyInArray!0 (select (arr!19871 a!3186) j!159)))))

(declare-fun b!742352 () Bool)

(declare-fun e!414842 () Bool)

(assert (=> b!742352 (= e!414842 true)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!329655 () SeekEntryResult!7468)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41514 (_ BitVec 32)) SeekEntryResult!7468)

(assert (=> b!742352 (= lt!329655 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19871 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!499663 () Bool)

(assert (=> start!65324 (=> (not res!499663) (not e!414847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65324 (= res!499663 (validMask!0 mask!3328))))

(assert (=> start!65324 e!414847))

(assert (=> start!65324 true))

(declare-fun array_inv!15754 (array!41514) Bool)

(assert (=> start!65324 (array_inv!15754 a!3186)))

(declare-fun b!742353 () Bool)

(declare-fun res!499673 () Bool)

(assert (=> b!742353 (=> (not res!499673) (not e!414845))))

(assert (=> b!742353 (= res!499673 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20292 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20292 a!3186))))))

(declare-fun b!742354 () Bool)

(declare-fun lt!329652 () SeekEntryResult!7468)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41514 (_ BitVec 32)) SeekEntryResult!7468)

(assert (=> b!742354 (= e!414844 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19871 a!3186) j!159) a!3186 mask!3328) lt!329652))))

(declare-fun b!742355 () Bool)

(assert (=> b!742355 (= e!414845 e!414850)))

(declare-fun res!499674 () Bool)

(assert (=> b!742355 (=> (not res!499674) (not e!414850))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742355 (= res!499674 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19871 a!3186) j!159) mask!3328) (select (arr!19871 a!3186) j!159) a!3186 mask!3328) lt!329652))))

(assert (=> b!742355 (= lt!329652 (Intermediate!7468 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742356 () Bool)

(declare-fun res!499661 () Bool)

(assert (=> b!742356 (=> (not res!499661) (not e!414847))))

(assert (=> b!742356 (= res!499661 (validKeyInArray!0 k0!2102))))

(declare-fun b!742357 () Bool)

(declare-fun res!499666 () Bool)

(assert (=> b!742357 (=> (not res!499666) (not e!414847))))

(declare-fun arrayContainsKey!0 (array!41514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742357 (= res!499666 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742358 () Bool)

(declare-fun e!414849 () Bool)

(assert (=> b!742358 (= e!414850 e!414849)))

(declare-fun res!499669 () Bool)

(assert (=> b!742358 (=> (not res!499669) (not e!414849))))

(declare-fun lt!329651 () SeekEntryResult!7468)

(declare-fun lt!329653 () SeekEntryResult!7468)

(assert (=> b!742358 (= res!499669 (= lt!329651 lt!329653))))

(declare-fun lt!329656 () (_ BitVec 64))

(declare-fun lt!329654 () array!41514)

(assert (=> b!742358 (= lt!329653 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329656 lt!329654 mask!3328))))

(assert (=> b!742358 (= lt!329651 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329656 mask!3328) lt!329656 lt!329654 mask!3328))))

(assert (=> b!742358 (= lt!329656 (select (store (arr!19871 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742358 (= lt!329654 (array!41515 (store (arr!19871 a!3186) i!1173 k0!2102) (size!20292 a!3186)))))

(declare-fun b!742359 () Bool)

(assert (=> b!742359 (= e!414844 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19871 a!3186) j!159) a!3186 mask!3328) (Found!7468 j!159)))))

(declare-fun b!742360 () Bool)

(assert (=> b!742360 (= e!414848 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19871 a!3186) j!159) a!3186 mask!3328) lt!329657))))

(declare-fun b!742361 () Bool)

(assert (=> b!742361 (= e!414849 (not e!414842))))

(declare-fun res!499668 () Bool)

(assert (=> b!742361 (=> res!499668 e!414842)))

(get-info :version)

(assert (=> b!742361 (= res!499668 (or (not ((_ is Intermediate!7468) lt!329653)) (bvslt x!1131 (x!63221 lt!329653)) (not (= x!1131 (x!63221 lt!329653))) (not (= index!1321 (index!32242 lt!329653)))))))

(assert (=> b!742361 e!414843))

(declare-fun res!499660 () Bool)

(assert (=> b!742361 (=> (not res!499660) (not e!414843))))

(assert (=> b!742361 (= res!499660 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25388 0))(
  ( (Unit!25389) )
))
(declare-fun lt!329650 () Unit!25388)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25388)

(assert (=> b!742361 (= lt!329650 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65324 res!499663) b!742345))

(assert (= (and b!742345 res!499665) b!742351))

(assert (= (and b!742351 res!499672) b!742356))

(assert (= (and b!742356 res!499661) b!742357))

(assert (= (and b!742357 res!499666) b!742348))

(assert (= (and b!742348 res!499670) b!742346))

(assert (= (and b!742346 res!499667) b!742349))

(assert (= (and b!742349 res!499659) b!742353))

(assert (= (and b!742353 res!499673) b!742355))

(assert (= (and b!742355 res!499674) b!742350))

(assert (= (and b!742350 res!499664) b!742344))

(assert (= (and b!742344 c!81723) b!742354))

(assert (= (and b!742344 (not c!81723)) b!742359))

(assert (= (and b!742344 res!499671) b!742358))

(assert (= (and b!742358 res!499669) b!742361))

(assert (= (and b!742361 res!499660) b!742347))

(assert (= (and b!742347 res!499662) b!742360))

(assert (= (and b!742361 (not res!499668)) b!742352))

(declare-fun m!692675 () Bool)

(assert (=> start!65324 m!692675))

(declare-fun m!692677 () Bool)

(assert (=> start!65324 m!692677))

(declare-fun m!692679 () Bool)

(assert (=> b!742361 m!692679))

(declare-fun m!692681 () Bool)

(assert (=> b!742361 m!692681))

(declare-fun m!692683 () Bool)

(assert (=> b!742350 m!692683))

(declare-fun m!692685 () Bool)

(assert (=> b!742358 m!692685))

(declare-fun m!692687 () Bool)

(assert (=> b!742358 m!692687))

(declare-fun m!692689 () Bool)

(assert (=> b!742358 m!692689))

(declare-fun m!692691 () Bool)

(assert (=> b!742358 m!692691))

(declare-fun m!692693 () Bool)

(assert (=> b!742358 m!692693))

(assert (=> b!742358 m!692685))

(declare-fun m!692695 () Bool)

(assert (=> b!742355 m!692695))

(assert (=> b!742355 m!692695))

(declare-fun m!692697 () Bool)

(assert (=> b!742355 m!692697))

(assert (=> b!742355 m!692697))

(assert (=> b!742355 m!692695))

(declare-fun m!692699 () Bool)

(assert (=> b!742355 m!692699))

(assert (=> b!742352 m!692695))

(assert (=> b!742352 m!692695))

(declare-fun m!692701 () Bool)

(assert (=> b!742352 m!692701))

(declare-fun m!692703 () Bool)

(assert (=> b!742356 m!692703))

(assert (=> b!742351 m!692695))

(assert (=> b!742351 m!692695))

(declare-fun m!692705 () Bool)

(assert (=> b!742351 m!692705))

(declare-fun m!692707 () Bool)

(assert (=> b!742357 m!692707))

(declare-fun m!692709 () Bool)

(assert (=> b!742349 m!692709))

(assert (=> b!742360 m!692695))

(assert (=> b!742360 m!692695))

(declare-fun m!692711 () Bool)

(assert (=> b!742360 m!692711))

(assert (=> b!742359 m!692695))

(assert (=> b!742359 m!692695))

(assert (=> b!742359 m!692701))

(declare-fun m!692713 () Bool)

(assert (=> b!742346 m!692713))

(assert (=> b!742354 m!692695))

(assert (=> b!742354 m!692695))

(declare-fun m!692715 () Bool)

(assert (=> b!742354 m!692715))

(assert (=> b!742347 m!692695))

(assert (=> b!742347 m!692695))

(declare-fun m!692717 () Bool)

(assert (=> b!742347 m!692717))

(declare-fun m!692719 () Bool)

(assert (=> b!742348 m!692719))

(check-sat (not start!65324) (not b!742349) (not b!742361) (not b!742351) (not b!742360) (not b!742346) (not b!742354) (not b!742358) (not b!742352) (not b!742357) (not b!742348) (not b!742359) (not b!742347) (not b!742355) (not b!742356))
(check-sat)
