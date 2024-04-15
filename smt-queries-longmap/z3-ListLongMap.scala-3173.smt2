; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44652 () Bool)

(assert start!44652)

(declare-fun res!292866 () Bool)

(declare-fun e!287962 () Bool)

(assert (=> start!44652 (=> (not res!292866) (not e!287962))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44652 (= res!292866 (validMask!0 mask!3524))))

(assert (=> start!44652 e!287962))

(assert (=> start!44652 true))

(declare-datatypes ((array!31721 0))(
  ( (array!31722 (arr!15248 (Array (_ BitVec 32) (_ BitVec 64))) (size!15613 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31721)

(declare-fun array_inv!11131 (array!31721) Bool)

(assert (=> start!44652 (array_inv!11131 a!3235)))

(declare-fun b!489785 () Bool)

(declare-fun res!292868 () Bool)

(assert (=> b!489785 (=> (not res!292868) (not e!287962))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!489785 (= res!292868 (and (= (size!15613 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15613 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15613 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!489786 () Bool)

(declare-fun res!292867 () Bool)

(assert (=> b!489786 (=> (not res!292867) (not e!287962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489786 (= res!292867 (validKeyInArray!0 (select (arr!15248 a!3235) j!176)))))

(declare-fun b!489787 () Bool)

(declare-fun e!287964 () Bool)

(assert (=> b!489787 (= e!287962 e!287964)))

(declare-fun res!292871 () Bool)

(assert (=> b!489787 (=> (not res!292871) (not e!287964))))

(declare-datatypes ((SeekEntryResult!3712 0))(
  ( (MissingZero!3712 (index!17027 (_ BitVec 32))) (Found!3712 (index!17028 (_ BitVec 32))) (Intermediate!3712 (undefined!4524 Bool) (index!17029 (_ BitVec 32)) (x!46141 (_ BitVec 32))) (Undefined!3712) (MissingVacant!3712 (index!17030 (_ BitVec 32))) )
))
(declare-fun lt!221006 () SeekEntryResult!3712)

(assert (=> b!489787 (= res!292871 (or (= lt!221006 (MissingZero!3712 i!1204)) (= lt!221006 (MissingVacant!3712 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31721 (_ BitVec 32)) SeekEntryResult!3712)

(assert (=> b!489787 (= lt!221006 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489788 () Bool)

(declare-fun res!292863 () Bool)

(assert (=> b!489788 (=> (not res!292863) (not e!287962))))

(assert (=> b!489788 (= res!292863 (validKeyInArray!0 k0!2280))))

(declare-fun b!489789 () Bool)

(assert (=> b!489789 (= e!287964 (not true))))

(declare-fun lt!221004 () (_ BitVec 32))

(declare-fun lt!221008 () SeekEntryResult!3712)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31721 (_ BitVec 32)) SeekEntryResult!3712)

(assert (=> b!489789 (= lt!221008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221004 (select (store (arr!15248 a!3235) i!1204 k0!2280) j!176) (array!31722 (store (arr!15248 a!3235) i!1204 k0!2280) (size!15613 a!3235)) mask!3524))))

(declare-fun lt!221003 () SeekEntryResult!3712)

(declare-fun lt!221007 () (_ BitVec 32))

(assert (=> b!489789 (= lt!221003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221007 (select (arr!15248 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489789 (= lt!221004 (toIndex!0 (select (store (arr!15248 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489789 (= lt!221007 (toIndex!0 (select (arr!15248 a!3235) j!176) mask!3524))))

(declare-fun e!287963 () Bool)

(assert (=> b!489789 e!287963))

(declare-fun res!292865 () Bool)

(assert (=> b!489789 (=> (not res!292865) (not e!287963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31721 (_ BitVec 32)) Bool)

(assert (=> b!489789 (= res!292865 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14356 0))(
  ( (Unit!14357) )
))
(declare-fun lt!221005 () Unit!14356)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14356)

(assert (=> b!489789 (= lt!221005 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!489790 () Bool)

(declare-fun res!292869 () Bool)

(assert (=> b!489790 (=> (not res!292869) (not e!287964))))

(assert (=> b!489790 (= res!292869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489791 () Bool)

(declare-fun res!292864 () Bool)

(assert (=> b!489791 (=> (not res!292864) (not e!287962))))

(declare-fun arrayContainsKey!0 (array!31721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489791 (= res!292864 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489792 () Bool)

(assert (=> b!489792 (= e!287963 (= (seekEntryOrOpen!0 (select (arr!15248 a!3235) j!176) a!3235 mask!3524) (Found!3712 j!176)))))

(declare-fun b!489793 () Bool)

(declare-fun res!292870 () Bool)

(assert (=> b!489793 (=> (not res!292870) (not e!287964))))

(declare-datatypes ((List!9445 0))(
  ( (Nil!9442) (Cons!9441 (h!10303 (_ BitVec 64)) (t!15664 List!9445)) )
))
(declare-fun arrayNoDuplicates!0 (array!31721 (_ BitVec 32) List!9445) Bool)

(assert (=> b!489793 (= res!292870 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9442))))

(assert (= (and start!44652 res!292866) b!489785))

(assert (= (and b!489785 res!292868) b!489786))

(assert (= (and b!489786 res!292867) b!489788))

(assert (= (and b!489788 res!292863) b!489791))

(assert (= (and b!489791 res!292864) b!489787))

(assert (= (and b!489787 res!292871) b!489790))

(assert (= (and b!489790 res!292869) b!489793))

(assert (= (and b!489793 res!292870) b!489789))

(assert (= (and b!489789 res!292865) b!489792))

(declare-fun m!469285 () Bool)

(assert (=> b!489786 m!469285))

(assert (=> b!489786 m!469285))

(declare-fun m!469287 () Bool)

(assert (=> b!489786 m!469287))

(declare-fun m!469289 () Bool)

(assert (=> b!489793 m!469289))

(declare-fun m!469291 () Bool)

(assert (=> b!489787 m!469291))

(declare-fun m!469293 () Bool)

(assert (=> b!489789 m!469293))

(declare-fun m!469295 () Bool)

(assert (=> b!489789 m!469295))

(declare-fun m!469297 () Bool)

(assert (=> b!489789 m!469297))

(assert (=> b!489789 m!469285))

(declare-fun m!469299 () Bool)

(assert (=> b!489789 m!469299))

(assert (=> b!489789 m!469285))

(declare-fun m!469301 () Bool)

(assert (=> b!489789 m!469301))

(assert (=> b!489789 m!469297))

(declare-fun m!469303 () Bool)

(assert (=> b!489789 m!469303))

(assert (=> b!489789 m!469285))

(declare-fun m!469305 () Bool)

(assert (=> b!489789 m!469305))

(assert (=> b!489789 m!469297))

(declare-fun m!469307 () Bool)

(assert (=> b!489789 m!469307))

(declare-fun m!469309 () Bool)

(assert (=> b!489790 m!469309))

(declare-fun m!469311 () Bool)

(assert (=> b!489788 m!469311))

(declare-fun m!469313 () Bool)

(assert (=> b!489791 m!469313))

(declare-fun m!469315 () Bool)

(assert (=> start!44652 m!469315))

(declare-fun m!469317 () Bool)

(assert (=> start!44652 m!469317))

(assert (=> b!489792 m!469285))

(assert (=> b!489792 m!469285))

(declare-fun m!469319 () Bool)

(assert (=> b!489792 m!469319))

(check-sat (not b!489787) (not b!489790) (not b!489789) (not b!489793) (not b!489791) (not b!489792) (not b!489786) (not b!489788) (not start!44652))
(check-sat)
