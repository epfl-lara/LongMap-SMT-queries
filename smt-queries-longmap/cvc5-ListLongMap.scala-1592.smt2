; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30224 () Bool)

(assert start!30224)

(declare-fun b!302382 () Bool)

(declare-fun res!159868 () Bool)

(declare-fun e!190647 () Bool)

(assert (=> b!302382 (=> (not res!159868) (not e!190647))))

(declare-datatypes ((array!15330 0))(
  ( (array!15331 (arr!7253 (Array (_ BitVec 32) (_ BitVec 64))) (size!7605 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15330)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15330 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302382 (= res!159868 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302383 () Bool)

(declare-fun res!159871 () Bool)

(assert (=> b!302383 (=> (not res!159871) (not e!190647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302383 (= res!159871 (validKeyInArray!0 k!2441))))

(declare-fun b!302384 () Bool)

(declare-fun res!159873 () Bool)

(assert (=> b!302384 (=> (not res!159873) (not e!190647))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302384 (= res!159873 (and (= (size!7605 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7605 a!3293))))))

(declare-fun b!302385 () Bool)

(declare-fun res!159870 () Bool)

(assert (=> b!302385 (=> (not res!159870) (not e!190647))))

(declare-datatypes ((SeekEntryResult!2393 0))(
  ( (MissingZero!2393 (index!11748 (_ BitVec 32))) (Found!2393 (index!11749 (_ BitVec 32))) (Intermediate!2393 (undefined!3205 Bool) (index!11750 (_ BitVec 32)) (x!30026 (_ BitVec 32))) (Undefined!2393) (MissingVacant!2393 (index!11751 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15330 (_ BitVec 32)) SeekEntryResult!2393)

(assert (=> b!302385 (= res!159870 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2393 i!1240)))))

(declare-fun b!302386 () Bool)

(assert (=> b!302386 (= e!190647 false)))

(declare-fun lt!150081 () SeekEntryResult!2393)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15330 (_ BitVec 32)) SeekEntryResult!2393)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302386 (= lt!150081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun res!159872 () Bool)

(assert (=> start!30224 (=> (not res!159872) (not e!190647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30224 (= res!159872 (validMask!0 mask!3709))))

(assert (=> start!30224 e!190647))

(assert (=> start!30224 true))

(declare-fun array_inv!5216 (array!15330) Bool)

(assert (=> start!30224 (array_inv!5216 a!3293)))

(declare-fun b!302387 () Bool)

(declare-fun res!159869 () Bool)

(assert (=> b!302387 (=> (not res!159869) (not e!190647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15330 (_ BitVec 32)) Bool)

(assert (=> b!302387 (= res!159869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30224 res!159872) b!302384))

(assert (= (and b!302384 res!159873) b!302383))

(assert (= (and b!302383 res!159871) b!302382))

(assert (= (and b!302382 res!159868) b!302385))

(assert (= (and b!302385 res!159870) b!302387))

(assert (= (and b!302387 res!159869) b!302386))

(declare-fun m!313919 () Bool)

(assert (=> b!302385 m!313919))

(declare-fun m!313921 () Bool)

(assert (=> b!302382 m!313921))

(declare-fun m!313923 () Bool)

(assert (=> b!302386 m!313923))

(assert (=> b!302386 m!313923))

(declare-fun m!313925 () Bool)

(assert (=> b!302386 m!313925))

(declare-fun m!313927 () Bool)

(assert (=> start!30224 m!313927))

(declare-fun m!313929 () Bool)

(assert (=> start!30224 m!313929))

(declare-fun m!313931 () Bool)

(assert (=> b!302383 m!313931))

(declare-fun m!313933 () Bool)

(assert (=> b!302387 m!313933))

(push 1)

(assert (not b!302382))

(assert (not b!302383))

(assert (not start!30224))

(assert (not b!302387))

(assert (not b!302386))

(assert (not b!302385))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

