; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31824 () Bool)

(assert start!31824)

(declare-fun res!172587 () Bool)

(declare-fun e!197646 () Bool)

(assert (=> start!31824 (=> (not res!172587) (not e!197646))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31824 (= res!172587 (validMask!0 mask!3709))))

(assert (=> start!31824 e!197646))

(declare-datatypes ((array!16195 0))(
  ( (array!16196 (arr!7663 (Array (_ BitVec 32) (_ BitVec 64))) (size!8015 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16195)

(declare-fun array_inv!5626 (array!16195) Bool)

(assert (=> start!31824 (array_inv!5626 a!3293)))

(assert (=> start!31824 true))

(declare-fun b!318002 () Bool)

(declare-fun res!172588 () Bool)

(assert (=> b!318002 (=> (not res!172588) (not e!197646))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318002 (= res!172588 (and (= (size!8015 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8015 a!3293))))))

(declare-fun b!318003 () Bool)

(declare-fun e!197650 () Bool)

(assert (=> b!318003 (= e!197646 e!197650)))

(declare-fun res!172586 () Bool)

(assert (=> b!318003 (=> (not res!172586) (not e!197650))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2803 0))(
  ( (MissingZero!2803 (index!13388 (_ BitVec 32))) (Found!2803 (index!13389 (_ BitVec 32))) (Intermediate!2803 (undefined!3615 Bool) (index!13390 (_ BitVec 32)) (x!31644 (_ BitVec 32))) (Undefined!2803) (MissingVacant!2803 (index!13391 (_ BitVec 32))) )
))
(declare-fun lt!155178 () SeekEntryResult!2803)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16195 (_ BitVec 32)) SeekEntryResult!2803)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318003 (= res!172586 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155178))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318003 (= lt!155178 (Intermediate!2803 false resIndex!52 resX!52))))

(declare-fun b!318004 () Bool)

(declare-fun e!197647 () Bool)

(assert (=> b!318004 (= e!197647 (not true))))

(declare-fun e!197648 () Bool)

(assert (=> b!318004 e!197648))

(declare-fun res!172581 () Bool)

(assert (=> b!318004 (=> (not res!172581) (not e!197648))))

(declare-fun lt!155177 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!155175 () SeekEntryResult!2803)

(assert (=> b!318004 (= res!172581 (= lt!155175 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155177 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318004 (= lt!155177 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318005 () Bool)

(assert (=> b!318005 (= e!197650 e!197647)))

(declare-fun res!172590 () Bool)

(assert (=> b!318005 (=> (not res!172590) (not e!197647))))

(assert (=> b!318005 (= res!172590 (and (= lt!155175 lt!155178) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7663 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318005 (= lt!155175 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!318006 () Bool)

(declare-fun res!172583 () Bool)

(assert (=> b!318006 (=> (not res!172583) (not e!197646))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16195 (_ BitVec 32)) SeekEntryResult!2803)

(assert (=> b!318006 (= res!172583 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2803 i!1240)))))

(declare-fun b!318007 () Bool)

(declare-fun res!172585 () Bool)

(assert (=> b!318007 (=> (not res!172585) (not e!197646))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16195 (_ BitVec 32)) Bool)

(assert (=> b!318007 (= res!172585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun lt!155176 () array!16195)

(declare-fun b!318008 () Bool)

(assert (=> b!318008 (= e!197648 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155176 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155177 k!2441 lt!155176 mask!3709)))))

(assert (=> b!318008 (= lt!155176 (array!16196 (store (arr!7663 a!3293) i!1240 k!2441) (size!8015 a!3293)))))

(declare-fun b!318009 () Bool)

(declare-fun res!172584 () Bool)

(assert (=> b!318009 (=> (not res!172584) (not e!197646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318009 (= res!172584 (validKeyInArray!0 k!2441))))

(declare-fun b!318010 () Bool)

(declare-fun res!172582 () Bool)

(assert (=> b!318010 (=> (not res!172582) (not e!197646))))

(declare-fun arrayContainsKey!0 (array!16195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318010 (= res!172582 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318011 () Bool)

(declare-fun res!172589 () Bool)

(assert (=> b!318011 (=> (not res!172589) (not e!197650))))

(assert (=> b!318011 (= res!172589 (and (= (select (arr!7663 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8015 a!3293))))))

(assert (= (and start!31824 res!172587) b!318002))

(assert (= (and b!318002 res!172588) b!318009))

(assert (= (and b!318009 res!172584) b!318010))

(assert (= (and b!318010 res!172582) b!318006))

(assert (= (and b!318006 res!172583) b!318007))

(assert (= (and b!318007 res!172585) b!318003))

(assert (= (and b!318003 res!172586) b!318011))

(assert (= (and b!318011 res!172589) b!318005))

(assert (= (and b!318005 res!172590) b!318004))

(assert (= (and b!318004 res!172581) b!318008))

(declare-fun m!326673 () Bool)

(assert (=> b!318003 m!326673))

(assert (=> b!318003 m!326673))

(declare-fun m!326675 () Bool)

(assert (=> b!318003 m!326675))

(declare-fun m!326677 () Bool)

(assert (=> start!31824 m!326677))

(declare-fun m!326679 () Bool)

(assert (=> start!31824 m!326679))

(declare-fun m!326681 () Bool)

(assert (=> b!318010 m!326681))

(declare-fun m!326683 () Bool)

(assert (=> b!318004 m!326683))

(declare-fun m!326685 () Bool)

(assert (=> b!318004 m!326685))

(declare-fun m!326687 () Bool)

(assert (=> b!318006 m!326687))

(declare-fun m!326689 () Bool)

(assert (=> b!318007 m!326689))

(declare-fun m!326691 () Bool)

(assert (=> b!318011 m!326691))

(declare-fun m!326693 () Bool)

(assert (=> b!318009 m!326693))

(declare-fun m!326695 () Bool)

(assert (=> b!318005 m!326695))

(declare-fun m!326697 () Bool)

(assert (=> b!318005 m!326697))

(declare-fun m!326699 () Bool)

(assert (=> b!318008 m!326699))

(declare-fun m!326701 () Bool)

(assert (=> b!318008 m!326701))

(declare-fun m!326703 () Bool)

(assert (=> b!318008 m!326703))

(push 1)

(assert (not b!318009))

