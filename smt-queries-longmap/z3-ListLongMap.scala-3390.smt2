; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46742 () Bool)

(assert start!46742)

(declare-fun b!516210 () Bool)

(declare-fun res!315834 () Bool)

(declare-fun e!301288 () Bool)

(assert (=> b!516210 (=> (not res!315834) (not e!301288))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516210 (= res!315834 (validKeyInArray!0 k0!2280))))

(declare-fun b!516211 () Bool)

(declare-fun res!315838 () Bool)

(assert (=> b!516211 (=> (not res!315838) (not e!301288))))

(declare-datatypes ((array!33055 0))(
  ( (array!33056 (arr!15895 (Array (_ BitVec 32) (_ BitVec 64))) (size!16259 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33055)

(declare-fun arrayContainsKey!0 (array!33055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516211 (= res!315838 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516212 () Bool)

(declare-fun res!315835 () Bool)

(declare-fun e!301290 () Bool)

(assert (=> b!516212 (=> res!315835 e!301290)))

(declare-datatypes ((SeekEntryResult!4318 0))(
  ( (MissingZero!4318 (index!19460 (_ BitVec 32))) (Found!4318 (index!19461 (_ BitVec 32))) (Intermediate!4318 (undefined!5130 Bool) (index!19462 (_ BitVec 32)) (x!48566 (_ BitVec 32))) (Undefined!4318) (MissingVacant!4318 (index!19463 (_ BitVec 32))) )
))
(declare-fun lt!236355 () SeekEntryResult!4318)

(get-info :version)

(assert (=> b!516212 (= res!315835 (or (undefined!5130 lt!236355) (not ((_ is Intermediate!4318) lt!236355))))))

(declare-fun b!516214 () Bool)

(declare-fun res!315836 () Bool)

(declare-fun e!301287 () Bool)

(assert (=> b!516214 (=> (not res!315836) (not e!301287))))

(declare-datatypes ((List!9960 0))(
  ( (Nil!9957) (Cons!9956 (h!10854 (_ BitVec 64)) (t!16180 List!9960)) )
))
(declare-fun arrayNoDuplicates!0 (array!33055 (_ BitVec 32) List!9960) Bool)

(assert (=> b!516214 (= res!315836 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9957))))

(declare-fun b!516215 () Bool)

(assert (=> b!516215 (= e!301288 e!301287)))

(declare-fun res!315830 () Bool)

(assert (=> b!516215 (=> (not res!315830) (not e!301287))))

(declare-fun lt!236356 () SeekEntryResult!4318)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516215 (= res!315830 (or (= lt!236356 (MissingZero!4318 i!1204)) (= lt!236356 (MissingVacant!4318 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33055 (_ BitVec 32)) SeekEntryResult!4318)

(assert (=> b!516215 (= lt!236356 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516216 () Bool)

(declare-fun res!315833 () Bool)

(assert (=> b!516216 (=> (not res!315833) (not e!301288))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!516216 (= res!315833 (validKeyInArray!0 (select (arr!15895 a!3235) j!176)))))

(declare-fun b!516217 () Bool)

(assert (=> b!516217 (= e!301290 true)))

(assert (=> b!516217 (and (bvslt (x!48566 lt!236355) #b01111111111111111111111111111110) (or (= (select (arr!15895 a!3235) (index!19462 lt!236355)) (select (arr!15895 a!3235) j!176)) (= (select (arr!15895 a!3235) (index!19462 lt!236355)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15895 a!3235) (index!19462 lt!236355)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!301286 () Bool)

(declare-fun b!516218 () Bool)

(assert (=> b!516218 (= e!301286 (= (seekEntryOrOpen!0 (select (arr!15895 a!3235) j!176) a!3235 mask!3524) (Found!4318 j!176)))))

(declare-fun b!516219 () Bool)

(declare-fun res!315828 () Bool)

(assert (=> b!516219 (=> (not res!315828) (not e!301288))))

(assert (=> b!516219 (= res!315828 (and (= (size!16259 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16259 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16259 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516220 () Bool)

(declare-fun res!315832 () Bool)

(assert (=> b!516220 (=> (not res!315832) (not e!301287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33055 (_ BitVec 32)) Bool)

(assert (=> b!516220 (= res!315832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516213 () Bool)

(assert (=> b!516213 (= e!301287 (not e!301290))))

(declare-fun res!315829 () Bool)

(assert (=> b!516213 (=> res!315829 e!301290)))

(declare-fun lt!236353 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33055 (_ BitVec 32)) SeekEntryResult!4318)

(assert (=> b!516213 (= res!315829 (= lt!236355 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236353 (select (store (arr!15895 a!3235) i!1204 k0!2280) j!176) (array!33056 (store (arr!15895 a!3235) i!1204 k0!2280) (size!16259 a!3235)) mask!3524)))))

(declare-fun lt!236354 () (_ BitVec 32))

(assert (=> b!516213 (= lt!236355 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236354 (select (arr!15895 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516213 (= lt!236353 (toIndex!0 (select (store (arr!15895 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516213 (= lt!236354 (toIndex!0 (select (arr!15895 a!3235) j!176) mask!3524))))

(assert (=> b!516213 e!301286))

(declare-fun res!315837 () Bool)

(assert (=> b!516213 (=> (not res!315837) (not e!301286))))

(assert (=> b!516213 (= res!315837 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15955 0))(
  ( (Unit!15956) )
))
(declare-fun lt!236352 () Unit!15955)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33055 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15955)

(assert (=> b!516213 (= lt!236352 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!315831 () Bool)

(assert (=> start!46742 (=> (not res!315831) (not e!301288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46742 (= res!315831 (validMask!0 mask!3524))))

(assert (=> start!46742 e!301288))

(assert (=> start!46742 true))

(declare-fun array_inv!11754 (array!33055) Bool)

(assert (=> start!46742 (array_inv!11754 a!3235)))

(assert (= (and start!46742 res!315831) b!516219))

(assert (= (and b!516219 res!315828) b!516216))

(assert (= (and b!516216 res!315833) b!516210))

(assert (= (and b!516210 res!315834) b!516211))

(assert (= (and b!516211 res!315838) b!516215))

(assert (= (and b!516215 res!315830) b!516220))

(assert (= (and b!516220 res!315832) b!516214))

(assert (= (and b!516214 res!315836) b!516213))

(assert (= (and b!516213 res!315837) b!516218))

(assert (= (and b!516213 (not res!315829)) b!516212))

(assert (= (and b!516212 (not res!315835)) b!516217))

(declare-fun m!497917 () Bool)

(assert (=> b!516220 m!497917))

(declare-fun m!497919 () Bool)

(assert (=> b!516210 m!497919))

(declare-fun m!497921 () Bool)

(assert (=> b!516218 m!497921))

(assert (=> b!516218 m!497921))

(declare-fun m!497923 () Bool)

(assert (=> b!516218 m!497923))

(declare-fun m!497925 () Bool)

(assert (=> b!516217 m!497925))

(assert (=> b!516217 m!497921))

(declare-fun m!497927 () Bool)

(assert (=> b!516214 m!497927))

(assert (=> b!516216 m!497921))

(assert (=> b!516216 m!497921))

(declare-fun m!497929 () Bool)

(assert (=> b!516216 m!497929))

(declare-fun m!497931 () Bool)

(assert (=> b!516211 m!497931))

(declare-fun m!497933 () Bool)

(assert (=> start!46742 m!497933))

(declare-fun m!497935 () Bool)

(assert (=> start!46742 m!497935))

(declare-fun m!497937 () Bool)

(assert (=> b!516213 m!497937))

(declare-fun m!497939 () Bool)

(assert (=> b!516213 m!497939))

(assert (=> b!516213 m!497921))

(declare-fun m!497941 () Bool)

(assert (=> b!516213 m!497941))

(assert (=> b!516213 m!497921))

(declare-fun m!497943 () Bool)

(assert (=> b!516213 m!497943))

(declare-fun m!497945 () Bool)

(assert (=> b!516213 m!497945))

(assert (=> b!516213 m!497943))

(assert (=> b!516213 m!497921))

(declare-fun m!497947 () Bool)

(assert (=> b!516213 m!497947))

(declare-fun m!497949 () Bool)

(assert (=> b!516213 m!497949))

(assert (=> b!516213 m!497943))

(declare-fun m!497951 () Bool)

(assert (=> b!516213 m!497951))

(declare-fun m!497953 () Bool)

(assert (=> b!516215 m!497953))

(check-sat (not b!516216) (not b!516218) (not b!516215) (not b!516214) (not b!516213) (not b!516211) (not start!46742) (not b!516210) (not b!516220))
(check-sat)
