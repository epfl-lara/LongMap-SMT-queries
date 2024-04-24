; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49360 () Bool)

(assert start!49360)

(declare-fun b!543350 () Bool)

(declare-fun res!337799 () Bool)

(declare-fun e!314331 () Bool)

(assert (=> b!543350 (=> (not res!337799) (not e!314331))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543350 (= res!337799 (validKeyInArray!0 k0!1998))))

(declare-fun b!543351 () Bool)

(declare-fun res!337800 () Bool)

(declare-fun e!314332 () Bool)

(assert (=> b!543351 (=> (not res!337800) (not e!314332))))

(declare-datatypes ((array!34316 0))(
  ( (array!34317 (arr!16489 (Array (_ BitVec 32) (_ BitVec 64))) (size!16853 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34316)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34316 (_ BitVec 32)) Bool)

(assert (=> b!543351 (= res!337800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543352 () Bool)

(declare-fun res!337796 () Bool)

(declare-fun e!314334 () Bool)

(assert (=> b!543352 (=> (not res!337796) (not e!314334))))

(declare-datatypes ((SeekEntryResult!4903 0))(
  ( (MissingZero!4903 (index!21836 (_ BitVec 32))) (Found!4903 (index!21837 (_ BitVec 32))) (Intermediate!4903 (undefined!5715 Bool) (index!21838 (_ BitVec 32)) (x!50897 (_ BitVec 32))) (Undefined!4903) (MissingVacant!4903 (index!21839 (_ BitVec 32))) )
))
(declare-fun lt!248208 () SeekEntryResult!4903)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34316 (_ BitVec 32)) SeekEntryResult!4903)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543352 (= res!337796 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16489 a!3154) j!147) mask!3216) (select (arr!16489 a!3154) j!147) a!3154 mask!3216) lt!248208))))

(declare-fun b!543353 () Bool)

