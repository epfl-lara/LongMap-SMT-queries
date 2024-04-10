; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66660 () Bool)

(assert start!66660)

(declare-fun b!768116 () Bool)

(declare-fun res!519545 () Bool)

(declare-fun e!427739 () Bool)

(assert (=> b!768116 (=> (not res!519545) (not e!427739))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!768116 (= res!519545 (validKeyInArray!0 k!2102))))

(declare-fun b!768117 () Bool)

(declare-fun e!427738 () Bool)

(declare-fun e!427740 () Bool)

(assert (=> b!768117 (= e!427738 (not e!427740))))

(declare-fun res!519548 () Bool)

(assert (=> b!768117 (=> res!519548 e!427740)))

(declare-datatypes ((SeekEntryResult!7852 0))(
  ( (MissingZero!7852 (index!33776 (_ BitVec 32))) (Found!7852 (index!33777 (_ BitVec 32))) (Intermediate!7852 (undefined!8664 Bool) (index!33778 (_ BitVec 32)) (x!64698 (_ BitVec 32))) (Undefined!7852) (MissingVacant!7852 (index!33779 (_ BitVec 32))) )
))
(declare-fun lt!341709 () SeekEntryResult!7852)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!768117 (= res!519548 (or (not (is-Intermediate!7852 lt!341709)) (bvsge x!1131 (x!64698 lt!341709))))))

(declare-fun e!427741 () Bool)

(assert (=> b!768117 e!427741))

(declare-fun res!519558 () Bool)

(assert (=> b!768117 (=> (not res!519558) (not e!427741))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42301 0))(
  ( (array!42302 (arr!20252 (Array (_ BitVec 32) (_ BitVec 64))) (size!20673 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42301)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42301 (_ BitVec 32)) Bool)

(assert (=> b!768117 (= res!519558 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26430 0))(
  ( (Unit!26431) )
))
(declare-fun lt!341711 () Unit!26430)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26430)

