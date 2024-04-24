; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65382 () Bool)

(assert start!65382)

(declare-fun res!497860 () Bool)

(declare-fun e!414193 () Bool)

(assert (=> start!65382 (=> (not res!497860) (not e!414193))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65382 (= res!497860 (validMask!0 mask!3328))))

(assert (=> start!65382 e!414193))

(assert (=> start!65382 true))

(declare-datatypes ((array!41425 0))(
  ( (array!41426 (arr!19822 (Array (_ BitVec 32) (_ BitVec 64))) (size!20242 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41425)

(declare-fun array_inv!15681 (array!41425) Bool)

(assert (=> start!65382 (array_inv!15681 a!3186)))

(declare-fun b!740669 () Bool)

(declare-datatypes ((Unit!25285 0))(
  ( (Unit!25286) )
))
(declare-fun e!414195 () Unit!25285)

(declare-fun Unit!25287 () Unit!25285)

(assert (=> b!740669 (= e!414195 Unit!25287)))

(declare-datatypes ((SeekEntryResult!7378 0))(
  ( (MissingZero!7378 (index!31880 (_ BitVec 32))) (Found!7378 (index!31881 (_ BitVec 32))) (Intermediate!7378 (undefined!8190 Bool) (index!31882 (_ BitVec 32)) (x!63028 (_ BitVec 32))) (Undefined!7378) (MissingVacant!7378 (index!31883 (_ BitVec 32))) )
))
(declare-fun lt!328956 () SeekEntryResult!7378)

(declare-fun lt!328954 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41425 (_ BitVec 32)) SeekEntryResult!7378)

(assert (=> b!740669 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328954 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328956)))

(declare-fun e!414194 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!740670 () Bool)

(assert (=> b!740670 (= e!414194 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328956))))

(declare-fun b!740671 () Bool)

(declare-fun Unit!25288 () Unit!25285)

(assert (=> b!740671 (= e!414195 Unit!25288)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!328947 () SeekEntryResult!7378)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41425 (_ BitVec 32)) SeekEntryResult!7378)

