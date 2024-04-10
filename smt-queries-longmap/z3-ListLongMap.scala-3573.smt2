; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49118 () Bool)

(assert start!49118)

(declare-fun b!541106 () Bool)

(declare-fun res!335996 () Bool)

(declare-fun e!313363 () Bool)

(assert (=> b!541106 (=> (not res!335996) (not e!313363))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541106 (= res!335996 (validKeyInArray!0 k0!1998))))

(declare-fun b!541107 () Bool)

(declare-fun res!335995 () Bool)

(declare-fun e!313365 () Bool)

(assert (=> b!541107 (=> (not res!335995) (not e!313365))))

(declare-datatypes ((array!34228 0))(
  ( (array!34229 (arr!16450 (Array (_ BitVec 32) (_ BitVec 64))) (size!16814 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34228)

(declare-datatypes ((List!10569 0))(
  ( (Nil!10566) (Cons!10565 (h!11514 (_ BitVec 64)) (t!16797 List!10569)) )
))
(declare-fun arrayNoDuplicates!0 (array!34228 (_ BitVec 32) List!10569) Bool)

(assert (=> b!541107 (= res!335995 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10566))))

(declare-fun b!541108 () Bool)

(declare-fun res!335997 () Bool)

(assert (=> b!541108 (=> (not res!335997) (not e!313365))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34228 (_ BitVec 32)) Bool)

(assert (=> b!541108 (= res!335997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541109 () Bool)

(declare-fun res!335999 () Bool)

(assert (=> b!541109 (=> (not res!335999) (not e!313365))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!541109 (= res!335999 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16814 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16814 a!3154)) (= (select (arr!16450 a!3154) resIndex!32) (select (arr!16450 a!3154) j!147))))))

(declare-fun b!541110 () Bool)

(declare-fun res!336002 () Bool)

(assert (=> b!541110 (=> (not res!336002) (not e!313363))))

(assert (=> b!541110 (= res!336002 (validKeyInArray!0 (select (arr!16450 a!3154) j!147)))))

(declare-fun b!541111 () Bool)

(declare-fun res!335998 () Bool)

(assert (=> b!541111 (=> (not res!335998) (not e!313365))))

(declare-datatypes ((SeekEntryResult!4908 0))(
  ( (MissingZero!4908 (index!21856 (_ BitVec 32))) (Found!4908 (index!21857 (_ BitVec 32))) (Intermediate!4908 (undefined!5720 Bool) (index!21858 (_ BitVec 32)) (x!50767 (_ BitVec 32))) (Undefined!4908) (MissingVacant!4908 (index!21859 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34228 (_ BitVec 32)) SeekEntryResult!4908)

(assert (=> b!541111 (= res!335998 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16450 a!3154) j!147) a!3154 mask!3216) (Intermediate!4908 false resIndex!32 resX!32)))))

(declare-fun b!541112 () Bool)

(assert (=> b!541112 (= e!313363 e!313365)))

(declare-fun res!335993 () Bool)

(assert (=> b!541112 (=> (not res!335993) (not e!313365))))

(declare-fun lt!247555 () SeekEntryResult!4908)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541112 (= res!335993 (or (= lt!247555 (MissingZero!4908 i!1153)) (= lt!247555 (MissingVacant!4908 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34228 (_ BitVec 32)) SeekEntryResult!4908)

(assert (=> b!541112 (= lt!247555 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!541113 () Bool)

(declare-fun res!336001 () Bool)

(assert (=> b!541113 (=> (not res!336001) (not e!313363))))

(declare-fun arrayContainsKey!0 (array!34228 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541113 (= res!336001 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!336000 () Bool)

(assert (=> start!49118 (=> (not res!336000) (not e!313363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49118 (= res!336000 (validMask!0 mask!3216))))

(assert (=> start!49118 e!313363))

(assert (=> start!49118 true))

(declare-fun array_inv!12246 (array!34228) Bool)

(assert (=> start!49118 (array_inv!12246 a!3154)))

(declare-fun b!541114 () Bool)

(declare-fun res!335994 () Bool)

(assert (=> b!541114 (=> (not res!335994) (not e!313363))))

(assert (=> b!541114 (= res!335994 (and (= (size!16814 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16814 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16814 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541115 () Bool)

(assert (=> b!541115 (= e!313365 false)))

(declare-fun lt!247554 () SeekEntryResult!4908)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541115 (= lt!247554 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16450 a!3154) j!147) mask!3216) (select (arr!16450 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49118 res!336000) b!541114))

(assert (= (and b!541114 res!335994) b!541110))

(assert (= (and b!541110 res!336002) b!541106))

(assert (= (and b!541106 res!335996) b!541113))

(assert (= (and b!541113 res!336001) b!541112))

(assert (= (and b!541112 res!335993) b!541108))

(assert (= (and b!541108 res!335997) b!541107))

(assert (= (and b!541107 res!335995) b!541109))

(assert (= (and b!541109 res!335999) b!541111))

(assert (= (and b!541111 res!335998) b!541115))

(declare-fun m!519725 () Bool)

(assert (=> b!541115 m!519725))

(assert (=> b!541115 m!519725))

(declare-fun m!519727 () Bool)

(assert (=> b!541115 m!519727))

(assert (=> b!541115 m!519727))

(assert (=> b!541115 m!519725))

(declare-fun m!519729 () Bool)

(assert (=> b!541115 m!519729))

(assert (=> b!541111 m!519725))

(assert (=> b!541111 m!519725))

(declare-fun m!519731 () Bool)

(assert (=> b!541111 m!519731))

(declare-fun m!519733 () Bool)

(assert (=> b!541109 m!519733))

(assert (=> b!541109 m!519725))

(declare-fun m!519735 () Bool)

(assert (=> b!541112 m!519735))

(declare-fun m!519737 () Bool)

(assert (=> b!541106 m!519737))

(declare-fun m!519739 () Bool)

(assert (=> b!541113 m!519739))

(assert (=> b!541110 m!519725))

(assert (=> b!541110 m!519725))

(declare-fun m!519741 () Bool)

(assert (=> b!541110 m!519741))

(declare-fun m!519743 () Bool)

(assert (=> start!49118 m!519743))

(declare-fun m!519745 () Bool)

(assert (=> start!49118 m!519745))

(declare-fun m!519747 () Bool)

(assert (=> b!541107 m!519747))

(declare-fun m!519749 () Bool)

(assert (=> b!541108 m!519749))

(check-sat (not b!541111) (not b!541112) (not b!541106) (not b!541113) (not b!541110) (not start!49118) (not b!541107) (not b!541115) (not b!541108))
(check-sat)
