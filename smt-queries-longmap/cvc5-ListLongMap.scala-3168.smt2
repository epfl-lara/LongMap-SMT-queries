; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44634 () Bool)

(assert start!44634)

(declare-fun b!489651 () Bool)

(declare-fun res!292592 () Bool)

(declare-fun e!287955 () Bool)

(assert (=> b!489651 (=> (not res!292592) (not e!287955))))

(declare-datatypes ((array!31693 0))(
  ( (array!31694 (arr!15234 (Array (_ BitVec 32) (_ BitVec 64))) (size!15598 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31693)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489651 (= res!292592 (validKeyInArray!0 (select (arr!15234 a!3235) j!176)))))

(declare-fun b!489652 () Bool)

(declare-fun e!287956 () Bool)

(assert (=> b!489652 (= e!287955 e!287956)))

(declare-fun res!292587 () Bool)

(assert (=> b!489652 (=> (not res!292587) (not e!287956))))

(declare-datatypes ((SeekEntryResult!3701 0))(
  ( (MissingZero!3701 (index!16983 (_ BitVec 32))) (Found!3701 (index!16984 (_ BitVec 32))) (Intermediate!3701 (undefined!4513 Bool) (index!16985 (_ BitVec 32)) (x!46095 (_ BitVec 32))) (Undefined!3701) (MissingVacant!3701 (index!16986 (_ BitVec 32))) )
))
(declare-fun lt!220972 () SeekEntryResult!3701)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!489652 (= res!292587 (or (= lt!220972 (MissingZero!3701 i!1204)) (= lt!220972 (MissingVacant!3701 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31693 (_ BitVec 32)) SeekEntryResult!3701)

(assert (=> b!489652 (= lt!220972 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!489653 () Bool)

(declare-fun res!292591 () Bool)

(assert (=> b!489653 (=> (not res!292591) (not e!287955))))

(assert (=> b!489653 (= res!292591 (validKeyInArray!0 k!2280))))

(declare-fun b!489654 () Bool)

(declare-fun res!292595 () Bool)

(assert (=> b!489654 (=> (not res!292595) (not e!287956))))

(declare-datatypes ((List!9392 0))(
  ( (Nil!9389) (Cons!9388 (h!10250 (_ BitVec 64)) (t!15620 List!9392)) )
))
(declare-fun arrayNoDuplicates!0 (array!31693 (_ BitVec 32) List!9392) Bool)

(assert (=> b!489654 (= res!292595 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9389))))

(declare-fun b!489655 () Bool)

(declare-fun res!292590 () Bool)

(assert (=> b!489655 (=> (not res!292590) (not e!287955))))

(assert (=> b!489655 (= res!292590 (and (= (size!15598 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15598 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15598 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489656 () Bool)

(assert (=> b!489656 (= e!287956 (not true))))

(declare-fun lt!220971 () (_ BitVec 32))

(declare-fun lt!220969 () SeekEntryResult!3701)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31693 (_ BitVec 32)) SeekEntryResult!3701)

(assert (=> b!489656 (= lt!220969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220971 (select (store (arr!15234 a!3235) i!1204 k!2280) j!176) (array!31694 (store (arr!15234 a!3235) i!1204 k!2280) (size!15598 a!3235)) mask!3524))))

(declare-fun lt!220967 () (_ BitVec 32))

(declare-fun lt!220970 () SeekEntryResult!3701)

(assert (=> b!489656 (= lt!220970 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220967 (select (arr!15234 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489656 (= lt!220971 (toIndex!0 (select (store (arr!15234 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!489656 (= lt!220967 (toIndex!0 (select (arr!15234 a!3235) j!176) mask!3524))))

(declare-fun e!287958 () Bool)

(assert (=> b!489656 e!287958))

(declare-fun res!292593 () Bool)

(assert (=> b!489656 (=> (not res!292593) (not e!287958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31693 (_ BitVec 32)) Bool)

(assert (=> b!489656 (= res!292593 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14348 0))(
  ( (Unit!14349) )
))
(declare-fun lt!220968 () Unit!14348)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31693 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14348)

(assert (=> b!489656 (= lt!220968 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489657 () Bool)

(declare-fun res!292589 () Bool)

(assert (=> b!489657 (=> (not res!292589) (not e!287956))))

(assert (=> b!489657 (= res!292589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489658 () Bool)

(declare-fun res!292588 () Bool)

(assert (=> b!489658 (=> (not res!292588) (not e!287955))))

(declare-fun arrayContainsKey!0 (array!31693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489658 (= res!292588 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!292594 () Bool)

(assert (=> start!44634 (=> (not res!292594) (not e!287955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44634 (= res!292594 (validMask!0 mask!3524))))

(assert (=> start!44634 e!287955))

(assert (=> start!44634 true))

(declare-fun array_inv!11030 (array!31693) Bool)

(assert (=> start!44634 (array_inv!11030 a!3235)))

(declare-fun b!489659 () Bool)

(assert (=> b!489659 (= e!287958 (= (seekEntryOrOpen!0 (select (arr!15234 a!3235) j!176) a!3235 mask!3524) (Found!3701 j!176)))))

(assert (= (and start!44634 res!292594) b!489655))

(assert (= (and b!489655 res!292590) b!489651))

(assert (= (and b!489651 res!292592) b!489653))

(assert (= (and b!489653 res!292591) b!489658))

(assert (= (and b!489658 res!292588) b!489652))

(assert (= (and b!489652 res!292587) b!489657))

(assert (= (and b!489657 res!292589) b!489654))

(assert (= (and b!489654 res!292595) b!489656))

(assert (= (and b!489656 res!292593) b!489659))

(declare-fun m!469497 () Bool)

(assert (=> b!489654 m!469497))

(declare-fun m!469499 () Bool)

(assert (=> b!489651 m!469499))

(assert (=> b!489651 m!469499))

(declare-fun m!469501 () Bool)

(assert (=> b!489651 m!469501))

(declare-fun m!469503 () Bool)

(assert (=> b!489658 m!469503))

(declare-fun m!469505 () Bool)

(assert (=> b!489656 m!469505))

(declare-fun m!469507 () Bool)

(assert (=> b!489656 m!469507))

(assert (=> b!489656 m!469499))

(declare-fun m!469509 () Bool)

(assert (=> b!489656 m!469509))

(assert (=> b!489656 m!469499))

(declare-fun m!469511 () Bool)

(assert (=> b!489656 m!469511))

(assert (=> b!489656 m!469499))

(declare-fun m!469513 () Bool)

(assert (=> b!489656 m!469513))

(assert (=> b!489656 m!469507))

(declare-fun m!469515 () Bool)

(assert (=> b!489656 m!469515))

(assert (=> b!489656 m!469507))

(declare-fun m!469517 () Bool)

(assert (=> b!489656 m!469517))

(declare-fun m!469519 () Bool)

(assert (=> b!489656 m!469519))

(assert (=> b!489659 m!469499))

(assert (=> b!489659 m!469499))

(declare-fun m!469521 () Bool)

(assert (=> b!489659 m!469521))

(declare-fun m!469523 () Bool)

(assert (=> b!489652 m!469523))

(declare-fun m!469525 () Bool)

(assert (=> b!489653 m!469525))

(declare-fun m!469527 () Bool)

(assert (=> b!489657 m!469527))

(declare-fun m!469529 () Bool)

(assert (=> start!44634 m!469529))

(declare-fun m!469531 () Bool)

(assert (=> start!44634 m!469531))

(push 1)

(assert (not b!489651))

(assert (not b!489659))

(assert (not b!489658))

(assert (not start!44634))

(assert (not b!489653))

(assert (not b!489654))

(assert (not b!489652))

(assert (not b!489657))

(assert (not b!489656))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

