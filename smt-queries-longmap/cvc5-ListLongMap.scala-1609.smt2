; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30326 () Bool)

(assert start!30326)

(declare-fun b!303677 () Bool)

(declare-fun e!191037 () Bool)

(assert (=> b!303677 (= e!191037 false)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!150236 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303677 (= lt!150236 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!303678 () Bool)

(declare-fun res!161169 () Bool)

(assert (=> b!303678 (=> (not res!161169) (not e!191037))))

(declare-datatypes ((array!15432 0))(
  ( (array!15433 (arr!7304 (Array (_ BitVec 32) (_ BitVec 64))) (size!7656 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15432)

(declare-datatypes ((SeekEntryResult!2444 0))(
  ( (MissingZero!2444 (index!11952 (_ BitVec 32))) (Found!2444 (index!11953 (_ BitVec 32))) (Intermediate!2444 (undefined!3256 Bool) (index!11954 (_ BitVec 32)) (x!30213 (_ BitVec 32))) (Undefined!2444) (MissingVacant!2444 (index!11955 (_ BitVec 32))) )
))
(declare-fun lt!150237 () SeekEntryResult!2444)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15432 (_ BitVec 32)) SeekEntryResult!2444)

(assert (=> b!303678 (= res!161169 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150237))))

(declare-fun b!303679 () Bool)

(declare-fun res!161170 () Bool)

(declare-fun e!191036 () Bool)

(assert (=> b!303679 (=> (not res!161170) (not e!191036))))

(declare-fun arrayContainsKey!0 (array!15432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303679 (= res!161170 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303680 () Bool)

(declare-fun res!161167 () Bool)

(assert (=> b!303680 (=> (not res!161167) (not e!191036))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303680 (= res!161167 (and (= (size!7656 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7656 a!3293))))))

(declare-fun b!303681 () Bool)

(declare-fun res!161168 () Bool)

(assert (=> b!303681 (=> (not res!161168) (not e!191036))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15432 (_ BitVec 32)) SeekEntryResult!2444)

(assert (=> b!303681 (= res!161168 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2444 i!1240)))))

(declare-fun b!303682 () Bool)

(declare-fun res!161171 () Bool)

(assert (=> b!303682 (=> (not res!161171) (not e!191036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303682 (= res!161171 (validKeyInArray!0 k!2441))))

(declare-fun b!303683 () Bool)

(declare-fun res!161163 () Bool)

(assert (=> b!303683 (=> (not res!161163) (not e!191036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15432 (_ BitVec 32)) Bool)

(assert (=> b!303683 (= res!161163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303684 () Bool)

(declare-fun res!161165 () Bool)

(assert (=> b!303684 (=> (not res!161165) (not e!191037))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303684 (= res!161165 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7304 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7304 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7304 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!161164 () Bool)

(assert (=> start!30326 (=> (not res!161164) (not e!191036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30326 (= res!161164 (validMask!0 mask!3709))))

(assert (=> start!30326 e!191036))

(declare-fun array_inv!5267 (array!15432) Bool)

(assert (=> start!30326 (array_inv!5267 a!3293)))

(assert (=> start!30326 true))

(declare-fun b!303685 () Bool)

(declare-fun res!161166 () Bool)

(assert (=> b!303685 (=> (not res!161166) (not e!191037))))

(assert (=> b!303685 (= res!161166 (and (= (select (arr!7304 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7656 a!3293))))))

(declare-fun b!303686 () Bool)

(assert (=> b!303686 (= e!191036 e!191037)))

(declare-fun res!161172 () Bool)

(assert (=> b!303686 (=> (not res!161172) (not e!191037))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303686 (= res!161172 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150237))))

(assert (=> b!303686 (= lt!150237 (Intermediate!2444 false resIndex!52 resX!52))))

(assert (= (and start!30326 res!161164) b!303680))

(assert (= (and b!303680 res!161167) b!303682))

(assert (= (and b!303682 res!161171) b!303679))

(assert (= (and b!303679 res!161170) b!303681))

(assert (= (and b!303681 res!161168) b!303683))

(assert (= (and b!303683 res!161163) b!303686))

(assert (= (and b!303686 res!161172) b!303685))

(assert (= (and b!303685 res!161166) b!303678))

(assert (= (and b!303678 res!161169) b!303684))

(assert (= (and b!303684 res!161165) b!303677))

(declare-fun m!314981 () Bool)

(assert (=> b!303679 m!314981))

(declare-fun m!314983 () Bool)

(assert (=> b!303683 m!314983))

(declare-fun m!314985 () Bool)

(assert (=> b!303681 m!314985))

(declare-fun m!314987 () Bool)

(assert (=> b!303678 m!314987))

(declare-fun m!314989 () Bool)

(assert (=> b!303682 m!314989))

(declare-fun m!314991 () Bool)

(assert (=> start!30326 m!314991))

(declare-fun m!314993 () Bool)

(assert (=> start!30326 m!314993))

(declare-fun m!314995 () Bool)

(assert (=> b!303677 m!314995))

(declare-fun m!314997 () Bool)

(assert (=> b!303684 m!314997))

(declare-fun m!314999 () Bool)

(assert (=> b!303686 m!314999))

(assert (=> b!303686 m!314999))

(declare-fun m!315001 () Bool)

(assert (=> b!303686 m!315001))

(declare-fun m!315003 () Bool)

(assert (=> b!303685 m!315003))

(push 1)

