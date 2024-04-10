; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64356 () Bool)

(assert start!64356)

(declare-fun b!723517 () Bool)

(declare-fun res!485082 () Bool)

(declare-fun e!405333 () Bool)

(assert (=> b!723517 (=> (not res!485082) (not e!405333))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40937 0))(
  ( (array!40938 (arr!19591 (Array (_ BitVec 32) (_ BitVec 64))) (size!20012 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40937)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723517 (= res!485082 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20012 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20012 a!3186))))))

(declare-fun b!723518 () Bool)

(declare-fun res!485090 () Bool)

(assert (=> b!723518 (=> (not res!485090) (not e!405333))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40937 (_ BitVec 32)) Bool)

(assert (=> b!723518 (= res!485090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723519 () Bool)

(declare-fun e!405338 () Bool)

(assert (=> b!723519 (= e!405338 e!405333)))

(declare-fun res!485086 () Bool)

(assert (=> b!723519 (=> (not res!485086) (not e!405333))))

(declare-datatypes ((SeekEntryResult!7191 0))(
  ( (MissingZero!7191 (index!31132 (_ BitVec 32))) (Found!7191 (index!31133 (_ BitVec 32))) (Intermediate!7191 (undefined!8003 Bool) (index!31134 (_ BitVec 32)) (x!62128 (_ BitVec 32))) (Undefined!7191) (MissingVacant!7191 (index!31135 (_ BitVec 32))) )
))
(declare-fun lt!320697 () SeekEntryResult!7191)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723519 (= res!485086 (or (= lt!320697 (MissingZero!7191 i!1173)) (= lt!320697 (MissingVacant!7191 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40937 (_ BitVec 32)) SeekEntryResult!7191)

(assert (=> b!723519 (= lt!320697 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723520 () Bool)

(declare-fun res!485084 () Bool)

(assert (=> b!723520 (=> (not res!485084) (not e!405338))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723520 (= res!485084 (validKeyInArray!0 (select (arr!19591 a!3186) j!159)))))

(declare-fun e!405336 () Bool)

(declare-fun b!723521 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40937 (_ BitVec 32)) SeekEntryResult!7191)

(assert (=> b!723521 (= e!405336 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19591 a!3186) j!159) a!3186 mask!3328) (Found!7191 j!159)))))

(declare-fun b!723522 () Bool)

(declare-fun res!485078 () Bool)

(assert (=> b!723522 (=> (not res!485078) (not e!405338))))

(declare-fun arrayContainsKey!0 (array!40937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723522 (= res!485078 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723523 () Bool)

(declare-fun e!405335 () Bool)

(declare-fun e!405337 () Bool)

(assert (=> b!723523 (= e!405335 e!405337)))

(declare-fun res!485079 () Bool)

(assert (=> b!723523 (=> (not res!485079) (not e!405337))))

(declare-fun lt!320695 () (_ BitVec 64))

(declare-fun lt!320698 () array!40937)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40937 (_ BitVec 32)) SeekEntryResult!7191)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723523 (= res!485079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320695 mask!3328) lt!320695 lt!320698 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320695 lt!320698 mask!3328)))))

