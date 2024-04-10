; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30672 () Bool)

(assert start!30672)

(declare-fun b!307922 () Bool)

(declare-fun res!164678 () Bool)

(declare-fun e!192656 () Bool)

(assert (=> b!307922 (=> (not res!164678) (not e!192656))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307922 (= res!164678 (validKeyInArray!0 k!2441))))

(declare-fun b!307923 () Bool)

(declare-fun res!164681 () Bool)

(assert (=> b!307923 (=> (not res!164681) (not e!192656))))

(declare-datatypes ((array!15676 0))(
  ( (array!15677 (arr!7423 (Array (_ BitVec 32) (_ BitVec 64))) (size!7775 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15676)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307923 (= res!164681 (and (= (size!7775 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7775 a!3293))))))

(declare-fun b!307924 () Bool)

(declare-fun res!164684 () Bool)

(assert (=> b!307924 (=> (not res!164684) (not e!192656))))

(declare-datatypes ((SeekEntryResult!2563 0))(
  ( (MissingZero!2563 (index!12428 (_ BitVec 32))) (Found!2563 (index!12429 (_ BitVec 32))) (Intermediate!2563 (undefined!3375 Bool) (index!12430 (_ BitVec 32)) (x!30662 (_ BitVec 32))) (Undefined!2563) (MissingVacant!2563 (index!12431 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15676 (_ BitVec 32)) SeekEntryResult!2563)

(assert (=> b!307924 (= res!164684 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2563 i!1240)))))

(declare-fun b!307925 () Bool)

(declare-fun res!164685 () Bool)

(assert (=> b!307925 (=> (not res!164685) (not e!192656))))

(declare-fun arrayContainsKey!0 (array!15676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307925 (= res!164685 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307926 () Bool)

(declare-fun e!192657 () Bool)

(assert (=> b!307926 (= e!192657 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!151202 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307926 (= lt!151202 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!164679 () Bool)

(assert (=> start!30672 (=> (not res!164679) (not e!192656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30672 (= res!164679 (validMask!0 mask!3709))))

(assert (=> start!30672 e!192656))

(declare-fun array_inv!5386 (array!15676) Bool)

(assert (=> start!30672 (array_inv!5386 a!3293)))

(assert (=> start!30672 true))

(declare-fun b!307927 () Bool)

(declare-fun res!164676 () Bool)

(assert (=> b!307927 (=> (not res!164676) (not e!192657))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307927 (= res!164676 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7423 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!307928 () Bool)

(assert (=> b!307928 (= e!192656 e!192657)))

(declare-fun res!164680 () Bool)

(assert (=> b!307928 (=> (not res!164680) (not e!192657))))

(declare-fun lt!151203 () SeekEntryResult!2563)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15676 (_ BitVec 32)) SeekEntryResult!2563)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307928 (= res!164680 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151203))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307928 (= lt!151203 (Intermediate!2563 false resIndex!52 resX!52))))

(declare-fun b!307929 () Bool)

(declare-fun res!164677 () Bool)

(assert (=> b!307929 (=> (not res!164677) (not e!192656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15676 (_ BitVec 32)) Bool)

(assert (=> b!307929 (= res!164677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307930 () Bool)

(declare-fun res!164682 () Bool)

(assert (=> b!307930 (=> (not res!164682) (not e!192657))))

(assert (=> b!307930 (= res!164682 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151203))))

(declare-fun b!307931 () Bool)

(declare-fun res!164683 () Bool)

(assert (=> b!307931 (=> (not res!164683) (not e!192657))))

(assert (=> b!307931 (= res!164683 (and (= (select (arr!7423 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7775 a!3293))))))

(assert (= (and start!30672 res!164679) b!307923))

(assert (= (and b!307923 res!164681) b!307922))

(assert (= (and b!307922 res!164678) b!307925))

(assert (= (and b!307925 res!164685) b!307924))

(assert (= (and b!307924 res!164684) b!307929))

(assert (= (and b!307929 res!164677) b!307928))

(assert (= (and b!307928 res!164680) b!307931))

(assert (= (and b!307931 res!164683) b!307930))

(assert (= (and b!307930 res!164682) b!307927))

(assert (= (and b!307927 res!164676) b!307926))

(declare-fun m!318137 () Bool)

(assert (=> start!30672 m!318137))

(declare-fun m!318139 () Bool)

(assert (=> start!30672 m!318139))

(declare-fun m!318141 () Bool)

(assert (=> b!307922 m!318141))

(declare-fun m!318143 () Bool)

(assert (=> b!307924 m!318143))

(declare-fun m!318145 () Bool)

(assert (=> b!307930 m!318145))

(declare-fun m!318147 () Bool)

(assert (=> b!307929 m!318147))

(declare-fun m!318149 () Bool)

(assert (=> b!307925 m!318149))

(declare-fun m!318151 () Bool)

(assert (=> b!307927 m!318151))

(declare-fun m!318153 () Bool)

(assert (=> b!307928 m!318153))

(assert (=> b!307928 m!318153))

(declare-fun m!318155 () Bool)

(assert (=> b!307928 m!318155))

(declare-fun m!318157 () Bool)

(assert (=> b!307931 m!318157))

(declare-fun m!318159 () Bool)

(assert (=> b!307926 m!318159))

(push 1)

(assert (not b!307929))

(assert (not b!307928))

(assert (not b!307925))

(assert (not b!307922))

(assert (not start!30672))

(assert (not b!307924))

(assert (not b!307926))

(assert (not b!307930))

(check-sat)

