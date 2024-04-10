; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86492 () Bool)

(assert start!86492)

(declare-fun b!1001757 () Bool)

(declare-fun res!671248 () Bool)

(declare-fun e!564436 () Bool)

(assert (=> b!1001757 (=> (not res!671248) (not e!564436))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001757 (= res!671248 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1001758 () Bool)

(declare-fun res!671239 () Bool)

(assert (=> b!1001758 (=> (not res!671239) (not e!564436))))

(declare-fun lt!442834 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9404 0))(
  ( (MissingZero!9404 (index!39987 (_ BitVec 32))) (Found!9404 (index!39988 (_ BitVec 32))) (Intermediate!9404 (undefined!10216 Bool) (index!39989 (_ BitVec 32)) (x!87408 (_ BitVec 32))) (Undefined!9404) (MissingVacant!9404 (index!39990 (_ BitVec 32))) )
))
(declare-fun lt!442840 () SeekEntryResult!9404)

(declare-datatypes ((array!63293 0))(
  ( (array!63294 (arr!30472 (Array (_ BitVec 32) (_ BitVec 64))) (size!30974 (_ BitVec 32))) )
))
(declare-fun lt!442837 () array!63293)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63293 (_ BitVec 32)) SeekEntryResult!9404)

(assert (=> b!1001758 (= res!671239 (not (= lt!442840 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442834 lt!442837 mask!3464))))))

(declare-fun res!671237 () Bool)

(declare-fun e!564439 () Bool)

