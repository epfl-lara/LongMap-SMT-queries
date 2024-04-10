; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64178 () Bool)

(assert start!64178)

(declare-fun b!720701 () Bool)

(declare-fun res!482840 () Bool)

(declare-fun e!404216 () Bool)

(assert (=> b!720701 (=> (not res!482840) (not e!404216))))

(declare-datatypes ((array!40816 0))(
  ( (array!40817 (arr!19532 (Array (_ BitVec 32) (_ BitVec 64))) (size!19953 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40816)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720701 (= res!482840 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720702 () Bool)

(declare-fun res!482837 () Bool)

(declare-fun e!404213 () Bool)

(assert (=> b!720702 (=> (not res!482837) (not e!404213))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720702 (= res!482837 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19532 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720703 () Bool)

(declare-fun res!482836 () Bool)

(assert (=> b!720703 (=> (not res!482836) (not e!404216))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720703 (= res!482836 (validKeyInArray!0 (select (arr!19532 a!3186) j!159)))))

(declare-fun b!720704 () Bool)

(declare-fun res!482839 () Bool)

(declare-fun e!404215 () Bool)

(assert (=> b!720704 (=> (not res!482839) (not e!404215))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40816 (_ BitVec 32)) Bool)

(assert (=> b!720704 (= res!482839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720705 () Bool)

(assert (=> b!720705 (= e!404213 false)))

(declare-fun lt!319872 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720705 (= lt!319872 (toIndex!0 (select (store (arr!19532 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun b!720706 () Bool)

(declare-fun res!482834 () Bool)

(assert (=> b!720706 (=> (not res!482834) (not e!404216))))

(assert (=> b!720706 (= res!482834 (and (= (size!19953 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19953 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19953 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720707 () Bool)

(assert (=> b!720707 (= e!404216 e!404215)))

(declare-fun res!482830 () Bool)

(assert (=> b!720707 (=> (not res!482830) (not e!404215))))

(declare-datatypes ((SeekEntryResult!7132 0))(
  ( (MissingZero!7132 (index!30896 (_ BitVec 32))) (Found!7132 (index!30897 (_ BitVec 32))) (Intermediate!7132 (undefined!7944 Bool) (index!30898 (_ BitVec 32)) (x!61900 (_ BitVec 32))) (Undefined!7132) (MissingVacant!7132 (index!30899 (_ BitVec 32))) )
))
(declare-fun lt!319873 () SeekEntryResult!7132)

(assert (=> b!720707 (= res!482830 (or (= lt!319873 (MissingZero!7132 i!1173)) (= lt!319873 (MissingVacant!7132 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40816 (_ BitVec 32)) SeekEntryResult!7132)

(assert (=> b!720707 (= lt!319873 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!720709 () Bool)

(declare-fun res!482833 () Bool)

(assert (=> b!720709 (=> (not res!482833) (not e!404215))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720709 (= res!482833 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19953 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19953 a!3186))))))

(declare-fun b!720710 () Bool)

(assert (=> b!720710 (= e!404215 e!404213)))

(declare-fun res!482838 () Bool)

(assert (=> b!720710 (=> (not res!482838) (not e!404213))))

(declare-fun lt!319874 () SeekEntryResult!7132)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40816 (_ BitVec 32)) SeekEntryResult!7132)

(assert (=> b!720710 (= res!482838 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19532 a!3186) j!159) mask!3328) (select (arr!19532 a!3186) j!159) a!3186 mask!3328) lt!319874))))

(assert (=> b!720710 (= lt!319874 (Intermediate!7132 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720711 () Bool)

(declare-fun res!482829 () Bool)

(assert (=> b!720711 (=> (not res!482829) (not e!404216))))

(assert (=> b!720711 (= res!482829 (validKeyInArray!0 k!2102))))

(declare-fun b!720712 () Bool)

(declare-fun e!404212 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40816 (_ BitVec 32)) SeekEntryResult!7132)

(assert (=> b!720712 (= e!404212 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19532 a!3186) j!159) a!3186 mask!3328) (Found!7132 j!159)))))

(declare-fun b!720713 () Bool)

(declare-fun res!482832 () Bool)

(assert (=> b!720713 (=> (not res!482832) (not e!404215))))

(declare-datatypes ((List!13534 0))(
  ( (Nil!13531) (Cons!13530 (h!14581 (_ BitVec 64)) (t!19849 List!13534)) )
))
(declare-fun arrayNoDuplicates!0 (array!40816 (_ BitVec 32) List!13534) Bool)

(assert (=> b!720713 (= res!482832 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13531))))

(declare-fun b!720714 () Bool)

(declare-fun res!482835 () Bool)

(assert (=> b!720714 (=> (not res!482835) (not e!404213))))

(assert (=> b!720714 (= res!482835 e!404212)))

(declare-fun c!79306 () Bool)

(assert (=> b!720714 (= c!79306 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!482831 () Bool)

(assert (=> start!64178 (=> (not res!482831) (not e!404216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64178 (= res!482831 (validMask!0 mask!3328))))

(assert (=> start!64178 e!404216))

(assert (=> start!64178 true))

(declare-fun array_inv!15328 (array!40816) Bool)

(assert (=> start!64178 (array_inv!15328 a!3186)))

(declare-fun b!720708 () Bool)

(assert (=> b!720708 (= e!404212 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19532 a!3186) j!159) a!3186 mask!3328) lt!319874))))

(assert (= (and start!64178 res!482831) b!720706))

(assert (= (and b!720706 res!482834) b!720703))

(assert (= (and b!720703 res!482836) b!720711))

(assert (= (and b!720711 res!482829) b!720701))

(assert (= (and b!720701 res!482840) b!720707))

(assert (= (and b!720707 res!482830) b!720704))

(assert (= (and b!720704 res!482839) b!720713))

(assert (= (and b!720713 res!482832) b!720709))

(assert (= (and b!720709 res!482833) b!720710))

(assert (= (and b!720710 res!482838) b!720702))

(assert (= (and b!720702 res!482837) b!720714))

(assert (= (and b!720714 c!79306) b!720708))

(assert (= (and b!720714 (not c!79306)) b!720712))

(assert (= (and b!720714 res!482835) b!720705))

(declare-fun m!675729 () Bool)

(assert (=> b!720713 m!675729))

(declare-fun m!675731 () Bool)

(assert (=> b!720702 m!675731))

(declare-fun m!675733 () Bool)

(assert (=> b!720705 m!675733))

(declare-fun m!675735 () Bool)

(assert (=> b!720705 m!675735))

(assert (=> b!720705 m!675735))

(declare-fun m!675737 () Bool)

(assert (=> b!720705 m!675737))

(declare-fun m!675739 () Bool)

(assert (=> b!720712 m!675739))

(assert (=> b!720712 m!675739))

(declare-fun m!675741 () Bool)

(assert (=> b!720712 m!675741))

(assert (=> b!720703 m!675739))

(assert (=> b!720703 m!675739))

(declare-fun m!675743 () Bool)

(assert (=> b!720703 m!675743))

(declare-fun m!675745 () Bool)

(assert (=> b!720704 m!675745))

(assert (=> b!720710 m!675739))

(assert (=> b!720710 m!675739))

(declare-fun m!675747 () Bool)

(assert (=> b!720710 m!675747))

(assert (=> b!720710 m!675747))

(assert (=> b!720710 m!675739))

(declare-fun m!675749 () Bool)

(assert (=> b!720710 m!675749))

(declare-fun m!675751 () Bool)

(assert (=> b!720707 m!675751))

(assert (=> b!720708 m!675739))

(assert (=> b!720708 m!675739))

(declare-fun m!675753 () Bool)

(assert (=> b!720708 m!675753))

(declare-fun m!675755 () Bool)

(assert (=> b!720701 m!675755))

(declare-fun m!675757 () Bool)

(assert (=> b!720711 m!675757))

(declare-fun m!675759 () Bool)

(assert (=> start!64178 m!675759))

(declare-fun m!675761 () Bool)

(assert (=> start!64178 m!675761))

(push 1)

(assert (not b!720708))

(assert (not b!720711))

(assert (not b!720703))

(assert (not start!64178))

(assert (not b!720710))

(assert (not b!720704))

(assert (not b!720707))

(assert (not b!720705))

(assert (not b!720713))

(assert (not b!720701))

(assert (not b!720712))

