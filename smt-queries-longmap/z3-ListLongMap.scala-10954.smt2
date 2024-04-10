; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128186 () Bool)

(assert start!128186)

(declare-fun b!1505074 () Bool)

(declare-fun e!841227 () Bool)

(declare-fun e!841225 () Bool)

(assert (=> b!1505074 (= e!841227 e!841225)))

(declare-fun res!1025673 () Bool)

(assert (=> b!1505074 (=> (not res!1025673) (not e!841225))))

(declare-datatypes ((array!100384 0))(
  ( (array!100385 (arr!48444 (Array (_ BitVec 32) (_ BitVec 64))) (size!48994 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100384)

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653885 () (_ BitVec 32))

(assert (=> b!1505074 (= res!1025673 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653885 #b00000000000000000000000000000000) (bvslt lt!653885 (size!48994 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505074 (= lt!653885 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1505075 () Bool)

(declare-fun res!1025670 () Bool)

(declare-fun e!841226 () Bool)

(assert (=> b!1505075 (=> (not res!1025670) (not e!841226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100384 (_ BitVec 32)) Bool)

(assert (=> b!1505075 (= res!1025670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1505076 () Bool)

(assert (=> b!1505076 (= e!841225 (not true))))

(declare-fun i!996 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12642 0))(
  ( (MissingZero!12642 (index!52960 (_ BitVec 32))) (Found!12642 (index!52961 (_ BitVec 32))) (Intermediate!12642 (undefined!13454 Bool) (index!52962 (_ BitVec 32)) (x!134644 (_ BitVec 32))) (Undefined!12642) (MissingVacant!12642 (index!52963 (_ BitVec 32))) )
))
(declare-fun lt!653886 () SeekEntryResult!12642)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100384 (_ BitVec 32)) SeekEntryResult!12642)

(assert (=> b!1505076 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653885 vacantAfter!10 (select (store (arr!48444 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100385 (store (arr!48444 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48994 a!2850)) mask!2661) lt!653886)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((Unit!50290 0))(
  ( (Unit!50291) )
))
(declare-fun lt!653887 () Unit!50290)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50290)

(assert (=> b!1505076 (= lt!653887 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653885 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun res!1025671 () Bool)

(assert (=> start!128186 (=> (not res!1025671) (not e!841226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128186 (= res!1025671 (validMask!0 mask!2661))))

(assert (=> start!128186 e!841226))

(assert (=> start!128186 true))

(declare-fun array_inv!37472 (array!100384) Bool)

(assert (=> start!128186 (array_inv!37472 a!2850)))

(declare-fun b!1505077 () Bool)

(declare-fun res!1025666 () Bool)

(assert (=> b!1505077 (=> (not res!1025666) (not e!841226))))

(assert (=> b!1505077 (= res!1025666 (and (= (size!48994 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48994 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48994 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1505078 () Bool)

(declare-fun res!1025667 () Bool)

(assert (=> b!1505078 (=> (not res!1025667) (not e!841226))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505078 (= res!1025667 (validKeyInArray!0 (select (arr!48444 a!2850) i!996)))))

(declare-fun b!1505079 () Bool)

(declare-fun res!1025664 () Bool)

(assert (=> b!1505079 (=> (not res!1025664) (not e!841226))))

(assert (=> b!1505079 (= res!1025664 (validKeyInArray!0 (select (arr!48444 a!2850) j!87)))))

(declare-fun b!1505080 () Bool)

(declare-fun res!1025668 () Bool)

(assert (=> b!1505080 (=> (not res!1025668) (not e!841226))))

(declare-datatypes ((List!34936 0))(
  ( (Nil!34933) (Cons!34932 (h!36329 (_ BitVec 64)) (t!49630 List!34936)) )
))
(declare-fun arrayNoDuplicates!0 (array!100384 (_ BitVec 32) List!34936) Bool)

(assert (=> b!1505080 (= res!1025668 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34933))))

(declare-fun b!1505081 () Bool)

(declare-fun res!1025669 () Bool)

(assert (=> b!1505081 (=> (not res!1025669) (not e!841225))))

(assert (=> b!1505081 (= res!1025669 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653885 vacantBefore!10 (select (arr!48444 a!2850) j!87) a!2850 mask!2661) lt!653886))))

(declare-fun b!1505082 () Bool)

(declare-fun res!1025665 () Bool)

(assert (=> b!1505082 (=> (not res!1025665) (not e!841226))))

(assert (=> b!1505082 (= res!1025665 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48994 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48994 a!2850)) (= (select (arr!48444 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48444 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48994 a!2850))))))

(declare-fun b!1505083 () Bool)

(declare-fun res!1025672 () Bool)

(assert (=> b!1505083 (=> (not res!1025672) (not e!841227))))

(assert (=> b!1505083 (= res!1025672 (not (= (select (arr!48444 a!2850) index!625) (select (arr!48444 a!2850) j!87))))))

(declare-fun b!1505084 () Bool)

(assert (=> b!1505084 (= e!841226 e!841227)))

(declare-fun res!1025674 () Bool)

(assert (=> b!1505084 (=> (not res!1025674) (not e!841227))))

(assert (=> b!1505084 (= res!1025674 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48444 a!2850) j!87) a!2850 mask!2661) lt!653886))))

(assert (=> b!1505084 (= lt!653886 (Found!12642 j!87))))

(assert (= (and start!128186 res!1025671) b!1505077))

(assert (= (and b!1505077 res!1025666) b!1505078))

(assert (= (and b!1505078 res!1025667) b!1505079))

(assert (= (and b!1505079 res!1025664) b!1505075))

(assert (= (and b!1505075 res!1025670) b!1505080))

(assert (= (and b!1505080 res!1025668) b!1505082))

(assert (= (and b!1505082 res!1025665) b!1505084))

(assert (= (and b!1505084 res!1025674) b!1505083))

(assert (= (and b!1505083 res!1025672) b!1505074))

(assert (= (and b!1505074 res!1025673) b!1505081))

(assert (= (and b!1505081 res!1025669) b!1505076))

(declare-fun m!1388185 () Bool)

(assert (=> b!1505080 m!1388185))

(declare-fun m!1388187 () Bool)

(assert (=> b!1505083 m!1388187))

(declare-fun m!1388189 () Bool)

(assert (=> b!1505083 m!1388189))

(assert (=> b!1505081 m!1388189))

(assert (=> b!1505081 m!1388189))

(declare-fun m!1388191 () Bool)

(assert (=> b!1505081 m!1388191))

(assert (=> b!1505079 m!1388189))

(assert (=> b!1505079 m!1388189))

(declare-fun m!1388193 () Bool)

(assert (=> b!1505079 m!1388193))

(assert (=> b!1505084 m!1388189))

(assert (=> b!1505084 m!1388189))

(declare-fun m!1388195 () Bool)

(assert (=> b!1505084 m!1388195))

(declare-fun m!1388197 () Bool)

(assert (=> b!1505074 m!1388197))

(declare-fun m!1388199 () Bool)

(assert (=> b!1505082 m!1388199))

(declare-fun m!1388201 () Bool)

(assert (=> b!1505082 m!1388201))

(declare-fun m!1388203 () Bool)

(assert (=> b!1505082 m!1388203))

(declare-fun m!1388205 () Bool)

(assert (=> b!1505075 m!1388205))

(assert (=> b!1505076 m!1388201))

(declare-fun m!1388207 () Bool)

(assert (=> b!1505076 m!1388207))

(assert (=> b!1505076 m!1388207))

(declare-fun m!1388209 () Bool)

(assert (=> b!1505076 m!1388209))

(declare-fun m!1388211 () Bool)

(assert (=> b!1505076 m!1388211))

(declare-fun m!1388213 () Bool)

(assert (=> start!128186 m!1388213))

(declare-fun m!1388215 () Bool)

(assert (=> start!128186 m!1388215))

(declare-fun m!1388217 () Bool)

(assert (=> b!1505078 m!1388217))

(assert (=> b!1505078 m!1388217))

(declare-fun m!1388219 () Bool)

(assert (=> b!1505078 m!1388219))

(check-sat (not b!1505075) (not start!128186) (not b!1505078) (not b!1505081) (not b!1505079) (not b!1505076) (not b!1505074) (not b!1505080) (not b!1505084))
