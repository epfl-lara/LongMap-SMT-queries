; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67328 () Bool)

(assert start!67328)

(declare-fun b!778602 () Bool)

(declare-fun e!433167 () Bool)

(declare-fun e!433162 () Bool)

(assert (=> b!778602 (= e!433167 (not e!433162))))

(declare-fun res!526773 () Bool)

(assert (=> b!778602 (=> res!526773 e!433162)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7978 0))(
  ( (MissingZero!7978 (index!34280 (_ BitVec 32))) (Found!7978 (index!34281 (_ BitVec 32))) (Intermediate!7978 (undefined!8790 Bool) (index!34282 (_ BitVec 32)) (x!65238 (_ BitVec 32))) (Undefined!7978) (MissingVacant!7978 (index!34283 (_ BitVec 32))) )
))
(declare-fun lt!346755 () SeekEntryResult!7978)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!778602 (= res!526773 (or (not ((_ is Intermediate!7978) lt!346755)) (bvslt x!1131 (x!65238 lt!346755)) (not (= x!1131 (x!65238 lt!346755))) (not (= index!1321 (index!34282 lt!346755)))))))

(declare-fun e!433166 () Bool)

(assert (=> b!778602 e!433166))

(declare-fun res!526767 () Bool)

(assert (=> b!778602 (=> (not res!526767) (not e!433166))))

(declare-datatypes ((array!42576 0))(
  ( (array!42577 (arr!20381 (Array (_ BitVec 32) (_ BitVec 64))) (size!20802 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42576)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42576 (_ BitVec 32)) Bool)

(assert (=> b!778602 (= res!526767 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26822 0))(
  ( (Unit!26823) )
))
(declare-fun lt!346757 () Unit!26822)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26822)

(assert (=> b!778602 (= lt!346757 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!433168 () Bool)

(declare-fun b!778603 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42576 (_ BitVec 32)) SeekEntryResult!7978)

(assert (=> b!778603 (= e!433168 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20381 a!3186) j!159) a!3186 mask!3328) (Found!7978 j!159)))))

(declare-fun b!778604 () Bool)

(assert (=> b!778604 (= e!433162 true)))

(declare-fun lt!346758 () SeekEntryResult!7978)

(assert (=> b!778604 (= lt!346758 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20381 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!778605 () Bool)

(declare-fun res!526768 () Bool)

(declare-fun e!433163 () Bool)

(assert (=> b!778605 (=> (not res!526768) (not e!433163))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!778605 (= res!526768 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20802 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20802 a!3186))))))

(declare-fun b!778606 () Bool)

(declare-fun res!526774 () Bool)

(assert (=> b!778606 (=> (not res!526774) (not e!433163))))

(declare-datatypes ((List!14422 0))(
  ( (Nil!14419) (Cons!14418 (h!15532 (_ BitVec 64)) (t!20728 List!14422)) )
))
(declare-fun arrayNoDuplicates!0 (array!42576 (_ BitVec 32) List!14422) Bool)

(assert (=> b!778606 (= res!526774 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14419))))

(declare-fun b!778607 () Bool)

(declare-fun e!433165 () Bool)

(assert (=> b!778607 (= e!433165 e!433167)))

(declare-fun res!526775 () Bool)

(assert (=> b!778607 (=> (not res!526775) (not e!433167))))

(declare-fun lt!346759 () SeekEntryResult!7978)

(assert (=> b!778607 (= res!526775 (= lt!346759 lt!346755))))

(declare-fun lt!346760 () (_ BitVec 64))

(declare-fun lt!346761 () array!42576)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42576 (_ BitVec 32)) SeekEntryResult!7978)

