; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45002 () Bool)

(assert start!45002)

(declare-fun b!493676 () Bool)

(declare-fun e!289881 () Bool)

(declare-fun e!289880 () Bool)

(assert (=> b!493676 (= e!289881 (not e!289880))))

(declare-fun res!296249 () Bool)

(assert (=> b!493676 (=> res!296249 e!289880)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31947 0))(
  ( (array!31948 (arr!15358 (Array (_ BitVec 32) (_ BitVec 64))) (size!15722 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31947)

(declare-datatypes ((SeekEntryResult!3825 0))(
  ( (MissingZero!3825 (index!17479 (_ BitVec 32))) (Found!3825 (index!17480 (_ BitVec 32))) (Intermediate!3825 (undefined!4637 Bool) (index!17481 (_ BitVec 32)) (x!46559 (_ BitVec 32))) (Undefined!3825) (MissingVacant!3825 (index!17482 (_ BitVec 32))) )
))
(declare-fun lt!223315 () SeekEntryResult!3825)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!223318 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31947 (_ BitVec 32)) SeekEntryResult!3825)

(assert (=> b!493676 (= res!296249 (= lt!223315 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223318 (select (store (arr!15358 a!3235) i!1204 k0!2280) j!176) (array!31948 (store (arr!15358 a!3235) i!1204 k0!2280) (size!15722 a!3235)) mask!3524)))))

(declare-fun lt!223313 () (_ BitVec 32))

