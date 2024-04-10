; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118540 () Bool)

(assert start!118540)

(declare-fun b!1385856 () Bool)

(declare-fun res!927108 () Bool)

(declare-fun e!785186 () Bool)

(assert (=> b!1385856 (=> (not res!927108) (not e!785186))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94816 0))(
  ( (array!94817 (arr!45784 (Array (_ BitVec 32) (_ BitVec 64))) (size!46334 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94816)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1385856 (= res!927108 (and (= (size!46334 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46334 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46334 a!2938))))))

(declare-fun b!1385858 () Bool)

(declare-fun res!927107 () Bool)

(assert (=> b!1385858 (=> (not res!927107) (not e!785186))))

(declare-datatypes ((List!32312 0))(
  ( (Nil!32309) (Cons!32308 (h!33517 (_ BitVec 64)) (t!47006 List!32312)) )
))
(declare-fun arrayNoDuplicates!0 (array!94816 (_ BitVec 32) List!32312) Bool)

(assert (=> b!1385858 (= res!927107 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32309))))

(declare-fun res!927109 () Bool)

(assert (=> start!118540 (=> (not res!927109) (not e!785186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118540 (= res!927109 (validMask!0 mask!2987))))

(assert (=> start!118540 e!785186))

(assert (=> start!118540 true))

(declare-fun array_inv!34812 (array!94816) Bool)

(assert (=> start!118540 (array_inv!34812 a!2938)))

(declare-fun b!1385857 () Bool)

(declare-fun res!927106 () Bool)

(assert (=> b!1385857 (=> (not res!927106) (not e!785186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385857 (= res!927106 (validKeyInArray!0 (select (arr!45784 a!2938) i!1065)))))

(declare-fun b!1385859 () Bool)

(assert (=> b!1385859 (= e!785186 false)))

(declare-fun lt!609333 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94816 (_ BitVec 32)) Bool)

(assert (=> b!1385859 (= lt!609333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118540 res!927109) b!1385856))

(assert (= (and b!1385856 res!927108) b!1385857))

(assert (= (and b!1385857 res!927106) b!1385858))

(assert (= (and b!1385858 res!927107) b!1385859))

(declare-fun m!1271133 () Bool)

(assert (=> b!1385858 m!1271133))

(declare-fun m!1271135 () Bool)

(assert (=> start!118540 m!1271135))

(declare-fun m!1271137 () Bool)

(assert (=> start!118540 m!1271137))

(declare-fun m!1271139 () Bool)

(assert (=> b!1385857 m!1271139))

(assert (=> b!1385857 m!1271139))

(declare-fun m!1271141 () Bool)

(assert (=> b!1385857 m!1271141))

(declare-fun m!1271143 () Bool)

(assert (=> b!1385859 m!1271143))

(push 1)

(assert (not b!1385858))

(assert (not start!118540))

(assert (not b!1385859))

(assert (not b!1385857))

(check-sat)

