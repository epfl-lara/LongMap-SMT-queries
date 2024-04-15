; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47412 () Bool)

(assert start!47412)

(declare-fun b!521601 () Bool)

(declare-fun res!319482 () Bool)

(declare-fun e!304261 () Bool)

(assert (=> b!521601 (=> (not res!319482) (not e!304261))))

(declare-datatypes ((array!33248 0))(
  ( (array!33249 (arr!15980 (Array (_ BitVec 32) (_ BitVec 64))) (size!16345 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33248)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33248 (_ BitVec 32)) Bool)

(assert (=> b!521601 (= res!319482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521602 () Bool)

(declare-fun res!319490 () Bool)

(declare-fun e!304258 () Bool)

(assert (=> b!521602 (=> res!319490 e!304258)))

(declare-datatypes ((SeekEntryResult!4444 0))(
  ( (MissingZero!4444 (index!19979 (_ BitVec 32))) (Found!4444 (index!19980 (_ BitVec 32))) (Intermediate!4444 (undefined!5256 Bool) (index!19981 (_ BitVec 32)) (x!48969 (_ BitVec 32))) (Undefined!4444) (MissingVacant!4444 (index!19982 (_ BitVec 32))) )
))
(declare-fun lt!239004 () SeekEntryResult!4444)

(get-info :version)

(assert (=> b!521602 (= res!319490 (or (undefined!5256 lt!239004) (not ((_ is Intermediate!4444) lt!239004))))))

(declare-fun b!521603 () Bool)

(declare-fun e!304262 () Bool)

(assert (=> b!521603 (= e!304262 false)))

(declare-fun b!521604 () Bool)

(declare-fun e!304259 () Bool)

(assert (=> b!521604 (= e!304259 e!304261)))

(declare-fun res!319479 () Bool)

(assert (=> b!521604 (=> (not res!319479) (not e!304261))))

(declare-fun lt!239003 () SeekEntryResult!4444)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521604 (= res!319479 (or (= lt!239003 (MissingZero!4444 i!1204)) (= lt!239003 (MissingVacant!4444 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33248 (_ BitVec 32)) SeekEntryResult!4444)

(assert (=> b!521604 (= lt!239003 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521605 () Bool)

(assert (=> b!521605 (= e!304258 true)))

(assert (=> b!521605 (and (or (= (select (arr!15980 a!3235) (index!19981 lt!239004)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15980 a!3235) (index!19981 lt!239004)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15980 a!3235) (index!19981 lt!239004)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15980 a!3235) (index!19981 lt!239004)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16222 0))(
  ( (Unit!16223) )
))
(declare-fun lt!239007 () Unit!16222)

(declare-fun e!304257 () Unit!16222)

(assert (=> b!521605 (= lt!239007 e!304257)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun c!61362 () Bool)

(assert (=> b!521605 (= c!61362 (= (select (arr!15980 a!3235) (index!19981 lt!239004)) (select (arr!15980 a!3235) j!176)))))

(assert (=> b!521605 (and (bvslt (x!48969 lt!239004) #b01111111111111111111111111111110) (or (= (select (arr!15980 a!3235) (index!19981 lt!239004)) (select (arr!15980 a!3235) j!176)) (= (select (arr!15980 a!3235) (index!19981 lt!239004)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15980 a!3235) (index!19981 lt!239004)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521606 () Bool)

(declare-fun res!319485 () Bool)

(assert (=> b!521606 (=> (not res!319485) (not e!304259))))

(declare-fun arrayContainsKey!0 (array!33248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521606 (= res!319485 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521607 () Bool)

(declare-fun Unit!16224 () Unit!16222)

(assert (=> b!521607 (= e!304257 Unit!16224)))

(declare-fun res!319489 () Bool)

(assert (=> start!47412 (=> (not res!319489) (not e!304259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47412 (= res!319489 (validMask!0 mask!3524))))

(assert (=> start!47412 e!304259))

(assert (=> start!47412 true))

(declare-fun array_inv!11863 (array!33248) Bool)

(assert (=> start!47412 (array_inv!11863 a!3235)))

(declare-fun b!521608 () Bool)

(declare-fun res!319481 () Bool)

(assert (=> b!521608 (=> (not res!319481) (not e!304259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521608 (= res!319481 (validKeyInArray!0 k0!2280))))

(declare-fun b!521609 () Bool)

(declare-fun e!304263 () Bool)

(assert (=> b!521609 (= e!304263 (= (seekEntryOrOpen!0 (select (arr!15980 a!3235) j!176) a!3235 mask!3524) (Found!4444 j!176)))))

(declare-fun b!521610 () Bool)

(declare-fun res!319487 () Bool)

(assert (=> b!521610 (=> (not res!319487) (not e!304261))))

(declare-datatypes ((List!10177 0))(
  ( (Nil!10174) (Cons!10173 (h!11095 (_ BitVec 64)) (t!16396 List!10177)) )
))
(declare-fun arrayNoDuplicates!0 (array!33248 (_ BitVec 32) List!10177) Bool)

(assert (=> b!521610 (= res!319487 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10174))))

(declare-fun b!521611 () Bool)

(declare-fun res!319483 () Bool)

(assert (=> b!521611 (=> (not res!319483) (not e!304259))))

(assert (=> b!521611 (= res!319483 (and (= (size!16345 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16345 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16345 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521612 () Bool)

(declare-fun res!319486 () Bool)

(assert (=> b!521612 (=> (not res!319486) (not e!304259))))

(assert (=> b!521612 (= res!319486 (validKeyInArray!0 (select (arr!15980 a!3235) j!176)))))

(declare-fun b!521613 () Bool)

(assert (=> b!521613 (= e!304261 (not e!304258))))

(declare-fun res!319488 () Bool)

(assert (=> b!521613 (=> res!319488 e!304258)))

(declare-fun lt!239011 () (_ BitVec 64))

(declare-fun lt!239009 () array!33248)

(declare-fun lt!239008 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33248 (_ BitVec 32)) SeekEntryResult!4444)

(assert (=> b!521613 (= res!319488 (= lt!239004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239008 lt!239011 lt!239009 mask!3524)))))

(declare-fun lt!239010 () (_ BitVec 32))

(assert (=> b!521613 (= lt!239004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239010 (select (arr!15980 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521613 (= lt!239008 (toIndex!0 lt!239011 mask!3524))))

(assert (=> b!521613 (= lt!239011 (select (store (arr!15980 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521613 (= lt!239010 (toIndex!0 (select (arr!15980 a!3235) j!176) mask!3524))))

(assert (=> b!521613 (= lt!239009 (array!33249 (store (arr!15980 a!3235) i!1204 k0!2280) (size!16345 a!3235)))))

(assert (=> b!521613 e!304263))

(declare-fun res!319480 () Bool)

(assert (=> b!521613 (=> (not res!319480) (not e!304263))))

(assert (=> b!521613 (= res!319480 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239005 () Unit!16222)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33248 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16222)

(assert (=> b!521613 (= lt!239005 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521614 () Bool)

(declare-fun Unit!16225 () Unit!16222)

(assert (=> b!521614 (= e!304257 Unit!16225)))

(declare-fun lt!239006 () Unit!16222)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33248 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16222)

(assert (=> b!521614 (= lt!239006 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239010 #b00000000000000000000000000000000 (index!19981 lt!239004) (x!48969 lt!239004) mask!3524))))

(declare-fun res!319484 () Bool)

(assert (=> b!521614 (= res!319484 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239010 lt!239011 lt!239009 mask!3524) (Intermediate!4444 false (index!19981 lt!239004) (x!48969 lt!239004))))))

(assert (=> b!521614 (=> (not res!319484) (not e!304262))))

(assert (=> b!521614 e!304262))

(assert (= (and start!47412 res!319489) b!521611))

(assert (= (and b!521611 res!319483) b!521612))

(assert (= (and b!521612 res!319486) b!521608))

(assert (= (and b!521608 res!319481) b!521606))

(assert (= (and b!521606 res!319485) b!521604))

(assert (= (and b!521604 res!319479) b!521601))

(assert (= (and b!521601 res!319482) b!521610))

(assert (= (and b!521610 res!319487) b!521613))

(assert (= (and b!521613 res!319480) b!521609))

(assert (= (and b!521613 (not res!319488)) b!521602))

(assert (= (and b!521602 (not res!319490)) b!521605))

(assert (= (and b!521605 c!61362) b!521614))

(assert (= (and b!521605 (not c!61362)) b!521607))

(assert (= (and b!521614 res!319484) b!521603))

(declare-fun m!502033 () Bool)

(assert (=> b!521610 m!502033))

(declare-fun m!502035 () Bool)

(assert (=> b!521604 m!502035))

(declare-fun m!502037 () Bool)

(assert (=> b!521606 m!502037))

(declare-fun m!502039 () Bool)

(assert (=> b!521601 m!502039))

(declare-fun m!502041 () Bool)

(assert (=> b!521605 m!502041))

(declare-fun m!502043 () Bool)

(assert (=> b!521605 m!502043))

(assert (=> b!521612 m!502043))

(assert (=> b!521612 m!502043))

(declare-fun m!502045 () Bool)

(assert (=> b!521612 m!502045))

(declare-fun m!502047 () Bool)

(assert (=> b!521608 m!502047))

(assert (=> b!521609 m!502043))

(assert (=> b!521609 m!502043))

(declare-fun m!502049 () Bool)

(assert (=> b!521609 m!502049))

(declare-fun m!502051 () Bool)

(assert (=> b!521613 m!502051))

(declare-fun m!502053 () Bool)

(assert (=> b!521613 m!502053))

(declare-fun m!502055 () Bool)

(assert (=> b!521613 m!502055))

(declare-fun m!502057 () Bool)

(assert (=> b!521613 m!502057))

(assert (=> b!521613 m!502043))

(declare-fun m!502059 () Bool)

(assert (=> b!521613 m!502059))

(assert (=> b!521613 m!502043))

(declare-fun m!502061 () Bool)

(assert (=> b!521613 m!502061))

(declare-fun m!502063 () Bool)

(assert (=> b!521613 m!502063))

(assert (=> b!521613 m!502043))

(declare-fun m!502065 () Bool)

(assert (=> b!521613 m!502065))

(declare-fun m!502067 () Bool)

(assert (=> start!47412 m!502067))

(declare-fun m!502069 () Bool)

(assert (=> start!47412 m!502069))

(declare-fun m!502071 () Bool)

(assert (=> b!521614 m!502071))

(declare-fun m!502073 () Bool)

(assert (=> b!521614 m!502073))

(check-sat (not b!521608) (not start!47412) (not b!521610) (not b!521613) (not b!521614) (not b!521604) (not b!521601) (not b!521606) (not b!521612) (not b!521609))
(check-sat)
