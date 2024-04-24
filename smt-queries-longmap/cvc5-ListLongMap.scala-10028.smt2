; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118488 () Bool)

(assert start!118488)

(declare-fun res!925504 () Bool)

(declare-fun e!784926 () Bool)

(assert (=> start!118488 (=> (not res!925504) (not e!784926))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118488 (= res!925504 (validMask!0 mask!2987))))

(assert (=> start!118488 e!784926))

(assert (=> start!118488 true))

(declare-datatypes ((array!94689 0))(
  ( (array!94690 (arr!45720 (Array (_ BitVec 32) (_ BitVec 64))) (size!46271 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94689)

(declare-fun array_inv!35001 (array!94689) Bool)

(assert (=> start!118488 (array_inv!35001 a!2938)))

(declare-fun b!1384701 () Bool)

(assert (=> b!1384701 (= e!784926 false)))

(declare-fun lt!609084 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94689 (_ BitVec 32)) Bool)

(assert (=> b!1384701 (= lt!609084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384699 () Bool)

(declare-fun res!925503 () Bool)

(assert (=> b!1384699 (=> (not res!925503) (not e!784926))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384699 (= res!925503 (validKeyInArray!0 (select (arr!45720 a!2938) i!1065)))))

(declare-fun b!1384698 () Bool)

(declare-fun res!925502 () Bool)

(assert (=> b!1384698 (=> (not res!925502) (not e!784926))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384698 (= res!925502 (and (= (size!46271 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46271 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46271 a!2938))))))

(declare-fun b!1384700 () Bool)

(declare-fun res!925501 () Bool)

(assert (=> b!1384700 (=> (not res!925501) (not e!784926))))

(declare-datatypes ((List!32235 0))(
  ( (Nil!32232) (Cons!32231 (h!33449 (_ BitVec 64)) (t!46921 List!32235)) )
))
(declare-fun arrayNoDuplicates!0 (array!94689 (_ BitVec 32) List!32235) Bool)

(assert (=> b!1384700 (= res!925501 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32232))))

(assert (= (and start!118488 res!925504) b!1384698))

(assert (= (and b!1384698 res!925502) b!1384699))

(assert (= (and b!1384699 res!925503) b!1384700))

(assert (= (and b!1384700 res!925501) b!1384701))

(declare-fun m!1270125 () Bool)

(assert (=> start!118488 m!1270125))

(declare-fun m!1270127 () Bool)

(assert (=> start!118488 m!1270127))

(declare-fun m!1270129 () Bool)

(assert (=> b!1384701 m!1270129))

(declare-fun m!1270131 () Bool)

(assert (=> b!1384699 m!1270131))

(assert (=> b!1384699 m!1270131))

(declare-fun m!1270133 () Bool)

(assert (=> b!1384699 m!1270133))

(declare-fun m!1270135 () Bool)

(assert (=> b!1384700 m!1270135))

(push 1)

(assert (not start!118488))

(assert (not b!1384700))

(assert (not b!1384701))

(assert (not b!1384699))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

