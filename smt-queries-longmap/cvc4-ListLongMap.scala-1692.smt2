; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31044 () Bool)

(assert start!31044)

(declare-fun b!312197 () Bool)

(declare-fun res!168654 () Bool)

(declare-fun e!194699 () Bool)

(assert (=> b!312197 (=> (not res!168654) (not e!194699))))

(declare-datatypes ((array!15946 0))(
  ( (array!15947 (arr!7555 (Array (_ BitVec 32) (_ BitVec 64))) (size!7907 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15946)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312197 (= res!168654 (and (= (select (arr!7555 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7907 a!3293))))))

(declare-fun b!312198 () Bool)

(declare-fun res!168653 () Bool)

(declare-fun e!194698 () Bool)

(assert (=> b!312198 (=> (not res!168653) (not e!194698))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15946 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312198 (= res!168653 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312199 () Bool)

(declare-fun e!194697 () Bool)

(declare-fun e!194700 () Bool)

(assert (=> b!312199 (= e!194697 (not e!194700))))

(declare-fun res!168657 () Bool)

(assert (=> b!312199 (=> res!168657 e!194700)))

(declare-datatypes ((SeekEntryResult!2695 0))(
  ( (MissingZero!2695 (index!12956 (_ BitVec 32))) (Found!2695 (index!12957 (_ BitVec 32))) (Intermediate!2695 (undefined!3507 Bool) (index!12958 (_ BitVec 32)) (x!31164 (_ BitVec 32))) (Undefined!2695) (MissingVacant!2695 (index!12959 (_ BitVec 32))) )
))
(declare-fun lt!152836 () SeekEntryResult!2695)

(declare-fun lt!152840 () (_ BitVec 32))

(declare-fun lt!152839 () SeekEntryResult!2695)

(assert (=> b!312199 (= res!168657 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152840 #b00000000000000000000000000000000) (bvsge lt!152840 (size!7907 a!3293)) (not (= lt!152839 lt!152836))))))

(declare-fun lt!152841 () SeekEntryResult!2695)

(declare-fun lt!152835 () SeekEntryResult!2695)

(assert (=> b!312199 (= lt!152841 lt!152835)))

(declare-fun lt!152838 () array!15946)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15946 (_ BitVec 32)) SeekEntryResult!2695)

(assert (=> b!312199 (= lt!152835 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152840 k!2441 lt!152838 mask!3709))))

(assert (=> b!312199 (= lt!152841 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152838 mask!3709))))

(assert (=> b!312199 (= lt!152838 (array!15947 (store (arr!7555 a!3293) i!1240 k!2441) (size!7907 a!3293)))))

(declare-fun lt!152837 () SeekEntryResult!2695)

(assert (=> b!312199 (= lt!152837 lt!152839)))

(assert (=> b!312199 (= lt!152839 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152840 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312199 (= lt!152840 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312200 () Bool)

(assert (=> b!312200 (= e!194698 e!194699)))

(declare-fun res!168658 () Bool)

(assert (=> b!312200 (=> (not res!168658) (not e!194699))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312200 (= res!168658 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152836))))

(assert (=> b!312200 (= lt!152836 (Intermediate!2695 false resIndex!52 resX!52))))

(declare-fun b!312201 () Bool)

(declare-fun res!168651 () Bool)

(assert (=> b!312201 (=> (not res!168651) (not e!194698))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15946 (_ BitVec 32)) SeekEntryResult!2695)

(assert (=> b!312201 (= res!168651 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2695 i!1240)))))

(declare-fun b!312202 () Bool)

(assert (=> b!312202 (= e!194699 e!194697)))

(declare-fun res!168655 () Bool)

(assert (=> b!312202 (=> (not res!168655) (not e!194697))))

(assert (=> b!312202 (= res!168655 (and (= lt!152837 lt!152836) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7555 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312202 (= lt!152837 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!312203 () Bool)

(declare-fun res!168660 () Bool)

(assert (=> b!312203 (=> (not res!168660) (not e!194698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15946 (_ BitVec 32)) Bool)

(assert (=> b!312203 (= res!168660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312205 () Bool)

(assert (=> b!312205 (= e!194700 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110)))))

(assert (=> b!312205 (= lt!152835 lt!152839)))

(declare-datatypes ((Unit!9621 0))(
  ( (Unit!9622) )
))
(declare-fun lt!152834 () Unit!9621)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15946 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9621)

(assert (=> b!312205 (= lt!152834 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152840 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312206 () Bool)

(declare-fun res!168656 () Bool)

(assert (=> b!312206 (=> (not res!168656) (not e!194698))))

(assert (=> b!312206 (= res!168656 (and (= (size!7907 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7907 a!3293))))))

(declare-fun b!312204 () Bool)

(declare-fun res!168652 () Bool)

(assert (=> b!312204 (=> (not res!168652) (not e!194698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312204 (= res!168652 (validKeyInArray!0 k!2441))))

(declare-fun res!168659 () Bool)

(assert (=> start!31044 (=> (not res!168659) (not e!194698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31044 (= res!168659 (validMask!0 mask!3709))))

(assert (=> start!31044 e!194698))

(declare-fun array_inv!5518 (array!15946) Bool)

(assert (=> start!31044 (array_inv!5518 a!3293)))

(assert (=> start!31044 true))

(assert (= (and start!31044 res!168659) b!312206))

(assert (= (and b!312206 res!168656) b!312204))

(assert (= (and b!312204 res!168652) b!312198))

(assert (= (and b!312198 res!168653) b!312201))

(assert (= (and b!312201 res!168651) b!312203))

(assert (= (and b!312203 res!168660) b!312200))

(assert (= (and b!312200 res!168658) b!312197))

(assert (= (and b!312197 res!168654) b!312202))

(assert (= (and b!312202 res!168655) b!312199))

(assert (= (and b!312199 (not res!168657)) b!312205))

(declare-fun m!322249 () Bool)

(assert (=> b!312198 m!322249))

(declare-fun m!322251 () Bool)

(assert (=> b!312201 m!322251))

(declare-fun m!322253 () Bool)

(assert (=> b!312204 m!322253))

(declare-fun m!322255 () Bool)

(assert (=> b!312197 m!322255))

(declare-fun m!322257 () Bool)

(assert (=> b!312199 m!322257))

(declare-fun m!322259 () Bool)

(assert (=> b!312199 m!322259))

(declare-fun m!322261 () Bool)

(assert (=> b!312199 m!322261))

(declare-fun m!322263 () Bool)

(assert (=> b!312199 m!322263))

(declare-fun m!322265 () Bool)

(assert (=> b!312199 m!322265))

(declare-fun m!322267 () Bool)

(assert (=> b!312205 m!322267))

(declare-fun m!322269 () Bool)

(assert (=> b!312203 m!322269))

(declare-fun m!322271 () Bool)

(assert (=> b!312202 m!322271))

(declare-fun m!322273 () Bool)

(assert (=> b!312202 m!322273))

(declare-fun m!322275 () Bool)

(assert (=> start!31044 m!322275))

(declare-fun m!322277 () Bool)

(assert (=> start!31044 m!322277))

(declare-fun m!322279 () Bool)

(assert (=> b!312200 m!322279))

(assert (=> b!312200 m!322279))

(declare-fun m!322281 () Bool)

(assert (=> b!312200 m!322281))

(push 1)

(assert (not b!312202))

(assert (not b!312198))

(assert (not b!312200))

(assert (not b!312203))

(assert (not start!31044))

(assert (not b!312205))

(assert (not b!312204))

(assert (not b!312201))

(assert (not b!312199))

(check-sat)

