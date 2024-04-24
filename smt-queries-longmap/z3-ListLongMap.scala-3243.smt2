; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45254 () Bool)

(assert start!45254)

(declare-fun b!497118 () Bool)

(declare-fun e!291422 () Bool)

(declare-fun e!291421 () Bool)

(assert (=> b!497118 (= e!291422 e!291421)))

(declare-fun res!299565 () Bool)

(assert (=> b!497118 (=> (not res!299565) (not e!291421))))

(declare-datatypes ((SeekEntryResult!3877 0))(
  ( (MissingZero!3877 (index!17687 (_ BitVec 32))) (Found!3877 (index!17688 (_ BitVec 32))) (Intermediate!3877 (undefined!4689 Bool) (index!17689 (_ BitVec 32)) (x!46886 (_ BitVec 32))) (Undefined!3877) (MissingVacant!3877 (index!17690 (_ BitVec 32))) )
))
(declare-fun lt!225094 () SeekEntryResult!3877)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!497118 (= res!299565 (or (= lt!225094 (MissingZero!3877 i!1204)) (= lt!225094 (MissingVacant!3877 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32143 0))(
  ( (array!32144 (arr!15454 (Array (_ BitVec 32) (_ BitVec 64))) (size!15818 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32143)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32143 (_ BitVec 32)) SeekEntryResult!3877)

(assert (=> b!497118 (= lt!225094 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!299563 () Bool)

(assert (=> start!45254 (=> (not res!299563) (not e!291422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45254 (= res!299563 (validMask!0 mask!3524))))

(assert (=> start!45254 e!291422))

(assert (=> start!45254 true))

(declare-fun array_inv!11313 (array!32143) Bool)

(assert (=> start!45254 (array_inv!11313 a!3235)))

(declare-fun b!497119 () Bool)

(declare-fun res!299564 () Bool)

(assert (=> b!497119 (=> (not res!299564) (not e!291421))))

(declare-datatypes ((List!9519 0))(
  ( (Nil!9516) (Cons!9515 (h!10386 (_ BitVec 64)) (t!15739 List!9519)) )
))
(declare-fun arrayNoDuplicates!0 (array!32143 (_ BitVec 32) List!9519) Bool)

(assert (=> b!497119 (= res!299564 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9516))))

(declare-fun b!497120 () Bool)

(declare-fun res!299569 () Bool)

(assert (=> b!497120 (=> (not res!299569) (not e!291421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32143 (_ BitVec 32)) Bool)

(assert (=> b!497120 (= res!299569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497121 () Bool)

(declare-fun res!299562 () Bool)

(assert (=> b!497121 (=> (not res!299562) (not e!291422))))

(declare-fun arrayContainsKey!0 (array!32143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497121 (= res!299562 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497122 () Bool)

(declare-fun res!299560 () Bool)

(assert (=> b!497122 (=> (not res!299560) (not e!291422))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497122 (= res!299560 (validKeyInArray!0 (select (arr!15454 a!3235) j!176)))))

(declare-fun b!497123 () Bool)

(declare-fun res!299559 () Bool)

(assert (=> b!497123 (=> (not res!299559) (not e!291422))))

(assert (=> b!497123 (= res!299559 (and (= (size!15818 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15818 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15818 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497124 () Bool)

(declare-fun e!291420 () Bool)

(assert (=> b!497124 (= e!291420 true)))

(declare-fun lt!225091 () SeekEntryResult!3877)

(assert (=> b!497124 (and (bvslt (x!46886 lt!225091) #b01111111111111111111111111111110) (or (= (select (arr!15454 a!3235) (index!17689 lt!225091)) (select (arr!15454 a!3235) j!176)) (= (select (arr!15454 a!3235) (index!17689 lt!225091)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15454 a!3235) (index!17689 lt!225091)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497125 () Bool)

(declare-fun res!299566 () Bool)

(assert (=> b!497125 (=> (not res!299566) (not e!291422))))

(assert (=> b!497125 (= res!299566 (validKeyInArray!0 k0!2280))))

(declare-fun b!497126 () Bool)

(declare-fun res!299561 () Bool)

(assert (=> b!497126 (=> res!299561 e!291420)))

(get-info :version)

(assert (=> b!497126 (= res!299561 (or (undefined!4689 lt!225091) (not ((_ is Intermediate!3877) lt!225091))))))

(declare-fun b!497127 () Bool)

(assert (=> b!497127 (= e!291421 (not e!291420))))

(declare-fun res!299568 () Bool)

(assert (=> b!497127 (=> res!299568 e!291420)))

(declare-fun lt!225092 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32143 (_ BitVec 32)) SeekEntryResult!3877)

(assert (=> b!497127 (= res!299568 (= lt!225091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225092 (select (store (arr!15454 a!3235) i!1204 k0!2280) j!176) (array!32144 (store (arr!15454 a!3235) i!1204 k0!2280) (size!15818 a!3235)) mask!3524)))))

(declare-fun lt!225093 () (_ BitVec 32))

(assert (=> b!497127 (= lt!225091 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225093 (select (arr!15454 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497127 (= lt!225092 (toIndex!0 (select (store (arr!15454 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!497127 (= lt!225093 (toIndex!0 (select (arr!15454 a!3235) j!176) mask!3524))))

(declare-fun e!291419 () Bool)

(assert (=> b!497127 e!291419))

(declare-fun res!299567 () Bool)

(assert (=> b!497127 (=> (not res!299567) (not e!291419))))

(assert (=> b!497127 (= res!299567 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14761 0))(
  ( (Unit!14762) )
))
(declare-fun lt!225090 () Unit!14761)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14761)

(assert (=> b!497127 (= lt!225090 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497128 () Bool)

(assert (=> b!497128 (= e!291419 (= (seekEntryOrOpen!0 (select (arr!15454 a!3235) j!176) a!3235 mask!3524) (Found!3877 j!176)))))

(assert (= (and start!45254 res!299563) b!497123))

(assert (= (and b!497123 res!299559) b!497122))

(assert (= (and b!497122 res!299560) b!497125))

(assert (= (and b!497125 res!299566) b!497121))

(assert (= (and b!497121 res!299562) b!497118))

(assert (= (and b!497118 res!299565) b!497120))

(assert (= (and b!497120 res!299569) b!497119))

(assert (= (and b!497119 res!299564) b!497127))

(assert (= (and b!497127 res!299567) b!497128))

(assert (= (and b!497127 (not res!299568)) b!497126))

(assert (= (and b!497126 (not res!299561)) b!497124))

(declare-fun m!478711 () Bool)

(assert (=> b!497120 m!478711))

(declare-fun m!478713 () Bool)

(assert (=> b!497125 m!478713))

(declare-fun m!478715 () Bool)

(assert (=> b!497118 m!478715))

(declare-fun m!478717 () Bool)

(assert (=> b!497124 m!478717))

(declare-fun m!478719 () Bool)

(assert (=> b!497124 m!478719))

(declare-fun m!478721 () Bool)

(assert (=> b!497119 m!478721))

(assert (=> b!497122 m!478719))

(assert (=> b!497122 m!478719))

(declare-fun m!478723 () Bool)

(assert (=> b!497122 m!478723))

(declare-fun m!478725 () Bool)

(assert (=> b!497127 m!478725))

(declare-fun m!478727 () Bool)

(assert (=> b!497127 m!478727))

(declare-fun m!478729 () Bool)

(assert (=> b!497127 m!478729))

(assert (=> b!497127 m!478729))

(declare-fun m!478731 () Bool)

(assert (=> b!497127 m!478731))

(assert (=> b!497127 m!478719))

(declare-fun m!478733 () Bool)

(assert (=> b!497127 m!478733))

(assert (=> b!497127 m!478719))

(declare-fun m!478735 () Bool)

(assert (=> b!497127 m!478735))

(assert (=> b!497127 m!478719))

(declare-fun m!478737 () Bool)

(assert (=> b!497127 m!478737))

(assert (=> b!497127 m!478729))

(declare-fun m!478739 () Bool)

(assert (=> b!497127 m!478739))

(declare-fun m!478741 () Bool)

(assert (=> b!497121 m!478741))

(declare-fun m!478743 () Bool)

(assert (=> start!45254 m!478743))

(declare-fun m!478745 () Bool)

(assert (=> start!45254 m!478745))

(assert (=> b!497128 m!478719))

(assert (=> b!497128 m!478719))

(declare-fun m!478747 () Bool)

(assert (=> b!497128 m!478747))

(check-sat (not start!45254) (not b!497125) (not b!497128) (not b!497118) (not b!497127) (not b!497121) (not b!497120) (not b!497122) (not b!497119))
(check-sat)
