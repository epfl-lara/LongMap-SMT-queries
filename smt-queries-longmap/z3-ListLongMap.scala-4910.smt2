; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67682 () Bool)

(assert start!67682)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42741 0))(
  ( (array!42742 (arr!20459 (Array (_ BitVec 32) (_ BitVec 64))) (size!20880 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42741)

(declare-fun b!784750 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!436277 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8056 0))(
  ( (MissingZero!8056 (index!34592 (_ BitVec 32))) (Found!8056 (index!34593 (_ BitVec 32))) (Intermediate!8056 (undefined!8868 Bool) (index!34594 (_ BitVec 32)) (x!65551 (_ BitVec 32))) (Undefined!8056) (MissingVacant!8056 (index!34595 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42741 (_ BitVec 32)) SeekEntryResult!8056)

(assert (=> b!784750 (= e!436277 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20459 a!3186) j!159) a!3186 mask!3328) (Found!8056 j!159)))))

(declare-fun b!784751 () Bool)

(declare-fun res!531202 () Bool)

(declare-fun e!436275 () Bool)

(assert (=> b!784751 (=> (not res!531202) (not e!436275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784751 (= res!531202 (validKeyInArray!0 (select (arr!20459 a!3186) j!159)))))

(declare-fun b!784752 () Bool)

(declare-fun res!531192 () Bool)

(declare-fun e!436276 () Bool)

(assert (=> b!784752 (=> (not res!531192) (not e!436276))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784752 (= res!531192 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20880 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20880 a!3186))))))

(declare-fun b!784753 () Bool)

(declare-fun e!436271 () Bool)

(declare-fun e!436272 () Bool)

(assert (=> b!784753 (= e!436271 (not e!436272))))

(declare-fun res!531203 () Bool)

(assert (=> b!784753 (=> res!531203 e!436272)))

(declare-fun lt!349737 () SeekEntryResult!8056)

(get-info :version)

(assert (=> b!784753 (= res!531203 (or (not ((_ is Intermediate!8056) lt!349737)) (bvslt x!1131 (x!65551 lt!349737)) (not (= x!1131 (x!65551 lt!349737))) (not (= index!1321 (index!34594 lt!349737)))))))

(declare-fun e!436279 () Bool)

(assert (=> b!784753 e!436279))

(declare-fun res!531196 () Bool)

(assert (=> b!784753 (=> (not res!531196) (not e!436279))))

(declare-fun lt!349739 () SeekEntryResult!8056)

(declare-fun lt!349744 () SeekEntryResult!8056)

(assert (=> b!784753 (= res!531196 (= lt!349739 lt!349744))))

