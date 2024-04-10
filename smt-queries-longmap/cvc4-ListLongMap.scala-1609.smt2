; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30330 () Bool)

(assert start!30330)

(declare-fun b!303737 () Bool)

(declare-fun res!161224 () Bool)

(declare-fun e!191056 () Bool)

(assert (=> b!303737 (=> (not res!161224) (not e!191056))))

(declare-datatypes ((array!15436 0))(
  ( (array!15437 (arr!7306 (Array (_ BitVec 32) (_ BitVec 64))) (size!7658 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15436)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2446 0))(
  ( (MissingZero!2446 (index!11960 (_ BitVec 32))) (Found!2446 (index!11961 (_ BitVec 32))) (Intermediate!2446 (undefined!3258 Bool) (index!11962 (_ BitVec 32)) (x!30215 (_ BitVec 32))) (Undefined!2446) (MissingVacant!2446 (index!11963 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15436 (_ BitVec 32)) SeekEntryResult!2446)

(assert (=> b!303737 (= res!161224 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2446 i!1240)))))

(declare-fun b!303738 () Bool)

(declare-fun e!191055 () Bool)

(assert (=> b!303738 (= e!191056 e!191055)))

(declare-fun res!161229 () Bool)

(assert (=> b!303738 (=> (not res!161229) (not e!191055))))

(declare-fun lt!150249 () SeekEntryResult!2446)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15436 (_ BitVec 32)) SeekEntryResult!2446)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303738 (= res!161229 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150249))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303738 (= lt!150249 (Intermediate!2446 false resIndex!52 resX!52))))

(declare-fun res!161230 () Bool)

(assert (=> start!30330 (=> (not res!161230) (not e!191056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30330 (= res!161230 (validMask!0 mask!3709))))

(assert (=> start!30330 e!191056))

(declare-fun array_inv!5269 (array!15436) Bool)

(assert (=> start!30330 (array_inv!5269 a!3293)))

(assert (=> start!30330 true))

(declare-fun b!303739 () Bool)

(declare-fun res!161225 () Bool)

(assert (=> b!303739 (=> (not res!161225) (not e!191055))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303739 (= res!161225 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7306 a!3293) index!1781) k!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7306 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7306 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303740 () Bool)

(declare-fun res!161226 () Bool)

(assert (=> b!303740 (=> (not res!161226) (not e!191056))))

(assert (=> b!303740 (= res!161226 (and (= (size!7658 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7658 a!3293))))))

(declare-fun b!303741 () Bool)

(declare-fun res!161228 () Bool)

(assert (=> b!303741 (=> (not res!161228) (not e!191055))))

(assert (=> b!303741 (= res!161228 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150249))))

(declare-fun b!303742 () Bool)

(declare-fun res!161223 () Bool)

(assert (=> b!303742 (=> (not res!161223) (not e!191056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303742 (= res!161223 (validKeyInArray!0 k!2441))))

(declare-fun b!303743 () Bool)

(assert (=> b!303743 (= e!191055 false)))

(declare-fun lt!150248 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303743 (= lt!150248 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!303744 () Bool)

(declare-fun res!161232 () Bool)

(assert (=> b!303744 (=> (not res!161232) (not e!191056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15436 (_ BitVec 32)) Bool)

(assert (=> b!303744 (= res!161232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303745 () Bool)

(declare-fun res!161231 () Bool)

(assert (=> b!303745 (=> (not res!161231) (not e!191055))))

(assert (=> b!303745 (= res!161231 (and (= (select (arr!7306 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7658 a!3293))))))

(declare-fun b!303746 () Bool)

(declare-fun res!161227 () Bool)

(assert (=> b!303746 (=> (not res!161227) (not e!191056))))

(declare-fun arrayContainsKey!0 (array!15436 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303746 (= res!161227 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30330 res!161230) b!303740))

(assert (= (and b!303740 res!161226) b!303742))

(assert (= (and b!303742 res!161223) b!303746))

(assert (= (and b!303746 res!161227) b!303737))

(assert (= (and b!303737 res!161224) b!303744))

(assert (= (and b!303744 res!161232) b!303738))

(assert (= (and b!303738 res!161229) b!303745))

(assert (= (and b!303745 res!161231) b!303741))

(assert (= (and b!303741 res!161228) b!303739))

(assert (= (and b!303739 res!161225) b!303743))

(declare-fun m!315029 () Bool)

(assert (=> b!303742 m!315029))

(declare-fun m!315031 () Bool)

(assert (=> b!303737 m!315031))

(declare-fun m!315033 () Bool)

(assert (=> b!303744 m!315033))

(declare-fun m!315035 () Bool)

(assert (=> start!30330 m!315035))

(declare-fun m!315037 () Bool)

(assert (=> start!30330 m!315037))

(declare-fun m!315039 () Bool)

(assert (=> b!303746 m!315039))

(declare-fun m!315041 () Bool)

(assert (=> b!303741 m!315041))

(declare-fun m!315043 () Bool)

(assert (=> b!303745 m!315043))

(declare-fun m!315045 () Bool)

(assert (=> b!303738 m!315045))

(assert (=> b!303738 m!315045))

(declare-fun m!315047 () Bool)

(assert (=> b!303738 m!315047))

(declare-fun m!315049 () Bool)

(assert (=> b!303743 m!315049))

(declare-fun m!315051 () Bool)

(assert (=> b!303739 m!315051))

(push 1)

(assert (not b!303746))

(assert (not b!303744))

(assert (not b!303743))

(assert (not b!303737))

(assert (not start!30330))

(assert (not b!303741))

