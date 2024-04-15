; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67694 () Bool)

(assert start!67694)

(declare-fun b!785164 () Bool)

(declare-datatypes ((Unit!27116 0))(
  ( (Unit!27117) )
))
(declare-fun e!436498 () Unit!27116)

(declare-fun Unit!27118 () Unit!27116)

(assert (=> b!785164 (= e!436498 Unit!27118)))

(declare-fun b!785165 () Bool)

(declare-fun res!531545 () Bool)

(declare-fun e!436487 () Bool)

(assert (=> b!785165 (=> (not res!531545) (not e!436487))))

(declare-fun lt!349960 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!42753 0))(
  ( (array!42754 (arr!20465 (Array (_ BitVec 32) (_ BitVec 64))) (size!20886 (_ BitVec 32))) )
))
(declare-fun lt!349962 () array!42753)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8062 0))(
  ( (MissingZero!8062 (index!34616 (_ BitVec 32))) (Found!8062 (index!34617 (_ BitVec 32))) (Intermediate!8062 (undefined!8874 Bool) (index!34618 (_ BitVec 32)) (x!65573 (_ BitVec 32))) (Undefined!8062) (MissingVacant!8062 (index!34619 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42753 (_ BitVec 32)) SeekEntryResult!8062)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42753 (_ BitVec 32)) SeekEntryResult!8062)

(assert (=> b!785165 (= res!531545 (= (seekEntryOrOpen!0 lt!349960 lt!349962 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349960 lt!349962 mask!3328)))))

(declare-fun res!531541 () Bool)

(declare-fun e!436492 () Bool)

