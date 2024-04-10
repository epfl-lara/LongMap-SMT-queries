; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87052 () Bool)

(assert start!87052)

(declare-fun b!1009762 () Bool)

(declare-fun res!678356 () Bool)

(declare-fun e!568079 () Bool)

(assert (=> b!1009762 (=> (not res!678356) (not e!568079))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009762 (= res!678356 (validKeyInArray!0 k!2224))))

(declare-fun b!1009763 () Bool)

(declare-fun e!568076 () Bool)

(declare-fun e!568080 () Bool)

(assert (=> b!1009763 (= e!568076 e!568080)))

(declare-fun res!678357 () Bool)

(assert (=> b!1009763 (=> (not res!678357) (not e!568080))))

(declare-datatypes ((SeekEntryResult!9565 0))(
  ( (MissingZero!9565 (index!40631 (_ BitVec 32))) (Found!9565 (index!40632 (_ BitVec 32))) (Intermediate!9565 (undefined!10377 Bool) (index!40633 (_ BitVec 32)) (x!88024 (_ BitVec 32))) (Undefined!9565) (MissingVacant!9565 (index!40634 (_ BitVec 32))) )
))
(declare-fun lt!446307 () SeekEntryResult!9565)

(declare-fun lt!446303 () SeekEntryResult!9565)

(assert (=> b!1009763 (= res!678357 (= lt!446307 lt!446303))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009763 (= lt!446303 (Intermediate!9565 false resIndex!38 resX!38))))

