; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119162 () Bool)

(assert start!119162)

(declare-fun b!1390077 () Bool)

(declare-fun res!930239 () Bool)

(declare-fun e!787263 () Bool)

(assert (=> b!1390077 (=> (not res!930239) (not e!787263))))

(declare-datatypes ((array!95099 0))(
  ( (array!95100 (arr!45915 (Array (_ BitVec 32) (_ BitVec 64))) (size!46465 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95099)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390077 (= res!930239 (validKeyInArray!0 (select (arr!45915 a!2901) j!112)))))

(declare-fun b!1390078 () Bool)

(declare-fun res!930244 () Bool)

(assert (=> b!1390078 (=> (not res!930244) (not e!787263))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390078 (= res!930244 (validKeyInArray!0 (select (arr!45915 a!2901) i!1037)))))

(declare-fun res!930243 () Bool)

(assert (=> start!119162 (=> (not res!930243) (not e!787263))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119162 (= res!930243 (validMask!0 mask!2840))))

(assert (=> start!119162 e!787263))

(assert (=> start!119162 true))

(declare-fun array_inv!34943 (array!95099) Bool)

(assert (=> start!119162 (array_inv!34943 a!2901)))

(declare-fun e!787265 () Bool)

(declare-fun b!1390079 () Bool)

(declare-datatypes ((SeekEntryResult!10232 0))(
  ( (MissingZero!10232 (index!43299 (_ BitVec 32))) (Found!10232 (index!43300 (_ BitVec 32))) (Intermediate!10232 (undefined!11044 Bool) (index!43301 (_ BitVec 32)) (x!124982 (_ BitVec 32))) (Undefined!10232) (MissingVacant!10232 (index!43302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95099 (_ BitVec 32)) SeekEntryResult!10232)

(assert (=> b!1390079 (= e!787265 (= (seekEntryOrOpen!0 (select (arr!45915 a!2901) j!112) a!2901 mask!2840) (Found!10232 j!112)))))

(declare-fun b!1390080 () Bool)

(declare-fun res!930242 () Bool)

(assert (=> b!1390080 (=> (not res!930242) (not e!787263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95099 (_ BitVec 32)) Bool)

(assert (=> b!1390080 (= res!930242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390081 () Bool)

(assert (=> b!1390081 (= e!787263 (not true))))

(assert (=> b!1390081 e!787265))

(declare-fun res!930241 () Bool)

(assert (=> b!1390081 (=> (not res!930241) (not e!787265))))

(assert (=> b!1390081 (= res!930241 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46468 0))(
  ( (Unit!46469) )
))
(declare-fun lt!610722 () Unit!46468)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46468)

(assert (=> b!1390081 (= lt!610722 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!610721 () SeekEntryResult!10232)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95099 (_ BitVec 32)) SeekEntryResult!10232)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390081 (= lt!610721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45915 a!2901) j!112) mask!2840) (select (arr!45915 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390082 () Bool)

(declare-fun res!930240 () Bool)

(assert (=> b!1390082 (=> (not res!930240) (not e!787263))))

(assert (=> b!1390082 (= res!930240 (and (= (size!46465 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46465 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46465 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390083 () Bool)

(declare-fun res!930238 () Bool)

(assert (=> b!1390083 (=> (not res!930238) (not e!787263))))

(declare-datatypes ((List!32434 0))(
  ( (Nil!32431) (Cons!32430 (h!33648 (_ BitVec 64)) (t!47128 List!32434)) )
))
(declare-fun arrayNoDuplicates!0 (array!95099 (_ BitVec 32) List!32434) Bool)

(assert (=> b!1390083 (= res!930238 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32431))))

(assert (= (and start!119162 res!930243) b!1390082))

(assert (= (and b!1390082 res!930240) b!1390078))

(assert (= (and b!1390078 res!930244) b!1390077))

(assert (= (and b!1390077 res!930239) b!1390080))

(assert (= (and b!1390080 res!930242) b!1390083))

(assert (= (and b!1390083 res!930238) b!1390081))

(assert (= (and b!1390081 res!930241) b!1390079))

(declare-fun m!1275839 () Bool)

(assert (=> b!1390080 m!1275839))

(declare-fun m!1275841 () Bool)

(assert (=> b!1390081 m!1275841))

(declare-fun m!1275843 () Bool)

(assert (=> b!1390081 m!1275843))

(assert (=> b!1390081 m!1275841))

(declare-fun m!1275845 () Bool)

(assert (=> b!1390081 m!1275845))

(assert (=> b!1390081 m!1275843))

(assert (=> b!1390081 m!1275841))

(declare-fun m!1275847 () Bool)

(assert (=> b!1390081 m!1275847))

(declare-fun m!1275849 () Bool)

(assert (=> b!1390081 m!1275849))

(declare-fun m!1275851 () Bool)

(assert (=> b!1390083 m!1275851))

(assert (=> b!1390077 m!1275841))

(assert (=> b!1390077 m!1275841))

(declare-fun m!1275853 () Bool)

(assert (=> b!1390077 m!1275853))

(assert (=> b!1390079 m!1275841))

(assert (=> b!1390079 m!1275841))

(declare-fun m!1275855 () Bool)

(assert (=> b!1390079 m!1275855))

(declare-fun m!1275857 () Bool)

(assert (=> b!1390078 m!1275857))

(assert (=> b!1390078 m!1275857))

(declare-fun m!1275859 () Bool)

(assert (=> b!1390078 m!1275859))

(declare-fun m!1275861 () Bool)

(assert (=> start!119162 m!1275861))

(declare-fun m!1275863 () Bool)

(assert (=> start!119162 m!1275863))

(check-sat (not start!119162) (not b!1390081) (not b!1390083) (not b!1390077) (not b!1390079) (not b!1390080) (not b!1390078))
