; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44782 () Bool)

(assert start!44782)

(declare-fun b!491658 () Bool)

(declare-fun e!288853 () Bool)

(declare-fun e!288852 () Bool)

(assert (=> b!491658 (= e!288853 e!288852)))

(declare-fun res!294600 () Bool)

(assert (=> b!491658 (=> (not res!294600) (not e!288852))))

(declare-datatypes ((SeekEntryResult!3775 0))(
  ( (MissingZero!3775 (index!17279 (_ BitVec 32))) (Found!3775 (index!17280 (_ BitVec 32))) (Intermediate!3775 (undefined!4587 Bool) (index!17281 (_ BitVec 32)) (x!46361 (_ BitVec 32))) (Undefined!3775) (MissingVacant!3775 (index!17282 (_ BitVec 32))) )
))
(declare-fun lt!222301 () SeekEntryResult!3775)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491658 (= res!294600 (or (= lt!222301 (MissingZero!3775 i!1204)) (= lt!222301 (MissingVacant!3775 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31841 0))(
  ( (array!31842 (arr!15308 (Array (_ BitVec 32) (_ BitVec 64))) (size!15672 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31841)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31841 (_ BitVec 32)) SeekEntryResult!3775)

(assert (=> b!491658 (= lt!222301 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491659 () Bool)

(declare-fun res!294594 () Bool)

(assert (=> b!491659 (=> (not res!294594) (not e!288853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491659 (= res!294594 (validKeyInArray!0 k!2280))))

(declare-fun b!491660 () Bool)

(declare-fun res!294596 () Bool)

(assert (=> b!491660 (=> (not res!294596) (not e!288853))))

(declare-fun arrayContainsKey!0 (array!31841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491660 (= res!294596 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491661 () Bool)

(declare-fun res!294595 () Bool)

(assert (=> b!491661 (=> (not res!294595) (not e!288853))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!491661 (= res!294595 (validKeyInArray!0 (select (arr!15308 a!3235) j!176)))))

(declare-fun b!491662 () Bool)

(declare-fun res!294602 () Bool)

(assert (=> b!491662 (=> (not res!294602) (not e!288852))))

(declare-datatypes ((List!9466 0))(
  ( (Nil!9463) (Cons!9462 (h!10324 (_ BitVec 64)) (t!15694 List!9466)) )
))
(declare-fun arrayNoDuplicates!0 (array!31841 (_ BitVec 32) List!9466) Bool)

(assert (=> b!491662 (= res!294602 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9463))))

(declare-fun res!294598 () Bool)

(assert (=> start!44782 (=> (not res!294598) (not e!288853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44782 (= res!294598 (validMask!0 mask!3524))))

(assert (=> start!44782 e!288853))

(assert (=> start!44782 true))

(declare-fun array_inv!11104 (array!31841) Bool)

(assert (=> start!44782 (array_inv!11104 a!3235)))

(declare-fun b!491663 () Bool)

(declare-fun res!294597 () Bool)

(assert (=> b!491663 (=> (not res!294597) (not e!288852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31841 (_ BitVec 32)) Bool)

(assert (=> b!491663 (= res!294597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491664 () Bool)

(declare-fun res!294599 () Bool)

(assert (=> b!491664 (=> (not res!294599) (not e!288853))))

(assert (=> b!491664 (= res!294599 (and (= (size!15672 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15672 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15672 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491665 () Bool)

(declare-fun e!288855 () Bool)

(assert (=> b!491665 (= e!288855 true)))

(declare-fun lt!222303 () SeekEntryResult!3775)

(declare-fun lt!222300 () (_ BitVec 64))

(declare-fun lt!222299 () array!31841)

(assert (=> b!491665 (= lt!222303 (seekEntryOrOpen!0 lt!222300 lt!222299 mask!3524))))

(declare-datatypes ((Unit!14496 0))(
  ( (Unit!14497) )
))
(declare-fun lt!222304 () Unit!14496)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14496)

(assert (=> b!491665 (= lt!222304 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491666 () Bool)

(assert (=> b!491666 (= e!288852 (not e!288855))))

(declare-fun res!294601 () Bool)

(assert (=> b!491666 (=> res!294601 e!288855)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31841 (_ BitVec 32)) SeekEntryResult!3775)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491666 (= res!294601 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15308 a!3235) j!176) mask!3524) (select (arr!15308 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222300 mask!3524) lt!222300 lt!222299 mask!3524))))))

(assert (=> b!491666 (= lt!222300 (select (store (arr!15308 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491666 (= lt!222299 (array!31842 (store (arr!15308 a!3235) i!1204 k!2280) (size!15672 a!3235)))))

(assert (=> b!491666 (= lt!222303 (Found!3775 j!176))))

(assert (=> b!491666 (= lt!222303 (seekEntryOrOpen!0 (select (arr!15308 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491666 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222302 () Unit!14496)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14496)

(assert (=> b!491666 (= lt!222302 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44782 res!294598) b!491664))

(assert (= (and b!491664 res!294599) b!491661))

(assert (= (and b!491661 res!294595) b!491659))

(assert (= (and b!491659 res!294594) b!491660))

(assert (= (and b!491660 res!294596) b!491658))

(assert (= (and b!491658 res!294600) b!491663))

(assert (= (and b!491663 res!294597) b!491662))

(assert (= (and b!491662 res!294602) b!491666))

(assert (= (and b!491666 (not res!294601)) b!491665))

(declare-fun m!472343 () Bool)

(assert (=> start!44782 m!472343))

(declare-fun m!472345 () Bool)

(assert (=> start!44782 m!472345))

(declare-fun m!472347 () Bool)

(assert (=> b!491658 m!472347))

(declare-fun m!472349 () Bool)

(assert (=> b!491660 m!472349))

(declare-fun m!472351 () Bool)

(assert (=> b!491663 m!472351))

(declare-fun m!472353 () Bool)

(assert (=> b!491665 m!472353))

(declare-fun m!472355 () Bool)

(assert (=> b!491665 m!472355))

(declare-fun m!472357 () Bool)

(assert (=> b!491661 m!472357))

(assert (=> b!491661 m!472357))

(declare-fun m!472359 () Bool)

(assert (=> b!491661 m!472359))

(declare-fun m!472361 () Bool)

(assert (=> b!491662 m!472361))

(declare-fun m!472363 () Bool)

(assert (=> b!491666 m!472363))

(declare-fun m!472365 () Bool)

(assert (=> b!491666 m!472365))

(declare-fun m!472367 () Bool)

(assert (=> b!491666 m!472367))

(declare-fun m!472369 () Bool)

(assert (=> b!491666 m!472369))

(assert (=> b!491666 m!472357))

(declare-fun m!472371 () Bool)

(assert (=> b!491666 m!472371))

(assert (=> b!491666 m!472357))

(assert (=> b!491666 m!472369))

(assert (=> b!491666 m!472357))

(declare-fun m!472373 () Bool)

(assert (=> b!491666 m!472373))

(assert (=> b!491666 m!472357))

(declare-fun m!472375 () Bool)

(assert (=> b!491666 m!472375))

(declare-fun m!472377 () Bool)

(assert (=> b!491666 m!472377))

(declare-fun m!472379 () Bool)

(assert (=> b!491666 m!472379))

(assert (=> b!491666 m!472377))

(declare-fun m!472381 () Bool)

(assert (=> b!491659 m!472381))

(push 1)

