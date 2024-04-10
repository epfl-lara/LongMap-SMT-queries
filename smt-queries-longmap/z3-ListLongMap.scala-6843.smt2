; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86152 () Bool)

(assert start!86152)

(declare-fun b!997766 () Bool)

(declare-fun res!667726 () Bool)

(declare-fun e!562721 () Bool)

(assert (=> b!997766 (=> (not res!667726) (not e!562721))))

(declare-datatypes ((array!63106 0))(
  ( (array!63107 (arr!30383 (Array (_ BitVec 32) (_ BitVec 64))) (size!30885 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63106)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997766 (= res!667726 (and (= (size!30885 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30885 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30885 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997767 () Bool)

(declare-fun e!562722 () Bool)

(assert (=> b!997767 (= e!562721 e!562722)))

(declare-fun res!667728 () Bool)

(assert (=> b!997767 (=> (not res!667728) (not e!562722))))

(declare-datatypes ((SeekEntryResult!9315 0))(
  ( (MissingZero!9315 (index!39631 (_ BitVec 32))) (Found!9315 (index!39632 (_ BitVec 32))) (Intermediate!9315 (undefined!10127 Bool) (index!39633 (_ BitVec 32)) (x!87061 (_ BitVec 32))) (Undefined!9315) (MissingVacant!9315 (index!39634 (_ BitVec 32))) )
))
(declare-fun lt!441523 () SeekEntryResult!9315)

(assert (=> b!997767 (= res!667728 (or (= lt!441523 (MissingVacant!9315 i!1194)) (= lt!441523 (MissingZero!9315 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63106 (_ BitVec 32)) SeekEntryResult!9315)

(assert (=> b!997767 (= lt!441523 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997768 () Bool)

(declare-fun res!667730 () Bool)

(assert (=> b!997768 (=> (not res!667730) (not e!562721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997768 (= res!667730 (validKeyInArray!0 (select (arr!30383 a!3219) j!170)))))

(declare-fun b!997769 () Bool)

(declare-fun res!667723 () Bool)

(assert (=> b!997769 (=> (not res!667723) (not e!562722))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997769 (= res!667723 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30885 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30885 a!3219))))))

(declare-fun b!997770 () Bool)

(declare-fun e!562723 () Bool)

(assert (=> b!997770 (= e!562722 e!562723)))

(declare-fun res!667731 () Bool)

(assert (=> b!997770 (=> (not res!667731) (not e!562723))))

(declare-fun lt!441522 () SeekEntryResult!9315)

(declare-fun lt!441524 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63106 (_ BitVec 32)) SeekEntryResult!9315)

(assert (=> b!997770 (= res!667731 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!441524 (select (arr!30383 a!3219) j!170) a!3219 mask!3464) lt!441522))))

(assert (=> b!997770 (= lt!441522 (Intermediate!9315 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997770 (= lt!441524 (toIndex!0 (select (arr!30383 a!3219) j!170) mask!3464))))

(declare-fun res!667721 () Bool)

(assert (=> start!86152 (=> (not res!667721) (not e!562721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86152 (= res!667721 (validMask!0 mask!3464))))

(assert (=> start!86152 e!562721))

(declare-fun array_inv!23507 (array!63106) Bool)

(assert (=> start!86152 (array_inv!23507 a!3219)))

(assert (=> start!86152 true))

(declare-fun b!997771 () Bool)

(declare-fun res!667725 () Bool)

(assert (=> b!997771 (=> (not res!667725) (not e!562721))))

(declare-fun arrayContainsKey!0 (array!63106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997771 (= res!667725 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997772 () Bool)

(assert (=> b!997772 (= e!562723 (and (bvsge mask!3464 #b00000000000000000000000000000000) (or (bvslt lt!441524 #b00000000000000000000000000000000) (bvsge lt!441524 (bvadd #b00000000000000000000000000000001 mask!3464)))))))

(declare-fun b!997773 () Bool)

(declare-fun res!667724 () Bool)

(assert (=> b!997773 (=> (not res!667724) (not e!562722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63106 (_ BitVec 32)) Bool)

(assert (=> b!997773 (= res!667724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997774 () Bool)

(declare-fun res!667722 () Bool)

(assert (=> b!997774 (=> (not res!667722) (not e!562721))))

(assert (=> b!997774 (= res!667722 (validKeyInArray!0 k0!2224))))

(declare-fun b!997775 () Bool)

(declare-fun res!667727 () Bool)

(assert (=> b!997775 (=> (not res!667727) (not e!562723))))

(assert (=> b!997775 (= res!667727 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30383 a!3219) j!170) a!3219 mask!3464) lt!441522))))

(declare-fun b!997776 () Bool)

(declare-fun res!667729 () Bool)

(assert (=> b!997776 (=> (not res!667729) (not e!562722))))

(declare-datatypes ((List!21059 0))(
  ( (Nil!21056) (Cons!21055 (h!22223 (_ BitVec 64)) (t!30060 List!21059)) )
))
(declare-fun arrayNoDuplicates!0 (array!63106 (_ BitVec 32) List!21059) Bool)

(assert (=> b!997776 (= res!667729 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21056))))

(assert (= (and start!86152 res!667721) b!997766))

(assert (= (and b!997766 res!667726) b!997768))

(assert (= (and b!997768 res!667730) b!997774))

(assert (= (and b!997774 res!667722) b!997771))

(assert (= (and b!997771 res!667725) b!997767))

(assert (= (and b!997767 res!667728) b!997773))

(assert (= (and b!997773 res!667724) b!997776))

(assert (= (and b!997776 res!667729) b!997769))

(assert (= (and b!997769 res!667723) b!997770))

(assert (= (and b!997770 res!667731) b!997775))

(assert (= (and b!997775 res!667727) b!997772))

(declare-fun m!924509 () Bool)

(assert (=> b!997767 m!924509))

(declare-fun m!924511 () Bool)

(assert (=> b!997770 m!924511))

(assert (=> b!997770 m!924511))

(declare-fun m!924513 () Bool)

(assert (=> b!997770 m!924513))

(assert (=> b!997770 m!924511))

(declare-fun m!924515 () Bool)

(assert (=> b!997770 m!924515))

(declare-fun m!924517 () Bool)

(assert (=> b!997773 m!924517))

(declare-fun m!924519 () Bool)

(assert (=> b!997776 m!924519))

(declare-fun m!924521 () Bool)

(assert (=> start!86152 m!924521))

(declare-fun m!924523 () Bool)

(assert (=> start!86152 m!924523))

(declare-fun m!924525 () Bool)

(assert (=> b!997774 m!924525))

(assert (=> b!997775 m!924511))

(assert (=> b!997775 m!924511))

(declare-fun m!924527 () Bool)

(assert (=> b!997775 m!924527))

(assert (=> b!997768 m!924511))

(assert (=> b!997768 m!924511))

(declare-fun m!924529 () Bool)

(assert (=> b!997768 m!924529))

(declare-fun m!924531 () Bool)

(assert (=> b!997771 m!924531))

(check-sat (not b!997768) (not b!997773) (not start!86152) (not b!997776) (not b!997774) (not b!997771) (not b!997770) (not b!997767) (not b!997775))
(check-sat)
(get-model)

(declare-fun d!119107 () Bool)

(assert (=> d!119107 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86152 d!119107))

(declare-fun d!119117 () Bool)

(assert (=> d!119117 (= (array_inv!23507 a!3219) (bvsge (size!30885 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86152 d!119117))

(declare-fun d!119119 () Bool)

(assert (=> d!119119 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997774 d!119119))

(declare-fun b!997907 () Bool)

(declare-fun e!562799 () Bool)

(declare-fun e!562798 () Bool)

(assert (=> b!997907 (= e!562799 e!562798)))

(declare-fun c!101195 () Bool)

(assert (=> b!997907 (= c!101195 (validKeyInArray!0 (select (arr!30383 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997908 () Bool)

(declare-fun call!42266 () Bool)

(assert (=> b!997908 (= e!562798 call!42266)))

(declare-fun b!997909 () Bool)

(declare-fun e!562800 () Bool)

(assert (=> b!997909 (= e!562800 e!562799)))

(declare-fun res!667807 () Bool)

(assert (=> b!997909 (=> (not res!667807) (not e!562799))))

(declare-fun e!562797 () Bool)

(assert (=> b!997909 (= res!667807 (not e!562797))))

(declare-fun res!667808 () Bool)

(assert (=> b!997909 (=> (not res!667808) (not e!562797))))

(assert (=> b!997909 (= res!667808 (validKeyInArray!0 (select (arr!30383 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!997910 () Bool)

(declare-fun contains!5871 (List!21059 (_ BitVec 64)) Bool)

(assert (=> b!997910 (= e!562797 (contains!5871 Nil!21056 (select (arr!30383 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119121 () Bool)

(declare-fun res!667806 () Bool)

(assert (=> d!119121 (=> res!667806 e!562800)))

(assert (=> d!119121 (= res!667806 (bvsge #b00000000000000000000000000000000 (size!30885 a!3219)))))

(assert (=> d!119121 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21056) e!562800)))

(declare-fun b!997911 () Bool)

(assert (=> b!997911 (= e!562798 call!42266)))

(declare-fun bm!42263 () Bool)

(assert (=> bm!42263 (= call!42266 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101195 (Cons!21055 (select (arr!30383 a!3219) #b00000000000000000000000000000000) Nil!21056) Nil!21056)))))

(assert (= (and d!119121 (not res!667806)) b!997909))

(assert (= (and b!997909 res!667808) b!997910))

(assert (= (and b!997909 res!667807) b!997907))

(assert (= (and b!997907 c!101195) b!997911))

(assert (= (and b!997907 (not c!101195)) b!997908))

(assert (= (or b!997911 b!997908) bm!42263))

(declare-fun m!924605 () Bool)

(assert (=> b!997907 m!924605))

(assert (=> b!997907 m!924605))

(declare-fun m!924607 () Bool)

(assert (=> b!997907 m!924607))

(assert (=> b!997909 m!924605))

(assert (=> b!997909 m!924605))

(assert (=> b!997909 m!924607))

(assert (=> b!997910 m!924605))

(assert (=> b!997910 m!924605))

(declare-fun m!924609 () Bool)

(assert (=> b!997910 m!924609))

(assert (=> bm!42263 m!924605))

(declare-fun m!924611 () Bool)

(assert (=> bm!42263 m!924611))

(assert (=> b!997776 d!119121))

(declare-fun b!997981 () Bool)

(declare-fun e!562855 () SeekEntryResult!9315)

(declare-fun e!562856 () SeekEntryResult!9315)

(assert (=> b!997981 (= e!562855 e!562856)))

(declare-fun c!101211 () Bool)

(declare-fun lt!441585 () (_ BitVec 64))

(assert (=> b!997981 (= c!101211 (or (= lt!441585 (select (arr!30383 a!3219) j!170)) (= (bvadd lt!441585 lt!441585) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!997982 () Bool)

(assert (=> b!997982 (= e!562856 (Intermediate!9315 false lt!441524 #b00000000000000000000000000000000))))

(declare-fun b!997983 () Bool)

(declare-fun lt!441584 () SeekEntryResult!9315)

(assert (=> b!997983 (and (bvsge (index!39633 lt!441584) #b00000000000000000000000000000000) (bvslt (index!39633 lt!441584) (size!30885 a!3219)))))

(declare-fun e!562854 () Bool)

(assert (=> b!997983 (= e!562854 (= (select (arr!30383 a!3219) (index!39633 lt!441584)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!997984 () Bool)

(assert (=> b!997984 (and (bvsge (index!39633 lt!441584) #b00000000000000000000000000000000) (bvslt (index!39633 lt!441584) (size!30885 a!3219)))))

(declare-fun res!667849 () Bool)

(assert (=> b!997984 (= res!667849 (= (select (arr!30383 a!3219) (index!39633 lt!441584)) (select (arr!30383 a!3219) j!170)))))

(assert (=> b!997984 (=> res!667849 e!562854)))

(declare-fun e!562852 () Bool)

(assert (=> b!997984 (= e!562852 e!562854)))

(declare-fun d!119133 () Bool)

(declare-fun e!562853 () Bool)

(assert (=> d!119133 e!562853))

(declare-fun c!101213 () Bool)

(get-info :version)

(assert (=> d!119133 (= c!101213 (and ((_ is Intermediate!9315) lt!441584) (undefined!10127 lt!441584)))))

(assert (=> d!119133 (= lt!441584 e!562855)))

(declare-fun c!101212 () Bool)

(assert (=> d!119133 (= c!101212 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119133 (= lt!441585 (select (arr!30383 a!3219) lt!441524))))

(assert (=> d!119133 (validMask!0 mask!3464)))

(assert (=> d!119133 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!441524 (select (arr!30383 a!3219) j!170) a!3219 mask!3464) lt!441584)))

(declare-fun b!997985 () Bool)

(assert (=> b!997985 (= e!562853 (bvsge (x!87061 lt!441584) #b01111111111111111111111111111110))))

(declare-fun b!997986 () Bool)

(assert (=> b!997986 (= e!562853 e!562852)))

(declare-fun res!667850 () Bool)

(assert (=> b!997986 (= res!667850 (and ((_ is Intermediate!9315) lt!441584) (not (undefined!10127 lt!441584)) (bvslt (x!87061 lt!441584) #b01111111111111111111111111111110) (bvsge (x!87061 lt!441584) #b00000000000000000000000000000000) (bvsge (x!87061 lt!441584) #b00000000000000000000000000000000)))))

(assert (=> b!997986 (=> (not res!667850) (not e!562852))))

(declare-fun b!997987 () Bool)

(assert (=> b!997987 (and (bvsge (index!39633 lt!441584) #b00000000000000000000000000000000) (bvslt (index!39633 lt!441584) (size!30885 a!3219)))))

(declare-fun res!667848 () Bool)

(assert (=> b!997987 (= res!667848 (= (select (arr!30383 a!3219) (index!39633 lt!441584)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997987 (=> res!667848 e!562854)))

(declare-fun b!997988 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997988 (= e!562856 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!441524 #b00000000000000000000000000000000 mask!3464) (select (arr!30383 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997989 () Bool)

(assert (=> b!997989 (= e!562855 (Intermediate!9315 true lt!441524 #b00000000000000000000000000000000))))

(assert (= (and d!119133 c!101212) b!997989))

(assert (= (and d!119133 (not c!101212)) b!997981))

(assert (= (and b!997981 c!101211) b!997982))

(assert (= (and b!997981 (not c!101211)) b!997988))

(assert (= (and d!119133 c!101213) b!997985))

(assert (= (and d!119133 (not c!101213)) b!997986))

(assert (= (and b!997986 res!667850) b!997984))

(assert (= (and b!997984 (not res!667849)) b!997987))

(assert (= (and b!997987 (not res!667848)) b!997983))

(declare-fun m!924633 () Bool)

(assert (=> b!997983 m!924633))

(assert (=> b!997987 m!924633))

(assert (=> b!997984 m!924633))

(declare-fun m!924635 () Bool)

(assert (=> b!997988 m!924635))

(assert (=> b!997988 m!924635))

(assert (=> b!997988 m!924511))

(declare-fun m!924637 () Bool)

(assert (=> b!997988 m!924637))

(declare-fun m!924639 () Bool)

(assert (=> d!119133 m!924639))

(assert (=> d!119133 m!924521))

(assert (=> b!997770 d!119133))

(declare-fun d!119159 () Bool)

(declare-fun lt!441591 () (_ BitVec 32))

(declare-fun lt!441590 () (_ BitVec 32))

(assert (=> d!119159 (= lt!441591 (bvmul (bvxor lt!441590 (bvlshr lt!441590 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119159 (= lt!441590 ((_ extract 31 0) (bvand (bvxor (select (arr!30383 a!3219) j!170) (bvlshr (select (arr!30383 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119159 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!667851 (let ((h!22227 ((_ extract 31 0) (bvand (bvxor (select (arr!30383 a!3219) j!170) (bvlshr (select (arr!30383 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87068 (bvmul (bvxor h!22227 (bvlshr h!22227 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87068 (bvlshr x!87068 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!667851 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!667851 #b00000000000000000000000000000000))))))

(assert (=> d!119159 (= (toIndex!0 (select (arr!30383 a!3219) j!170) mask!3464) (bvand (bvxor lt!441591 (bvlshr lt!441591 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!997770 d!119159))

(declare-fun b!997990 () Bool)

(declare-fun e!562860 () SeekEntryResult!9315)

(declare-fun e!562861 () SeekEntryResult!9315)

(assert (=> b!997990 (= e!562860 e!562861)))

(declare-fun lt!441593 () (_ BitVec 64))

(declare-fun c!101214 () Bool)

(assert (=> b!997990 (= c!101214 (or (= lt!441593 (select (arr!30383 a!3219) j!170)) (= (bvadd lt!441593 lt!441593) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!997991 () Bool)

(assert (=> b!997991 (= e!562861 (Intermediate!9315 false index!1507 x!1245))))

(declare-fun b!997992 () Bool)

(declare-fun lt!441592 () SeekEntryResult!9315)

(assert (=> b!997992 (and (bvsge (index!39633 lt!441592) #b00000000000000000000000000000000) (bvslt (index!39633 lt!441592) (size!30885 a!3219)))))

(declare-fun e!562859 () Bool)

(assert (=> b!997992 (= e!562859 (= (select (arr!30383 a!3219) (index!39633 lt!441592)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!997993 () Bool)

(assert (=> b!997993 (and (bvsge (index!39633 lt!441592) #b00000000000000000000000000000000) (bvslt (index!39633 lt!441592) (size!30885 a!3219)))))

(declare-fun res!667853 () Bool)

(assert (=> b!997993 (= res!667853 (= (select (arr!30383 a!3219) (index!39633 lt!441592)) (select (arr!30383 a!3219) j!170)))))

(assert (=> b!997993 (=> res!667853 e!562859)))

(declare-fun e!562857 () Bool)

(assert (=> b!997993 (= e!562857 e!562859)))

(declare-fun d!119161 () Bool)

(declare-fun e!562858 () Bool)

(assert (=> d!119161 e!562858))

(declare-fun c!101216 () Bool)

(assert (=> d!119161 (= c!101216 (and ((_ is Intermediate!9315) lt!441592) (undefined!10127 lt!441592)))))

(assert (=> d!119161 (= lt!441592 e!562860)))

(declare-fun c!101215 () Bool)

(assert (=> d!119161 (= c!101215 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119161 (= lt!441593 (select (arr!30383 a!3219) index!1507))))

(assert (=> d!119161 (validMask!0 mask!3464)))

(assert (=> d!119161 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30383 a!3219) j!170) a!3219 mask!3464) lt!441592)))

(declare-fun b!997994 () Bool)

(assert (=> b!997994 (= e!562858 (bvsge (x!87061 lt!441592) #b01111111111111111111111111111110))))

(declare-fun b!997995 () Bool)

(assert (=> b!997995 (= e!562858 e!562857)))

(declare-fun res!667854 () Bool)

(assert (=> b!997995 (= res!667854 (and ((_ is Intermediate!9315) lt!441592) (not (undefined!10127 lt!441592)) (bvslt (x!87061 lt!441592) #b01111111111111111111111111111110) (bvsge (x!87061 lt!441592) #b00000000000000000000000000000000) (bvsge (x!87061 lt!441592) x!1245)))))

(assert (=> b!997995 (=> (not res!667854) (not e!562857))))

(declare-fun b!997996 () Bool)

(assert (=> b!997996 (and (bvsge (index!39633 lt!441592) #b00000000000000000000000000000000) (bvslt (index!39633 lt!441592) (size!30885 a!3219)))))

(declare-fun res!667852 () Bool)

(assert (=> b!997996 (= res!667852 (= (select (arr!30383 a!3219) (index!39633 lt!441592)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!997996 (=> res!667852 e!562859)))

(declare-fun b!997997 () Bool)

(assert (=> b!997997 (= e!562861 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30383 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997998 () Bool)

(assert (=> b!997998 (= e!562860 (Intermediate!9315 true index!1507 x!1245))))

(assert (= (and d!119161 c!101215) b!997998))

(assert (= (and d!119161 (not c!101215)) b!997990))

(assert (= (and b!997990 c!101214) b!997991))

(assert (= (and b!997990 (not c!101214)) b!997997))

(assert (= (and d!119161 c!101216) b!997994))

(assert (= (and d!119161 (not c!101216)) b!997995))

(assert (= (and b!997995 res!667854) b!997993))

(assert (= (and b!997993 (not res!667853)) b!997996))

(assert (= (and b!997996 (not res!667852)) b!997992))

(declare-fun m!924641 () Bool)

(assert (=> b!997992 m!924641))

(assert (=> b!997996 m!924641))

(assert (=> b!997993 m!924641))

(declare-fun m!924643 () Bool)

(assert (=> b!997997 m!924643))

(assert (=> b!997997 m!924643))

(assert (=> b!997997 m!924511))

(declare-fun m!924645 () Bool)

(assert (=> b!997997 m!924645))

(declare-fun m!924647 () Bool)

(assert (=> d!119161 m!924647))

(assert (=> d!119161 m!924521))

(assert (=> b!997775 d!119161))

(declare-fun d!119163 () Bool)

(declare-fun res!667859 () Bool)

(declare-fun e!562872 () Bool)

(assert (=> d!119163 (=> res!667859 e!562872)))

(assert (=> d!119163 (= res!667859 (= (select (arr!30383 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119163 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!562872)))

(declare-fun b!998015 () Bool)

(declare-fun e!562873 () Bool)

(assert (=> b!998015 (= e!562872 e!562873)))

(declare-fun res!667860 () Bool)

(assert (=> b!998015 (=> (not res!667860) (not e!562873))))

(assert (=> b!998015 (= res!667860 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30885 a!3219)))))

(declare-fun b!998016 () Bool)

(assert (=> b!998016 (= e!562873 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119163 (not res!667859)) b!998015))

(assert (= (and b!998015 res!667860) b!998016))

(assert (=> d!119163 m!924605))

(declare-fun m!924649 () Bool)

(assert (=> b!998016 m!924649))

(assert (=> b!997771 d!119163))

(declare-fun d!119165 () Bool)

(assert (=> d!119165 (= (validKeyInArray!0 (select (arr!30383 a!3219) j!170)) (and (not (= (select (arr!30383 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30383 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!997768 d!119165))

(declare-fun b!998049 () Bool)

(declare-fun e!562894 () Bool)

(declare-fun e!562893 () Bool)

(assert (=> b!998049 (= e!562894 e!562893)))

(declare-fun lt!441619 () (_ BitVec 64))

(assert (=> b!998049 (= lt!441619 (select (arr!30383 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32984 0))(
  ( (Unit!32985) )
))
(declare-fun lt!441620 () Unit!32984)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63106 (_ BitVec 64) (_ BitVec 32)) Unit!32984)

(assert (=> b!998049 (= lt!441620 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441619 #b00000000000000000000000000000000))))

(assert (=> b!998049 (arrayContainsKey!0 a!3219 lt!441619 #b00000000000000000000000000000000)))

(declare-fun lt!441618 () Unit!32984)

(assert (=> b!998049 (= lt!441618 lt!441620)))

(declare-fun res!667866 () Bool)

(assert (=> b!998049 (= res!667866 (= (seekEntryOrOpen!0 (select (arr!30383 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9315 #b00000000000000000000000000000000)))))

(assert (=> b!998049 (=> (not res!667866) (not e!562893))))

(declare-fun b!998051 () Bool)

(declare-fun call!42275 () Bool)

(assert (=> b!998051 (= e!562894 call!42275)))

(declare-fun bm!42272 () Bool)

(assert (=> bm!42272 (= call!42275 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!998052 () Bool)

(declare-fun e!562892 () Bool)

(assert (=> b!998052 (= e!562892 e!562894)))

(declare-fun c!101237 () Bool)

(assert (=> b!998052 (= c!101237 (validKeyInArray!0 (select (arr!30383 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!998050 () Bool)

(assert (=> b!998050 (= e!562893 call!42275)))

(declare-fun d!119167 () Bool)

(declare-fun res!667865 () Bool)

(assert (=> d!119167 (=> res!667865 e!562892)))

(assert (=> d!119167 (= res!667865 (bvsge #b00000000000000000000000000000000 (size!30885 a!3219)))))

(assert (=> d!119167 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!562892)))

(assert (= (and d!119167 (not res!667865)) b!998052))

(assert (= (and b!998052 c!101237) b!998049))

(assert (= (and b!998052 (not c!101237)) b!998051))

(assert (= (and b!998049 res!667866) b!998050))

(assert (= (or b!998050 b!998051) bm!42272))

(assert (=> b!998049 m!924605))

(declare-fun m!924679 () Bool)

(assert (=> b!998049 m!924679))

(declare-fun m!924681 () Bool)

(assert (=> b!998049 m!924681))

(assert (=> b!998049 m!924605))

(declare-fun m!924683 () Bool)

(assert (=> b!998049 m!924683))

(declare-fun m!924685 () Bool)

(assert (=> bm!42272 m!924685))

(assert (=> b!998052 m!924605))

(assert (=> b!998052 m!924605))

(assert (=> b!998052 m!924607))

(assert (=> b!997773 d!119167))

(declare-fun d!119169 () Bool)

(declare-fun lt!441627 () SeekEntryResult!9315)

(assert (=> d!119169 (and (or ((_ is Undefined!9315) lt!441627) (not ((_ is Found!9315) lt!441627)) (and (bvsge (index!39632 lt!441627) #b00000000000000000000000000000000) (bvslt (index!39632 lt!441627) (size!30885 a!3219)))) (or ((_ is Undefined!9315) lt!441627) ((_ is Found!9315) lt!441627) (not ((_ is MissingZero!9315) lt!441627)) (and (bvsge (index!39631 lt!441627) #b00000000000000000000000000000000) (bvslt (index!39631 lt!441627) (size!30885 a!3219)))) (or ((_ is Undefined!9315) lt!441627) ((_ is Found!9315) lt!441627) ((_ is MissingZero!9315) lt!441627) (not ((_ is MissingVacant!9315) lt!441627)) (and (bvsge (index!39634 lt!441627) #b00000000000000000000000000000000) (bvslt (index!39634 lt!441627) (size!30885 a!3219)))) (or ((_ is Undefined!9315) lt!441627) (ite ((_ is Found!9315) lt!441627) (= (select (arr!30383 a!3219) (index!39632 lt!441627)) k0!2224) (ite ((_ is MissingZero!9315) lt!441627) (= (select (arr!30383 a!3219) (index!39631 lt!441627)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9315) lt!441627) (= (select (arr!30383 a!3219) (index!39634 lt!441627)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!562903 () SeekEntryResult!9315)

(assert (=> d!119169 (= lt!441627 e!562903)))

(declare-fun c!101245 () Bool)

(declare-fun lt!441628 () SeekEntryResult!9315)

(assert (=> d!119169 (= c!101245 (and ((_ is Intermediate!9315) lt!441628) (undefined!10127 lt!441628)))))

(assert (=> d!119169 (= lt!441628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119169 (validMask!0 mask!3464)))

(assert (=> d!119169 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441627)))

(declare-fun e!562901 () SeekEntryResult!9315)

(declare-fun b!998065 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63106 (_ BitVec 32)) SeekEntryResult!9315)

(assert (=> b!998065 (= e!562901 (seekKeyOrZeroReturnVacant!0 (x!87061 lt!441628) (index!39633 lt!441628) (index!39633 lt!441628) k0!2224 a!3219 mask!3464))))

(declare-fun b!998066 () Bool)

(assert (=> b!998066 (= e!562903 Undefined!9315)))

(declare-fun b!998067 () Bool)

(declare-fun e!562902 () SeekEntryResult!9315)

(assert (=> b!998067 (= e!562903 e!562902)))

(declare-fun lt!441629 () (_ BitVec 64))

(assert (=> b!998067 (= lt!441629 (select (arr!30383 a!3219) (index!39633 lt!441628)))))

(declare-fun c!101246 () Bool)

(assert (=> b!998067 (= c!101246 (= lt!441629 k0!2224))))

(declare-fun b!998068 () Bool)

(declare-fun c!101244 () Bool)

(assert (=> b!998068 (= c!101244 (= lt!441629 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!998068 (= e!562902 e!562901)))

(declare-fun b!998069 () Bool)

(assert (=> b!998069 (= e!562902 (Found!9315 (index!39633 lt!441628)))))

(declare-fun b!998070 () Bool)

(assert (=> b!998070 (= e!562901 (MissingZero!9315 (index!39633 lt!441628)))))

(assert (= (and d!119169 c!101245) b!998066))

(assert (= (and d!119169 (not c!101245)) b!998067))

(assert (= (and b!998067 c!101246) b!998069))

(assert (= (and b!998067 (not c!101246)) b!998068))

(assert (= (and b!998068 c!101244) b!998070))

(assert (= (and b!998068 (not c!101244)) b!998065))

(declare-fun m!924687 () Bool)

(assert (=> d!119169 m!924687))

(declare-fun m!924689 () Bool)

(assert (=> d!119169 m!924689))

(declare-fun m!924691 () Bool)

(assert (=> d!119169 m!924691))

(declare-fun m!924693 () Bool)

(assert (=> d!119169 m!924693))

(assert (=> d!119169 m!924521))

(declare-fun m!924695 () Bool)

(assert (=> d!119169 m!924695))

(assert (=> d!119169 m!924689))

(declare-fun m!924697 () Bool)

(assert (=> b!998065 m!924697))

(declare-fun m!924699 () Bool)

(assert (=> b!998067 m!924699))

(assert (=> b!997767 d!119169))

(check-sat (not b!997988) (not bm!42263) (not b!998049) (not b!998065) (not b!998016) (not d!119161) (not b!997910) (not d!119169) (not b!997909) (not b!997997) (not b!998052) (not bm!42272) (not d!119133) (not b!997907))
(check-sat)
