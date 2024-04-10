; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119132 () Bool)

(assert start!119132)

(declare-fun b!1389793 () Bool)

(declare-fun res!929956 () Bool)

(declare-fun e!787160 () Bool)

(assert (=> b!1389793 (=> (not res!929956) (not e!787160))))

(declare-datatypes ((array!95069 0))(
  ( (array!95070 (arr!45900 (Array (_ BitVec 32) (_ BitVec 64))) (size!46450 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95069)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95069 (_ BitVec 32)) Bool)

(assert (=> b!1389793 (= res!929956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389794 () Bool)

(declare-fun res!929958 () Bool)

(assert (=> b!1389794 (=> (not res!929958) (not e!787160))))

(declare-datatypes ((List!32419 0))(
  ( (Nil!32416) (Cons!32415 (h!33633 (_ BitVec 64)) (t!47113 List!32419)) )
))
(declare-fun arrayNoDuplicates!0 (array!95069 (_ BitVec 32) List!32419) Bool)

(assert (=> b!1389794 (= res!929958 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32416))))

(declare-fun b!1389795 () Bool)

(declare-fun res!929955 () Bool)

(assert (=> b!1389795 (=> (not res!929955) (not e!787160))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389795 (= res!929955 (validKeyInArray!0 (select (arr!45900 a!2901) j!112)))))

(declare-fun b!1389796 () Bool)

(assert (=> b!1389796 (= e!787160 (not true))))

(assert (=> b!1389796 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46438 0))(
  ( (Unit!46439) )
))
(declare-fun lt!610632 () Unit!46438)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95069 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46438)

(assert (=> b!1389796 (= lt!610632 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10217 0))(
  ( (MissingZero!10217 (index!43239 (_ BitVec 32))) (Found!10217 (index!43240 (_ BitVec 32))) (Intermediate!10217 (undefined!11029 Bool) (index!43241 (_ BitVec 32)) (x!124927 (_ BitVec 32))) (Undefined!10217) (MissingVacant!10217 (index!43242 (_ BitVec 32))) )
))
(declare-fun lt!610631 () SeekEntryResult!10217)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95069 (_ BitVec 32)) SeekEntryResult!10217)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389796 (= lt!610631 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45900 a!2901) j!112) mask!2840) (select (arr!45900 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389797 () Bool)

(declare-fun res!929957 () Bool)

(assert (=> b!1389797 (=> (not res!929957) (not e!787160))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389797 (= res!929957 (and (= (size!46450 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46450 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46450 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!929954 () Bool)

(assert (=> start!119132 (=> (not res!929954) (not e!787160))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119132 (= res!929954 (validMask!0 mask!2840))))

(assert (=> start!119132 e!787160))

(assert (=> start!119132 true))

(declare-fun array_inv!34928 (array!95069) Bool)

(assert (=> start!119132 (array_inv!34928 a!2901)))

(declare-fun b!1389798 () Bool)

(declare-fun res!929959 () Bool)

(assert (=> b!1389798 (=> (not res!929959) (not e!787160))))

(assert (=> b!1389798 (= res!929959 (validKeyInArray!0 (select (arr!45900 a!2901) i!1037)))))

(assert (= (and start!119132 res!929954) b!1389797))

(assert (= (and b!1389797 res!929957) b!1389798))

(assert (= (and b!1389798 res!929959) b!1389795))

(assert (= (and b!1389795 res!929955) b!1389793))

(assert (= (and b!1389793 res!929956) b!1389794))

(assert (= (and b!1389794 res!929958) b!1389796))

(declare-fun m!1275471 () Bool)

(assert (=> b!1389793 m!1275471))

(declare-fun m!1275473 () Bool)

(assert (=> start!119132 m!1275473))

(declare-fun m!1275475 () Bool)

(assert (=> start!119132 m!1275475))

(declare-fun m!1275477 () Bool)

(assert (=> b!1389798 m!1275477))

(assert (=> b!1389798 m!1275477))

(declare-fun m!1275479 () Bool)

(assert (=> b!1389798 m!1275479))

(declare-fun m!1275481 () Bool)

(assert (=> b!1389794 m!1275481))

(declare-fun m!1275483 () Bool)

(assert (=> b!1389796 m!1275483))

(declare-fun m!1275485 () Bool)

(assert (=> b!1389796 m!1275485))

(assert (=> b!1389796 m!1275483))

(declare-fun m!1275487 () Bool)

(assert (=> b!1389796 m!1275487))

(assert (=> b!1389796 m!1275485))

(assert (=> b!1389796 m!1275483))

(declare-fun m!1275489 () Bool)

(assert (=> b!1389796 m!1275489))

(declare-fun m!1275491 () Bool)

(assert (=> b!1389796 m!1275491))

(assert (=> b!1389795 m!1275483))

(assert (=> b!1389795 m!1275483))

(declare-fun m!1275493 () Bool)

(assert (=> b!1389795 m!1275493))

(check-sat (not b!1389798) (not b!1389795) (not b!1389796) (not b!1389794) (not start!119132) (not b!1389793))
