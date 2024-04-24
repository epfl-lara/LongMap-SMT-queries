; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49150 () Bool)

(assert start!49150)

(declare-fun b!541096 () Bool)

(declare-fun e!313431 () Bool)

(assert (=> b!541096 (= e!313431 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4852 0))(
  ( (MissingZero!4852 (index!21632 (_ BitVec 32))) (Found!4852 (index!21633 (_ BitVec 32))) (Intermediate!4852 (undefined!5664 Bool) (index!21634 (_ BitVec 32)) (x!50698 (_ BitVec 32))) (Undefined!4852) (MissingVacant!4852 (index!21635 (_ BitVec 32))) )
))
(declare-fun lt!247620 () SeekEntryResult!4852)

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34208 0))(
  ( (array!34209 (arr!16438 (Array (_ BitVec 32) (_ BitVec 64))) (size!16802 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34208)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34208 (_ BitVec 32)) SeekEntryResult!4852)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541096 (= lt!247620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16438 a!3154) j!147) mask!3216) (select (arr!16438 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541097 () Bool)

(declare-fun res!335882 () Bool)

(declare-fun e!313430 () Bool)

(assert (=> b!541097 (=> (not res!335882) (not e!313430))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541097 (= res!335882 (validKeyInArray!0 k0!1998))))

(declare-fun b!541098 () Bool)

(declare-fun res!335878 () Bool)

(assert (=> b!541098 (=> (not res!335878) (not e!313430))))

(assert (=> b!541098 (= res!335878 (validKeyInArray!0 (select (arr!16438 a!3154) j!147)))))

(declare-fun b!541099 () Bool)

(declare-fun res!335886 () Bool)

(assert (=> b!541099 (=> (not res!335886) (not e!313431))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!541099 (= res!335886 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16802 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16802 a!3154)) (= (select (arr!16438 a!3154) resIndex!32) (select (arr!16438 a!3154) j!147))))))

(declare-fun res!335880 () Bool)

(assert (=> start!49150 (=> (not res!335880) (not e!313430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49150 (= res!335880 (validMask!0 mask!3216))))

(assert (=> start!49150 e!313430))

(assert (=> start!49150 true))

(declare-fun array_inv!12297 (array!34208) Bool)

(assert (=> start!49150 (array_inv!12297 a!3154)))

(declare-fun b!541100 () Bool)

(declare-fun res!335881 () Bool)

(assert (=> b!541100 (=> (not res!335881) (not e!313431))))

(declare-datatypes ((List!10464 0))(
  ( (Nil!10461) (Cons!10460 (h!11412 (_ BitVec 64)) (t!16684 List!10464)) )
))
(declare-fun arrayNoDuplicates!0 (array!34208 (_ BitVec 32) List!10464) Bool)

(assert (=> b!541100 (= res!335881 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10461))))

(declare-fun b!541101 () Bool)

(declare-fun res!335879 () Bool)

(assert (=> b!541101 (=> (not res!335879) (not e!313430))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541101 (= res!335879 (and (= (size!16802 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16802 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16802 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541102 () Bool)

(assert (=> b!541102 (= e!313430 e!313431)))

(declare-fun res!335884 () Bool)

(assert (=> b!541102 (=> (not res!335884) (not e!313431))))

(declare-fun lt!247621 () SeekEntryResult!4852)

(assert (=> b!541102 (= res!335884 (or (= lt!247621 (MissingZero!4852 i!1153)) (= lt!247621 (MissingVacant!4852 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34208 (_ BitVec 32)) SeekEntryResult!4852)

(assert (=> b!541102 (= lt!247621 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!541103 () Bool)

(declare-fun res!335887 () Bool)

(assert (=> b!541103 (=> (not res!335887) (not e!313431))))

(assert (=> b!541103 (= res!335887 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16438 a!3154) j!147) a!3154 mask!3216) (Intermediate!4852 false resIndex!32 resX!32)))))

(declare-fun b!541104 () Bool)

(declare-fun res!335885 () Bool)

(assert (=> b!541104 (=> (not res!335885) (not e!313431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34208 (_ BitVec 32)) Bool)

(assert (=> b!541104 (= res!335885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541105 () Bool)

(declare-fun res!335883 () Bool)

(assert (=> b!541105 (=> (not res!335883) (not e!313430))))

(declare-fun arrayContainsKey!0 (array!34208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541105 (= res!335883 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49150 res!335880) b!541101))

(assert (= (and b!541101 res!335879) b!541098))

(assert (= (and b!541098 res!335878) b!541097))

(assert (= (and b!541097 res!335882) b!541105))

(assert (= (and b!541105 res!335883) b!541102))

(assert (= (and b!541102 res!335884) b!541104))

(assert (= (and b!541104 res!335885) b!541100))

(assert (= (and b!541100 res!335881) b!541099))

(assert (= (and b!541099 res!335886) b!541103))

(assert (= (and b!541103 res!335887) b!541096))

(declare-fun m!519865 () Bool)

(assert (=> b!541103 m!519865))

(assert (=> b!541103 m!519865))

(declare-fun m!519867 () Bool)

(assert (=> b!541103 m!519867))

(declare-fun m!519869 () Bool)

(assert (=> start!49150 m!519869))

(declare-fun m!519871 () Bool)

(assert (=> start!49150 m!519871))

(declare-fun m!519873 () Bool)

(assert (=> b!541104 m!519873))

(declare-fun m!519875 () Bool)

(assert (=> b!541102 m!519875))

(assert (=> b!541098 m!519865))

(assert (=> b!541098 m!519865))

(declare-fun m!519877 () Bool)

(assert (=> b!541098 m!519877))

(declare-fun m!519879 () Bool)

(assert (=> b!541100 m!519879))

(declare-fun m!519881 () Bool)

(assert (=> b!541105 m!519881))

(assert (=> b!541096 m!519865))

(assert (=> b!541096 m!519865))

(declare-fun m!519883 () Bool)

(assert (=> b!541096 m!519883))

(assert (=> b!541096 m!519883))

(assert (=> b!541096 m!519865))

(declare-fun m!519885 () Bool)

(assert (=> b!541096 m!519885))

(declare-fun m!519887 () Bool)

(assert (=> b!541099 m!519887))

(assert (=> b!541099 m!519865))

(declare-fun m!519889 () Bool)

(assert (=> b!541097 m!519889))

(check-sat (not b!541098) (not start!49150) (not b!541097) (not b!541105) (not b!541102) (not b!541103) (not b!541100) (not b!541104) (not b!541096))
(check-sat)
