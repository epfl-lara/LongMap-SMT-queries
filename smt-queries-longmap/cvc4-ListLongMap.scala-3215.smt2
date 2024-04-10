; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45040 () Bool)

(assert start!45040)

(declare-fun b!494246 () Bool)

(declare-fun res!296819 () Bool)

(declare-fun e!290106 () Bool)

(assert (=> b!494246 (=> (not res!296819) (not e!290106))))

(declare-datatypes ((array!31985 0))(
  ( (array!31986 (arr!15377 (Array (_ BitVec 32) (_ BitVec 64))) (size!15741 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31985)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31985 (_ BitVec 32)) Bool)

(assert (=> b!494246 (= res!296819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494247 () Bool)

(declare-fun res!296816 () Bool)

(declare-fun e!290109 () Bool)

(assert (=> b!494247 (=> (not res!296816) (not e!290109))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494247 (= res!296816 (validKeyInArray!0 (select (arr!15377 a!3235) j!176)))))

(declare-fun b!494248 () Bool)

(declare-fun res!296817 () Bool)

(declare-fun e!290107 () Bool)

(assert (=> b!494248 (=> res!296817 e!290107)))

(declare-datatypes ((SeekEntryResult!3844 0))(
  ( (MissingZero!3844 (index!17555 (_ BitVec 32))) (Found!3844 (index!17556 (_ BitVec 32))) (Intermediate!3844 (undefined!4656 Bool) (index!17557 (_ BitVec 32)) (x!46626 (_ BitVec 32))) (Undefined!3844) (MissingVacant!3844 (index!17558 (_ BitVec 32))) )
))
(declare-fun lt!223659 () SeekEntryResult!3844)

(assert (=> b!494248 (= res!296817 (or (not (is-Intermediate!3844 lt!223659)) (not (undefined!4656 lt!223659))))))

(declare-fun res!296824 () Bool)

(assert (=> start!45040 (=> (not res!296824) (not e!290109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45040 (= res!296824 (validMask!0 mask!3524))))

(assert (=> start!45040 e!290109))

(assert (=> start!45040 true))

(declare-fun array_inv!11173 (array!31985) Bool)

(assert (=> start!45040 (array_inv!11173 a!3235)))

(declare-fun b!494249 () Bool)

(declare-fun res!296822 () Bool)

(assert (=> b!494249 (=> (not res!296822) (not e!290109))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494249 (= res!296822 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494250 () Bool)

(assert (=> b!494250 (= e!290106 (not e!290107))))

(declare-fun res!296823 () Bool)

(assert (=> b!494250 (=> res!296823 e!290107)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!223655 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31985 (_ BitVec 32)) SeekEntryResult!3844)

(assert (=> b!494250 (= res!296823 (= lt!223659 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223655 (select (store (arr!15377 a!3235) i!1204 k!2280) j!176) (array!31986 (store (arr!15377 a!3235) i!1204 k!2280) (size!15741 a!3235)) mask!3524)))))

(declare-fun lt!223656 () (_ BitVec 32))

(assert (=> b!494250 (= lt!223659 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223656 (select (arr!15377 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494250 (= lt!223655 (toIndex!0 (select (store (arr!15377 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494250 (= lt!223656 (toIndex!0 (select (arr!15377 a!3235) j!176) mask!3524))))

(declare-fun lt!223660 () SeekEntryResult!3844)

(assert (=> b!494250 (= lt!223660 (Found!3844 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31985 (_ BitVec 32)) SeekEntryResult!3844)

(assert (=> b!494250 (= lt!223660 (seekEntryOrOpen!0 (select (arr!15377 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494250 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14634 0))(
  ( (Unit!14635) )
))
(declare-fun lt!223658 () Unit!14634)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31985 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14634)

(assert (=> b!494250 (= lt!223658 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494251 () Bool)

(declare-fun res!296818 () Bool)

(assert (=> b!494251 (=> (not res!296818) (not e!290109))))

(assert (=> b!494251 (= res!296818 (validKeyInArray!0 k!2280))))

(declare-fun b!494252 () Bool)

(declare-fun res!296825 () Bool)

(assert (=> b!494252 (=> (not res!296825) (not e!290106))))

(declare-datatypes ((List!9535 0))(
  ( (Nil!9532) (Cons!9531 (h!10399 (_ BitVec 64)) (t!15763 List!9535)) )
))
(declare-fun arrayNoDuplicates!0 (array!31985 (_ BitVec 32) List!9535) Bool)

(assert (=> b!494252 (= res!296825 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9532))))

(declare-fun b!494253 () Bool)

(declare-fun res!296820 () Bool)

(assert (=> b!494253 (=> (not res!296820) (not e!290109))))

(assert (=> b!494253 (= res!296820 (and (= (size!15741 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15741 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15741 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494254 () Bool)

(assert (=> b!494254 (= e!290107 true)))

(assert (=> b!494254 (= lt!223660 Undefined!3844)))

(declare-fun b!494255 () Bool)

(assert (=> b!494255 (= e!290109 e!290106)))

(declare-fun res!296821 () Bool)

(assert (=> b!494255 (=> (not res!296821) (not e!290106))))

(declare-fun lt!223657 () SeekEntryResult!3844)

(assert (=> b!494255 (= res!296821 (or (= lt!223657 (MissingZero!3844 i!1204)) (= lt!223657 (MissingVacant!3844 i!1204))))))

(assert (=> b!494255 (= lt!223657 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45040 res!296824) b!494253))

(assert (= (and b!494253 res!296820) b!494247))

(assert (= (and b!494247 res!296816) b!494251))

(assert (= (and b!494251 res!296818) b!494249))

(assert (= (and b!494249 res!296822) b!494255))

(assert (= (and b!494255 res!296821) b!494246))

(assert (= (and b!494246 res!296819) b!494252))

(assert (= (and b!494252 res!296825) b!494250))

(assert (= (and b!494250 (not res!296823)) b!494248))

(assert (= (and b!494248 (not res!296817)) b!494254))

(declare-fun m!475251 () Bool)

(assert (=> b!494255 m!475251))

(declare-fun m!475253 () Bool)

(assert (=> b!494247 m!475253))

(assert (=> b!494247 m!475253))

(declare-fun m!475255 () Bool)

(assert (=> b!494247 m!475255))

(declare-fun m!475257 () Bool)

(assert (=> start!45040 m!475257))

(declare-fun m!475259 () Bool)

(assert (=> start!45040 m!475259))

(declare-fun m!475261 () Bool)

(assert (=> b!494250 m!475261))

(declare-fun m!475263 () Bool)

(assert (=> b!494250 m!475263))

(declare-fun m!475265 () Bool)

(assert (=> b!494250 m!475265))

(assert (=> b!494250 m!475253))

(declare-fun m!475267 () Bool)

(assert (=> b!494250 m!475267))

(assert (=> b!494250 m!475253))

(declare-fun m!475269 () Bool)

(assert (=> b!494250 m!475269))

(assert (=> b!494250 m!475253))

(declare-fun m!475271 () Bool)

(assert (=> b!494250 m!475271))

(assert (=> b!494250 m!475253))

(declare-fun m!475273 () Bool)

(assert (=> b!494250 m!475273))

(assert (=> b!494250 m!475265))

(declare-fun m!475275 () Bool)

(assert (=> b!494250 m!475275))

(assert (=> b!494250 m!475265))

(declare-fun m!475277 () Bool)

(assert (=> b!494250 m!475277))

(declare-fun m!475279 () Bool)

(assert (=> b!494252 m!475279))

(declare-fun m!475281 () Bool)

(assert (=> b!494246 m!475281))

(declare-fun m!475283 () Bool)

(assert (=> b!494249 m!475283))

(declare-fun m!475285 () Bool)

(assert (=> b!494251 m!475285))

(push 1)

