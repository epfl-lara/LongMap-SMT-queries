; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86896 () Bool)

(assert start!86896)

(declare-fun b!1006165 () Bool)

(declare-fun e!566686 () Bool)

(declare-fun e!566683 () Bool)

(assert (=> b!1006165 (= e!566686 e!566683)))

(declare-fun res!674692 () Bool)

(assert (=> b!1006165 (=> (not res!674692) (not e!566683))))

(declare-datatypes ((SeekEntryResult!9418 0))(
  ( (MissingZero!9418 (index!40043 (_ BitVec 32))) (Found!9418 (index!40044 (_ BitVec 32))) (Intermediate!9418 (undefined!10230 Bool) (index!40045 (_ BitVec 32)) (x!87608 (_ BitVec 32))) (Undefined!9418) (MissingVacant!9418 (index!40046 (_ BitVec 32))) )
))
(declare-fun lt!444847 () SeekEntryResult!9418)

(declare-fun lt!444846 () SeekEntryResult!9418)

(assert (=> b!1006165 (= res!674692 (= lt!444847 lt!444846))))

(declare-datatypes ((array!63465 0))(
  ( (array!63466 (arr!30550 (Array (_ BitVec 32) (_ BitVec 64))) (size!31053 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63465)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63465 (_ BitVec 32)) SeekEntryResult!9418)

(assert (=> b!1006165 (= lt!444847 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30550 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006166 () Bool)

(declare-fun res!674690 () Bool)

(declare-fun e!566685 () Bool)

(assert (=> b!1006166 (=> (not res!674690) (not e!566685))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006166 (= res!674690 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31053 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31053 a!3219))))))

(declare-fun b!1006167 () Bool)

(declare-fun e!566687 () Bool)

(assert (=> b!1006167 (= e!566687 e!566685)))

(declare-fun res!674688 () Bool)

(assert (=> b!1006167 (=> (not res!674688) (not e!566685))))

(declare-fun lt!444848 () SeekEntryResult!9418)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006167 (= res!674688 (or (= lt!444848 (MissingVacant!9418 i!1194)) (= lt!444848 (MissingZero!9418 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63465 (_ BitVec 32)) SeekEntryResult!9418)

(assert (=> b!1006167 (= lt!444848 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1006168 () Bool)

(declare-fun res!674699 () Bool)

(assert (=> b!1006168 (=> (not res!674699) (not e!566687))))

(declare-fun arrayContainsKey!0 (array!63465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006168 (= res!674699 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006169 () Bool)

(declare-fun e!566688 () Bool)

(assert (=> b!1006169 (= e!566683 e!566688)))

(declare-fun res!674693 () Bool)

(assert (=> b!1006169 (=> (not res!674693) (not e!566688))))

(declare-fun lt!444850 () SeekEntryResult!9418)

(declare-fun lt!444851 () array!63465)

(declare-fun lt!444849 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006169 (= res!674693 (not (= lt!444850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444849 mask!3464) lt!444849 lt!444851 mask!3464))))))

(assert (=> b!1006169 (= lt!444849 (select (store (arr!30550 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1006169 (= lt!444851 (array!63466 (store (arr!30550 a!3219) i!1194 k0!2224) (size!31053 a!3219)))))

(declare-fun res!674696 () Bool)

(assert (=> start!86896 (=> (not res!674696) (not e!566687))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86896 (= res!674696 (validMask!0 mask!3464))))

(assert (=> start!86896 e!566687))

(declare-fun array_inv!23686 (array!63465) Bool)

(assert (=> start!86896 (array_inv!23686 a!3219)))

(assert (=> start!86896 true))

(declare-fun b!1006170 () Bool)

(assert (=> b!1006170 (= e!566685 e!566686)))

(declare-fun res!674687 () Bool)

(assert (=> b!1006170 (=> (not res!674687) (not e!566686))))

(assert (=> b!1006170 (= res!674687 (= lt!444850 lt!444846))))

(assert (=> b!1006170 (= lt!444846 (Intermediate!9418 false resIndex!38 resX!38))))

(assert (=> b!1006170 (= lt!444850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30550 a!3219) j!170) mask!3464) (select (arr!30550 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006171 () Bool)

(declare-fun res!674695 () Bool)

(assert (=> b!1006171 (=> (not res!674695) (not e!566685))))

(declare-datatypes ((List!21197 0))(
  ( (Nil!21194) (Cons!21193 (h!22382 (_ BitVec 64)) (t!30190 List!21197)) )
))
(declare-fun arrayNoDuplicates!0 (array!63465 (_ BitVec 32) List!21197) Bool)

(assert (=> b!1006171 (= res!674695 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21194))))

(declare-fun b!1006172 () Bool)

(declare-fun res!674689 () Bool)

(assert (=> b!1006172 (=> (not res!674689) (not e!566687))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006172 (= res!674689 (validKeyInArray!0 k0!2224))))

(declare-fun b!1006173 () Bool)

(assert (=> b!1006173 (= e!566688 (and (not (= index!1507 resIndex!38)) (= index!1507 i!1194)))))

(declare-fun b!1006174 () Bool)

(declare-fun res!674697 () Bool)

(assert (=> b!1006174 (=> (not res!674697) (not e!566687))))

(assert (=> b!1006174 (= res!674697 (validKeyInArray!0 (select (arr!30550 a!3219) j!170)))))

(declare-fun b!1006175 () Bool)

(declare-fun res!674694 () Bool)

(assert (=> b!1006175 (=> (not res!674694) (not e!566688))))

(assert (=> b!1006175 (= res!674694 (not (= lt!444847 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444849 lt!444851 mask!3464))))))

(declare-fun b!1006176 () Bool)

(declare-fun res!674698 () Bool)

(assert (=> b!1006176 (=> (not res!674698) (not e!566685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63465 (_ BitVec 32)) Bool)

(assert (=> b!1006176 (= res!674698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006177 () Bool)

(declare-fun res!674691 () Bool)

(assert (=> b!1006177 (=> (not res!674691) (not e!566687))))

(assert (=> b!1006177 (= res!674691 (and (= (size!31053 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31053 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31053 a!3219)) (not (= i!1194 j!170))))))

(assert (= (and start!86896 res!674696) b!1006177))

(assert (= (and b!1006177 res!674691) b!1006174))

(assert (= (and b!1006174 res!674697) b!1006172))

(assert (= (and b!1006172 res!674689) b!1006168))

(assert (= (and b!1006168 res!674699) b!1006167))

(assert (= (and b!1006167 res!674688) b!1006176))

(assert (= (and b!1006176 res!674698) b!1006171))

(assert (= (and b!1006171 res!674695) b!1006166))

(assert (= (and b!1006166 res!674690) b!1006170))

(assert (= (and b!1006170 res!674687) b!1006165))

(assert (= (and b!1006165 res!674692) b!1006169))

(assert (= (and b!1006169 res!674693) b!1006175))

(assert (= (and b!1006175 res!674694) b!1006173))

(declare-fun m!931841 () Bool)

(assert (=> b!1006171 m!931841))

(declare-fun m!931843 () Bool)

(assert (=> start!86896 m!931843))

(declare-fun m!931845 () Bool)

(assert (=> start!86896 m!931845))

(declare-fun m!931847 () Bool)

(assert (=> b!1006167 m!931847))

(declare-fun m!931849 () Bool)

(assert (=> b!1006165 m!931849))

(assert (=> b!1006165 m!931849))

(declare-fun m!931851 () Bool)

(assert (=> b!1006165 m!931851))

(assert (=> b!1006174 m!931849))

(assert (=> b!1006174 m!931849))

(declare-fun m!931853 () Bool)

(assert (=> b!1006174 m!931853))

(declare-fun m!931855 () Bool)

(assert (=> b!1006175 m!931855))

(declare-fun m!931857 () Bool)

(assert (=> b!1006168 m!931857))

(declare-fun m!931859 () Bool)

(assert (=> b!1006169 m!931859))

(assert (=> b!1006169 m!931859))

(declare-fun m!931861 () Bool)

(assert (=> b!1006169 m!931861))

(declare-fun m!931863 () Bool)

(assert (=> b!1006169 m!931863))

(declare-fun m!931865 () Bool)

(assert (=> b!1006169 m!931865))

(assert (=> b!1006170 m!931849))

(assert (=> b!1006170 m!931849))

(declare-fun m!931867 () Bool)

(assert (=> b!1006170 m!931867))

(assert (=> b!1006170 m!931867))

(assert (=> b!1006170 m!931849))

(declare-fun m!931869 () Bool)

(assert (=> b!1006170 m!931869))

(declare-fun m!931871 () Bool)

(assert (=> b!1006176 m!931871))

(declare-fun m!931873 () Bool)

(assert (=> b!1006172 m!931873))

(check-sat (not b!1006167) (not b!1006165) (not b!1006171) (not b!1006175) (not b!1006170) (not b!1006168) (not b!1006172) (not b!1006174) (not start!86896) (not b!1006169) (not b!1006176))
(check-sat)
(get-model)

(declare-fun b!1006274 () Bool)

(declare-fun e!566736 () SeekEntryResult!9418)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006274 (= e!566736 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!444849 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) lt!444849 lt!444851 mask!3464))))

(declare-fun b!1006276 () Bool)

(declare-fun lt!444893 () SeekEntryResult!9418)

(assert (=> b!1006276 (and (bvsge (index!40045 lt!444893) #b00000000000000000000000000000000) (bvslt (index!40045 lt!444893) (size!31053 lt!444851)))))

(declare-fun e!566737 () Bool)

(assert (=> b!1006276 (= e!566737 (= (select (arr!30550 lt!444851) (index!40045 lt!444893)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1006277 () Bool)

(assert (=> b!1006277 (and (bvsge (index!40045 lt!444893) #b00000000000000000000000000000000) (bvslt (index!40045 lt!444893) (size!31053 lt!444851)))))

(declare-fun res!674786 () Bool)

(assert (=> b!1006277 (= res!674786 (= (select (arr!30550 lt!444851) (index!40045 lt!444893)) lt!444849))))

(assert (=> b!1006277 (=> res!674786 e!566737)))

(declare-fun e!566735 () Bool)

(assert (=> b!1006277 (= e!566735 e!566737)))

(declare-fun b!1006278 () Bool)

(declare-fun e!566738 () Bool)

(assert (=> b!1006278 (= e!566738 e!566735)))

(declare-fun res!674784 () Bool)

(get-info :version)

(assert (=> b!1006278 (= res!674784 (and ((_ is Intermediate!9418) lt!444893) (not (undefined!10230 lt!444893)) (bvslt (x!87608 lt!444893) #b01111111111111111111111111111110) (bvsge (x!87608 lt!444893) #b00000000000000000000000000000000) (bvsge (x!87608 lt!444893) #b00000000000000000000000000000000)))))

(assert (=> b!1006278 (=> (not res!674784) (not e!566735))))

(declare-fun b!1006279 () Bool)

(assert (=> b!1006279 (= e!566736 (Intermediate!9418 false (toIndex!0 lt!444849 mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!119927 () Bool)

(assert (=> d!119927 e!566738))

(declare-fun c!101901 () Bool)

(assert (=> d!119927 (= c!101901 (and ((_ is Intermediate!9418) lt!444893) (undefined!10230 lt!444893)))))

(declare-fun e!566739 () SeekEntryResult!9418)

(assert (=> d!119927 (= lt!444893 e!566739)))

(declare-fun c!101900 () Bool)

(assert (=> d!119927 (= c!101900 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444892 () (_ BitVec 64))

(assert (=> d!119927 (= lt!444892 (select (arr!30550 lt!444851) (toIndex!0 lt!444849 mask!3464)))))

(assert (=> d!119927 (validMask!0 mask!3464)))

(assert (=> d!119927 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444849 mask!3464) lt!444849 lt!444851 mask!3464) lt!444893)))

(declare-fun b!1006275 () Bool)

(assert (=> b!1006275 (= e!566738 (bvsge (x!87608 lt!444893) #b01111111111111111111111111111110))))

(declare-fun b!1006280 () Bool)

(assert (=> b!1006280 (and (bvsge (index!40045 lt!444893) #b00000000000000000000000000000000) (bvslt (index!40045 lt!444893) (size!31053 lt!444851)))))

(declare-fun res!674785 () Bool)

(assert (=> b!1006280 (= res!674785 (= (select (arr!30550 lt!444851) (index!40045 lt!444893)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1006280 (=> res!674785 e!566737)))

(declare-fun b!1006281 () Bool)

(assert (=> b!1006281 (= e!566739 e!566736)))

(declare-fun c!101902 () Bool)

(assert (=> b!1006281 (= c!101902 (or (= lt!444892 lt!444849) (= (bvadd lt!444892 lt!444892) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1006282 () Bool)

(assert (=> b!1006282 (= e!566739 (Intermediate!9418 true (toIndex!0 lt!444849 mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!119927 c!101900) b!1006282))

(assert (= (and d!119927 (not c!101900)) b!1006281))

(assert (= (and b!1006281 c!101902) b!1006279))

(assert (= (and b!1006281 (not c!101902)) b!1006274))

(assert (= (and d!119927 c!101901) b!1006275))

(assert (= (and d!119927 (not c!101901)) b!1006278))

(assert (= (and b!1006278 res!674784) b!1006277))

(assert (= (and b!1006277 (not res!674786)) b!1006280))

(assert (= (and b!1006280 (not res!674785)) b!1006276))

(declare-fun m!931943 () Bool)

(assert (=> b!1006277 m!931943))

(assert (=> b!1006276 m!931943))

(assert (=> d!119927 m!931859))

(declare-fun m!931945 () Bool)

(assert (=> d!119927 m!931945))

(assert (=> d!119927 m!931843))

(assert (=> b!1006274 m!931859))

(declare-fun m!931947 () Bool)

(assert (=> b!1006274 m!931947))

(assert (=> b!1006274 m!931947))

(declare-fun m!931949 () Bool)

(assert (=> b!1006274 m!931949))

(assert (=> b!1006280 m!931943))

(assert (=> b!1006169 d!119927))

(declare-fun d!119929 () Bool)

(declare-fun lt!444899 () (_ BitVec 32))

(declare-fun lt!444898 () (_ BitVec 32))

(assert (=> d!119929 (= lt!444899 (bvmul (bvxor lt!444898 (bvlshr lt!444898 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119929 (= lt!444898 ((_ extract 31 0) (bvand (bvxor lt!444849 (bvlshr lt!444849 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119929 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674787 (let ((h!22385 ((_ extract 31 0) (bvand (bvxor lt!444849 (bvlshr lt!444849 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87612 (bvmul (bvxor h!22385 (bvlshr h!22385 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87612 (bvlshr x!87612 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674787 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674787 #b00000000000000000000000000000000))))))

(assert (=> d!119929 (= (toIndex!0 lt!444849 mask!3464) (bvand (bvxor lt!444899 (bvlshr lt!444899 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1006169 d!119929))

(declare-fun d!119931 () Bool)

(assert (=> d!119931 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86896 d!119931))

(declare-fun d!119941 () Bool)

(assert (=> d!119941 (= (array_inv!23686 a!3219) (bvsge (size!31053 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86896 d!119941))

(declare-fun b!1006299 () Bool)

(declare-fun e!566755 () SeekEntryResult!9418)

(assert (=> b!1006299 (= e!566755 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30550 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (select (arr!30550 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006301 () Bool)

(declare-fun lt!444901 () SeekEntryResult!9418)

(assert (=> b!1006301 (and (bvsge (index!40045 lt!444901) #b00000000000000000000000000000000) (bvslt (index!40045 lt!444901) (size!31053 a!3219)))))

(declare-fun e!566756 () Bool)

(assert (=> b!1006301 (= e!566756 (= (select (arr!30550 a!3219) (index!40045 lt!444901)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1006302 () Bool)

(assert (=> b!1006302 (and (bvsge (index!40045 lt!444901) #b00000000000000000000000000000000) (bvslt (index!40045 lt!444901) (size!31053 a!3219)))))

(declare-fun res!674802 () Bool)

(assert (=> b!1006302 (= res!674802 (= (select (arr!30550 a!3219) (index!40045 lt!444901)) (select (arr!30550 a!3219) j!170)))))

(assert (=> b!1006302 (=> res!674802 e!566756)))

(declare-fun e!566754 () Bool)

(assert (=> b!1006302 (= e!566754 e!566756)))

(declare-fun b!1006303 () Bool)

(declare-fun e!566757 () Bool)

(assert (=> b!1006303 (= e!566757 e!566754)))

(declare-fun res!674800 () Bool)

(assert (=> b!1006303 (= res!674800 (and ((_ is Intermediate!9418) lt!444901) (not (undefined!10230 lt!444901)) (bvslt (x!87608 lt!444901) #b01111111111111111111111111111110) (bvsge (x!87608 lt!444901) #b00000000000000000000000000000000) (bvsge (x!87608 lt!444901) #b00000000000000000000000000000000)))))

(assert (=> b!1006303 (=> (not res!674800) (not e!566754))))

(declare-fun b!1006304 () Bool)

(assert (=> b!1006304 (= e!566755 (Intermediate!9418 false (toIndex!0 (select (arr!30550 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!119943 () Bool)

(assert (=> d!119943 e!566757))

(declare-fun c!101906 () Bool)

(assert (=> d!119943 (= c!101906 (and ((_ is Intermediate!9418) lt!444901) (undefined!10230 lt!444901)))))

(declare-fun e!566758 () SeekEntryResult!9418)

(assert (=> d!119943 (= lt!444901 e!566758)))

(declare-fun c!101905 () Bool)

(assert (=> d!119943 (= c!101905 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444900 () (_ BitVec 64))

(assert (=> d!119943 (= lt!444900 (select (arr!30550 a!3219) (toIndex!0 (select (arr!30550 a!3219) j!170) mask!3464)))))

(assert (=> d!119943 (validMask!0 mask!3464)))

(assert (=> d!119943 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30550 a!3219) j!170) mask!3464) (select (arr!30550 a!3219) j!170) a!3219 mask!3464) lt!444901)))

(declare-fun b!1006300 () Bool)

(assert (=> b!1006300 (= e!566757 (bvsge (x!87608 lt!444901) #b01111111111111111111111111111110))))

(declare-fun b!1006305 () Bool)

(assert (=> b!1006305 (and (bvsge (index!40045 lt!444901) #b00000000000000000000000000000000) (bvslt (index!40045 lt!444901) (size!31053 a!3219)))))

(declare-fun res!674801 () Bool)

(assert (=> b!1006305 (= res!674801 (= (select (arr!30550 a!3219) (index!40045 lt!444901)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1006305 (=> res!674801 e!566756)))

(declare-fun b!1006306 () Bool)

(assert (=> b!1006306 (= e!566758 e!566755)))

(declare-fun c!101907 () Bool)

(assert (=> b!1006306 (= c!101907 (or (= lt!444900 (select (arr!30550 a!3219) j!170)) (= (bvadd lt!444900 lt!444900) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1006307 () Bool)

(assert (=> b!1006307 (= e!566758 (Intermediate!9418 true (toIndex!0 (select (arr!30550 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(assert (= (and d!119943 c!101905) b!1006307))

(assert (= (and d!119943 (not c!101905)) b!1006306))

(assert (= (and b!1006306 c!101907) b!1006304))

(assert (= (and b!1006306 (not c!101907)) b!1006299))

(assert (= (and d!119943 c!101906) b!1006300))

(assert (= (and d!119943 (not c!101906)) b!1006303))

(assert (= (and b!1006303 res!674800) b!1006302))

(assert (= (and b!1006302 (not res!674802)) b!1006305))

(assert (= (and b!1006305 (not res!674801)) b!1006301))

(declare-fun m!931955 () Bool)

(assert (=> b!1006302 m!931955))

(assert (=> b!1006301 m!931955))

(assert (=> d!119943 m!931867))

(declare-fun m!931957 () Bool)

(assert (=> d!119943 m!931957))

(assert (=> d!119943 m!931843))

(assert (=> b!1006299 m!931867))

(declare-fun m!931959 () Bool)

(assert (=> b!1006299 m!931959))

(assert (=> b!1006299 m!931959))

(assert (=> b!1006299 m!931849))

(declare-fun m!931961 () Bool)

(assert (=> b!1006299 m!931961))

(assert (=> b!1006305 m!931955))

(assert (=> b!1006170 d!119943))

(declare-fun d!119945 () Bool)

(declare-fun lt!444903 () (_ BitVec 32))

(declare-fun lt!444902 () (_ BitVec 32))

(assert (=> d!119945 (= lt!444903 (bvmul (bvxor lt!444902 (bvlshr lt!444902 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119945 (= lt!444902 ((_ extract 31 0) (bvand (bvxor (select (arr!30550 a!3219) j!170) (bvlshr (select (arr!30550 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119945 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674787 (let ((h!22385 ((_ extract 31 0) (bvand (bvxor (select (arr!30550 a!3219) j!170) (bvlshr (select (arr!30550 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87612 (bvmul (bvxor h!22385 (bvlshr h!22385 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87612 (bvlshr x!87612 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674787 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674787 #b00000000000000000000000000000000))))))

(assert (=> d!119945 (= (toIndex!0 (select (arr!30550 a!3219) j!170) mask!3464) (bvand (bvxor lt!444903 (bvlshr lt!444903 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1006170 d!119945))

(declare-fun d!119947 () Bool)

(declare-fun res!674810 () Bool)

(declare-fun e!566767 () Bool)

(assert (=> d!119947 (=> res!674810 e!566767)))

(assert (=> d!119947 (= res!674810 (= (select (arr!30550 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119947 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!566767)))

(declare-fun b!1006317 () Bool)

(declare-fun e!566768 () Bool)

(assert (=> b!1006317 (= e!566767 e!566768)))

(declare-fun res!674811 () Bool)

(assert (=> b!1006317 (=> (not res!674811) (not e!566768))))

(assert (=> b!1006317 (= res!674811 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31053 a!3219)))))

(declare-fun b!1006318 () Bool)

(assert (=> b!1006318 (= e!566768 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119947 (not res!674810)) b!1006317))

(assert (= (and b!1006317 res!674811) b!1006318))

(declare-fun m!931971 () Bool)

(assert (=> d!119947 m!931971))

(declare-fun m!931973 () Bool)

(assert (=> b!1006318 m!931973))

(assert (=> b!1006168 d!119947))

(declare-fun b!1006367 () Bool)

(declare-fun e!566794 () SeekEntryResult!9418)

(assert (=> b!1006367 (= e!566794 Undefined!9418)))

(declare-fun e!566795 () SeekEntryResult!9418)

(declare-fun b!1006368 () Bool)

(declare-fun lt!444925 () SeekEntryResult!9418)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63465 (_ BitVec 32)) SeekEntryResult!9418)

(assert (=> b!1006368 (= e!566795 (seekKeyOrZeroReturnVacant!0 (x!87608 lt!444925) (index!40045 lt!444925) (index!40045 lt!444925) k0!2224 a!3219 mask!3464))))

(declare-fun b!1006369 () Bool)

(declare-fun c!101930 () Bool)

(declare-fun lt!444924 () (_ BitVec 64))

(assert (=> b!1006369 (= c!101930 (= lt!444924 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566796 () SeekEntryResult!9418)

(assert (=> b!1006369 (= e!566796 e!566795)))

(declare-fun b!1006370 () Bool)

(assert (=> b!1006370 (= e!566796 (Found!9418 (index!40045 lt!444925)))))

(declare-fun b!1006371 () Bool)

(assert (=> b!1006371 (= e!566795 (MissingZero!9418 (index!40045 lt!444925)))))

(declare-fun b!1006372 () Bool)

(assert (=> b!1006372 (= e!566794 e!566796)))

(assert (=> b!1006372 (= lt!444924 (select (arr!30550 a!3219) (index!40045 lt!444925)))))

(declare-fun c!101932 () Bool)

(assert (=> b!1006372 (= c!101932 (= lt!444924 k0!2224))))

(declare-fun d!119953 () Bool)

(declare-fun lt!444923 () SeekEntryResult!9418)

(assert (=> d!119953 (and (or ((_ is Undefined!9418) lt!444923) (not ((_ is Found!9418) lt!444923)) (and (bvsge (index!40044 lt!444923) #b00000000000000000000000000000000) (bvslt (index!40044 lt!444923) (size!31053 a!3219)))) (or ((_ is Undefined!9418) lt!444923) ((_ is Found!9418) lt!444923) (not ((_ is MissingZero!9418) lt!444923)) (and (bvsge (index!40043 lt!444923) #b00000000000000000000000000000000) (bvslt (index!40043 lt!444923) (size!31053 a!3219)))) (or ((_ is Undefined!9418) lt!444923) ((_ is Found!9418) lt!444923) ((_ is MissingZero!9418) lt!444923) (not ((_ is MissingVacant!9418) lt!444923)) (and (bvsge (index!40046 lt!444923) #b00000000000000000000000000000000) (bvslt (index!40046 lt!444923) (size!31053 a!3219)))) (or ((_ is Undefined!9418) lt!444923) (ite ((_ is Found!9418) lt!444923) (= (select (arr!30550 a!3219) (index!40044 lt!444923)) k0!2224) (ite ((_ is MissingZero!9418) lt!444923) (= (select (arr!30550 a!3219) (index!40043 lt!444923)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9418) lt!444923) (= (select (arr!30550 a!3219) (index!40046 lt!444923)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119953 (= lt!444923 e!566794)))

(declare-fun c!101931 () Bool)

(assert (=> d!119953 (= c!101931 (and ((_ is Intermediate!9418) lt!444925) (undefined!10230 lt!444925)))))

(assert (=> d!119953 (= lt!444925 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119953 (validMask!0 mask!3464)))

(assert (=> d!119953 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!444923)))

(assert (= (and d!119953 c!101931) b!1006367))

(assert (= (and d!119953 (not c!101931)) b!1006372))

(assert (= (and b!1006372 c!101932) b!1006370))

(assert (= (and b!1006372 (not c!101932)) b!1006369))

(assert (= (and b!1006369 c!101930) b!1006371))

(assert (= (and b!1006369 (not c!101930)) b!1006368))

(declare-fun m!931989 () Bool)

(assert (=> b!1006368 m!931989))

(declare-fun m!931991 () Bool)

(assert (=> b!1006372 m!931991))

(declare-fun m!931993 () Bool)

(assert (=> d!119953 m!931993))

(declare-fun m!931995 () Bool)

(assert (=> d!119953 m!931995))

(declare-fun m!931997 () Bool)

(assert (=> d!119953 m!931997))

(declare-fun m!931999 () Bool)

(assert (=> d!119953 m!931999))

(declare-fun m!932001 () Bool)

(assert (=> d!119953 m!932001))

(assert (=> d!119953 m!931843))

(assert (=> d!119953 m!931993))

(assert (=> b!1006167 d!119953))

(declare-fun d!119957 () Bool)

(assert (=> d!119957 (= (validKeyInArray!0 (select (arr!30550 a!3219) j!170)) (and (not (= (select (arr!30550 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30550 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1006174 d!119957))

(declare-fun e!566803 () SeekEntryResult!9418)

(declare-fun b!1006382 () Bool)

(assert (=> b!1006382 (= e!566803 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30550 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006384 () Bool)

(declare-fun lt!444929 () SeekEntryResult!9418)

(assert (=> b!1006384 (and (bvsge (index!40045 lt!444929) #b00000000000000000000000000000000) (bvslt (index!40045 lt!444929) (size!31053 a!3219)))))

(declare-fun e!566804 () Bool)

(assert (=> b!1006384 (= e!566804 (= (select (arr!30550 a!3219) (index!40045 lt!444929)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1006385 () Bool)

(assert (=> b!1006385 (and (bvsge (index!40045 lt!444929) #b00000000000000000000000000000000) (bvslt (index!40045 lt!444929) (size!31053 a!3219)))))

(declare-fun res!674823 () Bool)

(assert (=> b!1006385 (= res!674823 (= (select (arr!30550 a!3219) (index!40045 lt!444929)) (select (arr!30550 a!3219) j!170)))))

(assert (=> b!1006385 (=> res!674823 e!566804)))

(declare-fun e!566802 () Bool)

(assert (=> b!1006385 (= e!566802 e!566804)))

(declare-fun b!1006386 () Bool)

(declare-fun e!566805 () Bool)

(assert (=> b!1006386 (= e!566805 e!566802)))

(declare-fun res!674821 () Bool)

(assert (=> b!1006386 (= res!674821 (and ((_ is Intermediate!9418) lt!444929) (not (undefined!10230 lt!444929)) (bvslt (x!87608 lt!444929) #b01111111111111111111111111111110) (bvsge (x!87608 lt!444929) #b00000000000000000000000000000000) (bvsge (x!87608 lt!444929) x!1245)))))

(assert (=> b!1006386 (=> (not res!674821) (not e!566802))))

(declare-fun b!1006387 () Bool)

(assert (=> b!1006387 (= e!566803 (Intermediate!9418 false index!1507 x!1245))))

(declare-fun d!119959 () Bool)

(assert (=> d!119959 e!566805))

(declare-fun c!101937 () Bool)

(assert (=> d!119959 (= c!101937 (and ((_ is Intermediate!9418) lt!444929) (undefined!10230 lt!444929)))))

(declare-fun e!566806 () SeekEntryResult!9418)

(assert (=> d!119959 (= lt!444929 e!566806)))

(declare-fun c!101936 () Bool)

(assert (=> d!119959 (= c!101936 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444928 () (_ BitVec 64))

(assert (=> d!119959 (= lt!444928 (select (arr!30550 a!3219) index!1507))))

(assert (=> d!119959 (validMask!0 mask!3464)))

(assert (=> d!119959 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30550 a!3219) j!170) a!3219 mask!3464) lt!444929)))

(declare-fun b!1006383 () Bool)

(assert (=> b!1006383 (= e!566805 (bvsge (x!87608 lt!444929) #b01111111111111111111111111111110))))

(declare-fun b!1006388 () Bool)

(assert (=> b!1006388 (and (bvsge (index!40045 lt!444929) #b00000000000000000000000000000000) (bvslt (index!40045 lt!444929) (size!31053 a!3219)))))

(declare-fun res!674822 () Bool)

(assert (=> b!1006388 (= res!674822 (= (select (arr!30550 a!3219) (index!40045 lt!444929)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1006388 (=> res!674822 e!566804)))

(declare-fun b!1006389 () Bool)

(assert (=> b!1006389 (= e!566806 e!566803)))

(declare-fun c!101938 () Bool)

(assert (=> b!1006389 (= c!101938 (or (= lt!444928 (select (arr!30550 a!3219) j!170)) (= (bvadd lt!444928 lt!444928) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1006390 () Bool)

(assert (=> b!1006390 (= e!566806 (Intermediate!9418 true index!1507 x!1245))))

(assert (= (and d!119959 c!101936) b!1006390))

(assert (= (and d!119959 (not c!101936)) b!1006389))

(assert (= (and b!1006389 c!101938) b!1006387))

(assert (= (and b!1006389 (not c!101938)) b!1006382))

(assert (= (and d!119959 c!101937) b!1006383))

(assert (= (and d!119959 (not c!101937)) b!1006386))

(assert (= (and b!1006386 res!674821) b!1006385))

(assert (= (and b!1006385 (not res!674823)) b!1006388))

(assert (= (and b!1006388 (not res!674822)) b!1006384))

(declare-fun m!932011 () Bool)

(assert (=> b!1006385 m!932011))

(assert (=> b!1006384 m!932011))

(declare-fun m!932013 () Bool)

(assert (=> d!119959 m!932013))

(assert (=> d!119959 m!931843))

(declare-fun m!932017 () Bool)

(assert (=> b!1006382 m!932017))

(assert (=> b!1006382 m!932017))

(assert (=> b!1006382 m!931849))

(declare-fun m!932021 () Bool)

(assert (=> b!1006382 m!932021))

(assert (=> b!1006388 m!932011))

(assert (=> b!1006165 d!119959))

(declare-fun bm!42397 () Bool)

(declare-fun call!42400 () Bool)

(assert (=> bm!42397 (= call!42400 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun d!119965 () Bool)

(declare-fun res!674844 () Bool)

(declare-fun e!566835 () Bool)

(assert (=> d!119965 (=> res!674844 e!566835)))

(assert (=> d!119965 (= res!674844 (bvsge #b00000000000000000000000000000000 (size!31053 a!3219)))))

(assert (=> d!119965 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!566835)))

(declare-fun b!1006432 () Bool)

(declare-fun e!566834 () Bool)

(assert (=> b!1006432 (= e!566834 call!42400)))

(declare-fun b!1006433 () Bool)

(declare-fun e!566836 () Bool)

(assert (=> b!1006433 (= e!566836 e!566834)))

(declare-fun lt!444944 () (_ BitVec 64))

(assert (=> b!1006433 (= lt!444944 (select (arr!30550 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32991 0))(
  ( (Unit!32992) )
))
(declare-fun lt!444943 () Unit!32991)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63465 (_ BitVec 64) (_ BitVec 32)) Unit!32991)

(assert (=> b!1006433 (= lt!444943 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!444944 #b00000000000000000000000000000000))))

(assert (=> b!1006433 (arrayContainsKey!0 a!3219 lt!444944 #b00000000000000000000000000000000)))

(declare-fun lt!444942 () Unit!32991)

(assert (=> b!1006433 (= lt!444942 lt!444943)))

(declare-fun res!674843 () Bool)

(assert (=> b!1006433 (= res!674843 (= (seekEntryOrOpen!0 (select (arr!30550 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9418 #b00000000000000000000000000000000)))))

(assert (=> b!1006433 (=> (not res!674843) (not e!566834))))

(declare-fun b!1006434 () Bool)

(assert (=> b!1006434 (= e!566835 e!566836)))

(declare-fun c!101950 () Bool)

(assert (=> b!1006434 (= c!101950 (validKeyInArray!0 (select (arr!30550 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1006435 () Bool)

(assert (=> b!1006435 (= e!566836 call!42400)))

(assert (= (and d!119965 (not res!674844)) b!1006434))

(assert (= (and b!1006434 c!101950) b!1006433))

(assert (= (and b!1006434 (not c!101950)) b!1006435))

(assert (= (and b!1006433 res!674843) b!1006432))

(assert (= (or b!1006432 b!1006435) bm!42397))

(declare-fun m!932027 () Bool)

(assert (=> bm!42397 m!932027))

(assert (=> b!1006433 m!931971))

(declare-fun m!932029 () Bool)

(assert (=> b!1006433 m!932029))

(declare-fun m!932031 () Bool)

(assert (=> b!1006433 m!932031))

(assert (=> b!1006433 m!931971))

(declare-fun m!932033 () Bool)

(assert (=> b!1006433 m!932033))

(assert (=> b!1006434 m!931971))

(assert (=> b!1006434 m!931971))

(declare-fun m!932035 () Bool)

(assert (=> b!1006434 m!932035))

(assert (=> b!1006176 d!119965))

(declare-fun e!566838 () SeekEntryResult!9418)

(declare-fun b!1006436 () Bool)

(assert (=> b!1006436 (= e!566838 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) lt!444849 lt!444851 mask!3464))))

(declare-fun b!1006438 () Bool)

(declare-fun lt!444946 () SeekEntryResult!9418)

(assert (=> b!1006438 (and (bvsge (index!40045 lt!444946) #b00000000000000000000000000000000) (bvslt (index!40045 lt!444946) (size!31053 lt!444851)))))

(declare-fun e!566839 () Bool)

(assert (=> b!1006438 (= e!566839 (= (select (arr!30550 lt!444851) (index!40045 lt!444946)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1006439 () Bool)

(assert (=> b!1006439 (and (bvsge (index!40045 lt!444946) #b00000000000000000000000000000000) (bvslt (index!40045 lt!444946) (size!31053 lt!444851)))))

(declare-fun res!674847 () Bool)

(assert (=> b!1006439 (= res!674847 (= (select (arr!30550 lt!444851) (index!40045 lt!444946)) lt!444849))))

(assert (=> b!1006439 (=> res!674847 e!566839)))

(declare-fun e!566837 () Bool)

(assert (=> b!1006439 (= e!566837 e!566839)))

(declare-fun b!1006440 () Bool)

(declare-fun e!566840 () Bool)

(assert (=> b!1006440 (= e!566840 e!566837)))

(declare-fun res!674845 () Bool)

(assert (=> b!1006440 (= res!674845 (and ((_ is Intermediate!9418) lt!444946) (not (undefined!10230 lt!444946)) (bvslt (x!87608 lt!444946) #b01111111111111111111111111111110) (bvsge (x!87608 lt!444946) #b00000000000000000000000000000000) (bvsge (x!87608 lt!444946) x!1245)))))

(assert (=> b!1006440 (=> (not res!674845) (not e!566837))))

(declare-fun b!1006441 () Bool)

(assert (=> b!1006441 (= e!566838 (Intermediate!9418 false index!1507 x!1245))))

(declare-fun d!119971 () Bool)

(assert (=> d!119971 e!566840))

(declare-fun c!101952 () Bool)

(assert (=> d!119971 (= c!101952 (and ((_ is Intermediate!9418) lt!444946) (undefined!10230 lt!444946)))))

(declare-fun e!566841 () SeekEntryResult!9418)

(assert (=> d!119971 (= lt!444946 e!566841)))

(declare-fun c!101951 () Bool)

(assert (=> d!119971 (= c!101951 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444945 () (_ BitVec 64))

(assert (=> d!119971 (= lt!444945 (select (arr!30550 lt!444851) index!1507))))

(assert (=> d!119971 (validMask!0 mask!3464)))

(assert (=> d!119971 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444849 lt!444851 mask!3464) lt!444946)))

(declare-fun b!1006437 () Bool)

(assert (=> b!1006437 (= e!566840 (bvsge (x!87608 lt!444946) #b01111111111111111111111111111110))))

(declare-fun b!1006442 () Bool)

(assert (=> b!1006442 (and (bvsge (index!40045 lt!444946) #b00000000000000000000000000000000) (bvslt (index!40045 lt!444946) (size!31053 lt!444851)))))

(declare-fun res!674846 () Bool)

(assert (=> b!1006442 (= res!674846 (= (select (arr!30550 lt!444851) (index!40045 lt!444946)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1006442 (=> res!674846 e!566839)))

(declare-fun b!1006443 () Bool)

(assert (=> b!1006443 (= e!566841 e!566838)))

(declare-fun c!101953 () Bool)

(assert (=> b!1006443 (= c!101953 (or (= lt!444945 lt!444849) (= (bvadd lt!444945 lt!444945) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1006444 () Bool)

(assert (=> b!1006444 (= e!566841 (Intermediate!9418 true index!1507 x!1245))))

(assert (= (and d!119971 c!101951) b!1006444))

(assert (= (and d!119971 (not c!101951)) b!1006443))

(assert (= (and b!1006443 c!101953) b!1006441))

(assert (= (and b!1006443 (not c!101953)) b!1006436))

(assert (= (and d!119971 c!101952) b!1006437))

(assert (= (and d!119971 (not c!101952)) b!1006440))

(assert (= (and b!1006440 res!674845) b!1006439))

(assert (= (and b!1006439 (not res!674847)) b!1006442))

(assert (= (and b!1006442 (not res!674846)) b!1006438))

(declare-fun m!932037 () Bool)

(assert (=> b!1006439 m!932037))

(assert (=> b!1006438 m!932037))

(declare-fun m!932039 () Bool)

(assert (=> d!119971 m!932039))

(assert (=> d!119971 m!931843))

(assert (=> b!1006436 m!932017))

(assert (=> b!1006436 m!932017))

(declare-fun m!932041 () Bool)

(assert (=> b!1006436 m!932041))

(assert (=> b!1006442 m!932037))

(assert (=> b!1006175 d!119971))

(declare-fun d!119973 () Bool)

(assert (=> d!119973 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1006172 d!119973))

(declare-fun bm!42400 () Bool)

(declare-fun call!42403 () Bool)

(declare-fun c!101962 () Bool)

(assert (=> bm!42400 (= call!42403 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101962 (Cons!21193 (select (arr!30550 a!3219) #b00000000000000000000000000000000) Nil!21194) Nil!21194)))))

(declare-fun b!1006473 () Bool)

(declare-fun e!566860 () Bool)

(declare-fun contains!5903 (List!21197 (_ BitVec 64)) Bool)

(assert (=> b!1006473 (= e!566860 (contains!5903 Nil!21194 (select (arr!30550 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119975 () Bool)

(declare-fun res!674861 () Bool)

(declare-fun e!566862 () Bool)

(assert (=> d!119975 (=> res!674861 e!566862)))

(assert (=> d!119975 (= res!674861 (bvsge #b00000000000000000000000000000000 (size!31053 a!3219)))))

(assert (=> d!119975 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21194) e!566862)))

(declare-fun b!1006474 () Bool)

(declare-fun e!566861 () Bool)

(assert (=> b!1006474 (= e!566861 call!42403)))

(declare-fun b!1006475 () Bool)

(declare-fun e!566863 () Bool)

(assert (=> b!1006475 (= e!566863 e!566861)))

(assert (=> b!1006475 (= c!101962 (validKeyInArray!0 (select (arr!30550 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1006476 () Bool)

(assert (=> b!1006476 (= e!566862 e!566863)))

(declare-fun res!674862 () Bool)

(assert (=> b!1006476 (=> (not res!674862) (not e!566863))))

(assert (=> b!1006476 (= res!674862 (not e!566860))))

(declare-fun res!674860 () Bool)

(assert (=> b!1006476 (=> (not res!674860) (not e!566860))))

(assert (=> b!1006476 (= res!674860 (validKeyInArray!0 (select (arr!30550 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1006477 () Bool)

(assert (=> b!1006477 (= e!566861 call!42403)))

(assert (= (and d!119975 (not res!674861)) b!1006476))

(assert (= (and b!1006476 res!674860) b!1006473))

(assert (= (and b!1006476 res!674862) b!1006475))

(assert (= (and b!1006475 c!101962) b!1006477))

(assert (= (and b!1006475 (not c!101962)) b!1006474))

(assert (= (or b!1006477 b!1006474) bm!42400))

(assert (=> bm!42400 m!931971))

(declare-fun m!932057 () Bool)

(assert (=> bm!42400 m!932057))

(assert (=> b!1006473 m!931971))

(assert (=> b!1006473 m!931971))

(declare-fun m!932059 () Bool)

(assert (=> b!1006473 m!932059))

(assert (=> b!1006475 m!931971))

(assert (=> b!1006475 m!931971))

(assert (=> b!1006475 m!932035))

(assert (=> b!1006476 m!931971))

(assert (=> b!1006476 m!931971))

(assert (=> b!1006476 m!932035))

(assert (=> b!1006171 d!119975))

(check-sat (not b!1006318) (not bm!42400) (not d!119959) (not d!119943) (not b!1006476) (not d!119971) (not d!119953) (not b!1006475) (not b!1006368) (not b!1006433) (not b!1006434) (not b!1006299) (not b!1006473) (not d!119927) (not b!1006382) (not bm!42397) (not b!1006274) (not b!1006436))
(check-sat)
