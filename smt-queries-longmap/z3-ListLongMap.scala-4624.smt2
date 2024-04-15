; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64358 () Bool)

(assert start!64358)

(declare-fun b!723791 () Bool)

(declare-fun res!485437 () Bool)

(declare-fun e!405407 () Bool)

(assert (=> b!723791 (=> (not res!485437) (not e!405407))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723791 (= res!485437 (validKeyInArray!0 k0!2102))))

(declare-fun b!723792 () Bool)

(declare-fun res!485433 () Bool)

(declare-fun e!405406 () Bool)

(assert (=> b!723792 (=> (not res!485433) (not e!405406))))

(declare-datatypes ((array!40956 0))(
  ( (array!40957 (arr!19601 (Array (_ BitVec 32) (_ BitVec 64))) (size!20022 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40956)

(declare-datatypes ((List!13642 0))(
  ( (Nil!13639) (Cons!13638 (h!14692 (_ BitVec 64)) (t!19948 List!13642)) )
))
(declare-fun arrayNoDuplicates!0 (array!40956 (_ BitVec 32) List!13642) Bool)

(assert (=> b!723792 (= res!485433 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13639))))

(declare-fun b!723793 () Bool)

(declare-fun res!485434 () Bool)

(assert (=> b!723793 (=> (not res!485434) (not e!405407))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!723793 (= res!485434 (validKeyInArray!0 (select (arr!19601 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!723794 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!405410 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7198 0))(
  ( (MissingZero!7198 (index!31160 (_ BitVec 32))) (Found!7198 (index!31161 (_ BitVec 32))) (Intermediate!7198 (undefined!8010 Bool) (index!31162 (_ BitVec 32)) (x!62162 (_ BitVec 32))) (Undefined!7198) (MissingVacant!7198 (index!31163 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40956 (_ BitVec 32)) SeekEntryResult!7198)

(assert (=> b!723794 (= e!405410 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19601 a!3186) j!159) a!3186 mask!3328) (Found!7198 j!159)))))

(declare-fun b!723795 () Bool)

(declare-fun res!485430 () Bool)

(declare-fun e!405412 () Bool)

(assert (=> b!723795 (=> (not res!485430) (not e!405412))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!723795 (= res!485430 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19601 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723796 () Bool)

(declare-fun res!485428 () Bool)

(assert (=> b!723796 (=> (not res!485428) (not e!405406))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723796 (= res!485428 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20022 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20022 a!3186))))))

(declare-fun b!723797 () Bool)

(declare-fun res!485439 () Bool)

(assert (=> b!723797 (=> (not res!485439) (not e!405407))))

(assert (=> b!723797 (= res!485439 (and (= (size!20022 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20022 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20022 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!485432 () Bool)

(assert (=> start!64358 (=> (not res!485432) (not e!405407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64358 (= res!485432 (validMask!0 mask!3328))))

(assert (=> start!64358 e!405407))

(assert (=> start!64358 true))

(declare-fun array_inv!15484 (array!40956) Bool)

(assert (=> start!64358 (array_inv!15484 a!3186)))

(declare-fun b!723798 () Bool)

(assert (=> b!723798 (= e!405407 e!405406)))

(declare-fun res!485429 () Bool)

(assert (=> b!723798 (=> (not res!485429) (not e!405406))))

(declare-fun lt!320621 () SeekEntryResult!7198)

(assert (=> b!723798 (= res!485429 (or (= lt!320621 (MissingZero!7198 i!1173)) (= lt!320621 (MissingVacant!7198 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40956 (_ BitVec 32)) SeekEntryResult!7198)

(assert (=> b!723798 (= lt!320621 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!723799 () Bool)

(declare-fun e!405408 () Bool)

(assert (=> b!723799 (= e!405412 e!405408)))

(declare-fun res!485426 () Bool)

(assert (=> b!723799 (=> (not res!485426) (not e!405408))))

(declare-fun lt!320624 () array!40956)

(declare-fun lt!320620 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40956 (_ BitVec 32)) SeekEntryResult!7198)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723799 (= res!485426 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320620 mask!3328) lt!320620 lt!320624 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320620 lt!320624 mask!3328)))))

(assert (=> b!723799 (= lt!320620 (select (store (arr!19601 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723799 (= lt!320624 (array!40957 (store (arr!19601 a!3186) i!1173 k0!2102) (size!20022 a!3186)))))

(declare-fun b!723800 () Bool)

(declare-fun res!485438 () Bool)

(assert (=> b!723800 (=> (not res!485438) (not e!405406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40956 (_ BitVec 32)) Bool)

(assert (=> b!723800 (= res!485438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723801 () Bool)

(declare-fun e!405411 () Bool)

(assert (=> b!723801 (= e!405411 (= (seekEntryOrOpen!0 (select (arr!19601 a!3186) j!159) a!3186 mask!3328) (Found!7198 j!159)))))

(declare-fun b!723802 () Bool)

(declare-fun res!485435 () Bool)

(assert (=> b!723802 (=> (not res!485435) (not e!405407))))

(declare-fun arrayContainsKey!0 (array!40956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723802 (= res!485435 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723803 () Bool)

(assert (=> b!723803 (= e!405406 e!405412)))

(declare-fun res!485431 () Bool)

(assert (=> b!723803 (=> (not res!485431) (not e!405412))))

(declare-fun lt!320622 () SeekEntryResult!7198)

(assert (=> b!723803 (= res!485431 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19601 a!3186) j!159) mask!3328) (select (arr!19601 a!3186) j!159) a!3186 mask!3328) lt!320622))))

(assert (=> b!723803 (= lt!320622 (Intermediate!7198 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!723804 () Bool)

(declare-fun res!485436 () Bool)

(assert (=> b!723804 (=> (not res!485436) (not e!405412))))

(assert (=> b!723804 (= res!485436 e!405410)))

(declare-fun c!79554 () Bool)

(assert (=> b!723804 (= c!79554 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723805 () Bool)

(assert (=> b!723805 (= e!405408 (not (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(assert (=> b!723805 e!405411))

(declare-fun res!485427 () Bool)

(assert (=> b!723805 (=> (not res!485427) (not e!405411))))

(assert (=> b!723805 (= res!485427 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24686 0))(
  ( (Unit!24687) )
))
(declare-fun lt!320623 () Unit!24686)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24686)

(assert (=> b!723805 (= lt!320623 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!723806 () Bool)

(assert (=> b!723806 (= e!405410 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19601 a!3186) j!159) a!3186 mask!3328) lt!320622))))

(assert (= (and start!64358 res!485432) b!723797))

(assert (= (and b!723797 res!485439) b!723793))

(assert (= (and b!723793 res!485434) b!723791))

(assert (= (and b!723791 res!485437) b!723802))

(assert (= (and b!723802 res!485435) b!723798))

(assert (= (and b!723798 res!485429) b!723800))

(assert (= (and b!723800 res!485438) b!723792))

(assert (= (and b!723792 res!485433) b!723796))

(assert (= (and b!723796 res!485428) b!723803))

(assert (= (and b!723803 res!485431) b!723795))

(assert (= (and b!723795 res!485430) b!723804))

(assert (= (and b!723804 c!79554) b!723806))

(assert (= (and b!723804 (not c!79554)) b!723794))

(assert (= (and b!723804 res!485436) b!723799))

(assert (= (and b!723799 res!485426) b!723805))

(assert (= (and b!723805 res!485427) b!723801))

(declare-fun m!677675 () Bool)

(assert (=> b!723792 m!677675))

(declare-fun m!677677 () Bool)

(assert (=> start!64358 m!677677))

(declare-fun m!677679 () Bool)

(assert (=> start!64358 m!677679))

(declare-fun m!677681 () Bool)

(assert (=> b!723794 m!677681))

(assert (=> b!723794 m!677681))

(declare-fun m!677683 () Bool)

(assert (=> b!723794 m!677683))

(declare-fun m!677685 () Bool)

(assert (=> b!723802 m!677685))

(assert (=> b!723801 m!677681))

(assert (=> b!723801 m!677681))

(declare-fun m!677687 () Bool)

(assert (=> b!723801 m!677687))

(declare-fun m!677689 () Bool)

(assert (=> b!723791 m!677689))

(assert (=> b!723803 m!677681))

(assert (=> b!723803 m!677681))

(declare-fun m!677691 () Bool)

(assert (=> b!723803 m!677691))

(assert (=> b!723803 m!677691))

(assert (=> b!723803 m!677681))

(declare-fun m!677693 () Bool)

(assert (=> b!723803 m!677693))

(assert (=> b!723793 m!677681))

(assert (=> b!723793 m!677681))

(declare-fun m!677695 () Bool)

(assert (=> b!723793 m!677695))

(declare-fun m!677697 () Bool)

(assert (=> b!723798 m!677697))

(assert (=> b!723806 m!677681))

(assert (=> b!723806 m!677681))

(declare-fun m!677699 () Bool)

(assert (=> b!723806 m!677699))

(declare-fun m!677701 () Bool)

(assert (=> b!723805 m!677701))

(declare-fun m!677703 () Bool)

(assert (=> b!723805 m!677703))

(declare-fun m!677705 () Bool)

(assert (=> b!723799 m!677705))

(declare-fun m!677707 () Bool)

(assert (=> b!723799 m!677707))

(declare-fun m!677709 () Bool)

(assert (=> b!723799 m!677709))

(assert (=> b!723799 m!677707))

(declare-fun m!677711 () Bool)

(assert (=> b!723799 m!677711))

(declare-fun m!677713 () Bool)

(assert (=> b!723799 m!677713))

(declare-fun m!677715 () Bool)

(assert (=> b!723800 m!677715))

(declare-fun m!677717 () Bool)

(assert (=> b!723795 m!677717))

(check-sat (not b!723794) (not start!64358) (not b!723805) (not b!723806) (not b!723798) (not b!723801) (not b!723792) (not b!723800) (not b!723803) (not b!723791) (not b!723799) (not b!723802) (not b!723793))
(check-sat)
