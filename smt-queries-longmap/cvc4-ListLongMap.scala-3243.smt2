; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45268 () Bool)

(assert start!45268)

(declare-fun b!497245 () Bool)

(declare-fun res!299641 () Bool)

(declare-fun e!291490 () Bool)

(assert (=> b!497245 (=> res!299641 e!291490)))

(declare-datatypes ((SeekEntryResult!3928 0))(
  ( (MissingZero!3928 (index!17891 (_ BitVec 32))) (Found!3928 (index!17892 (_ BitVec 32))) (Intermediate!3928 (undefined!4740 Bool) (index!17893 (_ BitVec 32)) (x!46940 (_ BitVec 32))) (Undefined!3928) (MissingVacant!3928 (index!17894 (_ BitVec 32))) )
))
(declare-fun lt!225112 () SeekEntryResult!3928)

(assert (=> b!497245 (= res!299641 (or (undefined!4740 lt!225112) (not (is-Intermediate!3928 lt!225112))))))

(declare-fun res!299636 () Bool)

(declare-fun e!291488 () Bool)

(assert (=> start!45268 (=> (not res!299636) (not e!291488))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45268 (= res!299636 (validMask!0 mask!3524))))

(assert (=> start!45268 e!291488))

(assert (=> start!45268 true))

(declare-datatypes ((array!32156 0))(
  ( (array!32157 (arr!15461 (Array (_ BitVec 32) (_ BitVec 64))) (size!15825 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32156)

(declare-fun array_inv!11257 (array!32156) Bool)

(assert (=> start!45268 (array_inv!11257 a!3235)))

(declare-fun b!497246 () Bool)

(declare-fun res!299633 () Bool)

(assert (=> b!497246 (=> (not res!299633) (not e!291488))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497246 (= res!299633 (and (= (size!15825 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15825 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15825 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497247 () Bool)

(declare-fun res!299640 () Bool)

(assert (=> b!497247 (=> (not res!299640) (not e!291488))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497247 (= res!299640 (validKeyInArray!0 k!2280))))

(declare-fun b!497248 () Bool)

(declare-fun res!299637 () Bool)

(declare-fun e!291491 () Bool)

(assert (=> b!497248 (=> (not res!299637) (not e!291491))))

(declare-datatypes ((List!9619 0))(
  ( (Nil!9616) (Cons!9615 (h!10486 (_ BitVec 64)) (t!15847 List!9619)) )
))
(declare-fun arrayNoDuplicates!0 (array!32156 (_ BitVec 32) List!9619) Bool)

(assert (=> b!497248 (= res!299637 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9616))))

(declare-fun b!497249 () Bool)

(assert (=> b!497249 (= e!291491 (not e!291490))))

(declare-fun res!299639 () Bool)

(assert (=> b!497249 (=> res!299639 e!291490)))

(declare-fun lt!225108 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32156 (_ BitVec 32)) SeekEntryResult!3928)

(assert (=> b!497249 (= res!299639 (= lt!225112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225108 (select (store (arr!15461 a!3235) i!1204 k!2280) j!176) (array!32157 (store (arr!15461 a!3235) i!1204 k!2280) (size!15825 a!3235)) mask!3524)))))

(declare-fun lt!225110 () (_ BitVec 32))

(assert (=> b!497249 (= lt!225112 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225110 (select (arr!15461 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497249 (= lt!225108 (toIndex!0 (select (store (arr!15461 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!497249 (= lt!225110 (toIndex!0 (select (arr!15461 a!3235) j!176) mask!3524))))

(declare-fun e!291492 () Bool)

(assert (=> b!497249 e!291492))

(declare-fun res!299642 () Bool)

(assert (=> b!497249 (=> (not res!299642) (not e!291492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32156 (_ BitVec 32)) Bool)

(assert (=> b!497249 (= res!299642 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14802 0))(
  ( (Unit!14803) )
))
(declare-fun lt!225109 () Unit!14802)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32156 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14802)

(assert (=> b!497249 (= lt!225109 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497250 () Bool)

(declare-fun res!299638 () Bool)

(assert (=> b!497250 (=> (not res!299638) (not e!291491))))

(assert (=> b!497250 (= res!299638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497251 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32156 (_ BitVec 32)) SeekEntryResult!3928)

(assert (=> b!497251 (= e!291492 (= (seekEntryOrOpen!0 (select (arr!15461 a!3235) j!176) a!3235 mask!3524) (Found!3928 j!176)))))

(declare-fun b!497252 () Bool)

(assert (=> b!497252 (= e!291488 e!291491)))

(declare-fun res!299635 () Bool)

(assert (=> b!497252 (=> (not res!299635) (not e!291491))))

(declare-fun lt!225111 () SeekEntryResult!3928)

(assert (=> b!497252 (= res!299635 (or (= lt!225111 (MissingZero!3928 i!1204)) (= lt!225111 (MissingVacant!3928 i!1204))))))

(assert (=> b!497252 (= lt!225111 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!497253 () Bool)

(declare-fun res!299632 () Bool)

(assert (=> b!497253 (=> (not res!299632) (not e!291488))))

(declare-fun arrayContainsKey!0 (array!32156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497253 (= res!299632 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497254 () Bool)

(assert (=> b!497254 (= e!291490 true)))

(assert (=> b!497254 (and (bvslt (x!46940 lt!225112) #b01111111111111111111111111111110) (or (= (select (arr!15461 a!3235) (index!17893 lt!225112)) (select (arr!15461 a!3235) j!176)) (= (select (arr!15461 a!3235) (index!17893 lt!225112)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15461 a!3235) (index!17893 lt!225112)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497255 () Bool)

(declare-fun res!299634 () Bool)

(assert (=> b!497255 (=> (not res!299634) (not e!291488))))

(assert (=> b!497255 (= res!299634 (validKeyInArray!0 (select (arr!15461 a!3235) j!176)))))

(assert (= (and start!45268 res!299636) b!497246))

(assert (= (and b!497246 res!299633) b!497255))

(assert (= (and b!497255 res!299634) b!497247))

(assert (= (and b!497247 res!299640) b!497253))

(assert (= (and b!497253 res!299632) b!497252))

(assert (= (and b!497252 res!299635) b!497250))

(assert (= (and b!497250 res!299638) b!497248))

(assert (= (and b!497248 res!299637) b!497249))

(assert (= (and b!497249 res!299642) b!497251))

(assert (= (and b!497249 (not res!299639)) b!497245))

(assert (= (and b!497245 (not res!299641)) b!497254))

(declare-fun m!478603 () Bool)

(assert (=> b!497251 m!478603))

(assert (=> b!497251 m!478603))

(declare-fun m!478605 () Bool)

(assert (=> b!497251 m!478605))

(declare-fun m!478607 () Bool)

(assert (=> b!497249 m!478607))

(declare-fun m!478609 () Bool)

(assert (=> b!497249 m!478609))

(declare-fun m!478611 () Bool)

(assert (=> b!497249 m!478611))

(assert (=> b!497249 m!478603))

(declare-fun m!478613 () Bool)

(assert (=> b!497249 m!478613))

(declare-fun m!478615 () Bool)

(assert (=> b!497249 m!478615))

(assert (=> b!497249 m!478607))

(assert (=> b!497249 m!478603))

(declare-fun m!478617 () Bool)

(assert (=> b!497249 m!478617))

(assert (=> b!497249 m!478603))

(declare-fun m!478619 () Bool)

(assert (=> b!497249 m!478619))

(assert (=> b!497249 m!478607))

(declare-fun m!478621 () Bool)

(assert (=> b!497249 m!478621))

(declare-fun m!478623 () Bool)

(assert (=> start!45268 m!478623))

(declare-fun m!478625 () Bool)

(assert (=> start!45268 m!478625))

(declare-fun m!478627 () Bool)

(assert (=> b!497254 m!478627))

(assert (=> b!497254 m!478603))

(declare-fun m!478629 () Bool)

(assert (=> b!497253 m!478629))

(declare-fun m!478631 () Bool)

(assert (=> b!497250 m!478631))

(assert (=> b!497255 m!478603))

(assert (=> b!497255 m!478603))

(declare-fun m!478633 () Bool)

(assert (=> b!497255 m!478633))

(declare-fun m!478635 () Bool)

(assert (=> b!497252 m!478635))

(declare-fun m!478637 () Bool)

(assert (=> b!497248 m!478637))

(declare-fun m!478639 () Bool)

(assert (=> b!497247 m!478639))

(push 1)

(assert (not b!497248))

(assert (not b!497250))

(assert (not start!45268))

(assert (not b!497255))

(assert (not b!497253))

(assert (not b!497247))

(assert (not b!497251))

(assert (not b!497252))

(assert (not b!497249))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

