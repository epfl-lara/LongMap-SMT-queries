; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51584 () Bool)

(assert start!51584)

(declare-fun b!564339 () Bool)

(declare-fun e!325010 () Bool)

(declare-fun e!325011 () Bool)

(assert (=> b!564339 (= e!325010 e!325011)))

(declare-fun res!355638 () Bool)

(assert (=> b!564339 (=> (not res!355638) (not e!325011))))

(declare-datatypes ((SeekEntryResult!5476 0))(
  ( (MissingZero!5476 (index!24131 (_ BitVec 32))) (Found!5476 (index!24132 (_ BitVec 32))) (Intermediate!5476 (undefined!6288 Bool) (index!24133 (_ BitVec 32)) (x!53014 (_ BitVec 32))) (Undefined!5476) (MissingVacant!5476 (index!24134 (_ BitVec 32))) )
))
(declare-fun lt!257376 () SeekEntryResult!5476)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564339 (= res!355638 (or (= lt!257376 (MissingZero!5476 i!1132)) (= lt!257376 (MissingVacant!5476 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35458 0))(
  ( (array!35459 (arr!17030 (Array (_ BitVec 32) (_ BitVec 64))) (size!17395 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35458)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35458 (_ BitVec 32)) SeekEntryResult!5476)

(assert (=> b!564339 (= lt!257376 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564340 () Bool)

(declare-fun res!355635 () Bool)

(assert (=> b!564340 (=> (not res!355635) (not e!325010))))

(declare-fun arrayContainsKey!0 (array!35458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564340 (= res!355635 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564341 () Bool)

(declare-fun res!355639 () Bool)

(assert (=> b!564341 (=> (not res!355639) (not e!325011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35458 (_ BitVec 32)) Bool)

(assert (=> b!564341 (= res!355639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564342 () Bool)

(assert (=> b!564342 (= e!325011 false)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!257375 () SeekEntryResult!5476)

(declare-fun lt!257377 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35458 (_ BitVec 32)) SeekEntryResult!5476)

(assert (=> b!564342 (= lt!257375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257377 (select (store (arr!17030 a!3118) i!1132 k0!1914) j!142) (array!35459 (store (arr!17030 a!3118) i!1132 k0!1914) (size!17395 a!3118)) mask!3119))))

(declare-fun lt!257374 () (_ BitVec 32))

(declare-fun lt!257373 () SeekEntryResult!5476)

(assert (=> b!564342 (= lt!257373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257374 (select (arr!17030 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564342 (= lt!257377 (toIndex!0 (select (store (arr!17030 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!564342 (= lt!257374 (toIndex!0 (select (arr!17030 a!3118) j!142) mask!3119))))

(declare-fun res!355634 () Bool)

(assert (=> start!51584 (=> (not res!355634) (not e!325010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51584 (= res!355634 (validMask!0 mask!3119))))

(assert (=> start!51584 e!325010))

(assert (=> start!51584 true))

(declare-fun array_inv!12913 (array!35458) Bool)

(assert (=> start!51584 (array_inv!12913 a!3118)))

(declare-fun b!564343 () Bool)

(declare-fun res!355637 () Bool)

(assert (=> b!564343 (=> (not res!355637) (not e!325010))))

(assert (=> b!564343 (= res!355637 (and (= (size!17395 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17395 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17395 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564344 () Bool)

(declare-fun res!355633 () Bool)

(assert (=> b!564344 (=> (not res!355633) (not e!325010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564344 (= res!355633 (validKeyInArray!0 (select (arr!17030 a!3118) j!142)))))

(declare-fun b!564345 () Bool)

(declare-fun res!355640 () Bool)

(assert (=> b!564345 (=> (not res!355640) (not e!325011))))

(declare-datatypes ((List!11149 0))(
  ( (Nil!11146) (Cons!11145 (h!12148 (_ BitVec 64)) (t!17368 List!11149)) )
))
(declare-fun arrayNoDuplicates!0 (array!35458 (_ BitVec 32) List!11149) Bool)

(assert (=> b!564345 (= res!355640 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11146))))

(declare-fun b!564346 () Bool)

(declare-fun res!355636 () Bool)

(assert (=> b!564346 (=> (not res!355636) (not e!325010))))

(assert (=> b!564346 (= res!355636 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51584 res!355634) b!564343))

(assert (= (and b!564343 res!355637) b!564344))

(assert (= (and b!564344 res!355633) b!564346))

(assert (= (and b!564346 res!355636) b!564340))

(assert (= (and b!564340 res!355635) b!564339))

(assert (= (and b!564339 res!355638) b!564341))

(assert (= (and b!564341 res!355639) b!564345))

(assert (= (and b!564345 res!355640) b!564342))

(declare-fun m!542279 () Bool)

(assert (=> b!564341 m!542279))

(declare-fun m!542281 () Bool)

(assert (=> b!564342 m!542281))

(declare-fun m!542283 () Bool)

(assert (=> b!564342 m!542283))

(declare-fun m!542285 () Bool)

(assert (=> b!564342 m!542285))

(declare-fun m!542287 () Bool)

(assert (=> b!564342 m!542287))

(assert (=> b!564342 m!542281))

(assert (=> b!564342 m!542285))

(assert (=> b!564342 m!542281))

(declare-fun m!542289 () Bool)

(assert (=> b!564342 m!542289))

(declare-fun m!542291 () Bool)

(assert (=> b!564342 m!542291))

(assert (=> b!564342 m!542285))

(declare-fun m!542293 () Bool)

(assert (=> b!564342 m!542293))

(declare-fun m!542295 () Bool)

(assert (=> b!564345 m!542295))

(declare-fun m!542297 () Bool)

(assert (=> b!564340 m!542297))

(assert (=> b!564344 m!542281))

(assert (=> b!564344 m!542281))

(declare-fun m!542299 () Bool)

(assert (=> b!564344 m!542299))

(declare-fun m!542301 () Bool)

(assert (=> b!564346 m!542301))

(declare-fun m!542303 () Bool)

(assert (=> start!51584 m!542303))

(declare-fun m!542305 () Bool)

(assert (=> start!51584 m!542305))

(declare-fun m!542307 () Bool)

(assert (=> b!564339 m!542307))

(check-sat (not b!564340) (not b!564339) (not b!564341) (not b!564346) (not b!564345) (not start!51584) (not b!564342) (not b!564344))
(check-sat)
