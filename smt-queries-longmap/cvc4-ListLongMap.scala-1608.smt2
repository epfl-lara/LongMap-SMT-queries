; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30324 () Bool)

(assert start!30324)

(declare-fun b!303648 () Bool)

(declare-fun res!161139 () Bool)

(declare-fun e!191027 () Bool)

(assert (=> b!303648 (=> (not res!161139) (not e!191027))))

(declare-datatypes ((array!15430 0))(
  ( (array!15431 (arr!7303 (Array (_ BitVec 32) (_ BitVec 64))) (size!7655 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15430)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303648 (= res!161139 (and (= (size!7655 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7655 a!3293))))))

(declare-fun b!303649 () Bool)

(declare-fun res!161134 () Bool)

(assert (=> b!303649 (=> (not res!161134) (not e!191027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15430 (_ BitVec 32)) Bool)

(assert (=> b!303649 (= res!161134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!161137 () Bool)

(assert (=> start!30324 (=> (not res!161137) (not e!191027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30324 (= res!161137 (validMask!0 mask!3709))))

(assert (=> start!30324 e!191027))

(declare-fun array_inv!5266 (array!15430) Bool)

(assert (=> start!30324 (array_inv!5266 a!3293)))

(assert (=> start!30324 true))

(declare-fun b!303650 () Bool)

(declare-fun res!161135 () Bool)

(declare-fun e!191029 () Bool)

(assert (=> b!303650 (=> (not res!161135) (not e!191029))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303650 (= res!161135 (and (= (select (arr!7303 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7655 a!3293))))))

(declare-fun b!303651 () Bool)

(assert (=> b!303651 (= e!191027 e!191029)))

(declare-fun res!161136 () Bool)

(assert (=> b!303651 (=> (not res!161136) (not e!191029))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2443 0))(
  ( (MissingZero!2443 (index!11948 (_ BitVec 32))) (Found!2443 (index!11949 (_ BitVec 32))) (Intermediate!2443 (undefined!3255 Bool) (index!11950 (_ BitVec 32)) (x!30204 (_ BitVec 32))) (Undefined!2443) (MissingVacant!2443 (index!11951 (_ BitVec 32))) )
))
(declare-fun lt!150231 () SeekEntryResult!2443)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15430 (_ BitVec 32)) SeekEntryResult!2443)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303651 (= res!161136 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150231))))

(assert (=> b!303651 (= lt!150231 (Intermediate!2443 false resIndex!52 resX!52))))

(declare-fun b!303652 () Bool)

(declare-fun res!161141 () Bool)

(assert (=> b!303652 (=> (not res!161141) (not e!191029))))

(assert (=> b!303652 (= res!161141 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150231))))

(declare-fun b!303653 () Bool)

(declare-fun res!161140 () Bool)

(assert (=> b!303653 (=> (not res!161140) (not e!191027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303653 (= res!161140 (validKeyInArray!0 k!2441))))

(declare-fun b!303654 () Bool)

(declare-fun res!161138 () Bool)

(assert (=> b!303654 (=> (not res!161138) (not e!191027))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15430 (_ BitVec 32)) SeekEntryResult!2443)

(assert (=> b!303654 (= res!161138 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2443 i!1240)))))

(declare-fun b!303655 () Bool)

(assert (=> b!303655 (= e!191029 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7303 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7303 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7303 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!303656 () Bool)

(declare-fun res!161142 () Bool)

(assert (=> b!303656 (=> (not res!161142) (not e!191027))))

(declare-fun arrayContainsKey!0 (array!15430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303656 (= res!161142 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30324 res!161137) b!303648))

(assert (= (and b!303648 res!161139) b!303653))

(assert (= (and b!303653 res!161140) b!303656))

(assert (= (and b!303656 res!161142) b!303654))

(assert (= (and b!303654 res!161138) b!303649))

(assert (= (and b!303649 res!161134) b!303651))

(assert (= (and b!303651 res!161136) b!303650))

(assert (= (and b!303650 res!161135) b!303652))

(assert (= (and b!303652 res!161141) b!303655))

(declare-fun m!314959 () Bool)

(assert (=> b!303654 m!314959))

(declare-fun m!314961 () Bool)

(assert (=> b!303650 m!314961))

(declare-fun m!314963 () Bool)

(assert (=> b!303653 m!314963))

(declare-fun m!314965 () Bool)

(assert (=> start!30324 m!314965))

(declare-fun m!314967 () Bool)

(assert (=> start!30324 m!314967))

(declare-fun m!314969 () Bool)

(assert (=> b!303652 m!314969))

(declare-fun m!314971 () Bool)

(assert (=> b!303656 m!314971))

(declare-fun m!314973 () Bool)

(assert (=> b!303655 m!314973))

(declare-fun m!314975 () Bool)

(assert (=> b!303649 m!314975))

(declare-fun m!314977 () Bool)

(assert (=> b!303651 m!314977))

(assert (=> b!303651 m!314977))

(declare-fun m!314979 () Bool)

(assert (=> b!303651 m!314979))

(push 1)

(assert (not b!303651))

(assert (not b!303656))

(assert (not b!303654))

(assert (not start!30324))

(assert (not b!303652))

(assert (not b!303649))

(assert (not b!303653))

(check-sat)

(pop 1)

(push 1)

(check-sat)

