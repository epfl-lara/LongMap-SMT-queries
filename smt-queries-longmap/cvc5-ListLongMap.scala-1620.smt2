; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30446 () Bool)

(assert start!30446)

(declare-fun b!304837 () Bool)

(declare-fun res!162189 () Bool)

(declare-fun e!191513 () Bool)

(assert (=> b!304837 (=> (not res!162189) (not e!191513))))

(declare-datatypes ((array!15501 0))(
  ( (array!15502 (arr!7337 (Array (_ BitVec 32) (_ BitVec 64))) (size!7689 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15501)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304837 (= res!162189 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304838 () Bool)

(declare-fun e!191512 () Bool)

(assert (=> b!304838 (= e!191513 e!191512)))

(declare-fun res!162188 () Bool)

(assert (=> b!304838 (=> (not res!162188) (not e!191512))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2477 0))(
  ( (MissingZero!2477 (index!12084 (_ BitVec 32))) (Found!2477 (index!12085 (_ BitVec 32))) (Intermediate!2477 (undefined!3289 Bool) (index!12086 (_ BitVec 32)) (x!30343 (_ BitVec 32))) (Undefined!2477) (MissingVacant!2477 (index!12087 (_ BitVec 32))) )
))
(declare-fun lt!150540 () SeekEntryResult!2477)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15501 (_ BitVec 32)) SeekEntryResult!2477)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304838 (= res!162188 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150540))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304838 (= lt!150540 (Intermediate!2477 false resIndex!52 resX!52))))

(declare-fun b!304839 () Bool)

(declare-fun res!162183 () Bool)

(assert (=> b!304839 (=> (not res!162183) (not e!191513))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!304839 (= res!162183 (and (= (size!7689 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7689 a!3293))))))

(declare-fun b!304840 () Bool)

(declare-fun e!191514 () Bool)

(assert (=> b!304840 (= e!191512 e!191514)))

(declare-fun res!162184 () Bool)

(assert (=> b!304840 (=> (not res!162184) (not e!191514))))

(declare-fun lt!150539 () SeekEntryResult!2477)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!304840 (= res!162184 (and (= lt!150539 lt!150540) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7337 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7337 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7337 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304840 (= lt!150539 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!304841 () Bool)

(declare-fun res!162185 () Bool)

(assert (=> b!304841 (=> (not res!162185) (not e!191513))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15501 (_ BitVec 32)) SeekEntryResult!2477)

(assert (=> b!304841 (= res!162185 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2477 i!1240)))))

(declare-fun b!304842 () Bool)

(declare-fun res!162181 () Bool)

(assert (=> b!304842 (=> (not res!162181) (not e!191513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304842 (= res!162181 (validKeyInArray!0 k!2441))))

(declare-fun b!304836 () Bool)

(assert (=> b!304836 (= e!191514 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304836 (= lt!150539 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun res!162186 () Bool)

(assert (=> start!30446 (=> (not res!162186) (not e!191513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30446 (= res!162186 (validMask!0 mask!3709))))

(assert (=> start!30446 e!191513))

(declare-fun array_inv!5300 (array!15501) Bool)

(assert (=> start!30446 (array_inv!5300 a!3293)))

(assert (=> start!30446 true))

(declare-fun b!304843 () Bool)

(declare-fun res!162182 () Bool)

(assert (=> b!304843 (=> (not res!162182) (not e!191512))))

(assert (=> b!304843 (= res!162182 (and (= (select (arr!7337 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7689 a!3293))))))

(declare-fun b!304844 () Bool)

(declare-fun res!162187 () Bool)

(assert (=> b!304844 (=> (not res!162187) (not e!191513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15501 (_ BitVec 32)) Bool)

(assert (=> b!304844 (= res!162187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30446 res!162186) b!304839))

(assert (= (and b!304839 res!162183) b!304842))

(assert (= (and b!304842 res!162181) b!304837))

(assert (= (and b!304837 res!162189) b!304841))

(assert (= (and b!304841 res!162185) b!304844))

(assert (= (and b!304844 res!162187) b!304838))

(assert (= (and b!304838 res!162188) b!304843))

(assert (= (and b!304843 res!162182) b!304840))

(assert (= (and b!304840 res!162184) b!304836))

(declare-fun m!315917 () Bool)

(assert (=> b!304837 m!315917))

(declare-fun m!315919 () Bool)

(assert (=> b!304844 m!315919))

(declare-fun m!315921 () Bool)

(assert (=> b!304840 m!315921))

(declare-fun m!315923 () Bool)

(assert (=> b!304840 m!315923))

(declare-fun m!315925 () Bool)

(assert (=> b!304841 m!315925))

(declare-fun m!315927 () Bool)

(assert (=> b!304842 m!315927))

(declare-fun m!315929 () Bool)

(assert (=> start!30446 m!315929))

(declare-fun m!315931 () Bool)

(assert (=> start!30446 m!315931))

(declare-fun m!315933 () Bool)

(assert (=> b!304838 m!315933))

(assert (=> b!304838 m!315933))

(declare-fun m!315935 () Bool)

(assert (=> b!304838 m!315935))

(declare-fun m!315937 () Bool)

(assert (=> b!304843 m!315937))

(declare-fun m!315939 () Bool)

(assert (=> b!304836 m!315939))

(assert (=> b!304836 m!315939))

(declare-fun m!315941 () Bool)

(assert (=> b!304836 m!315941))

(push 1)

