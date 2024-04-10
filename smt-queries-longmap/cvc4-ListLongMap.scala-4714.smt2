; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65348 () Bool)

(assert start!65348)

(declare-datatypes ((array!41521 0))(
  ( (array!41522 (arr!19874 (Array (_ BitVec 32) (_ BitVec 64))) (size!20295 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41521)

(declare-fun b!742702 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!415050 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7474 0))(
  ( (MissingZero!7474 (index!32264 (_ BitVec 32))) (Found!7474 (index!32265 (_ BitVec 32))) (Intermediate!7474 (undefined!8286 Bool) (index!32266 (_ BitVec 32)) (x!63232 (_ BitVec 32))) (Undefined!7474) (MissingVacant!7474 (index!32267 (_ BitVec 32))) )
))
(declare-fun lt!329944 () SeekEntryResult!7474)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41521 (_ BitVec 32)) SeekEntryResult!7474)

(assert (=> b!742702 (= e!415050 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19874 a!3186) j!159) a!3186 mask!3328) lt!329944))))

(declare-fun b!742703 () Bool)

(declare-fun res!499866 () Bool)

(declare-fun e!415055 () Bool)

(assert (=> b!742703 (=> (not res!499866) (not e!415055))))

(assert (=> b!742703 (= res!499866 e!415050)))

(declare-fun c!81799 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742703 (= c!81799 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742704 () Bool)

(declare-fun e!415057 () Bool)

(assert (=> b!742704 (= e!415057 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!329949 () SeekEntryResult!7474)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41521 (_ BitVec 32)) SeekEntryResult!7474)

(assert (=> b!742704 (= lt!329949 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19874 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!742705 () Bool)

(declare-fun e!415053 () Bool)

(assert (=> b!742705 (= e!415053 e!415055)))

(declare-fun res!499865 () Bool)

(assert (=> b!742705 (=> (not res!499865) (not e!415055))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742705 (= res!499865 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19874 a!3186) j!159) mask!3328) (select (arr!19874 a!3186) j!159) a!3186 mask!3328) lt!329944))))

(assert (=> b!742705 (= lt!329944 (Intermediate!7474 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!415056 () Bool)

(declare-fun b!742706 () Bool)

(declare-fun lt!329946 () SeekEntryResult!7474)

(assert (=> b!742706 (= e!415056 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19874 a!3186) j!159) a!3186 mask!3328) lt!329946))))

(declare-fun b!742707 () Bool)

(declare-fun res!499879 () Bool)

