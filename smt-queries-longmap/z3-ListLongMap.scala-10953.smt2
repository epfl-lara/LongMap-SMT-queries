; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128180 () Bool)

(assert start!128180)

(declare-fun b!1504975 () Bool)

(declare-fun res!1025565 () Bool)

(declare-fun e!841191 () Bool)

(assert (=> b!1504975 (=> (not res!1025565) (not e!841191))))

(declare-datatypes ((array!100378 0))(
  ( (array!100379 (arr!48441 (Array (_ BitVec 32) (_ BitVec 64))) (size!48991 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100378)

(declare-datatypes ((List!34933 0))(
  ( (Nil!34930) (Cons!34929 (h!36326 (_ BitVec 64)) (t!49627 List!34933)) )
))
(declare-fun arrayNoDuplicates!0 (array!100378 (_ BitVec 32) List!34933) Bool)

(assert (=> b!1504975 (= res!1025565 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34930))))

(declare-fun b!1504976 () Bool)

(declare-fun res!1025572 () Bool)

(assert (=> b!1504976 (=> (not res!1025572) (not e!841191))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504976 (= res!1025572 (validKeyInArray!0 (select (arr!48441 a!2850) j!87)))))

(declare-fun res!1025573 () Bool)

(assert (=> start!128180 (=> (not res!1025573) (not e!841191))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128180 (= res!1025573 (validMask!0 mask!2661))))

(assert (=> start!128180 e!841191))

(assert (=> start!128180 true))

(declare-fun array_inv!37469 (array!100378) Bool)

(assert (=> start!128180 (array_inv!37469 a!2850)))

(declare-fun b!1504977 () Bool)

(declare-fun res!1025574 () Bool)

(assert (=> b!1504977 (=> (not res!1025574) (not e!841191))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1504977 (= res!1025574 (validKeyInArray!0 (select (arr!48441 a!2850) i!996)))))

(declare-fun b!1504978 () Bool)

(declare-fun res!1025575 () Bool)

(assert (=> b!1504978 (=> (not res!1025575) (not e!841191))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504978 (= res!1025575 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48991 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48991 a!2850)) (= (select (arr!48441 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48441 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48991 a!2850))))))

(declare-fun b!1504979 () Bool)

(declare-fun res!1025566 () Bool)

(assert (=> b!1504979 (=> (not res!1025566) (not e!841191))))

(assert (=> b!1504979 (= res!1025566 (and (= (size!48991 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48991 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48991 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504980 () Bool)

(declare-fun e!841190 () Bool)

(assert (=> b!1504980 (= e!841191 e!841190)))

(declare-fun res!1025570 () Bool)

(assert (=> b!1504980 (=> (not res!1025570) (not e!841190))))

(declare-datatypes ((SeekEntryResult!12639 0))(
  ( (MissingZero!12639 (index!52948 (_ BitVec 32))) (Found!12639 (index!52949 (_ BitVec 32))) (Intermediate!12639 (undefined!13451 Bool) (index!52950 (_ BitVec 32)) (x!134633 (_ BitVec 32))) (Undefined!12639) (MissingVacant!12639 (index!52951 (_ BitVec 32))) )
))
(declare-fun lt!653858 () SeekEntryResult!12639)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100378 (_ BitVec 32)) SeekEntryResult!12639)

(assert (=> b!1504980 (= res!1025570 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48441 a!2850) j!87) a!2850 mask!2661) lt!653858))))

(assert (=> b!1504980 (= lt!653858 (Found!12639 j!87))))

(declare-fun b!1504981 () Bool)

(declare-fun res!1025567 () Bool)

