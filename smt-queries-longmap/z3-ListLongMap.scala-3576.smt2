; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49234 () Bool)

(assert start!49234)

(declare-fun b!541816 () Bool)

(declare-fun e!313743 () Bool)

(assert (=> b!541816 (= e!313743 false)))

(declare-datatypes ((SeekEntryResult!4867 0))(
  ( (MissingZero!4867 (index!21692 (_ BitVec 32))) (Found!4867 (index!21693 (_ BitVec 32))) (Intermediate!4867 (undefined!5679 Bool) (index!21694 (_ BitVec 32)) (x!50759 (_ BitVec 32))) (Undefined!4867) (MissingVacant!4867 (index!21695 (_ BitVec 32))) )
))
(declare-fun lt!247806 () SeekEntryResult!4867)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34241 0))(
  ( (array!34242 (arr!16453 (Array (_ BitVec 32) (_ BitVec 64))) (size!16817 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34241)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34241 (_ BitVec 32)) SeekEntryResult!4867)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541816 (= lt!247806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16453 a!3154) j!147) mask!3216) (select (arr!16453 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541817 () Bool)

(declare-fun res!336444 () Bool)

(assert (=> b!541817 (=> (not res!336444) (not e!313743))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!541817 (= res!336444 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16453 a!3154) j!147) a!3154 mask!3216) (Intermediate!4867 false resIndex!32 resX!32)))))

(declare-fun b!541818 () Bool)

(declare-fun res!336445 () Bool)

(assert (=> b!541818 (=> (not res!336445) (not e!313743))))

(assert (=> b!541818 (= res!336445 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16817 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16817 a!3154)) (= (select (arr!16453 a!3154) resIndex!32) (select (arr!16453 a!3154) j!147))))))

(declare-fun b!541819 () Bool)

(declare-fun res!336442 () Bool)

(assert (=> b!541819 (=> (not res!336442) (not e!313743))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34241 (_ BitVec 32)) Bool)

(assert (=> b!541819 (= res!336442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541820 () Bool)

(declare-fun res!336447 () Bool)

(assert (=> b!541820 (=> (not res!336447) (not e!313743))))

(declare-datatypes ((List!10479 0))(
  ( (Nil!10476) (Cons!10475 (h!11430 (_ BitVec 64)) (t!16699 List!10479)) )
))
(declare-fun arrayNoDuplicates!0 (array!34241 (_ BitVec 32) List!10479) Bool)

(assert (=> b!541820 (= res!336447 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10476))))

(declare-fun b!541821 () Bool)

(declare-fun e!313742 () Bool)

(assert (=> b!541821 (= e!313742 e!313743)))

(declare-fun res!336441 () Bool)

(assert (=> b!541821 (=> (not res!336441) (not e!313743))))

(declare-fun lt!247807 () SeekEntryResult!4867)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541821 (= res!336441 (or (= lt!247807 (MissingZero!4867 i!1153)) (= lt!247807 (MissingVacant!4867 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34241 (_ BitVec 32)) SeekEntryResult!4867)

(assert (=> b!541821 (= lt!247807 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!541822 () Bool)

(declare-fun res!336440 () Bool)

(assert (=> b!541822 (=> (not res!336440) (not e!313742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541822 (= res!336440 (validKeyInArray!0 (select (arr!16453 a!3154) j!147)))))

(declare-fun b!541823 () Bool)

(declare-fun res!336446 () Bool)

(assert (=> b!541823 (=> (not res!336446) (not e!313742))))

(assert (=> b!541823 (= res!336446 (validKeyInArray!0 k0!1998))))

(declare-fun b!541825 () Bool)

(declare-fun res!336443 () Bool)

(assert (=> b!541825 (=> (not res!336443) (not e!313742))))

(assert (=> b!541825 (= res!336443 (and (= (size!16817 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16817 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16817 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541824 () Bool)

(declare-fun res!336439 () Bool)

(assert (=> b!541824 (=> (not res!336439) (not e!313742))))

(declare-fun arrayContainsKey!0 (array!34241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541824 (= res!336439 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!336448 () Bool)

(assert (=> start!49234 (=> (not res!336448) (not e!313742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49234 (= res!336448 (validMask!0 mask!3216))))

(assert (=> start!49234 e!313742))

(assert (=> start!49234 true))

(declare-fun array_inv!12312 (array!34241) Bool)

(assert (=> start!49234 (array_inv!12312 a!3154)))

(assert (= (and start!49234 res!336448) b!541825))

(assert (= (and b!541825 res!336443) b!541822))

(assert (= (and b!541822 res!336440) b!541823))

(assert (= (and b!541823 res!336446) b!541824))

(assert (= (and b!541824 res!336439) b!541821))

(assert (= (and b!541821 res!336441) b!541819))

(assert (= (and b!541819 res!336442) b!541820))

(assert (= (and b!541820 res!336447) b!541818))

(assert (= (and b!541818 res!336445) b!541817))

(assert (= (and b!541817 res!336444) b!541816))

(declare-fun m!520399 () Bool)

(assert (=> b!541823 m!520399))

(declare-fun m!520401 () Bool)

(assert (=> b!541821 m!520401))

(declare-fun m!520403 () Bool)

(assert (=> b!541824 m!520403))

(declare-fun m!520405 () Bool)

(assert (=> b!541817 m!520405))

(assert (=> b!541817 m!520405))

(declare-fun m!520407 () Bool)

(assert (=> b!541817 m!520407))

(declare-fun m!520409 () Bool)

(assert (=> b!541818 m!520409))

(assert (=> b!541818 m!520405))

(declare-fun m!520411 () Bool)

(assert (=> b!541820 m!520411))

(assert (=> b!541822 m!520405))

(assert (=> b!541822 m!520405))

(declare-fun m!520413 () Bool)

(assert (=> b!541822 m!520413))

(assert (=> b!541816 m!520405))

(assert (=> b!541816 m!520405))

(declare-fun m!520415 () Bool)

(assert (=> b!541816 m!520415))

(assert (=> b!541816 m!520415))

(assert (=> b!541816 m!520405))

(declare-fun m!520417 () Bool)

(assert (=> b!541816 m!520417))

(declare-fun m!520419 () Bool)

(assert (=> b!541819 m!520419))

(declare-fun m!520421 () Bool)

(assert (=> start!49234 m!520421))

(declare-fun m!520423 () Bool)

(assert (=> start!49234 m!520423))

(check-sat (not b!541820) (not b!541819) (not b!541823) (not b!541821) (not b!541816) (not b!541817) (not start!49234) (not b!541822) (not b!541824))
(check-sat)
