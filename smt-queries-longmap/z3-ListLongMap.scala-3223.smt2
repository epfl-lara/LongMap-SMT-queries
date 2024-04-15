; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45072 () Bool)

(assert start!45072)

(declare-fun b!494637 () Bool)

(declare-fun res!297356 () Bool)

(declare-fun e!290200 () Bool)

(assert (=> b!494637 (=> (not res!297356) (not e!290200))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494637 (= res!297356 (validKeyInArray!0 k0!2280))))

(declare-fun b!494638 () Bool)

(declare-fun e!290198 () Bool)

(assert (=> b!494638 (= e!290200 e!290198)))

(declare-fun res!297357 () Bool)

(assert (=> b!494638 (=> (not res!297357) (not e!290198))))

(declare-datatypes ((SeekEntryResult!3862 0))(
  ( (MissingZero!3862 (index!17627 (_ BitVec 32))) (Found!3862 (index!17628 (_ BitVec 32))) (Intermediate!3862 (undefined!4674 Bool) (index!17629 (_ BitVec 32)) (x!46703 (_ BitVec 32))) (Undefined!3862) (MissingVacant!3862 (index!17630 (_ BitVec 32))) )
))
(declare-fun lt!223818 () SeekEntryResult!3862)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494638 (= res!297357 (or (= lt!223818 (MissingZero!3862 i!1204)) (= lt!223818 (MissingVacant!3862 i!1204))))))