(assert (=> b!742707 (=> (not res!499879) (not e!415053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41521 (_ BitVec 32)) Bool)

(assert (=> b!742707 (= res!499879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742708 () Bool)

(declare-fun e!415052 () Bool)

(assert (=> b!742708 (= e!415052 e!415053)))

(declare-fun res!499876 () Bool)

(assert (=> b!742708 (=> (not res!499876) (not e!415053))))

(declare-fun lt!329951 () SeekEntryResult!7474)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742708 (= res!499876 (or (= lt!329951 (MissingZero!7474 i!1173)) (= lt!329951 (MissingVacant!7474 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41521 (_ BitVec 32)) SeekEntryResult!7474)

(assert (=> b!742708 (= lt!329951 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!742710 () Bool)

(declare-fun e!415058 () Bool)

(assert (=> b!742710 (= e!415055 e!415058)))

(declare-fun res!499878 () Bool)

(assert (=> b!742710 (=> (not res!499878) (not e!415058))))

(declare-fun lt!329945 () SeekEntryResult!7474)

(declare-fun lt!329950 () SeekEntryResult!7474)

(assert (=> b!742710 (= res!499878 (= lt!329945 lt!329950))))

(declare-fun lt!329947 () array!41521)

(declare-fun lt!329948 () (_ BitVec 64))

(assert (=> b!742710 (= lt!329950 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329948 lt!329947 mask!3328))))

(assert (=> b!742710 (= lt!329945 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329948 mask!3328) lt!329948 lt!329947 mask!3328))))

(assert (=> b!742710 (= lt!329948 (select (store (arr!19874 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!742710 (= lt!329947 (array!41522 (store (arr!19874 a!3186) i!1173 k!2102) (size!20295 a!3186)))))

(declare-fun b!742711 () Bool)

(declare-fun res!499875 () Bool)

(assert (=> b!742711 (=> (not res!499875) (not e!415053))))

(declare-datatypes ((List!13876 0))(
  ( (Nil!13873) (Cons!13872 (h!14944 (_ BitVec 64)) (t!20191 List!13876)) )
))
(declare-fun arrayNoDuplicates!0 (array!41521 (_ BitVec 32) List!13876) Bool)

(assert (=> b!742711 (= res!499875 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13873))))

(declare-fun b!742712 () Bool)

(declare-fun res!499872 () Bool)

(assert (=> b!742712 (=> (not res!499872) (not e!415052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742712 (= res!499872 (validKeyInArray!0 (select (arr!19874 a!3186) j!159)))))

(declare-fun b!742713 () Bool)

(declare-fun res!499867 () Bool)

(assert (=> b!742713 (=> (not res!499867) (not e!415053))))

(assert (=> b!742713 (= res!499867 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20295 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20295 a!3186))))))

(declare-fun b!742714 () Bool)

(declare-fun res!499871 () Bool)

(assert (=> b!742714 (=> (not res!499871) (not e!415052))))

(assert (=> b!742714 (= res!499871 (and (= (size!20295 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20295 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20295 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742715 () Bool)

(declare-fun res!499869 () Bool)

(assert (=> b!742715 (=> (not res!499869) (not e!415052))))

(declare-fun arrayContainsKey!0 (array!41521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742715 (= res!499869 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742716 () Bool)

(assert (=> b!742716 (= e!415050 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19874 a!3186) j!159) a!3186 mask!3328) (Found!7474 j!159)))))

(declare-fun b!742717 () Bool)

(declare-fun e!415054 () Bool)

(assert (=> b!742717 (= e!415054 e!415056)))

(declare-fun res!499874 () Bool)

(assert (=> b!742717 (=> (not res!499874) (not e!415056))))

(assert (=> b!742717 (= res!499874 (= (seekEntryOrOpen!0 (select (arr!19874 a!3186) j!159) a!3186 mask!3328) lt!329946))))

(assert (=> b!742717 (= lt!329946 (Found!7474 j!159))))

(declare-fun b!742718 () Bool)

(declare-fun res!499873 () Bool)

(assert (=> b!742718 (=> (not res!499873) (not e!415052))))

(assert (=> b!742718 (= res!499873 (validKeyInArray!0 k!2102))))

(declare-fun b!742719 () Bool)

(assert (=> b!742719 (= e!415058 (not e!415057))))

(declare-fun res!499880 () Bool)

(assert (=> b!742719 (=> res!499880 e!415057)))

(assert (=> b!742719 (= res!499880 (or (not (is-Intermediate!7474 lt!329950)) (bvslt x!1131 (x!63232 lt!329950)) (not (= x!1131 (x!63232 lt!329950))) (not (= index!1321 (index!32266 lt!329950)))))))

(assert (=> b!742719 e!415054))

(declare-fun res!499870 () Bool)

(assert (=> b!742719 (=> (not res!499870) (not e!415054))))

(assert (=> b!742719 (= res!499870 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25428 0))(
  ( (Unit!25429) )
))
(declare-fun lt!329943 () Unit!25428)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25428)

(assert (=> b!742719 (= lt!329943 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!499868 () Bool)

(assert (=> start!65348 (=> (not res!499868) (not e!415052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65348 (= res!499868 (validMask!0 mask!3328))))

(assert (=> start!65348 e!415052))

(assert (=> start!65348 true))

(declare-fun array_inv!15670 (array!41521) Bool)

(assert (=> start!65348 (array_inv!15670 a!3186)))

(declare-fun b!742709 () Bool)

(declare-fun res!499877 () Bool)

(assert (=> b!742709 (=> (not res!499877) (not e!415055))))

(assert (=> b!742709 (= res!499877 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19874 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!65348 res!499868) b!742714))

(assert (= (and b!742714 res!499871) b!742712))

(assert (= (and b!742712 res!499872) b!742718))

(assert (= (and b!742718 res!499873) b!742715))

(assert (= (and b!742715 res!499869) b!742708))

(assert (= (and b!742708 res!499876) b!742707))

(assert (= (and b!742707 res!499879) b!742711))

(assert (= (and b!742711 res!499875) b!742713))

(assert (= (and b!742713 res!499867) b!742705))

(assert (= (and b!742705 res!499865) b!742709))

(assert (= (and b!742709 res!499877) b!742703))

(assert (= (and b!742703 c!81799) b!742702))

(assert (= (and b!742703 (not c!81799)) b!742716))

(assert (= (and b!742703 res!499866) b!742710))

(assert (= (and b!742710 res!499878) b!742719))

(assert (= (and b!742719 res!499870) b!742717))

(assert (= (and b!742717 res!499874) b!742706))

(assert (= (and b!742719 (not res!499880)) b!742704))

(declare-fun m!693525 () Bool)

(assert (=> start!65348 m!693525))

(declare-fun m!693527 () Bool)

(assert (=> start!65348 m!693527))

(declare-fun m!693529 () Bool)

(assert (=> b!742705 m!693529))

(assert (=> b!742705 m!693529))

(declare-fun m!693531 () Bool)

(assert (=> b!742705 m!693531))

(assert (=> b!742705 m!693531))

(assert (=> b!742705 m!693529))

(declare-fun m!693533 () Bool)

(assert (=> b!742705 m!693533))

(declare-fun m!693535 () Bool)

(assert (=> b!742715 m!693535))

(assert (=> b!742702 m!693529))

(assert (=> b!742702 m!693529))

(declare-fun m!693537 () Bool)

(assert (=> b!742702 m!693537))

(declare-fun m!693539 () Bool)

(assert (=> b!742708 m!693539))

(assert (=> b!742706 m!693529))

(assert (=> b!742706 m!693529))

(declare-fun m!693541 () Bool)

(assert (=> b!742706 m!693541))

(declare-fun m!693543 () Bool)

(assert (=> b!742718 m!693543))

(assert (=> b!742712 m!693529))

(assert (=> b!742712 m!693529))

(declare-fun m!693545 () Bool)

(assert (=> b!742712 m!693545))

(assert (=> b!742716 m!693529))

(assert (=> b!742716 m!693529))

(declare-fun m!693547 () Bool)

(assert (=> b!742716 m!693547))

(declare-fun m!693549 () Bool)

(assert (=> b!742719 m!693549))

(declare-fun m!693551 () Bool)

(assert (=> b!742719 m!693551))

(declare-fun m!693553 () Bool)

(assert (=> b!742711 m!693553))

(assert (=> b!742704 m!693529))

(assert (=> b!742704 m!693529))

(assert (=> b!742704 m!693547))

(declare-fun m!693555 () Bool)

(assert (=> b!742710 m!693555))

(declare-fun m!693557 () Bool)

(assert (=> b!742710 m!693557))

(declare-fun m!693559 () Bool)

(assert (=> b!742710 m!693559))

(declare-fun m!693561 () Bool)

(assert (=> b!742710 m!693561))

(assert (=> b!742710 m!693555))

(declare-fun m!693563 () Bool)

(assert (=> b!742710 m!693563))

(declare-fun m!693565 () Bool)

(assert (=> b!742707 m!693565))

(assert (=> b!742717 m!693529))

(assert (=> b!742717 m!693529))

(declare-fun m!693567 () Bool)

(assert (=> b!742717 m!693567))

(declare-fun m!693569 () Bool)

(assert (=> b!742709 m!693569))

(push 1)

