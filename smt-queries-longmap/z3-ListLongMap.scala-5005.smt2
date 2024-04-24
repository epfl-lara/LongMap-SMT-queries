; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68664 () Bool)

(assert start!68664)

(declare-fun b!797776 () Bool)

(declare-fun e!442681 () Bool)

(declare-fun e!442676 () Bool)

(assert (=> b!797776 (= e!442681 e!442676)))

(declare-fun res!541922 () Bool)

(assert (=> b!797776 (=> (not res!541922) (not e!442676))))

(declare-datatypes ((SeekEntryResult!8287 0))(
  ( (MissingZero!8287 (index!35516 (_ BitVec 32))) (Found!8287 (index!35517 (_ BitVec 32))) (Intermediate!8287 (undefined!9099 Bool) (index!35518 (_ BitVec 32)) (x!66576 (_ BitVec 32))) (Undefined!8287) (MissingVacant!8287 (index!35519 (_ BitVec 32))) )
))
(declare-fun lt!355840 () SeekEntryResult!8287)

(declare-fun lt!355841 () SeekEntryResult!8287)

(assert (=> b!797776 (= res!541922 (= lt!355840 lt!355841))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355839 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43328 0))(
  ( (array!43329 (arr!20740 (Array (_ BitVec 32) (_ BitVec 64))) (size!21160 (_ BitVec 32))) )
))
(declare-fun lt!355837 () array!43328)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43328 (_ BitVec 32)) SeekEntryResult!8287)

