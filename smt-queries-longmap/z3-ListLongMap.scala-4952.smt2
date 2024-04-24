; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68256 () Bool)

(assert start!68256)

(declare-fun b!792902 () Bool)

(declare-fun res!537192 () Bool)

(declare-fun e!440621 () Bool)

(assert (=> b!792902 (=> (not res!537192) (not e!440621))))

(declare-datatypes ((array!43004 0))(
  ( (array!43005 (arr!20581 (Array (_ BitVec 32) (_ BitVec 64))) (size!21001 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43004)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792902 (= res!537192 (and (= (size!21001 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21001 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21001 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792903 () Bool)

(declare-fun res!537198 () Bool)

(assert (=> b!792903 (=> (not res!537198) (not e!440621))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792903 (= res!537198 (validKeyInArray!0 (select (arr!20581 a!3170) j!153)))))

(declare-fun b!792904 () Bool)

(declare-fun res!537197 () Bool)

(declare-fun e!440622 () Bool)

(assert (=> b!792904 (=> (not res!537197) (not e!440622))))

(assert (=> b!792904 (= res!537197 (and (bvsle #b00000000000000000000000000000000 (size!21001 a!3170)) (bvslt (size!21001 a!3170) #b01111111111111111111111111111111)))))

(declare-fun b!792905 () Bool)

(declare-fun res!537195 () Bool)

(assert (=> b!792905 (=> (not res!537195) (not e!440622))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43004 (_ BitVec 32)) Bool)

(assert (=> b!792905 (= res!537195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!537191 () Bool)

(assert (=> start!68256 (=> (not res!537191) (not e!440621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68256 (= res!537191 (validMask!0 mask!3266))))

(assert (=> start!68256 e!440621))

(assert (=> start!68256 true))

(declare-fun array_inv!16440 (array!43004) Bool)

(assert (=> start!68256 (array_inv!16440 a!3170)))

(declare-fun b!792906 () Bool)

(declare-fun res!537196 () Bool)

(assert (=> b!792906 (=> (not res!537196) (not e!440621))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!792906 (= res!537196 (validKeyInArray!0 k0!2044))))

(declare-fun b!792907 () Bool)

(assert (=> b!792907 (= e!440621 e!440622)))

(declare-fun res!537193 () Bool)

(assert (=> b!792907 (=> (not res!537193) (not e!440622))))

(declare-datatypes ((SeekEntryResult!8128 0))(
  ( (MissingZero!8128 (index!34880 (_ BitVec 32))) (Found!8128 (index!34881 (_ BitVec 32))) (Intermediate!8128 (undefined!8940 Bool) (index!34882 (_ BitVec 32)) (x!65993 (_ BitVec 32))) (Undefined!8128) (MissingVacant!8128 (index!34883 (_ BitVec 32))) )
))
(declare-fun lt!353695 () SeekEntryResult!8128)

(assert (=> b!792907 (= res!537193 (or (= lt!353695 (MissingZero!8128 i!1163)) (= lt!353695 (MissingVacant!8128 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43004 (_ BitVec 32)) SeekEntryResult!8128)

(assert (=> b!792907 (= lt!353695 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!792908 () Bool)

(declare-fun res!537194 () Bool)

(assert (=> b!792908 (=> (not res!537194) (not e!440621))))

(declare-fun arrayContainsKey!0 (array!43004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792908 (= res!537194 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792909 () Bool)

(declare-datatypes ((List!14451 0))(
  ( (Nil!14448) (Cons!14447 (h!15582 (_ BitVec 64)) (t!20758 List!14451)) )
))
(declare-fun noDuplicate!1288 (List!14451) Bool)

(assert (=> b!792909 (= e!440622 (not (noDuplicate!1288 Nil!14448)))))

(assert (= (and start!68256 res!537191) b!792902))

(assert (= (and b!792902 res!537192) b!792903))

(assert (= (and b!792903 res!537198) b!792906))

(assert (= (and b!792906 res!537196) b!792908))

(assert (= (and b!792908 res!537194) b!792907))

(assert (= (and b!792907 res!537193) b!792905))

(assert (= (and b!792905 res!537195) b!792904))

(assert (= (and b!792904 res!537197) b!792909))

(declare-fun m!733955 () Bool)

(assert (=> start!68256 m!733955))

(declare-fun m!733957 () Bool)

(assert (=> start!68256 m!733957))

(declare-fun m!733959 () Bool)

(assert (=> b!792907 m!733959))

(declare-fun m!733961 () Bool)

(assert (=> b!792908 m!733961))

(declare-fun m!733963 () Bool)

(assert (=> b!792905 m!733963))

(declare-fun m!733965 () Bool)

(assert (=> b!792906 m!733965))

(declare-fun m!733967 () Bool)

(assert (=> b!792903 m!733967))

(assert (=> b!792903 m!733967))

(declare-fun m!733969 () Bool)

(assert (=> b!792903 m!733969))

(declare-fun m!733971 () Bool)

(assert (=> b!792909 m!733971))

(check-sat (not b!792908) (not b!792907) (not b!792905) (not b!792906) (not b!792903) (not b!792909) (not start!68256))
(check-sat)
(get-model)

(declare-fun d!103437 () Bool)

(declare-fun res!537251 () Bool)

(declare-fun e!440646 () Bool)

(assert (=> d!103437 (=> res!537251 e!440646)))

(get-info :version)

(assert (=> d!103437 (= res!537251 ((_ is Nil!14448) Nil!14448))))

(assert (=> d!103437 (= (noDuplicate!1288 Nil!14448) e!440646)))

(declare-fun b!792962 () Bool)

(declare-fun e!440647 () Bool)

(assert (=> b!792962 (= e!440646 e!440647)))

(declare-fun res!537252 () Bool)

(assert (=> b!792962 (=> (not res!537252) (not e!440647))))

(declare-fun contains!4092 (List!14451 (_ BitVec 64)) Bool)

(assert (=> b!792962 (= res!537252 (not (contains!4092 (t!20758 Nil!14448) (h!15582 Nil!14448))))))

(declare-fun b!792963 () Bool)

(assert (=> b!792963 (= e!440647 (noDuplicate!1288 (t!20758 Nil!14448)))))

(assert (= (and d!103437 (not res!537251)) b!792962))

(assert (= (and b!792962 res!537252) b!792963))

(declare-fun m!734009 () Bool)

(assert (=> b!792962 m!734009))

(declare-fun m!734011 () Bool)

(assert (=> b!792963 m!734011))

(assert (=> b!792909 d!103437))

(declare-fun d!103439 () Bool)

(assert (=> d!103439 (= (validKeyInArray!0 (select (arr!20581 a!3170) j!153)) (and (not (= (select (arr!20581 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20581 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792903 d!103439))

(declare-fun d!103441 () Bool)

(declare-fun res!537257 () Bool)

(declare-fun e!440652 () Bool)

(assert (=> d!103441 (=> res!537257 e!440652)))

(assert (=> d!103441 (= res!537257 (= (select (arr!20581 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!103441 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!440652)))

(declare-fun b!792968 () Bool)

(declare-fun e!440653 () Bool)

(assert (=> b!792968 (= e!440652 e!440653)))

(declare-fun res!537258 () Bool)

(assert (=> b!792968 (=> (not res!537258) (not e!440653))))

(assert (=> b!792968 (= res!537258 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21001 a!3170)))))

(declare-fun b!792969 () Bool)

(assert (=> b!792969 (= e!440653 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103441 (not res!537257)) b!792968))

(assert (= (and b!792968 res!537258) b!792969))

(declare-fun m!734013 () Bool)

(assert (=> d!103441 m!734013))

(declare-fun m!734015 () Bool)

(assert (=> b!792969 m!734015))

(assert (=> b!792908 d!103441))

(declare-fun b!792994 () Bool)

(declare-fun e!440677 () Bool)

(declare-fun e!440678 () Bool)

(assert (=> b!792994 (= e!440677 e!440678)))

(declare-fun lt!353710 () (_ BitVec 64))

(assert (=> b!792994 (= lt!353710 (select (arr!20581 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27433 0))(
  ( (Unit!27434) )
))
(declare-fun lt!353709 () Unit!27433)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!43004 (_ BitVec 64) (_ BitVec 32)) Unit!27433)

(assert (=> b!792994 (= lt!353709 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!353710 #b00000000000000000000000000000000))))

(assert (=> b!792994 (arrayContainsKey!0 a!3170 lt!353710 #b00000000000000000000000000000000)))

(declare-fun lt!353708 () Unit!27433)

(assert (=> b!792994 (= lt!353708 lt!353709)))

(declare-fun res!537280 () Bool)

(assert (=> b!792994 (= res!537280 (= (seekEntryOrOpen!0 (select (arr!20581 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8128 #b00000000000000000000000000000000)))))

(assert (=> b!792994 (=> (not res!537280) (not e!440678))))

(declare-fun b!792995 () Bool)

(declare-fun e!440676 () Bool)

(assert (=> b!792995 (= e!440676 e!440677)))

(declare-fun c!88271 () Bool)

(assert (=> b!792995 (= c!88271 (validKeyInArray!0 (select (arr!20581 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!792996 () Bool)

(declare-fun call!35358 () Bool)

(assert (=> b!792996 (= e!440678 call!35358)))

(declare-fun bm!35355 () Bool)

(assert (=> bm!35355 (= call!35358 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun d!103443 () Bool)

(declare-fun res!537279 () Bool)

(assert (=> d!103443 (=> res!537279 e!440676)))

(assert (=> d!103443 (= res!537279 (bvsge #b00000000000000000000000000000000 (size!21001 a!3170)))))

(assert (=> d!103443 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!440676)))

(declare-fun b!792997 () Bool)

(assert (=> b!792997 (= e!440677 call!35358)))

(assert (= (and d!103443 (not res!537279)) b!792995))

(assert (= (and b!792995 c!88271) b!792994))

(assert (= (and b!792995 (not c!88271)) b!792997))

(assert (= (and b!792994 res!537280) b!792996))

(assert (= (or b!792996 b!792997) bm!35355))

(assert (=> b!792994 m!734013))

(declare-fun m!734029 () Bool)

(assert (=> b!792994 m!734029))

(declare-fun m!734031 () Bool)

(assert (=> b!792994 m!734031))

(assert (=> b!792994 m!734013))

(declare-fun m!734033 () Bool)

(assert (=> b!792994 m!734033))

(assert (=> b!792995 m!734013))

(assert (=> b!792995 m!734013))

(declare-fun m!734035 () Bool)

(assert (=> b!792995 m!734035))

(declare-fun m!734037 () Bool)

(assert (=> bm!35355 m!734037))

(assert (=> b!792905 d!103443))

(declare-fun d!103457 () Bool)

(assert (=> d!103457 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792906 d!103457))

(declare-fun d!103459 () Bool)

(assert (=> d!103459 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!68256 d!103459))

(declare-fun d!103467 () Bool)

(assert (=> d!103467 (= (array_inv!16440 a!3170) (bvsge (size!21001 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!68256 d!103467))

(declare-fun b!793046 () Bool)

(declare-fun c!88292 () Bool)

(declare-fun lt!353741 () (_ BitVec 64))

(assert (=> b!793046 (= c!88292 (= lt!353741 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!440707 () SeekEntryResult!8128)

(declare-fun e!440708 () SeekEntryResult!8128)

(assert (=> b!793046 (= e!440707 e!440708)))

(declare-fun b!793047 () Bool)

(declare-fun lt!353739 () SeekEntryResult!8128)

(assert (=> b!793047 (= e!440707 (Found!8128 (index!34882 lt!353739)))))

(declare-fun b!793048 () Bool)

(assert (=> b!793048 (= e!440708 (MissingZero!8128 (index!34882 lt!353739)))))

(declare-fun b!793049 () Bool)

(declare-fun e!440709 () SeekEntryResult!8128)

(assert (=> b!793049 (= e!440709 Undefined!8128)))

(declare-fun b!793050 () Bool)

(assert (=> b!793050 (= e!440709 e!440707)))

(assert (=> b!793050 (= lt!353741 (select (arr!20581 a!3170) (index!34882 lt!353739)))))

(declare-fun c!88294 () Bool)

(assert (=> b!793050 (= c!88294 (= lt!353741 k0!2044))))

(declare-fun d!103473 () Bool)

(declare-fun lt!353740 () SeekEntryResult!8128)

(assert (=> d!103473 (and (or ((_ is Undefined!8128) lt!353740) (not ((_ is Found!8128) lt!353740)) (and (bvsge (index!34881 lt!353740) #b00000000000000000000000000000000) (bvslt (index!34881 lt!353740) (size!21001 a!3170)))) (or ((_ is Undefined!8128) lt!353740) ((_ is Found!8128) lt!353740) (not ((_ is MissingZero!8128) lt!353740)) (and (bvsge (index!34880 lt!353740) #b00000000000000000000000000000000) (bvslt (index!34880 lt!353740) (size!21001 a!3170)))) (or ((_ is Undefined!8128) lt!353740) ((_ is Found!8128) lt!353740) ((_ is MissingZero!8128) lt!353740) (not ((_ is MissingVacant!8128) lt!353740)) (and (bvsge (index!34883 lt!353740) #b00000000000000000000000000000000) (bvslt (index!34883 lt!353740) (size!21001 a!3170)))) (or ((_ is Undefined!8128) lt!353740) (ite ((_ is Found!8128) lt!353740) (= (select (arr!20581 a!3170) (index!34881 lt!353740)) k0!2044) (ite ((_ is MissingZero!8128) lt!353740) (= (select (arr!20581 a!3170) (index!34880 lt!353740)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8128) lt!353740) (= (select (arr!20581 a!3170) (index!34883 lt!353740)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!103473 (= lt!353740 e!440709)))

(declare-fun c!88293 () Bool)

(assert (=> d!103473 (= c!88293 (and ((_ is Intermediate!8128) lt!353739) (undefined!8940 lt!353739)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43004 (_ BitVec 32)) SeekEntryResult!8128)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103473 (= lt!353739 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!103473 (validMask!0 mask!3266)))

(assert (=> d!103473 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!353740)))

(declare-fun b!793051 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43004 (_ BitVec 32)) SeekEntryResult!8128)

(assert (=> b!793051 (= e!440708 (seekKeyOrZeroReturnVacant!0 (x!65993 lt!353739) (index!34882 lt!353739) (index!34882 lt!353739) k0!2044 a!3170 mask!3266))))

(assert (= (and d!103473 c!88293) b!793049))

(assert (= (and d!103473 (not c!88293)) b!793050))

(assert (= (and b!793050 c!88294) b!793047))

(assert (= (and b!793050 (not c!88294)) b!793046))

(assert (= (and b!793046 c!88292) b!793048))

(assert (= (and b!793046 (not c!88292)) b!793051))

(declare-fun m!734055 () Bool)

(assert (=> b!793050 m!734055))

(declare-fun m!734061 () Bool)

(assert (=> d!103473 m!734061))

(declare-fun m!734063 () Bool)

(assert (=> d!103473 m!734063))

(declare-fun m!734065 () Bool)

(assert (=> d!103473 m!734065))

(assert (=> d!103473 m!734063))

(declare-fun m!734069 () Bool)

(assert (=> d!103473 m!734069))

(declare-fun m!734073 () Bool)

(assert (=> d!103473 m!734073))

(assert (=> d!103473 m!733955))

(declare-fun m!734077 () Bool)

(assert (=> b!793051 m!734077))

(assert (=> b!792907 d!103473))

(check-sat (not d!103473) (not b!792969) (not b!792995) (not b!792962) (not bm!35355) (not b!792994) (not b!792963) (not b!793051))
(check-sat)
