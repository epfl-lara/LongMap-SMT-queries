; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65148 () Bool)

(assert start!65148)

(declare-fun b!736108 () Bool)

(declare-fun res!494691 () Bool)

(declare-fun e!411811 () Bool)

(assert (=> b!736108 (=> (not res!494691) (not e!411811))))

(declare-fun e!411809 () Bool)

(assert (=> b!736108 (= res!494691 e!411809)))

(declare-fun c!81096 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736108 (= c!81096 (bvsle x!1131 resIntermediateX!5))))

(declare-datatypes ((array!41321 0))(
  ( (array!41322 (arr!19774 (Array (_ BitVec 32) (_ BitVec 64))) (size!20195 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41321)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7374 0))(
  ( (MissingZero!7374 (index!31864 (_ BitVec 32))) (Found!7374 (index!31865 (_ BitVec 32))) (Intermediate!7374 (undefined!8186 Bool) (index!31866 (_ BitVec 32)) (x!62868 (_ BitVec 32))) (Undefined!7374) (MissingVacant!7374 (index!31867 (_ BitVec 32))) )
))
(declare-fun lt!326415 () SeekEntryResult!7374)

(declare-fun b!736109 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41321 (_ BitVec 32)) SeekEntryResult!7374)

(assert (=> b!736109 (= e!411809 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326415))))

(declare-fun b!736110 () Bool)

(declare-datatypes ((Unit!25092 0))(
  ( (Unit!25093) )
))
(declare-fun e!411808 () Unit!25092)

(declare-fun Unit!25094 () Unit!25092)

(assert (=> b!736110 (= e!411808 Unit!25094)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!326411 () SeekEntryResult!7374)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41321 (_ BitVec 32)) SeekEntryResult!7374)

(assert (=> b!736110 (= lt!326411 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19774 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!326404 () (_ BitVec 32))

(declare-fun lt!326413 () SeekEntryResult!7374)

(assert (=> b!736110 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326404 resIntermediateIndex!5 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326413)))

(declare-fun b!736111 () Bool)

(declare-fun e!411813 () Bool)

(declare-fun e!411816 () Bool)

(assert (=> b!736111 (= e!411813 e!411816)))

(declare-fun res!494681 () Bool)

(assert (=> b!736111 (=> (not res!494681) (not e!411816))))

(declare-fun lt!326417 () SeekEntryResult!7374)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41321 (_ BitVec 32)) SeekEntryResult!7374)

