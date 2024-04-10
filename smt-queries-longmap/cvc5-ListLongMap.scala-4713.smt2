; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65338 () Bool)

(assert start!65338)

(declare-fun b!742425 () Bool)

(declare-fun res!499619 () Bool)

(declare-fun e!414918 () Bool)

(assert (=> b!742425 (=> res!499619 e!414918)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41511 0))(
  ( (array!41512 (arr!19869 (Array (_ BitVec 32) (_ BitVec 64))) (size!20290 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41511)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7469 0))(
  ( (MissingZero!7469 (index!32244 (_ BitVec 32))) (Found!7469 (index!32245 (_ BitVec 32))) (Intermediate!7469 (undefined!8281 Bool) (index!32246 (_ BitVec 32)) (x!63219 (_ BitVec 32))) (Undefined!7469) (MissingVacant!7469 (index!32247 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41511 (_ BitVec 32)) SeekEntryResult!7469)

(assert (=> b!742425 (= res!499619 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19869 a!3186) j!159) a!3186 mask!3328) (Found!7469 j!159))))))

(declare-fun b!742426 () Bool)

(declare-fun res!499630 () Bool)

(declare-fun e!414915 () Bool)

(assert (=> b!742426 (=> (not res!499630) (not e!414915))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742426 (= res!499630 (and (= (size!20290 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20290 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20290 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742427 () Bool)

(declare-fun res!499620 () Bool)

(declare-fun e!414921 () Bool)

(assert (=> b!742427 (=> (not res!499620) (not e!414921))))

(assert (=> b!742427 (= res!499620 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19869 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!329820 () SeekEntryResult!7469)

(declare-fun e!414916 () Bool)

(declare-fun b!742428 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41511 (_ BitVec 32)) SeekEntryResult!7469)

(assert (=> b!742428 (= e!414916 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19869 a!3186) j!159) a!3186 mask!3328) lt!329820))))

(declare-fun lt!329816 () SeekEntryResult!7469)

(declare-fun b!742429 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!414919 () Bool)

(assert (=> b!742429 (= e!414919 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19869 a!3186) j!159) a!3186 mask!3328) lt!329816))))

(declare-fun b!742430 () Bool)

(declare-fun res!499618 () Bool)

(declare-fun e!414917 () Bool)

