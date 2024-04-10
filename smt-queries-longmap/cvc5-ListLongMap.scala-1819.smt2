; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32722 () Bool)

(assert start!32722)

(declare-fun b!327131 () Bool)

(declare-fun res!180162 () Bool)

(declare-fun e!201235 () Bool)

(assert (=> b!327131 (=> (not res!180162) (not e!201235))))

(declare-datatypes ((array!16759 0))(
  ( (array!16760 (arr!7934 (Array (_ BitVec 32) (_ BitVec 64))) (size!8286 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16759)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!327131 (= res!180162 (and (= (select (arr!7934 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8286 a!3305))))))

(declare-fun b!327132 () Bool)

(declare-fun e!201233 () Bool)

(assert (=> b!327132 (= e!201233 e!201235)))

(declare-fun res!180169 () Bool)

(assert (=> b!327132 (=> (not res!180169) (not e!201235))))

(declare-datatypes ((SeekEntryResult!3065 0))(
  ( (MissingZero!3065 (index!14436 (_ BitVec 32))) (Found!3065 (index!14437 (_ BitVec 32))) (Intermediate!3065 (undefined!3877 Bool) (index!14438 (_ BitVec 32)) (x!32679 (_ BitVec 32))) (Undefined!3065) (MissingVacant!3065 (index!14439 (_ BitVec 32))) )
))
(declare-fun lt!157464 () SeekEntryResult!3065)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16759 (_ BitVec 32)) SeekEntryResult!3065)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327132 (= res!180169 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157464))))

(assert (=> b!327132 (= lt!157464 (Intermediate!3065 false resIndex!58 resX!58))))

(declare-fun b!327133 () Bool)

(declare-fun res!180170 () Bool)

(assert (=> b!327133 (=> (not res!180170) (not e!201233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16759 (_ BitVec 32)) Bool)

(assert (=> b!327133 (= res!180170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!327134 () Bool)

(declare-fun res!180166 () Bool)

(assert (=> b!327134 (=> (not res!180166) (not e!201233))))

(declare-fun arrayContainsKey!0 (array!16759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!327134 (= res!180166 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!327135 () Bool)

(declare-fun res!180168 () Bool)

(assert (=> b!327135 (=> (not res!180168) (not e!201233))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16759 (_ BitVec 32)) SeekEntryResult!3065)

(assert (=> b!327135 (= res!180168 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3065 i!1250)))))

(declare-fun res!180165 () Bool)

(assert (=> start!32722 (=> (not res!180165) (not e!201233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32722 (= res!180165 (validMask!0 mask!3777))))

(assert (=> start!32722 e!201233))

(declare-fun array_inv!5897 (array!16759) Bool)

(assert (=> start!32722 (array_inv!5897 a!3305)))

(assert (=> start!32722 true))

(declare-fun b!327136 () Bool)

(declare-fun res!180163 () Bool)

(assert (=> b!327136 (=> (not res!180163) (not e!201235))))

(assert (=> b!327136 (= res!180163 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157464))))

(declare-fun b!327137 () Bool)

(declare-fun res!180171 () Bool)

(assert (=> b!327137 (=> (not res!180171) (not e!201235))))

(assert (=> b!327137 (= res!180171 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7934 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!327138 () Bool)

(assert (=> b!327138 (= e!201235 false)))

(declare-datatypes ((Unit!10164 0))(
  ( (Unit!10165) )
))
(declare-fun lt!157463 () Unit!10164)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16759 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10164)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!327138 (= lt!157463 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!327139 () Bool)

(declare-fun res!180164 () Bool)

(assert (=> b!327139 (=> (not res!180164) (not e!201233))))

(assert (=> b!327139 (= res!180164 (and (= (size!8286 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8286 a!3305))))))

(declare-fun b!327140 () Bool)

(declare-fun res!180167 () Bool)

(assert (=> b!327140 (=> (not res!180167) (not e!201233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!327140 (= res!180167 (validKeyInArray!0 k!2497))))

(assert (= (and start!32722 res!180165) b!327139))

(assert (= (and b!327139 res!180164) b!327140))

(assert (= (and b!327140 res!180167) b!327134))

(assert (= (and b!327134 res!180166) b!327135))

(assert (= (and b!327135 res!180168) b!327133))

(assert (= (and b!327133 res!180170) b!327132))

(assert (= (and b!327132 res!180169) b!327131))

(assert (= (and b!327131 res!180162) b!327136))

(assert (= (and b!327136 res!180163) b!327137))

(assert (= (and b!327137 res!180171) b!327138))

(declare-fun m!333587 () Bool)

(assert (=> b!327134 m!333587))

(declare-fun m!333589 () Bool)

(assert (=> b!327132 m!333589))

(assert (=> b!327132 m!333589))

(declare-fun m!333591 () Bool)

(assert (=> b!327132 m!333591))

(declare-fun m!333593 () Bool)

(assert (=> b!327137 m!333593))

(declare-fun m!333595 () Bool)

(assert (=> b!327131 m!333595))

(declare-fun m!333597 () Bool)

(assert (=> b!327133 m!333597))

(declare-fun m!333599 () Bool)

(assert (=> b!327138 m!333599))

(assert (=> b!327138 m!333599))

(declare-fun m!333601 () Bool)

(assert (=> b!327138 m!333601))

(declare-fun m!333603 () Bool)

(assert (=> b!327135 m!333603))

(declare-fun m!333605 () Bool)

(assert (=> start!32722 m!333605))

(declare-fun m!333607 () Bool)

(assert (=> start!32722 m!333607))

(declare-fun m!333609 () Bool)

(assert (=> b!327140 m!333609))

(declare-fun m!333611 () Bool)

(assert (=> b!327136 m!333611))

(push 1)

