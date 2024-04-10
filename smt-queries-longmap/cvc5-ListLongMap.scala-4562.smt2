; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63654 () Bool)

(assert start!63654)

(declare-fun b!716796 () Bool)

(declare-fun e!402509 () Bool)

(declare-datatypes ((array!40564 0))(
  ( (array!40565 (arr!19416 (Array (_ BitVec 32) (_ BitVec 64))) (size!19837 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40564)

(assert (=> b!716796 (= e!402509 (and (bvslt #b00000000000000000000000000000000 (size!19837 a!3186)) (bvsge (size!19837 a!3186) #b01111111111111111111111111111111)))))

(declare-fun b!716793 () Bool)

(declare-fun res!479579 () Bool)

(assert (=> b!716793 (=> (not res!479579) (not e!402509))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!716793 (= res!479579 (and (= (size!19837 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19837 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19837 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716794 () Bool)

(declare-fun res!479582 () Bool)

(assert (=> b!716794 (=> (not res!479582) (not e!402509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716794 (= res!479582 (validKeyInArray!0 (select (arr!19416 a!3186) j!159)))))

(declare-fun b!716795 () Bool)

(declare-fun res!479580 () Bool)

(assert (=> b!716795 (=> (not res!479580) (not e!402509))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!716795 (= res!479580 (validKeyInArray!0 k!2102))))

(declare-fun res!479581 () Bool)

(assert (=> start!63654 (=> (not res!479581) (not e!402509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63654 (= res!479581 (validMask!0 mask!3328))))

(assert (=> start!63654 e!402509))

(declare-fun array_inv!15212 (array!40564) Bool)

(assert (=> start!63654 (array_inv!15212 a!3186)))

(assert (=> start!63654 true))

(assert (= (and start!63654 res!479581) b!716793))

(assert (= (and b!716793 res!479579) b!716794))

(assert (= (and b!716794 res!479582) b!716795))

(assert (= (and b!716795 res!479580) b!716796))

(declare-fun m!672793 () Bool)

(assert (=> b!716794 m!672793))

(assert (=> b!716794 m!672793))

(declare-fun m!672795 () Bool)

(assert (=> b!716794 m!672795))

(declare-fun m!672797 () Bool)

(assert (=> b!716795 m!672797))

(declare-fun m!672799 () Bool)

(assert (=> start!63654 m!672799))

(declare-fun m!672801 () Bool)

(assert (=> start!63654 m!672801))

(push 1)

(assert (not b!716794))

(assert (not b!716795))

(assert (not start!63654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

