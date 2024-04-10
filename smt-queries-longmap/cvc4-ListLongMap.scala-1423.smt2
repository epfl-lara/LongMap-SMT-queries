; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27568 () Bool)

(assert start!27568)

(declare-fun res!147337 () Bool)

(declare-fun e!180624 () Bool)

(assert (=> start!27568 (=> (not res!147337) (not e!180624))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27568 (= res!147337 (validMask!0 mask!3868))))

(assert (=> start!27568 e!180624))

(declare-datatypes ((array!14218 0))(
  ( (array!14219 (arr!6748 (Array (_ BitVec 32) (_ BitVec 64))) (size!7100 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14218)

(declare-fun array_inv!4711 (array!14218) Bool)

(assert (=> start!27568 (array_inv!4711 a!3325)))

(assert (=> start!27568 true))

(declare-fun b!284826 () Bool)

(declare-fun res!147338 () Bool)

(assert (=> b!284826 (=> (not res!147338) (not e!180624))))

(declare-datatypes ((List!4556 0))(
  ( (Nil!4553) (Cons!4552 (h!5225 (_ BitVec 64)) (t!9638 List!4556)) )
))
(declare-fun arrayNoDuplicates!0 (array!14218 (_ BitVec 32) List!4556) Bool)

(assert (=> b!284826 (= res!147338 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4553))))

(declare-fun b!284827 () Bool)

(declare-fun res!147336 () Bool)

(assert (=> b!284827 (=> (not res!147336) (not e!180624))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284827 (= res!147336 (and (= (size!7100 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7100 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7100 a!3325))))))

(declare-fun b!284828 () Bool)

(declare-fun res!147335 () Bool)

(assert (=> b!284828 (=> (not res!147335) (not e!180624))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14218 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284828 (= res!147335 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284829 () Bool)

(declare-fun res!147339 () Bool)

(assert (=> b!284829 (=> (not res!147339) (not e!180624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284829 (= res!147339 (validKeyInArray!0 k!2581))))

(declare-fun b!284830 () Bool)

(declare-fun e!180626 () Bool)

(assert (=> b!284830 (= e!180626 false)))

(declare-fun lt!140631 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14218 (_ BitVec 32)) Bool)

(assert (=> b!284830 (= lt!140631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!284831 () Bool)

(assert (=> b!284831 (= e!180624 e!180626)))

(declare-fun res!147334 () Bool)

(assert (=> b!284831 (=> (not res!147334) (not e!180626))))

(declare-datatypes ((SeekEntryResult!1906 0))(
  ( (MissingZero!1906 (index!9794 (_ BitVec 32))) (Found!1906 (index!9795 (_ BitVec 32))) (Intermediate!1906 (undefined!2718 Bool) (index!9796 (_ BitVec 32)) (x!27993 (_ BitVec 32))) (Undefined!1906) (MissingVacant!1906 (index!9797 (_ BitVec 32))) )
))
(declare-fun lt!140632 () SeekEntryResult!1906)

(assert (=> b!284831 (= res!147334 (or (= lt!140632 (MissingZero!1906 i!1267)) (= lt!140632 (MissingVacant!1906 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14218 (_ BitVec 32)) SeekEntryResult!1906)

(assert (=> b!284831 (= lt!140632 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27568 res!147337) b!284827))

(assert (= (and b!284827 res!147336) b!284829))

(assert (= (and b!284829 res!147339) b!284826))

(assert (= (and b!284826 res!147338) b!284828))

(assert (= (and b!284828 res!147335) b!284831))

(assert (= (and b!284831 res!147334) b!284830))

(declare-fun m!299755 () Bool)

(assert (=> b!284831 m!299755))

(declare-fun m!299757 () Bool)

(assert (=> b!284830 m!299757))

(declare-fun m!299759 () Bool)

(assert (=> b!284826 m!299759))

(declare-fun m!299761 () Bool)

(assert (=> start!27568 m!299761))

(declare-fun m!299763 () Bool)

(assert (=> start!27568 m!299763))

(declare-fun m!299765 () Bool)

(assert (=> b!284829 m!299765))

(declare-fun m!299767 () Bool)

(assert (=> b!284828 m!299767))

(push 1)

(assert (not start!27568))

(assert (not b!284830))

(assert (not b!284828))

(assert (not b!284831))

(assert (not b!284829))

(assert (not b!284826))

(check-sat)

