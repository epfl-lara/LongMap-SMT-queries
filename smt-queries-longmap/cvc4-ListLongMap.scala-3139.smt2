; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44260 () Bool)

(assert start!44260)

(declare-fun b!486725 () Bool)

(declare-fun e!286495 () Bool)

(declare-fun e!286497 () Bool)

(assert (=> b!486725 (= e!286495 e!286497)))

(declare-fun res!290114 () Bool)

(assert (=> b!486725 (=> (not res!290114) (not e!286497))))

(declare-datatypes ((SeekEntryResult!3616 0))(
  ( (MissingZero!3616 (index!16643 (_ BitVec 32))) (Found!3616 (index!16644 (_ BitVec 32))) (Intermediate!3616 (undefined!4428 Bool) (index!16645 (_ BitVec 32)) (x!45772 (_ BitVec 32))) (Undefined!3616) (MissingVacant!3616 (index!16646 (_ BitVec 32))) )
))
(declare-fun lt!219837 () SeekEntryResult!3616)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486725 (= res!290114 (or (= lt!219837 (MissingZero!3616 i!1204)) (= lt!219837 (MissingVacant!3616 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31511 0))(
  ( (array!31512 (arr!15149 (Array (_ BitVec 32) (_ BitVec 64))) (size!15513 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31511)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31511 (_ BitVec 32)) SeekEntryResult!3616)

(assert (=> b!486725 (= lt!219837 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!486726 () Bool)

(declare-fun res!290111 () Bool)

(assert (=> b!486726 (=> (not res!290111) (not e!286497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31511 (_ BitVec 32)) Bool)

(assert (=> b!486726 (= res!290111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!290116 () Bool)

(assert (=> start!44260 (=> (not res!290116) (not e!286495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44260 (= res!290116 (validMask!0 mask!3524))))

(assert (=> start!44260 e!286495))

(assert (=> start!44260 true))

(declare-fun array_inv!10945 (array!31511) Bool)

(assert (=> start!44260 (array_inv!10945 a!3235)))

(declare-fun b!486727 () Bool)

(declare-fun res!290112 () Bool)

(assert (=> b!486727 (=> (not res!290112) (not e!286495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486727 (= res!290112 (validKeyInArray!0 k!2280))))

(declare-fun b!486728 () Bool)

(declare-fun res!290113 () Bool)

(assert (=> b!486728 (=> (not res!290113) (not e!286495))))

(declare-fun arrayContainsKey!0 (array!31511 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486728 (= res!290113 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486729 () Bool)

(declare-fun res!290115 () Bool)

(assert (=> b!486729 (=> (not res!290115) (not e!286495))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486729 (= res!290115 (validKeyInArray!0 (select (arr!15149 a!3235) j!176)))))

(declare-fun b!486730 () Bool)

(declare-fun res!290117 () Bool)

(assert (=> b!486730 (=> (not res!290117) (not e!286495))))

(assert (=> b!486730 (= res!290117 (and (= (size!15513 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15513 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15513 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486731 () Bool)

(assert (=> b!486731 (= e!286497 false)))

(declare-fun lt!219838 () Bool)

(declare-datatypes ((List!9307 0))(
  ( (Nil!9304) (Cons!9303 (h!10159 (_ BitVec 64)) (t!15535 List!9307)) )
))
(declare-fun arrayNoDuplicates!0 (array!31511 (_ BitVec 32) List!9307) Bool)

(assert (=> b!486731 (= lt!219838 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9304))))

(assert (= (and start!44260 res!290116) b!486730))

(assert (= (and b!486730 res!290117) b!486729))

(assert (= (and b!486729 res!290115) b!486727))

(assert (= (and b!486727 res!290112) b!486728))

(assert (= (and b!486728 res!290113) b!486725))

(assert (= (and b!486725 res!290114) b!486726))

(assert (= (and b!486726 res!290111) b!486731))

(declare-fun m!466623 () Bool)

(assert (=> b!486731 m!466623))

(declare-fun m!466625 () Bool)

(assert (=> b!486729 m!466625))

(assert (=> b!486729 m!466625))

(declare-fun m!466627 () Bool)

(assert (=> b!486729 m!466627))

(declare-fun m!466629 () Bool)

(assert (=> start!44260 m!466629))

(declare-fun m!466631 () Bool)

(assert (=> start!44260 m!466631))

(declare-fun m!466633 () Bool)

(assert (=> b!486727 m!466633))

(declare-fun m!466635 () Bool)

(assert (=> b!486726 m!466635))

(declare-fun m!466637 () Bool)

(assert (=> b!486728 m!466637))

(declare-fun m!466639 () Bool)

(assert (=> b!486725 m!466639))

(push 1)