(assert (=> start!86492 (=> (not res!671237) (not e!564439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86492 (= res!671237 (validMask!0 mask!3464))))

(assert (=> start!86492 e!564439))

(declare-fun a!3219 () array!63293)

(declare-fun array_inv!23596 (array!63293) Bool)

(assert (=> start!86492 (array_inv!23596 a!3219)))

(assert (=> start!86492 true))

(declare-fun b!1001759 () Bool)

(declare-fun e!564434 () Bool)

(assert (=> b!1001759 (= e!564434 false)))

(declare-fun lt!442836 () (_ BitVec 32))

(declare-fun lt!442839 () SeekEntryResult!9404)

(assert (=> b!1001759 (= lt!442839 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442836 lt!442834 lt!442837 mask!3464))))

(declare-fun b!1001760 () Bool)

(declare-fun e!564437 () Bool)

(assert (=> b!1001760 (= e!564437 e!564436)))

(declare-fun res!671242 () Bool)

(assert (=> b!1001760 (=> (not res!671242) (not e!564436))))

(declare-fun lt!442838 () SeekEntryResult!9404)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001760 (= res!671242 (not (= lt!442838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442834 mask!3464) lt!442834 lt!442837 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1001760 (= lt!442834 (select (store (arr!30472 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1001760 (= lt!442837 (array!63294 (store (arr!30472 a!3219) i!1194 k!2224) (size!30974 a!3219)))))

(declare-fun b!1001761 () Bool)

(declare-fun e!564435 () Bool)

(assert (=> b!1001761 (= e!564435 e!564437)))

(declare-fun res!671249 () Bool)

(assert (=> b!1001761 (=> (not res!671249) (not e!564437))))

(declare-fun lt!442841 () SeekEntryResult!9404)

(assert (=> b!1001761 (= res!671249 (= lt!442840 lt!442841))))

(assert (=> b!1001761 (= lt!442840 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30472 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001762 () Bool)

(declare-fun res!671241 () Bool)

(assert (=> b!1001762 (=> (not res!671241) (not e!564439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001762 (= res!671241 (validKeyInArray!0 k!2224))))

(declare-fun b!1001763 () Bool)

(declare-fun e!564433 () Bool)

(assert (=> b!1001763 (= e!564439 e!564433)))

(declare-fun res!671246 () Bool)

(assert (=> b!1001763 (=> (not res!671246) (not e!564433))))

(declare-fun lt!442835 () SeekEntryResult!9404)

(assert (=> b!1001763 (= res!671246 (or (= lt!442835 (MissingVacant!9404 i!1194)) (= lt!442835 (MissingZero!9404 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63293 (_ BitVec 32)) SeekEntryResult!9404)

(assert (=> b!1001763 (= lt!442835 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1001764 () Bool)

(declare-fun res!671243 () Bool)

(assert (=> b!1001764 (=> (not res!671243) (not e!564439))))

(declare-fun arrayContainsKey!0 (array!63293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001764 (= res!671243 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001765 () Bool)

(declare-fun res!671240 () Bool)

(assert (=> b!1001765 (=> (not res!671240) (not e!564439))))

(assert (=> b!1001765 (= res!671240 (validKeyInArray!0 (select (arr!30472 a!3219) j!170)))))

(declare-fun b!1001766 () Bool)

(declare-fun res!671245 () Bool)

(assert (=> b!1001766 (=> (not res!671245) (not e!564433))))

(declare-datatypes ((List!21148 0))(
  ( (Nil!21145) (Cons!21144 (h!22321 (_ BitVec 64)) (t!30149 List!21148)) )
))
(declare-fun arrayNoDuplicates!0 (array!63293 (_ BitVec 32) List!21148) Bool)

(assert (=> b!1001766 (= res!671245 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21145))))

(declare-fun b!1001767 () Bool)

(declare-fun res!671238 () Bool)

(assert (=> b!1001767 (=> (not res!671238) (not e!564439))))

(assert (=> b!1001767 (= res!671238 (and (= (size!30974 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30974 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30974 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001768 () Bool)

(assert (=> b!1001768 (= e!564436 e!564434)))

(declare-fun res!671247 () Bool)

(assert (=> b!1001768 (=> (not res!671247) (not e!564434))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001768 (= res!671247 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!442836 #b00000000000000000000000000000000) (bvslt lt!442836 (size!30974 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001768 (= lt!442836 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1001769 () Bool)

(declare-fun res!671244 () Bool)

(assert (=> b!1001769 (=> (not res!671244) (not e!564433))))

(assert (=> b!1001769 (= res!671244 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30974 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30974 a!3219))))))

(declare-fun b!1001770 () Bool)

(declare-fun res!671236 () Bool)

(assert (=> b!1001770 (=> (not res!671236) (not e!564434))))

(assert (=> b!1001770 (= res!671236 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!442836 (select (arr!30472 a!3219) j!170) a!3219 mask!3464) lt!442841))))

(declare-fun b!1001771 () Bool)

(assert (=> b!1001771 (= e!564433 e!564435)))

(declare-fun res!671250 () Bool)

(assert (=> b!1001771 (=> (not res!671250) (not e!564435))))

(assert (=> b!1001771 (= res!671250 (= lt!442838 lt!442841))))

(assert (=> b!1001771 (= lt!442841 (Intermediate!9404 false resIndex!38 resX!38))))

(assert (=> b!1001771 (= lt!442838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30472 a!3219) j!170) mask!3464) (select (arr!30472 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001772 () Bool)

(declare-fun res!671235 () Bool)

(assert (=> b!1001772 (=> (not res!671235) (not e!564433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63293 (_ BitVec 32)) Bool)

(assert (=> b!1001772 (= res!671235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86492 res!671237) b!1001767))

(assert (= (and b!1001767 res!671238) b!1001765))

(assert (= (and b!1001765 res!671240) b!1001762))

(assert (= (and b!1001762 res!671241) b!1001764))

(assert (= (and b!1001764 res!671243) b!1001763))

(assert (= (and b!1001763 res!671246) b!1001772))

(assert (= (and b!1001772 res!671235) b!1001766))

(assert (= (and b!1001766 res!671245) b!1001769))

(assert (= (and b!1001769 res!671244) b!1001771))

(assert (= (and b!1001771 res!671250) b!1001761))

(assert (= (and b!1001761 res!671249) b!1001760))

(assert (= (and b!1001760 res!671242) b!1001758))

(assert (= (and b!1001758 res!671239) b!1001757))

(assert (= (and b!1001757 res!671248) b!1001768))

(assert (= (and b!1001768 res!671247) b!1001770))

(assert (= (and b!1001770 res!671236) b!1001759))

(declare-fun m!927749 () Bool)

(assert (=> b!1001772 m!927749))

(declare-fun m!927751 () Bool)

(assert (=> b!1001759 m!927751))

(declare-fun m!927753 () Bool)

(assert (=> b!1001770 m!927753))

(assert (=> b!1001770 m!927753))

(declare-fun m!927755 () Bool)

(assert (=> b!1001770 m!927755))

(declare-fun m!927757 () Bool)

(assert (=> b!1001763 m!927757))

(assert (=> b!1001761 m!927753))

(assert (=> b!1001761 m!927753))

(declare-fun m!927759 () Bool)

(assert (=> b!1001761 m!927759))

(declare-fun m!927761 () Bool)

(assert (=> start!86492 m!927761))

(declare-fun m!927763 () Bool)

(assert (=> start!86492 m!927763))

(declare-fun m!927765 () Bool)

(assert (=> b!1001762 m!927765))

(declare-fun m!927767 () Bool)

(assert (=> b!1001764 m!927767))

(declare-fun m!927769 () Bool)

(assert (=> b!1001768 m!927769))

(declare-fun m!927771 () Bool)

(assert (=> b!1001766 m!927771))

(declare-fun m!927773 () Bool)

(assert (=> b!1001758 m!927773))

(assert (=> b!1001765 m!927753))

(assert (=> b!1001765 m!927753))

(declare-fun m!927775 () Bool)

(assert (=> b!1001765 m!927775))

(declare-fun m!927777 () Bool)

(assert (=> b!1001760 m!927777))

(assert (=> b!1001760 m!927777))

(declare-fun m!927779 () Bool)

(assert (=> b!1001760 m!927779))

(declare-fun m!927781 () Bool)

(assert (=> b!1001760 m!927781))

(declare-fun m!927783 () Bool)

(assert (=> b!1001760 m!927783))

(assert (=> b!1001771 m!927753))

(assert (=> b!1001771 m!927753))

(declare-fun m!927785 () Bool)

(assert (=> b!1001771 m!927785))

(assert (=> b!1001771 m!927785))

(assert (=> b!1001771 m!927753))

(declare-fun m!927787 () Bool)

(assert (=> b!1001771 m!927787))

(push 1)

