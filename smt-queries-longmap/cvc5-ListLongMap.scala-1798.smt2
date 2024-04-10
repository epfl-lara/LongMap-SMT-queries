; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32488 () Bool)

(assert start!32488)

(declare-fun b!324773 () Bool)

(declare-fun res!178111 () Bool)

(declare-fun e!200378 () Bool)

(assert (=> b!324773 (=> (not res!178111) (not e!200378))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324773 (= res!178111 (validKeyInArray!0 k!2497))))

(declare-fun res!178112 () Bool)

(assert (=> start!32488 (=> (not res!178112) (not e!200378))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32488 (= res!178112 (validMask!0 mask!3777))))

(assert (=> start!32488 e!200378))

(declare-datatypes ((array!16627 0))(
  ( (array!16628 (arr!7871 (Array (_ BitVec 32) (_ BitVec 64))) (size!8223 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16627)

(declare-fun array_inv!5834 (array!16627) Bool)

(assert (=> start!32488 (array_inv!5834 a!3305)))

(assert (=> start!32488 true))

(declare-fun b!324774 () Bool)

(declare-fun res!178108 () Bool)

(declare-fun e!200379 () Bool)

(assert (=> b!324774 (=> (not res!178108) (not e!200379))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324774 (= res!178108 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7871 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324775 () Bool)

(assert (=> b!324775 (= e!200378 e!200379)))

(declare-fun res!178109 () Bool)

(assert (=> b!324775 (=> (not res!178109) (not e!200379))))

(declare-datatypes ((SeekEntryResult!3002 0))(
  ( (MissingZero!3002 (index!14184 (_ BitVec 32))) (Found!3002 (index!14185 (_ BitVec 32))) (Intermediate!3002 (undefined!3814 Bool) (index!14186 (_ BitVec 32)) (x!32430 (_ BitVec 32))) (Undefined!3002) (MissingVacant!3002 (index!14187 (_ BitVec 32))) )
))
(declare-fun lt!156869 () SeekEntryResult!3002)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16627 (_ BitVec 32)) SeekEntryResult!3002)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324775 (= res!178109 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156869))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324775 (= lt!156869 (Intermediate!3002 false resIndex!58 resX!58))))

(declare-fun b!324776 () Bool)

(assert (=> b!324776 (= e!200379 false)))

(declare-fun lt!156870 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324776 (= lt!156870 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324777 () Bool)

(declare-fun res!178110 () Bool)

(assert (=> b!324777 (=> (not res!178110) (not e!200378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16627 (_ BitVec 32)) Bool)

(assert (=> b!324777 (= res!178110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324778 () Bool)

(declare-fun res!178105 () Bool)

(assert (=> b!324778 (=> (not res!178105) (not e!200378))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16627 (_ BitVec 32)) SeekEntryResult!3002)

(assert (=> b!324778 (= res!178105 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3002 i!1250)))))

(declare-fun b!324779 () Bool)

(declare-fun res!178106 () Bool)

(assert (=> b!324779 (=> (not res!178106) (not e!200379))))

(assert (=> b!324779 (= res!178106 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156869))))

(declare-fun b!324780 () Bool)

(declare-fun res!178107 () Bool)

(assert (=> b!324780 (=> (not res!178107) (not e!200378))))

(assert (=> b!324780 (= res!178107 (and (= (size!8223 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8223 a!3305))))))

(declare-fun b!324781 () Bool)

(declare-fun res!178113 () Bool)

(assert (=> b!324781 (=> (not res!178113) (not e!200379))))

(assert (=> b!324781 (= res!178113 (and (= (select (arr!7871 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8223 a!3305))))))

(declare-fun b!324782 () Bool)

(declare-fun res!178104 () Bool)

(assert (=> b!324782 (=> (not res!178104) (not e!200378))))

(declare-fun arrayContainsKey!0 (array!16627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324782 (= res!178104 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32488 res!178112) b!324780))

(assert (= (and b!324780 res!178107) b!324773))

(assert (= (and b!324773 res!178111) b!324782))

(assert (= (and b!324782 res!178104) b!324778))

(assert (= (and b!324778 res!178105) b!324777))

(assert (= (and b!324777 res!178110) b!324775))

(assert (= (and b!324775 res!178109) b!324781))

(assert (= (and b!324781 res!178113) b!324779))

(assert (= (and b!324779 res!178106) b!324774))

(assert (= (and b!324774 res!178108) b!324776))

(declare-fun m!331751 () Bool)

(assert (=> b!324773 m!331751))

(declare-fun m!331753 () Bool)

(assert (=> b!324782 m!331753))

(declare-fun m!331755 () Bool)

(assert (=> b!324777 m!331755))

(declare-fun m!331757 () Bool)

(assert (=> b!324774 m!331757))

(declare-fun m!331759 () Bool)

(assert (=> b!324775 m!331759))

(assert (=> b!324775 m!331759))

(declare-fun m!331761 () Bool)

(assert (=> b!324775 m!331761))

(declare-fun m!331763 () Bool)

(assert (=> b!324776 m!331763))

(declare-fun m!331765 () Bool)

(assert (=> b!324781 m!331765))

(declare-fun m!331767 () Bool)

(assert (=> start!32488 m!331767))

(declare-fun m!331769 () Bool)

(assert (=> start!32488 m!331769))

(declare-fun m!331771 () Bool)

(assert (=> b!324779 m!331771))

(declare-fun m!331773 () Bool)

(assert (=> b!324778 m!331773))

(push 1)

