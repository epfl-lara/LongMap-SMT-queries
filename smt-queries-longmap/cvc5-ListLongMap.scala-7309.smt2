; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93456 () Bool)

(assert start!93456)

(declare-fun b!1058598 () Bool)

(declare-fun res!707173 () Bool)

(declare-fun e!602272 () Bool)

(assert (=> b!1058598 (=> (not res!707173) (not e!602272))))

(declare-datatypes ((array!66759 0))(
  ( (array!66760 (arr!32098 (Array (_ BitVec 32) (_ BitVec 64))) (size!32634 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66759)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058598 (= res!707173 (= (select (arr!32098 a!3488) i!1381) k!2747))))

(declare-fun res!707175 () Bool)

(assert (=> start!93456 (=> (not res!707175) (not e!602272))))

(assert (=> start!93456 (= res!707175 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32634 a!3488)) (bvslt (size!32634 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93456 e!602272))

(assert (=> start!93456 true))

(declare-fun array_inv!24878 (array!66759) Bool)

(assert (=> start!93456 (array_inv!24878 a!3488)))

(declare-fun b!1058599 () Bool)

(declare-fun e!602271 () Bool)

(assert (=> b!1058599 (= e!602271 (not true))))

(declare-fun lt!466992 () (_ BitVec 32))

(assert (=> b!1058599 (= (select (store (arr!32098 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466992) k!2747)))

(declare-fun b!1058600 () Bool)

(declare-fun e!602269 () Bool)

(assert (=> b!1058600 (= e!602272 e!602269)))

(declare-fun res!707174 () Bool)

(assert (=> b!1058600 (=> (not res!707174) (not e!602269))))

(declare-fun lt!466991 () array!66759)

(declare-fun arrayContainsKey!0 (array!66759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058600 (= res!707174 (arrayContainsKey!0 lt!466991 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058600 (= lt!466991 (array!66760 (store (arr!32098 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32634 a!3488)))))

(declare-fun b!1058601 () Bool)

(declare-fun res!707177 () Bool)

(assert (=> b!1058601 (=> (not res!707177) (not e!602272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058601 (= res!707177 (validKeyInArray!0 k!2747))))

(declare-fun b!1058602 () Bool)

(declare-fun res!707176 () Bool)

(assert (=> b!1058602 (=> (not res!707176) (not e!602272))))

(declare-datatypes ((List!22410 0))(
  ( (Nil!22407) (Cons!22406 (h!23615 (_ BitVec 64)) (t!31717 List!22410)) )
))
(declare-fun arrayNoDuplicates!0 (array!66759 (_ BitVec 32) List!22410) Bool)

(assert (=> b!1058602 (= res!707176 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22407))))

(declare-fun b!1058603 () Bool)

(assert (=> b!1058603 (= e!602269 e!602271)))

(declare-fun res!707172 () Bool)

(assert (=> b!1058603 (=> (not res!707172) (not e!602271))))

(assert (=> b!1058603 (= res!707172 (not (= lt!466992 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66759 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058603 (= lt!466992 (arrayScanForKey!0 lt!466991 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93456 res!707175) b!1058602))

(assert (= (and b!1058602 res!707176) b!1058601))

(assert (= (and b!1058601 res!707177) b!1058598))

(assert (= (and b!1058598 res!707173) b!1058600))

(assert (= (and b!1058600 res!707174) b!1058603))

(assert (= (and b!1058603 res!707172) b!1058599))

(declare-fun m!978257 () Bool)

(assert (=> start!93456 m!978257))

(declare-fun m!978259 () Bool)

(assert (=> b!1058603 m!978259))

(declare-fun m!978261 () Bool)

(assert (=> b!1058599 m!978261))

(declare-fun m!978263 () Bool)

(assert (=> b!1058599 m!978263))

(declare-fun m!978265 () Bool)

(assert (=> b!1058598 m!978265))

(declare-fun m!978267 () Bool)

(assert (=> b!1058600 m!978267))

(assert (=> b!1058600 m!978261))

(declare-fun m!978269 () Bool)

(assert (=> b!1058601 m!978269))

(declare-fun m!978271 () Bool)

(assert (=> b!1058602 m!978271))

(push 1)

