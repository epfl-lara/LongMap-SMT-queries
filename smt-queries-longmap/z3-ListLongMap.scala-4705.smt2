; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65270 () Bool)

(assert start!65270)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7441 0))(
  ( (MissingZero!7441 (index!32132 (_ BitVec 32))) (Found!7441 (index!32133 (_ BitVec 32))) (Intermediate!7441 (undefined!8253 Bool) (index!32134 (_ BitVec 32)) (x!63122 (_ BitVec 32))) (Undefined!7441) (MissingVacant!7441 (index!32135 (_ BitVec 32))) )
))
(declare-fun lt!329063 () SeekEntryResult!7441)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!740938 () Bool)

(declare-fun e!414178 () Bool)

(get-info :version)

(assert (=> b!740938 (= e!414178 (not (or (not ((_ is Intermediate!7441) lt!329063)) (not (= x!1131 (x!63122 lt!329063))) (not (= index!1321 (index!32134 lt!329063))) (bvsge mask!3328 #b00000000000000000000000000000000))))))

(declare-fun e!414176 () Bool)

(assert (=> b!740938 e!414176))

(declare-fun res!498428 () Bool)

(assert (=> b!740938 (=> (not res!498428) (not e!414176))))

(declare-datatypes ((array!41460 0))(
  ( (array!41461 (arr!19844 (Array (_ BitVec 32) (_ BitVec 64))) (size!20265 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41460)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41460 (_ BitVec 32)) Bool)

(assert (=> b!740938 (= res!498428 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25334 0))(
  ( (Unit!25335) )
))
(declare-fun lt!329065 () Unit!25334)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41460 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25334)

(assert (=> b!740938 (= lt!329065 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!329068 () SeekEntryResult!7441)

(declare-fun e!414180 () Bool)

(declare-fun b!740939 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41460 (_ BitVec 32)) SeekEntryResult!7441)

(assert (=> b!740939 (= e!414180 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19844 a!3186) j!159) a!3186 mask!3328) lt!329068))))

(declare-fun lt!329067 () SeekEntryResult!7441)

(declare-fun b!740940 () Bool)

(declare-fun e!414175 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41460 (_ BitVec 32)) SeekEntryResult!7441)

(assert (=> b!740940 (= e!414175 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19844 a!3186) j!159) a!3186 mask!3328) lt!329067))))

(declare-fun b!740941 () Bool)

(declare-fun e!414174 () Bool)

(declare-fun e!414181 () Bool)

(assert (=> b!740941 (= e!414174 e!414181)))

(declare-fun res!498417 () Bool)

(assert (=> b!740941 (=> (not res!498417) (not e!414181))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740941 (= res!498417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19844 a!3186) j!159) mask!3328) (select (arr!19844 a!3186) j!159) a!3186 mask!3328) lt!329067))))

