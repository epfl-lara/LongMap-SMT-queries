; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44648 () Bool)

(assert start!44648)

(declare-fun b!489914 () Bool)

(declare-fun e!288061 () Bool)

(assert (=> b!489914 (= e!288061 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!221199 () (_ BitVec 32))

(declare-datatypes ((array!31708 0))(
  ( (array!31709 (arr!15241 (Array (_ BitVec 32) (_ BitVec 64))) (size!15605 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31708)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3664 0))(
  ( (MissingZero!3664 (index!16835 (_ BitVec 32))) (Found!3664 (index!16836 (_ BitVec 32))) (Intermediate!3664 (undefined!4476 Bool) (index!16837 (_ BitVec 32)) (x!46087 (_ BitVec 32))) (Undefined!3664) (MissingVacant!3664 (index!16838 (_ BitVec 32))) )
))
(declare-fun lt!221200 () SeekEntryResult!3664)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31708 (_ BitVec 32)) SeekEntryResult!3664)

(assert (=> b!489914 (= lt!221200 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221199 (select (store (arr!15241 a!3235) i!1204 k0!2280) j!176) (array!31709 (store (arr!15241 a!3235) i!1204 k0!2280) (size!15605 a!3235)) mask!3524))))

(declare-fun lt!221197 () SeekEntryResult!3664)

(declare-fun lt!221196 () (_ BitVec 32))

(assert (=> b!489914 (= lt!221197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221196 (select (arr!15241 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489914 (= lt!221199 (toIndex!0 (select (store (arr!15241 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489914 (= lt!221196 (toIndex!0 (select (arr!15241 a!3235) j!176) mask!3524))))

(declare-fun e!288060 () Bool)

(assert (=> b!489914 e!288060))

(declare-fun res!292906 () Bool)

(assert (=> b!489914 (=> (not res!292906) (not e!288060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31708 (_ BitVec 32)) Bool)

(assert (=> b!489914 (= res!292906 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14335 0))(
  ( (Unit!14336) )
))
(declare-fun lt!221198 () Unit!14335)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31708 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14335)

(assert (=> b!489914 (= lt!221198 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489915 () Bool)

(declare-fun res!292907 () Bool)

(assert (=> b!489915 (=> (not res!292907) (not e!288061))))

(assert (=> b!489915 (= res!292907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489916 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31708 (_ BitVec 32)) SeekEntryResult!3664)

(assert (=> b!489916 (= e!288060 (= (seekEntryOrOpen!0 (select (arr!15241 a!3235) j!176) a!3235 mask!3524) (Found!3664 j!176)))))

(declare-fun b!489917 () Bool)

(declare-fun res!292910 () Bool)

(declare-fun e!288063 () Bool)

(assert (=> b!489917 (=> (not res!292910) (not e!288063))))

(assert (=> b!489917 (= res!292910 (and (= (size!15605 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15605 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15605 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489919 () Bool)

(declare-fun res!292909 () Bool)

(assert (=> b!489919 (=> (not res!292909) (not e!288061))))

(declare-datatypes ((List!9306 0))(
  ( (Nil!9303) (Cons!9302 (h!10164 (_ BitVec 64)) (t!15526 List!9306)) )
))
(declare-fun arrayNoDuplicates!0 (array!31708 (_ BitVec 32) List!9306) Bool)

(assert (=> b!489919 (= res!292909 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9303))))

(declare-fun b!489920 () Bool)

(declare-fun res!292908 () Bool)

(assert (=> b!489920 (=> (not res!292908) (not e!288063))))

(declare-fun arrayContainsKey!0 (array!31708 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489920 (= res!292908 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489918 () Bool)

(declare-fun res!292912 () Bool)

(assert (=> b!489918 (=> (not res!292912) (not e!288063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489918 (= res!292912 (validKeyInArray!0 k0!2280))))

(declare-fun res!292904 () Bool)

(assert (=> start!44648 (=> (not res!292904) (not e!288063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44648 (= res!292904 (validMask!0 mask!3524))))

(assert (=> start!44648 e!288063))

(assert (=> start!44648 true))

(declare-fun array_inv!11100 (array!31708) Bool)

(assert (=> start!44648 (array_inv!11100 a!3235)))

(declare-fun b!489921 () Bool)

(assert (=> b!489921 (= e!288063 e!288061)))

(declare-fun res!292911 () Bool)

(assert (=> b!489921 (=> (not res!292911) (not e!288061))))

(declare-fun lt!221195 () SeekEntryResult!3664)

(assert (=> b!489921 (= res!292911 (or (= lt!221195 (MissingZero!3664 i!1204)) (= lt!221195 (MissingVacant!3664 i!1204))))))

(assert (=> b!489921 (= lt!221195 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489922 () Bool)

(declare-fun res!292905 () Bool)

(assert (=> b!489922 (=> (not res!292905) (not e!288063))))

(assert (=> b!489922 (= res!292905 (validKeyInArray!0 (select (arr!15241 a!3235) j!176)))))

(assert (= (and start!44648 res!292904) b!489917))

(assert (= (and b!489917 res!292910) b!489922))

(assert (= (and b!489922 res!292905) b!489918))

(assert (= (and b!489918 res!292912) b!489920))

(assert (= (and b!489920 res!292908) b!489921))

(assert (= (and b!489921 res!292911) b!489915))

(assert (= (and b!489915 res!292907) b!489919))

(assert (= (and b!489919 res!292909) b!489914))

(assert (= (and b!489914 res!292906) b!489916))

(declare-fun m!470113 () Bool)

(assert (=> b!489920 m!470113))

(declare-fun m!470115 () Bool)

(assert (=> b!489914 m!470115))

(declare-fun m!470117 () Bool)

(assert (=> b!489914 m!470117))

(declare-fun m!470119 () Bool)

(assert (=> b!489914 m!470119))

(declare-fun m!470121 () Bool)

(assert (=> b!489914 m!470121))

(declare-fun m!470123 () Bool)

(assert (=> b!489914 m!470123))

(assert (=> b!489914 m!470115))

(declare-fun m!470125 () Bool)

(assert (=> b!489914 m!470125))

(assert (=> b!489914 m!470115))

(declare-fun m!470127 () Bool)

(assert (=> b!489914 m!470127))

(assert (=> b!489914 m!470123))

(declare-fun m!470129 () Bool)

(assert (=> b!489914 m!470129))

(assert (=> b!489914 m!470123))

(declare-fun m!470131 () Bool)

(assert (=> b!489914 m!470131))

(declare-fun m!470133 () Bool)

(assert (=> b!489918 m!470133))

(declare-fun m!470135 () Bool)

(assert (=> b!489919 m!470135))

(assert (=> b!489916 m!470115))

(assert (=> b!489916 m!470115))

(declare-fun m!470137 () Bool)

(assert (=> b!489916 m!470137))

(declare-fun m!470139 () Bool)

(assert (=> b!489921 m!470139))

(declare-fun m!470141 () Bool)

(assert (=> b!489915 m!470141))

(declare-fun m!470143 () Bool)

(assert (=> start!44648 m!470143))

(declare-fun m!470145 () Bool)

(assert (=> start!44648 m!470145))

(assert (=> b!489922 m!470115))

(assert (=> b!489922 m!470115))

(declare-fun m!470147 () Bool)

(assert (=> b!489922 m!470147))

(check-sat (not b!489921) (not b!489922) (not b!489916) (not b!489918) (not start!44648) (not b!489920) (not b!489914) (not b!489915) (not b!489919))
(check-sat)