(assert (=> b!736111 (= res!494681 (= (seekEntryOrOpen!0 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326417))))

(assert (=> b!736111 (= lt!326417 (Found!7374 j!159))))

(declare-fun res!494685 () Bool)

(declare-fun e!411818 () Bool)

(assert (=> start!65148 (=> (not res!494685) (not e!411818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65148 (= res!494685 (validMask!0 mask!3328))))

(assert (=> start!65148 e!411818))

(assert (=> start!65148 true))

(declare-fun array_inv!15570 (array!41321) Bool)

(assert (=> start!65148 (array_inv!15570 a!3186)))

(declare-fun b!736112 () Bool)

(declare-fun res!494692 () Bool)

(assert (=> b!736112 (=> (not res!494692) (not e!411818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736112 (= res!494692 (validKeyInArray!0 (select (arr!19774 a!3186) j!159)))))

(declare-fun b!736113 () Bool)

(declare-fun e!411817 () Bool)

(declare-fun e!411807 () Bool)

(assert (=> b!736113 (= e!411817 e!411807)))

(declare-fun res!494695 () Bool)

(assert (=> b!736113 (=> res!494695 e!411807)))

(assert (=> b!736113 (= res!494695 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326404 #b00000000000000000000000000000000) (bvsge lt!326404 (size!20195 a!3186))))))

(declare-fun lt!326405 () Unit!25092)

(assert (=> b!736113 (= lt!326405 e!411808)))

(declare-fun c!81095 () Bool)

(declare-fun lt!326414 () Bool)

(assert (=> b!736113 (= c!81095 lt!326414)))

(assert (=> b!736113 (= lt!326414 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736113 (= lt!326404 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736114 () Bool)

(declare-fun res!494690 () Bool)

(assert (=> b!736114 (=> (not res!494690) (not e!411818))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!736114 (= res!494690 (validKeyInArray!0 k0!2102))))

(declare-fun e!411814 () Bool)

(declare-fun b!736115 () Bool)

(assert (=> b!736115 (= e!411814 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326404 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326415)))))

(declare-fun b!736116 () Bool)

(assert (=> b!736116 (= e!411814 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326404 resIntermediateIndex!5 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326413)))))

(declare-fun b!736117 () Bool)

(assert (=> b!736117 (= e!411816 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326417))))

(declare-fun b!736118 () Bool)

(declare-fun res!494696 () Bool)

(declare-fun e!411815 () Bool)

(assert (=> b!736118 (=> (not res!494696) (not e!411815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41321 (_ BitVec 32)) Bool)

(assert (=> b!736118 (= res!494696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736119 () Bool)

(assert (=> b!736119 (= e!411807 true)))

(declare-fun lt!326409 () array!41321)

(declare-fun lt!326412 () SeekEntryResult!7374)

(declare-fun lt!326410 () (_ BitVec 64))

(assert (=> b!736119 (= lt!326412 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326404 lt!326410 lt!326409 mask!3328))))

(declare-fun b!736120 () Bool)

(declare-fun e!411810 () Bool)

(assert (=> b!736120 (= e!411810 (not e!411817))))

(declare-fun res!494694 () Bool)

(assert (=> b!736120 (=> res!494694 e!411817)))

(declare-fun lt!326406 () SeekEntryResult!7374)

(get-info :version)

(assert (=> b!736120 (= res!494694 (or (not ((_ is Intermediate!7374) lt!326406)) (bvsge x!1131 (x!62868 lt!326406))))))

(assert (=> b!736120 (= lt!326413 (Found!7374 j!159))))

(assert (=> b!736120 e!411813))

(declare-fun res!494682 () Bool)

(assert (=> b!736120 (=> (not res!494682) (not e!411813))))

(assert (=> b!736120 (= res!494682 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326416 () Unit!25092)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25092)

(assert (=> b!736120 (= lt!326416 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736121 () Bool)

(assert (=> b!736121 (= e!411809 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) (Found!7374 j!159)))))

(declare-fun b!736122 () Bool)

(assert (=> b!736122 (= e!411818 e!411815)))

(declare-fun res!494693 () Bool)

(assert (=> b!736122 (=> (not res!494693) (not e!411815))))

(declare-fun lt!326408 () SeekEntryResult!7374)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736122 (= res!494693 (or (= lt!326408 (MissingZero!7374 i!1173)) (= lt!326408 (MissingVacant!7374 i!1173))))))

(assert (=> b!736122 (= lt!326408 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!736123 () Bool)

(assert (=> b!736123 (= e!411815 e!411811)))

(declare-fun res!494689 () Bool)

(assert (=> b!736123 (=> (not res!494689) (not e!411811))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736123 (= res!494689 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19774 a!3186) j!159) mask!3328) (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326415))))

(assert (=> b!736123 (= lt!326415 (Intermediate!7374 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736124 () Bool)

(declare-fun res!494688 () Bool)

(assert (=> b!736124 (=> (not res!494688) (not e!411811))))

(assert (=> b!736124 (= res!494688 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19774 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736125 () Bool)

(declare-fun Unit!25095 () Unit!25092)

(assert (=> b!736125 (= e!411808 Unit!25095)))

(assert (=> b!736125 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326404 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326415)))

(declare-fun b!736126 () Bool)

(declare-fun res!494680 () Bool)

(assert (=> b!736126 (=> (not res!494680) (not e!411818))))

(assert (=> b!736126 (= res!494680 (and (= (size!20195 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20195 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20195 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736127 () Bool)

(declare-fun res!494679 () Bool)

(assert (=> b!736127 (=> (not res!494679) (not e!411818))))

(declare-fun arrayContainsKey!0 (array!41321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736127 (= res!494679 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736128 () Bool)

(declare-fun res!494687 () Bool)

(assert (=> b!736128 (=> (not res!494687) (not e!411815))))

(assert (=> b!736128 (= res!494687 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20195 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20195 a!3186))))))

(declare-fun b!736129 () Bool)

(assert (=> b!736129 (= e!411811 e!411810)))

(declare-fun res!494686 () Bool)

(assert (=> b!736129 (=> (not res!494686) (not e!411810))))

(declare-fun lt!326407 () SeekEntryResult!7374)

(assert (=> b!736129 (= res!494686 (= lt!326407 lt!326406))))

(assert (=> b!736129 (= lt!326406 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326410 lt!326409 mask!3328))))

(assert (=> b!736129 (= lt!326407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326410 mask!3328) lt!326410 lt!326409 mask!3328))))

(assert (=> b!736129 (= lt!326410 (select (store (arr!19774 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!736129 (= lt!326409 (array!41322 (store (arr!19774 a!3186) i!1173 k0!2102) (size!20195 a!3186)))))

(declare-fun b!736130 () Bool)

(declare-fun res!494683 () Bool)

(assert (=> b!736130 (=> res!494683 e!411807)))

(assert (=> b!736130 (= res!494683 e!411814)))

(declare-fun c!81097 () Bool)

(assert (=> b!736130 (= c!81097 lt!326414)))

(declare-fun b!736131 () Bool)

(declare-fun res!494684 () Bool)

(assert (=> b!736131 (=> (not res!494684) (not e!411815))))

(declare-datatypes ((List!13776 0))(
  ( (Nil!13773) (Cons!13772 (h!14844 (_ BitVec 64)) (t!20091 List!13776)) )
))
(declare-fun arrayNoDuplicates!0 (array!41321 (_ BitVec 32) List!13776) Bool)

(assert (=> b!736131 (= res!494684 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13773))))

(assert (= (and start!65148 res!494685) b!736126))

(assert (= (and b!736126 res!494680) b!736112))

(assert (= (and b!736112 res!494692) b!736114))

(assert (= (and b!736114 res!494690) b!736127))

(assert (= (and b!736127 res!494679) b!736122))

(assert (= (and b!736122 res!494693) b!736118))

(assert (= (and b!736118 res!494696) b!736131))

(assert (= (and b!736131 res!494684) b!736128))

(assert (= (and b!736128 res!494687) b!736123))

(assert (= (and b!736123 res!494689) b!736124))

(assert (= (and b!736124 res!494688) b!736108))

(assert (= (and b!736108 c!81096) b!736109))

(assert (= (and b!736108 (not c!81096)) b!736121))

(assert (= (and b!736108 res!494691) b!736129))

(assert (= (and b!736129 res!494686) b!736120))

(assert (= (and b!736120 res!494682) b!736111))

(assert (= (and b!736111 res!494681) b!736117))

(assert (= (and b!736120 (not res!494694)) b!736113))

(assert (= (and b!736113 c!81095) b!736125))

(assert (= (and b!736113 (not c!81095)) b!736110))

(assert (= (and b!736113 (not res!494695)) b!736130))

(assert (= (and b!736130 c!81097) b!736115))

(assert (= (and b!736130 (not c!81097)) b!736116))

(assert (= (and b!736130 (not res!494683)) b!736119))

(declare-fun m!688321 () Bool)

(assert (=> b!736129 m!688321))

(declare-fun m!688323 () Bool)

(assert (=> b!736129 m!688323))

(declare-fun m!688325 () Bool)

(assert (=> b!736129 m!688325))

(declare-fun m!688327 () Bool)

(assert (=> b!736129 m!688327))

(assert (=> b!736129 m!688325))

(declare-fun m!688329 () Bool)

(assert (=> b!736129 m!688329))

(declare-fun m!688331 () Bool)

(assert (=> b!736125 m!688331))

(assert (=> b!736125 m!688331))

(declare-fun m!688333 () Bool)

(assert (=> b!736125 m!688333))

(declare-fun m!688335 () Bool)

(assert (=> b!736113 m!688335))

(assert (=> b!736109 m!688331))

(assert (=> b!736109 m!688331))

(declare-fun m!688337 () Bool)

(assert (=> b!736109 m!688337))

(assert (=> b!736111 m!688331))

(assert (=> b!736111 m!688331))

(declare-fun m!688339 () Bool)

(assert (=> b!736111 m!688339))

(assert (=> b!736121 m!688331))

(assert (=> b!736121 m!688331))

(declare-fun m!688341 () Bool)

(assert (=> b!736121 m!688341))

(declare-fun m!688343 () Bool)

(assert (=> b!736118 m!688343))

(assert (=> b!736123 m!688331))

(assert (=> b!736123 m!688331))

(declare-fun m!688345 () Bool)

(assert (=> b!736123 m!688345))

(assert (=> b!736123 m!688345))

(assert (=> b!736123 m!688331))

(declare-fun m!688347 () Bool)

(assert (=> b!736123 m!688347))

(declare-fun m!688349 () Bool)

(assert (=> b!736122 m!688349))

(assert (=> b!736110 m!688331))

(assert (=> b!736110 m!688331))

(assert (=> b!736110 m!688341))

(assert (=> b!736110 m!688331))

(declare-fun m!688351 () Bool)

(assert (=> b!736110 m!688351))

(assert (=> b!736112 m!688331))

(assert (=> b!736112 m!688331))

(declare-fun m!688353 () Bool)

(assert (=> b!736112 m!688353))

(assert (=> b!736117 m!688331))

(assert (=> b!736117 m!688331))

(declare-fun m!688355 () Bool)

(assert (=> b!736117 m!688355))

(declare-fun m!688357 () Bool)

(assert (=> b!736124 m!688357))

(assert (=> b!736115 m!688331))

(assert (=> b!736115 m!688331))

(assert (=> b!736115 m!688333))

(declare-fun m!688359 () Bool)

(assert (=> b!736120 m!688359))

(declare-fun m!688361 () Bool)

(assert (=> b!736120 m!688361))

(declare-fun m!688363 () Bool)

(assert (=> b!736114 m!688363))

(declare-fun m!688365 () Bool)

(assert (=> b!736127 m!688365))

(declare-fun m!688367 () Bool)

(assert (=> b!736119 m!688367))

(declare-fun m!688369 () Bool)

(assert (=> start!65148 m!688369))

(declare-fun m!688371 () Bool)

(assert (=> start!65148 m!688371))

(declare-fun m!688373 () Bool)

(assert (=> b!736131 m!688373))

(assert (=> b!736116 m!688331))

(assert (=> b!736116 m!688331))

(assert (=> b!736116 m!688351))

(check-sat (not b!736119) (not b!736110) (not b!736111) (not b!736120) (not b!736131) (not b!736117) (not b!736121) (not b!736123) (not b!736125) (not b!736112) (not b!736122) (not b!736109) (not b!736129) (not b!736115) (not b!736118) (not b!736114) (not b!736127) (not b!736116) (not b!736113) (not start!65148))
(check-sat)
