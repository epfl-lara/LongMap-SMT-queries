; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118244 () Bool)

(assert start!118244)

(declare-fun b!1383201 () Bool)

(declare-fun e!783982 () Bool)

(assert (=> b!1383201 (= e!783982 false)))

(declare-fun lt!608556 () Bool)

(declare-datatypes ((array!94547 0))(
  ( (array!94548 (arr!45651 (Array (_ BitVec 32) (_ BitVec 64))) (size!46201 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94547)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94547 (_ BitVec 32)) Bool)

(assert (=> b!1383201 (= lt!608556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383198 () Bool)

(declare-fun res!924793 () Bool)

(assert (=> b!1383198 (=> (not res!924793) (not e!783982))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1383198 (= res!924793 (and (= (size!46201 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46201 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46201 a!2938))))))

(declare-fun b!1383200 () Bool)

(declare-fun res!924792 () Bool)

(assert (=> b!1383200 (=> (not res!924792) (not e!783982))))

(declare-datatypes ((List!32179 0))(
  ( (Nil!32176) (Cons!32175 (h!33384 (_ BitVec 64)) (t!46873 List!32179)) )
))
(declare-fun arrayNoDuplicates!0 (array!94547 (_ BitVec 32) List!32179) Bool)

(assert (=> b!1383200 (= res!924792 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32176))))

(declare-fun b!1383199 () Bool)

(declare-fun res!924791 () Bool)

(assert (=> b!1383199 (=> (not res!924791) (not e!783982))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383199 (= res!924791 (validKeyInArray!0 (select (arr!45651 a!2938) i!1065)))))

(declare-fun res!924790 () Bool)

(assert (=> start!118244 (=> (not res!924790) (not e!783982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118244 (= res!924790 (validMask!0 mask!2987))))

(assert (=> start!118244 e!783982))

(assert (=> start!118244 true))

(declare-fun array_inv!34679 (array!94547) Bool)

(assert (=> start!118244 (array_inv!34679 a!2938)))

(assert (= (and start!118244 res!924790) b!1383198))

(assert (= (and b!1383198 res!924793) b!1383199))

(assert (= (and b!1383199 res!924791) b!1383200))

(assert (= (and b!1383200 res!924792) b!1383201))

(declare-fun m!1268301 () Bool)

(assert (=> b!1383201 m!1268301))

(declare-fun m!1268303 () Bool)

(assert (=> b!1383200 m!1268303))

(declare-fun m!1268305 () Bool)

(assert (=> b!1383199 m!1268305))

(assert (=> b!1383199 m!1268305))

(declare-fun m!1268307 () Bool)

(assert (=> b!1383199 m!1268307))

(declare-fun m!1268309 () Bool)

(assert (=> start!118244 m!1268309))

(declare-fun m!1268311 () Bool)

(assert (=> start!118244 m!1268311))

(check-sat (not b!1383199) (not b!1383200) (not start!118244) (not b!1383201))
