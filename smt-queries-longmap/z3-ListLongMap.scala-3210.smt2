; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44996 () Bool)

(assert start!44996)

(declare-fun b!493675 () Bool)

(declare-fun res!296306 () Bool)

(declare-fun e!289863 () Bool)

(assert (=> b!493675 (=> (not res!296306) (not e!289863))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493675 (= res!296306 (validKeyInArray!0 k0!2280))))

(declare-fun b!493676 () Bool)

(declare-fun e!289866 () Bool)

(assert (=> b!493676 (= e!289863 e!289866)))

(declare-fun res!296302 () Bool)

(assert (=> b!493676 (=> (not res!296302) (not e!289866))))

(declare-datatypes ((SeekEntryResult!3778 0))(
  ( (MissingZero!3778 (index!17291 (_ BitVec 32))) (Found!3778 (index!17292 (_ BitVec 32))) (Intermediate!3778 (undefined!4590 Bool) (index!17293 (_ BitVec 32)) (x!46517 (_ BitVec 32))) (Undefined!3778) (MissingVacant!3778 (index!17294 (_ BitVec 32))) )
))
(declare-fun lt!223362 () SeekEntryResult!3778)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493676 (= res!296302 (or (= lt!223362 (MissingZero!3778 i!1204)) (= lt!223362 (MissingVacant!3778 i!1204))))))

