; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49278 () Bool)

(assert start!49278)

(declare-fun b!542447 () Bool)

(declare-fun res!337141 () Bool)

(declare-fun e!313884 () Bool)

(assert (=> b!542447 (=> (not res!337141) (not e!313884))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-datatypes ((array!34296 0))(
  ( (array!34297 (arr!16481 (Array (_ BitVec 32) (_ BitVec 64))) (size!16846 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34296)

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!542447 (= res!337141 (and (not (= (select (arr!16481 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16481 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16481 a!3154) index!1177) (select (arr!16481 a!3154) j!147)))))))

(declare-fun b!542448 () Bool)

(declare-fun res!337149 () Bool)

(declare-fun e!313886 () Bool)

(assert (=> b!542448 (=> (not res!337149) (not e!313886))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542448 (= res!337149 (and (= (size!16846 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16846 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16846 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542449 () Bool)

(declare-fun e!313887 () Bool)

(assert (=> b!542449 (= e!313887 e!313884)))

(declare-fun res!337145 () Bool)

(assert (=> b!542449 (=> (not res!337145) (not e!313884))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4936 0))(
  ( (MissingZero!4936 (index!21968 (_ BitVec 32))) (Found!4936 (index!21969 (_ BitVec 32))) (Intermediate!4936 (undefined!5748 Bool) (index!21970 (_ BitVec 32)) (x!50890 (_ BitVec 32))) (Undefined!4936) (MissingVacant!4936 (index!21971 (_ BitVec 32))) )
))
(declare-fun lt!247759 () SeekEntryResult!4936)

(assert (=> b!542449 (= res!337145 (= lt!247759 (Intermediate!4936 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34296 (_ BitVec 32)) SeekEntryResult!4936)

(assert (=> b!542449 (= lt!247759 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16481 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542450 () Bool)

(declare-fun res!337144 () Bool)

(assert (=> b!542450 (=> (not res!337144) (not e!313887))))

(assert (=> b!542450 (= res!337144 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16846 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16846 a!3154)) (= (select (arr!16481 a!3154) resIndex!32) (select (arr!16481 a!3154) j!147))))))

(declare-fun b!542451 () Bool)

(declare-fun res!337143 () Bool)

(assert (=> b!542451 (=> (not res!337143) (not e!313887))))

(declare-datatypes ((List!10639 0))(
  ( (Nil!10636) (Cons!10635 (h!11590 (_ BitVec 64)) (t!16858 List!10639)) )
))
(declare-fun arrayNoDuplicates!0 (array!34296 (_ BitVec 32) List!10639) Bool)

(assert (=> b!542451 (= res!337143 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10636))))

(declare-fun res!337140 () Bool)

(assert (=> start!49278 (=> (not res!337140) (not e!313886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49278 (= res!337140 (validMask!0 mask!3216))))

(assert (=> start!49278 e!313886))

(assert (=> start!49278 true))

(declare-fun array_inv!12364 (array!34296) Bool)

(assert (=> start!49278 (array_inv!12364 a!3154)))

(declare-fun b!542452 () Bool)

(assert (=> b!542452 (= e!313884 false)))

(declare-fun lt!247757 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542452 (= lt!247757 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542453 () Bool)

(declare-fun res!337151 () Bool)

(assert (=> b!542453 (=> (not res!337151) (not e!313886))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34296 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542453 (= res!337151 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542454 () Bool)

(assert (=> b!542454 (= e!313886 e!313887)))

(declare-fun res!337147 () Bool)

(assert (=> b!542454 (=> (not res!337147) (not e!313887))))

(declare-fun lt!247758 () SeekEntryResult!4936)

(assert (=> b!542454 (= res!337147 (or (= lt!247758 (MissingZero!4936 i!1153)) (= lt!247758 (MissingVacant!4936 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34296 (_ BitVec 32)) SeekEntryResult!4936)

(assert (=> b!542454 (= lt!247758 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542455 () Bool)

(declare-fun res!337148 () Bool)

(assert (=> b!542455 (=> (not res!337148) (not e!313887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34296 (_ BitVec 32)) Bool)

(assert (=> b!542455 (= res!337148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542456 () Bool)

(declare-fun res!337150 () Bool)

(assert (=> b!542456 (=> (not res!337150) (not e!313886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542456 (= res!337150 (validKeyInArray!0 k0!1998))))

(declare-fun b!542457 () Bool)

(declare-fun res!337142 () Bool)

(assert (=> b!542457 (=> (not res!337142) (not e!313884))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542457 (= res!337142 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16481 a!3154) j!147) mask!3216) (select (arr!16481 a!3154) j!147) a!3154 mask!3216) lt!247759))))

(declare-fun b!542458 () Bool)

(declare-fun res!337146 () Bool)

(assert (=> b!542458 (=> (not res!337146) (not e!313886))))

(assert (=> b!542458 (= res!337146 (validKeyInArray!0 (select (arr!16481 a!3154) j!147)))))

(assert (= (and start!49278 res!337140) b!542448))

(assert (= (and b!542448 res!337149) b!542458))

(assert (= (and b!542458 res!337146) b!542456))

(assert (= (and b!542456 res!337150) b!542453))

(assert (= (and b!542453 res!337151) b!542454))

(assert (= (and b!542454 res!337147) b!542455))

(assert (= (and b!542455 res!337148) b!542451))

(assert (= (and b!542451 res!337143) b!542450))

(assert (= (and b!542450 res!337144) b!542449))

(assert (= (and b!542449 res!337145) b!542457))

(assert (= (and b!542457 res!337142) b!542447))

(assert (= (and b!542447 res!337141) b!542452))

(declare-fun m!520177 () Bool)

(assert (=> b!542455 m!520177))

(declare-fun m!520179 () Bool)

(assert (=> b!542456 m!520179))

(declare-fun m!520181 () Bool)

(assert (=> b!542457 m!520181))

(assert (=> b!542457 m!520181))

(declare-fun m!520183 () Bool)

(assert (=> b!542457 m!520183))

(assert (=> b!542457 m!520183))

(assert (=> b!542457 m!520181))

(declare-fun m!520185 () Bool)

(assert (=> b!542457 m!520185))

(declare-fun m!520187 () Bool)

(assert (=> b!542447 m!520187))

(assert (=> b!542447 m!520181))

(declare-fun m!520189 () Bool)

(assert (=> b!542451 m!520189))

(assert (=> b!542458 m!520181))

(assert (=> b!542458 m!520181))

(declare-fun m!520191 () Bool)

(assert (=> b!542458 m!520191))

(declare-fun m!520193 () Bool)

(assert (=> b!542453 m!520193))

(assert (=> b!542449 m!520181))

(assert (=> b!542449 m!520181))

(declare-fun m!520195 () Bool)

(assert (=> b!542449 m!520195))

(declare-fun m!520197 () Bool)

(assert (=> start!49278 m!520197))

(declare-fun m!520199 () Bool)

(assert (=> start!49278 m!520199))

(declare-fun m!520201 () Bool)

(assert (=> b!542454 m!520201))

(declare-fun m!520203 () Bool)

(assert (=> b!542450 m!520203))

(assert (=> b!542450 m!520181))

(declare-fun m!520205 () Bool)

(assert (=> b!542452 m!520205))

(check-sat (not b!542452) (not b!542458) (not b!542451) (not b!542453) (not b!542455) (not b!542449) (not start!49278) (not b!542456) (not b!542454) (not b!542457))
(check-sat)
