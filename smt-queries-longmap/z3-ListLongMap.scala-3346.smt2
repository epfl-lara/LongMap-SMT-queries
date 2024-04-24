; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46058 () Bool)

(assert start!46058)

(declare-fun b!510155 () Bool)

(declare-fun res!311054 () Bool)

(declare-fun e!298229 () Bool)

(assert (=> b!510155 (=> (not res!311054) (not e!298229))))

(declare-datatypes ((array!32770 0))(
  ( (array!32771 (arr!15763 (Array (_ BitVec 32) (_ BitVec 64))) (size!16127 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32770)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510155 (= res!311054 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510156 () Bool)

(declare-fun e!298228 () Bool)

(assert (=> b!510156 (= e!298229 e!298228)))

(declare-fun res!311062 () Bool)

(assert (=> b!510156 (=> (not res!311062) (not e!298228))))

(declare-datatypes ((SeekEntryResult!4186 0))(
  ( (MissingZero!4186 (index!18932 (_ BitVec 32))) (Found!4186 (index!18933 (_ BitVec 32))) (Intermediate!4186 (undefined!4998 Bool) (index!18934 (_ BitVec 32)) (x!48040 (_ BitVec 32))) (Undefined!4186) (MissingVacant!4186 (index!18935 (_ BitVec 32))) )
))
(declare-fun lt!233246 () SeekEntryResult!4186)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510156 (= res!311062 (or (= lt!233246 (MissingZero!4186 i!1204)) (= lt!233246 (MissingVacant!4186 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32770 (_ BitVec 32)) SeekEntryResult!4186)

(assert (=> b!510156 (= lt!233246 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510157 () Bool)

(declare-fun res!311057 () Bool)

(assert (=> b!510157 (=> (not res!311057) (not e!298228))))

(declare-datatypes ((List!9828 0))(
  ( (Nil!9825) (Cons!9824 (h!10701 (_ BitVec 64)) (t!16048 List!9828)) )
))
(declare-fun arrayNoDuplicates!0 (array!32770 (_ BitVec 32) List!9828) Bool)

(assert (=> b!510157 (= res!311057 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9825))))

(declare-fun b!510158 () Bool)

(declare-fun res!311055 () Bool)

(assert (=> b!510158 (=> (not res!311055) (not e!298229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510158 (= res!311055 (validKeyInArray!0 k0!2280))))

(declare-fun b!510159 () Bool)

(declare-fun e!298227 () Bool)

(assert (=> b!510159 (= e!298228 (not e!298227))))

(declare-fun res!311058 () Bool)

(assert (=> b!510159 (=> res!311058 e!298227)))

(declare-fun lt!233250 () (_ BitVec 64))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!233249 () array!32770)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32770 (_ BitVec 32)) SeekEntryResult!4186)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510159 (= res!311058 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15763 a!3235) j!176) mask!3524) (select (arr!15763 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233250 mask!3524) lt!233250 lt!233249 mask!3524))))))

