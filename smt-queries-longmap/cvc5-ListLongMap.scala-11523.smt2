; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134174 () Bool)

(assert start!134174)

(declare-datatypes ((array!104706 0))(
  ( (array!104707 (arr!50536 (Array (_ BitVec 32) (_ BitVec 64))) (size!51086 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104706)

(declare-datatypes ((List!36668 0))(
  ( (Nil!36665) (Cons!36664 (h!38111 (_ BitVec 64)) (t!51576 List!36668)) )
))
(declare-fun acc!619 () List!36668)

(declare-fun e!873863 () Bool)

(declare-fun b!1567632 () Bool)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun contains!10370 (List!36668 (_ BitVec 64)) Bool)

(assert (=> b!1567632 (= e!873863 (not (contains!10370 acc!619 (select (arr!50536 a!3481) from!2856))))))

(declare-fun b!1567633 () Bool)

(declare-fun res!1071320 () Bool)

(declare-fun e!873864 () Bool)

(assert (=> b!1567633 (=> (not res!1071320) (not e!873864))))

(assert (=> b!1567633 (= res!1071320 (bvslt from!2856 (size!51086 a!3481)))))

(declare-fun b!1567634 () Bool)

(declare-fun res!1071321 () Bool)

(assert (=> b!1567634 (=> (not res!1071321) (not e!873864))))

(declare-fun noDuplicate!2642 (List!36668) Bool)

(assert (=> b!1567634 (= res!1071321 (noDuplicate!2642 acc!619))))

(declare-fun b!1567635 () Bool)

(declare-fun e!873866 () Bool)

(declare-fun lt!673024 () Bool)

(assert (=> b!1567635 (= e!873866 (and (not lt!673024) (bvslt (bvadd #b00000000000000000000000000000001 from!2856) #b00000000000000000000000000000000)))))

(declare-fun res!1071324 () Bool)

(assert (=> start!134174 (=> (not res!1071324) (not e!873864))))

(assert (=> start!134174 (= res!1071324 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51086 a!3481)) (bvslt (size!51086 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134174 e!873864))

(assert (=> start!134174 true))

(declare-fun array_inv!39263 (array!104706) Bool)

(assert (=> start!134174 (array_inv!39263 a!3481)))

(declare-fun b!1567636 () Bool)

(assert (=> b!1567636 (= e!873864 e!873866)))

(declare-fun res!1071319 () Bool)

(assert (=> b!1567636 (=> (not res!1071319) (not e!873866))))

(assert (=> b!1567636 (= res!1071319 e!873863)))

(declare-fun res!1071322 () Bool)

(assert (=> b!1567636 (=> res!1071322 e!873863)))

(assert (=> b!1567636 (= res!1071322 lt!673024)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567636 (= lt!673024 (not (validKeyInArray!0 (select (arr!50536 a!3481) from!2856))))))

(declare-fun b!1567637 () Bool)

(declare-fun res!1071323 () Bool)

(assert (=> b!1567637 (=> (not res!1071323) (not e!873864))))

(assert (=> b!1567637 (= res!1071323 (not (contains!10370 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1567638 () Bool)

(declare-fun res!1071318 () Bool)

(assert (=> b!1567638 (=> (not res!1071318) (not e!873864))))

(assert (=> b!1567638 (= res!1071318 (not (contains!10370 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!134174 res!1071324) b!1567634))

(assert (= (and b!1567634 res!1071321) b!1567637))

(assert (= (and b!1567637 res!1071323) b!1567638))

(assert (= (and b!1567638 res!1071318) b!1567633))

(assert (= (and b!1567633 res!1071320) b!1567636))

(assert (= (and b!1567636 (not res!1071322)) b!1567632))

(assert (= (and b!1567636 res!1071319) b!1567635))

(declare-fun m!1442437 () Bool)

(assert (=> b!1567634 m!1442437))

(declare-fun m!1442439 () Bool)

(assert (=> b!1567632 m!1442439))

(assert (=> b!1567632 m!1442439))

(declare-fun m!1442441 () Bool)

(assert (=> b!1567632 m!1442441))

(assert (=> b!1567636 m!1442439))

(assert (=> b!1567636 m!1442439))

(declare-fun m!1442443 () Bool)

(assert (=> b!1567636 m!1442443))

(declare-fun m!1442445 () Bool)

(assert (=> b!1567638 m!1442445))

(declare-fun m!1442447 () Bool)

(assert (=> b!1567637 m!1442447))

(declare-fun m!1442449 () Bool)

(assert (=> start!134174 m!1442449))

(push 1)

