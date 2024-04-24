; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64588 () Bool)

(assert start!64588)

(declare-fun b!726825 () Bool)

(declare-fun res!487661 () Bool)

(declare-fun e!406981 () Bool)

(assert (=> b!726825 (=> (not res!487661) (not e!406981))))

(declare-datatypes ((array!41039 0))(
  ( (array!41040 (arr!19638 (Array (_ BitVec 32) (_ BitVec 64))) (size!20058 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41039)

(declare-datatypes ((List!13547 0))(
  ( (Nil!13544) (Cons!13543 (h!14603 (_ BitVec 64)) (t!19854 List!13547)) )
))
(declare-fun arrayNoDuplicates!0 (array!41039 (_ BitVec 32) List!13547) Bool)

(assert (=> b!726825 (= res!487661 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13544))))

(declare-fun b!726826 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!406980 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7194 0))(
  ( (MissingZero!7194 (index!31144 (_ BitVec 32))) (Found!7194 (index!31145 (_ BitVec 32))) (Intermediate!7194 (undefined!8006 Bool) (index!31146 (_ BitVec 32)) (x!62279 (_ BitVec 32))) (Undefined!7194) (MissingVacant!7194 (index!31147 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41039 (_ BitVec 32)) SeekEntryResult!7194)

(assert (=> b!726826 (= e!406980 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19638 a!3186) j!159) a!3186 mask!3328) (Found!7194 j!159)))))

(declare-fun b!726827 () Bool)

(declare-fun res!487666 () Bool)

(assert (=> b!726827 (=> (not res!487666) (not e!406981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41039 (_ BitVec 32)) Bool)

(assert (=> b!726827 (= res!487666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726828 () Bool)

(declare-fun e!406983 () Bool)

(declare-fun e!406982 () Bool)

(assert (=> b!726828 (= e!406983 e!406982)))

(declare-fun res!487665 () Bool)

(assert (=> b!726828 (=> (not res!487665) (not e!406982))))

(declare-fun lt!321881 () SeekEntryResult!7194)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41039 (_ BitVec 32)) SeekEntryResult!7194)

(assert (=> b!726828 (= res!487665 (= (seekEntryOrOpen!0 (select (arr!19638 a!3186) j!159) a!3186 mask!3328) lt!321881))))

(assert (=> b!726828 (= lt!321881 (Found!7194 j!159))))

(declare-fun b!726829 () Bool)

(declare-fun res!487659 () Bool)

(declare-fun e!406986 () Bool)

(assert (=> b!726829 (=> (not res!487659) (not e!406986))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726829 (= res!487659 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19638 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!321885 () SeekEntryResult!7194)

(declare-fun b!726830 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41039 (_ BitVec 32)) SeekEntryResult!7194)

(assert (=> b!726830 (= e!406980 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19638 a!3186) j!159) a!3186 mask!3328) lt!321885))))

(declare-fun b!726831 () Bool)

(declare-fun res!487657 () Bool)

(declare-fun e!406979 () Bool)

(assert (=> b!726831 (=> (not res!487657) (not e!406979))))

(assert (=> b!726831 (= res!487657 (and (= (size!20058 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20058 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20058 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726832 () Bool)

(assert (=> b!726832 (= e!406981 e!406986)))

(declare-fun res!487663 () Bool)

(assert (=> b!726832 (=> (not res!487663) (not e!406986))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726832 (= res!487663 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19638 a!3186) j!159) mask!3328) (select (arr!19638 a!3186) j!159) a!3186 mask!3328) lt!321885))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726832 (= lt!321885 (Intermediate!7194 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726833 () Bool)

(declare-fun res!487658 () Bool)

(assert (=> b!726833 (=> (not res!487658) (not e!406979))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726833 (= res!487658 (validKeyInArray!0 (select (arr!19638 a!3186) j!159)))))

(declare-fun b!726834 () Bool)

(declare-fun res!487655 () Bool)

(assert (=> b!726834 (=> (not res!487655) (not e!406979))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726834 (= res!487655 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726835 () Bool)

(assert (=> b!726835 (= e!406979 e!406981)))

(declare-fun res!487656 () Bool)

(assert (=> b!726835 (=> (not res!487656) (not e!406981))))

(declare-fun lt!321882 () SeekEntryResult!7194)

(assert (=> b!726835 (= res!487656 (or (= lt!321882 (MissingZero!7194 i!1173)) (= lt!321882 (MissingVacant!7194 i!1173))))))

(assert (=> b!726835 (= lt!321882 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!726836 () Bool)

(assert (=> b!726836 (= e!406982 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19638 a!3186) j!159) a!3186 mask!3328) lt!321881))))

(declare-fun b!726837 () Bool)

(declare-fun res!487664 () Bool)

(assert (=> b!726837 (=> (not res!487664) (not e!406981))))

(assert (=> b!726837 (= res!487664 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20058 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20058 a!3186))))))

(declare-fun res!487662 () Bool)

(assert (=> start!64588 (=> (not res!487662) (not e!406979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64588 (= res!487662 (validMask!0 mask!3328))))

(assert (=> start!64588 e!406979))

(assert (=> start!64588 true))

(declare-fun array_inv!15497 (array!41039) Bool)

(assert (=> start!64588 (array_inv!15497 a!3186)))

(declare-fun b!726838 () Bool)

(declare-fun res!487653 () Bool)

(assert (=> b!726838 (=> (not res!487653) (not e!406979))))

(assert (=> b!726838 (= res!487653 (validKeyInArray!0 k!2102))))

(declare-fun b!726839 () Bool)

(declare-fun e!406984 () Bool)

(assert (=> b!726839 (= e!406986 e!406984)))

(declare-fun res!487652 () Bool)

(assert (=> b!726839 (=> (not res!487652) (not e!406984))))

(declare-fun lt!321878 () SeekEntryResult!7194)

(declare-fun lt!321880 () SeekEntryResult!7194)

(assert (=> b!726839 (= res!487652 (= lt!321878 lt!321880))))

(declare-fun lt!321883 () array!41039)

(declare-fun lt!321879 () (_ BitVec 64))

(assert (=> b!726839 (= lt!321880 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321879 lt!321883 mask!3328))))

(assert (=> b!726839 (= lt!321878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321879 mask!3328) lt!321879 lt!321883 mask!3328))))

