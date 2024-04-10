; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48802 () Bool)

(assert start!48802)

(declare-fun b!537120 () Bool)

(declare-fun res!332336 () Bool)

(declare-fun e!311678 () Bool)

(assert (=> b!537120 (=> (not res!332336) (not e!311678))))

(declare-datatypes ((array!34014 0))(
  ( (array!34015 (arr!16346 (Array (_ BitVec 32) (_ BitVec 64))) (size!16710 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34014)

(declare-datatypes ((List!10465 0))(
  ( (Nil!10462) (Cons!10461 (h!11404 (_ BitVec 64)) (t!16693 List!10465)) )
))
(declare-fun arrayNoDuplicates!0 (array!34014 (_ BitVec 32) List!10465) Bool)

(assert (=> b!537120 (= res!332336 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10462))))

(declare-fun b!537121 () Bool)

(declare-fun e!311679 () Bool)

(assert (=> b!537121 (= e!311679 e!311678)))

(declare-fun res!332327 () Bool)

(assert (=> b!537121 (=> (not res!332327) (not e!311678))))

(declare-datatypes ((SeekEntryResult!4804 0))(
  ( (MissingZero!4804 (index!21440 (_ BitVec 32))) (Found!4804 (index!21441 (_ BitVec 32))) (Intermediate!4804 (undefined!5616 Bool) (index!21442 (_ BitVec 32)) (x!50371 (_ BitVec 32))) (Undefined!4804) (MissingVacant!4804 (index!21443 (_ BitVec 32))) )
))
(declare-fun lt!246307 () SeekEntryResult!4804)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537121 (= res!332327 (or (= lt!246307 (MissingZero!4804 i!1153)) (= lt!246307 (MissingVacant!4804 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34014 (_ BitVec 32)) SeekEntryResult!4804)

(assert (=> b!537121 (= lt!246307 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537122 () Bool)

(declare-fun res!332324 () Bool)

(declare-fun e!311677 () Bool)

(assert (=> b!537122 (=> (not res!332324) (not e!311677))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun lt!246306 () SeekEntryResult!4804)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34014 (_ BitVec 32)) SeekEntryResult!4804)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537122 (= res!332324 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16346 a!3154) j!147) mask!3216) (select (arr!16346 a!3154) j!147) a!3154 mask!3216) lt!246306))))

(declare-fun b!537123 () Bool)

(declare-fun res!332326 () Bool)

(assert (=> b!537123 (=> (not res!332326) (not e!311679))))

