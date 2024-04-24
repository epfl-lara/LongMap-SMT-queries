; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44246 () Bool)

(assert start!44246)

(declare-fun b!486622 () Bool)

(declare-fun res!290065 () Bool)

(declare-fun e!286440 () Bool)

(assert (=> b!486622 (=> (not res!290065) (not e!286440))))

(declare-datatypes ((array!31498 0))(
  ( (array!31499 (arr!15142 (Array (_ BitVec 32) (_ BitVec 64))) (size!15506 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31498)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486622 (= res!290065 (validKeyInArray!0 (select (arr!15142 a!3235) j!176)))))

(declare-fun b!486623 () Bool)

(declare-fun res!290064 () Bool)

(declare-fun e!286438 () Bool)

(assert (=> b!486623 (=> (not res!290064) (not e!286438))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31498 (_ BitVec 32)) Bool)

(assert (=> b!486623 (= res!290064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!290063 () Bool)

(assert (=> start!44246 (=> (not res!290063) (not e!286440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44246 (= res!290063 (validMask!0 mask!3524))))

(assert (=> start!44246 e!286440))

(assert (=> start!44246 true))

(declare-fun array_inv!11001 (array!31498) Bool)

(assert (=> start!44246 (array_inv!11001 a!3235)))

(declare-fun b!486624 () Bool)

(declare-fun res!290066 () Bool)

(assert (=> b!486624 (=> (not res!290066) (not e!286440))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486624 (= res!290066 (and (= (size!15506 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15506 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15506 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486625 () Bool)

(assert (=> b!486625 (= e!286438 false)))

(declare-fun lt!219837 () Bool)

(declare-datatypes ((List!9207 0))(
  ( (Nil!9204) (Cons!9203 (h!10059 (_ BitVec 64)) (t!15427 List!9207)) )
))
(declare-fun arrayNoDuplicates!0 (array!31498 (_ BitVec 32) List!9207) Bool)

(assert (=> b!486625 (= lt!219837 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9204))))

(declare-fun b!486626 () Bool)

(declare-fun res!290068 () Bool)

(assert (=> b!486626 (=> (not res!290068) (not e!286440))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!486626 (= res!290068 (validKeyInArray!0 k0!2280))))

(declare-fun b!486627 () Bool)

(declare-fun res!290062 () Bool)

(assert (=> b!486627 (=> (not res!290062) (not e!286440))))

(declare-fun arrayContainsKey!0 (array!31498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486627 (= res!290062 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486628 () Bool)

(assert (=> b!486628 (= e!286440 e!286438)))

(declare-fun res!290067 () Bool)

(assert (=> b!486628 (=> (not res!290067) (not e!286438))))

(declare-datatypes ((SeekEntryResult!3565 0))(
  ( (MissingZero!3565 (index!16439 (_ BitVec 32))) (Found!3565 (index!16440 (_ BitVec 32))) (Intermediate!3565 (undefined!4377 Bool) (index!16441 (_ BitVec 32)) (x!45718 (_ BitVec 32))) (Undefined!3565) (MissingVacant!3565 (index!16442 (_ BitVec 32))) )
))
(declare-fun lt!219838 () SeekEntryResult!3565)

(assert (=> b!486628 (= res!290067 (or (= lt!219838 (MissingZero!3565 i!1204)) (= lt!219838 (MissingVacant!3565 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31498 (_ BitVec 32)) SeekEntryResult!3565)

(assert (=> b!486628 (= lt!219838 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44246 res!290063) b!486624))

(assert (= (and b!486624 res!290066) b!486622))

(assert (= (and b!486622 res!290065) b!486626))

(assert (= (and b!486626 res!290068) b!486627))

(assert (= (and b!486627 res!290062) b!486628))

(assert (= (and b!486628 res!290067) b!486623))

(assert (= (and b!486623 res!290064) b!486625))

(declare-fun m!466771 () Bool)

(assert (=> b!486625 m!466771))

(declare-fun m!466773 () Bool)

(assert (=> start!44246 m!466773))

(declare-fun m!466775 () Bool)

(assert (=> start!44246 m!466775))

(declare-fun m!466777 () Bool)

(assert (=> b!486623 m!466777))

(declare-fun m!466779 () Bool)

(assert (=> b!486626 m!466779))

(declare-fun m!466781 () Bool)

(assert (=> b!486628 m!466781))

(declare-fun m!466783 () Bool)

(assert (=> b!486622 m!466783))

(assert (=> b!486622 m!466783))

(declare-fun m!466785 () Bool)

(assert (=> b!486622 m!466785))

(declare-fun m!466787 () Bool)

(assert (=> b!486627 m!466787))

(check-sat (not b!486626) (not b!486625) (not b!486622) (not start!44246) (not b!486623) (not b!486627) (not b!486628))
(check-sat)
