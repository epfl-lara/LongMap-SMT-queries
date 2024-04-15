; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67712 () Bool)

(assert start!67712)

(declare-fun b!785785 () Bool)

(declare-fun e!436812 () Bool)

(declare-fun e!436811 () Bool)

(assert (=> b!785785 (= e!436812 e!436811)))

(declare-fun res!532057 () Bool)

(assert (=> b!785785 (=> res!532057 e!436811)))

(declare-datatypes ((SeekEntryResult!8071 0))(
  ( (MissingZero!8071 (index!34652 (_ BitVec 32))) (Found!8071 (index!34653 (_ BitVec 32))) (Intermediate!8071 (undefined!8883 Bool) (index!34654 (_ BitVec 32)) (x!65606 (_ BitVec 32))) (Undefined!8071) (MissingVacant!8071 (index!34655 (_ BitVec 32))) )
))
(declare-fun lt!350281 () SeekEntryResult!8071)

(declare-fun lt!350285 () SeekEntryResult!8071)

(assert (=> b!785785 (= res!532057 (not (= lt!350281 lt!350285)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42771 0))(
  ( (array!42772 (arr!20474 (Array (_ BitVec 32) (_ BitVec 64))) (size!20895 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42771)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42771 (_ BitVec 32)) SeekEntryResult!8071)

(assert (=> b!785785 (= lt!350281 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20474 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785786 () Bool)

(declare-fun res!532055 () Bool)

(declare-fun e!436817 () Bool)

(assert (=> b!785786 (=> (not res!532055) (not e!436817))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785786 (= res!532055 (validKeyInArray!0 k0!2102))))

(declare-fun b!785787 () Bool)

(declare-fun e!436815 () Bool)

(declare-fun e!436818 () Bool)

(assert (=> b!785787 (= e!436815 e!436818)))

(declare-fun res!532056 () Bool)

(assert (=> b!785787 (=> (not res!532056) (not e!436818))))

(declare-fun lt!350282 () SeekEntryResult!8071)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42771 (_ BitVec 32)) SeekEntryResult!8071)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785787 (= res!532056 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20474 a!3186) j!159) mask!3328) (select (arr!20474 a!3186) j!159) a!3186 mask!3328) lt!350282))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785787 (= lt!350282 (Intermediate!8071 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785788 () Bool)

(declare-fun res!532048 () Bool)

(assert (=> b!785788 (=> (not res!532048) (not e!436815))))

(declare-datatypes ((List!14515 0))(
  ( (Nil!14512) (Cons!14511 (h!15634 (_ BitVec 64)) (t!20821 List!14515)) )
))
(declare-fun arrayNoDuplicates!0 (array!42771 (_ BitVec 32) List!14515) Bool)

(assert (=> b!785788 (= res!532048 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14512))))

(declare-fun b!785789 () Bool)

(declare-fun res!532044 () Bool)

(assert (=> b!785789 (=> (not res!532044) (not e!436817))))

(declare-fun arrayContainsKey!0 (array!42771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785789 (= res!532044 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785790 () Bool)

(declare-fun res!532059 () Bool)

(assert (=> b!785790 (=> (not res!532059) (not e!436817))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785790 (= res!532059 (and (= (size!20895 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20895 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20895 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!436819 () Bool)

(declare-fun b!785791 () Bool)

(assert (=> b!785791 (= e!436819 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20474 a!3186) j!159) a!3186 mask!3328) (Found!8071 j!159)))))

(declare-fun e!436820 () Bool)

(declare-fun b!785792 () Bool)

(assert (=> b!785792 (= e!436820 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20474 a!3186) j!159) a!3186 mask!3328) lt!350285))))

(declare-fun b!785794 () Bool)

(assert (=> b!785794 (= e!436817 e!436815)))

(declare-fun res!532049 () Bool)

(assert (=> b!785794 (=> (not res!532049) (not e!436815))))

(declare-fun lt!350283 () SeekEntryResult!8071)

