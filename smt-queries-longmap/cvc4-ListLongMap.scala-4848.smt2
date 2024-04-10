; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66790 () Bool)

(assert start!66790)

(declare-fun b!770096 () Bool)

(declare-fun res!520878 () Bool)

(declare-fun e!428785 () Bool)

(assert (=> b!770096 (=> (not res!520878) (not e!428785))))

(declare-datatypes ((array!42352 0))(
  ( (array!42353 (arr!20276 (Array (_ BitVec 32) (_ BitVec 64))) (size!20697 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42352)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42352 (_ BitVec 32)) Bool)

(assert (=> b!770096 (= res!520878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770097 () Bool)

(declare-datatypes ((Unit!26518 0))(
  ( (Unit!26519) )
))
(declare-fun e!428783 () Unit!26518)

(declare-fun Unit!26520 () Unit!26518)

(assert (=> b!770097 (= e!428783 Unit!26520)))

(declare-datatypes ((SeekEntryResult!7876 0))(
  ( (MissingZero!7876 (index!33872 (_ BitVec 32))) (Found!7876 (index!33873 (_ BitVec 32))) (Intermediate!7876 (undefined!8688 Bool) (index!33874 (_ BitVec 32)) (x!64799 (_ BitVec 32))) (Undefined!7876) (MissingVacant!7876 (index!33875 (_ BitVec 32))) )
))
(declare-fun lt!342710 () SeekEntryResult!7876)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!342707 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42352 (_ BitVec 32)) SeekEntryResult!7876)

(assert (=> b!770097 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342707 (select (arr!20276 a!3186) j!159) a!3186 mask!3328) lt!342710)))

(declare-fun b!770098 () Bool)

(declare-fun e!428786 () Bool)

(assert (=> b!770098 (= e!428786 e!428785)))

(declare-fun res!520877 () Bool)

(assert (=> b!770098 (=> (not res!520877) (not e!428785))))

(declare-fun lt!342706 () SeekEntryResult!7876)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770098 (= res!520877 (or (= lt!342706 (MissingZero!7876 i!1173)) (= lt!342706 (MissingVacant!7876 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42352 (_ BitVec 32)) SeekEntryResult!7876)

(assert (=> b!770098 (= lt!342706 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!770099 () Bool)

(declare-fun res!520880 () Bool)

(declare-fun e!428782 () Bool)

(assert (=> b!770099 (=> (not res!520880) (not e!428782))))

(declare-fun e!428780 () Bool)

(assert (=> b!770099 (= res!520880 e!428780)))

(declare-fun c!85005 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770099 (= c!85005 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770100 () Bool)

(declare-fun res!520885 () Bool)

(assert (=> b!770100 (=> (not res!520885) (not e!428786))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770100 (= res!520885 (validKeyInArray!0 (select (arr!20276 a!3186) j!159)))))

(declare-fun b!770101 () Bool)

(assert (=> b!770101 (= e!428785 e!428782)))

(declare-fun res!520881 () Bool)

(assert (=> b!770101 (=> (not res!520881) (not e!428782))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770101 (= res!520881 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20276 a!3186) j!159) mask!3328) (select (arr!20276 a!3186) j!159) a!3186 mask!3328) lt!342710))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!770101 (= lt!342710 (Intermediate!7876 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770102 () Bool)

(declare-fun Unit!26521 () Unit!26518)

(assert (=> b!770102 (= e!428783 Unit!26521)))

(declare-fun lt!342714 () SeekEntryResult!7876)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42352 (_ BitVec 32)) SeekEntryResult!7876)

(assert (=> b!770102 (= lt!342714 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20276 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770102 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342707 resIntermediateIndex!5 (select (arr!20276 a!3186) j!159) a!3186 mask!3328) (Found!7876 j!159))))

(declare-fun res!520888 () Bool)

(assert (=> start!66790 (=> (not res!520888) (not e!428786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66790 (= res!520888 (validMask!0 mask!3328))))

(assert (=> start!66790 e!428786))

(assert (=> start!66790 true))

(declare-fun array_inv!16072 (array!42352) Bool)

(assert (=> start!66790 (array_inv!16072 a!3186)))

(declare-fun e!428789 () Bool)

(declare-fun b!770103 () Bool)

(declare-fun lt!342713 () SeekEntryResult!7876)

(assert (=> b!770103 (= e!428789 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20276 a!3186) j!159) a!3186 mask!3328) lt!342713))))

