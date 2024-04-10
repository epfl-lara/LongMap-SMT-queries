; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44978 () Bool)

(assert start!44978)

(declare-fun b!493320 () Bool)

(declare-fun res!295893 () Bool)

(declare-fun e!289734 () Bool)

(assert (=> b!493320 (=> (not res!295893) (not e!289734))))

(declare-datatypes ((array!31923 0))(
  ( (array!31924 (arr!15346 (Array (_ BitVec 32) (_ BitVec 64))) (size!15710 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31923)

(declare-datatypes ((List!9504 0))(
  ( (Nil!9501) (Cons!9500 (h!10368 (_ BitVec 64)) (t!15732 List!9504)) )
))
(declare-fun arrayNoDuplicates!0 (array!31923 (_ BitVec 32) List!9504) Bool)

(assert (=> b!493320 (= res!295893 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9501))))

(declare-fun res!295892 () Bool)

(declare-fun e!289735 () Bool)

(assert (=> start!44978 (=> (not res!295892) (not e!289735))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44978 (= res!295892 (validMask!0 mask!3524))))

(assert (=> start!44978 e!289735))

(assert (=> start!44978 true))

(declare-fun array_inv!11142 (array!31923) Bool)

(assert (=> start!44978 (array_inv!11142 a!3235)))

(declare-fun b!493321 () Bool)

(declare-fun e!289737 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3813 0))(
  ( (MissingZero!3813 (index!17431 (_ BitVec 32))) (Found!3813 (index!17432 (_ BitVec 32))) (Intermediate!3813 (undefined!4625 Bool) (index!17433 (_ BitVec 32)) (x!46515 (_ BitVec 32))) (Undefined!3813) (MissingVacant!3813 (index!17434 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31923 (_ BitVec 32)) SeekEntryResult!3813)

(assert (=> b!493321 (= e!289737 (= (seekEntryOrOpen!0 (select (arr!15346 a!3235) j!176) a!3235 mask!3524) (Found!3813 j!176)))))

(declare-fun b!493322 () Bool)

(assert (=> b!493322 (= e!289734 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!223097 () SeekEntryResult!3813)

(declare-fun lt!223100 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31923 (_ BitVec 32)) SeekEntryResult!3813)

(assert (=> b!493322 (= lt!223097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223100 (select (store (arr!15346 a!3235) i!1204 k0!2280) j!176) (array!31924 (store (arr!15346 a!3235) i!1204 k0!2280) (size!15710 a!3235)) mask!3524))))

(declare-fun lt!223101 () (_ BitVec 32))

(declare-fun lt!223099 () SeekEntryResult!3813)

(assert (=> b!493322 (= lt!223099 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223101 (select (arr!15346 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493322 (= lt!223100 (toIndex!0 (select (store (arr!15346 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493322 (= lt!223101 (toIndex!0 (select (arr!15346 a!3235) j!176) mask!3524))))

(assert (=> b!493322 e!289737))

(declare-fun res!295895 () Bool)

(assert (=> b!493322 (=> (not res!295895) (not e!289737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31923 (_ BitVec 32)) Bool)

(assert (=> b!493322 (= res!295895 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14572 0))(
  ( (Unit!14573) )
))
(declare-fun lt!223098 () Unit!14572)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14572)

(assert (=> b!493322 (= lt!223098 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493323 () Bool)

(declare-fun res!295898 () Bool)

(assert (=> b!493323 (=> (not res!295898) (not e!289735))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493323 (= res!295898 (validKeyInArray!0 k0!2280))))

(declare-fun b!493324 () Bool)

(declare-fun res!295896 () Bool)

(assert (=> b!493324 (=> (not res!295896) (not e!289735))))

(assert (=> b!493324 (= res!295896 (and (= (size!15710 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15710 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15710 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493325 () Bool)

(declare-fun res!295891 () Bool)

(assert (=> b!493325 (=> (not res!295891) (not e!289735))))

(assert (=> b!493325 (= res!295891 (validKeyInArray!0 (select (arr!15346 a!3235) j!176)))))

(declare-fun b!493326 () Bool)

(declare-fun res!295890 () Bool)

(assert (=> b!493326 (=> (not res!295890) (not e!289735))))

(declare-fun arrayContainsKey!0 (array!31923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493326 (= res!295890 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493327 () Bool)

(assert (=> b!493327 (= e!289735 e!289734)))

(declare-fun res!295894 () Bool)

(assert (=> b!493327 (=> (not res!295894) (not e!289734))))

(declare-fun lt!223102 () SeekEntryResult!3813)

(assert (=> b!493327 (= res!295894 (or (= lt!223102 (MissingZero!3813 i!1204)) (= lt!223102 (MissingVacant!3813 i!1204))))))

(assert (=> b!493327 (= lt!223102 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493328 () Bool)

(declare-fun res!295897 () Bool)

(assert (=> b!493328 (=> (not res!295897) (not e!289734))))

(assert (=> b!493328 (= res!295897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44978 res!295892) b!493324))

(assert (= (and b!493324 res!295896) b!493325))

(assert (= (and b!493325 res!295891) b!493323))

(assert (= (and b!493323 res!295898) b!493326))

(assert (= (and b!493326 res!295890) b!493327))

(assert (= (and b!493327 res!295894) b!493328))

(assert (= (and b!493328 res!295897) b!493320))

(assert (= (and b!493320 res!295893) b!493322))

(assert (= (and b!493322 res!295895) b!493321))

(declare-fun m!474135 () Bool)

(assert (=> b!493328 m!474135))

(declare-fun m!474137 () Bool)

(assert (=> b!493322 m!474137))

(declare-fun m!474139 () Bool)

(assert (=> b!493322 m!474139))

(declare-fun m!474141 () Bool)

(assert (=> b!493322 m!474141))

(declare-fun m!474143 () Bool)

(assert (=> b!493322 m!474143))

(declare-fun m!474145 () Bool)

(assert (=> b!493322 m!474145))

(assert (=> b!493322 m!474137))

(declare-fun m!474147 () Bool)

(assert (=> b!493322 m!474147))

(assert (=> b!493322 m!474137))

(declare-fun m!474149 () Bool)

(assert (=> b!493322 m!474149))

(assert (=> b!493322 m!474145))

(declare-fun m!474151 () Bool)

(assert (=> b!493322 m!474151))

(assert (=> b!493322 m!474145))

(declare-fun m!474153 () Bool)

(assert (=> b!493322 m!474153))

(declare-fun m!474155 () Bool)

(assert (=> b!493327 m!474155))

(assert (=> b!493325 m!474137))

(assert (=> b!493325 m!474137))

(declare-fun m!474157 () Bool)

(assert (=> b!493325 m!474157))

(declare-fun m!474159 () Bool)

(assert (=> b!493323 m!474159))

(assert (=> b!493321 m!474137))

(assert (=> b!493321 m!474137))

(declare-fun m!474161 () Bool)

(assert (=> b!493321 m!474161))

(declare-fun m!474163 () Bool)

(assert (=> b!493326 m!474163))

(declare-fun m!474165 () Bool)

(assert (=> start!44978 m!474165))

(declare-fun m!474167 () Bool)

(assert (=> start!44978 m!474167))

(declare-fun m!474169 () Bool)

(assert (=> b!493320 m!474169))

(check-sat (not b!493322) (not b!493325) (not b!493328) (not b!493327) (not b!493326) (not start!44978) (not b!493323) (not b!493321) (not b!493320))
(check-sat)
