; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65418 () Bool)

(assert start!65418)

(declare-datatypes ((array!41591 0))(
  ( (array!41592 (arr!19909 (Array (_ BitVec 32) (_ BitVec 64))) (size!20330 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41591)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!744727 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7509 0))(
  ( (MissingZero!7509 (index!32404 (_ BitVec 32))) (Found!7509 (index!32405 (_ BitVec 32))) (Intermediate!7509 (undefined!8321 Bool) (index!32406 (_ BitVec 32)) (x!63363 (_ BitVec 32))) (Undefined!7509) (MissingVacant!7509 (index!32407 (_ BitVec 32))) )
))
(declare-fun lt!330844 () SeekEntryResult!7509)

(declare-fun e!415998 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41591 (_ BitVec 32)) SeekEntryResult!7509)

(assert (=> b!744727 (= e!415998 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19909 a!3186) j!159) a!3186 mask!3328) lt!330844))))

(declare-fun b!744728 () Bool)

(declare-fun res!501692 () Bool)

(declare-fun e!416002 () Bool)

(assert (=> b!744728 (=> (not res!501692) (not e!416002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744728 (= res!501692 (validKeyInArray!0 (select (arr!19909 a!3186) j!159)))))

(declare-fun b!744729 () Bool)

(declare-fun res!501694 () Bool)

(declare-fun e!415999 () Bool)

(assert (=> b!744729 (=> (not res!501694) (not e!415999))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744729 (= res!501694 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19909 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744730 () Bool)

(declare-fun e!416000 () Bool)

(declare-fun e!415996 () Bool)

(assert (=> b!744730 (= e!416000 e!415996)))

(declare-fun res!501681 () Bool)

(assert (=> b!744730 (=> (not res!501681) (not e!415996))))

(declare-fun lt!330849 () SeekEntryResult!7509)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41591 (_ BitVec 32)) SeekEntryResult!7509)

(assert (=> b!744730 (= res!501681 (= (seekEntryOrOpen!0 (select (arr!19909 a!3186) j!159) a!3186 mask!3328) lt!330849))))

(assert (=> b!744730 (= lt!330849 (Found!7509 j!159))))

(declare-fun res!501695 () Bool)

(assert (=> start!65418 (=> (not res!501695) (not e!416002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65418 (= res!501695 (validMask!0 mask!3328))))

(assert (=> start!65418 e!416002))

(assert (=> start!65418 true))

(declare-fun array_inv!15705 (array!41591) Bool)

(assert (=> start!65418 (array_inv!15705 a!3186)))

(declare-fun b!744731 () Bool)

(declare-fun res!501688 () Bool)

(declare-fun e!415995 () Bool)

(assert (=> b!744731 (=> (not res!501688) (not e!415995))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744731 (= res!501688 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20330 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20330 a!3186))))))

(declare-fun b!744732 () Bool)

(declare-fun res!501685 () Bool)

(assert (=> b!744732 (=> (not res!501685) (not e!416002))))

(assert (=> b!744732 (= res!501685 (and (= (size!20330 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20330 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20330 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744733 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41591 (_ BitVec 32)) SeekEntryResult!7509)

(assert (=> b!744733 (= e!415996 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19909 a!3186) j!159) a!3186 mask!3328) lt!330849))))

(declare-fun b!744734 () Bool)

(assert (=> b!744734 (= e!415998 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19909 a!3186) j!159) a!3186 mask!3328) (Found!7509 j!159)))))

(declare-fun b!744735 () Bool)

(declare-fun e!415997 () Bool)

(declare-fun e!416003 () Bool)

(assert (=> b!744735 (= e!415997 (not e!416003))))

(declare-fun res!501684 () Bool)

(assert (=> b!744735 (=> res!501684 e!416003)))

(declare-fun lt!330847 () SeekEntryResult!7509)

(get-info :version)

(assert (=> b!744735 (= res!501684 (or (not ((_ is Intermediate!7509) lt!330847)) (bvslt x!1131 (x!63363 lt!330847)) (not (= x!1131 (x!63363 lt!330847))) (not (= index!1321 (index!32406 lt!330847)))))))

