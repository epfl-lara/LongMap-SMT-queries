; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29986 () Bool)

(assert start!29986)

(declare-fun res!158736 () Bool)

(declare-fun e!189917 () Bool)

(assert (=> start!29986 (=> (not res!158736) (not e!189917))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29986 (= res!158736 (validMask!0 mask!3709))))

(assert (=> start!29986 e!189917))

(assert (=> start!29986 true))

(declare-datatypes ((array!15213 0))(
  ( (array!15214 (arr!7199 (Array (_ BitVec 32) (_ BitVec 64))) (size!7552 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15213)

(declare-fun array_inv!5171 (array!15213) Bool)

(assert (=> start!29986 (array_inv!5171 a!3293)))

(declare-fun b!300840 () Bool)

(declare-fun res!158737 () Bool)

(assert (=> b!300840 (=> (not res!158737) (not e!189917))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!300840 (= res!158737 (and (= (size!7552 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7552 a!3293))))))

(declare-fun b!300842 () Bool)

(declare-fun res!158739 () Bool)

(assert (=> b!300842 (=> (not res!158739) (not e!189917))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300842 (= res!158739 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!300843 () Bool)

(assert (=> b!300843 (= e!189917 false)))

(declare-datatypes ((SeekEntryResult!2338 0))(
  ( (MissingZero!2338 (index!11528 (_ BitVec 32))) (Found!2338 (index!11529 (_ BitVec 32))) (Intermediate!2338 (undefined!3150 Bool) (index!11530 (_ BitVec 32)) (x!29821 (_ BitVec 32))) (Undefined!2338) (MissingVacant!2338 (index!11531 (_ BitVec 32))) )
))
(declare-fun lt!149537 () SeekEntryResult!2338)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15213 (_ BitVec 32)) SeekEntryResult!2338)

(assert (=> b!300843 (= lt!149537 (seekEntryOrOpen!0 k!2441 a!3293 mask!3709))))

(declare-fun b!300841 () Bool)

(declare-fun res!158738 () Bool)

(assert (=> b!300841 (=> (not res!158738) (not e!189917))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300841 (= res!158738 (validKeyInArray!0 k!2441))))

(assert (= (and start!29986 res!158736) b!300840))

(assert (= (and b!300840 res!158737) b!300841))

(assert (= (and b!300841 res!158738) b!300842))

(assert (= (and b!300842 res!158739) b!300843))

(declare-fun m!312249 () Bool)

(assert (=> start!29986 m!312249))

(declare-fun m!312251 () Bool)

(assert (=> start!29986 m!312251))

(declare-fun m!312253 () Bool)

(assert (=> b!300842 m!312253))

(declare-fun m!312255 () Bool)

(assert (=> b!300843 m!312255))

(declare-fun m!312257 () Bool)

(assert (=> b!300841 m!312257))

(push 1)

(assert (not b!300843))

(assert (not start!29986))

(assert (not b!300842))

(assert (not b!300841))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

