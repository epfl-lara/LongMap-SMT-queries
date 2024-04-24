; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64560 () Bool)

(assert start!64560)

(declare-fun b!726102 () Bool)

(declare-fun res!487020 () Bool)

(declare-fun e!406636 () Bool)

(assert (=> b!726102 (=> (not res!487020) (not e!406636))))

(declare-datatypes ((array!41011 0))(
  ( (array!41012 (arr!19624 (Array (_ BitVec 32) (_ BitVec 64))) (size!20044 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41011)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726102 (= res!487020 (validKeyInArray!0 (select (arr!19624 a!3186) j!159)))))

(declare-fun b!726103 () Bool)

(declare-fun e!406640 () Bool)

(declare-fun e!406639 () Bool)

(assert (=> b!726103 (= e!406640 e!406639)))

(declare-fun res!487022 () Bool)

(assert (=> b!726103 (=> (not res!487022) (not e!406639))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321596 () (_ BitVec 64))

(declare-fun lt!321595 () array!41011)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7180 0))(
  ( (MissingZero!7180 (index!31088 (_ BitVec 32))) (Found!7180 (index!31089 (_ BitVec 32))) (Intermediate!7180 (undefined!7992 Bool) (index!31090 (_ BitVec 32)) (x!62233 (_ BitVec 32))) (Undefined!7180) (MissingVacant!7180 (index!31091 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41011 (_ BitVec 32)) SeekEntryResult!7180)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726103 (= res!487022 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321596 mask!3328) lt!321596 lt!321595 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321596 lt!321595 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!726103 (= lt!321596 (select (store (arr!19624 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726103 (= lt!321595 (array!41012 (store (arr!19624 a!3186) i!1173 k0!2102) (size!20044 a!3186)))))

(declare-fun b!726104 () Bool)

(declare-fun res!487013 () Bool)

(declare-fun e!406635 () Bool)

(assert (=> b!726104 (=> (not res!487013) (not e!406635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41011 (_ BitVec 32)) Bool)

(assert (=> b!726104 (= res!487013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726105 () Bool)

(assert (=> b!726105 (= e!406635 e!406640)))

(declare-fun res!487015 () Bool)

(assert (=> b!726105 (=> (not res!487015) (not e!406640))))

(declare-fun lt!321592 () SeekEntryResult!7180)

(assert (=> b!726105 (= res!487015 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19624 a!3186) j!159) mask!3328) (select (arr!19624 a!3186) j!159) a!3186 mask!3328) lt!321592))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726105 (= lt!321592 (Intermediate!7180 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726106 () Bool)

(declare-fun res!487014 () Bool)

(assert (=> b!726106 (=> (not res!487014) (not e!406635))))

(assert (=> b!726106 (= res!487014 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20044 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20044 a!3186))))))

(declare-fun b!726107 () Bool)

(declare-fun res!487025 () Bool)

(assert (=> b!726107 (=> (not res!487025) (not e!406636))))

(assert (=> b!726107 (= res!487025 (validKeyInArray!0 k0!2102))))

(declare-fun b!726108 () Bool)

(declare-fun e!406634 () Bool)

(declare-fun e!406638 () Bool)

(assert (=> b!726108 (= e!406634 e!406638)))

(declare-fun res!487018 () Bool)

(assert (=> b!726108 (=> (not res!487018) (not e!406638))))

(declare-fun lt!321593 () SeekEntryResult!7180)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41011 (_ BitVec 32)) SeekEntryResult!7180)

(assert (=> b!726108 (= res!487018 (= (seekEntryOrOpen!0 (select (arr!19624 a!3186) j!159) a!3186 mask!3328) lt!321593))))

(assert (=> b!726108 (= lt!321593 (Found!7180 j!159))))

(declare-fun b!726109 () Bool)

(declare-fun res!487024 () Bool)

(assert (=> b!726109 (=> (not res!487024) (not e!406640))))

(assert (=> b!726109 (= res!487024 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19624 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726110 () Bool)

(declare-fun res!487026 () Bool)

(assert (=> b!726110 (=> (not res!487026) (not e!406636))))

(assert (=> b!726110 (= res!487026 (and (= (size!20044 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20044 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20044 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726111 () Bool)

(assert (=> b!726111 (= e!406639 (not true))))

(assert (=> b!726111 e!406634))

(declare-fun res!487017 () Bool)

(assert (=> b!726111 (=> (not res!487017) (not e!406634))))

(assert (=> b!726111 (= res!487017 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24757 0))(
  ( (Unit!24758) )
))
(declare-fun lt!321594 () Unit!24757)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41011 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24757)

(assert (=> b!726111 (= lt!321594 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!487016 () Bool)

(assert (=> start!64560 (=> (not res!487016) (not e!406636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64560 (= res!487016 (validMask!0 mask!3328))))

(assert (=> start!64560 e!406636))

(assert (=> start!64560 true))

(declare-fun array_inv!15483 (array!41011) Bool)

(assert (=> start!64560 (array_inv!15483 a!3186)))

(declare-fun b!726112 () Bool)

(assert (=> b!726112 (= e!406636 e!406635)))

(declare-fun res!487021 () Bool)

(assert (=> b!726112 (=> (not res!487021) (not e!406635))))

(declare-fun lt!321597 () SeekEntryResult!7180)

(assert (=> b!726112 (= res!487021 (or (= lt!321597 (MissingZero!7180 i!1173)) (= lt!321597 (MissingVacant!7180 i!1173))))))

(assert (=> b!726112 (= lt!321597 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!726113 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41011 (_ BitVec 32)) SeekEntryResult!7180)

(assert (=> b!726113 (= e!406638 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19624 a!3186) j!159) a!3186 mask!3328) lt!321593))))

(declare-fun b!726114 () Bool)

(declare-fun res!487023 () Bool)

(assert (=> b!726114 (=> (not res!487023) (not e!406636))))

(declare-fun arrayContainsKey!0 (array!41011 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726114 (= res!487023 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726115 () Bool)

(declare-fun e!406637 () Bool)

(assert (=> b!726115 (= e!406637 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19624 a!3186) j!159) a!3186 mask!3328) lt!321592))))

(declare-fun b!726116 () Bool)

(declare-fun res!487027 () Bool)

(assert (=> b!726116 (=> (not res!487027) (not e!406640))))

(assert (=> b!726116 (= res!487027 e!406637)))

(declare-fun c!79919 () Bool)

(assert (=> b!726116 (= c!79919 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726117 () Bool)

(declare-fun res!487019 () Bool)

(assert (=> b!726117 (=> (not res!487019) (not e!406635))))

(declare-datatypes ((List!13533 0))(
  ( (Nil!13530) (Cons!13529 (h!14589 (_ BitVec 64)) (t!19840 List!13533)) )
))
(declare-fun arrayNoDuplicates!0 (array!41011 (_ BitVec 32) List!13533) Bool)

(assert (=> b!726117 (= res!487019 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13530))))

(declare-fun b!726118 () Bool)

(assert (=> b!726118 (= e!406637 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19624 a!3186) j!159) a!3186 mask!3328) (Found!7180 j!159)))))

(assert (= (and start!64560 res!487016) b!726110))

(assert (= (and b!726110 res!487026) b!726102))

(assert (= (and b!726102 res!487020) b!726107))

(assert (= (and b!726107 res!487025) b!726114))

(assert (= (and b!726114 res!487023) b!726112))

(assert (= (and b!726112 res!487021) b!726104))

(assert (= (and b!726104 res!487013) b!726117))

(assert (= (and b!726117 res!487019) b!726106))

(assert (= (and b!726106 res!487014) b!726105))

(assert (= (and b!726105 res!487015) b!726109))

(assert (= (and b!726109 res!487024) b!726116))

(assert (= (and b!726116 c!79919) b!726115))

(assert (= (and b!726116 (not c!79919)) b!726118))

(assert (= (and b!726116 res!487027) b!726103))

(assert (= (and b!726103 res!487022) b!726111))

(assert (= (and b!726111 res!487017) b!726108))

(assert (= (and b!726108 res!487018) b!726113))

(declare-fun m!680751 () Bool)

(assert (=> b!726105 m!680751))

(assert (=> b!726105 m!680751))

(declare-fun m!680753 () Bool)

(assert (=> b!726105 m!680753))

(assert (=> b!726105 m!680753))

(assert (=> b!726105 m!680751))

(declare-fun m!680755 () Bool)

(assert (=> b!726105 m!680755))

(assert (=> b!726102 m!680751))

(assert (=> b!726102 m!680751))

(declare-fun m!680757 () Bool)

(assert (=> b!726102 m!680757))

(declare-fun m!680759 () Bool)

(assert (=> b!726111 m!680759))

(declare-fun m!680761 () Bool)

(assert (=> b!726111 m!680761))

(assert (=> b!726115 m!680751))

(assert (=> b!726115 m!680751))

(declare-fun m!680763 () Bool)

(assert (=> b!726115 m!680763))

(declare-fun m!680765 () Bool)

(assert (=> b!726112 m!680765))

(declare-fun m!680767 () Bool)

(assert (=> b!726117 m!680767))

(declare-fun m!680769 () Bool)

(assert (=> b!726107 m!680769))

(assert (=> b!726113 m!680751))

(assert (=> b!726113 m!680751))

(declare-fun m!680771 () Bool)

(assert (=> b!726113 m!680771))

(declare-fun m!680773 () Bool)

(assert (=> b!726103 m!680773))

(declare-fun m!680775 () Bool)

(assert (=> b!726103 m!680775))

(declare-fun m!680777 () Bool)

(assert (=> b!726103 m!680777))

(declare-fun m!680779 () Bool)

(assert (=> b!726103 m!680779))

(assert (=> b!726103 m!680773))

(declare-fun m!680781 () Bool)

(assert (=> b!726103 m!680781))

(assert (=> b!726118 m!680751))

(assert (=> b!726118 m!680751))

(declare-fun m!680783 () Bool)

(assert (=> b!726118 m!680783))

(declare-fun m!680785 () Bool)

(assert (=> start!64560 m!680785))

(declare-fun m!680787 () Bool)

(assert (=> start!64560 m!680787))

(declare-fun m!680789 () Bool)

(assert (=> b!726109 m!680789))

(declare-fun m!680791 () Bool)

(assert (=> b!726114 m!680791))

(declare-fun m!680793 () Bool)

(assert (=> b!726104 m!680793))

(assert (=> b!726108 m!680751))

(assert (=> b!726108 m!680751))

(declare-fun m!680795 () Bool)

(assert (=> b!726108 m!680795))

(check-sat (not b!726118) (not start!64560) (not b!726102) (not b!726103) (not b!726117) (not b!726114) (not b!726115) (not b!726111) (not b!726105) (not b!726112) (not b!726108) (not b!726104) (not b!726107) (not b!726113))
(check-sat)
