; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103896 () Bool)

(assert start!103896)

(declare-fun b!1243522 () Bool)

(declare-fun res!829309 () Bool)

(declare-fun e!704956 () Bool)

(assert (=> b!1243522 (=> (not res!829309) (not e!704956))))

(declare-datatypes ((List!27390 0))(
  ( (Nil!27387) (Cons!27386 (h!28595 (_ BitVec 64)) (t!40859 List!27390)) )
))
(declare-fun lt!562412 () List!27390)

(declare-fun noDuplicate!1989 (List!27390) Bool)

(assert (=> b!1243522 (= res!829309 (noDuplicate!1989 lt!562412))))

(declare-fun b!1243523 () Bool)

(declare-fun res!829307 () Bool)

(declare-fun e!704957 () Bool)

(assert (=> b!1243523 (=> (not res!829307) (not e!704957))))

(declare-datatypes ((array!79988 0))(
  ( (array!79989 (arr!38587 (Array (_ BitVec 32) (_ BitVec 64))) (size!39123 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79988)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1243523 (= res!829307 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39123 a!3892)) (not (= newFrom!287 (size!39123 a!3892)))))))

(declare-fun b!1243524 () Bool)

(assert (=> b!1243524 (= e!704957 e!704956)))

(declare-fun res!829303 () Bool)

(assert (=> b!1243524 (=> (not res!829303) (not e!704956))))

(assert (=> b!1243524 (= res!829303 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1243524 (= lt!562412 (Cons!27386 (select (arr!38587 a!3892) from!3270) Nil!27387))))

(declare-fun b!1243525 () Bool)

(assert (=> b!1243525 (= e!704956 false)))

(declare-fun lt!562411 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79988 (_ BitVec 32) List!27390) Bool)

(assert (=> b!1243525 (= lt!562411 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562412))))

(declare-datatypes ((Unit!41283 0))(
  ( (Unit!41284) )
))
(declare-fun lt!562410 () Unit!41283)

(declare-fun noDuplicateSubseq!91 (List!27390 List!27390) Unit!41283)

(assert (=> b!1243525 (= lt!562410 (noDuplicateSubseq!91 Nil!27387 lt!562412))))

(declare-fun res!829306 () Bool)

(assert (=> start!103896 (=> (not res!829306) (not e!704957))))

(assert (=> start!103896 (= res!829306 (and (bvslt (size!39123 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39123 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39123 a!3892))))))

(assert (=> start!103896 e!704957))

(declare-fun array_inv!29435 (array!79988) Bool)

(assert (=> start!103896 (array_inv!29435 a!3892)))

(assert (=> start!103896 true))

(declare-fun b!1243526 () Bool)

(declare-fun res!829301 () Bool)

(assert (=> b!1243526 (=> (not res!829301) (not e!704957))))

(assert (=> b!1243526 (= res!829301 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27387))))

(declare-fun b!1243527 () Bool)

(declare-fun res!829299 () Bool)

(assert (=> b!1243527 (=> (not res!829299) (not e!704956))))

(declare-fun contains!7411 (List!27390 (_ BitVec 64)) Bool)

(assert (=> b!1243527 (= res!829299 (not (contains!7411 lt!562412 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243528 () Bool)

(declare-fun res!829305 () Bool)

(assert (=> b!1243528 (=> (not res!829305) (not e!704956))))

(assert (=> b!1243528 (= res!829305 (not (contains!7411 Nil!27387 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243529 () Bool)

(declare-fun res!829300 () Bool)

(assert (=> b!1243529 (=> (not res!829300) (not e!704957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243529 (= res!829300 (validKeyInArray!0 (select (arr!38587 a!3892) from!3270)))))

(declare-fun b!1243530 () Bool)

(declare-fun res!829302 () Bool)

(assert (=> b!1243530 (=> (not res!829302) (not e!704956))))

(declare-fun subseq!637 (List!27390 List!27390) Bool)

(assert (=> b!1243530 (= res!829302 (subseq!637 Nil!27387 lt!562412))))

(declare-fun b!1243531 () Bool)

(declare-fun res!829304 () Bool)

(assert (=> b!1243531 (=> (not res!829304) (not e!704956))))

(assert (=> b!1243531 (= res!829304 (not (contains!7411 Nil!27387 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243532 () Bool)

(declare-fun res!829308 () Bool)

(assert (=> b!1243532 (=> (not res!829308) (not e!704956))))

(assert (=> b!1243532 (= res!829308 (not (contains!7411 lt!562412 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103896 res!829306) b!1243526))

(assert (= (and b!1243526 res!829301) b!1243523))

(assert (= (and b!1243523 res!829307) b!1243529))

(assert (= (and b!1243529 res!829300) b!1243524))

(assert (= (and b!1243524 res!829303) b!1243522))

(assert (= (and b!1243522 res!829309) b!1243527))

(assert (= (and b!1243527 res!829299) b!1243532))

(assert (= (and b!1243532 res!829308) b!1243531))

(assert (= (and b!1243531 res!829304) b!1243528))

(assert (= (and b!1243528 res!829305) b!1243530))

(assert (= (and b!1243530 res!829302) b!1243525))

(declare-fun m!1146059 () Bool)

(assert (=> b!1243530 m!1146059))

(declare-fun m!1146061 () Bool)

(assert (=> b!1243532 m!1146061))

(declare-fun m!1146063 () Bool)

(assert (=> b!1243527 m!1146063))

(declare-fun m!1146065 () Bool)

(assert (=> b!1243525 m!1146065))

(declare-fun m!1146067 () Bool)

(assert (=> b!1243525 m!1146067))

(declare-fun m!1146069 () Bool)

(assert (=> b!1243531 m!1146069))

(declare-fun m!1146071 () Bool)

(assert (=> b!1243528 m!1146071))

(declare-fun m!1146073 () Bool)

(assert (=> b!1243529 m!1146073))

(assert (=> b!1243529 m!1146073))

(declare-fun m!1146075 () Bool)

(assert (=> b!1243529 m!1146075))

(assert (=> b!1243524 m!1146073))

(declare-fun m!1146077 () Bool)

(assert (=> start!103896 m!1146077))

(declare-fun m!1146079 () Bool)

(assert (=> b!1243526 m!1146079))

(declare-fun m!1146081 () Bool)

(assert (=> b!1243522 m!1146081))

(push 1)

(assert (not b!1243528))

(assert (not b!1243522))

(assert (not b!1243527))

(assert (not start!103896))

(assert (not b!1243529))

(assert (not b!1243532))

(assert (not b!1243531))

(assert (not b!1243525))

(assert (not b!1243530))

(assert (not b!1243526))

(check-sat)

(pop 1)

(push 1)

