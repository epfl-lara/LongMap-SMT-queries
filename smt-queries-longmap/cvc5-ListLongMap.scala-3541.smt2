; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48816 () Bool)

(assert start!48816)

(declare-fun b!537392 () Bool)

(declare-fun e!311784 () Bool)

(declare-fun e!311782 () Bool)

(assert (=> b!537392 (= e!311784 e!311782)))

(declare-fun res!332608 () Bool)

(assert (=> b!537392 (=> (not res!332608) (not e!311782))))

(declare-datatypes ((SeekEntryResult!4811 0))(
  ( (MissingZero!4811 (index!21468 (_ BitVec 32))) (Found!4811 (index!21469 (_ BitVec 32))) (Intermediate!4811 (undefined!5623 Bool) (index!21470 (_ BitVec 32)) (x!50402 (_ BitVec 32))) (Undefined!4811) (MissingVacant!4811 (index!21471 (_ BitVec 32))) )
))
(declare-fun lt!246388 () SeekEntryResult!4811)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537392 (= res!332608 (= lt!246388 (Intermediate!4811 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34028 0))(
  ( (array!34029 (arr!16353 (Array (_ BitVec 32) (_ BitVec 64))) (size!16717 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34028)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34028 (_ BitVec 32)) SeekEntryResult!4811)

(assert (=> b!537392 (= lt!246388 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16353 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537393 () Bool)

(declare-fun e!311780 () Bool)

(assert (=> b!537393 (= e!311780 e!311784)))

(declare-fun res!332604 () Bool)

(assert (=> b!537393 (=> (not res!332604) (not e!311784))))

(declare-fun lt!246390 () SeekEntryResult!4811)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537393 (= res!332604 (or (= lt!246390 (MissingZero!4811 i!1153)) (= lt!246390 (MissingVacant!4811 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34028 (_ BitVec 32)) SeekEntryResult!4811)

(assert (=> b!537393 (= lt!246390 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537394 () Bool)

(declare-fun res!332598 () Bool)

(assert (=> b!537394 (=> (not res!332598) (not e!311780))))

(declare-fun arrayContainsKey!0 (array!34028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537394 (= res!332598 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537395 () Bool)

(declare-fun res!332606 () Bool)

(assert (=> b!537395 (=> (not res!332606) (not e!311784))))

(assert (=> b!537395 (= res!332606 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16717 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16717 a!3154)) (= (select (arr!16353 a!3154) resIndex!32) (select (arr!16353 a!3154) j!147))))))

(declare-fun b!537396 () Bool)

(declare-fun res!332603 () Bool)

(assert (=> b!537396 (=> (not res!332603) (not e!311780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537396 (= res!332603 (validKeyInArray!0 (select (arr!16353 a!3154) j!147)))))

(declare-fun b!537397 () Bool)

(declare-fun res!332600 () Bool)

(assert (=> b!537397 (=> (not res!332600) (not e!311782))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537397 (= res!332600 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16353 a!3154) j!147) mask!3216) (select (arr!16353 a!3154) j!147) a!3154 mask!3216) lt!246388))))

(declare-fun b!537398 () Bool)

(declare-fun res!332605 () Bool)

(assert (=> b!537398 (=> (not res!332605) (not e!311780))))

(assert (=> b!537398 (= res!332605 (and (= (size!16717 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16717 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16717 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537399 () Bool)

(declare-fun res!332599 () Bool)

(assert (=> b!537399 (=> (not res!332599) (not e!311780))))

(assert (=> b!537399 (= res!332599 (validKeyInArray!0 k!1998))))

(declare-fun b!537400 () Bool)

(declare-fun res!332601 () Bool)

(assert (=> b!537400 (=> (not res!332601) (not e!311784))))

(declare-datatypes ((List!10472 0))(
  ( (Nil!10469) (Cons!10468 (h!11411 (_ BitVec 64)) (t!16700 List!10472)) )
))
(declare-fun arrayNoDuplicates!0 (array!34028 (_ BitVec 32) List!10472) Bool)

(assert (=> b!537400 (= res!332601 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10469))))

(declare-fun b!537401 () Bool)

(declare-fun e!311783 () Bool)

(assert (=> b!537401 (= e!311783 false)))

(declare-fun lt!246389 () (_ BitVec 32))

(declare-fun lt!246391 () SeekEntryResult!4811)

(assert (=> b!537401 (= lt!246391 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246389 (select (arr!16353 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537403 () Bool)

(declare-fun res!332602 () Bool)

(assert (=> b!537403 (=> (not res!332602) (not e!311784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34028 (_ BitVec 32)) Bool)

(assert (=> b!537403 (= res!332602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537404 () Bool)

(declare-fun res!332609 () Bool)

(assert (=> b!537404 (=> (not res!332609) (not e!311782))))

(assert (=> b!537404 (= res!332609 (and (not (= (select (arr!16353 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16353 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16353 a!3154) index!1177) (select (arr!16353 a!3154) j!147)))))))

(declare-fun res!332597 () Bool)

(assert (=> start!48816 (=> (not res!332597) (not e!311780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48816 (= res!332597 (validMask!0 mask!3216))))

(assert (=> start!48816 e!311780))

(assert (=> start!48816 true))

(declare-fun array_inv!12149 (array!34028) Bool)

(assert (=> start!48816 (array_inv!12149 a!3154)))

(declare-fun b!537402 () Bool)

(assert (=> b!537402 (= e!311782 e!311783)))

(declare-fun res!332607 () Bool)

(assert (=> b!537402 (=> (not res!332607) (not e!311783))))

(assert (=> b!537402 (= res!332607 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246389 #b00000000000000000000000000000000) (bvslt lt!246389 (size!16717 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537402 (= lt!246389 (nextIndex!0 index!1177 x!1030 mask!3216))))

(assert (= (and start!48816 res!332597) b!537398))

(assert (= (and b!537398 res!332605) b!537396))

(assert (= (and b!537396 res!332603) b!537399))

(assert (= (and b!537399 res!332599) b!537394))

(assert (= (and b!537394 res!332598) b!537393))

(assert (= (and b!537393 res!332604) b!537403))

(assert (= (and b!537403 res!332602) b!537400))

(assert (= (and b!537400 res!332601) b!537395))

(assert (= (and b!537395 res!332606) b!537392))

(assert (= (and b!537392 res!332608) b!537397))

(assert (= (and b!537397 res!332600) b!537404))

(assert (= (and b!537404 res!332609) b!537402))

(assert (= (and b!537402 res!332607) b!537401))

(declare-fun m!516633 () Bool)

(assert (=> start!48816 m!516633))

(declare-fun m!516635 () Bool)

(assert (=> start!48816 m!516635))

(declare-fun m!516637 () Bool)

(assert (=> b!537403 m!516637))

(declare-fun m!516639 () Bool)

(assert (=> b!537395 m!516639))

(declare-fun m!516641 () Bool)

(assert (=> b!537395 m!516641))

(assert (=> b!537392 m!516641))

(assert (=> b!537392 m!516641))

(declare-fun m!516643 () Bool)

(assert (=> b!537392 m!516643))

(declare-fun m!516645 () Bool)

(assert (=> b!537394 m!516645))

(declare-fun m!516647 () Bool)

(assert (=> b!537399 m!516647))

(declare-fun m!516649 () Bool)

(assert (=> b!537400 m!516649))

(assert (=> b!537396 m!516641))

(assert (=> b!537396 m!516641))

(declare-fun m!516651 () Bool)

(assert (=> b!537396 m!516651))

(declare-fun m!516653 () Bool)

(assert (=> b!537404 m!516653))

(assert (=> b!537404 m!516641))

(declare-fun m!516655 () Bool)

(assert (=> b!537402 m!516655))

(declare-fun m!516657 () Bool)

(assert (=> b!537393 m!516657))

(assert (=> b!537401 m!516641))

(assert (=> b!537401 m!516641))

(declare-fun m!516659 () Bool)

(assert (=> b!537401 m!516659))

(assert (=> b!537397 m!516641))

(assert (=> b!537397 m!516641))

(declare-fun m!516661 () Bool)

(assert (=> b!537397 m!516661))

(assert (=> b!537397 m!516661))

(assert (=> b!537397 m!516641))

(declare-fun m!516663 () Bool)

(assert (=> b!537397 m!516663))

(push 1)

