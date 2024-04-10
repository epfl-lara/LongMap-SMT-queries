; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44384 () Bool)

(assert start!44384)

(declare-fun b!487824 () Bool)

(declare-fun res!291104 () Bool)

(declare-fun e!287006 () Bool)

(assert (=> b!487824 (=> (not res!291104) (not e!287006))))

(declare-datatypes ((array!31590 0))(
  ( (array!31591 (arr!15187 (Array (_ BitVec 32) (_ BitVec 64))) (size!15551 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31590)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487824 (= res!291104 (validKeyInArray!0 (select (arr!15187 a!3235) j!176)))))

(declare-fun b!487825 () Bool)

(declare-fun res!291097 () Bool)

(assert (=> b!487825 (=> (not res!291097) (not e!287006))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!487825 (= res!291097 (validKeyInArray!0 k0!2280))))

(declare-fun b!487826 () Bool)

(declare-fun res!291099 () Bool)

(assert (=> b!487826 (=> (not res!291099) (not e!287006))))

(declare-fun arrayContainsKey!0 (array!31590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487826 (= res!291099 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487827 () Bool)

(declare-fun e!287004 () Bool)

(assert (=> b!487827 (= e!287006 e!287004)))

(declare-fun res!291103 () Bool)

(assert (=> b!487827 (=> (not res!291103) (not e!287004))))

(declare-datatypes ((SeekEntryResult!3654 0))(
  ( (MissingZero!3654 (index!16795 (_ BitVec 32))) (Found!3654 (index!16796 (_ BitVec 32))) (Intermediate!3654 (undefined!4466 Bool) (index!16797 (_ BitVec 32)) (x!45914 (_ BitVec 32))) (Undefined!3654) (MissingVacant!3654 (index!16798 (_ BitVec 32))) )
))
(declare-fun lt!220170 () SeekEntryResult!3654)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487827 (= res!291103 (or (= lt!220170 (MissingZero!3654 i!1204)) (= lt!220170 (MissingVacant!3654 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31590 (_ BitVec 32)) SeekEntryResult!3654)

(assert (=> b!487827 (= lt!220170 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487828 () Bool)

(declare-fun res!291098 () Bool)

(assert (=> b!487828 (=> (not res!291098) (not e!287004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31590 (_ BitVec 32)) Bool)

(assert (=> b!487828 (= res!291098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487829 () Bool)

(declare-fun e!287007 () Bool)

(assert (=> b!487829 (= e!287007 (= (seekEntryOrOpen!0 (select (arr!15187 a!3235) j!176) a!3235 mask!3524) (Found!3654 j!176)))))

(declare-fun b!487830 () Bool)

(declare-fun res!291101 () Bool)

(assert (=> b!487830 (=> (not res!291101) (not e!287004))))

(declare-datatypes ((List!9345 0))(
  ( (Nil!9342) (Cons!9341 (h!10197 (_ BitVec 64)) (t!15573 List!9345)) )
))
(declare-fun arrayNoDuplicates!0 (array!31590 (_ BitVec 32) List!9345) Bool)

(assert (=> b!487830 (= res!291101 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9342))))

(declare-fun res!291100 () Bool)

(assert (=> start!44384 (=> (not res!291100) (not e!287006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44384 (= res!291100 (validMask!0 mask!3524))))

(assert (=> start!44384 e!287006))

(assert (=> start!44384 true))

(declare-fun array_inv!10983 (array!31590) Bool)

(assert (=> start!44384 (array_inv!10983 a!3235)))

(declare-fun b!487831 () Bool)

(assert (=> b!487831 (= e!287004 (not true))))

(declare-fun lt!220169 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487831 (= lt!220169 (toIndex!0 (select (arr!15187 a!3235) j!176) mask!3524))))

(assert (=> b!487831 e!287007))

(declare-fun res!291096 () Bool)

(assert (=> b!487831 (=> (not res!291096) (not e!287007))))

(assert (=> b!487831 (= res!291096 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14254 0))(
  ( (Unit!14255) )
))
(declare-fun lt!220171 () Unit!14254)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14254)

(assert (=> b!487831 (= lt!220171 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487832 () Bool)

(declare-fun res!291102 () Bool)

(assert (=> b!487832 (=> (not res!291102) (not e!287006))))

(assert (=> b!487832 (= res!291102 (and (= (size!15551 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15551 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15551 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44384 res!291100) b!487832))

(assert (= (and b!487832 res!291102) b!487824))

(assert (= (and b!487824 res!291104) b!487825))

(assert (= (and b!487825 res!291097) b!487826))

(assert (= (and b!487826 res!291099) b!487827))

(assert (= (and b!487827 res!291103) b!487828))

(assert (= (and b!487828 res!291098) b!487830))

(assert (= (and b!487830 res!291101) b!487831))

(assert (= (and b!487831 res!291096) b!487829))

(declare-fun m!467609 () Bool)

(assert (=> b!487825 m!467609))

(declare-fun m!467611 () Bool)

(assert (=> b!487829 m!467611))

(assert (=> b!487829 m!467611))

(declare-fun m!467613 () Bool)

(assert (=> b!487829 m!467613))

(declare-fun m!467615 () Bool)

(assert (=> b!487828 m!467615))

(assert (=> b!487824 m!467611))

(assert (=> b!487824 m!467611))

(declare-fun m!467617 () Bool)

(assert (=> b!487824 m!467617))

(declare-fun m!467619 () Bool)

(assert (=> b!487830 m!467619))

(declare-fun m!467621 () Bool)

(assert (=> b!487827 m!467621))

(declare-fun m!467623 () Bool)

(assert (=> b!487826 m!467623))

(declare-fun m!467625 () Bool)

(assert (=> start!44384 m!467625))

(declare-fun m!467627 () Bool)

(assert (=> start!44384 m!467627))

(assert (=> b!487831 m!467611))

(assert (=> b!487831 m!467611))

(declare-fun m!467629 () Bool)

(assert (=> b!487831 m!467629))

(declare-fun m!467631 () Bool)

(assert (=> b!487831 m!467631))

(declare-fun m!467633 () Bool)

(assert (=> b!487831 m!467633))

(check-sat (not start!44384) (not b!487829) (not b!487826) (not b!487824) (not b!487827) (not b!487831) (not b!487830) (not b!487828) (not b!487825))
