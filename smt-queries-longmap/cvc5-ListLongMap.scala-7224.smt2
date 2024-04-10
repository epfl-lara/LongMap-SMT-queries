; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92406 () Bool)

(assert start!92406)

(declare-fun res!699764 () Bool)

(declare-fun e!596237 () Bool)

(assert (=> start!92406 (=> (not res!699764) (not e!596237))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66207 0))(
  ( (array!66208 (arr!31843 (Array (_ BitVec 32) (_ BitVec 64))) (size!32379 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66207)

(assert (=> start!92406 (= res!699764 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32379 a!3488)) (bvslt (size!32379 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92406 e!596237))

(assert (=> start!92406 true))

(declare-fun array_inv!24623 (array!66207) Bool)

(assert (=> start!92406 (array_inv!24623 a!3488)))

(declare-fun b!1050633 () Bool)

(declare-fun e!596239 () Bool)

(assert (=> b!1050633 (= e!596237 e!596239)))

(declare-fun res!699762 () Bool)

(assert (=> b!1050633 (=> (not res!699762) (not e!596239))))

(declare-fun lt!464033 () array!66207)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050633 (= res!699762 (arrayContainsKey!0 lt!464033 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050633 (= lt!464033 (array!66208 (store (arr!31843 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32379 a!3488)))))

(declare-fun b!1050634 () Bool)

(declare-fun e!596238 () Bool)

(assert (=> b!1050634 (= e!596238 (not true))))

(declare-fun lt!464034 () (_ BitVec 32))

(assert (=> b!1050634 (= (select (store (arr!31843 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464034) k!2747)))

(declare-fun b!1050635 () Bool)

(declare-fun res!699763 () Bool)

(assert (=> b!1050635 (=> (not res!699763) (not e!596237))))

(declare-datatypes ((List!22155 0))(
  ( (Nil!22152) (Cons!22151 (h!23360 (_ BitVec 64)) (t!31462 List!22155)) )
))
(declare-fun arrayNoDuplicates!0 (array!66207 (_ BitVec 32) List!22155) Bool)

(assert (=> b!1050635 (= res!699763 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22152))))

(declare-fun b!1050636 () Bool)

(declare-fun res!699759 () Bool)

(assert (=> b!1050636 (=> (not res!699759) (not e!596237))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050636 (= res!699759 (validKeyInArray!0 k!2747))))

(declare-fun b!1050637 () Bool)

(declare-fun res!699761 () Bool)

(assert (=> b!1050637 (=> (not res!699761) (not e!596237))))

(assert (=> b!1050637 (= res!699761 (= (select (arr!31843 a!3488) i!1381) k!2747))))

(declare-fun b!1050638 () Bool)

(assert (=> b!1050638 (= e!596239 e!596238)))

(declare-fun res!699760 () Bool)

(assert (=> b!1050638 (=> (not res!699760) (not e!596238))))

(assert (=> b!1050638 (= res!699760 (not (= lt!464034 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66207 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050638 (= lt!464034 (arrayScanForKey!0 lt!464033 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92406 res!699764) b!1050635))

(assert (= (and b!1050635 res!699763) b!1050636))

(assert (= (and b!1050636 res!699759) b!1050637))

(assert (= (and b!1050637 res!699761) b!1050633))

(assert (= (and b!1050633 res!699762) b!1050638))

(assert (= (and b!1050638 res!699760) b!1050634))

(declare-fun m!971309 () Bool)

(assert (=> start!92406 m!971309))

(declare-fun m!971311 () Bool)

(assert (=> b!1050636 m!971311))

(declare-fun m!971313 () Bool)

(assert (=> b!1050633 m!971313))

(declare-fun m!971315 () Bool)

(assert (=> b!1050633 m!971315))

(declare-fun m!971317 () Bool)

(assert (=> b!1050635 m!971317))

(assert (=> b!1050634 m!971315))

(declare-fun m!971319 () Bool)

(assert (=> b!1050634 m!971319))

(declare-fun m!971321 () Bool)

(assert (=> b!1050638 m!971321))

(declare-fun m!971323 () Bool)

(assert (=> b!1050637 m!971323))

(push 1)