(assert (=> b!785794 (= res!532049 (or (= lt!350283 (MissingZero!8071 i!1173)) (= lt!350283 (MissingVacant!8071 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42771 (_ BitVec 32)) SeekEntryResult!8071)

(assert (=> b!785794 (= lt!350283 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!785795 () Bool)

(declare-fun e!436814 () Bool)

(assert (=> b!785795 (= e!436818 e!436814)))

(declare-fun res!532053 () Bool)

(assert (=> b!785795 (=> (not res!532053) (not e!436814))))

(declare-fun lt!350286 () SeekEntryResult!8071)

(declare-fun lt!350288 () SeekEntryResult!8071)

(assert (=> b!785795 (= res!532053 (= lt!350286 lt!350288))))

(declare-fun lt!350278 () array!42771)

(declare-fun lt!350287 () (_ BitVec 64))

(assert (=> b!785795 (= lt!350288 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350287 lt!350278 mask!3328))))

(assert (=> b!785795 (= lt!350286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350287 mask!3328) lt!350287 lt!350278 mask!3328))))

(assert (=> b!785795 (= lt!350287 (select (store (arr!20474 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!785795 (= lt!350278 (array!42772 (store (arr!20474 a!3186) i!1173 k0!2102) (size!20895 a!3186)))))

(declare-fun b!785796 () Bool)

(declare-fun e!436813 () Bool)

(declare-fun lt!350284 () SeekEntryResult!8071)

(assert (=> b!785796 (= e!436813 (= lt!350284 lt!350281))))

(declare-fun b!785797 () Bool)

(declare-datatypes ((Unit!27152 0))(
  ( (Unit!27153) )
))
(declare-fun e!436816 () Unit!27152)

(declare-fun Unit!27154 () Unit!27152)

(assert (=> b!785797 (= e!436816 Unit!27154)))

(declare-fun b!785798 () Bool)

(declare-fun e!436822 () Bool)

(assert (=> b!785798 (= e!436822 true)))

(assert (=> b!785798 e!436813))

(declare-fun res!532060 () Bool)

(assert (=> b!785798 (=> (not res!532060) (not e!436813))))

(declare-fun lt!350280 () (_ BitVec 64))

(assert (=> b!785798 (= res!532060 (= lt!350280 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350279 () Unit!27152)

(assert (=> b!785798 (= lt!350279 e!436816)))

(declare-fun c!87279 () Bool)

(assert (=> b!785798 (= c!87279 (= lt!350280 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785799 () Bool)

(declare-fun res!532054 () Bool)

(assert (=> b!785799 (=> (not res!532054) (not e!436818))))

(assert (=> b!785799 (= res!532054 e!436819)))

(declare-fun c!87278 () Bool)

(assert (=> b!785799 (= c!87278 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785800 () Bool)

(declare-fun res!532050 () Bool)

(assert (=> b!785800 (=> (not res!532050) (not e!436813))))

(assert (=> b!785800 (= res!532050 (= (seekEntryOrOpen!0 lt!350287 lt!350278 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350287 lt!350278 mask!3328)))))

(declare-fun b!785801 () Bool)

(declare-fun res!532051 () Bool)

(assert (=> b!785801 (=> (not res!532051) (not e!436818))))

(assert (=> b!785801 (= res!532051 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20474 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785802 () Bool)

(declare-fun res!532052 () Bool)

(assert (=> b!785802 (=> (not res!532052) (not e!436815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42771 (_ BitVec 32)) Bool)

(assert (=> b!785802 (= res!532052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785803 () Bool)

(assert (=> b!785803 (= e!436819 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20474 a!3186) j!159) a!3186 mask!3328) lt!350282))))

(declare-fun b!785804 () Bool)

(declare-fun res!532047 () Bool)

(assert (=> b!785804 (=> (not res!532047) (not e!436817))))

(assert (=> b!785804 (= res!532047 (validKeyInArray!0 (select (arr!20474 a!3186) j!159)))))

(declare-fun b!785805 () Bool)

(assert (=> b!785805 (= e!436814 (not e!436812))))

(declare-fun res!532061 () Bool)

(assert (=> b!785805 (=> res!532061 e!436812)))

(get-info :version)

(assert (=> b!785805 (= res!532061 (or (not ((_ is Intermediate!8071) lt!350288)) (bvslt x!1131 (x!65606 lt!350288)) (not (= x!1131 (x!65606 lt!350288))) (not (= index!1321 (index!34654 lt!350288)))))))

(assert (=> b!785805 e!436820))

(declare-fun res!532045 () Bool)

(assert (=> b!785805 (=> (not res!532045) (not e!436820))))

(assert (=> b!785805 (= res!532045 (= lt!350284 lt!350285))))

(assert (=> b!785805 (= lt!350285 (Found!8071 j!159))))

(assert (=> b!785805 (= lt!350284 (seekEntryOrOpen!0 (select (arr!20474 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!785805 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350277 () Unit!27152)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42771 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27152)

(assert (=> b!785805 (= lt!350277 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785793 () Bool)

(declare-fun Unit!27155 () Unit!27152)

(assert (=> b!785793 (= e!436816 Unit!27155)))

(assert (=> b!785793 false))

(declare-fun res!532062 () Bool)

(assert (=> start!67712 (=> (not res!532062) (not e!436817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67712 (= res!532062 (validMask!0 mask!3328))))

(assert (=> start!67712 e!436817))

(assert (=> start!67712 true))

(declare-fun array_inv!16357 (array!42771) Bool)

(assert (=> start!67712 (array_inv!16357 a!3186)))

(declare-fun b!785806 () Bool)

(assert (=> b!785806 (= e!436811 e!436822)))

(declare-fun res!532046 () Bool)

(assert (=> b!785806 (=> res!532046 e!436822)))

(assert (=> b!785806 (= res!532046 (= lt!350280 lt!350287))))

(assert (=> b!785806 (= lt!350280 (select (store (arr!20474 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!785807 () Bool)

(declare-fun res!532058 () Bool)

(assert (=> b!785807 (=> (not res!532058) (not e!436815))))

(assert (=> b!785807 (= res!532058 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20895 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20895 a!3186))))))

(assert (= (and start!67712 res!532062) b!785790))

(assert (= (and b!785790 res!532059) b!785804))

(assert (= (and b!785804 res!532047) b!785786))

(assert (= (and b!785786 res!532055) b!785789))

(assert (= (and b!785789 res!532044) b!785794))

(assert (= (and b!785794 res!532049) b!785802))

(assert (= (and b!785802 res!532052) b!785788))

(assert (= (and b!785788 res!532048) b!785807))

(assert (= (and b!785807 res!532058) b!785787))

(assert (= (and b!785787 res!532056) b!785801))

(assert (= (and b!785801 res!532051) b!785799))

(assert (= (and b!785799 c!87278) b!785803))

(assert (= (and b!785799 (not c!87278)) b!785791))

(assert (= (and b!785799 res!532054) b!785795))

(assert (= (and b!785795 res!532053) b!785805))

(assert (= (and b!785805 res!532045) b!785792))

(assert (= (and b!785805 (not res!532061)) b!785785))

(assert (= (and b!785785 (not res!532057)) b!785806))

(assert (= (and b!785806 (not res!532046)) b!785798))

(assert (= (and b!785798 c!87279) b!785793))

(assert (= (and b!785798 (not c!87279)) b!785797))

(assert (= (and b!785798 res!532060) b!785800))

(assert (= (and b!785800 res!532050) b!785796))

(declare-fun m!727203 () Bool)

(assert (=> b!785803 m!727203))

(assert (=> b!785803 m!727203))

(declare-fun m!727205 () Bool)

(assert (=> b!785803 m!727205))

(assert (=> b!785787 m!727203))

(assert (=> b!785787 m!727203))

(declare-fun m!727207 () Bool)

(assert (=> b!785787 m!727207))

(assert (=> b!785787 m!727207))

(assert (=> b!785787 m!727203))

(declare-fun m!727209 () Bool)

(assert (=> b!785787 m!727209))

(declare-fun m!727211 () Bool)

(assert (=> b!785788 m!727211))

(declare-fun m!727213 () Bool)

(assert (=> b!785801 m!727213))

(assert (=> b!785804 m!727203))

(assert (=> b!785804 m!727203))

(declare-fun m!727215 () Bool)

(assert (=> b!785804 m!727215))

(assert (=> b!785792 m!727203))

(assert (=> b!785792 m!727203))

(declare-fun m!727217 () Bool)

(assert (=> b!785792 m!727217))

(declare-fun m!727219 () Bool)

(assert (=> b!785802 m!727219))

(declare-fun m!727221 () Bool)

(assert (=> b!785806 m!727221))

(declare-fun m!727223 () Bool)

(assert (=> b!785806 m!727223))

(declare-fun m!727225 () Bool)

(assert (=> b!785786 m!727225))

(declare-fun m!727227 () Bool)

(assert (=> b!785795 m!727227))

(assert (=> b!785795 m!727221))

(declare-fun m!727229 () Bool)

(assert (=> b!785795 m!727229))

(declare-fun m!727231 () Bool)

(assert (=> b!785795 m!727231))

(assert (=> b!785795 m!727231))

(declare-fun m!727233 () Bool)

(assert (=> b!785795 m!727233))

(declare-fun m!727235 () Bool)

(assert (=> b!785789 m!727235))

(assert (=> b!785785 m!727203))

(assert (=> b!785785 m!727203))

(declare-fun m!727237 () Bool)

(assert (=> b!785785 m!727237))

(assert (=> b!785791 m!727203))

(assert (=> b!785791 m!727203))

(assert (=> b!785791 m!727237))

(declare-fun m!727239 () Bool)

(assert (=> b!785794 m!727239))

(assert (=> b!785805 m!727203))

(assert (=> b!785805 m!727203))

(declare-fun m!727241 () Bool)

(assert (=> b!785805 m!727241))

(declare-fun m!727243 () Bool)

(assert (=> b!785805 m!727243))

(declare-fun m!727245 () Bool)

(assert (=> b!785805 m!727245))

(declare-fun m!727247 () Bool)

(assert (=> start!67712 m!727247))

(declare-fun m!727249 () Bool)

(assert (=> start!67712 m!727249))

(declare-fun m!727251 () Bool)

(assert (=> b!785800 m!727251))

(declare-fun m!727253 () Bool)

(assert (=> b!785800 m!727253))

(check-sat (not start!67712) (not b!785794) (not b!785800) (not b!785788) (not b!785803) (not b!785791) (not b!785805) (not b!785787) (not b!785804) (not b!785795) (not b!785785) (not b!785802) (not b!785786) (not b!785792) (not b!785789))
(check-sat)
