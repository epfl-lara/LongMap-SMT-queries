; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67258 () Bool)

(assert start!67258)

(declare-fun b!777659 () Bool)

(declare-fun e!432704 () Bool)

(declare-fun e!432703 () Bool)

(assert (=> b!777659 (= e!432704 e!432703)))

(declare-fun res!526071 () Bool)

(assert (=> b!777659 (=> (not res!526071) (not e!432703))))

(declare-datatypes ((SeekEntryResult!7969 0))(
  ( (MissingZero!7969 (index!34244 (_ BitVec 32))) (Found!7969 (index!34245 (_ BitVec 32))) (Intermediate!7969 (undefined!8781 Bool) (index!34246 (_ BitVec 32)) (x!65185 (_ BitVec 32))) (Undefined!7969) (MissingVacant!7969 (index!34247 (_ BitVec 32))) )
))
(declare-fun lt!346465 () SeekEntryResult!7969)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!777659 (= res!526071 (or (= lt!346465 (MissingZero!7969 i!1173)) (= lt!346465 (MissingVacant!7969 i!1173))))))

(declare-datatypes ((array!42550 0))(
  ( (array!42551 (arr!20369 (Array (_ BitVec 32) (_ BitVec 64))) (size!20790 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42550)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42550 (_ BitVec 32)) SeekEntryResult!7969)

(assert (=> b!777659 (= lt!346465 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun e!432708 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!346464 () SeekEntryResult!7969)

(declare-fun b!777660 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42550 (_ BitVec 32)) SeekEntryResult!7969)

(assert (=> b!777660 (= e!432708 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20369 a!3186) j!159) a!3186 mask!3328) lt!346464))))

(declare-fun b!777662 () Bool)

(declare-fun res!526068 () Bool)

(assert (=> b!777662 (=> (not res!526068) (not e!432704))))

