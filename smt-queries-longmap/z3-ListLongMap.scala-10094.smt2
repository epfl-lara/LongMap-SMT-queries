; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119180 () Bool)

(assert start!119180)

(declare-fun b!1390105 () Bool)

(declare-fun res!929654 () Bool)

(declare-fun e!787549 () Bool)

(assert (=> b!1390105 (=> (not res!929654) (not e!787549))))

(declare-datatypes ((array!95099 0))(
  ( (array!95100 (arr!45916 (Array (_ BitVec 32) (_ BitVec 64))) (size!46467 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95099)

(declare-datatypes ((List!32422 0))(
  ( (Nil!32419) (Cons!32418 (h!33641 (_ BitVec 64)) (t!47108 List!32422)) )
))
(declare-fun arrayNoDuplicates!0 (array!95099 (_ BitVec 32) List!32422) Bool)

(assert (=> b!1390105 (= res!929654 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32419))))

(declare-fun b!1390106 () Bool)

(declare-fun res!929655 () Bool)

(assert (=> b!1390106 (=> (not res!929655) (not e!787549))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390106 (= res!929655 (validKeyInArray!0 (select (arr!45916 a!2901) j!112)))))

(declare-fun b!1390107 () Bool)

(declare-fun res!929653 () Bool)

(assert (=> b!1390107 (=> (not res!929653) (not e!787549))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390107 (= res!929653 (and (= (size!46467 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46467 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46467 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390108 () Bool)

(declare-fun res!929651 () Bool)

(assert (=> b!1390108 (=> (not res!929651) (not e!787549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95099 (_ BitVec 32)) Bool)

(assert (=> b!1390108 (= res!929651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390109 () Bool)

(assert (=> b!1390109 (= e!787549 (and (bvsge mask!2840 #b00000000000000000000000000000000) (bvsgt mask!2840 #b00111111111111111111111111111111)))))

(declare-fun res!929652 () Bool)

(assert (=> start!119180 (=> (not res!929652) (not e!787549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119180 (= res!929652 (validMask!0 mask!2840))))

(assert (=> start!119180 e!787549))

(assert (=> start!119180 true))

(declare-fun array_inv!35197 (array!95099) Bool)

(assert (=> start!119180 (array_inv!35197 a!2901)))

(declare-fun b!1390110 () Bool)

(declare-fun res!929656 () Bool)

(assert (=> b!1390110 (=> (not res!929656) (not e!787549))))

(assert (=> b!1390110 (= res!929656 (validKeyInArray!0 (select (arr!45916 a!2901) i!1037)))))

(assert (= (and start!119180 res!929652) b!1390107))

(assert (= (and b!1390107 res!929653) b!1390110))

(assert (= (and b!1390110 res!929656) b!1390106))

(assert (= (and b!1390106 res!929655) b!1390108))

(assert (= (and b!1390108 res!929651) b!1390105))

(assert (= (and b!1390105 res!929654) b!1390109))

(declare-fun m!1276051 () Bool)

(assert (=> start!119180 m!1276051))

(declare-fun m!1276053 () Bool)

(assert (=> start!119180 m!1276053))

(declare-fun m!1276055 () Bool)

(assert (=> b!1390105 m!1276055))

(declare-fun m!1276057 () Bool)

(assert (=> b!1390110 m!1276057))

(assert (=> b!1390110 m!1276057))

(declare-fun m!1276059 () Bool)

(assert (=> b!1390110 m!1276059))

(declare-fun m!1276061 () Bool)

(assert (=> b!1390108 m!1276061))

(declare-fun m!1276063 () Bool)

(assert (=> b!1390106 m!1276063))

(assert (=> b!1390106 m!1276063))

(declare-fun m!1276065 () Bool)

(assert (=> b!1390106 m!1276065))

(check-sat (not b!1390108) (not start!119180) (not b!1390106) (not b!1390110) (not b!1390105))
(check-sat)
(get-model)

(declare-fun d!150415 () Bool)

(assert (=> d!150415 (= (validKeyInArray!0 (select (arr!45916 a!2901) j!112)) (and (not (= (select (arr!45916 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45916 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1390106 d!150415))

(declare-fun bm!66720 () Bool)

(declare-fun call!66723 () Bool)

(assert (=> bm!66720 (= call!66723 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1390155 () Bool)

(declare-fun e!787570 () Bool)

(assert (=> b!1390155 (= e!787570 call!66723)))

(declare-fun b!1390156 () Bool)

(declare-fun e!787569 () Bool)

(assert (=> b!1390156 (= e!787569 e!787570)))

(declare-fun lt!610856 () (_ BitVec 64))

(assert (=> b!1390156 (= lt!610856 (select (arr!45916 a!2901) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!46363 0))(
  ( (Unit!46364) )
))
(declare-fun lt!610855 () Unit!46363)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95099 (_ BitVec 64) (_ BitVec 32)) Unit!46363)

(assert (=> b!1390156 (= lt!610855 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!610856 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1390156 (arrayContainsKey!0 a!2901 lt!610856 #b00000000000000000000000000000000)))

(declare-fun lt!610854 () Unit!46363)

(assert (=> b!1390156 (= lt!610854 lt!610855)))

(declare-fun res!929697 () Bool)

(declare-datatypes ((SeekEntryResult!10152 0))(
  ( (MissingZero!10152 (index!42979 (_ BitVec 32))) (Found!10152 (index!42980 (_ BitVec 32))) (Intermediate!10152 (undefined!10964 Bool) (index!42981 (_ BitVec 32)) (x!124782 (_ BitVec 32))) (Undefined!10152) (MissingVacant!10152 (index!42982 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95099 (_ BitVec 32)) SeekEntryResult!10152)

(assert (=> b!1390156 (= res!929697 (= (seekEntryOrOpen!0 (select (arr!45916 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10152 #b00000000000000000000000000000000)))))

(assert (=> b!1390156 (=> (not res!929697) (not e!787570))))

(declare-fun d!150417 () Bool)

(declare-fun res!929698 () Bool)

(declare-fun e!787571 () Bool)

(assert (=> d!150417 (=> res!929698 e!787571)))

(assert (=> d!150417 (= res!929698 (bvsge #b00000000000000000000000000000000 (size!46467 a!2901)))))

(assert (=> d!150417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!787571)))

(declare-fun b!1390157 () Bool)

(assert (=> b!1390157 (= e!787569 call!66723)))

(declare-fun b!1390158 () Bool)

(assert (=> b!1390158 (= e!787571 e!787569)))

(declare-fun c!129679 () Bool)

(assert (=> b!1390158 (= c!129679 (validKeyInArray!0 (select (arr!45916 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150417 (not res!929698)) b!1390158))

(assert (= (and b!1390158 c!129679) b!1390156))

(assert (= (and b!1390158 (not c!129679)) b!1390157))

(assert (= (and b!1390156 res!929697) b!1390155))

(assert (= (or b!1390155 b!1390157) bm!66720))

(declare-fun m!1276099 () Bool)

(assert (=> bm!66720 m!1276099))

(declare-fun m!1276101 () Bool)

(assert (=> b!1390156 m!1276101))

(declare-fun m!1276103 () Bool)

(assert (=> b!1390156 m!1276103))

(declare-fun m!1276105 () Bool)

(assert (=> b!1390156 m!1276105))

(assert (=> b!1390156 m!1276101))

(declare-fun m!1276107 () Bool)

(assert (=> b!1390156 m!1276107))

(assert (=> b!1390158 m!1276101))

(assert (=> b!1390158 m!1276101))

(declare-fun m!1276109 () Bool)

(assert (=> b!1390158 m!1276109))

(assert (=> b!1390108 d!150417))

(declare-fun d!150425 () Bool)

(assert (=> d!150425 (= (validKeyInArray!0 (select (arr!45916 a!2901) i!1037)) (and (not (= (select (arr!45916 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45916 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1390110 d!150425))

(declare-fun b!1390169 () Bool)

(declare-fun e!787582 () Bool)

(declare-fun call!66726 () Bool)

(assert (=> b!1390169 (= e!787582 call!66726)))

(declare-fun b!1390170 () Bool)

(declare-fun e!787581 () Bool)

(declare-fun e!787580 () Bool)

(assert (=> b!1390170 (= e!787581 e!787580)))

(declare-fun res!929705 () Bool)

(assert (=> b!1390170 (=> (not res!929705) (not e!787580))))

(declare-fun e!787583 () Bool)

(assert (=> b!1390170 (= res!929705 (not e!787583))))

(declare-fun res!929707 () Bool)

(assert (=> b!1390170 (=> (not res!929707) (not e!787583))))

(assert (=> b!1390170 (= res!929707 (validKeyInArray!0 (select (arr!45916 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1390171 () Bool)

(assert (=> b!1390171 (= e!787580 e!787582)))

(declare-fun c!129682 () Bool)

(assert (=> b!1390171 (= c!129682 (validKeyInArray!0 (select (arr!45916 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66723 () Bool)

(assert (=> bm!66723 (= call!66726 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129682 (Cons!32418 (select (arr!45916 a!2901) #b00000000000000000000000000000000) Nil!32419) Nil!32419)))))

(declare-fun b!1390172 () Bool)

(assert (=> b!1390172 (= e!787582 call!66726)))

(declare-fun d!150427 () Bool)

(declare-fun res!929706 () Bool)

(assert (=> d!150427 (=> res!929706 e!787581)))

(assert (=> d!150427 (= res!929706 (bvsge #b00000000000000000000000000000000 (size!46467 a!2901)))))

(assert (=> d!150427 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32419) e!787581)))

(declare-fun b!1390173 () Bool)

(declare-fun contains!9798 (List!32422 (_ BitVec 64)) Bool)

(assert (=> b!1390173 (= e!787583 (contains!9798 Nil!32419 (select (arr!45916 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150427 (not res!929706)) b!1390170))

(assert (= (and b!1390170 res!929707) b!1390173))

(assert (= (and b!1390170 res!929705) b!1390171))

(assert (= (and b!1390171 c!129682) b!1390169))

(assert (= (and b!1390171 (not c!129682)) b!1390172))

(assert (= (or b!1390169 b!1390172) bm!66723))

(assert (=> b!1390170 m!1276101))

(assert (=> b!1390170 m!1276101))

(assert (=> b!1390170 m!1276109))

(assert (=> b!1390171 m!1276101))

(assert (=> b!1390171 m!1276101))

(assert (=> b!1390171 m!1276109))

(assert (=> bm!66723 m!1276101))

(declare-fun m!1276111 () Bool)

(assert (=> bm!66723 m!1276111))

(assert (=> b!1390173 m!1276101))

(assert (=> b!1390173 m!1276101))

(declare-fun m!1276113 () Bool)

(assert (=> b!1390173 m!1276113))

(assert (=> b!1390105 d!150427))

(declare-fun d!150429 () Bool)

(assert (=> d!150429 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119180 d!150429))

(declare-fun d!150445 () Bool)

(assert (=> d!150445 (= (array_inv!35197 a!2901) (bvsge (size!46467 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119180 d!150445))

(check-sat (not b!1390171) (not b!1390170) (not bm!66720) (not b!1390156) (not b!1390158) (not bm!66723) (not b!1390173))
(check-sat)
