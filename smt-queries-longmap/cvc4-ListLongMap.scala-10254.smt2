; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120574 () Bool)

(assert start!120574)

(declare-fun b!1403913 () Bool)

(declare-fun res!942476 () Bool)

(declare-fun e!794849 () Bool)

(assert (=> b!1403913 (=> (not res!942476) (not e!794849))))

(declare-datatypes ((array!95936 0))(
  ( (array!95937 (arr!46319 (Array (_ BitVec 32) (_ BitVec 64))) (size!46871 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95936)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95936 (_ BitVec 32)) Bool)

(assert (=> b!1403913 (= res!942476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!942477 () Bool)

(assert (=> start!120574 (=> (not res!942477) (not e!794849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120574 (= res!942477 (validMask!0 mask!2840))))

(assert (=> start!120574 e!794849))

(assert (=> start!120574 true))

(declare-fun array_inv!35552 (array!95936) Bool)

(assert (=> start!120574 (array_inv!35552 a!2901)))

(declare-fun b!1403914 () Bool)

(declare-fun res!942475 () Bool)

(assert (=> b!1403914 (=> (not res!942475) (not e!794849))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403914 (= res!942475 (and (= (size!46871 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46871 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46871 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403915 () Bool)

(assert (=> b!1403915 (= e!794849 (not true))))

(declare-fun e!794848 () Bool)

(assert (=> b!1403915 e!794848))

(declare-fun res!942478 () Bool)

(assert (=> b!1403915 (=> (not res!942478) (not e!794848))))

(assert (=> b!1403915 (= res!942478 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47171 0))(
  ( (Unit!47172) )
))
(declare-fun lt!618376 () Unit!47171)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47171)

(assert (=> b!1403915 (= lt!618376 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10662 0))(
  ( (MissingZero!10662 (index!45025 (_ BitVec 32))) (Found!10662 (index!45026 (_ BitVec 32))) (Intermediate!10662 (undefined!11474 Bool) (index!45027 (_ BitVec 32)) (x!126622 (_ BitVec 32))) (Undefined!10662) (MissingVacant!10662 (index!45028 (_ BitVec 32))) )
))
(declare-fun lt!618377 () SeekEntryResult!10662)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95936 (_ BitVec 32)) SeekEntryResult!10662)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403915 (= lt!618377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46319 a!2901) j!112) mask!2840) (select (arr!46319 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403916 () Bool)

(declare-fun res!942480 () Bool)

(assert (=> b!1403916 (=> (not res!942480) (not e!794849))))

(declare-datatypes ((List!32916 0))(
  ( (Nil!32913) (Cons!32912 (h!34160 (_ BitVec 64)) (t!47602 List!32916)) )
))
(declare-fun arrayNoDuplicates!0 (array!95936 (_ BitVec 32) List!32916) Bool)

(assert (=> b!1403916 (= res!942480 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32913))))

(declare-fun b!1403917 () Bool)

(declare-fun res!942481 () Bool)

(assert (=> b!1403917 (=> (not res!942481) (not e!794849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403917 (= res!942481 (validKeyInArray!0 (select (arr!46319 a!2901) j!112)))))

(declare-fun b!1403918 () Bool)

(declare-fun res!942479 () Bool)

(assert (=> b!1403918 (=> (not res!942479) (not e!794849))))

(assert (=> b!1403918 (= res!942479 (validKeyInArray!0 (select (arr!46319 a!2901) i!1037)))))

(declare-fun b!1403919 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95936 (_ BitVec 32)) SeekEntryResult!10662)

(assert (=> b!1403919 (= e!794848 (= (seekEntryOrOpen!0 (select (arr!46319 a!2901) j!112) a!2901 mask!2840) (Found!10662 j!112)))))

(assert (= (and start!120574 res!942477) b!1403914))

(assert (= (and b!1403914 res!942475) b!1403918))

(assert (= (and b!1403918 res!942479) b!1403917))

(assert (= (and b!1403917 res!942481) b!1403913))

(assert (= (and b!1403913 res!942476) b!1403916))

(assert (= (and b!1403916 res!942480) b!1403915))

(assert (= (and b!1403915 res!942478) b!1403919))

(declare-fun m!1292247 () Bool)

(assert (=> b!1403915 m!1292247))

(declare-fun m!1292249 () Bool)

(assert (=> b!1403915 m!1292249))

(assert (=> b!1403915 m!1292247))

(declare-fun m!1292251 () Bool)

(assert (=> b!1403915 m!1292251))

(assert (=> b!1403915 m!1292249))

(assert (=> b!1403915 m!1292247))

(declare-fun m!1292253 () Bool)

(assert (=> b!1403915 m!1292253))

(declare-fun m!1292255 () Bool)

(assert (=> b!1403915 m!1292255))

(assert (=> b!1403917 m!1292247))

(assert (=> b!1403917 m!1292247))

(declare-fun m!1292257 () Bool)

(assert (=> b!1403917 m!1292257))

(declare-fun m!1292259 () Bool)

(assert (=> b!1403913 m!1292259))

(declare-fun m!1292261 () Bool)

(assert (=> b!1403918 m!1292261))

(assert (=> b!1403918 m!1292261))

(declare-fun m!1292263 () Bool)

(assert (=> b!1403918 m!1292263))

(declare-fun m!1292265 () Bool)

(assert (=> start!120574 m!1292265))

(declare-fun m!1292267 () Bool)

(assert (=> start!120574 m!1292267))

(declare-fun m!1292269 () Bool)

(assert (=> b!1403916 m!1292269))

(assert (=> b!1403919 m!1292247))

(assert (=> b!1403919 m!1292247))

(declare-fun m!1292271 () Bool)

(assert (=> b!1403919 m!1292271))

(push 1)

(assert (not b!1403913))

(assert (not b!1403916))

(assert (not b!1403917))

(assert (not b!1403919))

(assert (not b!1403915))

(assert (not b!1403918))

(assert (not start!120574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

