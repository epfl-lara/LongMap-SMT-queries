; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65922 () Bool)

(assert start!65922)

(declare-fun b!757551 () Bool)

(declare-fun e!422468 () Bool)

(declare-datatypes ((SeekEntryResult!7648 0))(
  ( (MissingZero!7648 (index!32960 (_ BitVec 32))) (Found!7648 (index!32961 (_ BitVec 32))) (Intermediate!7648 (undefined!8460 Bool) (index!32962 (_ BitVec 32)) (x!64018 (_ BitVec 32))) (Undefined!7648) (MissingVacant!7648 (index!32963 (_ BitVec 32))) )
))
(declare-fun lt!337294 () SeekEntryResult!7648)

(declare-fun lt!337291 () SeekEntryResult!7648)

(assert (=> b!757551 (= e!422468 (= lt!337294 lt!337291))))

(declare-fun b!757552 () Bool)

(declare-fun res!512064 () Bool)

(declare-fun e!422475 () Bool)

(assert (=> b!757552 (=> (not res!512064) (not e!422475))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757552 (= res!512064 (validKeyInArray!0 k0!2102))))

(declare-fun res!512057 () Bool)

(assert (=> start!65922 (=> (not res!512057) (not e!422475))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65922 (= res!512057 (validMask!0 mask!3328))))

(assert (=> start!65922 e!422475))

(assert (=> start!65922 true))

(declare-datatypes ((array!41965 0))(
  ( (array!41966 (arr!20092 (Array (_ BitVec 32) (_ BitVec 64))) (size!20512 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41965)

(declare-fun array_inv!15951 (array!41965) Bool)

(assert (=> start!65922 (array_inv!15951 a!3186)))

(declare-fun b!757553 () Bool)

(declare-fun res!512066 () Bool)

(assert (=> b!757553 (=> (not res!512066) (not e!422468))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!337296 () (_ BitVec 64))

(declare-fun lt!337301 () array!41965)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41965 (_ BitVec 32)) SeekEntryResult!7648)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41965 (_ BitVec 32)) SeekEntryResult!7648)

(assert (=> b!757553 (= res!512066 (= (seekEntryOrOpen!0 lt!337296 lt!337301 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337296 lt!337301 mask!3328)))))

(declare-fun b!757554 () Bool)

(declare-datatypes ((Unit!26149 0))(
  ( (Unit!26150) )
))
(declare-fun e!422470 () Unit!26149)

(declare-fun Unit!26151 () Unit!26149)

(assert (=> b!757554 (= e!422470 Unit!26151)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!422473 () Bool)

(declare-fun b!757555 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!757555 (= e!422473 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20092 a!3186) j!159) a!3186 mask!3328) (Found!7648 j!159)))))

(declare-fun b!757556 () Bool)

(declare-fun e!422472 () Bool)

(declare-fun e!422469 () Bool)

(assert (=> b!757556 (= e!422472 e!422469)))

(declare-fun res!512054 () Bool)

(assert (=> b!757556 (=> res!512054 e!422469)))

(declare-fun lt!337302 () SeekEntryResult!7648)

(assert (=> b!757556 (= res!512054 (not (= lt!337291 lt!337302)))))

