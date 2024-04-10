; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27134 () Bool)

(assert start!27134)

(declare-fun b!280635 () Bool)

(declare-fun e!178607 () Bool)

(declare-fun e!178606 () Bool)

(assert (=> b!280635 (= e!178607 e!178606)))

(declare-fun res!143710 () Bool)

(assert (=> b!280635 (=> (not res!143710) (not e!178606))))

(declare-datatypes ((SeekEntryResult!1776 0))(
  ( (MissingZero!1776 (index!9274 (_ BitVec 32))) (Found!1776 (index!9275 (_ BitVec 32))) (Intermediate!1776 (undefined!2588 Bool) (index!9276 (_ BitVec 32)) (x!27510 (_ BitVec 32))) (Undefined!1776) (MissingVacant!1776 (index!9277 (_ BitVec 32))) )
))
(declare-fun lt!138870 () SeekEntryResult!1776)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280635 (= res!143710 (or (= lt!138870 (MissingZero!1776 i!1267)) (= lt!138870 (MissingVacant!1776 i!1267))))))

(declare-datatypes ((array!13952 0))(
  ( (array!13953 (arr!6618 (Array (_ BitVec 32) (_ BitVec 64))) (size!6970 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13952)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13952 (_ BitVec 32)) SeekEntryResult!1776)

(assert (=> b!280635 (= lt!138870 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!280636 () Bool)

(declare-fun res!143704 () Bool)

(assert (=> b!280636 (=> (not res!143704) (not e!178607))))

(declare-fun arrayContainsKey!0 (array!13952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280636 (= res!143704 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280637 () Bool)

(declare-fun res!143711 () Bool)

(assert (=> b!280637 (=> (not res!143711) (not e!178607))))

(declare-datatypes ((List!4426 0))(
  ( (Nil!4423) (Cons!4422 (h!5092 (_ BitVec 64)) (t!9508 List!4426)) )
))
(declare-fun arrayNoDuplicates!0 (array!13952 (_ BitVec 32) List!4426) Bool)

(assert (=> b!280637 (= res!143711 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4423))))

(declare-fun b!280638 () Bool)

(assert (=> b!280638 (= e!178606 (not true))))

(assert (=> b!280638 (arrayNoDuplicates!0 (array!13953 (store (arr!6618 a!3325) i!1267 k0!2581) (size!6970 a!3325)) #b00000000000000000000000000000000 Nil!4423)))

(declare-datatypes ((Unit!8836 0))(
  ( (Unit!8837) )
))
(declare-fun lt!138871 () Unit!8836)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13952 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4426) Unit!8836)

(assert (=> b!280638 (= lt!138871 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4423))))

(declare-fun b!280639 () Bool)

(declare-fun res!143705 () Bool)

(assert (=> b!280639 (=> (not res!143705) (not e!178606))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!280639 (= res!143705 (not (= startIndex!26 i!1267)))))

(declare-fun res!143707 () Bool)

(assert (=> start!27134 (=> (not res!143707) (not e!178607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27134 (= res!143707 (validMask!0 mask!3868))))

(assert (=> start!27134 e!178607))

(declare-fun array_inv!4581 (array!13952) Bool)

(assert (=> start!27134 (array_inv!4581 a!3325)))

(assert (=> start!27134 true))

(declare-fun b!280640 () Bool)

(declare-fun res!143708 () Bool)

(assert (=> b!280640 (=> (not res!143708) (not e!178606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280640 (= res!143708 (validKeyInArray!0 (select (arr!6618 a!3325) startIndex!26)))))

(declare-fun b!280641 () Bool)

(declare-fun res!143712 () Bool)

(assert (=> b!280641 (=> (not res!143712) (not e!178606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13952 (_ BitVec 32)) Bool)

(assert (=> b!280641 (= res!143712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280642 () Bool)

(declare-fun res!143709 () Bool)

(assert (=> b!280642 (=> (not res!143709) (not e!178607))))

(assert (=> b!280642 (= res!143709 (validKeyInArray!0 k0!2581))))

(declare-fun b!280643 () Bool)

(declare-fun res!143706 () Bool)

(assert (=> b!280643 (=> (not res!143706) (not e!178607))))

(assert (=> b!280643 (= res!143706 (and (= (size!6970 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6970 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6970 a!3325))))))

(assert (= (and start!27134 res!143707) b!280643))

(assert (= (and b!280643 res!143706) b!280642))

(assert (= (and b!280642 res!143709) b!280637))

(assert (= (and b!280637 res!143711) b!280636))

(assert (= (and b!280636 res!143704) b!280635))

(assert (= (and b!280635 res!143710) b!280641))

(assert (= (and b!280641 res!143712) b!280639))

(assert (= (and b!280639 res!143705) b!280640))

(assert (= (and b!280640 res!143708) b!280638))

(declare-fun m!295047 () Bool)

(assert (=> start!27134 m!295047))

(declare-fun m!295049 () Bool)

(assert (=> start!27134 m!295049))

(declare-fun m!295051 () Bool)

(assert (=> b!280640 m!295051))

(assert (=> b!280640 m!295051))

(declare-fun m!295053 () Bool)

(assert (=> b!280640 m!295053))

(declare-fun m!295055 () Bool)

(assert (=> b!280636 m!295055))

(declare-fun m!295057 () Bool)

(assert (=> b!280637 m!295057))

(declare-fun m!295059 () Bool)

(assert (=> b!280642 m!295059))

(declare-fun m!295061 () Bool)

(assert (=> b!280641 m!295061))

(declare-fun m!295063 () Bool)

(assert (=> b!280638 m!295063))

(declare-fun m!295065 () Bool)

(assert (=> b!280638 m!295065))

(declare-fun m!295067 () Bool)

(assert (=> b!280638 m!295067))

(declare-fun m!295069 () Bool)

(assert (=> b!280635 m!295069))

(check-sat (not b!280636) (not b!280635) (not start!27134) (not b!280637) (not b!280640) (not b!280642) (not b!280641) (not b!280638))
(check-sat)
