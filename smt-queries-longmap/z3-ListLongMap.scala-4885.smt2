; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67358 () Bool)

(assert start!67358)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42587 0))(
  ( (array!42588 (arr!20386 (Array (_ BitVec 32) (_ BitVec 64))) (size!20807 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42587)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!779068 () Bool)

(declare-datatypes ((SeekEntryResult!7986 0))(
  ( (MissingZero!7986 (index!34312 (_ BitVec 32))) (Found!7986 (index!34313 (_ BitVec 32))) (Intermediate!7986 (undefined!8798 Bool) (index!34314 (_ BitVec 32)) (x!65259 (_ BitVec 32))) (Undefined!7986) (MissingVacant!7986 (index!34315 (_ BitVec 32))) )
))
(declare-fun lt!347104 () SeekEntryResult!7986)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!433428 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42587 (_ BitVec 32)) SeekEntryResult!7986)

(assert (=> b!779068 (= e!433428 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20386 a!3186) j!159) a!3186 mask!3328) lt!347104))))

(declare-fun b!779069 () Bool)

(declare-fun res!527074 () Bool)

(declare-fun e!433425 () Bool)

(assert (=> b!779069 (=> (not res!527074) (not e!433425))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!779069 (= res!527074 (and (= (size!20807 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20807 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20807 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779070 () Bool)

(declare-fun res!527078 () Bool)

(declare-fun e!433427 () Bool)

(assert (=> b!779070 (=> (not res!527078) (not e!433427))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!779070 (= res!527078 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20807 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20807 a!3186))))))

(declare-fun res!527081 () Bool)

(assert (=> start!67358 (=> (not res!527081) (not e!433425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67358 (= res!527081 (validMask!0 mask!3328))))

(assert (=> start!67358 e!433425))

(assert (=> start!67358 true))

(declare-fun array_inv!16182 (array!42587) Bool)

(assert (=> start!67358 (array_inv!16182 a!3186)))

(declare-fun b!779071 () Bool)

(declare-fun e!433424 () Bool)

(assert (=> b!779071 (= e!433424 true)))

(declare-fun lt!347107 () SeekEntryResult!7986)

(assert (=> b!779071 (= lt!347107 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20386 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779072 () Bool)

(declare-fun e!433422 () Bool)

(assert (=> b!779072 (= e!433422 (not e!433424))))

(declare-fun res!527066 () Bool)

(assert (=> b!779072 (=> res!527066 e!433424)))

(declare-fun lt!347105 () SeekEntryResult!7986)

(get-info :version)

(assert (=> b!779072 (= res!527066 (or (not ((_ is Intermediate!7986) lt!347105)) (bvslt x!1131 (x!65259 lt!347105)) (not (= x!1131 (x!65259 lt!347105))) (not (= index!1321 (index!34314 lt!347105)))))))

(declare-fun e!433429 () Bool)

(assert (=> b!779072 e!433429))

(declare-fun res!527071 () Bool)

(assert (=> b!779072 (=> (not res!527071) (not e!433429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42587 (_ BitVec 32)) Bool)

(assert (=> b!779072 (= res!527071 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26866 0))(
  ( (Unit!26867) )
))
(declare-fun lt!347103 () Unit!26866)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42587 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26866)

(assert (=> b!779072 (= lt!347103 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779073 () Bool)

(declare-fun res!527067 () Bool)

(assert (=> b!779073 (=> (not res!527067) (not e!433425))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779073 (= res!527067 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779074 () Bool)

(assert (=> b!779074 (= e!433429 e!433428)))

(declare-fun res!527073 () Bool)

(assert (=> b!779074 (=> (not res!527073) (not e!433428))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42587 (_ BitVec 32)) SeekEntryResult!7986)

(assert (=> b!779074 (= res!527073 (= (seekEntryOrOpen!0 (select (arr!20386 a!3186) j!159) a!3186 mask!3328) lt!347104))))

(assert (=> b!779074 (= lt!347104 (Found!7986 j!159))))

(declare-fun b!779075 () Bool)

(declare-fun e!433430 () Bool)

(assert (=> b!779075 (= e!433430 e!433422)))

(declare-fun res!527072 () Bool)

(assert (=> b!779075 (=> (not res!527072) (not e!433422))))

(declare-fun lt!347111 () SeekEntryResult!7986)

(assert (=> b!779075 (= res!527072 (= lt!347111 lt!347105))))

(declare-fun lt!347109 () array!42587)

(declare-fun lt!347108 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42587 (_ BitVec 32)) SeekEntryResult!7986)

(assert (=> b!779075 (= lt!347105 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347108 lt!347109 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779075 (= lt!347111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347108 mask!3328) lt!347108 lt!347109 mask!3328))))

(assert (=> b!779075 (= lt!347108 (select (store (arr!20386 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!779075 (= lt!347109 (array!42588 (store (arr!20386 a!3186) i!1173 k0!2102) (size!20807 a!3186)))))

(declare-fun b!779076 () Bool)

(declare-fun res!527080 () Bool)

(assert (=> b!779076 (=> (not res!527080) (not e!433430))))

(assert (=> b!779076 (= res!527080 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20386 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779077 () Bool)

(declare-fun res!527077 () Bool)

(assert (=> b!779077 (=> (not res!527077) (not e!433430))))

(declare-fun e!433423 () Bool)

(assert (=> b!779077 (= res!527077 e!433423)))

(declare-fun c!86404 () Bool)

(assert (=> b!779077 (= c!86404 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779078 () Bool)

(assert (=> b!779078 (= e!433423 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20386 a!3186) j!159) a!3186 mask!3328) (Found!7986 j!159)))))

(declare-fun b!779079 () Bool)

(assert (=> b!779079 (= e!433427 e!433430)))

(declare-fun res!527069 () Bool)

(assert (=> b!779079 (=> (not res!527069) (not e!433430))))

(declare-fun lt!347106 () SeekEntryResult!7986)

(assert (=> b!779079 (= res!527069 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20386 a!3186) j!159) mask!3328) (select (arr!20386 a!3186) j!159) a!3186 mask!3328) lt!347106))))

(assert (=> b!779079 (= lt!347106 (Intermediate!7986 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!779080 () Bool)

(declare-fun res!527079 () Bool)

(assert (=> b!779080 (=> (not res!527079) (not e!433425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779080 (= res!527079 (validKeyInArray!0 (select (arr!20386 a!3186) j!159)))))

(declare-fun b!779081 () Bool)

(declare-fun res!527076 () Bool)

(assert (=> b!779081 (=> (not res!527076) (not e!433427))))

(assert (=> b!779081 (= res!527076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779082 () Bool)

(declare-fun res!527068 () Bool)

(assert (=> b!779082 (=> (not res!527068) (not e!433427))))

(declare-datatypes ((List!14388 0))(
  ( (Nil!14385) (Cons!14384 (h!15498 (_ BitVec 64)) (t!20703 List!14388)) )
))
(declare-fun arrayNoDuplicates!0 (array!42587 (_ BitVec 32) List!14388) Bool)

(assert (=> b!779082 (= res!527068 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14385))))

(declare-fun b!779083 () Bool)

(assert (=> b!779083 (= e!433423 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20386 a!3186) j!159) a!3186 mask!3328) lt!347106))))

(declare-fun b!779084 () Bool)

(declare-fun res!527075 () Bool)

(assert (=> b!779084 (=> (not res!527075) (not e!433425))))

(assert (=> b!779084 (= res!527075 (validKeyInArray!0 k0!2102))))

(declare-fun b!779085 () Bool)

(assert (=> b!779085 (= e!433425 e!433427)))

(declare-fun res!527070 () Bool)

(assert (=> b!779085 (=> (not res!527070) (not e!433427))))

(declare-fun lt!347110 () SeekEntryResult!7986)

(assert (=> b!779085 (= res!527070 (or (= lt!347110 (MissingZero!7986 i!1173)) (= lt!347110 (MissingVacant!7986 i!1173))))))

(assert (=> b!779085 (= lt!347110 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!67358 res!527081) b!779069))

(assert (= (and b!779069 res!527074) b!779080))

(assert (= (and b!779080 res!527079) b!779084))

(assert (= (and b!779084 res!527075) b!779073))

(assert (= (and b!779073 res!527067) b!779085))

(assert (= (and b!779085 res!527070) b!779081))

(assert (= (and b!779081 res!527076) b!779082))

(assert (= (and b!779082 res!527068) b!779070))

(assert (= (and b!779070 res!527078) b!779079))

(assert (= (and b!779079 res!527069) b!779076))

(assert (= (and b!779076 res!527080) b!779077))

(assert (= (and b!779077 c!86404) b!779083))

(assert (= (and b!779077 (not c!86404)) b!779078))

(assert (= (and b!779077 res!527077) b!779075))

(assert (= (and b!779075 res!527072) b!779072))

(assert (= (and b!779072 res!527071) b!779074))

(assert (= (and b!779074 res!527073) b!779068))

(assert (= (and b!779072 (not res!527066)) b!779071))

(declare-fun m!722625 () Bool)

(assert (=> b!779068 m!722625))

(assert (=> b!779068 m!722625))

(declare-fun m!722627 () Bool)

(assert (=> b!779068 m!722627))

(declare-fun m!722629 () Bool)

(assert (=> b!779072 m!722629))

(declare-fun m!722631 () Bool)

(assert (=> b!779072 m!722631))

(declare-fun m!722633 () Bool)

(assert (=> b!779084 m!722633))

(declare-fun m!722635 () Bool)

(assert (=> start!67358 m!722635))

(declare-fun m!722637 () Bool)

(assert (=> start!67358 m!722637))

(declare-fun m!722639 () Bool)

(assert (=> b!779075 m!722639))

(declare-fun m!722641 () Bool)

(assert (=> b!779075 m!722641))

(declare-fun m!722643 () Bool)

(assert (=> b!779075 m!722643))

(declare-fun m!722645 () Bool)

(assert (=> b!779075 m!722645))

(declare-fun m!722647 () Bool)

(assert (=> b!779075 m!722647))

(assert (=> b!779075 m!722641))

(assert (=> b!779079 m!722625))

(assert (=> b!779079 m!722625))

(declare-fun m!722649 () Bool)

(assert (=> b!779079 m!722649))

(assert (=> b!779079 m!722649))

(assert (=> b!779079 m!722625))

(declare-fun m!722651 () Bool)

(assert (=> b!779079 m!722651))

(declare-fun m!722653 () Bool)

(assert (=> b!779085 m!722653))

(declare-fun m!722655 () Bool)

(assert (=> b!779076 m!722655))

(assert (=> b!779083 m!722625))

(assert (=> b!779083 m!722625))

(declare-fun m!722657 () Bool)

(assert (=> b!779083 m!722657))

(assert (=> b!779080 m!722625))

(assert (=> b!779080 m!722625))

(declare-fun m!722659 () Bool)

(assert (=> b!779080 m!722659))

(assert (=> b!779071 m!722625))

(assert (=> b!779071 m!722625))

(declare-fun m!722661 () Bool)

(assert (=> b!779071 m!722661))

(declare-fun m!722663 () Bool)

(assert (=> b!779082 m!722663))

(declare-fun m!722665 () Bool)

(assert (=> b!779073 m!722665))

(assert (=> b!779078 m!722625))

(assert (=> b!779078 m!722625))

(assert (=> b!779078 m!722661))

(assert (=> b!779074 m!722625))

(assert (=> b!779074 m!722625))

(declare-fun m!722667 () Bool)

(assert (=> b!779074 m!722667))

(declare-fun m!722669 () Bool)

(assert (=> b!779081 m!722669))

(check-sat (not b!779075) (not b!779068) (not b!779071) (not b!779078) (not b!779073) (not b!779080) (not b!779082) (not b!779072) (not b!779085) (not b!779081) (not b!779074) (not b!779084) (not b!779079) (not start!67358) (not b!779083))
(check-sat)
