; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49030 () Bool)

(assert start!49030)

(declare-fun b!540326 () Bool)

(declare-fun res!335377 () Bool)

(declare-fun e!313035 () Bool)

(assert (=> b!540326 (=> (not res!335377) (not e!313035))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34191 0))(
  ( (array!34192 (arr!16433 (Array (_ BitVec 32) (_ BitVec 64))) (size!16797 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34191)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540326 (= res!335377 (and (= (size!16797 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16797 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16797 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540327 () Bool)

(declare-fun res!335372 () Bool)

(assert (=> b!540327 (=> (not res!335372) (not e!313035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540327 (= res!335372 (validKeyInArray!0 (select (arr!16433 a!3154) j!147)))))

(declare-fun res!335374 () Bool)

(assert (=> start!49030 (=> (not res!335374) (not e!313035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49030 (= res!335374 (validMask!0 mask!3216))))

(assert (=> start!49030 e!313035))

(assert (=> start!49030 true))

(declare-fun array_inv!12229 (array!34191) Bool)

(assert (=> start!49030 (array_inv!12229 a!3154)))

(declare-fun b!540328 () Bool)

(declare-fun res!335375 () Bool)

(assert (=> b!540328 (=> (not res!335375) (not e!313035))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540328 (= res!335375 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540329 () Bool)

(declare-fun res!335380 () Bool)

(declare-fun e!313034 () Bool)

(assert (=> b!540329 (=> (not res!335380) (not e!313034))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540329 (= res!335380 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16797 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16797 a!3154)) (= (select (arr!16433 a!3154) resIndex!32) (select (arr!16433 a!3154) j!147))))))

(declare-fun b!540330 () Bool)

(declare-fun res!335378 () Bool)

(assert (=> b!540330 (=> (not res!335378) (not e!313034))))

(declare-datatypes ((SeekEntryResult!4891 0))(
  ( (MissingZero!4891 (index!21788 (_ BitVec 32))) (Found!4891 (index!21789 (_ BitVec 32))) (Intermediate!4891 (undefined!5703 Bool) (index!21790 (_ BitVec 32)) (x!50696 (_ BitVec 32))) (Undefined!4891) (MissingVacant!4891 (index!21791 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34191 (_ BitVec 32)) SeekEntryResult!4891)

(assert (=> b!540330 (= res!335378 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16433 a!3154) j!147) a!3154 mask!3216) (Intermediate!4891 false resIndex!32 resX!32)))))

(declare-fun b!540331 () Bool)

(declare-fun res!335381 () Bool)

(assert (=> b!540331 (=> (not res!335381) (not e!313034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34191 (_ BitVec 32)) Bool)

(assert (=> b!540331 (= res!335381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540332 () Bool)

(declare-fun res!335376 () Bool)

(assert (=> b!540332 (=> (not res!335376) (not e!313034))))

(declare-datatypes ((List!10552 0))(
  ( (Nil!10549) (Cons!10548 (h!11494 (_ BitVec 64)) (t!16780 List!10552)) )
))
(declare-fun arrayNoDuplicates!0 (array!34191 (_ BitVec 32) List!10552) Bool)

(assert (=> b!540332 (= res!335376 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10549))))

(declare-fun b!540333 () Bool)

(assert (=> b!540333 (= e!313034 false)))

(declare-fun lt!247357 () SeekEntryResult!4891)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540333 (= lt!247357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16433 a!3154) j!147) mask!3216) (select (arr!16433 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540334 () Bool)

(assert (=> b!540334 (= e!313035 e!313034)))

(declare-fun res!335379 () Bool)

(assert (=> b!540334 (=> (not res!335379) (not e!313034))))

(declare-fun lt!247356 () SeekEntryResult!4891)

(assert (=> b!540334 (= res!335379 (or (= lt!247356 (MissingZero!4891 i!1153)) (= lt!247356 (MissingVacant!4891 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34191 (_ BitVec 32)) SeekEntryResult!4891)

(assert (=> b!540334 (= lt!247356 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!540335 () Bool)

(declare-fun res!335373 () Bool)

(assert (=> b!540335 (=> (not res!335373) (not e!313035))))

(assert (=> b!540335 (= res!335373 (validKeyInArray!0 k!1998))))

(assert (= (and start!49030 res!335374) b!540326))

(assert (= (and b!540326 res!335377) b!540327))

(assert (= (and b!540327 res!335372) b!540335))

(assert (= (and b!540335 res!335373) b!540328))

(assert (= (and b!540328 res!335375) b!540334))

(assert (= (and b!540334 res!335379) b!540331))

(assert (= (and b!540331 res!335381) b!540332))

(assert (= (and b!540332 res!335376) b!540329))

(assert (= (and b!540329 res!335380) b!540330))

(assert (= (and b!540330 res!335378) b!540333))

(declare-fun m!519139 () Bool)

(assert (=> b!540335 m!519139))

(declare-fun m!519141 () Bool)

(assert (=> start!49030 m!519141))

(declare-fun m!519143 () Bool)

(assert (=> start!49030 m!519143))

(declare-fun m!519145 () Bool)

(assert (=> b!540328 m!519145))

(declare-fun m!519147 () Bool)

(assert (=> b!540332 m!519147))

(declare-fun m!519149 () Bool)

(assert (=> b!540329 m!519149))

(declare-fun m!519151 () Bool)

(assert (=> b!540329 m!519151))

(assert (=> b!540327 m!519151))

(assert (=> b!540327 m!519151))

(declare-fun m!519153 () Bool)

(assert (=> b!540327 m!519153))

(assert (=> b!540333 m!519151))

(assert (=> b!540333 m!519151))

(declare-fun m!519155 () Bool)

(assert (=> b!540333 m!519155))

(assert (=> b!540333 m!519155))

(assert (=> b!540333 m!519151))

(declare-fun m!519157 () Bool)

(assert (=> b!540333 m!519157))

(declare-fun m!519159 () Bool)

(assert (=> b!540331 m!519159))

(assert (=> b!540330 m!519151))

(assert (=> b!540330 m!519151))

(declare-fun m!519161 () Bool)

(assert (=> b!540330 m!519161))

(declare-fun m!519163 () Bool)

(assert (=> b!540334 m!519163))

(push 1)

(assert (not b!540331))

(assert (not b!540330))

(assert (not b!540328))

(assert (not b!540335))

(assert (not b!540333))

(assert (not b!540334))

(assert (not start!49030))

