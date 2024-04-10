; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30332 () Bool)

(assert start!30332)

(declare-fun b!303767 () Bool)

(declare-fun res!161260 () Bool)

(declare-fun e!191065 () Bool)

(assert (=> b!303767 (=> (not res!161260) (not e!191065))))

(declare-datatypes ((array!15438 0))(
  ( (array!15439 (arr!7307 (Array (_ BitVec 32) (_ BitVec 64))) (size!7659 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15438)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15438 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303767 (= res!161260 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303768 () Bool)

(declare-fun res!161258 () Bool)

(declare-fun e!191063 () Bool)

(assert (=> b!303768 (=> (not res!161258) (not e!191063))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303768 (= res!161258 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7307 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7307 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7307 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303769 () Bool)

(declare-fun res!161259 () Bool)

(assert (=> b!303769 (=> (not res!161259) (not e!191065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303769 (= res!161259 (validKeyInArray!0 k!2441))))

(declare-fun b!303770 () Bool)

(declare-fun res!161254 () Bool)

(assert (=> b!303770 (=> (not res!161254) (not e!191063))))

(declare-datatypes ((SeekEntryResult!2447 0))(
  ( (MissingZero!2447 (index!11964 (_ BitVec 32))) (Found!2447 (index!11965 (_ BitVec 32))) (Intermediate!2447 (undefined!3259 Bool) (index!11966 (_ BitVec 32)) (x!30224 (_ BitVec 32))) (Undefined!2447) (MissingVacant!2447 (index!11967 (_ BitVec 32))) )
))
(declare-fun lt!150255 () SeekEntryResult!2447)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15438 (_ BitVec 32)) SeekEntryResult!2447)

(assert (=> b!303770 (= res!161254 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150255))))

(declare-fun b!303771 () Bool)

(declare-fun res!161256 () Bool)

(assert (=> b!303771 (=> (not res!161256) (not e!191065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15438 (_ BitVec 32)) Bool)

(assert (=> b!303771 (= res!161256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!161261 () Bool)

(assert (=> start!30332 (=> (not res!161261) (not e!191065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30332 (= res!161261 (validMask!0 mask!3709))))

(assert (=> start!30332 e!191065))

(declare-fun array_inv!5270 (array!15438) Bool)

(assert (=> start!30332 (array_inv!5270 a!3293)))

(assert (=> start!30332 true))

(declare-fun b!303772 () Bool)

(assert (=> b!303772 (= e!191063 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!150254 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303772 (= lt!150254 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!303773 () Bool)

(declare-fun res!161262 () Bool)

(assert (=> b!303773 (=> (not res!161262) (not e!191065))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303773 (= res!161262 (and (= (size!7659 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7659 a!3293))))))

(declare-fun b!303774 () Bool)

(assert (=> b!303774 (= e!191065 e!191063)))

(declare-fun res!161257 () Bool)

(assert (=> b!303774 (=> (not res!161257) (not e!191063))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303774 (= res!161257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150255))))

(assert (=> b!303774 (= lt!150255 (Intermediate!2447 false resIndex!52 resX!52))))

(declare-fun b!303775 () Bool)

(declare-fun res!161255 () Bool)

(assert (=> b!303775 (=> (not res!161255) (not e!191065))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15438 (_ BitVec 32)) SeekEntryResult!2447)

(assert (=> b!303775 (= res!161255 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2447 i!1240)))))

(declare-fun b!303776 () Bool)

(declare-fun res!161253 () Bool)

(assert (=> b!303776 (=> (not res!161253) (not e!191063))))

(assert (=> b!303776 (= res!161253 (and (= (select (arr!7307 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7659 a!3293))))))

(assert (= (and start!30332 res!161261) b!303773))

(assert (= (and b!303773 res!161262) b!303769))

(assert (= (and b!303769 res!161259) b!303767))

(assert (= (and b!303767 res!161260) b!303775))

(assert (= (and b!303775 res!161255) b!303771))

(assert (= (and b!303771 res!161256) b!303774))

(assert (= (and b!303774 res!161257) b!303776))

(assert (= (and b!303776 res!161253) b!303770))

(assert (= (and b!303770 res!161254) b!303768))

(assert (= (and b!303768 res!161258) b!303772))

(declare-fun m!315053 () Bool)

(assert (=> b!303776 m!315053))

(declare-fun m!315055 () Bool)

(assert (=> b!303768 m!315055))

(declare-fun m!315057 () Bool)

(assert (=> b!303767 m!315057))

(declare-fun m!315059 () Bool)

(assert (=> b!303774 m!315059))

(assert (=> b!303774 m!315059))

(declare-fun m!315061 () Bool)

(assert (=> b!303774 m!315061))

(declare-fun m!315063 () Bool)

(assert (=> start!30332 m!315063))

(declare-fun m!315065 () Bool)

(assert (=> start!30332 m!315065))

(declare-fun m!315067 () Bool)

(assert (=> b!303775 m!315067))

(declare-fun m!315069 () Bool)

(assert (=> b!303769 m!315069))

(declare-fun m!315071 () Bool)

(assert (=> b!303770 m!315071))

(declare-fun m!315073 () Bool)

(assert (=> b!303771 m!315073))

(declare-fun m!315075 () Bool)

(assert (=> b!303772 m!315075))

(push 1)