(declare-datatypes ((array!31942 0))(
  ( (array!31943 (arr!15355 (Array (_ BitVec 32) (_ BitVec 64))) (size!15719 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31942)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31942 (_ BitVec 32)) SeekEntryResult!3778)

(assert (=> b!493676 (= lt!223362 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493677 () Bool)

(declare-fun e!289865 () Bool)

(assert (=> b!493677 (= e!289866 (not e!289865))))

(declare-fun res!296307 () Bool)

(assert (=> b!493677 (=> res!296307 e!289865)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!223365 () SeekEntryResult!3778)

(declare-fun lt!223361 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31942 (_ BitVec 32)) SeekEntryResult!3778)

(assert (=> b!493677 (= res!296307 (= lt!223365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223361 (select (store (arr!15355 a!3235) i!1204 k0!2280) j!176) (array!31943 (store (arr!15355 a!3235) i!1204 k0!2280) (size!15719 a!3235)) mask!3524)))))

(declare-fun lt!223366 () (_ BitVec 32))

(assert (=> b!493677 (= lt!223365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223366 (select (arr!15355 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493677 (= lt!223361 (toIndex!0 (select (store (arr!15355 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493677 (= lt!223366 (toIndex!0 (select (arr!15355 a!3235) j!176) mask!3524))))

(declare-fun lt!223363 () SeekEntryResult!3778)

(assert (=> b!493677 (= lt!223363 (Found!3778 j!176))))

(assert (=> b!493677 (= lt!223363 (seekEntryOrOpen!0 (select (arr!15355 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31942 (_ BitVec 32)) Bool)

(assert (=> b!493677 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14563 0))(
  ( (Unit!14564) )
))
(declare-fun lt!223364 () Unit!14563)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31942 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14563)

(assert (=> b!493677 (= lt!223364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493678 () Bool)

(declare-fun res!296300 () Bool)

(assert (=> b!493678 (=> (not res!296300) (not e!289863))))

(assert (=> b!493678 (= res!296300 (and (= (size!15719 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15719 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15719 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493679 () Bool)

(declare-fun res!296299 () Bool)

(assert (=> b!493679 (=> (not res!296299) (not e!289866))))

(declare-datatypes ((List!9420 0))(
  ( (Nil!9417) (Cons!9416 (h!10284 (_ BitVec 64)) (t!15640 List!9420)) )
))
(declare-fun arrayNoDuplicates!0 (array!31942 (_ BitVec 32) List!9420) Bool)

(assert (=> b!493679 (= res!296299 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9417))))

(declare-fun b!493680 () Bool)

(assert (=> b!493680 (= e!289865 true)))

(assert (=> b!493680 (= lt!223363 Undefined!3778)))

(declare-fun res!296308 () Bool)

(assert (=> start!44996 (=> (not res!296308) (not e!289863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44996 (= res!296308 (validMask!0 mask!3524))))

(assert (=> start!44996 e!289863))

(assert (=> start!44996 true))

(declare-fun array_inv!11214 (array!31942) Bool)

(assert (=> start!44996 (array_inv!11214 a!3235)))

(declare-fun b!493681 () Bool)

(declare-fun res!296304 () Bool)

(assert (=> b!493681 (=> (not res!296304) (not e!289866))))

(assert (=> b!493681 (= res!296304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493682 () Bool)

(declare-fun res!296303 () Bool)

(assert (=> b!493682 (=> res!296303 e!289865)))

(get-info :version)

(assert (=> b!493682 (= res!296303 (or (not ((_ is Intermediate!3778) lt!223365)) (not (undefined!4590 lt!223365))))))

(declare-fun b!493683 () Bool)

(declare-fun res!296301 () Bool)

(assert (=> b!493683 (=> (not res!296301) (not e!289863))))

(assert (=> b!493683 (= res!296301 (validKeyInArray!0 (select (arr!15355 a!3235) j!176)))))

(declare-fun b!493684 () Bool)

(declare-fun res!296305 () Bool)

(assert (=> b!493684 (=> (not res!296305) (not e!289863))))

(declare-fun arrayContainsKey!0 (array!31942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493684 (= res!296305 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44996 res!296308) b!493678))

(assert (= (and b!493678 res!296300) b!493683))

(assert (= (and b!493683 res!296301) b!493675))

(assert (= (and b!493675 res!296306) b!493684))

(assert (= (and b!493684 res!296305) b!493676))

(assert (= (and b!493676 res!296302) b!493681))

(assert (= (and b!493681 res!296304) b!493679))

(assert (= (and b!493679 res!296299) b!493677))

(assert (= (and b!493677 (not res!296307)) b!493682))

(assert (= (and b!493682 (not res!296303)) b!493680))

(declare-fun m!474823 () Bool)

(assert (=> b!493676 m!474823))

(declare-fun m!474825 () Bool)

(assert (=> b!493679 m!474825))

(declare-fun m!474827 () Bool)

(assert (=> start!44996 m!474827))

(declare-fun m!474829 () Bool)

(assert (=> start!44996 m!474829))

(declare-fun m!474831 () Bool)

(assert (=> b!493684 m!474831))

(declare-fun m!474833 () Bool)

(assert (=> b!493683 m!474833))

(assert (=> b!493683 m!474833))

(declare-fun m!474835 () Bool)

(assert (=> b!493683 m!474835))

(declare-fun m!474837 () Bool)

(assert (=> b!493675 m!474837))

(declare-fun m!474839 () Bool)

(assert (=> b!493677 m!474839))

(declare-fun m!474841 () Bool)

(assert (=> b!493677 m!474841))

(declare-fun m!474843 () Bool)

(assert (=> b!493677 m!474843))

(assert (=> b!493677 m!474833))

(declare-fun m!474845 () Bool)

(assert (=> b!493677 m!474845))

(assert (=> b!493677 m!474833))

(declare-fun m!474847 () Bool)

(assert (=> b!493677 m!474847))

(assert (=> b!493677 m!474843))

(declare-fun m!474849 () Bool)

(assert (=> b!493677 m!474849))

(assert (=> b!493677 m!474833))

(declare-fun m!474851 () Bool)

(assert (=> b!493677 m!474851))

(assert (=> b!493677 m!474833))

(declare-fun m!474853 () Bool)

(assert (=> b!493677 m!474853))

(assert (=> b!493677 m!474843))

(declare-fun m!474855 () Bool)

(assert (=> b!493677 m!474855))

(declare-fun m!474857 () Bool)

(assert (=> b!493681 m!474857))

(check-sat (not b!493684) (not b!493679) (not b!493677) (not b!493676) (not b!493675) (not b!493681) (not b!493683) (not start!44996))
(check-sat)
