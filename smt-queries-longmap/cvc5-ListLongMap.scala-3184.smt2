; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44730 () Bool)

(assert start!44730)

(declare-fun b!490947 () Bool)

(declare-fun e!288534 () Bool)

(declare-fun e!288532 () Bool)

(assert (=> b!490947 (= e!288534 e!288532)))

(declare-fun res!293884 () Bool)

(assert (=> b!490947 (=> (not res!293884) (not e!288532))))

(declare-datatypes ((SeekEntryResult!3749 0))(
  ( (MissingZero!3749 (index!17175 (_ BitVec 32))) (Found!3749 (index!17176 (_ BitVec 32))) (Intermediate!3749 (undefined!4561 Bool) (index!17177 (_ BitVec 32)) (x!46271 (_ BitVec 32))) (Undefined!3749) (MissingVacant!3749 (index!17178 (_ BitVec 32))) )
))
(declare-fun lt!221832 () SeekEntryResult!3749)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490947 (= res!293884 (or (= lt!221832 (MissingZero!3749 i!1204)) (= lt!221832 (MissingVacant!3749 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31789 0))(
  ( (array!31790 (arr!15282 (Array (_ BitVec 32) (_ BitVec 64))) (size!15646 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31789)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31789 (_ BitVec 32)) SeekEntryResult!3749)

(assert (=> b!490947 (= lt!221832 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490948 () Bool)

(declare-fun res!293885 () Bool)

(assert (=> b!490948 (=> (not res!293885) (not e!288534))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490948 (= res!293885 (and (= (size!15646 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15646 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15646 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!293888 () Bool)

(assert (=> start!44730 (=> (not res!293888) (not e!288534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44730 (= res!293888 (validMask!0 mask!3524))))

(assert (=> start!44730 e!288534))

(assert (=> start!44730 true))

(declare-fun array_inv!11078 (array!31789) Bool)

(assert (=> start!44730 (array_inv!11078 a!3235)))

(declare-fun b!490949 () Bool)

(declare-fun res!293886 () Bool)

(assert (=> b!490949 (=> (not res!293886) (not e!288532))))

(declare-datatypes ((List!9440 0))(
  ( (Nil!9437) (Cons!9436 (h!10298 (_ BitVec 64)) (t!15668 List!9440)) )
))
(declare-fun arrayNoDuplicates!0 (array!31789 (_ BitVec 32) List!9440) Bool)

(assert (=> b!490949 (= res!293886 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9437))))

(declare-fun b!490950 () Bool)

(declare-fun res!293887 () Bool)

(assert (=> b!490950 (=> (not res!293887) (not e!288534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490950 (= res!293887 (validKeyInArray!0 k!2280))))

(declare-fun b!490951 () Bool)

(declare-fun res!293883 () Bool)

(assert (=> b!490951 (=> (not res!293883) (not e!288534))))

(declare-fun arrayContainsKey!0 (array!31789 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490951 (= res!293883 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490952 () Bool)

(declare-fun res!293890 () Bool)

(assert (=> b!490952 (=> (not res!293890) (not e!288534))))

(assert (=> b!490952 (= res!293890 (validKeyInArray!0 (select (arr!15282 a!3235) j!176)))))

(declare-fun b!490953 () Bool)

(declare-fun e!288533 () Bool)

(assert (=> b!490953 (= e!288533 true)))

(declare-fun lt!221835 () array!31789)

(declare-fun lt!221834 () (_ BitVec 64))

(declare-fun lt!221831 () SeekEntryResult!3749)

(assert (=> b!490953 (= lt!221831 (seekEntryOrOpen!0 lt!221834 lt!221835 mask!3524))))

(declare-datatypes ((Unit!14444 0))(
  ( (Unit!14445) )
))
(declare-fun lt!221833 () Unit!14444)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31789 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14444)

(assert (=> b!490953 (= lt!221833 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!490954 () Bool)

(assert (=> b!490954 (= e!288532 (not e!288533))))

(declare-fun res!293891 () Bool)

(assert (=> b!490954 (=> res!293891 e!288533)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31789 (_ BitVec 32)) SeekEntryResult!3749)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490954 (= res!293891 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15282 a!3235) j!176) mask!3524) (select (arr!15282 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221834 mask!3524) lt!221834 lt!221835 mask!3524))))))

(assert (=> b!490954 (= lt!221834 (select (store (arr!15282 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!490954 (= lt!221835 (array!31790 (store (arr!15282 a!3235) i!1204 k!2280) (size!15646 a!3235)))))

(assert (=> b!490954 (= lt!221831 (Found!3749 j!176))))

(assert (=> b!490954 (= lt!221831 (seekEntryOrOpen!0 (select (arr!15282 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31789 (_ BitVec 32)) Bool)

(assert (=> b!490954 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221836 () Unit!14444)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31789 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14444)

(assert (=> b!490954 (= lt!221836 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490955 () Bool)

(declare-fun res!293889 () Bool)

(assert (=> b!490955 (=> (not res!293889) (not e!288532))))

(assert (=> b!490955 (= res!293889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44730 res!293888) b!490948))

(assert (= (and b!490948 res!293885) b!490952))

(assert (= (and b!490952 res!293890) b!490950))

(assert (= (and b!490950 res!293887) b!490951))

(assert (= (and b!490951 res!293883) b!490947))

(assert (= (and b!490947 res!293884) b!490955))

(assert (= (and b!490955 res!293889) b!490949))

(assert (= (and b!490949 res!293886) b!490954))

(assert (= (and b!490954 (not res!293891)) b!490953))

(declare-fun m!471297 () Bool)

(assert (=> b!490949 m!471297))

(declare-fun m!471299 () Bool)

(assert (=> b!490951 m!471299))

(declare-fun m!471301 () Bool)

(assert (=> b!490954 m!471301))

(declare-fun m!471303 () Bool)

(assert (=> b!490954 m!471303))

(declare-fun m!471305 () Bool)

(assert (=> b!490954 m!471305))

(declare-fun m!471307 () Bool)

(assert (=> b!490954 m!471307))

(declare-fun m!471309 () Bool)

(assert (=> b!490954 m!471309))

(declare-fun m!471311 () Bool)

(assert (=> b!490954 m!471311))

(declare-fun m!471313 () Bool)

(assert (=> b!490954 m!471313))

(assert (=> b!490954 m!471301))

(declare-fun m!471315 () Bool)

(assert (=> b!490954 m!471315))

(assert (=> b!490954 m!471311))

(assert (=> b!490954 m!471309))

(assert (=> b!490954 m!471311))

(declare-fun m!471317 () Bool)

(assert (=> b!490954 m!471317))

(assert (=> b!490954 m!471311))

(declare-fun m!471319 () Bool)

(assert (=> b!490954 m!471319))

(declare-fun m!471321 () Bool)

(assert (=> b!490950 m!471321))

(declare-fun m!471323 () Bool)

(assert (=> b!490947 m!471323))

(assert (=> b!490952 m!471311))

(assert (=> b!490952 m!471311))

(declare-fun m!471325 () Bool)

(assert (=> b!490952 m!471325))

(declare-fun m!471327 () Bool)

(assert (=> start!44730 m!471327))

(declare-fun m!471329 () Bool)

(assert (=> start!44730 m!471329))

(declare-fun m!471331 () Bool)

(assert (=> b!490953 m!471331))

(declare-fun m!471333 () Bool)

(assert (=> b!490953 m!471333))

(declare-fun m!471335 () Bool)

(assert (=> b!490955 m!471335))

(push 1)

