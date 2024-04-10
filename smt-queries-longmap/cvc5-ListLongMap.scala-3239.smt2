; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45240 () Bool)

(assert start!45240)

(declare-fun b!496783 () Bool)

(declare-fun res!299173 () Bool)

(declare-fun e!291278 () Bool)

(assert (=> b!496783 (=> (not res!299173) (not e!291278))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496783 (= res!299173 (validKeyInArray!0 k!2280))))

(declare-fun b!496784 () Bool)

(declare-fun res!299176 () Bool)

(declare-fun e!291280 () Bool)

(assert (=> b!496784 (=> (not res!299176) (not e!291280))))

(declare-datatypes ((array!32128 0))(
  ( (array!32129 (arr!15447 (Array (_ BitVec 32) (_ BitVec 64))) (size!15811 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32128)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32128 (_ BitVec 32)) Bool)

(assert (=> b!496784 (= res!299176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496785 () Bool)

(declare-fun res!299172 () Bool)

(assert (=> b!496785 (=> (not res!299172) (not e!291278))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496785 (= res!299172 (validKeyInArray!0 (select (arr!15447 a!3235) j!176)))))

(declare-fun b!496786 () Bool)

(declare-fun res!299177 () Bool)

(assert (=> b!496786 (=> (not res!299177) (not e!291280))))

(declare-datatypes ((List!9605 0))(
  ( (Nil!9602) (Cons!9601 (h!10472 (_ BitVec 64)) (t!15833 List!9605)) )
))
(declare-fun arrayNoDuplicates!0 (array!32128 (_ BitVec 32) List!9605) Bool)

(assert (=> b!496786 (= res!299177 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9602))))

(declare-fun b!496787 () Bool)

(declare-fun res!299174 () Bool)

(assert (=> b!496787 (=> (not res!299174) (not e!291278))))

(declare-fun arrayContainsKey!0 (array!32128 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496787 (= res!299174 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!299179 () Bool)

(assert (=> start!45240 (=> (not res!299179) (not e!291278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45240 (= res!299179 (validMask!0 mask!3524))))

(assert (=> start!45240 e!291278))

(assert (=> start!45240 true))

(declare-fun array_inv!11243 (array!32128) Bool)

(assert (=> start!45240 (array_inv!11243 a!3235)))

(declare-fun b!496788 () Bool)

(declare-fun e!291282 () Bool)

(assert (=> b!496788 (= e!291280 (not e!291282))))

(declare-fun res!299170 () Bool)

(assert (=> b!496788 (=> res!299170 e!291282)))

(declare-fun lt!224900 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3914 0))(
  ( (MissingZero!3914 (index!17835 (_ BitVec 32))) (Found!3914 (index!17836 (_ BitVec 32))) (Intermediate!3914 (undefined!4726 Bool) (index!17837 (_ BitVec 32)) (x!46894 (_ BitVec 32))) (Undefined!3914) (MissingVacant!3914 (index!17838 (_ BitVec 32))) )
))
(declare-fun lt!224899 () SeekEntryResult!3914)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32128 (_ BitVec 32)) SeekEntryResult!3914)

(assert (=> b!496788 (= res!299170 (= lt!224899 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224900 (select (store (arr!15447 a!3235) i!1204 k!2280) j!176) (array!32129 (store (arr!15447 a!3235) i!1204 k!2280) (size!15811 a!3235)) mask!3524)))))

(declare-fun lt!224902 () (_ BitVec 32))

(assert (=> b!496788 (= lt!224899 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224902 (select (arr!15447 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496788 (= lt!224900 (toIndex!0 (select (store (arr!15447 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496788 (= lt!224902 (toIndex!0 (select (arr!15447 a!3235) j!176) mask!3524))))

(declare-fun e!291281 () Bool)

(assert (=> b!496788 e!291281))

(declare-fun res!299175 () Bool)

(assert (=> b!496788 (=> (not res!299175) (not e!291281))))

(assert (=> b!496788 (= res!299175 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14774 0))(
  ( (Unit!14775) )
))
(declare-fun lt!224898 () Unit!14774)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14774)

(assert (=> b!496788 (= lt!224898 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496789 () Bool)

(declare-fun res!299171 () Bool)

(assert (=> b!496789 (=> (not res!299171) (not e!291278))))

(assert (=> b!496789 (= res!299171 (and (= (size!15811 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15811 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15811 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496790 () Bool)

(declare-fun res!299178 () Bool)

(assert (=> b!496790 (=> res!299178 e!291282)))

(assert (=> b!496790 (= res!299178 (or (undefined!4726 lt!224899) (not (is-Intermediate!3914 lt!224899))))))

(declare-fun b!496791 () Bool)

(assert (=> b!496791 (= e!291278 e!291280)))

(declare-fun res!299180 () Bool)

(assert (=> b!496791 (=> (not res!299180) (not e!291280))))

(declare-fun lt!224901 () SeekEntryResult!3914)

(assert (=> b!496791 (= res!299180 (or (= lt!224901 (MissingZero!3914 i!1204)) (= lt!224901 (MissingVacant!3914 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32128 (_ BitVec 32)) SeekEntryResult!3914)

(assert (=> b!496791 (= lt!224901 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!496792 () Bool)

(assert (=> b!496792 (= e!291281 (= (seekEntryOrOpen!0 (select (arr!15447 a!3235) j!176) a!3235 mask!3524) (Found!3914 j!176)))))

(declare-fun b!496793 () Bool)

(assert (=> b!496793 (= e!291282 true)))

(assert (=> b!496793 (and (bvslt (x!46894 lt!224899) #b01111111111111111111111111111110) (or (= (select (arr!15447 a!3235) (index!17837 lt!224899)) (select (arr!15447 a!3235) j!176)) (= (select (arr!15447 a!3235) (index!17837 lt!224899)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15447 a!3235) (index!17837 lt!224899)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45240 res!299179) b!496789))

(assert (= (and b!496789 res!299171) b!496785))

(assert (= (and b!496785 res!299172) b!496783))

(assert (= (and b!496783 res!299173) b!496787))

(assert (= (and b!496787 res!299174) b!496791))

(assert (= (and b!496791 res!299180) b!496784))

(assert (= (and b!496784 res!299176) b!496786))

(assert (= (and b!496786 res!299177) b!496788))

(assert (= (and b!496788 res!299175) b!496792))

(assert (= (and b!496788 (not res!299170)) b!496790))

(assert (= (and b!496790 (not res!299178)) b!496793))

(declare-fun m!478071 () Bool)

(assert (=> b!496791 m!478071))

(declare-fun m!478073 () Bool)

(assert (=> b!496788 m!478073))

(declare-fun m!478075 () Bool)

(assert (=> b!496788 m!478075))

(declare-fun m!478077 () Bool)

(assert (=> b!496788 m!478077))

(declare-fun m!478079 () Bool)

(assert (=> b!496788 m!478079))

(assert (=> b!496788 m!478077))

(declare-fun m!478081 () Bool)

(assert (=> b!496788 m!478081))

(assert (=> b!496788 m!478077))

(declare-fun m!478083 () Bool)

(assert (=> b!496788 m!478083))

(assert (=> b!496788 m!478075))

(declare-fun m!478085 () Bool)

(assert (=> b!496788 m!478085))

(assert (=> b!496788 m!478075))

(declare-fun m!478087 () Bool)

(assert (=> b!496788 m!478087))

(declare-fun m!478089 () Bool)

(assert (=> b!496788 m!478089))

(declare-fun m!478091 () Bool)

(assert (=> b!496784 m!478091))

(declare-fun m!478093 () Bool)

(assert (=> start!45240 m!478093))

(declare-fun m!478095 () Bool)

(assert (=> start!45240 m!478095))

(assert (=> b!496785 m!478077))

(assert (=> b!496785 m!478077))

(declare-fun m!478097 () Bool)

(assert (=> b!496785 m!478097))

(declare-fun m!478099 () Bool)

(assert (=> b!496786 m!478099))

(declare-fun m!478101 () Bool)

(assert (=> b!496793 m!478101))

(assert (=> b!496793 m!478077))

(declare-fun m!478103 () Bool)

(assert (=> b!496783 m!478103))

(assert (=> b!496792 m!478077))

(assert (=> b!496792 m!478077))

(declare-fun m!478105 () Bool)

(assert (=> b!496792 m!478105))

(declare-fun m!478107 () Bool)

(assert (=> b!496787 m!478107))

(push 1)

(assert (not b!496791))

(assert (not b!496786))

(assert (not b!496792))

(assert (not b!496787))

(assert (not b!496785))

(assert (not b!496784))

(assert (not b!496788))

(assert (not b!496783))

(assert (not start!45240))

(check-sat)

