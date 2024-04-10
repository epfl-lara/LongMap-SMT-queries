; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86808 () Bool)

(assert start!86808)

(declare-fun b!1006583 () Bool)

(declare-fun res!675671 () Bool)

(declare-fun e!566548 () Bool)

(assert (=> b!1006583 (=> (not res!675671) (not e!566548))))

(declare-datatypes ((array!63507 0))(
  ( (array!63508 (arr!30576 (Array (_ BitVec 32) (_ BitVec 64))) (size!31078 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63507)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9508 0))(
  ( (MissingZero!9508 (index!40403 (_ BitVec 32))) (Found!9508 (index!40404 (_ BitVec 32))) (Intermediate!9508 (undefined!10320 Bool) (index!40405 (_ BitVec 32)) (x!87796 (_ BitVec 32))) (Undefined!9508) (MissingVacant!9508 (index!40406 (_ BitVec 32))) )
))
(declare-fun lt!444825 () SeekEntryResult!9508)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63507 (_ BitVec 32)) SeekEntryResult!9508)

(assert (=> b!1006583 (= res!675671 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30576 a!3219) j!170) a!3219 mask!3464) lt!444825))))

(declare-fun b!1006584 () Bool)

(declare-fun res!675673 () Bool)

(declare-fun e!566549 () Bool)

(assert (=> b!1006584 (=> (not res!675673) (not e!566549))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006584 (= res!675673 (and (= (size!31078 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31078 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31078 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006585 () Bool)

(declare-fun res!675676 () Bool)

(declare-fun e!566550 () Bool)

(assert (=> b!1006585 (=> (not res!675676) (not e!566550))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006585 (= res!675676 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31078 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31078 a!3219))))))

(declare-fun b!1006586 () Bool)

(assert (=> b!1006586 (= e!566548 false)))

(declare-fun lt!444827 () SeekEntryResult!9508)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006586 (= lt!444827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30576 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30576 a!3219) i!1194 k!2224) j!170) (array!63508 (store (arr!30576 a!3219) i!1194 k!2224) (size!31078 a!3219)) mask!3464))))

(declare-fun b!1006588 () Bool)

(assert (=> b!1006588 (= e!566549 e!566550)))

(declare-fun res!675677 () Bool)

(assert (=> b!1006588 (=> (not res!675677) (not e!566550))))

(declare-fun lt!444826 () SeekEntryResult!9508)

(assert (=> b!1006588 (= res!675677 (or (= lt!444826 (MissingVacant!9508 i!1194)) (= lt!444826 (MissingZero!9508 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63507 (_ BitVec 32)) SeekEntryResult!9508)

(assert (=> b!1006588 (= lt!444826 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006589 () Bool)

(assert (=> b!1006589 (= e!566550 e!566548)))

(declare-fun res!675678 () Bool)

(assert (=> b!1006589 (=> (not res!675678) (not e!566548))))

(assert (=> b!1006589 (= res!675678 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30576 a!3219) j!170) mask!3464) (select (arr!30576 a!3219) j!170) a!3219 mask!3464) lt!444825))))

(assert (=> b!1006589 (= lt!444825 (Intermediate!9508 false resIndex!38 resX!38))))

(declare-fun b!1006590 () Bool)

(declare-fun res!675681 () Bool)

(assert (=> b!1006590 (=> (not res!675681) (not e!566550))))

(declare-datatypes ((List!21252 0))(
  ( (Nil!21249) (Cons!21248 (h!22431 (_ BitVec 64)) (t!30253 List!21252)) )
))
(declare-fun arrayNoDuplicates!0 (array!63507 (_ BitVec 32) List!21252) Bool)

(assert (=> b!1006590 (= res!675681 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21249))))

(declare-fun b!1006591 () Bool)

(declare-fun res!675675 () Bool)

(assert (=> b!1006591 (=> (not res!675675) (not e!566549))))

