; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47364 () Bool)

(assert start!47364)

(declare-fun b!520593 () Bool)

(declare-fun e!303756 () Bool)

(declare-fun e!303753 () Bool)

(assert (=> b!520593 (= e!303756 (not e!303753))))

(declare-fun res!318626 () Bool)

(assert (=> b!520593 (=> res!318626 e!303753)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4420 0))(
  ( (MissingZero!4420 (index!19883 (_ BitVec 32))) (Found!4420 (index!19884 (_ BitVec 32))) (Intermediate!4420 (undefined!5232 Bool) (index!19885 (_ BitVec 32)) (x!48881 (_ BitVec 32))) (Undefined!4420) (MissingVacant!4420 (index!19886 (_ BitVec 32))) )
))
(declare-fun lt!238361 () SeekEntryResult!4420)

(declare-fun lt!238358 () (_ BitVec 32))

(declare-fun lt!238363 () (_ BitVec 64))

(declare-datatypes ((array!33200 0))(
  ( (array!33201 (arr!15956 (Array (_ BitVec 32) (_ BitVec 64))) (size!16321 (_ BitVec 32))) )
))
(declare-fun lt!238362 () array!33200)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33200 (_ BitVec 32)) SeekEntryResult!4420)

(assert (=> b!520593 (= res!318626 (= lt!238361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238358 lt!238363 lt!238362 mask!3524)))))

(declare-fun lt!238359 () (_ BitVec 32))

