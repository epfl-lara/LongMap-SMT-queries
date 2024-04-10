; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30674 () Bool)

(assert start!30674)

(declare-fun b!307952 () Bool)

(declare-fun e!192666 () Bool)

(declare-fun e!192667 () Bool)

(assert (=> b!307952 (= e!192666 e!192667)))

(declare-fun res!164713 () Bool)

(assert (=> b!307952 (=> (not res!164713) (not e!192667))))

(declare-datatypes ((array!15678 0))(
  ( (array!15679 (arr!7424 (Array (_ BitVec 32) (_ BitVec 64))) (size!7776 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15678)

(declare-datatypes ((SeekEntryResult!2564 0))(
  ( (MissingZero!2564 (index!12432 (_ BitVec 32))) (Found!2564 (index!12433 (_ BitVec 32))) (Intermediate!2564 (undefined!3376 Bool) (index!12434 (_ BitVec 32)) (x!30671 (_ BitVec 32))) (Undefined!2564) (MissingVacant!2564 (index!12435 (_ BitVec 32))) )
))
(declare-fun lt!151209 () SeekEntryResult!2564)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15678 (_ BitVec 32)) SeekEntryResult!2564)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307952 (= res!164713 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151209))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307952 (= lt!151209 (Intermediate!2564 false resIndex!52 resX!52))))

(declare-fun b!307953 () Bool)

(declare-fun res!164707 () Bool)

(assert (=> b!307953 (=> (not res!164707) (not e!192666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307953 (= res!164707 (validKeyInArray!0 k!2441))))

(declare-fun b!307954 () Bool)

(declare-fun res!164711 () Bool)

(assert (=> b!307954 (=> (not res!164711) (not e!192666))))

(declare-fun arrayContainsKey!0 (array!15678 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307954 (= res!164711 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307955 () Bool)

(declare-fun res!164706 () Bool)

(assert (=> b!307955 (=> (not res!164706) (not e!192667))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307955 (= res!164706 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7424 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!307956 () Bool)

(declare-fun res!164709 () Bool)

(assert (=> b!307956 (=> (not res!164709) (not e!192667))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307956 (= res!164709 (and (= (select (arr!7424 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7776 a!3293))))))

(declare-fun b!307957 () Bool)

(declare-fun res!164714 () Bool)

(assert (=> b!307957 (=> (not res!164714) (not e!192666))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15678 (_ BitVec 32)) SeekEntryResult!2564)

(assert (=> b!307957 (= res!164714 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2564 i!1240)))))

(declare-fun b!307958 () Bool)

(assert (=> b!307958 (= e!192667 false)))

(declare-fun lt!151208 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307958 (= lt!151208 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!307959 () Bool)

(declare-fun res!164712 () Bool)

(assert (=> b!307959 (=> (not res!164712) (not e!192666))))

(assert (=> b!307959 (= res!164712 (and (= (size!7776 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7776 a!3293))))))

(declare-fun res!164710 () Bool)

(assert (=> start!30674 (=> (not res!164710) (not e!192666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30674 (= res!164710 (validMask!0 mask!3709))))

(assert (=> start!30674 e!192666))

(declare-fun array_inv!5387 (array!15678) Bool)

(assert (=> start!30674 (array_inv!5387 a!3293)))

(assert (=> start!30674 true))

(declare-fun b!307960 () Bool)

(declare-fun res!164715 () Bool)

(assert (=> b!307960 (=> (not res!164715) (not e!192667))))

(assert (=> b!307960 (= res!164715 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151209))))

(declare-fun b!307961 () Bool)

(declare-fun res!164708 () Bool)

(assert (=> b!307961 (=> (not res!164708) (not e!192666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15678 (_ BitVec 32)) Bool)

(assert (=> b!307961 (= res!164708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30674 res!164710) b!307959))

(assert (= (and b!307959 res!164712) b!307953))

(assert (= (and b!307953 res!164707) b!307954))

(assert (= (and b!307954 res!164711) b!307957))

(assert (= (and b!307957 res!164714) b!307961))

(assert (= (and b!307961 res!164708) b!307952))

(assert (= (and b!307952 res!164713) b!307956))

(assert (= (and b!307956 res!164709) b!307960))

(assert (= (and b!307960 res!164715) b!307955))

(assert (= (and b!307955 res!164706) b!307958))

(declare-fun m!318161 () Bool)

(assert (=> b!307956 m!318161))

(declare-fun m!318163 () Bool)

(assert (=> start!30674 m!318163))

(declare-fun m!318165 () Bool)

(assert (=> start!30674 m!318165))

(declare-fun m!318167 () Bool)

(assert (=> b!307958 m!318167))

(declare-fun m!318169 () Bool)

(assert (=> b!307953 m!318169))

(declare-fun m!318171 () Bool)

(assert (=> b!307960 m!318171))

(declare-fun m!318173 () Bool)

(assert (=> b!307952 m!318173))

(assert (=> b!307952 m!318173))

(declare-fun m!318175 () Bool)

(assert (=> b!307952 m!318175))

(declare-fun m!318177 () Bool)

(assert (=> b!307954 m!318177))

(declare-fun m!318179 () Bool)

(assert (=> b!307957 m!318179))

(declare-fun m!318181 () Bool)

(assert (=> b!307961 m!318181))

(declare-fun m!318183 () Bool)

(assert (=> b!307955 m!318183))

(push 1)

