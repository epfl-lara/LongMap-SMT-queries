; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48558 () Bool)

(assert start!48558)

(declare-fun b!532993 () Bool)

(declare-fun e!310182 () Bool)

(declare-fun e!310180 () Bool)

(assert (=> b!532993 (= e!310182 e!310180)))

(declare-fun res!328342 () Bool)

(assert (=> b!532993 (=> (not res!328342) (not e!310180))))

(declare-datatypes ((SeekEntryResult!4684 0))(
  ( (MissingZero!4684 (index!20960 (_ BitVec 32))) (Found!4684 (index!20961 (_ BitVec 32))) (Intermediate!4684 (undefined!5496 Bool) (index!20962 (_ BitVec 32)) (x!49942 (_ BitVec 32))) (Undefined!4684) (MissingVacant!4684 (index!20963 (_ BitVec 32))) )
))
(declare-fun lt!245185 () SeekEntryResult!4684)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532993 (= res!328342 (or (= lt!245185 (MissingZero!4684 i!1153)) (= lt!245185 (MissingVacant!4684 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((array!33780 0))(
  ( (array!33781 (arr!16229 (Array (_ BitVec 32) (_ BitVec 64))) (size!16594 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33780)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33780 (_ BitVec 32)) SeekEntryResult!4684)

(assert (=> b!532993 (= lt!245185 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532994 () Bool)

(declare-fun res!328345 () Bool)

(assert (=> b!532994 (=> (not res!328345) (not e!310182))))

(declare-fun arrayContainsKey!0 (array!33780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532994 (= res!328345 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532995 () Bool)

(declare-fun res!328341 () Bool)

(assert (=> b!532995 (=> (not res!328341) (not e!310180))))

(declare-datatypes ((List!10387 0))(
  ( (Nil!10384) (Cons!10383 (h!11326 (_ BitVec 64)) (t!16606 List!10387)) )
))
(declare-fun arrayNoDuplicates!0 (array!33780 (_ BitVec 32) List!10387) Bool)

(assert (=> b!532995 (= res!328341 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10384))))

(declare-fun b!532996 () Bool)

(assert (=> b!532996 (= e!310180 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!532998 () Bool)

(declare-fun res!328348 () Bool)

(assert (=> b!532998 (=> (not res!328348) (not e!310182))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!532998 (= res!328348 (and (= (size!16594 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16594 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16594 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532999 () Bool)

(declare-fun res!328344 () Bool)

(assert (=> b!532999 (=> (not res!328344) (not e!310180))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33780 (_ BitVec 32)) SeekEntryResult!4684)

(assert (=> b!532999 (= res!328344 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16229 a!3154) j!147) a!3154 mask!3216) (Intermediate!4684 false resIndex!32 resX!32)))))

(declare-fun b!533000 () Bool)

(declare-fun res!328343 () Bool)

(assert (=> b!533000 (=> (not res!328343) (not e!310180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33780 (_ BitVec 32)) Bool)

(assert (=> b!533000 (= res!328343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533001 () Bool)

(declare-fun res!328347 () Bool)

(assert (=> b!533001 (=> (not res!328347) (not e!310182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533001 (= res!328347 (validKeyInArray!0 k0!1998))))

(declare-fun b!533002 () Bool)

(declare-fun res!328349 () Bool)

(assert (=> b!533002 (=> (not res!328349) (not e!310180))))

(assert (=> b!533002 (= res!328349 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16594 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16594 a!3154)) (= (select (arr!16229 a!3154) resIndex!32) (select (arr!16229 a!3154) j!147))))))

(declare-fun b!532997 () Bool)

(declare-fun res!328346 () Bool)

(assert (=> b!532997 (=> (not res!328346) (not e!310182))))

(assert (=> b!532997 (= res!328346 (validKeyInArray!0 (select (arr!16229 a!3154) j!147)))))

(declare-fun res!328340 () Bool)

(assert (=> start!48558 (=> (not res!328340) (not e!310182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48558 (= res!328340 (validMask!0 mask!3216))))

(assert (=> start!48558 e!310182))

(assert (=> start!48558 true))

(declare-fun array_inv!12112 (array!33780) Bool)

(assert (=> start!48558 (array_inv!12112 a!3154)))

(assert (= (and start!48558 res!328340) b!532998))

(assert (= (and b!532998 res!328348) b!532997))

(assert (= (and b!532997 res!328346) b!533001))

(assert (= (and b!533001 res!328347) b!532994))

(assert (= (and b!532994 res!328345) b!532993))

(assert (= (and b!532993 res!328342) b!533000))

(assert (= (and b!533000 res!328343) b!532995))

(assert (= (and b!532995 res!328341) b!533002))

(assert (= (and b!533002 res!328349) b!532999))

(assert (= (and b!532999 res!328344) b!532996))

(declare-fun m!512431 () Bool)

(assert (=> b!532999 m!512431))

(assert (=> b!532999 m!512431))

(declare-fun m!512433 () Bool)

(assert (=> b!532999 m!512433))

(declare-fun m!512435 () Bool)

(assert (=> b!533001 m!512435))

(declare-fun m!512437 () Bool)

(assert (=> b!533002 m!512437))

(assert (=> b!533002 m!512431))

(declare-fun m!512439 () Bool)

(assert (=> b!532994 m!512439))

(declare-fun m!512441 () Bool)

(assert (=> start!48558 m!512441))

(declare-fun m!512443 () Bool)

(assert (=> start!48558 m!512443))

(declare-fun m!512445 () Bool)

(assert (=> b!532995 m!512445))

(declare-fun m!512447 () Bool)

(assert (=> b!532993 m!512447))

(declare-fun m!512449 () Bool)

(assert (=> b!533000 m!512449))

(assert (=> b!532997 m!512431))

(assert (=> b!532997 m!512431))

(declare-fun m!512451 () Bool)

(assert (=> b!532997 m!512451))

(check-sat (not b!532999) (not b!533000) (not b!533001) (not start!48558) (not b!532994) (not b!532997) (not b!532993) (not b!532995))
(check-sat)
