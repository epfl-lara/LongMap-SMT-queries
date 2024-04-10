; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68634 () Bool)

(assert start!68634)

(declare-fun b!798720 () Bool)

(declare-fun res!543246 () Bool)

(declare-fun e!443003 () Bool)

(assert (=> b!798720 (=> (not res!543246) (not e!443003))))

(declare-datatypes ((array!43424 0))(
  ( (array!43425 (arr!20792 (Array (_ BitVec 32) (_ BitVec 64))) (size!21213 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43424)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798720 (= res!543246 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798721 () Bool)

(declare-fun res!543241 () Bool)

(assert (=> b!798721 (=> (not res!543241) (not e!443003))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!798721 (= res!543241 (and (= (size!21213 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21213 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21213 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798722 () Bool)

(declare-fun res!543245 () Bool)

(assert (=> b!798722 (=> (not res!543245) (not e!443003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798722 (= res!543245 (validKeyInArray!0 (select (arr!20792 a!3170) j!153)))))

(declare-fun b!798723 () Bool)

(declare-fun e!443005 () Bool)

(declare-fun e!443004 () Bool)

(assert (=> b!798723 (= e!443005 e!443004)))

(declare-fun res!543243 () Bool)

(assert (=> b!798723 (=> (not res!543243) (not e!443004))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356560 () (_ BitVec 64))

(declare-fun lt!356564 () array!43424)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8383 0))(
  ( (MissingZero!8383 (index!35900 (_ BitVec 32))) (Found!8383 (index!35901 (_ BitVec 32))) (Intermediate!8383 (undefined!9195 Bool) (index!35902 (_ BitVec 32)) (x!66781 (_ BitVec 32))) (Undefined!8383) (MissingVacant!8383 (index!35903 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43424 (_ BitVec 32)) SeekEntryResult!8383)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43424 (_ BitVec 32)) SeekEntryResult!8383)

(assert (=> b!798723 (= res!543243 (= (seekEntryOrOpen!0 lt!356560 lt!356564 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356560 lt!356564 mask!3266)))))

(assert (=> b!798723 (= lt!356560 (select (store (arr!20792 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798723 (= lt!356564 (array!43425 (store (arr!20792 a!3170) i!1163 k!2044) (size!21213 a!3170)))))

(declare-fun b!798724 () Bool)

(declare-fun res!543247 () Bool)

(assert (=> b!798724 (=> (not res!543247) (not e!443005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43424 (_ BitVec 32)) Bool)

(assert (=> b!798724 (= res!543247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798725 () Bool)

(declare-fun res!543248 () Bool)

(assert (=> b!798725 (=> (not res!543248) (not e!443003))))

(assert (=> b!798725 (= res!543248 (validKeyInArray!0 k!2044))))

(declare-fun b!798726 () Bool)

(declare-fun res!543239 () Bool)

(assert (=> b!798726 (=> (not res!543239) (not e!443005))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798726 (= res!543239 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21213 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20792 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21213 a!3170)) (= (select (arr!20792 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!543242 () Bool)

(assert (=> start!68634 (=> (not res!543242) (not e!443003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68634 (= res!543242 (validMask!0 mask!3266))))

(assert (=> start!68634 e!443003))

(assert (=> start!68634 true))

(declare-fun array_inv!16588 (array!43424) Bool)

(assert (=> start!68634 (array_inv!16588 a!3170)))

(declare-fun b!798727 () Bool)

(declare-fun res!543244 () Bool)

(assert (=> b!798727 (=> (not res!543244) (not e!443005))))

(declare-datatypes ((List!14755 0))(
  ( (Nil!14752) (Cons!14751 (h!15880 (_ BitVec 64)) (t!21070 List!14755)) )
))
(declare-fun arrayNoDuplicates!0 (array!43424 (_ BitVec 32) List!14755) Bool)

(assert (=> b!798727 (= res!543244 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14752))))

(declare-fun b!798728 () Bool)

(assert (=> b!798728 (= e!443003 e!443005)))

(declare-fun res!543240 () Bool)

(assert (=> b!798728 (=> (not res!543240) (not e!443005))))

(declare-fun lt!356562 () SeekEntryResult!8383)

(assert (=> b!798728 (= res!543240 (or (= lt!356562 (MissingZero!8383 i!1163)) (= lt!356562 (MissingVacant!8383 i!1163))))))

(assert (=> b!798728 (= lt!356562 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!798729 () Bool)

(declare-fun lt!356561 () SeekEntryResult!8383)

(declare-fun lt!356563 () SeekEntryResult!8383)

(assert (=> b!798729 (= e!443004 (and (= lt!356561 lt!356563) (= lt!356563 (Found!8383 j!153)) (not (= (select (arr!20792 a!3170) index!1236) (select (arr!20792 a!3170) j!153))) (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(assert (=> b!798729 (= lt!356563 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20792 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798729 (= lt!356561 (seekEntryOrOpen!0 (select (arr!20792 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68634 res!543242) b!798721))

(assert (= (and b!798721 res!543241) b!798722))

(assert (= (and b!798722 res!543245) b!798725))

(assert (= (and b!798725 res!543248) b!798720))

(assert (= (and b!798720 res!543246) b!798728))

(assert (= (and b!798728 res!543240) b!798724))

(assert (= (and b!798724 res!543247) b!798727))

(assert (= (and b!798727 res!543244) b!798726))

(assert (= (and b!798726 res!543239) b!798723))

(assert (= (and b!798723 res!543243) b!798729))

(declare-fun m!739673 () Bool)

(assert (=> b!798724 m!739673))

(declare-fun m!739675 () Bool)

(assert (=> b!798720 m!739675))

(declare-fun m!739677 () Bool)

(assert (=> b!798722 m!739677))

(assert (=> b!798722 m!739677))

(declare-fun m!739679 () Bool)

(assert (=> b!798722 m!739679))

(declare-fun m!739681 () Bool)

(assert (=> b!798723 m!739681))

(declare-fun m!739683 () Bool)

(assert (=> b!798723 m!739683))

(declare-fun m!739685 () Bool)

(assert (=> b!798723 m!739685))

(declare-fun m!739687 () Bool)

(assert (=> b!798723 m!739687))

(declare-fun m!739689 () Bool)

(assert (=> b!798728 m!739689))

(declare-fun m!739691 () Bool)

(assert (=> b!798725 m!739691))

(declare-fun m!739693 () Bool)

(assert (=> start!68634 m!739693))

(declare-fun m!739695 () Bool)

(assert (=> start!68634 m!739695))

(declare-fun m!739697 () Bool)

(assert (=> b!798726 m!739697))

(declare-fun m!739699 () Bool)

(assert (=> b!798726 m!739699))

(declare-fun m!739701 () Bool)

(assert (=> b!798729 m!739701))

(assert (=> b!798729 m!739677))

(assert (=> b!798729 m!739677))

(declare-fun m!739703 () Bool)

(assert (=> b!798729 m!739703))

(assert (=> b!798729 m!739677))

(declare-fun m!739705 () Bool)

(assert (=> b!798729 m!739705))

(declare-fun m!739707 () Bool)

(assert (=> b!798727 m!739707))

(push 1)

(assert (not b!798729))

(assert (not b!798722))

(assert (not b!798728))

(assert (not start!68634))

(assert (not b!798725))

(assert (not b!798720))

(assert (not b!798724))

(assert (not b!798723))

(assert (not b!798727))

(check-sat)

(pop 1)

(push 1)

(check-sat)

