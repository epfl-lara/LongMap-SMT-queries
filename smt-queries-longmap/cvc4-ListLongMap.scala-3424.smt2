; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47536 () Bool)

(assert start!47536)

(declare-fun res!320566 () Bool)

(declare-fun e!305126 () Bool)

(assert (=> start!47536 (=> (not res!320566) (not e!305126))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47536 (= res!320566 (validMask!0 mask!3524))))

(assert (=> start!47536 e!305126))

(assert (=> start!47536 true))

(declare-datatypes ((array!33299 0))(
  ( (array!33300 (arr!16004 (Array (_ BitVec 32) (_ BitVec 64))) (size!16368 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33299)

(declare-fun array_inv!11800 (array!33299) Bool)

(assert (=> start!47536 (array_inv!11800 a!3235)))

(declare-fun b!523165 () Bool)

(declare-datatypes ((Unit!16336 0))(
  ( (Unit!16337) )
))
(declare-fun e!305127 () Unit!16336)

(declare-fun Unit!16338 () Unit!16336)

(assert (=> b!523165 (= e!305127 Unit!16338)))

(declare-fun b!523166 () Bool)

(declare-fun e!305128 () Bool)

(declare-fun e!305130 () Bool)

(assert (=> b!523166 (= e!305128 (not e!305130))))

(declare-fun res!320565 () Bool)

(assert (=> b!523166 (=> res!320565 e!305130)))

(declare-fun lt!240010 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4471 0))(
  ( (MissingZero!4471 (index!20090 (_ BitVec 32))) (Found!4471 (index!20091 (_ BitVec 32))) (Intermediate!4471 (undefined!5283 Bool) (index!20092 (_ BitVec 32)) (x!49066 (_ BitVec 32))) (Undefined!4471) (MissingVacant!4471 (index!20093 (_ BitVec 32))) )
))
(declare-fun lt!240006 () SeekEntryResult!4471)

(declare-fun lt!240004 () array!33299)

(declare-fun lt!240003 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33299 (_ BitVec 32)) SeekEntryResult!4471)

(assert (=> b!523166 (= res!320565 (= lt!240006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240010 lt!240003 lt!240004 mask!3524)))))

