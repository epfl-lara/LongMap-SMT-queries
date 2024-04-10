; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45070 () Bool)

(assert start!45070)

(declare-fun b!494696 () Bool)

(declare-fun res!297269 () Bool)

(declare-fun e!290288 () Bool)

(assert (=> b!494696 (=> (not res!297269) (not e!290288))))

(declare-datatypes ((array!32015 0))(
  ( (array!32016 (arr!15392 (Array (_ BitVec 32) (_ BitVec 64))) (size!15756 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32015)

(declare-datatypes ((List!9550 0))(
  ( (Nil!9547) (Cons!9546 (h!10414 (_ BitVec 64)) (t!15778 List!9550)) )
))
(declare-fun arrayNoDuplicates!0 (array!32015 (_ BitVec 32) List!9550) Bool)

(assert (=> b!494696 (= res!297269 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9547))))

(declare-fun b!494697 () Bool)

(declare-fun res!297267 () Bool)

(declare-fun e!290289 () Bool)

(assert (=> b!494697 (=> (not res!297267) (not e!290289))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32015 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494697 (= res!297267 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494698 () Bool)

(declare-fun res!297272 () Bool)

(assert (=> b!494698 (=> (not res!297272) (not e!290289))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494698 (= res!297272 (validKeyInArray!0 (select (arr!15392 a!3235) j!176)))))

(declare-fun b!494699 () Bool)

(declare-fun res!297270 () Bool)

(assert (=> b!494699 (=> (not res!297270) (not e!290289))))

(assert (=> b!494699 (= res!297270 (validKeyInArray!0 k!2280))))

(declare-fun b!494700 () Bool)

(declare-fun res!297273 () Bool)

(assert (=> b!494700 (=> (not res!297273) (not e!290288))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32015 (_ BitVec 32)) Bool)

(assert (=> b!494700 (= res!297273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494701 () Bool)

(declare-fun e!290287 () Bool)

(assert (=> b!494701 (= e!290288 (not e!290287))))

(declare-fun res!297275 () Bool)

(assert (=> b!494701 (=> res!297275 e!290287)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3859 0))(
  ( (MissingZero!3859 (index!17615 (_ BitVec 32))) (Found!3859 (index!17616 (_ BitVec 32))) (Intermediate!3859 (undefined!4671 Bool) (index!17617 (_ BitVec 32)) (x!46681 (_ BitVec 32))) (Undefined!3859) (MissingVacant!3859 (index!17618 (_ BitVec 32))) )
))
(declare-fun lt!223927 () SeekEntryResult!3859)

(declare-fun lt!223925 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32015 (_ BitVec 32)) SeekEntryResult!3859)

(assert (=> b!494701 (= res!297275 (= lt!223927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223925 (select (store (arr!15392 a!3235) i!1204 k!2280) j!176) (array!32016 (store (arr!15392 a!3235) i!1204 k!2280) (size!15756 a!3235)) mask!3524)))))

(declare-fun lt!223926 () (_ BitVec 32))

(assert (=> b!494701 (= lt!223927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223926 (select (arr!15392 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494701 (= lt!223925 (toIndex!0 (select (store (arr!15392 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494701 (= lt!223926 (toIndex!0 (select (arr!15392 a!3235) j!176) mask!3524))))

(declare-fun lt!223929 () SeekEntryResult!3859)

(assert (=> b!494701 (= lt!223929 (Found!3859 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32015 (_ BitVec 32)) SeekEntryResult!3859)

(assert (=> b!494701 (= lt!223929 (seekEntryOrOpen!0 (select (arr!15392 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494701 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14664 0))(
  ( (Unit!14665) )
))
(declare-fun lt!223928 () Unit!14664)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32015 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14664)

(assert (=> b!494701 (= lt!223928 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494702 () Bool)

(assert (=> b!494702 (= e!290287 true)))

(assert (=> b!494702 (= lt!223929 Undefined!3859)))

(declare-fun b!494703 () Bool)

(declare-fun res!297268 () Bool)

(assert (=> b!494703 (=> (not res!297268) (not e!290289))))

(assert (=> b!494703 (= res!297268 (and (= (size!15756 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15756 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15756 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!297266 () Bool)

(assert (=> start!45070 (=> (not res!297266) (not e!290289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45070 (= res!297266 (validMask!0 mask!3524))))

(assert (=> start!45070 e!290289))

(assert (=> start!45070 true))

(declare-fun array_inv!11188 (array!32015) Bool)

(assert (=> start!45070 (array_inv!11188 a!3235)))

(declare-fun b!494704 () Bool)

(declare-fun res!297274 () Bool)

(assert (=> b!494704 (=> res!297274 e!290287)))

(assert (=> b!494704 (= res!297274 (or (not (is-Intermediate!3859 lt!223927)) (not (undefined!4671 lt!223927))))))

(declare-fun b!494705 () Bool)

(assert (=> b!494705 (= e!290289 e!290288)))

(declare-fun res!297271 () Bool)

(assert (=> b!494705 (=> (not res!297271) (not e!290288))))

(declare-fun lt!223930 () SeekEntryResult!3859)

(assert (=> b!494705 (= res!297271 (or (= lt!223930 (MissingZero!3859 i!1204)) (= lt!223930 (MissingVacant!3859 i!1204))))))

(assert (=> b!494705 (= lt!223930 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!45070 res!297266) b!494703))

(assert (= (and b!494703 res!297268) b!494698))

(assert (= (and b!494698 res!297272) b!494699))

(assert (= (and b!494699 res!297270) b!494697))

(assert (= (and b!494697 res!297267) b!494705))

(assert (= (and b!494705 res!297271) b!494700))

(assert (= (and b!494700 res!297273) b!494696))

(assert (= (and b!494696 res!297269) b!494701))

(assert (= (and b!494701 (not res!297275)) b!494704))

(assert (= (and b!494704 (not res!297274)) b!494702))

(declare-fun m!475791 () Bool)

(assert (=> b!494699 m!475791))

(declare-fun m!475793 () Bool)

(assert (=> b!494705 m!475793))

(declare-fun m!475795 () Bool)

(assert (=> b!494700 m!475795))

(declare-fun m!475797 () Bool)

(assert (=> b!494697 m!475797))

(declare-fun m!475799 () Bool)

(assert (=> b!494696 m!475799))

(declare-fun m!475801 () Bool)

(assert (=> start!45070 m!475801))

(declare-fun m!475803 () Bool)

(assert (=> start!45070 m!475803))

(declare-fun m!475805 () Bool)

(assert (=> b!494698 m!475805))

(assert (=> b!494698 m!475805))

(declare-fun m!475807 () Bool)

(assert (=> b!494698 m!475807))

(declare-fun m!475809 () Bool)

(assert (=> b!494701 m!475809))

(declare-fun m!475811 () Bool)

(assert (=> b!494701 m!475811))

(declare-fun m!475813 () Bool)

(assert (=> b!494701 m!475813))

(assert (=> b!494701 m!475813))

(declare-fun m!475815 () Bool)

(assert (=> b!494701 m!475815))

(assert (=> b!494701 m!475805))

(declare-fun m!475817 () Bool)

(assert (=> b!494701 m!475817))

(assert (=> b!494701 m!475805))

(declare-fun m!475819 () Bool)

(assert (=> b!494701 m!475819))

(assert (=> b!494701 m!475805))

(declare-fun m!475821 () Bool)

(assert (=> b!494701 m!475821))

(assert (=> b!494701 m!475805))

(declare-fun m!475823 () Bool)

(assert (=> b!494701 m!475823))

(assert (=> b!494701 m!475813))

(declare-fun m!475825 () Bool)

(assert (=> b!494701 m!475825))

(push 1)