(declare-fun b!770104 () Bool)

(declare-fun e!428781 () Bool)

(assert (=> b!770104 (= e!428782 e!428781)))

(declare-fun res!520883 () Bool)

(assert (=> b!770104 (=> (not res!520883) (not e!428781))))

(declare-fun lt!342715 () SeekEntryResult!7876)

(declare-fun lt!342712 () SeekEntryResult!7876)

(assert (=> b!770104 (= res!520883 (= lt!342715 lt!342712))))

(declare-fun lt!342711 () array!42352)

(declare-fun lt!342708 () (_ BitVec 64))

(assert (=> b!770104 (= lt!342712 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342708 lt!342711 mask!3328))))

(assert (=> b!770104 (= lt!342715 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342708 mask!3328) lt!342708 lt!342711 mask!3328))))

(assert (=> b!770104 (= lt!342708 (select (store (arr!20276 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!770104 (= lt!342711 (array!42353 (store (arr!20276 a!3186) i!1173 k!2102) (size!20697 a!3186)))))

(declare-fun b!770105 () Bool)

(declare-fun e!428787 () Bool)

(assert (=> b!770105 (= e!428787 true)))

(declare-fun lt!342716 () Unit!26518)

(assert (=> b!770105 (= lt!342716 e!428783)))

(declare-fun c!85006 () Bool)

(assert (=> b!770105 (= c!85006 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770105 (= lt!342707 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770106 () Bool)

(assert (=> b!770106 (= e!428781 (not e!428787))))

(declare-fun res!520886 () Bool)

(assert (=> b!770106 (=> res!520886 e!428787)))

(assert (=> b!770106 (= res!520886 (or (not (is-Intermediate!7876 lt!342712)) (bvsge x!1131 (x!64799 lt!342712))))))

(declare-fun e!428784 () Bool)

(assert (=> b!770106 e!428784))

(declare-fun res!520879 () Bool)

(assert (=> b!770106 (=> (not res!520879) (not e!428784))))

(assert (=> b!770106 (= res!520879 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342709 () Unit!26518)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26518)

(assert (=> b!770106 (= lt!342709 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770107 () Bool)

(declare-fun res!520890 () Bool)

(assert (=> b!770107 (=> (not res!520890) (not e!428786))))

(assert (=> b!770107 (= res!520890 (and (= (size!20697 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20697 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20697 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770108 () Bool)

(declare-fun res!520887 () Bool)

(assert (=> b!770108 (=> (not res!520887) (not e!428786))))

(assert (=> b!770108 (= res!520887 (validKeyInArray!0 k!2102))))

(declare-fun b!770109 () Bool)

(declare-fun res!520892 () Bool)

(assert (=> b!770109 (=> (not res!520892) (not e!428782))))

(assert (=> b!770109 (= res!520892 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20276 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770110 () Bool)

(assert (=> b!770110 (= e!428780 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20276 a!3186) j!159) a!3186 mask!3328) (Found!7876 j!159)))))

(declare-fun b!770111 () Bool)

(declare-fun res!520884 () Bool)

(assert (=> b!770111 (=> (not res!520884) (not e!428785))))

(assert (=> b!770111 (= res!520884 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20697 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20697 a!3186))))))

(declare-fun b!770112 () Bool)

(assert (=> b!770112 (= e!428784 e!428789)))

(declare-fun res!520889 () Bool)

(assert (=> b!770112 (=> (not res!520889) (not e!428789))))

(assert (=> b!770112 (= res!520889 (= (seekEntryOrOpen!0 (select (arr!20276 a!3186) j!159) a!3186 mask!3328) lt!342713))))

(assert (=> b!770112 (= lt!342713 (Found!7876 j!159))))

(declare-fun b!770113 () Bool)

(assert (=> b!770113 (= e!428780 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20276 a!3186) j!159) a!3186 mask!3328) lt!342710))))

(declare-fun b!770114 () Bool)

(declare-fun res!520882 () Bool)

(assert (=> b!770114 (=> (not res!520882) (not e!428785))))

(declare-datatypes ((List!14278 0))(
  ( (Nil!14275) (Cons!14274 (h!15373 (_ BitVec 64)) (t!20593 List!14278)) )
))
(declare-fun arrayNoDuplicates!0 (array!42352 (_ BitVec 32) List!14278) Bool)

(assert (=> b!770114 (= res!520882 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14275))))

(declare-fun b!770115 () Bool)

(declare-fun res!520891 () Bool)

(assert (=> b!770115 (=> (not res!520891) (not e!428786))))

(declare-fun arrayContainsKey!0 (array!42352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770115 (= res!520891 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66790 res!520888) b!770107))

(assert (= (and b!770107 res!520890) b!770100))

(assert (= (and b!770100 res!520885) b!770108))

(assert (= (and b!770108 res!520887) b!770115))

(assert (= (and b!770115 res!520891) b!770098))

(assert (= (and b!770098 res!520877) b!770096))

(assert (= (and b!770096 res!520878) b!770114))

(assert (= (and b!770114 res!520882) b!770111))

(assert (= (and b!770111 res!520884) b!770101))

(assert (= (and b!770101 res!520881) b!770109))

(assert (= (and b!770109 res!520892) b!770099))

(assert (= (and b!770099 c!85005) b!770113))

(assert (= (and b!770099 (not c!85005)) b!770110))

(assert (= (and b!770099 res!520880) b!770104))

(assert (= (and b!770104 res!520883) b!770106))

(assert (= (and b!770106 res!520879) b!770112))

(assert (= (and b!770112 res!520889) b!770103))

(assert (= (and b!770106 (not res!520886)) b!770105))

(assert (= (and b!770105 c!85006) b!770097))

(assert (= (and b!770105 (not c!85006)) b!770102))

(declare-fun m!715423 () Bool)

(assert (=> b!770101 m!715423))

(assert (=> b!770101 m!715423))

(declare-fun m!715425 () Bool)

(assert (=> b!770101 m!715425))

(assert (=> b!770101 m!715425))

(assert (=> b!770101 m!715423))

(declare-fun m!715427 () Bool)

(assert (=> b!770101 m!715427))

(declare-fun m!715429 () Bool)

(assert (=> b!770108 m!715429))

(assert (=> b!770103 m!715423))

(assert (=> b!770103 m!715423))

(declare-fun m!715431 () Bool)

(assert (=> b!770103 m!715431))

(assert (=> b!770102 m!715423))

(assert (=> b!770102 m!715423))

(declare-fun m!715433 () Bool)

(assert (=> b!770102 m!715433))

(assert (=> b!770102 m!715423))

(declare-fun m!715435 () Bool)

(assert (=> b!770102 m!715435))

(declare-fun m!715437 () Bool)

(assert (=> b!770109 m!715437))

(declare-fun m!715439 () Bool)

(assert (=> b!770105 m!715439))

(declare-fun m!715441 () Bool)

(assert (=> b!770098 m!715441))

(declare-fun m!715443 () Bool)

(assert (=> b!770115 m!715443))

(assert (=> b!770110 m!715423))

(assert (=> b!770110 m!715423))

(assert (=> b!770110 m!715433))

(declare-fun m!715445 () Bool)

(assert (=> b!770096 m!715445))

(declare-fun m!715447 () Bool)

(assert (=> start!66790 m!715447))

(declare-fun m!715449 () Bool)

(assert (=> start!66790 m!715449))

(declare-fun m!715451 () Bool)

(assert (=> b!770114 m!715451))

(assert (=> b!770112 m!715423))

(assert (=> b!770112 m!715423))

(declare-fun m!715453 () Bool)

(assert (=> b!770112 m!715453))

(assert (=> b!770100 m!715423))

(assert (=> b!770100 m!715423))

(declare-fun m!715455 () Bool)

(assert (=> b!770100 m!715455))

(declare-fun m!715457 () Bool)

(assert (=> b!770104 m!715457))

(declare-fun m!715459 () Bool)

(assert (=> b!770104 m!715459))

(declare-fun m!715461 () Bool)

(assert (=> b!770104 m!715461))

(declare-fun m!715463 () Bool)

(assert (=> b!770104 m!715463))

(assert (=> b!770104 m!715457))

(declare-fun m!715465 () Bool)

(assert (=> b!770104 m!715465))

(assert (=> b!770113 m!715423))

(assert (=> b!770113 m!715423))

(declare-fun m!715467 () Bool)

(assert (=> b!770113 m!715467))

(declare-fun m!715469 () Bool)

(assert (=> b!770106 m!715469))

(declare-fun m!715471 () Bool)

(assert (=> b!770106 m!715471))

(assert (=> b!770097 m!715423))

(assert (=> b!770097 m!715423))

(declare-fun m!715473 () Bool)

(assert (=> b!770097 m!715473))

(push 1)

