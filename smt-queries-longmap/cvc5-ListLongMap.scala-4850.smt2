; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66798 () Bool)

(assert start!66798)

(declare-fun b!770336 () Bool)

(declare-fun res!521083 () Bool)

(declare-fun e!428909 () Bool)

(assert (=> b!770336 (=> (not res!521083) (not e!428909))))

(declare-datatypes ((array!42360 0))(
  ( (array!42361 (arr!20280 (Array (_ BitVec 32) (_ BitVec 64))) (size!20701 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42360)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42360 (_ BitVec 32)) Bool)

(assert (=> b!770336 (= res!521083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770337 () Bool)

(declare-fun res!521077 () Bool)

(assert (=> b!770337 (=> (not res!521077) (not e!428909))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770337 (= res!521077 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20701 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20701 a!3186))))))

(declare-fun b!770338 () Bool)

(declare-fun res!521069 () Bool)

(declare-fun e!428906 () Bool)

(assert (=> b!770338 (=> (not res!521069) (not e!428906))))

(declare-fun e!428902 () Bool)

(assert (=> b!770338 (= res!521069 e!428902)))

(declare-fun c!85030 () Bool)

(assert (=> b!770338 (= c!85030 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770339 () Bool)

(declare-fun e!428905 () Bool)

(assert (=> b!770339 (= e!428906 e!428905)))

(declare-fun res!521079 () Bool)

(assert (=> b!770339 (=> (not res!521079) (not e!428905))))

(declare-datatypes ((SeekEntryResult!7880 0))(
  ( (MissingZero!7880 (index!33888 (_ BitVec 32))) (Found!7880 (index!33889 (_ BitVec 32))) (Intermediate!7880 (undefined!8692 Bool) (index!33890 (_ BitVec 32)) (x!64819 (_ BitVec 32))) (Undefined!7880) (MissingVacant!7880 (index!33891 (_ BitVec 32))) )
))
(declare-fun lt!342846 () SeekEntryResult!7880)

(declare-fun lt!342840 () SeekEntryResult!7880)

(assert (=> b!770339 (= res!521079 (= lt!342846 lt!342840))))

(declare-fun lt!342839 () (_ BitVec 64))

(declare-fun lt!342847 () array!42360)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42360 (_ BitVec 32)) SeekEntryResult!7880)

(assert (=> b!770339 (= lt!342840 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342839 lt!342847 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770339 (= lt!342846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342839 mask!3328) lt!342839 lt!342847 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!770339 (= lt!342839 (select (store (arr!20280 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!770339 (= lt!342847 (array!42361 (store (arr!20280 a!3186) i!1173 k!2102) (size!20701 a!3186)))))

(declare-fun lt!342845 () SeekEntryResult!7880)

(declare-fun b!770340 () Bool)

(assert (=> b!770340 (= e!428902 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20280 a!3186) j!159) a!3186 mask!3328) lt!342845))))

(declare-fun b!770341 () Bool)

(declare-fun e!428900 () Bool)

(assert (=> b!770341 (= e!428905 (not e!428900))))

(declare-fun res!521072 () Bool)

(assert (=> b!770341 (=> res!521072 e!428900)))

(assert (=> b!770341 (= res!521072 (or (not (is-Intermediate!7880 lt!342840)) (bvsge x!1131 (x!64819 lt!342840))))))

(declare-fun e!428908 () Bool)

(assert (=> b!770341 e!428908))

(declare-fun res!521076 () Bool)

(assert (=> b!770341 (=> (not res!521076) (not e!428908))))

(assert (=> b!770341 (= res!521076 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26534 0))(
  ( (Unit!26535) )
))
(declare-fun lt!342838 () Unit!26534)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26534)

(assert (=> b!770341 (= lt!342838 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770342 () Bool)

(declare-fun res!521081 () Bool)

(assert (=> b!770342 (=> (not res!521081) (not e!428906))))

(assert (=> b!770342 (= res!521081 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20280 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770343 () Bool)

(declare-fun res!521071 () Bool)

(assert (=> b!770343 (=> (not res!521071) (not e!428909))))

(declare-datatypes ((List!14282 0))(
  ( (Nil!14279) (Cons!14278 (h!15377 (_ BitVec 64)) (t!20597 List!14282)) )
))
(declare-fun arrayNoDuplicates!0 (array!42360 (_ BitVec 32) List!14282) Bool)

(assert (=> b!770343 (= res!521071 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14279))))

(declare-fun b!770344 () Bool)

(declare-fun e!428904 () Unit!26534)

(declare-fun Unit!26536 () Unit!26534)

(assert (=> b!770344 (= e!428904 Unit!26536)))

(declare-fun lt!342843 () SeekEntryResult!7880)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42360 (_ BitVec 32)) SeekEntryResult!7880)

(assert (=> b!770344 (= lt!342843 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20280 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!342841 () (_ BitVec 32))

(assert (=> b!770344 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342841 resIntermediateIndex!5 (select (arr!20280 a!3186) j!159) a!3186 mask!3328) (Found!7880 j!159))))

(declare-fun b!770345 () Bool)

(declare-fun res!521070 () Bool)

(declare-fun e!428903 () Bool)

(assert (=> b!770345 (=> (not res!521070) (not e!428903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770345 (= res!521070 (validKeyInArray!0 (select (arr!20280 a!3186) j!159)))))

(declare-fun b!770346 () Bool)

(assert (=> b!770346 (= e!428902 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20280 a!3186) j!159) a!3186 mask!3328) (Found!7880 j!159)))))

