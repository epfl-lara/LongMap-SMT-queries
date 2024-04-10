; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45598 () Bool)

(assert start!45598)

(declare-fun b!502177 () Bool)

(declare-fun res!303631 () Bool)

(declare-fun e!294157 () Bool)

(assert (=> b!502177 (=> res!303631 e!294157)))

(declare-datatypes ((SeekEntryResult!4024 0))(
  ( (MissingZero!4024 (index!18284 (_ BitVec 32))) (Found!4024 (index!18285 (_ BitVec 32))) (Intermediate!4024 (undefined!4836 Bool) (index!18286 (_ BitVec 32)) (x!47313 (_ BitVec 32))) (Undefined!4024) (MissingVacant!4024 (index!18287 (_ BitVec 32))) )
))
(declare-fun lt!228212 () SeekEntryResult!4024)

(assert (=> b!502177 (= res!303631 (or (undefined!4836 lt!228212) (not (is-Intermediate!4024 lt!228212))))))

(declare-fun b!502178 () Bool)

(declare-fun e!294155 () Bool)

(assert (=> b!502178 (= e!294157 e!294155)))

(declare-fun res!303629 () Bool)

(assert (=> b!502178 (=> res!303629 e!294155)))

(declare-fun lt!228209 () (_ BitVec 32))