(assert (=> b!510159 (= lt!233250 (select (store (arr!15763 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510159 (= lt!233249 (array!32771 (store (arr!15763 a!3235) i!1204 k0!2280) (size!16127 a!3235)))))

(declare-fun lt!233247 () SeekEntryResult!4186)

(assert (=> b!510159 (= lt!233247 (Found!4186 j!176))))

(assert (=> b!510159 (= lt!233247 (seekEntryOrOpen!0 (select (arr!15763 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32770 (_ BitVec 32)) Bool)

(assert (=> b!510159 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15691 0))(
  ( (Unit!15692) )
))
(declare-fun lt!233251 () Unit!15691)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15691)

(assert (=> b!510159 (= lt!233251 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510160 () Bool)

(assert (=> b!510160 (= e!298227 true)))

(assert (=> b!510160 (= lt!233247 (seekEntryOrOpen!0 lt!233250 lt!233249 mask!3524))))

(declare-fun lt!233248 () Unit!15691)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32770 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15691)

(assert (=> b!510160 (= lt!233248 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510161 () Bool)

(declare-fun res!311056 () Bool)

(assert (=> b!510161 (=> (not res!311056) (not e!298229))))

(assert (=> b!510161 (= res!311056 (and (= (size!16127 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16127 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16127 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510162 () Bool)

(declare-fun res!311059 () Bool)

(assert (=> b!510162 (=> (not res!311059) (not e!298229))))

(assert (=> b!510162 (= res!311059 (validKeyInArray!0 (select (arr!15763 a!3235) j!176)))))

(declare-fun b!510163 () Bool)

(declare-fun res!311061 () Bool)

(assert (=> b!510163 (=> (not res!311061) (not e!298228))))

(assert (=> b!510163 (= res!311061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!311060 () Bool)

(assert (=> start!46058 (=> (not res!311060) (not e!298229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46058 (= res!311060 (validMask!0 mask!3524))))

(assert (=> start!46058 e!298229))

(assert (=> start!46058 true))

(declare-fun array_inv!11622 (array!32770) Bool)

(assert (=> start!46058 (array_inv!11622 a!3235)))

(assert (= (and start!46058 res!311060) b!510161))

(assert (= (and b!510161 res!311056) b!510162))

(assert (= (and b!510162 res!311059) b!510158))

(assert (= (and b!510158 res!311055) b!510155))

(assert (= (and b!510155 res!311054) b!510156))

(assert (= (and b!510156 res!311062) b!510163))

(assert (= (and b!510163 res!311061) b!510157))

(assert (= (and b!510157 res!311057) b!510159))

(assert (= (and b!510159 (not res!311058)) b!510160))

(declare-fun m!491557 () Bool)

(assert (=> b!510155 m!491557))

(declare-fun m!491559 () Bool)

(assert (=> start!46058 m!491559))

(declare-fun m!491561 () Bool)

(assert (=> start!46058 m!491561))

(declare-fun m!491563 () Bool)

(assert (=> b!510157 m!491563))

(declare-fun m!491565 () Bool)

(assert (=> b!510162 m!491565))

(assert (=> b!510162 m!491565))

(declare-fun m!491567 () Bool)

(assert (=> b!510162 m!491567))

(declare-fun m!491569 () Bool)

(assert (=> b!510156 m!491569))

(declare-fun m!491571 () Bool)

(assert (=> b!510163 m!491571))

(declare-fun m!491573 () Bool)

(assert (=> b!510160 m!491573))

(declare-fun m!491575 () Bool)

(assert (=> b!510160 m!491575))

(declare-fun m!491577 () Bool)

(assert (=> b!510159 m!491577))

(declare-fun m!491579 () Bool)

(assert (=> b!510159 m!491579))

(declare-fun m!491581 () Bool)

(assert (=> b!510159 m!491581))

(declare-fun m!491583 () Bool)

(assert (=> b!510159 m!491583))

(assert (=> b!510159 m!491565))

(declare-fun m!491585 () Bool)

(assert (=> b!510159 m!491585))

(declare-fun m!491587 () Bool)

(assert (=> b!510159 m!491587))

(assert (=> b!510159 m!491565))

(assert (=> b!510159 m!491583))

(assert (=> b!510159 m!491565))

(assert (=> b!510159 m!491565))

(declare-fun m!491589 () Bool)

(assert (=> b!510159 m!491589))

(declare-fun m!491591 () Bool)

(assert (=> b!510159 m!491591))

(assert (=> b!510159 m!491587))

(declare-fun m!491593 () Bool)

(assert (=> b!510159 m!491593))

(declare-fun m!491595 () Bool)

(assert (=> b!510158 m!491595))

(check-sat (not b!510162) (not start!46058) (not b!510155) (not b!510156) (not b!510158) (not b!510163) (not b!510160) (not b!510157) (not b!510159))
(check-sat)
