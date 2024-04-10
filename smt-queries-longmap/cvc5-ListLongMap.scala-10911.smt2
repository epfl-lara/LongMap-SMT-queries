; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127728 () Bool)

(assert start!127728)

(declare-fun b!1500881 () Bool)

(declare-fun res!1021961 () Bool)

(declare-fun e!839727 () Bool)

(assert (=> b!1500881 (=> (not res!1021961) (not e!839727))))

(declare-datatypes ((array!100109 0))(
  ( (array!100110 (arr!48314 (Array (_ BitVec 32) (_ BitVec 64))) (size!48864 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100109)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100109 (_ BitVec 32)) Bool)

(assert (=> b!1500881 (= res!1021961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500882 () Bool)

(declare-fun res!1021963 () Bool)

(assert (=> b!1500882 (=> (not res!1021963) (not e!839727))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500882 (= res!1021963 (validKeyInArray!0 (select (arr!48314 a!2850) i!996)))))

(declare-fun b!1500883 () Bool)

(declare-fun e!839726 () Bool)

(assert (=> b!1500883 (= e!839727 e!839726)))

(declare-fun res!1021966 () Bool)

(assert (=> b!1500883 (=> (not res!1021966) (not e!839726))))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653026 () (_ BitVec 32))

(assert (=> b!1500883 (= res!1021966 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653026 #b00000000000000000000000000000000) (bvslt lt!653026 (size!48864 a!2850))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500883 (= lt!653026 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500884 () Bool)

(declare-fun res!1021965 () Bool)

(assert (=> b!1500884 (=> (not res!1021965) (not e!839727))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500884 (= res!1021965 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48864 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48864 a!2850)) (= (select (arr!48314 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48314 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48864 a!2850))))))

(declare-fun b!1500885 () Bool)

(declare-fun res!1021962 () Bool)

(assert (=> b!1500885 (=> (not res!1021962) (not e!839727))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500885 (= res!1021962 (not (= (select (arr!48314 a!2850) index!625) (select (arr!48314 a!2850) j!87))))))

(declare-fun b!1500886 () Bool)

(assert (=> b!1500886 (= e!839726 false)))

(declare-datatypes ((SeekEntryResult!12524 0))(
  ( (MissingZero!12524 (index!52488 (_ BitVec 32))) (Found!12524 (index!52489 (_ BitVec 32))) (Intermediate!12524 (undefined!13336 Bool) (index!52490 (_ BitVec 32)) (x!134158 (_ BitVec 32))) (Undefined!12524) (MissingVacant!12524 (index!52491 (_ BitVec 32))) )
))
(declare-fun lt!653025 () SeekEntryResult!12524)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100109 (_ BitVec 32)) SeekEntryResult!12524)

(assert (=> b!1500886 (= lt!653025 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653026 vacantBefore!10 (select (arr!48314 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500887 () Bool)

(declare-fun res!1021957 () Bool)

(assert (=> b!1500887 (=> (not res!1021957) (not e!839727))))

(declare-datatypes ((List!34806 0))(
  ( (Nil!34803) (Cons!34802 (h!36199 (_ BitVec 64)) (t!49500 List!34806)) )
))
(declare-fun arrayNoDuplicates!0 (array!100109 (_ BitVec 32) List!34806) Bool)

(assert (=> b!1500887 (= res!1021957 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34803))))

(declare-fun b!1500889 () Bool)

(declare-fun res!1021964 () Bool)

(assert (=> b!1500889 (=> (not res!1021964) (not e!839727))))

(assert (=> b!1500889 (= res!1021964 (and (= (size!48864 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48864 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48864 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500890 () Bool)

(declare-fun res!1021960 () Bool)

(assert (=> b!1500890 (=> (not res!1021960) (not e!839727))))

(assert (=> b!1500890 (= res!1021960 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48314 a!2850) j!87) a!2850 mask!2661) (Found!12524 j!87)))))

(declare-fun b!1500888 () Bool)

(declare-fun res!1021959 () Bool)

(assert (=> b!1500888 (=> (not res!1021959) (not e!839727))))

(assert (=> b!1500888 (= res!1021959 (validKeyInArray!0 (select (arr!48314 a!2850) j!87)))))

(declare-fun res!1021958 () Bool)

(assert (=> start!127728 (=> (not res!1021958) (not e!839727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127728 (= res!1021958 (validMask!0 mask!2661))))

(assert (=> start!127728 e!839727))

(assert (=> start!127728 true))

(declare-fun array_inv!37342 (array!100109) Bool)

(assert (=> start!127728 (array_inv!37342 a!2850)))

(assert (= (and start!127728 res!1021958) b!1500889))

(assert (= (and b!1500889 res!1021964) b!1500882))

(assert (= (and b!1500882 res!1021963) b!1500888))

(assert (= (and b!1500888 res!1021959) b!1500881))

(assert (= (and b!1500881 res!1021961) b!1500887))

(assert (= (and b!1500887 res!1021957) b!1500884))

(assert (= (and b!1500884 res!1021965) b!1500890))

(assert (= (and b!1500890 res!1021960) b!1500885))

(assert (= (and b!1500885 res!1021962) b!1500883))

(assert (= (and b!1500883 res!1021966) b!1500886))

(declare-fun m!1384075 () Bool)

(assert (=> b!1500886 m!1384075))

(assert (=> b!1500886 m!1384075))

(declare-fun m!1384077 () Bool)

(assert (=> b!1500886 m!1384077))

(declare-fun m!1384079 () Bool)

(assert (=> b!1500883 m!1384079))

(declare-fun m!1384081 () Bool)

(assert (=> b!1500882 m!1384081))

(assert (=> b!1500882 m!1384081))

(declare-fun m!1384083 () Bool)

(assert (=> b!1500882 m!1384083))

(assert (=> b!1500890 m!1384075))

(assert (=> b!1500890 m!1384075))

(declare-fun m!1384085 () Bool)

(assert (=> b!1500890 m!1384085))

(declare-fun m!1384087 () Bool)

(assert (=> b!1500884 m!1384087))

(declare-fun m!1384089 () Bool)

(assert (=> b!1500884 m!1384089))

(declare-fun m!1384091 () Bool)

(assert (=> b!1500884 m!1384091))

(assert (=> b!1500888 m!1384075))

(assert (=> b!1500888 m!1384075))

(declare-fun m!1384093 () Bool)

(assert (=> b!1500888 m!1384093))

(declare-fun m!1384095 () Bool)

(assert (=> b!1500887 m!1384095))

(declare-fun m!1384097 () Bool)

(assert (=> b!1500885 m!1384097))

(assert (=> b!1500885 m!1384075))

(declare-fun m!1384099 () Bool)

(assert (=> b!1500881 m!1384099))

(declare-fun m!1384101 () Bool)

(assert (=> start!127728 m!1384101))

(declare-fun m!1384103 () Bool)

(assert (=> start!127728 m!1384103))

(push 1)

