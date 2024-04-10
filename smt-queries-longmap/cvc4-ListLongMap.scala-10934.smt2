; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127942 () Bool)

(assert start!127942)

(declare-fun b!1502985 () Bool)

(declare-fun e!840511 () Bool)

(assert (=> b!1502985 (= e!840511 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun lt!653476 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502985 (= lt!653476 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1502986 () Bool)

(declare-fun res!1023867 () Bool)

(assert (=> b!1502986 (=> (not res!1023867) (not e!840511))))

(declare-datatypes ((array!100257 0))(
  ( (array!100258 (arr!48385 (Array (_ BitVec 32) (_ BitVec 64))) (size!48935 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100257)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100257 (_ BitVec 32)) Bool)

(assert (=> b!1502986 (= res!1023867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1023864 () Bool)

(assert (=> start!127942 (=> (not res!1023864) (not e!840511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127942 (= res!1023864 (validMask!0 mask!2661))))

(assert (=> start!127942 e!840511))

(assert (=> start!127942 true))

(declare-fun array_inv!37413 (array!100257) Bool)

(assert (=> start!127942 (array_inv!37413 a!2850)))

(declare-fun b!1502987 () Bool)

(declare-fun res!1023871 () Bool)

(assert (=> b!1502987 (=> (not res!1023871) (not e!840511))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502987 (= res!1023871 (not (= (select (arr!48385 a!2850) index!625) (select (arr!48385 a!2850) j!87))))))

(declare-fun b!1502988 () Bool)

(declare-fun res!1023870 () Bool)

(assert (=> b!1502988 (=> (not res!1023870) (not e!840511))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12583 0))(
  ( (MissingZero!12583 (index!52724 (_ BitVec 32))) (Found!12583 (index!52725 (_ BitVec 32))) (Intermediate!12583 (undefined!13395 Bool) (index!52726 (_ BitVec 32)) (x!134407 (_ BitVec 32))) (Undefined!12583) (MissingVacant!12583 (index!52727 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100257 (_ BitVec 32)) SeekEntryResult!12583)

(assert (=> b!1502988 (= res!1023870 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48385 a!2850) j!87) a!2850 mask!2661) (Found!12583 j!87)))))

(declare-fun b!1502989 () Bool)

(declare-fun res!1023865 () Bool)

(assert (=> b!1502989 (=> (not res!1023865) (not e!840511))))

(declare-datatypes ((List!34877 0))(
  ( (Nil!34874) (Cons!34873 (h!36270 (_ BitVec 64)) (t!49571 List!34877)) )
))
(declare-fun arrayNoDuplicates!0 (array!100257 (_ BitVec 32) List!34877) Bool)

(assert (=> b!1502989 (= res!1023865 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34874))))

(declare-fun b!1502990 () Bool)

(declare-fun res!1023863 () Bool)

(assert (=> b!1502990 (=> (not res!1023863) (not e!840511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502990 (= res!1023863 (validKeyInArray!0 (select (arr!48385 a!2850) j!87)))))

(declare-fun b!1502991 () Bool)

(declare-fun res!1023868 () Bool)

(assert (=> b!1502991 (=> (not res!1023868) (not e!840511))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1502991 (= res!1023868 (validKeyInArray!0 (select (arr!48385 a!2850) i!996)))))

(declare-fun b!1502992 () Bool)

(declare-fun res!1023869 () Bool)

(assert (=> b!1502992 (=> (not res!1023869) (not e!840511))))

(assert (=> b!1502992 (= res!1023869 (and (= (size!48935 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48935 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48935 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502993 () Bool)

(declare-fun res!1023866 () Bool)

(assert (=> b!1502993 (=> (not res!1023866) (not e!840511))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502993 (= res!1023866 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48935 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48935 a!2850)) (= (select (arr!48385 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48385 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48935 a!2850))))))

(assert (= (and start!127942 res!1023864) b!1502992))

(assert (= (and b!1502992 res!1023869) b!1502991))

(assert (= (and b!1502991 res!1023868) b!1502990))

(assert (= (and b!1502990 res!1023863) b!1502986))

(assert (= (and b!1502986 res!1023867) b!1502989))

(assert (= (and b!1502989 res!1023865) b!1502993))

(assert (= (and b!1502993 res!1023866) b!1502988))

(assert (= (and b!1502988 res!1023870) b!1502987))

(assert (= (and b!1502987 res!1023871) b!1502985))

(declare-fun m!1386219 () Bool)

(assert (=> b!1502991 m!1386219))

(assert (=> b!1502991 m!1386219))

(declare-fun m!1386221 () Bool)

(assert (=> b!1502991 m!1386221))

(declare-fun m!1386223 () Bool)

(assert (=> b!1502990 m!1386223))

(assert (=> b!1502990 m!1386223))

(declare-fun m!1386225 () Bool)

(assert (=> b!1502990 m!1386225))

(declare-fun m!1386227 () Bool)

(assert (=> start!127942 m!1386227))

(declare-fun m!1386229 () Bool)

(assert (=> start!127942 m!1386229))

(declare-fun m!1386231 () Bool)

(assert (=> b!1502993 m!1386231))

(declare-fun m!1386233 () Bool)

(assert (=> b!1502993 m!1386233))

(declare-fun m!1386235 () Bool)

(assert (=> b!1502993 m!1386235))

(declare-fun m!1386237 () Bool)

(assert (=> b!1502986 m!1386237))

(declare-fun m!1386239 () Bool)

(assert (=> b!1502989 m!1386239))

(declare-fun m!1386241 () Bool)

(assert (=> b!1502987 m!1386241))

(assert (=> b!1502987 m!1386223))

(declare-fun m!1386243 () Bool)

(assert (=> b!1502985 m!1386243))

(assert (=> b!1502988 m!1386223))

(assert (=> b!1502988 m!1386223))

(declare-fun m!1386245 () Bool)

(assert (=> b!1502988 m!1386245))

(push 1)

(assert (not start!127942))

(assert (not b!1502985))

(assert (not b!1502986))

(assert (not b!1502988))

(assert (not b!1502991))

(assert (not b!1502990))

(assert (not b!1502989))

(check-sat)

(pop 1)

(push 1)

(check-sat)

