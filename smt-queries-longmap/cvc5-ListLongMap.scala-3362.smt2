; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46224 () Bool)

(assert start!46224)

(declare-fun b!511850 () Bool)

(declare-fun res!312516 () Bool)

(declare-fun e!299031 () Bool)

(assert (=> b!511850 (=> (not res!312516) (not e!299031))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511850 (= res!312516 (validKeyInArray!0 k!2280))))

(declare-fun b!511851 () Bool)

(declare-fun e!299028 () Bool)

(assert (=> b!511851 (= e!299031 e!299028)))

(declare-fun res!312520 () Bool)

(assert (=> b!511851 (=> (not res!312520) (not e!299028))))

(declare-datatypes ((SeekEntryResult!4283 0))(
  ( (MissingZero!4283 (index!19320 (_ BitVec 32))) (Found!4283 (index!19321 (_ BitVec 32))) (Intermediate!4283 (undefined!5095 Bool) (index!19322 (_ BitVec 32)) (x!48274 (_ BitVec 32))) (Undefined!4283) (MissingVacant!4283 (index!19323 (_ BitVec 32))) )
))
(declare-fun lt!234228 () SeekEntryResult!4283)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!511851 (= res!312520 (or (= lt!234228 (MissingZero!4283 i!1204)) (= lt!234228 (MissingVacant!4283 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32878 0))(
  ( (array!32879 (arr!15816 (Array (_ BitVec 32) (_ BitVec 64))) (size!16180 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32878)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32878 (_ BitVec 32)) SeekEntryResult!4283)

(assert (=> b!511851 (= lt!234228 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!312515 () Bool)

(assert (=> start!46224 (=> (not res!312515) (not e!299031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46224 (= res!312515 (validMask!0 mask!3524))))

(assert (=> start!46224 e!299031))

(assert (=> start!46224 true))

(declare-fun array_inv!11612 (array!32878) Bool)

(assert (=> start!46224 (array_inv!11612 a!3235)))

(declare-fun b!511852 () Bool)

(declare-fun res!312521 () Bool)

(assert (=> b!511852 (=> (not res!312521) (not e!299028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32878 (_ BitVec 32)) Bool)

(assert (=> b!511852 (= res!312521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511853 () Bool)

(declare-fun res!312518 () Bool)

(assert (=> b!511853 (=> (not res!312518) (not e!299031))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!511853 (= res!312518 (and (= (size!16180 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16180 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16180 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511854 () Bool)

(declare-fun e!299029 () Bool)

(assert (=> b!511854 (= e!299028 (not e!299029))))

(declare-fun res!312513 () Bool)

(assert (=> b!511854 (=> res!312513 e!299029)))

(declare-fun lt!234227 () SeekEntryResult!4283)

(declare-fun lt!234231 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32878 (_ BitVec 32)) SeekEntryResult!4283)

(assert (=> b!511854 (= res!312513 (= lt!234227 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234231 (select (store (arr!15816 a!3235) i!1204 k!2280) j!176) (array!32879 (store (arr!15816 a!3235) i!1204 k!2280) (size!16180 a!3235)) mask!3524)))))

(declare-fun lt!234232 () (_ BitVec 32))

(assert (=> b!511854 (= lt!234227 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234232 (select (arr!15816 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511854 (= lt!234231 (toIndex!0 (select (store (arr!15816 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511854 (= lt!234232 (toIndex!0 (select (arr!15816 a!3235) j!176) mask!3524))))

(declare-fun lt!234229 () SeekEntryResult!4283)

(assert (=> b!511854 (= lt!234229 (Found!4283 j!176))))

(assert (=> b!511854 (= lt!234229 (seekEntryOrOpen!0 (select (arr!15816 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511854 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15824 0))(
  ( (Unit!15825) )
))
(declare-fun lt!234230 () Unit!15824)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32878 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15824)

(assert (=> b!511854 (= lt!234230 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511855 () Bool)

(declare-fun res!312519 () Bool)

(assert (=> b!511855 (=> (not res!312519) (not e!299028))))

(declare-datatypes ((List!9974 0))(
  ( (Nil!9971) (Cons!9970 (h!10850 (_ BitVec 64)) (t!16202 List!9974)) )
))
(declare-fun arrayNoDuplicates!0 (array!32878 (_ BitVec 32) List!9974) Bool)

(assert (=> b!511855 (= res!312519 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9971))))

(declare-fun b!511856 () Bool)

(declare-fun res!312514 () Bool)

(assert (=> b!511856 (=> res!312514 e!299029)))

(assert (=> b!511856 (= res!312514 (or (not (is-Intermediate!4283 lt!234227)) (not (undefined!5095 lt!234227))))))

(declare-fun b!511857 () Bool)

(declare-fun res!312517 () Bool)

(assert (=> b!511857 (=> (not res!312517) (not e!299031))))

(declare-fun arrayContainsKey!0 (array!32878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511857 (= res!312517 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!511858 () Bool)

(declare-fun res!312512 () Bool)

(assert (=> b!511858 (=> (not res!312512) (not e!299031))))

(assert (=> b!511858 (= res!312512 (validKeyInArray!0 (select (arr!15816 a!3235) j!176)))))

(declare-fun b!511859 () Bool)

(assert (=> b!511859 (= e!299029 true)))

(assert (=> b!511859 (= lt!234229 Undefined!4283)))

(assert (= (and start!46224 res!312515) b!511853))

(assert (= (and b!511853 res!312518) b!511858))

(assert (= (and b!511858 res!312512) b!511850))

(assert (= (and b!511850 res!312516) b!511857))

(assert (= (and b!511857 res!312517) b!511851))

(assert (= (and b!511851 res!312520) b!511852))

(assert (= (and b!511852 res!312521) b!511855))

(assert (= (and b!511855 res!312519) b!511854))

(assert (= (and b!511854 (not res!312513)) b!511856))

(assert (= (and b!511856 (not res!312514)) b!511859))

(declare-fun m!493389 () Bool)

(assert (=> b!511851 m!493389))

(declare-fun m!493391 () Bool)

(assert (=> b!511854 m!493391))

(declare-fun m!493393 () Bool)

(assert (=> b!511854 m!493393))

(declare-fun m!493395 () Bool)

(assert (=> b!511854 m!493395))

(assert (=> b!511854 m!493395))

(declare-fun m!493397 () Bool)

(assert (=> b!511854 m!493397))

(declare-fun m!493399 () Bool)

(assert (=> b!511854 m!493399))

(declare-fun m!493401 () Bool)

(assert (=> b!511854 m!493401))

(assert (=> b!511854 m!493399))

(declare-fun m!493403 () Bool)

(assert (=> b!511854 m!493403))

(assert (=> b!511854 m!493399))

(declare-fun m!493405 () Bool)

(assert (=> b!511854 m!493405))

(assert (=> b!511854 m!493399))

(declare-fun m!493407 () Bool)

(assert (=> b!511854 m!493407))

(assert (=> b!511854 m!493395))

(declare-fun m!493409 () Bool)

(assert (=> b!511854 m!493409))

(declare-fun m!493411 () Bool)

(assert (=> b!511850 m!493411))

(assert (=> b!511858 m!493399))

(assert (=> b!511858 m!493399))

(declare-fun m!493413 () Bool)

(assert (=> b!511858 m!493413))

(declare-fun m!493415 () Bool)

(assert (=> start!46224 m!493415))

(declare-fun m!493417 () Bool)

(assert (=> start!46224 m!493417))

(declare-fun m!493419 () Bool)

(assert (=> b!511855 m!493419))

(declare-fun m!493421 () Bool)

(assert (=> b!511857 m!493421))

(declare-fun m!493423 () Bool)

(assert (=> b!511852 m!493423))

(push 1)

