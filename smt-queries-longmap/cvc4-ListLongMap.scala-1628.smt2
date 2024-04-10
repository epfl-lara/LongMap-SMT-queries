; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30552 () Bool)

(assert start!30552)

(declare-fun b!305956 () Bool)

(declare-fun res!163005 () Bool)

(declare-fun e!192009 () Bool)

(assert (=> b!305956 (=> (not res!163005) (not e!192009))))

(declare-datatypes ((array!15556 0))(
  ( (array!15557 (arr!7363 (Array (_ BitVec 32) (_ BitVec 64))) (size!7715 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15556)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15556 (_ BitVec 32)) Bool)

(assert (=> b!305956 (= res!163005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305957 () Bool)

(declare-fun res!163002 () Bool)

(assert (=> b!305957 (=> (not res!163002) (not e!192009))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2503 0))(
  ( (MissingZero!2503 (index!12188 (_ BitVec 32))) (Found!2503 (index!12189 (_ BitVec 32))) (Intermediate!2503 (undefined!3315 Bool) (index!12190 (_ BitVec 32)) (x!30442 (_ BitVec 32))) (Undefined!2503) (MissingVacant!2503 (index!12191 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15556 (_ BitVec 32)) SeekEntryResult!2503)

(assert (=> b!305957 (= res!163002 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2503 i!1240)))))

(declare-fun b!305958 () Bool)

(declare-fun res!163006 () Bool)

(assert (=> b!305958 (=> (not res!163006) (not e!192009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305958 (= res!163006 (validKeyInArray!0 k!2441))))

(declare-fun b!305959 () Bool)

(declare-datatypes ((Unit!9456 0))(
  ( (Unit!9457) )
))
(declare-fun e!192006 () Unit!9456)

(declare-fun e!192007 () Unit!9456)

(assert (=> b!305959 (= e!192006 e!192007)))

(declare-fun c!49079 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305959 (= c!49079 (or (= (select (arr!7363 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7363 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305960 () Bool)

(declare-fun res!163011 () Bool)

(declare-fun e!192008 () Bool)

(assert (=> b!305960 (=> (not res!163011) (not e!192008))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!305960 (= res!163011 (and (= (select (arr!7363 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7715 a!3293))))))

(declare-fun b!305961 () Bool)

(declare-fun Unit!9458 () Unit!9456)

(assert (=> b!305961 (= e!192006 Unit!9458)))

(declare-fun b!305962 () Bool)

(assert (=> b!305962 false))

(declare-fun Unit!9459 () Unit!9456)

(assert (=> b!305962 (= e!192007 Unit!9459)))

(declare-fun res!163007 () Bool)

(assert (=> start!30552 (=> (not res!163007) (not e!192009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30552 (= res!163007 (validMask!0 mask!3709))))

(assert (=> start!30552 e!192009))

(declare-fun array_inv!5326 (array!15556) Bool)

(assert (=> start!30552 (array_inv!5326 a!3293)))

(assert (=> start!30552 true))

(declare-fun b!305963 () Bool)

(assert (=> b!305963 false))

(declare-fun lt!150861 () SeekEntryResult!2503)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15556 (_ BitVec 32)) SeekEntryResult!2503)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305963 (= lt!150861 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9460 () Unit!9456)

(assert (=> b!305963 (= e!192007 Unit!9460)))

(declare-fun b!305964 () Bool)

(declare-fun res!163010 () Bool)

(assert (=> b!305964 (=> (not res!163010) (not e!192008))))

(declare-fun lt!150860 () SeekEntryResult!2503)

(assert (=> b!305964 (= res!163010 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150860))))

(declare-fun b!305965 () Bool)

(assert (=> b!305965 (= e!192009 e!192008)))

(declare-fun res!163003 () Bool)

(assert (=> b!305965 (=> (not res!163003) (not e!192008))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305965 (= res!163003 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150860))))

(assert (=> b!305965 (= lt!150860 (Intermediate!2503 false resIndex!52 resX!52))))

(declare-fun b!305966 () Bool)

(declare-fun res!163008 () Bool)

(assert (=> b!305966 (=> (not res!163008) (not e!192009))))

(declare-fun arrayContainsKey!0 (array!15556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305966 (= res!163008 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305967 () Bool)

(declare-fun res!163004 () Bool)

(assert (=> b!305967 (=> (not res!163004) (not e!192008))))

(assert (=> b!305967 (= res!163004 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7363 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!305968 () Bool)

(assert (=> b!305968 (= e!192008 (not (or (not (= (select (arr!7363 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(assert (=> b!305968 (= index!1781 resIndex!52)))

(declare-fun lt!150859 () Unit!9456)

(assert (=> b!305968 (= lt!150859 e!192006)))

(declare-fun c!49080 () Bool)

(assert (=> b!305968 (= c!49080 (not (= resIndex!52 index!1781)))))

(declare-fun b!305969 () Bool)

(declare-fun res!163009 () Bool)

(assert (=> b!305969 (=> (not res!163009) (not e!192009))))

(assert (=> b!305969 (= res!163009 (and (= (size!7715 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7715 a!3293))))))

(assert (= (and start!30552 res!163007) b!305969))

(assert (= (and b!305969 res!163009) b!305958))

(assert (= (and b!305958 res!163006) b!305966))

(assert (= (and b!305966 res!163008) b!305957))

(assert (= (and b!305957 res!163002) b!305956))

(assert (= (and b!305956 res!163005) b!305965))

(assert (= (and b!305965 res!163003) b!305960))

(assert (= (and b!305960 res!163011) b!305964))

(assert (= (and b!305964 res!163010) b!305967))

(assert (= (and b!305967 res!163004) b!305968))

(assert (= (and b!305968 c!49080) b!305959))

(assert (= (and b!305968 (not c!49080)) b!305961))

(assert (= (and b!305959 c!49079) b!305962))

(assert (= (and b!305959 (not c!49079)) b!305963))

(declare-fun m!316731 () Bool)

(assert (=> b!305966 m!316731))

(declare-fun m!316733 () Bool)

(assert (=> b!305965 m!316733))

(assert (=> b!305965 m!316733))

(declare-fun m!316735 () Bool)

(assert (=> b!305965 m!316735))

(declare-fun m!316737 () Bool)

(assert (=> b!305959 m!316737))

(declare-fun m!316739 () Bool)

(assert (=> start!30552 m!316739))

(declare-fun m!316741 () Bool)

(assert (=> start!30552 m!316741))

(declare-fun m!316743 () Bool)

(assert (=> b!305960 m!316743))

(declare-fun m!316745 () Bool)

(assert (=> b!305958 m!316745))

(declare-fun m!316747 () Bool)

(assert (=> b!305956 m!316747))

(assert (=> b!305967 m!316737))

(assert (=> b!305968 m!316737))

(declare-fun m!316749 () Bool)

(assert (=> b!305957 m!316749))

(declare-fun m!316751 () Bool)

(assert (=> b!305964 m!316751))

(declare-fun m!316753 () Bool)

(assert (=> b!305963 m!316753))

(assert (=> b!305963 m!316753))

(declare-fun m!316755 () Bool)

(assert (=> b!305963 m!316755))

(push 1)

(assert (not b!305957))

(assert (not b!305964))

(assert (not b!305958))

(assert (not b!305966))

(assert (not b!305956))

(assert (not start!30552))

(assert (not b!305965))

(assert (not b!305963))

(check-sat)

(pop 1)

(push 1)

(check-sat)

