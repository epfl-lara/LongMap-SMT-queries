; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46092 () Bool)

(assert start!46092)

(declare-fun b!510541 () Bool)

(declare-fun res!311388 () Bool)

(declare-fun e!298411 () Bool)

(assert (=> b!510541 (=> (not res!311388) (not e!298411))))

(declare-datatypes ((array!32803 0))(
  ( (array!32804 (arr!15780 (Array (_ BitVec 32) (_ BitVec 64))) (size!16144 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32803)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510541 (= res!311388 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510542 () Bool)

(declare-fun e!298410 () Bool)

(assert (=> b!510542 (= e!298410 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!233453 () (_ BitVec 64))

(declare-fun lt!233455 () array!32803)

(declare-datatypes ((SeekEntryResult!4247 0))(
  ( (MissingZero!4247 (index!19176 (_ BitVec 32))) (Found!4247 (index!19177 (_ BitVec 32))) (Intermediate!4247 (undefined!5059 Bool) (index!19178 (_ BitVec 32)) (x!48136 (_ BitVec 32))) (Undefined!4247) (MissingVacant!4247 (index!19179 (_ BitVec 32))) )
))
(declare-fun lt!233452 () SeekEntryResult!4247)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32803 (_ BitVec 32)) SeekEntryResult!4247)

(assert (=> b!510542 (= lt!233452 (seekEntryOrOpen!0 lt!233453 lt!233455 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!15752 0))(
  ( (Unit!15753) )
))
(declare-fun lt!233450 () Unit!15752)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32803 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15752)

(assert (=> b!510542 (= lt!233450 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!510543 () Bool)

(declare-fun e!298412 () Bool)

(assert (=> b!510543 (= e!298411 e!298412)))

(declare-fun res!311385 () Bool)

(assert (=> b!510543 (=> (not res!311385) (not e!298412))))

(declare-fun lt!233451 () SeekEntryResult!4247)

(assert (=> b!510543 (= res!311385 (or (= lt!233451 (MissingZero!4247 i!1204)) (= lt!233451 (MissingVacant!4247 i!1204))))))

(assert (=> b!510543 (= lt!233451 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510544 () Bool)

(declare-fun res!311391 () Bool)

(assert (=> b!510544 (=> (not res!311391) (not e!298412))))

(declare-datatypes ((List!9938 0))(
  ( (Nil!9935) (Cons!9934 (h!10811 (_ BitVec 64)) (t!16166 List!9938)) )
))
(declare-fun arrayNoDuplicates!0 (array!32803 (_ BitVec 32) List!9938) Bool)

(assert (=> b!510544 (= res!311391 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9935))))

(declare-fun b!510545 () Bool)

(declare-fun res!311389 () Bool)

(assert (=> b!510545 (=> (not res!311389) (not e!298412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32803 (_ BitVec 32)) Bool)

(assert (=> b!510545 (= res!311389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510546 () Bool)

(declare-fun res!311387 () Bool)

(assert (=> b!510546 (=> (not res!311387) (not e!298411))))

(assert (=> b!510546 (= res!311387 (and (= (size!16144 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16144 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16144 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!311392 () Bool)

(assert (=> start!46092 (=> (not res!311392) (not e!298411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46092 (= res!311392 (validMask!0 mask!3524))))

(assert (=> start!46092 e!298411))

(assert (=> start!46092 true))

(declare-fun array_inv!11576 (array!32803) Bool)

(assert (=> start!46092 (array_inv!11576 a!3235)))

(declare-fun b!510540 () Bool)

(declare-fun res!311393 () Bool)

(assert (=> b!510540 (=> (not res!311393) (not e!298411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510540 (= res!311393 (validKeyInArray!0 k!2280))))

(declare-fun b!510547 () Bool)

(assert (=> b!510547 (= e!298412 (not e!298410))))

(declare-fun res!311386 () Bool)

(assert (=> b!510547 (=> res!311386 e!298410)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32803 (_ BitVec 32)) SeekEntryResult!4247)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510547 (= res!311386 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15780 a!3235) j!176) mask!3524) (select (arr!15780 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233453 mask!3524) lt!233453 lt!233455 mask!3524))))))

(assert (=> b!510547 (= lt!233453 (select (store (arr!15780 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!510547 (= lt!233455 (array!32804 (store (arr!15780 a!3235) i!1204 k!2280) (size!16144 a!3235)))))

(assert (=> b!510547 (= lt!233452 (Found!4247 j!176))))

(assert (=> b!510547 (= lt!233452 (seekEntryOrOpen!0 (select (arr!15780 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510547 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233454 () Unit!15752)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15752)

(assert (=> b!510547 (= lt!233454 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510548 () Bool)

(declare-fun res!311390 () Bool)

(assert (=> b!510548 (=> (not res!311390) (not e!298411))))

(assert (=> b!510548 (= res!311390 (validKeyInArray!0 (select (arr!15780 a!3235) j!176)))))

(assert (= (and start!46092 res!311392) b!510546))

(assert (= (and b!510546 res!311387) b!510548))

(assert (= (and b!510548 res!311390) b!510540))

(assert (= (and b!510540 res!311393) b!510541))

(assert (= (and b!510541 res!311388) b!510543))

(assert (= (and b!510543 res!311385) b!510545))

(assert (= (and b!510545 res!311389) b!510544))

(assert (= (and b!510544 res!311391) b!510547))

(assert (= (and b!510547 (not res!311386)) b!510542))

(declare-fun m!491853 () Bool)

(assert (=> b!510543 m!491853))

(declare-fun m!491855 () Bool)

(assert (=> b!510544 m!491855))

(declare-fun m!491857 () Bool)

(assert (=> start!46092 m!491857))

(declare-fun m!491859 () Bool)

(assert (=> start!46092 m!491859))

(declare-fun m!491861 () Bool)

(assert (=> b!510545 m!491861))

(declare-fun m!491863 () Bool)

(assert (=> b!510542 m!491863))

(declare-fun m!491865 () Bool)

(assert (=> b!510542 m!491865))

(declare-fun m!491867 () Bool)

(assert (=> b!510547 m!491867))

(declare-fun m!491869 () Bool)

(assert (=> b!510547 m!491869))

(declare-fun m!491871 () Bool)

(assert (=> b!510547 m!491871))

(declare-fun m!491873 () Bool)

(assert (=> b!510547 m!491873))

(declare-fun m!491875 () Bool)

(assert (=> b!510547 m!491875))

(declare-fun m!491877 () Bool)

(assert (=> b!510547 m!491877))

(assert (=> b!510547 m!491873))

(assert (=> b!510547 m!491871))

(assert (=> b!510547 m!491873))

(declare-fun m!491879 () Bool)

(assert (=> b!510547 m!491879))

(assert (=> b!510547 m!491873))

(declare-fun m!491881 () Bool)

(assert (=> b!510547 m!491881))

(assert (=> b!510547 m!491877))

(declare-fun m!491883 () Bool)

(assert (=> b!510547 m!491883))

(declare-fun m!491885 () Bool)

(assert (=> b!510547 m!491885))

(declare-fun m!491887 () Bool)

(assert (=> b!510540 m!491887))

(declare-fun m!491889 () Bool)

(assert (=> b!510541 m!491889))

(assert (=> b!510548 m!491873))

(assert (=> b!510548 m!491873))

(declare-fun m!491891 () Bool)

(assert (=> b!510548 m!491891))

(push 1)