(assert (=> b!537123 (= res!332326 (and (= (size!16710 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16710 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16710 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537124 () Bool)

(declare-fun res!332325 () Bool)

(assert (=> b!537124 (=> (not res!332325) (not e!311678))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537124 (= res!332325 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16710 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16710 a!3154)) (= (select (arr!16346 a!3154) resIndex!32) (select (arr!16346 a!3154) j!147))))))

(declare-fun b!537125 () Bool)

(declare-fun res!332334 () Bool)

(assert (=> b!537125 (=> (not res!332334) (not e!311679))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537125 (= res!332334 (validKeyInArray!0 (select (arr!16346 a!3154) j!147)))))

(declare-fun b!537126 () Bool)

(declare-fun e!311675 () Bool)

(assert (=> b!537126 (= e!311675 false)))

(declare-fun lt!246305 () (_ BitVec 32))

(declare-fun lt!246304 () SeekEntryResult!4804)

(assert (=> b!537126 (= lt!246304 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246305 (select (arr!16346 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537127 () Bool)

(assert (=> b!537127 (= e!311677 e!311675)))

(declare-fun res!332328 () Bool)

(assert (=> b!537127 (=> (not res!332328) (not e!311675))))

(assert (=> b!537127 (= res!332328 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246305 #b00000000000000000000000000000000) (bvslt lt!246305 (size!16710 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537127 (= lt!246305 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun res!332330 () Bool)

(assert (=> start!48802 (=> (not res!332330) (not e!311679))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48802 (= res!332330 (validMask!0 mask!3216))))

(assert (=> start!48802 e!311679))

(assert (=> start!48802 true))

(declare-fun array_inv!12142 (array!34014) Bool)

(assert (=> start!48802 (array_inv!12142 a!3154)))

(declare-fun b!537119 () Bool)

(assert (=> b!537119 (= e!311678 e!311677)))

(declare-fun res!332331 () Bool)

(assert (=> b!537119 (=> (not res!332331) (not e!311677))))

(assert (=> b!537119 (= res!332331 (= lt!246306 (Intermediate!4804 false resIndex!32 resX!32)))))

(assert (=> b!537119 (= lt!246306 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16346 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537128 () Bool)

(declare-fun res!332329 () Bool)

(assert (=> b!537128 (=> (not res!332329) (not e!311677))))

(assert (=> b!537128 (= res!332329 (and (not (= (select (arr!16346 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16346 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16346 a!3154) index!1177) (select (arr!16346 a!3154) j!147)))))))

(declare-fun b!537129 () Bool)

(declare-fun res!332335 () Bool)

(assert (=> b!537129 (=> (not res!332335) (not e!311678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34014 (_ BitVec 32)) Bool)

(assert (=> b!537129 (= res!332335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537130 () Bool)

(declare-fun res!332333 () Bool)

(assert (=> b!537130 (=> (not res!332333) (not e!311679))))

(assert (=> b!537130 (= res!332333 (validKeyInArray!0 k!1998))))

(declare-fun b!537131 () Bool)

(declare-fun res!332332 () Bool)

(assert (=> b!537131 (=> (not res!332332) (not e!311679))))

(declare-fun arrayContainsKey!0 (array!34014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537131 (= res!332332 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48802 res!332330) b!537123))

(assert (= (and b!537123 res!332326) b!537125))

(assert (= (and b!537125 res!332334) b!537130))

(assert (= (and b!537130 res!332333) b!537131))

(assert (= (and b!537131 res!332332) b!537121))

(assert (= (and b!537121 res!332327) b!537129))

(assert (= (and b!537129 res!332335) b!537120))

(assert (= (and b!537120 res!332336) b!537124))

(assert (= (and b!537124 res!332325) b!537119))

(assert (= (and b!537119 res!332331) b!537122))

(assert (= (and b!537122 res!332324) b!537128))

(assert (= (and b!537128 res!332329) b!537127))

(assert (= (and b!537127 res!332328) b!537126))

(declare-fun m!516409 () Bool)

(assert (=> b!537126 m!516409))

(assert (=> b!537126 m!516409))

(declare-fun m!516411 () Bool)

(assert (=> b!537126 m!516411))

(declare-fun m!516413 () Bool)

(assert (=> start!48802 m!516413))

(declare-fun m!516415 () Bool)

(assert (=> start!48802 m!516415))

(declare-fun m!516417 () Bool)

(assert (=> b!537120 m!516417))

(declare-fun m!516419 () Bool)

(assert (=> b!537131 m!516419))

(declare-fun m!516421 () Bool)

(assert (=> b!537127 m!516421))

(assert (=> b!537119 m!516409))

(assert (=> b!537119 m!516409))

(declare-fun m!516423 () Bool)

(assert (=> b!537119 m!516423))

(declare-fun m!516425 () Bool)

(assert (=> b!537129 m!516425))

(declare-fun m!516427 () Bool)

(assert (=> b!537130 m!516427))

(declare-fun m!516429 () Bool)

(assert (=> b!537128 m!516429))

(assert (=> b!537128 m!516409))

(declare-fun m!516431 () Bool)

(assert (=> b!537121 m!516431))

(declare-fun m!516433 () Bool)

(assert (=> b!537124 m!516433))

(assert (=> b!537124 m!516409))

(assert (=> b!537122 m!516409))

(assert (=> b!537122 m!516409))

(declare-fun m!516435 () Bool)

(assert (=> b!537122 m!516435))

(assert (=> b!537122 m!516435))

(assert (=> b!537122 m!516409))

(declare-fun m!516437 () Bool)

(assert (=> b!537122 m!516437))

(assert (=> b!537125 m!516409))

(assert (=> b!537125 m!516409))

(declare-fun m!516439 () Bool)

(assert (=> b!537125 m!516439))

(push 1)

(assert (not b!537120))

(assert (not b!537127))

(assert (not start!48802))

(assert (not b!537126))

(assert (not b!537122))

(assert (not b!537130))

(assert (not b!537121))

