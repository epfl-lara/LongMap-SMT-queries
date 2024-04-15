; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104496 () Bool)

(assert start!104496)

(declare-fun res!832002 () Bool)

(declare-fun e!707113 () Bool)

(assert (=> start!104496 (=> (not res!832002) (not e!707113))))

(declare-datatypes ((array!80192 0))(
  ( (array!80193 (arr!38672 (Array (_ BitVec 32) (_ BitVec 64))) (size!39210 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80192)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104496 (= res!832002 (and (bvslt (size!39210 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39210 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39210 a!3892))))))

(assert (=> start!104496 e!707113))

(declare-fun array_inv!29655 (array!80192) Bool)

(assert (=> start!104496 (array_inv!29655 a!3892)))

(assert (=> start!104496 true))

(declare-fun b!1246743 () Bool)

(declare-fun res!832000 () Bool)

(assert (=> b!1246743 (=> (not res!832000) (not e!707113))))

(declare-datatypes ((List!27576 0))(
  ( (Nil!27573) (Cons!27572 (h!28781 (_ BitVec 64)) (t!41036 List!27576)) )
))
(declare-fun arrayNoDuplicates!0 (array!80192 (_ BitVec 32) List!27576) Bool)

(assert (=> b!1246743 (= res!832000 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27573))))

(declare-fun b!1246744 () Bool)

(declare-fun res!832001 () Bool)

(assert (=> b!1246744 (=> (not res!832001) (not e!707113))))

(assert (=> b!1246744 (= res!832001 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39210 a!3892)) (= newFrom!287 (size!39210 a!3892))))))

(declare-fun b!1246745 () Bool)

(assert (=> b!1246745 (= e!707113 (not (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27573)))))

(assert (= (and start!104496 res!832002) b!1246743))

(assert (= (and b!1246743 res!832000) b!1246744))

(assert (= (and b!1246744 res!832001) b!1246745))

(declare-fun m!1148035 () Bool)

(assert (=> start!104496 m!1148035))

(declare-fun m!1148037 () Bool)

(assert (=> b!1246743 m!1148037))

(declare-fun m!1148039 () Bool)

(assert (=> b!1246745 m!1148039))

(check-sat (not b!1246743) (not start!104496) (not b!1246745))
(check-sat)
(get-model)

(declare-fun call!61523 () Bool)

(declare-fun bm!61520 () Bool)

(declare-fun c!122061 () Bool)

(assert (=> bm!61520 (= call!61523 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!122061 (Cons!27572 (select (arr!38672 a!3892) from!3270) Nil!27573) Nil!27573)))))

(declare-fun b!1246774 () Bool)

(declare-fun e!707138 () Bool)

(assert (=> b!1246774 (= e!707138 call!61523)))

(declare-fun d!137557 () Bool)

(declare-fun res!832029 () Bool)

(declare-fun e!707137 () Bool)

(assert (=> d!137557 (=> res!832029 e!707137)))

(assert (=> d!137557 (= res!832029 (bvsge from!3270 (size!39210 a!3892)))))

(assert (=> d!137557 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27573) e!707137)))

(declare-fun b!1246775 () Bool)

(declare-fun e!707135 () Bool)

(declare-fun contains!7434 (List!27576 (_ BitVec 64)) Bool)

(assert (=> b!1246775 (= e!707135 (contains!7434 Nil!27573 (select (arr!38672 a!3892) from!3270)))))

(declare-fun b!1246776 () Bool)

(declare-fun e!707136 () Bool)

(assert (=> b!1246776 (= e!707136 e!707138)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1246776 (= c!122061 (validKeyInArray!0 (select (arr!38672 a!3892) from!3270)))))

(declare-fun b!1246777 () Bool)

(assert (=> b!1246777 (= e!707138 call!61523)))

(declare-fun b!1246778 () Bool)

(assert (=> b!1246778 (= e!707137 e!707136)))

(declare-fun res!832028 () Bool)

(assert (=> b!1246778 (=> (not res!832028) (not e!707136))))

(assert (=> b!1246778 (= res!832028 (not e!707135))))

(declare-fun res!832027 () Bool)

(assert (=> b!1246778 (=> (not res!832027) (not e!707135))))

(assert (=> b!1246778 (= res!832027 (validKeyInArray!0 (select (arr!38672 a!3892) from!3270)))))

(assert (= (and d!137557 (not res!832029)) b!1246778))

(assert (= (and b!1246778 res!832027) b!1246775))

(assert (= (and b!1246778 res!832028) b!1246776))

(assert (= (and b!1246776 c!122061) b!1246777))

