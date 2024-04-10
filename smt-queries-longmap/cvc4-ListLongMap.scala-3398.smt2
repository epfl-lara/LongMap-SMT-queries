; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46984 () Bool)

(assert start!46984)

(declare-fun b!518002 () Bool)

(declare-fun e!302275 () Bool)

(assert (=> b!518002 (= e!302275 true)))

(declare-datatypes ((SeekEntryResult!4393 0))(
  ( (MissingZero!4393 (index!19760 (_ BitVec 32))) (Found!4393 (index!19761 (_ BitVec 32))) (Intermediate!4393 (undefined!5205 Bool) (index!19762 (_ BitVec 32)) (x!48726 (_ BitVec 32))) (Undefined!4393) (MissingVacant!4393 (index!19763 (_ BitVec 32))) )
))
(declare-fun lt!237121 () SeekEntryResult!4393)

(declare-datatypes ((array!33125 0))(
  ( (array!33126 (arr!15926 (Array (_ BitVec 32) (_ BitVec 64))) (size!16290 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33125)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!518002 (and (bvslt (x!48726 lt!237121) #b01111111111111111111111111111110) (or (= (select (arr!15926 a!3235) (index!19762 lt!237121)) (select (arr!15926 a!3235) j!176)) (= (select (arr!15926 a!3235) (index!19762 lt!237121)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15926 a!3235) (index!19762 lt!237121)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518004 () Bool)

(declare-fun res!317021 () Bool)

(declare-fun e!302274 () Bool)

(assert (=> b!518004 (=> (not res!317021) (not e!302274))))

(declare-datatypes ((List!10084 0))(
  ( (Nil!10081) (Cons!10080 (h!10987 (_ BitVec 64)) (t!16312 List!10084)) )
))
(declare-fun arrayNoDuplicates!0 (array!33125 (_ BitVec 32) List!10084) Bool)

(assert (=> b!518004 (= res!317021 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10081))))

(declare-fun b!518005 () Bool)

(assert (=> b!518005 (= e!302274 (not e!302275))))

(declare-fun res!317026 () Bool)

(assert (=> b!518005 (=> res!317026 e!302275)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!237118 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33125 (_ BitVec 32)) SeekEntryResult!4393)

(assert (=> b!518005 (= res!317026 (= lt!237121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237118 (select (store (arr!15926 a!3235) i!1204 k!2280) j!176) (array!33126 (store (arr!15926 a!3235) i!1204 k!2280) (size!16290 a!3235)) mask!3524)))))

(declare-fun lt!237120 () (_ BitVec 32))

(assert (=> b!518005 (= lt!237121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237120 (select (arr!15926 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518005 (= lt!237118 (toIndex!0 (select (store (arr!15926 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!518005 (= lt!237120 (toIndex!0 (select (arr!15926 a!3235) j!176) mask!3524))))

(declare-fun e!302273 () Bool)

(assert (=> b!518005 e!302273))

(declare-fun res!317022 () Bool)

(assert (=> b!518005 (=> (not res!317022) (not e!302273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33125 (_ BitVec 32)) Bool)

(assert (=> b!518005 (= res!317022 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16044 0))(
  ( (Unit!16045) )
))
(declare-fun lt!237119 () Unit!16044)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16044)

(assert (=> b!518005 (= lt!237119 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518006 () Bool)

(declare-fun res!317017 () Bool)

(declare-fun e!302277 () Bool)

(assert (=> b!518006 (=> (not res!317017) (not e!302277))))

(assert (=> b!518006 (= res!317017 (and (= (size!16290 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16290 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16290 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518007 () Bool)

(declare-fun res!317025 () Bool)

(assert (=> b!518007 (=> (not res!317025) (not e!302277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518007 (= res!317025 (validKeyInArray!0 (select (arr!15926 a!3235) j!176)))))

(declare-fun b!518008 () Bool)

(declare-fun res!317023 () Bool)

(assert (=> b!518008 (=> res!317023 e!302275)))

(assert (=> b!518008 (= res!317023 (or (undefined!5205 lt!237121) (not (is-Intermediate!4393 lt!237121))))))

(declare-fun b!518009 () Bool)

(declare-fun res!317024 () Bool)

(assert (=> b!518009 (=> (not res!317024) (not e!302274))))

(assert (=> b!518009 (= res!317024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!518010 () Bool)

(assert (=> b!518010 (= e!302277 e!302274)))

(declare-fun res!317027 () Bool)

(assert (=> b!518010 (=> (not res!317027) (not e!302274))))

(declare-fun lt!237117 () SeekEntryResult!4393)

(assert (=> b!518010 (= res!317027 (or (= lt!237117 (MissingZero!4393 i!1204)) (= lt!237117 (MissingVacant!4393 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33125 (_ BitVec 32)) SeekEntryResult!4393)

(assert (=> b!518010 (= lt!237117 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!317018 () Bool)

(assert (=> start!46984 (=> (not res!317018) (not e!302277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46984 (= res!317018 (validMask!0 mask!3524))))

(assert (=> start!46984 e!302277))

(assert (=> start!46984 true))

(declare-fun array_inv!11722 (array!33125) Bool)

(assert (=> start!46984 (array_inv!11722 a!3235)))

(declare-fun b!518003 () Bool)

(declare-fun res!317019 () Bool)

(assert (=> b!518003 (=> (not res!317019) (not e!302277))))

(declare-fun arrayContainsKey!0 (array!33125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518003 (= res!317019 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518011 () Bool)

(assert (=> b!518011 (= e!302273 (= (seekEntryOrOpen!0 (select (arr!15926 a!3235) j!176) a!3235 mask!3524) (Found!4393 j!176)))))

(declare-fun b!518012 () Bool)

(declare-fun res!317020 () Bool)

(assert (=> b!518012 (=> (not res!317020) (not e!302277))))

(assert (=> b!518012 (= res!317020 (validKeyInArray!0 k!2280))))

(assert (= (and start!46984 res!317018) b!518006))

(assert (= (and b!518006 res!317017) b!518007))

(assert (= (and b!518007 res!317025) b!518012))

(assert (= (and b!518012 res!317020) b!518003))

(assert (= (and b!518003 res!317019) b!518010))

(assert (= (and b!518010 res!317027) b!518009))

(assert (= (and b!518009 res!317024) b!518004))

(assert (= (and b!518004 res!317021) b!518005))

(assert (= (and b!518005 res!317022) b!518011))

(assert (= (and b!518005 (not res!317026)) b!518008))

(assert (= (and b!518008 (not res!317023)) b!518002))

(declare-fun m!499333 () Bool)

(assert (=> b!518005 m!499333))

(declare-fun m!499335 () Bool)

(assert (=> b!518005 m!499335))

(declare-fun m!499337 () Bool)

(assert (=> b!518005 m!499337))

(declare-fun m!499339 () Bool)

(assert (=> b!518005 m!499339))

(declare-fun m!499341 () Bool)

(assert (=> b!518005 m!499341))

(assert (=> b!518005 m!499339))

(declare-fun m!499343 () Bool)

(assert (=> b!518005 m!499343))

(assert (=> b!518005 m!499339))

(assert (=> b!518005 m!499337))

(declare-fun m!499345 () Bool)

(assert (=> b!518005 m!499345))

(declare-fun m!499347 () Bool)

(assert (=> b!518005 m!499347))

(assert (=> b!518005 m!499337))

(declare-fun m!499349 () Bool)

(assert (=> b!518005 m!499349))

(declare-fun m!499351 () Bool)

(assert (=> b!518004 m!499351))

(declare-fun m!499353 () Bool)

(assert (=> b!518003 m!499353))

(declare-fun m!499355 () Bool)

(assert (=> b!518009 m!499355))

(assert (=> b!518011 m!499339))

(assert (=> b!518011 m!499339))

(declare-fun m!499357 () Bool)

(assert (=> b!518011 m!499357))

(declare-fun m!499359 () Bool)

(assert (=> b!518010 m!499359))

(declare-fun m!499361 () Bool)

(assert (=> start!46984 m!499361))

(declare-fun m!499363 () Bool)

(assert (=> start!46984 m!499363))

(declare-fun m!499365 () Bool)

(assert (=> b!518002 m!499365))

(assert (=> b!518002 m!499339))

(assert (=> b!518007 m!499339))

(assert (=> b!518007 m!499339))

(declare-fun m!499367 () Bool)

(assert (=> b!518007 m!499367))

(declare-fun m!499369 () Bool)

(assert (=> b!518012 m!499369))

(push 1)

