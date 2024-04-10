; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48112 () Bool)

(assert start!48112)

(declare-fun b!529807 () Bool)

(declare-fun res!325514 () Bool)

(declare-fun e!308716 () Bool)

(assert (=> b!529807 (=> (not res!325514) (not e!308716))))

(declare-datatypes ((array!33548 0))(
  ( (array!33549 (arr!16121 (Array (_ BitVec 32) (_ BitVec 64))) (size!16485 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33548)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529807 (= res!325514 (validKeyInArray!0 (select (arr!16121 a!3235) j!176)))))

(declare-fun b!529808 () Bool)

(declare-fun res!325513 () Bool)

(assert (=> b!529808 (=> (not res!325513) (not e!308716))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!529808 (= res!325513 (validKeyInArray!0 k!2280))))

(declare-fun b!529809 () Bool)

(declare-fun res!325522 () Bool)

(declare-fun e!308720 () Bool)

(assert (=> b!529809 (=> (not res!325522) (not e!308720))))

(declare-datatypes ((List!10279 0))(
  ( (Nil!10276) (Cons!10275 (h!11215 (_ BitVec 64)) (t!16507 List!10279)) )
))
(declare-fun arrayNoDuplicates!0 (array!33548 (_ BitVec 32) List!10279) Bool)

(assert (=> b!529809 (= res!325522 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10276))))

(declare-fun b!529810 () Bool)

(declare-fun e!308721 () Bool)

(declare-fun e!308718 () Bool)

(assert (=> b!529810 (= e!308721 e!308718)))

(declare-fun res!325521 () Bool)

(assert (=> b!529810 (=> res!325521 e!308718)))

(declare-fun lt!244268 () Bool)

(declare-datatypes ((SeekEntryResult!4588 0))(
  ( (MissingZero!4588 (index!20576 (_ BitVec 32))) (Found!4588 (index!20577 (_ BitVec 32))) (Intermediate!4588 (undefined!5400 Bool) (index!20578 (_ BitVec 32)) (x!49546 (_ BitVec 32))) (Undefined!4588) (MissingVacant!4588 (index!20579 (_ BitVec 32))) )
))
(declare-fun lt!244265 () SeekEntryResult!4588)

(assert (=> b!529810 (= res!325521 (or (and (not lt!244268) (undefined!5400 lt!244265)) (and (not lt!244268) (not (undefined!5400 lt!244265)))))))

(assert (=> b!529810 (= lt!244268 (not (is-Intermediate!4588 lt!244265)))))

(declare-fun b!529811 () Bool)

(declare-fun res!325520 () Bool)

(assert (=> b!529811 (=> (not res!325520) (not e!308716))))

(declare-fun arrayContainsKey!0 (array!33548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529811 (= res!325520 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529812 () Bool)

(assert (=> b!529812 (= e!308718 true)))

(assert (=> b!529812 false))

(declare-fun e!308717 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!529813 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33548 (_ BitVec 32)) SeekEntryResult!4588)

(assert (=> b!529813 (= e!308717 (= (seekEntryOrOpen!0 (select (arr!16121 a!3235) j!176) a!3235 mask!3524) (Found!4588 j!176)))))

(declare-fun b!529814 () Bool)

(declare-fun res!325515 () Bool)

(assert (=> b!529814 (=> (not res!325515) (not e!308716))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529814 (= res!325515 (and (= (size!16485 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16485 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16485 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529815 () Bool)

(declare-fun res!325523 () Bool)

(assert (=> b!529815 (=> (not res!325523) (not e!308720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33548 (_ BitVec 32)) Bool)

(assert (=> b!529815 (= res!325523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529816 () Bool)

(assert (=> b!529816 (= e!308720 (not e!308721))))

(declare-fun res!325519 () Bool)

(assert (=> b!529816 (=> res!325519 e!308721)))

(declare-fun lt!244270 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33548 (_ BitVec 32)) SeekEntryResult!4588)

(assert (=> b!529816 (= res!325519 (= lt!244265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244270 (select (store (arr!16121 a!3235) i!1204 k!2280) j!176) (array!33549 (store (arr!16121 a!3235) i!1204 k!2280) (size!16485 a!3235)) mask!3524)))))

(declare-fun lt!244266 () (_ BitVec 32))

(assert (=> b!529816 (= lt!244265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244266 (select (arr!16121 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529816 (= lt!244270 (toIndex!0 (select (store (arr!16121 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!529816 (= lt!244266 (toIndex!0 (select (arr!16121 a!3235) j!176) mask!3524))))

(assert (=> b!529816 e!308717))

(declare-fun res!325517 () Bool)

(assert (=> b!529816 (=> (not res!325517) (not e!308717))))

(assert (=> b!529816 (= res!325517 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16788 0))(
  ( (Unit!16789) )
))
(declare-fun lt!244269 () Unit!16788)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33548 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16788)

(assert (=> b!529816 (= lt!244269 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!325518 () Bool)

(assert (=> start!48112 (=> (not res!325518) (not e!308716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48112 (= res!325518 (validMask!0 mask!3524))))

(assert (=> start!48112 e!308716))

(assert (=> start!48112 true))

(declare-fun array_inv!11917 (array!33548) Bool)

(assert (=> start!48112 (array_inv!11917 a!3235)))

(declare-fun b!529817 () Bool)

(assert (=> b!529817 (= e!308716 e!308720)))

(declare-fun res!325516 () Bool)

(assert (=> b!529817 (=> (not res!325516) (not e!308720))))

(declare-fun lt!244267 () SeekEntryResult!4588)

(assert (=> b!529817 (= res!325516 (or (= lt!244267 (MissingZero!4588 i!1204)) (= lt!244267 (MissingVacant!4588 i!1204))))))

(assert (=> b!529817 (= lt!244267 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!48112 res!325518) b!529814))

(assert (= (and b!529814 res!325515) b!529807))

(assert (= (and b!529807 res!325514) b!529808))

(assert (= (and b!529808 res!325513) b!529811))

(assert (= (and b!529811 res!325520) b!529817))

(assert (= (and b!529817 res!325516) b!529815))

(assert (= (and b!529815 res!325523) b!529809))

(assert (= (and b!529809 res!325522) b!529816))

(assert (= (and b!529816 res!325517) b!529813))

(assert (= (and b!529816 (not res!325519)) b!529810))

(assert (= (and b!529810 (not res!325521)) b!529812))

(declare-fun m!510297 () Bool)

(assert (=> b!529811 m!510297))

(declare-fun m!510299 () Bool)

(assert (=> b!529817 m!510299))

(declare-fun m!510301 () Bool)

(assert (=> b!529808 m!510301))

(declare-fun m!510303 () Bool)

(assert (=> b!529816 m!510303))

(declare-fun m!510305 () Bool)

(assert (=> b!529816 m!510305))

(declare-fun m!510307 () Bool)

(assert (=> b!529816 m!510307))

(declare-fun m!510309 () Bool)

(assert (=> b!529816 m!510309))

(declare-fun m!510311 () Bool)

(assert (=> b!529816 m!510311))

(assert (=> b!529816 m!510309))

(declare-fun m!510313 () Bool)

(assert (=> b!529816 m!510313))

(assert (=> b!529816 m!510307))

(declare-fun m!510315 () Bool)

(assert (=> b!529816 m!510315))

(assert (=> b!529816 m!510307))

(declare-fun m!510317 () Bool)

(assert (=> b!529816 m!510317))

(assert (=> b!529816 m!510309))

(declare-fun m!510319 () Bool)

(assert (=> b!529816 m!510319))

(assert (=> b!529813 m!510309))

(assert (=> b!529813 m!510309))

(declare-fun m!510321 () Bool)

(assert (=> b!529813 m!510321))

(declare-fun m!510323 () Bool)

(assert (=> b!529809 m!510323))

(assert (=> b!529807 m!510309))

(assert (=> b!529807 m!510309))

(declare-fun m!510325 () Bool)

(assert (=> b!529807 m!510325))

(declare-fun m!510327 () Bool)

(assert (=> b!529815 m!510327))

(declare-fun m!510329 () Bool)

(assert (=> start!48112 m!510329))

(declare-fun m!510331 () Bool)

(assert (=> start!48112 m!510331))

(push 1)

