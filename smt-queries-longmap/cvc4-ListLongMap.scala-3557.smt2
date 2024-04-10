; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48916 () Bool)

(assert start!48916)

(declare-fun b!539157 () Bool)

(declare-fun res!334364 () Bool)

(declare-fun e!312578 () Bool)

(assert (=> b!539157 (=> (not res!334364) (not e!312578))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539157 (= res!334364 (validKeyInArray!0 k!1998))))

(declare-fun b!539158 () Bool)

(declare-fun res!334363 () Bool)

(assert (=> b!539158 (=> (not res!334363) (not e!312578))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34128 0))(
  ( (array!34129 (arr!16403 (Array (_ BitVec 32) (_ BitVec 64))) (size!16767 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34128)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539158 (= res!334363 (and (= (size!16767 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16767 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16767 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539159 () Bool)

(declare-fun res!334369 () Bool)

(declare-fun e!312577 () Bool)

(assert (=> b!539159 (=> (not res!334369) (not e!312577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34128 (_ BitVec 32)) Bool)

(assert (=> b!539159 (= res!334369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539160 () Bool)

(declare-fun res!334367 () Bool)

(assert (=> b!539160 (=> (not res!334367) (not e!312577))))

(declare-datatypes ((List!10522 0))(
  ( (Nil!10519) (Cons!10518 (h!11461 (_ BitVec 64)) (t!16750 List!10522)) )
))
(declare-fun arrayNoDuplicates!0 (array!34128 (_ BitVec 32) List!10522) Bool)

(assert (=> b!539160 (= res!334367 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10519))))

(declare-fun b!539161 () Bool)

(declare-fun res!334370 () Bool)

(assert (=> b!539161 (=> (not res!334370) (not e!312578))))

(declare-fun arrayContainsKey!0 (array!34128 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539161 (= res!334370 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539162 () Bool)

(declare-fun res!334368 () Bool)

(assert (=> b!539162 (=> (not res!334368) (not e!312578))))

(assert (=> b!539162 (= res!334368 (validKeyInArray!0 (select (arr!16403 a!3154) j!147)))))

(declare-fun res!334365 () Bool)

(assert (=> start!48916 (=> (not res!334365) (not e!312578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48916 (= res!334365 (validMask!0 mask!3216))))

(assert (=> start!48916 e!312578))

(assert (=> start!48916 true))

(declare-fun array_inv!12199 (array!34128) Bool)

(assert (=> start!48916 (array_inv!12199 a!3154)))

(declare-fun b!539163 () Bool)

(declare-fun res!334362 () Bool)

(assert (=> b!539163 (=> (not res!334362) (not e!312577))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539163 (= res!334362 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16767 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16767 a!3154)) (= (select (arr!16403 a!3154) resIndex!32) (select (arr!16403 a!3154) j!147))))))

(declare-fun b!539164 () Bool)

(assert (=> b!539164 (= e!312577 false)))

(declare-datatypes ((SeekEntryResult!4861 0))(
  ( (MissingZero!4861 (index!21668 (_ BitVec 32))) (Found!4861 (index!21669 (_ BitVec 32))) (Intermediate!4861 (undefined!5673 Bool) (index!21670 (_ BitVec 32)) (x!50580 (_ BitVec 32))) (Undefined!4861) (MissingVacant!4861 (index!21671 (_ BitVec 32))) )
))
(declare-fun lt!247081 () SeekEntryResult!4861)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34128 (_ BitVec 32)) SeekEntryResult!4861)

(assert (=> b!539164 (= lt!247081 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16403 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539165 () Bool)

(assert (=> b!539165 (= e!312578 e!312577)))

(declare-fun res!334366 () Bool)

(assert (=> b!539165 (=> (not res!334366) (not e!312577))))

(declare-fun lt!247080 () SeekEntryResult!4861)

(assert (=> b!539165 (= res!334366 (or (= lt!247080 (MissingZero!4861 i!1153)) (= lt!247080 (MissingVacant!4861 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34128 (_ BitVec 32)) SeekEntryResult!4861)

(assert (=> b!539165 (= lt!247080 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!48916 res!334365) b!539158))

(assert (= (and b!539158 res!334363) b!539162))

(assert (= (and b!539162 res!334368) b!539157))

(assert (= (and b!539157 res!334364) b!539161))

(assert (= (and b!539161 res!334370) b!539165))

(assert (= (and b!539165 res!334366) b!539159))

(assert (= (and b!539159 res!334369) b!539160))

(assert (= (and b!539160 res!334367) b!539163))

(assert (= (and b!539163 res!334362) b!539164))

(declare-fun m!518237 () Bool)

(assert (=> b!539159 m!518237))

(declare-fun m!518239 () Bool)

(assert (=> start!48916 m!518239))

(declare-fun m!518241 () Bool)

(assert (=> start!48916 m!518241))

(declare-fun m!518243 () Bool)

(assert (=> b!539161 m!518243))

(declare-fun m!518245 () Bool)

(assert (=> b!539162 m!518245))

(assert (=> b!539162 m!518245))

(declare-fun m!518247 () Bool)

(assert (=> b!539162 m!518247))

(declare-fun m!518249 () Bool)

(assert (=> b!539165 m!518249))

(declare-fun m!518251 () Bool)

(assert (=> b!539157 m!518251))

(assert (=> b!539164 m!518245))

(assert (=> b!539164 m!518245))

(declare-fun m!518253 () Bool)

(assert (=> b!539164 m!518253))

(declare-fun m!518255 () Bool)

(assert (=> b!539163 m!518255))

(assert (=> b!539163 m!518245))

(declare-fun m!518257 () Bool)

(assert (=> b!539160 m!518257))

(push 1)

(assert (not b!539162))

(assert (not b!539161))

(assert (not b!539164))

(assert (not b!539165))

(assert (not start!48916))

(assert (not b!539160))

(assert (not b!539157))

(assert (not b!539159))

(check-sat)

