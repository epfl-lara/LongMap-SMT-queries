; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31004 () Bool)

(assert start!31004)

(declare-fun b!311597 () Bool)

(declare-fun e!194400 () Bool)

(declare-fun e!194399 () Bool)

(assert (=> b!311597 (= e!194400 e!194399)))

(declare-fun res!168059 () Bool)

(assert (=> b!311597 (=> (not res!168059) (not e!194399))))

(declare-datatypes ((array!15906 0))(
  ( (array!15907 (arr!7535 (Array (_ BitVec 32) (_ BitVec 64))) (size!7887 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15906)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2675 0))(
  ( (MissingZero!2675 (index!12876 (_ BitVec 32))) (Found!2675 (index!12877 (_ BitVec 32))) (Intermediate!2675 (undefined!3487 Bool) (index!12878 (_ BitVec 32)) (x!31096 (_ BitVec 32))) (Undefined!2675) (MissingVacant!2675 (index!12879 (_ BitVec 32))) )
))
(declare-fun lt!152418 () SeekEntryResult!2675)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15906 (_ BitVec 32)) SeekEntryResult!2675)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311597 (= res!168059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152418))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311597 (= lt!152418 (Intermediate!2675 false resIndex!52 resX!52))))

(declare-fun b!311598 () Bool)

(declare-fun res!168052 () Bool)

(assert (=> b!311598 (=> (not res!168052) (not e!194400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15906 (_ BitVec 32)) Bool)

(assert (=> b!311598 (= res!168052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun e!194401 () Bool)

(declare-fun lt!152419 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun b!311599 () Bool)

(declare-fun lt!152420 () array!15906)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311599 (= e!194401 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152420 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152419 k!2441 lt!152420 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311599 (= lt!152420 (array!15907 (store (arr!7535 a!3293) i!1240 k!2441) (size!7887 a!3293)))))

(declare-fun b!311600 () Bool)

(declare-fun e!194397 () Bool)

(assert (=> b!311600 (= e!194397 (not true))))

(assert (=> b!311600 e!194401))

(declare-fun res!168056 () Bool)

(assert (=> b!311600 (=> (not res!168056) (not e!194401))))

(declare-fun lt!152421 () SeekEntryResult!2675)

(assert (=> b!311600 (= res!168056 (= lt!152421 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152419 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311600 (= lt!152419 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311601 () Bool)

(declare-fun res!168058 () Bool)

(assert (=> b!311601 (=> (not res!168058) (not e!194400))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15906 (_ BitVec 32)) SeekEntryResult!2675)

(assert (=> b!311601 (= res!168058 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2675 i!1240)))))

(declare-fun res!168053 () Bool)

(assert (=> start!31004 (=> (not res!168053) (not e!194400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31004 (= res!168053 (validMask!0 mask!3709))))

(assert (=> start!31004 e!194400))

(declare-fun array_inv!5498 (array!15906) Bool)

(assert (=> start!31004 (array_inv!5498 a!3293)))

(assert (=> start!31004 true))

(declare-fun b!311602 () Bool)

(declare-fun res!168060 () Bool)

(assert (=> b!311602 (=> (not res!168060) (not e!194399))))

(assert (=> b!311602 (= res!168060 (and (= (select (arr!7535 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7887 a!3293))))))

(declare-fun b!311603 () Bool)

(declare-fun res!168057 () Bool)

(assert (=> b!311603 (=> (not res!168057) (not e!194400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311603 (= res!168057 (validKeyInArray!0 k!2441))))

(declare-fun b!311604 () Bool)

(assert (=> b!311604 (= e!194399 e!194397)))

(declare-fun res!168054 () Bool)

(assert (=> b!311604 (=> (not res!168054) (not e!194397))))

(assert (=> b!311604 (= res!168054 (and (= lt!152421 lt!152418) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7535 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311604 (= lt!152421 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311605 () Bool)

(declare-fun res!168055 () Bool)

(assert (=> b!311605 (=> (not res!168055) (not e!194400))))

(assert (=> b!311605 (= res!168055 (and (= (size!7887 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7887 a!3293))))))

(declare-fun b!311606 () Bool)

(declare-fun res!168051 () Bool)

(assert (=> b!311606 (=> (not res!168051) (not e!194400))))

(declare-fun arrayContainsKey!0 (array!15906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311606 (= res!168051 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31004 res!168053) b!311605))

(assert (= (and b!311605 res!168055) b!311603))

(assert (= (and b!311603 res!168057) b!311606))

(assert (= (and b!311606 res!168051) b!311601))

(assert (= (and b!311601 res!168058) b!311598))

(assert (= (and b!311598 res!168052) b!311597))

(assert (= (and b!311597 res!168059) b!311602))

(assert (= (and b!311602 res!168060) b!311604))

(assert (= (and b!311604 res!168054) b!311600))

(assert (= (and b!311600 res!168056) b!311599))

(declare-fun m!321581 () Bool)

(assert (=> b!311606 m!321581))

(declare-fun m!321583 () Bool)

(assert (=> start!31004 m!321583))

(declare-fun m!321585 () Bool)

(assert (=> start!31004 m!321585))

(declare-fun m!321587 () Bool)

(assert (=> b!311604 m!321587))

(declare-fun m!321589 () Bool)

(assert (=> b!311604 m!321589))

(declare-fun m!321591 () Bool)

(assert (=> b!311602 m!321591))

(declare-fun m!321593 () Bool)

(assert (=> b!311603 m!321593))

(declare-fun m!321595 () Bool)

(assert (=> b!311598 m!321595))

(declare-fun m!321597 () Bool)

(assert (=> b!311597 m!321597))

(assert (=> b!311597 m!321597))

(declare-fun m!321599 () Bool)

(assert (=> b!311597 m!321599))

(declare-fun m!321601 () Bool)

(assert (=> b!311599 m!321601))

(declare-fun m!321603 () Bool)

(assert (=> b!311599 m!321603))

(declare-fun m!321605 () Bool)

(assert (=> b!311599 m!321605))

(declare-fun m!321607 () Bool)

(assert (=> b!311600 m!321607))

(declare-fun m!321609 () Bool)

(assert (=> b!311600 m!321609))

(declare-fun m!321611 () Bool)

(assert (=> b!311601 m!321611))

(push 1)