(assert (=> b!797776 (= lt!355841 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355839 lt!355837 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43328 (_ BitVec 32)) SeekEntryResult!8287)

(assert (=> b!797776 (= lt!355840 (seekEntryOrOpen!0 lt!355839 lt!355837 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43328)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797776 (= lt!355839 (select (store (arr!20740 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797776 (= lt!355837 (array!43329 (store (arr!20740 a!3170) i!1163 k0!2044) (size!21160 a!3170)))))

(declare-fun b!797777 () Bool)

(declare-fun res!541924 () Bool)

(declare-fun e!442679 () Bool)

(assert (=> b!797777 (=> (not res!541924) (not e!442679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797777 (= res!541924 (validKeyInArray!0 k0!2044))))

(declare-fun b!797778 () Bool)

(declare-fun res!541927 () Bool)

(assert (=> b!797778 (=> (not res!541927) (not e!442679))))

(assert (=> b!797778 (= res!541927 (validKeyInArray!0 (select (arr!20740 a!3170) j!153)))))

(declare-fun res!541929 () Bool)

(assert (=> start!68664 (=> (not res!541929) (not e!442679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68664 (= res!541929 (validMask!0 mask!3266))))

(assert (=> start!68664 e!442679))

(assert (=> start!68664 true))

(declare-fun array_inv!16599 (array!43328) Bool)

(assert (=> start!68664 (array_inv!16599 a!3170)))

(declare-fun b!797779 () Bool)

(declare-fun res!541926 () Bool)

(assert (=> b!797779 (=> (not res!541926) (not e!442681))))

(declare-datatypes ((List!14610 0))(
  ( (Nil!14607) (Cons!14606 (h!15741 (_ BitVec 64)) (t!20917 List!14610)) )
))
(declare-fun arrayNoDuplicates!0 (array!43328 (_ BitVec 32) List!14610) Bool)

(assert (=> b!797779 (= res!541926 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14607))))

(declare-fun b!797780 () Bool)

(declare-fun res!541928 () Bool)

(assert (=> b!797780 (=> (not res!541928) (not e!442679))))

(assert (=> b!797780 (= res!541928 (and (= (size!21160 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21160 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21160 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797781 () Bool)

(declare-fun res!541930 () Bool)

(assert (=> b!797781 (=> (not res!541930) (not e!442681))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797781 (= res!541930 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21160 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20740 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21160 a!3170)) (= (select (arr!20740 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797782 () Bool)

(declare-fun e!442680 () Bool)

(assert (=> b!797782 (= e!442676 e!442680)))

(declare-fun res!541931 () Bool)

(assert (=> b!797782 (=> (not res!541931) (not e!442680))))

(declare-fun lt!355838 () SeekEntryResult!8287)

(declare-fun lt!355843 () SeekEntryResult!8287)

(assert (=> b!797782 (= res!541931 (= lt!355838 lt!355843))))

(assert (=> b!797782 (= lt!355843 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20740 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797782 (= lt!355838 (seekEntryOrOpen!0 (select (arr!20740 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797783 () Bool)

(declare-fun e!442678 () Bool)

(declare-fun lt!355836 () SeekEntryResult!8287)

(assert (=> b!797783 (= e!442678 (not (or (not (= lt!355841 lt!355836)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!797783 (= lt!355841 (Found!8287 index!1236))))

(declare-fun b!797784 () Bool)

(declare-fun res!541921 () Bool)

(assert (=> b!797784 (=> (not res!541921) (not e!442679))))

(declare-fun arrayContainsKey!0 (array!43328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797784 (= res!541921 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797785 () Bool)

(assert (=> b!797785 (= e!442679 e!442681)))

(declare-fun res!541932 () Bool)

(assert (=> b!797785 (=> (not res!541932) (not e!442681))))

(declare-fun lt!355842 () SeekEntryResult!8287)

(assert (=> b!797785 (= res!541932 (or (= lt!355842 (MissingZero!8287 i!1163)) (= lt!355842 (MissingVacant!8287 i!1163))))))

(assert (=> b!797785 (= lt!355842 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797786 () Bool)

(declare-fun res!541925 () Bool)

(assert (=> b!797786 (=> (not res!541925) (not e!442681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43328 (_ BitVec 32)) Bool)

(assert (=> b!797786 (= res!541925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797787 () Bool)

(assert (=> b!797787 (= e!442680 e!442678)))

(declare-fun res!541923 () Bool)

(assert (=> b!797787 (=> (not res!541923) (not e!442678))))

(assert (=> b!797787 (= res!541923 (and (= lt!355843 lt!355836) (= (select (arr!20740 a!3170) index!1236) (select (arr!20740 a!3170) j!153))))))

(assert (=> b!797787 (= lt!355836 (Found!8287 j!153))))

(assert (= (and start!68664 res!541929) b!797780))

(assert (= (and b!797780 res!541928) b!797778))

(assert (= (and b!797778 res!541927) b!797777))

(assert (= (and b!797777 res!541924) b!797784))

(assert (= (and b!797784 res!541921) b!797785))

(assert (= (and b!797785 res!541932) b!797786))

(assert (= (and b!797786 res!541925) b!797779))

(assert (= (and b!797779 res!541926) b!797781))

(assert (= (and b!797781 res!541930) b!797776))

(assert (= (and b!797776 res!541922) b!797782))

(assert (= (and b!797782 res!541931) b!797787))

(assert (= (and b!797787 res!541923) b!797783))

(declare-fun m!739049 () Bool)

(assert (=> b!797779 m!739049))

(declare-fun m!739051 () Bool)

(assert (=> b!797784 m!739051))

(declare-fun m!739053 () Bool)

(assert (=> b!797785 m!739053))

(declare-fun m!739055 () Bool)

(assert (=> b!797776 m!739055))

(declare-fun m!739057 () Bool)

(assert (=> b!797776 m!739057))

(declare-fun m!739059 () Bool)

(assert (=> b!797776 m!739059))

(declare-fun m!739061 () Bool)

(assert (=> b!797776 m!739061))

(declare-fun m!739063 () Bool)

(assert (=> start!68664 m!739063))

(declare-fun m!739065 () Bool)

(assert (=> start!68664 m!739065))

(declare-fun m!739067 () Bool)

(assert (=> b!797786 m!739067))

(declare-fun m!739069 () Bool)

(assert (=> b!797781 m!739069))

(declare-fun m!739071 () Bool)

(assert (=> b!797781 m!739071))

(declare-fun m!739073 () Bool)

(assert (=> b!797778 m!739073))

(assert (=> b!797778 m!739073))

(declare-fun m!739075 () Bool)

(assert (=> b!797778 m!739075))

(assert (=> b!797782 m!739073))

(assert (=> b!797782 m!739073))

(declare-fun m!739077 () Bool)

(assert (=> b!797782 m!739077))

(assert (=> b!797782 m!739073))

(declare-fun m!739079 () Bool)

(assert (=> b!797782 m!739079))

(declare-fun m!739081 () Bool)

(assert (=> b!797777 m!739081))

(declare-fun m!739083 () Bool)

(assert (=> b!797787 m!739083))

(assert (=> b!797787 m!739073))

(check-sat (not b!797778) (not b!797776) (not b!797784) (not b!797785) (not b!797777) (not start!68664) (not b!797779) (not b!797782) (not b!797786))
(check-sat)
