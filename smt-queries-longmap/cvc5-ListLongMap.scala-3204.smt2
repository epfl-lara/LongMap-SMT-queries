; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44970 () Bool)

(assert start!44970)

(declare-fun b!493212 () Bool)

(declare-fun res!295782 () Bool)

(declare-fun e!289688 () Bool)

(assert (=> b!493212 (=> (not res!295782) (not e!289688))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493212 (= res!295782 (validKeyInArray!0 k!2280))))

(declare-fun b!493213 () Bool)

(declare-fun res!295787 () Bool)

(assert (=> b!493213 (=> (not res!295787) (not e!289688))))

(declare-datatypes ((array!31915 0))(
  ( (array!31916 (arr!15342 (Array (_ BitVec 32) (_ BitVec 64))) (size!15706 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31915)

(declare-fun arrayContainsKey!0 (array!31915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493213 (= res!295787 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493214 () Bool)

(declare-fun res!295789 () Bool)

(assert (=> b!493214 (=> (not res!295789) (not e!289688))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!493214 (= res!295789 (and (= (size!15706 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15706 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15706 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493216 () Bool)

(declare-fun res!295788 () Bool)

(declare-fun e!289687 () Bool)

(assert (=> b!493216 (=> (not res!295788) (not e!289687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31915 (_ BitVec 32)) Bool)

(assert (=> b!493216 (= res!295788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493217 () Bool)

(assert (=> b!493217 (= e!289688 e!289687)))

(declare-fun res!295790 () Bool)

(assert (=> b!493217 (=> (not res!295790) (not e!289687))))

(declare-datatypes ((SeekEntryResult!3809 0))(
  ( (MissingZero!3809 (index!17415 (_ BitVec 32))) (Found!3809 (index!17416 (_ BitVec 32))) (Intermediate!3809 (undefined!4621 Bool) (index!17417 (_ BitVec 32)) (x!46503 (_ BitVec 32))) (Undefined!3809) (MissingVacant!3809 (index!17418 (_ BitVec 32))) )
))
(declare-fun lt!223030 () SeekEntryResult!3809)

(assert (=> b!493217 (= res!295790 (or (= lt!223030 (MissingZero!3809 i!1204)) (= lt!223030 (MissingVacant!3809 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31915 (_ BitVec 32)) SeekEntryResult!3809)

(assert (=> b!493217 (= lt!223030 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!493218 () Bool)

(assert (=> b!493218 (= e!289687 (not true))))

(declare-fun lt!223028 () SeekEntryResult!3809)

(declare-fun lt!223026 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31915 (_ BitVec 32)) SeekEntryResult!3809)

(assert (=> b!493218 (= lt!223028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223026 (select (store (arr!15342 a!3235) i!1204 k!2280) j!176) (array!31916 (store (arr!15342 a!3235) i!1204 k!2280) (size!15706 a!3235)) mask!3524))))

(declare-fun lt!223027 () (_ BitVec 32))

(declare-fun lt!223025 () SeekEntryResult!3809)

(assert (=> b!493218 (= lt!223025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223027 (select (arr!15342 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493218 (= lt!223026 (toIndex!0 (select (store (arr!15342 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493218 (= lt!223027 (toIndex!0 (select (arr!15342 a!3235) j!176) mask!3524))))

(declare-fun e!289686 () Bool)

(assert (=> b!493218 e!289686))

(declare-fun res!295783 () Bool)

(assert (=> b!493218 (=> (not res!295783) (not e!289686))))

(assert (=> b!493218 (= res!295783 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14564 0))(
  ( (Unit!14565) )
))
(declare-fun lt!223029 () Unit!14564)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14564)

(assert (=> b!493218 (= lt!223029 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493219 () Bool)

(declare-fun res!295784 () Bool)

(assert (=> b!493219 (=> (not res!295784) (not e!289687))))

(declare-datatypes ((List!9500 0))(
  ( (Nil!9497) (Cons!9496 (h!10364 (_ BitVec 64)) (t!15728 List!9500)) )
))
(declare-fun arrayNoDuplicates!0 (array!31915 (_ BitVec 32) List!9500) Bool)

(assert (=> b!493219 (= res!295784 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9497))))

(declare-fun b!493220 () Bool)

(declare-fun res!295785 () Bool)

(assert (=> b!493220 (=> (not res!295785) (not e!289688))))

(assert (=> b!493220 (= res!295785 (validKeyInArray!0 (select (arr!15342 a!3235) j!176)))))

(declare-fun b!493215 () Bool)

(assert (=> b!493215 (= e!289686 (= (seekEntryOrOpen!0 (select (arr!15342 a!3235) j!176) a!3235 mask!3524) (Found!3809 j!176)))))

(declare-fun res!295786 () Bool)

(assert (=> start!44970 (=> (not res!295786) (not e!289688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44970 (= res!295786 (validMask!0 mask!3524))))

(assert (=> start!44970 e!289688))

(assert (=> start!44970 true))

(declare-fun array_inv!11138 (array!31915) Bool)

(assert (=> start!44970 (array_inv!11138 a!3235)))

(assert (= (and start!44970 res!295786) b!493214))

(assert (= (and b!493214 res!295789) b!493220))

(assert (= (and b!493220 res!295785) b!493212))

(assert (= (and b!493212 res!295782) b!493213))

(assert (= (and b!493213 res!295787) b!493217))

(assert (= (and b!493217 res!295790) b!493216))

(assert (= (and b!493216 res!295788) b!493219))

(assert (= (and b!493219 res!295784) b!493218))

(assert (= (and b!493218 res!295783) b!493215))

(declare-fun m!473991 () Bool)

(assert (=> b!493219 m!473991))

(declare-fun m!473993 () Bool)

(assert (=> b!493213 m!473993))

(declare-fun m!473995 () Bool)

(assert (=> b!493215 m!473995))

(assert (=> b!493215 m!473995))

(declare-fun m!473997 () Bool)

(assert (=> b!493215 m!473997))

(assert (=> b!493220 m!473995))

(assert (=> b!493220 m!473995))

(declare-fun m!473999 () Bool)

(assert (=> b!493220 m!473999))

(declare-fun m!474001 () Bool)

(assert (=> b!493212 m!474001))

(declare-fun m!474003 () Bool)

(assert (=> b!493217 m!474003))

(declare-fun m!474005 () Bool)

(assert (=> b!493218 m!474005))

(declare-fun m!474007 () Bool)

(assert (=> b!493218 m!474007))

(declare-fun m!474009 () Bool)

(assert (=> b!493218 m!474009))

(declare-fun m!474011 () Bool)

(assert (=> b!493218 m!474011))

(assert (=> b!493218 m!474007))

(assert (=> b!493218 m!473995))

(declare-fun m!474013 () Bool)

(assert (=> b!493218 m!474013))

(assert (=> b!493218 m!473995))

(declare-fun m!474015 () Bool)

(assert (=> b!493218 m!474015))

(assert (=> b!493218 m!474007))

(declare-fun m!474017 () Bool)

(assert (=> b!493218 m!474017))

(assert (=> b!493218 m!473995))

(declare-fun m!474019 () Bool)

(assert (=> b!493218 m!474019))

(declare-fun m!474021 () Bool)

(assert (=> b!493216 m!474021))

(declare-fun m!474023 () Bool)

(assert (=> start!44970 m!474023))

(declare-fun m!474025 () Bool)

(assert (=> start!44970 m!474025))

(push 1)

