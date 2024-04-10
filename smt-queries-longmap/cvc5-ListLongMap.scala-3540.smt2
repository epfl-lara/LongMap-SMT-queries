; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48810 () Bool)

(assert start!48810)

(declare-fun b!537275 () Bool)

(declare-fun res!332489 () Bool)

(declare-fun e!311735 () Bool)

(assert (=> b!537275 (=> (not res!332489) (not e!311735))))

(declare-datatypes ((array!34022 0))(
  ( (array!34023 (arr!16350 (Array (_ BitVec 32) (_ BitVec 64))) (size!16714 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34022)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537275 (= res!332489 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537276 () Bool)

(declare-fun res!332488 () Bool)

(declare-fun e!311737 () Bool)

(assert (=> b!537276 (=> (not res!332488) (not e!311737))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4808 0))(
  ( (MissingZero!4808 (index!21456 (_ BitVec 32))) (Found!4808 (index!21457 (_ BitVec 32))) (Intermediate!4808 (undefined!5620 Bool) (index!21458 (_ BitVec 32)) (x!50391 (_ BitVec 32))) (Undefined!4808) (MissingVacant!4808 (index!21459 (_ BitVec 32))) )
))
(declare-fun lt!246355 () SeekEntryResult!4808)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34022 (_ BitVec 32)) SeekEntryResult!4808)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537276 (= res!332488 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16350 a!3154) j!147) mask!3216) (select (arr!16350 a!3154) j!147) a!3154 mask!3216) lt!246355))))

(declare-fun b!537277 () Bool)

(declare-fun e!311736 () Bool)

(assert (=> b!537277 (= e!311736 false)))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246352 () SeekEntryResult!4808)

(declare-fun lt!246353 () (_ BitVec 32))

