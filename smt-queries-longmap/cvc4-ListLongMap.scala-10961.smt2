; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128368 () Bool)

(assert start!128368)

(declare-fun b!1505892 () Bool)

(declare-fun res!1026287 () Bool)

(declare-fun e!841668 () Bool)

(assert (=> b!1505892 (=> (not res!1026287) (not e!841668))))

(declare-datatypes ((array!100440 0))(
  ( (array!100441 (arr!48466 (Array (_ BitVec 32) (_ BitVec 64))) (size!49016 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100440)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100440 (_ BitVec 32)) Bool)

(assert (=> b!1505892 (= res!1026287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505893 () Bool)

(declare-fun res!1026289 () Bool)

(assert (=> b!1505893 (=> (not res!1026289) (not e!841668))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505893 (= res!1026289 (validKeyInArray!0 (select (arr!48466 a!2804) j!70)))))

(declare-fun b!1505894 () Bool)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1505894 (= e!841668 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49016 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49016 a!2804)) (bvslt mask!2512 #b00000000000000000000000000000000)))))

(declare-fun res!1026286 () Bool)

(assert (=> start!128368 (=> (not res!1026286) (not e!841668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128368 (= res!1026286 (validMask!0 mask!2512))))

(assert (=> start!128368 e!841668))

(assert (=> start!128368 true))

(declare-fun array_inv!37494 (array!100440) Bool)

(assert (=> start!128368 (array_inv!37494 a!2804)))

(declare-fun b!1505895 () Bool)

(declare-fun res!1026285 () Bool)

(assert (=> b!1505895 (=> (not res!1026285) (not e!841668))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1505895 (= res!1026285 (validKeyInArray!0 (select (arr!48466 a!2804) i!961)))))

(declare-fun b!1505896 () Bool)

(declare-fun res!1026288 () Bool)

(assert (=> b!1505896 (=> (not res!1026288) (not e!841668))))

(assert (=> b!1505896 (= res!1026288 (and (= (size!49016 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49016 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49016 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505897 () Bool)

(declare-fun res!1026284 () Bool)

(assert (=> b!1505897 (=> (not res!1026284) (not e!841668))))

(declare-datatypes ((List!34949 0))(
  ( (Nil!34946) (Cons!34945 (h!36342 (_ BitVec 64)) (t!49643 List!34949)) )
))
(declare-fun arrayNoDuplicates!0 (array!100440 (_ BitVec 32) List!34949) Bool)

(assert (=> b!1505897 (= res!1026284 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34946))))

(assert (= (and start!128368 res!1026286) b!1505896))

(assert (= (and b!1505896 res!1026288) b!1505895))

(assert (= (and b!1505895 res!1026285) b!1505893))

(assert (= (and b!1505893 res!1026289) b!1505892))

(assert (= (and b!1505892 res!1026287) b!1505897))

(assert (= (and b!1505897 res!1026284) b!1505894))

(declare-fun m!1388955 () Bool)

(assert (=> b!1505892 m!1388955))

(declare-fun m!1388957 () Bool)

(assert (=> b!1505893 m!1388957))

(assert (=> b!1505893 m!1388957))

(declare-fun m!1388959 () Bool)

(assert (=> b!1505893 m!1388959))

(declare-fun m!1388961 () Bool)

(assert (=> b!1505897 m!1388961))

(declare-fun m!1388963 () Bool)

(assert (=> start!128368 m!1388963))

(declare-fun m!1388965 () Bool)

(assert (=> start!128368 m!1388965))

(declare-fun m!1388967 () Bool)

(assert (=> b!1505895 m!1388967))

(assert (=> b!1505895 m!1388967))

(declare-fun m!1388969 () Bool)

(assert (=> b!1505895 m!1388969))

(push 1)

(assert (not b!1505892))

(assert (not start!128368))

(assert (not b!1505897))

(assert (not b!1505895))

(assert (not b!1505893))

(check-sat)

(pop 1)

(push 1)

(check-sat)

