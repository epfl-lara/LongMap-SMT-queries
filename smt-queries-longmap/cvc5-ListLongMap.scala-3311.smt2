; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45810 () Bool)

(assert start!45810)

(declare-fun b!507148 () Bool)

(declare-fun e!296808 () Bool)

(declare-fun e!296807 () Bool)

(assert (=> b!507148 (= e!296808 e!296807)))

(declare-fun res!308110 () Bool)

(assert (=> b!507148 (=> (not res!308110) (not e!296807))))

(declare-datatypes ((SeekEntryResult!4130 0))(
  ( (MissingZero!4130 (index!18708 (_ BitVec 32))) (Found!4130 (index!18709 (_ BitVec 32))) (Intermediate!4130 (undefined!4942 Bool) (index!18710 (_ BitVec 32)) (x!47707 (_ BitVec 32))) (Undefined!4130) (MissingVacant!4130 (index!18711 (_ BitVec 32))) )
))
(declare-fun lt!231486 () SeekEntryResult!4130)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507148 (= res!308110 (or (= lt!231486 (MissingZero!4130 i!1204)) (= lt!231486 (MissingVacant!4130 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32566 0))(
  ( (array!32567 (arr!15663 (Array (_ BitVec 32) (_ BitVec 64))) (size!16027 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32566)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32566 (_ BitVec 32)) SeekEntryResult!4130)

(assert (=> b!507148 (= lt!231486 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507149 () Bool)

(declare-fun res!308117 () Bool)

(assert (=> b!507149 (=> (not res!308117) (not e!296808))))

(declare-fun arrayContainsKey!0 (array!32566 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507149 (= res!308117 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!308113 () Bool)

(assert (=> start!45810 (=> (not res!308113) (not e!296808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45810 (= res!308113 (validMask!0 mask!3524))))

(assert (=> start!45810 e!296808))

(assert (=> start!45810 true))

(declare-fun array_inv!11459 (array!32566) Bool)

(assert (=> start!45810 (array_inv!11459 a!3235)))

(declare-fun b!507150 () Bool)

(declare-fun res!308115 () Bool)

(assert (=> b!507150 (=> (not res!308115) (not e!296808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507150 (= res!308115 (validKeyInArray!0 k!2280))))

(declare-fun b!507151 () Bool)

(declare-fun res!308111 () Bool)

(assert (=> b!507151 (=> (not res!308111) (not e!296807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32566 (_ BitVec 32)) Bool)

(assert (=> b!507151 (= res!308111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!296805 () Bool)

(declare-fun b!507152 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507152 (= e!296805 (= (seekEntryOrOpen!0 (select (arr!15663 a!3235) j!176) a!3235 mask!3524) (Found!4130 j!176)))))

(declare-fun b!507153 () Bool)

(declare-fun e!296806 () Bool)

(assert (=> b!507153 (= e!296806 true)))

(declare-fun lt!231485 () (_ BitVec 64))

(declare-fun lt!231489 () array!32566)

(declare-fun lt!231492 () SeekEntryResult!4130)

(assert (=> b!507153 (= lt!231492 (seekEntryOrOpen!0 lt!231485 lt!231489 mask!3524))))

(assert (=> b!507153 false))

(declare-fun b!507154 () Bool)

(declare-fun res!308114 () Bool)

(assert (=> b!507154 (=> (not res!308114) (not e!296807))))

(declare-datatypes ((List!9821 0))(
  ( (Nil!9818) (Cons!9817 (h!10694 (_ BitVec 64)) (t!16049 List!9821)) )
))
(declare-fun arrayNoDuplicates!0 (array!32566 (_ BitVec 32) List!9821) Bool)

(assert (=> b!507154 (= res!308114 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9818))))

(declare-fun b!507155 () Bool)

(declare-fun res!308112 () Bool)

(assert (=> b!507155 (=> (not res!308112) (not e!296808))))

(assert (=> b!507155 (= res!308112 (and (= (size!16027 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16027 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16027 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507156 () Bool)

(declare-fun e!296804 () Bool)

(assert (=> b!507156 (= e!296807 (not e!296804))))

(declare-fun res!308116 () Bool)

(assert (=> b!507156 (=> res!308116 e!296804)))

(declare-fun lt!231488 () (_ BitVec 32))

(declare-fun lt!231487 () SeekEntryResult!4130)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32566 (_ BitVec 32)) SeekEntryResult!4130)

(assert (=> b!507156 (= res!308116 (= lt!231487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231488 lt!231485 lt!231489 mask!3524)))))

(declare-fun lt!231491 () (_ BitVec 32))

(assert (=> b!507156 (= lt!231487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231491 (select (arr!15663 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507156 (= lt!231488 (toIndex!0 lt!231485 mask!3524))))

(assert (=> b!507156 (= lt!231485 (select (store (arr!15663 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507156 (= lt!231491 (toIndex!0 (select (arr!15663 a!3235) j!176) mask!3524))))

(assert (=> b!507156 (= lt!231489 (array!32567 (store (arr!15663 a!3235) i!1204 k!2280) (size!16027 a!3235)))))

(assert (=> b!507156 e!296805))

(declare-fun res!308109 () Bool)

(assert (=> b!507156 (=> (not res!308109) (not e!296805))))

(assert (=> b!507156 (= res!308109 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15548 0))(
  ( (Unit!15549) )
))
(declare-fun lt!231490 () Unit!15548)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15548)

(assert (=> b!507156 (= lt!231490 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507157 () Bool)

(declare-fun res!308107 () Bool)

(assert (=> b!507157 (=> (not res!308107) (not e!296808))))

(assert (=> b!507157 (= res!308107 (validKeyInArray!0 (select (arr!15663 a!3235) j!176)))))

(declare-fun b!507158 () Bool)

(assert (=> b!507158 (= e!296804 e!296806)))

(declare-fun res!308108 () Bool)

(assert (=> b!507158 (=> res!308108 e!296806)))

(declare-fun lt!231493 () Bool)

(assert (=> b!507158 (= res!308108 (or (and (not lt!231493) (undefined!4942 lt!231487)) (and (not lt!231493) (not (undefined!4942 lt!231487)))))))

(assert (=> b!507158 (= lt!231493 (not (is-Intermediate!4130 lt!231487)))))

(assert (= (and start!45810 res!308113) b!507155))

(assert (= (and b!507155 res!308112) b!507157))

(assert (= (and b!507157 res!308107) b!507150))

(assert (= (and b!507150 res!308115) b!507149))

(assert (= (and b!507149 res!308117) b!507148))

(assert (= (and b!507148 res!308110) b!507151))

(assert (= (and b!507151 res!308111) b!507154))

(assert (= (and b!507154 res!308114) b!507156))

(assert (= (and b!507156 res!308109) b!507152))

(assert (= (and b!507156 (not res!308116)) b!507158))

(assert (= (and b!507158 (not res!308108)) b!507153))

(declare-fun m!487875 () Bool)

(assert (=> b!507153 m!487875))

(declare-fun m!487877 () Bool)

(assert (=> b!507148 m!487877))

(declare-fun m!487879 () Bool)

(assert (=> b!507149 m!487879))

(declare-fun m!487881 () Bool)

(assert (=> b!507152 m!487881))

(assert (=> b!507152 m!487881))

(declare-fun m!487883 () Bool)

(assert (=> b!507152 m!487883))

(declare-fun m!487885 () Bool)

(assert (=> start!45810 m!487885))

(declare-fun m!487887 () Bool)

(assert (=> start!45810 m!487887))

(declare-fun m!487889 () Bool)

(assert (=> b!507151 m!487889))

(declare-fun m!487891 () Bool)

(assert (=> b!507154 m!487891))

(declare-fun m!487893 () Bool)

(assert (=> b!507156 m!487893))

(declare-fun m!487895 () Bool)

(assert (=> b!507156 m!487895))

(declare-fun m!487897 () Bool)

(assert (=> b!507156 m!487897))

(declare-fun m!487899 () Bool)

(assert (=> b!507156 m!487899))

(declare-fun m!487901 () Bool)

(assert (=> b!507156 m!487901))

(assert (=> b!507156 m!487881))

(declare-fun m!487903 () Bool)

(assert (=> b!507156 m!487903))

(assert (=> b!507156 m!487881))

(declare-fun m!487905 () Bool)

(assert (=> b!507156 m!487905))

(assert (=> b!507156 m!487881))

(declare-fun m!487907 () Bool)

(assert (=> b!507156 m!487907))

(assert (=> b!507157 m!487881))

(assert (=> b!507157 m!487881))

(declare-fun m!487909 () Bool)

(assert (=> b!507157 m!487909))

(declare-fun m!487911 () Bool)

(assert (=> b!507150 m!487911))

(push 1)