(assert (= (and b!1246776 (not c!122061)) b!1246774))

(assert (= (or b!1246777 b!1246774) bm!61520))

(declare-fun m!1148053 () Bool)

(assert (=> bm!61520 m!1148053))

(declare-fun m!1148055 () Bool)

(assert (=> bm!61520 m!1148055))

(assert (=> b!1246775 m!1148053))

(assert (=> b!1246775 m!1148053))

(declare-fun m!1148057 () Bool)

(assert (=> b!1246775 m!1148057))

(assert (=> b!1246776 m!1148053))

(assert (=> b!1246776 m!1148053))

(declare-fun m!1148059 () Bool)

(assert (=> b!1246776 m!1148059))

(assert (=> b!1246778 m!1148053))

(assert (=> b!1246778 m!1148053))

(assert (=> b!1246778 m!1148059))

(assert (=> b!1246743 d!137557))

(declare-fun d!137563 () Bool)

(assert (=> d!137563 (= (array_inv!29655 a!3892) (bvsge (size!39210 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104496 d!137563))

(declare-fun c!122066 () Bool)

(declare-fun call!61528 () Bool)

(declare-fun bm!61525 () Bool)

(assert (=> bm!61525 (= call!61528 (arrayNoDuplicates!0 a!3892 (bvadd newFrom!287 #b00000000000000000000000000000001) (ite c!122066 (Cons!27572 (select (arr!38672 a!3892) newFrom!287) Nil!27573) Nil!27573)))))

(declare-fun b!1246799 () Bool)

(declare-fun e!707158 () Bool)

(assert (=> b!1246799 (= e!707158 call!61528)))

(declare-fun d!137565 () Bool)

(declare-fun res!832044 () Bool)

(declare-fun e!707157 () Bool)

(assert (=> d!137565 (=> res!832044 e!707157)))

(assert (=> d!137565 (= res!832044 (bvsge newFrom!287 (size!39210 a!3892)))))

(assert (=> d!137565 (= (arrayNoDuplicates!0 a!3892 newFrom!287 Nil!27573) e!707157)))

(declare-fun b!1246800 () Bool)

(declare-fun e!707155 () Bool)

(assert (=> b!1246800 (= e!707155 (contains!7434 Nil!27573 (select (arr!38672 a!3892) newFrom!287)))))

(declare-fun b!1246801 () Bool)

(declare-fun e!707156 () Bool)

(assert (=> b!1246801 (= e!707156 e!707158)))

(assert (=> b!1246801 (= c!122066 (validKeyInArray!0 (select (arr!38672 a!3892) newFrom!287)))))

(declare-fun b!1246802 () Bool)

(assert (=> b!1246802 (= e!707158 call!61528)))

(declare-fun b!1246803 () Bool)

(assert (=> b!1246803 (= e!707157 e!707156)))

(declare-fun res!832043 () Bool)

(assert (=> b!1246803 (=> (not res!832043) (not e!707156))))

(assert (=> b!1246803 (= res!832043 (not e!707155))))

(declare-fun res!832042 () Bool)

(assert (=> b!1246803 (=> (not res!832042) (not e!707155))))

(assert (=> b!1246803 (= res!832042 (validKeyInArray!0 (select (arr!38672 a!3892) newFrom!287)))))

(assert (= (and d!137565 (not res!832044)) b!1246803))

(assert (= (and b!1246803 res!832042) b!1246800))

(assert (= (and b!1246803 res!832043) b!1246801))

(assert (= (and b!1246801 c!122066) b!1246802))

(assert (= (and b!1246801 (not c!122066)) b!1246799))

(assert (= (or b!1246802 b!1246799) bm!61525))

(declare-fun m!1148061 () Bool)

(assert (=> bm!61525 m!1148061))

(declare-fun m!1148063 () Bool)

(assert (=> bm!61525 m!1148063))

(assert (=> b!1246800 m!1148061))

(assert (=> b!1246800 m!1148061))

(declare-fun m!1148065 () Bool)

(assert (=> b!1246800 m!1148065))

(assert (=> b!1246801 m!1148061))

(assert (=> b!1246801 m!1148061))

(declare-fun m!1148067 () Bool)

(assert (=> b!1246801 m!1148067))

(assert (=> b!1246803 m!1148061))

(assert (=> b!1246803 m!1148061))

(assert (=> b!1246803 m!1148067))

(assert (=> b!1246745 d!137565))

(check-sat (not b!1246800) (not b!1246775) (not b!1246776) (not bm!61525) (not b!1246801) (not bm!61520) (not b!1246778) (not b!1246803))
(check-sat)