(declare-fun lt!240008 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!523166 (= lt!240006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240008 (select (arr!16004 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523166 (= lt!240010 (toIndex!0 lt!240003 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!523166 (= lt!240003 (select (store (arr!16004 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!523166 (= lt!240008 (toIndex!0 (select (arr!16004 a!3235) j!176) mask!3524))))

(assert (=> b!523166 (= lt!240004 (array!33300 (store (arr!16004 a!3235) i!1204 k!2280) (size!16368 a!3235)))))

(declare-fun e!305125 () Bool)

(assert (=> b!523166 e!305125))

(declare-fun res!320571 () Bool)

(assert (=> b!523166 (=> (not res!320571) (not e!305125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33299 (_ BitVec 32)) Bool)

(assert (=> b!523166 (= res!320571 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240007 () Unit!16336)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16336)

(assert (=> b!523166 (= lt!240007 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523167 () Bool)

(declare-fun res!320573 () Bool)

(assert (=> b!523167 (=> (not res!320573) (not e!305126))))

(declare-fun arrayContainsKey!0 (array!33299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523167 (= res!320573 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523168 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33299 (_ BitVec 32)) SeekEntryResult!4471)

(assert (=> b!523168 (= e!305125 (= (seekEntryOrOpen!0 (select (arr!16004 a!3235) j!176) a!3235 mask!3524) (Found!4471 j!176)))))

(declare-fun b!523169 () Bool)

(declare-fun res!320564 () Bool)

(assert (=> b!523169 (=> (not res!320564) (not e!305128))))

(assert (=> b!523169 (= res!320564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523170 () Bool)

(declare-fun Unit!16339 () Unit!16336)

(assert (=> b!523170 (= e!305127 Unit!16339)))

(declare-fun lt!240009 () Unit!16336)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33299 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16336)

(assert (=> b!523170 (= lt!240009 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240008 #b00000000000000000000000000000000 (index!20092 lt!240006) (x!49066 lt!240006) mask!3524))))

(declare-fun res!320572 () Bool)

(assert (=> b!523170 (= res!320572 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240008 lt!240003 lt!240004 mask!3524) (Intermediate!4471 false (index!20092 lt!240006) (x!49066 lt!240006))))))

(declare-fun e!305124 () Bool)

(assert (=> b!523170 (=> (not res!320572) (not e!305124))))

(assert (=> b!523170 e!305124))

(declare-fun b!523171 () Bool)

(assert (=> b!523171 (= e!305130 true)))

(assert (=> b!523171 (and (or (= (select (arr!16004 a!3235) (index!20092 lt!240006)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16004 a!3235) (index!20092 lt!240006)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16004 a!3235) (index!20092 lt!240006)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16004 a!3235) (index!20092 lt!240006)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240002 () Unit!16336)

(assert (=> b!523171 (= lt!240002 e!305127)))

(declare-fun c!61604 () Bool)

(assert (=> b!523171 (= c!61604 (= (select (arr!16004 a!3235) (index!20092 lt!240006)) (select (arr!16004 a!3235) j!176)))))

(assert (=> b!523171 (and (bvslt (x!49066 lt!240006) #b01111111111111111111111111111110) (or (= (select (arr!16004 a!3235) (index!20092 lt!240006)) (select (arr!16004 a!3235) j!176)) (= (select (arr!16004 a!3235) (index!20092 lt!240006)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16004 a!3235) (index!20092 lt!240006)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523172 () Bool)

(assert (=> b!523172 (= e!305126 e!305128)))

(declare-fun res!320562 () Bool)

(assert (=> b!523172 (=> (not res!320562) (not e!305128))))

(declare-fun lt!240005 () SeekEntryResult!4471)

(assert (=> b!523172 (= res!320562 (or (= lt!240005 (MissingZero!4471 i!1204)) (= lt!240005 (MissingVacant!4471 i!1204))))))

(assert (=> b!523172 (= lt!240005 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!523173 () Bool)

(declare-fun res!320568 () Bool)

(assert (=> b!523173 (=> res!320568 e!305130)))

(assert (=> b!523173 (= res!320568 (or (undefined!5283 lt!240006) (not (is-Intermediate!4471 lt!240006))))))

(declare-fun b!523174 () Bool)

(declare-fun res!320563 () Bool)

(assert (=> b!523174 (=> (not res!320563) (not e!305126))))

(assert (=> b!523174 (= res!320563 (and (= (size!16368 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16368 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16368 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523175 () Bool)

(declare-fun res!320570 () Bool)

(assert (=> b!523175 (=> (not res!320570) (not e!305126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523175 (= res!320570 (validKeyInArray!0 (select (arr!16004 a!3235) j!176)))))

(declare-fun b!523176 () Bool)

(declare-fun res!320567 () Bool)

(assert (=> b!523176 (=> (not res!320567) (not e!305128))))

(declare-datatypes ((List!10162 0))(
  ( (Nil!10159) (Cons!10158 (h!11083 (_ BitVec 64)) (t!16390 List!10162)) )
))
(declare-fun arrayNoDuplicates!0 (array!33299 (_ BitVec 32) List!10162) Bool)

(assert (=> b!523176 (= res!320567 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10159))))

(declare-fun b!523177 () Bool)

(declare-fun res!320569 () Bool)

(assert (=> b!523177 (=> (not res!320569) (not e!305126))))

(assert (=> b!523177 (= res!320569 (validKeyInArray!0 k!2280))))

(declare-fun b!523178 () Bool)

(assert (=> b!523178 (= e!305124 false)))

(assert (= (and start!47536 res!320566) b!523174))

(assert (= (and b!523174 res!320563) b!523175))

(assert (= (and b!523175 res!320570) b!523177))

(assert (= (and b!523177 res!320569) b!523167))

(assert (= (and b!523167 res!320573) b!523172))

(assert (= (and b!523172 res!320562) b!523169))

(assert (= (and b!523169 res!320564) b!523176))

(assert (= (and b!523176 res!320567) b!523166))

(assert (= (and b!523166 res!320571) b!523168))

(assert (= (and b!523166 (not res!320565)) b!523173))

(assert (= (and b!523173 (not res!320568)) b!523171))

(assert (= (and b!523171 c!61604) b!523170))

(assert (= (and b!523171 (not c!61604)) b!523165))

(assert (= (and b!523170 res!320572) b!523178))

(declare-fun m!503985 () Bool)

(assert (=> b!523170 m!503985))

(declare-fun m!503987 () Bool)

(assert (=> b!523170 m!503987))

(declare-fun m!503989 () Bool)

(assert (=> start!47536 m!503989))

(declare-fun m!503991 () Bool)

(assert (=> start!47536 m!503991))

(declare-fun m!503993 () Bool)

(assert (=> b!523172 m!503993))

(declare-fun m!503995 () Bool)

(assert (=> b!523176 m!503995))

(declare-fun m!503997 () Bool)

(assert (=> b!523168 m!503997))

(assert (=> b!523168 m!503997))

(declare-fun m!503999 () Bool)

(assert (=> b!523168 m!503999))

(declare-fun m!504001 () Bool)

(assert (=> b!523167 m!504001))

(declare-fun m!504003 () Bool)

(assert (=> b!523169 m!504003))

(declare-fun m!504005 () Bool)

(assert (=> b!523166 m!504005))

(declare-fun m!504007 () Bool)

(assert (=> b!523166 m!504007))

(declare-fun m!504009 () Bool)

(assert (=> b!523166 m!504009))

(declare-fun m!504011 () Bool)

(assert (=> b!523166 m!504011))

(assert (=> b!523166 m!503997))

(declare-fun m!504013 () Bool)

(assert (=> b!523166 m!504013))

(declare-fun m!504015 () Bool)

(assert (=> b!523166 m!504015))

(assert (=> b!523166 m!503997))

(assert (=> b!523166 m!503997))

(declare-fun m!504017 () Bool)

(assert (=> b!523166 m!504017))

(declare-fun m!504019 () Bool)

(assert (=> b!523166 m!504019))

(declare-fun m!504021 () Bool)

(assert (=> b!523177 m!504021))

(assert (=> b!523175 m!503997))

(assert (=> b!523175 m!503997))

(declare-fun m!504023 () Bool)

(assert (=> b!523175 m!504023))

(declare-fun m!504025 () Bool)

(assert (=> b!523171 m!504025))

(assert (=> b!523171 m!503997))

(push 1)