(assert (=> b!742430 (=> (not res!499618) (not e!414917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41511 (_ BitVec 32)) Bool)

(assert (=> b!742430 (= res!499618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742431 () Bool)

(assert (=> b!742431 (= e!414915 e!414917)))

(declare-fun res!499629 () Bool)

(assert (=> b!742431 (=> (not res!499629) (not e!414917))))

(declare-fun lt!329819 () SeekEntryResult!7469)

(assert (=> b!742431 (= res!499629 (or (= lt!329819 (MissingZero!7469 i!1173)) (= lt!329819 (MissingVacant!7469 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41511 (_ BitVec 32)) SeekEntryResult!7469)

(assert (=> b!742431 (= lt!329819 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!742432 () Bool)

(declare-fun res!499628 () Bool)

(assert (=> b!742432 (=> (not res!499628) (not e!414917))))

(assert (=> b!742432 (= res!499628 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20290 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20290 a!3186))))))

(declare-fun b!742433 () Bool)

(assert (=> b!742433 (= e!414917 e!414921)))

(declare-fun res!499622 () Bool)

(assert (=> b!742433 (=> (not res!499622) (not e!414921))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742433 (= res!499622 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19869 a!3186) j!159) mask!3328) (select (arr!19869 a!3186) j!159) a!3186 mask!3328) lt!329820))))

(assert (=> b!742433 (= lt!329820 (Intermediate!7469 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742434 () Bool)

(declare-fun res!499621 () Bool)

(assert (=> b!742434 (=> (not res!499621) (not e!414915))))

(declare-fun arrayContainsKey!0 (array!41511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742434 (= res!499621 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742435 () Bool)

(declare-fun e!414923 () Bool)

(assert (=> b!742435 (= e!414923 e!414919)))

(declare-fun res!499627 () Bool)

(assert (=> b!742435 (=> (not res!499627) (not e!414919))))

(assert (=> b!742435 (= res!499627 (= (seekEntryOrOpen!0 (select (arr!19869 a!3186) j!159) a!3186 mask!3328) lt!329816))))

(assert (=> b!742435 (= lt!329816 (Found!7469 j!159))))

(declare-fun res!499623 () Bool)

(assert (=> start!65338 (=> (not res!499623) (not e!414915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65338 (= res!499623 (validMask!0 mask!3328))))

(assert (=> start!65338 e!414915))

(assert (=> start!65338 true))

(declare-fun array_inv!15665 (array!41511) Bool)

(assert (=> start!65338 (array_inv!15665 a!3186)))

(declare-fun b!742436 () Bool)

(declare-fun res!499625 () Bool)

(assert (=> b!742436 (=> (not res!499625) (not e!414915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742436 (= res!499625 (validKeyInArray!0 (select (arr!19869 a!3186) j!159)))))

(declare-fun b!742437 () Bool)

(declare-fun res!499626 () Bool)

(assert (=> b!742437 (=> (not res!499626) (not e!414915))))

(assert (=> b!742437 (= res!499626 (validKeyInArray!0 k!2102))))

(declare-fun b!742438 () Bool)

(assert (=> b!742438 (= e!414916 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19869 a!3186) j!159) a!3186 mask!3328) (Found!7469 j!159)))))

(declare-fun b!742439 () Bool)

(declare-fun e!414920 () Bool)

(assert (=> b!742439 (= e!414920 (not e!414918))))

(declare-fun res!499633 () Bool)

(assert (=> b!742439 (=> res!499633 e!414918)))

(declare-fun lt!329818 () SeekEntryResult!7469)

(assert (=> b!742439 (= res!499633 (or (not (is-Intermediate!7469 lt!329818)) (bvslt x!1131 (x!63219 lt!329818)) (not (= x!1131 (x!63219 lt!329818))) (not (= index!1321 (index!32246 lt!329818)))))))

(assert (=> b!742439 e!414923))

(declare-fun res!499634 () Bool)

(assert (=> b!742439 (=> (not res!499634) (not e!414923))))

(assert (=> b!742439 (= res!499634 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25418 0))(
  ( (Unit!25419) )
))
(declare-fun lt!329815 () Unit!25418)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25418)

(assert (=> b!742439 (= lt!329815 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742440 () Bool)

(declare-fun res!499631 () Bool)

(assert (=> b!742440 (=> (not res!499631) (not e!414921))))

(assert (=> b!742440 (= res!499631 e!414916)))

(declare-fun c!81784 () Bool)

(assert (=> b!742440 (= c!81784 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!329817 () (_ BitVec 64))

(declare-fun b!742441 () Bool)

(assert (=> b!742441 (= e!414918 (or (not (= (select (store (arr!19869 a!3186) i!1173 k!2102) index!1321) lt!329817)) (undefined!8281 lt!329818) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!742442 () Bool)

(declare-fun res!499632 () Bool)

(assert (=> b!742442 (=> (not res!499632) (not e!414917))))

(declare-datatypes ((List!13871 0))(
  ( (Nil!13868) (Cons!13867 (h!14939 (_ BitVec 64)) (t!20186 List!13871)) )
))
(declare-fun arrayNoDuplicates!0 (array!41511 (_ BitVec 32) List!13871) Bool)

(assert (=> b!742442 (= res!499632 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13868))))

(declare-fun b!742443 () Bool)

(assert (=> b!742443 (= e!414921 e!414920)))

(declare-fun res!499624 () Bool)

(assert (=> b!742443 (=> (not res!499624) (not e!414920))))

(declare-fun lt!329821 () SeekEntryResult!7469)

(assert (=> b!742443 (= res!499624 (= lt!329821 lt!329818))))

(declare-fun lt!329822 () array!41511)

(assert (=> b!742443 (= lt!329818 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329817 lt!329822 mask!3328))))

(assert (=> b!742443 (= lt!329821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329817 mask!3328) lt!329817 lt!329822 mask!3328))))

(assert (=> b!742443 (= lt!329817 (select (store (arr!19869 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!742443 (= lt!329822 (array!41512 (store (arr!19869 a!3186) i!1173 k!2102) (size!20290 a!3186)))))

(assert (= (and start!65338 res!499623) b!742426))

(assert (= (and b!742426 res!499630) b!742436))

(assert (= (and b!742436 res!499625) b!742437))

(assert (= (and b!742437 res!499626) b!742434))

(assert (= (and b!742434 res!499621) b!742431))

(assert (= (and b!742431 res!499629) b!742430))

(assert (= (and b!742430 res!499618) b!742442))

(assert (= (and b!742442 res!499632) b!742432))

(assert (= (and b!742432 res!499628) b!742433))

(assert (= (and b!742433 res!499622) b!742427))

(assert (= (and b!742427 res!499620) b!742440))

(assert (= (and b!742440 c!81784) b!742428))

(assert (= (and b!742440 (not c!81784)) b!742438))

(assert (= (and b!742440 res!499631) b!742443))

(assert (= (and b!742443 res!499624) b!742439))

(assert (= (and b!742439 res!499634) b!742435))

(assert (= (and b!742435 res!499627) b!742429))

(assert (= (and b!742439 (not res!499633)) b!742425))

(assert (= (and b!742425 (not res!499619)) b!742441))

(declare-fun m!693289 () Bool)

(assert (=> b!742429 m!693289))

(assert (=> b!742429 m!693289))

(declare-fun m!693291 () Bool)

(assert (=> b!742429 m!693291))

(declare-fun m!693293 () Bool)

(assert (=> b!742442 m!693293))

(declare-fun m!693295 () Bool)

(assert (=> b!742427 m!693295))

(assert (=> b!742435 m!693289))

(assert (=> b!742435 m!693289))

(declare-fun m!693297 () Bool)

(assert (=> b!742435 m!693297))

(declare-fun m!693299 () Bool)

(assert (=> b!742430 m!693299))

(declare-fun m!693301 () Bool)

(assert (=> b!742443 m!693301))

(declare-fun m!693303 () Bool)

(assert (=> b!742443 m!693303))

(declare-fun m!693305 () Bool)

(assert (=> b!742443 m!693305))

(declare-fun m!693307 () Bool)

(assert (=> b!742443 m!693307))

(declare-fun m!693309 () Bool)

(assert (=> b!742443 m!693309))

(assert (=> b!742443 m!693301))

(assert (=> b!742438 m!693289))

(assert (=> b!742438 m!693289))

(declare-fun m!693311 () Bool)

(assert (=> b!742438 m!693311))

(declare-fun m!693313 () Bool)

(assert (=> b!742431 m!693313))

(assert (=> b!742433 m!693289))

(assert (=> b!742433 m!693289))

(declare-fun m!693315 () Bool)

(assert (=> b!742433 m!693315))

(assert (=> b!742433 m!693315))

(assert (=> b!742433 m!693289))

(declare-fun m!693317 () Bool)

(assert (=> b!742433 m!693317))

(assert (=> b!742436 m!693289))

(assert (=> b!742436 m!693289))

(declare-fun m!693319 () Bool)

(assert (=> b!742436 m!693319))

(assert (=> b!742441 m!693305))

(declare-fun m!693321 () Bool)

(assert (=> b!742441 m!693321))

(assert (=> b!742425 m!693289))

(assert (=> b!742425 m!693289))

(assert (=> b!742425 m!693311))

(declare-fun m!693323 () Bool)

(assert (=> b!742437 m!693323))

(declare-fun m!693325 () Bool)

(assert (=> start!65338 m!693325))

(declare-fun m!693327 () Bool)

(assert (=> start!65338 m!693327))

(declare-fun m!693329 () Bool)

(assert (=> b!742439 m!693329))

(declare-fun m!693331 () Bool)

(assert (=> b!742439 m!693331))

(assert (=> b!742428 m!693289))

(assert (=> b!742428 m!693289))

(declare-fun m!693333 () Bool)

(assert (=> b!742428 m!693333))

(declare-fun m!693335 () Bool)

(assert (=> b!742434 m!693335))

(push 1)

