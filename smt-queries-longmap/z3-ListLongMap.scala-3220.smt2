; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45056 () Bool)

(assert start!45056)

(declare-fun b!494575 () Bool)

(declare-fun e!290225 () Bool)

(declare-fun e!290223 () Bool)

(assert (=> b!494575 (= e!290225 (not e!290223))))

(declare-fun res!297199 () Bool)

(assert (=> b!494575 (=> res!297199 e!290223)))

(declare-fun lt!223902 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32002 0))(
  ( (array!32003 (arr!15385 (Array (_ BitVec 32) (_ BitVec 64))) (size!15749 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32002)

(declare-datatypes ((SeekEntryResult!3808 0))(
  ( (MissingZero!3808 (index!17411 (_ BitVec 32))) (Found!3808 (index!17412 (_ BitVec 32))) (Intermediate!3808 (undefined!4620 Bool) (index!17413 (_ BitVec 32)) (x!46627 (_ BitVec 32))) (Undefined!3808) (MissingVacant!3808 (index!17414 (_ BitVec 32))) )
))
(declare-fun lt!223901 () SeekEntryResult!3808)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32002 (_ BitVec 32)) SeekEntryResult!3808)

(assert (=> b!494575 (= res!297199 (= lt!223901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223902 (select (store (arr!15385 a!3235) i!1204 k0!2280) j!176) (array!32003 (store (arr!15385 a!3235) i!1204 k0!2280) (size!15749 a!3235)) mask!3524)))))

(declare-fun lt!223905 () (_ BitVec 32))