(assert (=> b!493676 (= lt!223315 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223313 (select (arr!15358 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493676 (= lt!223318 (toIndex!0 (select (store (arr!15358 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493676 (= lt!223313 (toIndex!0 (select (arr!15358 a!3235) j!176) mask!3524))))

(declare-fun lt!223316 () SeekEntryResult!3825)

(assert (=> b!493676 (= lt!223316 (Found!3825 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31947 (_ BitVec 32)) SeekEntryResult!3825)

(assert (=> b!493676 (= lt!223316 (seekEntryOrOpen!0 (select (arr!15358 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31947 (_ BitVec 32)) Bool)

(assert (=> b!493676 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14596 0))(
  ( (Unit!14597) )
))
(declare-fun lt!223317 () Unit!14596)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31947 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14596)

(assert (=> b!493676 (= lt!223317 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493677 () Bool)

(declare-fun res!296255 () Bool)

(assert (=> b!493677 (=> (not res!296255) (not e!289881))))

(assert (=> b!493677 (= res!296255 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493678 () Bool)

(assert (=> b!493678 (= e!289880 true)))

(assert (=> b!493678 (= lt!223316 Undefined!3825)))

(declare-fun res!296253 () Bool)

(declare-fun e!289879 () Bool)

(assert (=> start!45002 (=> (not res!296253) (not e!289879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45002 (= res!296253 (validMask!0 mask!3524))))

(assert (=> start!45002 e!289879))

(assert (=> start!45002 true))

(declare-fun array_inv!11154 (array!31947) Bool)

(assert (=> start!45002 (array_inv!11154 a!3235)))

(declare-fun b!493679 () Bool)

(declare-fun res!296247 () Bool)

(assert (=> b!493679 (=> (not res!296247) (not e!289879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493679 (= res!296247 (validKeyInArray!0 (select (arr!15358 a!3235) j!176)))))

(declare-fun b!493680 () Bool)

(declare-fun res!296254 () Bool)

(assert (=> b!493680 (=> (not res!296254) (not e!289879))))

(declare-fun arrayContainsKey!0 (array!31947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493680 (= res!296254 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493681 () Bool)

(declare-fun res!296251 () Bool)

(assert (=> b!493681 (=> res!296251 e!289880)))

(get-info :version)

(assert (=> b!493681 (= res!296251 (or (not ((_ is Intermediate!3825) lt!223315)) (not (undefined!4637 lt!223315))))))

(declare-fun b!493682 () Bool)

(declare-fun res!296246 () Bool)

(assert (=> b!493682 (=> (not res!296246) (not e!289881))))

(declare-datatypes ((List!9516 0))(
  ( (Nil!9513) (Cons!9512 (h!10380 (_ BitVec 64)) (t!15744 List!9516)) )
))
(declare-fun arrayNoDuplicates!0 (array!31947 (_ BitVec 32) List!9516) Bool)

(assert (=> b!493682 (= res!296246 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9513))))

(declare-fun b!493683 () Bool)

(declare-fun res!296252 () Bool)

(assert (=> b!493683 (=> (not res!296252) (not e!289879))))

(assert (=> b!493683 (= res!296252 (validKeyInArray!0 k0!2280))))

(declare-fun b!493684 () Bool)

(declare-fun res!296248 () Bool)

(assert (=> b!493684 (=> (not res!296248) (not e!289879))))

(assert (=> b!493684 (= res!296248 (and (= (size!15722 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15722 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15722 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493685 () Bool)

(assert (=> b!493685 (= e!289879 e!289881)))

(declare-fun res!296250 () Bool)

(assert (=> b!493685 (=> (not res!296250) (not e!289881))))

(declare-fun lt!223314 () SeekEntryResult!3825)

(assert (=> b!493685 (= res!296250 (or (= lt!223314 (MissingZero!3825 i!1204)) (= lt!223314 (MissingVacant!3825 i!1204))))))

(assert (=> b!493685 (= lt!223314 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45002 res!296253) b!493684))

(assert (= (and b!493684 res!296248) b!493679))

(assert (= (and b!493679 res!296247) b!493683))

(assert (= (and b!493683 res!296252) b!493680))

(assert (= (and b!493680 res!296254) b!493685))

(assert (= (and b!493685 res!296250) b!493677))

(assert (= (and b!493677 res!296255) b!493682))

(assert (= (and b!493682 res!296246) b!493676))

(assert (= (and b!493676 (not res!296249)) b!493681))

(assert (= (and b!493681 (not res!296251)) b!493678))

(declare-fun m!474567 () Bool)

(assert (=> b!493676 m!474567))

(declare-fun m!474569 () Bool)

(assert (=> b!493676 m!474569))

(declare-fun m!474571 () Bool)

(assert (=> b!493676 m!474571))

(assert (=> b!493676 m!474571))

(declare-fun m!474573 () Bool)

(assert (=> b!493676 m!474573))

(declare-fun m!474575 () Bool)

(assert (=> b!493676 m!474575))

(declare-fun m!474577 () Bool)

(assert (=> b!493676 m!474577))

(assert (=> b!493676 m!474575))

(declare-fun m!474579 () Bool)

(assert (=> b!493676 m!474579))

(assert (=> b!493676 m!474575))

(declare-fun m!474581 () Bool)

(assert (=> b!493676 m!474581))

(assert (=> b!493676 m!474575))

(declare-fun m!474583 () Bool)

(assert (=> b!493676 m!474583))

(assert (=> b!493676 m!474571))

(declare-fun m!474585 () Bool)

(assert (=> b!493676 m!474585))

(declare-fun m!474587 () Bool)

(assert (=> b!493677 m!474587))

(declare-fun m!474589 () Bool)

(assert (=> b!493685 m!474589))

(assert (=> b!493679 m!474575))

(assert (=> b!493679 m!474575))

(declare-fun m!474591 () Bool)

(assert (=> b!493679 m!474591))

(declare-fun m!474593 () Bool)

(assert (=> b!493683 m!474593))

(declare-fun m!474595 () Bool)

(assert (=> b!493682 m!474595))

(declare-fun m!474597 () Bool)

(assert (=> b!493680 m!474597))

(declare-fun m!474599 () Bool)

(assert (=> start!45002 m!474599))

(declare-fun m!474601 () Bool)

(assert (=> start!45002 m!474601))

(check-sat (not b!493685) (not b!493676) (not b!493683) (not start!45002) (not b!493679) (not b!493680) (not b!493682) (not b!493677))
(check-sat)
