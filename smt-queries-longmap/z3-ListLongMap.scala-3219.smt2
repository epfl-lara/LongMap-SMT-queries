; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45048 () Bool)

(assert start!45048)

(declare-fun b!494275 () Bool)

(declare-fun e!290054 () Bool)

(assert (=> b!494275 (= e!290054 true)))

(declare-datatypes ((SeekEntryResult!3850 0))(
  ( (MissingZero!3850 (index!17579 (_ BitVec 32))) (Found!3850 (index!17580 (_ BitVec 32))) (Intermediate!3850 (undefined!4662 Bool) (index!17581 (_ BitVec 32)) (x!46659 (_ BitVec 32))) (Undefined!3850) (MissingVacant!3850 (index!17582 (_ BitVec 32))) )
))
(declare-fun lt!223606 () SeekEntryResult!3850)

(assert (=> b!494275 (= lt!223606 Undefined!3850)))

(declare-fun b!494277 () Bool)

(declare-fun res!296990 () Bool)

(declare-fun e!290053 () Bool)

(assert (=> b!494277 (=> (not res!296990) (not e!290053))))

(declare-datatypes ((array!32003 0))(
  ( (array!32004 (arr!15386 (Array (_ BitVec 32) (_ BitVec 64))) (size!15751 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32003)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494277 (= res!296990 (validKeyInArray!0 (select (arr!15386 a!3235) j!176)))))

(declare-fun b!494278 () Bool)

(declare-fun e!290055 () Bool)

(assert (=> b!494278 (= e!290055 (not e!290054))))

(declare-fun res!296988 () Bool)

(assert (=> b!494278 (=> res!296988 e!290054)))

(declare-fun lt!223603 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!223605 () SeekEntryResult!3850)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32003 (_ BitVec 32)) SeekEntryResult!3850)

(assert (=> b!494278 (= res!296988 (= lt!223605 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223603 (select (store (arr!15386 a!3235) i!1204 k0!2280) j!176) (array!32004 (store (arr!15386 a!3235) i!1204 k0!2280) (size!15751 a!3235)) mask!3524)))))

(declare-fun lt!223602 () (_ BitVec 32))