(assert (=> b!543353 (= e!314334 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!248209 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543353 (= lt!248209 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!543354 () Bool)

(declare-fun res!337798 () Bool)

(assert (=> b!543354 (=> (not res!337798) (not e!314331))))

(declare-fun arrayContainsKey!0 (array!34316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543354 (= res!337798 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543356 () Bool)

(assert (=> b!543356 (= e!314332 e!314334)))

(declare-fun res!337801 () Bool)

(assert (=> b!543356 (=> (not res!337801) (not e!314334))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543356 (= res!337801 (= lt!248208 (Intermediate!4903 false resIndex!32 resX!32)))))

(assert (=> b!543356 (= lt!248208 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16489 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543357 () Bool)

(declare-fun res!337804 () Bool)

(assert (=> b!543357 (=> (not res!337804) (not e!314331))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543357 (= res!337804 (and (= (size!16853 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16853 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16853 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543358 () Bool)

(declare-fun res!337802 () Bool)

(assert (=> b!543358 (=> (not res!337802) (not e!314332))))

(declare-datatypes ((List!10515 0))(
  ( (Nil!10512) (Cons!10511 (h!11469 (_ BitVec 64)) (t!16735 List!10515)) )
))
(declare-fun arrayNoDuplicates!0 (array!34316 (_ BitVec 32) List!10515) Bool)

(assert (=> b!543358 (= res!337802 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10512))))

(declare-fun b!543359 () Bool)

(declare-fun res!337803 () Bool)

(assert (=> b!543359 (=> (not res!337803) (not e!314331))))

(assert (=> b!543359 (= res!337803 (validKeyInArray!0 (select (arr!16489 a!3154) j!147)))))

(declare-fun b!543360 () Bool)

(declare-fun res!337807 () Bool)

(assert (=> b!543360 (=> (not res!337807) (not e!314334))))

(assert (=> b!543360 (= res!337807 (and (not (= (select (arr!16489 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16489 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16489 a!3154) index!1177) (select (arr!16489 a!3154) j!147)))))))

(declare-fun b!543361 () Bool)

(assert (=> b!543361 (= e!314331 e!314332)))

(declare-fun res!337806 () Bool)

(assert (=> b!543361 (=> (not res!337806) (not e!314332))))

(declare-fun lt!248207 () SeekEntryResult!4903)

(assert (=> b!543361 (= res!337806 (or (= lt!248207 (MissingZero!4903 i!1153)) (= lt!248207 (MissingVacant!4903 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34316 (_ BitVec 32)) SeekEntryResult!4903)

(assert (=> b!543361 (= lt!248207 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543355 () Bool)

(declare-fun res!337805 () Bool)

(assert (=> b!543355 (=> (not res!337805) (not e!314332))))

(assert (=> b!543355 (= res!337805 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16853 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16853 a!3154)) (= (select (arr!16489 a!3154) resIndex!32) (select (arr!16489 a!3154) j!147))))))

(declare-fun res!337797 () Bool)

(assert (=> start!49360 (=> (not res!337797) (not e!314331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49360 (= res!337797 (validMask!0 mask!3216))))

(assert (=> start!49360 e!314331))

(assert (=> start!49360 true))

(declare-fun array_inv!12348 (array!34316) Bool)

(assert (=> start!49360 (array_inv!12348 a!3154)))

(assert (= (and start!49360 res!337797) b!543357))

(assert (= (and b!543357 res!337804) b!543359))

(assert (= (and b!543359 res!337803) b!543350))

(assert (= (and b!543350 res!337799) b!543354))

(assert (= (and b!543354 res!337798) b!543361))

(assert (= (and b!543361 res!337806) b!543351))

(assert (= (and b!543351 res!337800) b!543358))

(assert (= (and b!543358 res!337802) b!543355))

(assert (= (and b!543355 res!337805) b!543356))

(assert (= (and b!543356 res!337801) b!543352))

(assert (= (and b!543352 res!337796) b!543360))

(assert (= (and b!543360 res!337807) b!543353))

(declare-fun m!521611 () Bool)

(assert (=> start!49360 m!521611))

(declare-fun m!521613 () Bool)

(assert (=> start!49360 m!521613))

(declare-fun m!521615 () Bool)

(assert (=> b!543351 m!521615))

(declare-fun m!521617 () Bool)

(assert (=> b!543360 m!521617))

(declare-fun m!521619 () Bool)

(assert (=> b!543360 m!521619))

(declare-fun m!521621 () Bool)

(assert (=> b!543355 m!521621))

(assert (=> b!543355 m!521619))

(declare-fun m!521623 () Bool)

(assert (=> b!543358 m!521623))

(declare-fun m!521625 () Bool)

(assert (=> b!543361 m!521625))

(declare-fun m!521627 () Bool)

(assert (=> b!543353 m!521627))

(declare-fun m!521629 () Bool)

(assert (=> b!543350 m!521629))

(assert (=> b!543359 m!521619))

(assert (=> b!543359 m!521619))

(declare-fun m!521631 () Bool)

(assert (=> b!543359 m!521631))

(assert (=> b!543352 m!521619))

(assert (=> b!543352 m!521619))

(declare-fun m!521633 () Bool)

(assert (=> b!543352 m!521633))

(assert (=> b!543352 m!521633))

(assert (=> b!543352 m!521619))

(declare-fun m!521635 () Bool)

(assert (=> b!543352 m!521635))

(declare-fun m!521637 () Bool)

(assert (=> b!543354 m!521637))

(assert (=> b!543356 m!521619))

(assert (=> b!543356 m!521619))

(declare-fun m!521639 () Bool)

(assert (=> b!543356 m!521639))

(check-sat (not start!49360) (not b!543361) (not b!543358) (not b!543351) (not b!543350) (not b!543353) (not b!543352) (not b!543359) (not b!543356) (not b!543354))
(check-sat)