(assert (=> b!768117 (= lt!341711 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!768118 () Bool)

(declare-fun res!519550 () Bool)

(assert (=> b!768118 (=> (not res!519550) (not e!427739))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!768118 (= res!519550 (and (= (size!20673 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20673 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20673 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!768119 () Bool)

(declare-fun e!427734 () Bool)

(assert (=> b!768119 (= e!427734 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!341710 () SeekEntryResult!7852)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42301 (_ BitVec 32)) SeekEntryResult!7852)

(assert (=> b!768119 (= lt!341710 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!768120 () Bool)

(declare-fun res!519557 () Bool)

(declare-fun e!427736 () Bool)

(assert (=> b!768120 (=> (not res!519557) (not e!427736))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!768120 (= res!519557 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20673 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20673 a!3186))))))

(declare-fun e!427737 () Bool)

(declare-fun lt!341707 () SeekEntryResult!7852)

(declare-fun b!768121 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42301 (_ BitVec 32)) SeekEntryResult!7852)

(assert (=> b!768121 (= e!427737 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341707))))

(declare-fun b!768122 () Bool)

(declare-fun e!427743 () Bool)

(assert (=> b!768122 (= e!427743 e!427738)))

(declare-fun res!519546 () Bool)

(assert (=> b!768122 (=> (not res!519546) (not e!427738))))

(declare-fun lt!341706 () SeekEntryResult!7852)

(assert (=> b!768122 (= res!519546 (= lt!341706 lt!341709))))

(declare-fun lt!341703 () array!42301)

(declare-fun lt!341702 () (_ BitVec 64))

(assert (=> b!768122 (= lt!341709 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341702 lt!341703 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768122 (= lt!341706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341702 mask!3328) lt!341702 lt!341703 mask!3328))))

(assert (=> b!768122 (= lt!341702 (select (store (arr!20252 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!768122 (= lt!341703 (array!42302 (store (arr!20252 a!3186) i!1173 k!2102) (size!20673 a!3186)))))

(declare-fun b!768123 () Bool)

(assert (=> b!768123 (= e!427739 e!427736)))

(declare-fun res!519554 () Bool)

(assert (=> b!768123 (=> (not res!519554) (not e!427736))))

(declare-fun lt!341705 () SeekEntryResult!7852)

(assert (=> b!768123 (= res!519554 (or (= lt!341705 (MissingZero!7852 i!1173)) (= lt!341705 (MissingVacant!7852 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42301 (_ BitVec 32)) SeekEntryResult!7852)

(assert (=> b!768123 (= lt!341705 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!768124 () Bool)

(declare-fun res!519544 () Bool)

(assert (=> b!768124 (=> (not res!519544) (not e!427736))))

(declare-datatypes ((List!14254 0))(
  ( (Nil!14251) (Cons!14250 (h!15346 (_ BitVec 64)) (t!20569 List!14254)) )
))
(declare-fun arrayNoDuplicates!0 (array!42301 (_ BitVec 32) List!14254) Bool)

(assert (=> b!768124 (= res!519544 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14251))))

(declare-fun b!768126 () Bool)

(assert (=> b!768126 (= e!427740 e!427734)))

(declare-fun res!519551 () Bool)

(assert (=> b!768126 (=> res!519551 e!427734)))

(assert (=> b!768126 (= res!519551 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!341708 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768126 (= lt!341708 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!768127 () Bool)

(declare-fun e!427735 () Bool)

(assert (=> b!768127 (= e!427741 e!427735)))

(declare-fun res!519555 () Bool)

(assert (=> b!768127 (=> (not res!519555) (not e!427735))))

(declare-fun lt!341704 () SeekEntryResult!7852)

(assert (=> b!768127 (= res!519555 (= (seekEntryOrOpen!0 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341704))))

(assert (=> b!768127 (= lt!341704 (Found!7852 j!159))))

(declare-fun b!768128 () Bool)

(declare-fun res!519549 () Bool)

(assert (=> b!768128 (=> (not res!519549) (not e!427739))))

(assert (=> b!768128 (= res!519549 (validKeyInArray!0 (select (arr!20252 a!3186) j!159)))))

(declare-fun b!768129 () Bool)

(assert (=> b!768129 (= e!427736 e!427743)))

(declare-fun res!519543 () Bool)

(assert (=> b!768129 (=> (not res!519543) (not e!427743))))

(assert (=> b!768129 (= res!519543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20252 a!3186) j!159) mask!3328) (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341707))))

(assert (=> b!768129 (= lt!341707 (Intermediate!7852 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!768130 () Bool)

(assert (=> b!768130 (= e!427735 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) lt!341704))))

(declare-fun b!768131 () Bool)

(declare-fun res!519547 () Bool)

(assert (=> b!768131 (=> (not res!519547) (not e!427739))))

(declare-fun arrayContainsKey!0 (array!42301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!768131 (= res!519547 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!768132 () Bool)

(declare-fun res!519556 () Bool)

(assert (=> b!768132 (=> (not res!519556) (not e!427743))))

(assert (=> b!768132 (= res!519556 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20252 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768133 () Bool)

(declare-fun res!519553 () Bool)

(assert (=> b!768133 (=> (not res!519553) (not e!427736))))

(assert (=> b!768133 (= res!519553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!768134 () Bool)

(assert (=> b!768134 (= e!427737 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20252 a!3186) j!159) a!3186 mask!3328) (Found!7852 j!159)))))

(declare-fun res!519559 () Bool)

(assert (=> start!66660 (=> (not res!519559) (not e!427739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66660 (= res!519559 (validMask!0 mask!3328))))

(assert (=> start!66660 e!427739))

(assert (=> start!66660 true))

(declare-fun array_inv!16048 (array!42301) Bool)

(assert (=> start!66660 (array_inv!16048 a!3186)))

(declare-fun b!768125 () Bool)

(declare-fun res!519552 () Bool)

(assert (=> b!768125 (=> (not res!519552) (not e!427743))))

(assert (=> b!768125 (= res!519552 e!427737)))

(declare-fun c!84679 () Bool)

(assert (=> b!768125 (= c!84679 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66660 res!519559) b!768118))

(assert (= (and b!768118 res!519550) b!768128))

(assert (= (and b!768128 res!519549) b!768116))

(assert (= (and b!768116 res!519545) b!768131))

(assert (= (and b!768131 res!519547) b!768123))

(assert (= (and b!768123 res!519554) b!768133))

(assert (= (and b!768133 res!519553) b!768124))

(assert (= (and b!768124 res!519544) b!768120))

(assert (= (and b!768120 res!519557) b!768129))

(assert (= (and b!768129 res!519543) b!768132))

(assert (= (and b!768132 res!519556) b!768125))

(assert (= (and b!768125 c!84679) b!768121))

(assert (= (and b!768125 (not c!84679)) b!768134))

(assert (= (and b!768125 res!519552) b!768122))

(assert (= (and b!768122 res!519546) b!768117))

(assert (= (and b!768117 res!519558) b!768127))

(assert (= (and b!768127 res!519555) b!768130))

(assert (= (and b!768117 (not res!519548)) b!768126))

(assert (= (and b!768126 (not res!519551)) b!768119))

(declare-fun m!713727 () Bool)

(assert (=> b!768126 m!713727))

(declare-fun m!713729 () Bool)

(assert (=> b!768123 m!713729))

(declare-fun m!713731 () Bool)

(assert (=> b!768130 m!713731))

(assert (=> b!768130 m!713731))

(declare-fun m!713733 () Bool)

(assert (=> b!768130 m!713733))

(assert (=> b!768134 m!713731))

(assert (=> b!768134 m!713731))

(declare-fun m!713735 () Bool)

(assert (=> b!768134 m!713735))

(declare-fun m!713737 () Bool)

(assert (=> b!768132 m!713737))

(declare-fun m!713739 () Bool)

(assert (=> b!768131 m!713739))

(assert (=> b!768121 m!713731))

(assert (=> b!768121 m!713731))

(declare-fun m!713741 () Bool)

(assert (=> b!768121 m!713741))

(declare-fun m!713743 () Bool)

(assert (=> b!768122 m!713743))

(declare-fun m!713745 () Bool)

(assert (=> b!768122 m!713745))

(declare-fun m!713747 () Bool)

(assert (=> b!768122 m!713747))

(assert (=> b!768122 m!713745))

(declare-fun m!713749 () Bool)

(assert (=> b!768122 m!713749))

(declare-fun m!713751 () Bool)

(assert (=> b!768122 m!713751))

(assert (=> b!768129 m!713731))

(assert (=> b!768129 m!713731))

(declare-fun m!713753 () Bool)

(assert (=> b!768129 m!713753))

(assert (=> b!768129 m!713753))

(assert (=> b!768129 m!713731))

(declare-fun m!713755 () Bool)

(assert (=> b!768129 m!713755))

(declare-fun m!713757 () Bool)

(assert (=> b!768124 m!713757))

(declare-fun m!713759 () Bool)

(assert (=> b!768116 m!713759))

(declare-fun m!713761 () Bool)

(assert (=> start!66660 m!713761))

(declare-fun m!713763 () Bool)

(assert (=> start!66660 m!713763))

(assert (=> b!768119 m!713731))

(assert (=> b!768119 m!713731))

(assert (=> b!768119 m!713735))

(declare-fun m!713765 () Bool)

(assert (=> b!768117 m!713765))

(declare-fun m!713767 () Bool)

(assert (=> b!768117 m!713767))

(assert (=> b!768128 m!713731))

(assert (=> b!768128 m!713731))

(declare-fun m!713769 () Bool)

(assert (=> b!768128 m!713769))

(assert (=> b!768127 m!713731))

(assert (=> b!768127 m!713731))

(declare-fun m!713771 () Bool)

(assert (=> b!768127 m!713771))

(declare-fun m!713773 () Bool)

(assert (=> b!768133 m!713773))

(push 1)

(assert (not b!768129))

