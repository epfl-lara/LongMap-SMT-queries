; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49098 () Bool)

(assert start!49098)

(declare-fun b!540806 () Bool)

(declare-fun res!335695 () Bool)

(declare-fun e!313274 () Bool)

(assert (=> b!540806 (=> (not res!335695) (not e!313274))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34208 0))(
  ( (array!34209 (arr!16440 (Array (_ BitVec 32) (_ BitVec 64))) (size!16804 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34208)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540806 (= res!335695 (and (= (size!16804 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16804 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16804 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540807 () Bool)

(declare-fun res!335700 () Bool)

(declare-fun e!313273 () Bool)

(assert (=> b!540807 (=> (not res!335700) (not e!313273))))

(declare-datatypes ((List!10559 0))(
  ( (Nil!10556) (Cons!10555 (h!11504 (_ BitVec 64)) (t!16787 List!10559)) )
))
(declare-fun arrayNoDuplicates!0 (array!34208 (_ BitVec 32) List!10559) Bool)

(assert (=> b!540807 (= res!335700 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10556))))

(declare-fun res!335699 () Bool)

(assert (=> start!49098 (=> (not res!335699) (not e!313274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49098 (= res!335699 (validMask!0 mask!3216))))

(assert (=> start!49098 e!313274))

(assert (=> start!49098 true))

(declare-fun array_inv!12236 (array!34208) Bool)

(assert (=> start!49098 (array_inv!12236 a!3154)))

(declare-fun b!540808 () Bool)

(declare-fun res!335698 () Bool)

(assert (=> b!540808 (=> (not res!335698) (not e!313273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34208 (_ BitVec 32)) Bool)

(assert (=> b!540808 (= res!335698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540809 () Bool)

(declare-fun res!335697 () Bool)

(assert (=> b!540809 (=> (not res!335697) (not e!313273))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540809 (= res!335697 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16804 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16804 a!3154)) (= (select (arr!16440 a!3154) resIndex!32) (select (arr!16440 a!3154) j!147))))))

(declare-fun b!540810 () Bool)

(declare-fun res!335701 () Bool)

(assert (=> b!540810 (=> (not res!335701) (not e!313274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540810 (= res!335701 (validKeyInArray!0 (select (arr!16440 a!3154) j!147)))))

(declare-fun b!540811 () Bool)

(declare-fun res!335696 () Bool)

(assert (=> b!540811 (=> (not res!335696) (not e!313273))))

(declare-datatypes ((SeekEntryResult!4898 0))(
  ( (MissingZero!4898 (index!21816 (_ BitVec 32))) (Found!4898 (index!21817 (_ BitVec 32))) (Intermediate!4898 (undefined!5710 Bool) (index!21818 (_ BitVec 32)) (x!50733 (_ BitVec 32))) (Undefined!4898) (MissingVacant!4898 (index!21819 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34208 (_ BitVec 32)) SeekEntryResult!4898)

(assert (=> b!540811 (= res!335696 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16440 a!3154) j!147) a!3154 mask!3216) (Intermediate!4898 false resIndex!32 resX!32)))))

(declare-fun b!540812 () Bool)

(assert (=> b!540812 (= e!313274 e!313273)))

(declare-fun res!335694 () Bool)

(assert (=> b!540812 (=> (not res!335694) (not e!313273))))

(declare-fun lt!247494 () SeekEntryResult!4898)

(assert (=> b!540812 (= res!335694 (or (= lt!247494 (MissingZero!4898 i!1153)) (= lt!247494 (MissingVacant!4898 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34208 (_ BitVec 32)) SeekEntryResult!4898)

(assert (=> b!540812 (= lt!247494 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!540813 () Bool)

(assert (=> b!540813 (= e!313273 false)))

(declare-fun lt!247495 () SeekEntryResult!4898)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540813 (= lt!247495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16440 a!3154) j!147) mask!3216) (select (arr!16440 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540814 () Bool)

(declare-fun res!335702 () Bool)

(assert (=> b!540814 (=> (not res!335702) (not e!313274))))

(assert (=> b!540814 (= res!335702 (validKeyInArray!0 k!1998))))

(declare-fun b!540815 () Bool)

(declare-fun res!335693 () Bool)

(assert (=> b!540815 (=> (not res!335693) (not e!313274))))

(declare-fun arrayContainsKey!0 (array!34208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540815 (= res!335693 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49098 res!335699) b!540806))

(assert (= (and b!540806 res!335695) b!540810))

(assert (= (and b!540810 res!335701) b!540814))

(assert (= (and b!540814 res!335702) b!540815))

(assert (= (and b!540815 res!335693) b!540812))

(assert (= (and b!540812 res!335694) b!540808))

(assert (= (and b!540808 res!335698) b!540807))

(assert (= (and b!540807 res!335700) b!540809))

(assert (= (and b!540809 res!335697) b!540811))

(assert (= (and b!540811 res!335696) b!540813))

(declare-fun m!519465 () Bool)

(assert (=> b!540813 m!519465))

(assert (=> b!540813 m!519465))

(declare-fun m!519467 () Bool)

(assert (=> b!540813 m!519467))

(assert (=> b!540813 m!519467))

(assert (=> b!540813 m!519465))

(declare-fun m!519469 () Bool)

(assert (=> b!540813 m!519469))

(assert (=> b!540811 m!519465))

(assert (=> b!540811 m!519465))

(declare-fun m!519471 () Bool)

(assert (=> b!540811 m!519471))

(declare-fun m!519473 () Bool)

(assert (=> b!540815 m!519473))

(assert (=> b!540810 m!519465))

(assert (=> b!540810 m!519465))

(declare-fun m!519475 () Bool)

(assert (=> b!540810 m!519475))

(declare-fun m!519477 () Bool)

(assert (=> b!540808 m!519477))

(declare-fun m!519479 () Bool)

(assert (=> b!540809 m!519479))

(assert (=> b!540809 m!519465))

(declare-fun m!519481 () Bool)

(assert (=> b!540814 m!519481))

(declare-fun m!519483 () Bool)

(assert (=> b!540807 m!519483))

(declare-fun m!519485 () Bool)

(assert (=> start!49098 m!519485))

(declare-fun m!519487 () Bool)

(assert (=> start!49098 m!519487))

(declare-fun m!519489 () Bool)

(assert (=> b!540812 m!519489))

(push 1)

