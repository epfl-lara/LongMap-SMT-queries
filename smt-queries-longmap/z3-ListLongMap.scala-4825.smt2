; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66270 () Bool)

(assert start!66270)

(declare-fun b!763763 () Bool)

(declare-fun res!516797 () Bool)

(declare-fun e!425428 () Bool)

(assert (=> b!763763 (=> (not res!516797) (not e!425428))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42192 0))(
  ( (array!42193 (arr!20204 (Array (_ BitVec 32) (_ BitVec 64))) (size!20625 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42192)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763763 (= res!516797 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20625 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20625 a!3186))))))

(declare-fun b!763764 () Bool)

(declare-fun res!516799 () Bool)

(declare-fun e!425431 () Bool)

(assert (=> b!763764 (=> (not res!516799) (not e!425431))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42192 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763764 (= res!516799 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763765 () Bool)

(declare-fun e!425427 () Bool)

(assert (=> b!763765 (= e!425428 e!425427)))

(declare-fun res!516794 () Bool)

(assert (=> b!763765 (=> (not res!516794) (not e!425427))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7801 0))(
  ( (MissingZero!7801 (index!33572 (_ BitVec 32))) (Found!7801 (index!33573 (_ BitVec 32))) (Intermediate!7801 (undefined!8613 Bool) (index!33574 (_ BitVec 32)) (x!64480 (_ BitVec 32))) (Undefined!7801) (MissingVacant!7801 (index!33575 (_ BitVec 32))) )
))
(declare-fun lt!339771 () SeekEntryResult!7801)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42192 (_ BitVec 32)) SeekEntryResult!7801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763765 (= res!516794 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20204 a!3186) j!159) mask!3328) (select (arr!20204 a!3186) j!159) a!3186 mask!3328) lt!339771))))