(assert (=> b!740671 (= lt!328947 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19822 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!328950 () SeekEntryResult!7378)

(assert (=> b!740671 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328954 resIntermediateIndex!5 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328950)))

(declare-fun b!740672 () Bool)

(declare-fun e!414196 () Bool)

(declare-fun e!414197 () Bool)

(assert (=> b!740672 (= e!414196 e!414197)))

(declare-fun res!497863 () Bool)

(assert (=> b!740672 (=> res!497863 e!414197)))

(assert (=> b!740672 (= res!497863 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328954 #b00000000000000000000000000000000) (bvsge lt!328954 (size!20242 a!3186))))))

(declare-fun lt!328951 () Unit!25285)

(assert (=> b!740672 (= lt!328951 e!414195)))

(declare-fun c!81797 () Bool)

(declare-fun lt!328943 () Bool)

(assert (=> b!740672 (= c!81797 lt!328943)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740672 (= lt!328943 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740672 (= lt!328954 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!740673 () Bool)

(declare-fun e!414204 () Bool)

(declare-fun e!414200 () Bool)

(assert (=> b!740673 (= e!414204 e!414200)))

(declare-fun res!497861 () Bool)

(assert (=> b!740673 (=> (not res!497861) (not e!414200))))

(declare-fun lt!328953 () SeekEntryResult!7378)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41425 (_ BitVec 32)) SeekEntryResult!7378)

(assert (=> b!740673 (= res!497861 (= (seekEntryOrOpen!0 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328953))))

(assert (=> b!740673 (= lt!328953 (Found!7378 j!159))))

(declare-fun b!740674 () Bool)

(assert (=> b!740674 (= e!414197 true)))

(declare-fun lt!328944 () SeekEntryResult!7378)

(declare-fun lt!328945 () (_ BitVec 64))

(declare-fun lt!328955 () array!41425)

(assert (=> b!740674 (= lt!328944 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328954 lt!328945 lt!328955 mask!3328))))

(declare-fun b!740675 () Bool)

(declare-fun res!497849 () Bool)

(assert (=> b!740675 (=> res!497849 e!414197)))

(declare-fun e!414198 () Bool)

(assert (=> b!740675 (= res!497849 e!414198)))

(declare-fun c!81796 () Bool)

(assert (=> b!740675 (= c!81796 lt!328943)))

(declare-fun b!740676 () Bool)

(declare-fun res!497848 () Bool)

(declare-fun e!414199 () Bool)

(assert (=> b!740676 (=> (not res!497848) (not e!414199))))

(assert (=> b!740676 (= res!497848 e!414194)))

(declare-fun c!81795 () Bool)

(assert (=> b!740676 (= c!81795 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740677 () Bool)

(declare-fun e!414203 () Bool)

(assert (=> b!740677 (= e!414199 e!414203)))

(declare-fun res!497854 () Bool)

(assert (=> b!740677 (=> (not res!497854) (not e!414203))))

(declare-fun lt!328946 () SeekEntryResult!7378)

(declare-fun lt!328948 () SeekEntryResult!7378)

(assert (=> b!740677 (= res!497854 (= lt!328946 lt!328948))))

(assert (=> b!740677 (= lt!328948 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328945 lt!328955 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740677 (= lt!328946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328945 mask!3328) lt!328945 lt!328955 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!740677 (= lt!328945 (select (store (arr!19822 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!740677 (= lt!328955 (array!41426 (store (arr!19822 a!3186) i!1173 k0!2102) (size!20242 a!3186)))))

(declare-fun b!740678 () Bool)

(declare-fun e!414201 () Bool)

(assert (=> b!740678 (= e!414201 e!414199)))

(declare-fun res!497851 () Bool)

(assert (=> b!740678 (=> (not res!497851) (not e!414199))))

(assert (=> b!740678 (= res!497851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19822 a!3186) j!159) mask!3328) (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328956))))

(assert (=> b!740678 (= lt!328956 (Intermediate!7378 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740679 () Bool)

(declare-fun res!497855 () Bool)

(assert (=> b!740679 (=> (not res!497855) (not e!414201))))

(declare-datatypes ((List!13731 0))(
  ( (Nil!13728) (Cons!13727 (h!14805 (_ BitVec 64)) (t!20038 List!13731)) )
))
(declare-fun arrayNoDuplicates!0 (array!41425 (_ BitVec 32) List!13731) Bool)

(assert (=> b!740679 (= res!497855 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13728))))

(declare-fun b!740680 () Bool)

(declare-fun res!497858 () Bool)

(assert (=> b!740680 (=> (not res!497858) (not e!414193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740680 (= res!497858 (validKeyInArray!0 k0!2102))))

(declare-fun b!740681 () Bool)

(declare-fun res!497856 () Bool)

(assert (=> b!740681 (=> (not res!497856) (not e!414201))))

(assert (=> b!740681 (= res!497856 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20242 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20242 a!3186))))))

(declare-fun b!740682 () Bool)

(declare-fun res!497853 () Bool)

(assert (=> b!740682 (=> (not res!497853) (not e!414193))))

(assert (=> b!740682 (= res!497853 (and (= (size!20242 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20242 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20242 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740683 () Bool)

(assert (=> b!740683 (= e!414198 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328954 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328956)))))

(declare-fun b!740684 () Bool)

(assert (=> b!740684 (= e!414198 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328954 resIntermediateIndex!5 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328950)))))

(declare-fun b!740685 () Bool)

(assert (=> b!740685 (= e!414193 e!414201)))

(declare-fun res!497859 () Bool)

(assert (=> b!740685 (=> (not res!497859) (not e!414201))))

(declare-fun lt!328949 () SeekEntryResult!7378)

(assert (=> b!740685 (= res!497859 (or (= lt!328949 (MissingZero!7378 i!1173)) (= lt!328949 (MissingVacant!7378 i!1173))))))

(assert (=> b!740685 (= lt!328949 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!740686 () Bool)

(declare-fun res!497862 () Bool)

(assert (=> b!740686 (=> (not res!497862) (not e!414193))))

(assert (=> b!740686 (= res!497862 (validKeyInArray!0 (select (arr!19822 a!3186) j!159)))))

(declare-fun b!740687 () Bool)

(assert (=> b!740687 (= e!414200 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) lt!328953))))

(declare-fun b!740688 () Bool)

(assert (=> b!740688 (= e!414203 (not e!414196))))

(declare-fun res!497852 () Bool)

(assert (=> b!740688 (=> res!497852 e!414196)))

(get-info :version)

(assert (=> b!740688 (= res!497852 (or (not ((_ is Intermediate!7378) lt!328948)) (bvsge x!1131 (x!63028 lt!328948))))))

(assert (=> b!740688 (= lt!328950 (Found!7378 j!159))))

(assert (=> b!740688 e!414204))

(declare-fun res!497857 () Bool)

(assert (=> b!740688 (=> (not res!497857) (not e!414204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41425 (_ BitVec 32)) Bool)

(assert (=> b!740688 (= res!497857 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328952 () Unit!25285)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25285)

(assert (=> b!740688 (= lt!328952 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740689 () Bool)

(declare-fun res!497846 () Bool)

(assert (=> b!740689 (=> (not res!497846) (not e!414193))))

(declare-fun arrayContainsKey!0 (array!41425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740689 (= res!497846 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740690 () Bool)

(declare-fun res!497847 () Bool)

(assert (=> b!740690 (=> (not res!497847) (not e!414201))))

(assert (=> b!740690 (= res!497847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740691 () Bool)

(declare-fun res!497850 () Bool)

(assert (=> b!740691 (=> (not res!497850) (not e!414199))))

(assert (=> b!740691 (= res!497850 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19822 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740692 () Bool)

(assert (=> b!740692 (= e!414194 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19822 a!3186) j!159) a!3186 mask!3328) (Found!7378 j!159)))))

(assert (= (and start!65382 res!497860) b!740682))

(assert (= (and b!740682 res!497853) b!740686))

(assert (= (and b!740686 res!497862) b!740680))

(assert (= (and b!740680 res!497858) b!740689))

(assert (= (and b!740689 res!497846) b!740685))

(assert (= (and b!740685 res!497859) b!740690))

(assert (= (and b!740690 res!497847) b!740679))

(assert (= (and b!740679 res!497855) b!740681))

(assert (= (and b!740681 res!497856) b!740678))

(assert (= (and b!740678 res!497851) b!740691))

(assert (= (and b!740691 res!497850) b!740676))

(assert (= (and b!740676 c!81795) b!740670))

(assert (= (and b!740676 (not c!81795)) b!740692))

(assert (= (and b!740676 res!497848) b!740677))

(assert (= (and b!740677 res!497854) b!740688))

(assert (= (and b!740688 res!497857) b!740673))

(assert (= (and b!740673 res!497861) b!740687))

(assert (= (and b!740688 (not res!497852)) b!740672))

(assert (= (and b!740672 c!81797) b!740669))

(assert (= (and b!740672 (not c!81797)) b!740671))

(assert (= (and b!740672 (not res!497863)) b!740675))

(assert (= (and b!740675 c!81796) b!740683))

(assert (= (and b!740675 (not c!81796)) b!740684))

(assert (= (and b!740675 (not res!497849)) b!740674))

(declare-fun m!692343 () Bool)

(assert (=> b!740684 m!692343))

(assert (=> b!740684 m!692343))

(declare-fun m!692345 () Bool)

(assert (=> b!740684 m!692345))

(assert (=> b!740673 m!692343))

(assert (=> b!740673 m!692343))

(declare-fun m!692347 () Bool)

(assert (=> b!740673 m!692347))

(declare-fun m!692349 () Bool)

(assert (=> b!740685 m!692349))

(assert (=> b!740686 m!692343))

(assert (=> b!740686 m!692343))

(declare-fun m!692351 () Bool)

(assert (=> b!740686 m!692351))

(assert (=> b!740678 m!692343))

(assert (=> b!740678 m!692343))

(declare-fun m!692353 () Bool)

(assert (=> b!740678 m!692353))

(assert (=> b!740678 m!692353))

(assert (=> b!740678 m!692343))

(declare-fun m!692355 () Bool)

(assert (=> b!740678 m!692355))

(declare-fun m!692357 () Bool)

(assert (=> b!740690 m!692357))

(declare-fun m!692359 () Bool)

(assert (=> b!740674 m!692359))

(declare-fun m!692361 () Bool)

(assert (=> b!740691 m!692361))

(assert (=> b!740670 m!692343))

(assert (=> b!740670 m!692343))

(declare-fun m!692363 () Bool)

(assert (=> b!740670 m!692363))

(declare-fun m!692365 () Bool)

(assert (=> b!740679 m!692365))

(declare-fun m!692367 () Bool)

(assert (=> b!740688 m!692367))

(declare-fun m!692369 () Bool)

(assert (=> b!740688 m!692369))

(declare-fun m!692371 () Bool)

(assert (=> b!740680 m!692371))

(declare-fun m!692373 () Bool)

(assert (=> b!740677 m!692373))

(declare-fun m!692375 () Bool)

(assert (=> b!740677 m!692375))

(declare-fun m!692377 () Bool)

(assert (=> b!740677 m!692377))

(declare-fun m!692379 () Bool)

(assert (=> b!740677 m!692379))

(declare-fun m!692381 () Bool)

(assert (=> b!740677 m!692381))

(assert (=> b!740677 m!692375))

(assert (=> b!740687 m!692343))

(assert (=> b!740687 m!692343))

(declare-fun m!692383 () Bool)

(assert (=> b!740687 m!692383))

(assert (=> b!740671 m!692343))

(assert (=> b!740671 m!692343))

(declare-fun m!692385 () Bool)

(assert (=> b!740671 m!692385))

(assert (=> b!740671 m!692343))

(assert (=> b!740671 m!692345))

(assert (=> b!740683 m!692343))

(assert (=> b!740683 m!692343))

(declare-fun m!692387 () Bool)

(assert (=> b!740683 m!692387))

(declare-fun m!692389 () Bool)

(assert (=> b!740672 m!692389))

(declare-fun m!692391 () Bool)

(assert (=> start!65382 m!692391))

(declare-fun m!692393 () Bool)

(assert (=> start!65382 m!692393))

(declare-fun m!692395 () Bool)

(assert (=> b!740689 m!692395))

(assert (=> b!740669 m!692343))

(assert (=> b!740669 m!692343))

(assert (=> b!740669 m!692387))

(assert (=> b!740692 m!692343))

(assert (=> b!740692 m!692343))

(assert (=> b!740692 m!692385))

(check-sat (not b!740679) (not b!740685) (not b!740672) (not b!740680) (not b!740674) (not b!740670) (not b!740671) (not b!740683) (not b!740677) (not start!65382) (not b!740686) (not b!740669) (not b!740692) (not b!740690) (not b!740689) (not b!740673) (not b!740688) (not b!740678) (not b!740684) (not b!740687))
(check-sat)
