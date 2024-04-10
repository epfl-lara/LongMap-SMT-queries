; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49116 () Bool)

(assert start!49116)

(declare-fun b!541076 () Bool)

(declare-fun res!335969 () Bool)

(declare-fun e!313355 () Bool)

(assert (=> b!541076 (=> (not res!335969) (not e!313355))))

(declare-datatypes ((array!34226 0))(
  ( (array!34227 (arr!16449 (Array (_ BitVec 32) (_ BitVec 64))) (size!16813 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34226)

(declare-datatypes ((List!10568 0))(
  ( (Nil!10565) (Cons!10564 (h!11513 (_ BitVec 64)) (t!16796 List!10568)) )
))
(declare-fun arrayNoDuplicates!0 (array!34226 (_ BitVec 32) List!10568) Bool)

(assert (=> b!541076 (= res!335969 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10565))))

(declare-fun b!541077 () Bool)

(declare-fun res!335970 () Bool)

(declare-fun e!313354 () Bool)

(assert (=> b!541077 (=> (not res!335970) (not e!313354))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541077 (= res!335970 (and (= (size!16813 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16813 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16813 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541078 () Bool)

(declare-fun res!335966 () Bool)

(assert (=> b!541078 (=> (not res!335966) (not e!313354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541078 (= res!335966 (validKeyInArray!0 (select (arr!16449 a!3154) j!147)))))

(declare-fun b!541079 () Bool)

(declare-fun res!335971 () Bool)

(assert (=> b!541079 (=> (not res!335971) (not e!313354))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!541079 (= res!335971 (validKeyInArray!0 k!1998))))

(declare-fun b!541080 () Bool)

(declare-fun res!335972 () Bool)

(assert (=> b!541080 (=> (not res!335972) (not e!313355))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4907 0))(
  ( (MissingZero!4907 (index!21852 (_ BitVec 32))) (Found!4907 (index!21853 (_ BitVec 32))) (Intermediate!4907 (undefined!5719 Bool) (index!21854 (_ BitVec 32)) (x!50766 (_ BitVec 32))) (Undefined!4907) (MissingVacant!4907 (index!21855 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34226 (_ BitVec 32)) SeekEntryResult!4907)

(assert (=> b!541080 (= res!335972 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16449 a!3154) j!147) a!3154 mask!3216) (Intermediate!4907 false resIndex!32 resX!32)))))

(declare-fun b!541081 () Bool)

(declare-fun res!335967 () Bool)

(assert (=> b!541081 (=> (not res!335967) (not e!313354))))

(declare-fun arrayContainsKey!0 (array!34226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541081 (= res!335967 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541082 () Bool)

(declare-fun res!335965 () Bool)

(assert (=> b!541082 (=> (not res!335965) (not e!313355))))

(assert (=> b!541082 (= res!335965 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16813 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16813 a!3154)) (= (select (arr!16449 a!3154) resIndex!32) (select (arr!16449 a!3154) j!147))))))

(declare-fun res!335964 () Bool)

(assert (=> start!49116 (=> (not res!335964) (not e!313354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49116 (= res!335964 (validMask!0 mask!3216))))

(assert (=> start!49116 e!313354))

(assert (=> start!49116 true))

(declare-fun array_inv!12245 (array!34226) Bool)

(assert (=> start!49116 (array_inv!12245 a!3154)))

(declare-fun b!541083 () Bool)

(assert (=> b!541083 (= e!313354 e!313355)))

(declare-fun res!335963 () Bool)

(assert (=> b!541083 (=> (not res!335963) (not e!313355))))

(declare-fun lt!247549 () SeekEntryResult!4907)

(assert (=> b!541083 (= res!335963 (or (= lt!247549 (MissingZero!4907 i!1153)) (= lt!247549 (MissingVacant!4907 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34226 (_ BitVec 32)) SeekEntryResult!4907)

(assert (=> b!541083 (= lt!247549 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!541084 () Bool)

(assert (=> b!541084 (= e!313355 false)))

(declare-fun lt!247548 () SeekEntryResult!4907)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541084 (= lt!247548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16449 a!3154) j!147) mask!3216) (select (arr!16449 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541085 () Bool)

(declare-fun res!335968 () Bool)

(assert (=> b!541085 (=> (not res!335968) (not e!313355))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34226 (_ BitVec 32)) Bool)

(assert (=> b!541085 (= res!335968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49116 res!335964) b!541077))

(assert (= (and b!541077 res!335970) b!541078))

(assert (= (and b!541078 res!335966) b!541079))

(assert (= (and b!541079 res!335971) b!541081))

(assert (= (and b!541081 res!335967) b!541083))

(assert (= (and b!541083 res!335963) b!541085))

(assert (= (and b!541085 res!335968) b!541076))

(assert (= (and b!541076 res!335969) b!541082))

(assert (= (and b!541082 res!335965) b!541080))

(assert (= (and b!541080 res!335972) b!541084))

(declare-fun m!519699 () Bool)

(assert (=> b!541079 m!519699))

(declare-fun m!519701 () Bool)

(assert (=> b!541083 m!519701))

(declare-fun m!519703 () Bool)

(assert (=> b!541082 m!519703))

(declare-fun m!519705 () Bool)

(assert (=> b!541082 m!519705))

(declare-fun m!519707 () Bool)

(assert (=> b!541076 m!519707))

(declare-fun m!519709 () Bool)

(assert (=> start!49116 m!519709))

(declare-fun m!519711 () Bool)

(assert (=> start!49116 m!519711))

(assert (=> b!541078 m!519705))

(assert (=> b!541078 m!519705))

(declare-fun m!519713 () Bool)

(assert (=> b!541078 m!519713))

(declare-fun m!519715 () Bool)

(assert (=> b!541085 m!519715))

(declare-fun m!519717 () Bool)

(assert (=> b!541081 m!519717))

(assert (=> b!541080 m!519705))

(assert (=> b!541080 m!519705))

(declare-fun m!519719 () Bool)

(assert (=> b!541080 m!519719))

(assert (=> b!541084 m!519705))

(assert (=> b!541084 m!519705))

(declare-fun m!519721 () Bool)

(assert (=> b!541084 m!519721))

(assert (=> b!541084 m!519721))

(assert (=> b!541084 m!519705))

(declare-fun m!519723 () Bool)

(assert (=> b!541084 m!519723))

(push 1)