(assert (=> b!778607 (= lt!346755 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346760 lt!346761 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!778607 (= lt!346759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346760 mask!3328) lt!346760 lt!346761 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!778607 (= lt!346760 (select (store (arr!20381 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!778607 (= lt!346761 (array!42577 (store (arr!20381 a!3186) i!1173 k0!2102) (size!20802 a!3186)))))

(declare-fun b!778608 () Bool)

(declare-fun e!433160 () Bool)

(assert (=> b!778608 (= e!433160 e!433163)))

(declare-fun res!526776 () Bool)

(assert (=> b!778608 (=> (not res!526776) (not e!433163))))

(declare-fun lt!346756 () SeekEntryResult!7978)

(assert (=> b!778608 (= res!526776 (or (= lt!346756 (MissingZero!7978 i!1173)) (= lt!346756 (MissingVacant!7978 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42576 (_ BitVec 32)) SeekEntryResult!7978)

(assert (=> b!778608 (= lt!346756 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!526778 () Bool)

(assert (=> start!67328 (=> (not res!526778) (not e!433160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67328 (= res!526778 (validMask!0 mask!3328))))

(assert (=> start!67328 e!433160))

(assert (=> start!67328 true))

(declare-fun array_inv!16264 (array!42576) Bool)

(assert (=> start!67328 (array_inv!16264 a!3186)))

(declare-fun e!433161 () Bool)

(declare-fun lt!346763 () SeekEntryResult!7978)

(declare-fun b!778609 () Bool)

(assert (=> b!778609 (= e!433161 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20381 a!3186) j!159) a!3186 mask!3328) lt!346763))))

(declare-fun b!778610 () Bool)

(declare-fun res!526771 () Bool)

(assert (=> b!778610 (=> (not res!526771) (not e!433163))))

(assert (=> b!778610 (= res!526771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!778611 () Bool)

(declare-fun res!526764 () Bool)

(assert (=> b!778611 (=> (not res!526764) (not e!433160))))

(assert (=> b!778611 (= res!526764 (and (= (size!20802 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20802 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20802 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!778612 () Bool)

(declare-fun res!526777 () Bool)

(assert (=> b!778612 (=> (not res!526777) (not e!433165))))

(assert (=> b!778612 (= res!526777 e!433168)))

(declare-fun c!86322 () Bool)

(assert (=> b!778612 (= c!86322 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!778613 () Bool)

(declare-fun res!526765 () Bool)

(assert (=> b!778613 (=> (not res!526765) (not e!433165))))

(assert (=> b!778613 (= res!526765 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20381 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!778614 () Bool)

(declare-fun res!526766 () Bool)

(assert (=> b!778614 (=> (not res!526766) (not e!433160))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!778614 (= res!526766 (validKeyInArray!0 (select (arr!20381 a!3186) j!159)))))

(declare-fun b!778615 () Bool)

(declare-fun lt!346762 () SeekEntryResult!7978)

(assert (=> b!778615 (= e!433168 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20381 a!3186) j!159) a!3186 mask!3328) lt!346762))))

(declare-fun b!778616 () Bool)

(assert (=> b!778616 (= e!433166 e!433161)))

(declare-fun res!526770 () Bool)

(assert (=> b!778616 (=> (not res!526770) (not e!433161))))

(assert (=> b!778616 (= res!526770 (= (seekEntryOrOpen!0 (select (arr!20381 a!3186) j!159) a!3186 mask!3328) lt!346763))))

(assert (=> b!778616 (= lt!346763 (Found!7978 j!159))))

(declare-fun b!778617 () Bool)

(declare-fun res!526779 () Bool)

(assert (=> b!778617 (=> (not res!526779) (not e!433160))))

(assert (=> b!778617 (= res!526779 (validKeyInArray!0 k0!2102))))

(declare-fun b!778618 () Bool)

(assert (=> b!778618 (= e!433163 e!433165)))

(declare-fun res!526769 () Bool)

(assert (=> b!778618 (=> (not res!526769) (not e!433165))))

(assert (=> b!778618 (= res!526769 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20381 a!3186) j!159) mask!3328) (select (arr!20381 a!3186) j!159) a!3186 mask!3328) lt!346762))))

(assert (=> b!778618 (= lt!346762 (Intermediate!7978 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!778619 () Bool)

(declare-fun res!526772 () Bool)

(assert (=> b!778619 (=> (not res!526772) (not e!433160))))

(declare-fun arrayContainsKey!0 (array!42576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!778619 (= res!526772 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!67328 res!526778) b!778611))

(assert (= (and b!778611 res!526764) b!778614))

(assert (= (and b!778614 res!526766) b!778617))

(assert (= (and b!778617 res!526779) b!778619))

(assert (= (and b!778619 res!526772) b!778608))

(assert (= (and b!778608 res!526776) b!778610))

(assert (= (and b!778610 res!526771) b!778606))

(assert (= (and b!778606 res!526774) b!778605))

(assert (= (and b!778605 res!526768) b!778618))

(assert (= (and b!778618 res!526769) b!778613))

(assert (= (and b!778613 res!526765) b!778612))

(assert (= (and b!778612 c!86322) b!778615))

(assert (= (and b!778612 (not c!86322)) b!778603))

(assert (= (and b!778612 res!526777) b!778607))

(assert (= (and b!778607 res!526775) b!778602))

(assert (= (and b!778602 res!526767) b!778616))

(assert (= (and b!778616 res!526770) b!778609))

(assert (= (and b!778602 (not res!526773)) b!778604))

(declare-fun m!721683 () Bool)

(assert (=> b!778602 m!721683))

(declare-fun m!721685 () Bool)

(assert (=> b!778602 m!721685))

(declare-fun m!721687 () Bool)

(assert (=> b!778609 m!721687))

(assert (=> b!778609 m!721687))

(declare-fun m!721689 () Bool)

(assert (=> b!778609 m!721689))

(assert (=> b!778614 m!721687))

(assert (=> b!778614 m!721687))

(declare-fun m!721691 () Bool)

(assert (=> b!778614 m!721691))

(assert (=> b!778615 m!721687))

(assert (=> b!778615 m!721687))

(declare-fun m!721693 () Bool)

(assert (=> b!778615 m!721693))

(declare-fun m!721695 () Bool)

(assert (=> b!778607 m!721695))

(declare-fun m!721697 () Bool)

(assert (=> b!778607 m!721697))

(declare-fun m!721699 () Bool)

(assert (=> b!778607 m!721699))

(assert (=> b!778607 m!721695))

(declare-fun m!721701 () Bool)

(assert (=> b!778607 m!721701))

(declare-fun m!721703 () Bool)

(assert (=> b!778607 m!721703))

(assert (=> b!778604 m!721687))

(assert (=> b!778604 m!721687))

(declare-fun m!721705 () Bool)

(assert (=> b!778604 m!721705))

(assert (=> b!778603 m!721687))

(assert (=> b!778603 m!721687))

(assert (=> b!778603 m!721705))

(assert (=> b!778616 m!721687))

(assert (=> b!778616 m!721687))

(declare-fun m!721707 () Bool)

(assert (=> b!778616 m!721707))

(declare-fun m!721709 () Bool)

(assert (=> b!778613 m!721709))

(declare-fun m!721711 () Bool)

(assert (=> b!778617 m!721711))

(declare-fun m!721713 () Bool)

(assert (=> start!67328 m!721713))

(declare-fun m!721715 () Bool)

(assert (=> start!67328 m!721715))

(declare-fun m!721717 () Bool)

(assert (=> b!778610 m!721717))

(declare-fun m!721719 () Bool)

(assert (=> b!778608 m!721719))

(assert (=> b!778618 m!721687))

(assert (=> b!778618 m!721687))

(declare-fun m!721721 () Bool)

(assert (=> b!778618 m!721721))

(assert (=> b!778618 m!721721))

(assert (=> b!778618 m!721687))

(declare-fun m!721723 () Bool)

(assert (=> b!778618 m!721723))

(declare-fun m!721725 () Bool)

(assert (=> b!778606 m!721725))

(declare-fun m!721727 () Bool)

(assert (=> b!778619 m!721727))

(check-sat (not b!778614) (not b!778617) (not b!778607) (not b!778606) (not b!778610) (not b!778608) (not b!778604) (not b!778618) (not b!778619) (not b!778602) (not b!778609) (not b!778616) (not start!67328) (not b!778603) (not b!778615))
(check-sat)
