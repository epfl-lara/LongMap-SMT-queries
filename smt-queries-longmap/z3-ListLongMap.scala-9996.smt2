; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118196 () Bool)

(assert start!118196)

(declare-fun res!924182 () Bool)

(declare-fun e!784207 () Bool)

(assert (=> start!118196 (=> (not res!924182) (not e!784207))))

(declare-fun mask!3034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118196 (= res!924182 (validMask!0 mask!3034))))

(assert (=> start!118196 e!784207))

(assert (=> start!118196 true))

(declare-datatypes ((array!94483 0))(
  ( (array!94484 (arr!45622 (Array (_ BitVec 32) (_ BitVec 64))) (size!46173 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94483)

(declare-fun array_inv!34903 (array!94483) Bool)

(assert (=> start!118196 (array_inv!34903 a!2971)))

(declare-fun b!1383340 () Bool)

(declare-fun res!924179 () Bool)

(assert (=> b!1383340 (=> (not res!924179) (not e!784207))))

(declare-fun i!1094 () (_ BitVec 32))

(assert (=> b!1383340 (= res!924179 (and (= (size!46173 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46173 a!2971))))))

(declare-fun b!1383341 () Bool)

(declare-fun res!924181 () Bool)

(assert (=> b!1383341 (=> (not res!924181) (not e!784207))))

(assert (=> b!1383341 (= res!924181 (and (not (= (select (arr!45622 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45622 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!46173 a!2971))))))

(declare-fun b!1383342 () Bool)

(declare-fun res!924183 () Bool)

(assert (=> b!1383342 (=> (not res!924183) (not e!784207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383342 (= res!924183 (validKeyInArray!0 (select (arr!45622 a!2971) i!1094)))))

(declare-fun b!1383343 () Bool)

(declare-fun res!924180 () Bool)

(assert (=> b!1383343 (=> (not res!924180) (not e!784207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94483 (_ BitVec 32)) Bool)

(assert (=> b!1383343 (= res!924180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2971 mask!3034))))

(declare-fun b!1383344 () Bool)

(assert (=> b!1383344 (= e!784207 (not (bvsle #b00000000000000000000000000000000 (size!46173 a!2971))))))

(assert (=> b!1383344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!94484 (store (arr!45622 a!2971) i!1094 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46173 a!2971)) mask!3034)))

(declare-datatypes ((Unit!45980 0))(
  ( (Unit!45981) )
))
(declare-fun lt!608814 () Unit!45980)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45980)

(assert (=> b!1383344 (= lt!608814 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2971 i!1094 #b00000000000000000000000000000000 mask!3034))))

(declare-fun b!1383345 () Bool)

(declare-fun res!924184 () Bool)

(assert (=> b!1383345 (=> (not res!924184) (not e!784207))))

(declare-datatypes ((List!32143 0))(
  ( (Nil!32140) (Cons!32139 (h!33357 (_ BitVec 64)) (t!46829 List!32143)) )
))
(declare-fun arrayNoDuplicates!0 (array!94483 (_ BitVec 32) List!32143) Bool)

(assert (=> b!1383345 (= res!924184 (arrayNoDuplicates!0 a!2971 #b00000000000000000000000000000000 Nil!32140))))

(assert (= (and start!118196 res!924182) b!1383340))

(assert (= (and b!1383340 res!924179) b!1383342))

(assert (= (and b!1383342 res!924183) b!1383345))

(assert (= (and b!1383345 res!924184) b!1383343))

(assert (= (and b!1383343 res!924180) b!1383341))

(assert (= (and b!1383341 res!924181) b!1383344))

(declare-fun m!1268841 () Bool)

(assert (=> start!118196 m!1268841))

(declare-fun m!1268843 () Bool)

(assert (=> start!118196 m!1268843))

(declare-fun m!1268845 () Bool)

(assert (=> b!1383345 m!1268845))

(declare-fun m!1268847 () Bool)

(assert (=> b!1383341 m!1268847))

(declare-fun m!1268849 () Bool)

(assert (=> b!1383343 m!1268849))

(declare-fun m!1268851 () Bool)

(assert (=> b!1383344 m!1268851))

(declare-fun m!1268853 () Bool)

(assert (=> b!1383344 m!1268853))

(declare-fun m!1268855 () Bool)

(assert (=> b!1383344 m!1268855))

(assert (=> b!1383342 m!1268847))

(assert (=> b!1383342 m!1268847))

(declare-fun m!1268857 () Bool)

(assert (=> b!1383342 m!1268857))

(check-sat (not start!118196) (not b!1383344) (not b!1383342) (not b!1383345) (not b!1383343))
(check-sat)
