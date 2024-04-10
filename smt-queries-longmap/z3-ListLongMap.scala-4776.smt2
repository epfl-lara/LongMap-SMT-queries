; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65718 () Bool)

(assert start!65718)

(declare-fun b!754184 () Bool)

(declare-fun e!420625 () Bool)

(declare-fun e!420624 () Bool)

(assert (=> b!754184 (= e!420625 (not e!420624))))

(declare-fun res!509583 () Bool)

(assert (=> b!754184 (=> res!509583 e!420624)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7659 0))(
  ( (MissingZero!7659 (index!33004 (_ BitVec 32))) (Found!7659 (index!33005 (_ BitVec 32))) (Intermediate!7659 (undefined!8471 Bool) (index!33006 (_ BitVec 32)) (x!63913 (_ BitVec 32))) (Undefined!7659) (MissingVacant!7659 (index!33007 (_ BitVec 32))) )
))
(declare-fun lt!335618 () SeekEntryResult!7659)

(get-info :version)

(assert (=> b!754184 (= res!509583 (or (not ((_ is Intermediate!7659) lt!335618)) (bvslt x!1131 (x!63913 lt!335618)) (not (= x!1131 (x!63913 lt!335618))) (not (= index!1321 (index!33006 lt!335618)))))))

(declare-fun e!420623 () Bool)

(assert (=> b!754184 e!420623))

(declare-fun res!509591 () Bool)

(assert (=> b!754184 (=> (not res!509591) (not e!420623))))

(declare-fun lt!335614 () SeekEntryResult!7659)

(declare-fun lt!335612 () SeekEntryResult!7659)

(assert (=> b!754184 (= res!509591 (= lt!335614 lt!335612))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!754184 (= lt!335612 (Found!7659 j!159))))

