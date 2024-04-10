; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46088 () Bool)

(assert start!46088)

(declare-fun res!311331 () Bool)

(declare-fun e!298387 () Bool)

(assert (=> start!46088 (=> (not res!311331) (not e!298387))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46088 (= res!311331 (validMask!0 mask!3524))))

(assert (=> start!46088 e!298387))

(assert (=> start!46088 true))

(declare-datatypes ((array!32799 0))(
  ( (array!32800 (arr!15778 (Array (_ BitVec 32) (_ BitVec 64))) (size!16142 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32799)

(declare-fun array_inv!11574 (array!32799) Bool)

(assert (=> start!46088 (array_inv!11574 a!3235)))

(declare-fun b!510486 () Bool)

(declare-fun res!311339 () Bool)

(assert (=> b!510486 (=> (not res!311339) (not e!298387))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510486 (= res!311339 (validKeyInArray!0 k0!2280))))

(declare-fun b!510487 () Bool)

(declare-fun e!298389 () Bool)

(assert (=> b!510487 (= e!298387 e!298389)))

(declare-fun res!311334 () Bool)

(assert (=> b!510487 (=> (not res!311334) (not e!298389))))

(declare-datatypes ((SeekEntryResult!4245 0))(
  ( (MissingZero!4245 (index!19168 (_ BitVec 32))) (Found!4245 (index!19169 (_ BitVec 32))) (Intermediate!4245 (undefined!5057 Bool) (index!19170 (_ BitVec 32)) (x!48126 (_ BitVec 32))) (Undefined!4245) (MissingVacant!4245 (index!19171 (_ BitVec 32))) )
))
(declare-fun lt!233415 () SeekEntryResult!4245)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510487 (= res!311334 (or (= lt!233415 (MissingZero!4245 i!1204)) (= lt!233415 (MissingVacant!4245 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32799 (_ BitVec 32)) SeekEntryResult!4245)

(assert (=> b!510487 (= lt!233415 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510488 () Bool)

(declare-fun res!311335 () Bool)

(assert (=> b!510488 (=> (not res!311335) (not e!298389))))

(declare-datatypes ((List!9936 0))(
  ( (Nil!9933) (Cons!9932 (h!10809 (_ BitVec 64)) (t!16164 List!9936)) )
))
(declare-fun arrayNoDuplicates!0 (array!32799 (_ BitVec 32) List!9936) Bool)

(assert (=> b!510488 (= res!311335 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9933))))

(declare-fun b!510489 () Bool)

(declare-fun res!311338 () Bool)

(assert (=> b!510489 (=> (not res!311338) (not e!298387))))

(declare-fun arrayContainsKey!0 (array!32799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510489 (= res!311338 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510490 () Bool)

(declare-fun res!311332 () Bool)

(assert (=> b!510490 (=> (not res!311332) (not e!298387))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!510490 (= res!311332 (validKeyInArray!0 (select (arr!15778 a!3235) j!176)))))

(declare-fun b!510491 () Bool)

(declare-fun e!298386 () Bool)

(assert (=> b!510491 (= e!298389 (not e!298386))))

(declare-fun res!311336 () Bool)

(assert (=> b!510491 (=> res!311336 e!298386)))

(declare-fun lt!233419 () array!32799)

(declare-fun lt!233418 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32799 (_ BitVec 32)) SeekEntryResult!4245)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510491 (= res!311336 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15778 a!3235) j!176) mask!3524) (select (arr!15778 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233418 mask!3524) lt!233418 lt!233419 mask!3524))))))

(assert (=> b!510491 (= lt!233418 (select (store (arr!15778 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510491 (= lt!233419 (array!32800 (store (arr!15778 a!3235) i!1204 k0!2280) (size!16142 a!3235)))))

(declare-fun lt!233417 () SeekEntryResult!4245)

(assert (=> b!510491 (= lt!233417 (Found!4245 j!176))))

(assert (=> b!510491 (= lt!233417 (seekEntryOrOpen!0 (select (arr!15778 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32799 (_ BitVec 32)) Bool)

(assert (=> b!510491 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15748 0))(
  ( (Unit!15749) )
))
(declare-fun lt!233414 () Unit!15748)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15748)

(assert (=> b!510491 (= lt!233414 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510492 () Bool)

(declare-fun res!311337 () Bool)

(assert (=> b!510492 (=> (not res!311337) (not e!298389))))

(assert (=> b!510492 (= res!311337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510493 () Bool)

(declare-fun res!311333 () Bool)

(assert (=> b!510493 (=> (not res!311333) (not e!298387))))

(assert (=> b!510493 (= res!311333 (and (= (size!16142 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16142 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16142 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510494 () Bool)

(assert (=> b!510494 (= e!298386 true)))

(assert (=> b!510494 (= lt!233417 (seekEntryOrOpen!0 lt!233418 lt!233419 mask!3524))))

(declare-fun lt!233416 () Unit!15748)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32799 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15748)

(assert (=> b!510494 (= lt!233416 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(assert (= (and start!46088 res!311331) b!510493))

(assert (= (and b!510493 res!311333) b!510490))

(assert (= (and b!510490 res!311332) b!510486))

(assert (= (and b!510486 res!311339) b!510489))

(assert (= (and b!510489 res!311338) b!510487))

(assert (= (and b!510487 res!311334) b!510492))

(assert (= (and b!510492 res!311337) b!510488))

(assert (= (and b!510488 res!311335) b!510491))

(assert (= (and b!510491 (not res!311336)) b!510494))

(declare-fun m!491773 () Bool)

(assert (=> b!510494 m!491773))

(declare-fun m!491775 () Bool)

(assert (=> b!510494 m!491775))

(declare-fun m!491777 () Bool)

(assert (=> b!510489 m!491777))

(declare-fun m!491779 () Bool)

(assert (=> b!510491 m!491779))

(declare-fun m!491781 () Bool)

(assert (=> b!510491 m!491781))

(declare-fun m!491783 () Bool)

(assert (=> b!510491 m!491783))

(declare-fun m!491785 () Bool)

(assert (=> b!510491 m!491785))

(declare-fun m!491787 () Bool)

(assert (=> b!510491 m!491787))

(assert (=> b!510491 m!491785))

(assert (=> b!510491 m!491783))

(assert (=> b!510491 m!491785))

(declare-fun m!491789 () Bool)

(assert (=> b!510491 m!491789))

(assert (=> b!510491 m!491785))

(declare-fun m!491791 () Bool)

(assert (=> b!510491 m!491791))

(declare-fun m!491793 () Bool)

(assert (=> b!510491 m!491793))

(declare-fun m!491795 () Bool)

(assert (=> b!510491 m!491795))

(declare-fun m!491797 () Bool)

(assert (=> b!510491 m!491797))

(assert (=> b!510491 m!491793))

(declare-fun m!491799 () Bool)

(assert (=> b!510487 m!491799))

(declare-fun m!491801 () Bool)

(assert (=> start!46088 m!491801))

(declare-fun m!491803 () Bool)

(assert (=> start!46088 m!491803))

(declare-fun m!491805 () Bool)

(assert (=> b!510492 m!491805))

(declare-fun m!491807 () Bool)

(assert (=> b!510486 m!491807))

(declare-fun m!491809 () Bool)

(assert (=> b!510488 m!491809))

(assert (=> b!510490 m!491785))

(assert (=> b!510490 m!491785))

(declare-fun m!491811 () Bool)

(assert (=> b!510490 m!491811))

(check-sat (not b!510494) (not b!510491) (not b!510492) (not b!510487) (not start!46088) (not b!510488) (not b!510489) (not b!510486) (not b!510490))
(check-sat)
