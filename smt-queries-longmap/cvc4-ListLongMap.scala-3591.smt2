; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49336 () Bool)

(assert start!49336)

(declare-fun b!543546 () Bool)

(declare-fun res!338103 () Bool)

(declare-fun e!314337 () Bool)

(assert (=> b!543546 (=> (not res!338103) (not e!314337))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34344 0))(
  ( (array!34345 (arr!16505 (Array (_ BitVec 32) (_ BitVec 64))) (size!16869 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34344)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543546 (= res!338103 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16869 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16869 a!3154)) (= (select (arr!16505 a!3154) resIndex!32) (select (arr!16505 a!3154) j!147))))))

(declare-fun b!543547 () Bool)

(declare-fun res!338098 () Bool)

(assert (=> b!543547 (=> (not res!338098) (not e!314337))))

(declare-datatypes ((List!10624 0))(
  ( (Nil!10621) (Cons!10620 (h!11575 (_ BitVec 64)) (t!16852 List!10624)) )
))
(declare-fun arrayNoDuplicates!0 (array!34344 (_ BitVec 32) List!10624) Bool)

(assert (=> b!543547 (= res!338098 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10621))))

(declare-fun b!543548 () Bool)

(declare-fun res!338097 () Bool)

(assert (=> b!543548 (=> (not res!338097) (not e!314337))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34344 (_ BitVec 32)) Bool)

(assert (=> b!543548 (= res!338097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543549 () Bool)

(declare-fun res!338101 () Bool)

(declare-fun e!314334 () Bool)

(assert (=> b!543549 (=> (not res!338101) (not e!314334))))

(declare-datatypes ((SeekEntryResult!4963 0))(
  ( (MissingZero!4963 (index!22076 (_ BitVec 32))) (Found!4963 (index!22077 (_ BitVec 32))) (Intermediate!4963 (undefined!5775 Bool) (index!22078 (_ BitVec 32)) (x!50978 (_ BitVec 32))) (Undefined!4963) (MissingVacant!4963 (index!22079 (_ BitVec 32))) )
))
(declare-fun lt!248198 () SeekEntryResult!4963)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34344 (_ BitVec 32)) SeekEntryResult!4963)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543549 (= res!338101 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16505 a!3154) j!147) mask!3216) (select (arr!16505 a!3154) j!147) a!3154 mask!3216) lt!248198))))

(declare-fun b!543550 () Bool)

(declare-fun res!338102 () Bool)

(declare-fun e!314335 () Bool)

(assert (=> b!543550 (=> (not res!338102) (not e!314335))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543550 (= res!338102 (and (= (size!16869 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16869 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16869 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543552 () Bool)

(declare-fun res!338099 () Bool)

(assert (=> b!543552 (=> (not res!338099) (not e!314335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543552 (= res!338099 (validKeyInArray!0 (select (arr!16505 a!3154) j!147)))))

(declare-fun b!543553 () Bool)

(declare-fun res!338105 () Bool)

(assert (=> b!543553 (=> (not res!338105) (not e!314335))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543553 (= res!338105 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!338104 () Bool)

(assert (=> start!49336 (=> (not res!338104) (not e!314335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49336 (= res!338104 (validMask!0 mask!3216))))

(assert (=> start!49336 e!314335))

(assert (=> start!49336 true))

(declare-fun array_inv!12301 (array!34344) Bool)

(assert (=> start!49336 (array_inv!12301 a!3154)))

(declare-fun b!543551 () Bool)

(assert (=> b!543551 (= e!314334 false)))

(declare-fun lt!248200 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543551 (= lt!248200 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543554 () Bool)

(assert (=> b!543554 (= e!314335 e!314337)))

(declare-fun res!338107 () Bool)

(assert (=> b!543554 (=> (not res!338107) (not e!314337))))

(declare-fun lt!248199 () SeekEntryResult!4963)

(assert (=> b!543554 (= res!338107 (or (= lt!248199 (MissingZero!4963 i!1153)) (= lt!248199 (MissingVacant!4963 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34344 (_ BitVec 32)) SeekEntryResult!4963)

(assert (=> b!543554 (= lt!248199 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!543555 () Bool)

(declare-fun res!338108 () Bool)

(assert (=> b!543555 (=> (not res!338108) (not e!314335))))

(assert (=> b!543555 (= res!338108 (validKeyInArray!0 k!1998))))

(declare-fun b!543556 () Bool)

(assert (=> b!543556 (= e!314337 e!314334)))

(declare-fun res!338106 () Bool)

(assert (=> b!543556 (=> (not res!338106) (not e!314334))))

(assert (=> b!543556 (= res!338106 (= lt!248198 (Intermediate!4963 false resIndex!32 resX!32)))))

(assert (=> b!543556 (= lt!248198 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16505 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543557 () Bool)

(declare-fun res!338100 () Bool)

(assert (=> b!543557 (=> (not res!338100) (not e!314334))))

(assert (=> b!543557 (= res!338100 (and (not (= (select (arr!16505 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16505 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16505 a!3154) index!1177) (select (arr!16505 a!3154) j!147)))))))

(assert (= (and start!49336 res!338104) b!543550))

(assert (= (and b!543550 res!338102) b!543552))

(assert (= (and b!543552 res!338099) b!543555))

(assert (= (and b!543555 res!338108) b!543553))

(assert (= (and b!543553 res!338105) b!543554))

(assert (= (and b!543554 res!338107) b!543548))

(assert (= (and b!543548 res!338097) b!543547))

(assert (= (and b!543547 res!338098) b!543546))

(assert (= (and b!543546 res!338103) b!543556))

(assert (= (and b!543556 res!338106) b!543549))

(assert (= (and b!543549 res!338101) b!543557))

(assert (= (and b!543557 res!338100) b!543551))

(declare-fun m!521619 () Bool)

(assert (=> b!543547 m!521619))

(declare-fun m!521621 () Bool)

(assert (=> b!543555 m!521621))

(declare-fun m!521623 () Bool)

(assert (=> b!543551 m!521623))

(declare-fun m!521625 () Bool)

(assert (=> b!543557 m!521625))

(declare-fun m!521627 () Bool)

(assert (=> b!543557 m!521627))

(declare-fun m!521629 () Bool)

(assert (=> b!543546 m!521629))

(assert (=> b!543546 m!521627))

(declare-fun m!521631 () Bool)

(assert (=> start!49336 m!521631))

(declare-fun m!521633 () Bool)

(assert (=> start!49336 m!521633))

(assert (=> b!543556 m!521627))

(assert (=> b!543556 m!521627))

(declare-fun m!521635 () Bool)

(assert (=> b!543556 m!521635))

(assert (=> b!543552 m!521627))

(assert (=> b!543552 m!521627))

(declare-fun m!521637 () Bool)

(assert (=> b!543552 m!521637))

(declare-fun m!521639 () Bool)

(assert (=> b!543553 m!521639))

(declare-fun m!521641 () Bool)

(assert (=> b!543548 m!521641))

(assert (=> b!543549 m!521627))

(assert (=> b!543549 m!521627))

(declare-fun m!521643 () Bool)

(assert (=> b!543549 m!521643))

(assert (=> b!543549 m!521643))

(assert (=> b!543549 m!521627))

(declare-fun m!521645 () Bool)

(assert (=> b!543549 m!521645))

(declare-fun m!521647 () Bool)

(assert (=> b!543554 m!521647))

(push 1)

(assert (not b!543555))

(assert (not start!49336))

(assert (not b!543547))

(assert (not b!543553))

(assert (not b!543556))

(assert (not b!543551))

(assert (not b!543549))

(assert (not b!543548))