(declare-datatypes ((array!41891 0))(
  ( (array!41892 (arr!20059 (Array (_ BitVec 32) (_ BitVec 64))) (size!20480 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41891)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41891 (_ BitVec 32)) SeekEntryResult!7659)

(assert (=> b!754184 (= lt!335614 (seekEntryOrOpen!0 (select (arr!20059 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41891 (_ BitVec 32)) Bool)

(assert (=> b!754184 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26016 0))(
  ( (Unit!26017) )
))
(declare-fun lt!335616 () Unit!26016)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41891 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26016)

(assert (=> b!754184 (= lt!335616 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!754185 () Bool)

(declare-fun res!509589 () Bool)

(declare-fun e!420618 () Bool)

(assert (=> b!754185 (=> (not res!509589) (not e!420618))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754185 (= res!509589 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754186 () Bool)

(declare-fun e!420629 () Unit!26016)

(declare-fun Unit!26018 () Unit!26016)

(assert (=> b!754186 (= e!420629 Unit!26018)))

(assert (=> b!754186 false))

(declare-fun b!754187 () Bool)

(declare-fun Unit!26019 () Unit!26016)

(assert (=> b!754187 (= e!420629 Unit!26019)))

(declare-fun b!754188 () Bool)

(declare-fun res!509582 () Bool)

(declare-fun e!420619 () Bool)

(assert (=> b!754188 (=> (not res!509582) (not e!420619))))

(declare-datatypes ((List!14061 0))(
  ( (Nil!14058) (Cons!14057 (h!15129 (_ BitVec 64)) (t!20376 List!14061)) )
))
(declare-fun arrayNoDuplicates!0 (array!41891 (_ BitVec 32) List!14061) Bool)

(assert (=> b!754188 (= res!509582 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14058))))

(declare-fun b!754189 () Bool)

(declare-fun e!420620 () Bool)

(assert (=> b!754189 (= e!420619 e!420620)))

(declare-fun res!509597 () Bool)

(assert (=> b!754189 (=> (not res!509597) (not e!420620))))

(declare-fun lt!335615 () SeekEntryResult!7659)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41891 (_ BitVec 32)) SeekEntryResult!7659)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754189 (= res!509597 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20059 a!3186) j!159) mask!3328) (select (arr!20059 a!3186) j!159) a!3186 mask!3328) lt!335615))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754189 (= lt!335615 (Intermediate!7659 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754190 () Bool)

(declare-fun res!509590 () Bool)

(assert (=> b!754190 (=> (not res!509590) (not e!420618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754190 (= res!509590 (validKeyInArray!0 (select (arr!20059 a!3186) j!159)))))

(declare-fun b!754191 () Bool)

(declare-fun e!420628 () Bool)

(declare-fun e!420621 () Bool)

(assert (=> b!754191 (= e!420628 e!420621)))

(declare-fun res!509584 () Bool)

(assert (=> b!754191 (=> res!509584 e!420621)))

(declare-fun lt!335617 () (_ BitVec 64))

(declare-fun lt!335621 () (_ BitVec 64))

(assert (=> b!754191 (= res!509584 (= lt!335617 lt!335621))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754191 (= lt!335617 (select (store (arr!20059 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!754192 () Bool)

(assert (=> b!754192 (= e!420620 e!420625)))

(declare-fun res!509596 () Bool)

(assert (=> b!754192 (=> (not res!509596) (not e!420625))))

(declare-fun lt!335619 () SeekEntryResult!7659)

(assert (=> b!754192 (= res!509596 (= lt!335619 lt!335618))))

(declare-fun lt!335610 () array!41891)

(assert (=> b!754192 (= lt!335618 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335621 lt!335610 mask!3328))))

(assert (=> b!754192 (= lt!335619 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335621 mask!3328) lt!335621 lt!335610 mask!3328))))

(assert (=> b!754192 (= lt!335621 (select (store (arr!20059 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!754192 (= lt!335610 (array!41892 (store (arr!20059 a!3186) i!1173 k0!2102) (size!20480 a!3186)))))

(declare-fun b!754193 () Bool)

(assert (=> b!754193 (= e!420621 true)))

(declare-fun e!420627 () Bool)

(assert (=> b!754193 e!420627))

(declare-fun res!509581 () Bool)

(assert (=> b!754193 (=> (not res!509581) (not e!420627))))

(assert (=> b!754193 (= res!509581 (= lt!335617 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335611 () Unit!26016)

(assert (=> b!754193 (= lt!335611 e!420629)))

(declare-fun c!82683 () Bool)

(assert (=> b!754193 (= c!82683 (= lt!335617 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!509586 () Bool)

(assert (=> start!65718 (=> (not res!509586) (not e!420618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65718 (= res!509586 (validMask!0 mask!3328))))

(assert (=> start!65718 e!420618))

(assert (=> start!65718 true))

(declare-fun array_inv!15855 (array!41891) Bool)

(assert (=> start!65718 (array_inv!15855 a!3186)))

(declare-fun b!754194 () Bool)

(declare-fun e!420626 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41891 (_ BitVec 32)) SeekEntryResult!7659)

(assert (=> b!754194 (= e!420626 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20059 a!3186) j!159) a!3186 mask!3328) (Found!7659 j!159)))))

(declare-fun b!754195 () Bool)

(declare-fun res!509579 () Bool)

(assert (=> b!754195 (=> (not res!509579) (not e!420619))))

(assert (=> b!754195 (= res!509579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754196 () Bool)

(declare-fun res!509587 () Bool)

(assert (=> b!754196 (=> (not res!509587) (not e!420620))))

(assert (=> b!754196 (= res!509587 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20059 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754197 () Bool)

(declare-fun res!509592 () Bool)

(assert (=> b!754197 (=> (not res!509592) (not e!420627))))

(assert (=> b!754197 (= res!509592 (= (seekEntryOrOpen!0 lt!335621 lt!335610 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335621 lt!335610 mask!3328)))))

(declare-fun b!754198 () Bool)

(declare-fun res!509585 () Bool)

(assert (=> b!754198 (=> (not res!509585) (not e!420618))))

(assert (=> b!754198 (= res!509585 (validKeyInArray!0 k0!2102))))

(declare-fun b!754199 () Bool)

(declare-fun res!509588 () Bool)

(assert (=> b!754199 (=> (not res!509588) (not e!420618))))

(assert (=> b!754199 (= res!509588 (and (= (size!20480 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20480 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20480 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!754200 () Bool)

(assert (=> b!754200 (= e!420618 e!420619)))

(declare-fun res!509595 () Bool)

(assert (=> b!754200 (=> (not res!509595) (not e!420619))))

(declare-fun lt!335620 () SeekEntryResult!7659)

(assert (=> b!754200 (= res!509595 (or (= lt!335620 (MissingZero!7659 i!1173)) (= lt!335620 (MissingVacant!7659 i!1173))))))

(assert (=> b!754200 (= lt!335620 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!754201 () Bool)

(declare-fun lt!335613 () SeekEntryResult!7659)

(assert (=> b!754201 (= e!420627 (= lt!335614 lt!335613))))

(declare-fun b!754202 () Bool)

(declare-fun res!509594 () Bool)

(assert (=> b!754202 (=> (not res!509594) (not e!420619))))

(assert (=> b!754202 (= res!509594 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20480 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20480 a!3186))))))

(declare-fun b!754203 () Bool)

(assert (=> b!754203 (= e!420623 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20059 a!3186) j!159) a!3186 mask!3328) lt!335612))))

(declare-fun b!754204 () Bool)

(assert (=> b!754204 (= e!420624 e!420628)))

(declare-fun res!509593 () Bool)

(assert (=> b!754204 (=> res!509593 e!420628)))

(assert (=> b!754204 (= res!509593 (not (= lt!335613 lt!335612)))))

(assert (=> b!754204 (= lt!335613 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20059 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754205 () Bool)

(declare-fun res!509580 () Bool)

(assert (=> b!754205 (=> (not res!509580) (not e!420620))))

(assert (=> b!754205 (= res!509580 e!420626)))

(declare-fun c!82684 () Bool)

(assert (=> b!754205 (= c!82684 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754206 () Bool)

(assert (=> b!754206 (= e!420626 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20059 a!3186) j!159) a!3186 mask!3328) lt!335615))))

(assert (= (and start!65718 res!509586) b!754199))

(assert (= (and b!754199 res!509588) b!754190))

(assert (= (and b!754190 res!509590) b!754198))

(assert (= (and b!754198 res!509585) b!754185))

(assert (= (and b!754185 res!509589) b!754200))

(assert (= (and b!754200 res!509595) b!754195))

(assert (= (and b!754195 res!509579) b!754188))

(assert (= (and b!754188 res!509582) b!754202))

(assert (= (and b!754202 res!509594) b!754189))

(assert (= (and b!754189 res!509597) b!754196))

(assert (= (and b!754196 res!509587) b!754205))

(assert (= (and b!754205 c!82684) b!754206))

(assert (= (and b!754205 (not c!82684)) b!754194))

(assert (= (and b!754205 res!509580) b!754192))

(assert (= (and b!754192 res!509596) b!754184))

(assert (= (and b!754184 res!509591) b!754203))

(assert (= (and b!754184 (not res!509583)) b!754204))

(assert (= (and b!754204 (not res!509593)) b!754191))

(assert (= (and b!754191 (not res!509584)) b!754193))

(assert (= (and b!754193 c!82683) b!754186))

(assert (= (and b!754193 (not c!82683)) b!754187))

(assert (= (and b!754193 res!509581) b!754197))

(assert (= (and b!754197 res!509592) b!754201))

(declare-fun m!702695 () Bool)

(assert (=> b!754195 m!702695))

(declare-fun m!702697 () Bool)

(assert (=> start!65718 m!702697))

(declare-fun m!702699 () Bool)

(assert (=> start!65718 m!702699))

(declare-fun m!702701 () Bool)

(assert (=> b!754197 m!702701))

(declare-fun m!702703 () Bool)

(assert (=> b!754197 m!702703))

(declare-fun m!702705 () Bool)

(assert (=> b!754184 m!702705))

(assert (=> b!754184 m!702705))

(declare-fun m!702707 () Bool)

(assert (=> b!754184 m!702707))

(declare-fun m!702709 () Bool)

(assert (=> b!754184 m!702709))

(declare-fun m!702711 () Bool)

(assert (=> b!754184 m!702711))

(assert (=> b!754189 m!702705))

(assert (=> b!754189 m!702705))

(declare-fun m!702713 () Bool)

(assert (=> b!754189 m!702713))

(assert (=> b!754189 m!702713))

(assert (=> b!754189 m!702705))

(declare-fun m!702715 () Bool)

(assert (=> b!754189 m!702715))

(assert (=> b!754206 m!702705))

(assert (=> b!754206 m!702705))

(declare-fun m!702717 () Bool)

(assert (=> b!754206 m!702717))

(declare-fun m!702719 () Bool)

(assert (=> b!754191 m!702719))

(declare-fun m!702721 () Bool)

(assert (=> b!754191 m!702721))

(assert (=> b!754194 m!702705))

(assert (=> b!754194 m!702705))

(declare-fun m!702723 () Bool)

(assert (=> b!754194 m!702723))

(declare-fun m!702725 () Bool)

(assert (=> b!754188 m!702725))

(assert (=> b!754204 m!702705))

(assert (=> b!754204 m!702705))

(assert (=> b!754204 m!702723))

(assert (=> b!754190 m!702705))

(assert (=> b!754190 m!702705))

(declare-fun m!702727 () Bool)

(assert (=> b!754190 m!702727))

(declare-fun m!702729 () Bool)

(assert (=> b!754200 m!702729))

(declare-fun m!702731 () Bool)

(assert (=> b!754196 m!702731))

(declare-fun m!702733 () Bool)

(assert (=> b!754185 m!702733))

(declare-fun m!702735 () Bool)

(assert (=> b!754198 m!702735))

(declare-fun m!702737 () Bool)

(assert (=> b!754192 m!702737))

(declare-fun m!702739 () Bool)

(assert (=> b!754192 m!702739))

(assert (=> b!754192 m!702737))

(declare-fun m!702741 () Bool)

(assert (=> b!754192 m!702741))

(declare-fun m!702743 () Bool)

(assert (=> b!754192 m!702743))

(assert (=> b!754192 m!702719))

(assert (=> b!754203 m!702705))

(assert (=> b!754203 m!702705))

(declare-fun m!702745 () Bool)

(assert (=> b!754203 m!702745))

(check-sat (not b!754190) (not b!754188) (not b!754200) (not b!754189) (not b!754195) (not b!754197) (not b!754184) (not start!65718) (not b!754204) (not b!754198) (not b!754194) (not b!754203) (not b!754185) (not b!754192) (not b!754206))
(check-sat)
