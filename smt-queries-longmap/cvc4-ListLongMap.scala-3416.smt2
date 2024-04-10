; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47422 () Bool)

(assert start!47422)

(declare-fun b!521830 () Bool)

(declare-fun res!319582 () Bool)

(declare-fun e!304410 () Bool)

(assert (=> b!521830 (=> (not res!319582) (not e!304410))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33248 0))(
  ( (array!33249 (arr!15980 (Array (_ BitVec 32) (_ BitVec 64))) (size!16344 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33248)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521830 (= res!319582 (and (= (size!16344 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16344 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16344 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521831 () Bool)

(declare-fun res!319581 () Bool)

(declare-fun e!304416 () Bool)

(assert (=> b!521831 (=> res!319581 e!304416)))

(declare-datatypes ((SeekEntryResult!4447 0))(
  ( (MissingZero!4447 (index!19991 (_ BitVec 32))) (Found!4447 (index!19992 (_ BitVec 32))) (Intermediate!4447 (undefined!5259 Bool) (index!19993 (_ BitVec 32)) (x!48969 (_ BitVec 32))) (Undefined!4447) (MissingVacant!4447 (index!19994 (_ BitVec 32))) )
))
(declare-fun lt!239213 () SeekEntryResult!4447)

(assert (=> b!521831 (= res!319581 (or (undefined!5259 lt!239213) (not (is-Intermediate!4447 lt!239213))))))

(declare-fun b!521832 () Bool)

(declare-fun e!304413 () Bool)

(assert (=> b!521832 (= e!304413 (not e!304416))))

(declare-fun res!319573 () Bool)

(assert (=> b!521832 (=> res!319573 e!304416)))

(declare-fun lt!239218 () (_ BitVec 32))

(declare-fun lt!239211 () array!33248)

(declare-fun lt!239214 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33248 (_ BitVec 32)) SeekEntryResult!4447)

(assert (=> b!521832 (= res!319573 (= lt!239213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239218 lt!239214 lt!239211 mask!3524)))))

(declare-fun lt!239217 () (_ BitVec 32))

(assert (=> b!521832 (= lt!239213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239217 (select (arr!15980 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521832 (= lt!239218 (toIndex!0 lt!239214 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!521832 (= lt!239214 (select (store (arr!15980 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!521832 (= lt!239217 (toIndex!0 (select (arr!15980 a!3235) j!176) mask!3524))))

(assert (=> b!521832 (= lt!239211 (array!33249 (store (arr!15980 a!3235) i!1204 k!2280) (size!16344 a!3235)))))

(declare-fun e!304415 () Bool)

(assert (=> b!521832 e!304415))

(declare-fun res!319576 () Bool)

(assert (=> b!521832 (=> (not res!319576) (not e!304415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33248 (_ BitVec 32)) Bool)

(assert (=> b!521832 (= res!319576 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16240 0))(
  ( (Unit!16241) )
))
(declare-fun lt!239216 () Unit!16240)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33248 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16240)

(assert (=> b!521832 (= lt!239216 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!319575 () Bool)

(assert (=> start!47422 (=> (not res!319575) (not e!304410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47422 (= res!319575 (validMask!0 mask!3524))))

(assert (=> start!47422 e!304410))

(assert (=> start!47422 true))

(declare-fun array_inv!11776 (array!33248) Bool)

(assert (=> start!47422 (array_inv!11776 a!3235)))

(declare-fun b!521833 () Bool)

(declare-fun res!319572 () Bool)

(assert (=> b!521833 (=> (not res!319572) (not e!304413))))

(assert (=> b!521833 (= res!319572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521834 () Bool)

(declare-fun res!319583 () Bool)

(assert (=> b!521834 (=> (not res!319583) (not e!304413))))

(declare-datatypes ((List!10138 0))(
  ( (Nil!10135) (Cons!10134 (h!11056 (_ BitVec 64)) (t!16366 List!10138)) )
))
(declare-fun arrayNoDuplicates!0 (array!33248 (_ BitVec 32) List!10138) Bool)

(assert (=> b!521834 (= res!319583 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10135))))

(declare-fun b!521835 () Bool)

(declare-fun res!319574 () Bool)

(assert (=> b!521835 (=> (not res!319574) (not e!304410))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521835 (= res!319574 (validKeyInArray!0 k!2280))))

(declare-fun b!521836 () Bool)

(declare-fun e!304412 () Unit!16240)

(declare-fun Unit!16242 () Unit!16240)

(assert (=> b!521836 (= e!304412 Unit!16242)))

(declare-fun b!521837 () Bool)

(assert (=> b!521837 (= e!304416 true)))

(assert (=> b!521837 (and (or (= (select (arr!15980 a!3235) (index!19993 lt!239213)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15980 a!3235) (index!19993 lt!239213)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15980 a!3235) (index!19993 lt!239213)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15980 a!3235) (index!19993 lt!239213)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239215 () Unit!16240)

(assert (=> b!521837 (= lt!239215 e!304412)))

(declare-fun c!61430 () Bool)

(assert (=> b!521837 (= c!61430 (= (select (arr!15980 a!3235) (index!19993 lt!239213)) (select (arr!15980 a!3235) j!176)))))

(assert (=> b!521837 (and (bvslt (x!48969 lt!239213) #b01111111111111111111111111111110) (or (= (select (arr!15980 a!3235) (index!19993 lt!239213)) (select (arr!15980 a!3235) j!176)) (= (select (arr!15980 a!3235) (index!19993 lt!239213)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15980 a!3235) (index!19993 lt!239213)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521838 () Bool)

(declare-fun e!304411 () Bool)

(assert (=> b!521838 (= e!304411 false)))

(declare-fun b!521839 () Bool)

(declare-fun Unit!16243 () Unit!16240)

(assert (=> b!521839 (= e!304412 Unit!16243)))

(declare-fun lt!239212 () Unit!16240)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33248 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16240)

(assert (=> b!521839 (= lt!239212 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!239217 #b00000000000000000000000000000000 (index!19993 lt!239213) (x!48969 lt!239213) mask!3524))))

(declare-fun res!319578 () Bool)

(assert (=> b!521839 (= res!319578 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239217 lt!239214 lt!239211 mask!3524) (Intermediate!4447 false (index!19993 lt!239213) (x!48969 lt!239213))))))

(assert (=> b!521839 (=> (not res!319578) (not e!304411))))

(assert (=> b!521839 e!304411))

(declare-fun b!521840 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33248 (_ BitVec 32)) SeekEntryResult!4447)

(assert (=> b!521840 (= e!304415 (= (seekEntryOrOpen!0 (select (arr!15980 a!3235) j!176) a!3235 mask!3524) (Found!4447 j!176)))))

(declare-fun b!521841 () Bool)

(declare-fun res!319577 () Bool)

(assert (=> b!521841 (=> (not res!319577) (not e!304410))))

(declare-fun arrayContainsKey!0 (array!33248 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521841 (= res!319577 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521842 () Bool)

(declare-fun res!319579 () Bool)

(assert (=> b!521842 (=> (not res!319579) (not e!304410))))

(assert (=> b!521842 (= res!319579 (validKeyInArray!0 (select (arr!15980 a!3235) j!176)))))

(declare-fun b!521843 () Bool)

(assert (=> b!521843 (= e!304410 e!304413)))

(declare-fun res!319580 () Bool)

(assert (=> b!521843 (=> (not res!319580) (not e!304413))))

(declare-fun lt!239210 () SeekEntryResult!4447)

(assert (=> b!521843 (= res!319580 (or (= lt!239210 (MissingZero!4447 i!1204)) (= lt!239210 (MissingVacant!4447 i!1204))))))

(assert (=> b!521843 (= lt!239210 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!47422 res!319575) b!521830))

(assert (= (and b!521830 res!319582) b!521842))

(assert (= (and b!521842 res!319579) b!521835))

(assert (= (and b!521835 res!319574) b!521841))

(assert (= (and b!521841 res!319577) b!521843))

(assert (= (and b!521843 res!319580) b!521833))

(assert (= (and b!521833 res!319572) b!521834))

(assert (= (and b!521834 res!319583) b!521832))

(assert (= (and b!521832 res!319576) b!521840))

(assert (= (and b!521832 (not res!319573)) b!521831))

(assert (= (and b!521831 (not res!319581)) b!521837))

(assert (= (and b!521837 c!61430) b!521839))

(assert (= (and b!521837 (not c!61430)) b!521836))

(assert (= (and b!521839 res!319578) b!521838))

(declare-fun m!502743 () Bool)

(assert (=> b!521837 m!502743))

(declare-fun m!502745 () Bool)

(assert (=> b!521837 m!502745))

(declare-fun m!502747 () Bool)

(assert (=> b!521834 m!502747))

(declare-fun m!502749 () Bool)

(assert (=> b!521833 m!502749))

(declare-fun m!502751 () Bool)

(assert (=> b!521832 m!502751))

(assert (=> b!521832 m!502745))

(declare-fun m!502753 () Bool)

(assert (=> b!521832 m!502753))

(declare-fun m!502755 () Bool)

(assert (=> b!521832 m!502755))

(declare-fun m!502757 () Bool)

(assert (=> b!521832 m!502757))

(declare-fun m!502759 () Bool)

(assert (=> b!521832 m!502759))

(assert (=> b!521832 m!502745))

(declare-fun m!502761 () Bool)

(assert (=> b!521832 m!502761))

(assert (=> b!521832 m!502745))

(declare-fun m!502763 () Bool)

(assert (=> b!521832 m!502763))

(declare-fun m!502765 () Bool)

(assert (=> b!521832 m!502765))

(declare-fun m!502767 () Bool)

(assert (=> start!47422 m!502767))

(declare-fun m!502769 () Bool)

(assert (=> start!47422 m!502769))

(assert (=> b!521840 m!502745))

(assert (=> b!521840 m!502745))

(declare-fun m!502771 () Bool)

(assert (=> b!521840 m!502771))

(declare-fun m!502773 () Bool)

(assert (=> b!521843 m!502773))

(declare-fun m!502775 () Bool)

(assert (=> b!521839 m!502775))

(declare-fun m!502777 () Bool)

(assert (=> b!521839 m!502777))

(declare-fun m!502779 () Bool)

(assert (=> b!521835 m!502779))

(assert (=> b!521842 m!502745))

(assert (=> b!521842 m!502745))

(declare-fun m!502781 () Bool)

(assert (=> b!521842 m!502781))

(declare-fun m!502783 () Bool)

(assert (=> b!521841 m!502783))

(push 1)

