; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122254 () Bool)

(assert start!122254)

(declare-fun b!1417894 () Bool)

(declare-fun res!953607 () Bool)

(declare-fun e!802412 () Bool)

(assert (=> b!1417894 (=> (not res!953607) (not e!802412))))

(declare-datatypes ((array!96817 0))(
  ( (array!96818 (arr!46735 (Array (_ BitVec 32) (_ BitVec 64))) (size!47285 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96817)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417894 (= res!953607 (validKeyInArray!0 (select (arr!46735 a!2831) j!81)))))

(declare-fun b!1417895 () Bool)

(declare-fun res!953610 () Bool)

(assert (=> b!1417895 (=> (not res!953610) (not e!802412))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1417895 (= res!953610 (validKeyInArray!0 (select (arr!46735 a!2831) i!982)))))

(declare-fun b!1417896 () Bool)

(declare-fun res!953606 () Bool)

(assert (=> b!1417896 (=> (not res!953606) (not e!802412))))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1417896 (= res!953606 (and (= (size!47285 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47285 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47285 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!953609 () Bool)

(assert (=> start!122254 (=> (not res!953609) (not e!802412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122254 (= res!953609 (validMask!0 mask!2608))))

(assert (=> start!122254 e!802412))

(assert (=> start!122254 true))

(declare-fun array_inv!35763 (array!96817) Bool)

(assert (=> start!122254 (array_inv!35763 a!2831)))

(declare-fun b!1417897 () Bool)

(declare-fun res!953608 () Bool)

(assert (=> b!1417897 (=> (not res!953608) (not e!802412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96817 (_ BitVec 32)) Bool)

(assert (=> b!1417897 (= res!953608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1417898 () Bool)

(declare-datatypes ((List!33245 0))(
  ( (Nil!33242) (Cons!33241 (h!34534 (_ BitVec 64)) (t!47939 List!33245)) )
))
(declare-fun noDuplicate!2608 (List!33245) Bool)

(assert (=> b!1417898 (= e!802412 (not (noDuplicate!2608 Nil!33242)))))

(declare-fun b!1417899 () Bool)

(declare-fun res!953611 () Bool)

(assert (=> b!1417899 (=> (not res!953611) (not e!802412))))

(assert (=> b!1417899 (= res!953611 (and (bvsle #b00000000000000000000000000000000 (size!47285 a!2831)) (bvslt (size!47285 a!2831) #b01111111111111111111111111111111)))))

(assert (= (and start!122254 res!953609) b!1417896))

(assert (= (and b!1417896 res!953606) b!1417895))

(assert (= (and b!1417895 res!953610) b!1417894))

(assert (= (and b!1417894 res!953607) b!1417897))

(assert (= (and b!1417897 res!953608) b!1417899))

(assert (= (and b!1417899 res!953611) b!1417898))

(declare-fun m!1308665 () Bool)

(assert (=> b!1417895 m!1308665))

(assert (=> b!1417895 m!1308665))

(declare-fun m!1308667 () Bool)

(assert (=> b!1417895 m!1308667))

(declare-fun m!1308669 () Bool)

(assert (=> b!1417898 m!1308669))

(declare-fun m!1308671 () Bool)

(assert (=> start!122254 m!1308671))

(declare-fun m!1308673 () Bool)

(assert (=> start!122254 m!1308673))

(declare-fun m!1308675 () Bool)

(assert (=> b!1417894 m!1308675))

(assert (=> b!1417894 m!1308675))

(declare-fun m!1308677 () Bool)

(assert (=> b!1417894 m!1308677))

(declare-fun m!1308679 () Bool)

(assert (=> b!1417897 m!1308679))

(push 1)

(assert (not b!1417895))

(assert (not start!122254))

(assert (not b!1417898))

(assert (not b!1417897))

(assert (not b!1417894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152753 () Bool)

(declare-fun res!953626 () Bool)

(declare-fun e!802427 () Bool)

(assert (=> d!152753 (=> res!953626 e!802427)))

(assert (=> d!152753 (= res!953626 (is-Nil!33242 Nil!33242))))

(assert (=> d!152753 (= (noDuplicate!2608 Nil!33242) e!802427)))

(declare-fun b!1417914 () Bool)

(declare-fun e!802428 () Bool)

(assert (=> b!1417914 (= e!802427 e!802428)))

(declare-fun res!953627 () Bool)

(assert (=> b!1417914 (=> (not res!953627) (not e!802428))))

(declare-fun contains!9831 (List!33245 (_ BitVec 64)) Bool)

(assert (=> b!1417914 (= res!953627 (not (contains!9831 (t!47939 Nil!33242) (h!34534 Nil!33242))))))

(declare-fun b!1417915 () Bool)

(assert (=> b!1417915 (= e!802428 (noDuplicate!2608 (t!47939 Nil!33242)))))

(assert (= (and d!152753 (not res!953626)) b!1417914))

(assert (= (and b!1417914 res!953627) b!1417915))

(declare-fun m!1308685 () Bool)

(assert (=> b!1417914 m!1308685))

(declare-fun m!1308687 () Bool)

(assert (=> b!1417915 m!1308687))

(assert (=> b!1417898 d!152753))

(declare-fun d!152755 () Bool)

(assert (=> d!152755 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122254 d!152755))

(declare-fun d!152761 () Bool)

(assert (=> d!152761 (= (array_inv!35763 a!2831) (bvsge (size!47285 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122254 d!152761))

(declare-fun d!152763 () Bool)

(assert (=> d!152763 (= (validKeyInArray!0 (select (arr!46735 a!2831) j!81)) (and (not (= (select (arr!46735 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46735 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417894 d!152763))

(declare-fun d!152765 () Bool)

(assert (=> d!152765 (= (validKeyInArray!0 (select (arr!46735 a!2831) i!982)) (and (not (= (select (arr!46735 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46735 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1417895 d!152765))

(declare-fun d!152767 () Bool)

(declare-fun res!953641 () Bool)

(declare-fun e!802448 () Bool)

(assert (=> d!152767 (=> res!953641 e!802448)))

(assert (=> d!152767 (= res!953641 (bvsge #b00000000000000000000000000000000 (size!47285 a!2831)))))

(assert (=> d!152767 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802448)))

(declare-fun b!1417938 () Bool)

(declare-fun e!802447 () Bool)

(declare-fun e!802446 () Bool)

(assert (=> b!1417938 (= e!802447 e!802446)))

(declare-fun lt!625484 () (_ BitVec 64))

(assert (=> b!1417938 (= lt!625484 (select (arr!46735 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48048 0))(
  ( (Unit!48049) )
))
(declare-fun lt!625483 () Unit!48048)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96817 (_ BitVec 64) (_ BitVec 32)) Unit!48048)

(assert (=> b!1417938 (= lt!625483 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625484 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1417938 (arrayContainsKey!0 a!2831 lt!625484 #b00000000000000000000000000000000)))

(declare-fun lt!625485 () Unit!48048)

(assert (=> b!1417938 (= lt!625485 lt!625483)))

(declare-fun res!953640 () Bool)

(declare-datatypes ((SeekEntryResult!11037 0))(
  ( (MissingZero!11037 (index!46540 (_ BitVec 32))) (Found!11037 (index!46541 (_ BitVec 32))) (Intermediate!11037 (undefined!11849 Bool) (index!46542 (_ BitVec 32)) (x!128160 (_ BitVec 32))) (Undefined!11037) (MissingVacant!11037 (index!46543 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96817 (_ BitVec 32)) SeekEntryResult!11037)

(assert (=> b!1417938 (= res!953640 (= (seekEntryOrOpen!0 (select (arr!46735 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11037 #b00000000000000000000000000000000)))))

(assert (=> b!1417938 (=> (not res!953640) (not e!802446))))

(declare-fun b!1417939 () Bool)

(declare-fun call!67237 () Bool)

(assert (=> b!1417939 (= e!802446 call!67237)))

(declare-fun b!1417940 () Bool)

(assert (=> b!1417940 (= e!802447 call!67237)))

(declare-fun b!1417941 () Bool)

(assert (=> b!1417941 (= e!802448 e!802447)))

(declare-fun c!131631 () Bool)

(assert (=> b!1417941 (= c!131631 (validKeyInArray!0 (select (arr!46735 a!2831) #b00000000000000000000000000000000)))))

(declare-fun bm!67234 () Bool)

(assert (=> bm!67234 (= call!67237 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!152767 (not res!953641)) b!1417941))

(assert (= (and b!1417941 c!131631) b!1417938))

(assert (= (and b!1417941 (not c!131631)) b!1417940))

(assert (= (and b!1417938 res!953640) b!1417939))

(assert (= (or b!1417939 b!1417940) bm!67234))

(declare-fun m!1308705 () Bool)

(assert (=> b!1417938 m!1308705))

(declare-fun m!1308707 () Bool)

(assert (=> b!1417938 m!1308707))

(declare-fun m!1308709 () Bool)

(assert (=> b!1417938 m!1308709))

(assert (=> b!1417938 m!1308705))

(declare-fun m!1308711 () Bool)

(assert (=> b!1417938 m!1308711))

(assert (=> b!1417941 m!1308705))

(assert (=> b!1417941 m!1308705))

(declare-fun m!1308713 () Bool)

(assert (=> b!1417941 m!1308713))

(declare-fun m!1308715 () Bool)

(assert (=> bm!67234 m!1308715))

(assert (=> b!1417897 d!152767))

(push 1)