(assert (=> b!494278 (= lt!223605 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223602 (select (arr!15386 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494278 (= lt!223603 (toIndex!0 (select (store (arr!15386 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494278 (= lt!223602 (toIndex!0 (select (arr!15386 a!3235) j!176) mask!3524))))

(assert (=> b!494278 (= lt!223606 (Found!3850 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32003 (_ BitVec 32)) SeekEntryResult!3850)

(assert (=> b!494278 (= lt!223606 (seekEntryOrOpen!0 (select (arr!15386 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32003 (_ BitVec 32)) Bool)

(assert (=> b!494278 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14632 0))(
  ( (Unit!14633) )
))
(declare-fun lt!223604 () Unit!14632)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32003 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14632)

(assert (=> b!494278 (= lt!223604 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494279 () Bool)

(declare-fun res!296992 () Bool)

(assert (=> b!494279 (=> (not res!296992) (not e!290053))))

(assert (=> b!494279 (= res!296992 (validKeyInArray!0 k0!2280))))

(declare-fun b!494280 () Bool)

(declare-fun res!296987 () Bool)

(assert (=> b!494280 (=> (not res!296987) (not e!290053))))

(assert (=> b!494280 (= res!296987 (and (= (size!15751 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15751 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15751 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494281 () Bool)

(assert (=> b!494281 (= e!290053 e!290055)))

(declare-fun res!296993 () Bool)

(assert (=> b!494281 (=> (not res!296993) (not e!290055))))

(declare-fun lt!223601 () SeekEntryResult!3850)

(assert (=> b!494281 (= res!296993 (or (= lt!223601 (MissingZero!3850 i!1204)) (= lt!223601 (MissingVacant!3850 i!1204))))))

(assert (=> b!494281 (= lt!223601 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494282 () Bool)

(declare-fun res!296991 () Bool)

(assert (=> b!494282 (=> (not res!296991) (not e!290055))))

(assert (=> b!494282 (= res!296991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494283 () Bool)

(declare-fun res!296996 () Bool)

(assert (=> b!494283 (=> (not res!296996) (not e!290055))))

(declare-datatypes ((List!9583 0))(
  ( (Nil!9580) (Cons!9579 (h!10447 (_ BitVec 64)) (t!15802 List!9583)) )
))
(declare-fun arrayNoDuplicates!0 (array!32003 (_ BitVec 32) List!9583) Bool)

(assert (=> b!494283 (= res!296996 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9580))))

(declare-fun b!494284 () Bool)

(declare-fun res!296995 () Bool)

(assert (=> b!494284 (=> res!296995 e!290054)))

(get-info :version)

(assert (=> b!494284 (= res!296995 (or (not ((_ is Intermediate!3850) lt!223605)) (not (undefined!4662 lt!223605))))))

(declare-fun b!494276 () Bool)

(declare-fun res!296989 () Bool)

(assert (=> b!494276 (=> (not res!296989) (not e!290053))))

(declare-fun arrayContainsKey!0 (array!32003 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494276 (= res!296989 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!296994 () Bool)

(assert (=> start!45048 (=> (not res!296994) (not e!290053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45048 (= res!296994 (validMask!0 mask!3524))))

(assert (=> start!45048 e!290053))

(assert (=> start!45048 true))

(declare-fun array_inv!11269 (array!32003) Bool)

(assert (=> start!45048 (array_inv!11269 a!3235)))

(assert (= (and start!45048 res!296994) b!494280))

(assert (= (and b!494280 res!296987) b!494277))

(assert (= (and b!494277 res!296990) b!494279))

(assert (= (and b!494279 res!296992) b!494276))

(assert (= (and b!494276 res!296989) b!494281))

(assert (= (and b!494281 res!296993) b!494282))

(assert (= (and b!494282 res!296991) b!494283))

(assert (= (and b!494283 res!296996) b!494278))

(assert (= (and b!494278 (not res!296988)) b!494284))

(assert (= (and b!494284 (not res!296995)) b!494275))

(declare-fun m!474859 () Bool)

(assert (=> start!45048 m!474859))

(declare-fun m!474861 () Bool)

(assert (=> start!45048 m!474861))

(declare-fun m!474863 () Bool)

(assert (=> b!494278 m!474863))

(declare-fun m!474865 () Bool)

(assert (=> b!494278 m!474865))

(declare-fun m!474867 () Bool)

(assert (=> b!494278 m!474867))

(declare-fun m!474869 () Bool)

(assert (=> b!494278 m!474869))

(assert (=> b!494278 m!474867))

(declare-fun m!474871 () Bool)

(assert (=> b!494278 m!474871))

(assert (=> b!494278 m!474867))

(declare-fun m!474873 () Bool)

(assert (=> b!494278 m!474873))

(assert (=> b!494278 m!474865))

(declare-fun m!474875 () Bool)

(assert (=> b!494278 m!474875))

(assert (=> b!494278 m!474865))

(declare-fun m!474877 () Bool)

(assert (=> b!494278 m!474877))

(declare-fun m!474879 () Bool)

(assert (=> b!494278 m!474879))

(assert (=> b!494278 m!474867))

(declare-fun m!474881 () Bool)

(assert (=> b!494278 m!474881))

(declare-fun m!474883 () Bool)

(assert (=> b!494281 m!474883))

(declare-fun m!474885 () Bool)

(assert (=> b!494279 m!474885))

(assert (=> b!494277 m!474867))

(assert (=> b!494277 m!474867))

(declare-fun m!474887 () Bool)

(assert (=> b!494277 m!474887))

(declare-fun m!474889 () Bool)

(assert (=> b!494282 m!474889))

(declare-fun m!474891 () Bool)

(assert (=> b!494283 m!474891))

(declare-fun m!474893 () Bool)

(assert (=> b!494276 m!474893))

(check-sat (not b!494283) (not b!494276) (not b!494277) (not b!494279) (not b!494281) (not start!45048) (not b!494278) (not b!494282))
(check-sat)
