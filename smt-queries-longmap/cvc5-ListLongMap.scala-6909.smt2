; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86812 () Bool)

(assert start!86812)

(declare-fun b!1006597 () Bool)

(declare-fun res!675814 () Bool)

(declare-fun e!566528 () Bool)

(assert (=> b!1006597 (=> (not res!675814) (not e!566528))))

(declare-datatypes ((array!63458 0))(
  ( (array!63459 (arr!30551 (Array (_ BitVec 32) (_ BitVec 64))) (size!31055 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63458)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006597 (= res!675814 (validKeyInArray!0 (select (arr!30551 a!3219) j!170)))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun e!566525 () Bool)

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun b!1006598 () Bool)

(assert (=> b!1006598 (= e!566525 (and (= index!1507 resIndex!38) (= x!1245 resX!38) (not (= resIndex!38 i!1194))))))

(declare-fun b!1006599 () Bool)

(declare-fun e!566524 () Bool)

(declare-fun e!566527 () Bool)

(assert (=> b!1006599 (= e!566524 e!566527)))

(declare-fun res!675812 () Bool)

(assert (=> b!1006599 (=> (not res!675812) (not e!566527))))

(declare-datatypes ((SeekEntryResult!9508 0))(
  ( (MissingZero!9508 (index!40403 (_ BitVec 32))) (Found!9508 (index!40404 (_ BitVec 32))) (Intermediate!9508 (undefined!10320 Bool) (index!40405 (_ BitVec 32)) (x!87807 (_ BitVec 32))) (Undefined!9508) (MissingVacant!9508 (index!40406 (_ BitVec 32))) )
))
(declare-fun lt!444700 () SeekEntryResult!9508)

(declare-fun lt!444703 () SeekEntryResult!9508)

(assert (=> b!1006599 (= res!675812 (= lt!444700 lt!444703))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63458 (_ BitVec 32)) SeekEntryResult!9508)

(assert (=> b!1006599 (= lt!444700 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30551 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006600 () Bool)

(declare-fun res!675815 () Bool)

(assert (=> b!1006600 (=> (not res!675815) (not e!566528))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006600 (= res!675815 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006601 () Bool)

(declare-fun e!566523 () Bool)

(assert (=> b!1006601 (= e!566523 e!566524)))

(declare-fun res!675809 () Bool)

(assert (=> b!1006601 (=> (not res!675809) (not e!566524))))

(declare-fun lt!444701 () SeekEntryResult!9508)

(assert (=> b!1006601 (= res!675809 (= lt!444701 lt!444703))))

(assert (=> b!1006601 (= lt!444703 (Intermediate!9508 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006601 (= lt!444701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30551 a!3219) j!170) mask!3464) (select (arr!30551 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006602 () Bool)

(declare-fun res!675813 () Bool)

(assert (=> b!1006602 (=> (not res!675813) (not e!566523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63458 (_ BitVec 32)) Bool)

(assert (=> b!1006602 (= res!675813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006603 () Bool)

(declare-fun res!675819 () Bool)

(assert (=> b!1006603 (=> (not res!675819) (not e!566523))))

(declare-datatypes ((List!21293 0))(
  ( (Nil!21290) (Cons!21289 (h!22472 (_ BitVec 64)) (t!30285 List!21293)) )
))
(declare-fun arrayNoDuplicates!0 (array!63458 (_ BitVec 32) List!21293) Bool)

(assert (=> b!1006603 (= res!675819 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21290))))

(declare-fun res!675811 () Bool)

(assert (=> start!86812 (=> (not res!675811) (not e!566528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86812 (= res!675811 (validMask!0 mask!3464))))

(assert (=> start!86812 e!566528))

(declare-fun array_inv!23694 (array!63458) Bool)

(assert (=> start!86812 (array_inv!23694 a!3219)))

(assert (=> start!86812 true))

(declare-fun b!1006604 () Bool)

(declare-fun res!675821 () Bool)

(assert (=> b!1006604 (=> (not res!675821) (not e!566528))))

(assert (=> b!1006604 (= res!675821 (and (= (size!31055 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31055 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31055 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006605 () Bool)

(assert (=> b!1006605 (= e!566528 e!566523)))

(declare-fun res!675817 () Bool)

(assert (=> b!1006605 (=> (not res!675817) (not e!566523))))

(declare-fun lt!444702 () SeekEntryResult!9508)

(assert (=> b!1006605 (= res!675817 (or (= lt!444702 (MissingVacant!9508 i!1194)) (= lt!444702 (MissingZero!9508 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63458 (_ BitVec 32)) SeekEntryResult!9508)

(assert (=> b!1006605 (= lt!444702 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006606 () Bool)

(assert (=> b!1006606 (= e!566527 e!566525)))

(declare-fun res!675810 () Bool)

(assert (=> b!1006606 (=> (not res!675810) (not e!566525))))

(declare-fun lt!444699 () array!63458)

(declare-fun lt!444698 () (_ BitVec 64))

(assert (=> b!1006606 (= res!675810 (not (= lt!444701 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444698 mask!3464) lt!444698 lt!444699 mask!3464))))))

(assert (=> b!1006606 (= lt!444698 (select (store (arr!30551 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1006606 (= lt!444699 (array!63459 (store (arr!30551 a!3219) i!1194 k!2224) (size!31055 a!3219)))))

(declare-fun b!1006607 () Bool)

(declare-fun res!675816 () Bool)

(assert (=> b!1006607 (=> (not res!675816) (not e!566523))))

(assert (=> b!1006607 (= res!675816 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31055 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31055 a!3219))))))

(declare-fun b!1006608 () Bool)

(declare-fun res!675820 () Bool)

(assert (=> b!1006608 (=> (not res!675820) (not e!566528))))

(assert (=> b!1006608 (= res!675820 (validKeyInArray!0 k!2224))))

(declare-fun b!1006609 () Bool)

(declare-fun res!675818 () Bool)

(assert (=> b!1006609 (=> (not res!675818) (not e!566525))))

(assert (=> b!1006609 (= res!675818 (not (= lt!444700 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444698 lt!444699 mask!3464))))))

(assert (= (and start!86812 res!675811) b!1006604))

(assert (= (and b!1006604 res!675821) b!1006597))

(assert (= (and b!1006597 res!675814) b!1006608))

(assert (= (and b!1006608 res!675820) b!1006600))

(assert (= (and b!1006600 res!675815) b!1006605))

(assert (= (and b!1006605 res!675817) b!1006602))

(assert (= (and b!1006602 res!675813) b!1006603))

(assert (= (and b!1006603 res!675819) b!1006607))

(assert (= (and b!1006607 res!675816) b!1006601))

(assert (= (and b!1006601 res!675809) b!1006599))

(assert (= (and b!1006599 res!675812) b!1006606))

(assert (= (and b!1006606 res!675810) b!1006609))

(assert (= (and b!1006609 res!675818) b!1006598))

(declare-fun m!931149 () Bool)

(assert (=> b!1006603 m!931149))

(declare-fun m!931151 () Bool)

(assert (=> start!86812 m!931151))

(declare-fun m!931153 () Bool)

(assert (=> start!86812 m!931153))

(declare-fun m!931155 () Bool)

(assert (=> b!1006605 m!931155))

(declare-fun m!931157 () Bool)

(assert (=> b!1006602 m!931157))

(declare-fun m!931159 () Bool)

(assert (=> b!1006609 m!931159))

(declare-fun m!931161 () Bool)

(assert (=> b!1006599 m!931161))

(assert (=> b!1006599 m!931161))

(declare-fun m!931163 () Bool)

(assert (=> b!1006599 m!931163))

(assert (=> b!1006601 m!931161))

(assert (=> b!1006601 m!931161))

(declare-fun m!931165 () Bool)

(assert (=> b!1006601 m!931165))

(assert (=> b!1006601 m!931165))

(assert (=> b!1006601 m!931161))

(declare-fun m!931167 () Bool)

(assert (=> b!1006601 m!931167))

(declare-fun m!931169 () Bool)

(assert (=> b!1006600 m!931169))

(declare-fun m!931171 () Bool)

(assert (=> b!1006608 m!931171))

(declare-fun m!931173 () Bool)

(assert (=> b!1006606 m!931173))

(assert (=> b!1006606 m!931173))

(declare-fun m!931175 () Bool)

(assert (=> b!1006606 m!931175))

(declare-fun m!931177 () Bool)

(assert (=> b!1006606 m!931177))

(declare-fun m!931179 () Bool)

(assert (=> b!1006606 m!931179))

(assert (=> b!1006597 m!931161))

(assert (=> b!1006597 m!931161))

(declare-fun m!931181 () Bool)

(assert (=> b!1006597 m!931181))

(push 1)

(assert (not b!1006606))

(assert (not b!1006609))

(assert (not b!1006603))

(assert (not b!1006601))

(assert (not start!86812))

(assert (not b!1006605))

(assert (not b!1006608))

(assert (not b!1006602))

(assert (not b!1006599))

(assert (not b!1006597))

(assert (not b!1006600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1006669 () Bool)

(declare-fun e!566567 () Bool)

(declare-fun call!42325 () Bool)

(assert (=> b!1006669 (= e!566567 call!42325)))

(declare-fun b!1006670 () Bool)

(declare-fun e!566568 () Bool)

(assert (=> b!1006670 (= e!566568 e!566567)))

(declare-fun lt!444727 () (_ BitVec 64))

(assert (=> b!1006670 (= lt!444727 (select (arr!30551 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32881 0))(
  ( (Unit!32882) )
))
(declare-fun lt!444728 () Unit!32881)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63458 (_ BitVec 64) (_ BitVec 32)) Unit!32881)

(assert (=> b!1006670 (= lt!444728 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!444727 #b00000000000000000000000000000000))))

(assert (=> b!1006670 (arrayContainsKey!0 a!3219 lt!444727 #b00000000000000000000000000000000)))

(declare-fun lt!444726 () Unit!32881)

(assert (=> b!1006670 (= lt!444726 lt!444728)))

(declare-fun res!675848 () Bool)

(assert (=> b!1006670 (= res!675848 (= (seekEntryOrOpen!0 (select (arr!30551 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9508 #b00000000000000000000000000000000)))))

(assert (=> b!1006670 (=> (not res!675848) (not e!566567))))

(declare-fun bm!42322 () Bool)

(assert (=> bm!42322 (= call!42325 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1006671 () Bool)

(assert (=> b!1006671 (= e!566568 call!42325)))

(declare-fun b!1006672 () Bool)

(declare-fun e!566566 () Bool)

(assert (=> b!1006672 (= e!566566 e!566568)))

(declare-fun c!101563 () Bool)

(assert (=> b!1006672 (= c!101563 (validKeyInArray!0 (select (arr!30551 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119449 () Bool)

(declare-fun res!675849 () Bool)

(assert (=> d!119449 (=> res!675849 e!566566)))

(assert (=> d!119449 (= res!675849 (bvsge #b00000000000000000000000000000000 (size!31055 a!3219)))))

(assert (=> d!119449 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!566566)))

(assert (= (and d!119449 (not res!675849)) b!1006672))

(assert (= (and b!1006672 c!101563) b!1006670))

(assert (= (and b!1006672 (not c!101563)) b!1006671))

(assert (= (and b!1006670 res!675848) b!1006669))

(assert (= (or b!1006669 b!1006671) bm!42322))

(declare-fun m!931209 () Bool)

(assert (=> b!1006670 m!931209))

(declare-fun m!931211 () Bool)

(assert (=> b!1006670 m!931211))

(declare-fun m!931213 () Bool)

(assert (=> b!1006670 m!931213))

(assert (=> b!1006670 m!931209))

(declare-fun m!931215 () Bool)

(assert (=> b!1006670 m!931215))

(declare-fun m!931217 () Bool)

(assert (=> bm!42322 m!931217))

(assert (=> b!1006672 m!931209))

(assert (=> b!1006672 m!931209))

(declare-fun m!931219 () Bool)

(assert (=> b!1006672 m!931219))

(assert (=> b!1006602 d!119449))

(declare-fun d!119461 () Bool)

(assert (=> d!119461 (= (validKeyInArray!0 (select (arr!30551 a!3219) j!170)) (and (not (= (select (arr!30551 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30551 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1006597 d!119461))

(declare-fun d!119463 () Bool)

(assert (=> d!119463 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1006608 d!119463))

(declare-fun b!1006701 () Bool)

(declare-fun e!566588 () Bool)

(declare-fun contains!5857 (List!21293 (_ BitVec 64)) Bool)

(assert (=> b!1006701 (= e!566588 (contains!5857 Nil!21290 (select (arr!30551 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1006703 () Bool)

(declare-fun e!566590 () Bool)

(declare-fun call!42328 () Bool)

(assert (=> b!1006703 (= e!566590 call!42328)))

(declare-fun b!1006704 () Bool)

(declare-fun e!566587 () Bool)

(declare-fun e!566589 () Bool)

(assert (=> b!1006704 (= e!566587 e!566589)))

(declare-fun res!675862 () Bool)

(assert (=> b!1006704 (=> (not res!675862) (not e!566589))))

(assert (=> b!1006704 (= res!675862 (not e!566588))))

(declare-fun res!675864 () Bool)

(assert (=> b!1006704 (=> (not res!675864) (not e!566588))))

(assert (=> b!1006704 (= res!675864 (validKeyInArray!0 (select (arr!30551 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42325 () Bool)

(declare-fun c!101572 () Bool)

(assert (=> bm!42325 (= call!42328 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101572 (Cons!21289 (select (arr!30551 a!3219) #b00000000000000000000000000000000) Nil!21290) Nil!21290)))))

(declare-fun b!1006705 () Bool)

(assert (=> b!1006705 (= e!566589 e!566590)))

(assert (=> b!1006705 (= c!101572 (validKeyInArray!0 (select (arr!30551 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119465 () Bool)

(declare-fun res!675863 () Bool)

(assert (=> d!119465 (=> res!675863 e!566587)))

(assert (=> d!119465 (= res!675863 (bvsge #b00000000000000000000000000000000 (size!31055 a!3219)))))

(assert (=> d!119465 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21290) e!566587)))

(declare-fun b!1006702 () Bool)

(assert (=> b!1006702 (= e!566590 call!42328)))

(assert (= (and d!119465 (not res!675863)) b!1006704))

(assert (= (and b!1006704 res!675864) b!1006701))

(assert (= (and b!1006704 res!675862) b!1006705))

(assert (= (and b!1006705 c!101572) b!1006702))

(assert (= (and b!1006705 (not c!101572)) b!1006703))

(assert (= (or b!1006702 b!1006703) bm!42325))

(assert (=> b!1006701 m!931209))

(assert (=> b!1006701 m!931209))

(declare-fun m!931221 () Bool)

(assert (=> b!1006701 m!931221))

(assert (=> b!1006704 m!931209))

(assert (=> b!1006704 m!931209))

(assert (=> b!1006704 m!931219))

(assert (=> bm!42325 m!931209))

(declare-fun m!931223 () Bool)

(assert (=> bm!42325 m!931223))

(assert (=> b!1006705 m!931209))

(assert (=> b!1006705 m!931209))

(assert (=> b!1006705 m!931219))

(assert (=> b!1006603 d!119465))

(declare-fun b!1006790 () Bool)

(declare-fun e!566645 () Bool)

(declare-fun e!566647 () Bool)

(assert (=> b!1006790 (= e!566645 e!566647)))

(declare-fun res!675895 () Bool)

(declare-fun lt!444754 () SeekEntryResult!9508)

(assert (=> b!1006790 (= res!675895 (and (is-Intermediate!9508 lt!444754) (not (undefined!10320 lt!444754)) (bvslt (x!87807 lt!444754) #b01111111111111111111111111111110) (bvsge (x!87807 lt!444754) #b00000000000000000000000000000000) (bvsge (x!87807 lt!444754) x!1245)))))

(assert (=> b!1006790 (=> (not res!675895) (not e!566647))))

(declare-fun b!1006791 () Bool)

(assert (=> b!1006791 (= e!566645 (bvsge (x!87807 lt!444754) #b01111111111111111111111111111110))))

(declare-fun b!1006792 () Bool)

(assert (=> b!1006792 (and (bvsge (index!40405 lt!444754) #b00000000000000000000000000000000) (bvslt (index!40405 lt!444754) (size!31055 lt!444699)))))

(declare-fun e!566644 () Bool)

(assert (=> b!1006792 (= e!566644 (= (select (arr!30551 lt!444699) (index!40405 lt!444754)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1006793 () Bool)

(declare-fun e!566643 () SeekEntryResult!9508)

(declare-fun e!566646 () SeekEntryResult!9508)

(assert (=> b!1006793 (= e!566643 e!566646)))

(declare-fun c!101600 () Bool)

(declare-fun lt!444755 () (_ BitVec 64))

(assert (=> b!1006793 (= c!101600 (or (= lt!444755 lt!444698) (= (bvadd lt!444755 lt!444755) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1006794 () Bool)

(assert (=> b!1006794 (= e!566646 (Intermediate!9508 false index!1507 x!1245))))

(declare-fun d!119467 () Bool)

(assert (=> d!119467 e!566645))

(declare-fun c!101602 () Bool)

(assert (=> d!119467 (= c!101602 (and (is-Intermediate!9508 lt!444754) (undefined!10320 lt!444754)))))

(assert (=> d!119467 (= lt!444754 e!566643)))

(declare-fun c!101601 () Bool)

(assert (=> d!119467 (= c!101601 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119467 (= lt!444755 (select (arr!30551 lt!444699) index!1507))))

(assert (=> d!119467 (validMask!0 mask!3464)))

(assert (=> d!119467 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444698 lt!444699 mask!3464) lt!444754)))

(declare-fun b!1006795 () Bool)

(assert (=> b!1006795 (= e!566643 (Intermediate!9508 true index!1507 x!1245))))

(declare-fun b!1006796 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006796 (= e!566646 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!444698 lt!444699 mask!3464))))

(declare-fun b!1006797 () Bool)

(assert (=> b!1006797 (and (bvsge (index!40405 lt!444754) #b00000000000000000000000000000000) (bvslt (index!40405 lt!444754) (size!31055 lt!444699)))))

(declare-fun res!675897 () Bool)

(assert (=> b!1006797 (= res!675897 (= (select (arr!30551 lt!444699) (index!40405 lt!444754)) lt!444698))))

(assert (=> b!1006797 (=> res!675897 e!566644)))

(assert (=> b!1006797 (= e!566647 e!566644)))

(declare-fun b!1006798 () Bool)

(assert (=> b!1006798 (and (bvsge (index!40405 lt!444754) #b00000000000000000000000000000000) (bvslt (index!40405 lt!444754) (size!31055 lt!444699)))))

(declare-fun res!675896 () Bool)

(assert (=> b!1006798 (= res!675896 (= (select (arr!30551 lt!444699) (index!40405 lt!444754)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1006798 (=> res!675896 e!566644)))

(assert (= (and d!119467 c!101601) b!1006795))

(assert (= (and d!119467 (not c!101601)) b!1006793))

(assert (= (and b!1006793 c!101600) b!1006794))

(assert (= (and b!1006793 (not c!101600)) b!1006796))

(assert (= (and d!119467 c!101602) b!1006791))

(assert (= (and d!119467 (not c!101602)) b!1006790))

(assert (= (and b!1006790 res!675895) b!1006797))

(assert (= (and b!1006797 (not res!675897)) b!1006798))

(assert (= (and b!1006798 (not res!675896)) b!1006792))

(declare-fun m!931271 () Bool)

(assert (=> b!1006796 m!931271))

(assert (=> b!1006796 m!931271))

(declare-fun m!931273 () Bool)

(assert (=> b!1006796 m!931273))

(declare-fun m!931275 () Bool)

(assert (=> b!1006792 m!931275))

(declare-fun m!931277 () Bool)

(assert (=> d!119467 m!931277))

(assert (=> d!119467 m!931151))

(assert (=> b!1006798 m!931275))

(assert (=> b!1006797 m!931275))

(assert (=> b!1006609 d!119467))

(declare-fun b!1006799 () Bool)

(declare-fun e!566650 () Bool)

(declare-fun e!566652 () Bool)

(assert (=> b!1006799 (= e!566650 e!566652)))

(declare-fun res!675898 () Bool)

(declare-fun lt!444756 () SeekEntryResult!9508)

(assert (=> b!1006799 (= res!675898 (and (is-Intermediate!9508 lt!444756) (not (undefined!10320 lt!444756)) (bvslt (x!87807 lt!444756) #b01111111111111111111111111111110) (bvsge (x!87807 lt!444756) #b00000000000000000000000000000000) (bvsge (x!87807 lt!444756) x!1245)))))

(assert (=> b!1006799 (=> (not res!675898) (not e!566652))))

(declare-fun b!1006800 () Bool)

(assert (=> b!1006800 (= e!566650 (bvsge (x!87807 lt!444756) #b01111111111111111111111111111110))))

(declare-fun b!1006801 () Bool)

(assert (=> b!1006801 (and (bvsge (index!40405 lt!444756) #b00000000000000000000000000000000) (bvslt (index!40405 lt!444756) (size!31055 a!3219)))))

(declare-fun e!566649 () Bool)

(assert (=> b!1006801 (= e!566649 (= (select (arr!30551 a!3219) (index!40405 lt!444756)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1006802 () Bool)

(declare-fun e!566648 () SeekEntryResult!9508)

(declare-fun e!566651 () SeekEntryResult!9508)

(assert (=> b!1006802 (= e!566648 e!566651)))

(declare-fun c!101603 () Bool)

(declare-fun lt!444757 () (_ BitVec 64))

(assert (=> b!1006802 (= c!101603 (or (= lt!444757 (select (arr!30551 a!3219) j!170)) (= (bvadd lt!444757 lt!444757) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1006803 () Bool)

(assert (=> b!1006803 (= e!566651 (Intermediate!9508 false index!1507 x!1245))))

(declare-fun d!119487 () Bool)

(assert (=> d!119487 e!566650))

(declare-fun c!101605 () Bool)

(assert (=> d!119487 (= c!101605 (and (is-Intermediate!9508 lt!444756) (undefined!10320 lt!444756)))))

(assert (=> d!119487 (= lt!444756 e!566648)))

(declare-fun c!101604 () Bool)

(assert (=> d!119487 (= c!101604 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119487 (= lt!444757 (select (arr!30551 a!3219) index!1507))))

(assert (=> d!119487 (validMask!0 mask!3464)))

(assert (=> d!119487 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30551 a!3219) j!170) a!3219 mask!3464) lt!444756)))

(declare-fun b!1006804 () Bool)

(assert (=> b!1006804 (= e!566648 (Intermediate!9508 true index!1507 x!1245))))

(declare-fun b!1006805 () Bool)

(assert (=> b!1006805 (= e!566651 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30551 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006806 () Bool)

(assert (=> b!1006806 (and (bvsge (index!40405 lt!444756) #b00000000000000000000000000000000) (bvslt (index!40405 lt!444756) (size!31055 a!3219)))))

(declare-fun res!675900 () Bool)

(assert (=> b!1006806 (= res!675900 (= (select (arr!30551 a!3219) (index!40405 lt!444756)) (select (arr!30551 a!3219) j!170)))))

(assert (=> b!1006806 (=> res!675900 e!566649)))

(assert (=> b!1006806 (= e!566652 e!566649)))

(declare-fun b!1006807 () Bool)

(assert (=> b!1006807 (and (bvsge (index!40405 lt!444756) #b00000000000000000000000000000000) (bvslt (index!40405 lt!444756) (size!31055 a!3219)))))

(declare-fun res!675899 () Bool)

(assert (=> b!1006807 (= res!675899 (= (select (arr!30551 a!3219) (index!40405 lt!444756)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1006807 (=> res!675899 e!566649)))

(assert (= (and d!119487 c!101604) b!1006804))

(assert (= (and d!119487 (not c!101604)) b!1006802))

(assert (= (and b!1006802 c!101603) b!1006803))

(assert (= (and b!1006802 (not c!101603)) b!1006805))

(assert (= (and d!119487 c!101605) b!1006800))

(assert (= (and d!119487 (not c!101605)) b!1006799))

(assert (= (and b!1006799 res!675898) b!1006806))

(assert (= (and b!1006806 (not res!675900)) b!1006807))

(assert (= (and b!1006807 (not res!675899)) b!1006801))

(assert (=> b!1006805 m!931271))

(assert (=> b!1006805 m!931271))

(assert (=> b!1006805 m!931161))

(declare-fun m!931279 () Bool)

(assert (=> b!1006805 m!931279))

(declare-fun m!931281 () Bool)

(assert (=> b!1006801 m!931281))

(declare-fun m!931283 () Bool)

(assert (=> d!119487 m!931283))

(assert (=> d!119487 m!931151))

(assert (=> b!1006807 m!931281))

(assert (=> b!1006806 m!931281))

(assert (=> b!1006599 d!119487))

(declare-fun b!1006859 () Bool)

(declare-fun lt!444785 () SeekEntryResult!9508)

(declare-fun e!566683 () SeekEntryResult!9508)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63458 (_ BitVec 32)) SeekEntryResult!9508)

(assert (=> b!1006859 (= e!566683 (seekKeyOrZeroReturnVacant!0 (x!87807 lt!444785) (index!40405 lt!444785) (index!40405 lt!444785) k!2224 a!3219 mask!3464))))

(declare-fun b!1006860 () Bool)

(declare-fun e!566684 () SeekEntryResult!9508)

(assert (=> b!1006860 (= e!566684 (Found!9508 (index!40405 lt!444785)))))

(declare-fun b!1006861 () Bool)

(declare-fun e!566682 () SeekEntryResult!9508)

(assert (=> b!1006861 (= e!566682 e!566684)))

(declare-fun lt!444784 () (_ BitVec 64))

(assert (=> b!1006861 (= lt!444784 (select (arr!30551 a!3219) (index!40405 lt!444785)))))

(declare-fun c!101628 () Bool)

(assert (=> b!1006861 (= c!101628 (= lt!444784 k!2224))))

(declare-fun b!1006863 () Bool)

(assert (=> b!1006863 (= e!566682 Undefined!9508)))

(declare-fun b!1006864 () Bool)

(declare-fun c!101627 () Bool)

(assert (=> b!1006864 (= c!101627 (= lt!444784 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1006864 (= e!566684 e!566683)))

(declare-fun d!119489 () Bool)

(declare-fun lt!444786 () SeekEntryResult!9508)

(assert (=> d!119489 (and (or (is-Undefined!9508 lt!444786) (not (is-Found!9508 lt!444786)) (and (bvsge (index!40404 lt!444786) #b00000000000000000000000000000000) (bvslt (index!40404 lt!444786) (size!31055 a!3219)))) (or (is-Undefined!9508 lt!444786) (is-Found!9508 lt!444786) (not (is-MissingZero!9508 lt!444786)) (and (bvsge (index!40403 lt!444786) #b00000000000000000000000000000000) (bvslt (index!40403 lt!444786) (size!31055 a!3219)))) (or (is-Undefined!9508 lt!444786) (is-Found!9508 lt!444786) (is-MissingZero!9508 lt!444786) (not (is-MissingVacant!9508 lt!444786)) (and (bvsge (index!40406 lt!444786) #b00000000000000000000000000000000) (bvslt (index!40406 lt!444786) (size!31055 a!3219)))) (or (is-Undefined!9508 lt!444786) (ite (is-Found!9508 lt!444786) (= (select (arr!30551 a!3219) (index!40404 lt!444786)) k!2224) (ite (is-MissingZero!9508 lt!444786) (= (select (arr!30551 a!3219) (index!40403 lt!444786)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9508 lt!444786) (= (select (arr!30551 a!3219) (index!40406 lt!444786)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119489 (= lt!444786 e!566682)))

(declare-fun c!101629 () Bool)

(assert (=> d!119489 (= c!101629 (and (is-Intermediate!9508 lt!444785) (undefined!10320 lt!444785)))))

(assert (=> d!119489 (= lt!444785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119489 (validMask!0 mask!3464)))

(assert (=> d!119489 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!444786)))

(declare-fun b!1006862 () Bool)

(assert (=> b!1006862 (= e!566683 (MissingZero!9508 (index!40405 lt!444785)))))

(assert (= (and d!119489 c!101629) b!1006863))

(assert (= (and d!119489 (not c!101629)) b!1006861))

(assert (= (and b!1006861 c!101628) b!1006860))

(assert (= (and b!1006861 (not c!101628)) b!1006864))

(assert (= (and b!1006864 c!101627) b!1006862))

(assert (= (and b!1006864 (not c!101627)) b!1006859))

(declare-fun m!931315 () Bool)

(assert (=> b!1006859 m!931315))

(declare-fun m!931317 () Bool)

(assert (=> b!1006861 m!931317))

(declare-fun m!931319 () Bool)

(assert (=> d!119489 m!931319))

(declare-fun m!931321 () Bool)

(assert (=> d!119489 m!931321))

(assert (=> d!119489 m!931151))

(declare-fun m!931323 () Bool)

(assert (=> d!119489 m!931323))

(declare-fun m!931325 () Bool)

(assert (=> d!119489 m!931325))

(assert (=> d!119489 m!931323))

(declare-fun m!931327 () Bool)

(assert (=> d!119489 m!931327))

(assert (=> b!1006605 d!119489))

(declare-fun d!119495 () Bool)

(declare-fun res!675918 () Bool)

(declare-fun e!566694 () Bool)

(assert (=> d!119495 (=> res!675918 e!566694)))

(assert (=> d!119495 (= res!675918 (= (select (arr!30551 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119495 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!566694)))

(declare-fun b!1006878 () Bool)

(declare-fun e!566695 () Bool)

(assert (=> b!1006878 (= e!566694 e!566695)))

(declare-fun res!675919 () Bool)

(assert (=> b!1006878 (=> (not res!675919) (not e!566695))))

(assert (=> b!1006878 (= res!675919 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31055 a!3219)))))

(declare-fun b!1006879 () Bool)

(assert (=> b!1006879 (= e!566695 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119495 (not res!675918)) b!1006878))

(assert (= (and b!1006878 res!675919) b!1006879))

(assert (=> d!119495 m!931209))

(declare-fun m!931337 () Bool)

(assert (=> b!1006879 m!931337))

(assert (=> b!1006600 d!119495))

(declare-fun b!1006880 () Bool)

(declare-fun e!566698 () Bool)

(declare-fun e!566700 () Bool)

(assert (=> b!1006880 (= e!566698 e!566700)))

(declare-fun res!675920 () Bool)

(declare-fun lt!444797 () SeekEntryResult!9508)

(assert (=> b!1006880 (= res!675920 (and (is-Intermediate!9508 lt!444797) (not (undefined!10320 lt!444797)) (bvslt (x!87807 lt!444797) #b01111111111111111111111111111110) (bvsge (x!87807 lt!444797) #b00000000000000000000000000000000) (bvsge (x!87807 lt!444797) #b00000000000000000000000000000000)))))

(assert (=> b!1006880 (=> (not res!675920) (not e!566700))))

(declare-fun b!1006881 () Bool)

(assert (=> b!1006881 (= e!566698 (bvsge (x!87807 lt!444797) #b01111111111111111111111111111110))))

(declare-fun b!1006882 () Bool)

(assert (=> b!1006882 (and (bvsge (index!40405 lt!444797) #b00000000000000000000000000000000) (bvslt (index!40405 lt!444797) (size!31055 lt!444699)))))

(declare-fun e!566697 () Bool)

(assert (=> b!1006882 (= e!566697 (= (select (arr!30551 lt!444699) (index!40405 lt!444797)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1006883 () Bool)

(declare-fun e!566696 () SeekEntryResult!9508)

(declare-fun e!566699 () SeekEntryResult!9508)

(assert (=> b!1006883 (= e!566696 e!566699)))

(declare-fun c!101633 () Bool)

(declare-fun lt!444798 () (_ BitVec 64))

(assert (=> b!1006883 (= c!101633 (or (= lt!444798 lt!444698) (= (bvadd lt!444798 lt!444798) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1006884 () Bool)

(assert (=> b!1006884 (= e!566699 (Intermediate!9508 false (toIndex!0 lt!444698 mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!119503 () Bool)

(assert (=> d!119503 e!566698))

(declare-fun c!101635 () Bool)

(assert (=> d!119503 (= c!101635 (and (is-Intermediate!9508 lt!444797) (undefined!10320 lt!444797)))))

(assert (=> d!119503 (= lt!444797 e!566696)))

(declare-fun c!101634 () Bool)

(assert (=> d!119503 (= c!101634 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119503 (= lt!444798 (select (arr!30551 lt!444699) (toIndex!0 lt!444698 mask!3464)))))

(assert (=> d!119503 (validMask!0 mask!3464)))

(assert (=> d!119503 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444698 mask!3464) lt!444698 lt!444699 mask!3464) lt!444797)))

(declare-fun b!1006885 () Bool)

(assert (=> b!1006885 (= e!566696 (Intermediate!9508 true (toIndex!0 lt!444698 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1006886 () Bool)

(assert (=> b!1006886 (= e!566699 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!444698 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!444698 lt!444699 mask!3464))))

(declare-fun b!1006887 () Bool)

(assert (=> b!1006887 (and (bvsge (index!40405 lt!444797) #b00000000000000000000000000000000) (bvslt (index!40405 lt!444797) (size!31055 lt!444699)))))

(declare-fun res!675922 () Bool)

(assert (=> b!1006887 (= res!675922 (= (select (arr!30551 lt!444699) (index!40405 lt!444797)) lt!444698))))

(assert (=> b!1006887 (=> res!675922 e!566697)))

(assert (=> b!1006887 (= e!566700 e!566697)))

(declare-fun b!1006888 () Bool)

(assert (=> b!1006888 (and (bvsge (index!40405 lt!444797) #b00000000000000000000000000000000) (bvslt (index!40405 lt!444797) (size!31055 lt!444699)))))

(declare-fun res!675921 () Bool)

(assert (=> b!1006888 (= res!675921 (= (select (arr!30551 lt!444699) (index!40405 lt!444797)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1006888 (=> res!675921 e!566697)))

(assert (= (and d!119503 c!101634) b!1006885))

(assert (= (and d!119503 (not c!101634)) b!1006883))

(assert (= (and b!1006883 c!101633) b!1006884))

(assert (= (and b!1006883 (not c!101633)) b!1006886))

(assert (= (and d!119503 c!101635) b!1006881))

(assert (= (and d!119503 (not c!101635)) b!1006880))

(assert (= (and b!1006880 res!675920) b!1006887))

(assert (= (and b!1006887 (not res!675922)) b!1006888))

(assert (= (and b!1006888 (not res!675921)) b!1006882))

(assert (=> b!1006886 m!931173))

(declare-fun m!931339 () Bool)

(assert (=> b!1006886 m!931339))

(assert (=> b!1006886 m!931339))

(declare-fun m!931341 () Bool)

(assert (=> b!1006886 m!931341))

(declare-fun m!931343 () Bool)

(assert (=> b!1006882 m!931343))

(assert (=> d!119503 m!931173))

(declare-fun m!931345 () Bool)

(assert (=> d!119503 m!931345))

(assert (=> d!119503 m!931151))

(assert (=> b!1006888 m!931343))

(assert (=> b!1006887 m!931343))

(assert (=> b!1006606 d!119503))

(declare-fun d!119505 () Bool)

(declare-fun lt!444804 () (_ BitVec 32))

(declare-fun lt!444803 () (_ BitVec 32))

(assert (=> d!119505 (= lt!444804 (bvmul (bvxor lt!444803 (bvlshr lt!444803 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119505 (= lt!444803 ((_ extract 31 0) (bvand (bvxor lt!444698 (bvlshr lt!444698 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119505 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!675923 (let ((h!22475 ((_ extract 31 0) (bvand (bvxor lt!444698 (bvlshr lt!444698 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87813 (bvmul (bvxor h!22475 (bvlshr h!22475 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87813 (bvlshr x!87813 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!675923 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!675923 #b00000000000000000000000000000000))))))

(assert (=> d!119505 (= (toIndex!0 lt!444698 mask!3464) (bvand (bvxor lt!444804 (bvlshr lt!444804 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1006606 d!119505))

(declare-fun b!1006904 () Bool)

(declare-fun e!566715 () Bool)

(declare-fun e!566717 () Bool)

(assert (=> b!1006904 (= e!566715 e!566717)))

(declare-fun res!675933 () Bool)

(declare-fun lt!444805 () SeekEntryResult!9508)

(assert (=> b!1006904 (= res!675933 (and (is-Intermediate!9508 lt!444805) (not (undefined!10320 lt!444805)) (bvslt (x!87807 lt!444805) #b01111111111111111111111111111110) (bvsge (x!87807 lt!444805) #b00000000000000000000000000000000) (bvsge (x!87807 lt!444805) #b00000000000000000000000000000000)))))

(assert (=> b!1006904 (=> (not res!675933) (not e!566717))))

(declare-fun b!1006905 () Bool)

(assert (=> b!1006905 (= e!566715 (bvsge (x!87807 lt!444805) #b01111111111111111111111111111110))))

(declare-fun b!1006906 () Bool)

(assert (=> b!1006906 (and (bvsge (index!40405 lt!444805) #b00000000000000000000000000000000) (bvslt (index!40405 lt!444805) (size!31055 a!3219)))))

(declare-fun e!566714 () Bool)

(assert (=> b!1006906 (= e!566714 (= (select (arr!30551 a!3219) (index!40405 lt!444805)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1006907 () Bool)

(declare-fun e!566713 () SeekEntryResult!9508)

(declare-fun e!566716 () SeekEntryResult!9508)

(assert (=> b!1006907 (= e!566713 e!566716)))

(declare-fun lt!444806 () (_ BitVec 64))

(declare-fun c!101639 () Bool)

(assert (=> b!1006907 (= c!101639 (or (= lt!444806 (select (arr!30551 a!3219) j!170)) (= (bvadd lt!444806 lt!444806) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1006908 () Bool)

(assert (=> b!1006908 (= e!566716 (Intermediate!9508 false (toIndex!0 (select (arr!30551 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!119509 () Bool)

(assert (=> d!119509 e!566715))

(declare-fun c!101641 () Bool)

(assert (=> d!119509 (= c!101641 (and (is-Intermediate!9508 lt!444805) (undefined!10320 lt!444805)))))

(assert (=> d!119509 (= lt!444805 e!566713)))

(declare-fun c!101640 () Bool)

(assert (=> d!119509 (= c!101640 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119509 (= lt!444806 (select (arr!30551 a!3219) (toIndex!0 (select (arr!30551 a!3219) j!170) mask!3464)))))

(assert (=> d!119509 (validMask!0 mask!3464)))

(assert (=> d!119509 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30551 a!3219) j!170) mask!3464) (select (arr!30551 a!3219) j!170) a!3219 mask!3464) lt!444805)))

(declare-fun b!1006909 () Bool)

(assert (=> b!1006909 (= e!566713 (Intermediate!9508 true (toIndex!0 (select (arr!30551 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1006910 () Bool)

(assert (=> b!1006910 (= e!566716 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30551 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30551 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006911 () Bool)

(assert (=> b!1006911 (and (bvsge (index!40405 lt!444805) #b00000000000000000000000000000000) (bvslt (index!40405 lt!444805) (size!31055 a!3219)))))

(declare-fun res!675935 () Bool)

(assert (=> b!1006911 (= res!675935 (= (select (arr!30551 a!3219) (index!40405 lt!444805)) (select (arr!30551 a!3219) j!170)))))

(assert (=> b!1006911 (=> res!675935 e!566714)))

(assert (=> b!1006911 (= e!566717 e!566714)))

(declare-fun b!1006912 () Bool)

(assert (=> b!1006912 (and (bvsge (index!40405 lt!444805) #b00000000000000000000000000000000) (bvslt (index!40405 lt!444805) (size!31055 a!3219)))))

(declare-fun res!675934 () Bool)

(assert (=> b!1006912 (= res!675934 (= (select (arr!30551 a!3219) (index!40405 lt!444805)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1006912 (=> res!675934 e!566714)))

(assert (= (and d!119509 c!101640) b!1006909))

(assert (= (and d!119509 (not c!101640)) b!1006907))

(assert (= (and b!1006907 c!101639) b!1006908))

(assert (= (and b!1006907 (not c!101639)) b!1006910))

(assert (= (and d!119509 c!101641) b!1006905))

(assert (= (and d!119509 (not c!101641)) b!1006904))

(assert (= (and b!1006904 res!675933) b!1006911))

(assert (= (and b!1006911 (not res!675935)) b!1006912))

(assert (= (and b!1006912 (not res!675934)) b!1006906))

(assert (=> b!1006910 m!931165))

(declare-fun m!931353 () Bool)

(assert (=> b!1006910 m!931353))

(assert (=> b!1006910 m!931353))

(assert (=> b!1006910 m!931161))

(declare-fun m!931355 () Bool)

(assert (=> b!1006910 m!931355))

(declare-fun m!931357 () Bool)

(assert (=> b!1006906 m!931357))

(assert (=> d!119509 m!931165))

(declare-fun m!931359 () Bool)

(assert (=> d!119509 m!931359))

(assert (=> d!119509 m!931151))

(assert (=> b!1006912 m!931357))

(assert (=> b!1006911 m!931357))

(assert (=> b!1006601 d!119509))

(declare-fun d!119511 () Bool)

(declare-fun lt!444808 () (_ BitVec 32))

(declare-fun lt!444807 () (_ BitVec 32))

(assert (=> d!119511 (= lt!444808 (bvmul (bvxor lt!444807 (bvlshr lt!444807 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119511 (= lt!444807 ((_ extract 31 0) (bvand (bvxor (select (arr!30551 a!3219) j!170) (bvlshr (select (arr!30551 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119511 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!675923 (let ((h!22475 ((_ extract 31 0) (bvand (bvxor (select (arr!30551 a!3219) j!170) (bvlshr (select (arr!30551 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87813 (bvmul (bvxor h!22475 (bvlshr h!22475 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87813 (bvlshr x!87813 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!675923 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!675923 #b00000000000000000000000000000000))))))

(assert (=> d!119511 (= (toIndex!0 (select (arr!30551 a!3219) j!170) mask!3464) (bvand (bvxor lt!444808 (bvlshr lt!444808 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1006601 d!119511))

(declare-fun d!119513 () Bool)

(assert (=> d!119513 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86812 d!119513))

(declare-fun d!119517 () Bool)

(assert (=> d!119517 (= (array_inv!23694 a!3219) (bvsge (size!31055 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86812 d!119517))

(push 1)

(assert (not d!119487))

(assert (not b!1006886))

(assert (not b!1006805))

(assert (not d!119489))

(assert (not d!119467))

(assert (not bm!42322))

(assert (not b!1006704))

(assert (not b!1006670))

(assert (not b!1006705))

(assert (not d!119503))

(assert (not b!1006910))

(assert (not bm!42325))

(assert (not b!1006796))

(assert (not b!1006879))

(assert (not b!1006672))

(assert (not b!1006701))

(assert (not d!119509))

(assert (not b!1006859))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

