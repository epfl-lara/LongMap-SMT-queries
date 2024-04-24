; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65622 () Bool)

(assert start!65622)

(declare-fun b!747542 () Bool)

(declare-fun e!417505 () Bool)

(declare-fun e!417502 () Bool)

(assert (=> b!747542 (= e!417505 e!417502)))

(declare-fun res!503827 () Bool)

(assert (=> b!747542 (=> (not res!503827) (not e!417502))))

(declare-datatypes ((SeekEntryResult!7498 0))(
  ( (MissingZero!7498 (index!32360 (_ BitVec 32))) (Found!7498 (index!32361 (_ BitVec 32))) (Intermediate!7498 (undefined!8310 Bool) (index!32362 (_ BitVec 32)) (x!63468 (_ BitVec 32))) (Undefined!7498) (MissingVacant!7498 (index!32363 (_ BitVec 32))) )
))
(declare-fun lt!332233 () SeekEntryResult!7498)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!747542 (= res!503827 (or (= lt!332233 (MissingZero!7498 i!1173)) (= lt!332233 (MissingVacant!7498 i!1173))))))

(declare-datatypes ((array!41665 0))(
  ( (array!41666 (arr!19942 (Array (_ BitVec 32) (_ BitVec 64))) (size!20362 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41665)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41665 (_ BitVec 32)) SeekEntryResult!7498)

(assert (=> b!747542 (= lt!332233 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!747543 () Bool)

(declare-fun res!503830 () Bool)

(assert (=> b!747543 (=> (not res!503830) (not e!417502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41665 (_ BitVec 32)) Bool)

(assert (=> b!747543 (= res!503830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!747544 () Bool)

(declare-fun res!503839 () Bool)

(assert (=> b!747544 (=> (not res!503839) (not e!417505))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!747544 (= res!503839 (and (= (size!20362 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20362 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20362 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!747545 () Bool)

(declare-fun res!503832 () Bool)

(assert (=> b!747545 (=> (not res!503832) (not e!417502))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!747545 (= res!503832 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20362 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20362 a!3186))))))

(declare-fun b!747546 () Bool)

(declare-fun res!503828 () Bool)

(assert (=> b!747546 (=> (not res!503828) (not e!417502))))

(declare-datatypes ((List!13851 0))(
  ( (Nil!13848) (Cons!13847 (h!14925 (_ BitVec 64)) (t!20158 List!13851)) )
))
(declare-fun arrayNoDuplicates!0 (array!41665 (_ BitVec 32) List!13851) Bool)

(assert (=> b!747546 (= res!503828 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13848))))

(declare-fun b!747547 () Bool)

(declare-fun e!417499 () Bool)

(declare-fun e!417507 () Bool)

(assert (=> b!747547 (= e!417499 e!417507)))

(declare-fun res!503835 () Bool)

(assert (=> b!747547 (=> (not res!503835) (not e!417507))))

(declare-fun lt!332237 () SeekEntryResult!7498)

(declare-fun lt!332236 () SeekEntryResult!7498)

(assert (=> b!747547 (= res!503835 (= lt!332237 lt!332236))))

(declare-fun lt!332235 () (_ BitVec 64))

(declare-fun lt!332232 () array!41665)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41665 (_ BitVec 32)) SeekEntryResult!7498)

(assert (=> b!747547 (= lt!332236 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332235 lt!332232 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!747547 (= lt!332237 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332235 mask!3328) lt!332235 lt!332232 mask!3328))))

(assert (=> b!747547 (= lt!332235 (select (store (arr!19942 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!747547 (= lt!332232 (array!41666 (store (arr!19942 a!3186) i!1173 k0!2102) (size!20362 a!3186)))))

(declare-fun b!747548 () Bool)

(declare-fun e!417506 () Bool)

(declare-fun lt!332230 () SeekEntryResult!7498)

(assert (=> b!747548 (= e!417506 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19942 a!3186) j!159) a!3186 mask!3328) lt!332230))))

(declare-fun b!747549 () Bool)

(declare-fun e!417504 () Bool)

(assert (=> b!747549 (= e!417504 true)))

(declare-fun lt!332234 () SeekEntryResult!7498)

(declare-fun lt!332231 () SeekEntryResult!7498)

(assert (=> b!747549 (= lt!332234 lt!332231)))

(declare-fun b!747550 () Bool)

(assert (=> b!747550 (= e!417502 e!417499)))

(declare-fun res!503833 () Bool)

(assert (=> b!747550 (=> (not res!503833) (not e!417499))))

(assert (=> b!747550 (= res!503833 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19942 a!3186) j!159) mask!3328) (select (arr!19942 a!3186) j!159) a!3186 mask!3328) lt!332230))))

(assert (=> b!747550 (= lt!332230 (Intermediate!7498 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!747551 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41665 (_ BitVec 32)) SeekEntryResult!7498)

(assert (=> b!747551 (= e!417506 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19942 a!3186) j!159) a!3186 mask!3328) (Found!7498 j!159)))))

