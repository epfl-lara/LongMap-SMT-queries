; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44668 () Bool)

(assert start!44668)

(declare-fun b!490110 () Bool)

(declare-fun res!293049 () Bool)

(declare-fun e!288159 () Bool)

(assert (=> b!490110 (=> (not res!293049) (not e!288159))))

(declare-datatypes ((array!31727 0))(
  ( (array!31728 (arr!15251 (Array (_ BitVec 32) (_ BitVec 64))) (size!15615 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31727)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490110 (= res!293049 (validKeyInArray!0 (select (arr!15251 a!3235) j!176)))))

(declare-fun b!490111 () Bool)

(declare-fun e!288160 () Bool)

(assert (=> b!490111 (= e!288160 (not true))))

(declare-fun lt!221276 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3718 0))(
  ( (MissingZero!3718 (index!17051 (_ BitVec 32))) (Found!3718 (index!17052 (_ BitVec 32))) (Intermediate!3718 (undefined!4530 Bool) (index!17053 (_ BitVec 32)) (x!46152 (_ BitVec 32))) (Undefined!3718) (MissingVacant!3718 (index!17054 (_ BitVec 32))) )
))
(declare-fun lt!221277 () SeekEntryResult!3718)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31727 (_ BitVec 32)) SeekEntryResult!3718)

(assert (=> b!490111 (= lt!221277 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221276 (select (store (arr!15251 a!3235) i!1204 k!2280) j!176) (array!31728 (store (arr!15251 a!3235) i!1204 k!2280) (size!15615 a!3235)) mask!3524))))

(declare-fun lt!221273 () SeekEntryResult!3718)

(declare-fun lt!221278 () (_ BitVec 32))

(assert (=> b!490111 (= lt!221273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221278 (select (arr!15251 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490111 (= lt!221276 (toIndex!0 (select (store (arr!15251 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!490111 (= lt!221278 (toIndex!0 (select (arr!15251 a!3235) j!176) mask!3524))))

(declare-fun e!288161 () Bool)

(assert (=> b!490111 e!288161))

(declare-fun res!293052 () Bool)

(assert (=> b!490111 (=> (not res!293052) (not e!288161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31727 (_ BitVec 32)) Bool)

(assert (=> b!490111 (= res!293052 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14382 0))(
  ( (Unit!14383) )
))
(declare-fun lt!221275 () Unit!14382)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14382)

(assert (=> b!490111 (= lt!221275 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490112 () Bool)

(declare-fun res!293050 () Bool)

(assert (=> b!490112 (=> (not res!293050) (not e!288159))))

(assert (=> b!490112 (= res!293050 (and (= (size!15615 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15615 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15615 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490113 () Bool)

(declare-fun res!293048 () Bool)

(assert (=> b!490113 (=> (not res!293048) (not e!288159))))

(declare-fun arrayContainsKey!0 (array!31727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490113 (= res!293048 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490114 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31727 (_ BitVec 32)) SeekEntryResult!3718)

(assert (=> b!490114 (= e!288161 (= (seekEntryOrOpen!0 (select (arr!15251 a!3235) j!176) a!3235 mask!3524) (Found!3718 j!176)))))

(declare-fun b!490115 () Bool)

(declare-fun res!293051 () Bool)

(assert (=> b!490115 (=> (not res!293051) (not e!288159))))

(assert (=> b!490115 (= res!293051 (validKeyInArray!0 k!2280))))

(declare-fun res!293046 () Bool)

(assert (=> start!44668 (=> (not res!293046) (not e!288159))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44668 (= res!293046 (validMask!0 mask!3524))))

(assert (=> start!44668 e!288159))

(assert (=> start!44668 true))

(declare-fun array_inv!11047 (array!31727) Bool)

(assert (=> start!44668 (array_inv!11047 a!3235)))

(declare-fun b!490116 () Bool)

(declare-fun res!293053 () Bool)

(assert (=> b!490116 (=> (not res!293053) (not e!288160))))

(declare-datatypes ((List!9409 0))(
  ( (Nil!9406) (Cons!9405 (h!10267 (_ BitVec 64)) (t!15637 List!9409)) )
))
(declare-fun arrayNoDuplicates!0 (array!31727 (_ BitVec 32) List!9409) Bool)

(assert (=> b!490116 (= res!293053 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9406))))

(declare-fun b!490117 () Bool)

(assert (=> b!490117 (= e!288159 e!288160)))

(declare-fun res!293047 () Bool)

(assert (=> b!490117 (=> (not res!293047) (not e!288160))))

(declare-fun lt!221274 () SeekEntryResult!3718)

(assert (=> b!490117 (= res!293047 (or (= lt!221274 (MissingZero!3718 i!1204)) (= lt!221274 (MissingVacant!3718 i!1204))))))

(assert (=> b!490117 (= lt!221274 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490118 () Bool)

(declare-fun res!293054 () Bool)

(assert (=> b!490118 (=> (not res!293054) (not e!288160))))

(assert (=> b!490118 (= res!293054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44668 res!293046) b!490112))

(assert (= (and b!490112 res!293050) b!490110))

(assert (= (and b!490110 res!293049) b!490115))

(assert (= (and b!490115 res!293051) b!490113))

(assert (= (and b!490113 res!293048) b!490117))

(assert (= (and b!490117 res!293047) b!490118))

(assert (= (and b!490118 res!293054) b!490116))

(assert (= (and b!490116 res!293053) b!490111))

(assert (= (and b!490111 res!293052) b!490114))

(declare-fun m!470109 () Bool)

(assert (=> start!44668 m!470109))

(declare-fun m!470111 () Bool)

(assert (=> start!44668 m!470111))

(declare-fun m!470113 () Bool)

(assert (=> b!490116 m!470113))

(declare-fun m!470115 () Bool)

(assert (=> b!490110 m!470115))

(assert (=> b!490110 m!470115))

(declare-fun m!470117 () Bool)

(assert (=> b!490110 m!470117))

(declare-fun m!470119 () Bool)

(assert (=> b!490111 m!470119))

(declare-fun m!470121 () Bool)

(assert (=> b!490111 m!470121))

(declare-fun m!470123 () Bool)

(assert (=> b!490111 m!470123))

(assert (=> b!490111 m!470115))

(declare-fun m!470125 () Bool)

(assert (=> b!490111 m!470125))

(assert (=> b!490111 m!470115))

(declare-fun m!470127 () Bool)

(assert (=> b!490111 m!470127))

(assert (=> b!490111 m!470115))

(declare-fun m!470129 () Bool)

(assert (=> b!490111 m!470129))

(assert (=> b!490111 m!470123))

(declare-fun m!470131 () Bool)

(assert (=> b!490111 m!470131))

(assert (=> b!490111 m!470123))

(declare-fun m!470133 () Bool)

(assert (=> b!490111 m!470133))

(declare-fun m!470135 () Bool)

(assert (=> b!490117 m!470135))

(declare-fun m!470137 () Bool)

(assert (=> b!490115 m!470137))

(declare-fun m!470139 () Bool)

(assert (=> b!490118 m!470139))

(declare-fun m!470141 () Bool)

(assert (=> b!490113 m!470141))

(assert (=> b!490114 m!470115))

(assert (=> b!490114 m!470115))

(declare-fun m!470143 () Bool)

(assert (=> b!490114 m!470143))

(push 1)

