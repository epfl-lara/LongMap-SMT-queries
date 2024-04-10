; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30594 () Bool)

(assert start!30594)

(declare-fun b!306838 () Bool)

(assert (=> b!306838 false))

(declare-datatypes ((Unit!9561 0))(
  ( (Unit!9562) )
))
(declare-fun e!192321 () Unit!9561)

(declare-fun Unit!9563 () Unit!9561)

(assert (=> b!306838 (= e!192321 Unit!9563)))

(declare-fun b!306839 () Bool)

(declare-datatypes ((array!15598 0))(
  ( (array!15599 (arr!7384 (Array (_ BitVec 32) (_ BitVec 64))) (size!7736 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15598)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun e!192322 () Bool)

(assert (=> b!306839 (= e!192322 (not (or (not (= (select (arr!7384 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!306839 (= index!1781 resIndex!52)))

(declare-fun lt!151049 () Unit!9561)

(declare-fun e!192324 () Unit!9561)

(assert (=> b!306839 (= lt!151049 e!192324)))

(declare-fun c!49205 () Bool)

(assert (=> b!306839 (= c!49205 (not (= resIndex!52 index!1781)))))

(declare-fun b!306840 () Bool)

(declare-fun Unit!9564 () Unit!9561)

(assert (=> b!306840 (= e!192324 Unit!9564)))

(declare-fun b!306841 () Bool)

(declare-fun res!163632 () Bool)

(assert (=> b!306841 (=> (not res!163632) (not e!192322))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2524 0))(
  ( (MissingZero!2524 (index!12272 (_ BitVec 32))) (Found!2524 (index!12273 (_ BitVec 32))) (Intermediate!2524 (undefined!3336 Bool) (index!12274 (_ BitVec 32)) (x!30519 (_ BitVec 32))) (Undefined!2524) (MissingVacant!2524 (index!12275 (_ BitVec 32))) )
))
(declare-fun lt!151050 () SeekEntryResult!2524)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15598 (_ BitVec 32)) SeekEntryResult!2524)

(assert (=> b!306841 (= res!163632 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151050))))

(declare-fun b!306842 () Bool)

(declare-fun res!163635 () Bool)

(declare-fun e!192323 () Bool)

(assert (=> b!306842 (=> (not res!163635) (not e!192323))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15598 (_ BitVec 32)) SeekEntryResult!2524)

(assert (=> b!306842 (= res!163635 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2524 i!1240)))))

(declare-fun res!163640 () Bool)

(assert (=> start!30594 (=> (not res!163640) (not e!192323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30594 (= res!163640 (validMask!0 mask!3709))))

(assert (=> start!30594 e!192323))

(declare-fun array_inv!5347 (array!15598) Bool)

(assert (=> start!30594 (array_inv!5347 a!3293)))

(assert (=> start!30594 true))

(declare-fun b!306843 () Bool)

(declare-fun res!163638 () Bool)

(assert (=> b!306843 (=> (not res!163638) (not e!192323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15598 (_ BitVec 32)) Bool)

(assert (=> b!306843 (= res!163638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306844 () Bool)

(declare-fun res!163639 () Bool)

(assert (=> b!306844 (=> (not res!163639) (not e!192323))))

(assert (=> b!306844 (= res!163639 (and (= (size!7736 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7736 a!3293))))))

(declare-fun b!306845 () Bool)

(assert (=> b!306845 false))

(declare-fun lt!151048 () SeekEntryResult!2524)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306845 (= lt!151048 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9565 () Unit!9561)

(assert (=> b!306845 (= e!192321 Unit!9565)))

(declare-fun b!306846 () Bool)

(declare-fun res!163637 () Bool)

(assert (=> b!306846 (=> (not res!163637) (not e!192323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306846 (= res!163637 (validKeyInArray!0 k!2441))))

(declare-fun b!306847 () Bool)

(assert (=> b!306847 (= e!192324 e!192321)))

(declare-fun c!49206 () Bool)

(assert (=> b!306847 (= c!49206 (or (= (select (arr!7384 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7384 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306848 () Bool)

(declare-fun res!163634 () Bool)

(assert (=> b!306848 (=> (not res!163634) (not e!192323))))

(declare-fun arrayContainsKey!0 (array!15598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306848 (= res!163634 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306849 () Bool)

(declare-fun res!163641 () Bool)

(assert (=> b!306849 (=> (not res!163641) (not e!192322))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306849 (= res!163641 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7384 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306850 () Bool)

(assert (=> b!306850 (= e!192323 e!192322)))

(declare-fun res!163636 () Bool)

(assert (=> b!306850 (=> (not res!163636) (not e!192322))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306850 (= res!163636 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151050))))

(assert (=> b!306850 (= lt!151050 (Intermediate!2524 false resIndex!52 resX!52))))

(declare-fun b!306851 () Bool)

(declare-fun res!163633 () Bool)

(assert (=> b!306851 (=> (not res!163633) (not e!192322))))

(assert (=> b!306851 (= res!163633 (and (= (select (arr!7384 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7736 a!3293))))))

(assert (= (and start!30594 res!163640) b!306844))

(assert (= (and b!306844 res!163639) b!306846))

(assert (= (and b!306846 res!163637) b!306848))

(assert (= (and b!306848 res!163634) b!306842))

(assert (= (and b!306842 res!163635) b!306843))

(assert (= (and b!306843 res!163638) b!306850))

(assert (= (and b!306850 res!163636) b!306851))

(assert (= (and b!306851 res!163633) b!306841))

(assert (= (and b!306841 res!163632) b!306849))

(assert (= (and b!306849 res!163641) b!306839))

(assert (= (and b!306839 c!49205) b!306847))

(assert (= (and b!306839 (not c!49205)) b!306840))

(assert (= (and b!306847 c!49206) b!306838))

(assert (= (and b!306847 (not c!49206)) b!306845))

(declare-fun m!317277 () Bool)

(assert (=> b!306843 m!317277))

(declare-fun m!317279 () Bool)

(assert (=> b!306846 m!317279))

(declare-fun m!317281 () Bool)

(assert (=> b!306847 m!317281))

(declare-fun m!317283 () Bool)

(assert (=> start!30594 m!317283))

(declare-fun m!317285 () Bool)

(assert (=> start!30594 m!317285))

(declare-fun m!317287 () Bool)

(assert (=> b!306845 m!317287))

(assert (=> b!306845 m!317287))

(declare-fun m!317289 () Bool)

(assert (=> b!306845 m!317289))

(declare-fun m!317291 () Bool)

(assert (=> b!306850 m!317291))

(assert (=> b!306850 m!317291))

(declare-fun m!317293 () Bool)

(assert (=> b!306850 m!317293))

(declare-fun m!317295 () Bool)

(assert (=> b!306842 m!317295))

(assert (=> b!306839 m!317281))

(declare-fun m!317297 () Bool)

(assert (=> b!306848 m!317297))

(assert (=> b!306849 m!317281))

(declare-fun m!317299 () Bool)

(assert (=> b!306851 m!317299))

(declare-fun m!317301 () Bool)

(assert (=> b!306841 m!317301))

(push 1)

(assert (not b!306848))

(assert (not b!306850))

(assert (not b!306843))

(assert (not b!306842))

(assert (not b!306841))

(assert (not start!30594))

(assert (not b!306845))

