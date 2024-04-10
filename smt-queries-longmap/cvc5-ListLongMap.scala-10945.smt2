; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128046 () Bool)

(assert start!128046)

(declare-fun b!1503957 () Bool)

(declare-fun res!1024750 () Bool)

(declare-fun e!840786 () Bool)

(assert (=> b!1503957 (=> (not res!1024750) (not e!840786))))

(declare-datatypes ((array!100322 0))(
  ( (array!100323 (arr!48416 (Array (_ BitVec 32) (_ BitVec 64))) (size!48966 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100322)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503957 (= res!1024750 (validKeyInArray!0 (select (arr!48416 a!2850) i!996)))))

(declare-fun b!1503959 () Bool)

(declare-fun res!1024745 () Bool)

(assert (=> b!1503959 (=> (not res!1024745) (not e!840786))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503959 (= res!1024745 (and (= (size!48966 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48966 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48966 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503960 () Bool)

(assert (=> b!1503960 (= e!840786 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653623 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503960 (= lt!653623 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503961 () Bool)

(declare-fun res!1024753 () Bool)

(assert (=> b!1503961 (=> (not res!1024753) (not e!840786))))

(assert (=> b!1503961 (= res!1024753 (validKeyInArray!0 (select (arr!48416 a!2850) j!87)))))

(declare-fun b!1503962 () Bool)

(declare-fun res!1024749 () Bool)

(assert (=> b!1503962 (=> (not res!1024749) (not e!840786))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503962 (= res!1024749 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48966 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48966 a!2850)) (= (select (arr!48416 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48416 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48966 a!2850))))))

(declare-fun b!1503963 () Bool)

(declare-fun res!1024751 () Bool)

(assert (=> b!1503963 (=> (not res!1024751) (not e!840786))))

(declare-datatypes ((SeekEntryResult!12614 0))(
  ( (MissingZero!12614 (index!52848 (_ BitVec 32))) (Found!12614 (index!52849 (_ BitVec 32))) (Intermediate!12614 (undefined!13426 Bool) (index!52850 (_ BitVec 32)) (x!134532 (_ BitVec 32))) (Undefined!12614) (MissingVacant!12614 (index!52851 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100322 (_ BitVec 32)) SeekEntryResult!12614)

(assert (=> b!1503963 (= res!1024751 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48416 a!2850) j!87) a!2850 mask!2661) (Found!12614 j!87)))))

(declare-fun b!1503964 () Bool)

(declare-fun res!1024748 () Bool)

(assert (=> b!1503964 (=> (not res!1024748) (not e!840786))))

(declare-datatypes ((List!34908 0))(
  ( (Nil!34905) (Cons!34904 (h!36301 (_ BitVec 64)) (t!49602 List!34908)) )
))
(declare-fun arrayNoDuplicates!0 (array!100322 (_ BitVec 32) List!34908) Bool)

(assert (=> b!1503964 (= res!1024748 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34905))))

(declare-fun b!1503965 () Bool)

(declare-fun res!1024752 () Bool)

(assert (=> b!1503965 (=> (not res!1024752) (not e!840786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100322 (_ BitVec 32)) Bool)

(assert (=> b!1503965 (= res!1024752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503958 () Bool)

(declare-fun res!1024746 () Bool)

(assert (=> b!1503958 (=> (not res!1024746) (not e!840786))))

(assert (=> b!1503958 (= res!1024746 (not (= (select (arr!48416 a!2850) index!625) (select (arr!48416 a!2850) j!87))))))

(declare-fun res!1024747 () Bool)

(assert (=> start!128046 (=> (not res!1024747) (not e!840786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128046 (= res!1024747 (validMask!0 mask!2661))))

(assert (=> start!128046 e!840786))

(assert (=> start!128046 true))

(declare-fun array_inv!37444 (array!100322) Bool)

(assert (=> start!128046 (array_inv!37444 a!2850)))

(assert (= (and start!128046 res!1024747) b!1503959))

(assert (= (and b!1503959 res!1024745) b!1503957))

(assert (= (and b!1503957 res!1024750) b!1503961))

(assert (= (and b!1503961 res!1024753) b!1503965))

(assert (= (and b!1503965 res!1024752) b!1503964))

(assert (= (and b!1503964 res!1024748) b!1503962))

(assert (= (and b!1503962 res!1024749) b!1503963))

(assert (= (and b!1503963 res!1024751) b!1503958))

(assert (= (and b!1503958 res!1024746) b!1503960))

(declare-fun m!1387159 () Bool)

(assert (=> b!1503957 m!1387159))

(assert (=> b!1503957 m!1387159))

(declare-fun m!1387161 () Bool)

(assert (=> b!1503957 m!1387161))

(declare-fun m!1387163 () Bool)

(assert (=> b!1503963 m!1387163))

(assert (=> b!1503963 m!1387163))

(declare-fun m!1387165 () Bool)

(assert (=> b!1503963 m!1387165))

(declare-fun m!1387167 () Bool)

(assert (=> b!1503965 m!1387167))

(declare-fun m!1387169 () Bool)

(assert (=> b!1503964 m!1387169))

(declare-fun m!1387171 () Bool)

(assert (=> b!1503960 m!1387171))

(declare-fun m!1387173 () Bool)

(assert (=> start!128046 m!1387173))

(declare-fun m!1387175 () Bool)

(assert (=> start!128046 m!1387175))

(declare-fun m!1387177 () Bool)

(assert (=> b!1503958 m!1387177))

(assert (=> b!1503958 m!1387163))

(declare-fun m!1387179 () Bool)

(assert (=> b!1503962 m!1387179))

(declare-fun m!1387181 () Bool)

(assert (=> b!1503962 m!1387181))

(declare-fun m!1387183 () Bool)

(assert (=> b!1503962 m!1387183))

(assert (=> b!1503961 m!1387163))

(assert (=> b!1503961 m!1387163))

(declare-fun m!1387185 () Bool)

(assert (=> b!1503961 m!1387185))

(push 1)

(assert (not b!1503957))

(assert (not b!1503960))

(assert (not start!128046))

(assert (not b!1503964))

(assert (not b!1503965))

(assert (not b!1503963))

(assert (not b!1503961))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

