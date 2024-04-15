; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63676 () Bool)

(assert start!63676)

(declare-fun b!716685 () Bool)

(declare-fun res!479614 () Bool)

(declare-fun e!402421 () Bool)

(assert (=> b!716685 (=> (not res!479614) (not e!402421))))

(declare-datatypes ((array!40582 0))(
  ( (array!40583 (arr!19424 (Array (_ BitVec 32) (_ BitVec 64))) (size!19845 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40582)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7021 0))(
  ( (MissingZero!7021 (index!30452 (_ BitVec 32))) (Found!7021 (index!30453 (_ BitVec 32))) (Intermediate!7021 (undefined!7833 Bool) (index!30454 (_ BitVec 32)) (x!61492 (_ BitVec 32))) (Undefined!7021) (MissingVacant!7021 (index!30455 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40582 (_ BitVec 32)) SeekEntryResult!7021)

(assert (=> b!716685 (= res!479614 (not (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) (MissingZero!7021 i!1173))))))

(declare-fun b!716686 () Bool)

(declare-fun res!479612 () Bool)

(assert (=> b!716686 (=> (not res!479612) (not e!402421))))

(declare-fun arrayContainsKey!0 (array!40582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716686 (= res!479612 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!716687 () Bool)

(declare-fun res!479613 () Bool)

(assert (=> b!716687 (=> (not res!479613) (not e!402421))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716687 (= res!479613 (validKeyInArray!0 k0!2102))))

(declare-fun b!716688 () Bool)

(declare-fun res!479616 () Bool)

(assert (=> b!716688 (=> (not res!479616) (not e!402421))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!716688 (= res!479616 (validKeyInArray!0 (select (arr!19424 a!3186) j!159)))))

(declare-fun b!716689 () Bool)

(declare-fun res!479615 () Bool)

(assert (=> b!716689 (=> (not res!479615) (not e!402421))))

(assert (=> b!716689 (= res!479615 (and (= (size!19845 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19845 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19845 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!479611 () Bool)

(assert (=> start!63676 (=> (not res!479611) (not e!402421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63676 (= res!479611 (validMask!0 mask!3328))))

(assert (=> start!63676 e!402421))

(declare-fun array_inv!15307 (array!40582) Bool)

(assert (=> start!63676 (array_inv!15307 a!3186)))

(assert (=> start!63676 true))

(declare-fun b!716690 () Bool)

(assert (=> b!716690 (= e!402421 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (= (and start!63676 res!479611) b!716689))

(assert (= (and b!716689 res!479615) b!716688))

(assert (= (and b!716688 res!479616) b!716687))

(assert (= (and b!716687 res!479613) b!716686))

(assert (= (and b!716686 res!479612) b!716685))

(assert (= (and b!716685 res!479614) b!716690))

(declare-fun m!672201 () Bool)

(assert (=> b!716686 m!672201))

(declare-fun m!672203 () Bool)

(assert (=> b!716685 m!672203))

(declare-fun m!672205 () Bool)

(assert (=> start!63676 m!672205))

(declare-fun m!672207 () Bool)

(assert (=> start!63676 m!672207))

(declare-fun m!672209 () Bool)

(assert (=> b!716688 m!672209))

(assert (=> b!716688 m!672209))

(declare-fun m!672211 () Bool)

(assert (=> b!716688 m!672211))

(declare-fun m!672213 () Bool)

(assert (=> b!716687 m!672213))

(check-sat (not b!716685) (not b!716686) (not b!716688) (not start!63676) (not b!716687))
(check-sat)
