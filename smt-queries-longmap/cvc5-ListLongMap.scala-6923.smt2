; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86950 () Bool)

(assert start!86950)

(declare-fun b!1008675 () Bool)

(declare-fun res!677697 () Bool)

(declare-fun e!567477 () Bool)

(assert (=> b!1008675 (=> (not res!677697) (not e!567477))))

(declare-datatypes ((array!63545 0))(
  ( (array!63546 (arr!30593 (Array (_ BitVec 32) (_ BitVec 64))) (size!31097 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63545)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008675 (= res!677697 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31097 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31097 a!3219))))))

(declare-fun b!1008676 () Bool)

(declare-fun res!677700 () Bool)

(declare-fun e!567479 () Bool)

(assert (=> b!1008676 (=> (not res!677700) (not e!567479))))

(declare-datatypes ((SeekEntryResult!9550 0))(
  ( (MissingZero!9550 (index!40571 (_ BitVec 32))) (Found!9550 (index!40572 (_ BitVec 32))) (Intermediate!9550 (undefined!10362 Bool) (index!40573 (_ BitVec 32)) (x!87967 (_ BitVec 32))) (Undefined!9550) (MissingVacant!9550 (index!40574 (_ BitVec 32))) )
))
(declare-fun lt!445698 () SeekEntryResult!9550)

(declare-fun lt!445693 () array!63545)

(declare-fun lt!445697 () (_ BitVec 64))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63545 (_ BitVec 32)) SeekEntryResult!9550)

(assert (=> b!1008676 (= res!677700 (not (= lt!445698 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445697 lt!445693 mask!3464))))))

(declare-fun b!1008677 () Bool)

(declare-fun e!567478 () Bool)

(declare-fun e!567481 () Bool)

(assert (=> b!1008677 (= e!567478 e!567481)))

(declare-fun res!677701 () Bool)

(assert (=> b!1008677 (=> (not res!677701) (not e!567481))))

(declare-fun lt!445694 () SeekEntryResult!9550)

