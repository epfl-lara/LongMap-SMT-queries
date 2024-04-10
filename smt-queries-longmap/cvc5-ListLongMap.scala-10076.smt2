; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118590 () Bool)

(assert start!118590)

(declare-fun b!1386391 () Bool)

(declare-fun res!927607 () Bool)

(declare-fun e!785375 () Bool)

(assert (=> b!1386391 (=> (not res!927607) (not e!785375))))

(declare-datatypes ((array!94866 0))(
  ( (array!94867 (arr!45809 (Array (_ BitVec 32) (_ BitVec 64))) (size!46359 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94866)

(declare-datatypes ((List!32337 0))(
  ( (Nil!32334) (Cons!32333 (h!33542 (_ BitVec 64)) (t!47031 List!32337)) )
))
(declare-fun arrayNoDuplicates!0 (array!94866 (_ BitVec 32) List!32337) Bool)

(assert (=> b!1386391 (= res!927607 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32334))))

(declare-fun b!1386392 () Bool)

(declare-datatypes ((Unit!46298 0))(
  ( (Unit!46299) )
))
(declare-fun e!785376 () Unit!46298)

(declare-fun lt!609450 () Unit!46298)

(assert (=> b!1386392 (= e!785376 lt!609450)))

(declare-fun lt!609449 () Unit!46298)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94866 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46298)

(assert (=> b!1386392 (= lt!609449 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10152 0))(
  ( (MissingZero!10152 (index!42979 (_ BitVec 32))) (Found!10152 (index!42980 (_ BitVec 32))) (Intermediate!10152 (undefined!10964 Bool) (index!42981 (_ BitVec 32)) (x!124601 (_ BitVec 32))) (Undefined!10152) (MissingVacant!10152 (index!42982 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94866 (_ BitVec 32)) SeekEntryResult!10152)

(assert (=> b!1386392 (= (seekEntryOrOpen!0 (select (arr!45809 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45809 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94867 (store (arr!45809 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46359 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94866 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46298)

(assert (=> b!1386392 (= lt!609450 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94866 (_ BitVec 32)) Bool)

(assert (=> b!1386392 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386393 () Bool)

(declare-fun res!927605 () Bool)

(assert (=> b!1386393 (=> (not res!927605) (not e!785375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386393 (= res!927605 (validKeyInArray!0 (select (arr!45809 a!2938) i!1065)))))

(declare-fun b!1386394 () Bool)

(declare-fun res!927601 () Bool)

(assert (=> b!1386394 (=> (not res!927601) (not e!785375))))

(assert (=> b!1386394 (= res!927601 (and (= (size!46359 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46359 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46359 a!2938))))))

(declare-fun b!1386395 () Bool)

(declare-fun res!927604 () Bool)

(assert (=> b!1386395 (=> (not res!927604) (not e!785375))))

(assert (=> b!1386395 (= res!927604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!927606 () Bool)

(assert (=> start!118590 (=> (not res!927606) (not e!785375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118590 (= res!927606 (validMask!0 mask!2987))))

(assert (=> start!118590 e!785375))

(assert (=> start!118590 true))

(declare-fun array_inv!34837 (array!94866) Bool)

(assert (=> start!118590 (array_inv!34837 a!2938)))

(declare-fun b!1386396 () Bool)

(declare-fun res!927603 () Bool)

(assert (=> b!1386396 (=> (not res!927603) (not e!785375))))

(assert (=> b!1386396 (= res!927603 (and (not (= (select (arr!45809 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45809 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386397 () Bool)

(declare-fun e!785377 () Bool)

(assert (=> b!1386397 (= e!785377 (validKeyInArray!0 (select (arr!45809 a!2938) startIndex!16)))))

(declare-fun b!1386398 () Bool)

(declare-fun Unit!46300 () Unit!46298)

(assert (=> b!1386398 (= e!785376 Unit!46300)))

(declare-fun b!1386399 () Bool)

(assert (=> b!1386399 (= e!785375 false)))

(declare-fun lt!609448 () Unit!46298)

(assert (=> b!1386399 (= lt!609448 e!785376)))

(declare-fun c!128835 () Bool)

(assert (=> b!1386399 (= c!128835 e!785377)))

(declare-fun res!927602 () Bool)

(assert (=> b!1386399 (=> (not res!927602) (not e!785377))))

(assert (=> b!1386399 (= res!927602 (not (= startIndex!16 i!1065)))))

(assert (= (and start!118590 res!927606) b!1386394))

(assert (= (and b!1386394 res!927601) b!1386393))

(assert (= (and b!1386393 res!927605) b!1386391))

(assert (= (and b!1386391 res!927607) b!1386395))

(assert (= (and b!1386395 res!927604) b!1386396))

(assert (= (and b!1386396 res!927603) b!1386399))

(assert (= (and b!1386399 res!927602) b!1386397))

(assert (= (and b!1386399 c!128835) b!1386392))

(assert (= (and b!1386399 (not c!128835)) b!1386398))

(declare-fun m!1271751 () Bool)

(assert (=> b!1386397 m!1271751))

(assert (=> b!1386397 m!1271751))

(declare-fun m!1271753 () Bool)

(assert (=> b!1386397 m!1271753))

(declare-fun m!1271755 () Bool)

(assert (=> b!1386391 m!1271755))

(declare-fun m!1271757 () Bool)

(assert (=> b!1386392 m!1271757))

(declare-fun m!1271759 () Bool)

(assert (=> b!1386392 m!1271759))

(assert (=> b!1386392 m!1271759))

(declare-fun m!1271761 () Bool)

(assert (=> b!1386392 m!1271761))

(declare-fun m!1271763 () Bool)

(assert (=> b!1386392 m!1271763))

(declare-fun m!1271765 () Bool)

(assert (=> b!1386392 m!1271765))

(assert (=> b!1386392 m!1271751))

(declare-fun m!1271767 () Bool)

(assert (=> b!1386392 m!1271767))

(assert (=> b!1386392 m!1271751))

(declare-fun m!1271769 () Bool)

(assert (=> b!1386392 m!1271769))

(declare-fun m!1271771 () Bool)

(assert (=> b!1386395 m!1271771))

(declare-fun m!1271773 () Bool)

(assert (=> b!1386393 m!1271773))

(assert (=> b!1386393 m!1271773))

(declare-fun m!1271775 () Bool)

(assert (=> b!1386393 m!1271775))

(assert (=> b!1386396 m!1271773))

(declare-fun m!1271777 () Bool)

(assert (=> start!118590 m!1271777))

(declare-fun m!1271779 () Bool)

(assert (=> start!118590 m!1271779))

(push 1)

(assert (not b!1386393))

(assert (not start!118590))

(assert (not b!1386392))

(assert (not b!1386395))

(assert (not b!1386391))

(assert (not b!1386397))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

