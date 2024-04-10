; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67174 () Bool)

(assert start!67174)

(declare-fun b!776704 () Bool)

(declare-fun e!432202 () Bool)

(declare-fun e!432201 () Bool)

(assert (=> b!776704 (= e!432202 (not e!432201))))

(declare-fun res!525484 () Bool)

(assert (=> b!776704 (=> res!525484 e!432201)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7960 0))(
  ( (MissingZero!7960 (index!34208 (_ BitVec 32))) (Found!7960 (index!34209 (_ BitVec 32))) (Intermediate!7960 (undefined!8772 Bool) (index!34210 (_ BitVec 32)) (x!65143 (_ BitVec 32))) (Undefined!7960) (MissingVacant!7960 (index!34211 (_ BitVec 32))) )
))
(declare-fun lt!346056 () SeekEntryResult!7960)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!776704 (= res!525484 (or (not (is-Intermediate!7960 lt!346056)) (bvslt x!1131 (x!65143 lt!346056)) (not (= x!1131 (x!65143 lt!346056))) (not (= index!1321 (index!34210 lt!346056)))))))

(declare-fun e!432205 () Bool)

(assert (=> b!776704 e!432205))

(declare-fun res!525480 () Bool)

(assert (=> b!776704 (=> (not res!525480) (not e!432205))))

(declare-datatypes ((array!42529 0))(
  ( (array!42530 (arr!20360 (Array (_ BitVec 32) (_ BitVec 64))) (size!20781 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42529)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42529 (_ BitVec 32)) Bool)

(assert (=> b!776704 (= res!525480 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26814 0))(
  ( (Unit!26815) )
))
(declare-fun lt!346054 () Unit!26814)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26814)

(assert (=> b!776704 (= lt!346054 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776706 () Bool)

(declare-fun res!525489 () Bool)

(declare-fun e!432199 () Bool)

(assert (=> b!776706 (=> (not res!525489) (not e!432199))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776706 (= res!525489 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20781 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20781 a!3186))))))

(declare-fun b!776707 () Bool)

(declare-fun res!525478 () Bool)

(declare-fun e!432200 () Bool)

