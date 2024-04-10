; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117926 () Bool)

(assert start!117926)

(declare-fun b!1381639 () Bool)

(declare-fun res!923268 () Bool)

(declare-fun e!783191 () Bool)

(assert (=> b!1381639 (=> (not res!923268) (not e!783191))))

(declare-datatypes ((array!94317 0))(
  ( (array!94318 (arr!45541 (Array (_ BitVec 32) (_ BitVec 64))) (size!46091 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94317)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381639 (= res!923268 (validKeyInArray!0 (select (arr!45541 a!2971) i!1094)))))

(declare-fun b!1381638 () Bool)

(declare-fun res!923266 () Bool)

(assert (=> b!1381638 (=> (not res!923266) (not e!783191))))

(declare-fun mask!3034 () (_ BitVec 32))

(assert (=> b!1381638 (= res!923266 (and (= (size!46091 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46091 a!2971))))))

(declare-fun b!1381640 () Bool)

(declare-fun res!923267 () Bool)

(assert (=> b!1381640 (=> (not res!923267) (not e!783191))))

(declare-datatypes ((List!32075 0))(
  ( (Nil!32072) (Cons!32071 (h!33280 (_ BitVec 64)) (t!46769 List!32075)) )
))
(declare-fun arrayNoDuplicates!0 (array!94317 (_ BitVec 32) List!32075) Bool)

(assert (=> b!1381640 (= res!923267 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32072))))

(declare-fun b!1381641 () Bool)

(assert (=> b!1381641 (= e!783191 false)))

(declare-fun lt!608250 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94317 (_ BitVec 32)) Bool)

(assert (=> b!1381641 (= lt!608250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun res!923269 () Bool)

(assert (=> start!117926 (=> (not res!923269) (not e!783191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117926 (= res!923269 (validMask!0 mask!3034))))

(assert (=> start!117926 e!783191))

(assert (=> start!117926 true))

(declare-fun array_inv!34569 (array!94317) Bool)

(assert (=> start!117926 (array_inv!34569 a!2971)))

(assert (= (and start!117926 res!923269) b!1381638))

(assert (= (and b!1381638 res!923266) b!1381639))

(assert (= (and b!1381639 res!923268) b!1381640))

(assert (= (and b!1381640 res!923267) b!1381641))

(declare-fun m!1266819 () Bool)

(assert (=> b!1381639 m!1266819))

(assert (=> b!1381639 m!1266819))

(declare-fun m!1266821 () Bool)

(assert (=> b!1381639 m!1266821))

(declare-fun m!1266823 () Bool)

(assert (=> b!1381640 m!1266823))

(declare-fun m!1266825 () Bool)

(assert (=> b!1381641 m!1266825))

(declare-fun m!1266827 () Bool)

(assert (=> start!117926 m!1266827))

(declare-fun m!1266829 () Bool)

(assert (=> start!117926 m!1266829))

(push 1)

(assert (not b!1381639))

(assert (not b!1381641))

(assert (not start!117926))

(assert (not b!1381640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

