; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44640 () Bool)

(assert start!44640)

(declare-fun b!489732 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31699 0))(
  ( (array!31700 (arr!15237 (Array (_ BitVec 32) (_ BitVec 64))) (size!15601 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31699)

(declare-fun e!287991 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3704 0))(
  ( (MissingZero!3704 (index!16995 (_ BitVec 32))) (Found!3704 (index!16996 (_ BitVec 32))) (Intermediate!3704 (undefined!4516 Bool) (index!16997 (_ BitVec 32)) (x!46106 (_ BitVec 32))) (Undefined!3704) (MissingVacant!3704 (index!16998 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31699 (_ BitVec 32)) SeekEntryResult!3704)

(assert (=> b!489732 (= e!287991 (= (seekEntryOrOpen!0 (select (arr!15237 a!3235) j!176) a!3235 mask!3524) (Found!3704 j!176)))))

(declare-fun b!489733 () Bool)

(declare-fun res!292670 () Bool)

(declare-fun e!287993 () Bool)

(assert (=> b!489733 (=> (not res!292670) (not e!287993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489733 (= res!292670 (validKeyInArray!0 (select (arr!15237 a!3235) j!176)))))

(declare-fun b!489735 () Bool)

(declare-fun res!292673 () Bool)

(declare-fun e!287994 () Bool)

(assert (=> b!489735 (=> (not res!292673) (not e!287994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31699 (_ BitVec 32)) Bool)

(assert (=> b!489735 (= res!292673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489736 () Bool)

(declare-fun res!292675 () Bool)

(assert (=> b!489736 (=> (not res!292675) (not e!287994))))

(declare-datatypes ((List!9395 0))(
  ( (Nil!9392) (Cons!9391 (h!10253 (_ BitVec 64)) (t!15623 List!9395)) )
))
(declare-fun arrayNoDuplicates!0 (array!31699 (_ BitVec 32) List!9395) Bool)

(assert (=> b!489736 (= res!292675 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9392))))

(declare-fun b!489737 () Bool)

(declare-fun res!292674 () Bool)

(assert (=> b!489737 (=> (not res!292674) (not e!287993))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489737 (= res!292674 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489738 () Bool)

(declare-fun res!292676 () Bool)

(assert (=> b!489738 (=> (not res!292676) (not e!287993))))

(assert (=> b!489738 (= res!292676 (validKeyInArray!0 k!2280))))

(declare-fun res!292668 () Bool)

(assert (=> start!44640 (=> (not res!292668) (not e!287993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44640 (= res!292668 (validMask!0 mask!3524))))

(assert (=> start!44640 e!287993))

(assert (=> start!44640 true))

(declare-fun array_inv!11033 (array!31699) Bool)

(assert (=> start!44640 (array_inv!11033 a!3235)))

(declare-fun b!489734 () Bool)

(assert (=> b!489734 (= e!287993 e!287994)))

(declare-fun res!292669 () Bool)

(assert (=> b!489734 (=> (not res!292669) (not e!287994))))

(declare-fun lt!221021 () SeekEntryResult!3704)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489734 (= res!292669 (or (= lt!221021 (MissingZero!3704 i!1204)) (= lt!221021 (MissingVacant!3704 i!1204))))))

(assert (=> b!489734 (= lt!221021 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!489739 () Bool)

(declare-fun res!292672 () Bool)

(assert (=> b!489739 (=> (not res!292672) (not e!287993))))

(assert (=> b!489739 (= res!292672 (and (= (size!15601 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15601 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15601 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489740 () Bool)

(assert (=> b!489740 (= e!287994 (not true))))

(declare-fun lt!221022 () (_ BitVec 32))

(declare-fun lt!221025 () SeekEntryResult!3704)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31699 (_ BitVec 32)) SeekEntryResult!3704)

(assert (=> b!489740 (= lt!221025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221022 (select (store (arr!15237 a!3235) i!1204 k!2280) j!176) (array!31700 (store (arr!15237 a!3235) i!1204 k!2280) (size!15601 a!3235)) mask!3524))))

(declare-fun lt!221023 () (_ BitVec 32))

(declare-fun lt!221024 () SeekEntryResult!3704)

(assert (=> b!489740 (= lt!221024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221023 (select (arr!15237 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489740 (= lt!221022 (toIndex!0 (select (store (arr!15237 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489740 (= lt!221023 (toIndex!0 (select (arr!15237 a!3235) j!176) mask!3524))))

(assert (=> b!489740 e!287991))

(declare-fun res!292671 () Bool)

(assert (=> b!489740 (=> (not res!292671) (not e!287991))))

(assert (=> b!489740 (= res!292671 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14354 0))(
  ( (Unit!14355) )
))
(declare-fun lt!221026 () Unit!14354)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14354)

(assert (=> b!489740 (= lt!221026 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44640 res!292668) b!489739))

(assert (= (and b!489739 res!292672) b!489733))

(assert (= (and b!489733 res!292670) b!489738))

(assert (= (and b!489738 res!292676) b!489737))

(assert (= (and b!489737 res!292674) b!489734))

(assert (= (and b!489734 res!292669) b!489735))

(assert (= (and b!489735 res!292673) b!489736))

(assert (= (and b!489736 res!292675) b!489740))

(assert (= (and b!489740 res!292671) b!489732))

(declare-fun m!469605 () Bool)

(assert (=> b!489740 m!469605))

(declare-fun m!469607 () Bool)

(assert (=> b!489740 m!469607))

(declare-fun m!469609 () Bool)

(assert (=> b!489740 m!469609))

(declare-fun m!469611 () Bool)

(assert (=> b!489740 m!469611))

(declare-fun m!469613 () Bool)

(assert (=> b!489740 m!469613))

(assert (=> b!489740 m!469611))

(declare-fun m!469615 () Bool)

(assert (=> b!489740 m!469615))

(assert (=> b!489740 m!469609))

(declare-fun m!469617 () Bool)

(assert (=> b!489740 m!469617))

(assert (=> b!489740 m!469609))

(declare-fun m!469619 () Bool)

(assert (=> b!489740 m!469619))

(assert (=> b!489740 m!469611))

(declare-fun m!469621 () Bool)

(assert (=> b!489740 m!469621))

(declare-fun m!469623 () Bool)

(assert (=> b!489736 m!469623))

(declare-fun m!469625 () Bool)

(assert (=> b!489738 m!469625))

(assert (=> b!489733 m!469611))

(assert (=> b!489733 m!469611))

(declare-fun m!469627 () Bool)

(assert (=> b!489733 m!469627))

(declare-fun m!469629 () Bool)

(assert (=> b!489735 m!469629))

(declare-fun m!469631 () Bool)

(assert (=> b!489734 m!469631))

(assert (=> b!489732 m!469611))

(assert (=> b!489732 m!469611))

(declare-fun m!469633 () Bool)

(assert (=> b!489732 m!469633))

(declare-fun m!469635 () Bool)

(assert (=> start!44640 m!469635))

(declare-fun m!469637 () Bool)

(assert (=> start!44640 m!469637))

(declare-fun m!469639 () Bool)

(assert (=> b!489737 m!469639))

(push 1)

