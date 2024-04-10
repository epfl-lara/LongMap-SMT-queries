; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46196 () Bool)

(assert start!46196)

(declare-fun b!511430 () Bool)

(declare-fun e!298862 () Bool)

(declare-fun e!298863 () Bool)

(assert (=> b!511430 (= e!298862 (not e!298863))))

(declare-fun res!312101 () Bool)

(assert (=> b!511430 (=> res!312101 e!298863)))

(declare-fun lt!233979 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4269 0))(
  ( (MissingZero!4269 (index!19264 (_ BitVec 32))) (Found!4269 (index!19265 (_ BitVec 32))) (Intermediate!4269 (undefined!5081 Bool) (index!19266 (_ BitVec 32)) (x!48220 (_ BitVec 32))) (Undefined!4269) (MissingVacant!4269 (index!19267 (_ BitVec 32))) )
))
(declare-fun lt!233977 () SeekEntryResult!4269)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!32850 0))(
  ( (array!32851 (arr!15802 (Array (_ BitVec 32) (_ BitVec 64))) (size!16166 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32850)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32850 (_ BitVec 32)) SeekEntryResult!4269)

(assert (=> b!511430 (= res!312101 (= lt!233977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233979 (select (store (arr!15802 a!3235) i!1204 k0!2280) j!176) (array!32851 (store (arr!15802 a!3235) i!1204 k0!2280) (size!16166 a!3235)) mask!3524)))))

(declare-fun lt!233976 () (_ BitVec 32))