(assert (=> b!763765 (= lt!339771 (Intermediate!7801 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!516804 () Bool)

(assert (=> start!66270 (=> (not res!516804) (not e!425431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66270 (= res!516804 (validMask!0 mask!3328))))

(assert (=> start!66270 e!425431))

(assert (=> start!66270 true))

(declare-fun array_inv!16087 (array!42192) Bool)

(assert (=> start!66270 (array_inv!16087 a!3186)))

(declare-fun b!763766 () Bool)

(declare-fun res!516802 () Bool)

(assert (=> b!763766 (=> (not res!516802) (not e!425427))))

(declare-fun e!425429 () Bool)

(assert (=> b!763766 (= res!516802 e!425429)))

(declare-fun c!83871 () Bool)

(assert (=> b!763766 (= c!83871 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763767 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42192 (_ BitVec 32)) SeekEntryResult!7801)

(assert (=> b!763767 (= e!425429 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20204 a!3186) j!159) a!3186 mask!3328) (Found!7801 j!159)))))

(declare-fun b!763768 () Bool)

(declare-fun e!425430 () Bool)

(assert (=> b!763768 (= e!425430 (and (bvsle #b00000000000000000000000000000000 (size!20625 a!3186)) (bvsgt j!159 (size!20625 a!3186))))))

(declare-fun b!763769 () Bool)

(declare-fun res!516798 () Bool)

(assert (=> b!763769 (=> (not res!516798) (not e!425428))))

(declare-datatypes ((List!14245 0))(
  ( (Nil!14242) (Cons!14241 (h!15325 (_ BitVec 64)) (t!20551 List!14245)) )
))
(declare-fun arrayNoDuplicates!0 (array!42192 (_ BitVec 32) List!14245) Bool)

(assert (=> b!763769 (= res!516798 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14242))))

(declare-fun b!763770 () Bool)

(declare-fun res!516803 () Bool)

(assert (=> b!763770 (=> (not res!516803) (not e!425431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763770 (= res!516803 (validKeyInArray!0 (select (arr!20204 a!3186) j!159)))))

(declare-fun b!763771 () Bool)

(declare-fun res!516800 () Bool)

(assert (=> b!763771 (=> (not res!516800) (not e!425431))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763771 (= res!516800 (and (= (size!20625 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20625 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20625 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763772 () Bool)

(declare-fun res!516796 () Bool)

(assert (=> b!763772 (=> (not res!516796) (not e!425427))))

(assert (=> b!763772 (= res!516796 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20204 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763773 () Bool)

(assert (=> b!763773 (= e!425429 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20204 a!3186) j!159) a!3186 mask!3328) lt!339771))))

(declare-fun b!763774 () Bool)

(declare-fun res!516805 () Bool)

(assert (=> b!763774 (=> (not res!516805) (not e!425428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42192 (_ BitVec 32)) Bool)

(assert (=> b!763774 (= res!516805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763775 () Bool)

(assert (=> b!763775 (= e!425427 e!425430)))

(declare-fun res!516801 () Bool)

(assert (=> b!763775 (=> (not res!516801) (not e!425430))))

(declare-fun lt!339772 () array!42192)

(declare-fun lt!339773 () (_ BitVec 64))

(assert (=> b!763775 (= res!516801 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339773 mask!3328) lt!339773 lt!339772 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339773 lt!339772 mask!3328)))))

(assert (=> b!763775 (= lt!339773 (select (store (arr!20204 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!763775 (= lt!339772 (array!42193 (store (arr!20204 a!3186) i!1173 k0!2102) (size!20625 a!3186)))))

(declare-fun b!763776 () Bool)

(declare-fun res!516795 () Bool)

(assert (=> b!763776 (=> (not res!516795) (not e!425431))))

(assert (=> b!763776 (= res!516795 (validKeyInArray!0 k0!2102))))

(declare-fun b!763777 () Bool)

(assert (=> b!763777 (= e!425431 e!425428)))

(declare-fun res!516806 () Bool)

(assert (=> b!763777 (=> (not res!516806) (not e!425428))))

(declare-fun lt!339770 () SeekEntryResult!7801)

(assert (=> b!763777 (= res!516806 (or (= lt!339770 (MissingZero!7801 i!1173)) (= lt!339770 (MissingVacant!7801 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42192 (_ BitVec 32)) SeekEntryResult!7801)

(assert (=> b!763777 (= lt!339770 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!66270 res!516804) b!763771))

(assert (= (and b!763771 res!516800) b!763770))

(assert (= (and b!763770 res!516803) b!763776))

(assert (= (and b!763776 res!516795) b!763764))

(assert (= (and b!763764 res!516799) b!763777))

(assert (= (and b!763777 res!516806) b!763774))

(assert (= (and b!763774 res!516805) b!763769))

(assert (= (and b!763769 res!516798) b!763763))

(assert (= (and b!763763 res!516797) b!763765))

(assert (= (and b!763765 res!516794) b!763772))

(assert (= (and b!763772 res!516796) b!763766))

(assert (= (and b!763766 c!83871) b!763773))

(assert (= (and b!763766 (not c!83871)) b!763767))

(assert (= (and b!763766 res!516802) b!763775))

(assert (= (and b!763775 res!516801) b!763768))

(declare-fun m!709669 () Bool)

(assert (=> b!763774 m!709669))

(declare-fun m!709671 () Bool)

(assert (=> b!763776 m!709671))

(declare-fun m!709673 () Bool)

(assert (=> b!763775 m!709673))

(declare-fun m!709675 () Bool)

(assert (=> b!763775 m!709675))

(assert (=> b!763775 m!709673))

(declare-fun m!709677 () Bool)

(assert (=> b!763775 m!709677))

(declare-fun m!709679 () Bool)

(assert (=> b!763775 m!709679))

(declare-fun m!709681 () Bool)

(assert (=> b!763775 m!709681))

(declare-fun m!709683 () Bool)

(assert (=> b!763773 m!709683))

(assert (=> b!763773 m!709683))

(declare-fun m!709685 () Bool)

(assert (=> b!763773 m!709685))

(assert (=> b!763770 m!709683))

(assert (=> b!763770 m!709683))

(declare-fun m!709687 () Bool)

(assert (=> b!763770 m!709687))

(declare-fun m!709689 () Bool)

(assert (=> b!763772 m!709689))

(declare-fun m!709691 () Bool)

(assert (=> b!763764 m!709691))

(declare-fun m!709693 () Bool)

(assert (=> b!763769 m!709693))

(declare-fun m!709695 () Bool)

(assert (=> start!66270 m!709695))

(declare-fun m!709697 () Bool)

(assert (=> start!66270 m!709697))

(assert (=> b!763765 m!709683))

(assert (=> b!763765 m!709683))

(declare-fun m!709699 () Bool)

(assert (=> b!763765 m!709699))

(assert (=> b!763765 m!709699))

(assert (=> b!763765 m!709683))

(declare-fun m!709701 () Bool)

(assert (=> b!763765 m!709701))

(declare-fun m!709703 () Bool)

(assert (=> b!763777 m!709703))

(assert (=> b!763767 m!709683))

(assert (=> b!763767 m!709683))

(declare-fun m!709705 () Bool)

(assert (=> b!763767 m!709705))

(check-sat (not b!763776) (not b!763769) (not b!763764) (not b!763774) (not b!763767) (not start!66270) (not b!763775) (not b!763773) (not b!763770) (not b!763777) (not b!763765))
(check-sat)
