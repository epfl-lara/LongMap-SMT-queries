; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118248 () Bool)

(assert start!118248)

(declare-fun res!924814 () Bool)

(declare-fun e!783975 () Bool)

(assert (=> start!118248 (=> (not res!924814) (not e!783975))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118248 (= res!924814 (validMask!0 mask!2987))))

(assert (=> start!118248 e!783975))

(assert (=> start!118248 true))

(declare-datatypes ((array!94504 0))(
  ( (array!94505 (arr!45630 (Array (_ BitVec 32) (_ BitVec 64))) (size!46182 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94504)

(declare-fun array_inv!34863 (array!94504) Bool)

(assert (=> start!118248 (array_inv!34863 a!2938)))

(declare-fun b!1383177 () Bool)

(declare-fun res!924815 () Bool)

(assert (=> b!1383177 (=> (not res!924815) (not e!783975))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383177 (= res!924815 (and (= (size!46182 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46182 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46182 a!2938))))))

(declare-fun b!1383179 () Bool)

(declare-fun res!924813 () Bool)

(assert (=> b!1383179 (=> (not res!924813) (not e!783975))))

(declare-datatypes ((List!32236 0))(
  ( (Nil!32233) (Cons!32232 (h!33441 (_ BitVec 64)) (t!46922 List!32236)) )
))
(declare-fun arrayNoDuplicates!0 (array!94504 (_ BitVec 32) List!32236) Bool)

(assert (=> b!1383179 (= res!924813 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32233))))

(declare-fun b!1383180 () Bool)

(assert (=> b!1383180 (= e!783975 false)))

(declare-fun lt!608384 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94504 (_ BitVec 32)) Bool)

(assert (=> b!1383180 (= lt!608384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383178 () Bool)

(declare-fun res!924812 () Bool)

(assert (=> b!1383178 (=> (not res!924812) (not e!783975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383178 (= res!924812 (validKeyInArray!0 (select (arr!45630 a!2938) i!1065)))))

(assert (= (and start!118248 res!924814) b!1383177))

(assert (= (and b!1383177 res!924815) b!1383178))

(assert (= (and b!1383178 res!924812) b!1383179))

(assert (= (and b!1383179 res!924813) b!1383180))

(declare-fun m!1267845 () Bool)

(assert (=> start!118248 m!1267845))

(declare-fun m!1267847 () Bool)

(assert (=> start!118248 m!1267847))

(declare-fun m!1267849 () Bool)

(assert (=> b!1383179 m!1267849))

(declare-fun m!1267851 () Bool)

(assert (=> b!1383180 m!1267851))

(declare-fun m!1267853 () Bool)

(assert (=> b!1383178 m!1267853))

(assert (=> b!1383178 m!1267853))

(declare-fun m!1267855 () Bool)

(assert (=> b!1383178 m!1267855))

(push 1)

(assert (not start!118248))

(assert (not b!1383179))

(assert (not b!1383178))

(assert (not b!1383180))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

