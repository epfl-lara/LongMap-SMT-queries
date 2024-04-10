; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30800 () Bool)

(assert start!30800)

(declare-fun b!309175 () Bool)

(declare-fun res!165793 () Bool)

(declare-fun e!193196 () Bool)

(assert (=> b!309175 (=> (not res!165793) (not e!193196))))

(declare-datatypes ((array!15753 0))(
  ( (array!15754 (arr!7460 (Array (_ BitVec 32) (_ BitVec 64))) (size!7812 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15753)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15753 (_ BitVec 32)) Bool)

(assert (=> b!309175 (= res!165793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309176 () Bool)

(declare-fun e!193198 () Bool)

(assert (=> b!309176 (= e!193196 e!193198)))

(declare-fun res!165795 () Bool)

(assert (=> b!309176 (=> (not res!165795) (not e!193198))))

(declare-datatypes ((SeekEntryResult!2600 0))(
  ( (MissingZero!2600 (index!12576 (_ BitVec 32))) (Found!2600 (index!12577 (_ BitVec 32))) (Intermediate!2600 (undefined!3412 Bool) (index!12578 (_ BitVec 32)) (x!30812 (_ BitVec 32))) (Undefined!2600) (MissingVacant!2600 (index!12579 (_ BitVec 32))) )
))
(declare-fun lt!151530 () SeekEntryResult!2600)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15753 (_ BitVec 32)) SeekEntryResult!2600)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309176 (= res!165795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151530))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309176 (= lt!151530 (Intermediate!2600 false resIndex!52 resX!52))))

(declare-fun b!309177 () Bool)

(declare-fun res!165791 () Bool)

(assert (=> b!309177 (=> (not res!165791) (not e!193196))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15753 (_ BitVec 32)) SeekEntryResult!2600)

(assert (=> b!309177 (= res!165791 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2600 i!1240)))))

(declare-fun b!309178 () Bool)

(declare-fun res!165792 () Bool)

(assert (=> b!309178 (=> (not res!165792) (not e!193198))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309178 (= res!165792 (and (= (select (arr!7460 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7812 a!3293))))))

(declare-fun b!309179 () Bool)

(declare-fun res!165789 () Bool)

(assert (=> b!309179 (=> (not res!165789) (not e!193196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309179 (= res!165789 (validKeyInArray!0 k!2441))))

(declare-fun b!309180 () Bool)

(declare-fun res!165790 () Bool)

(assert (=> b!309180 (=> (not res!165790) (not e!193196))))

(declare-fun arrayContainsKey!0 (array!15753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309180 (= res!165790 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309181 () Bool)

(declare-fun e!193197 () Bool)

(assert (=> b!309181 (= e!193198 e!193197)))

(declare-fun res!165788 () Bool)

(assert (=> b!309181 (=> (not res!165788) (not e!193197))))

(declare-fun lt!151529 () SeekEntryResult!2600)

(assert (=> b!309181 (= res!165788 (and (= lt!151529 lt!151530) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7460 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309181 (= lt!151529 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309182 () Bool)

(declare-fun res!165787 () Bool)

(assert (=> b!309182 (=> (not res!165787) (not e!193196))))

(assert (=> b!309182 (= res!165787 (and (= (size!7812 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7812 a!3293))))))

(declare-fun b!309174 () Bool)

(assert (=> b!309174 (= e!193197 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309174 (= lt!151529 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun res!165794 () Bool)

(assert (=> start!30800 (=> (not res!165794) (not e!193196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30800 (= res!165794 (validMask!0 mask!3709))))

(assert (=> start!30800 e!193196))

(declare-fun array_inv!5423 (array!15753) Bool)

(assert (=> start!30800 (array_inv!5423 a!3293)))

(assert (=> start!30800 true))

(assert (= (and start!30800 res!165794) b!309182))

(assert (= (and b!309182 res!165787) b!309179))

(assert (= (and b!309179 res!165789) b!309180))

(assert (= (and b!309180 res!165790) b!309177))

(assert (= (and b!309177 res!165791) b!309175))

(assert (= (and b!309175 res!165793) b!309176))

(assert (= (and b!309176 res!165795) b!309178))

(assert (= (and b!309178 res!165792) b!309181))

(assert (= (and b!309181 res!165788) b!309174))

(declare-fun m!319187 () Bool)

(assert (=> b!309180 m!319187))

(declare-fun m!319189 () Bool)

(assert (=> b!309179 m!319189))

(declare-fun m!319191 () Bool)

(assert (=> b!309174 m!319191))

(assert (=> b!309174 m!319191))

(declare-fun m!319193 () Bool)

(assert (=> b!309174 m!319193))

(declare-fun m!319195 () Bool)

(assert (=> b!309175 m!319195))

(declare-fun m!319197 () Bool)

(assert (=> b!309176 m!319197))

(assert (=> b!309176 m!319197))

(declare-fun m!319199 () Bool)

(assert (=> b!309176 m!319199))

(declare-fun m!319201 () Bool)

(assert (=> b!309178 m!319201))

(declare-fun m!319203 () Bool)

(assert (=> b!309181 m!319203))

(declare-fun m!319205 () Bool)

(assert (=> b!309181 m!319205))

(declare-fun m!319207 () Bool)

(assert (=> b!309177 m!319207))

(declare-fun m!319209 () Bool)

(assert (=> start!30800 m!319209))

(declare-fun m!319211 () Bool)

(assert (=> start!30800 m!319211))

(push 1)

(assert (not b!309174))

(assert (not b!309180))

(assert (not b!309177))

(assert (not b!309179))

(assert (not b!309176))

(assert (not b!309181))

(assert (not start!30800))

(assert (not b!309175))

(check-sat)

(pop 1)

(push 1)

(check-sat)

