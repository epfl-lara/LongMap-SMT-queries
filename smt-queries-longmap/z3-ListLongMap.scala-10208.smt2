; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120488 () Bool)

(assert start!120488)

(declare-fun res!938935 () Bool)

(declare-fun e!793333 () Bool)

(assert (=> start!120488 (=> (not res!938935) (not e!793333))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120488 (= res!938935 (validMask!0 mask!2840))))

(assert (=> start!120488 e!793333))

(assert (=> start!120488 true))

(declare-datatypes ((array!95819 0))(
  ( (array!95820 (arr!46258 (Array (_ BitVec 32) (_ BitVec 64))) (size!46809 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95819)

(declare-fun array_inv!35539 (array!95819) Bool)

(assert (=> start!120488 (array_inv!35539 a!2901)))

(declare-fun b!1401098 () Bool)

(declare-fun res!938930 () Bool)

(assert (=> b!1401098 (=> (not res!938930) (not e!793333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95819 (_ BitVec 32)) Bool)

(assert (=> b!1401098 (= res!938930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401099 () Bool)

(declare-fun res!938934 () Bool)

(assert (=> b!1401099 (=> (not res!938934) (not e!793333))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1401099 (= res!938934 (and (= (size!46809 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46809 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46809 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401100 () Bool)

(declare-fun e!793329 () Bool)

(assert (=> b!1401100 (= e!793329 true)))

(declare-datatypes ((SeekEntryResult!10478 0))(
  ( (MissingZero!10478 (index!44289 (_ BitVec 32))) (Found!10478 (index!44290 (_ BitVec 32))) (Intermediate!10478 (undefined!11290 Bool) (index!44291 (_ BitVec 32)) (x!126092 (_ BitVec 32))) (Undefined!10478) (MissingVacant!10478 (index!44292 (_ BitVec 32))) )
))
(declare-fun lt!616256 () SeekEntryResult!10478)

(declare-fun lt!616253 () array!95819)

(declare-fun lt!616259 () (_ BitVec 64))

(declare-fun lt!616257 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95819 (_ BitVec 32)) SeekEntryResult!10478)

(assert (=> b!1401100 (= lt!616256 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616257 lt!616259 lt!616253 mask!2840))))

(declare-fun b!1401101 () Bool)

(declare-fun lt!616252 () SeekEntryResult!10478)

(declare-fun e!793328 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95819 (_ BitVec 32)) SeekEntryResult!10478)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95819 (_ BitVec 32)) SeekEntryResult!10478)

(assert (=> b!1401101 (= e!793328 (= (seekEntryOrOpen!0 lt!616259 lt!616253 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126092 lt!616252) (index!44291 lt!616252) (index!44291 lt!616252) (select (arr!46258 a!2901) j!112) lt!616253 mask!2840)))))

(declare-fun b!1401102 () Bool)

(declare-fun res!938931 () Bool)

(assert (=> b!1401102 (=> (not res!938931) (not e!793333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401102 (= res!938931 (validKeyInArray!0 (select (arr!46258 a!2901) j!112)))))

(declare-fun b!1401103 () Bool)

(declare-fun res!938933 () Bool)

(assert (=> b!1401103 (=> (not res!938933) (not e!793333))))

(declare-datatypes ((List!32764 0))(
  ( (Nil!32761) (Cons!32760 (h!34016 (_ BitVec 64)) (t!47450 List!32764)) )
))
(declare-fun arrayNoDuplicates!0 (array!95819 (_ BitVec 32) List!32764) Bool)

(assert (=> b!1401103 (= res!938933 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32761))))

(declare-fun e!793330 () Bool)

(declare-fun b!1401104 () Bool)

(assert (=> b!1401104 (= e!793330 (= (seekEntryOrOpen!0 (select (arr!46258 a!2901) j!112) a!2901 mask!2840) (Found!10478 j!112)))))

(declare-fun b!1401105 () Bool)

(declare-fun e!793331 () Bool)

(assert (=> b!1401105 (= e!793333 (not e!793331))))

(declare-fun res!938932 () Bool)

(assert (=> b!1401105 (=> res!938932 e!793331)))

(declare-fun lt!616258 () SeekEntryResult!10478)

(get-info :version)

(assert (=> b!1401105 (= res!938932 (or (not ((_ is Intermediate!10478) lt!616258)) (undefined!11290 lt!616258)))))

(assert (=> b!1401105 e!793330))

(declare-fun res!938928 () Bool)

(assert (=> b!1401105 (=> (not res!938928) (not e!793330))))

(assert (=> b!1401105 (= res!938928 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46987 0))(
  ( (Unit!46988) )
))
(declare-fun lt!616254 () Unit!46987)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46987)

(assert (=> b!1401105 (= lt!616254 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401105 (= lt!616258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616257 (select (arr!46258 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401105 (= lt!616257 (toIndex!0 (select (arr!46258 a!2901) j!112) mask!2840))))

(declare-fun b!1401106 () Bool)

(declare-fun res!938926 () Bool)

(assert (=> b!1401106 (=> (not res!938926) (not e!793333))))

(assert (=> b!1401106 (= res!938926 (validKeyInArray!0 (select (arr!46258 a!2901) i!1037)))))

(declare-fun b!1401107 () Bool)

(declare-fun e!793334 () Bool)

(assert (=> b!1401107 (= e!793331 e!793334)))

(declare-fun res!938925 () Bool)

(assert (=> b!1401107 (=> res!938925 e!793334)))

(assert (=> b!1401107 (= res!938925 (or (= lt!616258 lt!616252) (not ((_ is Intermediate!10478) lt!616252))))))

(assert (=> b!1401107 (= lt!616252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616259 mask!2840) lt!616259 lt!616253 mask!2840))))

(assert (=> b!1401107 (= lt!616259 (select (store (arr!46258 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401107 (= lt!616253 (array!95820 (store (arr!46258 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46809 a!2901)))))

(declare-fun b!1401108 () Bool)

(assert (=> b!1401108 (= e!793334 e!793329)))

(declare-fun res!938927 () Bool)

(assert (=> b!1401108 (=> res!938927 e!793329)))

(assert (=> b!1401108 (= res!938927 (or (bvslt (x!126092 lt!616258) #b00000000000000000000000000000000) (bvsgt (x!126092 lt!616258) #b01111111111111111111111111111110) (bvslt (x!126092 lt!616252) #b00000000000000000000000000000000) (bvsgt (x!126092 lt!616252) #b01111111111111111111111111111110) (bvslt lt!616257 #b00000000000000000000000000000000) (bvsge lt!616257 (size!46809 a!2901)) (bvslt (index!44291 lt!616258) #b00000000000000000000000000000000) (bvsge (index!44291 lt!616258) (size!46809 a!2901)) (bvslt (index!44291 lt!616252) #b00000000000000000000000000000000) (bvsge (index!44291 lt!616252) (size!46809 a!2901)) (not (= lt!616258 (Intermediate!10478 false (index!44291 lt!616258) (x!126092 lt!616258)))) (not (= lt!616252 (Intermediate!10478 false (index!44291 lt!616252) (x!126092 lt!616252))))))))

(assert (=> b!1401108 e!793328))

(declare-fun res!938929 () Bool)

(assert (=> b!1401108 (=> (not res!938929) (not e!793328))))

(assert (=> b!1401108 (= res!938929 (and (not (undefined!11290 lt!616252)) (= (index!44291 lt!616252) i!1037) (bvslt (x!126092 lt!616252) (x!126092 lt!616258)) (= (select (store (arr!46258 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44291 lt!616252)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616255 () Unit!46987)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46987)

(assert (=> b!1401108 (= lt!616255 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616257 (x!126092 lt!616258) (index!44291 lt!616258) (x!126092 lt!616252) (index!44291 lt!616252) (undefined!11290 lt!616252) mask!2840))))

(assert (= (and start!120488 res!938935) b!1401099))

(assert (= (and b!1401099 res!938934) b!1401106))

(assert (= (and b!1401106 res!938926) b!1401102))

(assert (= (and b!1401102 res!938931) b!1401098))

(assert (= (and b!1401098 res!938930) b!1401103))

(assert (= (and b!1401103 res!938933) b!1401105))

(assert (= (and b!1401105 res!938928) b!1401104))

(assert (= (and b!1401105 (not res!938932)) b!1401107))

(assert (= (and b!1401107 (not res!938925)) b!1401108))

(assert (= (and b!1401108 res!938929) b!1401101))

(assert (= (and b!1401108 (not res!938927)) b!1401100))

(declare-fun m!1288621 () Bool)

(assert (=> start!120488 m!1288621))

(declare-fun m!1288623 () Bool)

(assert (=> start!120488 m!1288623))

(declare-fun m!1288625 () Bool)

(assert (=> b!1401106 m!1288625))

(assert (=> b!1401106 m!1288625))

(declare-fun m!1288627 () Bool)

(assert (=> b!1401106 m!1288627))

(declare-fun m!1288629 () Bool)

(assert (=> b!1401105 m!1288629))

(declare-fun m!1288631 () Bool)

(assert (=> b!1401105 m!1288631))

(declare-fun m!1288633 () Bool)

(assert (=> b!1401105 m!1288633))

(declare-fun m!1288635 () Bool)

(assert (=> b!1401105 m!1288635))

(assert (=> b!1401105 m!1288629))

(declare-fun m!1288637 () Bool)

(assert (=> b!1401105 m!1288637))

(assert (=> b!1401105 m!1288629))

(declare-fun m!1288639 () Bool)

(assert (=> b!1401098 m!1288639))

(declare-fun m!1288641 () Bool)

(assert (=> b!1401107 m!1288641))

(assert (=> b!1401107 m!1288641))

(declare-fun m!1288643 () Bool)

(assert (=> b!1401107 m!1288643))

(declare-fun m!1288645 () Bool)

(assert (=> b!1401107 m!1288645))

(declare-fun m!1288647 () Bool)

(assert (=> b!1401107 m!1288647))

(declare-fun m!1288649 () Bool)

(assert (=> b!1401101 m!1288649))

(assert (=> b!1401101 m!1288629))

(assert (=> b!1401101 m!1288629))

(declare-fun m!1288651 () Bool)

(assert (=> b!1401101 m!1288651))

(declare-fun m!1288653 () Bool)

(assert (=> b!1401100 m!1288653))

(assert (=> b!1401108 m!1288645))

(declare-fun m!1288655 () Bool)

(assert (=> b!1401108 m!1288655))

(declare-fun m!1288657 () Bool)

(assert (=> b!1401108 m!1288657))

(assert (=> b!1401102 m!1288629))

(assert (=> b!1401102 m!1288629))

(declare-fun m!1288659 () Bool)

(assert (=> b!1401102 m!1288659))

(declare-fun m!1288661 () Bool)

(assert (=> b!1401103 m!1288661))

(assert (=> b!1401104 m!1288629))

(assert (=> b!1401104 m!1288629))

(declare-fun m!1288663 () Bool)

(assert (=> b!1401104 m!1288663))

(check-sat (not start!120488) (not b!1401104) (not b!1401107) (not b!1401108) (not b!1401101) (not b!1401103) (not b!1401098) (not b!1401102) (not b!1401105) (not b!1401106) (not b!1401100))
(check-sat)