(assert (=> b!1008677 (= res!677701 (= lt!445698 lt!445694))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1008677 (= lt!445698 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30593 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008678 () Bool)

(declare-fun res!677695 () Bool)

(assert (=> b!1008678 (=> (not res!677695) (not e!567477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63545 (_ BitVec 32)) Bool)

(assert (=> b!1008678 (= res!677695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008679 () Bool)

(assert (=> b!1008679 (= e!567477 e!567478)))

(declare-fun res!677694 () Bool)

(assert (=> b!1008679 (=> (not res!677694) (not e!567478))))

(declare-fun lt!445699 () SeekEntryResult!9550)

(assert (=> b!1008679 (= res!677694 (= lt!445699 lt!445694))))

(assert (=> b!1008679 (= lt!445694 (Intermediate!9550 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008679 (= lt!445699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30593 a!3219) j!170) mask!3464) (select (arr!30593 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008680 () Bool)

(assert (=> b!1008680 (= e!567481 e!567479)))

(declare-fun res!677705 () Bool)

(assert (=> b!1008680 (=> (not res!677705) (not e!567479))))

(assert (=> b!1008680 (= res!677705 (not (= lt!445699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445697 mask!3464) lt!445697 lt!445693 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1008680 (= lt!445697 (select (store (arr!30593 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008680 (= lt!445693 (array!63546 (store (arr!30593 a!3219) i!1194 k!2224) (size!31097 a!3219)))))

(declare-fun b!1008681 () Bool)

(declare-fun res!677696 () Bool)

(assert (=> b!1008681 (=> (not res!677696) (not e!567479))))

(assert (=> b!1008681 (= res!677696 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008682 () Bool)

(declare-fun e!567480 () Bool)

(assert (=> b!1008682 (= e!567480 e!567477)))

(declare-fun res!677703 () Bool)

(assert (=> b!1008682 (=> (not res!677703) (not e!567477))))

(declare-fun lt!445695 () SeekEntryResult!9550)

(assert (=> b!1008682 (= res!677703 (or (= lt!445695 (MissingVacant!9550 i!1194)) (= lt!445695 (MissingZero!9550 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63545 (_ BitVec 32)) SeekEntryResult!9550)

(assert (=> b!1008682 (= lt!445695 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1008683 () Bool)

(declare-fun res!677693 () Bool)

(assert (=> b!1008683 (=> (not res!677693) (not e!567477))))

(declare-datatypes ((List!21335 0))(
  ( (Nil!21332) (Cons!21331 (h!22517 (_ BitVec 64)) (t!30327 List!21335)) )
))
(declare-fun arrayNoDuplicates!0 (array!63545 (_ BitVec 32) List!21335) Bool)

(assert (=> b!1008683 (= res!677693 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21332))))

(declare-fun b!1008684 () Bool)

(declare-fun res!677692 () Bool)

(assert (=> b!1008684 (=> (not res!677692) (not e!567480))))

(assert (=> b!1008684 (= res!677692 (and (= (size!31097 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31097 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31097 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008685 () Bool)

(declare-fun res!677698 () Bool)

(assert (=> b!1008685 (=> (not res!677698) (not e!567480))))

(declare-fun arrayContainsKey!0 (array!63545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008685 (= res!677698 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008686 () Bool)

(declare-fun res!677699 () Bool)

(assert (=> b!1008686 (=> (not res!677699) (not e!567480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008686 (= res!677699 (validKeyInArray!0 k!2224))))

(declare-fun res!677704 () Bool)

(assert (=> start!86950 (=> (not res!677704) (not e!567480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86950 (= res!677704 (validMask!0 mask!3464))))

(assert (=> start!86950 e!567480))

(declare-fun array_inv!23736 (array!63545) Bool)

(assert (=> start!86950 (array_inv!23736 a!3219)))

(assert (=> start!86950 true))

(declare-fun b!1008687 () Bool)

(declare-fun res!677702 () Bool)

(assert (=> b!1008687 (=> (not res!677702) (not e!567480))))

(assert (=> b!1008687 (= res!677702 (validKeyInArray!0 (select (arr!30593 a!3219) j!170)))))

(declare-fun b!1008688 () Bool)

(assert (=> b!1008688 (= e!567479 (bvsgt (bvadd #b00000000000000000000000000000001 x!1245) resX!38))))

(declare-fun lt!445696 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008688 (= lt!445696 (nextIndex!0 index!1507 x!1245 mask!3464))))

(assert (= (and start!86950 res!677704) b!1008684))

(assert (= (and b!1008684 res!677692) b!1008687))

(assert (= (and b!1008687 res!677702) b!1008686))

(assert (= (and b!1008686 res!677699) b!1008685))

(assert (= (and b!1008685 res!677698) b!1008682))

(assert (= (and b!1008682 res!677703) b!1008678))

(assert (= (and b!1008678 res!677695) b!1008683))

(assert (= (and b!1008683 res!677693) b!1008675))

(assert (= (and b!1008675 res!677697) b!1008679))

(assert (= (and b!1008679 res!677694) b!1008677))

(assert (= (and b!1008677 res!677701) b!1008680))

(assert (= (and b!1008680 res!677705) b!1008676))

(assert (= (and b!1008676 res!677700) b!1008681))

(assert (= (and b!1008681 res!677696) b!1008688))

(declare-fun m!932845 () Bool)

(assert (=> b!1008678 m!932845))

(declare-fun m!932847 () Bool)

(assert (=> b!1008688 m!932847))

(declare-fun m!932849 () Bool)

(assert (=> b!1008687 m!932849))

(assert (=> b!1008687 m!932849))

(declare-fun m!932851 () Bool)

(assert (=> b!1008687 m!932851))

(assert (=> b!1008677 m!932849))

(assert (=> b!1008677 m!932849))

(declare-fun m!932853 () Bool)

(assert (=> b!1008677 m!932853))

(declare-fun m!932855 () Bool)

(assert (=> b!1008685 m!932855))

(declare-fun m!932857 () Bool)

(assert (=> b!1008676 m!932857))

(declare-fun m!932859 () Bool)

(assert (=> b!1008683 m!932859))

(declare-fun m!932861 () Bool)

(assert (=> start!86950 m!932861))

(declare-fun m!932863 () Bool)

(assert (=> start!86950 m!932863))

(declare-fun m!932865 () Bool)

(assert (=> b!1008680 m!932865))

(assert (=> b!1008680 m!932865))

(declare-fun m!932867 () Bool)

(assert (=> b!1008680 m!932867))

(declare-fun m!932869 () Bool)

(assert (=> b!1008680 m!932869))

(declare-fun m!932871 () Bool)

(assert (=> b!1008680 m!932871))

(declare-fun m!932873 () Bool)

(assert (=> b!1008682 m!932873))

(declare-fun m!932875 () Bool)

(assert (=> b!1008686 m!932875))

(assert (=> b!1008679 m!932849))

(assert (=> b!1008679 m!932849))

(declare-fun m!932877 () Bool)

(assert (=> b!1008679 m!932877))

(assert (=> b!1008679 m!932877))

(assert (=> b!1008679 m!932849))

(declare-fun m!932879 () Bool)

(assert (=> b!1008679 m!932879))

(push 1)

(assert (not b!1008678))

(assert (not b!1008683))

(assert (not b!1008686))

(assert (not b!1008687))

(assert (not b!1008676))

(assert (not start!86950))

(assert (not b!1008685))

(assert (not b!1008688))

(assert (not b!1008677))

(assert (not b!1008680))

(assert (not b!1008682))

(assert (not b!1008679))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1008800 () Bool)

(declare-fun e!567554 () Bool)

(declare-fun e!567552 () Bool)

(assert (=> b!1008800 (= e!567554 e!567552)))

(declare-fun res!677746 () Bool)

(declare-fun lt!445732 () SeekEntryResult!9550)

(assert (=> b!1008800 (= res!677746 (and (is-Intermediate!9550 lt!445732) (not (undefined!10362 lt!445732)) (bvslt (x!87967 lt!445732) #b01111111111111111111111111111110) (bvsge (x!87967 lt!445732) #b00000000000000000000000000000000) (bvsge (x!87967 lt!445732) x!1245)))))

(assert (=> b!1008800 (=> (not res!677746) (not e!567552))))

(declare-fun b!1008801 () Bool)

(assert (=> b!1008801 (and (bvsge (index!40573 lt!445732) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445732) (size!31097 lt!445693)))))

(declare-fun res!677747 () Bool)

(assert (=> b!1008801 (= res!677747 (= (select (arr!30593 lt!445693) (index!40573 lt!445732)) lt!445697))))

(declare-fun e!567551 () Bool)

(assert (=> b!1008801 (=> res!677747 e!567551)))

(assert (=> b!1008801 (= e!567552 e!567551)))

(declare-fun b!1008802 () Bool)

(assert (=> b!1008802 (and (bvsge (index!40573 lt!445732) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445732) (size!31097 lt!445693)))))

(assert (=> b!1008802 (= e!567551 (= (select (arr!30593 lt!445693) (index!40573 lt!445732)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1008804 () Bool)

(declare-fun e!567553 () SeekEntryResult!9550)

(assert (=> b!1008804 (= e!567553 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!445697 lt!445693 mask!3464))))

(declare-fun b!1008805 () Bool)

(assert (=> b!1008805 (= e!567554 (bvsge (x!87967 lt!445732) #b01111111111111111111111111111110))))

(declare-fun b!1008806 () Bool)

(assert (=> b!1008806 (= e!567553 (Intermediate!9550 false index!1507 x!1245))))

(declare-fun b!1008803 () Bool)

(assert (=> b!1008803 (and (bvsge (index!40573 lt!445732) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445732) (size!31097 lt!445693)))))

(declare-fun res!677748 () Bool)

(assert (=> b!1008803 (= res!677748 (= (select (arr!30593 lt!445693) (index!40573 lt!445732)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1008803 (=> res!677748 e!567551)))

(declare-fun d!119559 () Bool)

(assert (=> d!119559 e!567554))

(declare-fun c!101681 () Bool)

(assert (=> d!119559 (= c!101681 (and (is-Intermediate!9550 lt!445732) (undefined!10362 lt!445732)))))

(declare-fun e!567550 () SeekEntryResult!9550)

(assert (=> d!119559 (= lt!445732 e!567550)))

(declare-fun c!101682 () Bool)

(assert (=> d!119559 (= c!101682 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!445731 () (_ BitVec 64))

(assert (=> d!119559 (= lt!445731 (select (arr!30593 lt!445693) index!1507))))

(assert (=> d!119559 (validMask!0 mask!3464)))

(assert (=> d!119559 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445697 lt!445693 mask!3464) lt!445732)))

(declare-fun b!1008807 () Bool)

(assert (=> b!1008807 (= e!567550 e!567553)))

(declare-fun c!101683 () Bool)

(assert (=> b!1008807 (= c!101683 (or (= lt!445731 lt!445697) (= (bvadd lt!445731 lt!445731) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1008808 () Bool)

(assert (=> b!1008808 (= e!567550 (Intermediate!9550 true index!1507 x!1245))))

(assert (= (and d!119559 c!101682) b!1008808))

(assert (= (and d!119559 (not c!101682)) b!1008807))

(assert (= (and b!1008807 c!101683) b!1008806))

(assert (= (and b!1008807 (not c!101683)) b!1008804))

(assert (= (and d!119559 c!101681) b!1008805))

(assert (= (and d!119559 (not c!101681)) b!1008800))

(assert (= (and b!1008800 res!677746) b!1008801))

(assert (= (and b!1008801 (not res!677747)) b!1008803))

(assert (= (and b!1008803 (not res!677748)) b!1008802))

(declare-fun m!932921 () Bool)

(assert (=> b!1008803 m!932921))

(assert (=> b!1008804 m!932847))

(assert (=> b!1008804 m!932847))

(declare-fun m!932923 () Bool)

(assert (=> b!1008804 m!932923))

(declare-fun m!932925 () Bool)

(assert (=> d!119559 m!932925))

(assert (=> d!119559 m!932861))

(assert (=> b!1008802 m!932921))

(assert (=> b!1008801 m!932921))

(assert (=> b!1008676 d!119559))

(declare-fun d!119567 () Bool)

(assert (=> d!119567 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1008686 d!119567))

(declare-fun d!119569 () Bool)

(declare-fun res!677760 () Bool)

(declare-fun e!567569 () Bool)

(assert (=> d!119569 (=> res!677760 e!567569)))

(assert (=> d!119569 (= res!677760 (= (select (arr!30593 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119569 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!567569)))

(declare-fun b!1008831 () Bool)

(declare-fun e!567570 () Bool)

(assert (=> b!1008831 (= e!567569 e!567570)))

(declare-fun res!677761 () Bool)

(assert (=> b!1008831 (=> (not res!677761) (not e!567570))))

(assert (=> b!1008831 (= res!677761 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31097 a!3219)))))

(declare-fun b!1008832 () Bool)

(assert (=> b!1008832 (= e!567570 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119569 (not res!677760)) b!1008831))

(assert (= (and b!1008831 res!677761) b!1008832))

(declare-fun m!932945 () Bool)

(assert (=> d!119569 m!932945))

(declare-fun m!932947 () Bool)

(assert (=> b!1008832 m!932947))

(assert (=> b!1008685 d!119569))

(declare-fun b!1008849 () Bool)

(declare-fun e!567586 () Bool)

(declare-fun call!42346 () Bool)

(assert (=> b!1008849 (= e!567586 call!42346)))

(declare-fun b!1008850 () Bool)

(declare-fun e!567588 () Bool)

(declare-fun e!567587 () Bool)

(assert (=> b!1008850 (= e!567588 e!567587)))

(declare-fun res!677774 () Bool)

(assert (=> b!1008850 (=> (not res!677774) (not e!567587))))

(declare-fun e!567585 () Bool)

(assert (=> b!1008850 (= res!677774 (not e!567585))))

(declare-fun res!677776 () Bool)

(assert (=> b!1008850 (=> (not res!677776) (not e!567585))))

(assert (=> b!1008850 (= res!677776 (validKeyInArray!0 (select (arr!30593 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119581 () Bool)

(declare-fun res!677775 () Bool)

(assert (=> d!119581 (=> res!677775 e!567588)))

(assert (=> d!119581 (= res!677775 (bvsge #b00000000000000000000000000000000 (size!31097 a!3219)))))

(assert (=> d!119581 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21332) e!567588)))

(declare-fun b!1008851 () Bool)

(declare-fun contains!5861 (List!21335 (_ BitVec 64)) Bool)

(assert (=> b!1008851 (= e!567585 (contains!5861 Nil!21332 (select (arr!30593 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1008852 () Bool)

(assert (=> b!1008852 (= e!567586 call!42346)))

(declare-fun bm!42343 () Bool)

(declare-fun c!101692 () Bool)

(assert (=> bm!42343 (= call!42346 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101692 (Cons!21331 (select (arr!30593 a!3219) #b00000000000000000000000000000000) Nil!21332) Nil!21332)))))

(declare-fun b!1008853 () Bool)

(assert (=> b!1008853 (= e!567587 e!567586)))

(assert (=> b!1008853 (= c!101692 (validKeyInArray!0 (select (arr!30593 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119581 (not res!677775)) b!1008850))

(assert (= (and b!1008850 res!677776) b!1008851))

(assert (= (and b!1008850 res!677774) b!1008853))

(assert (= (and b!1008853 c!101692) b!1008852))

(assert (= (and b!1008853 (not c!101692)) b!1008849))

(assert (= (or b!1008852 b!1008849) bm!42343))

(assert (=> b!1008850 m!932945))

(assert (=> b!1008850 m!932945))

(declare-fun m!932951 () Bool)

(assert (=> b!1008850 m!932951))

(assert (=> b!1008851 m!932945))

(assert (=> b!1008851 m!932945))

(declare-fun m!932953 () Bool)

(assert (=> b!1008851 m!932953))

(assert (=> bm!42343 m!932945))

(declare-fun m!932955 () Bool)

(assert (=> bm!42343 m!932955))

(assert (=> b!1008853 m!932945))

(assert (=> b!1008853 m!932945))

(assert (=> b!1008853 m!932951))

(assert (=> b!1008683 d!119581))

(declare-fun d!119589 () Bool)

(assert (=> d!119589 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86950 d!119589))

(declare-fun d!119599 () Bool)

(assert (=> d!119599 (= (array_inv!23736 a!3219) (bvsge (size!31097 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86950 d!119599))

(declare-fun b!1008941 () Bool)

(declare-fun c!101722 () Bool)

(declare-fun lt!445786 () (_ BitVec 64))

(assert (=> b!1008941 (= c!101722 (= lt!445786 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567645 () SeekEntryResult!9550)

(declare-fun e!567646 () SeekEntryResult!9550)

(assert (=> b!1008941 (= e!567645 e!567646)))

(declare-fun b!1008942 () Bool)

(declare-fun lt!445785 () SeekEntryResult!9550)

(assert (=> b!1008942 (= e!567645 (Found!9550 (index!40573 lt!445785)))))

(declare-fun d!119601 () Bool)

(declare-fun lt!445787 () SeekEntryResult!9550)

(assert (=> d!119601 (and (or (is-Undefined!9550 lt!445787) (not (is-Found!9550 lt!445787)) (and (bvsge (index!40572 lt!445787) #b00000000000000000000000000000000) (bvslt (index!40572 lt!445787) (size!31097 a!3219)))) (or (is-Undefined!9550 lt!445787) (is-Found!9550 lt!445787) (not (is-MissingZero!9550 lt!445787)) (and (bvsge (index!40571 lt!445787) #b00000000000000000000000000000000) (bvslt (index!40571 lt!445787) (size!31097 a!3219)))) (or (is-Undefined!9550 lt!445787) (is-Found!9550 lt!445787) (is-MissingZero!9550 lt!445787) (not (is-MissingVacant!9550 lt!445787)) (and (bvsge (index!40574 lt!445787) #b00000000000000000000000000000000) (bvslt (index!40574 lt!445787) (size!31097 a!3219)))) (or (is-Undefined!9550 lt!445787) (ite (is-Found!9550 lt!445787) (= (select (arr!30593 a!3219) (index!40572 lt!445787)) k!2224) (ite (is-MissingZero!9550 lt!445787) (= (select (arr!30593 a!3219) (index!40571 lt!445787)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9550 lt!445787) (= (select (arr!30593 a!3219) (index!40574 lt!445787)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!567647 () SeekEntryResult!9550)

(assert (=> d!119601 (= lt!445787 e!567647)))

(declare-fun c!101720 () Bool)

(assert (=> d!119601 (= c!101720 (and (is-Intermediate!9550 lt!445785) (undefined!10362 lt!445785)))))

(assert (=> d!119601 (= lt!445785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119601 (validMask!0 mask!3464)))

(assert (=> d!119601 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!445787)))

(declare-fun b!1008943 () Bool)

(assert (=> b!1008943 (= e!567646 (MissingZero!9550 (index!40573 lt!445785)))))

(declare-fun b!1008944 () Bool)

(assert (=> b!1008944 (= e!567647 Undefined!9550)))

(declare-fun b!1008945 () Bool)

(assert (=> b!1008945 (= e!567647 e!567645)))

(assert (=> b!1008945 (= lt!445786 (select (arr!30593 a!3219) (index!40573 lt!445785)))))

(declare-fun c!101721 () Bool)

(assert (=> b!1008945 (= c!101721 (= lt!445786 k!2224))))

(declare-fun b!1008946 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63545 (_ BitVec 32)) SeekEntryResult!9550)

(assert (=> b!1008946 (= e!567646 (seekKeyOrZeroReturnVacant!0 (x!87967 lt!445785) (index!40573 lt!445785) (index!40573 lt!445785) k!2224 a!3219 mask!3464))))

(assert (= (and d!119601 c!101720) b!1008944))

(assert (= (and d!119601 (not c!101720)) b!1008945))

(assert (= (and b!1008945 c!101721) b!1008942))

(assert (= (and b!1008945 (not c!101721)) b!1008941))

(assert (= (and b!1008941 c!101722) b!1008943))

(assert (= (and b!1008941 (not c!101722)) b!1008946))

(declare-fun m!933007 () Bool)

(assert (=> d!119601 m!933007))

(declare-fun m!933009 () Bool)

(assert (=> d!119601 m!933009))

(assert (=> d!119601 m!932861))

(declare-fun m!933011 () Bool)

(assert (=> d!119601 m!933011))

(declare-fun m!933013 () Bool)

(assert (=> d!119601 m!933013))

(declare-fun m!933015 () Bool)

(assert (=> d!119601 m!933015))

(assert (=> d!119601 m!933011))

(declare-fun m!933017 () Bool)

(assert (=> b!1008945 m!933017))

(declare-fun m!933019 () Bool)

(assert (=> b!1008946 m!933019))

(assert (=> b!1008682 d!119601))

(declare-fun b!1008947 () Bool)

(declare-fun e!567652 () Bool)

(declare-fun e!567650 () Bool)

(assert (=> b!1008947 (= e!567652 e!567650)))

(declare-fun res!677810 () Bool)

(declare-fun lt!445789 () SeekEntryResult!9550)

(assert (=> b!1008947 (= res!677810 (and (is-Intermediate!9550 lt!445789) (not (undefined!10362 lt!445789)) (bvslt (x!87967 lt!445789) #b01111111111111111111111111111110) (bvsge (x!87967 lt!445789) #b00000000000000000000000000000000) (bvsge (x!87967 lt!445789) #b00000000000000000000000000000000)))))

(assert (=> b!1008947 (=> (not res!677810) (not e!567650))))

(declare-fun b!1008948 () Bool)

(assert (=> b!1008948 (and (bvsge (index!40573 lt!445789) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445789) (size!31097 lt!445693)))))

(declare-fun res!677811 () Bool)

(assert (=> b!1008948 (= res!677811 (= (select (arr!30593 lt!445693) (index!40573 lt!445789)) lt!445697))))

(declare-fun e!567649 () Bool)

(assert (=> b!1008948 (=> res!677811 e!567649)))

(assert (=> b!1008948 (= e!567650 e!567649)))

(declare-fun b!1008949 () Bool)

(assert (=> b!1008949 (and (bvsge (index!40573 lt!445789) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445789) (size!31097 lt!445693)))))

(assert (=> b!1008949 (= e!567649 (= (select (arr!30593 lt!445693) (index!40573 lt!445789)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1008951 () Bool)

(declare-fun e!567651 () SeekEntryResult!9550)

(assert (=> b!1008951 (= e!567651 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!445697 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!445697 lt!445693 mask!3464))))

(declare-fun b!1008952 () Bool)

(assert (=> b!1008952 (= e!567652 (bvsge (x!87967 lt!445789) #b01111111111111111111111111111110))))

(declare-fun b!1008953 () Bool)

(assert (=> b!1008953 (= e!567651 (Intermediate!9550 false (toIndex!0 lt!445697 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1008950 () Bool)

(assert (=> b!1008950 (and (bvsge (index!40573 lt!445789) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445789) (size!31097 lt!445693)))))

(declare-fun res!677812 () Bool)

(assert (=> b!1008950 (= res!677812 (= (select (arr!30593 lt!445693) (index!40573 lt!445789)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1008950 (=> res!677812 e!567649)))

(declare-fun d!119621 () Bool)

(assert (=> d!119621 e!567652))

(declare-fun c!101723 () Bool)

(assert (=> d!119621 (= c!101723 (and (is-Intermediate!9550 lt!445789) (undefined!10362 lt!445789)))))

(declare-fun e!567648 () SeekEntryResult!9550)

(assert (=> d!119621 (= lt!445789 e!567648)))

(declare-fun c!101724 () Bool)

(assert (=> d!119621 (= c!101724 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!445788 () (_ BitVec 64))

(assert (=> d!119621 (= lt!445788 (select (arr!30593 lt!445693) (toIndex!0 lt!445697 mask!3464)))))

(assert (=> d!119621 (validMask!0 mask!3464)))

(assert (=> d!119621 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445697 mask!3464) lt!445697 lt!445693 mask!3464) lt!445789)))

(declare-fun b!1008954 () Bool)

(assert (=> b!1008954 (= e!567648 e!567651)))

(declare-fun c!101725 () Bool)

(assert (=> b!1008954 (= c!101725 (or (= lt!445788 lt!445697) (= (bvadd lt!445788 lt!445788) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1008955 () Bool)

(assert (=> b!1008955 (= e!567648 (Intermediate!9550 true (toIndex!0 lt!445697 mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!119621 c!101724) b!1008955))

(assert (= (and d!119621 (not c!101724)) b!1008954))

(assert (= (and b!1008954 c!101725) b!1008953))

(assert (= (and b!1008954 (not c!101725)) b!1008951))

(assert (= (and d!119621 c!101723) b!1008952))

(assert (= (and d!119621 (not c!101723)) b!1008947))

(assert (= (and b!1008947 res!677810) b!1008948))

(assert (= (and b!1008948 (not res!677811)) b!1008950))

(assert (= (and b!1008950 (not res!677812)) b!1008949))

(declare-fun m!933021 () Bool)

(assert (=> b!1008950 m!933021))

(assert (=> b!1008951 m!932865))

(declare-fun m!933023 () Bool)

(assert (=> b!1008951 m!933023))

(assert (=> b!1008951 m!933023))

(declare-fun m!933025 () Bool)

(assert (=> b!1008951 m!933025))

(assert (=> d!119621 m!932865))

(declare-fun m!933027 () Bool)

(assert (=> d!119621 m!933027))

(assert (=> d!119621 m!932861))

(assert (=> b!1008949 m!933021))

(assert (=> b!1008948 m!933021))

(assert (=> b!1008680 d!119621))

(declare-fun d!119623 () Bool)

(declare-fun lt!445795 () (_ BitVec 32))

(declare-fun lt!445794 () (_ BitVec 32))

(assert (=> d!119623 (= lt!445795 (bvmul (bvxor lt!445794 (bvlshr lt!445794 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119623 (= lt!445794 ((_ extract 31 0) (bvand (bvxor lt!445697 (bvlshr lt!445697 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119623 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!677813 (let ((h!22520 ((_ extract 31 0) (bvand (bvxor lt!445697 (bvlshr lt!445697 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87975 (bvmul (bvxor h!22520 (bvlshr h!22520 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87975 (bvlshr x!87975 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!677813 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!677813 #b00000000000000000000000000000000))))))

(assert (=> d!119623 (= (toIndex!0 lt!445697 mask!3464) (bvand (bvxor lt!445795 (bvlshr lt!445795 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1008680 d!119623))

(declare-fun b!1008956 () Bool)

(declare-fun e!567657 () Bool)

(declare-fun e!567655 () Bool)

(assert (=> b!1008956 (= e!567657 e!567655)))

(declare-fun res!677814 () Bool)

(declare-fun lt!445797 () SeekEntryResult!9550)

(assert (=> b!1008956 (= res!677814 (and (is-Intermediate!9550 lt!445797) (not (undefined!10362 lt!445797)) (bvslt (x!87967 lt!445797) #b01111111111111111111111111111110) (bvsge (x!87967 lt!445797) #b00000000000000000000000000000000) (bvsge (x!87967 lt!445797) #b00000000000000000000000000000000)))))

(assert (=> b!1008956 (=> (not res!677814) (not e!567655))))

(declare-fun b!1008957 () Bool)

(assert (=> b!1008957 (and (bvsge (index!40573 lt!445797) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445797) (size!31097 a!3219)))))

(declare-fun res!677815 () Bool)

(assert (=> b!1008957 (= res!677815 (= (select (arr!30593 a!3219) (index!40573 lt!445797)) (select (arr!30593 a!3219) j!170)))))

(declare-fun e!567654 () Bool)

(assert (=> b!1008957 (=> res!677815 e!567654)))

(assert (=> b!1008957 (= e!567655 e!567654)))

(declare-fun b!1008958 () Bool)

(assert (=> b!1008958 (and (bvsge (index!40573 lt!445797) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445797) (size!31097 a!3219)))))

(assert (=> b!1008958 (= e!567654 (= (select (arr!30593 a!3219) (index!40573 lt!445797)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1008960 () Bool)

(declare-fun e!567656 () SeekEntryResult!9550)

(assert (=> b!1008960 (= e!567656 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30593 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30593 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008961 () Bool)

(assert (=> b!1008961 (= e!567657 (bvsge (x!87967 lt!445797) #b01111111111111111111111111111110))))

(declare-fun b!1008962 () Bool)

(assert (=> b!1008962 (= e!567656 (Intermediate!9550 false (toIndex!0 (select (arr!30593 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1008959 () Bool)

(assert (=> b!1008959 (and (bvsge (index!40573 lt!445797) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445797) (size!31097 a!3219)))))

(declare-fun res!677816 () Bool)

(assert (=> b!1008959 (= res!677816 (= (select (arr!30593 a!3219) (index!40573 lt!445797)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1008959 (=> res!677816 e!567654)))

(declare-fun d!119625 () Bool)

(assert (=> d!119625 e!567657))

(declare-fun c!101726 () Bool)

(assert (=> d!119625 (= c!101726 (and (is-Intermediate!9550 lt!445797) (undefined!10362 lt!445797)))))

(declare-fun e!567653 () SeekEntryResult!9550)

(assert (=> d!119625 (= lt!445797 e!567653)))

(declare-fun c!101727 () Bool)

(assert (=> d!119625 (= c!101727 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!445796 () (_ BitVec 64))

(assert (=> d!119625 (= lt!445796 (select (arr!30593 a!3219) (toIndex!0 (select (arr!30593 a!3219) j!170) mask!3464)))))

(assert (=> d!119625 (validMask!0 mask!3464)))

(assert (=> d!119625 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30593 a!3219) j!170) mask!3464) (select (arr!30593 a!3219) j!170) a!3219 mask!3464) lt!445797)))

(declare-fun b!1008963 () Bool)

(assert (=> b!1008963 (= e!567653 e!567656)))

(declare-fun c!101728 () Bool)

(assert (=> b!1008963 (= c!101728 (or (= lt!445796 (select (arr!30593 a!3219) j!170)) (= (bvadd lt!445796 lt!445796) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1008964 () Bool)

(assert (=> b!1008964 (= e!567653 (Intermediate!9550 true (toIndex!0 (select (arr!30593 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!119625 c!101727) b!1008964))

(assert (= (and d!119625 (not c!101727)) b!1008963))

(assert (= (and b!1008963 c!101728) b!1008962))

(assert (= (and b!1008963 (not c!101728)) b!1008960))

(assert (= (and d!119625 c!101726) b!1008961))

(assert (= (and d!119625 (not c!101726)) b!1008956))

(assert (= (and b!1008956 res!677814) b!1008957))

(assert (= (and b!1008957 (not res!677815)) b!1008959))

(assert (= (and b!1008959 (not res!677816)) b!1008958))

(declare-fun m!933029 () Bool)

(assert (=> b!1008959 m!933029))

(assert (=> b!1008960 m!932877))

(declare-fun m!933031 () Bool)

(assert (=> b!1008960 m!933031))

(assert (=> b!1008960 m!933031))

(assert (=> b!1008960 m!932849))

(declare-fun m!933033 () Bool)

(assert (=> b!1008960 m!933033))

(assert (=> d!119625 m!932877))

(declare-fun m!933035 () Bool)

(assert (=> d!119625 m!933035))

(assert (=> d!119625 m!932861))

(assert (=> b!1008958 m!933029))

(assert (=> b!1008957 m!933029))

(assert (=> b!1008679 d!119625))

(declare-fun d!119627 () Bool)

(declare-fun lt!445799 () (_ BitVec 32))

(declare-fun lt!445798 () (_ BitVec 32))

(assert (=> d!119627 (= lt!445799 (bvmul (bvxor lt!445798 (bvlshr lt!445798 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119627 (= lt!445798 ((_ extract 31 0) (bvand (bvxor (select (arr!30593 a!3219) j!170) (bvlshr (select (arr!30593 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119627 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!677813 (let ((h!22520 ((_ extract 31 0) (bvand (bvxor (select (arr!30593 a!3219) j!170) (bvlshr (select (arr!30593 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87975 (bvmul (bvxor h!22520 (bvlshr h!22520 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87975 (bvlshr x!87975 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!677813 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!677813 #b00000000000000000000000000000000))))))

(assert (=> d!119627 (= (toIndex!0 (select (arr!30593 a!3219) j!170) mask!3464) (bvand (bvxor lt!445799 (bvlshr lt!445799 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1008679 d!119627))

(declare-fun b!1008985 () Bool)

(declare-fun e!567672 () Bool)

(declare-fun e!567670 () Bool)

(assert (=> b!1008985 (= e!567672 e!567670)))

(declare-fun c!101737 () Bool)

(assert (=> b!1008985 (= c!101737 (validKeyInArray!0 (select (arr!30593 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1008986 () Bool)

(declare-fun e!567671 () Bool)

(assert (=> b!1008986 (= e!567670 e!567671)))

(declare-fun lt!445812 () (_ BitVec 64))

(assert (=> b!1008986 (= lt!445812 (select (arr!30593 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32891 0))(
  ( (Unit!32892) )
))
(declare-fun lt!445813 () Unit!32891)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63545 (_ BitVec 64) (_ BitVec 32)) Unit!32891)

(assert (=> b!1008986 (= lt!445813 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!445812 #b00000000000000000000000000000000))))

(assert (=> b!1008986 (arrayContainsKey!0 a!3219 lt!445812 #b00000000000000000000000000000000)))

(declare-fun lt!445814 () Unit!32891)

(assert (=> b!1008986 (= lt!445814 lt!445813)))

(declare-fun res!677822 () Bool)

(assert (=> b!1008986 (= res!677822 (= (seekEntryOrOpen!0 (select (arr!30593 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9550 #b00000000000000000000000000000000)))))

(assert (=> b!1008986 (=> (not res!677822) (not e!567671))))

(declare-fun b!1008987 () Bool)

(declare-fun call!42358 () Bool)

(assert (=> b!1008987 (= e!567670 call!42358)))

(declare-fun d!119629 () Bool)

(declare-fun res!677821 () Bool)

(assert (=> d!119629 (=> res!677821 e!567672)))

(assert (=> d!119629 (= res!677821 (bvsge #b00000000000000000000000000000000 (size!31097 a!3219)))))

(assert (=> d!119629 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!567672)))

(declare-fun bm!42355 () Bool)

(assert (=> bm!42355 (= call!42358 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1008988 () Bool)

(assert (=> b!1008988 (= e!567671 call!42358)))

(assert (= (and d!119629 (not res!677821)) b!1008985))

(assert (= (and b!1008985 c!101737) b!1008986))

(assert (= (and b!1008985 (not c!101737)) b!1008987))

(assert (= (and b!1008986 res!677822) b!1008988))

(assert (= (or b!1008988 b!1008987) bm!42355))

(assert (=> b!1008985 m!932945))

(assert (=> b!1008985 m!932945))

(assert (=> b!1008985 m!932951))

(assert (=> b!1008986 m!932945))

(declare-fun m!933037 () Bool)

(assert (=> b!1008986 m!933037))

(declare-fun m!933039 () Bool)

(assert (=> b!1008986 m!933039))

(assert (=> b!1008986 m!932945))

(declare-fun m!933041 () Bool)

(assert (=> b!1008986 m!933041))

(declare-fun m!933043 () Bool)

(assert (=> bm!42355 m!933043))

(assert (=> b!1008678 d!119629))

(declare-fun b!1008989 () Bool)

(declare-fun e!567677 () Bool)

(declare-fun e!567675 () Bool)

(assert (=> b!1008989 (= e!567677 e!567675)))

(declare-fun res!677823 () Bool)

(declare-fun lt!445816 () SeekEntryResult!9550)

(assert (=> b!1008989 (= res!677823 (and (is-Intermediate!9550 lt!445816) (not (undefined!10362 lt!445816)) (bvslt (x!87967 lt!445816) #b01111111111111111111111111111110) (bvsge (x!87967 lt!445816) #b00000000000000000000000000000000) (bvsge (x!87967 lt!445816) x!1245)))))

(assert (=> b!1008989 (=> (not res!677823) (not e!567675))))

(declare-fun b!1008990 () Bool)

(assert (=> b!1008990 (and (bvsge (index!40573 lt!445816) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445816) (size!31097 a!3219)))))

(declare-fun res!677824 () Bool)

(assert (=> b!1008990 (= res!677824 (= (select (arr!30593 a!3219) (index!40573 lt!445816)) (select (arr!30593 a!3219) j!170)))))

(declare-fun e!567674 () Bool)

(assert (=> b!1008990 (=> res!677824 e!567674)))

(assert (=> b!1008990 (= e!567675 e!567674)))

(declare-fun b!1008991 () Bool)

(assert (=> b!1008991 (and (bvsge (index!40573 lt!445816) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445816) (size!31097 a!3219)))))

(assert (=> b!1008991 (= e!567674 (= (select (arr!30593 a!3219) (index!40573 lt!445816)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567676 () SeekEntryResult!9550)

(declare-fun b!1008993 () Bool)

(assert (=> b!1008993 (= e!567676 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30593 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008994 () Bool)

(assert (=> b!1008994 (= e!567677 (bvsge (x!87967 lt!445816) #b01111111111111111111111111111110))))

(declare-fun b!1008995 () Bool)

(assert (=> b!1008995 (= e!567676 (Intermediate!9550 false index!1507 x!1245))))

(declare-fun b!1008992 () Bool)

(assert (=> b!1008992 (and (bvsge (index!40573 lt!445816) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445816) (size!31097 a!3219)))))

(declare-fun res!677825 () Bool)

(assert (=> b!1008992 (= res!677825 (= (select (arr!30593 a!3219) (index!40573 lt!445816)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1008992 (=> res!677825 e!567674)))

(declare-fun d!119631 () Bool)

(assert (=> d!119631 e!567677))

(declare-fun c!101738 () Bool)

(assert (=> d!119631 (= c!101738 (and (is-Intermediate!9550 lt!445816) (undefined!10362 lt!445816)))))

(declare-fun e!567673 () SeekEntryResult!9550)

(assert (=> d!119631 (= lt!445816 e!567673)))

(declare-fun c!101739 () Bool)

(assert (=> d!119631 (= c!101739 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!445815 () (_ BitVec 64))

(assert (=> d!119631 (= lt!445815 (select (arr!30593 a!3219) index!1507))))

(assert (=> d!119631 (validMask!0 mask!3464)))

(assert (=> d!119631 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30593 a!3219) j!170) a!3219 mask!3464) lt!445816)))

(declare-fun b!1008996 () Bool)

(assert (=> b!1008996 (= e!567673 e!567676)))

(declare-fun c!101740 () Bool)

(assert (=> b!1008996 (= c!101740 (or (= lt!445815 (select (arr!30593 a!3219) j!170)) (= (bvadd lt!445815 lt!445815) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1008997 () Bool)

(assert (=> b!1008997 (= e!567673 (Intermediate!9550 true index!1507 x!1245))))

(assert (= (and d!119631 c!101739) b!1008997))

(assert (= (and d!119631 (not c!101739)) b!1008996))

(assert (= (and b!1008996 c!101740) b!1008995))

(assert (= (and b!1008996 (not c!101740)) b!1008993))

(assert (= (and d!119631 c!101738) b!1008994))

(assert (= (and d!119631 (not c!101738)) b!1008989))

(assert (= (and b!1008989 res!677823) b!1008990))

(assert (= (and b!1008990 (not res!677824)) b!1008992))

(assert (= (and b!1008992 (not res!677825)) b!1008991))

(declare-fun m!933045 () Bool)

(assert (=> b!1008992 m!933045))

(assert (=> b!1008993 m!932847))

(assert (=> b!1008993 m!932847))

(assert (=> b!1008993 m!932849))

(declare-fun m!933047 () Bool)

(assert (=> b!1008993 m!933047))

(declare-fun m!933049 () Bool)

(assert (=> d!119631 m!933049))

(assert (=> d!119631 m!932861))

(assert (=> b!1008991 m!933045))

(assert (=> b!1008990 m!933045))

(assert (=> b!1008677 d!119631))

(declare-fun d!119633 () Bool)

(declare-fun lt!445822 () (_ BitVec 32))

(assert (=> d!119633 (and (bvsge lt!445822 #b00000000000000000000000000000000) (bvslt lt!445822 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!119633 (= lt!445822 (choose!52 index!1507 x!1245 mask!3464))))

(assert (=> d!119633 (validMask!0 mask!3464)))

(assert (=> d!119633 (= (nextIndex!0 index!1507 x!1245 mask!3464) lt!445822)))

(declare-fun bs!28665 () Bool)

(assert (= bs!28665 d!119633))

(declare-fun m!933065 () Bool)

(assert (=> bs!28665 m!933065))

(assert (=> bs!28665 m!932861))

(assert (=> b!1008688 d!119633))

(declare-fun d!119635 () Bool)

(assert (=> d!119635 (= (validKeyInArray!0 (select (arr!30593 a!3219) j!170)) (and (not (= (select (arr!30593 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30593 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1008687 d!119635))

(push 1)

(assert (not d!119633))

(assert (not d!119631))

(assert (not b!1008985))

(assert (not b!1008993))

(assert (not b!1008851))

(assert (not bm!42343))

(assert (not b!1008951))

(assert (not d!119621))

(assert (not d!119559))

(assert (not d!119625))

(assert (not b!1008832))

(assert (not b!1008853))

(assert (not bm!42355))

(assert (not b!1008850))

(assert (not b!1008804))

(assert (not d!119601))

(assert (not b!1008960))

(assert (not b!1008946))

(assert (not b!1008986))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!119621 d!119589))

(declare-fun d!119637 () Bool)

(assert (=> d!119637 (= (validKeyInArray!0 (select (arr!30593 a!3219) #b00000000000000000000000000000000)) (and (not (= (select (arr!30593 a!3219) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30593 a!3219) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1008853 d!119637))

(assert (=> d!119631 d!119589))

(declare-fun b!1009004 () Bool)

(declare-fun e!567685 () Bool)

(declare-fun e!567683 () Bool)

(assert (=> b!1009004 (= e!567685 e!567683)))

(declare-fun res!677826 () Bool)

(declare-fun lt!445824 () SeekEntryResult!9550)

(assert (=> b!1009004 (= res!677826 (and (is-Intermediate!9550 lt!445824) (not (undefined!10362 lt!445824)) (bvslt (x!87967 lt!445824) #b01111111111111111111111111111110) (bvsge (x!87967 lt!445824) #b00000000000000000000000000000000) (bvsge (x!87967 lt!445824) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1009004 (=> (not res!677826) (not e!567683))))

(declare-fun b!1009005 () Bool)

(assert (=> b!1009005 (and (bvsge (index!40573 lt!445824) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445824) (size!31097 lt!445693)))))

(declare-fun res!677827 () Bool)

(assert (=> b!1009005 (= res!677827 (= (select (arr!30593 lt!445693) (index!40573 lt!445824)) lt!445697))))

(declare-fun e!567682 () Bool)

(assert (=> b!1009005 (=> res!677827 e!567682)))

(assert (=> b!1009005 (= e!567683 e!567682)))

(declare-fun b!1009006 () Bool)

(assert (=> b!1009006 (and (bvsge (index!40573 lt!445824) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445824) (size!31097 lt!445693)))))

(assert (=> b!1009006 (= e!567682 (= (select (arr!30593 lt!445693) (index!40573 lt!445824)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009008 () Bool)

(declare-fun e!567684 () SeekEntryResult!9550)

(assert (=> b!1009008 (= e!567684 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!445697 mask!3464) #b00000000000000000000000000000000 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) lt!445697 lt!445693 mask!3464))))

(declare-fun b!1009009 () Bool)

(assert (=> b!1009009 (= e!567685 (bvsge (x!87967 lt!445824) #b01111111111111111111111111111110))))

(declare-fun b!1009010 () Bool)

(assert (=> b!1009010 (= e!567684 (Intermediate!9550 false (nextIndex!0 (toIndex!0 lt!445697 mask!3464) #b00000000000000000000000000000000 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1009007 () Bool)

(assert (=> b!1009007 (and (bvsge (index!40573 lt!445824) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445824) (size!31097 lt!445693)))))

(declare-fun res!677828 () Bool)

(assert (=> b!1009007 (= res!677828 (= (select (arr!30593 lt!445693) (index!40573 lt!445824)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009007 (=> res!677828 e!567682)))

(declare-fun d!119639 () Bool)

(assert (=> d!119639 e!567685))

(declare-fun c!101744 () Bool)

(assert (=> d!119639 (= c!101744 (and (is-Intermediate!9550 lt!445824) (undefined!10362 lt!445824)))))

(declare-fun e!567681 () SeekEntryResult!9550)

(assert (=> d!119639 (= lt!445824 e!567681)))

(declare-fun c!101745 () Bool)

(assert (=> d!119639 (= c!101745 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!445823 () (_ BitVec 64))

(assert (=> d!119639 (= lt!445823 (select (arr!30593 lt!445693) (nextIndex!0 (toIndex!0 lt!445697 mask!3464) #b00000000000000000000000000000000 mask!3464)))))

(assert (=> d!119639 (validMask!0 mask!3464)))

(assert (=> d!119639 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!445697 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!445697 lt!445693 mask!3464) lt!445824)))

(declare-fun b!1009011 () Bool)

(assert (=> b!1009011 (= e!567681 e!567684)))

(declare-fun c!101746 () Bool)

(assert (=> b!1009011 (= c!101746 (or (= lt!445823 lt!445697) (= (bvadd lt!445823 lt!445823) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009012 () Bool)

(assert (=> b!1009012 (= e!567681 (Intermediate!9550 true (nextIndex!0 (toIndex!0 lt!445697 mask!3464) #b00000000000000000000000000000000 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119639 c!101745) b!1009012))

(assert (= (and d!119639 (not c!101745)) b!1009011))

(assert (= (and b!1009011 c!101746) b!1009010))

(assert (= (and b!1009011 (not c!101746)) b!1009008))

(assert (= (and d!119639 c!101744) b!1009009))

(assert (= (and d!119639 (not c!101744)) b!1009004))

(assert (= (and b!1009004 res!677826) b!1009005))

(assert (= (and b!1009005 (not res!677827)) b!1009007))

(assert (= (and b!1009007 (not res!677828)) b!1009006))

(declare-fun m!933067 () Bool)

(assert (=> b!1009007 m!933067))

(assert (=> b!1009008 m!933023))

(declare-fun m!933069 () Bool)

(assert (=> b!1009008 m!933069))

(assert (=> b!1009008 m!933069))

(declare-fun m!933071 () Bool)

(assert (=> b!1009008 m!933071))

(assert (=> d!119639 m!933023))

(declare-fun m!933073 () Bool)

(assert (=> d!119639 m!933073))

(assert (=> d!119639 m!932861))

(assert (=> b!1009006 m!933067))

(assert (=> b!1009005 m!933067))

(assert (=> b!1008951 d!119639))

(declare-fun d!119641 () Bool)

(declare-fun lt!445825 () (_ BitVec 32))

(assert (=> d!119641 (and (bvsge lt!445825 #b00000000000000000000000000000000) (bvslt lt!445825 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(assert (=> d!119641 (= lt!445825 (choose!52 (toIndex!0 lt!445697 mask!3464) #b00000000000000000000000000000000 mask!3464))))

(assert (=> d!119641 (validMask!0 mask!3464)))

(assert (=> d!119641 (= (nextIndex!0 (toIndex!0 lt!445697 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!445825)))

(declare-fun bs!28666 () Bool)

(assert (= bs!28666 d!119641))

(assert (=> bs!28666 m!932865))

(declare-fun m!933075 () Bool)

(assert (=> bs!28666 m!933075))

(assert (=> bs!28666 m!932861))

(assert (=> b!1008951 d!119641))

(declare-fun b!1009013 () Bool)

(declare-fun e!567690 () Bool)

(declare-fun e!567688 () Bool)

(assert (=> b!1009013 (= e!567690 e!567688)))

(declare-fun res!677829 () Bool)

(declare-fun lt!445827 () SeekEntryResult!9550)

(assert (=> b!1009013 (= res!677829 (and (is-Intermediate!9550 lt!445827) (not (undefined!10362 lt!445827)) (bvslt (x!87967 lt!445827) #b01111111111111111111111111111110) (bvsge (x!87967 lt!445827) #b00000000000000000000000000000000) (bvsge (x!87967 lt!445827) (bvadd x!1245 #b00000000000000000000000000000001))))))

(assert (=> b!1009013 (=> (not res!677829) (not e!567688))))

(declare-fun b!1009014 () Bool)

(assert (=> b!1009014 (and (bvsge (index!40573 lt!445827) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445827) (size!31097 lt!445693)))))

(declare-fun res!677830 () Bool)

(assert (=> b!1009014 (= res!677830 (= (select (arr!30593 lt!445693) (index!40573 lt!445827)) lt!445697))))

(declare-fun e!567687 () Bool)

(assert (=> b!1009014 (=> res!677830 e!567687)))

(assert (=> b!1009014 (= e!567688 e!567687)))

(declare-fun b!1009015 () Bool)

(assert (=> b!1009015 (and (bvsge (index!40573 lt!445827) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445827) (size!31097 lt!445693)))))

(assert (=> b!1009015 (= e!567687 (= (select (arr!30593 lt!445693) (index!40573 lt!445827)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567689 () SeekEntryResult!9550)

(declare-fun b!1009017 () Bool)

(assert (=> b!1009017 (= e!567689 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1507 x!1245 mask!3464) (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) lt!445697 lt!445693 mask!3464))))

(declare-fun b!1009018 () Bool)

(assert (=> b!1009018 (= e!567690 (bvsge (x!87967 lt!445827) #b01111111111111111111111111111110))))

(declare-fun b!1009019 () Bool)

(assert (=> b!1009019 (= e!567689 (Intermediate!9550 false (nextIndex!0 index!1507 x!1245 mask!3464) (bvadd x!1245 #b00000000000000000000000000000001)))))

(declare-fun b!1009016 () Bool)

(assert (=> b!1009016 (and (bvsge (index!40573 lt!445827) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445827) (size!31097 lt!445693)))))

(declare-fun res!677831 () Bool)

(assert (=> b!1009016 (= res!677831 (= (select (arr!30593 lt!445693) (index!40573 lt!445827)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009016 (=> res!677831 e!567687)))

(declare-fun d!119643 () Bool)

(assert (=> d!119643 e!567690))

(declare-fun c!101747 () Bool)

(assert (=> d!119643 (= c!101747 (and (is-Intermediate!9550 lt!445827) (undefined!10362 lt!445827)))))

(declare-fun e!567686 () SeekEntryResult!9550)

(assert (=> d!119643 (= lt!445827 e!567686)))

(declare-fun c!101748 () Bool)

(assert (=> d!119643 (= c!101748 (bvsge (bvadd x!1245 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!445826 () (_ BitVec 64))

(assert (=> d!119643 (= lt!445826 (select (arr!30593 lt!445693) (nextIndex!0 index!1507 x!1245 mask!3464)))))

(assert (=> d!119643 (validMask!0 mask!3464)))

(assert (=> d!119643 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!445697 lt!445693 mask!3464) lt!445827)))

(declare-fun b!1009020 () Bool)

(assert (=> b!1009020 (= e!567686 e!567689)))

(declare-fun c!101749 () Bool)

(assert (=> b!1009020 (= c!101749 (or (= lt!445826 lt!445697) (= (bvadd lt!445826 lt!445826) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009021 () Bool)

(assert (=> b!1009021 (= e!567686 (Intermediate!9550 true (nextIndex!0 index!1507 x!1245 mask!3464) (bvadd x!1245 #b00000000000000000000000000000001)))))

(assert (= (and d!119643 c!101748) b!1009021))

(assert (= (and d!119643 (not c!101748)) b!1009020))

(assert (= (and b!1009020 c!101749) b!1009019))

(assert (= (and b!1009020 (not c!101749)) b!1009017))

(assert (= (and d!119643 c!101747) b!1009018))

(assert (= (and d!119643 (not c!101747)) b!1009013))

(assert (= (and b!1009013 res!677829) b!1009014))

(assert (= (and b!1009014 (not res!677830)) b!1009016))

(assert (= (and b!1009016 (not res!677831)) b!1009015))

(declare-fun m!933077 () Bool)

(assert (=> b!1009016 m!933077))

(assert (=> b!1009017 m!932847))

(declare-fun m!933079 () Bool)

(assert (=> b!1009017 m!933079))

(assert (=> b!1009017 m!933079))

(declare-fun m!933081 () Bool)

(assert (=> b!1009017 m!933081))

(assert (=> d!119643 m!932847))

(declare-fun m!933083 () Bool)

(assert (=> d!119643 m!933083))

(assert (=> d!119643 m!932861))

(assert (=> b!1009015 m!933077))

(assert (=> b!1009014 m!933077))

(assert (=> b!1008804 d!119643))

(assert (=> b!1008804 d!119633))

(declare-fun b!1009022 () Bool)

(declare-fun e!567692 () Bool)

(declare-fun call!42359 () Bool)

(assert (=> b!1009022 (= e!567692 call!42359)))

(declare-fun b!1009023 () Bool)

(declare-fun e!567694 () Bool)

(declare-fun e!567693 () Bool)

(assert (=> b!1009023 (= e!567694 e!567693)))

(declare-fun res!677832 () Bool)

(assert (=> b!1009023 (=> (not res!677832) (not e!567693))))

(declare-fun e!567691 () Bool)

(assert (=> b!1009023 (= res!677832 (not e!567691))))

(declare-fun res!677834 () Bool)

(assert (=> b!1009023 (=> (not res!677834) (not e!567691))))

(assert (=> b!1009023 (= res!677834 (validKeyInArray!0 (select (arr!30593 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!119645 () Bool)

(declare-fun res!677833 () Bool)

(assert (=> d!119645 (=> res!677833 e!567694)))

(assert (=> d!119645 (= res!677833 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31097 a!3219)))))

(assert (=> d!119645 (= (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101692 (Cons!21331 (select (arr!30593 a!3219) #b00000000000000000000000000000000) Nil!21332) Nil!21332)) e!567694)))

(declare-fun b!1009024 () Bool)

(assert (=> b!1009024 (= e!567691 (contains!5861 (ite c!101692 (Cons!21331 (select (arr!30593 a!3219) #b00000000000000000000000000000000) Nil!21332) Nil!21332) (select (arr!30593 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1009025 () Bool)

(assert (=> b!1009025 (= e!567692 call!42359)))

(declare-fun c!101750 () Bool)

(declare-fun bm!42356 () Bool)

(assert (=> bm!42356 (= call!42359 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!101750 (Cons!21331 (select (arr!30593 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!101692 (Cons!21331 (select (arr!30593 a!3219) #b00000000000000000000000000000000) Nil!21332) Nil!21332)) (ite c!101692 (Cons!21331 (select (arr!30593 a!3219) #b00000000000000000000000000000000) Nil!21332) Nil!21332))))))

(declare-fun b!1009026 () Bool)

(assert (=> b!1009026 (= e!567693 e!567692)))

(assert (=> b!1009026 (= c!101750 (validKeyInArray!0 (select (arr!30593 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!119645 (not res!677833)) b!1009023))

(assert (= (and b!1009023 res!677834) b!1009024))

(assert (= (and b!1009023 res!677832) b!1009026))

(assert (= (and b!1009026 c!101750) b!1009025))

(assert (= (and b!1009026 (not c!101750)) b!1009022))

(assert (= (or b!1009025 b!1009022) bm!42356))

(declare-fun m!933085 () Bool)

(assert (=> b!1009023 m!933085))

(assert (=> b!1009023 m!933085))

(declare-fun m!933087 () Bool)

(assert (=> b!1009023 m!933087))

(assert (=> b!1009024 m!933085))

(assert (=> b!1009024 m!933085))

(declare-fun m!933089 () Bool)

(assert (=> b!1009024 m!933089))

(assert (=> bm!42356 m!933085))

(declare-fun m!933091 () Bool)

(assert (=> bm!42356 m!933091))

(assert (=> b!1009026 m!933085))

(assert (=> b!1009026 m!933085))

(assert (=> b!1009026 m!933087))

(assert (=> bm!42343 d!119645))

(declare-fun d!119647 () Bool)

(declare-fun lt!445830 () Bool)

(declare-fun content!482 (List!21335) (Set (_ BitVec 64)))

(assert (=> d!119647 (= lt!445830 (set.member (select (arr!30593 a!3219) #b00000000000000000000000000000000) (content!482 Nil!21332)))))

(declare-fun e!567700 () Bool)

(assert (=> d!119647 (= lt!445830 e!567700)))

(declare-fun res!677839 () Bool)

(assert (=> d!119647 (=> (not res!677839) (not e!567700))))

(assert (=> d!119647 (= res!677839 (is-Cons!21331 Nil!21332))))

(assert (=> d!119647 (= (contains!5861 Nil!21332 (select (arr!30593 a!3219) #b00000000000000000000000000000000)) lt!445830)))

(declare-fun b!1009031 () Bool)

(declare-fun e!567699 () Bool)

(assert (=> b!1009031 (= e!567700 e!567699)))

(declare-fun res!677840 () Bool)

(assert (=> b!1009031 (=> res!677840 e!567699)))

(assert (=> b!1009031 (= res!677840 (= (h!22517 Nil!21332) (select (arr!30593 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1009032 () Bool)

(assert (=> b!1009032 (= e!567699 (contains!5861 (t!30327 Nil!21332) (select (arr!30593 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119647 res!677839) b!1009031))

(assert (= (and b!1009031 (not res!677840)) b!1009032))

(declare-fun m!933093 () Bool)

(assert (=> d!119647 m!933093))

(assert (=> d!119647 m!932945))

(declare-fun m!933095 () Bool)

(assert (=> d!119647 m!933095))

(assert (=> b!1009032 m!932945))

(declare-fun m!933097 () Bool)

(assert (=> b!1009032 m!933097))

(assert (=> b!1008851 d!119647))

(declare-fun d!119649 () Bool)

(declare-fun res!677841 () Bool)

(declare-fun e!567701 () Bool)

(assert (=> d!119649 (=> res!677841 e!567701)))

(assert (=> d!119649 (= res!677841 (= (select (arr!30593 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k!2224))))

(assert (=> d!119649 (= (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!567701)))

(declare-fun b!1009033 () Bool)

(declare-fun e!567702 () Bool)

(assert (=> b!1009033 (= e!567701 e!567702)))

(declare-fun res!677842 () Bool)

(assert (=> b!1009033 (=> (not res!677842) (not e!567702))))

(assert (=> b!1009033 (= res!677842 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31097 a!3219)))))

(declare-fun b!1009034 () Bool)

(assert (=> b!1009034 (= e!567702 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!119649 (not res!677841)) b!1009033))

(assert (= (and b!1009033 res!677842) b!1009034))

(assert (=> d!119649 m!933085))

(declare-fun m!933099 () Bool)

(assert (=> b!1009034 m!933099))

(assert (=> b!1008832 d!119649))

(declare-fun b!1009035 () Bool)

(declare-fun e!567705 () Bool)

(declare-fun e!567703 () Bool)

(assert (=> b!1009035 (= e!567705 e!567703)))

(declare-fun c!101751 () Bool)

(assert (=> b!1009035 (= c!101751 (validKeyInArray!0 (select (arr!30593 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1009036 () Bool)

(declare-fun e!567704 () Bool)

(assert (=> b!1009036 (= e!567703 e!567704)))

(declare-fun lt!445831 () (_ BitVec 64))

(assert (=> b!1009036 (= lt!445831 (select (arr!30593 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!445832 () Unit!32891)

(assert (=> b!1009036 (= lt!445832 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!445831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1009036 (arrayContainsKey!0 a!3219 lt!445831 #b00000000000000000000000000000000)))

(declare-fun lt!445833 () Unit!32891)

(assert (=> b!1009036 (= lt!445833 lt!445832)))

(declare-fun res!677844 () Bool)

(assert (=> b!1009036 (= res!677844 (= (seekEntryOrOpen!0 (select (arr!30593 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3219 mask!3464) (Found!9550 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1009036 (=> (not res!677844) (not e!567704))))

(declare-fun b!1009037 () Bool)

(declare-fun call!42360 () Bool)

(assert (=> b!1009037 (= e!567703 call!42360)))

(declare-fun d!119651 () Bool)

(declare-fun res!677843 () Bool)

(assert (=> d!119651 (=> res!677843 e!567705)))

(assert (=> d!119651 (= res!677843 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31097 a!3219)))))

(assert (=> d!119651 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464) e!567705)))

(declare-fun bm!42357 () Bool)

(assert (=> bm!42357 (= call!42360 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1009038 () Bool)

(assert (=> b!1009038 (= e!567704 call!42360)))

(assert (= (and d!119651 (not res!677843)) b!1009035))

(assert (= (and b!1009035 c!101751) b!1009036))

(assert (= (and b!1009035 (not c!101751)) b!1009037))

(assert (= (and b!1009036 res!677844) b!1009038))

(assert (= (or b!1009038 b!1009037) bm!42357))

(assert (=> b!1009035 m!933085))

(assert (=> b!1009035 m!933085))

(assert (=> b!1009035 m!933087))

(assert (=> b!1009036 m!933085))

(declare-fun m!933101 () Bool)

(assert (=> b!1009036 m!933101))

(declare-fun m!933103 () Bool)

(assert (=> b!1009036 m!933103))

(assert (=> b!1009036 m!933085))

(declare-fun m!933105 () Bool)

(assert (=> b!1009036 m!933105))

(declare-fun m!933107 () Bool)

(assert (=> bm!42357 m!933107))

(assert (=> bm!42355 d!119651))

(declare-fun d!119653 () Bool)

(assert (=> d!119653 (arrayContainsKey!0 a!3219 lt!445812 #b00000000000000000000000000000000)))

(declare-fun lt!445836 () Unit!32891)

(declare-fun choose!13 (array!63545 (_ BitVec 64) (_ BitVec 32)) Unit!32891)

(assert (=> d!119653 (= lt!445836 (choose!13 a!3219 lt!445812 #b00000000000000000000000000000000))))

(assert (=> d!119653 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!119653 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!445812 #b00000000000000000000000000000000) lt!445836)))

(declare-fun bs!28667 () Bool)

(assert (= bs!28667 d!119653))

(assert (=> bs!28667 m!933039))

(declare-fun m!933109 () Bool)

(assert (=> bs!28667 m!933109))

(assert (=> b!1008986 d!119653))

(declare-fun d!119655 () Bool)

(declare-fun res!677845 () Bool)

(declare-fun e!567706 () Bool)

(assert (=> d!119655 (=> res!677845 e!567706)))

(assert (=> d!119655 (= res!677845 (= (select (arr!30593 a!3219) #b00000000000000000000000000000000) lt!445812))))

(assert (=> d!119655 (= (arrayContainsKey!0 a!3219 lt!445812 #b00000000000000000000000000000000) e!567706)))

(declare-fun b!1009039 () Bool)

(declare-fun e!567707 () Bool)

(assert (=> b!1009039 (= e!567706 e!567707)))

(declare-fun res!677846 () Bool)

(assert (=> b!1009039 (=> (not res!677846) (not e!567707))))

(assert (=> b!1009039 (= res!677846 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31097 a!3219)))))

(declare-fun b!1009040 () Bool)

(assert (=> b!1009040 (= e!567707 (arrayContainsKey!0 a!3219 lt!445812 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119655 (not res!677845)) b!1009039))

(assert (= (and b!1009039 res!677846) b!1009040))

(assert (=> d!119655 m!932945))

(declare-fun m!933111 () Bool)

(assert (=> b!1009040 m!933111))

(assert (=> b!1008986 d!119655))

(declare-fun b!1009041 () Bool)

(declare-fun c!101754 () Bool)

(declare-fun lt!445838 () (_ BitVec 64))

(assert (=> b!1009041 (= c!101754 (= lt!445838 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567708 () SeekEntryResult!9550)

(declare-fun e!567709 () SeekEntryResult!9550)

(assert (=> b!1009041 (= e!567708 e!567709)))

(declare-fun b!1009042 () Bool)

(declare-fun lt!445837 () SeekEntryResult!9550)

(assert (=> b!1009042 (= e!567708 (Found!9550 (index!40573 lt!445837)))))

(declare-fun d!119657 () Bool)

(declare-fun lt!445839 () SeekEntryResult!9550)

(assert (=> d!119657 (and (or (is-Undefined!9550 lt!445839) (not (is-Found!9550 lt!445839)) (and (bvsge (index!40572 lt!445839) #b00000000000000000000000000000000) (bvslt (index!40572 lt!445839) (size!31097 a!3219)))) (or (is-Undefined!9550 lt!445839) (is-Found!9550 lt!445839) (not (is-MissingZero!9550 lt!445839)) (and (bvsge (index!40571 lt!445839) #b00000000000000000000000000000000) (bvslt (index!40571 lt!445839) (size!31097 a!3219)))) (or (is-Undefined!9550 lt!445839) (is-Found!9550 lt!445839) (is-MissingZero!9550 lt!445839) (not (is-MissingVacant!9550 lt!445839)) (and (bvsge (index!40574 lt!445839) #b00000000000000000000000000000000) (bvslt (index!40574 lt!445839) (size!31097 a!3219)))) (or (is-Undefined!9550 lt!445839) (ite (is-Found!9550 lt!445839) (= (select (arr!30593 a!3219) (index!40572 lt!445839)) (select (arr!30593 a!3219) #b00000000000000000000000000000000)) (ite (is-MissingZero!9550 lt!445839) (= (select (arr!30593 a!3219) (index!40571 lt!445839)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9550 lt!445839) (= (select (arr!30593 a!3219) (index!40574 lt!445839)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!567710 () SeekEntryResult!9550)

(assert (=> d!119657 (= lt!445839 e!567710)))

(declare-fun c!101752 () Bool)

(assert (=> d!119657 (= c!101752 (and (is-Intermediate!9550 lt!445837) (undefined!10362 lt!445837)))))

(assert (=> d!119657 (= lt!445837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30593 a!3219) #b00000000000000000000000000000000) mask!3464) (select (arr!30593 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464))))

(assert (=> d!119657 (validMask!0 mask!3464)))

(assert (=> d!119657 (= (seekEntryOrOpen!0 (select (arr!30593 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) lt!445839)))

(declare-fun b!1009043 () Bool)

(assert (=> b!1009043 (= e!567709 (MissingZero!9550 (index!40573 lt!445837)))))

(declare-fun b!1009044 () Bool)

(assert (=> b!1009044 (= e!567710 Undefined!9550)))

(declare-fun b!1009045 () Bool)

(assert (=> b!1009045 (= e!567710 e!567708)))

(assert (=> b!1009045 (= lt!445838 (select (arr!30593 a!3219) (index!40573 lt!445837)))))

(declare-fun c!101753 () Bool)

(assert (=> b!1009045 (= c!101753 (= lt!445838 (select (arr!30593 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1009046 () Bool)

(assert (=> b!1009046 (= e!567709 (seekKeyOrZeroReturnVacant!0 (x!87967 lt!445837) (index!40573 lt!445837) (index!40573 lt!445837) (select (arr!30593 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464))))

(assert (= (and d!119657 c!101752) b!1009044))

(assert (= (and d!119657 (not c!101752)) b!1009045))

(assert (= (and b!1009045 c!101753) b!1009042))

(assert (= (and b!1009045 (not c!101753)) b!1009041))

(assert (= (and b!1009041 c!101754) b!1009043))

(assert (= (and b!1009041 (not c!101754)) b!1009046))

(declare-fun m!933113 () Bool)

(assert (=> d!119657 m!933113))

(declare-fun m!933115 () Bool)

(assert (=> d!119657 m!933115))

(assert (=> d!119657 m!932861))

(declare-fun m!933117 () Bool)

(assert (=> d!119657 m!933117))

(assert (=> d!119657 m!932945))

(declare-fun m!933119 () Bool)

(assert (=> d!119657 m!933119))

(declare-fun m!933121 () Bool)

(assert (=> d!119657 m!933121))

(assert (=> d!119657 m!932945))

(assert (=> d!119657 m!933117))

(declare-fun m!933123 () Bool)

(assert (=> b!1009045 m!933123))

(assert (=> b!1009046 m!932945))

(declare-fun m!933125 () Bool)

(assert (=> b!1009046 m!933125))

(assert (=> b!1008986 d!119657))

(declare-fun b!1009059 () Bool)

(declare-fun e!567719 () SeekEntryResult!9550)

(declare-fun e!567717 () SeekEntryResult!9550)

(assert (=> b!1009059 (= e!567719 e!567717)))

(declare-fun c!101762 () Bool)

(declare-fun lt!445845 () (_ BitVec 64))

(assert (=> b!1009059 (= c!101762 (= lt!445845 k!2224))))

(declare-fun b!1009060 () Bool)

(assert (=> b!1009060 (= e!567719 Undefined!9550)))

(declare-fun e!567718 () SeekEntryResult!9550)

(declare-fun b!1009061 () Bool)

(assert (=> b!1009061 (= e!567718 (seekKeyOrZeroReturnVacant!0 (bvadd (x!87967 lt!445785) #b00000000000000000000000000000001) (nextIndex!0 (index!40573 lt!445785) (x!87967 lt!445785) mask!3464) (index!40573 lt!445785) k!2224 a!3219 mask!3464))))

(declare-fun d!119659 () Bool)

(declare-fun lt!445844 () SeekEntryResult!9550)

(assert (=> d!119659 (and (or (is-Undefined!9550 lt!445844) (not (is-Found!9550 lt!445844)) (and (bvsge (index!40572 lt!445844) #b00000000000000000000000000000000) (bvslt (index!40572 lt!445844) (size!31097 a!3219)))) (or (is-Undefined!9550 lt!445844) (is-Found!9550 lt!445844) (not (is-MissingVacant!9550 lt!445844)) (not (= (index!40574 lt!445844) (index!40573 lt!445785))) (and (bvsge (index!40574 lt!445844) #b00000000000000000000000000000000) (bvslt (index!40574 lt!445844) (size!31097 a!3219)))) (or (is-Undefined!9550 lt!445844) (ite (is-Found!9550 lt!445844) (= (select (arr!30593 a!3219) (index!40572 lt!445844)) k!2224) (and (is-MissingVacant!9550 lt!445844) (= (index!40574 lt!445844) (index!40573 lt!445785)) (= (select (arr!30593 a!3219) (index!40574 lt!445844)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!119659 (= lt!445844 e!567719)))

(declare-fun c!101761 () Bool)

(assert (=> d!119659 (= c!101761 (bvsge (x!87967 lt!445785) #b01111111111111111111111111111110))))

(assert (=> d!119659 (= lt!445845 (select (arr!30593 a!3219) (index!40573 lt!445785)))))

(assert (=> d!119659 (validMask!0 mask!3464)))

(assert (=> d!119659 (= (seekKeyOrZeroReturnVacant!0 (x!87967 lt!445785) (index!40573 lt!445785) (index!40573 lt!445785) k!2224 a!3219 mask!3464) lt!445844)))

(declare-fun b!1009062 () Bool)

(declare-fun c!101763 () Bool)

(assert (=> b!1009062 (= c!101763 (= lt!445845 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009062 (= e!567717 e!567718)))

(declare-fun b!1009063 () Bool)

(assert (=> b!1009063 (= e!567718 (MissingVacant!9550 (index!40573 lt!445785)))))

(declare-fun b!1009064 () Bool)

(assert (=> b!1009064 (= e!567717 (Found!9550 (index!40573 lt!445785)))))

(assert (= (and d!119659 c!101761) b!1009060))

(assert (= (and d!119659 (not c!101761)) b!1009059))

(assert (= (and b!1009059 c!101762) b!1009064))

(assert (= (and b!1009059 (not c!101762)) b!1009062))

(assert (= (and b!1009062 c!101763) b!1009063))

(assert (= (and b!1009062 (not c!101763)) b!1009061))

(declare-fun m!933127 () Bool)

(assert (=> b!1009061 m!933127))

(assert (=> b!1009061 m!933127))

(declare-fun m!933129 () Bool)

(assert (=> b!1009061 m!933129))

(declare-fun m!933131 () Bool)

(assert (=> d!119659 m!933131))

(declare-fun m!933133 () Bool)

(assert (=> d!119659 m!933133))

(assert (=> d!119659 m!933017))

(assert (=> d!119659 m!932861))

(assert (=> b!1008946 d!119659))

(assert (=> b!1008850 d!119637))

(declare-fun b!1009065 () Bool)

(declare-fun e!567724 () Bool)

(declare-fun e!567722 () Bool)

(assert (=> b!1009065 (= e!567724 e!567722)))

(declare-fun res!677847 () Bool)

(declare-fun lt!445847 () SeekEntryResult!9550)

(assert (=> b!1009065 (= res!677847 (and (is-Intermediate!9550 lt!445847) (not (undefined!10362 lt!445847)) (bvslt (x!87967 lt!445847) #b01111111111111111111111111111110) (bvsge (x!87967 lt!445847) #b00000000000000000000000000000000) (bvsge (x!87967 lt!445847) #b00000000000000000000000000000000)))))

(assert (=> b!1009065 (=> (not res!677847) (not e!567722))))

(declare-fun b!1009066 () Bool)

(assert (=> b!1009066 (and (bvsge (index!40573 lt!445847) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445847) (size!31097 a!3219)))))

(declare-fun res!677848 () Bool)

(assert (=> b!1009066 (= res!677848 (= (select (arr!30593 a!3219) (index!40573 lt!445847)) k!2224))))

(declare-fun e!567721 () Bool)

(assert (=> b!1009066 (=> res!677848 e!567721)))

(assert (=> b!1009066 (= e!567722 e!567721)))

(declare-fun b!1009067 () Bool)

(assert (=> b!1009067 (and (bvsge (index!40573 lt!445847) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445847) (size!31097 a!3219)))))

(assert (=> b!1009067 (= e!567721 (= (select (arr!30593 a!3219) (index!40573 lt!445847)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009069 () Bool)

(declare-fun e!567723 () SeekEntryResult!9550)

(assert (=> b!1009069 (= e!567723 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2224 mask!3464) #b00000000000000000000000000000000 mask!3464) k!2224 a!3219 mask!3464))))

(declare-fun b!1009070 () Bool)

(assert (=> b!1009070 (= e!567724 (bvsge (x!87967 lt!445847) #b01111111111111111111111111111110))))

(declare-fun b!1009071 () Bool)

(assert (=> b!1009071 (= e!567723 (Intermediate!9550 false (toIndex!0 k!2224 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009068 () Bool)

(assert (=> b!1009068 (and (bvsge (index!40573 lt!445847) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445847) (size!31097 a!3219)))))

(declare-fun res!677849 () Bool)

(assert (=> b!1009068 (= res!677849 (= (select (arr!30593 a!3219) (index!40573 lt!445847)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009068 (=> res!677849 e!567721)))

(declare-fun d!119661 () Bool)

(assert (=> d!119661 e!567724))

(declare-fun c!101764 () Bool)

(assert (=> d!119661 (= c!101764 (and (is-Intermediate!9550 lt!445847) (undefined!10362 lt!445847)))))

(declare-fun e!567720 () SeekEntryResult!9550)

(assert (=> d!119661 (= lt!445847 e!567720)))

(declare-fun c!101765 () Bool)

(assert (=> d!119661 (= c!101765 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!445846 () (_ BitVec 64))

(assert (=> d!119661 (= lt!445846 (select (arr!30593 a!3219) (toIndex!0 k!2224 mask!3464)))))

(assert (=> d!119661 (validMask!0 mask!3464)))

(assert (=> d!119661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464) lt!445847)))

(declare-fun b!1009072 () Bool)

(assert (=> b!1009072 (= e!567720 e!567723)))

(declare-fun c!101766 () Bool)

(assert (=> b!1009072 (= c!101766 (or (= lt!445846 k!2224) (= (bvadd lt!445846 lt!445846) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009073 () Bool)

(assert (=> b!1009073 (= e!567720 (Intermediate!9550 true (toIndex!0 k!2224 mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!119661 c!101765) b!1009073))

(assert (= (and d!119661 (not c!101765)) b!1009072))

(assert (= (and b!1009072 c!101766) b!1009071))

(assert (= (and b!1009072 (not c!101766)) b!1009069))

(assert (= (and d!119661 c!101764) b!1009070))

(assert (= (and d!119661 (not c!101764)) b!1009065))

(assert (= (and b!1009065 res!677847) b!1009066))

(assert (= (and b!1009066 (not res!677848)) b!1009068))

(assert (= (and b!1009068 (not res!677849)) b!1009067))

(declare-fun m!933135 () Bool)

(assert (=> b!1009068 m!933135))

(assert (=> b!1009069 m!933011))

(declare-fun m!933137 () Bool)

(assert (=> b!1009069 m!933137))

(assert (=> b!1009069 m!933137))

(declare-fun m!933139 () Bool)

(assert (=> b!1009069 m!933139))

(assert (=> d!119661 m!933011))

(declare-fun m!933141 () Bool)

(assert (=> d!119661 m!933141))

(assert (=> d!119661 m!932861))

(assert (=> b!1009067 m!933135))

(assert (=> b!1009066 m!933135))

(assert (=> d!119601 d!119661))

(declare-fun d!119663 () Bool)

(declare-fun lt!445849 () (_ BitVec 32))

(declare-fun lt!445848 () (_ BitVec 32))

(assert (=> d!119663 (= lt!445849 (bvmul (bvxor lt!445848 (bvlshr lt!445848 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119663 (= lt!445848 ((_ extract 31 0) (bvand (bvxor k!2224 (bvlshr k!2224 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119663 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!677813 (let ((h!22520 ((_ extract 31 0) (bvand (bvxor k!2224 (bvlshr k!2224 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87975 (bvmul (bvxor h!22520 (bvlshr h!22520 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87975 (bvlshr x!87975 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!677813 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!677813 #b00000000000000000000000000000000))))))

(assert (=> d!119663 (= (toIndex!0 k!2224 mask!3464) (bvand (bvxor lt!445849 (bvlshr lt!445849 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> d!119601 d!119663))

(assert (=> d!119601 d!119589))

(declare-fun b!1009074 () Bool)

(declare-fun e!567729 () Bool)

(declare-fun e!567727 () Bool)

(assert (=> b!1009074 (= e!567729 e!567727)))

(declare-fun res!677850 () Bool)

(declare-fun lt!445851 () SeekEntryResult!9550)

(assert (=> b!1009074 (= res!677850 (and (is-Intermediate!9550 lt!445851) (not (undefined!10362 lt!445851)) (bvslt (x!87967 lt!445851) #b01111111111111111111111111111110) (bvsge (x!87967 lt!445851) #b00000000000000000000000000000000) (bvsge (x!87967 lt!445851) (bvadd x!1245 #b00000000000000000000000000000001))))))

(assert (=> b!1009074 (=> (not res!677850) (not e!567727))))

(declare-fun b!1009075 () Bool)

(assert (=> b!1009075 (and (bvsge (index!40573 lt!445851) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445851) (size!31097 a!3219)))))

(declare-fun res!677851 () Bool)

(assert (=> b!1009075 (= res!677851 (= (select (arr!30593 a!3219) (index!40573 lt!445851)) (select (arr!30593 a!3219) j!170)))))

(declare-fun e!567726 () Bool)

(assert (=> b!1009075 (=> res!677851 e!567726)))

(assert (=> b!1009075 (= e!567727 e!567726)))

(declare-fun b!1009076 () Bool)

(assert (=> b!1009076 (and (bvsge (index!40573 lt!445851) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445851) (size!31097 a!3219)))))

(assert (=> b!1009076 (= e!567726 (= (select (arr!30593 a!3219) (index!40573 lt!445851)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009078 () Bool)

(declare-fun e!567728 () SeekEntryResult!9550)

(assert (=> b!1009078 (= e!567728 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1507 x!1245 mask!3464) (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30593 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009079 () Bool)

(assert (=> b!1009079 (= e!567729 (bvsge (x!87967 lt!445851) #b01111111111111111111111111111110))))

(declare-fun b!1009080 () Bool)

(assert (=> b!1009080 (= e!567728 (Intermediate!9550 false (nextIndex!0 index!1507 x!1245 mask!3464) (bvadd x!1245 #b00000000000000000000000000000001)))))

(declare-fun b!1009077 () Bool)

(assert (=> b!1009077 (and (bvsge (index!40573 lt!445851) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445851) (size!31097 a!3219)))))

(declare-fun res!677852 () Bool)

(assert (=> b!1009077 (= res!677852 (= (select (arr!30593 a!3219) (index!40573 lt!445851)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009077 (=> res!677852 e!567726)))

(declare-fun d!119665 () Bool)

(assert (=> d!119665 e!567729))

(declare-fun c!101767 () Bool)

(assert (=> d!119665 (= c!101767 (and (is-Intermediate!9550 lt!445851) (undefined!10362 lt!445851)))))

(declare-fun e!567725 () SeekEntryResult!9550)

(assert (=> d!119665 (= lt!445851 e!567725)))

(declare-fun c!101768 () Bool)

(assert (=> d!119665 (= c!101768 (bvsge (bvadd x!1245 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!445850 () (_ BitVec 64))

(assert (=> d!119665 (= lt!445850 (select (arr!30593 a!3219) (nextIndex!0 index!1507 x!1245 mask!3464)))))

(assert (=> d!119665 (validMask!0 mask!3464)))

(assert (=> d!119665 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30593 a!3219) j!170) a!3219 mask!3464) lt!445851)))

(declare-fun b!1009081 () Bool)

(assert (=> b!1009081 (= e!567725 e!567728)))

(declare-fun c!101769 () Bool)

(assert (=> b!1009081 (= c!101769 (or (= lt!445850 (select (arr!30593 a!3219) j!170)) (= (bvadd lt!445850 lt!445850) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009082 () Bool)

(assert (=> b!1009082 (= e!567725 (Intermediate!9550 true (nextIndex!0 index!1507 x!1245 mask!3464) (bvadd x!1245 #b00000000000000000000000000000001)))))

(assert (= (and d!119665 c!101768) b!1009082))

(assert (= (and d!119665 (not c!101768)) b!1009081))

(assert (= (and b!1009081 c!101769) b!1009080))

(assert (= (and b!1009081 (not c!101769)) b!1009078))

(assert (= (and d!119665 c!101767) b!1009079))

(assert (= (and d!119665 (not c!101767)) b!1009074))

(assert (= (and b!1009074 res!677850) b!1009075))

(assert (= (and b!1009075 (not res!677851)) b!1009077))

(assert (= (and b!1009077 (not res!677852)) b!1009076))

(declare-fun m!933143 () Bool)

(assert (=> b!1009077 m!933143))

(assert (=> b!1009078 m!932847))

(assert (=> b!1009078 m!933079))

(assert (=> b!1009078 m!933079))

(assert (=> b!1009078 m!932849))

(declare-fun m!933145 () Bool)

(assert (=> b!1009078 m!933145))

(assert (=> d!119665 m!932847))

(declare-fun m!933147 () Bool)

(assert (=> d!119665 m!933147))

(assert (=> d!119665 m!932861))

(assert (=> b!1009076 m!933143))

(assert (=> b!1009075 m!933143))

(assert (=> b!1008993 d!119665))

(assert (=> b!1008993 d!119633))

(assert (=> b!1008985 d!119637))

(assert (=> d!119625 d!119589))

(assert (=> d!119559 d!119589))

(declare-fun d!119667 () Bool)

(declare-fun res!677855 () (_ BitVec 32))

(assert (=> d!119667 (and (bvsge res!677855 #b00000000000000000000000000000000) (bvslt res!677855 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(assert (=> d!119667 true))

(assert (=> d!119667 (= (choose!52 index!1507 x!1245 mask!3464) res!677855)))

(assert (=> d!119633 d!119667))

(assert (=> d!119633 d!119589))

(declare-fun b!1009083 () Bool)

(declare-fun e!567734 () Bool)

(declare-fun e!567732 () Bool)

(assert (=> b!1009083 (= e!567734 e!567732)))

(declare-fun res!677856 () Bool)

(declare-fun lt!445853 () SeekEntryResult!9550)

(assert (=> b!1009083 (= res!677856 (and (is-Intermediate!9550 lt!445853) (not (undefined!10362 lt!445853)) (bvslt (x!87967 lt!445853) #b01111111111111111111111111111110) (bvsge (x!87967 lt!445853) #b00000000000000000000000000000000) (bvsge (x!87967 lt!445853) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1009083 (=> (not res!677856) (not e!567732))))

(declare-fun b!1009084 () Bool)

(assert (=> b!1009084 (and (bvsge (index!40573 lt!445853) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445853) (size!31097 a!3219)))))

(declare-fun res!677857 () Bool)

(assert (=> b!1009084 (= res!677857 (= (select (arr!30593 a!3219) (index!40573 lt!445853)) (select (arr!30593 a!3219) j!170)))))

(declare-fun e!567731 () Bool)

(assert (=> b!1009084 (=> res!677857 e!567731)))

(assert (=> b!1009084 (= e!567732 e!567731)))

(declare-fun b!1009085 () Bool)

(assert (=> b!1009085 (and (bvsge (index!40573 lt!445853) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445853) (size!31097 a!3219)))))

(assert (=> b!1009085 (= e!567731 (= (select (arr!30593 a!3219) (index!40573 lt!445853)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567733 () SeekEntryResult!9550)

(declare-fun b!1009087 () Bool)

(assert (=> b!1009087 (= e!567733 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!30593 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (select (arr!30593 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009088 () Bool)

(assert (=> b!1009088 (= e!567734 (bvsge (x!87967 lt!445853) #b01111111111111111111111111111110))))

(declare-fun b!1009089 () Bool)

(assert (=> b!1009089 (= e!567733 (Intermediate!9550 false (nextIndex!0 (toIndex!0 (select (arr!30593 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1009086 () Bool)

(assert (=> b!1009086 (and (bvsge (index!40573 lt!445853) #b00000000000000000000000000000000) (bvslt (index!40573 lt!445853) (size!31097 a!3219)))))

(declare-fun res!677858 () Bool)

(assert (=> b!1009086 (= res!677858 (= (select (arr!30593 a!3219) (index!40573 lt!445853)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009086 (=> res!677858 e!567731)))

(declare-fun d!119669 () Bool)

(assert (=> d!119669 e!567734))

(declare-fun c!101770 () Bool)

(assert (=> d!119669 (= c!101770 (and (is-Intermediate!9550 lt!445853) (undefined!10362 lt!445853)))))

(declare-fun e!567730 () SeekEntryResult!9550)

(assert (=> d!119669 (= lt!445853 e!567730)))

(declare-fun c!101771 () Bool)

(assert (=> d!119669 (= c!101771 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(declare-fun lt!445852 () (_ BitVec 64))

(assert (=> d!119669 (= lt!445852 (select (arr!30593 a!3219) (nextIndex!0 (toIndex!0 (select (arr!30593 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464)))))

(assert (=> d!119669 (validMask!0 mask!3464)))

(assert (=> d!119669 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30593 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30593 a!3219) j!170) a!3219 mask!3464) lt!445853)))

(declare-fun b!1009090 () Bool)

(assert (=> b!1009090 (= e!567730 e!567733)))

(declare-fun c!101772 () Bool)

(assert (=> b!1009090 (= c!101772 (or (= lt!445852 (select (arr!30593 a!3219) j!170)) (= (bvadd lt!445852 lt!445852) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009091 () Bool)

(assert (=> b!1009091 (= e!567730 (Intermediate!9550 true (nextIndex!0 (toIndex!0 (select (arr!30593 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119669 c!101771) b!1009091))

(assert (= (and d!119669 (not c!101771)) b!1009090))

(assert (= (and b!1009090 c!101772) b!1009089))

(assert (= (and b!1009090 (not c!101772)) b!1009087))

(assert (= (and d!119669 c!101770) b!1009088))

(assert (= (and d!119669 (not c!101770)) b!1009083))

(assert (= (and b!1009083 res!677856) b!1009084))

(assert (= (and b!1009084 (not res!677857)) b!1009086))

(assert (= (and b!1009086 (not res!677858)) b!1009085))

(declare-fun m!933149 () Bool)

(assert (=> b!1009086 m!933149))

(assert (=> b!1009087 m!933031))

(declare-fun m!933151 () Bool)

(assert (=> b!1009087 m!933151))

(assert (=> b!1009087 m!933151))

(assert (=> b!1009087 m!932849))

(declare-fun m!933153 () Bool)

(assert (=> b!1009087 m!933153))

(assert (=> d!119669 m!933031))

(declare-fun m!933155 () Bool)

(assert (=> d!119669 m!933155))

(assert (=> d!119669 m!932861))

(assert (=> b!1009085 m!933149))

(assert (=> b!1009084 m!933149))

(assert (=> b!1008960 d!119669))

(declare-fun d!119671 () Bool)

(declare-fun lt!445854 () (_ BitVec 32))

(assert (=> d!119671 (and (bvsge lt!445854 #b00000000000000000000000000000000) (bvslt lt!445854 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(assert (=> d!119671 (= lt!445854 (choose!52 (toIndex!0 (select (arr!30593 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464))))

(assert (=> d!119671 (validMask!0 mask!3464)))

(assert (=> d!119671 (= (nextIndex!0 (toIndex!0 (select (arr!30593 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) lt!445854)))

(declare-fun bs!28668 () Bool)

(assert (= bs!28668 d!119671))

(assert (=> bs!28668 m!932877))

(declare-fun m!933157 () Bool)

(assert (=> bs!28668 m!933157))

(assert (=> bs!28668 m!932861))

(assert (=> b!1008960 d!119671))

(push 1)

(assert (not d!119661))

(assert (not b!1009040))

(assert (not bm!42356))

(assert (not b!1009008))

(assert (not d!119639))

(assert (not b!1009026))

(assert (not b!1009032))

(assert (not b!1009024))

(assert (not b!1009087))

(assert (not d!119657))

(assert (not d!119659))

(assert (not b!1009035))

(assert (not b!1009017))

(assert (not b!1009023))

(assert (not b!1009036))

(assert (not b!1009078))

(assert (not d!119671))

(assert (not b!1009069))

(assert (not b!1009034))

(assert (not d!119669))

(assert (not b!1009061))

(assert (not d!119665))

(assert (not d!119641))

(assert (not b!1009046))

(assert (not bm!42357))

(assert (not d!119647))

(assert (not d!119643))

(assert (not d!119653))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