(assert (=> b!723523 (= lt!320695 (select (store (arr!19591 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723523 (= lt!320698 (array!40938 (store (arr!19591 a!3186) i!1173 k0!2102) (size!20012 a!3186)))))

(declare-fun b!723524 () Bool)

(declare-fun res!485083 () Bool)

(assert (=> b!723524 (=> (not res!485083) (not e!405335))))

(assert (=> b!723524 (= res!485083 e!405336)))

(declare-fun c!79591 () Bool)

(assert (=> b!723524 (= c!79591 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723525 () Bool)

(declare-fun res!485080 () Bool)

(assert (=> b!723525 (=> (not res!485080) (not e!405335))))

(assert (=> b!723525 (= res!485080 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19591 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!485087 () Bool)

(assert (=> start!64356 (=> (not res!485087) (not e!405338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64356 (= res!485087 (validMask!0 mask!3328))))

(assert (=> start!64356 e!405338))

(assert (=> start!64356 true))

(declare-fun array_inv!15387 (array!40937) Bool)

(assert (=> start!64356 (array_inv!15387 a!3186)))

(declare-fun b!723526 () Bool)

(declare-fun res!485089 () Bool)

(assert (=> b!723526 (=> (not res!485089) (not e!405333))))

(declare-datatypes ((List!13593 0))(
  ( (Nil!13590) (Cons!13589 (h!14643 (_ BitVec 64)) (t!19908 List!13593)) )
))
(declare-fun arrayNoDuplicates!0 (array!40937 (_ BitVec 32) List!13593) Bool)

(assert (=> b!723526 (= res!485089 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13590))))

(declare-fun lt!320696 () SeekEntryResult!7191)

(declare-fun b!723527 () Bool)

(assert (=> b!723527 (= e!405336 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19591 a!3186) j!159) a!3186 mask!3328) lt!320696))))

(declare-fun b!723528 () Bool)

(declare-fun res!485088 () Bool)

(assert (=> b!723528 (=> (not res!485088) (not e!405338))))

(assert (=> b!723528 (= res!485088 (and (= (size!20012 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20012 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20012 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723529 () Bool)

(assert (=> b!723529 (= e!405333 e!405335)))

(declare-fun res!485085 () Bool)

(assert (=> b!723529 (=> (not res!485085) (not e!405335))))

(assert (=> b!723529 (= res!485085 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19591 a!3186) j!159) mask!3328) (select (arr!19591 a!3186) j!159) a!3186 mask!3328) lt!320696))))

(assert (=> b!723529 (= lt!320696 (Intermediate!7191 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723530 () Bool)

(declare-fun res!485081 () Bool)

(assert (=> b!723530 (=> (not res!485081) (not e!405338))))

(assert (=> b!723530 (= res!485081 (validKeyInArray!0 k0!2102))))

(declare-fun b!723531 () Bool)

(assert (=> b!723531 (= e!405337 (not true))))

(assert (=> b!723531 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!24700 0))(
  ( (Unit!24701) )
))
(declare-fun lt!320699 () Unit!24700)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40937 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24700)

(assert (=> b!723531 (= lt!320699 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!64356 res!485087) b!723528))

(assert (= (and b!723528 res!485088) b!723520))

(assert (= (and b!723520 res!485084) b!723530))

(assert (= (and b!723530 res!485081) b!723522))

(assert (= (and b!723522 res!485078) b!723519))

(assert (= (and b!723519 res!485086) b!723518))

(assert (= (and b!723518 res!485090) b!723526))

(assert (= (and b!723526 res!485089) b!723517))

(assert (= (and b!723517 res!485082) b!723529))

(assert (= (and b!723529 res!485085) b!723525))

(assert (= (and b!723525 res!485080) b!723524))

(assert (= (and b!723524 c!79591) b!723527))

(assert (= (and b!723524 (not c!79591)) b!723521))

(assert (= (and b!723524 res!485083) b!723523))

(assert (= (and b!723523 res!485079) b!723531))

(declare-fun m!677953 () Bool)

(assert (=> b!723521 m!677953))

(assert (=> b!723521 m!677953))

(declare-fun m!677955 () Bool)

(assert (=> b!723521 m!677955))

(declare-fun m!677957 () Bool)

(assert (=> b!723530 m!677957))

(declare-fun m!677959 () Bool)

(assert (=> b!723526 m!677959))

(assert (=> b!723529 m!677953))

(assert (=> b!723529 m!677953))

(declare-fun m!677961 () Bool)

(assert (=> b!723529 m!677961))

(assert (=> b!723529 m!677961))

(assert (=> b!723529 m!677953))

(declare-fun m!677963 () Bool)

(assert (=> b!723529 m!677963))

(declare-fun m!677965 () Bool)

(assert (=> b!723525 m!677965))

(declare-fun m!677967 () Bool)

(assert (=> b!723519 m!677967))

(declare-fun m!677969 () Bool)

(assert (=> b!723522 m!677969))

(declare-fun m!677971 () Bool)

(assert (=> b!723518 m!677971))

(assert (=> b!723520 m!677953))

(assert (=> b!723520 m!677953))

(declare-fun m!677973 () Bool)

(assert (=> b!723520 m!677973))

(declare-fun m!677975 () Bool)

(assert (=> start!64356 m!677975))

(declare-fun m!677977 () Bool)

(assert (=> start!64356 m!677977))

(declare-fun m!677979 () Bool)

(assert (=> b!723531 m!677979))

(declare-fun m!677981 () Bool)

(assert (=> b!723531 m!677981))

(assert (=> b!723527 m!677953))

(assert (=> b!723527 m!677953))

(declare-fun m!677983 () Bool)

(assert (=> b!723527 m!677983))

(declare-fun m!677985 () Bool)

(assert (=> b!723523 m!677985))

(declare-fun m!677987 () Bool)

(assert (=> b!723523 m!677987))

(assert (=> b!723523 m!677985))

(declare-fun m!677989 () Bool)

(assert (=> b!723523 m!677989))

(declare-fun m!677991 () Bool)

(assert (=> b!723523 m!677991))

(declare-fun m!677993 () Bool)

(assert (=> b!723523 m!677993))

(check-sat (not b!723518) (not b!723529) (not start!64356) (not b!723519) (not b!723521) (not b!723522) (not b!723531) (not b!723527) (not b!723523) (not b!723520) (not b!723526) (not b!723530))
(check-sat)
