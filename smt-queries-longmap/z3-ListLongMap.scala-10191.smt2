; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120068 () Bool)

(assert start!120068)

(declare-fun b!1397851 () Bool)

(declare-fun e!791365 () Bool)

(declare-fun e!791368 () Bool)

(assert (=> b!1397851 (= e!791365 (not e!791368))))

(declare-fun res!936823 () Bool)

(assert (=> b!1397851 (=> res!936823 e!791368)))

(declare-datatypes ((SeekEntryResult!10472 0))(
  ( (MissingZero!10472 (index!44259 (_ BitVec 32))) (Found!10472 (index!44260 (_ BitVec 32))) (Intermediate!10472 (undefined!11284 Bool) (index!44261 (_ BitVec 32)) (x!125907 (_ BitVec 32))) (Undefined!10472) (MissingVacant!10472 (index!44262 (_ BitVec 32))) )
))
(declare-fun lt!614398 () SeekEntryResult!10472)

(get-info :version)

(assert (=> b!1397851 (= res!936823 (or (not ((_ is Intermediate!10472) lt!614398)) (undefined!11284 lt!614398)))))

(declare-fun e!791366 () Bool)

(assert (=> b!1397851 e!791366))

(declare-fun res!936821 () Bool)

(assert (=> b!1397851 (=> (not res!936821) (not e!791366))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95550 0))(
  ( (array!95551 (arr!46129 (Array (_ BitVec 32) (_ BitVec 64))) (size!46681 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95550)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95550 (_ BitVec 32)) Bool)

(assert (=> b!1397851 (= res!936821 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46791 0))(
  ( (Unit!46792) )
))
(declare-fun lt!614397 () Unit!46791)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46791)

