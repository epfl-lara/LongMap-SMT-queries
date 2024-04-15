; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128004 () Bool)

(assert start!128004)

(declare-fun b!1503695 () Bool)

(declare-fun res!1024671 () Bool)

(declare-fun e!840600 () Bool)

(assert (=> b!1503695 (=> (not res!1024671) (not e!840600))))

(declare-datatypes ((array!100274 0))(
  ( (array!100275 (arr!48393 (Array (_ BitVec 32) (_ BitVec 64))) (size!48945 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100274)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503695 (= res!1024671 (validKeyInArray!0 (select (arr!48393 a!2850) j!87)))))

(declare-fun b!1503696 () Bool)

(declare-fun res!1024673 () Bool)

(assert (=> b!1503696 (=> (not res!1024673) (not e!840600))))

(declare-datatypes ((List!34963 0))(
  ( (Nil!34960) (Cons!34959 (h!36357 (_ BitVec 64)) (t!49649 List!34963)) )
))
(declare-fun arrayNoDuplicates!0 (array!100274 (_ BitVec 32) List!34963) Bool)

(assert (=> b!1503696 (= res!1024673 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34960))))

(declare-fun res!1024676 () Bool)

(assert (=> start!128004 (=> (not res!1024676) (not e!840600))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128004 (= res!1024676 (validMask!0 mask!2661))))

(assert (=> start!128004 e!840600))

(assert (=> start!128004 true))

(declare-fun array_inv!37626 (array!100274) Bool)

(assert (=> start!128004 (array_inv!37626 a!2850)))

(declare-fun b!1503697 () Bool)

(assert (=> b!1503697 (= e!840600 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653350 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503697 (= lt!653350 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503698 () Bool)

(declare-fun res!1024678 () Bool)

(assert (=> b!1503698 (=> (not res!1024678) (not e!840600))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1503698 (= res!1024678 (and (= (size!48945 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48945 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48945 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503699 () Bool)

(declare-fun res!1024675 () Bool)

(assert (=> b!1503699 (=> (not res!1024675) (not e!840600))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12612 0))(
  ( (MissingZero!12612 (index!52840 (_ BitVec 32))) (Found!12612 (index!52841 (_ BitVec 32))) (Intermediate!12612 (undefined!13424 Bool) (index!52842 (_ BitVec 32)) (x!134525 (_ BitVec 32))) (Undefined!12612) (MissingVacant!12612 (index!52843 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100274 (_ BitVec 32)) SeekEntryResult!12612)

(assert (=> b!1503699 (= res!1024675 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48393 a!2850) j!87) a!2850 mask!2661) (Found!12612 j!87)))))

(declare-fun b!1503700 () Bool)

(declare-fun res!1024672 () Bool)

(assert (=> b!1503700 (=> (not res!1024672) (not e!840600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100274 (_ BitVec 32)) Bool)

(assert (=> b!1503700 (= res!1024672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503701 () Bool)

(declare-fun res!1024677 () Bool)

(assert (=> b!1503701 (=> (not res!1024677) (not e!840600))))

(assert (=> b!1503701 (= res!1024677 (not (= (select (arr!48393 a!2850) index!625) (select (arr!48393 a!2850) j!87))))))

(declare-fun b!1503702 () Bool)

(declare-fun res!1024674 () Bool)

(assert (=> b!1503702 (=> (not res!1024674) (not e!840600))))

(assert (=> b!1503702 (= res!1024674 (validKeyInArray!0 (select (arr!48393 a!2850) i!996)))))

(declare-fun b!1503703 () Bool)

(declare-fun res!1024679 () Bool)

(assert (=> b!1503703 (=> (not res!1024679) (not e!840600))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503703 (= res!1024679 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48945 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48945 a!2850)) (= (select (arr!48393 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48393 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48945 a!2850))))))

(assert (= (and start!128004 res!1024676) b!1503698))

(assert (= (and b!1503698 res!1024678) b!1503702))

(assert (= (and b!1503702 res!1024674) b!1503695))

(assert (= (and b!1503695 res!1024671) b!1503700))

(assert (= (and b!1503700 res!1024672) b!1503696))

(assert (= (and b!1503696 res!1024673) b!1503703))

(assert (= (and b!1503703 res!1024679) b!1503699))

(assert (= (and b!1503699 res!1024675) b!1503701))

(assert (= (and b!1503701 res!1024677) b!1503697))

(declare-fun m!1386345 () Bool)

(assert (=> b!1503700 m!1386345))

(declare-fun m!1386347 () Bool)

(assert (=> b!1503702 m!1386347))

(assert (=> b!1503702 m!1386347))

(declare-fun m!1386349 () Bool)

(assert (=> b!1503702 m!1386349))

(declare-fun m!1386351 () Bool)

(assert (=> b!1503701 m!1386351))

(declare-fun m!1386353 () Bool)

(assert (=> b!1503701 m!1386353))

(declare-fun m!1386355 () Bool)

(assert (=> b!1503696 m!1386355))

(assert (=> b!1503699 m!1386353))

(assert (=> b!1503699 m!1386353))

(declare-fun m!1386357 () Bool)

(assert (=> b!1503699 m!1386357))

(declare-fun m!1386359 () Bool)

(assert (=> b!1503697 m!1386359))

(declare-fun m!1386361 () Bool)

(assert (=> start!128004 m!1386361))

(declare-fun m!1386363 () Bool)

(assert (=> start!128004 m!1386363))

(assert (=> b!1503695 m!1386353))

(assert (=> b!1503695 m!1386353))

(declare-fun m!1386365 () Bool)

(assert (=> b!1503695 m!1386365))

(declare-fun m!1386367 () Bool)

(assert (=> b!1503703 m!1386367))

(declare-fun m!1386369 () Bool)

(assert (=> b!1503703 m!1386369))

(declare-fun m!1386371 () Bool)

(assert (=> b!1503703 m!1386371))

(push 1)

(assert (not b!1503700))

(assert (not start!128004))

(assert (not b!1503702))

(assert (not b!1503695))

(assert (not b!1503699))

(assert (not b!1503696))

(assert (not b!1503697))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

