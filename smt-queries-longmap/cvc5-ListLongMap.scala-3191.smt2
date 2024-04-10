; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44772 () Bool)

(assert start!44772)

(declare-fun b!491523 () Bool)

(declare-fun e!288794 () Bool)

(declare-fun e!288795 () Bool)

(assert (=> b!491523 (= e!288794 e!288795)))

(declare-fun res!294459 () Bool)

(assert (=> b!491523 (=> (not res!294459) (not e!288795))))

(declare-datatypes ((SeekEntryResult!3770 0))(
  ( (MissingZero!3770 (index!17259 (_ BitVec 32))) (Found!3770 (index!17260 (_ BitVec 32))) (Intermediate!3770 (undefined!4582 Bool) (index!17261 (_ BitVec 32)) (x!46348 (_ BitVec 32))) (Undefined!3770) (MissingVacant!3770 (index!17262 (_ BitVec 32))) )
))
(declare-fun lt!222210 () SeekEntryResult!3770)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491523 (= res!294459 (or (= lt!222210 (MissingZero!3770 i!1204)) (= lt!222210 (MissingVacant!3770 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31831 0))(
  ( (array!31832 (arr!15303 (Array (_ BitVec 32) (_ BitVec 64))) (size!15667 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31831)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31831 (_ BitVec 32)) SeekEntryResult!3770)

(assert (=> b!491523 (= lt!222210 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491524 () Bool)

(declare-fun res!294467 () Bool)

(assert (=> b!491524 (=> (not res!294467) (not e!288794))))

(declare-fun arrayContainsKey!0 (array!31831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491524 (= res!294467 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!294465 () Bool)

(assert (=> start!44772 (=> (not res!294465) (not e!288794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44772 (= res!294465 (validMask!0 mask!3524))))

(assert (=> start!44772 e!288794))

(assert (=> start!44772 true))

(declare-fun array_inv!11099 (array!31831) Bool)

(assert (=> start!44772 (array_inv!11099 a!3235)))

(declare-fun b!491525 () Bool)

(declare-fun res!294461 () Bool)

(assert (=> b!491525 (=> (not res!294461) (not e!288794))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!491525 (= res!294461 (and (= (size!15667 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15667 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15667 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491526 () Bool)

(declare-fun e!288792 () Bool)

(assert (=> b!491526 (= e!288795 (not e!288792))))

(declare-fun res!294462 () Bool)

(assert (=> b!491526 (=> res!294462 e!288792)))

(declare-fun lt!222212 () array!31831)

(declare-fun lt!222209 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31831 (_ BitVec 32)) SeekEntryResult!3770)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491526 (= res!294462 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15303 a!3235) j!176) mask!3524) (select (arr!15303 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222209 mask!3524) lt!222209 lt!222212 mask!3524))))))

(assert (=> b!491526 (= lt!222209 (select (store (arr!15303 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491526 (= lt!222212 (array!31832 (store (arr!15303 a!3235) i!1204 k!2280) (size!15667 a!3235)))))

(declare-fun lt!222211 () SeekEntryResult!3770)

(assert (=> b!491526 (= lt!222211 (Found!3770 j!176))))

(assert (=> b!491526 (= lt!222211 (seekEntryOrOpen!0 (select (arr!15303 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31831 (_ BitVec 32)) Bool)

(assert (=> b!491526 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14486 0))(
  ( (Unit!14487) )
))
(declare-fun lt!222213 () Unit!14486)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31831 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14486)

(assert (=> b!491526 (= lt!222213 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491527 () Bool)

(assert (=> b!491527 (= e!288792 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!491527 (= lt!222211 (seekEntryOrOpen!0 lt!222209 lt!222212 mask!3524))))

(declare-fun lt!222214 () Unit!14486)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31831 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14486)

(assert (=> b!491527 (= lt!222214 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491528 () Bool)

(declare-fun res!294464 () Bool)

(assert (=> b!491528 (=> (not res!294464) (not e!288794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491528 (= res!294464 (validKeyInArray!0 k!2280))))

(declare-fun b!491529 () Bool)

(declare-fun res!294463 () Bool)

(assert (=> b!491529 (=> (not res!294463) (not e!288794))))

(assert (=> b!491529 (= res!294463 (validKeyInArray!0 (select (arr!15303 a!3235) j!176)))))

(declare-fun b!491530 () Bool)

(declare-fun res!294460 () Bool)

(assert (=> b!491530 (=> (not res!294460) (not e!288795))))

(declare-datatypes ((List!9461 0))(
  ( (Nil!9458) (Cons!9457 (h!10319 (_ BitVec 64)) (t!15689 List!9461)) )
))
(declare-fun arrayNoDuplicates!0 (array!31831 (_ BitVec 32) List!9461) Bool)

(assert (=> b!491530 (= res!294460 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9458))))

(declare-fun b!491531 () Bool)

(declare-fun res!294466 () Bool)

(assert (=> b!491531 (=> (not res!294466) (not e!288795))))

(assert (=> b!491531 (= res!294466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44772 res!294465) b!491525))

(assert (= (and b!491525 res!294461) b!491529))

(assert (= (and b!491529 res!294463) b!491528))

(assert (= (and b!491528 res!294464) b!491524))

(assert (= (and b!491524 res!294467) b!491523))

(assert (= (and b!491523 res!294459) b!491531))

(assert (= (and b!491531 res!294466) b!491530))

(assert (= (and b!491530 res!294460) b!491526))

(assert (= (and b!491526 (not res!294462)) b!491527))

(declare-fun m!472143 () Bool)

(assert (=> b!491530 m!472143))

(declare-fun m!472145 () Bool)

(assert (=> b!491524 m!472145))

(declare-fun m!472147 () Bool)

(assert (=> b!491531 m!472147))

(declare-fun m!472149 () Bool)

(assert (=> b!491527 m!472149))

(declare-fun m!472151 () Bool)

(assert (=> b!491527 m!472151))

(declare-fun m!472153 () Bool)

(assert (=> b!491528 m!472153))

(declare-fun m!472155 () Bool)

(assert (=> b!491523 m!472155))

(declare-fun m!472157 () Bool)

(assert (=> start!44772 m!472157))

(declare-fun m!472159 () Bool)

(assert (=> start!44772 m!472159))

(declare-fun m!472161 () Bool)

(assert (=> b!491529 m!472161))

(assert (=> b!491529 m!472161))

(declare-fun m!472163 () Bool)

(assert (=> b!491529 m!472163))

(declare-fun m!472165 () Bool)

(assert (=> b!491526 m!472165))

(declare-fun m!472167 () Bool)

(assert (=> b!491526 m!472167))

(declare-fun m!472169 () Bool)

(assert (=> b!491526 m!472169))

(declare-fun m!472171 () Bool)

(assert (=> b!491526 m!472171))

(declare-fun m!472173 () Bool)

(assert (=> b!491526 m!472173))

(assert (=> b!491526 m!472161))

(declare-fun m!472175 () Bool)

(assert (=> b!491526 m!472175))

(assert (=> b!491526 m!472161))

(assert (=> b!491526 m!472173))

(assert (=> b!491526 m!472161))

(declare-fun m!472177 () Bool)

(assert (=> b!491526 m!472177))

(assert (=> b!491526 m!472161))

(declare-fun m!472179 () Bool)

(assert (=> b!491526 m!472179))

(assert (=> b!491526 m!472167))

(declare-fun m!472181 () Bool)

(assert (=> b!491526 m!472181))

(push 1)

