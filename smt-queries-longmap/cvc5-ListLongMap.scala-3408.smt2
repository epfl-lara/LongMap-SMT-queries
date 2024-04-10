; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47370 () Bool)

(assert start!47370)

(declare-fun b!520738 () Bool)

(declare-fun res!318647 () Bool)

(declare-fun e!303864 () Bool)

(assert (=> b!520738 (=> (not res!318647) (not e!303864))))

(declare-datatypes ((array!33196 0))(
  ( (array!33197 (arr!15954 (Array (_ BitVec 32) (_ BitVec 64))) (size!16318 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33196)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33196 (_ BitVec 32)) Bool)

(assert (=> b!520738 (= res!318647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520739 () Bool)

(declare-fun res!318638 () Bool)

(declare-fun e!303869 () Bool)

(assert (=> b!520739 (=> res!318638 e!303869)))

(declare-datatypes ((SeekEntryResult!4421 0))(
  ( (MissingZero!4421 (index!19887 (_ BitVec 32))) (Found!4421 (index!19888 (_ BitVec 32))) (Intermediate!4421 (undefined!5233 Bool) (index!19889 (_ BitVec 32)) (x!48879 (_ BitVec 32))) (Undefined!4421) (MissingVacant!4421 (index!19890 (_ BitVec 32))) )
))
(declare-fun lt!238508 () SeekEntryResult!4421)

(assert (=> b!520739 (= res!318638 (or (undefined!5233 lt!238508) (not (is-Intermediate!4421 lt!238508))))))

(declare-fun b!520740 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!303865 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33196 (_ BitVec 32)) SeekEntryResult!4421)

(assert (=> b!520740 (= e!303865 (= (seekEntryOrOpen!0 (select (arr!15954 a!3235) j!176) a!3235 mask!3524) (Found!4421 j!176)))))

(declare-fun res!318641 () Bool)

(declare-fun e!303870 () Bool)

(assert (=> start!47370 (=> (not res!318641) (not e!303870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47370 (= res!318641 (validMask!0 mask!3524))))

(assert (=> start!47370 e!303870))

(assert (=> start!47370 true))

(declare-fun array_inv!11750 (array!33196) Bool)

(assert (=> start!47370 (array_inv!11750 a!3235)))

(declare-fun b!520741 () Bool)

(declare-datatypes ((Unit!16136 0))(
  ( (Unit!16137) )
))
(declare-fun e!303866 () Unit!16136)

(declare-fun Unit!16138 () Unit!16136)

(assert (=> b!520741 (= e!303866 Unit!16138)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!238513 () (_ BitVec 32))

(declare-fun lt!238510 () Unit!16136)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33196 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16136)

(assert (=> b!520741 (= lt!238510 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238513 #b00000000000000000000000000000000 (index!19889 lt!238508) (x!48879 lt!238508) mask!3524))))

(declare-fun res!318646 () Bool)

(declare-fun lt!238515 () array!33196)

(declare-fun lt!238512 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33196 (_ BitVec 32)) SeekEntryResult!4421)

(assert (=> b!520741 (= res!318646 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238513 lt!238512 lt!238515 mask!3524) (Intermediate!4421 false (index!19889 lt!238508) (x!48879 lt!238508))))))

(declare-fun e!303867 () Bool)

(assert (=> b!520741 (=> (not res!318646) (not e!303867))))

(assert (=> b!520741 e!303867))

(declare-fun b!520742 () Bool)

(declare-fun res!318636 () Bool)

(assert (=> b!520742 (=> (not res!318636) (not e!303870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520742 (= res!318636 (validKeyInArray!0 (select (arr!15954 a!3235) j!176)))))

(declare-fun b!520743 () Bool)

(assert (=> b!520743 (= e!303867 false)))

(declare-fun b!520744 () Bool)

(assert (=> b!520744 (= e!303870 e!303864)))

(declare-fun res!318637 () Bool)

(assert (=> b!520744 (=> (not res!318637) (not e!303864))))

(declare-fun lt!238516 () SeekEntryResult!4421)

(assert (=> b!520744 (= res!318637 (or (= lt!238516 (MissingZero!4421 i!1204)) (= lt!238516 (MissingVacant!4421 i!1204))))))

(assert (=> b!520744 (= lt!238516 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!520745 () Bool)

(assert (=> b!520745 (= e!303864 (not e!303869))))

(declare-fun res!318644 () Bool)

(assert (=> b!520745 (=> res!318644 e!303869)))

(declare-fun lt!238509 () (_ BitVec 32))

(assert (=> b!520745 (= res!318644 (= lt!238508 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238509 lt!238512 lt!238515 mask!3524)))))

(assert (=> b!520745 (= lt!238508 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238513 (select (arr!15954 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520745 (= lt!238509 (toIndex!0 lt!238512 mask!3524))))

(assert (=> b!520745 (= lt!238512 (select (store (arr!15954 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!520745 (= lt!238513 (toIndex!0 (select (arr!15954 a!3235) j!176) mask!3524))))

(assert (=> b!520745 (= lt!238515 (array!33197 (store (arr!15954 a!3235) i!1204 k!2280) (size!16318 a!3235)))))

(assert (=> b!520745 e!303865))

(declare-fun res!318639 () Bool)

(assert (=> b!520745 (=> (not res!318639) (not e!303865))))

(assert (=> b!520745 (= res!318639 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238514 () Unit!16136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16136)

(assert (=> b!520745 (= lt!238514 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520746 () Bool)

(declare-fun res!318645 () Bool)

(assert (=> b!520746 (=> (not res!318645) (not e!303864))))

(declare-datatypes ((List!10112 0))(
  ( (Nil!10109) (Cons!10108 (h!11030 (_ BitVec 64)) (t!16340 List!10112)) )
))
(declare-fun arrayNoDuplicates!0 (array!33196 (_ BitVec 32) List!10112) Bool)

(assert (=> b!520746 (= res!318645 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10109))))

(declare-fun b!520747 () Bool)

(assert (=> b!520747 (= e!303869 (= (select (arr!15954 a!3235) (index!19889 lt!238508)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520747 (and (or (= (select (arr!15954 a!3235) (index!19889 lt!238508)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15954 a!3235) (index!19889 lt!238508)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15954 a!3235) (index!19889 lt!238508)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!238511 () Unit!16136)

(assert (=> b!520747 (= lt!238511 e!303866)))

(declare-fun c!61352 () Bool)

(assert (=> b!520747 (= c!61352 (= (select (arr!15954 a!3235) (index!19889 lt!238508)) (select (arr!15954 a!3235) j!176)))))

(assert (=> b!520747 (and (bvslt (x!48879 lt!238508) #b01111111111111111111111111111110) (or (= (select (arr!15954 a!3235) (index!19889 lt!238508)) (select (arr!15954 a!3235) j!176)) (= (select (arr!15954 a!3235) (index!19889 lt!238508)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15954 a!3235) (index!19889 lt!238508)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520748 () Bool)

(declare-fun res!318642 () Bool)

(assert (=> b!520748 (=> (not res!318642) (not e!303870))))

(assert (=> b!520748 (= res!318642 (validKeyInArray!0 k!2280))))

(declare-fun b!520749 () Bool)

(declare-fun res!318640 () Bool)

(assert (=> b!520749 (=> (not res!318640) (not e!303870))))

(assert (=> b!520749 (= res!318640 (and (= (size!16318 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16318 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16318 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520750 () Bool)

(declare-fun res!318643 () Bool)

(assert (=> b!520750 (=> (not res!318643) (not e!303870))))

(declare-fun arrayContainsKey!0 (array!33196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520750 (= res!318643 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!520751 () Bool)

(declare-fun Unit!16139 () Unit!16136)

(assert (=> b!520751 (= e!303866 Unit!16139)))

(assert (= (and start!47370 res!318641) b!520749))

(assert (= (and b!520749 res!318640) b!520742))

(assert (= (and b!520742 res!318636) b!520748))

(assert (= (and b!520748 res!318642) b!520750))

(assert (= (and b!520750 res!318643) b!520744))

(assert (= (and b!520744 res!318637) b!520738))

(assert (= (and b!520738 res!318647) b!520746))

(assert (= (and b!520746 res!318645) b!520745))

(assert (= (and b!520745 res!318639) b!520740))

(assert (= (and b!520745 (not res!318644)) b!520739))

(assert (= (and b!520739 (not res!318638)) b!520747))

(assert (= (and b!520747 c!61352) b!520741))

(assert (= (and b!520747 (not c!61352)) b!520751))

(assert (= (and b!520741 res!318646) b!520743))

(declare-fun m!501651 () Bool)

(assert (=> b!520746 m!501651))

(declare-fun m!501653 () Bool)

(assert (=> b!520748 m!501653))

(declare-fun m!501655 () Bool)

(assert (=> b!520740 m!501655))

(assert (=> b!520740 m!501655))

(declare-fun m!501657 () Bool)

(assert (=> b!520740 m!501657))

(assert (=> b!520742 m!501655))

(assert (=> b!520742 m!501655))

(declare-fun m!501659 () Bool)

(assert (=> b!520742 m!501659))

(declare-fun m!501661 () Bool)

(assert (=> b!520738 m!501661))

(declare-fun m!501663 () Bool)

(assert (=> start!47370 m!501663))

(declare-fun m!501665 () Bool)

(assert (=> start!47370 m!501665))

(declare-fun m!501667 () Bool)

(assert (=> b!520744 m!501667))

(declare-fun m!501669 () Bool)

(assert (=> b!520741 m!501669))

(declare-fun m!501671 () Bool)

(assert (=> b!520741 m!501671))

(declare-fun m!501673 () Bool)

(assert (=> b!520745 m!501673))

(declare-fun m!501675 () Bool)

(assert (=> b!520745 m!501675))

(declare-fun m!501677 () Bool)

(assert (=> b!520745 m!501677))

(assert (=> b!520745 m!501655))

(declare-fun m!501679 () Bool)

(assert (=> b!520745 m!501679))

(assert (=> b!520745 m!501655))

(declare-fun m!501681 () Bool)

(assert (=> b!520745 m!501681))

(declare-fun m!501683 () Bool)

(assert (=> b!520745 m!501683))

(declare-fun m!501685 () Bool)

(assert (=> b!520745 m!501685))

(assert (=> b!520745 m!501655))

(declare-fun m!501687 () Bool)

(assert (=> b!520745 m!501687))

(declare-fun m!501689 () Bool)

(assert (=> b!520750 m!501689))

(declare-fun m!501691 () Bool)

(assert (=> b!520747 m!501691))

(assert (=> b!520747 m!501655))

(push 1)

