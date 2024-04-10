; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31926 () Bool)

(assert start!31926)

(declare-fun b!319019 () Bool)

(declare-fun res!173409 () Bool)

(declare-fun e!198185 () Bool)

(assert (=> b!319019 (=> (not res!173409) (not e!198185))))

(declare-datatypes ((array!16246 0))(
  ( (array!16247 (arr!7687 (Array (_ BitVec 32) (_ BitVec 64))) (size!8039 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16246)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2827 0))(
  ( (MissingZero!2827 (index!13484 (_ BitVec 32))) (Found!2827 (index!13485 (_ BitVec 32))) (Intermediate!2827 (undefined!3639 Bool) (index!13486 (_ BitVec 32)) (x!31741 (_ BitVec 32))) (Undefined!2827) (MissingVacant!2827 (index!13487 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16246 (_ BitVec 32)) SeekEntryResult!2827)

(assert (=> b!319019 (= res!173409 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2827 i!1240)))))

(declare-fun b!319020 () Bool)

(declare-fun e!198187 () Bool)

(assert (=> b!319020 (= e!198185 e!198187)))

(declare-fun res!173403 () Bool)

(assert (=> b!319020 (=> (not res!173403) (not e!198187))))

(declare-fun lt!155597 () SeekEntryResult!2827)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16246 (_ BitVec 32)) SeekEntryResult!2827)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319020 (= res!173403 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155597))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!319020 (= lt!155597 (Intermediate!2827 false resIndex!52 resX!52))))

(declare-fun b!319021 () Bool)

(declare-fun e!198183 () Bool)

(assert (=> b!319021 (= e!198187 e!198183)))

(declare-fun res!173404 () Bool)

(assert (=> b!319021 (=> (not res!173404) (not e!198183))))

(declare-fun lt!155596 () SeekEntryResult!2827)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!319021 (= res!173404 (and (= lt!155596 lt!155597) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7687 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!319021 (= lt!155596 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!319022 () Bool)

(declare-fun res!173411 () Bool)

(assert (=> b!319022 (=> (not res!173411) (not e!198185))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319022 (= res!173411 (validKeyInArray!0 k!2441))))

(declare-fun b!319023 () Bool)

(declare-fun res!173406 () Bool)

(assert (=> b!319023 (=> (not res!173406) (not e!198185))))

(assert (=> b!319023 (= res!173406 (and (= (size!8039 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8039 a!3293))))))

(declare-fun b!319024 () Bool)

(declare-fun res!173410 () Bool)

(assert (=> b!319024 (=> (not res!173410) (not e!198185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16246 (_ BitVec 32)) Bool)

(assert (=> b!319024 (= res!173410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun lt!155598 () (_ BitVec 32))

(declare-fun b!319025 () Bool)

(declare-fun lt!155595 () SeekEntryResult!2827)

(assert (=> b!319025 (= e!198183 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155598 #b00000000000000000000000000000000) (bvsge lt!155598 (size!8039 a!3293)) (= lt!155595 lt!155597))))))

(declare-fun e!198184 () Bool)

(assert (=> b!319025 e!198184))

(declare-fun res!173408 () Bool)

(assert (=> b!319025 (=> (not res!173408) (not e!198184))))

(assert (=> b!319025 (= res!173408 (= lt!155596 lt!155595))))

(assert (=> b!319025 (= lt!155595 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155598 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319025 (= lt!155598 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!173405 () Bool)

(assert (=> start!31926 (=> (not res!173405) (not e!198185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31926 (= res!173405 (validMask!0 mask!3709))))

(assert (=> start!31926 e!198185))

(declare-fun array_inv!5650 (array!16246) Bool)

(assert (=> start!31926 (array_inv!5650 a!3293)))

(assert (=> start!31926 true))

(declare-fun b!319026 () Bool)

(declare-fun lt!155594 () array!16246)

(assert (=> b!319026 (= e!198184 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155594 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155598 k!2441 lt!155594 mask!3709)))))

(assert (=> b!319026 (= lt!155594 (array!16247 (store (arr!7687 a!3293) i!1240 k!2441) (size!8039 a!3293)))))

(declare-fun b!319027 () Bool)

(declare-fun res!173407 () Bool)

(assert (=> b!319027 (=> (not res!173407) (not e!198185))))

(declare-fun arrayContainsKey!0 (array!16246 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319027 (= res!173407 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!319028 () Bool)

(declare-fun res!173412 () Bool)

(assert (=> b!319028 (=> (not res!173412) (not e!198187))))

(assert (=> b!319028 (= res!173412 (and (= (select (arr!7687 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8039 a!3293))))))

(assert (= (and start!31926 res!173405) b!319023))

(assert (= (and b!319023 res!173406) b!319022))

(assert (= (and b!319022 res!173411) b!319027))

(assert (= (and b!319027 res!173407) b!319019))

(assert (= (and b!319019 res!173409) b!319024))

(assert (= (and b!319024 res!173410) b!319020))

(assert (= (and b!319020 res!173403) b!319028))

(assert (= (and b!319028 res!173412) b!319021))

(assert (= (and b!319021 res!173404) b!319025))

(assert (= (and b!319025 res!173408) b!319026))

(declare-fun m!327615 () Bool)

(assert (=> b!319024 m!327615))

(declare-fun m!327617 () Bool)

(assert (=> start!31926 m!327617))

(declare-fun m!327619 () Bool)

(assert (=> start!31926 m!327619))

(declare-fun m!327621 () Bool)

(assert (=> b!319025 m!327621))

(declare-fun m!327623 () Bool)

(assert (=> b!319025 m!327623))

(declare-fun m!327625 () Bool)

(assert (=> b!319021 m!327625))

(declare-fun m!327627 () Bool)

(assert (=> b!319021 m!327627))

(declare-fun m!327629 () Bool)

(assert (=> b!319022 m!327629))

(declare-fun m!327631 () Bool)

(assert (=> b!319019 m!327631))

(declare-fun m!327633 () Bool)

(assert (=> b!319027 m!327633))

(declare-fun m!327635 () Bool)

(assert (=> b!319028 m!327635))

(declare-fun m!327637 () Bool)

(assert (=> b!319020 m!327637))

(assert (=> b!319020 m!327637))

(declare-fun m!327639 () Bool)

(assert (=> b!319020 m!327639))

(declare-fun m!327641 () Bool)

(assert (=> b!319026 m!327641))

(declare-fun m!327643 () Bool)

(assert (=> b!319026 m!327643))

(declare-fun m!327645 () Bool)

(assert (=> b!319026 m!327645))

(push 1)

