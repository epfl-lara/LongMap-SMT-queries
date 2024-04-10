; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118084 () Bool)

(assert start!118084)

(declare-fun b!1382577 () Bool)

(declare-fun res!924172 () Bool)

(declare-fun e!783638 () Bool)

(assert (=> b!1382577 (=> (not res!924172) (not e!783638))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94448 0))(
  ( (array!94449 (arr!45605 (Array (_ BitVec 32) (_ BitVec 64))) (size!46155 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94448)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1382577 (= res!924172 (and (= (size!46155 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46155 a!2971))))))

(declare-fun b!1382580 () Bool)

(assert (=> b!1382580 (= e!783638 false)))

(declare-fun lt!608451 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94448 (_ BitVec 32)) Bool)

(assert (=> b!1382580 (= lt!608451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!924169 () Bool)

(assert (=> start!118084 (=> (not res!924169) (not e!783638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118084 (= res!924169 (validMask!0 mask!3034))))

(assert (=> start!118084 e!783638))

(assert (=> start!118084 true))

(declare-fun array_inv!34633 (array!94448) Bool)

(assert (=> start!118084 (array_inv!34633 a!2971)))

(declare-fun b!1382579 () Bool)

(declare-fun res!924171 () Bool)

(assert (=> b!1382579 (=> (not res!924171) (not e!783638))))

(declare-datatypes ((List!32139 0))(
  ( (Nil!32136) (Cons!32135 (h!33344 (_ BitVec 64)) (t!46833 List!32139)) )
))
(declare-fun arrayNoDuplicates!0 (array!94448 (_ BitVec 32) List!32139) Bool)

(assert (=> b!1382579 (= res!924171 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32136))))

(declare-fun b!1382578 () Bool)

(declare-fun res!924170 () Bool)

(assert (=> b!1382578 (=> (not res!924170) (not e!783638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382578 (= res!924170 (validKeyInArray!0 (select (arr!45605 a!2971) i!1094)))))

(assert (= (and start!118084 res!924169) b!1382577))

(assert (= (and b!1382577 res!924172) b!1382578))

(assert (= (and b!1382578 res!924170) b!1382579))

(assert (= (and b!1382579 res!924171) b!1382580))

(declare-fun m!1267707 () Bool)

(assert (=> b!1382580 m!1267707))

(declare-fun m!1267709 () Bool)

(assert (=> start!118084 m!1267709))

(declare-fun m!1267711 () Bool)

(assert (=> start!118084 m!1267711))

(declare-fun m!1267713 () Bool)

(assert (=> b!1382579 m!1267713))

(declare-fun m!1267715 () Bool)

(assert (=> b!1382578 m!1267715))

(assert (=> b!1382578 m!1267715))

(declare-fun m!1267717 () Bool)

(assert (=> b!1382578 m!1267717))

(push 1)

(assert (not b!1382578))

(assert (not b!1382580))

(assert (not start!118084))

(assert (not b!1382579))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

