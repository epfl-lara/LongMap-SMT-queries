; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49300 () Bool)

(assert start!49300)

(declare-fun b!542898 () Bool)

(declare-fun res!337452 () Bool)

(declare-fun e!314120 () Bool)

(assert (=> b!542898 (=> (not res!337452) (not e!314120))))

(declare-datatypes ((array!34308 0))(
  ( (array!34309 (arr!16487 (Array (_ BitVec 32) (_ BitVec 64))) (size!16851 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34308)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542898 (= res!337452 (validKeyInArray!0 (select (arr!16487 a!3154) j!147)))))

(declare-fun b!542899 () Bool)

(declare-fun res!337455 () Bool)

(declare-fun e!314118 () Bool)

(assert (=> b!542899 (=> (not res!337455) (not e!314118))))

(declare-datatypes ((List!10606 0))(
  ( (Nil!10603) (Cons!10602 (h!11557 (_ BitVec 64)) (t!16834 List!10606)) )
))
(declare-fun arrayNoDuplicates!0 (array!34308 (_ BitVec 32) List!10606) Bool)

(assert (=> b!542899 (= res!337455 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10603))))

(declare-fun b!542900 () Bool)

(declare-fun e!314121 () Bool)

(assert (=> b!542900 (= e!314118 e!314121)))

(declare-fun res!337450 () Bool)

(assert (=> b!542900 (=> (not res!337450) (not e!314121))))

(declare-datatypes ((SeekEntryResult!4945 0))(
  ( (MissingZero!4945 (index!22004 (_ BitVec 32))) (Found!4945 (index!22005 (_ BitVec 32))) (Intermediate!4945 (undefined!5757 Bool) (index!22006 (_ BitVec 32)) (x!50912 (_ BitVec 32))) (Undefined!4945) (MissingVacant!4945 (index!22007 (_ BitVec 32))) )
))
(declare-fun lt!248038 () SeekEntryResult!4945)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542900 (= res!337450 (= lt!248038 (Intermediate!4945 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34308 (_ BitVec 32)) SeekEntryResult!4945)

(assert (=> b!542900 (= lt!248038 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16487 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542901 () Bool)

(declare-fun res!337457 () Bool)

(assert (=> b!542901 (=> (not res!337457) (not e!314121))))

(assert (=> b!542901 (= res!337457 (and (not (= (select (arr!16487 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16487 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16487 a!3154) index!1177) (select (arr!16487 a!3154) j!147)))))))

(declare-fun b!542902 () Bool)

(declare-fun res!337460 () Bool)

(assert (=> b!542902 (=> (not res!337460) (not e!314121))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542902 (= res!337460 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16487 a!3154) j!147) mask!3216) (select (arr!16487 a!3154) j!147) a!3154 mask!3216) lt!248038))))

(declare-fun b!542903 () Bool)

(assert (=> b!542903 (= e!314120 e!314118)))

(declare-fun res!337459 () Bool)

(assert (=> b!542903 (=> (not res!337459) (not e!314118))))

(declare-fun lt!248036 () SeekEntryResult!4945)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542903 (= res!337459 (or (= lt!248036 (MissingZero!4945 i!1153)) (= lt!248036 (MissingVacant!4945 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34308 (_ BitVec 32)) SeekEntryResult!4945)

(assert (=> b!542903 (= lt!248036 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!337449 () Bool)

(assert (=> start!49300 (=> (not res!337449) (not e!314120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49300 (= res!337449 (validMask!0 mask!3216))))

(assert (=> start!49300 e!314120))

(assert (=> start!49300 true))

(declare-fun array_inv!12283 (array!34308) Bool)

(assert (=> start!49300 (array_inv!12283 a!3154)))

(declare-fun b!542904 () Bool)

(declare-fun res!337453 () Bool)

(assert (=> b!542904 (=> (not res!337453) (not e!314118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34308 (_ BitVec 32)) Bool)

(assert (=> b!542904 (= res!337453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542905 () Bool)

(declare-fun res!337451 () Bool)

(assert (=> b!542905 (=> (not res!337451) (not e!314120))))

(assert (=> b!542905 (= res!337451 (validKeyInArray!0 k!1998))))

(declare-fun b!542906 () Bool)

(assert (=> b!542906 (= e!314121 false)))

(declare-fun lt!248037 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542906 (= lt!248037 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542907 () Bool)

(declare-fun res!337454 () Bool)

(assert (=> b!542907 (=> (not res!337454) (not e!314118))))

(assert (=> b!542907 (= res!337454 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16851 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16851 a!3154)) (= (select (arr!16487 a!3154) resIndex!32) (select (arr!16487 a!3154) j!147))))))

(declare-fun b!542908 () Bool)

(declare-fun res!337456 () Bool)

(assert (=> b!542908 (=> (not res!337456) (not e!314120))))

(declare-fun arrayContainsKey!0 (array!34308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542908 (= res!337456 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542909 () Bool)

(declare-fun res!337458 () Bool)

(assert (=> b!542909 (=> (not res!337458) (not e!314120))))

(assert (=> b!542909 (= res!337458 (and (= (size!16851 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16851 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16851 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49300 res!337449) b!542909))

(assert (= (and b!542909 res!337458) b!542898))

(assert (= (and b!542898 res!337452) b!542905))

(assert (= (and b!542905 res!337451) b!542908))

(assert (= (and b!542908 res!337456) b!542903))

(assert (= (and b!542903 res!337459) b!542904))

(assert (= (and b!542904 res!337453) b!542899))

(assert (= (and b!542899 res!337455) b!542907))

(assert (= (and b!542907 res!337454) b!542900))

(assert (= (and b!542900 res!337450) b!542902))

(assert (= (and b!542902 res!337460) b!542901))

(assert (= (and b!542901 res!337457) b!542906))

(declare-fun m!521079 () Bool)

(assert (=> b!542898 m!521079))

(assert (=> b!542898 m!521079))

(declare-fun m!521081 () Bool)

(assert (=> b!542898 m!521081))

(declare-fun m!521083 () Bool)

(assert (=> b!542899 m!521083))

(declare-fun m!521085 () Bool)

(assert (=> b!542903 m!521085))

(declare-fun m!521087 () Bool)

(assert (=> b!542906 m!521087))

(declare-fun m!521089 () Bool)

(assert (=> start!49300 m!521089))

(declare-fun m!521091 () Bool)

(assert (=> start!49300 m!521091))

(declare-fun m!521093 () Bool)

(assert (=> b!542908 m!521093))

(declare-fun m!521095 () Bool)

(assert (=> b!542901 m!521095))

(assert (=> b!542901 m!521079))

(declare-fun m!521097 () Bool)

(assert (=> b!542905 m!521097))

(assert (=> b!542902 m!521079))

(assert (=> b!542902 m!521079))

(declare-fun m!521099 () Bool)

(assert (=> b!542902 m!521099))

(assert (=> b!542902 m!521099))

(assert (=> b!542902 m!521079))

(declare-fun m!521101 () Bool)

(assert (=> b!542902 m!521101))

(declare-fun m!521103 () Bool)

(assert (=> b!542907 m!521103))

(assert (=> b!542907 m!521079))

(assert (=> b!542900 m!521079))

(assert (=> b!542900 m!521079))

(declare-fun m!521105 () Bool)

(assert (=> b!542900 m!521105))

(declare-fun m!521107 () Bool)

(assert (=> b!542904 m!521107))

(push 1)

(assert (not b!542898))

(assert (not b!542904))

(assert (not b!542902))

(assert (not b!542900))

(assert (not b!542899))

