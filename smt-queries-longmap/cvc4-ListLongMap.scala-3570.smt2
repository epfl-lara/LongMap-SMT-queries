; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49102 () Bool)

(assert start!49102)

(declare-fun b!540866 () Bool)

(declare-fun res!335754 () Bool)

(declare-fun e!313292 () Bool)

(assert (=> b!540866 (=> (not res!335754) (not e!313292))))

(declare-datatypes ((array!34212 0))(
  ( (array!34213 (arr!16442 (Array (_ BitVec 32) (_ BitVec 64))) (size!16806 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34212)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540866 (= res!335754 (validKeyInArray!0 (select (arr!16442 a!3154) j!147)))))

(declare-fun b!540868 () Bool)

(declare-fun res!335760 () Bool)

(assert (=> b!540868 (=> (not res!335760) (not e!313292))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540868 (= res!335760 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540869 () Bool)

(declare-fun e!313293 () Bool)

(assert (=> b!540869 (= e!313293 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4900 0))(
  ( (MissingZero!4900 (index!21824 (_ BitVec 32))) (Found!4900 (index!21825 (_ BitVec 32))) (Intermediate!4900 (undefined!5712 Bool) (index!21826 (_ BitVec 32)) (x!50735 (_ BitVec 32))) (Undefined!4900) (MissingVacant!4900 (index!21827 (_ BitVec 32))) )
))
(declare-fun lt!247506 () SeekEntryResult!4900)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34212 (_ BitVec 32)) SeekEntryResult!4900)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540869 (= lt!247506 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16442 a!3154) j!147) mask!3216) (select (arr!16442 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540870 () Bool)

(declare-fun res!335758 () Bool)

(assert (=> b!540870 (=> (not res!335758) (not e!313293))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!540870 (= res!335758 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16442 a!3154) j!147) a!3154 mask!3216) (Intermediate!4900 false resIndex!32 resX!32)))))

(declare-fun b!540871 () Bool)

(declare-fun res!335755 () Bool)

(assert (=> b!540871 (=> (not res!335755) (not e!313292))))

(assert (=> b!540871 (= res!335755 (validKeyInArray!0 k!1998))))

(declare-fun b!540872 () Bool)

(declare-fun res!335761 () Bool)

(assert (=> b!540872 (=> (not res!335761) (not e!313293))))

(declare-datatypes ((List!10561 0))(
  ( (Nil!10558) (Cons!10557 (h!11506 (_ BitVec 64)) (t!16789 List!10561)) )
))
(declare-fun arrayNoDuplicates!0 (array!34212 (_ BitVec 32) List!10561) Bool)

(assert (=> b!540872 (= res!335761 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10558))))

(declare-fun b!540873 () Bool)

(declare-fun res!335759 () Bool)

(assert (=> b!540873 (=> (not res!335759) (not e!313293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34212 (_ BitVec 32)) Bool)

(assert (=> b!540873 (= res!335759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540867 () Bool)

(declare-fun res!335762 () Bool)

(assert (=> b!540867 (=> (not res!335762) (not e!313292))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540867 (= res!335762 (and (= (size!16806 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16806 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16806 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!335753 () Bool)

(assert (=> start!49102 (=> (not res!335753) (not e!313292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49102 (= res!335753 (validMask!0 mask!3216))))

(assert (=> start!49102 e!313292))

(assert (=> start!49102 true))

(declare-fun array_inv!12238 (array!34212) Bool)

(assert (=> start!49102 (array_inv!12238 a!3154)))

(declare-fun b!540874 () Bool)

(assert (=> b!540874 (= e!313292 e!313293)))

(declare-fun res!335756 () Bool)

(assert (=> b!540874 (=> (not res!335756) (not e!313293))))

(declare-fun lt!247507 () SeekEntryResult!4900)

(assert (=> b!540874 (= res!335756 (or (= lt!247507 (MissingZero!4900 i!1153)) (= lt!247507 (MissingVacant!4900 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34212 (_ BitVec 32)) SeekEntryResult!4900)

(assert (=> b!540874 (= lt!247507 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!540875 () Bool)

(declare-fun res!335757 () Bool)

(assert (=> b!540875 (=> (not res!335757) (not e!313293))))

(assert (=> b!540875 (= res!335757 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16806 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16806 a!3154)) (= (select (arr!16442 a!3154) resIndex!32) (select (arr!16442 a!3154) j!147))))))

(assert (= (and start!49102 res!335753) b!540867))

(assert (= (and b!540867 res!335762) b!540866))

(assert (= (and b!540866 res!335754) b!540871))

(assert (= (and b!540871 res!335755) b!540868))

(assert (= (and b!540868 res!335760) b!540874))

(assert (= (and b!540874 res!335756) b!540873))

(assert (= (and b!540873 res!335759) b!540872))

(assert (= (and b!540872 res!335761) b!540875))

(assert (= (and b!540875 res!335757) b!540870))

(assert (= (and b!540870 res!335758) b!540869))

(declare-fun m!519517 () Bool)

(assert (=> b!540871 m!519517))

(declare-fun m!519519 () Bool)

(assert (=> b!540874 m!519519))

(declare-fun m!519521 () Bool)

(assert (=> b!540870 m!519521))

(assert (=> b!540870 m!519521))

(declare-fun m!519523 () Bool)

(assert (=> b!540870 m!519523))

(declare-fun m!519525 () Bool)

(assert (=> start!49102 m!519525))

(declare-fun m!519527 () Bool)

(assert (=> start!49102 m!519527))

(declare-fun m!519529 () Bool)

(assert (=> b!540872 m!519529))

(declare-fun m!519531 () Bool)

(assert (=> b!540873 m!519531))

(declare-fun m!519533 () Bool)

(assert (=> b!540868 m!519533))

(assert (=> b!540866 m!519521))

(assert (=> b!540866 m!519521))

(declare-fun m!519535 () Bool)

(assert (=> b!540866 m!519535))

(declare-fun m!519537 () Bool)

(assert (=> b!540875 m!519537))

(assert (=> b!540875 m!519521))

(assert (=> b!540869 m!519521))

(assert (=> b!540869 m!519521))

(declare-fun m!519539 () Bool)

(assert (=> b!540869 m!519539))

(assert (=> b!540869 m!519539))

(assert (=> b!540869 m!519521))

(declare-fun m!519541 () Bool)

(assert (=> b!540869 m!519541))

(push 1)

(assert (not b!540870))

(assert (not b!540866))

(assert (not b!540872))

(assert (not b!540873))

(assert (not b!540868))

(assert (not start!49102))

(assert (not b!540869))

(assert (not b!540871))

(assert (not b!540874))

(check-sat)

