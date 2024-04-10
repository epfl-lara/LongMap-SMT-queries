; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120332 () Bool)

(assert start!120332)

(declare-fun b!1400486 () Bool)

(declare-fun e!792931 () Bool)

(declare-fun e!792929 () Bool)

(assert (=> b!1400486 (= e!792931 e!792929)))

(declare-fun res!939003 () Bool)

(assert (=> b!1400486 (=> res!939003 e!792929)))

(declare-datatypes ((array!95741 0))(
  ( (array!95742 (arr!46221 (Array (_ BitVec 32) (_ BitVec 64))) (size!46771 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95741)

(declare-datatypes ((SeekEntryResult!10538 0))(
  ( (MissingZero!10538 (index!44529 (_ BitVec 32))) (Found!10538 (index!44530 (_ BitVec 32))) (Intermediate!10538 (undefined!11350 Bool) (index!44531 (_ BitVec 32)) (x!126173 (_ BitVec 32))) (Undefined!10538) (MissingVacant!10538 (index!44532 (_ BitVec 32))) )
))
(declare-fun lt!616241 () SeekEntryResult!10538)

(declare-fun lt!616240 () (_ BitVec 32))

(declare-fun lt!616242 () SeekEntryResult!10538)

(assert (=> b!1400486 (= res!939003 (or (bvslt (x!126173 lt!616241) #b00000000000000000000000000000000) (bvsgt (x!126173 lt!616241) #b01111111111111111111111111111110) (bvslt (x!126173 lt!616242) #b00000000000000000000000000000000) (bvsgt (x!126173 lt!616242) #b01111111111111111111111111111110) (bvslt lt!616240 #b00000000000000000000000000000000) (bvsge lt!616240 (size!46771 a!2901)) (bvslt (index!44531 lt!616241) #b00000000000000000000000000000000) (bvsge (index!44531 lt!616241) (size!46771 a!2901)) (bvslt (index!44531 lt!616242) #b00000000000000000000000000000000) (bvsge (index!44531 lt!616242) (size!46771 a!2901)) (not (= lt!616241 (Intermediate!10538 false (index!44531 lt!616241) (x!126173 lt!616241)))) (not (= lt!616242 (Intermediate!10538 false (index!44531 lt!616242) (x!126173 lt!616242))))))))

(declare-fun e!792927 () Bool)

(assert (=> b!1400486 e!792927))

(declare-fun res!939001 () Bool)

(assert (=> b!1400486 (=> (not res!939001) (not e!792927))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400486 (= res!939001 (and (not (undefined!11350 lt!616242)) (= (index!44531 lt!616242) i!1037) (bvslt (x!126173 lt!616242) (x!126173 lt!616241)) (= (select (store (arr!46221 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44531 lt!616242)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47080 0))(
  ( (Unit!47081) )
))
(declare-fun lt!616245 () Unit!47080)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47080)

(assert (=> b!1400486 (= lt!616245 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616240 (x!126173 lt!616241) (index!44531 lt!616241) (x!126173 lt!616242) (index!44531 lt!616242) (undefined!11350 lt!616242) mask!2840))))

(declare-fun b!1400487 () Bool)

(declare-fun res!938997 () Bool)

(declare-fun e!792930 () Bool)

(assert (=> b!1400487 (=> (not res!938997) (not e!792930))))

(declare-datatypes ((List!32740 0))(
  ( (Nil!32737) (Cons!32736 (h!33984 (_ BitVec 64)) (t!47434 List!32740)) )
))
(declare-fun arrayNoDuplicates!0 (array!95741 (_ BitVec 32) List!32740) Bool)

(assert (=> b!1400487 (= res!938997 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32737))))

(declare-fun b!1400489 () Bool)

(declare-fun e!792932 () Bool)

(assert (=> b!1400489 (= e!792932 e!792931)))

(declare-fun res!939002 () Bool)

(assert (=> b!1400489 (=> res!939002 e!792931)))

(get-info :version)

(assert (=> b!1400489 (= res!939002 (or (= lt!616241 lt!616242) (not ((_ is Intermediate!10538) lt!616242))))))

(declare-fun lt!616243 () (_ BitVec 64))

(declare-fun lt!616239 () array!95741)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95741 (_ BitVec 32)) SeekEntryResult!10538)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400489 (= lt!616242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616243 mask!2840) lt!616243 lt!616239 mask!2840))))

(assert (=> b!1400489 (= lt!616243 (select (store (arr!46221 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400489 (= lt!616239 (array!95742 (store (arr!46221 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46771 a!2901)))))

(declare-fun b!1400490 () Bool)

(declare-fun res!939005 () Bool)

(assert (=> b!1400490 (=> (not res!939005) (not e!792930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95741 (_ BitVec 32)) Bool)

(assert (=> b!1400490 (= res!939005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400491 () Bool)

(declare-fun e!792928 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95741 (_ BitVec 32)) SeekEntryResult!10538)

(assert (=> b!1400491 (= e!792928 (= (seekEntryOrOpen!0 (select (arr!46221 a!2901) j!112) a!2901 mask!2840) (Found!10538 j!112)))))

(declare-fun b!1400492 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95741 (_ BitVec 32)) SeekEntryResult!10538)

(assert (=> b!1400492 (= e!792927 (= (seekEntryOrOpen!0 lt!616243 lt!616239 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126173 lt!616242) (index!44531 lt!616242) (index!44531 lt!616242) (select (arr!46221 a!2901) j!112) lt!616239 mask!2840)))))

(declare-fun b!1400493 () Bool)

(declare-fun res!938999 () Bool)

(assert (=> b!1400493 (=> (not res!938999) (not e!792930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400493 (= res!938999 (validKeyInArray!0 (select (arr!46221 a!2901) i!1037)))))

(declare-fun b!1400494 () Bool)

(assert (=> b!1400494 (= e!792930 (not e!792932))))

(declare-fun res!939007 () Bool)

(assert (=> b!1400494 (=> res!939007 e!792932)))

(assert (=> b!1400494 (= res!939007 (or (not ((_ is Intermediate!10538) lt!616241)) (undefined!11350 lt!616241)))))

(assert (=> b!1400494 e!792928))

(declare-fun res!939006 () Bool)

(assert (=> b!1400494 (=> (not res!939006) (not e!792928))))

(assert (=> b!1400494 (= res!939006 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616238 () Unit!47080)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47080)

(assert (=> b!1400494 (= lt!616238 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400494 (= lt!616241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616240 (select (arr!46221 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1400494 (= lt!616240 (toIndex!0 (select (arr!46221 a!2901) j!112) mask!2840))))

(declare-fun b!1400495 () Bool)

(assert (=> b!1400495 (= e!792929 true)))

(declare-fun lt!616244 () SeekEntryResult!10538)

(assert (=> b!1400495 (= lt!616244 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616240 lt!616243 lt!616239 mask!2840))))

(declare-fun b!1400496 () Bool)

(declare-fun res!939000 () Bool)

(assert (=> b!1400496 (=> (not res!939000) (not e!792930))))

(assert (=> b!1400496 (= res!939000 (validKeyInArray!0 (select (arr!46221 a!2901) j!112)))))

(declare-fun b!1400488 () Bool)

(declare-fun res!939004 () Bool)

(assert (=> b!1400488 (=> (not res!939004) (not e!792930))))

(assert (=> b!1400488 (= res!939004 (and (= (size!46771 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46771 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46771 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!938998 () Bool)

(assert (=> start!120332 (=> (not res!938998) (not e!792930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120332 (= res!938998 (validMask!0 mask!2840))))

(assert (=> start!120332 e!792930))

(assert (=> start!120332 true))

(declare-fun array_inv!35249 (array!95741) Bool)

(assert (=> start!120332 (array_inv!35249 a!2901)))

(assert (= (and start!120332 res!938998) b!1400488))

(assert (= (and b!1400488 res!939004) b!1400493))

(assert (= (and b!1400493 res!938999) b!1400496))

(assert (= (and b!1400496 res!939000) b!1400490))

(assert (= (and b!1400490 res!939005) b!1400487))

(assert (= (and b!1400487 res!938997) b!1400494))

(assert (= (and b!1400494 res!939006) b!1400491))

(assert (= (and b!1400494 (not res!939007)) b!1400489))

(assert (= (and b!1400489 (not res!939002)) b!1400486))

(assert (= (and b!1400486 res!939001) b!1400492))

(assert (= (and b!1400486 (not res!939003)) b!1400495))

(declare-fun m!1287953 () Bool)

(assert (=> b!1400493 m!1287953))

(assert (=> b!1400493 m!1287953))

(declare-fun m!1287955 () Bool)

(assert (=> b!1400493 m!1287955))

(declare-fun m!1287957 () Bool)

(assert (=> b!1400494 m!1287957))

(declare-fun m!1287959 () Bool)

(assert (=> b!1400494 m!1287959))

(assert (=> b!1400494 m!1287957))

(declare-fun m!1287961 () Bool)

(assert (=> b!1400494 m!1287961))

(assert (=> b!1400494 m!1287957))

(declare-fun m!1287963 () Bool)

(assert (=> b!1400494 m!1287963))

(declare-fun m!1287965 () Bool)

(assert (=> b!1400494 m!1287965))

(declare-fun m!1287967 () Bool)

(assert (=> b!1400495 m!1287967))

(assert (=> b!1400496 m!1287957))

(assert (=> b!1400496 m!1287957))

(declare-fun m!1287969 () Bool)

(assert (=> b!1400496 m!1287969))

(declare-fun m!1287971 () Bool)

(assert (=> b!1400487 m!1287971))

(declare-fun m!1287973 () Bool)

(assert (=> b!1400486 m!1287973))

(declare-fun m!1287975 () Bool)

(assert (=> b!1400486 m!1287975))

(declare-fun m!1287977 () Bool)

(assert (=> b!1400486 m!1287977))

(declare-fun m!1287979 () Bool)

(assert (=> b!1400492 m!1287979))

(assert (=> b!1400492 m!1287957))

(assert (=> b!1400492 m!1287957))

(declare-fun m!1287981 () Bool)

(assert (=> b!1400492 m!1287981))

(declare-fun m!1287983 () Bool)

(assert (=> start!120332 m!1287983))

(declare-fun m!1287985 () Bool)

(assert (=> start!120332 m!1287985))

(assert (=> b!1400491 m!1287957))

(assert (=> b!1400491 m!1287957))

(declare-fun m!1287987 () Bool)

(assert (=> b!1400491 m!1287987))

(declare-fun m!1287989 () Bool)

(assert (=> b!1400490 m!1287989))

(declare-fun m!1287991 () Bool)

(assert (=> b!1400489 m!1287991))

(assert (=> b!1400489 m!1287991))

(declare-fun m!1287993 () Bool)

(assert (=> b!1400489 m!1287993))

(assert (=> b!1400489 m!1287973))

(declare-fun m!1287995 () Bool)

(assert (=> b!1400489 m!1287995))

(check-sat (not b!1400494) (not b!1400487) (not b!1400489) (not b!1400486) (not b!1400492) (not b!1400496) (not b!1400491) (not b!1400493) (not b!1400490) (not start!120332) (not b!1400495))
(check-sat)
