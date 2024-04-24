; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45032 () Bool)

(assert start!45032)

(declare-fun b!494215 () Bool)

(declare-fun res!296848 () Bool)

(declare-fun e!290082 () Bool)

(assert (=> b!494215 (=> (not res!296848) (not e!290082))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31978 0))(
  ( (array!31979 (arr!15373 (Array (_ BitVec 32) (_ BitVec 64))) (size!15737 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31978)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494215 (= res!296848 (and (= (size!15737 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15737 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15737 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494216 () Bool)

(declare-fun res!296842 () Bool)

(assert (=> b!494216 (=> (not res!296842) (not e!290082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494216 (= res!296842 (validKeyInArray!0 (select (arr!15373 a!3235) j!176)))))

(declare-fun b!494217 () Bool)

(declare-fun res!296839 () Bool)

(declare-fun e!290080 () Bool)

(assert (=> b!494217 (=> (not res!296839) (not e!290080))))

(declare-datatypes ((List!9438 0))(
  ( (Nil!9435) (Cons!9434 (h!10302 (_ BitVec 64)) (t!15658 List!9438)) )
))
(declare-fun arrayNoDuplicates!0 (array!31978 (_ BitVec 32) List!9438) Bool)

(assert (=> b!494217 (= res!296839 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9435))))

(declare-fun b!494218 () Bool)

(declare-fun e!290081 () Bool)

(assert (=> b!494218 (= e!290081 true)))

(declare-datatypes ((SeekEntryResult!3796 0))(
  ( (MissingZero!3796 (index!17363 (_ BitVec 32))) (Found!3796 (index!17364 (_ BitVec 32))) (Intermediate!3796 (undefined!4608 Bool) (index!17365 (_ BitVec 32)) (x!46583 (_ BitVec 32))) (Undefined!3796) (MissingVacant!3796 (index!17366 (_ BitVec 32))) )
))
(declare-fun lt!223687 () SeekEntryResult!3796)

(assert (=> b!494218 (= lt!223687 Undefined!3796)))

(declare-fun b!494219 () Bool)

(declare-fun res!296845 () Bool)

(assert (=> b!494219 (=> res!296845 e!290081)))

(declare-fun lt!223688 () SeekEntryResult!3796)

(get-info :version)

(assert (=> b!494219 (= res!296845 (or (not ((_ is Intermediate!3796) lt!223688)) (not (undefined!4608 lt!223688))))))

(declare-fun b!494220 () Bool)

(declare-fun res!296841 () Bool)

(assert (=> b!494220 (=> (not res!296841) (not e!290082))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!494220 (= res!296841 (validKeyInArray!0 k0!2280))))

(declare-fun b!494221 () Bool)

(declare-fun res!296847 () Bool)

(assert (=> b!494221 (=> (not res!296847) (not e!290080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31978 (_ BitVec 32)) Bool)

(assert (=> b!494221 (= res!296847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494222 () Bool)

(assert (=> b!494222 (= e!290080 (not e!290081))))

(declare-fun res!296844 () Bool)

(assert (=> b!494222 (=> res!296844 e!290081)))

(declare-fun lt!223685 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31978 (_ BitVec 32)) SeekEntryResult!3796)

(assert (=> b!494222 (= res!296844 (= lt!223688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223685 (select (store (arr!15373 a!3235) i!1204 k0!2280) j!176) (array!31979 (store (arr!15373 a!3235) i!1204 k0!2280) (size!15737 a!3235)) mask!3524)))))

(declare-fun lt!223689 () (_ BitVec 32))

(assert (=> b!494222 (= lt!223688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223689 (select (arr!15373 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494222 (= lt!223685 (toIndex!0 (select (store (arr!15373 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494222 (= lt!223689 (toIndex!0 (select (arr!15373 a!3235) j!176) mask!3524))))

(assert (=> b!494222 (= lt!223687 (Found!3796 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31978 (_ BitVec 32)) SeekEntryResult!3796)

(assert (=> b!494222 (= lt!223687 (seekEntryOrOpen!0 (select (arr!15373 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494222 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14599 0))(
  ( (Unit!14600) )
))
(declare-fun lt!223686 () Unit!14599)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14599)

(assert (=> b!494222 (= lt!223686 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!296843 () Bool)

(assert (=> start!45032 (=> (not res!296843) (not e!290082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45032 (= res!296843 (validMask!0 mask!3524))))

(assert (=> start!45032 e!290082))

(assert (=> start!45032 true))

(declare-fun array_inv!11232 (array!31978) Bool)

(assert (=> start!45032 (array_inv!11232 a!3235)))

(declare-fun b!494223 () Bool)

(assert (=> b!494223 (= e!290082 e!290080)))

(declare-fun res!296840 () Bool)

(assert (=> b!494223 (=> (not res!296840) (not e!290080))))

(declare-fun lt!223690 () SeekEntryResult!3796)

(assert (=> b!494223 (= res!296840 (or (= lt!223690 (MissingZero!3796 i!1204)) (= lt!223690 (MissingVacant!3796 i!1204))))))

(assert (=> b!494223 (= lt!223690 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494224 () Bool)

(declare-fun res!296846 () Bool)

(assert (=> b!494224 (=> (not res!296846) (not e!290082))))

(declare-fun arrayContainsKey!0 (array!31978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494224 (= res!296846 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45032 res!296843) b!494215))

(assert (= (and b!494215 res!296848) b!494216))

(assert (= (and b!494216 res!296842) b!494220))

(assert (= (and b!494220 res!296841) b!494224))

(assert (= (and b!494224 res!296846) b!494223))

(assert (= (and b!494223 res!296840) b!494221))

(assert (= (and b!494221 res!296847) b!494217))

(assert (= (and b!494217 res!296839) b!494222))

(assert (= (and b!494222 (not res!296844)) b!494219))

(assert (= (and b!494219 (not res!296845)) b!494218))

(declare-fun m!475471 () Bool)

(assert (=> b!494217 m!475471))

(declare-fun m!475473 () Bool)

(assert (=> b!494220 m!475473))

(declare-fun m!475475 () Bool)

(assert (=> b!494216 m!475475))

(assert (=> b!494216 m!475475))

(declare-fun m!475477 () Bool)

(assert (=> b!494216 m!475477))

(declare-fun m!475479 () Bool)

(assert (=> b!494223 m!475479))

(declare-fun m!475481 () Bool)

(assert (=> start!45032 m!475481))

(declare-fun m!475483 () Bool)

(assert (=> start!45032 m!475483))

(declare-fun m!475485 () Bool)

(assert (=> b!494221 m!475485))

(declare-fun m!475487 () Bool)

(assert (=> b!494222 m!475487))

(declare-fun m!475489 () Bool)

(assert (=> b!494222 m!475489))

(declare-fun m!475491 () Bool)

(assert (=> b!494222 m!475491))

(assert (=> b!494222 m!475487))

(assert (=> b!494222 m!475475))

(declare-fun m!475493 () Bool)

(assert (=> b!494222 m!475493))

(assert (=> b!494222 m!475475))

(declare-fun m!475495 () Bool)

(assert (=> b!494222 m!475495))

(assert (=> b!494222 m!475475))

(declare-fun m!475497 () Bool)

(assert (=> b!494222 m!475497))

(assert (=> b!494222 m!475487))

(declare-fun m!475499 () Bool)

(assert (=> b!494222 m!475499))

(assert (=> b!494222 m!475475))

(declare-fun m!475501 () Bool)

(assert (=> b!494222 m!475501))

(declare-fun m!475503 () Bool)

(assert (=> b!494222 m!475503))

(declare-fun m!475505 () Bool)

(assert (=> b!494224 m!475505))

(check-sat (not b!494223) (not b!494224) (not b!494221) (not b!494217) (not start!45032) (not b!494220) (not b!494216) (not b!494222))
(check-sat)
