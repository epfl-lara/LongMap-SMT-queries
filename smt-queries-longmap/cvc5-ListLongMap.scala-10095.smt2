; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119028 () Bool)

(assert start!119028)

(declare-fun b!1389101 () Bool)

(declare-fun res!929299 () Bool)

(declare-fun e!786893 () Bool)

(assert (=> b!1389101 (=> (not res!929299) (not e!786893))))

(declare-datatypes ((array!94998 0))(
  ( (array!94999 (arr!45866 (Array (_ BitVec 32) (_ BitVec 64))) (size!46416 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!94998)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94998 (_ BitVec 32)) Bool)

(assert (=> b!1389101 (= res!929299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389102 () Bool)

(declare-fun res!929296 () Bool)

(assert (=> b!1389102 (=> (not res!929296) (not e!786893))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389102 (= res!929296 (validKeyInArray!0 (select (arr!45866 a!2901) i!1037)))))

(declare-fun b!1389103 () Bool)

(declare-fun res!929298 () Bool)

(assert (=> b!1389103 (=> (not res!929298) (not e!786893))))

(declare-datatypes ((List!32385 0))(
  ( (Nil!32382) (Cons!32381 (h!33596 (_ BitVec 64)) (t!47079 List!32385)) )
))
(declare-fun arrayNoDuplicates!0 (array!94998 (_ BitVec 32) List!32385) Bool)

(assert (=> b!1389103 (= res!929298 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32382))))

(declare-fun b!1389104 () Bool)

(assert (=> b!1389104 (= e!786893 false)))

(declare-fun lt!610479 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389104 (= lt!610479 (toIndex!0 (select (arr!45866 a!2901) j!112) mask!2840))))

(declare-fun b!1389105 () Bool)

(declare-fun res!929294 () Bool)

(assert (=> b!1389105 (=> (not res!929294) (not e!786893))))

(assert (=> b!1389105 (= res!929294 (and (= (size!46416 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46416 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46416 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!929297 () Bool)

(assert (=> start!119028 (=> (not res!929297) (not e!786893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119028 (= res!929297 (validMask!0 mask!2840))))

(assert (=> start!119028 e!786893))

(assert (=> start!119028 true))

(declare-fun array_inv!34894 (array!94998) Bool)

(assert (=> start!119028 (array_inv!34894 a!2901)))

(declare-fun b!1389100 () Bool)

(declare-fun res!929295 () Bool)

(assert (=> b!1389100 (=> (not res!929295) (not e!786893))))

(assert (=> b!1389100 (= res!929295 (validKeyInArray!0 (select (arr!45866 a!2901) j!112)))))

(assert (= (and start!119028 res!929297) b!1389105))

(assert (= (and b!1389105 res!929294) b!1389102))

(assert (= (and b!1389102 res!929296) b!1389100))

(assert (= (and b!1389100 res!929295) b!1389101))

(assert (= (and b!1389101 res!929299) b!1389103))

(assert (= (and b!1389103 res!929298) b!1389104))

(declare-fun m!1274775 () Bool)

(assert (=> b!1389102 m!1274775))

(assert (=> b!1389102 m!1274775))

(declare-fun m!1274777 () Bool)

(assert (=> b!1389102 m!1274777))

(declare-fun m!1274779 () Bool)

(assert (=> b!1389103 m!1274779))

(declare-fun m!1274781 () Bool)

(assert (=> b!1389101 m!1274781))

(declare-fun m!1274783 () Bool)

(assert (=> b!1389100 m!1274783))

(assert (=> b!1389100 m!1274783))

(declare-fun m!1274785 () Bool)

(assert (=> b!1389100 m!1274785))

(declare-fun m!1274787 () Bool)

(assert (=> start!119028 m!1274787))

(declare-fun m!1274789 () Bool)

(assert (=> start!119028 m!1274789))

(assert (=> b!1389104 m!1274783))

(assert (=> b!1389104 m!1274783))

(declare-fun m!1274791 () Bool)

(assert (=> b!1389104 m!1274791))

(push 1)

(assert (not b!1389104))

(assert (not b!1389101))

(assert (not b!1389103))

(assert (not b!1389100))

(assert (not b!1389102))

(assert (not start!119028))

(check-sat)

