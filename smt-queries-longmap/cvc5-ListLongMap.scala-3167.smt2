; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44628 () Bool)

(assert start!44628)

(declare-fun res!292512 () Bool)

(declare-fun e!287920 () Bool)

(assert (=> start!44628 (=> (not res!292512) (not e!287920))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44628 (= res!292512 (validMask!0 mask!3524))))

(assert (=> start!44628 e!287920))

(assert (=> start!44628 true))

(declare-datatypes ((array!31687 0))(
  ( (array!31688 (arr!15231 (Array (_ BitVec 32) (_ BitVec 64))) (size!15595 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31687)

(declare-fun array_inv!11027 (array!31687) Bool)

(assert (=> start!44628 (array_inv!11027 a!3235)))

(declare-fun b!489570 () Bool)

(declare-fun res!292514 () Bool)

(declare-fun e!287919 () Bool)

(assert (=> b!489570 (=> (not res!292514) (not e!287919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31687 (_ BitVec 32)) Bool)

(assert (=> b!489570 (= res!292514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489571 () Bool)

(declare-fun res!292509 () Bool)

(assert (=> b!489571 (=> (not res!292509) (not e!287920))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489571 (= res!292509 (validKeyInArray!0 (select (arr!15231 a!3235) j!176)))))

(declare-fun b!489572 () Bool)

(declare-fun res!292513 () Bool)

(assert (=> b!489572 (=> (not res!292513) (not e!287920))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489572 (= res!292513 (and (= (size!15595 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15595 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15595 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489573 () Bool)

(declare-fun res!292511 () Bool)

(assert (=> b!489573 (=> (not res!292511) (not e!287919))))

(declare-datatypes ((List!9389 0))(
  ( (Nil!9386) (Cons!9385 (h!10247 (_ BitVec 64)) (t!15617 List!9389)) )
))
(declare-fun arrayNoDuplicates!0 (array!31687 (_ BitVec 32) List!9389) Bool)

(assert (=> b!489573 (= res!292511 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9386))))

(declare-fun b!489574 () Bool)

(declare-fun res!292506 () Bool)

(assert (=> b!489574 (=> (not res!292506) (not e!287920))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!489574 (= res!292506 (validKeyInArray!0 k!2280))))

(declare-fun b!489575 () Bool)

(declare-fun res!292507 () Bool)

(assert (=> b!489575 (=> (not res!292507) (not e!287920))))

(declare-fun arrayContainsKey!0 (array!31687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489575 (= res!292507 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489576 () Bool)

(assert (=> b!489576 (= e!287919 (not true))))

(declare-datatypes ((SeekEntryResult!3698 0))(
  ( (MissingZero!3698 (index!16971 (_ BitVec 32))) (Found!3698 (index!16972 (_ BitVec 32))) (Intermediate!3698 (undefined!4510 Bool) (index!16973 (_ BitVec 32)) (x!46084 (_ BitVec 32))) (Undefined!3698) (MissingVacant!3698 (index!16974 (_ BitVec 32))) )
))
(declare-fun lt!220913 () SeekEntryResult!3698)

(declare-fun lt!220917 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31687 (_ BitVec 32)) SeekEntryResult!3698)

(assert (=> b!489576 (= lt!220913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220917 (select (store (arr!15231 a!3235) i!1204 k!2280) j!176) (array!31688 (store (arr!15231 a!3235) i!1204 k!2280) (size!15595 a!3235)) mask!3524))))

(declare-fun lt!220914 () SeekEntryResult!3698)

(declare-fun lt!220915 () (_ BitVec 32))

(assert (=> b!489576 (= lt!220914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220915 (select (arr!15231 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489576 (= lt!220917 (toIndex!0 (select (store (arr!15231 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489576 (= lt!220915 (toIndex!0 (select (arr!15231 a!3235) j!176) mask!3524))))

(declare-fun e!287922 () Bool)

(assert (=> b!489576 e!287922))

(declare-fun res!292510 () Bool)

(assert (=> b!489576 (=> (not res!292510) (not e!287922))))

(assert (=> b!489576 (= res!292510 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14342 0))(
  ( (Unit!14343) )
))
(declare-fun lt!220918 () Unit!14342)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31687 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14342)

(assert (=> b!489576 (= lt!220918 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489577 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31687 (_ BitVec 32)) SeekEntryResult!3698)

(assert (=> b!489577 (= e!287922 (= (seekEntryOrOpen!0 (select (arr!15231 a!3235) j!176) a!3235 mask!3524) (Found!3698 j!176)))))

(declare-fun b!489578 () Bool)

(assert (=> b!489578 (= e!287920 e!287919)))

(declare-fun res!292508 () Bool)

(assert (=> b!489578 (=> (not res!292508) (not e!287919))))

(declare-fun lt!220916 () SeekEntryResult!3698)

(assert (=> b!489578 (= res!292508 (or (= lt!220916 (MissingZero!3698 i!1204)) (= lt!220916 (MissingVacant!3698 i!1204))))))

(assert (=> b!489578 (= lt!220916 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!44628 res!292512) b!489572))

(assert (= (and b!489572 res!292513) b!489571))

(assert (= (and b!489571 res!292509) b!489574))

(assert (= (and b!489574 res!292506) b!489575))

(assert (= (and b!489575 res!292507) b!489578))

(assert (= (and b!489578 res!292508) b!489570))

(assert (= (and b!489570 res!292514) b!489573))

(assert (= (and b!489573 res!292511) b!489576))

(assert (= (and b!489576 res!292510) b!489577))

(declare-fun m!469389 () Bool)

(assert (=> b!489575 m!469389))

(declare-fun m!469391 () Bool)

(assert (=> b!489576 m!469391))

(declare-fun m!469393 () Bool)

(assert (=> b!489576 m!469393))

(declare-fun m!469395 () Bool)

(assert (=> b!489576 m!469395))

(declare-fun m!469397 () Bool)

(assert (=> b!489576 m!469397))

(assert (=> b!489576 m!469393))

(declare-fun m!469399 () Bool)

(assert (=> b!489576 m!469399))

(declare-fun m!469401 () Bool)

(assert (=> b!489576 m!469401))

(assert (=> b!489576 m!469399))

(declare-fun m!469403 () Bool)

(assert (=> b!489576 m!469403))

(assert (=> b!489576 m!469399))

(declare-fun m!469405 () Bool)

(assert (=> b!489576 m!469405))

(assert (=> b!489576 m!469393))

(declare-fun m!469407 () Bool)

(assert (=> b!489576 m!469407))

(declare-fun m!469409 () Bool)

(assert (=> b!489578 m!469409))

(declare-fun m!469411 () Bool)

(assert (=> start!44628 m!469411))

(declare-fun m!469413 () Bool)

(assert (=> start!44628 m!469413))

(assert (=> b!489577 m!469399))

(assert (=> b!489577 m!469399))

(declare-fun m!469415 () Bool)

(assert (=> b!489577 m!469415))

(declare-fun m!469417 () Bool)

(assert (=> b!489573 m!469417))

(declare-fun m!469419 () Bool)

(assert (=> b!489574 m!469419))

(assert (=> b!489571 m!469399))

(assert (=> b!489571 m!469399))

(declare-fun m!469421 () Bool)

(assert (=> b!489571 m!469421))

(declare-fun m!469423 () Bool)

(assert (=> b!489570 m!469423))

(push 1)

