; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49190 () Bool)

(assert start!49190)

(declare-fun b!541646 () Bool)

(declare-fun res!336375 () Bool)

(declare-fun e!313622 () Bool)

(assert (=> b!541646 (=> (not res!336375) (not e!313622))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541646 (= res!336375 (validKeyInArray!0 k0!1998))))

(declare-fun b!541647 () Bool)

(declare-fun res!336379 () Bool)

(assert (=> b!541647 (=> (not res!336379) (not e!313622))))

(declare-datatypes ((array!34249 0))(
  ( (array!34250 (arr!16459 (Array (_ BitVec 32) (_ BitVec 64))) (size!16823 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34249)

(declare-fun arrayContainsKey!0 (array!34249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541647 (= res!336379 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541648 () Bool)

(declare-fun e!313623 () Bool)

(assert (=> b!541648 (= e!313622 e!313623)))

(declare-fun res!336380 () Bool)

(assert (=> b!541648 (=> (not res!336380) (not e!313623))))

(declare-datatypes ((SeekEntryResult!4917 0))(
  ( (MissingZero!4917 (index!21892 (_ BitVec 32))) (Found!4917 (index!21893 (_ BitVec 32))) (Intermediate!4917 (undefined!5729 Bool) (index!21894 (_ BitVec 32)) (x!50806 (_ BitVec 32))) (Undefined!4917) (MissingVacant!4917 (index!21895 (_ BitVec 32))) )
))
(declare-fun lt!247705 () SeekEntryResult!4917)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541648 (= res!336380 (or (= lt!247705 (MissingZero!4917 i!1153)) (= lt!247705 (MissingVacant!4917 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34249 (_ BitVec 32)) SeekEntryResult!4917)

(assert (=> b!541648 (= lt!247705 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!541649 () Bool)

(declare-fun res!336378 () Bool)

(assert (=> b!541649 (=> (not res!336378) (not e!313623))))

(declare-datatypes ((List!10578 0))(
  ( (Nil!10575) (Cons!10574 (h!11526 (_ BitVec 64)) (t!16806 List!10578)) )
))
(declare-fun arrayNoDuplicates!0 (array!34249 (_ BitVec 32) List!10578) Bool)

(assert (=> b!541649 (= res!336378 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10575))))

(declare-fun b!541651 () Bool)

(declare-fun res!336382 () Bool)

(assert (=> b!541651 (=> (not res!336382) (not e!313622))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!541651 (= res!336382 (validKeyInArray!0 (select (arr!16459 a!3154) j!147)))))

(declare-fun b!541652 () Bool)

(declare-fun res!336377 () Bool)

(assert (=> b!541652 (=> (not res!336377) (not e!313623))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34249 (_ BitVec 32)) SeekEntryResult!4917)

(assert (=> b!541652 (= res!336377 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16459 a!3154) j!147) a!3154 mask!3216) (Intermediate!4917 false resIndex!32 resX!32)))))

(declare-fun b!541653 () Bool)

(declare-fun res!336376 () Bool)

(assert (=> b!541653 (=> (not res!336376) (not e!313623))))

(assert (=> b!541653 (= res!336376 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16823 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16823 a!3154)) (= (select (arr!16459 a!3154) resIndex!32) (select (arr!16459 a!3154) j!147))))))

(declare-fun res!336381 () Bool)

(assert (=> start!49190 (=> (not res!336381) (not e!313622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49190 (= res!336381 (validMask!0 mask!3216))))

(assert (=> start!49190 e!313622))

(assert (=> start!49190 true))

(declare-fun array_inv!12255 (array!34249) Bool)

(assert (=> start!49190 (array_inv!12255 a!3154)))

(declare-fun b!541650 () Bool)

(declare-fun res!336374 () Bool)

(assert (=> b!541650 (=> (not res!336374) (not e!313622))))

(assert (=> b!541650 (= res!336374 (and (= (size!16823 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16823 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16823 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541654 () Bool)

(assert (=> b!541654 (= e!313623 false)))

(declare-fun lt!247704 () SeekEntryResult!4917)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541654 (= lt!247704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16459 a!3154) j!147) mask!3216) (select (arr!16459 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541655 () Bool)

(declare-fun res!336383 () Bool)

(assert (=> b!541655 (=> (not res!336383) (not e!313623))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34249 (_ BitVec 32)) Bool)

(assert (=> b!541655 (= res!336383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49190 res!336381) b!541650))

(assert (= (and b!541650 res!336374) b!541651))

(assert (= (and b!541651 res!336382) b!541646))

(assert (= (and b!541646 res!336375) b!541647))

(assert (= (and b!541647 res!336379) b!541648))

(assert (= (and b!541648 res!336380) b!541655))

(assert (= (and b!541655 res!336383) b!541649))

(assert (= (and b!541649 res!336378) b!541653))

(assert (= (and b!541653 res!336376) b!541652))

(assert (= (and b!541652 res!336377) b!541654))

(declare-fun m!520103 () Bool)

(assert (=> b!541653 m!520103))

(declare-fun m!520105 () Bool)

(assert (=> b!541653 m!520105))

(declare-fun m!520107 () Bool)

(assert (=> b!541649 m!520107))

(declare-fun m!520109 () Bool)

(assert (=> b!541648 m!520109))

(assert (=> b!541654 m!520105))

(assert (=> b!541654 m!520105))

(declare-fun m!520111 () Bool)

(assert (=> b!541654 m!520111))

(assert (=> b!541654 m!520111))

(assert (=> b!541654 m!520105))

(declare-fun m!520113 () Bool)

(assert (=> b!541654 m!520113))

(assert (=> b!541651 m!520105))

(assert (=> b!541651 m!520105))

(declare-fun m!520115 () Bool)

(assert (=> b!541651 m!520115))

(declare-fun m!520117 () Bool)

(assert (=> b!541647 m!520117))

(declare-fun m!520119 () Bool)

(assert (=> b!541655 m!520119))

(assert (=> b!541652 m!520105))

(assert (=> b!541652 m!520105))

(declare-fun m!520121 () Bool)

(assert (=> b!541652 m!520121))

(declare-fun m!520123 () Bool)

(assert (=> b!541646 m!520123))

(declare-fun m!520125 () Bool)

(assert (=> start!49190 m!520125))

(declare-fun m!520127 () Bool)

(assert (=> start!49190 m!520127))

(check-sat (not b!541651) (not b!541646) (not b!541652) (not b!541649) (not start!49190) (not b!541647) (not b!541655) (not b!541648) (not b!541654))
(check-sat)