(assert (=> b!757556 (= lt!337291 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20092 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757557 () Bool)

(declare-fun res!512060 () Bool)

(declare-fun e!422467 () Bool)

(assert (=> b!757557 (=> (not res!512060) (not e!422467))))

(assert (=> b!757557 (= res!512060 e!422473)))

(declare-fun c!83134 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757557 (= c!83134 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757558 () Bool)

(declare-fun res!512055 () Bool)

(assert (=> b!757558 (=> (not res!512055) (not e!422475))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!757558 (= res!512055 (and (= (size!20512 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20512 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20512 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757559 () Bool)

(declare-fun res!512063 () Bool)

(assert (=> b!757559 (=> (not res!512063) (not e!422467))))

(assert (=> b!757559 (= res!512063 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20092 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757560 () Bool)

(declare-fun Unit!26152 () Unit!26149)

(assert (=> b!757560 (= e!422470 Unit!26152)))

(assert (=> b!757560 false))

(declare-fun b!757561 () Bool)

(declare-fun e!422465 () Bool)

(assert (=> b!757561 (= e!422467 e!422465)))

(declare-fun res!512062 () Bool)

(assert (=> b!757561 (=> (not res!512062) (not e!422465))))

(declare-fun lt!337298 () SeekEntryResult!7648)

(declare-fun lt!337300 () SeekEntryResult!7648)

(assert (=> b!757561 (= res!512062 (= lt!337298 lt!337300))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41965 (_ BitVec 32)) SeekEntryResult!7648)

(assert (=> b!757561 (= lt!337300 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337296 lt!337301 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757561 (= lt!337298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337296 mask!3328) lt!337296 lt!337301 mask!3328))))

(assert (=> b!757561 (= lt!337296 (select (store (arr!20092 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!757561 (= lt!337301 (array!41966 (store (arr!20092 a!3186) i!1173 k0!2102) (size!20512 a!3186)))))

(declare-fun b!757562 () Bool)

(declare-fun res!512053 () Bool)

(declare-fun e!422471 () Bool)

(assert (=> b!757562 (=> (not res!512053) (not e!422471))))

(assert (=> b!757562 (= res!512053 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20512 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20512 a!3186))))))

(declare-fun b!757563 () Bool)

(declare-fun e!422474 () Bool)

(assert (=> b!757563 (= e!422469 e!422474)))

(declare-fun res!512065 () Bool)

(assert (=> b!757563 (=> res!512065 e!422474)))

(declare-fun lt!337292 () (_ BitVec 64))

(assert (=> b!757563 (= res!512065 (= lt!337292 lt!337296))))

(assert (=> b!757563 (= lt!337292 (select (store (arr!20092 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!757564 () Bool)

(declare-fun res!512068 () Bool)

(assert (=> b!757564 (=> (not res!512068) (not e!422475))))

(declare-fun arrayContainsKey!0 (array!41965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757564 (= res!512068 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!337293 () SeekEntryResult!7648)

(declare-fun b!757565 () Bool)

(assert (=> b!757565 (= e!422473 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20092 a!3186) j!159) a!3186 mask!3328) lt!337293))))

(declare-fun b!757566 () Bool)

(assert (=> b!757566 (= e!422465 (not e!422472))))

(declare-fun res!512059 () Bool)

(assert (=> b!757566 (=> res!512059 e!422472)))

(get-info :version)

(assert (=> b!757566 (= res!512059 (or (not ((_ is Intermediate!7648) lt!337300)) (bvslt x!1131 (x!64018 lt!337300)) (not (= x!1131 (x!64018 lt!337300))) (not (= index!1321 (index!32962 lt!337300)))))))

(declare-fun e!422464 () Bool)

(assert (=> b!757566 e!422464))

(declare-fun res!512067 () Bool)

(assert (=> b!757566 (=> (not res!512067) (not e!422464))))

(assert (=> b!757566 (= res!512067 (= lt!337294 lt!337302))))

(assert (=> b!757566 (= lt!337302 (Found!7648 j!159))))

(assert (=> b!757566 (= lt!337294 (seekEntryOrOpen!0 (select (arr!20092 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41965 (_ BitVec 32)) Bool)

(assert (=> b!757566 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337297 () Unit!26149)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26149)

(assert (=> b!757566 (= lt!337297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757567 () Bool)

(assert (=> b!757567 (= e!422475 e!422471)))

(declare-fun res!512058 () Bool)

(assert (=> b!757567 (=> (not res!512058) (not e!422471))))

(declare-fun lt!337299 () SeekEntryResult!7648)

(assert (=> b!757567 (= res!512058 (or (= lt!337299 (MissingZero!7648 i!1173)) (= lt!337299 (MissingVacant!7648 i!1173))))))

(assert (=> b!757567 (= lt!337299 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!757568 () Bool)

(assert (=> b!757568 (= e!422471 e!422467)))

(declare-fun res!512061 () Bool)

(assert (=> b!757568 (=> (not res!512061) (not e!422467))))

(assert (=> b!757568 (= res!512061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20092 a!3186) j!159) mask!3328) (select (arr!20092 a!3186) j!159) a!3186 mask!3328) lt!337293))))

(assert (=> b!757568 (= lt!337293 (Intermediate!7648 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757569 () Bool)

(declare-fun res!512050 () Bool)

(assert (=> b!757569 (=> (not res!512050) (not e!422471))))

(assert (=> b!757569 (= res!512050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757570 () Bool)

(assert (=> b!757570 (= e!422464 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20092 a!3186) j!159) a!3186 mask!3328) lt!337302))))

(declare-fun b!757571 () Bool)

(declare-fun res!512052 () Bool)

(assert (=> b!757571 (=> (not res!512052) (not e!422475))))

(assert (=> b!757571 (= res!512052 (validKeyInArray!0 (select (arr!20092 a!3186) j!159)))))

(declare-fun b!757572 () Bool)

(declare-fun res!512051 () Bool)

(assert (=> b!757572 (=> (not res!512051) (not e!422471))))

(declare-datatypes ((List!14001 0))(
  ( (Nil!13998) (Cons!13997 (h!15075 (_ BitVec 64)) (t!20308 List!14001)) )
))
(declare-fun arrayNoDuplicates!0 (array!41965 (_ BitVec 32) List!14001) Bool)

(assert (=> b!757572 (= res!512051 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13998))))

(declare-fun b!757573 () Bool)

(assert (=> b!757573 (= e!422474 true)))

(assert (=> b!757573 e!422468))

(declare-fun res!512056 () Bool)

(assert (=> b!757573 (=> (not res!512056) (not e!422468))))

(assert (=> b!757573 (= res!512056 (= lt!337292 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337295 () Unit!26149)

(assert (=> b!757573 (= lt!337295 e!422470)))

(declare-fun c!83135 () Bool)

(assert (=> b!757573 (= c!83135 (= lt!337292 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!65922 res!512057) b!757558))

(assert (= (and b!757558 res!512055) b!757571))

(assert (= (and b!757571 res!512052) b!757552))

(assert (= (and b!757552 res!512064) b!757564))

(assert (= (and b!757564 res!512068) b!757567))

(assert (= (and b!757567 res!512058) b!757569))

(assert (= (and b!757569 res!512050) b!757572))

(assert (= (and b!757572 res!512051) b!757562))

(assert (= (and b!757562 res!512053) b!757568))

(assert (= (and b!757568 res!512061) b!757559))

(assert (= (and b!757559 res!512063) b!757557))

(assert (= (and b!757557 c!83134) b!757565))

(assert (= (and b!757557 (not c!83134)) b!757555))

(assert (= (and b!757557 res!512060) b!757561))

(assert (= (and b!757561 res!512062) b!757566))

(assert (= (and b!757566 res!512067) b!757570))

(assert (= (and b!757566 (not res!512059)) b!757556))

(assert (= (and b!757556 (not res!512054)) b!757563))

(assert (= (and b!757563 (not res!512065)) b!757573))

(assert (= (and b!757573 c!83135) b!757560))

(assert (= (and b!757573 (not c!83135)) b!757554))

(assert (= (and b!757573 res!512056) b!757553))

(assert (= (and b!757553 res!512066) b!757551))

(declare-fun m!705831 () Bool)

(assert (=> b!757555 m!705831))

(assert (=> b!757555 m!705831))

(declare-fun m!705833 () Bool)

(assert (=> b!757555 m!705833))

(declare-fun m!705835 () Bool)

(assert (=> b!757553 m!705835))

(declare-fun m!705837 () Bool)

(assert (=> b!757553 m!705837))

(assert (=> b!757570 m!705831))

(assert (=> b!757570 m!705831))

(declare-fun m!705839 () Bool)

(assert (=> b!757570 m!705839))

(declare-fun m!705841 () Bool)

(assert (=> b!757552 m!705841))

(assert (=> b!757566 m!705831))

(assert (=> b!757566 m!705831))

(declare-fun m!705843 () Bool)

(assert (=> b!757566 m!705843))

(declare-fun m!705845 () Bool)

(assert (=> b!757566 m!705845))

(declare-fun m!705847 () Bool)

(assert (=> b!757566 m!705847))

(declare-fun m!705849 () Bool)

(assert (=> b!757569 m!705849))

(declare-fun m!705851 () Bool)

(assert (=> b!757564 m!705851))

(declare-fun m!705853 () Bool)

(assert (=> b!757572 m!705853))

(declare-fun m!705855 () Bool)

(assert (=> b!757563 m!705855))

(declare-fun m!705857 () Bool)

(assert (=> b!757563 m!705857))

(declare-fun m!705859 () Bool)

(assert (=> start!65922 m!705859))

(declare-fun m!705861 () Bool)

(assert (=> start!65922 m!705861))

(assert (=> b!757571 m!705831))

(assert (=> b!757571 m!705831))

(declare-fun m!705863 () Bool)

(assert (=> b!757571 m!705863))

(assert (=> b!757568 m!705831))

(assert (=> b!757568 m!705831))

(declare-fun m!705865 () Bool)

(assert (=> b!757568 m!705865))

(assert (=> b!757568 m!705865))

(assert (=> b!757568 m!705831))

(declare-fun m!705867 () Bool)

(assert (=> b!757568 m!705867))

(assert (=> b!757556 m!705831))

(assert (=> b!757556 m!705831))

(assert (=> b!757556 m!705833))

(declare-fun m!705869 () Bool)

(assert (=> b!757559 m!705869))

(declare-fun m!705871 () Bool)

(assert (=> b!757561 m!705871))

(declare-fun m!705873 () Bool)

(assert (=> b!757561 m!705873))

(assert (=> b!757561 m!705855))

(declare-fun m!705875 () Bool)

(assert (=> b!757561 m!705875))

(assert (=> b!757561 m!705871))

(declare-fun m!705877 () Bool)

(assert (=> b!757561 m!705877))

(declare-fun m!705879 () Bool)

(assert (=> b!757567 m!705879))

(assert (=> b!757565 m!705831))

(assert (=> b!757565 m!705831))

(declare-fun m!705881 () Bool)

(assert (=> b!757565 m!705881))

(check-sat (not b!757556) (not b!757561) (not b!757565) (not b!757564) (not b!757552) (not b!757567) (not start!65922) (not b!757553) (not b!757566) (not b!757569) (not b!757572) (not b!757568) (not b!757555) (not b!757571) (not b!757570))
(check-sat)
