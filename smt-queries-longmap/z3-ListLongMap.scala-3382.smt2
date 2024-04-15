; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46692 () Bool)

(assert start!46692)

(declare-fun b!515208 () Bool)

(declare-fun res!314918 () Bool)

(declare-fun e!300794 () Bool)

(assert (=> b!515208 (=> (not res!314918) (not e!300794))))

(declare-datatypes ((array!33014 0))(
  ( (array!33015 (arr!15875 (Array (_ BitVec 32) (_ BitVec 64))) (size!16240 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33014)

(declare-datatypes ((List!10072 0))(
  ( (Nil!10069) (Cons!10068 (h!10966 (_ BitVec 64)) (t!16291 List!10072)) )
))
(declare-fun arrayNoDuplicates!0 (array!33014 (_ BitVec 32) List!10072) Bool)

(assert (=> b!515208 (= res!314918 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10069))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!300791 () Bool)

(declare-fun b!515209 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4339 0))(
  ( (MissingZero!4339 (index!19544 (_ BitVec 32))) (Found!4339 (index!19545 (_ BitVec 32))) (Intermediate!4339 (undefined!5151 Bool) (index!19546 (_ BitVec 32)) (x!48521 (_ BitVec 32))) (Undefined!4339) (MissingVacant!4339 (index!19547 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33014 (_ BitVec 32)) SeekEntryResult!4339)

(assert (=> b!515209 (= e!300791 (= (seekEntryOrOpen!0 (select (arr!15875 a!3235) j!176) a!3235 mask!3524) (Found!4339 j!176)))))

(declare-fun b!515210 () Bool)

(declare-fun res!314919 () Bool)

(declare-fun e!300792 () Bool)

(assert (=> b!515210 (=> (not res!314919) (not e!300792))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515210 (= res!314919 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515211 () Bool)

(declare-fun e!300795 () Bool)

(assert (=> b!515211 (= e!300795 true)))

(declare-fun lt!235747 () SeekEntryResult!4339)

(assert (=> b!515211 (and (bvslt (x!48521 lt!235747) #b01111111111111111111111111111110) (or (= (select (arr!15875 a!3235) (index!19546 lt!235747)) (select (arr!15875 a!3235) j!176)) (= (select (arr!15875 a!3235) (index!19546 lt!235747)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15875 a!3235) (index!19546 lt!235747)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515212 () Bool)

(declare-fun res!314924 () Bool)

(assert (=> b!515212 (=> res!314924 e!300795)))

(get-info :version)

(assert (=> b!515212 (= res!314924 (or (undefined!5151 lt!235747) (not ((_ is Intermediate!4339) lt!235747))))))

(declare-fun b!515213 () Bool)

(assert (=> b!515213 (= e!300792 e!300794)))

(declare-fun res!314921 () Bool)

(assert (=> b!515213 (=> (not res!314921) (not e!300794))))

(declare-fun lt!235746 () SeekEntryResult!4339)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515213 (= res!314921 (or (= lt!235746 (MissingZero!4339 i!1204)) (= lt!235746 (MissingVacant!4339 i!1204))))))

(assert (=> b!515213 (= lt!235746 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!314916 () Bool)

(assert (=> start!46692 (=> (not res!314916) (not e!300792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46692 (= res!314916 (validMask!0 mask!3524))))

(assert (=> start!46692 e!300792))

(assert (=> start!46692 true))

(declare-fun array_inv!11758 (array!33014) Bool)

(assert (=> start!46692 (array_inv!11758 a!3235)))

(declare-fun b!515214 () Bool)

(declare-fun res!314917 () Bool)

(assert (=> b!515214 (=> (not res!314917) (not e!300792))))

(assert (=> b!515214 (= res!314917 (and (= (size!16240 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16240 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16240 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515215 () Bool)

(assert (=> b!515215 (= e!300794 (not e!300795))))

(declare-fun res!314914 () Bool)

(assert (=> b!515215 (=> res!314914 e!300795)))

(declare-fun lt!235750 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33014 (_ BitVec 32)) SeekEntryResult!4339)

(assert (=> b!515215 (= res!314914 (= lt!235747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235750 (select (store (arr!15875 a!3235) i!1204 k0!2280) j!176) (array!33015 (store (arr!15875 a!3235) i!1204 k0!2280) (size!16240 a!3235)) mask!3524)))))

(declare-fun lt!235748 () (_ BitVec 32))

(assert (=> b!515215 (= lt!235747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235748 (select (arr!15875 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515215 (= lt!235750 (toIndex!0 (select (store (arr!15875 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515215 (= lt!235748 (toIndex!0 (select (arr!15875 a!3235) j!176) mask!3524))))

(assert (=> b!515215 e!300791))

(declare-fun res!314915 () Bool)

(assert (=> b!515215 (=> (not res!314915) (not e!300791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33014 (_ BitVec 32)) Bool)

(assert (=> b!515215 (= res!314915 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15922 0))(
  ( (Unit!15923) )
))
(declare-fun lt!235749 () Unit!15922)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33014 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15922)

(assert (=> b!515215 (= lt!235749 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515216 () Bool)

(declare-fun res!314920 () Bool)

(assert (=> b!515216 (=> (not res!314920) (not e!300794))))

(assert (=> b!515216 (= res!314920 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515217 () Bool)

(declare-fun res!314923 () Bool)

(assert (=> b!515217 (=> (not res!314923) (not e!300792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515217 (= res!314923 (validKeyInArray!0 k0!2280))))

(declare-fun b!515218 () Bool)

(declare-fun res!314922 () Bool)

(assert (=> b!515218 (=> (not res!314922) (not e!300792))))

(assert (=> b!515218 (= res!314922 (validKeyInArray!0 (select (arr!15875 a!3235) j!176)))))

(assert (= (and start!46692 res!314916) b!515214))

(assert (= (and b!515214 res!314917) b!515218))

(assert (= (and b!515218 res!314922) b!515217))

(assert (= (and b!515217 res!314923) b!515210))

(assert (= (and b!515210 res!314919) b!515213))

(assert (= (and b!515213 res!314921) b!515216))

(assert (= (and b!515216 res!314920) b!515208))

(assert (= (and b!515208 res!314918) b!515215))

(assert (= (and b!515215 res!314915) b!515209))

(assert (= (and b!515215 (not res!314914)) b!515212))

(assert (= (and b!515212 (not res!314924)) b!515211))

(declare-fun m!496069 () Bool)

(assert (=> b!515215 m!496069))

(declare-fun m!496071 () Bool)

(assert (=> b!515215 m!496071))

(declare-fun m!496073 () Bool)

(assert (=> b!515215 m!496073))

(declare-fun m!496075 () Bool)

(assert (=> b!515215 m!496075))

(assert (=> b!515215 m!496071))

(declare-fun m!496077 () Bool)

(assert (=> b!515215 m!496077))

(declare-fun m!496079 () Bool)

(assert (=> b!515215 m!496079))

(assert (=> b!515215 m!496077))

(declare-fun m!496081 () Bool)

(assert (=> b!515215 m!496081))

(assert (=> b!515215 m!496077))

(declare-fun m!496083 () Bool)

(assert (=> b!515215 m!496083))

(assert (=> b!515215 m!496071))

(declare-fun m!496085 () Bool)

(assert (=> b!515215 m!496085))

(declare-fun m!496087 () Bool)

(assert (=> b!515217 m!496087))

(assert (=> b!515218 m!496077))

(assert (=> b!515218 m!496077))

(declare-fun m!496089 () Bool)

(assert (=> b!515218 m!496089))

(declare-fun m!496091 () Bool)

(assert (=> start!46692 m!496091))

(declare-fun m!496093 () Bool)

(assert (=> start!46692 m!496093))

(declare-fun m!496095 () Bool)

(assert (=> b!515210 m!496095))

(declare-fun m!496097 () Bool)

(assert (=> b!515213 m!496097))

(declare-fun m!496099 () Bool)

(assert (=> b!515208 m!496099))

(declare-fun m!496101 () Bool)

(assert (=> b!515211 m!496101))

(assert (=> b!515211 m!496077))

(declare-fun m!496103 () Bool)

(assert (=> b!515216 m!496103))

(assert (=> b!515209 m!496077))

(assert (=> b!515209 m!496077))

(declare-fun m!496105 () Bool)

(assert (=> b!515209 m!496105))

(check-sat (not b!515213) (not b!515217) (not b!515215) (not b!515216) (not b!515210) (not start!46692) (not b!515218) (not b!515208) (not b!515209))
(check-sat)
