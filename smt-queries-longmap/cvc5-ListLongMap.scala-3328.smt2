; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45960 () Bool)

(assert start!45960)

(declare-fun b!508758 () Bool)

(declare-fun res!309610 () Bool)

(declare-fun e!297621 () Bool)

(assert (=> b!508758 (=> (not res!309610) (not e!297621))))

(declare-datatypes ((array!32671 0))(
  ( (array!32672 (arr!15714 (Array (_ BitVec 32) (_ BitVec 64))) (size!16078 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32671)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32671 (_ BitVec 32)) Bool)

(assert (=> b!508758 (= res!309610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508759 () Bool)

(declare-fun res!309608 () Bool)

(assert (=> b!508759 (=> (not res!309608) (not e!297621))))

(declare-datatypes ((List!9872 0))(
  ( (Nil!9869) (Cons!9868 (h!10745 (_ BitVec 64)) (t!16100 List!9872)) )
))
(declare-fun arrayNoDuplicates!0 (array!32671 (_ BitVec 32) List!9872) Bool)

(assert (=> b!508759 (= res!309608 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9869))))

(declare-fun res!309606 () Bool)

(declare-fun e!297618 () Bool)

(assert (=> start!45960 (=> (not res!309606) (not e!297618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45960 (= res!309606 (validMask!0 mask!3524))))

(assert (=> start!45960 e!297618))

(assert (=> start!45960 true))

(declare-fun array_inv!11510 (array!32671) Bool)

(assert (=> start!45960 (array_inv!11510 a!3235)))

(declare-fun b!508760 () Bool)

(declare-fun res!309604 () Bool)

(assert (=> b!508760 (=> (not res!309604) (not e!297618))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508760 (= res!309604 (validKeyInArray!0 (select (arr!15714 a!3235) j!176)))))

(declare-fun b!508761 () Bool)

(declare-fun res!309611 () Bool)

(assert (=> b!508761 (=> (not res!309611) (not e!297618))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508761 (= res!309611 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508762 () Bool)

(assert (=> b!508762 (= e!297618 e!297621)))

(declare-fun res!309603 () Bool)

(assert (=> b!508762 (=> (not res!309603) (not e!297621))))

(declare-datatypes ((SeekEntryResult!4181 0))(
  ( (MissingZero!4181 (index!18912 (_ BitVec 32))) (Found!4181 (index!18913 (_ BitVec 32))) (Intermediate!4181 (undefined!4993 Bool) (index!18914 (_ BitVec 32)) (x!47894 (_ BitVec 32))) (Undefined!4181) (MissingVacant!4181 (index!18915 (_ BitVec 32))) )
))
(declare-fun lt!232346 () SeekEntryResult!4181)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508762 (= res!309603 (or (= lt!232346 (MissingZero!4181 i!1204)) (= lt!232346 (MissingVacant!4181 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32671 (_ BitVec 32)) SeekEntryResult!4181)

(assert (=> b!508762 (= lt!232346 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun e!297619 () Bool)

(declare-fun b!508763 () Bool)

(assert (=> b!508763 (= e!297619 (= (seekEntryOrOpen!0 (select (arr!15714 a!3235) j!176) a!3235 mask!3524) (Found!4181 j!176)))))

(declare-fun b!508764 () Bool)

(declare-fun res!309607 () Bool)

(assert (=> b!508764 (=> (not res!309607) (not e!297618))))

(assert (=> b!508764 (= res!309607 (and (= (size!16078 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16078 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16078 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508765 () Bool)

(assert (=> b!508765 (= e!297621 (not true))))

(declare-fun lt!232347 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!508765 (= lt!232347 (toIndex!0 (select (arr!15714 a!3235) j!176) mask!3524))))

(assert (=> b!508765 e!297619))

(declare-fun res!309609 () Bool)

(assert (=> b!508765 (=> (not res!309609) (not e!297619))))

(assert (=> b!508765 (= res!309609 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15620 0))(
  ( (Unit!15621) )
))
(declare-fun lt!232348 () Unit!15620)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32671 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15620)

(assert (=> b!508765 (= lt!232348 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508766 () Bool)

(declare-fun res!309605 () Bool)

(assert (=> b!508766 (=> (not res!309605) (not e!297618))))

(assert (=> b!508766 (= res!309605 (validKeyInArray!0 k!2280))))

(assert (= (and start!45960 res!309606) b!508764))

(assert (= (and b!508764 res!309607) b!508760))

(assert (= (and b!508760 res!309604) b!508766))

(assert (= (and b!508766 res!309605) b!508761))

(assert (= (and b!508761 res!309611) b!508762))

(assert (= (and b!508762 res!309603) b!508758))

(assert (= (and b!508758 res!309610) b!508759))

(assert (= (and b!508759 res!309608) b!508765))

(assert (= (and b!508765 res!309609) b!508763))

(declare-fun m!489501 () Bool)

(assert (=> b!508758 m!489501))

(declare-fun m!489503 () Bool)

(assert (=> b!508761 m!489503))

(declare-fun m!489505 () Bool)

(assert (=> b!508762 m!489505))

(declare-fun m!489507 () Bool)

(assert (=> start!45960 m!489507))

(declare-fun m!489509 () Bool)

(assert (=> start!45960 m!489509))

(declare-fun m!489511 () Bool)

(assert (=> b!508766 m!489511))

(declare-fun m!489513 () Bool)

(assert (=> b!508763 m!489513))

(assert (=> b!508763 m!489513))

(declare-fun m!489515 () Bool)

(assert (=> b!508763 m!489515))

(declare-fun m!489517 () Bool)

(assert (=> b!508759 m!489517))

(assert (=> b!508765 m!489513))

(assert (=> b!508765 m!489513))

(declare-fun m!489519 () Bool)

(assert (=> b!508765 m!489519))

(declare-fun m!489521 () Bool)

(assert (=> b!508765 m!489521))

(declare-fun m!489523 () Bool)

(assert (=> b!508765 m!489523))

(assert (=> b!508760 m!489513))

(assert (=> b!508760 m!489513))

(declare-fun m!489525 () Bool)

(assert (=> b!508760 m!489525))

(push 1)