(assert (=> start!67694 (=> (not res!531541) (not e!436492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67694 (= res!531541 (validMask!0 mask!3328))))

(assert (=> start!67694 e!436492))

(assert (=> start!67694 true))

(declare-fun a!3186 () array!42753)

(declare-fun array_inv!16348 (array!42753) Bool)

(assert (=> start!67694 (array_inv!16348 a!3186)))

(declare-fun b!785166 () Bool)

(declare-fun res!531538 () Bool)

(declare-fun e!436497 () Bool)

(assert (=> b!785166 (=> (not res!531538) (not e!436497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42753 (_ BitVec 32)) Bool)

(assert (=> b!785166 (= res!531538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785167 () Bool)

(declare-fun e!436490 () Bool)

(assert (=> b!785167 (= e!436497 e!436490)))

(declare-fun res!531544 () Bool)

(assert (=> b!785167 (=> (not res!531544) (not e!436490))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!349957 () SeekEntryResult!8062)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42753 (_ BitVec 32)) SeekEntryResult!8062)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785167 (= res!531544 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20465 a!3186) j!159) mask!3328) (select (arr!20465 a!3186) j!159) a!3186 mask!3328) lt!349957))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785167 (= lt!349957 (Intermediate!8062 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785168 () Bool)

(declare-fun Unit!27119 () Unit!27116)

(assert (=> b!785168 (= e!436498 Unit!27119)))

(assert (=> b!785168 false))

(declare-fun b!785169 () Bool)

(declare-fun res!531535 () Bool)

(assert (=> b!785169 (=> (not res!531535) (not e!436492))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785169 (= res!531535 (and (= (size!20886 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20886 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20886 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785170 () Bool)

(declare-fun res!531542 () Bool)

(assert (=> b!785170 (=> (not res!531542) (not e!436497))))

(declare-datatypes ((List!14506 0))(
  ( (Nil!14503) (Cons!14502 (h!15625 (_ BitVec 64)) (t!20812 List!14506)) )
))
(declare-fun arrayNoDuplicates!0 (array!42753 (_ BitVec 32) List!14506) Bool)

(assert (=> b!785170 (= res!531542 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14503))))

(declare-fun b!785171 () Bool)

(declare-fun e!436488 () Bool)

(assert (=> b!785171 (= e!436488 true)))

(assert (=> b!785171 e!436487))

(declare-fun res!531537 () Bool)

(assert (=> b!785171 (=> (not res!531537) (not e!436487))))

(declare-fun lt!349963 () (_ BitVec 64))

(assert (=> b!785171 (= res!531537 (= lt!349963 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349959 () Unit!27116)

(assert (=> b!785171 (= lt!349959 e!436498)))

(declare-fun c!87224 () Bool)

(assert (=> b!785171 (= c!87224 (= lt!349963 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785172 () Bool)

(declare-fun res!531533 () Bool)

(assert (=> b!785172 (=> (not res!531533) (not e!436490))))

(declare-fun e!436495 () Bool)

(assert (=> b!785172 (= res!531533 e!436495)))

(declare-fun c!87225 () Bool)

(assert (=> b!785172 (= c!87225 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785173 () Bool)

(declare-fun res!531548 () Bool)

(assert (=> b!785173 (=> (not res!531548) (not e!436490))))

(assert (=> b!785173 (= res!531548 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20465 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785174 () Bool)

(declare-fun res!531534 () Bool)

(assert (=> b!785174 (=> (not res!531534) (not e!436492))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785174 (= res!531534 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!436489 () Bool)

(declare-fun lt!349956 () SeekEntryResult!8062)

(declare-fun b!785175 () Bool)

(assert (=> b!785175 (= e!436489 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20465 a!3186) j!159) a!3186 mask!3328) lt!349956))))

(declare-fun b!785176 () Bool)

(declare-fun res!531549 () Bool)

(assert (=> b!785176 (=> (not res!531549) (not e!436497))))

(assert (=> b!785176 (= res!531549 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20886 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20886 a!3186))))))

(declare-fun b!785177 () Bool)

(declare-fun e!436494 () Bool)

(assert (=> b!785177 (= e!436494 e!436488)))

(declare-fun res!531531 () Bool)

(assert (=> b!785177 (=> res!531531 e!436488)))

(assert (=> b!785177 (= res!531531 (= lt!349963 lt!349960))))

(assert (=> b!785177 (= lt!349963 (select (store (arr!20465 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!785178 () Bool)

(assert (=> b!785178 (= e!436495 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20465 a!3186) j!159) a!3186 mask!3328) lt!349957))))

(declare-fun b!785179 () Bool)

(assert (=> b!785179 (= e!436495 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20465 a!3186) j!159) a!3186 mask!3328) (Found!8062 j!159)))))

(declare-fun b!785180 () Bool)

(declare-fun e!436496 () Bool)

(declare-fun e!436493 () Bool)

(assert (=> b!785180 (= e!436496 (not e!436493))))

(declare-fun res!531546 () Bool)

(assert (=> b!785180 (=> res!531546 e!436493)))

(declare-fun lt!349953 () SeekEntryResult!8062)

(get-info :version)

(assert (=> b!785180 (= res!531546 (or (not ((_ is Intermediate!8062) lt!349953)) (bvslt x!1131 (x!65573 lt!349953)) (not (= x!1131 (x!65573 lt!349953))) (not (= index!1321 (index!34618 lt!349953)))))))

(assert (=> b!785180 e!436489))

(declare-fun res!531543 () Bool)

(assert (=> b!785180 (=> (not res!531543) (not e!436489))))

(declare-fun lt!349964 () SeekEntryResult!8062)

(assert (=> b!785180 (= res!531543 (= lt!349964 lt!349956))))

(assert (=> b!785180 (= lt!349956 (Found!8062 j!159))))

(assert (=> b!785180 (= lt!349964 (seekEntryOrOpen!0 (select (arr!20465 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!785180 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349954 () Unit!27116)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27116)

(assert (=> b!785180 (= lt!349954 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785181 () Bool)

(assert (=> b!785181 (= e!436493 e!436494)))

(declare-fun res!531540 () Bool)

(assert (=> b!785181 (=> res!531540 e!436494)))

(declare-fun lt!349961 () SeekEntryResult!8062)

(assert (=> b!785181 (= res!531540 (not (= lt!349961 lt!349956)))))

(assert (=> b!785181 (= lt!349961 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20465 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785182 () Bool)

(assert (=> b!785182 (= e!436490 e!436496)))

(declare-fun res!531539 () Bool)

(assert (=> b!785182 (=> (not res!531539) (not e!436496))))

(declare-fun lt!349958 () SeekEntryResult!8062)

(assert (=> b!785182 (= res!531539 (= lt!349958 lt!349953))))

(assert (=> b!785182 (= lt!349953 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349960 lt!349962 mask!3328))))

(assert (=> b!785182 (= lt!349958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349960 mask!3328) lt!349960 lt!349962 mask!3328))))

(assert (=> b!785182 (= lt!349960 (select (store (arr!20465 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!785182 (= lt!349962 (array!42754 (store (arr!20465 a!3186) i!1173 k0!2102) (size!20886 a!3186)))))

(declare-fun b!785183 () Bool)

(declare-fun res!531547 () Bool)

(assert (=> b!785183 (=> (not res!531547) (not e!436492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785183 (= res!531547 (validKeyInArray!0 (select (arr!20465 a!3186) j!159)))))

(declare-fun b!785184 () Bool)

(declare-fun res!531532 () Bool)

(assert (=> b!785184 (=> (not res!531532) (not e!436492))))

(assert (=> b!785184 (= res!531532 (validKeyInArray!0 k0!2102))))

(declare-fun b!785185 () Bool)

(assert (=> b!785185 (= e!436492 e!436497)))

(declare-fun res!531536 () Bool)

(assert (=> b!785185 (=> (not res!531536) (not e!436497))))

(declare-fun lt!349955 () SeekEntryResult!8062)

(assert (=> b!785185 (= res!531536 (or (= lt!349955 (MissingZero!8062 i!1173)) (= lt!349955 (MissingVacant!8062 i!1173))))))

(assert (=> b!785185 (= lt!349955 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!785186 () Bool)

(assert (=> b!785186 (= e!436487 (= lt!349964 lt!349961))))

(assert (= (and start!67694 res!531541) b!785169))

(assert (= (and b!785169 res!531535) b!785183))

(assert (= (and b!785183 res!531547) b!785184))

(assert (= (and b!785184 res!531532) b!785174))

(assert (= (and b!785174 res!531534) b!785185))

(assert (= (and b!785185 res!531536) b!785166))

(assert (= (and b!785166 res!531538) b!785170))

(assert (= (and b!785170 res!531542) b!785176))

(assert (= (and b!785176 res!531549) b!785167))

(assert (= (and b!785167 res!531544) b!785173))

(assert (= (and b!785173 res!531548) b!785172))

(assert (= (and b!785172 c!87225) b!785178))

(assert (= (and b!785172 (not c!87225)) b!785179))

(assert (= (and b!785172 res!531533) b!785182))

(assert (= (and b!785182 res!531539) b!785180))

(assert (= (and b!785180 res!531543) b!785175))

(assert (= (and b!785180 (not res!531546)) b!785181))

(assert (= (and b!785181 (not res!531540)) b!785177))

(assert (= (and b!785177 (not res!531531)) b!785171))

(assert (= (and b!785171 c!87224) b!785168))

(assert (= (and b!785171 (not c!87224)) b!785164))

(assert (= (and b!785171 res!531537) b!785165))

(assert (= (and b!785165 res!531545) b!785186))

(declare-fun m!726735 () Bool)

(assert (=> b!785173 m!726735))

(declare-fun m!726737 () Bool)

(assert (=> b!785180 m!726737))

(assert (=> b!785180 m!726737))

(declare-fun m!726739 () Bool)

(assert (=> b!785180 m!726739))

(declare-fun m!726741 () Bool)

(assert (=> b!785180 m!726741))

(declare-fun m!726743 () Bool)

(assert (=> b!785180 m!726743))

(assert (=> b!785179 m!726737))

(assert (=> b!785179 m!726737))

(declare-fun m!726745 () Bool)

(assert (=> b!785179 m!726745))

(declare-fun m!726747 () Bool)

(assert (=> b!785182 m!726747))

(declare-fun m!726749 () Bool)

(assert (=> b!785182 m!726749))

(declare-fun m!726751 () Bool)

(assert (=> b!785182 m!726751))

(declare-fun m!726753 () Bool)

(assert (=> b!785182 m!726753))

(assert (=> b!785182 m!726751))

(declare-fun m!726755 () Bool)

(assert (=> b!785182 m!726755))

(declare-fun m!726757 () Bool)

(assert (=> start!67694 m!726757))

(declare-fun m!726759 () Bool)

(assert (=> start!67694 m!726759))

(declare-fun m!726761 () Bool)

(assert (=> b!785185 m!726761))

(declare-fun m!726763 () Bool)

(assert (=> b!785184 m!726763))

(declare-fun m!726765 () Bool)

(assert (=> b!785170 m!726765))

(declare-fun m!726767 () Bool)

(assert (=> b!785166 m!726767))

(assert (=> b!785167 m!726737))

(assert (=> b!785167 m!726737))

(declare-fun m!726769 () Bool)

(assert (=> b!785167 m!726769))

(assert (=> b!785167 m!726769))

(assert (=> b!785167 m!726737))

(declare-fun m!726771 () Bool)

(assert (=> b!785167 m!726771))

(assert (=> b!785181 m!726737))

(assert (=> b!785181 m!726737))

(assert (=> b!785181 m!726745))

(declare-fun m!726773 () Bool)

(assert (=> b!785174 m!726773))

(assert (=> b!785183 m!726737))

(assert (=> b!785183 m!726737))

(declare-fun m!726775 () Bool)

(assert (=> b!785183 m!726775))

(assert (=> b!785178 m!726737))

(assert (=> b!785178 m!726737))

(declare-fun m!726777 () Bool)

(assert (=> b!785178 m!726777))

(assert (=> b!785177 m!726749))

(declare-fun m!726779 () Bool)

(assert (=> b!785177 m!726779))

(declare-fun m!726781 () Bool)

(assert (=> b!785165 m!726781))

(declare-fun m!726783 () Bool)

(assert (=> b!785165 m!726783))

(assert (=> b!785175 m!726737))

(assert (=> b!785175 m!726737))

(declare-fun m!726785 () Bool)

(assert (=> b!785175 m!726785))

(check-sat (not b!785181) (not start!67694) (not b!785182) (not b!785184) (not b!785166) (not b!785185) (not b!785178) (not b!785170) (not b!785167) (not b!785180) (not b!785174) (not b!785183) (not b!785179) (not b!785175) (not b!785165))
(check-sat)