(declare-datatypes ((array!32027 0))(
  ( (array!32028 (arr!15398 (Array (_ BitVec 32) (_ BitVec 64))) (size!15763 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32027)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32027 (_ BitVec 32)) SeekEntryResult!3862)

(assert (=> b!494638 (= lt!223818 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494639 () Bool)

(declare-fun res!297353 () Bool)

(declare-fun e!290202 () Bool)

(assert (=> b!494639 (=> res!297353 e!290202)))

(declare-fun lt!223819 () SeekEntryResult!3862)

(get-info :version)

(assert (=> b!494639 (= res!297353 (or (undefined!4674 lt!223819) (not ((_ is Intermediate!3862) lt!223819))))))

(declare-fun b!494640 () Bool)

(declare-fun res!297349 () Bool)

(assert (=> b!494640 (=> (not res!297349) (not e!290200))))

(declare-fun arrayContainsKey!0 (array!32027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494640 (= res!297349 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!297352 () Bool)

(assert (=> start!45072 (=> (not res!297352) (not e!290200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45072 (= res!297352 (validMask!0 mask!3524))))

(assert (=> start!45072 e!290200))

(assert (=> start!45072 true))

(declare-fun array_inv!11281 (array!32027) Bool)

(assert (=> start!45072 (array_inv!11281 a!3235)))

(declare-fun b!494641 () Bool)

(assert (=> b!494641 (= e!290198 (not e!290202))))

(declare-fun res!297351 () Bool)

(assert (=> b!494641 (=> res!297351 e!290202)))

(declare-fun lt!223816 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32027 (_ BitVec 32)) SeekEntryResult!3862)

(assert (=> b!494641 (= res!297351 (= lt!223819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223816 (select (store (arr!15398 a!3235) i!1204 k0!2280) j!176) (array!32028 (store (arr!15398 a!3235) i!1204 k0!2280) (size!15763 a!3235)) mask!3524)))))

(declare-fun lt!223815 () (_ BitVec 32))

(assert (=> b!494641 (= lt!223819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223815 (select (arr!15398 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494641 (= lt!223816 (toIndex!0 (select (store (arr!15398 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494641 (= lt!223815 (toIndex!0 (select (arr!15398 a!3235) j!176) mask!3524))))

(declare-fun e!290199 () Bool)

(assert (=> b!494641 e!290199))

(declare-fun res!297350 () Bool)

(assert (=> b!494641 (=> (not res!297350) (not e!290199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32027 (_ BitVec 32)) Bool)

(assert (=> b!494641 (= res!297350 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14656 0))(
  ( (Unit!14657) )
))
(declare-fun lt!223817 () Unit!14656)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32027 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14656)

(assert (=> b!494641 (= lt!223817 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494642 () Bool)

(assert (=> b!494642 (= e!290202 (or (not (= (select (arr!15398 a!3235) (index!17629 lt!223819)) (select (arr!15398 a!3235) j!176))) (bvsge mask!3524 #b00000000000000000000000000000000)))))

(assert (=> b!494642 (and (bvslt (x!46703 lt!223819) #b01111111111111111111111111111110) (or (= (select (arr!15398 a!3235) (index!17629 lt!223819)) (select (arr!15398 a!3235) j!176)) (= (select (arr!15398 a!3235) (index!17629 lt!223819)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15398 a!3235) (index!17629 lt!223819)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!494643 () Bool)

(declare-fun res!297358 () Bool)

(assert (=> b!494643 (=> (not res!297358) (not e!290200))))

(assert (=> b!494643 (= res!297358 (and (= (size!15763 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15763 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15763 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494644 () Bool)

(declare-fun res!297354 () Bool)

(assert (=> b!494644 (=> (not res!297354) (not e!290200))))

(assert (=> b!494644 (= res!297354 (validKeyInArray!0 (select (arr!15398 a!3235) j!176)))))

(declare-fun b!494645 () Bool)

(declare-fun res!297359 () Bool)

(assert (=> b!494645 (=> (not res!297359) (not e!290198))))

(assert (=> b!494645 (= res!297359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494646 () Bool)

(declare-fun res!297355 () Bool)

(assert (=> b!494646 (=> (not res!297355) (not e!290198))))

(declare-datatypes ((List!9595 0))(
  ( (Nil!9592) (Cons!9591 (h!10459 (_ BitVec 64)) (t!15814 List!9595)) )
))
(declare-fun arrayNoDuplicates!0 (array!32027 (_ BitVec 32) List!9595) Bool)

(assert (=> b!494646 (= res!297355 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9592))))

(declare-fun b!494647 () Bool)

(assert (=> b!494647 (= e!290199 (= (seekEntryOrOpen!0 (select (arr!15398 a!3235) j!176) a!3235 mask!3524) (Found!3862 j!176)))))

(assert (= (and start!45072 res!297352) b!494643))

(assert (= (and b!494643 res!297358) b!494644))

(assert (= (and b!494644 res!297354) b!494637))

(assert (= (and b!494637 res!297356) b!494640))

(assert (= (and b!494640 res!297349) b!494638))

(assert (= (and b!494638 res!297357) b!494645))

(assert (= (and b!494645 res!297359) b!494646))

(assert (= (and b!494646 res!297355) b!494641))

(assert (= (and b!494641 res!297350) b!494647))

(assert (= (and b!494641 (not res!297351)) b!494639))

(assert (= (and b!494639 (not res!297353)) b!494642))

(declare-fun m!475291 () Bool)

(assert (=> b!494644 m!475291))

(assert (=> b!494644 m!475291))

(declare-fun m!475293 () Bool)

(assert (=> b!494644 m!475293))

(declare-fun m!475295 () Bool)

(assert (=> b!494637 m!475295))

(declare-fun m!475297 () Bool)

(assert (=> b!494642 m!475297))

(assert (=> b!494642 m!475291))

(declare-fun m!475299 () Bool)

(assert (=> start!45072 m!475299))

(declare-fun m!475301 () Bool)

(assert (=> start!45072 m!475301))

(declare-fun m!475303 () Bool)

(assert (=> b!494640 m!475303))

(declare-fun m!475305 () Bool)

(assert (=> b!494645 m!475305))

(assert (=> b!494647 m!475291))

(assert (=> b!494647 m!475291))

(declare-fun m!475307 () Bool)

(assert (=> b!494647 m!475307))

(declare-fun m!475309 () Bool)

(assert (=> b!494638 m!475309))

(declare-fun m!475311 () Bool)

(assert (=> b!494646 m!475311))

(declare-fun m!475313 () Bool)

(assert (=> b!494641 m!475313))

(declare-fun m!475315 () Bool)

(assert (=> b!494641 m!475315))

(declare-fun m!475317 () Bool)

(assert (=> b!494641 m!475317))

(assert (=> b!494641 m!475291))

(declare-fun m!475319 () Bool)

(assert (=> b!494641 m!475319))

(assert (=> b!494641 m!475291))

(declare-fun m!475321 () Bool)

(assert (=> b!494641 m!475321))

(assert (=> b!494641 m!475291))

(declare-fun m!475323 () Bool)

(assert (=> b!494641 m!475323))

(assert (=> b!494641 m!475317))

(declare-fun m!475325 () Bool)

(assert (=> b!494641 m!475325))

(assert (=> b!494641 m!475317))

(declare-fun m!475327 () Bool)

(assert (=> b!494641 m!475327))

(check-sat (not b!494644) (not b!494645) (not start!45072) (not b!494647) (not b!494641) (not b!494640) (not b!494638) (not b!494637) (not b!494646))
(check-sat)