(declare-fun res!503842 () Bool)

(assert (=> start!65622 (=> (not res!503842) (not e!417505))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65622 (= res!503842 (validMask!0 mask!3328))))

(assert (=> start!65622 e!417505))

(assert (=> start!65622 true))

(declare-fun array_inv!15801 (array!41665) Bool)

(assert (=> start!65622 (array_inv!15801 a!3186)))

(declare-fun b!747552 () Bool)

(declare-fun res!503834 () Bool)

(assert (=> b!747552 (=> (not res!503834) (not e!417499))))

(assert (=> b!747552 (= res!503834 e!417506)))

(declare-fun c!82241 () Bool)

(assert (=> b!747552 (= c!82241 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!747553 () Bool)

(declare-fun e!417500 () Bool)

(assert (=> b!747553 (= e!417507 (not e!417500))))

(declare-fun res!503837 () Bool)

(assert (=> b!747553 (=> res!503837 e!417500)))

(get-info :version)

(assert (=> b!747553 (= res!503837 (or (not ((_ is Intermediate!7498) lt!332236)) (bvslt x!1131 (x!63468 lt!332236)) (not (= x!1131 (x!63468 lt!332236))) (not (= index!1321 (index!32362 lt!332236)))))))

(declare-fun e!417503 () Bool)

(assert (=> b!747553 e!417503))

(declare-fun res!503841 () Bool)

(assert (=> b!747553 (=> (not res!503841) (not e!417503))))

(declare-fun lt!332238 () SeekEntryResult!7498)

(assert (=> b!747553 (= res!503841 (= lt!332234 lt!332238))))

(assert (=> b!747553 (= lt!332238 (Found!7498 j!159))))

(assert (=> b!747553 (= lt!332234 (seekEntryOrOpen!0 (select (arr!19942 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!747553 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25555 0))(
  ( (Unit!25556) )
))
(declare-fun lt!332229 () Unit!25555)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41665 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25555)

(assert (=> b!747553 (= lt!332229 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!747554 () Bool)

(assert (=> b!747554 (= e!417500 e!417504)))

(declare-fun res!503829 () Bool)

(assert (=> b!747554 (=> res!503829 e!417504)))

(assert (=> b!747554 (= res!503829 (or (not (= lt!332231 lt!332238)) (= (select (store (arr!19942 a!3186) i!1173 k0!2102) index!1321) lt!332235) (not (= (select (store (arr!19942 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!747554 (= lt!332231 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19942 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!747555 () Bool)

(declare-fun res!503831 () Bool)

(assert (=> b!747555 (=> (not res!503831) (not e!417505))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!747555 (= res!503831 (validKeyInArray!0 (select (arr!19942 a!3186) j!159)))))

(declare-fun b!747556 () Bool)

(declare-fun res!503838 () Bool)

(assert (=> b!747556 (=> (not res!503838) (not e!417505))))

(declare-fun arrayContainsKey!0 (array!41665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!747556 (= res!503838 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!747557 () Bool)

(declare-fun res!503840 () Bool)

(assert (=> b!747557 (=> (not res!503840) (not e!417505))))

(assert (=> b!747557 (= res!503840 (validKeyInArray!0 k0!2102))))

(declare-fun b!747558 () Bool)

(assert (=> b!747558 (= e!417503 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19942 a!3186) j!159) a!3186 mask!3328) lt!332238))))

(declare-fun b!747559 () Bool)

(declare-fun res!503836 () Bool)

(assert (=> b!747559 (=> (not res!503836) (not e!417499))))

(assert (=> b!747559 (= res!503836 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19942 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65622 res!503842) b!747544))

(assert (= (and b!747544 res!503839) b!747555))

(assert (= (and b!747555 res!503831) b!747557))

(assert (= (and b!747557 res!503840) b!747556))

(assert (= (and b!747556 res!503838) b!747542))

(assert (= (and b!747542 res!503827) b!747543))

(assert (= (and b!747543 res!503830) b!747546))

(assert (= (and b!747546 res!503828) b!747545))

(assert (= (and b!747545 res!503832) b!747550))

(assert (= (and b!747550 res!503833) b!747559))

(assert (= (and b!747559 res!503836) b!747552))

(assert (= (and b!747552 c!82241) b!747548))

(assert (= (and b!747552 (not c!82241)) b!747551))

(assert (= (and b!747552 res!503834) b!747547))

(assert (= (and b!747547 res!503835) b!747553))

(assert (= (and b!747553 res!503841) b!747558))

(assert (= (and b!747553 (not res!503837)) b!747554))

(assert (= (and b!747554 (not res!503829)) b!747549))

(declare-fun m!698175 () Bool)

(assert (=> b!747547 m!698175))

(declare-fun m!698177 () Bool)

(assert (=> b!747547 m!698177))

(declare-fun m!698179 () Bool)

(assert (=> b!747547 m!698179))

(assert (=> b!747547 m!698175))

(declare-fun m!698181 () Bool)

(assert (=> b!747547 m!698181))

(declare-fun m!698183 () Bool)

(assert (=> b!747547 m!698183))

(declare-fun m!698185 () Bool)

(assert (=> b!747558 m!698185))

(assert (=> b!747558 m!698185))

(declare-fun m!698187 () Bool)

(assert (=> b!747558 m!698187))

(declare-fun m!698189 () Bool)

(assert (=> start!65622 m!698189))

(declare-fun m!698191 () Bool)

(assert (=> start!65622 m!698191))

(declare-fun m!698193 () Bool)

(assert (=> b!747557 m!698193))

(declare-fun m!698195 () Bool)

(assert (=> b!747556 m!698195))

(declare-fun m!698197 () Bool)

(assert (=> b!747559 m!698197))

(declare-fun m!698199 () Bool)

(assert (=> b!747542 m!698199))

(declare-fun m!698201 () Bool)

(assert (=> b!747546 m!698201))

(assert (=> b!747553 m!698185))

(assert (=> b!747553 m!698185))

(declare-fun m!698203 () Bool)

(assert (=> b!747553 m!698203))

(declare-fun m!698205 () Bool)

(assert (=> b!747553 m!698205))

(declare-fun m!698207 () Bool)

(assert (=> b!747553 m!698207))

(assert (=> b!747550 m!698185))

(assert (=> b!747550 m!698185))

(declare-fun m!698209 () Bool)

(assert (=> b!747550 m!698209))

(assert (=> b!747550 m!698209))

(assert (=> b!747550 m!698185))

(declare-fun m!698211 () Bool)

(assert (=> b!747550 m!698211))

(assert (=> b!747551 m!698185))

(assert (=> b!747551 m!698185))

(declare-fun m!698213 () Bool)

(assert (=> b!747551 m!698213))

(assert (=> b!747548 m!698185))

(assert (=> b!747548 m!698185))

(declare-fun m!698215 () Bool)

(assert (=> b!747548 m!698215))

(assert (=> b!747555 m!698185))

(assert (=> b!747555 m!698185))

(declare-fun m!698217 () Bool)

(assert (=> b!747555 m!698217))

(assert (=> b!747554 m!698179))

(declare-fun m!698219 () Bool)

(assert (=> b!747554 m!698219))

(assert (=> b!747554 m!698185))

(assert (=> b!747554 m!698185))

(assert (=> b!747554 m!698213))

(declare-fun m!698221 () Bool)

(assert (=> b!747543 m!698221))

(check-sat (not b!747542) (not b!747553) (not b!747556) (not b!747554) (not b!747543) (not start!65622) (not b!747546) (not b!747550) (not b!747558) (not b!747551) (not b!747547) (not b!747555) (not b!747548) (not b!747557))
(check-sat)
