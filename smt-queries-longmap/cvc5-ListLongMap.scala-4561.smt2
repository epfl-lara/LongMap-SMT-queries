; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63648 () Bool)

(assert start!63648)

(declare-fun res!479545 () Bool)

(declare-fun e!402490 () Bool)

(assert (=> start!63648 (=> (not res!479545) (not e!402490))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63648 (= res!479545 (validMask!0 mask!3328))))

(assert (=> start!63648 e!402490))

(declare-datatypes ((array!40558 0))(
  ( (array!40559 (arr!19413 (Array (_ BitVec 32) (_ BitVec 64))) (size!19834 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40558)

(declare-fun array_inv!15209 (array!40558) Bool)

(assert (=> start!63648 (array_inv!15209 a!3186)))

(assert (=> start!63648 true))

(declare-fun b!716760 () Bool)

(assert (=> b!716760 (= e!402490 (bvsge #b00000000000000000000000000000000 (size!19834 a!3186)))))

(declare-fun b!716757 () Bool)

(declare-fun res!479544 () Bool)

(assert (=> b!716757 (=> (not res!479544) (not e!402490))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!716757 (= res!479544 (and (= (size!19834 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19834 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19834 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716758 () Bool)

(declare-fun res!479546 () Bool)

(assert (=> b!716758 (=> (not res!479546) (not e!402490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716758 (= res!479546 (validKeyInArray!0 (select (arr!19413 a!3186) j!159)))))

(declare-fun b!716759 () Bool)

(declare-fun res!479543 () Bool)

(assert (=> b!716759 (=> (not res!479543) (not e!402490))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!716759 (= res!479543 (validKeyInArray!0 k!2102))))

(assert (= (and start!63648 res!479545) b!716757))

(assert (= (and b!716757 res!479544) b!716758))

(assert (= (and b!716758 res!479546) b!716759))

(assert (= (and b!716759 res!479543) b!716760))

(declare-fun m!672763 () Bool)

(assert (=> start!63648 m!672763))

(declare-fun m!672765 () Bool)

(assert (=> start!63648 m!672765))

(declare-fun m!672767 () Bool)

(assert (=> b!716758 m!672767))

(assert (=> b!716758 m!672767))

(declare-fun m!672769 () Bool)

(assert (=> b!716758 m!672769))

(declare-fun m!672771 () Bool)

(assert (=> b!716759 m!672771))

(push 1)

(assert (not start!63648))

(assert (not b!716758))

(assert (not b!716759))

(check-sat)

(pop 1)

(push 1)

(check-sat)

