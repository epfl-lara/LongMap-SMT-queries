; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48646 () Bool)

(assert start!48646)

(declare-fun b!534386 () Bool)

(declare-fun res!329591 () Bool)

(declare-fun e!310697 () Bool)

(assert (=> b!534386 (=> (not res!329591) (not e!310697))))

(declare-datatypes ((array!33858 0))(
  ( (array!33859 (arr!16268 (Array (_ BitVec 32) (_ BitVec 64))) (size!16632 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33858)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534386 (= res!329591 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534387 () Bool)

(declare-fun res!329597 () Bool)

(assert (=> b!534387 (=> (not res!329597) (not e!310697))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534387 (= res!329597 (validKeyInArray!0 (select (arr!16268 a!3154) j!147)))))

(declare-fun b!534388 () Bool)

(declare-fun res!329592 () Bool)

(declare-fun e!310698 () Bool)

(assert (=> b!534388 (=> (not res!329592) (not e!310698))))

(declare-datatypes ((List!10387 0))(
  ( (Nil!10384) (Cons!10383 (h!11326 (_ BitVec 64)) (t!16615 List!10387)) )
))
(declare-fun arrayNoDuplicates!0 (array!33858 (_ BitVec 32) List!10387) Bool)

(assert (=> b!534388 (= res!329592 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10384))))

(declare-fun b!534389 () Bool)

(declare-fun res!329596 () Bool)

(assert (=> b!534389 (=> (not res!329596) (not e!310698))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4726 0))(
  ( (MissingZero!4726 (index!21128 (_ BitVec 32))) (Found!4726 (index!21129 (_ BitVec 32))) (Intermediate!4726 (undefined!5538 Bool) (index!21130 (_ BitVec 32)) (x!50085 (_ BitVec 32))) (Undefined!4726) (MissingVacant!4726 (index!21131 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33858 (_ BitVec 32)) SeekEntryResult!4726)

(assert (=> b!534389 (= res!329596 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16268 a!3154) j!147) a!3154 mask!3216) (Intermediate!4726 false resIndex!32 resX!32)))))

(declare-fun res!329598 () Bool)

(assert (=> start!48646 (=> (not res!329598) (not e!310697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48646 (= res!329598 (validMask!0 mask!3216))))

(assert (=> start!48646 e!310697))

(assert (=> start!48646 true))

(declare-fun array_inv!12064 (array!33858) Bool)

(assert (=> start!48646 (array_inv!12064 a!3154)))

(declare-fun b!534390 () Bool)

(declare-fun res!329600 () Bool)

(assert (=> b!534390 (=> (not res!329600) (not e!310697))))

(assert (=> b!534390 (= res!329600 (validKeyInArray!0 k!1998))))

(declare-fun b!534391 () Bool)

(declare-fun res!329599 () Bool)

(assert (=> b!534391 (=> (not res!329599) (not e!310698))))

(assert (=> b!534391 (= res!329599 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16632 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16632 a!3154)) (= (select (arr!16268 a!3154) resIndex!32) (select (arr!16268 a!3154) j!147))))))

(declare-fun b!534392 () Bool)

(assert (=> b!534392 (= e!310697 e!310698)))

(declare-fun res!329595 () Bool)

(assert (=> b!534392 (=> (not res!329595) (not e!310698))))

(declare-fun lt!245622 () SeekEntryResult!4726)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534392 (= res!329595 (or (= lt!245622 (MissingZero!4726 i!1153)) (= lt!245622 (MissingVacant!4726 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33858 (_ BitVec 32)) SeekEntryResult!4726)

(assert (=> b!534392 (= lt!245622 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534393 () Bool)

(declare-fun res!329593 () Bool)

(assert (=> b!534393 (=> (not res!329593) (not e!310697))))

(assert (=> b!534393 (= res!329593 (and (= (size!16632 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16632 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16632 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534394 () Bool)

(declare-fun res!329594 () Bool)

(assert (=> b!534394 (=> (not res!329594) (not e!310698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33858 (_ BitVec 32)) Bool)

(assert (=> b!534394 (= res!329594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534395 () Bool)

(assert (=> b!534395 (= e!310698 false)))

(declare-fun lt!245623 () SeekEntryResult!4726)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534395 (= lt!245623 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16268 a!3154) j!147) mask!3216) (select (arr!16268 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48646 res!329598) b!534393))

(assert (= (and b!534393 res!329593) b!534387))

(assert (= (and b!534387 res!329597) b!534390))

(assert (= (and b!534390 res!329600) b!534386))

(assert (= (and b!534386 res!329591) b!534392))

(assert (= (and b!534392 res!329595) b!534394))

(assert (= (and b!534394 res!329594) b!534388))

(assert (= (and b!534388 res!329592) b!534391))

(assert (= (and b!534391 res!329599) b!534389))

(assert (= (and b!534389 res!329596) b!534395))

(declare-fun m!514111 () Bool)

(assert (=> b!534388 m!514111))

(declare-fun m!514113 () Bool)

(assert (=> b!534387 m!514113))

(assert (=> b!534387 m!514113))

(declare-fun m!514115 () Bool)

(assert (=> b!534387 m!514115))

(assert (=> b!534395 m!514113))

(assert (=> b!534395 m!514113))

(declare-fun m!514117 () Bool)

(assert (=> b!534395 m!514117))

(assert (=> b!534395 m!514117))

(assert (=> b!534395 m!514113))

(declare-fun m!514119 () Bool)

(assert (=> b!534395 m!514119))

(declare-fun m!514121 () Bool)

(assert (=> b!534390 m!514121))

(declare-fun m!514123 () Bool)

(assert (=> b!534392 m!514123))

(declare-fun m!514125 () Bool)

(assert (=> b!534391 m!514125))

(assert (=> b!534391 m!514113))

(declare-fun m!514127 () Bool)

(assert (=> start!48646 m!514127))

(declare-fun m!514129 () Bool)

(assert (=> start!48646 m!514129))

(declare-fun m!514131 () Bool)

(assert (=> b!534386 m!514131))

(assert (=> b!534389 m!514113))

(assert (=> b!534389 m!514113))

(declare-fun m!514133 () Bool)

(assert (=> b!534389 m!514133))

(declare-fun m!514135 () Bool)

(assert (=> b!534394 m!514135))

(push 1)

(assert (not b!534386))

(assert (not b!534394))

(assert (not b!534390))

(assert (not b!534387))

(assert (not b!534392))

(assert (not start!48646))

(assert (not b!534389))

(assert (not b!534395))

