; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49124 () Bool)

(assert start!49124)

(declare-fun b!541196 () Bool)

(declare-fun res!336092 () Bool)

(declare-fun e!313390 () Bool)

(assert (=> b!541196 (=> (not res!336092) (not e!313390))))

(declare-datatypes ((array!34234 0))(
  ( (array!34235 (arr!16453 (Array (_ BitVec 32) (_ BitVec 64))) (size!16817 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34234)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541196 (= res!336092 (validKeyInArray!0 (select (arr!16453 a!3154) j!147)))))

(declare-fun b!541197 () Bool)

(declare-fun res!336087 () Bool)

(declare-fun e!313392 () Bool)

(assert (=> b!541197 (=> (not res!336087) (not e!313392))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4911 0))(
  ( (MissingZero!4911 (index!21868 (_ BitVec 32))) (Found!4911 (index!21869 (_ BitVec 32))) (Intermediate!4911 (undefined!5723 Bool) (index!21870 (_ BitVec 32)) (x!50778 (_ BitVec 32))) (Undefined!4911) (MissingVacant!4911 (index!21871 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34234 (_ BitVec 32)) SeekEntryResult!4911)

(assert (=> b!541197 (= res!336087 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16453 a!3154) j!147) a!3154 mask!3216) (Intermediate!4911 false resIndex!32 resX!32)))))

(declare-fun b!541198 () Bool)

(assert (=> b!541198 (= e!313392 false)))

(declare-fun lt!247573 () SeekEntryResult!4911)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541198 (= lt!247573 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16453 a!3154) j!147) mask!3216) (select (arr!16453 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541199 () Bool)

(declare-fun res!336086 () Bool)

(assert (=> b!541199 (=> (not res!336086) (not e!313390))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!541199 (= res!336086 (validKeyInArray!0 k0!1998))))

(declare-fun b!541200 () Bool)

(declare-fun res!336083 () Bool)

(assert (=> b!541200 (=> (not res!336083) (not e!313392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34234 (_ BitVec 32)) Bool)

(assert (=> b!541200 (= res!336083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541201 () Bool)

(declare-fun res!336088 () Bool)

(assert (=> b!541201 (=> (not res!336088) (not e!313392))))

(declare-datatypes ((List!10572 0))(
  ( (Nil!10569) (Cons!10568 (h!11517 (_ BitVec 64)) (t!16800 List!10572)) )
))
(declare-fun arrayNoDuplicates!0 (array!34234 (_ BitVec 32) List!10572) Bool)

(assert (=> b!541201 (= res!336088 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10569))))

(declare-fun b!541202 () Bool)

(declare-fun res!336091 () Bool)

(assert (=> b!541202 (=> (not res!336091) (not e!313392))))

(assert (=> b!541202 (= res!336091 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16817 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16817 a!3154)) (= (select (arr!16453 a!3154) resIndex!32) (select (arr!16453 a!3154) j!147))))))

(declare-fun b!541204 () Bool)

(declare-fun res!336084 () Bool)

(assert (=> b!541204 (=> (not res!336084) (not e!313390))))

(declare-fun arrayContainsKey!0 (array!34234 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541204 (= res!336084 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541205 () Bool)

(declare-fun res!336090 () Bool)

(assert (=> b!541205 (=> (not res!336090) (not e!313390))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541205 (= res!336090 (and (= (size!16817 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16817 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16817 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541203 () Bool)

(assert (=> b!541203 (= e!313390 e!313392)))

(declare-fun res!336089 () Bool)

(assert (=> b!541203 (=> (not res!336089) (not e!313392))))

(declare-fun lt!247572 () SeekEntryResult!4911)

(assert (=> b!541203 (= res!336089 (or (= lt!247572 (MissingZero!4911 i!1153)) (= lt!247572 (MissingVacant!4911 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34234 (_ BitVec 32)) SeekEntryResult!4911)

(assert (=> b!541203 (= lt!247572 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!336085 () Bool)

(assert (=> start!49124 (=> (not res!336085) (not e!313390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49124 (= res!336085 (validMask!0 mask!3216))))

(assert (=> start!49124 e!313390))

(assert (=> start!49124 true))

(declare-fun array_inv!12249 (array!34234) Bool)

(assert (=> start!49124 (array_inv!12249 a!3154)))

(assert (= (and start!49124 res!336085) b!541205))

(assert (= (and b!541205 res!336090) b!541196))

(assert (= (and b!541196 res!336092) b!541199))

(assert (= (and b!541199 res!336086) b!541204))

(assert (= (and b!541204 res!336084) b!541203))

(assert (= (and b!541203 res!336089) b!541200))

(assert (= (and b!541200 res!336083) b!541201))

(assert (= (and b!541201 res!336088) b!541202))

(assert (= (and b!541202 res!336091) b!541197))

(assert (= (and b!541197 res!336087) b!541198))

(declare-fun m!519803 () Bool)

(assert (=> b!541204 m!519803))

(declare-fun m!519805 () Bool)

(assert (=> start!49124 m!519805))

(declare-fun m!519807 () Bool)

(assert (=> start!49124 m!519807))

(declare-fun m!519809 () Bool)

(assert (=> b!541198 m!519809))

(assert (=> b!541198 m!519809))

(declare-fun m!519811 () Bool)

(assert (=> b!541198 m!519811))

(assert (=> b!541198 m!519811))

(assert (=> b!541198 m!519809))

(declare-fun m!519813 () Bool)

(assert (=> b!541198 m!519813))

(declare-fun m!519815 () Bool)

(assert (=> b!541201 m!519815))

(declare-fun m!519817 () Bool)

(assert (=> b!541203 m!519817))

(declare-fun m!519819 () Bool)

(assert (=> b!541199 m!519819))

(declare-fun m!519821 () Bool)

(assert (=> b!541200 m!519821))

(declare-fun m!519823 () Bool)

(assert (=> b!541202 m!519823))

(assert (=> b!541202 m!519809))

(assert (=> b!541197 m!519809))

(assert (=> b!541197 m!519809))

(declare-fun m!519825 () Bool)

(assert (=> b!541197 m!519825))

(assert (=> b!541196 m!519809))

(assert (=> b!541196 m!519809))

(declare-fun m!519827 () Bool)

(assert (=> b!541196 m!519827))

(check-sat (not b!541199) (not b!541201) (not b!541197) (not b!541196) (not b!541200) (not b!541203) (not b!541204) (not b!541198) (not start!49124))
(check-sat)
