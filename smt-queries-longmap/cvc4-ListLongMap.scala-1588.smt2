; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30156 () Bool)

(assert start!30156)

(declare-fun b!301994 () Bool)

(declare-fun res!159603 () Bool)

(declare-fun e!190471 () Bool)

(assert (=> b!301994 (=> (not res!159603) (not e!190471))))

(declare-datatypes ((array!15307 0))(
  ( (array!15308 (arr!7243 (Array (_ BitVec 32) (_ BitVec 64))) (size!7595 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15307)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301994 (= res!159603 (and (= (size!7595 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7595 a!3293))))))

(declare-fun b!301995 () Bool)

(declare-fun res!159608 () Bool)

(assert (=> b!301995 (=> (not res!159608) (not e!190471))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2383 0))(
  ( (MissingZero!2383 (index!11708 (_ BitVec 32))) (Found!2383 (index!11709 (_ BitVec 32))) (Intermediate!2383 (undefined!3195 Bool) (index!11710 (_ BitVec 32)) (x!29978 (_ BitVec 32))) (Undefined!2383) (MissingVacant!2383 (index!11711 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15307 (_ BitVec 32)) SeekEntryResult!2383)

(assert (=> b!301995 (= res!159608 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2383 i!1240)))))

(declare-fun res!159606 () Bool)

(assert (=> start!30156 (=> (not res!159606) (not e!190471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30156 (= res!159606 (validMask!0 mask!3709))))

(assert (=> start!30156 e!190471))

(declare-fun array_inv!5206 (array!15307) Bool)

(assert (=> start!30156 (array_inv!5206 a!3293)))

(assert (=> start!30156 true))

(declare-fun b!301996 () Bool)

(declare-fun res!159609 () Bool)

(assert (=> b!301996 (=> (not res!159609) (not e!190471))))

(declare-fun arrayContainsKey!0 (array!15307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301996 (= res!159609 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301997 () Bool)

(declare-fun res!159605 () Bool)

(assert (=> b!301997 (=> (not res!159605) (not e!190471))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15307 (_ BitVec 32)) SeekEntryResult!2383)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301997 (= res!159605 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) (Intermediate!2383 false resIndex!52 resX!52)))))

(declare-fun b!301998 () Bool)

(declare-fun res!159604 () Bool)

(assert (=> b!301998 (=> (not res!159604) (not e!190471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15307 (_ BitVec 32)) Bool)

(assert (=> b!301998 (= res!159604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301999 () Bool)

(declare-fun res!159607 () Bool)

(assert (=> b!301999 (=> (not res!159607) (not e!190471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301999 (= res!159607 (validKeyInArray!0 k!2441))))

(declare-fun b!302000 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!302000 (= e!190471 (and (= (select (arr!7243 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7595 a!3293)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(assert (= (and start!30156 res!159606) b!301994))

(assert (= (and b!301994 res!159603) b!301999))

(assert (= (and b!301999 res!159607) b!301996))

(assert (= (and b!301996 res!159609) b!301995))

(assert (= (and b!301995 res!159608) b!301998))

(assert (= (and b!301998 res!159604) b!301997))

(assert (= (and b!301997 res!159605) b!302000))

(declare-fun m!313649 () Bool)

(assert (=> b!301997 m!313649))

(assert (=> b!301997 m!313649))

(declare-fun m!313651 () Bool)

(assert (=> b!301997 m!313651))

(declare-fun m!313653 () Bool)

(assert (=> b!302000 m!313653))

(declare-fun m!313655 () Bool)

(assert (=> b!301995 m!313655))

(declare-fun m!313657 () Bool)

(assert (=> start!30156 m!313657))

(declare-fun m!313659 () Bool)

(assert (=> start!30156 m!313659))

(declare-fun m!313661 () Bool)

(assert (=> b!301999 m!313661))

(declare-fun m!313663 () Bool)

(assert (=> b!301996 m!313663))

(declare-fun m!313665 () Bool)

(assert (=> b!301998 m!313665))

(push 1)

(assert (not b!301998))

(assert (not b!301997))

(assert (not b!301999))

(assert (not b!301995))

(assert (not b!301996))

(assert (not start!30156))

(check-sat)

(pop 1)

(push 1)

(check-sat)

