; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48670 () Bool)

(assert start!48670)

(declare-fun res!329953 () Bool)

(declare-fun e!310806 () Bool)

(assert (=> start!48670 (=> (not res!329953) (not e!310806))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48670 (= res!329953 (validMask!0 mask!3216))))

(assert (=> start!48670 e!310806))

(assert (=> start!48670 true))

(declare-datatypes ((array!33882 0))(
  ( (array!33883 (arr!16280 (Array (_ BitVec 32) (_ BitVec 64))) (size!16644 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33882)

(declare-fun array_inv!12076 (array!33882) Bool)

(assert (=> start!48670 (array_inv!12076 a!3154)))

(declare-fun b!534746 () Bool)

(declare-fun e!310804 () Bool)

(assert (=> b!534746 (= e!310806 e!310804)))

(declare-fun res!329955 () Bool)

(assert (=> b!534746 (=> (not res!329955) (not e!310804))))

(declare-datatypes ((SeekEntryResult!4738 0))(
  ( (MissingZero!4738 (index!21176 (_ BitVec 32))) (Found!4738 (index!21177 (_ BitVec 32))) (Intermediate!4738 (undefined!5550 Bool) (index!21178 (_ BitVec 32)) (x!50129 (_ BitVec 32))) (Undefined!4738) (MissingVacant!4738 (index!21179 (_ BitVec 32))) )
))
(declare-fun lt!245694 () SeekEntryResult!4738)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534746 (= res!329955 (or (= lt!245694 (MissingZero!4738 i!1153)) (= lt!245694 (MissingVacant!4738 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33882 (_ BitVec 32)) SeekEntryResult!4738)

(assert (=> b!534746 (= lt!245694 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!534747 () Bool)

(declare-fun res!329952 () Bool)

(assert (=> b!534747 (=> (not res!329952) (not e!310806))))

(declare-fun arrayContainsKey!0 (array!33882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534747 (= res!329952 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534748 () Bool)

(declare-fun res!329956 () Bool)

(assert (=> b!534748 (=> (not res!329956) (not e!310806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534748 (= res!329956 (validKeyInArray!0 k!1998))))

(declare-fun b!534749 () Bool)

(declare-fun res!329954 () Bool)

(assert (=> b!534749 (=> (not res!329954) (not e!310804))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33882 (_ BitVec 32)) SeekEntryResult!4738)

(assert (=> b!534749 (= res!329954 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16280 a!3154) j!147) a!3154 mask!3216) (Intermediate!4738 false resIndex!32 resX!32)))))

(declare-fun b!534750 () Bool)

(declare-fun res!329951 () Bool)

(assert (=> b!534750 (=> (not res!329951) (not e!310804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33882 (_ BitVec 32)) Bool)

(assert (=> b!534750 (= res!329951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534751 () Bool)

(declare-fun res!329957 () Bool)

(assert (=> b!534751 (=> (not res!329957) (not e!310806))))

(assert (=> b!534751 (= res!329957 (and (= (size!16644 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16644 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16644 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534752 () Bool)

(declare-fun res!329958 () Bool)

(assert (=> b!534752 (=> (not res!329958) (not e!310806))))

(assert (=> b!534752 (= res!329958 (validKeyInArray!0 (select (arr!16280 a!3154) j!147)))))

(declare-fun b!534753 () Bool)

(declare-fun res!329959 () Bool)

(assert (=> b!534753 (=> (not res!329959) (not e!310804))))

(declare-datatypes ((List!10399 0))(
  ( (Nil!10396) (Cons!10395 (h!11338 (_ BitVec 64)) (t!16627 List!10399)) )
))
(declare-fun arrayNoDuplicates!0 (array!33882 (_ BitVec 32) List!10399) Bool)

(assert (=> b!534753 (= res!329959 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10396))))

(declare-fun b!534754 () Bool)

(declare-fun res!329960 () Bool)

(assert (=> b!534754 (=> (not res!329960) (not e!310804))))

(assert (=> b!534754 (= res!329960 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16644 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16644 a!3154)) (= (select (arr!16280 a!3154) resIndex!32) (select (arr!16280 a!3154) j!147))))))

(declare-fun b!534755 () Bool)

(assert (=> b!534755 (= e!310804 false)))

(declare-fun lt!245695 () SeekEntryResult!4738)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534755 (= lt!245695 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16280 a!3154) j!147) mask!3216) (select (arr!16280 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48670 res!329953) b!534751))

(assert (= (and b!534751 res!329957) b!534752))

(assert (= (and b!534752 res!329958) b!534748))

(assert (= (and b!534748 res!329956) b!534747))

(assert (= (and b!534747 res!329952) b!534746))

(assert (= (and b!534746 res!329955) b!534750))

(assert (= (and b!534750 res!329951) b!534753))

(assert (= (and b!534753 res!329959) b!534754))

(assert (= (and b!534754 res!329960) b!534749))

(assert (= (and b!534749 res!329954) b!534755))

(declare-fun m!514423 () Bool)

(assert (=> b!534753 m!514423))

(declare-fun m!514425 () Bool)

(assert (=> b!534755 m!514425))

(assert (=> b!534755 m!514425))

(declare-fun m!514427 () Bool)

(assert (=> b!534755 m!514427))

(assert (=> b!534755 m!514427))

(assert (=> b!534755 m!514425))

(declare-fun m!514429 () Bool)

(assert (=> b!534755 m!514429))

(declare-fun m!514431 () Bool)

(assert (=> b!534747 m!514431))

(declare-fun m!514433 () Bool)

(assert (=> b!534748 m!514433))

(declare-fun m!514435 () Bool)

(assert (=> b!534754 m!514435))

(assert (=> b!534754 m!514425))

(assert (=> b!534749 m!514425))

(assert (=> b!534749 m!514425))

(declare-fun m!514437 () Bool)

(assert (=> b!534749 m!514437))

(declare-fun m!514439 () Bool)

(assert (=> b!534746 m!514439))

(declare-fun m!514441 () Bool)

(assert (=> b!534750 m!514441))

(assert (=> b!534752 m!514425))

(assert (=> b!534752 m!514425))

(declare-fun m!514443 () Bool)

(assert (=> b!534752 m!514443))

(declare-fun m!514445 () Bool)

(assert (=> start!48670 m!514445))

(declare-fun m!514447 () Bool)

(assert (=> start!48670 m!514447))

(push 1)

(assert (not b!534747))

(assert (not b!534750))

(assert (not b!534753))

(assert (not b!534752))

(assert (not b!534748))

(assert (not start!48670))