(declare-fun arrayContainsKey!0 (array!63507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006591 (= res!675675 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006592 () Bool)

(declare-fun res!675679 () Bool)

(assert (=> b!1006592 (=> (not res!675679) (not e!566549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006592 (= res!675679 (validKeyInArray!0 k!2224))))

(declare-fun b!1006593 () Bool)

(declare-fun res!675672 () Bool)

(assert (=> b!1006593 (=> (not res!675672) (not e!566549))))

(assert (=> b!1006593 (= res!675672 (validKeyInArray!0 (select (arr!30576 a!3219) j!170)))))

(declare-fun b!1006587 () Bool)

(declare-fun res!675674 () Bool)

(assert (=> b!1006587 (=> (not res!675674) (not e!566550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63507 (_ BitVec 32)) Bool)

(assert (=> b!1006587 (= res!675674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!675680 () Bool)

(assert (=> start!86808 (=> (not res!675680) (not e!566549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86808 (= res!675680 (validMask!0 mask!3464))))

(assert (=> start!86808 e!566549))

(declare-fun array_inv!23700 (array!63507) Bool)

(assert (=> start!86808 (array_inv!23700 a!3219)))

(assert (=> start!86808 true))

(assert (= (and start!86808 res!675680) b!1006584))

(assert (= (and b!1006584 res!675673) b!1006593))

(assert (= (and b!1006593 res!675672) b!1006592))

(assert (= (and b!1006592 res!675679) b!1006591))

(assert (= (and b!1006591 res!675675) b!1006588))

(assert (= (and b!1006588 res!675677) b!1006587))

(assert (= (and b!1006587 res!675674) b!1006590))

(assert (= (and b!1006590 res!675681) b!1006585))

(assert (= (and b!1006585 res!675676) b!1006589))

(assert (= (and b!1006589 res!675678) b!1006583))

(assert (= (and b!1006583 res!675671) b!1006586))

(declare-fun m!931677 () Bool)

(assert (=> b!1006587 m!931677))

(declare-fun m!931679 () Bool)

(assert (=> b!1006588 m!931679))

(declare-fun m!931681 () Bool)

(assert (=> b!1006593 m!931681))

(assert (=> b!1006593 m!931681))

(declare-fun m!931683 () Bool)

(assert (=> b!1006593 m!931683))

(declare-fun m!931685 () Bool)

(assert (=> b!1006591 m!931685))

(assert (=> b!1006589 m!931681))

(assert (=> b!1006589 m!931681))

(declare-fun m!931687 () Bool)

(assert (=> b!1006589 m!931687))

(assert (=> b!1006589 m!931687))

(assert (=> b!1006589 m!931681))

(declare-fun m!931689 () Bool)

(assert (=> b!1006589 m!931689))

(declare-fun m!931691 () Bool)

(assert (=> b!1006590 m!931691))

(declare-fun m!931693 () Bool)

(assert (=> start!86808 m!931693))

(declare-fun m!931695 () Bool)

(assert (=> start!86808 m!931695))

(declare-fun m!931697 () Bool)

(assert (=> b!1006586 m!931697))

(declare-fun m!931699 () Bool)

(assert (=> b!1006586 m!931699))

(assert (=> b!1006586 m!931699))

(declare-fun m!931701 () Bool)

(assert (=> b!1006586 m!931701))

(assert (=> b!1006586 m!931701))

(assert (=> b!1006586 m!931699))

(declare-fun m!931703 () Bool)

(assert (=> b!1006586 m!931703))

(assert (=> b!1006583 m!931681))

(assert (=> b!1006583 m!931681))

(declare-fun m!931705 () Bool)

(assert (=> b!1006583 m!931705))

(declare-fun m!931707 () Bool)

(assert (=> b!1006592 m!931707))

(push 1)

(assert (not b!1006583))

(assert (not b!1006589))

(assert (not b!1006591))

(assert (not b!1006587))

