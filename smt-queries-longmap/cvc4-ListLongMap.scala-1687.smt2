; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31014 () Bool)

(assert start!31014)

(declare-datatypes ((array!15916 0))(
  ( (array!15917 (arr!7540 (Array (_ BitVec 32) (_ BitVec 64))) (size!7892 (_ BitVec 32))) )
))
(declare-fun lt!152481 () array!15916)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!152480 () (_ BitVec 32))

(declare-fun e!194474 () Bool)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun b!311747 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2680 0))(
  ( (MissingZero!2680 (index!12896 (_ BitVec 32))) (Found!2680 (index!12897 (_ BitVec 32))) (Intermediate!2680 (undefined!3492 Bool) (index!12898 (_ BitVec 32)) (x!31109 (_ BitVec 32))) (Undefined!2680) (MissingVacant!2680 (index!12899 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15916 (_ BitVec 32)) SeekEntryResult!2680)

(assert (=> b!311747 (= e!194474 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152481 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152480 k!2441 lt!152481 mask!3709)))))

(declare-fun a!3293 () array!15916)

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311747 (= lt!152481 (array!15917 (store (arr!7540 a!3293) i!1240 k!2441) (size!7892 a!3293)))))

(declare-fun b!311748 () Bool)

(declare-fun res!168207 () Bool)

(declare-fun e!194475 () Bool)

(assert (=> b!311748 (=> (not res!168207) (not e!194475))))

(declare-fun arrayContainsKey!0 (array!15916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311748 (= res!168207 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311749 () Bool)

(declare-fun e!194473 () Bool)

(assert (=> b!311749 (= e!194473 (not true))))

(assert (=> b!311749 e!194474))

(declare-fun res!168202 () Bool)

(assert (=> b!311749 (=> (not res!168202) (not e!194474))))

(declare-fun lt!152479 () SeekEntryResult!2680)

(assert (=> b!311749 (= res!168202 (= lt!152479 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152480 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311749 (= lt!152480 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311750 () Bool)

(declare-fun res!168206 () Bool)

(assert (=> b!311750 (=> (not res!168206) (not e!194475))))

(assert (=> b!311750 (= res!168206 (and (= (size!7892 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7892 a!3293))))))

(declare-fun res!168205 () Bool)

(assert (=> start!31014 (=> (not res!168205) (not e!194475))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31014 (= res!168205 (validMask!0 mask!3709))))

(assert (=> start!31014 e!194475))

(declare-fun array_inv!5503 (array!15916) Bool)

(assert (=> start!31014 (array_inv!5503 a!3293)))

(assert (=> start!31014 true))

(declare-fun b!311751 () Bool)

(declare-fun res!168210 () Bool)

(assert (=> b!311751 (=> (not res!168210) (not e!194475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15916 (_ BitVec 32)) Bool)

(assert (=> b!311751 (= res!168210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311752 () Bool)

(declare-fun res!168204 () Bool)

(declare-fun e!194476 () Bool)

(assert (=> b!311752 (=> (not res!168204) (not e!194476))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311752 (= res!168204 (and (= (select (arr!7540 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7892 a!3293))))))

(declare-fun b!311753 () Bool)

(assert (=> b!311753 (= e!194476 e!194473)))

(declare-fun res!168208 () Bool)

(assert (=> b!311753 (=> (not res!168208) (not e!194473))))

(declare-fun lt!152478 () SeekEntryResult!2680)

(assert (=> b!311753 (= res!168208 (and (= lt!152479 lt!152478) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7540 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311753 (= lt!152479 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311754 () Bool)

(declare-fun res!168203 () Bool)

(assert (=> b!311754 (=> (not res!168203) (not e!194475))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311754 (= res!168203 (validKeyInArray!0 k!2441))))

(declare-fun b!311755 () Bool)

(declare-fun res!168201 () Bool)

(assert (=> b!311755 (=> (not res!168201) (not e!194475))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15916 (_ BitVec 32)) SeekEntryResult!2680)

(assert (=> b!311755 (= res!168201 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2680 i!1240)))))

(declare-fun b!311756 () Bool)

(assert (=> b!311756 (= e!194475 e!194476)))

(declare-fun res!168209 () Bool)

(assert (=> b!311756 (=> (not res!168209) (not e!194476))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311756 (= res!168209 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152478))))

(assert (=> b!311756 (= lt!152478 (Intermediate!2680 false resIndex!52 resX!52))))

(assert (= (and start!31014 res!168205) b!311750))

(assert (= (and b!311750 res!168206) b!311754))

(assert (= (and b!311754 res!168203) b!311748))

(assert (= (and b!311748 res!168207) b!311755))

(assert (= (and b!311755 res!168201) b!311751))

(assert (= (and b!311751 res!168210) b!311756))

(assert (= (and b!311756 res!168209) b!311752))

(assert (= (and b!311752 res!168204) b!311753))

(assert (= (and b!311753 res!168208) b!311749))

(assert (= (and b!311749 res!168202) b!311747))

(declare-fun m!321741 () Bool)

(assert (=> b!311752 m!321741))

(declare-fun m!321743 () Bool)

(assert (=> b!311751 m!321743))

(declare-fun m!321745 () Bool)

(assert (=> b!311755 m!321745))

(declare-fun m!321747 () Bool)

(assert (=> start!31014 m!321747))

(declare-fun m!321749 () Bool)

(assert (=> start!31014 m!321749))

(declare-fun m!321751 () Bool)

(assert (=> b!311749 m!321751))

(declare-fun m!321753 () Bool)

(assert (=> b!311749 m!321753))

(declare-fun m!321755 () Bool)

(assert (=> b!311747 m!321755))

(declare-fun m!321757 () Bool)

(assert (=> b!311747 m!321757))

(declare-fun m!321759 () Bool)

(assert (=> b!311747 m!321759))

(declare-fun m!321761 () Bool)

(assert (=> b!311748 m!321761))

(declare-fun m!321763 () Bool)

(assert (=> b!311756 m!321763))

(assert (=> b!311756 m!321763))

(declare-fun m!321765 () Bool)

(assert (=> b!311756 m!321765))

(declare-fun m!321767 () Bool)

(assert (=> b!311754 m!321767))

(declare-fun m!321769 () Bool)

(assert (=> b!311753 m!321769))

(declare-fun m!321771 () Bool)

(assert (=> b!311753 m!321771))

(push 1)

(assert (not start!31014))

(assert (not b!311755))

(assert (not b!311751))

