; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127882 () Bool)

(assert start!127882)

(declare-fun b!1502510 () Bool)

(declare-fun e!840330 () Bool)

(assert (=> b!1502510 (= e!840330 false)))

(declare-datatypes ((SeekEntryResult!12571 0))(
  ( (MissingZero!12571 (index!52676 (_ BitVec 32))) (Found!12571 (index!52677 (_ BitVec 32))) (Intermediate!12571 (undefined!13383 Bool) (index!52678 (_ BitVec 32)) (x!134360 (_ BitVec 32))) (Undefined!12571) (MissingVacant!12571 (index!52679 (_ BitVec 32))) )
))
(declare-fun lt!653389 () SeekEntryResult!12571)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100230 0))(
  ( (array!100231 (arr!48373 (Array (_ BitVec 32) (_ BitVec 64))) (size!48923 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100230)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100230 (_ BitVec 32)) SeekEntryResult!12571)

(assert (=> b!1502510 (= lt!653389 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48373 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502511 () Bool)

(declare-fun res!1023500 () Bool)

(assert (=> b!1502511 (=> (not res!1023500) (not e!840330))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502511 (= res!1023500 (validKeyInArray!0 (select (arr!48373 a!2850) i!996)))))

(declare-fun b!1502512 () Bool)

(declare-fun res!1023498 () Bool)

(assert (=> b!1502512 (=> (not res!1023498) (not e!840330))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502512 (= res!1023498 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48923 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48923 a!2850)) (= (select (arr!48373 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48373 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48923 a!2850))))))

(declare-fun b!1502513 () Bool)

(declare-fun res!1023502 () Bool)

(assert (=> b!1502513 (=> (not res!1023502) (not e!840330))))

(assert (=> b!1502513 (= res!1023502 (and (= (size!48923 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48923 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48923 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502514 () Bool)

(declare-fun res!1023497 () Bool)

(assert (=> b!1502514 (=> (not res!1023497) (not e!840330))))

(assert (=> b!1502514 (= res!1023497 (validKeyInArray!0 (select (arr!48373 a!2850) j!87)))))

(declare-fun res!1023499 () Bool)

(assert (=> start!127882 (=> (not res!1023499) (not e!840330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127882 (= res!1023499 (validMask!0 mask!2661))))

(assert (=> start!127882 e!840330))

(assert (=> start!127882 true))

(declare-fun array_inv!37401 (array!100230) Bool)

(assert (=> start!127882 (array_inv!37401 a!2850)))

(declare-fun b!1502515 () Bool)

(declare-fun res!1023496 () Bool)

(assert (=> b!1502515 (=> (not res!1023496) (not e!840330))))

(declare-datatypes ((List!34865 0))(
  ( (Nil!34862) (Cons!34861 (h!36258 (_ BitVec 64)) (t!49559 List!34865)) )
))
(declare-fun arrayNoDuplicates!0 (array!100230 (_ BitVec 32) List!34865) Bool)

(assert (=> b!1502515 (= res!1023496 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34862))))

(declare-fun b!1502516 () Bool)

(declare-fun res!1023501 () Bool)

(assert (=> b!1502516 (=> (not res!1023501) (not e!840330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100230 (_ BitVec 32)) Bool)

(assert (=> b!1502516 (= res!1023501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127882 res!1023499) b!1502513))

(assert (= (and b!1502513 res!1023502) b!1502511))

(assert (= (and b!1502511 res!1023500) b!1502514))

(assert (= (and b!1502514 res!1023497) b!1502516))

(assert (= (and b!1502516 res!1023501) b!1502515))

(assert (= (and b!1502515 res!1023496) b!1502512))

(assert (= (and b!1502512 res!1023498) b!1502510))

(declare-fun m!1385785 () Bool)

(assert (=> b!1502515 m!1385785))

(declare-fun m!1385787 () Bool)

(assert (=> start!127882 m!1385787))

(declare-fun m!1385789 () Bool)

(assert (=> start!127882 m!1385789))

(declare-fun m!1385791 () Bool)

(assert (=> b!1502511 m!1385791))

(assert (=> b!1502511 m!1385791))

(declare-fun m!1385793 () Bool)

(assert (=> b!1502511 m!1385793))

(declare-fun m!1385795 () Bool)

(assert (=> b!1502512 m!1385795))

(declare-fun m!1385797 () Bool)

(assert (=> b!1502512 m!1385797))

(declare-fun m!1385799 () Bool)

(assert (=> b!1502512 m!1385799))

(declare-fun m!1385801 () Bool)

(assert (=> b!1502516 m!1385801))

(declare-fun m!1385803 () Bool)

(assert (=> b!1502514 m!1385803))

(assert (=> b!1502514 m!1385803))

(declare-fun m!1385805 () Bool)

(assert (=> b!1502514 m!1385805))

(assert (=> b!1502510 m!1385803))

(assert (=> b!1502510 m!1385803))

(declare-fun m!1385807 () Bool)

(assert (=> b!1502510 m!1385807))

(push 1)

(assert (not b!1502516))

(assert (not b!1502514))

(assert (not b!1502515))

(assert (not b!1502511))

(assert (not start!127882))

(assert (not b!1502510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

