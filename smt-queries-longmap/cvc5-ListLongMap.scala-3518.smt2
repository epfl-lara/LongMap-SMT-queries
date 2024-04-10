; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48678 () Bool)

(assert start!48678)

(declare-fun b!534868 () Bool)

(declare-fun res!330078 () Bool)

(declare-fun e!310845 () Bool)

(assert (=> b!534868 (=> (not res!330078) (not e!310845))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534868 (= res!330078 (validKeyInArray!0 k!1998))))

(declare-fun b!534869 () Bool)

(declare-fun res!330082 () Bool)

(declare-fun e!310843 () Bool)

(assert (=> b!534869 (=> (not res!330082) (not e!310843))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33890 0))(
  ( (array!33891 (arr!16284 (Array (_ BitVec 32) (_ BitVec 64))) (size!16648 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33890)

(declare-datatypes ((SeekEntryResult!4742 0))(
  ( (MissingZero!4742 (index!21192 (_ BitVec 32))) (Found!4742 (index!21193 (_ BitVec 32))) (Intermediate!4742 (undefined!5554 Bool) (index!21194 (_ BitVec 32)) (x!50149 (_ BitVec 32))) (Undefined!4742) (MissingVacant!4742 (index!21195 (_ BitVec 32))) )
))
(declare-fun lt!245718 () SeekEntryResult!4742)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33890 (_ BitVec 32)) SeekEntryResult!4742)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534869 (= res!330082 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16284 a!3154) j!147) mask!3216) (select (arr!16284 a!3154) j!147) a!3154 mask!3216) lt!245718))))

(declare-fun b!534870 () Bool)

(declare-fun e!310842 () Bool)

(assert (=> b!534870 (= e!310845 e!310842)))

(declare-fun res!330079 () Bool)

(assert (=> b!534870 (=> (not res!330079) (not e!310842))))

(declare-fun lt!245719 () SeekEntryResult!4742)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534870 (= res!330079 (or (= lt!245719 (MissingZero!4742 i!1153)) (= lt!245719 (MissingVacant!4742 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33890 (_ BitVec 32)) SeekEntryResult!4742)

(assert (=> b!534870 (= lt!245719 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534871 () Bool)

(declare-fun res!330073 () Bool)

(assert (=> b!534871 (=> (not res!330073) (not e!310842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33890 (_ BitVec 32)) Bool)

(assert (=> b!534871 (= res!330073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534872 () Bool)

(declare-fun res!330081 () Bool)

(assert (=> b!534872 (=> (not res!330081) (not e!310842))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!534872 (= res!330081 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16648 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16648 a!3154)) (= (select (arr!16284 a!3154) resIndex!32) (select (arr!16284 a!3154) j!147))))))

(declare-fun b!534873 () Bool)

(declare-fun res!330083 () Bool)

(assert (=> b!534873 (=> (not res!330083) (not e!310842))))

(declare-datatypes ((List!10403 0))(
  ( (Nil!10400) (Cons!10399 (h!11342 (_ BitVec 64)) (t!16631 List!10403)) )
))
(declare-fun arrayNoDuplicates!0 (array!33890 (_ BitVec 32) List!10403) Bool)

(assert (=> b!534873 (= res!330083 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10400))))

(declare-fun b!534874 () Bool)

(declare-fun res!330076 () Bool)

(assert (=> b!534874 (=> (not res!330076) (not e!310845))))

(assert (=> b!534874 (= res!330076 (validKeyInArray!0 (select (arr!16284 a!3154) j!147)))))

(declare-fun res!330077 () Bool)

(assert (=> start!48678 (=> (not res!330077) (not e!310845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48678 (= res!330077 (validMask!0 mask!3216))))

(assert (=> start!48678 e!310845))

(assert (=> start!48678 true))

(declare-fun array_inv!12080 (array!33890) Bool)

(assert (=> start!48678 (array_inv!12080 a!3154)))

(declare-fun b!534875 () Bool)

(assert (=> b!534875 (= e!310842 e!310843)))

(declare-fun res!330080 () Bool)

(assert (=> b!534875 (=> (not res!330080) (not e!310843))))

(assert (=> b!534875 (= res!330080 (= lt!245718 (Intermediate!4742 false resIndex!32 resX!32)))))

(assert (=> b!534875 (= lt!245718 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16284 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534876 () Bool)

(assert (=> b!534876 (= e!310843 (and (not (= (select (arr!16284 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16284 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16284 a!3154) index!1177) (select (arr!16284 a!3154) j!147)) (= index!1177 resIndex!32) (bvslt mask!3216 #b00000000000000000000000000000000)))))

(declare-fun b!534877 () Bool)

(declare-fun res!330075 () Bool)

(assert (=> b!534877 (=> (not res!330075) (not e!310845))))

(declare-fun arrayContainsKey!0 (array!33890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534877 (= res!330075 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534878 () Bool)

(declare-fun res!330074 () Bool)

(assert (=> b!534878 (=> (not res!330074) (not e!310845))))

(assert (=> b!534878 (= res!330074 (and (= (size!16648 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16648 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16648 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48678 res!330077) b!534878))

(assert (= (and b!534878 res!330074) b!534874))

(assert (= (and b!534874 res!330076) b!534868))

(assert (= (and b!534868 res!330078) b!534877))

(assert (= (and b!534877 res!330075) b!534870))

(assert (= (and b!534870 res!330079) b!534871))

(assert (= (and b!534871 res!330073) b!534873))

(assert (= (and b!534873 res!330083) b!534872))

(assert (= (and b!534872 res!330081) b!534875))

(assert (= (and b!534875 res!330080) b!534869))

(assert (= (and b!534869 res!330082) b!534876))

(declare-fun m!514527 () Bool)

(assert (=> b!534875 m!514527))

(assert (=> b!534875 m!514527))

(declare-fun m!514529 () Bool)

(assert (=> b!534875 m!514529))

(declare-fun m!514531 () Bool)

(assert (=> b!534873 m!514531))

(assert (=> b!534874 m!514527))

(assert (=> b!534874 m!514527))

(declare-fun m!514533 () Bool)

(assert (=> b!534874 m!514533))

(declare-fun m!514535 () Bool)

(assert (=> b!534870 m!514535))

(declare-fun m!514537 () Bool)

(assert (=> b!534872 m!514537))

(assert (=> b!534872 m!514527))

(declare-fun m!514539 () Bool)

(assert (=> b!534868 m!514539))

(declare-fun m!514541 () Bool)

(assert (=> b!534876 m!514541))

(assert (=> b!534876 m!514527))

(declare-fun m!514543 () Bool)

(assert (=> b!534871 m!514543))

(declare-fun m!514545 () Bool)

(assert (=> start!48678 m!514545))

(declare-fun m!514547 () Bool)

(assert (=> start!48678 m!514547))

(declare-fun m!514549 () Bool)

(assert (=> b!534877 m!514549))

(assert (=> b!534869 m!514527))

(assert (=> b!534869 m!514527))

(declare-fun m!514551 () Bool)

(assert (=> b!534869 m!514551))

(assert (=> b!534869 m!514551))

(assert (=> b!534869 m!514527))

(declare-fun m!514553 () Bool)

(assert (=> b!534869 m!514553))

(push 1)

