; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31070 () Bool)

(assert start!31070)

(declare-fun b!312587 () Bool)

(declare-fun e!194894 () Bool)

(declare-fun e!194896 () Bool)

(assert (=> b!312587 (= e!194894 e!194896)))

(declare-fun res!169041 () Bool)

(assert (=> b!312587 (=> (not res!169041) (not e!194896))))

(declare-datatypes ((array!15972 0))(
  ( (array!15973 (arr!7568 (Array (_ BitVec 32) (_ BitVec 64))) (size!7920 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15972)

(declare-datatypes ((SeekEntryResult!2708 0))(
  ( (MissingZero!2708 (index!13008 (_ BitVec 32))) (Found!2708 (index!13009 (_ BitVec 32))) (Intermediate!2708 (undefined!3520 Bool) (index!13010 (_ BitVec 32)) (x!31217 (_ BitVec 32))) (Undefined!2708) (MissingVacant!2708 (index!13011 (_ BitVec 32))) )
))
(declare-fun lt!153148 () SeekEntryResult!2708)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!153146 () SeekEntryResult!2708)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312587 (= res!169041 (and (= lt!153148 lt!153146) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7568 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15972 (_ BitVec 32)) SeekEntryResult!2708)

(assert (=> b!312587 (= lt!153148 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!312588 () Bool)

(declare-fun res!169050 () Bool)

(assert (=> b!312588 (=> (not res!169050) (not e!194894))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312588 (= res!169050 (and (= (select (arr!7568 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7920 a!3293))))))

(declare-fun b!312589 () Bool)

(declare-fun res!169044 () Bool)

(declare-fun e!194893 () Bool)

(assert (=> b!312589 (=> (not res!169044) (not e!194893))))

(assert (=> b!312589 (= res!169044 (and (= (size!7920 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7920 a!3293))))))

(declare-fun b!312590 () Bool)

(declare-fun res!169047 () Bool)

(assert (=> b!312590 (=> (not res!169047) (not e!194893))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15972 (_ BitVec 32)) SeekEntryResult!2708)

(assert (=> b!312590 (= res!169047 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2708 i!1240)))))

(declare-fun b!312591 () Bool)

(declare-fun e!194895 () Bool)

(assert (=> b!312591 (= e!194895 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun lt!153153 () SeekEntryResult!2708)

(declare-fun lt!153150 () SeekEntryResult!2708)

(assert (=> b!312591 (= lt!153153 lt!153150)))

(declare-fun lt!153149 () (_ BitVec 32))

(declare-datatypes ((Unit!9647 0))(
  ( (Unit!9648) )
))
(declare-fun lt!153152 () Unit!9647)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15972 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9647)

(assert (=> b!312591 (= lt!153152 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153149 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312592 () Bool)

(assert (=> b!312592 (= e!194893 e!194894)))

(declare-fun res!169049 () Bool)

(assert (=> b!312592 (=> (not res!169049) (not e!194894))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312592 (= res!169049 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153146))))

(assert (=> b!312592 (= lt!153146 (Intermediate!2708 false resIndex!52 resX!52))))

(declare-fun b!312594 () Bool)

(declare-fun res!169045 () Bool)

(assert (=> b!312594 (=> (not res!169045) (not e!194893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312594 (= res!169045 (validKeyInArray!0 k!2441))))

(declare-fun b!312595 () Bool)

(declare-fun res!169048 () Bool)

(assert (=> b!312595 (=> (not res!169048) (not e!194893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15972 (_ BitVec 32)) Bool)

(assert (=> b!312595 (= res!169048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312596 () Bool)

(assert (=> b!312596 (= e!194896 (not e!194895))))

(declare-fun res!169046 () Bool)

(assert (=> b!312596 (=> res!169046 e!194895)))

(assert (=> b!312596 (= res!169046 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153149 #b00000000000000000000000000000000) (bvsge lt!153149 (size!7920 a!3293)) (not (= lt!153150 lt!153146))))))

(declare-fun lt!153151 () SeekEntryResult!2708)

(assert (=> b!312596 (= lt!153151 lt!153153)))

(declare-fun lt!153147 () array!15972)

(assert (=> b!312596 (= lt!153153 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153149 k!2441 lt!153147 mask!3709))))

(assert (=> b!312596 (= lt!153151 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!153147 mask!3709))))

(assert (=> b!312596 (= lt!153147 (array!15973 (store (arr!7568 a!3293) i!1240 k!2441) (size!7920 a!3293)))))

(assert (=> b!312596 (= lt!153148 lt!153150)))

(assert (=> b!312596 (= lt!153150 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153149 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312596 (= lt!153149 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312593 () Bool)

(declare-fun res!169042 () Bool)

(assert (=> b!312593 (=> (not res!169042) (not e!194893))))

(declare-fun arrayContainsKey!0 (array!15972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312593 (= res!169042 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!169043 () Bool)

(assert (=> start!31070 (=> (not res!169043) (not e!194893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31070 (= res!169043 (validMask!0 mask!3709))))

(assert (=> start!31070 e!194893))

(declare-fun array_inv!5531 (array!15972) Bool)

(assert (=> start!31070 (array_inv!5531 a!3293)))

(assert (=> start!31070 true))

(assert (= (and start!31070 res!169043) b!312589))

(assert (= (and b!312589 res!169044) b!312594))

(assert (= (and b!312594 res!169045) b!312593))

(assert (= (and b!312593 res!169042) b!312590))

(assert (= (and b!312590 res!169047) b!312595))

(assert (= (and b!312595 res!169048) b!312592))

(assert (= (and b!312592 res!169049) b!312588))

(assert (= (and b!312588 res!169050) b!312587))

(assert (= (and b!312587 res!169041) b!312596))

(assert (= (and b!312596 (not res!169046)) b!312591))

(declare-fun m!322691 () Bool)

(assert (=> b!312587 m!322691))

(declare-fun m!322693 () Bool)

(assert (=> b!312587 m!322693))

(declare-fun m!322695 () Bool)

(assert (=> b!312588 m!322695))

(declare-fun m!322697 () Bool)

(assert (=> start!31070 m!322697))

(declare-fun m!322699 () Bool)

(assert (=> start!31070 m!322699))

(declare-fun m!322701 () Bool)

(assert (=> b!312590 m!322701))

(declare-fun m!322703 () Bool)

(assert (=> b!312593 m!322703))

(declare-fun m!322705 () Bool)

(assert (=> b!312595 m!322705))

(declare-fun m!322707 () Bool)

(assert (=> b!312592 m!322707))

(assert (=> b!312592 m!322707))

(declare-fun m!322709 () Bool)

(assert (=> b!312592 m!322709))

(declare-fun m!322711 () Bool)

(assert (=> b!312594 m!322711))

(declare-fun m!322713 () Bool)

(assert (=> b!312591 m!322713))

(declare-fun m!322715 () Bool)

(assert (=> b!312596 m!322715))

(declare-fun m!322717 () Bool)

(assert (=> b!312596 m!322717))

(declare-fun m!322719 () Bool)

(assert (=> b!312596 m!322719))

(declare-fun m!322721 () Bool)

(assert (=> b!312596 m!322721))

(declare-fun m!322723 () Bool)

(assert (=> b!312596 m!322723))

(push 1)

(assert (not b!312591))

(assert (not b!312595))

(assert (not b!312596))

(assert (not b!312590))

(assert (not b!312593))

(assert (not b!312592))

(assert (not b!312594))

(assert (not start!31070))

(assert (not b!312587))

(check-sat)

(pop 1)

(push 1)

(check-sat)

