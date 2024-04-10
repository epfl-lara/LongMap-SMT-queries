; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49322 () Bool)

(assert start!49322)

(declare-fun b!543294 () Bool)

(declare-fun res!337851 () Bool)

(declare-fun e!314250 () Bool)

(assert (=> b!543294 (=> (not res!337851) (not e!314250))))

(declare-datatypes ((array!34330 0))(
  ( (array!34331 (arr!16498 (Array (_ BitVec 32) (_ BitVec 64))) (size!16862 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34330)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543294 (= res!337851 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543295 () Bool)

(declare-fun res!337848 () Bool)

(assert (=> b!543295 (=> (not res!337848) (not e!314250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543295 (= res!337848 (validKeyInArray!0 k0!1998))))

(declare-fun b!543296 () Bool)

(declare-fun res!337850 () Bool)

(declare-fun e!314253 () Bool)

(assert (=> b!543296 (=> (not res!337850) (not e!314253))))

(declare-datatypes ((SeekEntryResult!4956 0))(
  ( (MissingZero!4956 (index!22048 (_ BitVec 32))) (Found!4956 (index!22049 (_ BitVec 32))) (Intermediate!4956 (undefined!5768 Bool) (index!22050 (_ BitVec 32)) (x!50955 (_ BitVec 32))) (Undefined!4956) (MissingVacant!4956 (index!22051 (_ BitVec 32))) )
))
(declare-fun lt!248135 () SeekEntryResult!4956)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34330 (_ BitVec 32)) SeekEntryResult!4956)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543296 (= res!337850 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16498 a!3154) j!147) mask!3216) (select (arr!16498 a!3154) j!147) a!3154 mask!3216) lt!248135))))

(declare-fun b!543297 () Bool)

(assert (=> b!543297 (= e!314253 false)))

(declare-fun lt!248136 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543297 (= lt!248136 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543298 () Bool)

(declare-fun res!337854 () Bool)

(assert (=> b!543298 (=> (not res!337854) (not e!314253))))

(assert (=> b!543298 (= res!337854 (and (not (= (select (arr!16498 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16498 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16498 a!3154) index!1177) (select (arr!16498 a!3154) j!147)))))))

(declare-fun b!543300 () Bool)

(declare-fun e!314251 () Bool)

(assert (=> b!543300 (= e!314251 e!314253)))

(declare-fun res!337852 () Bool)

(assert (=> b!543300 (=> (not res!337852) (not e!314253))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543300 (= res!337852 (= lt!248135 (Intermediate!4956 false resIndex!32 resX!32)))))

(assert (=> b!543300 (= lt!248135 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16498 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543301 () Bool)

(declare-fun res!337845 () Bool)

(assert (=> b!543301 (=> (not res!337845) (not e!314250))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543301 (= res!337845 (and (= (size!16862 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16862 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16862 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543302 () Bool)

(assert (=> b!543302 (= e!314250 e!314251)))

(declare-fun res!337855 () Bool)

(assert (=> b!543302 (=> (not res!337855) (not e!314251))))

(declare-fun lt!248137 () SeekEntryResult!4956)

(assert (=> b!543302 (= res!337855 (or (= lt!248137 (MissingZero!4956 i!1153)) (= lt!248137 (MissingVacant!4956 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34330 (_ BitVec 32)) SeekEntryResult!4956)

(assert (=> b!543302 (= lt!248137 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543303 () Bool)

(declare-fun res!337856 () Bool)

(assert (=> b!543303 (=> (not res!337856) (not e!314251))))

(assert (=> b!543303 (= res!337856 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16862 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16862 a!3154)) (= (select (arr!16498 a!3154) resIndex!32) (select (arr!16498 a!3154) j!147))))))

(declare-fun b!543304 () Bool)

(declare-fun res!337849 () Bool)

(assert (=> b!543304 (=> (not res!337849) (not e!314250))))

(assert (=> b!543304 (= res!337849 (validKeyInArray!0 (select (arr!16498 a!3154) j!147)))))

(declare-fun b!543305 () Bool)

(declare-fun res!337847 () Bool)

(assert (=> b!543305 (=> (not res!337847) (not e!314251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34330 (_ BitVec 32)) Bool)

(assert (=> b!543305 (= res!337847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543299 () Bool)

(declare-fun res!337853 () Bool)

(assert (=> b!543299 (=> (not res!337853) (not e!314251))))

(declare-datatypes ((List!10617 0))(
  ( (Nil!10614) (Cons!10613 (h!11568 (_ BitVec 64)) (t!16845 List!10617)) )
))
(declare-fun arrayNoDuplicates!0 (array!34330 (_ BitVec 32) List!10617) Bool)

(assert (=> b!543299 (= res!337853 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10614))))

(declare-fun res!337846 () Bool)

(assert (=> start!49322 (=> (not res!337846) (not e!314250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49322 (= res!337846 (validMask!0 mask!3216))))

(assert (=> start!49322 e!314250))

(assert (=> start!49322 true))

(declare-fun array_inv!12294 (array!34330) Bool)

(assert (=> start!49322 (array_inv!12294 a!3154)))

(assert (= (and start!49322 res!337846) b!543301))

(assert (= (and b!543301 res!337845) b!543304))

(assert (= (and b!543304 res!337849) b!543295))

(assert (= (and b!543295 res!337848) b!543294))

(assert (= (and b!543294 res!337851) b!543302))

(assert (= (and b!543302 res!337855) b!543305))

(assert (= (and b!543305 res!337847) b!543299))

(assert (= (and b!543299 res!337853) b!543303))

(assert (= (and b!543303 res!337856) b!543300))

(assert (= (and b!543300 res!337852) b!543296))

(assert (= (and b!543296 res!337850) b!543298))

(assert (= (and b!543298 res!337854) b!543297))

(declare-fun m!521409 () Bool)

(assert (=> b!543299 m!521409))

(declare-fun m!521411 () Bool)

(assert (=> b!543296 m!521411))

(assert (=> b!543296 m!521411))

(declare-fun m!521413 () Bool)

(assert (=> b!543296 m!521413))

(assert (=> b!543296 m!521413))

(assert (=> b!543296 m!521411))

(declare-fun m!521415 () Bool)

(assert (=> b!543296 m!521415))

(assert (=> b!543300 m!521411))

(assert (=> b!543300 m!521411))

(declare-fun m!521417 () Bool)

(assert (=> b!543300 m!521417))

(assert (=> b!543304 m!521411))

(assert (=> b!543304 m!521411))

(declare-fun m!521419 () Bool)

(assert (=> b!543304 m!521419))

(declare-fun m!521421 () Bool)

(assert (=> b!543302 m!521421))

(declare-fun m!521423 () Bool)

(assert (=> b!543303 m!521423))

(assert (=> b!543303 m!521411))

(declare-fun m!521425 () Bool)

(assert (=> b!543305 m!521425))

(declare-fun m!521427 () Bool)

(assert (=> b!543294 m!521427))

(declare-fun m!521429 () Bool)

(assert (=> b!543297 m!521429))

(declare-fun m!521431 () Bool)

(assert (=> b!543295 m!521431))

(declare-fun m!521433 () Bool)

(assert (=> start!49322 m!521433))

(declare-fun m!521435 () Bool)

(assert (=> start!49322 m!521435))

(declare-fun m!521437 () Bool)

(assert (=> b!543298 m!521437))

(assert (=> b!543298 m!521411))

(check-sat (not b!543295) (not b!543297) (not start!49322) (not b!543294) (not b!543302) (not b!543305) (not b!543304) (not b!543299) (not b!543296) (not b!543300))
(check-sat)
