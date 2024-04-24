; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118176 () Bool)

(assert start!118176)

(declare-fun b!1383162 () Bool)

(declare-fun res!924004 () Bool)

(declare-fun e!784147 () Bool)

(assert (=> b!1383162 (=> (not res!924004) (not e!784147))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-datatypes ((array!94463 0))(
  ( (array!94464 (arr!45612 (Array (_ BitVec 32) (_ BitVec 64))) (size!46163 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94463)

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383162 (= res!924004 (and (= (size!46163 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46163 a!2971))))))

(declare-fun res!924001 () Bool)

(assert (=> start!118176 (=> (not res!924001) (not e!784147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118176 (= res!924001 (validMask!0 mask!3034))))

(assert (=> start!118176 e!784147))

(assert (=> start!118176 true))

(declare-fun array_inv!34893 (array!94463) Bool)

(assert (=> start!118176 (array_inv!34893 a!2971)))

(declare-fun b!1383163 () Bool)

(declare-fun res!924003 () Bool)

(assert (=> b!1383163 (=> (not res!924003) (not e!784147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383163 (= res!924003 (validKeyInArray!0 (select (arr!45612 a!2971) i!1094)))))

(declare-fun b!1383165 () Bool)

(assert (=> b!1383165 (= e!784147 false)))

(declare-fun lt!608784 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94463 (_ BitVec 32)) Bool)

(assert (=> b!1383165 (= lt!608784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1383164 () Bool)

(declare-fun res!924002 () Bool)

(assert (=> b!1383164 (=> (not res!924002) (not e!784147))))

(declare-datatypes ((List!32133 0))(
  ( (Nil!32130) (Cons!32129 (h!33347 (_ BitVec 64)) (t!46819 List!32133)) )
))
(declare-fun arrayNoDuplicates!0 (array!94463 (_ BitVec 32) List!32133) Bool)

(assert (=> b!1383164 (= res!924002 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32130))))

(assert (= (and start!118176 res!924001) b!1383162))

(assert (= (and b!1383162 res!924004) b!1383163))

(assert (= (and b!1383163 res!924003) b!1383164))

(assert (= (and b!1383164 res!924002) b!1383165))

(declare-fun m!1268667 () Bool)

(assert (=> start!118176 m!1268667))

(declare-fun m!1268669 () Bool)

(assert (=> start!118176 m!1268669))

(declare-fun m!1268671 () Bool)

(assert (=> b!1383163 m!1268671))

(assert (=> b!1383163 m!1268671))

(declare-fun m!1268673 () Bool)

(assert (=> b!1383163 m!1268673))

(declare-fun m!1268675 () Bool)

(assert (=> b!1383165 m!1268675))

(declare-fun m!1268677 () Bool)

(assert (=> b!1383164 m!1268677))

(push 1)

(assert (not b!1383163))

(assert (not b!1383165))

(assert (not b!1383164))

(assert (not start!118176))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

