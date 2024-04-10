; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68418 () Bool)

(assert start!68418)

(declare-fun b!795165 () Bool)

(declare-fun res!539684 () Bool)

(declare-fun e!441395 () Bool)

(assert (=> b!795165 (=> (not res!539684) (not e!441395))))

(declare-datatypes ((array!43208 0))(
  ( (array!43209 (arr!20684 (Array (_ BitVec 32) (_ BitVec 64))) (size!21105 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43208)

(declare-datatypes ((List!14647 0))(
  ( (Nil!14644) (Cons!14643 (h!15772 (_ BitVec 64)) (t!20962 List!14647)) )
))
(declare-fun arrayNoDuplicates!0 (array!43208 (_ BitVec 32) List!14647) Bool)

(assert (=> b!795165 (= res!539684 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14644))))

(declare-fun b!795166 () Bool)

(declare-fun res!539693 () Bool)

(declare-fun e!441392 () Bool)

(assert (=> b!795166 (=> (not res!539693) (not e!441392))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795166 (= res!539693 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!539689 () Bool)

(assert (=> start!68418 (=> (not res!539689) (not e!441392))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68418 (= res!539689 (validMask!0 mask!3266))))

(assert (=> start!68418 e!441392))

(assert (=> start!68418 true))

(declare-fun array_inv!16480 (array!43208) Bool)

(assert (=> start!68418 (array_inv!16480 a!3170)))

(declare-fun b!795167 () Bool)

(assert (=> b!795167 (= e!441392 e!441395)))

(declare-fun res!539686 () Bool)

(assert (=> b!795167 (=> (not res!539686) (not e!441395))))

(declare-datatypes ((SeekEntryResult!8275 0))(
  ( (MissingZero!8275 (index!35468 (_ BitVec 32))) (Found!8275 (index!35469 (_ BitVec 32))) (Intermediate!8275 (undefined!9087 Bool) (index!35470 (_ BitVec 32)) (x!66385 (_ BitVec 32))) (Undefined!8275) (MissingVacant!8275 (index!35471 (_ BitVec 32))) )
))
(declare-fun lt!354437 () SeekEntryResult!8275)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!795167 (= res!539686 (or (= lt!354437 (MissingZero!8275 i!1163)) (= lt!354437 (MissingVacant!8275 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43208 (_ BitVec 32)) SeekEntryResult!8275)

(assert (=> b!795167 (= lt!354437 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795168 () Bool)

(declare-fun e!441394 () Bool)

(assert (=> b!795168 (= e!441395 e!441394)))

(declare-fun res!539692 () Bool)

(assert (=> b!795168 (=> (not res!539692) (not e!441394))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354436 () array!43208)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354439 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43208 (_ BitVec 32)) SeekEntryResult!8275)

(assert (=> b!795168 (= res!539692 (= (seekEntryOrOpen!0 lt!354439 lt!354436 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354439 lt!354436 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795168 (= lt!354439 (select (store (arr!20684 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795168 (= lt!354436 (array!43209 (store (arr!20684 a!3170) i!1163 k!2044) (size!21105 a!3170)))))

(declare-fun b!795169 () Bool)

(declare-fun res!539690 () Bool)

(assert (=> b!795169 (=> (not res!539690) (not e!441395))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!795169 (= res!539690 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21105 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20684 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21105 a!3170)) (= (select (arr!20684 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795170 () Bool)

(assert (=> b!795170 (= e!441394 false)))

(declare-fun lt!354438 () SeekEntryResult!8275)

(assert (=> b!795170 (= lt!354438 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20684 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354440 () SeekEntryResult!8275)

(assert (=> b!795170 (= lt!354440 (seekEntryOrOpen!0 (select (arr!20684 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795171 () Bool)

(declare-fun res!539687 () Bool)

(assert (=> b!795171 (=> (not res!539687) (not e!441392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795171 (= res!539687 (validKeyInArray!0 (select (arr!20684 a!3170) j!153)))))

(declare-fun b!795172 () Bool)

(declare-fun res!539688 () Bool)

(assert (=> b!795172 (=> (not res!539688) (not e!441392))))

(assert (=> b!795172 (= res!539688 (and (= (size!21105 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21105 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21105 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795173 () Bool)

(declare-fun res!539685 () Bool)

(assert (=> b!795173 (=> (not res!539685) (not e!441392))))

(assert (=> b!795173 (= res!539685 (validKeyInArray!0 k!2044))))

(declare-fun b!795174 () Bool)

(declare-fun res!539691 () Bool)

(assert (=> b!795174 (=> (not res!539691) (not e!441395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43208 (_ BitVec 32)) Bool)

(assert (=> b!795174 (= res!539691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68418 res!539689) b!795172))

(assert (= (and b!795172 res!539688) b!795171))

(assert (= (and b!795171 res!539687) b!795173))

(assert (= (and b!795173 res!539685) b!795166))

(assert (= (and b!795166 res!539693) b!795167))

(assert (= (and b!795167 res!539686) b!795174))

(assert (= (and b!795174 res!539691) b!795165))

(assert (= (and b!795165 res!539684) b!795169))

(assert (= (and b!795169 res!539690) b!795168))

(assert (= (and b!795168 res!539692) b!795170))

(declare-fun m!735763 () Bool)

(assert (=> start!68418 m!735763))

(declare-fun m!735765 () Bool)

(assert (=> start!68418 m!735765))

(declare-fun m!735767 () Bool)

(assert (=> b!795174 m!735767))

(declare-fun m!735769 () Bool)

(assert (=> b!795166 m!735769))

(declare-fun m!735771 () Bool)

(assert (=> b!795165 m!735771))

(declare-fun m!735773 () Bool)

(assert (=> b!795173 m!735773))

(declare-fun m!735775 () Bool)

(assert (=> b!795170 m!735775))

(assert (=> b!795170 m!735775))

(declare-fun m!735777 () Bool)

(assert (=> b!795170 m!735777))

(assert (=> b!795170 m!735775))

(declare-fun m!735779 () Bool)

(assert (=> b!795170 m!735779))

(declare-fun m!735781 () Bool)

(assert (=> b!795169 m!735781))

(declare-fun m!735783 () Bool)

(assert (=> b!795169 m!735783))

(declare-fun m!735785 () Bool)

(assert (=> b!795168 m!735785))

(declare-fun m!735787 () Bool)

(assert (=> b!795168 m!735787))

(declare-fun m!735789 () Bool)

(assert (=> b!795168 m!735789))

(declare-fun m!735791 () Bool)

(assert (=> b!795168 m!735791))

(assert (=> b!795171 m!735775))

(assert (=> b!795171 m!735775))

(declare-fun m!735793 () Bool)

(assert (=> b!795171 m!735793))

(declare-fun m!735795 () Bool)

(assert (=> b!795167 m!735795))

(push 1)

(assert (not b!795173))

(assert (not start!68418))

(assert (not b!795167))

(assert (not b!795165))

(assert (not b!795174))

(assert (not b!795171))

(assert (not b!795168))

(assert (not b!795170))

