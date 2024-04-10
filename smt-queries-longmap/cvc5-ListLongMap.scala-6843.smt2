; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86150 () Bool)

(assert start!86150)

(declare-fun b!997733 () Bool)

(declare-fun res!667692 () Bool)

(declare-fun e!562710 () Bool)

(assert (=> b!997733 (=> (not res!667692) (not e!562710))))

(declare-datatypes ((array!63104 0))(
  ( (array!63105 (arr!30382 (Array (_ BitVec 32) (_ BitVec 64))) (size!30884 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63104)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997733 (= res!667692 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997734 () Bool)

(declare-fun res!667697 () Bool)

(assert (=> b!997734 (=> (not res!667697) (not e!562710))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997734 (= res!667697 (validKeyInArray!0 (select (arr!30382 a!3219) j!170)))))

(declare-fun res!667690 () Bool)

(assert (=> start!86150 (=> (not res!667690) (not e!562710))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86150 (= res!667690 (validMask!0 mask!3464))))

(assert (=> start!86150 e!562710))

(declare-fun array_inv!23506 (array!63104) Bool)

(assert (=> start!86150 (array_inv!23506 a!3219)))

(assert (=> start!86150 true))

(declare-fun b!997735 () Bool)

(declare-fun res!667694 () Bool)

(declare-fun e!562711 () Bool)

(assert (=> b!997735 (=> (not res!667694) (not e!562711))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997735 (= res!667694 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30884 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30884 a!3219))))))

(declare-fun b!997736 () Bool)

(declare-fun res!667698 () Bool)

(assert (=> b!997736 (=> (not res!667698) (not e!562711))))

(declare-datatypes ((List!21058 0))(
  ( (Nil!21055) (Cons!21054 (h!22222 (_ BitVec 64)) (t!30059 List!21058)) )
))
(declare-fun arrayNoDuplicates!0 (array!63104 (_ BitVec 32) List!21058) Bool)

(assert (=> b!997736 (= res!667698 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21055))))

(declare-fun b!997737 () Bool)

(declare-fun res!667696 () Bool)

(declare-fun e!562709 () Bool)

(assert (=> b!997737 (=> (not res!667696) (not e!562709))))

(declare-datatypes ((SeekEntryResult!9314 0))(
  ( (MissingZero!9314 (index!39627 (_ BitVec 32))) (Found!9314 (index!39628 (_ BitVec 32))) (Intermediate!9314 (undefined!10126 Bool) (index!39629 (_ BitVec 32)) (x!87060 (_ BitVec 32))) (Undefined!9314) (MissingVacant!9314 (index!39630 (_ BitVec 32))) )
))
(declare-fun lt!441515 () SeekEntryResult!9314)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63104 (_ BitVec 32)) SeekEntryResult!9314)

(assert (=> b!997737 (= res!667696 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30382 a!3219) j!170) a!3219 mask!3464) lt!441515))))

(declare-fun b!997738 () Bool)

(declare-fun res!667689 () Bool)

