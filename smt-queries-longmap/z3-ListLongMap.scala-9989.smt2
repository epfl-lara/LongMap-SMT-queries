; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117942 () Bool)

(assert start!117942)

(declare-fun res!923365 () Bool)

(declare-fun e!783239 () Bool)

(assert (=> start!117942 (=> (not res!923365) (not e!783239))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117942 (= res!923365 (validMask!0 mask!3034))))

(assert (=> start!117942 e!783239))

(assert (=> start!117942 true))

(declare-datatypes ((array!94333 0))(
  ( (array!94334 (arr!45549 (Array (_ BitVec 32) (_ BitVec 64))) (size!46099 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94333)

(declare-fun array_inv!34577 (array!94333) Bool)

(assert (=> start!117942 (array_inv!34577 a!2971)))

(declare-fun b!1381736 () Bool)

(declare-fun res!923362 () Bool)

(assert (=> b!1381736 (=> (not res!923362) (not e!783239))))

(declare-datatypes ((List!32083 0))(
  ( (Nil!32080) (Cons!32079 (h!33288 (_ BitVec 64)) (t!46777 List!32083)) )
))
(declare-fun arrayNoDuplicates!0 (array!94333 (_ BitVec 32) List!32083) Bool)

(assert (=> b!1381736 (= res!923362 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32080))))

(declare-fun b!1381734 () Bool)

(declare-fun res!923364 () Bool)

(assert (=> b!1381734 (=> (not res!923364) (not e!783239))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1381734 (= res!923364 (and (= (size!46099 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46099 a!2971))))))

(declare-fun b!1381735 () Bool)

(declare-fun res!923363 () Bool)

(assert (=> b!1381735 (=> (not res!923363) (not e!783239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381735 (= res!923363 (validKeyInArray!0 (select (arr!45549 a!2971) i!1094)))))

(declare-fun b!1381737 () Bool)

(assert (=> b!1381737 (= e!783239 false)))

(declare-fun lt!608274 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94333 (_ BitVec 32)) Bool)

(assert (=> b!1381737 (= lt!608274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(assert (= (and start!117942 res!923365) b!1381734))

(assert (= (and b!1381734 res!923364) b!1381735))

(assert (= (and b!1381735 res!923363) b!1381736))

(assert (= (and b!1381736 res!923362) b!1381737))

(declare-fun m!1266915 () Bool)

(assert (=> start!117942 m!1266915))

(declare-fun m!1266917 () Bool)

(assert (=> start!117942 m!1266917))

(declare-fun m!1266919 () Bool)

(assert (=> b!1381736 m!1266919))

(declare-fun m!1266921 () Bool)

(assert (=> b!1381735 m!1266921))

(assert (=> b!1381735 m!1266921))

(declare-fun m!1266923 () Bool)

(assert (=> b!1381735 m!1266923))

(declare-fun m!1266925 () Bool)

(assert (=> b!1381737 m!1266925))

(check-sat (not start!117942) (not b!1381736) (not b!1381737) (not b!1381735))
