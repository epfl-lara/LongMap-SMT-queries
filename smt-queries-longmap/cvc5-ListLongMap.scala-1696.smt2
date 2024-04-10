; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31064 () Bool)

(assert start!31064)

(declare-fun b!312497 () Bool)

(declare-fun res!168956 () Bool)

(declare-fun e!194848 () Bool)

(assert (=> b!312497 (=> (not res!168956) (not e!194848))))

(declare-datatypes ((array!15966 0))(
  ( (array!15967 (arr!7565 (Array (_ BitVec 32) (_ BitVec 64))) (size!7917 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15966)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312497 (= res!168956 (and (= (select (arr!7565 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7917 a!3293))))))

(declare-fun b!312498 () Bool)

(declare-fun res!168951 () Bool)

(declare-fun e!194849 () Bool)

(assert (=> b!312498 (=> (not res!168951) (not e!194849))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312498 (= res!168951 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312499 () Bool)

(declare-fun e!194847 () Bool)

(declare-fun e!194851 () Bool)

(assert (=> b!312499 (= e!194847 (not e!194851))))

(declare-fun res!168960 () Bool)

(assert (=> b!312499 (=> res!168960 e!194851)))

(declare-datatypes ((SeekEntryResult!2705 0))(
  ( (MissingZero!2705 (index!12996 (_ BitVec 32))) (Found!2705 (index!12997 (_ BitVec 32))) (Intermediate!2705 (undefined!3517 Bool) (index!12998 (_ BitVec 32)) (x!31206 (_ BitVec 32))) (Undefined!2705) (MissingVacant!2705 (index!12999 (_ BitVec 32))) )
))
(declare-fun lt!153075 () SeekEntryResult!2705)

(declare-fun lt!153074 () (_ BitVec 32))

(declare-fun lt!153078 () SeekEntryResult!2705)

(assert (=> b!312499 (= res!168960 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153074 #b00000000000000000000000000000000) (bvsge lt!153074 (size!7917 a!3293)) (not (= lt!153075 lt!153078))))))

(declare-fun lt!153080 () SeekEntryResult!2705)

(declare-fun lt!153076 () SeekEntryResult!2705)

(assert (=> b!312499 (= lt!153080 lt!153076)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!153077 () array!15966)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15966 (_ BitVec 32)) SeekEntryResult!2705)

(assert (=> b!312499 (= lt!153076 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153074 k!2441 lt!153077 mask!3709))))

(assert (=> b!312499 (= lt!153080 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!153077 mask!3709))))

(assert (=> b!312499 (= lt!153077 (array!15967 (store (arr!7565 a!3293) i!1240 k!2441) (size!7917 a!3293)))))

(declare-fun lt!153081 () SeekEntryResult!2705)

(assert (=> b!312499 (= lt!153081 lt!153075)))

(assert (=> b!312499 (= lt!153075 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153074 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312499 (= lt!153074 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!168954 () Bool)

(assert (=> start!31064 (=> (not res!168954) (not e!194849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31064 (= res!168954 (validMask!0 mask!3709))))

(assert (=> start!31064 e!194849))

(declare-fun array_inv!5528 (array!15966) Bool)

(assert (=> start!31064 (array_inv!5528 a!3293)))

(assert (=> start!31064 true))

(declare-fun b!312500 () Bool)

(declare-fun res!168958 () Bool)

(assert (=> b!312500 (=> (not res!168958) (not e!194849))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15966 (_ BitVec 32)) SeekEntryResult!2705)

(assert (=> b!312500 (= res!168958 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2705 i!1240)))))

(declare-fun b!312501 () Bool)

(declare-fun res!168957 () Bool)

(assert (=> b!312501 (=> (not res!168957) (not e!194849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312501 (= res!168957 (validKeyInArray!0 k!2441))))

(declare-fun b!312502 () Bool)

(declare-fun res!168952 () Bool)

(assert (=> b!312502 (=> (not res!168952) (not e!194849))))

(assert (=> b!312502 (= res!168952 (and (= (size!7917 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7917 a!3293))))))

(declare-fun b!312503 () Bool)

(declare-fun res!168959 () Bool)

(assert (=> b!312503 (=> (not res!168959) (not e!194849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15966 (_ BitVec 32)) Bool)

(assert (=> b!312503 (= res!168959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312504 () Bool)

(assert (=> b!312504 (= e!194851 true)))

(assert (=> b!312504 (= lt!153076 lt!153075)))

(declare-datatypes ((Unit!9641 0))(
  ( (Unit!9642) )
))
(declare-fun lt!153079 () Unit!9641)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15966 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9641)

(assert (=> b!312504 (= lt!153079 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153074 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312505 () Bool)

(assert (=> b!312505 (= e!194849 e!194848)))

(declare-fun res!168953 () Bool)

(assert (=> b!312505 (=> (not res!168953) (not e!194848))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312505 (= res!168953 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153078))))

(assert (=> b!312505 (= lt!153078 (Intermediate!2705 false resIndex!52 resX!52))))

(declare-fun b!312506 () Bool)

(assert (=> b!312506 (= e!194848 e!194847)))

(declare-fun res!168955 () Bool)

(assert (=> b!312506 (=> (not res!168955) (not e!194847))))

(assert (=> b!312506 (= res!168955 (and (= lt!153081 lt!153078) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7565 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!312506 (= lt!153081 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(assert (= (and start!31064 res!168954) b!312502))

(assert (= (and b!312502 res!168952) b!312501))

(assert (= (and b!312501 res!168957) b!312498))

(assert (= (and b!312498 res!168951) b!312500))

(assert (= (and b!312500 res!168958) b!312503))

(assert (= (and b!312503 res!168959) b!312505))

(assert (= (and b!312505 res!168953) b!312497))

(assert (= (and b!312497 res!168956) b!312506))

(assert (= (and b!312506 res!168955) b!312499))

(assert (= (and b!312499 (not res!168960)) b!312504))

(declare-fun m!322589 () Bool)

(assert (=> b!312497 m!322589))

(declare-fun m!322591 () Bool)

(assert (=> b!312500 m!322591))

(declare-fun m!322593 () Bool)

(assert (=> b!312503 m!322593))

(declare-fun m!322595 () Bool)

(assert (=> start!31064 m!322595))

(declare-fun m!322597 () Bool)

(assert (=> start!31064 m!322597))

(declare-fun m!322599 () Bool)

(assert (=> b!312499 m!322599))

(declare-fun m!322601 () Bool)

(assert (=> b!312499 m!322601))

(declare-fun m!322603 () Bool)

(assert (=> b!312499 m!322603))

(declare-fun m!322605 () Bool)

(assert (=> b!312499 m!322605))

(declare-fun m!322607 () Bool)

(assert (=> b!312499 m!322607))

(declare-fun m!322609 () Bool)

(assert (=> b!312505 m!322609))

(assert (=> b!312505 m!322609))

(declare-fun m!322611 () Bool)

(assert (=> b!312505 m!322611))

(declare-fun m!322613 () Bool)

(assert (=> b!312501 m!322613))

(declare-fun m!322615 () Bool)

(assert (=> b!312504 m!322615))

(declare-fun m!322617 () Bool)

(assert (=> b!312498 m!322617))

(declare-fun m!322619 () Bool)

(assert (=> b!312506 m!322619))

(declare-fun m!322621 () Bool)

(assert (=> b!312506 m!322621))

(push 1)

