; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63676 () Bool)

(assert start!63676)

(declare-fun b!716831 () Bool)

(declare-fun res!479618 () Bool)

(declare-fun e!402526 () Bool)

(assert (=> b!716831 (=> (not res!479618) (not e!402526))))

(declare-datatypes ((array!40572 0))(
  ( (array!40573 (arr!19419 (Array (_ BitVec 32) (_ BitVec 64))) (size!19840 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40572)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!716831 (= res!479618 (and (= (size!19840 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19840 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19840 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716832 () Bool)

(declare-fun res!479617 () Bool)

(assert (=> b!716832 (=> (not res!479617) (not e!402526))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40572 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716832 (= res!479617 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!716833 () Bool)

(declare-fun res!479619 () Bool)

(assert (=> b!716833 (=> (not res!479619) (not e!402526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716833 (= res!479619 (validKeyInArray!0 (select (arr!19419 a!3186) j!159)))))

(declare-fun b!716834 () Bool)

(declare-fun res!479621 () Bool)

(assert (=> b!716834 (=> (not res!479621) (not e!402526))))

(assert (=> b!716834 (= res!479621 (validKeyInArray!0 k!2102))))

(declare-fun res!479620 () Bool)

(assert (=> start!63676 (=> (not res!479620) (not e!402526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63676 (= res!479620 (validMask!0 mask!3328))))

(assert (=> start!63676 e!402526))

(declare-fun array_inv!15215 (array!40572) Bool)

(assert (=> start!63676 (array_inv!15215 a!3186)))

(assert (=> start!63676 true))

(declare-fun b!716835 () Bool)

(assert (=> b!716835 (= e!402526 (bvslt mask!3328 #b00000000000000000000000000000000))))

(assert (= (and start!63676 res!479620) b!716831))

(assert (= (and b!716831 res!479618) b!716833))

(assert (= (and b!716833 res!479619) b!716834))

(assert (= (and b!716834 res!479621) b!716832))

(assert (= (and b!716832 res!479617) b!716835))

(declare-fun m!672823 () Bool)

(assert (=> b!716832 m!672823))

(declare-fun m!672825 () Bool)

(assert (=> b!716833 m!672825))

(assert (=> b!716833 m!672825))

(declare-fun m!672827 () Bool)

(assert (=> b!716833 m!672827))

(declare-fun m!672829 () Bool)

(assert (=> b!716834 m!672829))

(declare-fun m!672831 () Bool)

(assert (=> start!63676 m!672831))

(declare-fun m!672833 () Bool)

(assert (=> start!63676 m!672833))

(push 1)

(assert (not b!716833))

(assert (not b!716834))

(assert (not start!63676))

(assert (not b!716832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

