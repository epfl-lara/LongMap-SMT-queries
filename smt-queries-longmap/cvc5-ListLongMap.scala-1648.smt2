; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30668 () Bool)

(assert start!30668)

(declare-fun b!307862 () Bool)

(declare-fun res!164625 () Bool)

(declare-fun e!192638 () Bool)

(assert (=> b!307862 (=> (not res!164625) (not e!192638))))

(declare-datatypes ((array!15672 0))(
  ( (array!15673 (arr!7421 (Array (_ BitVec 32) (_ BitVec 64))) (size!7773 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15672)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307862 (= res!164625 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307863 () Bool)

(declare-fun res!164624 () Bool)

(assert (=> b!307863 (=> (not res!164624) (not e!192638))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15672 (_ BitVec 32)) Bool)

(assert (=> b!307863 (= res!164624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307864 () Bool)

(declare-fun e!192639 () Bool)

(assert (=> b!307864 (= e!192639 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!151190 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307864 (= lt!151190 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!307865 () Bool)

(declare-fun res!164620 () Bool)

(assert (=> b!307865 (=> (not res!164620) (not e!192639))))

(declare-datatypes ((SeekEntryResult!2561 0))(
  ( (MissingZero!2561 (index!12420 (_ BitVec 32))) (Found!2561 (index!12421 (_ BitVec 32))) (Intermediate!2561 (undefined!3373 Bool) (index!12422 (_ BitVec 32)) (x!30660 (_ BitVec 32))) (Undefined!2561) (MissingVacant!2561 (index!12423 (_ BitVec 32))) )
))
(declare-fun lt!151191 () SeekEntryResult!2561)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15672 (_ BitVec 32)) SeekEntryResult!2561)

(assert (=> b!307865 (= res!164620 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151191))))

(declare-fun b!307866 () Bool)

(declare-fun res!164623 () Bool)

(assert (=> b!307866 (=> (not res!164623) (not e!192638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307866 (= res!164623 (validKeyInArray!0 k!2441))))

(declare-fun b!307867 () Bool)

(declare-fun res!164621 () Bool)

(assert (=> b!307867 (=> (not res!164621) (not e!192638))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15672 (_ BitVec 32)) SeekEntryResult!2561)

(assert (=> b!307867 (= res!164621 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2561 i!1240)))))

(declare-fun b!307868 () Bool)

(assert (=> b!307868 (= e!192638 e!192639)))

(declare-fun res!164619 () Bool)

(assert (=> b!307868 (=> (not res!164619) (not e!192639))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307868 (= res!164619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151191))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307868 (= lt!151191 (Intermediate!2561 false resIndex!52 resX!52))))

(declare-fun b!307869 () Bool)

(declare-fun res!164617 () Bool)

(assert (=> b!307869 (=> (not res!164617) (not e!192639))))

(assert (=> b!307869 (= res!164617 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7421 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun res!164618 () Bool)

(assert (=> start!30668 (=> (not res!164618) (not e!192638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30668 (= res!164618 (validMask!0 mask!3709))))

(assert (=> start!30668 e!192638))

(declare-fun array_inv!5384 (array!15672) Bool)

(assert (=> start!30668 (array_inv!5384 a!3293)))

(assert (=> start!30668 true))

(declare-fun b!307870 () Bool)

(declare-fun res!164622 () Bool)

(assert (=> b!307870 (=> (not res!164622) (not e!192639))))

(assert (=> b!307870 (= res!164622 (and (= (select (arr!7421 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7773 a!3293))))))

(declare-fun b!307871 () Bool)

(declare-fun res!164616 () Bool)

(assert (=> b!307871 (=> (not res!164616) (not e!192638))))

(assert (=> b!307871 (= res!164616 (and (= (size!7773 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7773 a!3293))))))

(assert (= (and start!30668 res!164618) b!307871))

(assert (= (and b!307871 res!164616) b!307866))

(assert (= (and b!307866 res!164623) b!307862))

(assert (= (and b!307862 res!164625) b!307867))

(assert (= (and b!307867 res!164621) b!307863))

(assert (= (and b!307863 res!164624) b!307868))

(assert (= (and b!307868 res!164619) b!307870))

(assert (= (and b!307870 res!164622) b!307865))

(assert (= (and b!307865 res!164620) b!307869))

(assert (= (and b!307869 res!164617) b!307864))

(declare-fun m!318089 () Bool)

(assert (=> b!307863 m!318089))

(declare-fun m!318091 () Bool)

(assert (=> b!307870 m!318091))

(declare-fun m!318093 () Bool)

(assert (=> b!307866 m!318093))

(declare-fun m!318095 () Bool)

(assert (=> b!307869 m!318095))

(declare-fun m!318097 () Bool)

(assert (=> b!307862 m!318097))

(declare-fun m!318099 () Bool)

(assert (=> b!307868 m!318099))

(assert (=> b!307868 m!318099))

(declare-fun m!318101 () Bool)

(assert (=> b!307868 m!318101))

(declare-fun m!318103 () Bool)

(assert (=> b!307867 m!318103))

(declare-fun m!318105 () Bool)

(assert (=> b!307865 m!318105))

(declare-fun m!318107 () Bool)

(assert (=> start!30668 m!318107))

(declare-fun m!318109 () Bool)

(assert (=> start!30668 m!318109))

(declare-fun m!318111 () Bool)

(assert (=> b!307864 m!318111))

(push 1)

