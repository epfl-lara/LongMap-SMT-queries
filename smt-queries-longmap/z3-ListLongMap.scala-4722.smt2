; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65520 () Bool)

(assert start!65520)

(declare-fun b!744761 () Bool)

(declare-fun res!501367 () Bool)

(declare-fun e!416122 () Bool)

(assert (=> b!744761 (=> (not res!501367) (not e!416122))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41563 0))(
  ( (array!41564 (arr!19891 (Array (_ BitVec 32) (_ BitVec 64))) (size!20311 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41563)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744761 (= res!501367 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20311 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20311 a!3186))))))

(declare-fun b!744762 () Bool)

(declare-fun res!501365 () Bool)

(declare-fun e!416130 () Bool)

(assert (=> b!744762 (=> (not res!501365) (not e!416130))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!744762 (= res!501365 (and (= (size!20311 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20311 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20311 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!501357 () Bool)

(assert (=> start!65520 (=> (not res!501357) (not e!416130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65520 (= res!501357 (validMask!0 mask!3328))))

(assert (=> start!65520 e!416130))

(assert (=> start!65520 true))

(declare-fun array_inv!15750 (array!41563) Bool)

(assert (=> start!65520 (array_inv!15750 a!3186)))

(declare-fun b!744763 () Bool)

(declare-fun e!416126 () Bool)

(declare-datatypes ((SeekEntryResult!7447 0))(
  ( (MissingZero!7447 (index!32156 (_ BitVec 32))) (Found!7447 (index!32157 (_ BitVec 32))) (Intermediate!7447 (undefined!8259 Bool) (index!32158 (_ BitVec 32)) (x!63281 (_ BitVec 32))) (Undefined!7447) (MissingVacant!7447 (index!32159 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41563 (_ BitVec 32)) SeekEntryResult!7447)

(assert (=> b!744763 (= e!416126 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19891 a!3186) j!159) a!3186 mask!3328) (Found!7447 j!159)))))

(declare-fun b!744764 () Bool)

(assert (=> b!744764 (= e!416130 e!416122)))

(declare-fun res!501362 () Bool)

(assert (=> b!744764 (=> (not res!501362) (not e!416122))))

(declare-fun lt!330822 () SeekEntryResult!7447)

(assert (=> b!744764 (= res!501362 (or (= lt!330822 (MissingZero!7447 i!1173)) (= lt!330822 (MissingVacant!7447 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41563 (_ BitVec 32)) SeekEntryResult!7447)

(assert (=> b!744764 (= lt!330822 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!744765 () Bool)

(declare-fun e!416123 () Bool)

(declare-fun e!416127 () Bool)

(assert (=> b!744765 (= e!416123 e!416127)))

(declare-fun res!501361 () Bool)

(assert (=> b!744765 (=> (not res!501361) (not e!416127))))

(declare-fun lt!330817 () SeekEntryResult!7447)

(declare-fun lt!330819 () SeekEntryResult!7447)

(assert (=> b!744765 (= res!501361 (= lt!330817 lt!330819))))

(declare-fun lt!330816 () (_ BitVec 64))

(declare-fun lt!330818 () array!41563)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41563 (_ BitVec 32)) SeekEntryResult!7447)

(assert (=> b!744765 (= lt!330819 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330816 lt!330818 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744765 (= lt!330817 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330816 mask!3328) lt!330816 lt!330818 mask!3328))))

(assert (=> b!744765 (= lt!330816 (select (store (arr!19891 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!744765 (= lt!330818 (array!41564 (store (arr!19891 a!3186) i!1173 k0!2102) (size!20311 a!3186)))))

(declare-fun b!744766 () Bool)

(declare-fun res!501353 () Bool)

(assert (=> b!744766 (=> (not res!501353) (not e!416122))))

(declare-datatypes ((List!13800 0))(
  ( (Nil!13797) (Cons!13796 (h!14874 (_ BitVec 64)) (t!20107 List!13800)) )
))
(declare-fun arrayNoDuplicates!0 (array!41563 (_ BitVec 32) List!13800) Bool)

(assert (=> b!744766 (= res!501353 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13797))))

(declare-fun b!744767 () Bool)

(declare-fun res!501364 () Bool)

(assert (=> b!744767 (=> (not res!501364) (not e!416130))))

(declare-fun arrayContainsKey!0 (array!41563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744767 (= res!501364 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!744768 () Bool)

(declare-fun res!501359 () Bool)

(assert (=> b!744768 (=> (not res!501359) (not e!416123))))

(assert (=> b!744768 (= res!501359 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19891 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744769 () Bool)

(declare-fun lt!330821 () SeekEntryResult!7447)

(declare-fun e!416124 () Bool)

(assert (=> b!744769 (= e!416124 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19891 a!3186) j!159) a!3186 mask!3328) lt!330821))))

(declare-fun b!744770 () Bool)

(declare-fun e!416129 () Bool)

(assert (=> b!744770 (= e!416129 e!416124)))

(declare-fun res!501352 () Bool)

(assert (=> b!744770 (=> (not res!501352) (not e!416124))))

(assert (=> b!744770 (= res!501352 (= (seekEntryOrOpen!0 (select (arr!19891 a!3186) j!159) a!3186 mask!3328) lt!330821))))

(assert (=> b!744770 (= lt!330821 (Found!7447 j!159))))

(declare-fun b!744771 () Bool)

(declare-fun res!501366 () Bool)

(assert (=> b!744771 (=> (not res!501366) (not e!416130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744771 (= res!501366 (validKeyInArray!0 k0!2102))))

(declare-fun b!744772 () Bool)

(declare-fun e!416128 () Bool)

(assert (=> b!744772 (= e!416128 true)))

(declare-fun lt!330815 () SeekEntryResult!7447)

(assert (=> b!744772 (= lt!330815 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19891 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!744773 () Bool)

(declare-fun res!501354 () Bool)

(assert (=> b!744773 (=> (not res!501354) (not e!416123))))

(assert (=> b!744773 (= res!501354 e!416126)))

(declare-fun c!82088 () Bool)

(assert (=> b!744773 (= c!82088 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!330820 () SeekEntryResult!7447)

(declare-fun b!744774 () Bool)

(assert (=> b!744774 (= e!416126 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19891 a!3186) j!159) a!3186 mask!3328) lt!330820))))

(declare-fun b!744775 () Bool)

(declare-fun res!501358 () Bool)

(assert (=> b!744775 (=> (not res!501358) (not e!416122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41563 (_ BitVec 32)) Bool)

(assert (=> b!744775 (= res!501358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744776 () Bool)

(assert (=> b!744776 (= e!416127 (not e!416128))))

(declare-fun res!501363 () Bool)

(assert (=> b!744776 (=> res!501363 e!416128)))

(get-info :version)

(assert (=> b!744776 (= res!501363 (or (not ((_ is Intermediate!7447) lt!330819)) (bvslt x!1131 (x!63281 lt!330819)) (not (= x!1131 (x!63281 lt!330819))) (not (= index!1321 (index!32158 lt!330819)))))))

(assert (=> b!744776 e!416129))

(declare-fun res!501360 () Bool)

(assert (=> b!744776 (=> (not res!501360) (not e!416129))))

(assert (=> b!744776 (= res!501360 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25453 0))(
  ( (Unit!25454) )
))
(declare-fun lt!330814 () Unit!25453)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25453)

(assert (=> b!744776 (= lt!330814 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744777 () Bool)

(declare-fun res!501355 () Bool)

(assert (=> b!744777 (=> (not res!501355) (not e!416130))))

(assert (=> b!744777 (= res!501355 (validKeyInArray!0 (select (arr!19891 a!3186) j!159)))))

(declare-fun b!744778 () Bool)

(assert (=> b!744778 (= e!416122 e!416123)))

(declare-fun res!501356 () Bool)

(assert (=> b!744778 (=> (not res!501356) (not e!416123))))

(assert (=> b!744778 (= res!501356 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19891 a!3186) j!159) mask!3328) (select (arr!19891 a!3186) j!159) a!3186 mask!3328) lt!330820))))

(assert (=> b!744778 (= lt!330820 (Intermediate!7447 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65520 res!501357) b!744762))

(assert (= (and b!744762 res!501365) b!744777))

(assert (= (and b!744777 res!501355) b!744771))

(assert (= (and b!744771 res!501366) b!744767))

(assert (= (and b!744767 res!501364) b!744764))

(assert (= (and b!744764 res!501362) b!744775))

(assert (= (and b!744775 res!501358) b!744766))

(assert (= (and b!744766 res!501353) b!744761))

(assert (= (and b!744761 res!501367) b!744778))

(assert (= (and b!744778 res!501356) b!744768))

(assert (= (and b!744768 res!501359) b!744773))

(assert (= (and b!744773 c!82088) b!744774))

(assert (= (and b!744773 (not c!82088)) b!744763))

(assert (= (and b!744773 res!501354) b!744765))

(assert (= (and b!744765 res!501361) b!744776))

(assert (= (and b!744776 res!501360) b!744770))

(assert (= (and b!744770 res!501352) b!744769))

(assert (= (and b!744776 (not res!501363)) b!744772))

(declare-fun m!695769 () Bool)

(assert (=> b!744771 m!695769))

(declare-fun m!695771 () Bool)

(assert (=> b!744778 m!695771))

(assert (=> b!744778 m!695771))

(declare-fun m!695773 () Bool)

(assert (=> b!744778 m!695773))

(assert (=> b!744778 m!695773))

(assert (=> b!744778 m!695771))

(declare-fun m!695775 () Bool)

(assert (=> b!744778 m!695775))

(assert (=> b!744770 m!695771))

(assert (=> b!744770 m!695771))

(declare-fun m!695777 () Bool)

(assert (=> b!744770 m!695777))

(declare-fun m!695779 () Bool)

(assert (=> b!744775 m!695779))

(assert (=> b!744774 m!695771))

(assert (=> b!744774 m!695771))

(declare-fun m!695781 () Bool)

(assert (=> b!744774 m!695781))

(declare-fun m!695783 () Bool)

(assert (=> start!65520 m!695783))

(declare-fun m!695785 () Bool)

(assert (=> start!65520 m!695785))

(declare-fun m!695787 () Bool)

(assert (=> b!744768 m!695787))

(declare-fun m!695789 () Bool)

(assert (=> b!744765 m!695789))

(declare-fun m!695791 () Bool)

(assert (=> b!744765 m!695791))

(declare-fun m!695793 () Bool)

(assert (=> b!744765 m!695793))

(declare-fun m!695795 () Bool)

(assert (=> b!744765 m!695795))

(assert (=> b!744765 m!695789))

(declare-fun m!695797 () Bool)

(assert (=> b!744765 m!695797))

(assert (=> b!744763 m!695771))

(assert (=> b!744763 m!695771))

(declare-fun m!695799 () Bool)

(assert (=> b!744763 m!695799))

(declare-fun m!695801 () Bool)

(assert (=> b!744776 m!695801))

(declare-fun m!695803 () Bool)

(assert (=> b!744776 m!695803))

(assert (=> b!744777 m!695771))

(assert (=> b!744777 m!695771))

(declare-fun m!695805 () Bool)

(assert (=> b!744777 m!695805))

(declare-fun m!695807 () Bool)

(assert (=> b!744767 m!695807))

(assert (=> b!744769 m!695771))

(assert (=> b!744769 m!695771))

(declare-fun m!695809 () Bool)

(assert (=> b!744769 m!695809))

(declare-fun m!695811 () Bool)

(assert (=> b!744766 m!695811))

(declare-fun m!695813 () Bool)

(assert (=> b!744764 m!695813))

(assert (=> b!744772 m!695771))

(assert (=> b!744772 m!695771))

(assert (=> b!744772 m!695799))

(check-sat (not b!744771) (not b!744777) (not start!65520) (not b!744776) (not b!744763) (not b!744766) (not b!744765) (not b!744764) (not b!744778) (not b!744770) (not b!744769) (not b!744775) (not b!744772) (not b!744767) (not b!744774))
(check-sat)