(assert (=> b!726839 (= lt!321879 (select (store (arr!19638 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!726839 (= lt!321883 (array!41040 (store (arr!19638 a!3186) i!1173 k!2102) (size!20058 a!3186)))))

(declare-fun b!726840 () Bool)

(declare-fun res!487654 () Bool)

(assert (=> b!726840 (=> (not res!487654) (not e!406986))))

(assert (=> b!726840 (= res!487654 e!406980)))

(declare-fun c!79961 () Bool)

(assert (=> b!726840 (= c!79961 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726841 () Bool)

(assert (=> b!726841 (= e!406984 (not (or (not (is-Intermediate!7194 lt!321880)) (bvsge x!1131 (x!62279 lt!321880)) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(assert (=> b!726841 e!406983))

(declare-fun res!487660 () Bool)

(assert (=> b!726841 (=> (not res!487660) (not e!406983))))

(assert (=> b!726841 (= res!487660 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24785 0))(
  ( (Unit!24786) )
))
(declare-fun lt!321884 () Unit!24785)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41039 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24785)

(assert (=> b!726841 (= lt!321884 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64588 res!487662) b!726831))

(assert (= (and b!726831 res!487657) b!726833))

(assert (= (and b!726833 res!487658) b!726838))

(assert (= (and b!726838 res!487653) b!726834))

(assert (= (and b!726834 res!487655) b!726835))

(assert (= (and b!726835 res!487656) b!726827))

(assert (= (and b!726827 res!487666) b!726825))

(assert (= (and b!726825 res!487661) b!726837))

(assert (= (and b!726837 res!487664) b!726832))

(assert (= (and b!726832 res!487663) b!726829))

(assert (= (and b!726829 res!487659) b!726840))

(assert (= (and b!726840 c!79961) b!726830))

(assert (= (and b!726840 (not c!79961)) b!726826))

(assert (= (and b!726840 res!487654) b!726839))

(assert (= (and b!726839 res!487652) b!726841))

(assert (= (and b!726841 res!487660) b!726828))

(assert (= (and b!726828 res!487665) b!726836))

(declare-fun m!681401 () Bool)

(assert (=> b!726828 m!681401))

(assert (=> b!726828 m!681401))

(declare-fun m!681403 () Bool)

(assert (=> b!726828 m!681403))

(declare-fun m!681405 () Bool)

(assert (=> b!726839 m!681405))

(declare-fun m!681407 () Bool)

(assert (=> b!726839 m!681407))

(declare-fun m!681409 () Bool)

(assert (=> b!726839 m!681409))

(declare-fun m!681411 () Bool)

(assert (=> b!726839 m!681411))

(declare-fun m!681413 () Bool)

(assert (=> b!726839 m!681413))

(assert (=> b!726839 m!681405))

(assert (=> b!726832 m!681401))

(assert (=> b!726832 m!681401))

(declare-fun m!681415 () Bool)

(assert (=> b!726832 m!681415))

(assert (=> b!726832 m!681415))

(assert (=> b!726832 m!681401))

(declare-fun m!681417 () Bool)

(assert (=> b!726832 m!681417))

(declare-fun m!681419 () Bool)

(assert (=> start!64588 m!681419))

(declare-fun m!681421 () Bool)

(assert (=> start!64588 m!681421))

(declare-fun m!681423 () Bool)

(assert (=> b!726834 m!681423))

(declare-fun m!681425 () Bool)

(assert (=> b!726827 m!681425))

(declare-fun m!681427 () Bool)

(assert (=> b!726841 m!681427))

(declare-fun m!681429 () Bool)

(assert (=> b!726841 m!681429))

(assert (=> b!726836 m!681401))

(assert (=> b!726836 m!681401))

(declare-fun m!681431 () Bool)

(assert (=> b!726836 m!681431))

(declare-fun m!681433 () Bool)

(assert (=> b!726838 m!681433))

(assert (=> b!726833 m!681401))

(assert (=> b!726833 m!681401))

(declare-fun m!681435 () Bool)

(assert (=> b!726833 m!681435))

(assert (=> b!726830 m!681401))

(assert (=> b!726830 m!681401))

(declare-fun m!681437 () Bool)

(assert (=> b!726830 m!681437))

(declare-fun m!681439 () Bool)

(assert (=> b!726825 m!681439))

(declare-fun m!681441 () Bool)

(assert (=> b!726829 m!681441))

(assert (=> b!726826 m!681401))

(assert (=> b!726826 m!681401))

(declare-fun m!681443 () Bool)

(assert (=> b!726826 m!681443))

(declare-fun m!681445 () Bool)

(assert (=> b!726835 m!681445))

(push 1)

(assert (not b!726839))

(assert (not b!726826))

(assert (not b!726825))

(assert (not b!726827))

(assert (not b!726832))

(assert (not b!726830))

(assert (not b!726835))

(assert (not b!726841))

(assert (not b!726833))

(assert (not b!726838))

(assert (not start!64588))

(assert (not b!726834))

(assert (not b!726836))

(assert (not b!726828))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

