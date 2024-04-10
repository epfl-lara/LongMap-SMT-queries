; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31934 () Bool)

(assert start!31934)

(declare-fun b!319139 () Bool)

(declare-fun res!173525 () Bool)

(declare-fun e!198247 () Bool)

(assert (=> b!319139 (=> (not res!173525) (not e!198247))))

(declare-datatypes ((array!16254 0))(
  ( (array!16255 (arr!7691 (Array (_ BitVec 32) (_ BitVec 64))) (size!8043 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16254)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2831 0))(
  ( (MissingZero!2831 (index!13500 (_ BitVec 32))) (Found!2831 (index!13501 (_ BitVec 32))) (Intermediate!2831 (undefined!3643 Bool) (index!13502 (_ BitVec 32)) (x!31761 (_ BitVec 32))) (Undefined!2831) (MissingVacant!2831 (index!13503 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16254 (_ BitVec 32)) SeekEntryResult!2831)

(assert (=> b!319139 (= res!173525 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2831 i!1240)))))

(declare-fun b!319140 () Bool)

(declare-fun e!198246 () Bool)

(assert (=> b!319140 (= e!198247 e!198246)))

(declare-fun res!173524 () Bool)

(assert (=> b!319140 (=> (not res!173524) (not e!198246))))

(declare-fun lt!155662 () SeekEntryResult!2831)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16254 (_ BitVec 32)) SeekEntryResult!2831)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319140 (= res!173524 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155662))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!319140 (= lt!155662 (Intermediate!2831 false resIndex!52 resX!52))))

(declare-fun b!319142 () Bool)

(declare-fun res!173528 () Bool)

(assert (=> b!319142 (=> (not res!173528) (not e!198247))))

(assert (=> b!319142 (= res!173528 (and (= (size!8043 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8043 a!3293))))))

(declare-fun b!319143 () Bool)

(declare-fun res!173530 () Bool)

(assert (=> b!319143 (=> (not res!173530) (not e!198247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319143 (= res!173530 (validKeyInArray!0 k!2441))))

(declare-fun b!319144 () Bool)

(declare-fun e!198244 () Bool)

(assert (=> b!319144 (= e!198244 true)))

(declare-fun lt!155666 () SeekEntryResult!2831)

(declare-fun lt!155665 () SeekEntryResult!2831)

(assert (=> b!319144 (= lt!155666 lt!155665)))

(declare-datatypes ((Unit!9800 0))(
  ( (Unit!9801) )
))
(declare-fun lt!155664 () Unit!9800)

(declare-fun lt!155663 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!16254 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9800)

(assert (=> b!319144 (= lt!155664 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!155663 resIndex!52 resX!52 mask!3709))))

(declare-fun b!319145 () Bool)

(declare-fun res!173531 () Bool)

(assert (=> b!319145 (=> (not res!173531) (not e!198247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16254 (_ BitVec 32)) Bool)

(assert (=> b!319145 (= res!173531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!319146 () Bool)

(declare-fun e!198245 () Bool)

(assert (=> b!319146 (= e!198246 e!198245)))

(declare-fun res!173523 () Bool)

(assert (=> b!319146 (=> (not res!173523) (not e!198245))))

(declare-fun lt!155660 () SeekEntryResult!2831)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!319146 (= res!173523 (and (= lt!155660 lt!155662) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7691 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!319146 (= lt!155660 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!319147 () Bool)

(declare-fun res!173526 () Bool)

(assert (=> b!319147 (=> (not res!173526) (not e!198247))))

(declare-fun arrayContainsKey!0 (array!16254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319147 (= res!173526 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!319148 () Bool)

(declare-fun res!173529 () Bool)

(assert (=> b!319148 (=> (not res!173529) (not e!198246))))

(assert (=> b!319148 (= res!173529 (and (= (select (arr!7691 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8043 a!3293))))))

(declare-fun res!173532 () Bool)

(assert (=> start!31934 (=> (not res!173532) (not e!198247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31934 (= res!173532 (validMask!0 mask!3709))))

(assert (=> start!31934 e!198247))

(declare-fun array_inv!5654 (array!16254) Bool)

(assert (=> start!31934 (array_inv!5654 a!3293)))

(assert (=> start!31934 true))

(declare-fun b!319141 () Bool)

(assert (=> b!319141 (= e!198245 (not e!198244))))

(declare-fun res!173527 () Bool)

(assert (=> b!319141 (=> res!173527 e!198244)))

(assert (=> b!319141 (= res!173527 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155663 #b00000000000000000000000000000000) (bvsge lt!155663 (size!8043 a!3293)) (not (= lt!155665 lt!155662))))))

(declare-fun lt!155661 () SeekEntryResult!2831)

(assert (=> b!319141 (= lt!155661 lt!155666)))

(declare-fun lt!155667 () array!16254)

(assert (=> b!319141 (= lt!155666 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155663 k!2441 lt!155667 mask!3709))))

(assert (=> b!319141 (= lt!155661 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155667 mask!3709))))

(assert (=> b!319141 (= lt!155667 (array!16255 (store (arr!7691 a!3293) i!1240 k!2441) (size!8043 a!3293)))))

(assert (=> b!319141 (= lt!155660 lt!155665)))

(assert (=> b!319141 (= lt!155665 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155663 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319141 (= lt!155663 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!31934 res!173532) b!319142))

(assert (= (and b!319142 res!173528) b!319143))

(assert (= (and b!319143 res!173530) b!319147))

(assert (= (and b!319147 res!173526) b!319139))

(assert (= (and b!319139 res!173525) b!319145))

(assert (= (and b!319145 res!173531) b!319140))

(assert (= (and b!319140 res!173524) b!319148))

(assert (= (and b!319148 res!173529) b!319146))

(assert (= (and b!319146 res!173523) b!319141))

(assert (= (and b!319141 (not res!173527)) b!319144))

(declare-fun m!327743 () Bool)

(assert (=> b!319140 m!327743))

(assert (=> b!319140 m!327743))

(declare-fun m!327745 () Bool)

(assert (=> b!319140 m!327745))

(declare-fun m!327747 () Bool)

(assert (=> b!319146 m!327747))

(declare-fun m!327749 () Bool)

(assert (=> b!319146 m!327749))

(declare-fun m!327751 () Bool)

(assert (=> b!319143 m!327751))

(declare-fun m!327753 () Bool)

(assert (=> b!319147 m!327753))

(declare-fun m!327755 () Bool)

(assert (=> start!31934 m!327755))

(declare-fun m!327757 () Bool)

(assert (=> start!31934 m!327757))

(declare-fun m!327759 () Bool)

(assert (=> b!319139 m!327759))

(declare-fun m!327761 () Bool)

(assert (=> b!319141 m!327761))

(declare-fun m!327763 () Bool)

(assert (=> b!319141 m!327763))

(declare-fun m!327765 () Bool)

(assert (=> b!319141 m!327765))

(declare-fun m!327767 () Bool)

(assert (=> b!319141 m!327767))

(declare-fun m!327769 () Bool)

(assert (=> b!319141 m!327769))

(declare-fun m!327771 () Bool)

(assert (=> b!319148 m!327771))

(declare-fun m!327773 () Bool)

(assert (=> b!319145 m!327773))

(declare-fun m!327775 () Bool)

(assert (=> b!319144 m!327775))

(push 1)