(assert (=> b!511430 (= lt!233977 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233976 (select (arr!15802 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511430 (= lt!233979 (toIndex!0 (select (store (arr!15802 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!511430 (= lt!233976 (toIndex!0 (select (arr!15802 a!3235) j!176) mask!3524))))

(declare-fun lt!233975 () SeekEntryResult!4269)

(assert (=> b!511430 (= lt!233975 (Found!4269 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32850 (_ BitVec 32)) SeekEntryResult!4269)

(assert (=> b!511430 (= lt!233975 (seekEntryOrOpen!0 (select (arr!15802 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32850 (_ BitVec 32)) Bool)

(assert (=> b!511430 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15796 0))(
  ( (Unit!15797) )
))
(declare-fun lt!233978 () Unit!15796)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32850 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15796)

(assert (=> b!511430 (= lt!233978 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511431 () Bool)

(declare-fun e!298860 () Bool)

(assert (=> b!511431 (= e!298860 e!298862)))

(declare-fun res!312098 () Bool)

(assert (=> b!511431 (=> (not res!312098) (not e!298862))))

(declare-fun lt!233980 () SeekEntryResult!4269)

(assert (=> b!511431 (= res!312098 (or (= lt!233980 (MissingZero!4269 i!1204)) (= lt!233980 (MissingVacant!4269 i!1204))))))

(assert (=> b!511431 (= lt!233980 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!511432 () Bool)

(declare-fun res!312097 () Bool)

(assert (=> b!511432 (=> res!312097 e!298863)))

(get-info :version)

(assert (=> b!511432 (= res!312097 (or (not ((_ is Intermediate!4269) lt!233977)) (not (undefined!5081 lt!233977))))))

(declare-fun b!511433 () Bool)

(declare-fun res!312092 () Bool)

(assert (=> b!511433 (=> (not res!312092) (not e!298860))))

(assert (=> b!511433 (= res!312092 (and (= (size!16166 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16166 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16166 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511434 () Bool)

(declare-fun res!312093 () Bool)

(assert (=> b!511434 (=> (not res!312093) (not e!298860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511434 (= res!312093 (validKeyInArray!0 k0!2280))))

(declare-fun b!511435 () Bool)

(declare-fun res!312094 () Bool)

(assert (=> b!511435 (=> (not res!312094) (not e!298860))))

(declare-fun arrayContainsKey!0 (array!32850 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511435 (= res!312094 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511436 () Bool)

(assert (=> b!511436 (= e!298863 true)))

(assert (=> b!511436 (= lt!233975 Undefined!4269)))

(declare-fun b!511437 () Bool)

(declare-fun res!312099 () Bool)

(assert (=> b!511437 (=> (not res!312099) (not e!298860))))

(assert (=> b!511437 (= res!312099 (validKeyInArray!0 (select (arr!15802 a!3235) j!176)))))

(declare-fun b!511438 () Bool)

(declare-fun res!312095 () Bool)

(assert (=> b!511438 (=> (not res!312095) (not e!298862))))

(assert (=> b!511438 (= res!312095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!312096 () Bool)

(assert (=> start!46196 (=> (not res!312096) (not e!298860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46196 (= res!312096 (validMask!0 mask!3524))))

(assert (=> start!46196 e!298860))

(assert (=> start!46196 true))

(declare-fun array_inv!11598 (array!32850) Bool)

(assert (=> start!46196 (array_inv!11598 a!3235)))

(declare-fun b!511439 () Bool)

(declare-fun res!312100 () Bool)

(assert (=> b!511439 (=> (not res!312100) (not e!298862))))

(declare-datatypes ((List!9960 0))(
  ( (Nil!9957) (Cons!9956 (h!10836 (_ BitVec 64)) (t!16188 List!9960)) )
))
(declare-fun arrayNoDuplicates!0 (array!32850 (_ BitVec 32) List!9960) Bool)

(assert (=> b!511439 (= res!312100 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9957))))

(assert (= (and start!46196 res!312096) b!511433))

(assert (= (and b!511433 res!312092) b!511437))

(assert (= (and b!511437 res!312099) b!511434))

(assert (= (and b!511434 res!312093) b!511435))

(assert (= (and b!511435 res!312094) b!511431))

(assert (= (and b!511431 res!312098) b!511438))

(assert (= (and b!511438 res!312095) b!511439))

(assert (= (and b!511439 res!312100) b!511430))

(assert (= (and b!511430 (not res!312101)) b!511432))

(assert (= (and b!511432 (not res!312097)) b!511436))

(declare-fun m!492885 () Bool)

(assert (=> b!511431 m!492885))

(declare-fun m!492887 () Bool)

(assert (=> start!46196 m!492887))

(declare-fun m!492889 () Bool)

(assert (=> start!46196 m!492889))

(declare-fun m!492891 () Bool)

(assert (=> b!511430 m!492891))

(declare-fun m!492893 () Bool)

(assert (=> b!511430 m!492893))

(declare-fun m!492895 () Bool)

(assert (=> b!511430 m!492895))

(assert (=> b!511430 m!492893))

(declare-fun m!492897 () Bool)

(assert (=> b!511430 m!492897))

(assert (=> b!511430 m!492893))

(declare-fun m!492899 () Bool)

(assert (=> b!511430 m!492899))

(declare-fun m!492901 () Bool)

(assert (=> b!511430 m!492901))

(declare-fun m!492903 () Bool)

(assert (=> b!511430 m!492903))

(assert (=> b!511430 m!492893))

(declare-fun m!492905 () Bool)

(assert (=> b!511430 m!492905))

(declare-fun m!492907 () Bool)

(assert (=> b!511430 m!492907))

(assert (=> b!511430 m!492901))

(declare-fun m!492909 () Bool)

(assert (=> b!511430 m!492909))

(assert (=> b!511430 m!492901))

(declare-fun m!492911 () Bool)

(assert (=> b!511438 m!492911))

(assert (=> b!511437 m!492893))

(assert (=> b!511437 m!492893))

(declare-fun m!492913 () Bool)

(assert (=> b!511437 m!492913))

(declare-fun m!492915 () Bool)

(assert (=> b!511434 m!492915))

(declare-fun m!492917 () Bool)

(assert (=> b!511435 m!492917))

(declare-fun m!492919 () Bool)

(assert (=> b!511439 m!492919))

(check-sat (not b!511438) (not b!511439) (not start!46196) (not b!511435) (not b!511430) (not b!511437) (not b!511434) (not b!511431))
(check-sat)