(assert (=> b!776707 (=> (not res!525478) (not e!432200))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776707 (= res!525478 (and (= (size!20781 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20781 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20781 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776708 () Bool)

(declare-fun res!525490 () Bool)

(declare-fun e!432204 () Bool)

(assert (=> b!776708 (=> (not res!525490) (not e!432204))))

(assert (=> b!776708 (= res!525490 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20360 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776709 () Bool)

(assert (=> b!776709 (= e!432200 e!432199)))

(declare-fun res!525486 () Bool)

(assert (=> b!776709 (=> (not res!525486) (not e!432199))))

(declare-fun lt!346061 () SeekEntryResult!7960)

(assert (=> b!776709 (= res!525486 (or (= lt!346061 (MissingZero!7960 i!1173)) (= lt!346061 (MissingVacant!7960 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42529 (_ BitVec 32)) SeekEntryResult!7960)

(assert (=> b!776709 (= lt!346061 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!776710 () Bool)

(declare-fun res!525479 () Bool)

(assert (=> b!776710 (=> (not res!525479) (not e!432200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776710 (= res!525479 (validKeyInArray!0 (select (arr!20360 a!3186) j!159)))))

(declare-fun b!776711 () Bool)

(declare-fun res!525477 () Bool)

(assert (=> b!776711 (=> (not res!525477) (not e!432200))))

(assert (=> b!776711 (= res!525477 (validKeyInArray!0 k!2102))))

(declare-fun e!432203 () Bool)

(declare-fun lt!346060 () SeekEntryResult!7960)

(declare-fun b!776712 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42529 (_ BitVec 32)) SeekEntryResult!7960)

(assert (=> b!776712 (= e!432203 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20360 a!3186) j!159) a!3186 mask!3328) lt!346060))))

(declare-fun b!776713 () Bool)

(declare-fun res!525487 () Bool)

(assert (=> b!776713 (=> (not res!525487) (not e!432204))))

(assert (=> b!776713 (= res!525487 e!432203)))

(declare-fun c!86014 () Bool)

(assert (=> b!776713 (= c!86014 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776714 () Bool)

(assert (=> b!776714 (= e!432201 true)))

(declare-fun lt!346057 () SeekEntryResult!7960)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42529 (_ BitVec 32)) SeekEntryResult!7960)

(assert (=> b!776714 (= lt!346057 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20360 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776715 () Bool)

(assert (=> b!776715 (= e!432204 e!432202)))

(declare-fun res!525491 () Bool)

(assert (=> b!776715 (=> (not res!525491) (not e!432202))))

(declare-fun lt!346053 () SeekEntryResult!7960)

(assert (=> b!776715 (= res!525491 (= lt!346053 lt!346056))))

(declare-fun lt!346058 () array!42529)

(declare-fun lt!346059 () (_ BitVec 64))

(assert (=> b!776715 (= lt!346056 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346059 lt!346058 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776715 (= lt!346053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346059 mask!3328) lt!346059 lt!346058 mask!3328))))

(assert (=> b!776715 (= lt!346059 (select (store (arr!20360 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!776715 (= lt!346058 (array!42530 (store (arr!20360 a!3186) i!1173 k!2102) (size!20781 a!3186)))))

(declare-fun lt!346055 () SeekEntryResult!7960)

(declare-fun e!432198 () Bool)

(declare-fun b!776716 () Bool)

(assert (=> b!776716 (= e!432198 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20360 a!3186) j!159) a!3186 mask!3328) lt!346055))))

(declare-fun b!776717 () Bool)

(assert (=> b!776717 (= e!432203 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20360 a!3186) j!159) a!3186 mask!3328) (Found!7960 j!159)))))

(declare-fun res!525488 () Bool)

(assert (=> start!67174 (=> (not res!525488) (not e!432200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67174 (= res!525488 (validMask!0 mask!3328))))

(assert (=> start!67174 e!432200))

(assert (=> start!67174 true))

(declare-fun array_inv!16156 (array!42529) Bool)

(assert (=> start!67174 (array_inv!16156 a!3186)))

(declare-fun b!776705 () Bool)

(declare-fun res!525485 () Bool)

(assert (=> b!776705 (=> (not res!525485) (not e!432199))))

(assert (=> b!776705 (= res!525485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776718 () Bool)

(declare-fun res!525482 () Bool)

(assert (=> b!776718 (=> (not res!525482) (not e!432200))))

(declare-fun arrayContainsKey!0 (array!42529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776718 (= res!525482 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776719 () Bool)

(declare-fun res!525481 () Bool)

(assert (=> b!776719 (=> (not res!525481) (not e!432199))))

(declare-datatypes ((List!14362 0))(
  ( (Nil!14359) (Cons!14358 (h!15466 (_ BitVec 64)) (t!20677 List!14362)) )
))
(declare-fun arrayNoDuplicates!0 (array!42529 (_ BitVec 32) List!14362) Bool)

(assert (=> b!776719 (= res!525481 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14359))))

(declare-fun b!776720 () Bool)

(assert (=> b!776720 (= e!432199 e!432204)))

(declare-fun res!525483 () Bool)

(assert (=> b!776720 (=> (not res!525483) (not e!432204))))

(assert (=> b!776720 (= res!525483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20360 a!3186) j!159) mask!3328) (select (arr!20360 a!3186) j!159) a!3186 mask!3328) lt!346060))))

(assert (=> b!776720 (= lt!346060 (Intermediate!7960 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776721 () Bool)

(assert (=> b!776721 (= e!432205 e!432198)))

(declare-fun res!525476 () Bool)

(assert (=> b!776721 (=> (not res!525476) (not e!432198))))

(assert (=> b!776721 (= res!525476 (= (seekEntryOrOpen!0 (select (arr!20360 a!3186) j!159) a!3186 mask!3328) lt!346055))))

(assert (=> b!776721 (= lt!346055 (Found!7960 j!159))))

(assert (= (and start!67174 res!525488) b!776707))

(assert (= (and b!776707 res!525478) b!776710))

(assert (= (and b!776710 res!525479) b!776711))

(assert (= (and b!776711 res!525477) b!776718))

(assert (= (and b!776718 res!525482) b!776709))

(assert (= (and b!776709 res!525486) b!776705))

(assert (= (and b!776705 res!525485) b!776719))

(assert (= (and b!776719 res!525481) b!776706))

(assert (= (and b!776706 res!525489) b!776720))

(assert (= (and b!776720 res!525483) b!776708))

(assert (= (and b!776708 res!525490) b!776713))

(assert (= (and b!776713 c!86014) b!776712))

(assert (= (and b!776713 (not c!86014)) b!776717))

(assert (= (and b!776713 res!525487) b!776715))

(assert (= (and b!776715 res!525491) b!776704))

(assert (= (and b!776704 res!525480) b!776721))

(assert (= (and b!776721 res!525476) b!776716))

(assert (= (and b!776704 (not res!525484)) b!776714))

(declare-fun m!720745 () Bool)

(assert (=> b!776711 m!720745))

(declare-fun m!720747 () Bool)

(assert (=> b!776717 m!720747))

(assert (=> b!776717 m!720747))

(declare-fun m!720749 () Bool)

(assert (=> b!776717 m!720749))

(assert (=> b!776710 m!720747))

(assert (=> b!776710 m!720747))

(declare-fun m!720751 () Bool)

(assert (=> b!776710 m!720751))

(assert (=> b!776712 m!720747))

(assert (=> b!776712 m!720747))

(declare-fun m!720753 () Bool)

(assert (=> b!776712 m!720753))

(declare-fun m!720755 () Bool)

(assert (=> b!776719 m!720755))

(assert (=> b!776716 m!720747))

(assert (=> b!776716 m!720747))

(declare-fun m!720757 () Bool)

(assert (=> b!776716 m!720757))

(declare-fun m!720759 () Bool)

(assert (=> b!776708 m!720759))

(declare-fun m!720761 () Bool)

(assert (=> b!776718 m!720761))

(declare-fun m!720763 () Bool)

(assert (=> b!776704 m!720763))

(declare-fun m!720765 () Bool)

(assert (=> b!776704 m!720765))

(declare-fun m!720767 () Bool)

(assert (=> b!776709 m!720767))

(assert (=> b!776720 m!720747))

(assert (=> b!776720 m!720747))

(declare-fun m!720769 () Bool)

(assert (=> b!776720 m!720769))

(assert (=> b!776720 m!720769))

(assert (=> b!776720 m!720747))

(declare-fun m!720771 () Bool)

(assert (=> b!776720 m!720771))

(declare-fun m!720773 () Bool)

(assert (=> b!776705 m!720773))

(declare-fun m!720775 () Bool)

(assert (=> b!776715 m!720775))

(declare-fun m!720777 () Bool)

(assert (=> b!776715 m!720777))

(declare-fun m!720779 () Bool)

(assert (=> b!776715 m!720779))

(assert (=> b!776715 m!720775))

(declare-fun m!720781 () Bool)

(assert (=> b!776715 m!720781))

(declare-fun m!720783 () Bool)

(assert (=> b!776715 m!720783))

(assert (=> b!776714 m!720747))

(assert (=> b!776714 m!720747))

(assert (=> b!776714 m!720749))

(assert (=> b!776721 m!720747))

(assert (=> b!776721 m!720747))

(declare-fun m!720785 () Bool)

(assert (=> b!776721 m!720785))

(declare-fun m!720787 () Bool)

(assert (=> start!67174 m!720787))

(declare-fun m!720789 () Bool)

(assert (=> start!67174 m!720789))

(push 1)

(assert (not b!776704))

(assert (not start!67174))

(assert (not b!776720))

(assert (not b!776715))

(assert (not b!776705))

(assert (not b!776716))

(assert (not b!776719))

(assert (not b!776721))

(assert (not b!776709))

(assert (not b!776711))

(assert (not b!776718))

(assert (not b!776717))

(assert (not b!776714))

(assert (not b!776712))

(assert (not b!776710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

