; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67750 () Bool)

(assert start!67750)

(declare-fun b!786587 () Bool)

(declare-datatypes ((Unit!27220 0))(
  ( (Unit!27221) )
))
(declare-fun e!437256 () Unit!27220)

(declare-fun Unit!27222 () Unit!27220)

(assert (=> b!786587 (= e!437256 Unit!27222)))

(assert (=> b!786587 false))

(declare-fun b!786588 () Bool)

(declare-fun e!437259 () Bool)

(declare-fun e!437258 () Bool)

(assert (=> b!786588 (= e!437259 e!437258)))

(declare-fun res!532610 () Bool)

(assert (=> b!786588 (=> (not res!532610) (not e!437258))))

(declare-datatypes ((array!42790 0))(
  ( (array!42791 (arr!20483 (Array (_ BitVec 32) (_ BitVec 64))) (size!20904 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42790)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8083 0))(
  ( (MissingZero!8083 (index!34700 (_ BitVec 32))) (Found!8083 (index!34701 (_ BitVec 32))) (Intermediate!8083 (undefined!8895 Bool) (index!34702 (_ BitVec 32)) (x!65639 (_ BitVec 32))) (Undefined!8083) (MissingVacant!8083 (index!34703 (_ BitVec 32))) )
))
(declare-fun lt!350816 () SeekEntryResult!8083)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42790 (_ BitVec 32)) SeekEntryResult!8083)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786588 (= res!532610 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20483 a!3186) j!159) mask!3328) (select (arr!20483 a!3186) j!159) a!3186 mask!3328) lt!350816))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786588 (= lt!350816 (Intermediate!8083 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786589 () Bool)

(declare-fun res!532613 () Bool)

(declare-fun e!437263 () Bool)

(assert (=> b!786589 (=> (not res!532613) (not e!437263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786589 (= res!532613 (validKeyInArray!0 (select (arr!20483 a!3186) j!159)))))

(declare-fun b!786590 () Bool)

(declare-fun e!437264 () Bool)

(declare-fun e!437261 () Bool)

(assert (=> b!786590 (= e!437264 e!437261)))

(declare-fun res!532623 () Bool)

(assert (=> b!786590 (=> res!532623 e!437261)))

(declare-fun lt!350814 () (_ BitVec 64))

(declare-fun lt!350809 () (_ BitVec 64))

(assert (=> b!786590 (= res!532623 (= lt!350814 lt!350809))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!786590 (= lt!350814 (select (store (arr!20483 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!786591 () Bool)

(declare-fun e!437253 () Bool)

(declare-fun lt!350808 () SeekEntryResult!8083)

(declare-fun lt!350813 () SeekEntryResult!8083)

(assert (=> b!786591 (= e!437253 (= lt!350808 lt!350813))))

(declare-fun b!786592 () Bool)

(assert (=> b!786592 (= e!437263 e!437259)))

(declare-fun res!532627 () Bool)

(assert (=> b!786592 (=> (not res!532627) (not e!437259))))

(declare-fun lt!350810 () SeekEntryResult!8083)

(assert (=> b!786592 (= res!532627 (or (= lt!350810 (MissingZero!8083 i!1173)) (= lt!350810 (MissingVacant!8083 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42790 (_ BitVec 32)) SeekEntryResult!8083)

(assert (=> b!786592 (= lt!350810 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!532612 () Bool)

(assert (=> start!67750 (=> (not res!532612) (not e!437263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67750 (= res!532612 (validMask!0 mask!3328))))

(assert (=> start!67750 e!437263))

(assert (=> start!67750 true))

(declare-fun array_inv!16279 (array!42790) Bool)

(assert (=> start!67750 (array_inv!16279 a!3186)))

(declare-fun b!786593 () Bool)

(declare-fun res!532628 () Bool)

(assert (=> b!786593 (=> (not res!532628) (not e!437259))))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!786593 (= res!532628 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20904 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20904 a!3186))))))

(declare-fun b!786594 () Bool)

(declare-fun res!532611 () Bool)

(assert (=> b!786594 (=> (not res!532611) (not e!437259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42790 (_ BitVec 32)) Bool)

(assert (=> b!786594 (= res!532611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786595 () Bool)

(declare-fun e!437254 () Bool)

(assert (=> b!786595 (= e!437254 e!437264)))

(declare-fun res!532617 () Bool)

(assert (=> b!786595 (=> res!532617 e!437264)))

(declare-fun lt!350811 () SeekEntryResult!8083)

(assert (=> b!786595 (= res!532617 (not (= lt!350813 lt!350811)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42790 (_ BitVec 32)) SeekEntryResult!8083)

(assert (=> b!786595 (= lt!350813 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20483 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786596 () Bool)

(declare-fun res!532626 () Bool)

(assert (=> b!786596 (=> (not res!532626) (not e!437253))))

(declare-fun lt!350806 () array!42790)

(assert (=> b!786596 (= res!532626 (= (seekEntryOrOpen!0 lt!350809 lt!350806 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350809 lt!350806 mask!3328)))))

(declare-fun b!786597 () Bool)

(declare-fun res!532616 () Bool)

(assert (=> b!786597 (=> (not res!532616) (not e!437259))))

(declare-datatypes ((List!14485 0))(
  ( (Nil!14482) (Cons!14481 (h!15604 (_ BitVec 64)) (t!20800 List!14485)) )
))
(declare-fun arrayNoDuplicates!0 (array!42790 (_ BitVec 32) List!14485) Bool)

(assert (=> b!786597 (= res!532616 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14482))))

(declare-fun b!786598 () Bool)

(declare-fun res!532615 () Bool)

(assert (=> b!786598 (=> (not res!532615) (not e!437263))))

(assert (=> b!786598 (= res!532615 (validKeyInArray!0 k!2102))))

(declare-fun e!437255 () Bool)

(declare-fun b!786599 () Bool)

(assert (=> b!786599 (= e!437255 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20483 a!3186) j!159) a!3186 mask!3328) (Found!8083 j!159)))))

(declare-fun b!786600 () Bool)

(declare-fun res!532614 () Bool)

(assert (=> b!786600 (=> (not res!532614) (not e!437263))))

(declare-fun arrayContainsKey!0 (array!42790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786600 (= res!532614 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786601 () Bool)

(declare-fun Unit!27223 () Unit!27220)

(assert (=> b!786601 (= e!437256 Unit!27223)))

(declare-fun b!786602 () Bool)

(assert (=> b!786602 (= e!437255 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20483 a!3186) j!159) a!3186 mask!3328) lt!350816))))

(declare-fun b!786603 () Bool)

(declare-fun res!532624 () Bool)

(assert (=> b!786603 (=> (not res!532624) (not e!437258))))

(assert (=> b!786603 (= res!532624 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20483 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786604 () Bool)

(declare-fun e!437262 () Bool)

(assert (=> b!786604 (= e!437258 e!437262)))

(declare-fun res!532619 () Bool)

(assert (=> b!786604 (=> (not res!532619) (not e!437262))))

(declare-fun lt!350815 () SeekEntryResult!8083)

(declare-fun lt!350805 () SeekEntryResult!8083)

(assert (=> b!786604 (= res!532619 (= lt!350815 lt!350805))))

(assert (=> b!786604 (= lt!350805 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350809 lt!350806 mask!3328))))

(assert (=> b!786604 (= lt!350815 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350809 mask!3328) lt!350809 lt!350806 mask!3328))))

(assert (=> b!786604 (= lt!350809 (select (store (arr!20483 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!786604 (= lt!350806 (array!42791 (store (arr!20483 a!3186) i!1173 k!2102) (size!20904 a!3186)))))

(declare-fun b!786605 () Bool)

(declare-fun res!532625 () Bool)

(assert (=> b!786605 (=> (not res!532625) (not e!437258))))

(assert (=> b!786605 (= res!532625 e!437255)))

(declare-fun c!87397 () Bool)

(assert (=> b!786605 (= c!87397 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786606 () Bool)

(assert (=> b!786606 (= e!437262 (not e!437254))))

(declare-fun res!532618 () Bool)

(assert (=> b!786606 (=> res!532618 e!437254)))

(assert (=> b!786606 (= res!532618 (or (not (is-Intermediate!8083 lt!350805)) (bvslt x!1131 (x!65639 lt!350805)) (not (= x!1131 (x!65639 lt!350805))) (not (= index!1321 (index!34702 lt!350805)))))))

(declare-fun e!437260 () Bool)

(assert (=> b!786606 e!437260))

(declare-fun res!532621 () Bool)

(assert (=> b!786606 (=> (not res!532621) (not e!437260))))

(assert (=> b!786606 (= res!532621 (= lt!350808 lt!350811))))

(assert (=> b!786606 (= lt!350811 (Found!8083 j!159))))

(assert (=> b!786606 (= lt!350808 (seekEntryOrOpen!0 (select (arr!20483 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!786606 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350807 () Unit!27220)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27220)

(assert (=> b!786606 (= lt!350807 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786607 () Bool)

(declare-fun res!532620 () Bool)

(assert (=> b!786607 (=> (not res!532620) (not e!437263))))

(assert (=> b!786607 (= res!532620 (and (= (size!20904 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20904 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20904 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786608 () Bool)

(assert (=> b!786608 (= e!437260 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20483 a!3186) j!159) a!3186 mask!3328) lt!350811))))

(declare-fun b!786609 () Bool)

(assert (=> b!786609 (= e!437261 true)))

(assert (=> b!786609 e!437253))

(declare-fun res!532622 () Bool)

(assert (=> b!786609 (=> (not res!532622) (not e!437253))))

(assert (=> b!786609 (= res!532622 (= lt!350814 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350812 () Unit!27220)

(assert (=> b!786609 (= lt!350812 e!437256)))

(declare-fun c!87396 () Bool)

(assert (=> b!786609 (= c!87396 (= lt!350814 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!67750 res!532612) b!786607))

(assert (= (and b!786607 res!532620) b!786589))

(assert (= (and b!786589 res!532613) b!786598))

(assert (= (and b!786598 res!532615) b!786600))

(assert (= (and b!786600 res!532614) b!786592))

(assert (= (and b!786592 res!532627) b!786594))

(assert (= (and b!786594 res!532611) b!786597))

(assert (= (and b!786597 res!532616) b!786593))

(assert (= (and b!786593 res!532628) b!786588))

(assert (= (and b!786588 res!532610) b!786603))

(assert (= (and b!786603 res!532624) b!786605))

(assert (= (and b!786605 c!87397) b!786602))

(assert (= (and b!786605 (not c!87397)) b!786599))

(assert (= (and b!786605 res!532625) b!786604))

(assert (= (and b!786604 res!532619) b!786606))

(assert (= (and b!786606 res!532621) b!786608))

(assert (= (and b!786606 (not res!532618)) b!786595))

(assert (= (and b!786595 (not res!532617)) b!786590))

(assert (= (and b!786590 (not res!532623)) b!786609))

(assert (= (and b!786609 c!87396) b!786587))

(assert (= (and b!786609 (not c!87396)) b!786601))

(assert (= (and b!786609 res!532622) b!786596))

(assert (= (and b!786596 res!532626) b!786591))

(declare-fun m!728377 () Bool)

(assert (=> b!786598 m!728377))

(declare-fun m!728379 () Bool)

(assert (=> b!786603 m!728379))

(declare-fun m!728381 () Bool)

(assert (=> b!786608 m!728381))

(assert (=> b!786608 m!728381))

(declare-fun m!728383 () Bool)

(assert (=> b!786608 m!728383))

(declare-fun m!728385 () Bool)

(assert (=> b!786594 m!728385))

(declare-fun m!728387 () Bool)

(assert (=> start!67750 m!728387))

(declare-fun m!728389 () Bool)

(assert (=> start!67750 m!728389))

(assert (=> b!786606 m!728381))

(assert (=> b!786606 m!728381))

(declare-fun m!728391 () Bool)

(assert (=> b!786606 m!728391))

(declare-fun m!728393 () Bool)

(assert (=> b!786606 m!728393))

(declare-fun m!728395 () Bool)

(assert (=> b!786606 m!728395))

(declare-fun m!728397 () Bool)

(assert (=> b!786590 m!728397))

(declare-fun m!728399 () Bool)

(assert (=> b!786590 m!728399))

(declare-fun m!728401 () Bool)

(assert (=> b!786592 m!728401))

(declare-fun m!728403 () Bool)

(assert (=> b!786600 m!728403))

(assert (=> b!786604 m!728397))

(declare-fun m!728405 () Bool)

(assert (=> b!786604 m!728405))

(declare-fun m!728407 () Bool)

(assert (=> b!786604 m!728407))

(declare-fun m!728409 () Bool)

(assert (=> b!786604 m!728409))

(assert (=> b!786604 m!728405))

(declare-fun m!728411 () Bool)

(assert (=> b!786604 m!728411))

(assert (=> b!786589 m!728381))

(assert (=> b!786589 m!728381))

(declare-fun m!728413 () Bool)

(assert (=> b!786589 m!728413))

(declare-fun m!728415 () Bool)

(assert (=> b!786597 m!728415))

(assert (=> b!786595 m!728381))

(assert (=> b!786595 m!728381))

(declare-fun m!728417 () Bool)

(assert (=> b!786595 m!728417))

(assert (=> b!786602 m!728381))

(assert (=> b!786602 m!728381))

(declare-fun m!728419 () Bool)

(assert (=> b!786602 m!728419))

(assert (=> b!786588 m!728381))

(assert (=> b!786588 m!728381))

(declare-fun m!728421 () Bool)

(assert (=> b!786588 m!728421))

(assert (=> b!786588 m!728421))

(assert (=> b!786588 m!728381))

(declare-fun m!728423 () Bool)

(assert (=> b!786588 m!728423))

(assert (=> b!786599 m!728381))

(assert (=> b!786599 m!728381))

(assert (=> b!786599 m!728417))

(declare-fun m!728425 () Bool)

(assert (=> b!786596 m!728425))

(declare-fun m!728427 () Bool)

(assert (=> b!786596 m!728427))

(push 1)

