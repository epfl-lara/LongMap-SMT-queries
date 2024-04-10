; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48574 () Bool)

(assert start!48574)

(declare-fun b!533324 () Bool)

(declare-fun e!310374 () Bool)

(declare-fun e!310372 () Bool)

(assert (=> b!533324 (= e!310374 e!310372)))

(declare-fun res!328530 () Bool)

(assert (=> b!533324 (=> (not res!328530) (not e!310372))))

(declare-datatypes ((SeekEntryResult!4690 0))(
  ( (MissingZero!4690 (index!20984 (_ BitVec 32))) (Found!4690 (index!20985 (_ BitVec 32))) (Intermediate!4690 (undefined!5502 Bool) (index!20986 (_ BitVec 32)) (x!49953 (_ BitVec 32))) (Undefined!4690) (MissingVacant!4690 (index!20987 (_ BitVec 32))) )
))
(declare-fun lt!245425 () SeekEntryResult!4690)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533324 (= res!328530 (or (= lt!245425 (MissingZero!4690 i!1153)) (= lt!245425 (MissingVacant!4690 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!33786 0))(
  ( (array!33787 (arr!16232 (Array (_ BitVec 32) (_ BitVec 64))) (size!16596 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33786)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33786 (_ BitVec 32)) SeekEntryResult!4690)

(assert (=> b!533324 (= lt!245425 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533325 () Bool)

(declare-fun res!328534 () Bool)

(assert (=> b!533325 (=> (not res!328534) (not e!310372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33786 (_ BitVec 32)) Bool)

(assert (=> b!533325 (= res!328534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533326 () Bool)

(declare-fun res!328531 () Bool)

(assert (=> b!533326 (=> (not res!328531) (not e!310374))))

(declare-fun arrayContainsKey!0 (array!33786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533326 (= res!328531 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533327 () Bool)

(declare-fun res!328532 () Bool)

(assert (=> b!533327 (=> (not res!328532) (not e!310374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533327 (= res!328532 (validKeyInArray!0 k!1998))))

(declare-fun b!533328 () Bool)

(declare-fun res!328535 () Bool)

(assert (=> b!533328 (=> (not res!328535) (not e!310372))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533328 (= res!328535 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16596 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16596 a!3154)) (= (select (arr!16232 a!3154) resIndex!32) (select (arr!16232 a!3154) j!147))))))

(declare-fun b!533329 () Bool)

(assert (=> b!533329 (= e!310372 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!533330 () Bool)

(declare-fun res!328529 () Bool)

(assert (=> b!533330 (=> (not res!328529) (not e!310372))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33786 (_ BitVec 32)) SeekEntryResult!4690)

(assert (=> b!533330 (= res!328529 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16232 a!3154) j!147) a!3154 mask!3216) (Intermediate!4690 false resIndex!32 resX!32)))))

(declare-fun b!533331 () Bool)

(declare-fun res!328537 () Bool)

(assert (=> b!533331 (=> (not res!328537) (not e!310374))))

(assert (=> b!533331 (= res!328537 (validKeyInArray!0 (select (arr!16232 a!3154) j!147)))))

(declare-fun b!533332 () Bool)

(declare-fun res!328536 () Bool)

(assert (=> b!533332 (=> (not res!328536) (not e!310374))))

(assert (=> b!533332 (= res!328536 (and (= (size!16596 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16596 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16596 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533333 () Bool)

(declare-fun res!328538 () Bool)

(assert (=> b!533333 (=> (not res!328538) (not e!310372))))

(declare-datatypes ((List!10351 0))(
  ( (Nil!10348) (Cons!10347 (h!11290 (_ BitVec 64)) (t!16579 List!10351)) )
))
(declare-fun arrayNoDuplicates!0 (array!33786 (_ BitVec 32) List!10351) Bool)

(assert (=> b!533333 (= res!328538 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10348))))

(declare-fun res!328533 () Bool)

(assert (=> start!48574 (=> (not res!328533) (not e!310374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48574 (= res!328533 (validMask!0 mask!3216))))

(assert (=> start!48574 e!310374))

(assert (=> start!48574 true))

(declare-fun array_inv!12028 (array!33786) Bool)

(assert (=> start!48574 (array_inv!12028 a!3154)))

(assert (= (and start!48574 res!328533) b!533332))

(assert (= (and b!533332 res!328536) b!533331))

(assert (= (and b!533331 res!328537) b!533327))

(assert (= (and b!533327 res!328532) b!533326))

(assert (= (and b!533326 res!328531) b!533324))

(assert (= (and b!533324 res!328530) b!533325))

(assert (= (and b!533325 res!328534) b!533333))

(assert (= (and b!533333 res!328538) b!533328))

(assert (= (and b!533328 res!328535) b!533330))

(assert (= (and b!533330 res!328529) b!533329))

(declare-fun m!513227 () Bool)

(assert (=> b!533325 m!513227))

(declare-fun m!513229 () Bool)

(assert (=> b!533333 m!513229))

(declare-fun m!513231 () Bool)

(assert (=> start!48574 m!513231))

(declare-fun m!513233 () Bool)

(assert (=> start!48574 m!513233))

(declare-fun m!513235 () Bool)

(assert (=> b!533330 m!513235))

(assert (=> b!533330 m!513235))

(declare-fun m!513237 () Bool)

(assert (=> b!533330 m!513237))

(declare-fun m!513239 () Bool)

(assert (=> b!533328 m!513239))

(assert (=> b!533328 m!513235))

(declare-fun m!513241 () Bool)

(assert (=> b!533324 m!513241))

(declare-fun m!513243 () Bool)

(assert (=> b!533327 m!513243))

(declare-fun m!513245 () Bool)

(assert (=> b!533326 m!513245))

(assert (=> b!533331 m!513235))

(assert (=> b!533331 m!513235))

(declare-fun m!513247 () Bool)

(assert (=> b!533331 m!513247))

(push 1)

(assert (not b!533326))

(assert (not b!533324))

(assert (not b!533333))

(assert (not b!533331))

(assert (not b!533330))

(assert (not start!48574))

(assert (not b!533325))

(assert (not b!533327))

(check-sat)

(pop 1)

(push 1)

