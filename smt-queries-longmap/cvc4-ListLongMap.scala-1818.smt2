; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32720 () Bool)

(assert start!32720)

(declare-fun b!327101 () Bool)

(declare-fun e!201224 () Bool)

(declare-fun e!201225 () Bool)

(assert (=> b!327101 (= e!201224 e!201225)))

(declare-fun res!180141 () Bool)

(assert (=> b!327101 (=> (not res!180141) (not e!201225))))

(declare-datatypes ((array!16757 0))(
  ( (array!16758 (arr!7933 (Array (_ BitVec 32) (_ BitVec 64))) (size!8285 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16757)

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3064 0))(
  ( (MissingZero!3064 (index!14432 (_ BitVec 32))) (Found!3064 (index!14433 (_ BitVec 32))) (Intermediate!3064 (undefined!3876 Bool) (index!14434 (_ BitVec 32)) (x!32670 (_ BitVec 32))) (Undefined!3064) (MissingVacant!3064 (index!14435 (_ BitVec 32))) )
))
(declare-fun lt!157458 () SeekEntryResult!3064)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16757 (_ BitVec 32)) SeekEntryResult!3064)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327101 (= res!180141 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157458))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!327101 (= lt!157458 (Intermediate!3064 false resIndex!58 resX!58))))

(declare-fun res!180139 () Bool)

(assert (=> start!32720 (=> (not res!180139) (not e!201224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32720 (= res!180139 (validMask!0 mask!3777))))

(assert (=> start!32720 e!201224))

(declare-fun array_inv!5896 (array!16757) Bool)

(assert (=> start!32720 (array_inv!5896 a!3305)))

(assert (=> start!32720 true))

(declare-fun b!327102 () Bool)

(declare-fun res!180138 () Bool)

(assert (=> b!327102 (=> (not res!180138) (not e!201224))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16757 (_ BitVec 32)) SeekEntryResult!3064)

(assert (=> b!327102 (= res!180138 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3064 i!1250)))))

(declare-fun b!327103 () Bool)

(declare-fun res!180137 () Bool)

(assert (=> b!327103 (=> (not res!180137) (not e!201224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16757 (_ BitVec 32)) Bool)

(assert (=> b!327103 (= res!180137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun b!327104 () Bool)

(assert (=> b!327104 (= e!201225 (and (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-datatypes ((Unit!10162 0))(
  ( (Unit!10163) )
))
(declare-fun lt!157457 () Unit!10162)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16757 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10162)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327104 (= lt!157457 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!327105 () Bool)

(declare-fun res!180136 () Bool)

(assert (=> b!327105 (=> (not res!180136) (not e!201225))))

(assert (=> b!327105 (= res!180136 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7933 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!327106 () Bool)

(declare-fun res!180140 () Bool)

(assert (=> b!327106 (=> (not res!180140) (not e!201225))))

(assert (=> b!327106 (= res!180140 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157458))))

(declare-fun b!327107 () Bool)

(declare-fun res!180132 () Bool)

(assert (=> b!327107 (=> (not res!180132) (not e!201225))))

(assert (=> b!327107 (= res!180132 (and (= (select (arr!7933 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8285 a!3305))))))

(declare-fun b!327108 () Bool)

(declare-fun res!180133 () Bool)

(assert (=> b!327108 (=> (not res!180133) (not e!201224))))

(declare-fun arrayContainsKey!0 (array!16757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327108 (= res!180133 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327109 () Bool)

(declare-fun res!180134 () Bool)

(assert (=> b!327109 (=> (not res!180134) (not e!201224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327109 (= res!180134 (validKeyInArray!0 k!2497))))

(declare-fun b!327110 () Bool)

(declare-fun res!180135 () Bool)

(assert (=> b!327110 (=> (not res!180135) (not e!201224))))

(assert (=> b!327110 (= res!180135 (and (= (size!8285 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8285 a!3305))))))

(assert (= (and start!32720 res!180139) b!327110))

(assert (= (and b!327110 res!180135) b!327109))

(assert (= (and b!327109 res!180134) b!327108))

(assert (= (and b!327108 res!180133) b!327102))

(assert (= (and b!327102 res!180138) b!327103))

(assert (= (and b!327103 res!180137) b!327101))

(assert (= (and b!327101 res!180141) b!327107))

(assert (= (and b!327107 res!180132) b!327106))

(assert (= (and b!327106 res!180140) b!327105))

(assert (= (and b!327105 res!180136) b!327104))

(declare-fun m!333561 () Bool)

(assert (=> b!327109 m!333561))

(declare-fun m!333563 () Bool)

(assert (=> b!327106 m!333563))

(declare-fun m!333565 () Bool)

(assert (=> b!327102 m!333565))

(declare-fun m!333567 () Bool)

(assert (=> b!327101 m!333567))

(assert (=> b!327101 m!333567))

(declare-fun m!333569 () Bool)

(assert (=> b!327101 m!333569))

(declare-fun m!333571 () Bool)

(assert (=> b!327108 m!333571))

(declare-fun m!333573 () Bool)

(assert (=> b!327103 m!333573))

(declare-fun m!333575 () Bool)

(assert (=> b!327107 m!333575))

(declare-fun m!333577 () Bool)

(assert (=> b!327104 m!333577))

(assert (=> b!327104 m!333577))

(declare-fun m!333579 () Bool)

(assert (=> b!327104 m!333579))

(declare-fun m!333581 () Bool)

(assert (=> start!32720 m!333581))

(declare-fun m!333583 () Bool)

(assert (=> start!32720 m!333583))

(declare-fun m!333585 () Bool)

(assert (=> b!327105 m!333585))

(push 1)

(assert (not b!327108))

(assert (not start!32720))

(assert (not b!327103))

(assert (not b!327101))

(assert (not b!327106))

(assert (not b!327109))

(assert (not b!327104))

