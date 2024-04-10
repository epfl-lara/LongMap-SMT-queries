; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25886 () Bool)

(assert start!25886)

(declare-fun b!267584 () Bool)

(declare-fun res!131883 () Bool)

(declare-fun e!172978 () Bool)

(assert (=> b!267584 (=> (not res!131883) (not e!172978))))

(declare-datatypes ((array!13004 0))(
  ( (array!13005 (arr!6153 (Array (_ BitVec 32) (_ BitVec 64))) (size!6505 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13004)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!267584 (= res!131883 (and (= (size!6505 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6505 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6505 a!3325))))))

(declare-fun b!267585 () Bool)

(declare-fun res!131882 () Bool)

(assert (=> b!267585 (=> (not res!131882) (not e!172978))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267585 (= res!131882 (validKeyInArray!0 k0!2581))))

(declare-fun b!267587 () Bool)

(assert (=> b!267587 (= e!172978 (bvsge #b00000000000000000000000000000000 (size!6505 a!3325)))))

(declare-fun res!131880 () Bool)

(assert (=> start!25886 (=> (not res!131880) (not e!172978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25886 (= res!131880 (validMask!0 mask!3868))))

(assert (=> start!25886 e!172978))

(declare-fun array_inv!4116 (array!13004) Bool)

(assert (=> start!25886 (array_inv!4116 a!3325)))

(assert (=> start!25886 true))

(declare-fun b!267586 () Bool)

(declare-fun res!131881 () Bool)

(assert (=> b!267586 (=> (not res!131881) (not e!172978))))

(declare-datatypes ((List!3961 0))(
  ( (Nil!3958) (Cons!3957 (h!4624 (_ BitVec 64)) (t!9043 List!3961)) )
))
(declare-fun arrayNoDuplicates!0 (array!13004 (_ BitVec 32) List!3961) Bool)

(assert (=> b!267586 (= res!131881 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3958))))

(assert (= (and start!25886 res!131880) b!267584))

(assert (= (and b!267584 res!131883) b!267585))

(assert (= (and b!267585 res!131882) b!267586))

(assert (= (and b!267586 res!131881) b!267587))

(declare-fun m!283925 () Bool)

(assert (=> b!267585 m!283925))

(declare-fun m!283927 () Bool)

(assert (=> start!25886 m!283927))

(declare-fun m!283929 () Bool)

(assert (=> start!25886 m!283929))

(declare-fun m!283931 () Bool)

(assert (=> b!267586 m!283931))

(check-sat (not b!267585) (not b!267586) (not start!25886))
(check-sat)
