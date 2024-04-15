; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48570 () Bool)

(assert start!48570)

(declare-fun b!533164 () Bool)

(declare-fun res!328512 () Bool)

(declare-fun e!310235 () Bool)

(assert (=> b!533164 (=> (not res!328512) (not e!310235))))

(declare-datatypes ((array!33792 0))(
  ( (array!33793 (arr!16235 (Array (_ BitVec 32) (_ BitVec 64))) (size!16600 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33792)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533164 (= res!328512 (validKeyInArray!0 (select (arr!16235 a!3154) j!147)))))

(declare-fun res!328514 () Bool)

(assert (=> start!48570 (=> (not res!328514) (not e!310235))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48570 (= res!328514 (validMask!0 mask!3216))))

(assert (=> start!48570 e!310235))

(assert (=> start!48570 true))

(declare-fun array_inv!12118 (array!33792) Bool)

(assert (=> start!48570 (array_inv!12118 a!3154)))

(declare-fun b!533165 () Bool)

(declare-fun res!328518 () Bool)

(assert (=> b!533165 (=> (not res!328518) (not e!310235))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!533165 (= res!328518 (validKeyInArray!0 k0!1998))))

(declare-fun b!533166 () Bool)

(declare-fun res!328513 () Bool)

(declare-fun e!310234 () Bool)

(assert (=> b!533166 (=> (not res!328513) (not e!310234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33792 (_ BitVec 32)) Bool)

(assert (=> b!533166 (= res!328513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533167 () Bool)

(declare-fun res!328516 () Bool)

(assert (=> b!533167 (=> (not res!328516) (not e!310234))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533167 (= res!328516 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16600 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16600 a!3154)) (= (select (arr!16235 a!3154) resIndex!32) (select (arr!16235 a!3154) j!147))))))

(declare-fun b!533168 () Bool)

(declare-fun res!328520 () Bool)

(assert (=> b!533168 (=> (not res!328520) (not e!310234))))

(declare-datatypes ((SeekEntryResult!4690 0))(
  ( (MissingZero!4690 (index!20984 (_ BitVec 32))) (Found!4690 (index!20985 (_ BitVec 32))) (Intermediate!4690 (undefined!5502 Bool) (index!20986 (_ BitVec 32)) (x!49964 (_ BitVec 32))) (Undefined!4690) (MissingVacant!4690 (index!20987 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33792 (_ BitVec 32)) SeekEntryResult!4690)

(assert (=> b!533168 (= res!328520 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16235 a!3154) j!147) a!3154 mask!3216) (Intermediate!4690 false resIndex!32 resX!32)))))

(declare-fun b!533169 () Bool)

(declare-fun res!328519 () Bool)

(assert (=> b!533169 (=> (not res!328519) (not e!310235))))

(declare-fun arrayContainsKey!0 (array!33792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533169 (= res!328519 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533170 () Bool)

(assert (=> b!533170 (= e!310235 e!310234)))

(declare-fun res!328517 () Bool)

(assert (=> b!533170 (=> (not res!328517) (not e!310234))))

(declare-fun lt!245212 () SeekEntryResult!4690)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533170 (= res!328517 (or (= lt!245212 (MissingZero!4690 i!1153)) (= lt!245212 (MissingVacant!4690 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33792 (_ BitVec 32)) SeekEntryResult!4690)

(assert (=> b!533170 (= lt!245212 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533171 () Bool)

(assert (=> b!533171 (= e!310234 (and (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun b!533172 () Bool)

(declare-fun res!328511 () Bool)

(assert (=> b!533172 (=> (not res!328511) (not e!310234))))

(declare-datatypes ((List!10393 0))(
  ( (Nil!10390) (Cons!10389 (h!11332 (_ BitVec 64)) (t!16612 List!10393)) )
))
(declare-fun arrayNoDuplicates!0 (array!33792 (_ BitVec 32) List!10393) Bool)

(assert (=> b!533172 (= res!328511 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10390))))

(declare-fun b!533173 () Bool)

(declare-fun res!328515 () Bool)

(assert (=> b!533173 (=> (not res!328515) (not e!310235))))

(assert (=> b!533173 (= res!328515 (and (= (size!16600 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16600 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16600 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48570 res!328514) b!533173))

(assert (= (and b!533173 res!328515) b!533164))

(assert (= (and b!533164 res!328512) b!533165))

(assert (= (and b!533165 res!328518) b!533169))

(assert (= (and b!533169 res!328519) b!533170))

(assert (= (and b!533170 res!328517) b!533166))

(assert (= (and b!533166 res!328513) b!533172))

(assert (= (and b!533172 res!328511) b!533167))

(assert (= (and b!533167 res!328516) b!533168))

(assert (= (and b!533168 res!328520) b!533171))

(declare-fun m!512563 () Bool)

(assert (=> b!533170 m!512563))

(declare-fun m!512565 () Bool)

(assert (=> b!533164 m!512565))

(assert (=> b!533164 m!512565))

(declare-fun m!512567 () Bool)

(assert (=> b!533164 m!512567))

(declare-fun m!512569 () Bool)

(assert (=> start!48570 m!512569))

(declare-fun m!512571 () Bool)

(assert (=> start!48570 m!512571))

(declare-fun m!512573 () Bool)

(assert (=> b!533167 m!512573))

(assert (=> b!533167 m!512565))

(declare-fun m!512575 () Bool)

(assert (=> b!533169 m!512575))

(assert (=> b!533168 m!512565))

(assert (=> b!533168 m!512565))

(declare-fun m!512577 () Bool)

(assert (=> b!533168 m!512577))

(declare-fun m!512579 () Bool)

(assert (=> b!533172 m!512579))

(declare-fun m!512581 () Bool)

(assert (=> b!533165 m!512581))

(declare-fun m!512583 () Bool)

(assert (=> b!533166 m!512583))

(check-sat (not b!533170) (not b!533168) (not b!533169) (not b!533166) (not start!48570) (not b!533164) (not b!533172) (not b!533165))
(check-sat)
