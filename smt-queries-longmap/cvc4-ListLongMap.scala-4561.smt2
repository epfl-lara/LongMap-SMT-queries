; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63652 () Bool)

(assert start!63652)

(declare-fun b!716783 () Bool)

(declare-fun res!479567 () Bool)

(declare-fun e!402503 () Bool)

(assert (=> b!716783 (=> (not res!479567) (not e!402503))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716783 (= res!479567 (validKeyInArray!0 k!2102))))

(declare-fun b!716782 () Bool)

(declare-fun res!479568 () Bool)

(assert (=> b!716782 (=> (not res!479568) (not e!402503))))

(declare-datatypes ((array!40562 0))(
  ( (array!40563 (arr!19415 (Array (_ BitVec 32) (_ BitVec 64))) (size!19836 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40562)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!716782 (= res!479568 (validKeyInArray!0 (select (arr!19415 a!3186) j!159)))))

(declare-fun b!716784 () Bool)

(assert (=> b!716784 (= e!402503 (bvsge #b00000000000000000000000000000000 (size!19836 a!3186)))))

(declare-fun b!716781 () Bool)

(declare-fun res!479570 () Bool)

(assert (=> b!716781 (=> (not res!479570) (not e!402503))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!716781 (= res!479570 (and (= (size!19836 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19836 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19836 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!479569 () Bool)

(assert (=> start!63652 (=> (not res!479569) (not e!402503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63652 (= res!479569 (validMask!0 mask!3328))))

(assert (=> start!63652 e!402503))

(declare-fun array_inv!15211 (array!40562) Bool)

(assert (=> start!63652 (array_inv!15211 a!3186)))

(assert (=> start!63652 true))

(assert (= (and start!63652 res!479569) b!716781))

(assert (= (and b!716781 res!479570) b!716782))

(assert (= (and b!716782 res!479568) b!716783))

(assert (= (and b!716783 res!479567) b!716784))

(declare-fun m!672783 () Bool)

(assert (=> b!716783 m!672783))

(declare-fun m!672785 () Bool)

(assert (=> b!716782 m!672785))

(assert (=> b!716782 m!672785))

(declare-fun m!672787 () Bool)

(assert (=> b!716782 m!672787))

(declare-fun m!672789 () Bool)

(assert (=> start!63652 m!672789))

(declare-fun m!672791 () Bool)

(assert (=> start!63652 m!672791))

(push 1)

(assert (not start!63652))

(assert (not b!716782))

(assert (not b!716783))

(check-sat)

(pop 1)

(push 1)

(check-sat)

