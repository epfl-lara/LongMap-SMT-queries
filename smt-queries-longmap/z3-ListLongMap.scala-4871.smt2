; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67118 () Bool)

(assert start!67118)

(declare-fun b!775536 () Bool)

(declare-fun res!524550 () Bool)

(declare-fun e!431588 () Bool)

(assert (=> b!775536 (=> (not res!524550) (not e!431588))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775536 (= res!524550 (validKeyInArray!0 k0!2102))))

(declare-fun b!775537 () Bool)

(declare-fun res!524553 () Bool)

(declare-fun e!431590 () Bool)

(assert (=> b!775537 (=> (not res!524553) (not e!431590))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42492 0))(
  ( (array!42493 (arr!20342 (Array (_ BitVec 32) (_ BitVec 64))) (size!20763 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42492)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775537 (= res!524553 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20763 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20763 a!3186))))))

(declare-fun res!524563 () Bool)

(assert (=> start!67118 (=> (not res!524563) (not e!431588))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67118 (= res!524563 (validMask!0 mask!3328))))

(assert (=> start!67118 e!431588))

(assert (=> start!67118 true))

(declare-fun array_inv!16225 (array!42492) Bool)

(assert (=> start!67118 (array_inv!16225 a!3186)))

(declare-fun b!775538 () Bool)

(declare-fun res!524556 () Bool)

(assert (=> b!775538 (=> (not res!524556) (not e!431588))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!775538 (= res!524556 (validKeyInArray!0 (select (arr!20342 a!3186) j!159)))))

(declare-fun b!775539 () Bool)

(declare-fun e!431587 () Bool)

(assert (=> b!775539 (= e!431587 true)))

(declare-datatypes ((SeekEntryResult!7939 0))(
  ( (MissingZero!7939 (index!34124 (_ BitVec 32))) (Found!7939 (index!34125 (_ BitVec 32))) (Intermediate!7939 (undefined!8751 Bool) (index!34126 (_ BitVec 32)) (x!65077 (_ BitVec 32))) (Undefined!7939) (MissingVacant!7939 (index!34127 (_ BitVec 32))) )
))
(declare-fun lt!345356 () SeekEntryResult!7939)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42492 (_ BitVec 32)) SeekEntryResult!7939)

(assert (=> b!775539 (= lt!345356 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20342 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!775540 () Bool)

(declare-fun e!431591 () Bool)

(declare-fun e!431589 () Bool)

(assert (=> b!775540 (= e!431591 e!431589)))

(declare-fun res!524551 () Bool)

(assert (=> b!775540 (=> (not res!524551) (not e!431589))))

(declare-fun lt!345357 () SeekEntryResult!7939)

(declare-fun lt!345354 () SeekEntryResult!7939)

(assert (=> b!775540 (= res!524551 (= lt!345357 lt!345354))))

(declare-fun lt!345360 () array!42492)

(declare-fun lt!345359 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42492 (_ BitVec 32)) SeekEntryResult!7939)

(assert (=> b!775540 (= lt!345354 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345359 lt!345360 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775540 (= lt!345357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345359 mask!3328) lt!345359 lt!345360 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!775540 (= lt!345359 (select (store (arr!20342 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!775540 (= lt!345360 (array!42493 (store (arr!20342 a!3186) i!1173 k0!2102) (size!20763 a!3186)))))

(declare-fun b!775541 () Bool)

(assert (=> b!775541 (= e!431590 e!431591)))

(declare-fun res!524554 () Bool)

(assert (=> b!775541 (=> (not res!524554) (not e!431591))))

(declare-fun lt!345361 () SeekEntryResult!7939)

(assert (=> b!775541 (= res!524554 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20342 a!3186) j!159) mask!3328) (select (arr!20342 a!3186) j!159) a!3186 mask!3328) lt!345361))))

(assert (=> b!775541 (= lt!345361 (Intermediate!7939 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775542 () Bool)

(declare-fun e!431593 () Bool)

(assert (=> b!775542 (= e!431593 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20342 a!3186) j!159) a!3186 mask!3328) (Found!7939 j!159)))))

