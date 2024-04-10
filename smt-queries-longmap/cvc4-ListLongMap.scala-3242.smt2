; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45262 () Bool)

(assert start!45262)

(declare-fun b!497146 () Bool)

(declare-fun res!299534 () Bool)

(declare-fun e!291446 () Bool)

(assert (=> b!497146 (=> (not res!299534) (not e!291446))))

(declare-datatypes ((array!32150 0))(
  ( (array!32151 (arr!15458 (Array (_ BitVec 32) (_ BitVec 64))) (size!15822 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32150)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32150 (_ BitVec 32)) Bool)

(assert (=> b!497146 (= res!299534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497147 () Bool)

(declare-fun res!299535 () Bool)

(declare-fun e!291443 () Bool)

(assert (=> b!497147 (=> (not res!299535) (not e!291443))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32150 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497147 (= res!299535 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497148 () Bool)

(declare-fun res!299541 () Bool)

(assert (=> b!497148 (=> (not res!299541) (not e!291443))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497148 (= res!299541 (and (= (size!15822 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15822 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15822 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497149 () Bool)

(declare-fun e!291445 () Bool)

(assert (=> b!497149 (= e!291446 (not e!291445))))

(declare-fun res!299539 () Bool)

(assert (=> b!497149 (=> res!299539 e!291445)))

(declare-datatypes ((SeekEntryResult!3925 0))(
  ( (MissingZero!3925 (index!17879 (_ BitVec 32))) (Found!3925 (index!17880 (_ BitVec 32))) (Intermediate!3925 (undefined!4737 Bool) (index!17881 (_ BitVec 32)) (x!46929 (_ BitVec 32))) (Undefined!3925) (MissingVacant!3925 (index!17882 (_ BitVec 32))) )
))
(declare-fun lt!225064 () SeekEntryResult!3925)

(declare-fun lt!225063 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32150 (_ BitVec 32)) SeekEntryResult!3925)

(assert (=> b!497149 (= res!299539 (= lt!225064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225063 (select (store (arr!15458 a!3235) i!1204 k!2280) j!176) (array!32151 (store (arr!15458 a!3235) i!1204 k!2280) (size!15822 a!3235)) mask!3524)))))

(declare-fun lt!225065 () (_ BitVec 32))

(assert (=> b!497149 (= lt!225064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225065 (select (arr!15458 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497149 (= lt!225063 (toIndex!0 (select (store (arr!15458 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!497149 (= lt!225065 (toIndex!0 (select (arr!15458 a!3235) j!176) mask!3524))))

(declare-fun e!291447 () Bool)

(assert (=> b!497149 e!291447))

(declare-fun res!299542 () Bool)

(assert (=> b!497149 (=> (not res!299542) (not e!291447))))

(assert (=> b!497149 (= res!299542 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14796 0))(
  ( (Unit!14797) )
))
(declare-fun lt!225067 () Unit!14796)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32150 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14796)

(assert (=> b!497149 (= lt!225067 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497150 () Bool)

(assert (=> b!497150 (= e!291445 true)))

(assert (=> b!497150 (and (bvslt (x!46929 lt!225064) #b01111111111111111111111111111110) (or (= (select (arr!15458 a!3235) (index!17881 lt!225064)) (select (arr!15458 a!3235) j!176)) (= (select (arr!15458 a!3235) (index!17881 lt!225064)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15458 a!3235) (index!17881 lt!225064)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497151 () Bool)

(declare-fun res!299543 () Bool)

(assert (=> b!497151 (=> (not res!299543) (not e!291443))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497151 (= res!299543 (validKeyInArray!0 k!2280))))

(declare-fun res!299533 () Bool)

(assert (=> start!45262 (=> (not res!299533) (not e!291443))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45262 (= res!299533 (validMask!0 mask!3524))))

(assert (=> start!45262 e!291443))

(assert (=> start!45262 true))

(declare-fun array_inv!11254 (array!32150) Bool)

(assert (=> start!45262 (array_inv!11254 a!3235)))

(declare-fun b!497152 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32150 (_ BitVec 32)) SeekEntryResult!3925)

(assert (=> b!497152 (= e!291447 (= (seekEntryOrOpen!0 (select (arr!15458 a!3235) j!176) a!3235 mask!3524) (Found!3925 j!176)))))

(declare-fun b!497153 () Bool)

(declare-fun res!299540 () Bool)

(assert (=> b!497153 (=> (not res!299540) (not e!291443))))

(assert (=> b!497153 (= res!299540 (validKeyInArray!0 (select (arr!15458 a!3235) j!176)))))

(declare-fun b!497154 () Bool)

(assert (=> b!497154 (= e!291443 e!291446)))

(declare-fun res!299536 () Bool)

(assert (=> b!497154 (=> (not res!299536) (not e!291446))))

(declare-fun lt!225066 () SeekEntryResult!3925)

(assert (=> b!497154 (= res!299536 (or (= lt!225066 (MissingZero!3925 i!1204)) (= lt!225066 (MissingVacant!3925 i!1204))))))

(assert (=> b!497154 (= lt!225066 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!497155 () Bool)

(declare-fun res!299538 () Bool)

(assert (=> b!497155 (=> res!299538 e!291445)))

(assert (=> b!497155 (= res!299538 (or (undefined!4737 lt!225064) (not (is-Intermediate!3925 lt!225064))))))

(declare-fun b!497156 () Bool)

(declare-fun res!299537 () Bool)

(assert (=> b!497156 (=> (not res!299537) (not e!291446))))

(declare-datatypes ((List!9616 0))(
  ( (Nil!9613) (Cons!9612 (h!10483 (_ BitVec 64)) (t!15844 List!9616)) )
))
(declare-fun arrayNoDuplicates!0 (array!32150 (_ BitVec 32) List!9616) Bool)

(assert (=> b!497156 (= res!299537 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9613))))

(assert (= (and start!45262 res!299533) b!497148))

(assert (= (and b!497148 res!299541) b!497153))

(assert (= (and b!497153 res!299540) b!497151))

(assert (= (and b!497151 res!299543) b!497147))

(assert (= (and b!497147 res!299535) b!497154))

(assert (= (and b!497154 res!299536) b!497146))

(assert (= (and b!497146 res!299534) b!497156))

(assert (= (and b!497156 res!299537) b!497149))

(assert (= (and b!497149 res!299542) b!497152))

(assert (= (and b!497149 (not res!299539)) b!497155))

(assert (= (and b!497155 (not res!299538)) b!497150))

(declare-fun m!478489 () Bool)

(assert (=> start!45262 m!478489))

(declare-fun m!478491 () Bool)

(assert (=> start!45262 m!478491))

(declare-fun m!478493 () Bool)

(assert (=> b!497152 m!478493))

(assert (=> b!497152 m!478493))

(declare-fun m!478495 () Bool)

(assert (=> b!497152 m!478495))

(declare-fun m!478497 () Bool)

(assert (=> b!497150 m!478497))

(assert (=> b!497150 m!478493))

(declare-fun m!478499 () Bool)

(assert (=> b!497147 m!478499))

(declare-fun m!478501 () Bool)

(assert (=> b!497151 m!478501))

(declare-fun m!478503 () Bool)

(assert (=> b!497154 m!478503))

(declare-fun m!478505 () Bool)

(assert (=> b!497156 m!478505))

(declare-fun m!478507 () Bool)

(assert (=> b!497146 m!478507))

(assert (=> b!497153 m!478493))

(assert (=> b!497153 m!478493))

(declare-fun m!478509 () Bool)

(assert (=> b!497153 m!478509))

(declare-fun m!478511 () Bool)

(assert (=> b!497149 m!478511))

(declare-fun m!478513 () Bool)

(assert (=> b!497149 m!478513))

(declare-fun m!478515 () Bool)

(assert (=> b!497149 m!478515))

(assert (=> b!497149 m!478493))

(declare-fun m!478517 () Bool)

(assert (=> b!497149 m!478517))

(assert (=> b!497149 m!478493))

(declare-fun m!478519 () Bool)

(assert (=> b!497149 m!478519))

(assert (=> b!497149 m!478493))

(declare-fun m!478521 () Bool)

(assert (=> b!497149 m!478521))

(assert (=> b!497149 m!478515))

(declare-fun m!478523 () Bool)

(assert (=> b!497149 m!478523))

(assert (=> b!497149 m!478515))

(declare-fun m!478525 () Bool)

(assert (=> b!497149 m!478525))

(push 1)