(assert (=> b!494575 (= lt!223901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223905 (select (arr!15385 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494575 (= lt!223902 (toIndex!0 (select (store (arr!15385 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494575 (= lt!223905 (toIndex!0 (select (arr!15385 a!3235) j!176) mask!3524))))

(declare-fun lt!223904 () SeekEntryResult!3808)

(assert (=> b!494575 (= lt!223904 (Found!3808 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32002 (_ BitVec 32)) SeekEntryResult!3808)

(assert (=> b!494575 (= lt!223904 (seekEntryOrOpen!0 (select (arr!15385 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32002 (_ BitVec 32)) Bool)

(assert (=> b!494575 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14623 0))(
  ( (Unit!14624) )
))
(declare-fun lt!223903 () Unit!14623)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14623)

(assert (=> b!494575 (= lt!223903 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!297203 () Bool)

(declare-fun e!290226 () Bool)

(assert (=> start!45056 (=> (not res!297203) (not e!290226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45056 (= res!297203 (validMask!0 mask!3524))))

(assert (=> start!45056 e!290226))

(assert (=> start!45056 true))

(declare-fun array_inv!11244 (array!32002) Bool)

(assert (=> start!45056 (array_inv!11244 a!3235)))

(declare-fun b!494576 () Bool)

(declare-fun res!297200 () Bool)

(assert (=> b!494576 (=> (not res!297200) (not e!290226))))

(assert (=> b!494576 (= res!297200 (and (= (size!15749 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15749 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15749 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494577 () Bool)

(declare-fun res!297204 () Bool)

(assert (=> b!494577 (=> (not res!297204) (not e!290225))))

(assert (=> b!494577 (= res!297204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494578 () Bool)

(declare-fun res!297206 () Bool)

(assert (=> b!494578 (=> (not res!297206) (not e!290225))))

(declare-datatypes ((List!9450 0))(
  ( (Nil!9447) (Cons!9446 (h!10314 (_ BitVec 64)) (t!15670 List!9450)) )
))
(declare-fun arrayNoDuplicates!0 (array!32002 (_ BitVec 32) List!9450) Bool)

(assert (=> b!494578 (= res!297206 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9447))))

(declare-fun b!494579 () Bool)

(declare-fun res!297207 () Bool)

(assert (=> b!494579 (=> res!297207 e!290223)))

(get-info :version)

(assert (=> b!494579 (= res!297207 (or (not ((_ is Intermediate!3808) lt!223901)) (not (undefined!4620 lt!223901))))))

(declare-fun b!494580 () Bool)

(declare-fun res!297205 () Bool)

(assert (=> b!494580 (=> (not res!297205) (not e!290226))))

(declare-fun arrayContainsKey!0 (array!32002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494580 (= res!297205 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494581 () Bool)

(assert (=> b!494581 (= e!290223 true)))

(assert (=> b!494581 (= lt!223904 Undefined!3808)))

(declare-fun b!494582 () Bool)

(declare-fun res!297201 () Bool)

(assert (=> b!494582 (=> (not res!297201) (not e!290226))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494582 (= res!297201 (validKeyInArray!0 k0!2280))))

(declare-fun b!494583 () Bool)

(declare-fun res!297208 () Bool)

(assert (=> b!494583 (=> (not res!297208) (not e!290226))))

(assert (=> b!494583 (= res!297208 (validKeyInArray!0 (select (arr!15385 a!3235) j!176)))))

(declare-fun b!494584 () Bool)

(assert (=> b!494584 (= e!290226 e!290225)))

(declare-fun res!297202 () Bool)

(assert (=> b!494584 (=> (not res!297202) (not e!290225))))

(declare-fun lt!223906 () SeekEntryResult!3808)

(assert (=> b!494584 (= res!297202 (or (= lt!223906 (MissingZero!3808 i!1204)) (= lt!223906 (MissingVacant!3808 i!1204))))))

(assert (=> b!494584 (= lt!223906 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45056 res!297203) b!494576))

(assert (= (and b!494576 res!297200) b!494583))

(assert (= (and b!494583 res!297208) b!494582))

(assert (= (and b!494582 res!297201) b!494580))

(assert (= (and b!494580 res!297205) b!494584))

(assert (= (and b!494584 res!297202) b!494577))

(assert (= (and b!494577 res!297204) b!494578))

(assert (= (and b!494578 res!297206) b!494575))

(assert (= (and b!494575 (not res!297199)) b!494579))

(assert (= (and b!494579 (not res!297207)) b!494581))

(declare-fun m!475903 () Bool)

(assert (=> b!494584 m!475903))

(declare-fun m!475905 () Bool)

(assert (=> start!45056 m!475905))

(declare-fun m!475907 () Bool)

(assert (=> start!45056 m!475907))

(declare-fun m!475909 () Bool)

(assert (=> b!494577 m!475909))

(declare-fun m!475911 () Bool)

(assert (=> b!494583 m!475911))

(assert (=> b!494583 m!475911))

(declare-fun m!475913 () Bool)

(assert (=> b!494583 m!475913))

(declare-fun m!475915 () Bool)

(assert (=> b!494582 m!475915))

(declare-fun m!475917 () Bool)

(assert (=> b!494578 m!475917))

(declare-fun m!475919 () Bool)

(assert (=> b!494575 m!475919))

(declare-fun m!475921 () Bool)

(assert (=> b!494575 m!475921))

(declare-fun m!475923 () Bool)

(assert (=> b!494575 m!475923))

(assert (=> b!494575 m!475911))

(declare-fun m!475925 () Bool)

(assert (=> b!494575 m!475925))

(assert (=> b!494575 m!475911))

(declare-fun m!475927 () Bool)

(assert (=> b!494575 m!475927))

(assert (=> b!494575 m!475911))

(declare-fun m!475929 () Bool)

(assert (=> b!494575 m!475929))

(assert (=> b!494575 m!475923))

(declare-fun m!475931 () Bool)

(assert (=> b!494575 m!475931))

(assert (=> b!494575 m!475911))

(declare-fun m!475933 () Bool)

(assert (=> b!494575 m!475933))

(assert (=> b!494575 m!475923))

(declare-fun m!475935 () Bool)

(assert (=> b!494575 m!475935))

(declare-fun m!475937 () Bool)

(assert (=> b!494580 m!475937))

(check-sat (not b!494575) (not b!494582) (not b!494583) (not b!494580) (not b!494584) (not b!494577) (not b!494578) (not start!45056))
(check-sat)
