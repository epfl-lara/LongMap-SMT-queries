; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118218 () Bool)

(assert start!118218)

(declare-fun b!1383000 () Bool)

(declare-fun e!783885 () Bool)

(assert (=> b!1383000 (= e!783885 false)))

(declare-fun lt!608339 () Bool)

(declare-datatypes ((array!94474 0))(
  ( (array!94475 (arr!45615 (Array (_ BitVec 32) (_ BitVec 64))) (size!46167 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94474)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94474 (_ BitVec 32)) Bool)

(assert (=> b!1383000 (= lt!608339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1382999 () Bool)

(declare-fun res!924635 () Bool)

(assert (=> b!1382999 (=> (not res!924635) (not e!783885))))

(declare-datatypes ((List!32221 0))(
  ( (Nil!32218) (Cons!32217 (h!33426 (_ BitVec 64)) (t!46907 List!32221)) )
))
(declare-fun arrayNoDuplicates!0 (array!94474 (_ BitVec 32) List!32221) Bool)

(assert (=> b!1382999 (= res!924635 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32218))))

(declare-fun b!1382998 () Bool)

(declare-fun res!924634 () Bool)

(assert (=> b!1382998 (=> (not res!924634) (not e!783885))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382998 (= res!924634 (validKeyInArray!0 (select (arr!45615 a!2938) i!1065)))))

(declare-fun b!1382997 () Bool)

(declare-fun res!924632 () Bool)

(assert (=> b!1382997 (=> (not res!924632) (not e!783885))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382997 (= res!924632 (and (= (size!46167 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46167 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46167 a!2938))))))

(declare-fun res!924633 () Bool)

(assert (=> start!118218 (=> (not res!924633) (not e!783885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118218 (= res!924633 (validMask!0 mask!2987))))

(assert (=> start!118218 e!783885))

(assert (=> start!118218 true))

(declare-fun array_inv!34848 (array!94474) Bool)

(assert (=> start!118218 (array_inv!34848 a!2938)))

(assert (= (and start!118218 res!924633) b!1382997))

(assert (= (and b!1382997 res!924632) b!1382998))

(assert (= (and b!1382998 res!924634) b!1382999))

(assert (= (and b!1382999 res!924635) b!1383000))

(declare-fun m!1267665 () Bool)

(assert (=> b!1383000 m!1267665))

(declare-fun m!1267667 () Bool)

(assert (=> b!1382999 m!1267667))

(declare-fun m!1267669 () Bool)

(assert (=> b!1382998 m!1267669))

(assert (=> b!1382998 m!1267669))

(declare-fun m!1267671 () Bool)

(assert (=> b!1382998 m!1267671))

(declare-fun m!1267673 () Bool)

(assert (=> start!118218 m!1267673))

(declare-fun m!1267675 () Bool)

(assert (=> start!118218 m!1267675))

(push 1)

(assert (not b!1383000))

(assert (not b!1382998))

(assert (not start!118218))

(assert (not b!1382999))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

