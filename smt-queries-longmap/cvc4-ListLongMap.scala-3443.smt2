; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47782 () Bool)

(assert start!47782)

(declare-fun b!526222 () Bool)

(declare-datatypes ((Unit!16564 0))(
  ( (Unit!16565) )
))
(declare-fun e!306750 () Unit!16564)

(declare-fun Unit!16566 () Unit!16564)

(assert (=> b!526222 (= e!306750 Unit!16566)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!241955 () Unit!16564)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4528 0))(
  ( (MissingZero!4528 (index!20324 (_ BitVec 32))) (Found!4528 (index!20325 (_ BitVec 32))) (Intermediate!4528 (undefined!5340 Bool) (index!20326 (_ BitVec 32)) (x!49293 (_ BitVec 32))) (Undefined!4528) (MissingVacant!4528 (index!20327 (_ BitVec 32))) )
))
(declare-fun lt!241963 () SeekEntryResult!4528)

(declare-fun lt!241957 () (_ BitVec 32))

(declare-datatypes ((array!33419 0))(
  ( (array!33420 (arr!16061 (Array (_ BitVec 32) (_ BitVec 64))) (size!16425 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33419)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16564)

(assert (=> b!526222 (= lt!241955 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241957 #b00000000000000000000000000000000 (index!20326 lt!241963) (x!49293 lt!241963) mask!3524))))

(declare-fun lt!241961 () (_ BitVec 64))

(declare-fun res!322877 () Bool)

(declare-fun lt!241958 () array!33419)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33419 (_ BitVec 32)) SeekEntryResult!4528)

(assert (=> b!526222 (= res!322877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241957 lt!241961 lt!241958 mask!3524) (Intermediate!4528 false (index!20326 lt!241963) (x!49293 lt!241963))))))

(declare-fun e!306751 () Bool)

(assert (=> b!526222 (=> (not res!322877) (not e!306751))))

(assert (=> b!526222 e!306751))

(declare-fun b!526223 () Bool)

(declare-fun e!306756 () Bool)

(assert (=> b!526223 (= e!306756 true)))

(assert (=> b!526223 (= (index!20326 lt!241963) i!1204)))

(declare-fun lt!241962 () Unit!16564)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16564)

(assert (=> b!526223 (= lt!241962 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241957 #b00000000000000000000000000000000 (index!20326 lt!241963) (x!49293 lt!241963) mask!3524))))

(assert (=> b!526223 (and (or (= (select (arr!16061 a!3235) (index!20326 lt!241963)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16061 a!3235) (index!20326 lt!241963)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16061 a!3235) (index!20326 lt!241963)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16061 a!3235) (index!20326 lt!241963)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241956 () Unit!16564)

(assert (=> b!526223 (= lt!241956 e!306750)))

(declare-fun c!61979 () Bool)

(assert (=> b!526223 (= c!61979 (= (select (arr!16061 a!3235) (index!20326 lt!241963)) (select (arr!16061 a!3235) j!176)))))

(assert (=> b!526223 (and (bvslt (x!49293 lt!241963) #b01111111111111111111111111111110) (or (= (select (arr!16061 a!3235) (index!20326 lt!241963)) (select (arr!16061 a!3235) j!176)) (= (select (arr!16061 a!3235) (index!20326 lt!241963)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16061 a!3235) (index!20326 lt!241963)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!306753 () Bool)

(declare-fun b!526224 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33419 (_ BitVec 32)) SeekEntryResult!4528)

(assert (=> b!526224 (= e!306753 (= (seekEntryOrOpen!0 (select (arr!16061 a!3235) j!176) a!3235 mask!3524) (Found!4528 j!176)))))

(declare-fun b!526225 () Bool)

(declare-fun res!322886 () Bool)

(declare-fun e!306752 () Bool)

(assert (=> b!526225 (=> (not res!322886) (not e!306752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526225 (= res!322886 (validKeyInArray!0 (select (arr!16061 a!3235) j!176)))))

(declare-fun b!526226 () Bool)

(declare-fun res!322883 () Bool)

(assert (=> b!526226 (=> (not res!322883) (not e!306752))))

(assert (=> b!526226 (= res!322883 (and (= (size!16425 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16425 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16425 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!322876 () Bool)

(assert (=> start!47782 (=> (not res!322876) (not e!306752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47782 (= res!322876 (validMask!0 mask!3524))))

(assert (=> start!47782 e!306752))

(assert (=> start!47782 true))

(declare-fun array_inv!11857 (array!33419) Bool)

(assert (=> start!47782 (array_inv!11857 a!3235)))

(declare-fun b!526227 () Bool)

(assert (=> b!526227 (= e!306751 false)))

(declare-fun b!526228 () Bool)

(declare-fun res!322879 () Bool)

(declare-fun e!306755 () Bool)

(assert (=> b!526228 (=> (not res!322879) (not e!306755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33419 (_ BitVec 32)) Bool)

(assert (=> b!526228 (= res!322879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526229 () Bool)

(declare-fun res!322881 () Bool)

(assert (=> b!526229 (=> (not res!322881) (not e!306752))))

(assert (=> b!526229 (= res!322881 (validKeyInArray!0 k!2280))))

(declare-fun b!526230 () Bool)

(declare-fun res!322884 () Bool)

(assert (=> b!526230 (=> (not res!322884) (not e!306755))))

(declare-datatypes ((List!10219 0))(
  ( (Nil!10216) (Cons!10215 (h!11146 (_ BitVec 64)) (t!16447 List!10219)) )
))
(declare-fun arrayNoDuplicates!0 (array!33419 (_ BitVec 32) List!10219) Bool)

(assert (=> b!526230 (= res!322884 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10216))))

(declare-fun b!526231 () Bool)

(assert (=> b!526231 (= e!306752 e!306755)))

(declare-fun res!322878 () Bool)

(assert (=> b!526231 (=> (not res!322878) (not e!306755))))

(declare-fun lt!241959 () SeekEntryResult!4528)

(assert (=> b!526231 (= res!322878 (or (= lt!241959 (MissingZero!4528 i!1204)) (= lt!241959 (MissingVacant!4528 i!1204))))))

(assert (=> b!526231 (= lt!241959 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!526232 () Bool)

(declare-fun Unit!16567 () Unit!16564)

(assert (=> b!526232 (= e!306750 Unit!16567)))

(declare-fun b!526233 () Bool)

(declare-fun res!322875 () Bool)

(assert (=> b!526233 (=> res!322875 e!306756)))

(assert (=> b!526233 (= res!322875 (or (undefined!5340 lt!241963) (not (is-Intermediate!4528 lt!241963))))))

(declare-fun b!526234 () Bool)

(assert (=> b!526234 (= e!306755 (not e!306756))))

(declare-fun res!322885 () Bool)

(assert (=> b!526234 (=> res!322885 e!306756)))

(declare-fun lt!241960 () (_ BitVec 32))

(assert (=> b!526234 (= res!322885 (= lt!241963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241960 lt!241961 lt!241958 mask!3524)))))

(assert (=> b!526234 (= lt!241963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241957 (select (arr!16061 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526234 (= lt!241960 (toIndex!0 lt!241961 mask!3524))))

(assert (=> b!526234 (= lt!241961 (select (store (arr!16061 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526234 (= lt!241957 (toIndex!0 (select (arr!16061 a!3235) j!176) mask!3524))))

(assert (=> b!526234 (= lt!241958 (array!33420 (store (arr!16061 a!3235) i!1204 k!2280) (size!16425 a!3235)))))

(assert (=> b!526234 e!306753))

(declare-fun res!322880 () Bool)

(assert (=> b!526234 (=> (not res!322880) (not e!306753))))

(assert (=> b!526234 (= res!322880 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241954 () Unit!16564)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16564)

(assert (=> b!526234 (= lt!241954 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526235 () Bool)

(declare-fun res!322882 () Bool)

(assert (=> b!526235 (=> (not res!322882) (not e!306752))))

(declare-fun arrayContainsKey!0 (array!33419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526235 (= res!322882 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!47782 res!322876) b!526226))

(assert (= (and b!526226 res!322883) b!526225))

(assert (= (and b!526225 res!322886) b!526229))

(assert (= (and b!526229 res!322881) b!526235))

(assert (= (and b!526235 res!322882) b!526231))

(assert (= (and b!526231 res!322878) b!526228))

(assert (= (and b!526228 res!322879) b!526230))

(assert (= (and b!526230 res!322884) b!526234))

(assert (= (and b!526234 res!322880) b!526224))

(assert (= (and b!526234 (not res!322885)) b!526233))

(assert (= (and b!526233 (not res!322875)) b!526223))

(assert (= (and b!526223 c!61979) b!526222))

(assert (= (and b!526223 (not c!61979)) b!526232))

(assert (= (and b!526222 res!322877) b!526227))

(declare-fun m!506917 () Bool)

(assert (=> b!526225 m!506917))

(assert (=> b!526225 m!506917))

(declare-fun m!506919 () Bool)

(assert (=> b!526225 m!506919))

(assert (=> b!526224 m!506917))

(assert (=> b!526224 m!506917))

(declare-fun m!506921 () Bool)

(assert (=> b!526224 m!506921))

(declare-fun m!506923 () Bool)

(assert (=> b!526230 m!506923))

(declare-fun m!506925 () Bool)

(assert (=> b!526235 m!506925))

(declare-fun m!506927 () Bool)

(assert (=> b!526229 m!506927))

(declare-fun m!506929 () Bool)

(assert (=> start!47782 m!506929))

(declare-fun m!506931 () Bool)

(assert (=> start!47782 m!506931))

(declare-fun m!506933 () Bool)

(assert (=> b!526223 m!506933))

(declare-fun m!506935 () Bool)

(assert (=> b!526223 m!506935))

(assert (=> b!526223 m!506917))

(declare-fun m!506937 () Bool)

(assert (=> b!526222 m!506937))

(declare-fun m!506939 () Bool)

(assert (=> b!526222 m!506939))

(declare-fun m!506941 () Bool)

(assert (=> b!526234 m!506941))

(declare-fun m!506943 () Bool)

(assert (=> b!526234 m!506943))

(declare-fun m!506945 () Bool)

(assert (=> b!526234 m!506945))

(assert (=> b!526234 m!506917))

(declare-fun m!506947 () Bool)

(assert (=> b!526234 m!506947))

(assert (=> b!526234 m!506917))

(declare-fun m!506949 () Bool)

(assert (=> b!526234 m!506949))

(assert (=> b!526234 m!506917))

(declare-fun m!506951 () Bool)

(assert (=> b!526234 m!506951))

(declare-fun m!506953 () Bool)

(assert (=> b!526234 m!506953))

(declare-fun m!506955 () Bool)

(assert (=> b!526234 m!506955))

(declare-fun m!506957 () Bool)

(assert (=> b!526228 m!506957))

(declare-fun m!506959 () Bool)

(assert (=> b!526231 m!506959))

(push 1)