(declare-datatypes ((array!32354 0))(
  ( (array!32355 (arr!15557 (Array (_ BitVec 32) (_ BitVec 64))) (size!15921 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32354)

(assert (=> b!502178 (= res!303629 (or (bvsgt (x!47313 lt!228212) #b01111111111111111111111111111110) (bvslt lt!228209 #b00000000000000000000000000000000) (bvsge lt!228209 (size!15921 a!3235)) (bvslt (index!18286 lt!228212) #b00000000000000000000000000000000) (bvsge (index!18286 lt!228212) (size!15921 a!3235)) (not (= lt!228212 (Intermediate!4024 false (index!18286 lt!228212) (x!47313 lt!228212))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502178 (= (index!18286 lt!228212) i!1204)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!15172 0))(
  ( (Unit!15173) )
))
(declare-fun lt!228213 () Unit!15172)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32354 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15172)

(assert (=> b!502178 (= lt!228213 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228209 #b00000000000000000000000000000000 (index!18286 lt!228212) (x!47313 lt!228212) mask!3524))))

(assert (=> b!502178 (and (or (= (select (arr!15557 a!3235) (index!18286 lt!228212)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15557 a!3235) (index!18286 lt!228212)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15557 a!3235) (index!18286 lt!228212)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15557 a!3235) (index!18286 lt!228212)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228215 () Unit!15172)

(declare-fun e!294156 () Unit!15172)

(assert (=> b!502178 (= lt!228215 e!294156)))

(declare-fun c!59555 () Bool)

(assert (=> b!502178 (= c!59555 (= (select (arr!15557 a!3235) (index!18286 lt!228212)) (select (arr!15557 a!3235) j!176)))))

(assert (=> b!502178 (and (bvslt (x!47313 lt!228212) #b01111111111111111111111111111110) (or (= (select (arr!15557 a!3235) (index!18286 lt!228212)) (select (arr!15557 a!3235) j!176)) (= (select (arr!15557 a!3235) (index!18286 lt!228212)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15557 a!3235) (index!18286 lt!228212)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!303636 () Bool)

(declare-fun e!294160 () Bool)

(assert (=> start!45598 (=> (not res!303636) (not e!294160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45598 (= res!303636 (validMask!0 mask!3524))))

(assert (=> start!45598 e!294160))

(assert (=> start!45598 true))

(declare-fun array_inv!11353 (array!32354) Bool)

(assert (=> start!45598 (array_inv!11353 a!3235)))

(declare-fun b!502179 () Bool)

(declare-fun res!303637 () Bool)

(assert (=> b!502179 (=> (not res!303637) (not e!294160))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502179 (= res!303637 (validKeyInArray!0 (select (arr!15557 a!3235) j!176)))))

(declare-fun e!294159 () Bool)

(declare-fun b!502180 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32354 (_ BitVec 32)) SeekEntryResult!4024)

(assert (=> b!502180 (= e!294159 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228209 (index!18286 lt!228212) (select (arr!15557 a!3235) j!176) a!3235 mask!3524) (Found!4024 j!176))))))

(declare-fun b!502181 () Bool)

(declare-fun Unit!15174 () Unit!15172)

(assert (=> b!502181 (= e!294156 Unit!15174)))

(declare-fun lt!228216 () Unit!15172)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32354 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15172)

(assert (=> b!502181 (= lt!228216 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228209 #b00000000000000000000000000000000 (index!18286 lt!228212) (x!47313 lt!228212) mask!3524))))

(declare-fun lt!228207 () array!32354)

(declare-fun lt!228210 () (_ BitVec 64))

(declare-fun res!303625 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32354 (_ BitVec 32)) SeekEntryResult!4024)

(assert (=> b!502181 (= res!303625 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228209 lt!228210 lt!228207 mask!3524) (Intermediate!4024 false (index!18286 lt!228212) (x!47313 lt!228212))))))

(declare-fun e!294158 () Bool)

(assert (=> b!502181 (=> (not res!303625) (not e!294158))))

(assert (=> b!502181 e!294158))

(declare-fun b!502182 () Bool)

(declare-fun res!303635 () Bool)

(assert (=> b!502182 (=> res!303635 e!294155)))

(assert (=> b!502182 (= res!303635 e!294159)))

(declare-fun res!303638 () Bool)

(assert (=> b!502182 (=> (not res!303638) (not e!294159))))

(assert (=> b!502182 (= res!303638 (bvsgt #b00000000000000000000000000000000 (x!47313 lt!228212)))))

(declare-fun b!502183 () Bool)

(declare-fun res!303628 () Bool)

(declare-fun e!294162 () Bool)

(assert (=> b!502183 (=> (not res!303628) (not e!294162))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32354 (_ BitVec 32)) Bool)

(assert (=> b!502183 (= res!303628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!502184 () Bool)

(assert (=> b!502184 (= e!294160 e!294162)))

(declare-fun res!303632 () Bool)

(assert (=> b!502184 (=> (not res!303632) (not e!294162))))

(declare-fun lt!228217 () SeekEntryResult!4024)

(assert (=> b!502184 (= res!303632 (or (= lt!228217 (MissingZero!4024 i!1204)) (= lt!228217 (MissingVacant!4024 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32354 (_ BitVec 32)) SeekEntryResult!4024)

(assert (=> b!502184 (= lt!228217 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!502185 () Bool)

(declare-fun res!303626 () Bool)

(assert (=> b!502185 (=> (not res!303626) (not e!294160))))

(assert (=> b!502185 (= res!303626 (and (= (size!15921 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15921 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15921 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502186 () Bool)

(declare-fun res!303634 () Bool)

(assert (=> b!502186 (=> (not res!303634) (not e!294160))))

(declare-fun arrayContainsKey!0 (array!32354 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502186 (= res!303634 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502187 () Bool)

(assert (=> b!502187 (= e!294155 true)))

(declare-fun lt!228211 () SeekEntryResult!4024)

(assert (=> b!502187 (= lt!228211 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228209 lt!228210 lt!228207 mask!3524))))

(declare-fun b!502188 () Bool)

(declare-fun res!303630 () Bool)

(assert (=> b!502188 (=> (not res!303630) (not e!294162))))

(declare-datatypes ((List!9715 0))(
  ( (Nil!9712) (Cons!9711 (h!10588 (_ BitVec 64)) (t!15943 List!9715)) )
))
(declare-fun arrayNoDuplicates!0 (array!32354 (_ BitVec 32) List!9715) Bool)

(assert (=> b!502188 (= res!303630 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9712))))

(declare-fun b!502189 () Bool)

(assert (=> b!502189 (= e!294158 false)))

(declare-fun b!502190 () Bool)

(declare-fun res!303627 () Bool)

(assert (=> b!502190 (=> (not res!303627) (not e!294160))))

(assert (=> b!502190 (= res!303627 (validKeyInArray!0 k!2280))))

(declare-fun e!294161 () Bool)

(declare-fun b!502191 () Bool)

(assert (=> b!502191 (= e!294161 (= (seekEntryOrOpen!0 (select (arr!15557 a!3235) j!176) a!3235 mask!3524) (Found!4024 j!176)))))

(declare-fun b!502192 () Bool)

(declare-fun Unit!15175 () Unit!15172)

(assert (=> b!502192 (= e!294156 Unit!15175)))

(declare-fun b!502193 () Bool)

(assert (=> b!502193 (= e!294162 (not e!294157))))

(declare-fun res!303633 () Bool)

(assert (=> b!502193 (=> res!303633 e!294157)))

(declare-fun lt!228214 () (_ BitVec 32))

(assert (=> b!502193 (= res!303633 (= lt!228212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228214 lt!228210 lt!228207 mask!3524)))))

(assert (=> b!502193 (= lt!228212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228209 (select (arr!15557 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502193 (= lt!228214 (toIndex!0 lt!228210 mask!3524))))

(assert (=> b!502193 (= lt!228210 (select (store (arr!15557 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!502193 (= lt!228209 (toIndex!0 (select (arr!15557 a!3235) j!176) mask!3524))))

(assert (=> b!502193 (= lt!228207 (array!32355 (store (arr!15557 a!3235) i!1204 k!2280) (size!15921 a!3235)))))

(assert (=> b!502193 e!294161))

(declare-fun res!303624 () Bool)

(assert (=> b!502193 (=> (not res!303624) (not e!294161))))

(assert (=> b!502193 (= res!303624 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228208 () Unit!15172)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15172)

(assert (=> b!502193 (= lt!228208 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45598 res!303636) b!502185))

(assert (= (and b!502185 res!303626) b!502179))

(assert (= (and b!502179 res!303637) b!502190))

(assert (= (and b!502190 res!303627) b!502186))

(assert (= (and b!502186 res!303634) b!502184))

(assert (= (and b!502184 res!303632) b!502183))

(assert (= (and b!502183 res!303628) b!502188))

(assert (= (and b!502188 res!303630) b!502193))

(assert (= (and b!502193 res!303624) b!502191))

(assert (= (and b!502193 (not res!303633)) b!502177))

(assert (= (and b!502177 (not res!303631)) b!502178))

(assert (= (and b!502178 c!59555) b!502181))

(assert (= (and b!502178 (not c!59555)) b!502192))

(assert (= (and b!502181 res!303625) b!502189))

(assert (= (and b!502178 (not res!303629)) b!502182))

(assert (= (and b!502182 res!303638) b!502180))

(assert (= (and b!502182 (not res!303635)) b!502187))

(declare-fun m!483137 () Bool)

(assert (=> start!45598 m!483137))

(declare-fun m!483139 () Bool)

(assert (=> start!45598 m!483139))

(declare-fun m!483141 () Bool)

(assert (=> b!502181 m!483141))

(declare-fun m!483143 () Bool)

(assert (=> b!502181 m!483143))

(declare-fun m!483145 () Bool)

(assert (=> b!502193 m!483145))

(declare-fun m!483147 () Bool)

(assert (=> b!502193 m!483147))

(declare-fun m!483149 () Bool)

(assert (=> b!502193 m!483149))

(declare-fun m!483151 () Bool)

(assert (=> b!502193 m!483151))

(declare-fun m!483153 () Bool)

(assert (=> b!502193 m!483153))

(declare-fun m!483155 () Bool)

(assert (=> b!502193 m!483155))

(assert (=> b!502193 m!483151))

(declare-fun m!483157 () Bool)

(assert (=> b!502193 m!483157))

(declare-fun m!483159 () Bool)

(assert (=> b!502193 m!483159))

(assert (=> b!502193 m!483151))

(declare-fun m!483161 () Bool)

(assert (=> b!502193 m!483161))

(assert (=> b!502191 m!483151))

(assert (=> b!502191 m!483151))

(declare-fun m!483163 () Bool)

(assert (=> b!502191 m!483163))

(assert (=> b!502180 m!483151))

(assert (=> b!502180 m!483151))

(declare-fun m!483165 () Bool)

(assert (=> b!502180 m!483165))

(declare-fun m!483167 () Bool)

(assert (=> b!502190 m!483167))

(declare-fun m!483169 () Bool)

(assert (=> b!502178 m!483169))

(declare-fun m!483171 () Bool)

(assert (=> b!502178 m!483171))

(assert (=> b!502178 m!483151))

(declare-fun m!483173 () Bool)

(assert (=> b!502188 m!483173))

(assert (=> b!502187 m!483143))

(declare-fun m!483175 () Bool)

(assert (=> b!502184 m!483175))

(assert (=> b!502179 m!483151))

(assert (=> b!502179 m!483151))

(declare-fun m!483177 () Bool)

(assert (=> b!502179 m!483177))

(declare-fun m!483179 () Bool)

(assert (=> b!502183 m!483179))

(declare-fun m!483181 () Bool)

(assert (=> b!502186 m!483181))

(push 1)