(assert (=> b!744735 e!416000))

(declare-fun res!501680 () Bool)

(assert (=> b!744735 (=> (not res!501680) (not e!416000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41591 (_ BitVec 32)) Bool)

(assert (=> b!744735 (= res!501680 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25498 0))(
  ( (Unit!25499) )
))
(declare-fun lt!330843 () Unit!25498)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41591 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25498)

(assert (=> b!744735 (= lt!330843 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744736 () Bool)

(declare-fun res!501686 () Bool)

(assert (=> b!744736 (=> (not res!501686) (not e!416002))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!744736 (= res!501686 (validKeyInArray!0 k0!2102))))

(declare-fun b!744737 () Bool)

(declare-fun res!501693 () Bool)

(assert (=> b!744737 (=> (not res!501693) (not e!415995))))

(declare-datatypes ((List!13911 0))(
  ( (Nil!13908) (Cons!13907 (h!14979 (_ BitVec 64)) (t!20226 List!13911)) )
))
(declare-fun arrayNoDuplicates!0 (array!41591 (_ BitVec 32) List!13911) Bool)

(assert (=> b!744737 (= res!501693 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13908))))

(declare-fun b!744738 () Bool)

(assert (=> b!744738 (= e!416002 e!415995)))

(declare-fun res!501689 () Bool)

(assert (=> b!744738 (=> (not res!501689) (not e!415995))))

(declare-fun lt!330850 () SeekEntryResult!7509)

(assert (=> b!744738 (= res!501689 (or (= lt!330850 (MissingZero!7509 i!1173)) (= lt!330850 (MissingVacant!7509 i!1173))))))

(assert (=> b!744738 (= lt!330850 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744739 () Bool)

(declare-fun res!501682 () Bool)

(assert (=> b!744739 (=> (not res!501682) (not e!416002))))

(declare-fun arrayContainsKey!0 (array!41591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744739 (= res!501682 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744740 () Bool)

(assert (=> b!744740 (= e!416003 true)))

(declare-fun lt!330851 () SeekEntryResult!7509)

(assert (=> b!744740 (= lt!330851 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19909 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!744741 () Bool)

(assert (=> b!744741 (= e!415995 e!415999)))

(declare-fun res!501690 () Bool)

(assert (=> b!744741 (=> (not res!501690) (not e!415999))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744741 (= res!501690 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19909 a!3186) j!159) mask!3328) (select (arr!19909 a!3186) j!159) a!3186 mask!3328) lt!330844))))

(assert (=> b!744741 (= lt!330844 (Intermediate!7509 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!744742 () Bool)

(declare-fun res!501691 () Bool)

(assert (=> b!744742 (=> (not res!501691) (not e!415999))))

(assert (=> b!744742 (= res!501691 e!415998)))

(declare-fun c!81904 () Bool)

(assert (=> b!744742 (= c!81904 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744743 () Bool)

(declare-fun res!501683 () Bool)

(assert (=> b!744743 (=> (not res!501683) (not e!415995))))

(assert (=> b!744743 (= res!501683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744744 () Bool)

(assert (=> b!744744 (= e!415999 e!415997)))

(declare-fun res!501687 () Bool)

(assert (=> b!744744 (=> (not res!501687) (not e!415997))))

(declare-fun lt!330846 () SeekEntryResult!7509)

(assert (=> b!744744 (= res!501687 (= lt!330846 lt!330847))))

(declare-fun lt!330848 () array!41591)

(declare-fun lt!330845 () (_ BitVec 64))

(assert (=> b!744744 (= lt!330847 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330845 lt!330848 mask!3328))))

(assert (=> b!744744 (= lt!330846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330845 mask!3328) lt!330845 lt!330848 mask!3328))))

(assert (=> b!744744 (= lt!330845 (select (store (arr!19909 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744744 (= lt!330848 (array!41592 (store (arr!19909 a!3186) i!1173 k0!2102) (size!20330 a!3186)))))

(assert (= (and start!65418 res!501695) b!744732))

(assert (= (and b!744732 res!501685) b!744728))

(assert (= (and b!744728 res!501692) b!744736))

(assert (= (and b!744736 res!501686) b!744739))

(assert (= (and b!744739 res!501682) b!744738))

(assert (= (and b!744738 res!501689) b!744743))

(assert (= (and b!744743 res!501683) b!744737))

(assert (= (and b!744737 res!501693) b!744731))

(assert (= (and b!744731 res!501688) b!744741))

(assert (= (and b!744741 res!501690) b!744729))

(assert (= (and b!744729 res!501694) b!744742))

(assert (= (and b!744742 c!81904) b!744727))

(assert (= (and b!744742 (not c!81904)) b!744734))

(assert (= (and b!744742 res!501691) b!744744))

(assert (= (and b!744744 res!501687) b!744735))

(assert (= (and b!744735 res!501680) b!744730))

(assert (= (and b!744730 res!501681) b!744733))

(assert (= (and b!744735 (not res!501684)) b!744740))

(declare-fun m!695213 () Bool)

(assert (=> b!744740 m!695213))

(assert (=> b!744740 m!695213))

(declare-fun m!695215 () Bool)

(assert (=> b!744740 m!695215))

(declare-fun m!695217 () Bool)

(assert (=> b!744738 m!695217))

(declare-fun m!695219 () Bool)

(assert (=> b!744744 m!695219))

(declare-fun m!695221 () Bool)

(assert (=> b!744744 m!695221))

(declare-fun m!695223 () Bool)

(assert (=> b!744744 m!695223))

(declare-fun m!695225 () Bool)

(assert (=> b!744744 m!695225))

(assert (=> b!744744 m!695225))

(declare-fun m!695227 () Bool)

(assert (=> b!744744 m!695227))

(declare-fun m!695229 () Bool)

(assert (=> b!744736 m!695229))

(declare-fun m!695231 () Bool)

(assert (=> b!744737 m!695231))

(declare-fun m!695233 () Bool)

(assert (=> b!744739 m!695233))

(declare-fun m!695235 () Bool)

(assert (=> b!744743 m!695235))

(assert (=> b!744741 m!695213))

(assert (=> b!744741 m!695213))

(declare-fun m!695237 () Bool)

(assert (=> b!744741 m!695237))

(assert (=> b!744741 m!695237))

(assert (=> b!744741 m!695213))

(declare-fun m!695239 () Bool)

(assert (=> b!744741 m!695239))

(assert (=> b!744727 m!695213))

(assert (=> b!744727 m!695213))

(declare-fun m!695241 () Bool)

(assert (=> b!744727 m!695241))

(assert (=> b!744733 m!695213))

(assert (=> b!744733 m!695213))

(declare-fun m!695243 () Bool)

(assert (=> b!744733 m!695243))

(assert (=> b!744728 m!695213))

(assert (=> b!744728 m!695213))

(declare-fun m!695245 () Bool)

(assert (=> b!744728 m!695245))

(assert (=> b!744734 m!695213))

(assert (=> b!744734 m!695213))

(assert (=> b!744734 m!695215))

(declare-fun m!695247 () Bool)

(assert (=> b!744735 m!695247))

(declare-fun m!695249 () Bool)

(assert (=> b!744735 m!695249))

(declare-fun m!695251 () Bool)

(assert (=> b!744729 m!695251))

(declare-fun m!695253 () Bool)

(assert (=> start!65418 m!695253))

(declare-fun m!695255 () Bool)

(assert (=> start!65418 m!695255))

(assert (=> b!744730 m!695213))

(assert (=> b!744730 m!695213))

(declare-fun m!695257 () Bool)

(assert (=> b!744730 m!695257))

(check-sat (not b!744744) (not b!744727) (not b!744738) (not b!744740) (not b!744737) (not b!744743) (not b!744739) (not b!744728) (not b!744733) (not b!744730) (not start!65418) (not b!744734) (not b!744741) (not b!744736) (not b!744735))
(check-sat)
