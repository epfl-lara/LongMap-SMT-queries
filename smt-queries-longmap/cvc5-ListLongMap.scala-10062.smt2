; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118722 () Bool)

(assert start!118722)

(declare-fun res!927418 () Bool)

(declare-fun e!785944 () Bool)

(assert (=> start!118722 (=> (not res!927418) (not e!785944))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118722 (= res!927418 (validMask!0 mask!2987))))

(assert (=> start!118722 e!785944))

(assert (=> start!118722 true))

(declare-datatypes ((array!94896 0))(
  ( (array!94897 (arr!45822 (Array (_ BitVec 32) (_ BitVec 64))) (size!46373 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94896)

(declare-fun array_inv!35103 (array!94896) Bool)

(assert (=> start!118722 (array_inv!35103 a!2938)))

(declare-fun b!1386959 () Bool)

(declare-fun res!927419 () Bool)

(assert (=> b!1386959 (=> (not res!927419) (not e!785944))))

(declare-datatypes ((List!32337 0))(
  ( (Nil!32334) (Cons!32333 (h!33551 (_ BitVec 64)) (t!47023 List!32337)) )
))
(declare-fun arrayNoDuplicates!0 (array!94896 (_ BitVec 32) List!32337) Bool)

(assert (=> b!1386959 (= res!927419 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32334))))

(declare-fun b!1386958 () Bool)

(declare-fun res!927420 () Bool)

(assert (=> b!1386958 (=> (not res!927420) (not e!785944))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386958 (= res!927420 (validKeyInArray!0 (select (arr!45822 a!2938) i!1065)))))

(declare-fun b!1386960 () Bool)

(assert (=> b!1386960 (= e!785944 false)))

(declare-fun lt!609777 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94896 (_ BitVec 32)) Bool)

(assert (=> b!1386960 (= lt!609777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386957 () Bool)

(declare-fun res!927421 () Bool)

(assert (=> b!1386957 (=> (not res!927421) (not e!785944))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386957 (= res!927421 (and (= (size!46373 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46373 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46373 a!2938))))))

(assert (= (and start!118722 res!927418) b!1386957))

(assert (= (and b!1386957 res!927421) b!1386958))

(assert (= (and b!1386958 res!927420) b!1386959))

(assert (= (and b!1386959 res!927419) b!1386960))

(declare-fun m!1272573 () Bool)

(assert (=> start!118722 m!1272573))

(declare-fun m!1272575 () Bool)

(assert (=> start!118722 m!1272575))

(declare-fun m!1272577 () Bool)

(assert (=> b!1386959 m!1272577))

(declare-fun m!1272579 () Bool)

(assert (=> b!1386958 m!1272579))

(assert (=> b!1386958 m!1272579))

(declare-fun m!1272581 () Bool)

(assert (=> b!1386958 m!1272581))

(declare-fun m!1272583 () Bool)

(assert (=> b!1386960 m!1272583))

(push 1)

(assert (not b!1386958))

(assert (not b!1386960))

(assert (not start!118722))

(assert (not b!1386959))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