(assert (=> b!784753 (= lt!349744 (Found!8056 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42741 (_ BitVec 32)) SeekEntryResult!8056)

(assert (=> b!784753 (= lt!349739 (seekEntryOrOpen!0 (select (arr!20459 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42741 (_ BitVec 32)) Bool)

(assert (=> b!784753 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27092 0))(
  ( (Unit!27093) )
))
(declare-fun lt!349741 () Unit!27092)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27092)

(assert (=> b!784753 (= lt!349741 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784754 () Bool)

(assert (=> b!784754 (= e!436275 e!436276)))

(declare-fun res!531198 () Bool)

(assert (=> b!784754 (=> (not res!531198) (not e!436276))))

(declare-fun lt!349742 () SeekEntryResult!8056)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!784754 (= res!531198 (or (= lt!349742 (MissingZero!8056 i!1173)) (= lt!349742 (MissingVacant!8056 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!784754 (= lt!349742 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!784755 () Bool)

(declare-fun e!436274 () Bool)

(assert (=> b!784755 (= e!436274 true)))

(declare-fun e!436281 () Bool)

(assert (=> b!784755 e!436281))

(declare-fun res!531195 () Bool)

(assert (=> b!784755 (=> (not res!531195) (not e!436281))))

(declare-fun lt!349748 () (_ BitVec 64))

(assert (=> b!784755 (= res!531195 (= lt!349748 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349747 () Unit!27092)

(declare-fun e!436280 () Unit!27092)

(assert (=> b!784755 (= lt!349747 e!436280)))

(declare-fun c!87189 () Bool)

(assert (=> b!784755 (= c!87189 (= lt!349748 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!531189 () Bool)

(assert (=> start!67682 (=> (not res!531189) (not e!436275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67682 (= res!531189 (validMask!0 mask!3328))))

(assert (=> start!67682 e!436275))

(assert (=> start!67682 true))

(declare-fun array_inv!16342 (array!42741) Bool)

(assert (=> start!67682 (array_inv!16342 a!3186)))

(declare-fun b!784756 () Bool)

(declare-fun lt!349740 () SeekEntryResult!8056)

(assert (=> b!784756 (= e!436281 (= lt!349739 lt!349740))))

(declare-fun b!784757 () Bool)

(declare-fun res!531207 () Bool)

(assert (=> b!784757 (=> (not res!531207) (not e!436276))))

(declare-datatypes ((List!14500 0))(
  ( (Nil!14497) (Cons!14496 (h!15619 (_ BitVec 64)) (t!20806 List!14500)) )
))
(declare-fun arrayNoDuplicates!0 (array!42741 (_ BitVec 32) List!14500) Bool)

(assert (=> b!784757 (= res!531207 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14497))))

(declare-fun b!784758 () Bool)

(declare-fun res!531190 () Bool)

(declare-fun e!436273 () Bool)

(assert (=> b!784758 (=> (not res!531190) (not e!436273))))

(assert (=> b!784758 (= res!531190 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20459 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784759 () Bool)

(declare-fun res!531194 () Bool)

(assert (=> b!784759 (=> (not res!531194) (not e!436275))))

(assert (=> b!784759 (= res!531194 (and (= (size!20880 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20880 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20880 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784760 () Bool)

(assert (=> b!784760 (= e!436276 e!436273)))

(declare-fun res!531206 () Bool)

(assert (=> b!784760 (=> (not res!531206) (not e!436273))))

(declare-fun lt!349746 () SeekEntryResult!8056)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42741 (_ BitVec 32)) SeekEntryResult!8056)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784760 (= res!531206 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20459 a!3186) j!159) mask!3328) (select (arr!20459 a!3186) j!159) a!3186 mask!3328) lt!349746))))

(assert (=> b!784760 (= lt!349746 (Intermediate!8056 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784761 () Bool)

(assert (=> b!784761 (= e!436277 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20459 a!3186) j!159) a!3186 mask!3328) lt!349746))))

(declare-fun b!784762 () Bool)

(declare-fun res!531191 () Bool)

(assert (=> b!784762 (=> (not res!531191) (not e!436276))))

(assert (=> b!784762 (= res!531191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784763 () Bool)

(declare-fun e!436282 () Bool)

(assert (=> b!784763 (= e!436282 e!436274)))

(declare-fun res!531199 () Bool)

(assert (=> b!784763 (=> res!531199 e!436274)))

(declare-fun lt!349738 () (_ BitVec 64))

(assert (=> b!784763 (= res!531199 (= lt!349748 lt!349738))))

(assert (=> b!784763 (= lt!349748 (select (store (arr!20459 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!784764 () Bool)

(declare-fun res!531205 () Bool)

(assert (=> b!784764 (=> (not res!531205) (not e!436275))))

(declare-fun arrayContainsKey!0 (array!42741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784764 (= res!531205 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784765 () Bool)

(assert (=> b!784765 (= e!436279 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20459 a!3186) j!159) a!3186 mask!3328) lt!349744))))

(declare-fun b!784766 () Bool)

(declare-fun Unit!27094 () Unit!27092)

(assert (=> b!784766 (= e!436280 Unit!27094)))

(assert (=> b!784766 false))

(declare-fun b!784767 () Bool)

(assert (=> b!784767 (= e!436273 e!436271)))

(declare-fun res!531193 () Bool)

(assert (=> b!784767 (=> (not res!531193) (not e!436271))))

(declare-fun lt!349745 () SeekEntryResult!8056)

(assert (=> b!784767 (= res!531193 (= lt!349745 lt!349737))))

(declare-fun lt!349743 () array!42741)

(assert (=> b!784767 (= lt!349737 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349738 lt!349743 mask!3328))))

(assert (=> b!784767 (= lt!349745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349738 mask!3328) lt!349738 lt!349743 mask!3328))))

(assert (=> b!784767 (= lt!349738 (select (store (arr!20459 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!784767 (= lt!349743 (array!42742 (store (arr!20459 a!3186) i!1173 k0!2102) (size!20880 a!3186)))))

(declare-fun b!784768 () Bool)

(assert (=> b!784768 (= e!436272 e!436282)))

(declare-fun res!531197 () Bool)

(assert (=> b!784768 (=> res!531197 e!436282)))

(assert (=> b!784768 (= res!531197 (not (= lt!349740 lt!349744)))))

(assert (=> b!784768 (= lt!349740 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20459 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784769 () Bool)

(declare-fun res!531201 () Bool)

(assert (=> b!784769 (=> (not res!531201) (not e!436275))))

(assert (=> b!784769 (= res!531201 (validKeyInArray!0 k0!2102))))

(declare-fun b!784770 () Bool)

(declare-fun Unit!27095 () Unit!27092)

(assert (=> b!784770 (= e!436280 Unit!27095)))

(declare-fun b!784771 () Bool)

(declare-fun res!531200 () Bool)

(assert (=> b!784771 (=> (not res!531200) (not e!436281))))

(assert (=> b!784771 (= res!531200 (= (seekEntryOrOpen!0 lt!349738 lt!349743 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349738 lt!349743 mask!3328)))))

(declare-fun b!784772 () Bool)

(declare-fun res!531204 () Bool)

(assert (=> b!784772 (=> (not res!531204) (not e!436273))))

(assert (=> b!784772 (= res!531204 e!436277)))

(declare-fun c!87188 () Bool)

(assert (=> b!784772 (= c!87188 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67682 res!531189) b!784759))

(assert (= (and b!784759 res!531194) b!784751))

(assert (= (and b!784751 res!531202) b!784769))

(assert (= (and b!784769 res!531201) b!784764))

(assert (= (and b!784764 res!531205) b!784754))

(assert (= (and b!784754 res!531198) b!784762))

(assert (= (and b!784762 res!531191) b!784757))

(assert (= (and b!784757 res!531207) b!784752))

(assert (= (and b!784752 res!531192) b!784760))

(assert (= (and b!784760 res!531206) b!784758))

(assert (= (and b!784758 res!531190) b!784772))

(assert (= (and b!784772 c!87188) b!784761))

(assert (= (and b!784772 (not c!87188)) b!784750))

(assert (= (and b!784772 res!531204) b!784767))

(assert (= (and b!784767 res!531193) b!784753))

(assert (= (and b!784753 res!531196) b!784765))

(assert (= (and b!784753 (not res!531203)) b!784768))

(assert (= (and b!784768 (not res!531197)) b!784763))

(assert (= (and b!784763 (not res!531199)) b!784755))

(assert (= (and b!784755 c!87189) b!784766))

(assert (= (and b!784755 (not c!87189)) b!784770))

(assert (= (and b!784755 res!531195) b!784771))

(assert (= (and b!784771 res!531200) b!784756))

(declare-fun m!726423 () Bool)

(assert (=> b!784754 m!726423))

(declare-fun m!726425 () Bool)

(assert (=> b!784771 m!726425))

(declare-fun m!726427 () Bool)

(assert (=> b!784771 m!726427))

(declare-fun m!726429 () Bool)

(assert (=> b!784761 m!726429))

(assert (=> b!784761 m!726429))

(declare-fun m!726431 () Bool)

(assert (=> b!784761 m!726431))

(declare-fun m!726433 () Bool)

(assert (=> b!784757 m!726433))

(assert (=> b!784760 m!726429))

(assert (=> b!784760 m!726429))

(declare-fun m!726435 () Bool)

(assert (=> b!784760 m!726435))

(assert (=> b!784760 m!726435))

(assert (=> b!784760 m!726429))

(declare-fun m!726437 () Bool)

(assert (=> b!784760 m!726437))

(assert (=> b!784751 m!726429))

(assert (=> b!784751 m!726429))

(declare-fun m!726439 () Bool)

(assert (=> b!784751 m!726439))

(assert (=> b!784750 m!726429))

(assert (=> b!784750 m!726429))

(declare-fun m!726441 () Bool)

(assert (=> b!784750 m!726441))

(declare-fun m!726443 () Bool)

(assert (=> b!784764 m!726443))

(declare-fun m!726445 () Bool)

(assert (=> b!784767 m!726445))

(assert (=> b!784767 m!726445))

(declare-fun m!726447 () Bool)

(assert (=> b!784767 m!726447))

(declare-fun m!726449 () Bool)

(assert (=> b!784767 m!726449))

(declare-fun m!726451 () Bool)

(assert (=> b!784767 m!726451))

(declare-fun m!726453 () Bool)

(assert (=> b!784767 m!726453))

(assert (=> b!784753 m!726429))

(assert (=> b!784753 m!726429))

(declare-fun m!726455 () Bool)

(assert (=> b!784753 m!726455))

(declare-fun m!726457 () Bool)

(assert (=> b!784753 m!726457))

(declare-fun m!726459 () Bool)

(assert (=> b!784753 m!726459))

(assert (=> b!784763 m!726449))

(declare-fun m!726461 () Bool)

(assert (=> b!784763 m!726461))

(assert (=> b!784765 m!726429))

(assert (=> b!784765 m!726429))

(declare-fun m!726463 () Bool)

(assert (=> b!784765 m!726463))

(declare-fun m!726465 () Bool)

(assert (=> b!784762 m!726465))

(declare-fun m!726467 () Bool)

(assert (=> b!784758 m!726467))

(declare-fun m!726469 () Bool)

(assert (=> start!67682 m!726469))

(declare-fun m!726471 () Bool)

(assert (=> start!67682 m!726471))

(declare-fun m!726473 () Bool)

(assert (=> b!784769 m!726473))

(assert (=> b!784768 m!726429))

(assert (=> b!784768 m!726429))

(assert (=> b!784768 m!726441))

(check-sat (not b!784750) (not b!784761) (not b!784769) (not start!67682) (not b!784762) (not b!784765) (not b!784764) (not b!784751) (not b!784757) (not b!784760) (not b!784767) (not b!784768) (not b!784771) (not b!784754) (not b!784753))
(check-sat)
