; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65654 () Bool)

(assert start!65654)

(declare-fun b!752416 () Bool)

(declare-fun res!508228 () Bool)

(declare-fun e!419680 () Bool)

(assert (=> b!752416 (=> (not res!508228) (not e!419680))))

(declare-datatypes ((array!41844 0))(
  ( (array!41845 (arr!20036 (Array (_ BitVec 32) (_ BitVec 64))) (size!20457 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41844)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41844 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752416 (= res!508228 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752417 () Bool)

(declare-fun res!508229 () Bool)

(declare-fun e!419682 () Bool)

(assert (=> b!752417 (=> (not res!508229) (not e!419682))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41844 (_ BitVec 32)) Bool)

(assert (=> b!752417 (= res!508229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!752418 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!419675 () Bool)

(assert (=> b!752418 (= e!419675 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun e!419678 () Bool)

(assert (=> b!752418 e!419678))

(declare-fun res!508215 () Bool)

(assert (=> b!752418 (=> (not res!508215) (not e!419678))))

(declare-fun lt!334582 () (_ BitVec 64))

(assert (=> b!752418 (= res!508215 (= lt!334582 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25892 0))(
  ( (Unit!25893) )
))
(declare-fun lt!334579 () Unit!25892)

(declare-fun e!419677 () Unit!25892)

(assert (=> b!752418 (= lt!334579 e!419677)))

(declare-fun c!82482 () Bool)

(assert (=> b!752418 (= c!82482 (= lt!334582 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752419 () Bool)

(declare-fun res!508218 () Bool)

(assert (=> b!752419 (=> (not res!508218) (not e!419682))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!752419 (= res!508218 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20457 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20457 a!3186))))))

(declare-fun b!752420 () Bool)

(declare-fun e!419672 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7633 0))(
  ( (MissingZero!7633 (index!32900 (_ BitVec 32))) (Found!7633 (index!32901 (_ BitVec 32))) (Intermediate!7633 (undefined!8445 Bool) (index!32902 (_ BitVec 32)) (x!63826 (_ BitVec 32))) (Undefined!7633) (MissingVacant!7633 (index!32903 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41844 (_ BitVec 32)) SeekEntryResult!7633)

(assert (=> b!752420 (= e!419672 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20036 a!3186) j!159) a!3186 mask!3328) (Found!7633 j!159)))))

(declare-fun b!752421 () Bool)

(declare-fun res!508232 () Bool)

(assert (=> b!752421 (=> (not res!508232) (not e!419680))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752421 (= res!508232 (validKeyInArray!0 k0!2102))))

(declare-fun b!752422 () Bool)

(declare-fun res!508230 () Bool)

(assert (=> b!752422 (=> (not res!508230) (not e!419680))))

(assert (=> b!752422 (= res!508230 (validKeyInArray!0 (select (arr!20036 a!3186) j!159)))))

(declare-fun b!752423 () Bool)

(declare-fun e!419674 () Bool)

(assert (=> b!752423 (= e!419682 e!419674)))

(declare-fun res!508223 () Bool)

(assert (=> b!752423 (=> (not res!508223) (not e!419674))))

(declare-fun lt!334581 () SeekEntryResult!7633)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41844 (_ BitVec 32)) SeekEntryResult!7633)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752423 (= res!508223 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20036 a!3186) j!159) mask!3328) (select (arr!20036 a!3186) j!159) a!3186 mask!3328) lt!334581))))

(assert (=> b!752423 (= lt!334581 (Intermediate!7633 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752424 () Bool)

(assert (=> b!752424 (= e!419672 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20036 a!3186) j!159) a!3186 mask!3328) lt!334581))))

(declare-fun b!752425 () Bool)

(declare-fun e!419673 () Bool)

(assert (=> b!752425 (= e!419674 e!419673)))

(declare-fun res!508216 () Bool)

(assert (=> b!752425 (=> (not res!508216) (not e!419673))))

(declare-fun lt!334589 () SeekEntryResult!7633)

(declare-fun lt!334583 () SeekEntryResult!7633)

(assert (=> b!752425 (= res!508216 (= lt!334589 lt!334583))))

(declare-fun lt!334580 () array!41844)

(declare-fun lt!334584 () (_ BitVec 64))

(assert (=> b!752425 (= lt!334583 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334584 lt!334580 mask!3328))))

