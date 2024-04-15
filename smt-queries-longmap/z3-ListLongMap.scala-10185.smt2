; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120032 () Bool)

(assert start!120032)

(declare-fun res!936335 () Bool)

(declare-fun e!791097 () Bool)

(assert (=> start!120032 (=> (not res!936335) (not e!791097))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120032 (= res!936335 (validMask!0 mask!2840))))

(assert (=> start!120032 e!791097))

(assert (=> start!120032 true))

(declare-datatypes ((array!95514 0))(
  ( (array!95515 (arr!46111 (Array (_ BitVec 32) (_ BitVec 64))) (size!46663 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95514)

(declare-fun array_inv!35344 (array!95514) Bool)

(assert (=> start!120032 (array_inv!35344 a!2901)))

(declare-fun b!1397365 () Bool)

(declare-fun e!791098 () Bool)

(assert (=> b!1397365 (= e!791097 (not e!791098))))

(declare-fun res!936330 () Bool)

(assert (=> b!1397365 (=> res!936330 e!791098)))

(declare-datatypes ((SeekEntryResult!10454 0))(
  ( (MissingZero!10454 (index!44187 (_ BitVec 32))) (Found!10454 (index!44188 (_ BitVec 32))) (Intermediate!10454 (undefined!11266 Bool) (index!44189 (_ BitVec 32)) (x!125841 (_ BitVec 32))) (Undefined!10454) (MissingVacant!10454 (index!44190 (_ BitVec 32))) )
))
(declare-fun lt!614020 () SeekEntryResult!10454)

(get-info :version)

(assert (=> b!1397365 (= res!936330 (or (not ((_ is Intermediate!10454) lt!614020)) (undefined!11266 lt!614020)))))

(declare-fun e!791095 () Bool)

(assert (=> b!1397365 e!791095))

(declare-fun res!936332 () Bool)

(assert (=> b!1397365 (=> (not res!936332) (not e!791095))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95514 (_ BitVec 32)) Bool)

(assert (=> b!1397365 (= res!936332 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46755 0))(
  ( (Unit!46756) )
))
(declare-fun lt!614021 () Unit!46755)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46755)

(assert (=> b!1397365 (= lt!614021 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614018 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95514 (_ BitVec 32)) SeekEntryResult!10454)

(assert (=> b!1397365 (= lt!614020 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614018 (select (arr!46111 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397365 (= lt!614018 (toIndex!0 (select (arr!46111 a!2901) j!112) mask!2840))))

(declare-fun b!1397366 () Bool)

(declare-fun res!936337 () Bool)

(assert (=> b!1397366 (=> (not res!936337) (not e!791097))))

(assert (=> b!1397366 (= res!936337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397367 () Bool)

(declare-fun res!936331 () Bool)

(assert (=> b!1397367 (=> (not res!936331) (not e!791097))))

(declare-datatypes ((List!32708 0))(
  ( (Nil!32705) (Cons!32704 (h!33946 (_ BitVec 64)) (t!47394 List!32708)) )
))
(declare-fun arrayNoDuplicates!0 (array!95514 (_ BitVec 32) List!32708) Bool)

(assert (=> b!1397367 (= res!936331 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32705))))

(declare-fun b!1397368 () Bool)

(declare-fun res!936329 () Bool)

(assert (=> b!1397368 (=> (not res!936329) (not e!791097))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397368 (= res!936329 (validKeyInArray!0 (select (arr!46111 a!2901) i!1037)))))

(declare-fun b!1397369 () Bool)

(declare-fun e!791099 () Bool)

(assert (=> b!1397369 (= e!791098 e!791099)))

(declare-fun res!936333 () Bool)

(assert (=> b!1397369 (=> res!936333 e!791099)))

(declare-fun lt!614019 () SeekEntryResult!10454)

(assert (=> b!1397369 (= res!936333 (or (= lt!614020 lt!614019) (not ((_ is Intermediate!10454) lt!614019)) (bvslt (x!125841 lt!614020) #b00000000000000000000000000000000) (bvsgt (x!125841 lt!614020) #b01111111111111111111111111111110) (bvslt lt!614018 #b00000000000000000000000000000000) (bvsge lt!614018 (size!46663 a!2901)) (bvslt (index!44189 lt!614020) #b00000000000000000000000000000000) (bvsge (index!44189 lt!614020) (size!46663 a!2901)) (not (= lt!614020 (Intermediate!10454 false (index!44189 lt!614020) (x!125841 lt!614020)))) (not (= lt!614019 (Intermediate!10454 (undefined!11266 lt!614019) (index!44189 lt!614019) (x!125841 lt!614019))))))))

(declare-fun lt!614022 () array!95514)

(declare-fun lt!614024 () (_ BitVec 64))

(assert (=> b!1397369 (= lt!614019 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614024 mask!2840) lt!614024 lt!614022 mask!2840))))

(assert (=> b!1397369 (= lt!614024 (select (store (arr!46111 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397369 (= lt!614022 (array!95515 (store (arr!46111 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46663 a!2901)))))

(declare-fun b!1397370 () Bool)

(declare-fun res!936336 () Bool)

(assert (=> b!1397370 (=> (not res!936336) (not e!791097))))

(assert (=> b!1397370 (= res!936336 (and (= (size!46663 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46663 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46663 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397371 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95514 (_ BitVec 32)) SeekEntryResult!10454)

(assert (=> b!1397371 (= e!791095 (= (seekEntryOrOpen!0 (select (arr!46111 a!2901) j!112) a!2901 mask!2840) (Found!10454 j!112)))))

(declare-fun b!1397372 () Bool)

(assert (=> b!1397372 (= e!791099 true)))

(declare-fun lt!614023 () SeekEntryResult!10454)

(assert (=> b!1397372 (= lt!614023 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614018 lt!614024 lt!614022 mask!2840))))

(declare-fun b!1397373 () Bool)

(declare-fun res!936334 () Bool)

(assert (=> b!1397373 (=> (not res!936334) (not e!791097))))

(assert (=> b!1397373 (= res!936334 (validKeyInArray!0 (select (arr!46111 a!2901) j!112)))))

(assert (= (and start!120032 res!936335) b!1397370))

(assert (= (and b!1397370 res!936336) b!1397368))

(assert (= (and b!1397368 res!936329) b!1397373))

(assert (= (and b!1397373 res!936334) b!1397366))

(assert (= (and b!1397366 res!936337) b!1397367))

(assert (= (and b!1397367 res!936331) b!1397365))

(assert (= (and b!1397365 res!936332) b!1397371))

(assert (= (and b!1397365 (not res!936330)) b!1397369))

(assert (= (and b!1397369 (not res!936333)) b!1397372))

(declare-fun m!1283683 () Bool)

(assert (=> b!1397365 m!1283683))

(declare-fun m!1283685 () Bool)

(assert (=> b!1397365 m!1283685))

(assert (=> b!1397365 m!1283683))

(declare-fun m!1283687 () Bool)

(assert (=> b!1397365 m!1283687))

(declare-fun m!1283689 () Bool)

(assert (=> b!1397365 m!1283689))

(assert (=> b!1397365 m!1283683))

(declare-fun m!1283691 () Bool)

(assert (=> b!1397365 m!1283691))

(assert (=> b!1397373 m!1283683))

(assert (=> b!1397373 m!1283683))

(declare-fun m!1283693 () Bool)

(assert (=> b!1397373 m!1283693))

(declare-fun m!1283695 () Bool)

(assert (=> b!1397369 m!1283695))

(assert (=> b!1397369 m!1283695))

(declare-fun m!1283697 () Bool)

(assert (=> b!1397369 m!1283697))

(declare-fun m!1283699 () Bool)

(assert (=> b!1397369 m!1283699))

(declare-fun m!1283701 () Bool)

(assert (=> b!1397369 m!1283701))

(declare-fun m!1283703 () Bool)

(assert (=> b!1397367 m!1283703))

(declare-fun m!1283705 () Bool)

(assert (=> b!1397368 m!1283705))

(assert (=> b!1397368 m!1283705))

(declare-fun m!1283707 () Bool)

(assert (=> b!1397368 m!1283707))

(assert (=> b!1397371 m!1283683))

(assert (=> b!1397371 m!1283683))

(declare-fun m!1283709 () Bool)

(assert (=> b!1397371 m!1283709))

(declare-fun m!1283711 () Bool)

(assert (=> b!1397366 m!1283711))

(declare-fun m!1283713 () Bool)

(assert (=> start!120032 m!1283713))

(declare-fun m!1283715 () Bool)

(assert (=> start!120032 m!1283715))

(declare-fun m!1283717 () Bool)

(assert (=> b!1397372 m!1283717))

(check-sat (not b!1397368) (not b!1397369) (not b!1397373) (not b!1397366) (not b!1397365) (not start!120032) (not b!1397372) (not b!1397367) (not b!1397371))
(check-sat)
