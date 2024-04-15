; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45174 () Bool)

(assert start!45174)

(declare-fun b!495621 () Bool)

(declare-fun res!298151 () Bool)

(declare-fun e!290700 () Bool)

(assert (=> b!495621 (=> (not res!298151) (not e!290700))))

(declare-datatypes ((array!32072 0))(
  ( (array!32073 (arr!15419 (Array (_ BitVec 32) (_ BitVec 64))) (size!15784 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32072)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495621 (= res!298151 (validKeyInArray!0 (select (arr!15419 a!3235) j!176)))))

(declare-fun b!495622 () Bool)

(declare-fun res!298160 () Bool)

(assert (=> b!495622 (=> (not res!298160) (not e!290700))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!495622 (= res!298160 (validKeyInArray!0 k0!2280))))

(declare-fun b!495623 () Bool)

(declare-fun res!298157 () Bool)

(declare-fun e!290702 () Bool)

(assert (=> b!495623 (=> (not res!298157) (not e!290702))))

(declare-datatypes ((List!9616 0))(
  ( (Nil!9613) (Cons!9612 (h!10483 (_ BitVec 64)) (t!15835 List!9616)) )
))
(declare-fun arrayNoDuplicates!0 (array!32072 (_ BitVec 32) List!9616) Bool)

(assert (=> b!495623 (= res!298157 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9613))))

(declare-fun b!495624 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!290699 () Bool)

(declare-datatypes ((SeekEntryResult!3883 0))(
  ( (MissingZero!3883 (index!17711 (_ BitVec 32))) (Found!3883 (index!17712 (_ BitVec 32))) (Intermediate!3883 (undefined!4695 Bool) (index!17713 (_ BitVec 32)) (x!46786 (_ BitVec 32))) (Undefined!3883) (MissingVacant!3883 (index!17714 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32072 (_ BitVec 32)) SeekEntryResult!3883)

(assert (=> b!495624 (= e!290699 (= (seekEntryOrOpen!0 (select (arr!15419 a!3235) j!176) a!3235 mask!3524) (Found!3883 j!176)))))

(declare-fun b!495625 () Bool)

(declare-fun res!298152 () Bool)

(assert (=> b!495625 (=> (not res!298152) (not e!290700))))

(declare-fun arrayContainsKey!0 (array!32072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495625 (= res!298152 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495627 () Bool)

(declare-fun e!290701 () Bool)

(assert (=> b!495627 (= e!290701 true)))

(declare-fun lt!224261 () SeekEntryResult!3883)

(assert (=> b!495627 (and (bvslt (x!46786 lt!224261) #b01111111111111111111111111111110) (or (= (select (arr!15419 a!3235) (index!17713 lt!224261)) (select (arr!15419 a!3235) j!176)) (= (select (arr!15419 a!3235) (index!17713 lt!224261)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15419 a!3235) (index!17713 lt!224261)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!495628 () Bool)

(declare-fun res!298158 () Bool)

(assert (=> b!495628 (=> res!298158 e!290701)))

(get-info :version)

(assert (=> b!495628 (= res!298158 (or (undefined!4695 lt!224261) (not ((_ is Intermediate!3883) lt!224261))))))

(declare-fun b!495629 () Bool)

(assert (=> b!495629 (= e!290702 (not e!290701))))

(declare-fun res!298156 () Bool)

(assert (=> b!495629 (=> res!298156 e!290701)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!224260 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32072 (_ BitVec 32)) SeekEntryResult!3883)

(assert (=> b!495629 (= res!298156 (= lt!224261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224260 (select (store (arr!15419 a!3235) i!1204 k0!2280) j!176) (array!32073 (store (arr!15419 a!3235) i!1204 k0!2280) (size!15784 a!3235)) mask!3524)))))

(declare-fun lt!224262 () (_ BitVec 32))

(assert (=> b!495629 (= lt!224261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224262 (select (arr!15419 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495629 (= lt!224260 (toIndex!0 (select (store (arr!15419 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495629 (= lt!224262 (toIndex!0 (select (arr!15419 a!3235) j!176) mask!3524))))

(assert (=> b!495629 e!290699))

(declare-fun res!298154 () Bool)

(assert (=> b!495629 (=> (not res!298154) (not e!290699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32072 (_ BitVec 32)) Bool)

(assert (=> b!495629 (= res!298154 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14698 0))(
  ( (Unit!14699) )
))
(declare-fun lt!224263 () Unit!14698)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32072 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14698)

(assert (=> b!495629 (= lt!224263 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495626 () Bool)

(declare-fun res!298155 () Bool)

(assert (=> b!495626 (=> (not res!298155) (not e!290702))))

(assert (=> b!495626 (= res!298155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!298153 () Bool)

(assert (=> start!45174 (=> (not res!298153) (not e!290700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45174 (= res!298153 (validMask!0 mask!3524))))

(assert (=> start!45174 e!290700))

(assert (=> start!45174 true))

(declare-fun array_inv!11302 (array!32072) Bool)

(assert (=> start!45174 (array_inv!11302 a!3235)))

(declare-fun b!495630 () Bool)

(declare-fun res!298150 () Bool)

(assert (=> b!495630 (=> (not res!298150) (not e!290700))))

(assert (=> b!495630 (= res!298150 (and (= (size!15784 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15784 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15784 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495631 () Bool)

(assert (=> b!495631 (= e!290700 e!290702)))

(declare-fun res!298159 () Bool)

(assert (=> b!495631 (=> (not res!298159) (not e!290702))))

(declare-fun lt!224259 () SeekEntryResult!3883)

(assert (=> b!495631 (= res!298159 (or (= lt!224259 (MissingZero!3883 i!1204)) (= lt!224259 (MissingVacant!3883 i!1204))))))

(assert (=> b!495631 (= lt!224259 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45174 res!298153) b!495630))

(assert (= (and b!495630 res!298150) b!495621))

(assert (= (and b!495621 res!298151) b!495622))

(assert (= (and b!495622 res!298160) b!495625))

(assert (= (and b!495625 res!298152) b!495631))

(assert (= (and b!495631 res!298159) b!495626))

(assert (= (and b!495626 res!298155) b!495623))

(assert (= (and b!495623 res!298157) b!495629))

(assert (= (and b!495629 res!298154) b!495624))

(assert (= (and b!495629 (not res!298156)) b!495628))

(assert (= (and b!495628 (not res!298158)) b!495627))

(declare-fun m!476293 () Bool)

(assert (=> b!495626 m!476293))

(declare-fun m!476295 () Bool)

(assert (=> b!495624 m!476295))

(assert (=> b!495624 m!476295))

(declare-fun m!476297 () Bool)

(assert (=> b!495624 m!476297))

(declare-fun m!476299 () Bool)

(assert (=> b!495623 m!476299))

(declare-fun m!476301 () Bool)

(assert (=> start!45174 m!476301))

(declare-fun m!476303 () Bool)

(assert (=> start!45174 m!476303))

(declare-fun m!476305 () Bool)

(assert (=> b!495625 m!476305))

(declare-fun m!476307 () Bool)

(assert (=> b!495627 m!476307))

(assert (=> b!495627 m!476295))

(assert (=> b!495621 m!476295))

(assert (=> b!495621 m!476295))

(declare-fun m!476309 () Bool)

(assert (=> b!495621 m!476309))

(declare-fun m!476311 () Bool)

(assert (=> b!495631 m!476311))

(declare-fun m!476313 () Bool)

(assert (=> b!495622 m!476313))

(declare-fun m!476315 () Bool)

(assert (=> b!495629 m!476315))

(declare-fun m!476317 () Bool)

(assert (=> b!495629 m!476317))

(assert (=> b!495629 m!476295))

(declare-fun m!476319 () Bool)

(assert (=> b!495629 m!476319))

(assert (=> b!495629 m!476295))

(declare-fun m!476321 () Bool)

(assert (=> b!495629 m!476321))

(declare-fun m!476323 () Bool)

(assert (=> b!495629 m!476323))

(assert (=> b!495629 m!476295))

(declare-fun m!476325 () Bool)

(assert (=> b!495629 m!476325))

(assert (=> b!495629 m!476317))

(declare-fun m!476327 () Bool)

(assert (=> b!495629 m!476327))

(assert (=> b!495629 m!476317))

(declare-fun m!476329 () Bool)

(assert (=> b!495629 m!476329))

(check-sat (not b!495629) (not b!495631) (not b!495623) (not b!495626) (not b!495624) (not b!495621) (not b!495622) (not start!45174) (not b!495625))
(check-sat)
