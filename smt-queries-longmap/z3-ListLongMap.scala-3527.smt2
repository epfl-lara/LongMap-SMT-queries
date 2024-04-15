; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48720 () Bool)

(assert start!48720)

(declare-fun res!330834 () Bool)

(declare-fun e!310979 () Bool)

(assert (=> start!48720 (=> (not res!330834) (not e!310979))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48720 (= res!330834 (validMask!0 mask!3216))))

(assert (=> start!48720 e!310979))

(assert (=> start!48720 true))

(declare-datatypes ((array!33942 0))(
  ( (array!33943 (arr!16310 (Array (_ BitVec 32) (_ BitVec 64))) (size!16675 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33942)

(declare-fun array_inv!12193 (array!33942) Bool)

(assert (=> start!48720 (array_inv!12193 a!3154)))

(declare-fun b!535483 () Bool)

(declare-fun res!330830 () Bool)

(declare-fun e!310980 () Bool)

(assert (=> b!535483 (=> (not res!330830) (not e!310980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33942 (_ BitVec 32)) Bool)

(assert (=> b!535483 (= res!330830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535484 () Bool)

(declare-fun res!330836 () Bool)

(assert (=> b!535484 (=> (not res!330836) (not e!310979))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535484 (= res!330836 (validKeyInArray!0 (select (arr!16310 a!3154) j!147)))))

(declare-fun b!535485 () Bool)

(declare-fun res!330837 () Bool)

(assert (=> b!535485 (=> (not res!330837) (not e!310979))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535485 (= res!330837 (and (= (size!16675 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16675 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16675 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535486 () Bool)

(declare-fun res!330841 () Bool)

(assert (=> b!535486 (=> (not res!330841) (not e!310980))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535486 (= res!330841 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16675 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16675 a!3154)) (= (select (arr!16310 a!3154) resIndex!32) (select (arr!16310 a!3154) j!147))))))

(declare-fun b!535487 () Bool)

(declare-fun res!330839 () Bool)

(assert (=> b!535487 (=> (not res!330839) (not e!310979))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!535487 (= res!330839 (validKeyInArray!0 k0!1998))))

(declare-fun b!535488 () Bool)

(declare-fun res!330840 () Bool)

(declare-fun e!310978 () Bool)

(assert (=> b!535488 (=> (not res!330840) (not e!310978))))

(assert (=> b!535488 (= res!330840 (and (not (= (select (arr!16310 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16310 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16310 a!3154) index!1177) (select (arr!16310 a!3154) j!147)))))))

(declare-fun b!535489 () Bool)

(assert (=> b!535489 (= e!310980 e!310978)))

(declare-fun res!330842 () Bool)

(assert (=> b!535489 (=> (not res!330842) (not e!310978))))

(declare-datatypes ((SeekEntryResult!4765 0))(
  ( (MissingZero!4765 (index!21284 (_ BitVec 32))) (Found!4765 (index!21285 (_ BitVec 32))) (Intermediate!4765 (undefined!5577 Bool) (index!21286 (_ BitVec 32)) (x!50239 (_ BitVec 32))) (Undefined!4765) (MissingVacant!4765 (index!21287 (_ BitVec 32))) )
))
(declare-fun lt!245650 () SeekEntryResult!4765)

(assert (=> b!535489 (= res!330842 (= lt!245650 (Intermediate!4765 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33942 (_ BitVec 32)) SeekEntryResult!4765)

(assert (=> b!535489 (= lt!245650 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16310 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535490 () Bool)

(declare-fun res!330838 () Bool)

(assert (=> b!535490 (=> (not res!330838) (not e!310980))))

(declare-datatypes ((List!10468 0))(
  ( (Nil!10465) (Cons!10464 (h!11407 (_ BitVec 64)) (t!16687 List!10468)) )
))
(declare-fun arrayNoDuplicates!0 (array!33942 (_ BitVec 32) List!10468) Bool)

(assert (=> b!535490 (= res!330838 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10465))))

(declare-fun b!535491 () Bool)

(declare-fun res!330831 () Bool)

(assert (=> b!535491 (=> (not res!330831) (not e!310979))))

(declare-fun arrayContainsKey!0 (array!33942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535491 (= res!330831 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535492 () Bool)

(assert (=> b!535492 (= e!310979 e!310980)))

(declare-fun res!330835 () Bool)

(assert (=> b!535492 (=> (not res!330835) (not e!310980))))

(declare-fun lt!245652 () SeekEntryResult!4765)

(assert (=> b!535492 (= res!330835 (or (= lt!245652 (MissingZero!4765 i!1153)) (= lt!245652 (MissingVacant!4765 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33942 (_ BitVec 32)) SeekEntryResult!4765)

(assert (=> b!535492 (= lt!245652 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535493 () Bool)

(declare-fun e!310976 () Bool)

(assert (=> b!535493 (= e!310976 false)))

(declare-fun lt!245651 () SeekEntryResult!4765)

(declare-fun lt!245653 () (_ BitVec 32))

(assert (=> b!535493 (= lt!245651 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245653 (select (arr!16310 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535494 () Bool)

(assert (=> b!535494 (= e!310978 e!310976)))

(declare-fun res!330832 () Bool)

(assert (=> b!535494 (=> (not res!330832) (not e!310976))))

(assert (=> b!535494 (= res!330832 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245653 #b00000000000000000000000000000000) (bvslt lt!245653 (size!16675 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535494 (= lt!245653 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!535495 () Bool)

(declare-fun res!330833 () Bool)

(assert (=> b!535495 (=> (not res!330833) (not e!310978))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535495 (= res!330833 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16310 a!3154) j!147) mask!3216) (select (arr!16310 a!3154) j!147) a!3154 mask!3216) lt!245650))))

(assert (= (and start!48720 res!330834) b!535485))

(assert (= (and b!535485 res!330837) b!535484))

(assert (= (and b!535484 res!330836) b!535487))

(assert (= (and b!535487 res!330839) b!535491))

(assert (= (and b!535491 res!330831) b!535492))

(assert (= (and b!535492 res!330835) b!535483))

(assert (= (and b!535483 res!330830) b!535490))

(assert (= (and b!535490 res!330838) b!535486))

(assert (= (and b!535486 res!330841) b!535489))

(assert (= (and b!535489 res!330842) b!535495))

(assert (= (and b!535495 res!330833) b!535488))

(assert (= (and b!535488 res!330840) b!535494))

(assert (= (and b!535494 res!330832) b!535493))

(declare-fun m!514537 () Bool)

(assert (=> start!48720 m!514537))

(declare-fun m!514539 () Bool)

(assert (=> start!48720 m!514539))

(declare-fun m!514541 () Bool)

(assert (=> b!535491 m!514541))

(declare-fun m!514543 () Bool)

(assert (=> b!535483 m!514543))

(declare-fun m!514545 () Bool)

(assert (=> b!535484 m!514545))

(assert (=> b!535484 m!514545))

(declare-fun m!514547 () Bool)

(assert (=> b!535484 m!514547))

(declare-fun m!514549 () Bool)

(assert (=> b!535488 m!514549))

(assert (=> b!535488 m!514545))

(declare-fun m!514551 () Bool)

(assert (=> b!535487 m!514551))

(declare-fun m!514553 () Bool)

(assert (=> b!535492 m!514553))

(declare-fun m!514555 () Bool)

(assert (=> b!535494 m!514555))

(assert (=> b!535493 m!514545))

(assert (=> b!535493 m!514545))

(declare-fun m!514557 () Bool)

(assert (=> b!535493 m!514557))

(assert (=> b!535495 m!514545))

(assert (=> b!535495 m!514545))

(declare-fun m!514559 () Bool)

(assert (=> b!535495 m!514559))

(assert (=> b!535495 m!514559))

(assert (=> b!535495 m!514545))

(declare-fun m!514561 () Bool)

(assert (=> b!535495 m!514561))

(assert (=> b!535489 m!514545))

(assert (=> b!535489 m!514545))

(declare-fun m!514563 () Bool)

(assert (=> b!535489 m!514563))

(declare-fun m!514565 () Bool)

(assert (=> b!535486 m!514565))

(assert (=> b!535486 m!514545))

(declare-fun m!514567 () Bool)

(assert (=> b!535490 m!514567))

(check-sat (not b!535491) (not b!535490) (not b!535495) (not start!48720) (not b!535494) (not b!535484) (not b!535493) (not b!535487) (not b!535483) (not b!535492) (not b!535489))
(check-sat)
