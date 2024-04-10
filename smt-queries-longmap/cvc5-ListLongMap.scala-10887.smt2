; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127584 () Bool)

(assert start!127584)

(declare-fun b!1498841 () Bool)

(declare-fun res!1019922 () Bool)

(declare-fun e!839130 () Bool)

(assert (=> b!1498841 (=> (not res!1019922) (not e!839130))))

(declare-datatypes ((array!99965 0))(
  ( (array!99966 (arr!48242 (Array (_ BitVec 32) (_ BitVec 64))) (size!48792 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99965)

(declare-datatypes ((List!34734 0))(
  ( (Nil!34731) (Cons!34730 (h!36127 (_ BitVec 64)) (t!49428 List!34734)) )
))
(declare-fun arrayNoDuplicates!0 (array!99965 (_ BitVec 32) List!34734) Bool)

(assert (=> b!1498841 (= res!1019922 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34731))))

(declare-fun b!1498842 () Bool)

(declare-fun res!1019918 () Bool)

(assert (=> b!1498842 (=> (not res!1019918) (not e!839130))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498842 (= res!1019918 (and (= (size!48792 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48792 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48792 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498843 () Bool)

(declare-fun res!1019923 () Bool)

(assert (=> b!1498843 (=> (not res!1019923) (not e!839130))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498843 (= res!1019923 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48792 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48792 a!2850)) (= (select (arr!48242 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48242 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48792 a!2850))))))

(declare-fun res!1019921 () Bool)

(assert (=> start!127584 (=> (not res!1019921) (not e!839130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127584 (= res!1019921 (validMask!0 mask!2661))))

(assert (=> start!127584 e!839130))

(assert (=> start!127584 true))

(declare-fun array_inv!37270 (array!99965) Bool)

(assert (=> start!127584 (array_inv!37270 a!2850)))

(declare-fun b!1498844 () Bool)

(declare-fun res!1019917 () Bool)

(assert (=> b!1498844 (=> (not res!1019917) (not e!839130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498844 (= res!1019917 (validKeyInArray!0 (select (arr!48242 a!2850) i!996)))))

(declare-fun b!1498845 () Bool)

(declare-fun res!1019919 () Bool)

(assert (=> b!1498845 (=> (not res!1019919) (not e!839130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99965 (_ BitVec 32)) Bool)

(assert (=> b!1498845 (= res!1019919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498846 () Bool)

(declare-fun res!1019920 () Bool)

(assert (=> b!1498846 (=> (not res!1019920) (not e!839130))))

(assert (=> b!1498846 (= res!1019920 (validKeyInArray!0 (select (arr!48242 a!2850) j!87)))))

(declare-fun b!1498847 () Bool)

(assert (=> b!1498847 (= e!839130 false)))

(declare-datatypes ((SeekEntryResult!12452 0))(
  ( (MissingZero!12452 (index!52200 (_ BitVec 32))) (Found!12452 (index!52201 (_ BitVec 32))) (Intermediate!12452 (undefined!13264 Bool) (index!52202 (_ BitVec 32)) (x!133894 (_ BitVec 32))) (Undefined!12452) (MissingVacant!12452 (index!52203 (_ BitVec 32))) )
))
(declare-fun lt!652672 () SeekEntryResult!12452)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99965 (_ BitVec 32)) SeekEntryResult!12452)

(assert (=> b!1498847 (= lt!652672 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48242 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127584 res!1019921) b!1498842))

(assert (= (and b!1498842 res!1019918) b!1498844))

(assert (= (and b!1498844 res!1019917) b!1498846))

(assert (= (and b!1498846 res!1019920) b!1498845))

(assert (= (and b!1498845 res!1019919) b!1498841))

(assert (= (and b!1498841 res!1019922) b!1498843))

(assert (= (and b!1498843 res!1019923) b!1498847))

(declare-fun m!1381993 () Bool)

(assert (=> b!1498841 m!1381993))

(declare-fun m!1381995 () Bool)

(assert (=> b!1498845 m!1381995))

(declare-fun m!1381997 () Bool)

(assert (=> b!1498846 m!1381997))

(assert (=> b!1498846 m!1381997))

(declare-fun m!1381999 () Bool)

(assert (=> b!1498846 m!1381999))

(declare-fun m!1382001 () Bool)

(assert (=> b!1498843 m!1382001))

(declare-fun m!1382003 () Bool)

(assert (=> b!1498843 m!1382003))

(declare-fun m!1382005 () Bool)

(assert (=> b!1498843 m!1382005))

(declare-fun m!1382007 () Bool)

(assert (=> start!127584 m!1382007))

(declare-fun m!1382009 () Bool)

(assert (=> start!127584 m!1382009))

(assert (=> b!1498847 m!1381997))

(assert (=> b!1498847 m!1381997))

(declare-fun m!1382011 () Bool)

(assert (=> b!1498847 m!1382011))

(declare-fun m!1382013 () Bool)

(assert (=> b!1498844 m!1382013))

(assert (=> b!1498844 m!1382013))

(declare-fun m!1382015 () Bool)

(assert (=> b!1498844 m!1382015))

(push 1)

(assert (not b!1498844))

(assert (not b!1498845))

(assert (not start!127584))

(assert (not b!1498846))

(assert (not b!1498847))

(assert (not b!1498841))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