(declare-datatypes ((array!63627 0))(
  ( (array!63628 (arr!30633 (Array (_ BitVec 32) (_ BitVec 64))) (size!31135 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63627)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63627 (_ BitVec 32)) SeekEntryResult!9565)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009763 (= lt!446307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30633 a!3219) j!170) mask!3464) (select (arr!30633 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009764 () Bool)

(declare-fun res!678353 () Bool)

(declare-fun e!568081 () Bool)

(assert (=> b!1009764 (=> (not res!678353) (not e!568081))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1009764 (= res!678353 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun lt!446306 () (_ BitVec 32))

(declare-fun b!1009765 () Bool)

(assert (=> b!1009765 (= e!568081 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (or (bvslt lt!446306 #b00000000000000000000000000000000) (bvsge lt!446306 (size!31135 a!3219)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009765 (= lt!446306 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!678361 () Bool)

(assert (=> start!87052 (=> (not res!678361) (not e!568079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87052 (= res!678361 (validMask!0 mask!3464))))

(assert (=> start!87052 e!568079))

(declare-fun array_inv!23757 (array!63627) Bool)

(assert (=> start!87052 (array_inv!23757 a!3219)))

(assert (=> start!87052 true))

(declare-fun b!1009766 () Bool)

(declare-fun res!678352 () Bool)

(assert (=> b!1009766 (=> (not res!678352) (not e!568076))))

(assert (=> b!1009766 (= res!678352 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31135 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31135 a!3219))))))

(declare-fun b!1009767 () Bool)

(assert (=> b!1009767 (= e!568079 e!568076)))

(declare-fun res!678355 () Bool)

(assert (=> b!1009767 (=> (not res!678355) (not e!568076))))

(declare-fun lt!446304 () SeekEntryResult!9565)

(assert (=> b!1009767 (= res!678355 (or (= lt!446304 (MissingVacant!9565 i!1194)) (= lt!446304 (MissingZero!9565 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63627 (_ BitVec 32)) SeekEntryResult!9565)

(assert (=> b!1009767 (= lt!446304 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1009768 () Bool)

(declare-fun res!678358 () Bool)

(assert (=> b!1009768 (=> (not res!678358) (not e!568079))))

(assert (=> b!1009768 (= res!678358 (validKeyInArray!0 (select (arr!30633 a!3219) j!170)))))

(declare-fun b!1009769 () Bool)

(declare-fun res!678350 () Bool)

(assert (=> b!1009769 (=> (not res!678350) (not e!568076))))

(declare-datatypes ((List!21309 0))(
  ( (Nil!21306) (Cons!21305 (h!22494 (_ BitVec 64)) (t!30310 List!21309)) )
))
(declare-fun arrayNoDuplicates!0 (array!63627 (_ BitVec 32) List!21309) Bool)

(assert (=> b!1009769 (= res!678350 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21306))))

(declare-fun b!1009770 () Bool)

(declare-fun e!568077 () Bool)

(assert (=> b!1009770 (= e!568080 e!568077)))

(declare-fun res!678363 () Bool)

(assert (=> b!1009770 (=> (not res!678363) (not e!568077))))

(declare-fun lt!446302 () SeekEntryResult!9565)

(assert (=> b!1009770 (= res!678363 (= lt!446302 lt!446303))))

(assert (=> b!1009770 (= lt!446302 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30633 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009771 () Bool)

(declare-fun res!678362 () Bool)

(assert (=> b!1009771 (=> (not res!678362) (not e!568076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63627 (_ BitVec 32)) Bool)

(assert (=> b!1009771 (= res!678362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009772 () Bool)

(declare-fun res!678354 () Bool)

(assert (=> b!1009772 (=> (not res!678354) (not e!568079))))

(assert (=> b!1009772 (= res!678354 (and (= (size!31135 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31135 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31135 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009773 () Bool)

(assert (=> b!1009773 (= e!568077 e!568081)))

(declare-fun res!678360 () Bool)

(assert (=> b!1009773 (=> (not res!678360) (not e!568081))))

(declare-fun lt!446301 () (_ BitVec 64))

(declare-fun lt!446305 () array!63627)

(assert (=> b!1009773 (= res!678360 (not (= lt!446307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446301 mask!3464) lt!446301 lt!446305 mask!3464))))))

(assert (=> b!1009773 (= lt!446301 (select (store (arr!30633 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1009773 (= lt!446305 (array!63628 (store (arr!30633 a!3219) i!1194 k!2224) (size!31135 a!3219)))))

(declare-fun b!1009774 () Bool)

(declare-fun res!678351 () Bool)

(assert (=> b!1009774 (=> (not res!678351) (not e!568081))))

(assert (=> b!1009774 (= res!678351 (not (= lt!446302 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446301 lt!446305 mask!3464))))))

(declare-fun b!1009775 () Bool)

(declare-fun res!678359 () Bool)

(assert (=> b!1009775 (=> (not res!678359) (not e!568079))))

(declare-fun arrayContainsKey!0 (array!63627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009775 (= res!678359 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!87052 res!678361) b!1009772))

(assert (= (and b!1009772 res!678354) b!1009768))

(assert (= (and b!1009768 res!678358) b!1009762))

(assert (= (and b!1009762 res!678356) b!1009775))

(assert (= (and b!1009775 res!678359) b!1009767))

(assert (= (and b!1009767 res!678355) b!1009771))

(assert (= (and b!1009771 res!678362) b!1009769))

(assert (= (and b!1009769 res!678350) b!1009766))

(assert (= (and b!1009766 res!678352) b!1009763))

(assert (= (and b!1009763 res!678357) b!1009770))

(assert (= (and b!1009770 res!678363) b!1009773))

(assert (= (and b!1009773 res!678360) b!1009774))

(assert (= (and b!1009774 res!678351) b!1009764))

(assert (= (and b!1009764 res!678353) b!1009765))

(declare-fun m!934269 () Bool)

(assert (=> b!1009767 m!934269))

(declare-fun m!934271 () Bool)

(assert (=> b!1009765 m!934271))

(declare-fun m!934273 () Bool)

(assert (=> b!1009775 m!934273))

(declare-fun m!934275 () Bool)

(assert (=> b!1009762 m!934275))

(declare-fun m!934277 () Bool)

(assert (=> b!1009768 m!934277))

(assert (=> b!1009768 m!934277))

(declare-fun m!934279 () Bool)

(assert (=> b!1009768 m!934279))

(declare-fun m!934281 () Bool)

(assert (=> b!1009769 m!934281))

(declare-fun m!934283 () Bool)

(assert (=> b!1009773 m!934283))

(assert (=> b!1009773 m!934283))

(declare-fun m!934285 () Bool)

(assert (=> b!1009773 m!934285))

(declare-fun m!934287 () Bool)

(assert (=> b!1009773 m!934287))

(declare-fun m!934289 () Bool)

(assert (=> b!1009773 m!934289))

(assert (=> b!1009763 m!934277))

(assert (=> b!1009763 m!934277))

(declare-fun m!934291 () Bool)

(assert (=> b!1009763 m!934291))

(assert (=> b!1009763 m!934291))

(assert (=> b!1009763 m!934277))

(declare-fun m!934293 () Bool)

(assert (=> b!1009763 m!934293))

(declare-fun m!934295 () Bool)

(assert (=> start!87052 m!934295))

(declare-fun m!934297 () Bool)

(assert (=> start!87052 m!934297))

(assert (=> b!1009770 m!934277))

(assert (=> b!1009770 m!934277))

(declare-fun m!934299 () Bool)

(assert (=> b!1009770 m!934299))

(declare-fun m!934301 () Bool)

(assert (=> b!1009771 m!934301))

(declare-fun m!934303 () Bool)

(assert (=> b!1009774 m!934303))

(push 1)

(assert (not b!1009775))

(assert (not start!87052))

(assert (not b!1009765))

(assert (not b!1009769))

(assert (not b!1009762))

(assert (not b!1009774))

(assert (not b!1009770))

(assert (not b!1009771))

(assert (not b!1009768))

(assert (not b!1009767))

(assert (not b!1009773))

(assert (not b!1009763))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1009920 () Bool)

(declare-fun e!568170 () SeekEntryResult!9565)

(declare-fun e!568169 () SeekEntryResult!9565)

(assert (=> b!1009920 (= e!568170 e!568169)))

(declare-fun lt!446362 () (_ BitVec 64))

(declare-fun lt!446361 () SeekEntryResult!9565)

(assert (=> b!1009920 (= lt!446362 (select (arr!30633 a!3219) (index!40633 lt!446361)))))

(declare-fun c!101913 () Bool)

(assert (=> b!1009920 (= c!101913 (= lt!446362 k!2224))))

(declare-fun b!1009921 () Bool)

(assert (=> b!1009921 (= e!568169 (Found!9565 (index!40633 lt!446361)))))

(declare-fun d!119913 () Bool)

(declare-fun lt!446363 () SeekEntryResult!9565)

(assert (=> d!119913 (and (or (is-Undefined!9565 lt!446363) (not (is-Found!9565 lt!446363)) (and (bvsge (index!40632 lt!446363) #b00000000000000000000000000000000) (bvslt (index!40632 lt!446363) (size!31135 a!3219)))) (or (is-Undefined!9565 lt!446363) (is-Found!9565 lt!446363) (not (is-MissingZero!9565 lt!446363)) (and (bvsge (index!40631 lt!446363) #b00000000000000000000000000000000) (bvslt (index!40631 lt!446363) (size!31135 a!3219)))) (or (is-Undefined!9565 lt!446363) (is-Found!9565 lt!446363) (is-MissingZero!9565 lt!446363) (not (is-MissingVacant!9565 lt!446363)) (and (bvsge (index!40634 lt!446363) #b00000000000000000000000000000000) (bvslt (index!40634 lt!446363) (size!31135 a!3219)))) (or (is-Undefined!9565 lt!446363) (ite (is-Found!9565 lt!446363) (= (select (arr!30633 a!3219) (index!40632 lt!446363)) k!2224) (ite (is-MissingZero!9565 lt!446363) (= (select (arr!30633 a!3219) (index!40631 lt!446363)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9565 lt!446363) (= (select (arr!30633 a!3219) (index!40634 lt!446363)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119913 (= lt!446363 e!568170)))

(declare-fun c!101912 () Bool)

(assert (=> d!119913 (= c!101912 (and (is-Intermediate!9565 lt!446361) (undefined!10377 lt!446361)))))

(assert (=> d!119913 (= lt!446361 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119913 (validMask!0 mask!3464)))

(assert (=> d!119913 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!446363)))

(declare-fun e!568171 () SeekEntryResult!9565)

(declare-fun b!1009922 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63627 (_ BitVec 32)) SeekEntryResult!9565)

(assert (=> b!1009922 (= e!568171 (seekKeyOrZeroReturnVacant!0 (x!88024 lt!446361) (index!40633 lt!446361) (index!40633 lt!446361) k!2224 a!3219 mask!3464))))

(declare-fun b!1009923 () Bool)

(declare-fun c!101911 () Bool)

(assert (=> b!1009923 (= c!101911 (= lt!446362 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009923 (= e!568169 e!568171)))

(declare-fun b!1009924 () Bool)

(assert (=> b!1009924 (= e!568171 (MissingZero!9565 (index!40633 lt!446361)))))

(declare-fun b!1009925 () Bool)

(assert (=> b!1009925 (= e!568170 Undefined!9565)))

(assert (= (and d!119913 c!101912) b!1009925))

(assert (= (and d!119913 (not c!101912)) b!1009920))

(assert (= (and b!1009920 c!101913) b!1009921))

(assert (= (and b!1009920 (not c!101913)) b!1009923))

(assert (= (and b!1009923 c!101911) b!1009924))

(assert (= (and b!1009923 (not c!101911)) b!1009922))

(declare-fun m!934373 () Bool)

(assert (=> b!1009920 m!934373))

(assert (=> d!119913 m!934295))

(declare-fun m!934375 () Bool)

(assert (=> d!119913 m!934375))

(declare-fun m!934377 () Bool)

(assert (=> d!119913 m!934377))

(declare-fun m!934379 () Bool)

(assert (=> d!119913 m!934379))

(declare-fun m!934381 () Bool)

(assert (=> d!119913 m!934381))

(declare-fun m!934383 () Bool)

(assert (=> d!119913 m!934383))

(assert (=> d!119913 m!934375))

(declare-fun m!934385 () Bool)

(assert (=> b!1009922 m!934385))

(assert (=> b!1009767 d!119913))

(declare-fun b!1009956 () Bool)

(declare-fun e!568191 () Bool)

(declare-fun e!568189 () Bool)

(assert (=> b!1009956 (= e!568191 e!568189)))

(declare-fun res!678420 () Bool)

(declare-fun lt!446374 () SeekEntryResult!9565)

(assert (=> b!1009956 (= res!678420 (and (is-Intermediate!9565 lt!446374) (not (undefined!10377 lt!446374)) (bvslt (x!88024 lt!446374) #b01111111111111111111111111111110) (bvsge (x!88024 lt!446374) #b00000000000000000000000000000000) (bvsge (x!88024 lt!446374) #b00000000000000000000000000000000)))))

(assert (=> b!1009956 (=> (not res!678420) (not e!568189))))

(declare-fun e!568192 () SeekEntryResult!9565)

(declare-fun b!1009957 () Bool)

(assert (=> b!1009957 (= e!568192 (Intermediate!9565 true (toIndex!0 (select (arr!30633 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009958 () Bool)

(declare-fun e!568188 () SeekEntryResult!9565)

(assert (=> b!1009958 (= e!568192 e!568188)))

(declare-fun lt!446375 () (_ BitVec 64))

(declare-fun c!101928 () Bool)

(assert (=> b!1009958 (= c!101928 (or (= lt!446375 (select (arr!30633 a!3219) j!170)) (= (bvadd lt!446375 lt!446375) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009959 () Bool)

(assert (=> b!1009959 (= e!568188 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30633 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30633 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009960 () Bool)

(assert (=> b!1009960 (and (bvsge (index!40633 lt!446374) #b00000000000000000000000000000000) (bvslt (index!40633 lt!446374) (size!31135 a!3219)))))

(declare-fun e!568190 () Bool)

(assert (=> b!1009960 (= e!568190 (= (select (arr!30633 a!3219) (index!40633 lt!446374)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009961 () Bool)

(assert (=> b!1009961 (= e!568191 (bvsge (x!88024 lt!446374) #b01111111111111111111111111111110))))

(declare-fun b!1009962 () Bool)

(assert (=> b!1009962 (and (bvsge (index!40633 lt!446374) #b00000000000000000000000000000000) (bvslt (index!40633 lt!446374) (size!31135 a!3219)))))

(declare-fun res!678421 () Bool)

(assert (=> b!1009962 (= res!678421 (= (select (arr!30633 a!3219) (index!40633 lt!446374)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009962 (=> res!678421 e!568190)))

(declare-fun b!1009963 () Bool)

(assert (=> b!1009963 (= e!568188 (Intermediate!9565 false (toIndex!0 (select (arr!30633 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009964 () Bool)

(assert (=> b!1009964 (and (bvsge (index!40633 lt!446374) #b00000000000000000000000000000000) (bvslt (index!40633 lt!446374) (size!31135 a!3219)))))

(declare-fun res!678419 () Bool)

(assert (=> b!1009964 (= res!678419 (= (select (arr!30633 a!3219) (index!40633 lt!446374)) (select (arr!30633 a!3219) j!170)))))

(assert (=> b!1009964 (=> res!678419 e!568190)))

(assert (=> b!1009964 (= e!568189 e!568190)))

(declare-fun d!119925 () Bool)

(assert (=> d!119925 e!568191))

(declare-fun c!101926 () Bool)

(assert (=> d!119925 (= c!101926 (and (is-Intermediate!9565 lt!446374) (undefined!10377 lt!446374)))))

(assert (=> d!119925 (= lt!446374 e!568192)))

(declare-fun c!101927 () Bool)

(assert (=> d!119925 (= c!101927 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119925 (= lt!446375 (select (arr!30633 a!3219) (toIndex!0 (select (arr!30633 a!3219) j!170) mask!3464)))))

(assert (=> d!119925 (validMask!0 mask!3464)))

(assert (=> d!119925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30633 a!3219) j!170) mask!3464) (select (arr!30633 a!3219) j!170) a!3219 mask!3464) lt!446374)))

(assert (= (and d!119925 c!101927) b!1009957))

(assert (= (and d!119925 (not c!101927)) b!1009958))

(assert (= (and b!1009958 c!101928) b!1009963))

(assert (= (and b!1009958 (not c!101928)) b!1009959))

(assert (= (and d!119925 c!101926) b!1009961))

(assert (= (and d!119925 (not c!101926)) b!1009956))

(assert (= (and b!1009956 res!678420) b!1009964))

(assert (= (and b!1009964 (not res!678419)) b!1009962))

(assert (= (and b!1009962 (not res!678421)) b!1009960))

(assert (=> d!119925 m!934291))

(declare-fun m!934387 () Bool)

(assert (=> d!119925 m!934387))

(assert (=> d!119925 m!934295))

(assert (=> b!1009959 m!934291))

(declare-fun m!934389 () Bool)

(assert (=> b!1009959 m!934389))

(assert (=> b!1009959 m!934389))

(assert (=> b!1009959 m!934277))

(declare-fun m!934391 () Bool)

(assert (=> b!1009959 m!934391))

(declare-fun m!934393 () Bool)

(assert (=> b!1009964 m!934393))

(assert (=> b!1009962 m!934393))

(assert (=> b!1009960 m!934393))

(assert (=> b!1009763 d!119925))

(declare-fun d!119931 () Bool)

(declare-fun lt!446386 () (_ BitVec 32))

(declare-fun lt!446385 () (_ BitVec 32))

(assert (=> d!119931 (= lt!446386 (bvmul (bvxor lt!446385 (bvlshr lt!446385 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119931 (= lt!446385 ((_ extract 31 0) (bvand (bvxor (select (arr!30633 a!3219) j!170) (bvlshr (select (arr!30633 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119931 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!678422 (let ((h!22496 ((_ extract 31 0) (bvand (bvxor (select (arr!30633 a!3219) j!170) (bvlshr (select (arr!30633 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!88030 (bvmul (bvxor h!22496 (bvlshr h!22496 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!88030 (bvlshr x!88030 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!678422 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!678422 #b00000000000000000000000000000000))))))

(assert (=> d!119931 (= (toIndex!0 (select (arr!30633 a!3219) j!170) mask!3464) (bvand (bvxor lt!446386 (bvlshr lt!446386 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1009763 d!119931))

(declare-fun b!1009980 () Bool)

(declare-fun e!568204 () Bool)

(declare-fun e!568202 () Bool)

(assert (=> b!1009980 (= e!568204 e!568202)))

(declare-fun res!678427 () Bool)

(declare-fun lt!446387 () SeekEntryResult!9565)

(assert (=> b!1009980 (= res!678427 (and (is-Intermediate!9565 lt!446387) (not (undefined!10377 lt!446387)) (bvslt (x!88024 lt!446387) #b01111111111111111111111111111110) (bvsge (x!88024 lt!446387) #b00000000000000000000000000000000) (bvsge (x!88024 lt!446387) x!1245)))))

(assert (=> b!1009980 (=> (not res!678427) (not e!568202))))

(declare-fun b!1009981 () Bool)

(declare-fun e!568205 () SeekEntryResult!9565)

(assert (=> b!1009981 (= e!568205 (Intermediate!9565 true index!1507 x!1245))))

(declare-fun b!1009982 () Bool)

(declare-fun e!568201 () SeekEntryResult!9565)

(assert (=> b!1009982 (= e!568205 e!568201)))

(declare-fun c!101937 () Bool)

(declare-fun lt!446388 () (_ BitVec 64))

(assert (=> b!1009982 (= c!101937 (or (= lt!446388 lt!446301) (= (bvadd lt!446388 lt!446388) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009983 () Bool)

(assert (=> b!1009983 (= e!568201 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!446301 lt!446305 mask!3464))))

(declare-fun b!1009984 () Bool)

(assert (=> b!1009984 (and (bvsge (index!40633 lt!446387) #b00000000000000000000000000000000) (bvslt (index!40633 lt!446387) (size!31135 lt!446305)))))

(declare-fun e!568203 () Bool)

(assert (=> b!1009984 (= e!568203 (= (select (arr!30633 lt!446305) (index!40633 lt!446387)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009985 () Bool)

(assert (=> b!1009985 (= e!568204 (bvsge (x!88024 lt!446387) #b01111111111111111111111111111110))))

(declare-fun b!1009986 () Bool)

(assert (=> b!1009986 (and (bvsge (index!40633 lt!446387) #b00000000000000000000000000000000) (bvslt (index!40633 lt!446387) (size!31135 lt!446305)))))

(declare-fun res!678428 () Bool)

(assert (=> b!1009986 (= res!678428 (= (select (arr!30633 lt!446305) (index!40633 lt!446387)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009986 (=> res!678428 e!568203)))

(declare-fun b!1009987 () Bool)

(assert (=> b!1009987 (= e!568201 (Intermediate!9565 false index!1507 x!1245))))

(declare-fun b!1009988 () Bool)

(assert (=> b!1009988 (and (bvsge (index!40633 lt!446387) #b00000000000000000000000000000000) (bvslt (index!40633 lt!446387) (size!31135 lt!446305)))))

(declare-fun res!678426 () Bool)

(assert (=> b!1009988 (= res!678426 (= (select (arr!30633 lt!446305) (index!40633 lt!446387)) lt!446301))))

(assert (=> b!1009988 (=> res!678426 e!568203)))

(assert (=> b!1009988 (= e!568202 e!568203)))

(declare-fun d!119939 () Bool)

(assert (=> d!119939 e!568204))

(declare-fun c!101935 () Bool)

(assert (=> d!119939 (= c!101935 (and (is-Intermediate!9565 lt!446387) (undefined!10377 lt!446387)))))

(assert (=> d!119939 (= lt!446387 e!568205)))

(declare-fun c!101936 () Bool)

(assert (=> d!119939 (= c!101936 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119939 (= lt!446388 (select (arr!30633 lt!446305) index!1507))))

(assert (=> d!119939 (validMask!0 mask!3464)))

(assert (=> d!119939 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446301 lt!446305 mask!3464) lt!446387)))

(assert (= (and d!119939 c!101936) b!1009981))

(assert (= (and d!119939 (not c!101936)) b!1009982))

(assert (= (and b!1009982 c!101937) b!1009987))

(assert (= (and b!1009982 (not c!101937)) b!1009983))

(assert (= (and d!119939 c!101935) b!1009985))

(assert (= (and d!119939 (not c!101935)) b!1009980))

(assert (= (and b!1009980 res!678427) b!1009988))

(assert (= (and b!1009988 (not res!678426)) b!1009986))

(assert (= (and b!1009986 (not res!678428)) b!1009984))

(declare-fun m!934417 () Bool)

(assert (=> d!119939 m!934417))

(assert (=> d!119939 m!934295))

(assert (=> b!1009983 m!934271))

(assert (=> b!1009983 m!934271))

(declare-fun m!934419 () Bool)

(assert (=> b!1009983 m!934419))

(declare-fun m!934421 () Bool)

(assert (=> b!1009988 m!934421))

(assert (=> b!1009986 m!934421))

(assert (=> b!1009984 m!934421))

(assert (=> b!1009774 d!119939))

(declare-fun d!119941 () Bool)

(declare-fun res!678434 () Bool)

(declare-fun e!568210 () Bool)

(assert (=> d!119941 (=> res!678434 e!568210)))

(assert (=> d!119941 (= res!678434 (= (select (arr!30633 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119941 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!568210)))

(declare-fun b!1009993 () Bool)

(declare-fun e!568211 () Bool)

(assert (=> b!1009993 (= e!568210 e!568211)))

(declare-fun res!678435 () Bool)

(assert (=> b!1009993 (=> (not res!678435) (not e!568211))))

(assert (=> b!1009993 (= res!678435 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31135 a!3219)))))

(declare-fun b!1009994 () Bool)

(assert (=> b!1009994 (= e!568211 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119941 (not res!678434)) b!1009993))

(assert (= (and b!1009993 res!678435) b!1009994))

(declare-fun m!934423 () Bool)

(assert (=> d!119941 m!934423))

(declare-fun m!934425 () Bool)

(assert (=> b!1009994 m!934425))

(assert (=> b!1009775 d!119941))

(declare-fun d!119943 () Bool)

(declare-fun lt!446397 () (_ BitVec 32))

(assert (=> d!119943 (and (bvsge lt!446397 #b00000000000000000000000000000000) (bvslt lt!446397 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!119943 (= lt!446397 (choose!52 index!1507 x!1245 mask!3464))))

(assert (=> d!119943 (validMask!0 mask!3464)))

(assert (=> d!119943 (= (nextIndex!0 index!1507 x!1245 mask!3464) lt!446397)))

(declare-fun bs!28714 () Bool)

(assert (= bs!28714 d!119943))

(declare-fun m!934427 () Bool)

(assert (=> bs!28714 m!934427))

(assert (=> bs!28714 m!934295))

(assert (=> b!1009765 d!119943))

(declare-fun d!119947 () Bool)

(declare-fun res!678453 () Bool)

(declare-fun e!568237 () Bool)

(assert (=> d!119947 (=> res!678453 e!568237)))

(assert (=> d!119947 (= res!678453 (bvsge #b00000000000000000000000000000000 (size!31135 a!3219)))))

(assert (=> d!119947 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!568237)))

(declare-fun b!1010027 () Bool)

(declare-fun e!568235 () Bool)

(declare-fun call!42399 () Bool)

(assert (=> b!1010027 (= e!568235 call!42399)))

(declare-fun b!1010028 () Bool)

(declare-fun e!568236 () Bool)

(assert (=> b!1010028 (= e!568236 e!568235)))

(declare-fun lt!446409 () (_ BitVec 64))

(assert (=> b!1010028 (= lt!446409 (select (arr!30633 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33024 0))(
  ( (Unit!33025) )
))
(declare-fun lt!446410 () Unit!33024)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63627 (_ BitVec 64) (_ BitVec 32)) Unit!33024)

(assert (=> b!1010028 (= lt!446410 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446409 #b00000000000000000000000000000000))))

(assert (=> b!1010028 (arrayContainsKey!0 a!3219 lt!446409 #b00000000000000000000000000000000)))

(declare-fun lt!446411 () Unit!33024)

(assert (=> b!1010028 (= lt!446411 lt!446410)))

(declare-fun res!678452 () Bool)

(assert (=> b!1010028 (= res!678452 (= (seekEntryOrOpen!0 (select (arr!30633 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9565 #b00000000000000000000000000000000)))))

(assert (=> b!1010028 (=> (not res!678452) (not e!568235))))

(declare-fun b!1010029 () Bool)

(assert (=> b!1010029 (= e!568236 call!42399)))

