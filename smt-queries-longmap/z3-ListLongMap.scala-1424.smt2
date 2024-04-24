; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27570 () Bool)

(assert start!27570)

(declare-fun b!284891 () Bool)

(declare-fun e!180658 () Bool)

(declare-fun e!180657 () Bool)

(assert (=> b!284891 (= e!180658 e!180657)))

(declare-fun res!147375 () Bool)

(assert (=> b!284891 (=> (not res!147375) (not e!180657))))

(declare-datatypes ((SeekEntryResult!1871 0))(
  ( (MissingZero!1871 (index!9654 (_ BitVec 32))) (Found!1871 (index!9655 (_ BitVec 32))) (Intermediate!1871 (undefined!2683 Bool) (index!9656 (_ BitVec 32)) (x!27966 (_ BitVec 32))) (Undefined!1871) (MissingVacant!1871 (index!9657 (_ BitVec 32))) )
))
(declare-fun lt!140697 () SeekEntryResult!1871)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284891 (= res!147375 (or (= lt!140697 (MissingZero!1871 i!1267)) (= lt!140697 (MissingVacant!1871 i!1267))))))

(declare-datatypes ((array!14219 0))(
  ( (array!14220 (arr!6748 (Array (_ BitVec 32) (_ BitVec 64))) (size!7100 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14219)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14219 (_ BitVec 32)) SeekEntryResult!1871)

(assert (=> b!284891 (= lt!140697 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!284892 () Bool)

(declare-fun res!147376 () Bool)

(assert (=> b!284892 (=> (not res!147376) (not e!180658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284892 (= res!147376 (validKeyInArray!0 k0!2581))))

(declare-fun b!284893 () Bool)

(assert (=> b!284893 (= e!180657 false)))

(declare-fun lt!140696 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14219 (_ BitVec 32)) Bool)

(assert (=> b!284893 (= lt!140696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!147377 () Bool)

(assert (=> start!27570 (=> (not res!147377) (not e!180658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27570 (= res!147377 (validMask!0 mask!3868))))

(assert (=> start!27570 e!180658))

(declare-fun array_inv!4698 (array!14219) Bool)

(assert (=> start!27570 (array_inv!4698 a!3325)))

(assert (=> start!27570 true))

(declare-fun b!284894 () Bool)

(declare-fun res!147373 () Bool)

(assert (=> b!284894 (=> (not res!147373) (not e!180658))))

(declare-datatypes ((List!4469 0))(
  ( (Nil!4466) (Cons!4465 (h!5138 (_ BitVec 64)) (t!9543 List!4469)) )
))
(declare-fun arrayNoDuplicates!0 (array!14219 (_ BitVec 32) List!4469) Bool)

(assert (=> b!284894 (= res!147373 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4466))))

(declare-fun b!284895 () Bool)

(declare-fun res!147374 () Bool)

(assert (=> b!284895 (=> (not res!147374) (not e!180658))))

(declare-fun arrayContainsKey!0 (array!14219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284895 (= res!147374 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284896 () Bool)

(declare-fun res!147378 () Bool)

(assert (=> b!284896 (=> (not res!147378) (not e!180658))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284896 (= res!147378 (and (= (size!7100 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7100 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7100 a!3325))))))

(assert (= (and start!27570 res!147377) b!284896))

(assert (= (and b!284896 res!147378) b!284892))

(assert (= (and b!284892 res!147376) b!284894))

(assert (= (and b!284894 res!147373) b!284895))

(assert (= (and b!284895 res!147374) b!284891))

(assert (= (and b!284891 res!147375) b!284893))

(declare-fun m!299975 () Bool)

(assert (=> b!284894 m!299975))

(declare-fun m!299977 () Bool)

(assert (=> b!284893 m!299977))

(declare-fun m!299979 () Bool)

(assert (=> b!284895 m!299979))

(declare-fun m!299981 () Bool)

(assert (=> b!284891 m!299981))

(declare-fun m!299983 () Bool)

(assert (=> start!27570 m!299983))

(declare-fun m!299985 () Bool)

(assert (=> start!27570 m!299985))

(declare-fun m!299987 () Bool)

(assert (=> b!284892 m!299987))

(check-sat (not b!284894) (not b!284892) (not b!284895) (not start!27570) (not b!284893) (not b!284891))
(check-sat)