(declare-fun b!770347 () Bool)

(assert (=> b!770347 (= e!428909 e!428906)))

(declare-fun res!521084 () Bool)

(assert (=> b!770347 (=> (not res!521084) (not e!428906))))

(assert (=> b!770347 (= res!521084 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20280 a!3186) j!159) mask!3328) (select (arr!20280 a!3186) j!159) a!3186 mask!3328) lt!342845))))

(assert (=> b!770347 (= lt!342845 (Intermediate!7880 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun lt!342844 () SeekEntryResult!7880)

(declare-fun b!770348 () Bool)

(declare-fun e!428901 () Bool)

(assert (=> b!770348 (= e!428901 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20280 a!3186) j!159) a!3186 mask!3328) lt!342844))))

(declare-fun res!521074 () Bool)

(assert (=> start!66798 (=> (not res!521074) (not e!428903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66798 (= res!521074 (validMask!0 mask!3328))))

(assert (=> start!66798 e!428903))

(assert (=> start!66798 true))

(declare-fun array_inv!16076 (array!42360) Bool)

(assert (=> start!66798 (array_inv!16076 a!3186)))

(declare-fun b!770349 () Bool)

(declare-fun res!521078 () Bool)

(assert (=> b!770349 (=> (not res!521078) (not e!428903))))

(assert (=> b!770349 (= res!521078 (and (= (size!20701 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20701 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20701 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770350 () Bool)

(declare-fun Unit!26537 () Unit!26534)

(assert (=> b!770350 (= e!428904 Unit!26537)))

(assert (=> b!770350 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342841 (select (arr!20280 a!3186) j!159) a!3186 mask!3328) lt!342845)))

(declare-fun b!770351 () Bool)

(declare-fun res!521080 () Bool)

(assert (=> b!770351 (=> (not res!521080) (not e!428903))))

(declare-fun arrayContainsKey!0 (array!42360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770351 (= res!521080 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770352 () Bool)

(assert (=> b!770352 (= e!428908 e!428901)))

(declare-fun res!521073 () Bool)

(assert (=> b!770352 (=> (not res!521073) (not e!428901))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42360 (_ BitVec 32)) SeekEntryResult!7880)

(assert (=> b!770352 (= res!521073 (= (seekEntryOrOpen!0 (select (arr!20280 a!3186) j!159) a!3186 mask!3328) lt!342844))))

(assert (=> b!770352 (= lt!342844 (Found!7880 j!159))))

(declare-fun b!770353 () Bool)

(declare-fun res!521075 () Bool)

(assert (=> b!770353 (=> (not res!521075) (not e!428903))))

(assert (=> b!770353 (= res!521075 (validKeyInArray!0 k!2102))))

(declare-fun b!770354 () Bool)

(assert (=> b!770354 (= e!428900 true)))

(declare-fun lt!342848 () Unit!26534)

(assert (=> b!770354 (= lt!342848 e!428904)))

(declare-fun c!85029 () Bool)

(assert (=> b!770354 (= c!85029 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770354 (= lt!342841 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770355 () Bool)

(assert (=> b!770355 (= e!428903 e!428909)))

(declare-fun res!521082 () Bool)

(assert (=> b!770355 (=> (not res!521082) (not e!428909))))

(declare-fun lt!342842 () SeekEntryResult!7880)

(assert (=> b!770355 (= res!521082 (or (= lt!342842 (MissingZero!7880 i!1173)) (= lt!342842 (MissingVacant!7880 i!1173))))))

(assert (=> b!770355 (= lt!342842 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!66798 res!521074) b!770349))

(assert (= (and b!770349 res!521078) b!770345))

(assert (= (and b!770345 res!521070) b!770353))

(assert (= (and b!770353 res!521075) b!770351))

(assert (= (and b!770351 res!521080) b!770355))

(assert (= (and b!770355 res!521082) b!770336))

(assert (= (and b!770336 res!521083) b!770343))

(assert (= (and b!770343 res!521071) b!770337))

(assert (= (and b!770337 res!521077) b!770347))

(assert (= (and b!770347 res!521084) b!770342))

(assert (= (and b!770342 res!521081) b!770338))

(assert (= (and b!770338 c!85030) b!770340))

(assert (= (and b!770338 (not c!85030)) b!770346))

(assert (= (and b!770338 res!521069) b!770339))

(assert (= (and b!770339 res!521079) b!770341))

(assert (= (and b!770341 res!521076) b!770352))

(assert (= (and b!770352 res!521073) b!770348))

(assert (= (and b!770341 (not res!521072)) b!770354))

(assert (= (and b!770354 c!85029) b!770350))

(assert (= (and b!770354 (not c!85029)) b!770344))

(declare-fun m!715631 () Bool)

(assert (=> b!770341 m!715631))

(declare-fun m!715633 () Bool)

(assert (=> b!770341 m!715633))

(declare-fun m!715635 () Bool)

(assert (=> b!770351 m!715635))

(declare-fun m!715637 () Bool)

(assert (=> b!770348 m!715637))

(assert (=> b!770348 m!715637))

(declare-fun m!715639 () Bool)

(assert (=> b!770348 m!715639))

(declare-fun m!715641 () Bool)

(assert (=> b!770353 m!715641))

(assert (=> b!770347 m!715637))

(assert (=> b!770347 m!715637))

(declare-fun m!715643 () Bool)

(assert (=> b!770347 m!715643))

(assert (=> b!770347 m!715643))

(assert (=> b!770347 m!715637))

(declare-fun m!715645 () Bool)

(assert (=> b!770347 m!715645))

(assert (=> b!770346 m!715637))

(assert (=> b!770346 m!715637))

(declare-fun m!715647 () Bool)

(assert (=> b!770346 m!715647))

(declare-fun m!715649 () Bool)

(assert (=> b!770355 m!715649))

(declare-fun m!715651 () Bool)

(assert (=> b!770342 m!715651))

(declare-fun m!715653 () Bool)

(assert (=> b!770354 m!715653))

(declare-fun m!715655 () Bool)

(assert (=> b!770336 m!715655))

(assert (=> b!770345 m!715637))

(assert (=> b!770345 m!715637))

(declare-fun m!715657 () Bool)

(assert (=> b!770345 m!715657))

(declare-fun m!715659 () Bool)

(assert (=> b!770343 m!715659))

(assert (=> b!770340 m!715637))

(assert (=> b!770340 m!715637))

(declare-fun m!715661 () Bool)

(assert (=> b!770340 m!715661))

(assert (=> b!770344 m!715637))

(assert (=> b!770344 m!715637))

(assert (=> b!770344 m!715647))

(assert (=> b!770344 m!715637))

(declare-fun m!715663 () Bool)

(assert (=> b!770344 m!715663))

(assert (=> b!770350 m!715637))

(assert (=> b!770350 m!715637))

(declare-fun m!715665 () Bool)

(assert (=> b!770350 m!715665))

(declare-fun m!715667 () Bool)

(assert (=> start!66798 m!715667))

(declare-fun m!715669 () Bool)

(assert (=> start!66798 m!715669))

(assert (=> b!770352 m!715637))

(assert (=> b!770352 m!715637))

(declare-fun m!715671 () Bool)

(assert (=> b!770352 m!715671))

(declare-fun m!715673 () Bool)

(assert (=> b!770339 m!715673))

(declare-fun m!715675 () Bool)

(assert (=> b!770339 m!715675))

(declare-fun m!715677 () Bool)

(assert (=> b!770339 m!715677))

(declare-fun m!715679 () Bool)

(assert (=> b!770339 m!715679))

(declare-fun m!715681 () Bool)

(assert (=> b!770339 m!715681))

(assert (=> b!770339 m!715675))

(push 1)