(assert (=> b!752425 (= lt!334589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334584 mask!3328) lt!334584 lt!334580 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752425 (= lt!334584 (select (store (arr!20036 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!752425 (= lt!334580 (array!41845 (store (arr!20036 a!3186) i!1173 k0!2102) (size!20457 a!3186)))))

(declare-fun b!752427 () Bool)

(declare-fun e!419681 () Bool)

(assert (=> b!752427 (= e!419673 (not e!419681))))

(declare-fun res!508227 () Bool)

(assert (=> b!752427 (=> res!508227 e!419681)))

(get-info :version)

(assert (=> b!752427 (= res!508227 (or (not ((_ is Intermediate!7633) lt!334583)) (bvslt x!1131 (x!63826 lt!334583)) (not (= x!1131 (x!63826 lt!334583))) (not (= index!1321 (index!32902 lt!334583)))))))

(declare-fun e!419679 () Bool)

(assert (=> b!752427 e!419679))

(declare-fun res!508231 () Bool)

(assert (=> b!752427 (=> (not res!508231) (not e!419679))))

(declare-fun lt!334586 () SeekEntryResult!7633)

(declare-fun lt!334585 () SeekEntryResult!7633)

(assert (=> b!752427 (= res!508231 (= lt!334586 lt!334585))))

(assert (=> b!752427 (= lt!334585 (Found!7633 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41844 (_ BitVec 32)) SeekEntryResult!7633)

(assert (=> b!752427 (= lt!334586 (seekEntryOrOpen!0 (select (arr!20036 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752427 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334578 () Unit!25892)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25892)

(assert (=> b!752427 (= lt!334578 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752428 () Bool)

(declare-fun res!508217 () Bool)

(assert (=> b!752428 (=> (not res!508217) (not e!419680))))

(assert (=> b!752428 (= res!508217 (and (= (size!20457 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20457 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20457 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752429 () Bool)

(declare-fun lt!334588 () SeekEntryResult!7633)

(assert (=> b!752429 (= e!419678 (= lt!334586 lt!334588))))

(declare-fun b!752430 () Bool)

(declare-fun res!508220 () Bool)

(assert (=> b!752430 (=> (not res!508220) (not e!419674))))

(assert (=> b!752430 (= res!508220 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20036 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752431 () Bool)

(declare-fun e!419683 () Bool)

(assert (=> b!752431 (= e!419681 e!419683)))

(declare-fun res!508233 () Bool)

(assert (=> b!752431 (=> res!508233 e!419683)))

(assert (=> b!752431 (= res!508233 (not (= lt!334588 lt!334585)))))

(assert (=> b!752431 (= lt!334588 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20036 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752432 () Bool)

(assert (=> b!752432 (= e!419680 e!419682)))

(declare-fun res!508222 () Bool)

(assert (=> b!752432 (=> (not res!508222) (not e!419682))))

(declare-fun lt!334587 () SeekEntryResult!7633)

(assert (=> b!752432 (= res!508222 (or (= lt!334587 (MissingZero!7633 i!1173)) (= lt!334587 (MissingVacant!7633 i!1173))))))

(assert (=> b!752432 (= lt!334587 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!752433 () Bool)

(declare-fun Unit!25894 () Unit!25892)

(assert (=> b!752433 (= e!419677 Unit!25894)))

(declare-fun b!752434 () Bool)

(declare-fun Unit!25895 () Unit!25892)

(assert (=> b!752434 (= e!419677 Unit!25895)))

(assert (=> b!752434 false))

(declare-fun b!752435 () Bool)

(assert (=> b!752435 (= e!419683 e!419675)))

(declare-fun res!508226 () Bool)

(assert (=> b!752435 (=> res!508226 e!419675)))

(assert (=> b!752435 (= res!508226 (= lt!334582 lt!334584))))

(assert (=> b!752435 (= lt!334582 (select (store (arr!20036 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!752436 () Bool)

(declare-fun res!508225 () Bool)

(assert (=> b!752436 (=> (not res!508225) (not e!419678))))

(assert (=> b!752436 (= res!508225 (= (seekEntryOrOpen!0 lt!334584 lt!334580 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334584 lt!334580 mask!3328)))))

(declare-fun b!752426 () Bool)

(declare-fun res!508219 () Bool)

(assert (=> b!752426 (=> (not res!508219) (not e!419674))))

(assert (=> b!752426 (= res!508219 e!419672)))

(declare-fun c!82481 () Bool)

(assert (=> b!752426 (= c!82481 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!508221 () Bool)

(assert (=> start!65654 (=> (not res!508221) (not e!419680))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65654 (= res!508221 (validMask!0 mask!3328))))

(assert (=> start!65654 e!419680))

(assert (=> start!65654 true))

(declare-fun array_inv!15919 (array!41844) Bool)

(assert (=> start!65654 (array_inv!15919 a!3186)))

(declare-fun b!752437 () Bool)

(declare-fun res!508224 () Bool)

(assert (=> b!752437 (=> (not res!508224) (not e!419682))))

(declare-datatypes ((List!14077 0))(
  ( (Nil!14074) (Cons!14073 (h!15145 (_ BitVec 64)) (t!20383 List!14077)) )
))
(declare-fun arrayNoDuplicates!0 (array!41844 (_ BitVec 32) List!14077) Bool)

(assert (=> b!752437 (= res!508224 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14074))))

(declare-fun b!752438 () Bool)

(assert (=> b!752438 (= e!419679 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20036 a!3186) j!159) a!3186 mask!3328) lt!334585))))

(assert (= (and start!65654 res!508221) b!752428))

(assert (= (and b!752428 res!508217) b!752422))

(assert (= (and b!752422 res!508230) b!752421))

(assert (= (and b!752421 res!508232) b!752416))

(assert (= (and b!752416 res!508228) b!752432))

(assert (= (and b!752432 res!508222) b!752417))

(assert (= (and b!752417 res!508229) b!752437))

(assert (= (and b!752437 res!508224) b!752419))

(assert (= (and b!752419 res!508218) b!752423))

(assert (= (and b!752423 res!508223) b!752430))

(assert (= (and b!752430 res!508220) b!752426))

(assert (= (and b!752426 c!82481) b!752424))

(assert (= (and b!752426 (not c!82481)) b!752420))

(assert (= (and b!752426 res!508219) b!752425))

(assert (= (and b!752425 res!508216) b!752427))

(assert (= (and b!752427 res!508231) b!752438))

(assert (= (and b!752427 (not res!508227)) b!752431))

(assert (= (and b!752431 (not res!508233)) b!752435))

(assert (= (and b!752435 (not res!508226)) b!752418))

(assert (= (and b!752418 c!82482) b!752434))

(assert (= (and b!752418 (not c!82482)) b!752433))

(assert (= (and b!752418 res!508215) b!752436))

(assert (= (and b!752436 res!508225) b!752429))

(declare-fun m!700793 () Bool)

(assert (=> b!752423 m!700793))

(assert (=> b!752423 m!700793))

(declare-fun m!700795 () Bool)

(assert (=> b!752423 m!700795))

(assert (=> b!752423 m!700795))

(assert (=> b!752423 m!700793))

(declare-fun m!700797 () Bool)

(assert (=> b!752423 m!700797))

(declare-fun m!700799 () Bool)

(assert (=> b!752425 m!700799))

(declare-fun m!700801 () Bool)

(assert (=> b!752425 m!700801))

(declare-fun m!700803 () Bool)

(assert (=> b!752425 m!700803))

(assert (=> b!752425 m!700801))

(declare-fun m!700805 () Bool)

(assert (=> b!752425 m!700805))

(declare-fun m!700807 () Bool)

(assert (=> b!752425 m!700807))

(declare-fun m!700809 () Bool)

(assert (=> b!752417 m!700809))

(declare-fun m!700811 () Bool)

(assert (=> b!752437 m!700811))

(assert (=> b!752424 m!700793))

(assert (=> b!752424 m!700793))

(declare-fun m!700813 () Bool)

(assert (=> b!752424 m!700813))

(assert (=> b!752435 m!700803))

(declare-fun m!700815 () Bool)

(assert (=> b!752435 m!700815))

(declare-fun m!700817 () Bool)

(assert (=> b!752432 m!700817))

(declare-fun m!700819 () Bool)

(assert (=> start!65654 m!700819))

(declare-fun m!700821 () Bool)

(assert (=> start!65654 m!700821))

(assert (=> b!752420 m!700793))

(assert (=> b!752420 m!700793))

(declare-fun m!700823 () Bool)

(assert (=> b!752420 m!700823))

(assert (=> b!752438 m!700793))

(assert (=> b!752438 m!700793))

(declare-fun m!700825 () Bool)

(assert (=> b!752438 m!700825))

(assert (=> b!752431 m!700793))

(assert (=> b!752431 m!700793))

(assert (=> b!752431 m!700823))

(declare-fun m!700827 () Bool)

(assert (=> b!752430 m!700827))

(declare-fun m!700829 () Bool)

(assert (=> b!752416 m!700829))

(declare-fun m!700831 () Bool)

(assert (=> b!752421 m!700831))

(declare-fun m!700833 () Bool)

(assert (=> b!752436 m!700833))

(declare-fun m!700835 () Bool)

(assert (=> b!752436 m!700835))

(assert (=> b!752422 m!700793))

(assert (=> b!752422 m!700793))

(declare-fun m!700837 () Bool)

(assert (=> b!752422 m!700837))

(assert (=> b!752427 m!700793))

(assert (=> b!752427 m!700793))

(declare-fun m!700839 () Bool)

(assert (=> b!752427 m!700839))

(declare-fun m!700841 () Bool)

(assert (=> b!752427 m!700841))

(declare-fun m!700843 () Bool)

(assert (=> b!752427 m!700843))

(check-sat (not b!752431) (not b!752422) (not start!65654) (not b!752437) (not b!752417) (not b!752425) (not b!752436) (not b!752427) (not b!752421) (not b!752424) (not b!752438) (not b!752423) (not b!752420) (not b!752432) (not b!752416))
(check-sat)
