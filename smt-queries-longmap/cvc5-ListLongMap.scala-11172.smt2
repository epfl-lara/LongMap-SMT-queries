; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130598 () Bool)

(assert start!130598)

(declare-fun b!1532481 () Bool)

(declare-fun res!1049607 () Bool)

(declare-fun e!853849 () Bool)

(assert (=> b!1532481 (=> (not res!1049607) (not e!853849))))

(declare-datatypes ((array!101756 0))(
  ( (array!101757 (arr!49097 (Array (_ BitVec 32) (_ BitVec 64))) (size!49647 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101756)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532481 (= res!1049607 (and (= (size!49647 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49647 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49647 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532482 () Bool)

(declare-fun res!1049605 () Bool)

(assert (=> b!1532482 (=> (not res!1049605) (not e!853849))))

(assert (=> b!1532482 (= res!1049605 (and (bvsle #b00000000000000000000000000000000 (size!49647 a!2792)) (bvslt (size!49647 a!2792) #b01111111111111111111111111111111)))))

(declare-fun res!1049606 () Bool)

(assert (=> start!130598 (=> (not res!1049606) (not e!853849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130598 (= res!1049606 (validMask!0 mask!2480))))

(assert (=> start!130598 e!853849))

(assert (=> start!130598 true))

(declare-fun array_inv!38125 (array!101756) Bool)

(assert (=> start!130598 (array_inv!38125 a!2792)))

(declare-fun b!1532483 () Bool)

(declare-fun res!1049604 () Bool)

(assert (=> b!1532483 (=> (not res!1049604) (not e!853849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101756 (_ BitVec 32)) Bool)

(assert (=> b!1532483 (= res!1049604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532484 () Bool)

(declare-fun res!1049603 () Bool)

(assert (=> b!1532484 (=> (not res!1049603) (not e!853849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532484 (= res!1049603 (validKeyInArray!0 (select (arr!49097 a!2792) j!64)))))

(declare-fun b!1532485 () Bool)

(declare-fun res!1049608 () Bool)

(assert (=> b!1532485 (=> (not res!1049608) (not e!853849))))

(assert (=> b!1532485 (= res!1049608 (validKeyInArray!0 (select (arr!49097 a!2792) i!951)))))

(declare-fun b!1532486 () Bool)

(declare-datatypes ((List!35571 0))(
  ( (Nil!35568) (Cons!35567 (h!37012 (_ BitVec 64)) (t!50265 List!35571)) )
))
(declare-fun noDuplicate!2630 (List!35571) Bool)

(assert (=> b!1532486 (= e!853849 (not (noDuplicate!2630 Nil!35568)))))

(assert (= (and start!130598 res!1049606) b!1532481))

(assert (= (and b!1532481 res!1049607) b!1532485))

(assert (= (and b!1532485 res!1049608) b!1532484))

(assert (= (and b!1532484 res!1049603) b!1532483))

(assert (= (and b!1532483 res!1049604) b!1532482))

(assert (= (and b!1532482 res!1049605) b!1532486))

(declare-fun m!1415205 () Bool)

(assert (=> b!1532485 m!1415205))

(assert (=> b!1532485 m!1415205))

(declare-fun m!1415207 () Bool)

(assert (=> b!1532485 m!1415207))

(declare-fun m!1415209 () Bool)

(assert (=> start!130598 m!1415209))

(declare-fun m!1415211 () Bool)

(assert (=> start!130598 m!1415211))

(declare-fun m!1415213 () Bool)

(assert (=> b!1532483 m!1415213))

(declare-fun m!1415215 () Bool)

(assert (=> b!1532486 m!1415215))

(declare-fun m!1415217 () Bool)

(assert (=> b!1532484 m!1415217))

(assert (=> b!1532484 m!1415217))

(declare-fun m!1415219 () Bool)

(assert (=> b!1532484 m!1415219))

(push 1)

(assert (not b!1532484))

(assert (not b!1532486))

(assert (not start!130598))

(assert (not b!1532483))

(assert (not b!1532485))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!160075 () Bool)

(declare-fun res!1049649 () Bool)

(declare-fun e!853866 () Bool)

(assert (=> d!160075 (=> res!1049649 e!853866)))

(assert (=> d!160075 (= res!1049649 (is-Nil!35568 Nil!35568))))

(assert (=> d!160075 (= (noDuplicate!2630 Nil!35568) e!853866)))

(declare-fun b!1532527 () Bool)

(declare-fun e!853867 () Bool)

(assert (=> b!1532527 (= e!853866 e!853867)))

(declare-fun res!1049650 () Bool)

(assert (=> b!1532527 (=> (not res!1049650) (not e!853867))))

(declare-fun contains!10005 (List!35571 (_ BitVec 64)) Bool)

(assert (=> b!1532527 (= res!1049650 (not (contains!10005 (t!50265 Nil!35568) (h!37012 Nil!35568))))))

(declare-fun b!1532528 () Bool)

(assert (=> b!1532528 (= e!853867 (noDuplicate!2630 (t!50265 Nil!35568)))))

(assert (= (and d!160075 (not res!1049649)) b!1532527))

(assert (= (and b!1532527 res!1049650) b!1532528))

(declare-fun m!1415253 () Bool)

(assert (=> b!1532527 m!1415253))

(declare-fun m!1415255 () Bool)

(assert (=> b!1532528 m!1415255))

(assert (=> b!1532486 d!160075))

(declare-fun d!160077 () Bool)

(assert (=> d!160077 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!130598 d!160077))

(declare-fun d!160089 () Bool)

(assert (=> d!160089 (= (array_inv!38125 a!2792) (bvsge (size!49647 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!130598 d!160089))

(declare-fun d!160091 () Bool)

(declare-fun res!1049674 () Bool)

(declare-fun e!853897 () Bool)

(assert (=> d!160091 (=> res!1049674 e!853897)))

(assert (=> d!160091 (= res!1049674 (bvsge #b00000000000000000000000000000000 (size!49647 a!2792)))))

(assert (=> d!160091 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480) e!853897)))

(declare-fun b!1532561 () Bool)

(declare-fun e!853896 () Bool)

(declare-fun call!68568 () Bool)

(assert (=> b!1532561 (= e!853896 call!68568)))

(declare-fun bm!68565 () Bool)

(assert (=> bm!68565 (= call!68568 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2792 mask!2480))))

(declare-fun b!1532562 () Bool)

(declare-fun e!853895 () Bool)

(assert (=> b!1532562 (= e!853896 e!853895)))

(declare-fun lt!663682 () (_ BitVec 64))

(assert (=> b!1532562 (= lt!663682 (select (arr!49097 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51298 0))(
  ( (Unit!51299) )
))
(declare-fun lt!663680 () Unit!51298)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101756 (_ BitVec 64) (_ BitVec 32)) Unit!51298)

(assert (=> b!1532562 (= lt!663680 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2792 lt!663682 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1532562 (arrayContainsKey!0 a!2792 lt!663682 #b00000000000000000000000000000000)))

(declare-fun lt!663681 () Unit!51298)

(assert (=> b!1532562 (= lt!663681 lt!663680)))

(declare-fun res!1049673 () Bool)

(declare-datatypes ((SeekEntryResult!13255 0))(
  ( (MissingZero!13255 (index!55415 (_ BitVec 32))) (Found!13255 (index!55416 (_ BitVec 32))) (Intermediate!13255 (undefined!14067 Bool) (index!55417 (_ BitVec 32)) (x!137129 (_ BitVec 32))) (Undefined!13255) (MissingVacant!13255 (index!55418 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101756 (_ BitVec 32)) SeekEntryResult!13255)

(assert (=> b!1532562 (= res!1049673 (= (seekEntryOrOpen!0 (select (arr!49097 a!2792) #b00000000000000000000000000000000) a!2792 mask!2480) (Found!13255 #b00000000000000000000000000000000)))))

(assert (=> b!1532562 (=> (not res!1049673) (not e!853895))))

(declare-fun b!1532563 () Bool)

(assert (=> b!1532563 (= e!853895 call!68568)))

(declare-fun b!1532564 () Bool)

(assert (=> b!1532564 (= e!853897 e!853896)))

(declare-fun c!141002 () Bool)

(assert (=> b!1532564 (= c!141002 (validKeyInArray!0 (select (arr!49097 a!2792) #b00000000000000000000000000000000)))))

(assert (= (and d!160091 (not res!1049674)) b!1532564))

(assert (= (and b!1532564 c!141002) b!1532562))

(assert (= (and b!1532564 (not c!141002)) b!1532561))

(assert (= (and b!1532562 res!1049673) b!1532563))

(assert (= (or b!1532563 b!1532561) bm!68565))

(declare-fun m!1415277 () Bool)

(assert (=> bm!68565 m!1415277))

(declare-fun m!1415279 () Bool)

(assert (=> b!1532562 m!1415279))

(declare-fun m!1415281 () Bool)

(assert (=> b!1532562 m!1415281))

(declare-fun m!1415283 () Bool)

(assert (=> b!1532562 m!1415283))

(assert (=> b!1532562 m!1415279))

(declare-fun m!1415285 () Bool)

(assert (=> b!1532562 m!1415285))

(assert (=> b!1532564 m!1415279))

(assert (=> b!1532564 m!1415279))

(declare-fun m!1415287 () Bool)

(assert (=> b!1532564 m!1415287))

(assert (=> b!1532483 d!160091))

(declare-fun d!160105 () Bool)

(assert (=> d!160105 (= (validKeyInArray!0 (select (arr!49097 a!2792) j!64)) (and (not (= (select (arr!49097 a!2792) j!64) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49097 a!2792) j!64) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532484 d!160105))

(declare-fun d!160107 () Bool)

(assert (=> d!160107 (= (validKeyInArray!0 (select (arr!49097 a!2792) i!951)) (and (not (= (select (arr!49097 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49097 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532485 d!160107))

(push 1)