(assert (=> b!740941 (= lt!329067 (Intermediate!7441 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740942 () Bool)

(assert (=> b!740942 (= e!414176 e!414180)))

(declare-fun res!498415 () Bool)

(assert (=> b!740942 (=> (not res!498415) (not e!414180))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41460 (_ BitVec 32)) SeekEntryResult!7441)

(assert (=> b!740942 (= res!498415 (= (seekEntryOrOpen!0 (select (arr!19844 a!3186) j!159) a!3186 mask!3328) lt!329068))))

(assert (=> b!740942 (= lt!329068 (Found!7441 j!159))))

(declare-fun b!740944 () Bool)

(declare-fun res!498422 () Bool)

(declare-fun e!414179 () Bool)

(assert (=> b!740944 (=> (not res!498422) (not e!414179))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740944 (= res!498422 (validKeyInArray!0 k0!2102))))

(declare-fun b!740945 () Bool)

(declare-fun res!498418 () Bool)

(assert (=> b!740945 (=> (not res!498418) (not e!414179))))

(declare-fun arrayContainsKey!0 (array!41460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740945 (= res!498418 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740946 () Bool)

(declare-fun res!498429 () Bool)

(assert (=> b!740946 (=> (not res!498429) (not e!414174))))

(assert (=> b!740946 (= res!498429 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20265 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20265 a!3186))))))

(declare-fun b!740947 () Bool)

(declare-fun res!498416 () Bool)

(assert (=> b!740947 (=> (not res!498416) (not e!414179))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!740947 (= res!498416 (and (= (size!20265 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20265 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20265 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740948 () Bool)

(assert (=> b!740948 (= e!414181 e!414178)))

(declare-fun res!498419 () Bool)

(assert (=> b!740948 (=> (not res!498419) (not e!414178))))

(declare-fun lt!329066 () SeekEntryResult!7441)

(assert (=> b!740948 (= res!498419 (= lt!329066 lt!329063))))

(declare-fun lt!329064 () array!41460)

(declare-fun lt!329069 () (_ BitVec 64))

(assert (=> b!740948 (= lt!329063 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329069 lt!329064 mask!3328))))

(assert (=> b!740948 (= lt!329066 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329069 mask!3328) lt!329069 lt!329064 mask!3328))))

(assert (=> b!740948 (= lt!329069 (select (store (arr!19844 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!740948 (= lt!329064 (array!41461 (store (arr!19844 a!3186) i!1173 k0!2102) (size!20265 a!3186)))))

(declare-fun b!740949 () Bool)

(declare-fun res!498424 () Bool)

(assert (=> b!740949 (=> (not res!498424) (not e!414174))))

(declare-datatypes ((List!13885 0))(
  ( (Nil!13882) (Cons!13881 (h!14953 (_ BitVec 64)) (t!20191 List!13885)) )
))
(declare-fun arrayNoDuplicates!0 (array!41460 (_ BitVec 32) List!13885) Bool)

(assert (=> b!740949 (= res!498424 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13882))))

(declare-fun b!740950 () Bool)

(declare-fun res!498425 () Bool)

(assert (=> b!740950 (=> (not res!498425) (not e!414179))))

(assert (=> b!740950 (= res!498425 (validKeyInArray!0 (select (arr!19844 a!3186) j!159)))))

(declare-fun b!740951 () Bool)

(declare-fun res!498421 () Bool)

(assert (=> b!740951 (=> (not res!498421) (not e!414174))))

(assert (=> b!740951 (= res!498421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740952 () Bool)

(declare-fun res!498427 () Bool)

(assert (=> b!740952 (=> (not res!498427) (not e!414181))))

(assert (=> b!740952 (= res!498427 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19844 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740943 () Bool)

(declare-fun res!498426 () Bool)

(assert (=> b!740943 (=> (not res!498426) (not e!414181))))

(assert (=> b!740943 (= res!498426 e!414175)))

(declare-fun c!81642 () Bool)

(assert (=> b!740943 (= c!81642 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!498420 () Bool)

(assert (=> start!65270 (=> (not res!498420) (not e!414179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65270 (= res!498420 (validMask!0 mask!3328))))

(assert (=> start!65270 e!414179))

(assert (=> start!65270 true))

(declare-fun array_inv!15727 (array!41460) Bool)

(assert (=> start!65270 (array_inv!15727 a!3186)))

(declare-fun b!740953 () Bool)

(assert (=> b!740953 (= e!414175 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19844 a!3186) j!159) a!3186 mask!3328) (Found!7441 j!159)))))

(declare-fun b!740954 () Bool)

(assert (=> b!740954 (= e!414179 e!414174)))

(declare-fun res!498423 () Bool)

(assert (=> b!740954 (=> (not res!498423) (not e!414174))))

(declare-fun lt!329062 () SeekEntryResult!7441)

(assert (=> b!740954 (= res!498423 (or (= lt!329062 (MissingZero!7441 i!1173)) (= lt!329062 (MissingVacant!7441 i!1173))))))

(assert (=> b!740954 (= lt!329062 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65270 res!498420) b!740947))

(assert (= (and b!740947 res!498416) b!740950))

(assert (= (and b!740950 res!498425) b!740944))

(assert (= (and b!740944 res!498422) b!740945))

(assert (= (and b!740945 res!498418) b!740954))

(assert (= (and b!740954 res!498423) b!740951))

(assert (= (and b!740951 res!498421) b!740949))

(assert (= (and b!740949 res!498424) b!740946))

(assert (= (and b!740946 res!498429) b!740941))

(assert (= (and b!740941 res!498417) b!740952))

(assert (= (and b!740952 res!498427) b!740943))

(assert (= (and b!740943 c!81642) b!740940))

(assert (= (and b!740943 (not c!81642)) b!740953))

(assert (= (and b!740943 res!498426) b!740948))

(assert (= (and b!740948 res!498419) b!740938))

(assert (= (and b!740938 res!498428) b!740942))

(assert (= (and b!740942 res!498415) b!740939))

(declare-fun m!691427 () Bool)

(assert (=> b!740952 m!691427))

(declare-fun m!691429 () Bool)

(assert (=> b!740951 m!691429))

(declare-fun m!691431 () Bool)

(assert (=> b!740950 m!691431))

(assert (=> b!740950 m!691431))

(declare-fun m!691433 () Bool)

(assert (=> b!740950 m!691433))

(declare-fun m!691435 () Bool)

(assert (=> b!740954 m!691435))

(assert (=> b!740940 m!691431))

(assert (=> b!740940 m!691431))

(declare-fun m!691437 () Bool)

(assert (=> b!740940 m!691437))

(declare-fun m!691439 () Bool)

(assert (=> b!740944 m!691439))

(declare-fun m!691441 () Bool)

(assert (=> start!65270 m!691441))

(declare-fun m!691443 () Bool)

(assert (=> start!65270 m!691443))

(assert (=> b!740953 m!691431))

(assert (=> b!740953 m!691431))

(declare-fun m!691445 () Bool)

(assert (=> b!740953 m!691445))

(declare-fun m!691447 () Bool)

(assert (=> b!740945 m!691447))

(declare-fun m!691449 () Bool)

(assert (=> b!740948 m!691449))

(declare-fun m!691451 () Bool)

(assert (=> b!740948 m!691451))

(declare-fun m!691453 () Bool)

(assert (=> b!740948 m!691453))

(declare-fun m!691455 () Bool)

(assert (=> b!740948 m!691455))

(declare-fun m!691457 () Bool)

(assert (=> b!740948 m!691457))

(assert (=> b!740948 m!691453))

(assert (=> b!740939 m!691431))

(assert (=> b!740939 m!691431))

(declare-fun m!691459 () Bool)

(assert (=> b!740939 m!691459))

(assert (=> b!740941 m!691431))

(assert (=> b!740941 m!691431))

(declare-fun m!691461 () Bool)

(assert (=> b!740941 m!691461))

(assert (=> b!740941 m!691461))

(assert (=> b!740941 m!691431))

(declare-fun m!691463 () Bool)

(assert (=> b!740941 m!691463))

(assert (=> b!740942 m!691431))

(assert (=> b!740942 m!691431))

(declare-fun m!691465 () Bool)

(assert (=> b!740942 m!691465))

(declare-fun m!691467 () Bool)

(assert (=> b!740949 m!691467))

(declare-fun m!691469 () Bool)

(assert (=> b!740938 m!691469))

(declare-fun m!691471 () Bool)

(assert (=> b!740938 m!691471))

(check-sat (not b!740942) (not b!740940) (not b!740954) (not b!740941) (not b!740949) (not b!740950) (not b!740945) (not b!740951) (not b!740938) (not start!65270) (not b!740948) (not b!740939) (not b!740944) (not b!740953))
(check-sat)