(declare-fun arrayContainsKey!0 (array!42550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777662 (= res!526068 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777663 () Bool)

(declare-fun res!526082 () Bool)

(assert (=> b!777663 (=> (not res!526082) (not e!432704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777663 (= res!526082 (validKeyInArray!0 k!2102))))

(declare-fun b!777664 () Bool)

(declare-fun res!526083 () Bool)

(declare-fun e!432706 () Bool)

(assert (=> b!777664 (=> (not res!526083) (not e!432706))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!777664 (= res!526083 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20369 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777665 () Bool)

(declare-fun res!526076 () Bool)

(assert (=> b!777665 (=> (not res!526076) (not e!432706))))

(assert (=> b!777665 (= res!526076 e!432708)))

(declare-fun c!86197 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!777665 (= c!86197 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!777666 () Bool)

(assert (=> b!777666 (= e!432703 e!432706)))

(declare-fun res!526072 () Bool)

(assert (=> b!777666 (=> (not res!526072) (not e!432706))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777666 (= res!526072 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20369 a!3186) j!159) mask!3328) (select (arr!20369 a!3186) j!159) a!3186 mask!3328) lt!346464))))

(assert (=> b!777666 (= lt!346464 (Intermediate!7969 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777667 () Bool)

(declare-fun res!526073 () Bool)

(assert (=> b!777667 (=> (not res!526073) (not e!432703))))

(declare-datatypes ((List!14371 0))(
  ( (Nil!14368) (Cons!14367 (h!15478 (_ BitVec 64)) (t!20686 List!14371)) )
))
(declare-fun arrayNoDuplicates!0 (array!42550 (_ BitVec 32) List!14371) Bool)

(assert (=> b!777667 (= res!526073 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14368))))

(declare-fun b!777668 () Bool)

(declare-fun e!432707 () Bool)

(declare-fun e!432702 () Bool)

(assert (=> b!777668 (= e!432707 (not e!432702))))

(declare-fun res!526075 () Bool)

(assert (=> b!777668 (=> res!526075 e!432702)))

(declare-fun lt!346462 () SeekEntryResult!7969)

(assert (=> b!777668 (= res!526075 (or (not (is-Intermediate!7969 lt!346462)) (bvslt x!1131 (x!65185 lt!346462)) (not (= x!1131 (x!65185 lt!346462))) (not (= index!1321 (index!34246 lt!346462)))))))

(declare-fun e!432710 () Bool)

(assert (=> b!777668 e!432710))

(declare-fun res!526070 () Bool)

(assert (=> b!777668 (=> (not res!526070) (not e!432710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42550 (_ BitVec 32)) Bool)

(assert (=> b!777668 (= res!526070 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26832 0))(
  ( (Unit!26833) )
))
(declare-fun lt!346463 () Unit!26832)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26832)

(assert (=> b!777668 (= lt!346463 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777669 () Bool)

(declare-fun res!526084 () Bool)

(assert (=> b!777669 (=> (not res!526084) (not e!432704))))

(assert (=> b!777669 (= res!526084 (validKeyInArray!0 (select (arr!20369 a!3186) j!159)))))

(declare-fun b!777670 () Bool)

(declare-fun res!526080 () Bool)

(assert (=> b!777670 (=> res!526080 e!432702)))

(declare-fun lt!346466 () (_ BitVec 64))

(assert (=> b!777670 (= res!526080 (or (not (= (select (store (arr!20369 a!3186) i!1173 k!2102) index!1321) lt!346466)) (undefined!8781 lt!346462)))))

(declare-fun b!777671 () Bool)

(declare-fun res!526079 () Bool)

(assert (=> b!777671 (=> (not res!526079) (not e!432704))))

(assert (=> b!777671 (= res!526079 (and (= (size!20790 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20790 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20790 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!777672 () Bool)

(assert (=> b!777672 (= e!432702 true)))

(declare-fun lt!346469 () SeekEntryResult!7969)

(declare-fun lt!346461 () array!42550)

(assert (=> b!777672 (= lt!346469 (seekEntryOrOpen!0 lt!346466 lt!346461 mask!3328))))

(declare-fun b!777673 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42550 (_ BitVec 32)) SeekEntryResult!7969)

(assert (=> b!777673 (= e!432708 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20369 a!3186) j!159) a!3186 mask!3328) (Found!7969 j!159)))))

(declare-fun b!777674 () Bool)

(declare-fun e!432705 () Bool)

(assert (=> b!777674 (= e!432710 e!432705)))

(declare-fun res!526069 () Bool)

(assert (=> b!777674 (=> (not res!526069) (not e!432705))))

(declare-fun lt!346468 () SeekEntryResult!7969)

(assert (=> b!777674 (= res!526069 (= (seekEntryOrOpen!0 (select (arr!20369 a!3186) j!159) a!3186 mask!3328) lt!346468))))

(assert (=> b!777674 (= lt!346468 (Found!7969 j!159))))

(declare-fun res!526077 () Bool)

(assert (=> start!67258 (=> (not res!526077) (not e!432704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67258 (= res!526077 (validMask!0 mask!3328))))

(assert (=> start!67258 e!432704))

(assert (=> start!67258 true))

(declare-fun array_inv!16165 (array!42550) Bool)

(assert (=> start!67258 (array_inv!16165 a!3186)))

(declare-fun b!777661 () Bool)

(declare-fun res!526081 () Bool)

(assert (=> b!777661 (=> res!526081 e!432702)))

(assert (=> b!777661 (= res!526081 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20369 a!3186) j!159) a!3186 mask!3328) (Found!7969 j!159))))))

(declare-fun b!777675 () Bool)

(declare-fun res!526085 () Bool)

(assert (=> b!777675 (=> (not res!526085) (not e!432703))))

(assert (=> b!777675 (= res!526085 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20790 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20790 a!3186))))))

(declare-fun b!777676 () Bool)

(declare-fun res!526074 () Bool)

(assert (=> b!777676 (=> (not res!526074) (not e!432703))))

(assert (=> b!777676 (= res!526074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!777677 () Bool)

(assert (=> b!777677 (= e!432705 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20369 a!3186) j!159) a!3186 mask!3328) lt!346468))))

(declare-fun b!777678 () Bool)

(assert (=> b!777678 (= e!432706 e!432707)))

(declare-fun res!526078 () Bool)

(assert (=> b!777678 (=> (not res!526078) (not e!432707))))

(declare-fun lt!346467 () SeekEntryResult!7969)

(assert (=> b!777678 (= res!526078 (= lt!346467 lt!346462))))

(assert (=> b!777678 (= lt!346462 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346466 lt!346461 mask!3328))))

(assert (=> b!777678 (= lt!346467 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346466 mask!3328) lt!346466 lt!346461 mask!3328))))