(assert (=> b!1397851 (= lt!614397 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614401 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95550 (_ BitVec 32)) SeekEntryResult!10472)

(assert (=> b!1397851 (= lt!614398 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614401 (select (arr!46129 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397851 (= lt!614401 (toIndex!0 (select (arr!46129 a!2901) j!112) mask!2840))))

(declare-fun b!1397852 () Bool)

(declare-fun e!791367 () Bool)

(assert (=> b!1397852 (= e!791367 true)))

(declare-fun lt!614399 () SeekEntryResult!10472)

(declare-fun lt!614402 () (_ BitVec 64))

(declare-fun lt!614400 () array!95550)

(assert (=> b!1397852 (= lt!614399 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614401 lt!614402 lt!614400 mask!2840))))

(declare-fun b!1397853 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95550 (_ BitVec 32)) SeekEntryResult!10472)

(assert (=> b!1397853 (= e!791366 (= (seekEntryOrOpen!0 (select (arr!46129 a!2901) j!112) a!2901 mask!2840) (Found!10472 j!112)))))

(declare-fun b!1397854 () Bool)

(declare-fun res!936815 () Bool)

(assert (=> b!1397854 (=> (not res!936815) (not e!791365))))

(assert (=> b!1397854 (= res!936815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!936819 () Bool)

(assert (=> start!120068 (=> (not res!936819) (not e!791365))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120068 (= res!936819 (validMask!0 mask!2840))))

(assert (=> start!120068 e!791365))

(assert (=> start!120068 true))

(declare-fun array_inv!35362 (array!95550) Bool)

(assert (=> start!120068 (array_inv!35362 a!2901)))

(declare-fun b!1397855 () Bool)

(declare-fun res!936817 () Bool)

(assert (=> b!1397855 (=> (not res!936817) (not e!791365))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397855 (= res!936817 (and (= (size!46681 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46681 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46681 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397856 () Bool)

(declare-fun res!936816 () Bool)

(assert (=> b!1397856 (=> (not res!936816) (not e!791365))))

(declare-datatypes ((List!32726 0))(
  ( (Nil!32723) (Cons!32722 (h!33964 (_ BitVec 64)) (t!47412 List!32726)) )
))
(declare-fun arrayNoDuplicates!0 (array!95550 (_ BitVec 32) List!32726) Bool)

(assert (=> b!1397856 (= res!936816 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32723))))

(declare-fun b!1397857 () Bool)

(declare-fun res!936820 () Bool)

(assert (=> b!1397857 (=> (not res!936820) (not e!791365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397857 (= res!936820 (validKeyInArray!0 (select (arr!46129 a!2901) i!1037)))))

(declare-fun b!1397858 () Bool)

(assert (=> b!1397858 (= e!791368 e!791367)))

(declare-fun res!936818 () Bool)

(assert (=> b!1397858 (=> res!936818 e!791367)))

(declare-fun lt!614396 () SeekEntryResult!10472)

(assert (=> b!1397858 (= res!936818 (or (= lt!614398 lt!614396) (not ((_ is Intermediate!10472) lt!614396)) (bvslt (x!125907 lt!614398) #b00000000000000000000000000000000) (bvsgt (x!125907 lt!614398) #b01111111111111111111111111111110) (bvslt lt!614401 #b00000000000000000000000000000000) (bvsge lt!614401 (size!46681 a!2901)) (bvslt (index!44261 lt!614398) #b00000000000000000000000000000000) (bvsge (index!44261 lt!614398) (size!46681 a!2901)) (not (= lt!614398 (Intermediate!10472 false (index!44261 lt!614398) (x!125907 lt!614398)))) (not (= lt!614396 (Intermediate!10472 (undefined!11284 lt!614396) (index!44261 lt!614396) (x!125907 lt!614396))))))))

(assert (=> b!1397858 (= lt!614396 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614402 mask!2840) lt!614402 lt!614400 mask!2840))))

(assert (=> b!1397858 (= lt!614402 (select (store (arr!46129 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397858 (= lt!614400 (array!95551 (store (arr!46129 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46681 a!2901)))))

(declare-fun b!1397859 () Bool)

(declare-fun res!936822 () Bool)

(assert (=> b!1397859 (=> (not res!936822) (not e!791365))))

(assert (=> b!1397859 (= res!936822 (validKeyInArray!0 (select (arr!46129 a!2901) j!112)))))

(assert (= (and start!120068 res!936819) b!1397855))

(assert (= (and b!1397855 res!936817) b!1397857))

(assert (= (and b!1397857 res!936820) b!1397859))

(assert (= (and b!1397859 res!936822) b!1397854))

(assert (= (and b!1397854 res!936815) b!1397856))

(assert (= (and b!1397856 res!936816) b!1397851))

(assert (= (and b!1397851 res!936821) b!1397853))

(assert (= (and b!1397851 (not res!936823)) b!1397858))

(assert (= (and b!1397858 (not res!936818)) b!1397852))

(declare-fun m!1284331 () Bool)

(assert (=> b!1397852 m!1284331))

(declare-fun m!1284333 () Bool)

(assert (=> b!1397856 m!1284333))

(declare-fun m!1284335 () Bool)

(assert (=> b!1397859 m!1284335))

(assert (=> b!1397859 m!1284335))

(declare-fun m!1284337 () Bool)

(assert (=> b!1397859 m!1284337))

(declare-fun m!1284339 () Bool)

(assert (=> start!120068 m!1284339))

(declare-fun m!1284341 () Bool)

(assert (=> start!120068 m!1284341))

(assert (=> b!1397853 m!1284335))

(assert (=> b!1397853 m!1284335))

(declare-fun m!1284343 () Bool)

(assert (=> b!1397853 m!1284343))

(declare-fun m!1284345 () Bool)

(assert (=> b!1397857 m!1284345))

(assert (=> b!1397857 m!1284345))

(declare-fun m!1284347 () Bool)

(assert (=> b!1397857 m!1284347))

(declare-fun m!1284349 () Bool)

(assert (=> b!1397858 m!1284349))

(assert (=> b!1397858 m!1284349))

(declare-fun m!1284351 () Bool)

(assert (=> b!1397858 m!1284351))

(declare-fun m!1284353 () Bool)

(assert (=> b!1397858 m!1284353))

(declare-fun m!1284355 () Bool)

(assert (=> b!1397858 m!1284355))

(declare-fun m!1284357 () Bool)

(assert (=> b!1397854 m!1284357))

(assert (=> b!1397851 m!1284335))

(declare-fun m!1284359 () Bool)

(assert (=> b!1397851 m!1284359))

(assert (=> b!1397851 m!1284335))

(declare-fun m!1284361 () Bool)

(assert (=> b!1397851 m!1284361))

(declare-fun m!1284363 () Bool)

(assert (=> b!1397851 m!1284363))

(assert (=> b!1397851 m!1284335))

(declare-fun m!1284365 () Bool)

(assert (=> b!1397851 m!1284365))

(check-sat (not b!1397854) (not b!1397856) (not b!1397853) (not b!1397851) (not b!1397859) (not start!120068) (not b!1397852) (not b!1397858) (not b!1397857))
(check-sat)
