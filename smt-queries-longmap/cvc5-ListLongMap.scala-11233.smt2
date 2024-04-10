; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131030 () Bool)

(assert start!131030)

(declare-fun b!1537429 () Bool)

(declare-fun res!1054523 () Bool)

(declare-fun e!855633 () Bool)

(assert (=> b!1537429 (=> (not res!1054523) (not e!855633))))

(declare-datatypes ((array!102128 0))(
  ( (array!102129 (arr!49280 (Array (_ BitVec 32) (_ BitVec 64))) (size!49830 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102128)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537429 (= res!1054523 (and (= (size!49830 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49830 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49830 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537430 () Bool)

(declare-fun res!1054516 () Bool)

(assert (=> b!1537430 (=> (not res!1054516) (not e!855633))))

(declare-datatypes ((List!35754 0))(
  ( (Nil!35751) (Cons!35750 (h!37195 (_ BitVec 64)) (t!50448 List!35754)) )
))
(declare-fun arrayNoDuplicates!0 (array!102128 (_ BitVec 32) List!35754) Bool)

(assert (=> b!1537430 (= res!1054516 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35751))))

(declare-fun b!1537431 () Bool)

(declare-fun res!1054524 () Bool)

(declare-fun e!855635 () Bool)

(assert (=> b!1537431 (=> (not res!1054524) (not e!855635))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537431 (= res!1054524 (not (= (select (arr!49280 a!2792) index!463) (select (arr!49280 a!2792) j!64))))))

(declare-fun b!1537432 () Bool)

(declare-fun res!1054525 () Bool)

(assert (=> b!1537432 (=> (not res!1054525) (not e!855633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537432 (= res!1054525 (validKeyInArray!0 (select (arr!49280 a!2792) j!64)))))

(declare-fun b!1537433 () Bool)

(declare-fun res!1054521 () Bool)

(assert (=> b!1537433 (=> (not res!1054521) (not e!855633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102128 (_ BitVec 32)) Bool)

(assert (=> b!1537433 (= res!1054521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537434 () Bool)

(declare-fun e!855634 () Bool)

(declare-fun e!855636 () Bool)

(assert (=> b!1537434 (= e!855634 e!855636)))

(declare-fun res!1054515 () Bool)

(assert (=> b!1537434 (=> (not res!1054515) (not e!855636))))

(declare-datatypes ((SeekEntryResult!13412 0))(
  ( (MissingZero!13412 (index!56043 (_ BitVec 32))) (Found!13412 (index!56044 (_ BitVec 32))) (Intermediate!13412 (undefined!14224 Bool) (index!56045 (_ BitVec 32)) (x!137774 (_ BitVec 32))) (Undefined!13412) (MissingVacant!13412 (index!56046 (_ BitVec 32))) )
))
(declare-fun lt!664713 () SeekEntryResult!13412)

(declare-fun lt!664711 () SeekEntryResult!13412)

(assert (=> b!1537434 (= res!1054515 (= lt!664713 lt!664711))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664714 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102128 (_ BitVec 32)) SeekEntryResult!13412)

(assert (=> b!1537434 (= lt!664713 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664714 vacantIndex!5 (select (arr!49280 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537435 () Bool)

(assert (=> b!1537435 (= e!855636 (not true))))

(assert (=> b!1537435 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664714 vacantIndex!5 (select (store (arr!49280 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102129 (store (arr!49280 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49830 a!2792)) mask!2480) lt!664713)))

(declare-datatypes ((Unit!51396 0))(
  ( (Unit!51397) )
))
(declare-fun lt!664712 () Unit!51396)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51396)

(assert (=> b!1537435 (= lt!664712 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664714 vacantIndex!5 mask!2480))))

(declare-fun b!1537436 () Bool)

(assert (=> b!1537436 (= e!855633 e!855635)))

(declare-fun res!1054519 () Bool)

(assert (=> b!1537436 (=> (not res!1054519) (not e!855635))))

(assert (=> b!1537436 (= res!1054519 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49280 a!2792) j!64) a!2792 mask!2480) lt!664711))))

(assert (=> b!1537436 (= lt!664711 (Found!13412 j!64))))

(declare-fun b!1537437 () Bool)

(declare-fun res!1054518 () Bool)

(assert (=> b!1537437 (=> (not res!1054518) (not e!855633))))

(assert (=> b!1537437 (= res!1054518 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49830 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49830 a!2792)) (= (select (arr!49280 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537438 () Bool)

(declare-fun res!1054517 () Bool)

(assert (=> b!1537438 (=> (not res!1054517) (not e!855633))))

(assert (=> b!1537438 (= res!1054517 (validKeyInArray!0 (select (arr!49280 a!2792) i!951)))))

(declare-fun b!1537439 () Bool)

(assert (=> b!1537439 (= e!855635 e!855634)))

(declare-fun res!1054520 () Bool)

(assert (=> b!1537439 (=> (not res!1054520) (not e!855634))))

(assert (=> b!1537439 (= res!1054520 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664714 #b00000000000000000000000000000000) (bvslt lt!664714 (size!49830 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537439 (= lt!664714 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun res!1054522 () Bool)

(assert (=> start!131030 (=> (not res!1054522) (not e!855633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131030 (= res!1054522 (validMask!0 mask!2480))))

(assert (=> start!131030 e!855633))

(assert (=> start!131030 true))

(declare-fun array_inv!38308 (array!102128) Bool)

(assert (=> start!131030 (array_inv!38308 a!2792)))

(assert (= (and start!131030 res!1054522) b!1537429))

(assert (= (and b!1537429 res!1054523) b!1537438))

(assert (= (and b!1537438 res!1054517) b!1537432))

(assert (= (and b!1537432 res!1054525) b!1537433))

(assert (= (and b!1537433 res!1054521) b!1537430))

(assert (= (and b!1537430 res!1054516) b!1537437))

(assert (= (and b!1537437 res!1054518) b!1537436))

(assert (= (and b!1537436 res!1054519) b!1537431))

(assert (= (and b!1537431 res!1054524) b!1537439))

(assert (= (and b!1537439 res!1054520) b!1537434))

(assert (= (and b!1537434 res!1054515) b!1537435))

(declare-fun m!1419933 () Bool)

(assert (=> b!1537435 m!1419933))

(declare-fun m!1419935 () Bool)

(assert (=> b!1537435 m!1419935))

(assert (=> b!1537435 m!1419935))

(declare-fun m!1419937 () Bool)

(assert (=> b!1537435 m!1419937))

(declare-fun m!1419939 () Bool)

(assert (=> b!1537435 m!1419939))

(declare-fun m!1419941 () Bool)

(assert (=> b!1537434 m!1419941))

(assert (=> b!1537434 m!1419941))

(declare-fun m!1419943 () Bool)

(assert (=> b!1537434 m!1419943))

(declare-fun m!1419945 () Bool)

(assert (=> start!131030 m!1419945))

(declare-fun m!1419947 () Bool)

(assert (=> start!131030 m!1419947))

(assert (=> b!1537436 m!1419941))

(assert (=> b!1537436 m!1419941))

(declare-fun m!1419949 () Bool)

(assert (=> b!1537436 m!1419949))

(declare-fun m!1419951 () Bool)

(assert (=> b!1537433 m!1419951))

(declare-fun m!1419953 () Bool)

(assert (=> b!1537438 m!1419953))

(assert (=> b!1537438 m!1419953))

(declare-fun m!1419955 () Bool)

(assert (=> b!1537438 m!1419955))

(declare-fun m!1419957 () Bool)

(assert (=> b!1537437 m!1419957))

(assert (=> b!1537432 m!1419941))

(assert (=> b!1537432 m!1419941))

(declare-fun m!1419959 () Bool)

(assert (=> b!1537432 m!1419959))

(declare-fun m!1419961 () Bool)

(assert (=> b!1537439 m!1419961))

(declare-fun m!1419963 () Bool)

(assert (=> b!1537431 m!1419963))

(assert (=> b!1537431 m!1419941))

(declare-fun m!1419965 () Bool)

(assert (=> b!1537430 m!1419965))

(push 1)

