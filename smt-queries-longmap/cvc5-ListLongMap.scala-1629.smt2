; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30554 () Bool)

(assert start!30554)

(declare-fun b!305998 () Bool)

(assert (=> b!305998 false))

(declare-datatypes ((array!15558 0))(
  ( (array!15559 (arr!7364 (Array (_ BitVec 32) (_ BitVec 64))) (size!7716 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15558)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2504 0))(
  ( (MissingZero!2504 (index!12192 (_ BitVec 32))) (Found!2504 (index!12193 (_ BitVec 32))) (Intermediate!2504 (undefined!3316 Bool) (index!12194 (_ BitVec 32)) (x!30451 (_ BitVec 32))) (Undefined!2504) (MissingVacant!2504 (index!12195 (_ BitVec 32))) )
))
(declare-fun lt!150868 () SeekEntryResult!2504)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15558 (_ BitVec 32)) SeekEntryResult!2504)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305998 (= lt!150868 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9461 0))(
  ( (Unit!9462) )
))
(declare-fun e!192022 () Unit!9461)

(declare-fun Unit!9463 () Unit!9461)

(assert (=> b!305998 (= e!192022 Unit!9463)))

(declare-fun e!192023 () Bool)

(declare-fun b!305999 () Bool)

(assert (=> b!305999 (= e!192023 (not (or (not (= (select (arr!7364 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!305999 (= index!1781 resIndex!52)))

(declare-fun lt!150869 () Unit!9461)

(declare-fun e!192021 () Unit!9461)

(assert (=> b!305999 (= lt!150869 e!192021)))

(declare-fun c!49085 () Bool)

(assert (=> b!305999 (= c!49085 (not (= resIndex!52 index!1781)))))

(declare-fun res!163036 () Bool)

(declare-fun e!192025 () Bool)

(assert (=> start!30554 (=> (not res!163036) (not e!192025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30554 (= res!163036 (validMask!0 mask!3709))))

(assert (=> start!30554 e!192025))

(declare-fun array_inv!5327 (array!15558) Bool)

(assert (=> start!30554 (array_inv!5327 a!3293)))

(assert (=> start!30554 true))

(declare-fun b!306000 () Bool)

(assert (=> b!306000 (= e!192025 e!192023)))

(declare-fun res!163041 () Bool)

(assert (=> b!306000 (=> (not res!163041) (not e!192023))))

(declare-fun lt!150870 () SeekEntryResult!2504)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306000 (= res!163041 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150870))))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306000 (= lt!150870 (Intermediate!2504 false resIndex!52 resX!52))))

(declare-fun b!306001 () Bool)

(assert (=> b!306001 false))

(declare-fun Unit!9464 () Unit!9461)

(assert (=> b!306001 (= e!192022 Unit!9464)))

(declare-fun b!306002 () Bool)

(declare-fun res!163033 () Bool)

(assert (=> b!306002 (=> (not res!163033) (not e!192025))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306002 (= res!163033 (and (= (size!7716 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7716 a!3293))))))

(declare-fun b!306003 () Bool)

(assert (=> b!306003 (= e!192021 e!192022)))

(declare-fun c!49086 () Bool)

(assert (=> b!306003 (= c!49086 (or (= (select (arr!7364 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7364 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306004 () Bool)

(declare-fun res!163039 () Bool)

(assert (=> b!306004 (=> (not res!163039) (not e!192025))))

(declare-fun arrayContainsKey!0 (array!15558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306004 (= res!163039 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306005 () Bool)

(declare-fun res!163040 () Bool)

(assert (=> b!306005 (=> (not res!163040) (not e!192025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15558 (_ BitVec 32)) Bool)

(assert (=> b!306005 (= res!163040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306006 () Bool)

(declare-fun res!163038 () Bool)

(assert (=> b!306006 (=> (not res!163038) (not e!192023))))

(assert (=> b!306006 (= res!163038 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7364 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306007 () Bool)

(declare-fun res!163037 () Bool)

(assert (=> b!306007 (=> (not res!163037) (not e!192023))))

(assert (=> b!306007 (= res!163037 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150870))))

(declare-fun b!306008 () Bool)

(declare-fun res!163032 () Bool)

(assert (=> b!306008 (=> (not res!163032) (not e!192025))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15558 (_ BitVec 32)) SeekEntryResult!2504)

(assert (=> b!306008 (= res!163032 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2504 i!1240)))))

(declare-fun b!306009 () Bool)

(declare-fun res!163034 () Bool)

(assert (=> b!306009 (=> (not res!163034) (not e!192025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306009 (= res!163034 (validKeyInArray!0 k!2441))))

(declare-fun b!306010 () Bool)

(declare-fun res!163035 () Bool)

(assert (=> b!306010 (=> (not res!163035) (not e!192023))))

(assert (=> b!306010 (= res!163035 (and (= (select (arr!7364 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7716 a!3293))))))

(declare-fun b!306011 () Bool)

(declare-fun Unit!9465 () Unit!9461)

(assert (=> b!306011 (= e!192021 Unit!9465)))

(assert (= (and start!30554 res!163036) b!306002))

(assert (= (and b!306002 res!163033) b!306009))

(assert (= (and b!306009 res!163034) b!306004))

(assert (= (and b!306004 res!163039) b!306008))

(assert (= (and b!306008 res!163032) b!306005))

(assert (= (and b!306005 res!163040) b!306000))

(assert (= (and b!306000 res!163041) b!306010))

(assert (= (and b!306010 res!163035) b!306007))

(assert (= (and b!306007 res!163037) b!306006))

(assert (= (and b!306006 res!163038) b!305999))

(assert (= (and b!305999 c!49085) b!306003))

(assert (= (and b!305999 (not c!49085)) b!306011))

(assert (= (and b!306003 c!49086) b!306001))

(assert (= (and b!306003 (not c!49086)) b!305998))

(declare-fun m!316757 () Bool)

(assert (=> b!306003 m!316757))

(declare-fun m!316759 () Bool)

(assert (=> start!30554 m!316759))

(declare-fun m!316761 () Bool)

(assert (=> start!30554 m!316761))

(declare-fun m!316763 () Bool)

(assert (=> b!306008 m!316763))

(declare-fun m!316765 () Bool)

(assert (=> b!305998 m!316765))

(assert (=> b!305998 m!316765))

(declare-fun m!316767 () Bool)

(assert (=> b!305998 m!316767))

(assert (=> b!306006 m!316757))

(declare-fun m!316769 () Bool)

(assert (=> b!306000 m!316769))

(assert (=> b!306000 m!316769))

(declare-fun m!316771 () Bool)

(assert (=> b!306000 m!316771))

(declare-fun m!316773 () Bool)

(assert (=> b!306007 m!316773))

(declare-fun m!316775 () Bool)

(assert (=> b!306010 m!316775))

(assert (=> b!305999 m!316757))

(declare-fun m!316777 () Bool)

(assert (=> b!306005 m!316777))

(declare-fun m!316779 () Bool)

(assert (=> b!306009 m!316779))

(declare-fun m!316781 () Bool)

(assert (=> b!306004 m!316781))

(push 1)

