; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45052 () Bool)

(assert start!45052)

(declare-fun b!494426 () Bool)

(declare-fun e!290180 () Bool)

(assert (=> b!494426 (= e!290180 true)))

(declare-datatypes ((SeekEntryResult!3850 0))(
  ( (MissingZero!3850 (index!17579 (_ BitVec 32))) (Found!3850 (index!17580 (_ BitVec 32))) (Intermediate!3850 (undefined!4662 Bool) (index!17581 (_ BitVec 32)) (x!46648 (_ BitVec 32))) (Undefined!3850) (MissingVacant!3850 (index!17582 (_ BitVec 32))) )
))
(declare-fun lt!223764 () SeekEntryResult!3850)

(assert (=> b!494426 (= lt!223764 Undefined!3850)))

(declare-fun res!296998 () Bool)

(declare-fun e!290179 () Bool)

(assert (=> start!45052 (=> (not res!296998) (not e!290179))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45052 (= res!296998 (validMask!0 mask!3524))))

(assert (=> start!45052 e!290179))

(assert (=> start!45052 true))

(declare-datatypes ((array!31997 0))(
  ( (array!31998 (arr!15383 (Array (_ BitVec 32) (_ BitVec 64))) (size!15747 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31997)

(declare-fun array_inv!11179 (array!31997) Bool)

(assert (=> start!45052 (array_inv!11179 a!3235)))

(declare-fun b!494427 () Bool)

(declare-fun res!297003 () Bool)

(assert (=> b!494427 (=> (not res!297003) (not e!290179))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494427 (= res!297003 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494428 () Bool)

(declare-fun e!290178 () Bool)

(assert (=> b!494428 (= e!290179 e!290178)))

(declare-fun res!297001 () Bool)

(assert (=> b!494428 (=> (not res!297001) (not e!290178))))

(declare-fun lt!223766 () SeekEntryResult!3850)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494428 (= res!297001 (or (= lt!223766 (MissingZero!3850 i!1204)) (= lt!223766 (MissingVacant!3850 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31997 (_ BitVec 32)) SeekEntryResult!3850)

(assert (=> b!494428 (= lt!223766 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!494429 () Bool)

(assert (=> b!494429 (= e!290178 (not e!290180))))

(declare-fun res!297000 () Bool)

(assert (=> b!494429 (=> res!297000 e!290180)))

(declare-fun lt!223767 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!223768 () SeekEntryResult!3850)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31997 (_ BitVec 32)) SeekEntryResult!3850)

(assert (=> b!494429 (= res!297000 (= lt!223768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223767 (select (store (arr!15383 a!3235) i!1204 k!2280) j!176) (array!31998 (store (arr!15383 a!3235) i!1204 k!2280) (size!15747 a!3235)) mask!3524)))))

(declare-fun lt!223765 () (_ BitVec 32))

(assert (=> b!494429 (= lt!223768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223765 (select (arr!15383 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494429 (= lt!223767 (toIndex!0 (select (store (arr!15383 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494429 (= lt!223765 (toIndex!0 (select (arr!15383 a!3235) j!176) mask!3524))))

(assert (=> b!494429 (= lt!223764 (Found!3850 j!176))))

(assert (=> b!494429 (= lt!223764 (seekEntryOrOpen!0 (select (arr!15383 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31997 (_ BitVec 32)) Bool)

(assert (=> b!494429 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14646 0))(
  ( (Unit!14647) )
))
(declare-fun lt!223763 () Unit!14646)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31997 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14646)

(assert (=> b!494429 (= lt!223763 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494430 () Bool)

(declare-fun res!297002 () Bool)

(assert (=> b!494430 (=> (not res!297002) (not e!290178))))

(declare-datatypes ((List!9541 0))(
  ( (Nil!9538) (Cons!9537 (h!10405 (_ BitVec 64)) (t!15769 List!9541)) )
))
(declare-fun arrayNoDuplicates!0 (array!31997 (_ BitVec 32) List!9541) Bool)

(assert (=> b!494430 (= res!297002 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9538))))

(declare-fun b!494431 () Bool)

(declare-fun res!297004 () Bool)

(assert (=> b!494431 (=> (not res!297004) (not e!290179))))

(assert (=> b!494431 (= res!297004 (and (= (size!15747 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15747 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15747 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494432 () Bool)

(declare-fun res!297005 () Bool)

(assert (=> b!494432 (=> (not res!297005) (not e!290179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494432 (= res!297005 (validKeyInArray!0 (select (arr!15383 a!3235) j!176)))))

(declare-fun b!494433 () Bool)

(declare-fun res!296997 () Bool)

(assert (=> b!494433 (=> (not res!296997) (not e!290178))))

(assert (=> b!494433 (= res!296997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494434 () Bool)

(declare-fun res!296996 () Bool)

(assert (=> b!494434 (=> (not res!296996) (not e!290179))))

(assert (=> b!494434 (= res!296996 (validKeyInArray!0 k!2280))))

(declare-fun b!494435 () Bool)

(declare-fun res!296999 () Bool)

(assert (=> b!494435 (=> res!296999 e!290180)))

(assert (=> b!494435 (= res!296999 (or (not (is-Intermediate!3850 lt!223768)) (not (undefined!4662 lt!223768))))))

(assert (= (and start!45052 res!296998) b!494431))

(assert (= (and b!494431 res!297004) b!494432))

(assert (= (and b!494432 res!297005) b!494434))

(assert (= (and b!494434 res!296996) b!494427))

(assert (= (and b!494427 res!297003) b!494428))

(assert (= (and b!494428 res!297001) b!494433))

(assert (= (and b!494433 res!296997) b!494430))

(assert (= (and b!494430 res!297002) b!494429))

(assert (= (and b!494429 (not res!297000)) b!494435))

(assert (= (and b!494435 (not res!296999)) b!494426))

(declare-fun m!475467 () Bool)

(assert (=> b!494427 m!475467))

(declare-fun m!475469 () Bool)

(assert (=> start!45052 m!475469))

(declare-fun m!475471 () Bool)

(assert (=> start!45052 m!475471))

(declare-fun m!475473 () Bool)

(assert (=> b!494430 m!475473))

(declare-fun m!475475 () Bool)

(assert (=> b!494432 m!475475))

(assert (=> b!494432 m!475475))

(declare-fun m!475477 () Bool)

(assert (=> b!494432 m!475477))

(declare-fun m!475479 () Bool)

(assert (=> b!494428 m!475479))

(declare-fun m!475481 () Bool)

(assert (=> b!494433 m!475481))

(declare-fun m!475483 () Bool)

(assert (=> b!494429 m!475483))

(declare-fun m!475485 () Bool)

(assert (=> b!494429 m!475485))

(declare-fun m!475487 () Bool)

(assert (=> b!494429 m!475487))

(assert (=> b!494429 m!475475))

(declare-fun m!475489 () Bool)

(assert (=> b!494429 m!475489))

(assert (=> b!494429 m!475475))

(declare-fun m!475491 () Bool)

(assert (=> b!494429 m!475491))

(assert (=> b!494429 m!475475))

(declare-fun m!475493 () Bool)

(assert (=> b!494429 m!475493))

(assert (=> b!494429 m!475487))

(declare-fun m!475495 () Bool)

(assert (=> b!494429 m!475495))

(assert (=> b!494429 m!475475))

(declare-fun m!475497 () Bool)

(assert (=> b!494429 m!475497))

(assert (=> b!494429 m!475487))

(declare-fun m!475499 () Bool)

(assert (=> b!494429 m!475499))

(declare-fun m!475501 () Bool)

(assert (=> b!494434 m!475501))

(push 1)