(declare-fun a!3235 () array!33200)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!520593 (= lt!238361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238359 (select (arr!15956 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520593 (= lt!238358 (toIndex!0 lt!238363 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!520593 (= lt!238363 (select (store (arr!15956 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!520593 (= lt!238359 (toIndex!0 (select (arr!15956 a!3235) j!176) mask!3524))))

(assert (=> b!520593 (= lt!238362 (array!33201 (store (arr!15956 a!3235) i!1204 k0!2280) (size!16321 a!3235)))))

(declare-fun e!303754 () Bool)

(assert (=> b!520593 e!303754))

(declare-fun res!318619 () Bool)

(assert (=> b!520593 (=> (not res!318619) (not e!303754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33200 (_ BitVec 32)) Bool)

(assert (=> b!520593 (= res!318619 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16126 0))(
  ( (Unit!16127) )
))
(declare-fun lt!238355 () Unit!16126)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33200 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16126)

(assert (=> b!520593 (= lt!238355 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520594 () Bool)

(declare-fun e!303755 () Unit!16126)

(declare-fun Unit!16128 () Unit!16126)

(assert (=> b!520594 (= e!303755 Unit!16128)))

(declare-fun b!520595 () Bool)

(declare-fun res!318622 () Bool)

(assert (=> b!520595 (=> res!318622 e!303753)))

(get-info :version)

(assert (=> b!520595 (= res!318622 (or (undefined!5232 lt!238361) (not ((_ is Intermediate!4420) lt!238361))))))

(declare-fun b!520596 () Bool)

(declare-fun res!318617 () Bool)

(assert (=> b!520596 (=> (not res!318617) (not e!303756))))

(declare-datatypes ((List!10153 0))(
  ( (Nil!10150) (Cons!10149 (h!11071 (_ BitVec 64)) (t!16372 List!10153)) )
))
(declare-fun arrayNoDuplicates!0 (array!33200 (_ BitVec 32) List!10153) Bool)

(assert (=> b!520596 (= res!318617 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10150))))

(declare-fun b!520597 () Bool)

(declare-fun Unit!16129 () Unit!16126)

(assert (=> b!520597 (= e!303755 Unit!16129)))

(declare-fun lt!238357 () Unit!16126)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33200 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16126)

(assert (=> b!520597 (= lt!238357 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238359 #b00000000000000000000000000000000 (index!19885 lt!238361) (x!48881 lt!238361) mask!3524))))

(declare-fun res!318615 () Bool)

(assert (=> b!520597 (= res!318615 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238359 lt!238363 lt!238362 mask!3524) (Intermediate!4420 false (index!19885 lt!238361) (x!48881 lt!238361))))))

(declare-fun e!303758 () Bool)

(assert (=> b!520597 (=> (not res!318615) (not e!303758))))

(assert (=> b!520597 e!303758))

(declare-fun b!520598 () Bool)

(assert (=> b!520598 (= e!303753 true)))

(assert (=> b!520598 (and (or (= (select (arr!15956 a!3235) (index!19885 lt!238361)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15956 a!3235) (index!19885 lt!238361)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15956 a!3235) (index!19885 lt!238361)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15956 a!3235) (index!19885 lt!238361)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238360 () Unit!16126)

(assert (=> b!520598 (= lt!238360 e!303755)))

(declare-fun c!61290 () Bool)

(assert (=> b!520598 (= c!61290 (= (select (arr!15956 a!3235) (index!19885 lt!238361)) (select (arr!15956 a!3235) j!176)))))

(assert (=> b!520598 (and (bvslt (x!48881 lt!238361) #b01111111111111111111111111111110) (or (= (select (arr!15956 a!3235) (index!19885 lt!238361)) (select (arr!15956 a!3235) j!176)) (= (select (arr!15956 a!3235) (index!19885 lt!238361)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15956 a!3235) (index!19885 lt!238361)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520599 () Bool)

(declare-fun e!303759 () Bool)

(assert (=> b!520599 (= e!303759 e!303756)))

(declare-fun res!318624 () Bool)

(assert (=> b!520599 (=> (not res!318624) (not e!303756))))

(declare-fun lt!238356 () SeekEntryResult!4420)

(assert (=> b!520599 (= res!318624 (or (= lt!238356 (MissingZero!4420 i!1204)) (= lt!238356 (MissingVacant!4420 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33200 (_ BitVec 32)) SeekEntryResult!4420)

(assert (=> b!520599 (= lt!238356 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!520600 () Bool)

(declare-fun res!318623 () Bool)

(assert (=> b!520600 (=> (not res!318623) (not e!303759))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520600 (= res!318623 (validKeyInArray!0 k0!2280))))

(declare-fun b!520601 () Bool)

(declare-fun res!318620 () Bool)

(assert (=> b!520601 (=> (not res!318620) (not e!303759))))

(declare-fun arrayContainsKey!0 (array!33200 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520601 (= res!318620 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!318621 () Bool)

(assert (=> start!47364 (=> (not res!318621) (not e!303759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47364 (= res!318621 (validMask!0 mask!3524))))

(assert (=> start!47364 e!303759))

(assert (=> start!47364 true))

(declare-fun array_inv!11839 (array!33200) Bool)

(assert (=> start!47364 (array_inv!11839 a!3235)))

(declare-fun b!520602 () Bool)

(declare-fun res!318616 () Bool)

(assert (=> b!520602 (=> (not res!318616) (not e!303759))))

(assert (=> b!520602 (= res!318616 (and (= (size!16321 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16321 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16321 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520603 () Bool)

(declare-fun res!318618 () Bool)

(assert (=> b!520603 (=> (not res!318618) (not e!303756))))

(assert (=> b!520603 (= res!318618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!520604 () Bool)

(declare-fun res!318625 () Bool)

(assert (=> b!520604 (=> (not res!318625) (not e!303759))))

(assert (=> b!520604 (= res!318625 (validKeyInArray!0 (select (arr!15956 a!3235) j!176)))))

(declare-fun b!520605 () Bool)

(assert (=> b!520605 (= e!303754 (= (seekEntryOrOpen!0 (select (arr!15956 a!3235) j!176) a!3235 mask!3524) (Found!4420 j!176)))))

(declare-fun b!520606 () Bool)

(assert (=> b!520606 (= e!303758 false)))

(assert (= (and start!47364 res!318621) b!520602))

(assert (= (and b!520602 res!318616) b!520604))

(assert (= (and b!520604 res!318625) b!520600))

(assert (= (and b!520600 res!318623) b!520601))

(assert (= (and b!520601 res!318620) b!520599))

(assert (= (and b!520599 res!318624) b!520603))

(assert (= (and b!520603 res!318618) b!520596))

(assert (= (and b!520596 res!318617) b!520593))

(assert (= (and b!520593 res!318619) b!520605))

(assert (= (and b!520593 (not res!318626)) b!520595))

(assert (= (and b!520595 (not res!318622)) b!520598))

(assert (= (and b!520598 c!61290) b!520597))

(assert (= (and b!520598 (not c!61290)) b!520594))

(assert (= (and b!520597 res!318615) b!520606))

(declare-fun m!501025 () Bool)

(assert (=> b!520598 m!501025))

(declare-fun m!501027 () Bool)

(assert (=> b!520598 m!501027))

(declare-fun m!501029 () Bool)

(assert (=> start!47364 m!501029))

(declare-fun m!501031 () Bool)

(assert (=> start!47364 m!501031))

(declare-fun m!501033 () Bool)

(assert (=> b!520593 m!501033))

(declare-fun m!501035 () Bool)

(assert (=> b!520593 m!501035))

(declare-fun m!501037 () Bool)

(assert (=> b!520593 m!501037))

(declare-fun m!501039 () Bool)

(assert (=> b!520593 m!501039))

(assert (=> b!520593 m!501027))

(declare-fun m!501041 () Bool)

(assert (=> b!520593 m!501041))

(assert (=> b!520593 m!501027))

(declare-fun m!501043 () Bool)

(assert (=> b!520593 m!501043))

(assert (=> b!520593 m!501027))

(declare-fun m!501045 () Bool)

(assert (=> b!520593 m!501045))

(declare-fun m!501047 () Bool)

(assert (=> b!520593 m!501047))

(declare-fun m!501049 () Bool)

(assert (=> b!520600 m!501049))

(declare-fun m!501051 () Bool)

(assert (=> b!520597 m!501051))

(declare-fun m!501053 () Bool)

(assert (=> b!520597 m!501053))

(declare-fun m!501055 () Bool)

(assert (=> b!520603 m!501055))

(declare-fun m!501057 () Bool)

(assert (=> b!520599 m!501057))

(declare-fun m!501059 () Bool)

(assert (=> b!520596 m!501059))

(assert (=> b!520605 m!501027))

(assert (=> b!520605 m!501027))

(declare-fun m!501061 () Bool)

(assert (=> b!520605 m!501061))

(assert (=> b!520604 m!501027))

(assert (=> b!520604 m!501027))

(declare-fun m!501063 () Bool)

(assert (=> b!520604 m!501063))

(declare-fun m!501065 () Bool)

(assert (=> b!520601 m!501065))

(check-sat (not start!47364) (not b!520599) (not b!520601) (not b!520596) (not b!520593) (not b!520603) (not b!520597) (not b!520600) (not b!520605) (not b!520604))
(check-sat)