(assert (=> b!537277 (= lt!246352 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246353 (select (arr!16350 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537278 () Bool)

(declare-fun res!332481 () Bool)

(declare-fun e!311738 () Bool)

(assert (=> b!537278 (=> (not res!332481) (not e!311738))))

(declare-datatypes ((List!10469 0))(
  ( (Nil!10466) (Cons!10465 (h!11408 (_ BitVec 64)) (t!16697 List!10469)) )
))
(declare-fun arrayNoDuplicates!0 (array!34022 (_ BitVec 32) List!10469) Bool)

(assert (=> b!537278 (= res!332481 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10466))))

(declare-fun b!537279 () Bool)

(assert (=> b!537279 (= e!311737 e!311736)))

(declare-fun res!332485 () Bool)

(assert (=> b!537279 (=> (not res!332485) (not e!311736))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537279 (= res!332485 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246353 #b00000000000000000000000000000000) (bvslt lt!246353 (size!16714 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537279 (= lt!246353 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537280 () Bool)

(declare-fun res!332492 () Bool)

(assert (=> b!537280 (=> (not res!332492) (not e!311737))))

(assert (=> b!537280 (= res!332492 (and (not (= (select (arr!16350 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16350 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16350 a!3154) index!1177) (select (arr!16350 a!3154) j!147)))))))

(declare-fun b!537281 () Bool)

(assert (=> b!537281 (= e!311738 e!311737)))

(declare-fun res!332484 () Bool)

(assert (=> b!537281 (=> (not res!332484) (not e!311737))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!537281 (= res!332484 (= lt!246355 (Intermediate!4808 false resIndex!32 resX!32)))))

(assert (=> b!537281 (= lt!246355 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16350 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537282 () Bool)

(declare-fun res!332480 () Bool)

(assert (=> b!537282 (=> (not res!332480) (not e!311738))))

(assert (=> b!537282 (= res!332480 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16714 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16714 a!3154)) (= (select (arr!16350 a!3154) resIndex!32) (select (arr!16350 a!3154) j!147))))))

(declare-fun b!537283 () Bool)

(declare-fun res!332487 () Bool)

(assert (=> b!537283 (=> (not res!332487) (not e!311735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537283 (= res!332487 (validKeyInArray!0 (select (arr!16350 a!3154) j!147)))))

(declare-fun b!537284 () Bool)

(declare-fun res!332482 () Bool)

(assert (=> b!537284 (=> (not res!332482) (not e!311738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34022 (_ BitVec 32)) Bool)

(assert (=> b!537284 (= res!332482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537285 () Bool)

(declare-fun res!332486 () Bool)

(assert (=> b!537285 (=> (not res!332486) (not e!311735))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537285 (= res!332486 (and (= (size!16714 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16714 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16714 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!332490 () Bool)

(assert (=> start!48810 (=> (not res!332490) (not e!311735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48810 (= res!332490 (validMask!0 mask!3216))))

(assert (=> start!48810 e!311735))

(assert (=> start!48810 true))

(declare-fun array_inv!12146 (array!34022) Bool)

(assert (=> start!48810 (array_inv!12146 a!3154)))

(declare-fun b!537286 () Bool)

(assert (=> b!537286 (= e!311735 e!311738)))

(declare-fun res!332483 () Bool)

(assert (=> b!537286 (=> (not res!332483) (not e!311738))))

(declare-fun lt!246354 () SeekEntryResult!4808)

(assert (=> b!537286 (= res!332483 (or (= lt!246354 (MissingZero!4808 i!1153)) (= lt!246354 (MissingVacant!4808 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34022 (_ BitVec 32)) SeekEntryResult!4808)

(assert (=> b!537286 (= lt!246354 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537287 () Bool)

(declare-fun res!332491 () Bool)

(assert (=> b!537287 (=> (not res!332491) (not e!311735))))

(assert (=> b!537287 (= res!332491 (validKeyInArray!0 k!1998))))

(assert (= (and start!48810 res!332490) b!537285))

(assert (= (and b!537285 res!332486) b!537283))

(assert (= (and b!537283 res!332487) b!537287))

(assert (= (and b!537287 res!332491) b!537275))

(assert (= (and b!537275 res!332489) b!537286))

(assert (= (and b!537286 res!332483) b!537284))

(assert (= (and b!537284 res!332482) b!537278))

(assert (= (and b!537278 res!332481) b!537282))

(assert (= (and b!537282 res!332480) b!537281))

(assert (= (and b!537281 res!332484) b!537276))

(assert (= (and b!537276 res!332488) b!537280))

(assert (= (and b!537280 res!332492) b!537279))

(assert (= (and b!537279 res!332485) b!537277))

(declare-fun m!516537 () Bool)

(assert (=> b!537287 m!516537))

(declare-fun m!516539 () Bool)

(assert (=> b!537279 m!516539))

(declare-fun m!516541 () Bool)

(assert (=> b!537282 m!516541))

(declare-fun m!516543 () Bool)

(assert (=> b!537282 m!516543))

(declare-fun m!516545 () Bool)

(assert (=> start!48810 m!516545))

(declare-fun m!516547 () Bool)

(assert (=> start!48810 m!516547))

(declare-fun m!516549 () Bool)

(assert (=> b!537275 m!516549))

(declare-fun m!516551 () Bool)

(assert (=> b!537280 m!516551))

(assert (=> b!537280 m!516543))

(declare-fun m!516553 () Bool)

(assert (=> b!537284 m!516553))

(assert (=> b!537283 m!516543))

(assert (=> b!537283 m!516543))

(declare-fun m!516555 () Bool)

(assert (=> b!537283 m!516555))

(assert (=> b!537276 m!516543))

(assert (=> b!537276 m!516543))

(declare-fun m!516557 () Bool)

(assert (=> b!537276 m!516557))

(assert (=> b!537276 m!516557))

(assert (=> b!537276 m!516543))

(declare-fun m!516559 () Bool)

(assert (=> b!537276 m!516559))

(assert (=> b!537277 m!516543))

(assert (=> b!537277 m!516543))

(declare-fun m!516561 () Bool)

(assert (=> b!537277 m!516561))

(assert (=> b!537281 m!516543))

(assert (=> b!537281 m!516543))

(declare-fun m!516563 () Bool)

(assert (=> b!537281 m!516563))

(declare-fun m!516565 () Bool)

(assert (=> b!537286 m!516565))

(declare-fun m!516567 () Bool)

(assert (=> b!537278 m!516567))

(push 1)