(assert (=> b!777678 (= lt!346466 (select (store (arr!20369 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!777678 (= lt!346461 (array!42551 (store (arr!20369 a!3186) i!1173 k!2102) (size!20790 a!3186)))))

(assert (= (and start!67258 res!526077) b!777671))

(assert (= (and b!777671 res!526079) b!777669))

(assert (= (and b!777669 res!526084) b!777663))

(assert (= (and b!777663 res!526082) b!777662))

(assert (= (and b!777662 res!526068) b!777659))

(assert (= (and b!777659 res!526071) b!777676))

(assert (= (and b!777676 res!526074) b!777667))

(assert (= (and b!777667 res!526073) b!777675))

(assert (= (and b!777675 res!526085) b!777666))

(assert (= (and b!777666 res!526072) b!777664))

(assert (= (and b!777664 res!526083) b!777665))

(assert (= (and b!777665 c!86197) b!777660))

(assert (= (and b!777665 (not c!86197)) b!777673))

(assert (= (and b!777665 res!526076) b!777678))

(assert (= (and b!777678 res!526078) b!777668))

(assert (= (and b!777668 res!526070) b!777674))

(assert (= (and b!777674 res!526069) b!777677))

(assert (= (and b!777668 (not res!526075)) b!777661))

(assert (= (and b!777661 (not res!526081)) b!777670))

(assert (= (and b!777670 (not res!526080)) b!777672))

(declare-fun m!721491 () Bool)

(assert (=> b!777664 m!721491))

(declare-fun m!721493 () Bool)

(assert (=> b!777678 m!721493))

(declare-fun m!721495 () Bool)

(assert (=> b!777678 m!721495))

(declare-fun m!721497 () Bool)

(assert (=> b!777678 m!721497))

(declare-fun m!721499 () Bool)

(assert (=> b!777678 m!721499))

(declare-fun m!721501 () Bool)

(assert (=> b!777678 m!721501))

(assert (=> b!777678 m!721495))

(declare-fun m!721503 () Bool)

(assert (=> b!777659 m!721503))

(declare-fun m!721505 () Bool)

(assert (=> b!777676 m!721505))

(declare-fun m!721507 () Bool)

(assert (=> b!777661 m!721507))

(assert (=> b!777661 m!721507))

(declare-fun m!721509 () Bool)

(assert (=> b!777661 m!721509))

(declare-fun m!721511 () Bool)

(assert (=> b!777667 m!721511))

(declare-fun m!721513 () Bool)

(assert (=> b!777672 m!721513))

(assert (=> b!777674 m!721507))

(assert (=> b!777674 m!721507))

(declare-fun m!721515 () Bool)

(assert (=> b!777674 m!721515))

(assert (=> b!777669 m!721507))

(assert (=> b!777669 m!721507))

(declare-fun m!721517 () Bool)

(assert (=> b!777669 m!721517))

(assert (=> b!777660 m!721507))

(assert (=> b!777660 m!721507))

(declare-fun m!721519 () Bool)

(assert (=> b!777660 m!721519))

(assert (=> b!777666 m!721507))

(assert (=> b!777666 m!721507))

(declare-fun m!721521 () Bool)

(assert (=> b!777666 m!721521))

(assert (=> b!777666 m!721521))

(assert (=> b!777666 m!721507))

(declare-fun m!721523 () Bool)

(assert (=> b!777666 m!721523))

(declare-fun m!721525 () Bool)

(assert (=> b!777662 m!721525))

(assert (=> b!777677 m!721507))

(assert (=> b!777677 m!721507))

(declare-fun m!721527 () Bool)

(assert (=> b!777677 m!721527))

(declare-fun m!721529 () Bool)

(assert (=> start!67258 m!721529))

(declare-fun m!721531 () Bool)

(assert (=> start!67258 m!721531))

(assert (=> b!777670 m!721493))

(declare-fun m!721533 () Bool)

(assert (=> b!777670 m!721533))

(assert (=> b!777673 m!721507))

(assert (=> b!777673 m!721507))

(assert (=> b!777673 m!721509))

(declare-fun m!721535 () Bool)

(assert (=> b!777663 m!721535))

(declare-fun m!721537 () Bool)

(assert (=> b!777668 m!721537))

(declare-fun m!721539 () Bool)

(assert (=> b!777668 m!721539))

(push 1)

