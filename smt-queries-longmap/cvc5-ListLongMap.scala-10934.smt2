; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127938 () Bool)

(assert start!127938)

(declare-fun b!1502931 () Bool)

(declare-fun res!1023813 () Bool)

(declare-fun e!840499 () Bool)

(assert (=> b!1502931 (=> (not res!1023813) (not e!840499))))

(declare-datatypes ((array!100253 0))(
  ( (array!100254 (arr!48383 (Array (_ BitVec 32) (_ BitVec 64))) (size!48933 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100253)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100253 (_ BitVec 32)) Bool)

(assert (=> b!1502931 (= res!1023813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502933 () Bool)

(declare-fun res!1023809 () Bool)

(assert (=> b!1502933 (=> (not res!1023809) (not e!840499))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502933 (= res!1023809 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48933 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48933 a!2850)) (= (select (arr!48383 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48383 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48933 a!2850))))))

(declare-fun b!1502934 () Bool)

(declare-fun res!1023811 () Bool)

(assert (=> b!1502934 (=> (not res!1023811) (not e!840499))))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12581 0))(
  ( (MissingZero!12581 (index!52716 (_ BitVec 32))) (Found!12581 (index!52717 (_ BitVec 32))) (Intermediate!12581 (undefined!13393 Bool) (index!52718 (_ BitVec 32)) (x!134405 (_ BitVec 32))) (Undefined!12581) (MissingVacant!12581 (index!52719 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100253 (_ BitVec 32)) SeekEntryResult!12581)

(assert (=> b!1502934 (= res!1023811 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48383 a!2850) j!87) a!2850 mask!2661) (Found!12581 j!87)))))

(declare-fun b!1502935 () Bool)

(declare-fun res!1023812 () Bool)

(assert (=> b!1502935 (=> (not res!1023812) (not e!840499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502935 (= res!1023812 (validKeyInArray!0 (select (arr!48383 a!2850) j!87)))))

(declare-fun b!1502936 () Bool)

(declare-fun res!1023816 () Bool)

(assert (=> b!1502936 (=> (not res!1023816) (not e!840499))))

(declare-datatypes ((List!34875 0))(
  ( (Nil!34872) (Cons!34871 (h!36268 (_ BitVec 64)) (t!49569 List!34875)) )
))
(declare-fun arrayNoDuplicates!0 (array!100253 (_ BitVec 32) List!34875) Bool)

(assert (=> b!1502936 (= res!1023816 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34872))))

(declare-fun b!1502937 () Bool)

(assert (=> b!1502937 (= e!840499 false)))

(declare-fun lt!653470 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502937 (= lt!653470 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1502932 () Bool)

(declare-fun res!1023810 () Bool)

(assert (=> b!1502932 (=> (not res!1023810) (not e!840499))))

(assert (=> b!1502932 (= res!1023810 (not (= (select (arr!48383 a!2850) index!625) (select (arr!48383 a!2850) j!87))))))

(declare-fun res!1023815 () Bool)

(assert (=> start!127938 (=> (not res!1023815) (not e!840499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127938 (= res!1023815 (validMask!0 mask!2661))))

(assert (=> start!127938 e!840499))

(assert (=> start!127938 true))

(declare-fun array_inv!37411 (array!100253) Bool)

(assert (=> start!127938 (array_inv!37411 a!2850)))

(declare-fun b!1502938 () Bool)

(declare-fun res!1023814 () Bool)

(assert (=> b!1502938 (=> (not res!1023814) (not e!840499))))

(assert (=> b!1502938 (= res!1023814 (and (= (size!48933 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48933 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48933 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502939 () Bool)

(declare-fun res!1023817 () Bool)

(assert (=> b!1502939 (=> (not res!1023817) (not e!840499))))

(assert (=> b!1502939 (= res!1023817 (validKeyInArray!0 (select (arr!48383 a!2850) i!996)))))

(assert (= (and start!127938 res!1023815) b!1502938))

(assert (= (and b!1502938 res!1023814) b!1502939))

(assert (= (and b!1502939 res!1023817) b!1502935))

(assert (= (and b!1502935 res!1023812) b!1502931))

(assert (= (and b!1502931 res!1023813) b!1502936))

(assert (= (and b!1502936 res!1023816) b!1502933))

(assert (= (and b!1502933 res!1023809) b!1502934))

(assert (= (and b!1502934 res!1023811) b!1502932))

(assert (= (and b!1502932 res!1023810) b!1502937))

(declare-fun m!1386163 () Bool)

(assert (=> b!1502933 m!1386163))

(declare-fun m!1386165 () Bool)

(assert (=> b!1502933 m!1386165))

(declare-fun m!1386167 () Bool)

(assert (=> b!1502933 m!1386167))

(declare-fun m!1386169 () Bool)

(assert (=> b!1502931 m!1386169))

(declare-fun m!1386171 () Bool)

(assert (=> b!1502936 m!1386171))

(declare-fun m!1386173 () Bool)

(assert (=> start!127938 m!1386173))

(declare-fun m!1386175 () Bool)

(assert (=> start!127938 m!1386175))

(declare-fun m!1386177 () Bool)

(assert (=> b!1502937 m!1386177))

(declare-fun m!1386179 () Bool)

(assert (=> b!1502934 m!1386179))

(assert (=> b!1502934 m!1386179))

(declare-fun m!1386181 () Bool)

(assert (=> b!1502934 m!1386181))

(declare-fun m!1386183 () Bool)

(assert (=> b!1502939 m!1386183))

(assert (=> b!1502939 m!1386183))

(declare-fun m!1386185 () Bool)

(assert (=> b!1502939 m!1386185))

(declare-fun m!1386187 () Bool)

(assert (=> b!1502932 m!1386187))

(assert (=> b!1502932 m!1386179))

(assert (=> b!1502935 m!1386179))

(assert (=> b!1502935 m!1386179))

(declare-fun m!1386189 () Bool)

(assert (=> b!1502935 m!1386189))

(push 1)

(assert (not b!1502935))

(assert (not start!127938))

(assert (not b!1502934))

(assert (not b!1502931))

(assert (not b!1502937))

(assert (not b!1502939))

(assert (not b!1502936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

