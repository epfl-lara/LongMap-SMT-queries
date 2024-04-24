; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30534 () Bool)

(assert start!30534)

(declare-fun b!305819 () Bool)

(declare-fun res!162947 () Bool)

(declare-fun e!191945 () Bool)

(assert (=> b!305819 (=> (not res!162947) (not e!191945))))

(declare-datatypes ((array!15551 0))(
  ( (array!15552 (arr!7360 (Array (_ BitVec 32) (_ BitVec 64))) (size!7712 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15551)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305819 (= res!162947 (and (= (select (arr!7360 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7712 a!3293))))))

(declare-fun b!305820 () Bool)

(declare-fun res!162943 () Bool)

(assert (=> b!305820 (=> (not res!162943) (not e!191945))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2465 0))(
  ( (MissingZero!2465 (index!12036 (_ BitVec 32))) (Found!2465 (index!12037 (_ BitVec 32))) (Intermediate!2465 (undefined!3277 Bool) (index!12038 (_ BitVec 32)) (x!30401 (_ BitVec 32))) (Undefined!2465) (MissingVacant!2465 (index!12039 (_ BitVec 32))) )
))
(declare-fun lt!150859 () SeekEntryResult!2465)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15551 (_ BitVec 32)) SeekEntryResult!2465)

(assert (=> b!305820 (= res!162943 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150859))))

(declare-fun b!305821 () Bool)

(declare-fun res!162946 () Bool)

(declare-fun e!191942 () Bool)

(assert (=> b!305821 (=> (not res!162946) (not e!191942))))

(assert (=> b!305821 (= res!162946 (and (= (size!7712 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7712 a!3293))))))

(declare-fun res!162948 () Bool)

(assert (=> start!30534 (=> (not res!162948) (not e!191942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30534 (= res!162948 (validMask!0 mask!3709))))

(assert (=> start!30534 e!191942))

(declare-fun array_inv!5310 (array!15551) Bool)

(assert (=> start!30534 (array_inv!5310 a!3293)))

(assert (=> start!30534 true))

(declare-fun b!305822 () Bool)

(declare-datatypes ((Unit!9408 0))(
  ( (Unit!9409) )
))
(declare-fun e!191944 () Unit!9408)

(declare-fun e!191946 () Unit!9408)

(assert (=> b!305822 (= e!191944 e!191946)))

(declare-fun c!49042 () Bool)

(assert (=> b!305822 (= c!49042 (or (= (select (arr!7360 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7360 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305823 () Bool)

(declare-fun res!162942 () Bool)

(assert (=> b!305823 (=> (not res!162942) (not e!191942))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15551 (_ BitVec 32)) Bool)

(assert (=> b!305823 (= res!162942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305824 () Bool)

(assert (=> b!305824 false))

(declare-fun Unit!9410 () Unit!9408)

(assert (=> b!305824 (= e!191946 Unit!9410)))

(declare-fun b!305825 () Bool)

(declare-fun Unit!9411 () Unit!9408)

(assert (=> b!305825 (= e!191944 Unit!9411)))

(declare-fun b!305826 () Bool)

(declare-fun res!162944 () Bool)

(assert (=> b!305826 (=> (not res!162944) (not e!191942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305826 (= res!162944 (validKeyInArray!0 k0!2441))))

(declare-fun b!305827 () Bool)

(declare-fun res!162945 () Bool)

(assert (=> b!305827 (=> (not res!162945) (not e!191945))))

(assert (=> b!305827 (= res!162945 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7360 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!305828 () Bool)

(assert (=> b!305828 (= e!191945 (not (or (not (= (select (arr!7360 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(assert (=> b!305828 (= index!1781 resIndex!52)))

(declare-fun lt!150861 () Unit!9408)

(assert (=> b!305828 (= lt!150861 e!191944)))

(declare-fun c!49043 () Bool)

(assert (=> b!305828 (= c!49043 (not (= resIndex!52 index!1781)))))

(declare-fun b!305829 () Bool)

(assert (=> b!305829 (= e!191942 e!191945)))

(declare-fun res!162941 () Bool)

(assert (=> b!305829 (=> (not res!162941) (not e!191945))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305829 (= res!162941 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150859))))

(assert (=> b!305829 (= lt!150859 (Intermediate!2465 false resIndex!52 resX!52))))

(declare-fun b!305830 () Bool)

(declare-fun res!162939 () Bool)

(assert (=> b!305830 (=> (not res!162939) (not e!191942))))

(declare-fun arrayContainsKey!0 (array!15551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305830 (= res!162939 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305831 () Bool)

(declare-fun res!162940 () Bool)

(assert (=> b!305831 (=> (not res!162940) (not e!191942))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15551 (_ BitVec 32)) SeekEntryResult!2465)

(assert (=> b!305831 (= res!162940 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2465 i!1240)))))

(declare-fun b!305832 () Bool)

(assert (=> b!305832 false))

(declare-fun lt!150860 () SeekEntryResult!2465)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305832 (= lt!150860 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9412 () Unit!9408)

(assert (=> b!305832 (= e!191946 Unit!9412)))

(assert (= (and start!30534 res!162948) b!305821))

(assert (= (and b!305821 res!162946) b!305826))

(assert (= (and b!305826 res!162944) b!305830))

(assert (= (and b!305830 res!162939) b!305831))

(assert (= (and b!305831 res!162940) b!305823))

(assert (= (and b!305823 res!162942) b!305829))

(assert (= (and b!305829 res!162941) b!305819))

(assert (= (and b!305819 res!162947) b!305820))

(assert (= (and b!305820 res!162943) b!305827))

(assert (= (and b!305827 res!162945) b!305828))

(assert (= (and b!305828 c!49043) b!305822))

(assert (= (and b!305828 (not c!49043)) b!305825))

(assert (= (and b!305822 c!49042) b!305824))

(assert (= (and b!305822 (not c!49042)) b!305832))

(declare-fun m!316801 () Bool)

(assert (=> b!305832 m!316801))

(assert (=> b!305832 m!316801))

(declare-fun m!316803 () Bool)

(assert (=> b!305832 m!316803))

(declare-fun m!316805 () Bool)

(assert (=> b!305820 m!316805))

(declare-fun m!316807 () Bool)

(assert (=> b!305827 m!316807))

(assert (=> b!305828 m!316807))

(declare-fun m!316809 () Bool)

(assert (=> b!305830 m!316809))

(assert (=> b!305822 m!316807))

(declare-fun m!316811 () Bool)

(assert (=> b!305819 m!316811))

(declare-fun m!316813 () Bool)

(assert (=> b!305829 m!316813))

(assert (=> b!305829 m!316813))

(declare-fun m!316815 () Bool)

(assert (=> b!305829 m!316815))

(declare-fun m!316817 () Bool)

(assert (=> b!305826 m!316817))

(declare-fun m!316819 () Bool)

(assert (=> b!305823 m!316819))

(declare-fun m!316821 () Bool)

(assert (=> b!305831 m!316821))

(declare-fun m!316823 () Bool)

(assert (=> start!30534 m!316823))

(declare-fun m!316825 () Bool)

(assert (=> start!30534 m!316825))

(check-sat (not b!305823) (not b!305820) (not b!305829) (not b!305826) (not b!305831) (not b!305832) (not start!30534) (not b!305830))
(check-sat)
