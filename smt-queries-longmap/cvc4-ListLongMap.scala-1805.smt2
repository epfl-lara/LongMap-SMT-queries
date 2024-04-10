; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32534 () Bool)

(assert start!32534)

(declare-fun b!325463 () Bool)

(declare-fun res!178794 () Bool)

(declare-fun e!200586 () Bool)

(assert (=> b!325463 (=> (not res!178794) (not e!200586))))

(declare-datatypes ((array!16673 0))(
  ( (array!16674 (arr!7894 (Array (_ BitVec 32) (_ BitVec 64))) (size!8246 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16673)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!325463 (= res!178794 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7894 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325464 () Bool)

(declare-fun res!178801 () Bool)

(declare-fun e!200585 () Bool)

(assert (=> b!325464 (=> (not res!178801) (not e!200585))))

(declare-fun arrayContainsKey!0 (array!16673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325464 (= res!178801 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!178803 () Bool)

(assert (=> start!32534 (=> (not res!178803) (not e!200585))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32534 (= res!178803 (validMask!0 mask!3777))))

(assert (=> start!32534 e!200585))

(declare-fun array_inv!5857 (array!16673) Bool)

(assert (=> start!32534 (array_inv!5857 a!3305)))

(assert (=> start!32534 true))

(declare-fun b!325465 () Bool)

(assert (=> b!325465 (= e!200586 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1490) resX!58) (bvslt (bvadd #b00000000000000000000000000000001 x!1490) #b00000000000000000000000000000000)))))

(declare-fun lt!157007 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325465 (= lt!157007 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325466 () Bool)

(declare-fun res!178797 () Bool)

(assert (=> b!325466 (=> (not res!178797) (not e!200585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16673 (_ BitVec 32)) Bool)

(assert (=> b!325466 (= res!178797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325467 () Bool)

(declare-fun res!178802 () Bool)

(assert (=> b!325467 (=> (not res!178802) (not e!200585))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325467 (= res!178802 (and (= (size!8246 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8246 a!3305))))))

(declare-fun b!325468 () Bool)

(assert (=> b!325468 (= e!200585 e!200586)))

(declare-fun res!178798 () Bool)

(assert (=> b!325468 (=> (not res!178798) (not e!200586))))

(declare-datatypes ((SeekEntryResult!3025 0))(
  ( (MissingZero!3025 (index!14276 (_ BitVec 32))) (Found!3025 (index!14277 (_ BitVec 32))) (Intermediate!3025 (undefined!3837 Bool) (index!14278 (_ BitVec 32)) (x!32509 (_ BitVec 32))) (Undefined!3025) (MissingVacant!3025 (index!14279 (_ BitVec 32))) )
))
(declare-fun lt!157008 () SeekEntryResult!3025)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16673 (_ BitVec 32)) SeekEntryResult!3025)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325468 (= res!178798 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157008))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325468 (= lt!157008 (Intermediate!3025 false resIndex!58 resX!58))))

(declare-fun b!325469 () Bool)

(declare-fun res!178800 () Bool)

(assert (=> b!325469 (=> (not res!178800) (not e!200586))))

(assert (=> b!325469 (= res!178800 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157008))))

(declare-fun b!325470 () Bool)

(declare-fun res!178795 () Bool)

(assert (=> b!325470 (=> (not res!178795) (not e!200585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325470 (= res!178795 (validKeyInArray!0 k!2497))))

(declare-fun b!325471 () Bool)

(declare-fun res!178796 () Bool)

(assert (=> b!325471 (=> (not res!178796) (not e!200586))))

(assert (=> b!325471 (= res!178796 (and (= (select (arr!7894 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8246 a!3305))))))

(declare-fun b!325472 () Bool)

(declare-fun res!178799 () Bool)

(assert (=> b!325472 (=> (not res!178799) (not e!200585))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16673 (_ BitVec 32)) SeekEntryResult!3025)

(assert (=> b!325472 (= res!178799 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3025 i!1250)))))

(assert (= (and start!32534 res!178803) b!325467))

(assert (= (and b!325467 res!178802) b!325470))

(assert (= (and b!325470 res!178795) b!325464))

(assert (= (and b!325464 res!178801) b!325472))

(assert (= (and b!325472 res!178799) b!325466))

(assert (= (and b!325466 res!178797) b!325468))

(assert (= (and b!325468 res!178798) b!325471))

(assert (= (and b!325471 res!178796) b!325469))

(assert (= (and b!325469 res!178800) b!325463))

(assert (= (and b!325463 res!178794) b!325465))

(declare-fun m!332303 () Bool)

(assert (=> b!325468 m!332303))

(assert (=> b!325468 m!332303))

(declare-fun m!332305 () Bool)

(assert (=> b!325468 m!332305))

(declare-fun m!332307 () Bool)

(assert (=> b!325471 m!332307))

(declare-fun m!332309 () Bool)

(assert (=> b!325472 m!332309))

(declare-fun m!332311 () Bool)

(assert (=> b!325466 m!332311))

(declare-fun m!332313 () Bool)

(assert (=> start!32534 m!332313))

(declare-fun m!332315 () Bool)

(assert (=> start!32534 m!332315))

(declare-fun m!332317 () Bool)

(assert (=> b!325470 m!332317))

(declare-fun m!332319 () Bool)

(assert (=> b!325464 m!332319))

(declare-fun m!332321 () Bool)

(assert (=> b!325463 m!332321))

(declare-fun m!332323 () Bool)

(assert (=> b!325465 m!332323))

(declare-fun m!332325 () Bool)

(assert (=> b!325469 m!332325))

(push 1)

(assert (not b!325469))

(assert (not b!325466))

(assert (not b!325472))

(assert (not b!325468))

(assert (not b!325470))

(assert (not start!32534))

(assert (not b!325465))

(assert (not b!325464))

(check-sat)

