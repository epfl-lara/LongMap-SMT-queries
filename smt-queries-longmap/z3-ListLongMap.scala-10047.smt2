; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118598 () Bool)

(assert start!118598)

(declare-fun b!1386072 () Bool)

(declare-fun e!785509 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-datatypes ((array!94799 0))(
  ( (array!94800 (arr!45775 (Array (_ BitVec 32) (_ BitVec 64))) (size!46326 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94799)

(assert (=> b!1386072 (= e!785509 (not (bvsle startIndex!16 (size!46326 a!2938))))))

(declare-fun lt!609530 () array!94799)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94799 (_ BitVec 32)) Bool)

(assert (=> b!1386072 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609530 mask!2987)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((Unit!46142 0))(
  ( (Unit!46143) )
))
(declare-fun lt!609527 () Unit!46142)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46142)

(assert (=> b!1386072 (= lt!609527 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1386073 () Bool)

(declare-fun res!926661 () Bool)

(declare-fun e!785508 () Bool)

(assert (=> b!1386073 (=> (not res!926661) (not e!785508))))

(declare-datatypes ((List!32290 0))(
  ( (Nil!32287) (Cons!32286 (h!33504 (_ BitVec 64)) (t!46976 List!32290)) )
))
(declare-fun arrayNoDuplicates!0 (array!94799 (_ BitVec 32) List!32290) Bool)

(assert (=> b!1386073 (= res!926661 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32287))))

(declare-fun b!1386074 () Bool)

(declare-fun res!926658 () Bool)

(assert (=> b!1386074 (=> (not res!926658) (not e!785508))))

(assert (=> b!1386074 (= res!926658 (and (= (size!46326 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46326 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46326 a!2938))))))

(declare-fun b!1386075 () Bool)

(declare-fun e!785505 () Unit!46142)

(declare-fun Unit!46144 () Unit!46142)

(assert (=> b!1386075 (= e!785505 Unit!46144)))

(declare-fun b!1386076 () Bool)

(declare-fun res!926656 () Bool)

(assert (=> b!1386076 (=> (not res!926656) (not e!785508))))

(assert (=> b!1386076 (= res!926656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386077 () Bool)

(declare-fun res!926657 () Bool)

(assert (=> b!1386077 (=> (not res!926657) (not e!785508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386077 (= res!926657 (validKeyInArray!0 (select (arr!45775 a!2938) i!1065)))))

(declare-fun b!1386078 () Bool)

(declare-fun lt!609531 () Unit!46142)

(assert (=> b!1386078 (= e!785505 lt!609531)))

(declare-fun lt!609528 () Unit!46142)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46142)

(assert (=> b!1386078 (= lt!609528 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10071 0))(
  ( (MissingZero!10071 (index!42655 (_ BitVec 32))) (Found!10071 (index!42656 (_ BitVec 32))) (Intermediate!10071 (undefined!10883 Bool) (index!42657 (_ BitVec 32)) (x!124310 (_ BitVec 32))) (Undefined!10071) (MissingVacant!10071 (index!42658 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94799 (_ BitVec 32)) SeekEntryResult!10071)

(assert (=> b!1386078 (= (seekEntryOrOpen!0 (select (arr!45775 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45775 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609530 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46142)

(assert (=> b!1386078 (= lt!609531 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386078 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386079 () Bool)

(assert (=> b!1386079 (= e!785508 e!785509)))

(declare-fun res!926662 () Bool)

(assert (=> b!1386079 (=> (not res!926662) (not e!785509))))

(assert (=> b!1386079 (= res!926662 (and (bvslt startIndex!16 (bvsub (size!46326 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609529 () Unit!46142)

(assert (=> b!1386079 (= lt!609529 e!785505)))

(declare-fun c!129156 () Bool)

(declare-fun e!785507 () Bool)

(assert (=> b!1386079 (= c!129156 e!785507)))

(declare-fun res!926659 () Bool)

(assert (=> b!1386079 (=> (not res!926659) (not e!785507))))

(assert (=> b!1386079 (= res!926659 (not (= startIndex!16 i!1065)))))

(assert (=> b!1386079 (= lt!609530 (array!94800 (store (arr!45775 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46326 a!2938)))))

(declare-fun res!926660 () Bool)

(assert (=> start!118598 (=> (not res!926660) (not e!785508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118598 (= res!926660 (validMask!0 mask!2987))))

(assert (=> start!118598 e!785508))

(assert (=> start!118598 true))

(declare-fun array_inv!35056 (array!94799) Bool)

(assert (=> start!118598 (array_inv!35056 a!2938)))

(declare-fun b!1386080 () Bool)

(assert (=> b!1386080 (= e!785507 (validKeyInArray!0 (select (arr!45775 a!2938) startIndex!16)))))

(declare-fun b!1386081 () Bool)

(declare-fun res!926655 () Bool)

(assert (=> b!1386081 (=> (not res!926655) (not e!785508))))

(assert (=> b!1386081 (= res!926655 (and (not (= (select (arr!45775 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45775 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!118598 res!926660) b!1386074))

(assert (= (and b!1386074 res!926658) b!1386077))

(assert (= (and b!1386077 res!926657) b!1386073))

(assert (= (and b!1386073 res!926661) b!1386076))

(assert (= (and b!1386076 res!926656) b!1386081))

(assert (= (and b!1386081 res!926655) b!1386079))

(assert (= (and b!1386079 res!926659) b!1386080))

(assert (= (and b!1386079 c!129156) b!1386078))

(assert (= (and b!1386079 (not c!129156)) b!1386075))

(assert (= (and b!1386079 res!926662) b!1386072))

(declare-fun m!1271679 () Bool)

(assert (=> b!1386072 m!1271679))

(declare-fun m!1271681 () Bool)

(assert (=> b!1386072 m!1271681))

(declare-fun m!1271683 () Bool)

(assert (=> b!1386073 m!1271683))

(declare-fun m!1271685 () Bool)

(assert (=> b!1386076 m!1271685))

(declare-fun m!1271687 () Bool)

(assert (=> b!1386081 m!1271687))

(declare-fun m!1271689 () Bool)

(assert (=> b!1386079 m!1271689))

(assert (=> b!1386077 m!1271687))

(assert (=> b!1386077 m!1271687))

(declare-fun m!1271691 () Bool)

(assert (=> b!1386077 m!1271691))

(declare-fun m!1271693 () Bool)

(assert (=> start!118598 m!1271693))

(declare-fun m!1271695 () Bool)

(assert (=> start!118598 m!1271695))

(declare-fun m!1271697 () Bool)

(assert (=> b!1386078 m!1271697))

(declare-fun m!1271699 () Bool)

(assert (=> b!1386078 m!1271699))

(assert (=> b!1386078 m!1271689))

(declare-fun m!1271701 () Bool)

(assert (=> b!1386078 m!1271701))

(assert (=> b!1386078 m!1271699))

(declare-fun m!1271703 () Bool)

(assert (=> b!1386078 m!1271703))

(declare-fun m!1271705 () Bool)

(assert (=> b!1386078 m!1271705))

(declare-fun m!1271707 () Bool)

(assert (=> b!1386078 m!1271707))

(assert (=> b!1386078 m!1271705))

(declare-fun m!1271709 () Bool)

(assert (=> b!1386078 m!1271709))

(assert (=> b!1386080 m!1271705))

(assert (=> b!1386080 m!1271705))

(declare-fun m!1271711 () Bool)

(assert (=> b!1386080 m!1271711))

(check-sat (not b!1386076) (not b!1386080) (not b!1386077) (not b!1386073) (not b!1386078) (not b!1386072) (not start!118598))
(check-sat)