(assert (=> b!1504981 (=> (not res!1025567) (not e!841191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100378 (_ BitVec 32)) Bool)

(assert (=> b!1504981 (= res!1025567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504982 () Bool)

(declare-fun res!1025569 () Bool)

(declare-fun e!841189 () Bool)

(assert (=> b!1504982 (=> (not res!1025569) (not e!841189))))

(declare-fun lt!653859 () (_ BitVec 32))

(assert (=> b!1504982 (= res!1025569 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653859 vacantBefore!10 (select (arr!48441 a!2850) j!87) a!2850 mask!2661) lt!653858))))

(declare-fun b!1504983 () Bool)

(declare-fun res!1025568 () Bool)

(assert (=> b!1504983 (=> (not res!1025568) (not e!841190))))

(assert (=> b!1504983 (= res!1025568 (not (= (select (arr!48441 a!2850) index!625) (select (arr!48441 a!2850) j!87))))))

(declare-fun b!1504984 () Bool)

(assert (=> b!1504984 (= e!841190 e!841189)))

(declare-fun res!1025571 () Bool)

(assert (=> b!1504984 (=> (not res!1025571) (not e!841189))))

(assert (=> b!1504984 (= res!1025571 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653859 #b00000000000000000000000000000000) (bvslt lt!653859 (size!48991 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504984 (= lt!653859 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504985 () Bool)

(assert (=> b!1504985 (= e!841189 (not true))))

(assert (=> b!1504985 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653859 vacantAfter!10 (select (store (arr!48441 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100379 (store (arr!48441 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48991 a!2850)) mask!2661) lt!653858)))

(declare-datatypes ((Unit!50284 0))(
  ( (Unit!50285) )
))
(declare-fun lt!653860 () Unit!50284)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50284)

(assert (=> b!1504985 (= lt!653860 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653859 vacantBefore!10 vacantAfter!10 mask!2661))))

(assert (= (and start!128180 res!1025573) b!1504979))

(assert (= (and b!1504979 res!1025566) b!1504977))

(assert (= (and b!1504977 res!1025574) b!1504976))

(assert (= (and b!1504976 res!1025572) b!1504981))

(assert (= (and b!1504981 res!1025567) b!1504975))

(assert (= (and b!1504975 res!1025565) b!1504978))

(assert (= (and b!1504978 res!1025575) b!1504980))

(assert (= (and b!1504980 res!1025570) b!1504983))

(assert (= (and b!1504983 res!1025568) b!1504984))

(assert (= (and b!1504984 res!1025571) b!1504982))

(assert (= (and b!1504982 res!1025569) b!1504985))

(declare-fun m!1388077 () Bool)

(assert (=> b!1504982 m!1388077))

(assert (=> b!1504982 m!1388077))

(declare-fun m!1388079 () Bool)

(assert (=> b!1504982 m!1388079))

(declare-fun m!1388081 () Bool)

(assert (=> b!1504975 m!1388081))

(declare-fun m!1388083 () Bool)

(assert (=> b!1504977 m!1388083))

(assert (=> b!1504977 m!1388083))

(declare-fun m!1388085 () Bool)

(assert (=> b!1504977 m!1388085))

(declare-fun m!1388087 () Bool)

(assert (=> b!1504984 m!1388087))

(assert (=> b!1504980 m!1388077))

(assert (=> b!1504980 m!1388077))

(declare-fun m!1388089 () Bool)

(assert (=> b!1504980 m!1388089))

(declare-fun m!1388091 () Bool)

(assert (=> start!128180 m!1388091))

(declare-fun m!1388093 () Bool)

(assert (=> start!128180 m!1388093))

(declare-fun m!1388095 () Bool)

(assert (=> b!1504978 m!1388095))

(declare-fun m!1388097 () Bool)

(assert (=> b!1504978 m!1388097))

(declare-fun m!1388099 () Bool)

(assert (=> b!1504978 m!1388099))

(declare-fun m!1388101 () Bool)

(assert (=> b!1504981 m!1388101))

(assert (=> b!1504976 m!1388077))

(assert (=> b!1504976 m!1388077))

(declare-fun m!1388103 () Bool)

(assert (=> b!1504976 m!1388103))

(assert (=> b!1504985 m!1388097))

(declare-fun m!1388105 () Bool)

(assert (=> b!1504985 m!1388105))

(assert (=> b!1504985 m!1388105))

(declare-fun m!1388107 () Bool)

(assert (=> b!1504985 m!1388107))

(declare-fun m!1388109 () Bool)

(assert (=> b!1504985 m!1388109))

(declare-fun m!1388111 () Bool)

(assert (=> b!1504983 m!1388111))

(assert (=> b!1504983 m!1388077))

(check-sat (not b!1504982) (not b!1504984) (not b!1504980) (not b!1504985) (not b!1504981) (not b!1504975) (not start!128180) (not b!1504977) (not b!1504976))
(check-sat)
