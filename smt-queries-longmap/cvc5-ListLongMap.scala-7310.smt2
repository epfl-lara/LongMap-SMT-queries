; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93462 () Bool)

(assert start!93462)

(declare-fun b!1058652 () Bool)

(declare-fun res!707230 () Bool)

(declare-fun e!602308 () Bool)

(assert (=> b!1058652 (=> (not res!707230) (not e!602308))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058652 (= res!707230 (validKeyInArray!0 k!2747))))

(declare-fun b!1058653 () Bool)

(declare-fun e!602307 () Bool)

(declare-fun lt!467010 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058653 (= e!602307 (not (or (bvsgt lt!467010 i!1381) (bvsgt i!1381 lt!467010))))))

(declare-datatypes ((array!66765 0))(
  ( (array!66766 (arr!32101 (Array (_ BitVec 32) (_ BitVec 64))) (size!32637 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66765)

(assert (=> b!1058653 (= (select (store (arr!32101 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467010) k!2747)))

(declare-fun b!1058654 () Bool)

(declare-fun e!602305 () Bool)

(assert (=> b!1058654 (= e!602308 e!602305)))

(declare-fun res!707226 () Bool)

(assert (=> b!1058654 (=> (not res!707226) (not e!602305))))

(declare-fun lt!467009 () array!66765)

(declare-fun arrayContainsKey!0 (array!66765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058654 (= res!707226 (arrayContainsKey!0 lt!467009 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058654 (= lt!467009 (array!66766 (store (arr!32101 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32637 a!3488)))))

(declare-fun b!1058655 () Bool)

(assert (=> b!1058655 (= e!602305 e!602307)))

(declare-fun res!707231 () Bool)

(assert (=> b!1058655 (=> (not res!707231) (not e!602307))))

(assert (=> b!1058655 (= res!707231 (not (= lt!467010 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66765 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058655 (= lt!467010 (arrayScanForKey!0 lt!467009 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058656 () Bool)

(declare-fun res!707227 () Bool)

(assert (=> b!1058656 (=> (not res!707227) (not e!602308))))

(declare-datatypes ((List!22413 0))(
  ( (Nil!22410) (Cons!22409 (h!23618 (_ BitVec 64)) (t!31720 List!22413)) )
))
(declare-fun arrayNoDuplicates!0 (array!66765 (_ BitVec 32) List!22413) Bool)

(assert (=> b!1058656 (= res!707227 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22410))))

(declare-fun res!707229 () Bool)

(assert (=> start!93462 (=> (not res!707229) (not e!602308))))

(assert (=> start!93462 (= res!707229 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32637 a!3488)) (bvslt (size!32637 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93462 e!602308))

(assert (=> start!93462 true))

(declare-fun array_inv!24881 (array!66765) Bool)

(assert (=> start!93462 (array_inv!24881 a!3488)))

(declare-fun b!1058657 () Bool)

(declare-fun res!707228 () Bool)

(assert (=> b!1058657 (=> (not res!707228) (not e!602308))))

(assert (=> b!1058657 (= res!707228 (= (select (arr!32101 a!3488) i!1381) k!2747))))

(assert (= (and start!93462 res!707229) b!1058656))

(assert (= (and b!1058656 res!707227) b!1058652))

(assert (= (and b!1058652 res!707230) b!1058657))

(assert (= (and b!1058657 res!707228) b!1058654))

(assert (= (and b!1058654 res!707226) b!1058655))

(assert (= (and b!1058655 res!707231) b!1058653))

(declare-fun m!978305 () Bool)

(assert (=> b!1058652 m!978305))

(declare-fun m!978307 () Bool)

(assert (=> start!93462 m!978307))

(declare-fun m!978309 () Bool)

(assert (=> b!1058653 m!978309))

(declare-fun m!978311 () Bool)

(assert (=> b!1058653 m!978311))

(declare-fun m!978313 () Bool)

(assert (=> b!1058654 m!978313))

(assert (=> b!1058654 m!978309))

(declare-fun m!978315 () Bool)

(assert (=> b!1058655 m!978315))

(declare-fun m!978317 () Bool)

(assert (=> b!1058657 m!978317))

(declare-fun m!978319 () Bool)

(assert (=> b!1058656 m!978319))

(push 1)

(assert (not start!93462))

(assert (not b!1058654))

(assert (not b!1058652))

(assert (not b!1058656))

(assert (not b!1058655))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

