; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47772 () Bool)

(assert start!47772)

(declare-fun b!525993 () Bool)

(declare-fun res!322788 () Bool)

(declare-fun e!306600 () Bool)

(assert (=> b!525993 (=> res!322788 e!306600)))

(declare-datatypes ((SeekEntryResult!4525 0))(
  ( (MissingZero!4525 (index!20312 (_ BitVec 32))) (Found!4525 (index!20313 (_ BitVec 32))) (Intermediate!4525 (undefined!5337 Bool) (index!20314 (_ BitVec 32)) (x!49293 (_ BitVec 32))) (Undefined!4525) (MissingVacant!4525 (index!20315 (_ BitVec 32))) )
))
(declare-fun lt!241756 () SeekEntryResult!4525)

(get-info :version)

(assert (=> b!525993 (= res!322788 (or (undefined!5337 lt!241756) (not ((_ is Intermediate!4525) lt!241756))))))

(declare-fun b!525994 () Bool)

(declare-fun res!322787 () Bool)

(declare-fun e!306597 () Bool)

(assert (=> b!525994 (=> (not res!322787) (not e!306597))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33419 0))(
  ( (array!33420 (arr!16061 (Array (_ BitVec 32) (_ BitVec 64))) (size!16426 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33419)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525994 (= res!322787 (and (= (size!16426 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16426 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16426 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525995 () Bool)

(declare-fun res!322792 () Bool)

(declare-fun e!306601 () Bool)

(assert (=> b!525995 (=> (not res!322792) (not e!306601))))

(declare-datatypes ((List!10258 0))(
  ( (Nil!10255) (Cons!10254 (h!11185 (_ BitVec 64)) (t!16477 List!10258)) )
))
(declare-fun arrayNoDuplicates!0 (array!33419 (_ BitVec 32) List!10258) Bool)

(assert (=> b!525995 (= res!322792 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10255))))

(declare-fun e!306602 () Bool)

(declare-fun b!525996 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33419 (_ BitVec 32)) SeekEntryResult!4525)

(assert (=> b!525996 (= e!306602 (= (seekEntryOrOpen!0 (select (arr!16061 a!3235) j!176) a!3235 mask!3524) (Found!4525 j!176)))))

(declare-fun b!525997 () Bool)

(assert (=> b!525997 (= e!306600 true)))

(assert (=> b!525997 (= (index!20314 lt!241756) i!1204)))

(declare-fun lt!241753 () (_ BitVec 32))

(declare-datatypes ((Unit!16546 0))(
  ( (Unit!16547) )
))
(declare-fun lt!241750 () Unit!16546)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16546)

(assert (=> b!525997 (= lt!241750 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241753 #b00000000000000000000000000000000 (index!20314 lt!241756) (x!49293 lt!241756) mask!3524))))

(assert (=> b!525997 (and (or (= (select (arr!16061 a!3235) (index!20314 lt!241756)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16061 a!3235) (index!20314 lt!241756)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16061 a!3235) (index!20314 lt!241756)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16061 a!3235) (index!20314 lt!241756)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241757 () Unit!16546)

(declare-fun e!306598 () Unit!16546)

(assert (=> b!525997 (= lt!241757 e!306598)))

(declare-fun c!61911 () Bool)

(assert (=> b!525997 (= c!61911 (= (select (arr!16061 a!3235) (index!20314 lt!241756)) (select (arr!16061 a!3235) j!176)))))

(assert (=> b!525997 (and (bvslt (x!49293 lt!241756) #b01111111111111111111111111111110) (or (= (select (arr!16061 a!3235) (index!20314 lt!241756)) (select (arr!16061 a!3235) j!176)) (= (select (arr!16061 a!3235) (index!20314 lt!241756)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16061 a!3235) (index!20314 lt!241756)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525998 () Bool)

(declare-fun e!306603 () Bool)

(assert (=> b!525998 (= e!306603 false)))

(declare-fun b!525999 () Bool)

(declare-fun res!322793 () Bool)

(assert (=> b!525999 (=> (not res!322793) (not e!306601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33419 (_ BitVec 32)) Bool)

(assert (=> b!525999 (= res!322793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526000 () Bool)

(declare-fun Unit!16548 () Unit!16546)

(assert (=> b!526000 (= e!306598 Unit!16548)))

(declare-fun b!526001 () Bool)

(declare-fun res!322789 () Bool)

(assert (=> b!526001 (=> (not res!322789) (not e!306597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526001 (= res!322789 (validKeyInArray!0 k0!2280))))

(declare-fun b!526002 () Bool)

(declare-fun Unit!16549 () Unit!16546)

(assert (=> b!526002 (= e!306598 Unit!16549)))

(declare-fun lt!241752 () Unit!16546)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33419 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16546)

(assert (=> b!526002 (= lt!241752 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241753 #b00000000000000000000000000000000 (index!20314 lt!241756) (x!49293 lt!241756) mask!3524))))

(declare-fun lt!241754 () (_ BitVec 64))

(declare-fun res!322791 () Bool)

(declare-fun lt!241759 () array!33419)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33419 (_ BitVec 32)) SeekEntryResult!4525)

(assert (=> b!526002 (= res!322791 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241753 lt!241754 lt!241759 mask!3524) (Intermediate!4525 false (index!20314 lt!241756) (x!49293 lt!241756))))))

(assert (=> b!526002 (=> (not res!322791) (not e!306603))))

(assert (=> b!526002 e!306603))

(declare-fun b!526003 () Bool)

(declare-fun res!322782 () Bool)

(assert (=> b!526003 (=> (not res!322782) (not e!306597))))

(assert (=> b!526003 (= res!322782 (validKeyInArray!0 (select (arr!16061 a!3235) j!176)))))

(declare-fun b!526005 () Bool)

(declare-fun res!322784 () Bool)

(assert (=> b!526005 (=> (not res!322784) (not e!306597))))

(declare-fun arrayContainsKey!0 (array!33419 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526005 (= res!322784 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526006 () Bool)

(assert (=> b!526006 (= e!306601 (not e!306600))))

(declare-fun res!322790 () Bool)

(assert (=> b!526006 (=> res!322790 e!306600)))

(declare-fun lt!241751 () (_ BitVec 32))

(assert (=> b!526006 (= res!322790 (= lt!241756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241751 lt!241754 lt!241759 mask!3524)))))

(assert (=> b!526006 (= lt!241756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241753 (select (arr!16061 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526006 (= lt!241751 (toIndex!0 lt!241754 mask!3524))))

(assert (=> b!526006 (= lt!241754 (select (store (arr!16061 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526006 (= lt!241753 (toIndex!0 (select (arr!16061 a!3235) j!176) mask!3524))))

(assert (=> b!526006 (= lt!241759 (array!33420 (store (arr!16061 a!3235) i!1204 k0!2280) (size!16426 a!3235)))))

(assert (=> b!526006 e!306602))

(declare-fun res!322786 () Bool)

(assert (=> b!526006 (=> (not res!322786) (not e!306602))))

(assert (=> b!526006 (= res!322786 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241758 () Unit!16546)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33419 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16546)

(assert (=> b!526006 (= lt!241758 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!322785 () Bool)

(assert (=> start!47772 (=> (not res!322785) (not e!306597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47772 (= res!322785 (validMask!0 mask!3524))))

(assert (=> start!47772 e!306597))

(assert (=> start!47772 true))

(declare-fun array_inv!11944 (array!33419) Bool)

(assert (=> start!47772 (array_inv!11944 a!3235)))

(declare-fun b!526004 () Bool)

(assert (=> b!526004 (= e!306597 e!306601)))

(declare-fun res!322783 () Bool)

(assert (=> b!526004 (=> (not res!322783) (not e!306601))))

(declare-fun lt!241755 () SeekEntryResult!4525)

(assert (=> b!526004 (= res!322783 (or (= lt!241755 (MissingZero!4525 i!1204)) (= lt!241755 (MissingVacant!4525 i!1204))))))

(assert (=> b!526004 (= lt!241755 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!47772 res!322785) b!525994))

(assert (= (and b!525994 res!322787) b!526003))

(assert (= (and b!526003 res!322782) b!526001))

(assert (= (and b!526001 res!322789) b!526005))

(assert (= (and b!526005 res!322784) b!526004))

(assert (= (and b!526004 res!322783) b!525999))

(assert (= (and b!525999 res!322793) b!525995))

(assert (= (and b!525995 res!322792) b!526006))

(assert (= (and b!526006 res!322786) b!525996))

(assert (= (and b!526006 (not res!322790)) b!525993))

(assert (= (and b!525993 (not res!322788)) b!525997))

(assert (= (and b!525997 c!61911) b!526002))

(assert (= (and b!525997 (not c!61911)) b!526000))

(assert (= (and b!526002 res!322791) b!525998))

(declare-fun m!506209 () Bool)

(assert (=> b!525996 m!506209))

(assert (=> b!525996 m!506209))

(declare-fun m!506211 () Bool)

(assert (=> b!525996 m!506211))

(declare-fun m!506213 () Bool)

(assert (=> b!526006 m!506213))

(declare-fun m!506215 () Bool)

(assert (=> b!526006 m!506215))

(declare-fun m!506217 () Bool)

(assert (=> b!526006 m!506217))

(assert (=> b!526006 m!506209))

(declare-fun m!506219 () Bool)

(assert (=> b!526006 m!506219))

(assert (=> b!526006 m!506209))

(declare-fun m!506221 () Bool)

(assert (=> b!526006 m!506221))

(assert (=> b!526006 m!506209))

(declare-fun m!506223 () Bool)

(assert (=> b!526006 m!506223))

(declare-fun m!506225 () Bool)

(assert (=> b!526006 m!506225))

(declare-fun m!506227 () Bool)

(assert (=> b!526006 m!506227))

(declare-fun m!506229 () Bool)

(assert (=> b!526005 m!506229))

(declare-fun m!506231 () Bool)

(assert (=> start!47772 m!506231))

(declare-fun m!506233 () Bool)

(assert (=> start!47772 m!506233))

(declare-fun m!506235 () Bool)

(assert (=> b!526004 m!506235))

(declare-fun m!506237 () Bool)

(assert (=> b!526001 m!506237))

(declare-fun m!506239 () Bool)

(assert (=> b!525997 m!506239))

(declare-fun m!506241 () Bool)

(assert (=> b!525997 m!506241))

(assert (=> b!525997 m!506209))

(declare-fun m!506243 () Bool)

(assert (=> b!525995 m!506243))

(assert (=> b!526003 m!506209))

(assert (=> b!526003 m!506209))

(declare-fun m!506245 () Bool)

(assert (=> b!526003 m!506245))

(declare-fun m!506247 () Bool)

(assert (=> b!525999 m!506247))

(declare-fun m!506249 () Bool)

(assert (=> b!526002 m!506249))

(declare-fun m!506251 () Bool)

(assert (=> b!526002 m!506251))

(check-sat (not b!526002) (not b!525996) (not b!526001) (not b!525999) (not b!526005) (not start!47772) (not b!525997) (not b!526004) (not b!525995) (not b!526003) (not b!526006))
(check-sat)