(declare-fun b!775543 () Bool)

(assert (=> b!775543 (= e!431589 (not e!431587))))

(declare-fun res!524555 () Bool)

(assert (=> b!775543 (=> res!524555 e!431587)))

(get-info :version)

(assert (=> b!775543 (= res!524555 (or (not ((_ is Intermediate!7939) lt!345354)) (bvslt x!1131 (x!65077 lt!345354)) (not (= x!1131 (x!65077 lt!345354))) (not (= index!1321 (index!34126 lt!345354)))))))

(declare-fun e!431585 () Bool)

(assert (=> b!775543 e!431585))

(declare-fun res!524565 () Bool)

(assert (=> b!775543 (=> (not res!524565) (not e!431585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42492 (_ BitVec 32)) Bool)

(assert (=> b!775543 (= res!524565 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26744 0))(
  ( (Unit!26745) )
))
(declare-fun lt!345358 () Unit!26744)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42492 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26744)

(assert (=> b!775543 (= lt!345358 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775544 () Bool)

(declare-fun res!524558 () Bool)

(assert (=> b!775544 (=> (not res!524558) (not e!431588))))

(declare-fun arrayContainsKey!0 (array!42492 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775544 (= res!524558 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775545 () Bool)

(declare-fun e!431586 () Bool)

(declare-fun lt!345355 () SeekEntryResult!7939)

(assert (=> b!775545 (= e!431586 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20342 a!3186) j!159) a!3186 mask!3328) lt!345355))))

(declare-fun b!775546 () Bool)

(declare-fun res!524559 () Bool)

(assert (=> b!775546 (=> (not res!524559) (not e!431588))))

(assert (=> b!775546 (= res!524559 (and (= (size!20763 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20763 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20763 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775547 () Bool)

(declare-fun res!524564 () Bool)

(assert (=> b!775547 (=> (not res!524564) (not e!431590))))

(declare-datatypes ((List!14383 0))(
  ( (Nil!14380) (Cons!14379 (h!15487 (_ BitVec 64)) (t!20689 List!14383)) )
))
(declare-fun arrayNoDuplicates!0 (array!42492 (_ BitVec 32) List!14383) Bool)

(assert (=> b!775547 (= res!524564 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14380))))

(declare-fun b!775548 () Bool)

(assert (=> b!775548 (= e!431588 e!431590)))

(declare-fun res!524552 () Bool)

(assert (=> b!775548 (=> (not res!524552) (not e!431590))))

(declare-fun lt!345362 () SeekEntryResult!7939)

(assert (=> b!775548 (= res!524552 (or (= lt!345362 (MissingZero!7939 i!1173)) (= lt!345362 (MissingVacant!7939 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42492 (_ BitVec 32)) SeekEntryResult!7939)

(assert (=> b!775548 (= lt!345362 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!775549 () Bool)

(declare-fun res!524561 () Bool)

(assert (=> b!775549 (=> (not res!524561) (not e!431591))))

(assert (=> b!775549 (= res!524561 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20342 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775550 () Bool)

(declare-fun res!524560 () Bool)

(assert (=> b!775550 (=> (not res!524560) (not e!431590))))

(assert (=> b!775550 (= res!524560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!775551 () Bool)

(assert (=> b!775551 (= e!431585 e!431586)))

(declare-fun res!524557 () Bool)

(assert (=> b!775551 (=> (not res!524557) (not e!431586))))

(assert (=> b!775551 (= res!524557 (= (seekEntryOrOpen!0 (select (arr!20342 a!3186) j!159) a!3186 mask!3328) lt!345355))))

(assert (=> b!775551 (= lt!345355 (Found!7939 j!159))))

(declare-fun b!775552 () Bool)

(declare-fun res!524562 () Bool)

(assert (=> b!775552 (=> (not res!524562) (not e!431591))))

(assert (=> b!775552 (= res!524562 e!431593)))

(declare-fun c!85893 () Bool)

(assert (=> b!775552 (= c!85893 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775553 () Bool)

(assert (=> b!775553 (= e!431593 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20342 a!3186) j!159) a!3186 mask!3328) lt!345361))))

(assert (= (and start!67118 res!524563) b!775546))

(assert (= (and b!775546 res!524559) b!775538))

(assert (= (and b!775538 res!524556) b!775536))

(assert (= (and b!775536 res!524550) b!775544))

(assert (= (and b!775544 res!524558) b!775548))

(assert (= (and b!775548 res!524552) b!775550))

(assert (= (and b!775550 res!524560) b!775547))

(assert (= (and b!775547 res!524564) b!775537))

(assert (= (and b!775537 res!524553) b!775541))

(assert (= (and b!775541 res!524554) b!775549))

(assert (= (and b!775549 res!524561) b!775552))

(assert (= (and b!775552 c!85893) b!775553))

(assert (= (and b!775552 (not c!85893)) b!775542))

(assert (= (and b!775552 res!524562) b!775540))

(assert (= (and b!775540 res!524551) b!775543))

(assert (= (and b!775543 res!524565) b!775551))

(assert (= (and b!775551 res!524557) b!775545))

(assert (= (and b!775543 (not res!524555)) b!775539))

(declare-fun m!719205 () Bool)

(assert (=> b!775540 m!719205))

(declare-fun m!719207 () Bool)

(assert (=> b!775540 m!719207))

(declare-fun m!719209 () Bool)

(assert (=> b!775540 m!719209))

(declare-fun m!719211 () Bool)

(assert (=> b!775540 m!719211))

(assert (=> b!775540 m!719205))

(declare-fun m!719213 () Bool)

(assert (=> b!775540 m!719213))

(declare-fun m!719215 () Bool)

(assert (=> b!775539 m!719215))

(assert (=> b!775539 m!719215))

(declare-fun m!719217 () Bool)

(assert (=> b!775539 m!719217))

(assert (=> b!775538 m!719215))

(assert (=> b!775538 m!719215))

(declare-fun m!719219 () Bool)

(assert (=> b!775538 m!719219))

(declare-fun m!719221 () Bool)

(assert (=> start!67118 m!719221))

(declare-fun m!719223 () Bool)

(assert (=> start!67118 m!719223))

(assert (=> b!775553 m!719215))

(assert (=> b!775553 m!719215))

(declare-fun m!719225 () Bool)

(assert (=> b!775553 m!719225))

(declare-fun m!719227 () Bool)

(assert (=> b!775544 m!719227))

(assert (=> b!775541 m!719215))

(assert (=> b!775541 m!719215))

(declare-fun m!719229 () Bool)

(assert (=> b!775541 m!719229))

(assert (=> b!775541 m!719229))

(assert (=> b!775541 m!719215))

(declare-fun m!719231 () Bool)

(assert (=> b!775541 m!719231))

(declare-fun m!719233 () Bool)

(assert (=> b!775547 m!719233))

(assert (=> b!775545 m!719215))

(assert (=> b!775545 m!719215))

(declare-fun m!719235 () Bool)

(assert (=> b!775545 m!719235))

(assert (=> b!775542 m!719215))

(assert (=> b!775542 m!719215))

(assert (=> b!775542 m!719217))

(assert (=> b!775551 m!719215))

(assert (=> b!775551 m!719215))

(declare-fun m!719237 () Bool)

(assert (=> b!775551 m!719237))

(declare-fun m!719239 () Bool)

(assert (=> b!775543 m!719239))

(declare-fun m!719241 () Bool)

(assert (=> b!775543 m!719241))

(declare-fun m!719243 () Bool)

(assert (=> b!775550 m!719243))

(declare-fun m!719245 () Bool)

(assert (=> b!775536 m!719245))

(declare-fun m!719247 () Bool)

(assert (=> b!775549 m!719247))

(declare-fun m!719249 () Bool)

(assert (=> b!775548 m!719249))

(check-sat (not b!775553) (not b!775536) (not b!775542) (not b!775543) (not b!775540) (not b!775545) (not b!775541) (not b!775550) (not b!775544) (not b!775538) (not b!775548) (not b!775547) (not b!775551) (not start!67118) (not b!775539))
(check-sat)