(assert (=> b!997738 (=> (not res!667689) (not e!562710))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997738 (= res!667689 (and (= (size!30884 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30884 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30884 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997739 () Bool)

(assert (=> b!997739 (= e!562711 e!562709)))

(declare-fun res!667691 () Bool)

(assert (=> b!997739 (=> (not res!667691) (not e!562709))))

(declare-fun lt!441513 () (_ BitVec 32))

(assert (=> b!997739 (= res!667691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!441513 (select (arr!30382 a!3219) j!170) a!3219 mask!3464) lt!441515))))

(assert (=> b!997739 (= lt!441515 (Intermediate!9314 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997739 (= lt!441513 (toIndex!0 (select (arr!30382 a!3219) j!170) mask!3464))))

(declare-fun b!997740 () Bool)

(declare-fun res!667695 () Bool)

(assert (=> b!997740 (=> (not res!667695) (not e!562710))))

(assert (=> b!997740 (= res!667695 (validKeyInArray!0 k!2224))))

(declare-fun b!997741 () Bool)

(assert (=> b!997741 (= e!562710 e!562711)))

(declare-fun res!667688 () Bool)

(assert (=> b!997741 (=> (not res!667688) (not e!562711))))

(declare-fun lt!441514 () SeekEntryResult!9314)

(assert (=> b!997741 (= res!667688 (or (= lt!441514 (MissingVacant!9314 i!1194)) (= lt!441514 (MissingZero!9314 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63104 (_ BitVec 32)) SeekEntryResult!9314)

(assert (=> b!997741 (= lt!441514 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!997742 () Bool)

(assert (=> b!997742 (= e!562709 (and (bvsge mask!3464 #b00000000000000000000000000000000) (or (bvslt lt!441513 #b00000000000000000000000000000000) (bvsge lt!441513 (bvadd #b00000000000000000000000000000001 mask!3464)))))))

(declare-fun b!997743 () Bool)

(declare-fun res!667693 () Bool)

(assert (=> b!997743 (=> (not res!667693) (not e!562711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63104 (_ BitVec 32)) Bool)

(assert (=> b!997743 (= res!667693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86150 res!667690) b!997738))

(assert (= (and b!997738 res!667689) b!997734))

(assert (= (and b!997734 res!667697) b!997740))

(assert (= (and b!997740 res!667695) b!997733))

(assert (= (and b!997733 res!667692) b!997741))

(assert (= (and b!997741 res!667688) b!997743))

(assert (= (and b!997743 res!667693) b!997736))

(assert (= (and b!997736 res!667698) b!997735))

(assert (= (and b!997735 res!667694) b!997739))

(assert (= (and b!997739 res!667691) b!997737))

(assert (= (and b!997737 res!667696) b!997742))

(declare-fun m!924485 () Bool)

(assert (=> b!997733 m!924485))

(declare-fun m!924487 () Bool)

(assert (=> b!997743 m!924487))

(declare-fun m!924489 () Bool)

(assert (=> b!997739 m!924489))

(assert (=> b!997739 m!924489))

(declare-fun m!924491 () Bool)

(assert (=> b!997739 m!924491))

(assert (=> b!997739 m!924489))

(declare-fun m!924493 () Bool)

(assert (=> b!997739 m!924493))

(declare-fun m!924495 () Bool)

(assert (=> b!997741 m!924495))

(declare-fun m!924497 () Bool)

(assert (=> b!997740 m!924497))

(declare-fun m!924499 () Bool)

(assert (=> start!86150 m!924499))

(declare-fun m!924501 () Bool)

(assert (=> start!86150 m!924501))

(declare-fun m!924503 () Bool)

(assert (=> b!997736 m!924503))

(assert (=> b!997734 m!924489))

(assert (=> b!997734 m!924489))

(declare-fun m!924505 () Bool)

(assert (=> b!997734 m!924505))

(assert (=> b!997737 m!924489))

(assert (=> b!997737 m!924489))

(declare-fun m!924507 () Bool)

(assert (=> b!997737 m!924507))

(push 1)

(assert (not b!997741))

(assert (not start!86150))

(assert (not b!997736))

(assert (not b!997739))

(assert (not b!997743))

(assert (not b!997737))

(assert (not b!997734))

(assert (not b!997733))

(assert (not b!997740))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!119105 () Bool)

(declare-fun res!667770 () Bool)

(declare-fun e!562744 () Bool)

(assert (=> d!119105 (=> res!667770 e!562744)))

(assert (=> d!119105 (= res!667770 (bvsge #b00000000000000000000000000000000 (size!30884 a!3219)))))

(assert (=> d!119105 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562744)))

(declare-fun b!997818 () Bool)

(declare-fun e!562743 () Bool)

(assert (=> b!997818 (= e!562744 e!562743)))

(declare-fun c!101168 () Bool)

(assert (=> b!997818 (= c!101168 (validKeyInArray!0 (select (arr!30382 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997819 () Bool)

(declare-fun e!562742 () Bool)

(assert (=> b!997819 (= e!562743 e!562742)))

(declare-fun lt!441540 () (_ BitVec 64))

(assert (=> b!997819 (= lt!441540 (select (arr!30382 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32980 0))(
  ( (Unit!32981) )
))
(declare-fun lt!441542 () Unit!32980)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63104 (_ BitVec 64) (_ BitVec 32)) Unit!32980)

(assert (=> b!997819 (= lt!441542 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441540 #b00000000000000000000000000000000))))

(assert (=> b!997819 (arrayContainsKey!0 a!3219 lt!441540 #b00000000000000000000000000000000)))

(declare-fun lt!441541 () Unit!32980)

(assert (=> b!997819 (= lt!441541 lt!441542)))

(declare-fun res!667769 () Bool)

(assert (=> b!997819 (= res!667769 (= (seekEntryOrOpen!0 (select (arr!30382 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9314 #b00000000000000000000000000000000)))))

(assert (=> b!997819 (=> (not res!667769) (not e!562742))))

(declare-fun bm!42257 () Bool)

(declare-fun call!42260 () Bool)

(assert (=> bm!42257 (= call!42260 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!997820 () Bool)

(assert (=> b!997820 (= e!562742 call!42260)))

(declare-fun b!997821 () Bool)

(assert (=> b!997821 (= e!562743 call!42260)))

(assert (= (and d!119105 (not res!667770)) b!997818))

(assert (= (and b!997818 c!101168) b!997819))

(assert (= (and b!997818 (not c!101168)) b!997821))

(assert (= (and b!997819 res!667769) b!997820))

(assert (= (or b!997820 b!997821) bm!42257))

(declare-fun m!924557 () Bool)

(assert (=> b!997818 m!924557))

(assert (=> b!997818 m!924557))

(declare-fun m!924559 () Bool)

(assert (=> b!997818 m!924559))

(assert (=> b!997819 m!924557))

(declare-fun m!924561 () Bool)

(assert (=> b!997819 m!924561))

(declare-fun m!924563 () Bool)

(assert (=> b!997819 m!924563))

(assert (=> b!997819 m!924557))

(declare-fun m!924565 () Bool)

(assert (=> b!997819 m!924565))

(declare-fun m!924567 () Bool)

(assert (=> bm!42257 m!924567))

(assert (=> b!997743 d!119105))

(declare-fun b!997860 () Bool)

(declare-fun e!562768 () Bool)

(declare-fun lt!441561 () SeekEntryResult!9314)

(assert (=> b!997860 (= e!562768 (bvsge (x!87060 lt!441561) #b01111111111111111111111111111110))))

(declare-fun b!997861 () Bool)

(assert (=> b!997861 (and (bvsge (index!39629 lt!441561) #b00000000000000000000000000000000) (bvslt (index!39629 lt!441561) (size!30884 a!3219)))))

(declare-fun e!562772 () Bool)

(assert (=> b!997861 (= e!562772 (= (select (arr!30382 a!3219) (index!39629 lt!441561)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!997862 () Bool)

(declare-fun e!562771 () SeekEntryResult!9314)

(assert (=> b!997862 (= e!562771 (Intermediate!9314 false index!1507 x!1245))))

(declare-fun d!119113 () Bool)

(assert (=> d!119113 e!562768))

(declare-fun c!101183 () Bool)

(assert (=> d!119113 (= c!101183 (and (is-Intermediate!9314 lt!441561) (undefined!10126 lt!441561)))))

(declare-fun e!562770 () SeekEntryResult!9314)

(assert (=> d!119113 (= lt!441561 e!562770)))

(declare-fun c!101184 () Bool)

(assert (=> d!119113 (= c!101184 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!441560 () (_ BitVec 64))

(assert (=> d!119113 (= lt!441560 (select (arr!30382 a!3219) index!1507))))

(assert (=> d!119113 (validMask!0 mask!3464)))

(assert (=> d!119113 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30382 a!3219) j!170) a!3219 mask!3464) lt!441561)))

(declare-fun b!997863 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997863 (= e!562771 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30382 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997864 () Bool)

(assert (=> b!997864 (= e!562770 (Intermediate!9314 true index!1507 x!1245))))

(declare-fun b!997865 () Bool)

(assert (=> b!997865 (and (bvsge (index!39629 lt!441561) #b00000000000000000000000000000000) (bvslt (index!39629 lt!441561) (size!30884 a!3219)))))

(declare-fun res!667783 () Bool)

(assert (=> b!997865 (= res!667783 (= (select (arr!30382 a!3219) (index!39629 lt!441561)) (select (arr!30382 a!3219) j!170)))))

(assert (=> b!997865 (=> res!667783 e!562772)))

(declare-fun e!562769 () Bool)

(assert (=> b!997865 (= e!562769 e!562772)))

(declare-fun b!997866 () Bool)

(assert (=> b!997866 (= e!562770 e!562771)))

(declare-fun c!101182 () Bool)

(assert (=> b!997866 (= c!101182 (or (= lt!441560 (select (arr!30382 a!3219) j!170)) (= (bvadd lt!441560 lt!441560) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!997867 () Bool)

(assert (=> b!997867 (and (bvsge (index!39629 lt!441561) #b00000000000000000000000000000000) (bvslt (index!39629 lt!441561) (size!30884 a!3219)))))

(declare-fun res!667785 () Bool)

(assert (=> b!997867 (= res!667785 (= (select (arr!30382 a!3219) (index!39629 lt!441561)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997867 (=> res!667785 e!562772)))

(declare-fun b!997868 () Bool)

(assert (=> b!997868 (= e!562768 e!562769)))

(declare-fun res!667784 () Bool)

(assert (=> b!997868 (= res!667784 (and (is-Intermediate!9314 lt!441561) (not (undefined!10126 lt!441561)) (bvslt (x!87060 lt!441561) #b01111111111111111111111111111110) (bvsge (x!87060 lt!441561) #b00000000000000000000000000000000) (bvsge (x!87060 lt!441561) x!1245)))))

(assert (=> b!997868 (=> (not res!667784) (not e!562769))))

(assert (= (and d!119113 c!101184) b!997864))

(assert (= (and d!119113 (not c!101184)) b!997866))

(assert (= (and b!997866 c!101182) b!997862))

(assert (= (and b!997866 (not c!101182)) b!997863))

(assert (= (and d!119113 c!101183) b!997860))

(assert (= (and d!119113 (not c!101183)) b!997868))

(assert (= (and b!997868 res!667784) b!997865))

(assert (= (and b!997865 (not res!667783)) b!997867))

(assert (= (and b!997867 (not res!667785)) b!997861))

(declare-fun m!924581 () Bool)

(assert (=> b!997863 m!924581))

(assert (=> b!997863 m!924581))

(assert (=> b!997863 m!924489))

(declare-fun m!924583 () Bool)

(assert (=> b!997863 m!924583))

(declare-fun m!924585 () Bool)

(assert (=> d!119113 m!924585))

(assert (=> d!119113 m!924499))

(declare-fun m!924587 () Bool)

(assert (=> b!997865 m!924587))

(assert (=> b!997867 m!924587))

(assert (=> b!997861 m!924587))

(assert (=> b!997737 d!119113))

(declare-fun d!119123 () Bool)

(assert (=> d!119123 (= (validKeyInArray!0 (select (arr!30382 a!3219) j!170)) (and (not (= (select (arr!30382 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30382 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997734 d!119123))

(declare-fun b!997879 () Bool)

(declare-fun e!562779 () Bool)

(declare-fun lt!441563 () SeekEntryResult!9314)

(assert (=> b!997879 (= e!562779 (bvsge (x!87060 lt!441563) #b01111111111111111111111111111110))))

(declare-fun b!997880 () Bool)

(assert (=> b!997880 (and (bvsge (index!39629 lt!441563) #b00000000000000000000000000000000) (bvslt (index!39629 lt!441563) (size!30884 a!3219)))))

(declare-fun e!562783 () Bool)

(assert (=> b!997880 (= e!562783 (= (select (arr!30382 a!3219) (index!39629 lt!441563)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!997881 () Bool)

(declare-fun e!562782 () SeekEntryResult!9314)

(assert (=> b!997881 (= e!562782 (Intermediate!9314 false lt!441513 #b00000000000000000000000000000000))))

(declare-fun d!119125 () Bool)

(assert (=> d!119125 e!562779))

(declare-fun c!101188 () Bool)

(assert (=> d!119125 (= c!101188 (and (is-Intermediate!9314 lt!441563) (undefined!10126 lt!441563)))))

(declare-fun e!562781 () SeekEntryResult!9314)

(assert (=> d!119125 (= lt!441563 e!562781)))

(declare-fun c!101189 () Bool)

(assert (=> d!119125 (= c!101189 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!441562 () (_ BitVec 64))

(assert (=> d!119125 (= lt!441562 (select (arr!30382 a!3219) lt!441513))))

(assert (=> d!119125 (validMask!0 mask!3464)))

(assert (=> d!119125 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!441513 (select (arr!30382 a!3219) j!170) a!3219 mask!3464) lt!441563)))

(declare-fun b!997882 () Bool)

(assert (=> b!997882 (= e!562782 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!441513 #b00000000000000000000000000000000 mask!3464) (select (arr!30382 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997883 () Bool)

(assert (=> b!997883 (= e!562781 (Intermediate!9314 true lt!441513 #b00000000000000000000000000000000))))

(declare-fun b!997884 () Bool)

(assert (=> b!997884 (and (bvsge (index!39629 lt!441563) #b00000000000000000000000000000000) (bvslt (index!39629 lt!441563) (size!30884 a!3219)))))

(declare-fun res!667792 () Bool)

(assert (=> b!997884 (= res!667792 (= (select (arr!30382 a!3219) (index!39629 lt!441563)) (select (arr!30382 a!3219) j!170)))))

(assert (=> b!997884 (=> res!667792 e!562783)))

(declare-fun e!562780 () Bool)

(assert (=> b!997884 (= e!562780 e!562783)))

(declare-fun b!997885 () Bool)

(assert (=> b!997885 (= e!562781 e!562782)))

(declare-fun c!101187 () Bool)

(assert (=> b!997885 (= c!101187 (or (= lt!441562 (select (arr!30382 a!3219) j!170)) (= (bvadd lt!441562 lt!441562) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!997886 () Bool)

(assert (=> b!997886 (and (bvsge (index!39629 lt!441563) #b00000000000000000000000000000000) (bvslt (index!39629 lt!441563) (size!30884 a!3219)))))

(declare-fun res!667794 () Bool)

(assert (=> b!997886 (= res!667794 (= (select (arr!30382 a!3219) (index!39629 lt!441563)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997886 (=> res!667794 e!562783)))

(declare-fun b!997887 () Bool)

(assert (=> b!997887 (= e!562779 e!562780)))

(declare-fun res!667793 () Bool)

(assert (=> b!997887 (= res!667793 (and (is-Intermediate!9314 lt!441563) (not (undefined!10126 lt!441563)) (bvslt (x!87060 lt!441563) #b01111111111111111111111111111110) (bvsge (x!87060 lt!441563) #b00000000000000000000000000000000) (bvsge (x!87060 lt!441563) #b00000000000000000000000000000000)))))

(assert (=> b!997887 (=> (not res!667793) (not e!562780))))

(assert (= (and d!119125 c!101189) b!997883))

(assert (= (and d!119125 (not c!101189)) b!997885))

(assert (= (and b!997885 c!101187) b!997881))

(assert (= (and b!997885 (not c!101187)) b!997882))

(assert (= (and d!119125 c!101188) b!997879))

(assert (= (and d!119125 (not c!101188)) b!997887))

(assert (= (and b!997887 res!667793) b!997884))

(assert (= (and b!997884 (not res!667792)) b!997886))

(assert (= (and b!997886 (not res!667794)) b!997880))

(declare-fun m!924589 () Bool)

(assert (=> b!997882 m!924589))

(assert (=> b!997882 m!924589))

(assert (=> b!997882 m!924489))

(declare-fun m!924591 () Bool)

(assert (=> b!997882 m!924591))

(declare-fun m!924593 () Bool)

(assert (=> d!119125 m!924593))

(assert (=> d!119125 m!924499))

(declare-fun m!924595 () Bool)

(assert (=> b!997884 m!924595))

(assert (=> b!997886 m!924595))

(assert (=> b!997880 m!924595))

(assert (=> b!997739 d!119125))

(declare-fun d!119127 () Bool)

(declare-fun lt!441571 () (_ BitVec 32))

(declare-fun lt!441570 () (_ BitVec 32))

(assert (=> d!119127 (= lt!441571 (bvmul (bvxor lt!441570 (bvlshr lt!441570 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119127 (= lt!441570 ((_ extract 31 0) (bvand (bvxor (select (arr!30382 a!3219) j!170) (bvlshr (select (arr!30382 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119127 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!667801 (let ((h!22225 ((_ extract 31 0) (bvand (bvxor (select (arr!30382 a!3219) j!170) (bvlshr (select (arr!30382 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87065 (bvmul (bvxor h!22225 (bvlshr h!22225 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87065 (bvlshr x!87065 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!667801 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!667801 #b00000000000000000000000000000000))))))

(assert (=> d!119127 (= (toIndex!0 (select (arr!30382 a!3219) j!170) mask!3464) (bvand (bvxor lt!441571 (bvlshr lt!441571 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!997739 d!119127))

(declare-fun d!119131 () Bool)

(declare-fun res!667813 () Bool)

(declare-fun e!562805 () Bool)

(assert (=> d!119131 (=> res!667813 e!562805)))

(assert (=> d!119131 (= res!667813 (= (select (arr!30382 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119131 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!562805)))

(declare-fun b!997916 () Bool)

(declare-fun e!562806 () Bool)

(assert (=> b!997916 (= e!562805 e!562806)))

(declare-fun res!667814 () Bool)

(assert (=> b!997916 (=> (not res!667814) (not e!562806))))

(assert (=> b!997916 (= res!667814 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30884 a!3219)))))

(declare-fun b!997917 () Bool)

(assert (=> b!997917 (= e!562806 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119131 (not res!667813)) b!997916))

(assert (= (and b!997916 res!667814) b!997917))

(assert (=> d!119131 m!924557))

(declare-fun m!924613 () Bool)

(assert (=> b!997917 m!924613))

(assert (=> b!997733 d!119131))

(declare-fun d!119135 () Bool)

(assert (=> d!119135 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997740 d!119135))

(declare-fun b!997937 () Bool)

(declare-fun e!562822 () Bool)

(declare-fun e!562820 () Bool)

(assert (=> b!997937 (= e!562822 e!562820)))

(declare-fun res!667825 () Bool)

(assert (=> b!997937 (=> (not res!667825) (not e!562820))))

(declare-fun e!562821 () Bool)

(assert (=> b!997937 (= res!667825 (not e!562821))))

(declare-fun res!667824 () Bool)

(assert (=> b!997937 (=> (not res!667824) (not e!562821))))

(assert (=> b!997937 (= res!667824 (validKeyInArray!0 (select (arr!30382 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997938 () Bool)

(declare-fun e!562823 () Bool)

(assert (=> b!997938 (= e!562820 e!562823)))

(declare-fun c!101201 () Bool)

(assert (=> b!997938 (= c!101201 (validKeyInArray!0 (select (arr!30382 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997939 () Bool)

(declare-fun contains!5872 (List!21058 (_ BitVec 64)) Bool)

(assert (=> b!997939 (= e!562821 (contains!5872 Nil!21055 (select (arr!30382 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997940 () Bool)

(declare-fun call!42269 () Bool)

(assert (=> b!997940 (= e!562823 call!42269)))

(declare-fun b!997941 () Bool)

(assert (=> b!997941 (= e!562823 call!42269)))

(declare-fun bm!42266 () Bool)

(assert (=> bm!42266 (= call!42269 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101201 (Cons!21054 (select (arr!30382 a!3219) #b00000000000000000000000000000000) Nil!21055) Nil!21055)))))

(declare-fun d!119137 () Bool)

(declare-fun res!667826 () Bool)

(assert (=> d!119137 (=> res!667826 e!562822)))

(assert (=> d!119137 (= res!667826 (bvsge #b00000000000000000000000000000000 (size!30884 a!3219)))))

(assert (=> d!119137 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21055) e!562822)))

(assert (= (and d!119137 (not res!667826)) b!997937))

(assert (= (and b!997937 res!667824) b!997939))

(assert (= (and b!997937 res!667825) b!997938))

(assert (= (and b!997938 c!101201) b!997940))

(assert (= (and b!997938 (not c!101201)) b!997941))

(assert (= (or b!997940 b!997941) bm!42266))

(assert (=> b!997937 m!924557))

(assert (=> b!997937 m!924557))

(assert (=> b!997937 m!924559))

(assert (=> b!997938 m!924557))

(assert (=> b!997938 m!924557))

(assert (=> b!997938 m!924559))

(assert (=> b!997939 m!924557))

(assert (=> b!997939 m!924557))

(declare-fun m!924623 () Bool)

(assert (=> b!997939 m!924623))

(assert (=> bm!42266 m!924557))

(declare-fun m!924625 () Bool)

(assert (=> bm!42266 m!924625))

(assert (=> b!997736 d!119137))

(declare-fun d!119143 () Bool)

(assert (=> d!119143 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86150 d!119143))

(declare-fun d!119153 () Bool)

(assert (=> d!119153 (= (array_inv!23506 a!3219) (bvsge (size!30884 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86150 d!119153))

(declare-fun b!998029 () Bool)

(declare-fun c!101230 () Bool)

(declare-fun lt!441608 () (_ BitVec 64))

(assert (=> b!998029 (= c!101230 (= lt!441608 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!562880 () SeekEntryResult!9314)

(declare-fun e!562882 () SeekEntryResult!9314)

(assert (=> b!998029 (= e!562880 e!562882)))

(declare-fun d!119155 () Bool)

(declare-fun lt!441606 () SeekEntryResult!9314)

(assert (=> d!119155 (and (or (is-Undefined!9314 lt!441606) (not (is-Found!9314 lt!441606)) (and (bvsge (index!39628 lt!441606) #b00000000000000000000000000000000) (bvslt (index!39628 lt!441606) (size!30884 a!3219)))) (or (is-Undefined!9314 lt!441606) (is-Found!9314 lt!441606) (not (is-MissingZero!9314 lt!441606)) (and (bvsge (index!39627 lt!441606) #b00000000000000000000000000000000) (bvslt (index!39627 lt!441606) (size!30884 a!3219)))) (or (is-Undefined!9314 lt!441606) (is-Found!9314 lt!441606) (is-MissingZero!9314 lt!441606) (not (is-MissingVacant!9314 lt!441606)) (and (bvsge (index!39630 lt!441606) #b00000000000000000000000000000000) (bvslt (index!39630 lt!441606) (size!30884 a!3219)))) (or (is-Undefined!9314 lt!441606) (ite (is-Found!9314 lt!441606) (= (select (arr!30382 a!3219) (index!39628 lt!441606)) k!2224) (ite (is-MissingZero!9314 lt!441606) (= (select (arr!30382 a!3219) (index!39627 lt!441606)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9314 lt!441606) (= (select (arr!30382 a!3219) (index!39630 lt!441606)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!562881 () SeekEntryResult!9314)

(assert (=> d!119155 (= lt!441606 e!562881)))

(declare-fun c!101229 () Bool)

(declare-fun lt!441607 () SeekEntryResult!9314)

(assert (=> d!119155 (= c!101229 (and (is-Intermediate!9314 lt!441607) (undefined!10126 lt!441607)))))

(assert (=> d!119155 (= lt!441607 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119155 (validMask!0 mask!3464)))

(assert (=> d!119155 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!441606)))

(declare-fun b!998030 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63104 (_ BitVec 32)) SeekEntryResult!9314)

(assert (=> b!998030 (= e!562882 (seekKeyOrZeroReturnVacant!0 (x!87060 lt!441607) (index!39629 lt!441607) (index!39629 lt!441607) k!2224 a!3219 mask!3464))))

(declare-fun b!998031 () Bool)

(assert (=> b!998031 (= e!562881 e!562880)))

(assert (=> b!998031 (= lt!441608 (select (arr!30382 a!3219) (index!39629 lt!441607)))))

(declare-fun c!101231 () Bool)

(assert (=> b!998031 (= c!101231 (= lt!441608 k!2224))))

(declare-fun b!998032 () Bool)

(assert (=> b!998032 (= e!562881 Undefined!9314)))

(declare-fun b!998033 () Bool)

(assert (=> b!998033 (= e!562882 (MissingZero!9314 (index!39629 lt!441607)))))

(declare-fun b!998034 () Bool)

(assert (=> b!998034 (= e!562880 (Found!9314 (index!39629 lt!441607)))))

(assert (= (and d!119155 c!101229) b!998032))

(assert (= (and d!119155 (not c!101229)) b!998031))

(assert (= (and b!998031 c!101231) b!998034))

(assert (= (and b!998031 (not c!101231)) b!998029))

(assert (= (and b!998029 c!101230) b!998033))

(assert (= (and b!998029 (not c!101230)) b!998030))

(declare-fun m!924651 () Bool)

(assert (=> d!119155 m!924651))

(declare-fun m!924653 () Bool)

(assert (=> d!119155 m!924653))

(declare-fun m!924655 () Bool)

(assert (=> d!119155 m!924655))

(assert (=> d!119155 m!924499))

(assert (=> d!119155 m!924653))

(declare-fun m!924657 () Bool)

(assert (=> d!119155 m!924657))

(declare-fun m!924659 () Bool)

(assert (=> d!119155 m!924659))

(declare-fun m!924661 () Bool)

(assert (=> b!998030 m!924661))

(declare-fun m!924663 () Bool)

(assert (=> b!998031 m!924663))

(assert (=> b!997741 d!119155))

(push 1)

(assert (not b!997937))

(assert (not d!119155))

(assert (not b!997819))

(assert (not d!119113))

(assert (not b!997818))

(assert (not b!997917))

(assert (not b!997939))

(assert (not b!998030))

(assert (not b!997863))

(assert (not bm!42257))

(assert (not b!997882))

(assert (not bm!42266))

(assert (not d!119125))

(assert (not b!997938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

