; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56098 () Bool)

(assert start!56098)

(declare-fun b!618998 () Bool)

(declare-fun e!355002 () Bool)

(declare-fun e!354997 () Bool)

(assert (=> b!618998 (= e!355002 (not e!354997))))

(declare-fun res!398836 () Bool)

(assert (=> b!618998 (=> res!398836 e!354997)))

(declare-datatypes ((SeekEntryResult!6470 0))(
  ( (MissingZero!6470 (index!28164 (_ BitVec 32))) (Found!6470 (index!28165 (_ BitVec 32))) (Intermediate!6470 (undefined!7282 Bool) (index!28166 (_ BitVec 32)) (x!56950 (_ BitVec 32))) (Undefined!6470) (MissingVacant!6470 (index!28167 (_ BitVec 32))) )
))
(declare-fun lt!285571 () SeekEntryResult!6470)

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!618998 (= res!398836 (not (= lt!285571 (MissingVacant!6470 vacantSpotIndex!68))))))

(declare-datatypes ((Unit!20428 0))(
  ( (Unit!20429) )
))
(declare-fun lt!285560 () Unit!20428)

(declare-fun e!355000 () Unit!20428)

(assert (=> b!618998 (= lt!285560 e!355000)))

(declare-fun c!70455 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!618998 (= c!70455 (= lt!285571 (Found!6470 index!984)))))

(declare-fun lt!285562 () Unit!20428)

(declare-fun e!354991 () Unit!20428)

(assert (=> b!618998 (= lt!285562 e!354991)))

(declare-fun c!70457 () Bool)

(assert (=> b!618998 (= c!70457 (= lt!285571 Undefined!6470))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!285564 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!37568 0))(
  ( (array!37569 (arr!18030 (Array (_ BitVec 32) (_ BitVec 64))) (size!18394 (_ BitVec 32))) )
))
(declare-fun lt!285558 () array!37568)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37568 (_ BitVec 32)) SeekEntryResult!6470)

(assert (=> b!618998 (= lt!285571 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!285564 lt!285558 mask!3053))))

(declare-fun e!354995 () Bool)

(assert (=> b!618998 e!354995))

(declare-fun res!398835 () Bool)

(assert (=> b!618998 (=> (not res!398835) (not e!354995))))

(declare-fun lt!285569 () SeekEntryResult!6470)

(declare-fun lt!285572 () (_ BitVec 32))

(assert (=> b!618998 (= res!398835 (= lt!285569 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285572 vacantSpotIndex!68 lt!285564 lt!285558 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun a!2986 () array!37568)

(assert (=> b!618998 (= lt!285569 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!285572 vacantSpotIndex!68 (select (arr!18030 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(assert (=> b!618998 (= lt!285564 (select (store (arr!18030 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!285561 () Unit!20428)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37568 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20428)

(assert (=> b!618998 (= lt!285561 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!285572 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!618998 (= lt!285572 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!618999 () Bool)

(declare-fun e!354992 () Bool)

(declare-fun arrayContainsKey!0 (array!37568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!618999 (= e!354992 (arrayContainsKey!0 lt!285558 (select (arr!18030 a!2986) j!136) index!984))))

(declare-fun b!619000 () Bool)

(assert (=> b!619000 false))

(declare-fun lt!285565 () Unit!20428)

(declare-datatypes ((List!12071 0))(
  ( (Nil!12068) (Cons!12067 (h!13112 (_ BitVec 64)) (t!18299 List!12071)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37568 (_ BitVec 64) (_ BitVec 32) List!12071) Unit!20428)

(assert (=> b!619000 (= lt!285565 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285558 (select (arr!18030 a!2986) j!136) index!984 Nil!12068))))

(declare-fun arrayNoDuplicates!0 (array!37568 (_ BitVec 32) List!12071) Bool)

(assert (=> b!619000 (arrayNoDuplicates!0 lt!285558 index!984 Nil!12068)))

(declare-fun lt!285570 () Unit!20428)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37568 (_ BitVec 32) (_ BitVec 32)) Unit!20428)

(assert (=> b!619000 (= lt!285570 (lemmaNoDuplicateFromThenFromBigger!0 lt!285558 #b00000000000000000000000000000000 index!984))))

(assert (=> b!619000 (arrayNoDuplicates!0 lt!285558 #b00000000000000000000000000000000 Nil!12068)))

(declare-fun lt!285577 () Unit!20428)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37568 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12071) Unit!20428)

(assert (=> b!619000 (= lt!285577 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12068))))

(assert (=> b!619000 (arrayContainsKey!0 lt!285558 (select (arr!18030 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!285576 () Unit!20428)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37568 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20428)

(assert (=> b!619000 (= lt!285576 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285558 (select (arr!18030 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!619000 e!354992))

(declare-fun res!398840 () Bool)

(assert (=> b!619000 (=> (not res!398840) (not e!354992))))

(assert (=> b!619000 (= res!398840 (arrayContainsKey!0 lt!285558 (select (arr!18030 a!2986) j!136) j!136))))

(declare-fun e!354989 () Unit!20428)

(declare-fun Unit!20430 () Unit!20428)

(assert (=> b!619000 (= e!354989 Unit!20430)))

(declare-fun b!619001 () Bool)

(declare-fun res!398837 () Bool)

(declare-fun e!354990 () Bool)

(assert (=> b!619001 (=> (not res!398837) (not e!354990))))

(assert (=> b!619001 (= res!398837 (and (= (size!18394 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18394 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18394 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!619002 () Bool)

(assert (=> b!619002 (= e!354997 true)))

(assert (=> b!619002 (= (select (store (arr!18030 a!2986) i!1108 k!1786) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!619003 () Bool)

(declare-fun res!398827 () Bool)

(assert (=> b!619003 (= res!398827 (bvsge j!136 index!984))))

(declare-fun e!354996 () Bool)

(assert (=> b!619003 (=> res!398827 e!354996)))

(declare-fun e!355001 () Bool)

(assert (=> b!619003 (= e!355001 e!354996)))

(declare-fun b!619004 () Bool)

(declare-fun lt!285567 () SeekEntryResult!6470)

(assert (=> b!619004 (= e!354995 (= lt!285567 lt!285569))))

(declare-fun b!619005 () Bool)

(declare-fun res!398828 () Bool)

(assert (=> b!619005 (=> (not res!398828) (not e!354990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!619005 (= res!398828 (validKeyInArray!0 k!1786))))

(declare-fun e!354999 () Bool)

(declare-fun b!619006 () Bool)

(assert (=> b!619006 (= e!354999 (arrayContainsKey!0 lt!285558 (select (arr!18030 a!2986) j!136) index!984))))

(declare-fun b!619007 () Bool)

(declare-fun Unit!20431 () Unit!20428)

(assert (=> b!619007 (= e!354991 Unit!20431)))

(assert (=> b!619007 false))

(declare-fun res!398831 () Bool)

(assert (=> start!56098 (=> (not res!398831) (not e!354990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56098 (= res!398831 (validMask!0 mask!3053))))

(assert (=> start!56098 e!354990))

(assert (=> start!56098 true))

(declare-fun array_inv!13826 (array!37568) Bool)

(assert (=> start!56098 (array_inv!13826 a!2986)))

(declare-fun b!619008 () Bool)

(declare-fun res!398839 () Bool)

(assert (=> b!619008 (=> (not res!398839) (not e!354990))))

(assert (=> b!619008 (= res!398839 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!619009 () Bool)

(declare-fun res!398826 () Bool)

(declare-fun e!354993 () Bool)

(assert (=> b!619009 (=> (not res!398826) (not e!354993))))

(assert (=> b!619009 (= res!398826 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18030 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!619010 () Bool)

(assert (=> b!619010 false))

(declare-fun lt!285563 () Unit!20428)

(assert (=> b!619010 (= lt!285563 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!285558 (select (arr!18030 a!2986) j!136) j!136 Nil!12068))))

(assert (=> b!619010 (arrayNoDuplicates!0 lt!285558 j!136 Nil!12068)))

(declare-fun lt!285575 () Unit!20428)

(assert (=> b!619010 (= lt!285575 (lemmaNoDuplicateFromThenFromBigger!0 lt!285558 #b00000000000000000000000000000000 j!136))))

(assert (=> b!619010 (arrayNoDuplicates!0 lt!285558 #b00000000000000000000000000000000 Nil!12068)))

(declare-fun lt!285573 () Unit!20428)

(assert (=> b!619010 (= lt!285573 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12068))))

(assert (=> b!619010 (arrayContainsKey!0 lt!285558 (select (arr!18030 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!285559 () Unit!20428)

(assert (=> b!619010 (= lt!285559 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!285558 (select (arr!18030 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!354994 () Unit!20428)

(declare-fun Unit!20432 () Unit!20428)

(assert (=> b!619010 (= e!354994 Unit!20432)))

(declare-fun b!619011 () Bool)

(declare-fun Unit!20433 () Unit!20428)

(assert (=> b!619011 (= e!354989 Unit!20433)))

(declare-fun b!619012 () Bool)

(declare-fun res!398834 () Bool)

(assert (=> b!619012 (=> (not res!398834) (not e!354993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37568 (_ BitVec 32)) Bool)

(assert (=> b!619012 (= res!398834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!619013 () Bool)

(declare-fun Unit!20434 () Unit!20428)

(assert (=> b!619013 (= e!354994 Unit!20434)))

(declare-fun res!398829 () Bool)

(declare-fun b!619014 () Bool)

(assert (=> b!619014 (= res!398829 (arrayContainsKey!0 lt!285558 (select (arr!18030 a!2986) j!136) j!136))))

(assert (=> b!619014 (=> (not res!398829) (not e!354999))))

(assert (=> b!619014 (= e!354996 e!354999)))

(declare-fun b!619015 () Bool)

(declare-fun Unit!20435 () Unit!20428)

(assert (=> b!619015 (= e!354991 Unit!20435)))

(declare-fun b!619016 () Bool)

(declare-fun Unit!20436 () Unit!20428)

(assert (=> b!619016 (= e!355000 Unit!20436)))

(declare-fun res!398838 () Bool)

(assert (=> b!619016 (= res!398838 (= (select (store (arr!18030 a!2986) i!1108 k!1786) index!984) (select (arr!18030 a!2986) j!136)))))

(assert (=> b!619016 (=> (not res!398838) (not e!355001))))

(assert (=> b!619016 e!355001))

(declare-fun c!70454 () Bool)

(assert (=> b!619016 (= c!70454 (bvslt j!136 index!984))))

(declare-fun lt!285566 () Unit!20428)

(assert (=> b!619016 (= lt!285566 e!354994)))

(declare-fun c!70456 () Bool)

(assert (=> b!619016 (= c!70456 (bvslt index!984 j!136))))

(declare-fun lt!285568 () Unit!20428)

(assert (=> b!619016 (= lt!285568 e!354989)))

(assert (=> b!619016 false))

(declare-fun b!619017 () Bool)

(declare-fun Unit!20437 () Unit!20428)

(assert (=> b!619017 (= e!355000 Unit!20437)))

(declare-fun b!619018 () Bool)

(declare-fun res!398824 () Bool)

(assert (=> b!619018 (=> (not res!398824) (not e!354993))))

(assert (=> b!619018 (= res!398824 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12068))))

(declare-fun b!619019 () Bool)

(declare-fun res!398832 () Bool)

(assert (=> b!619019 (=> (not res!398832) (not e!354990))))

(assert (=> b!619019 (= res!398832 (validKeyInArray!0 (select (arr!18030 a!2986) j!136)))))

(declare-fun b!619020 () Bool)

(declare-fun e!354988 () Bool)

(assert (=> b!619020 (= e!354993 e!354988)))

(declare-fun res!398825 () Bool)

(assert (=> b!619020 (=> (not res!398825) (not e!354988))))

(assert (=> b!619020 (= res!398825 (= (select (store (arr!18030 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!619020 (= lt!285558 (array!37569 (store (arr!18030 a!2986) i!1108 k!1786) (size!18394 a!2986)))))

(declare-fun b!619021 () Bool)

(assert (=> b!619021 (= e!354990 e!354993)))

(declare-fun res!398830 () Bool)

(assert (=> b!619021 (=> (not res!398830) (not e!354993))))

(declare-fun lt!285574 () SeekEntryResult!6470)

(assert (=> b!619021 (= res!398830 (or (= lt!285574 (MissingZero!6470 i!1108)) (= lt!285574 (MissingVacant!6470 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37568 (_ BitVec 32)) SeekEntryResult!6470)

(assert (=> b!619021 (= lt!285574 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!619022 () Bool)

(assert (=> b!619022 (= e!354988 e!355002)))

(declare-fun res!398833 () Bool)

(assert (=> b!619022 (=> (not res!398833) (not e!355002))))

(assert (=> b!619022 (= res!398833 (and (= lt!285567 (Found!6470 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18030 a!2986) index!984) (select (arr!18030 a!2986) j!136))) (not (= (select (arr!18030 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!619022 (= lt!285567 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18030 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and start!56098 res!398831) b!619001))

(assert (= (and b!619001 res!398837) b!619019))

(assert (= (and b!619019 res!398832) b!619005))

(assert (= (and b!619005 res!398828) b!619008))

(assert (= (and b!619008 res!398839) b!619021))

(assert (= (and b!619021 res!398830) b!619012))

(assert (= (and b!619012 res!398834) b!619018))

(assert (= (and b!619018 res!398824) b!619009))

(assert (= (and b!619009 res!398826) b!619020))

(assert (= (and b!619020 res!398825) b!619022))

(assert (= (and b!619022 res!398833) b!618998))

(assert (= (and b!618998 res!398835) b!619004))

(assert (= (and b!618998 c!70457) b!619007))

(assert (= (and b!618998 (not c!70457)) b!619015))

(assert (= (and b!618998 c!70455) b!619016))

(assert (= (and b!618998 (not c!70455)) b!619017))

(assert (= (and b!619016 res!398838) b!619003))

(assert (= (and b!619003 (not res!398827)) b!619014))

(assert (= (and b!619014 res!398829) b!619006))

(assert (= (and b!619016 c!70454) b!619010))

(assert (= (and b!619016 (not c!70454)) b!619013))

(assert (= (and b!619016 c!70456) b!619000))

(assert (= (and b!619016 (not c!70456)) b!619011))

(assert (= (and b!619000 res!398840) b!618999))

(assert (= (and b!618998 (not res!398836)) b!619002))

(declare-fun m!595001 () Bool)

(assert (=> b!619005 m!595001))

(declare-fun m!595003 () Bool)

(assert (=> b!619012 m!595003))

(declare-fun m!595005 () Bool)

(assert (=> b!619014 m!595005))

(assert (=> b!619014 m!595005))

(declare-fun m!595007 () Bool)

(assert (=> b!619014 m!595007))

(declare-fun m!595009 () Bool)

(assert (=> b!619002 m!595009))

(declare-fun m!595011 () Bool)

(assert (=> b!619002 m!595011))

(declare-fun m!595013 () Bool)

(assert (=> b!619022 m!595013))

(assert (=> b!619022 m!595005))

(assert (=> b!619022 m!595005))

(declare-fun m!595015 () Bool)

(assert (=> b!619022 m!595015))

(declare-fun m!595017 () Bool)

(assert (=> b!619021 m!595017))

(assert (=> b!619010 m!595005))

(declare-fun m!595019 () Bool)

(assert (=> b!619010 m!595019))

(assert (=> b!619010 m!595005))

(assert (=> b!619010 m!595005))

(declare-fun m!595021 () Bool)

(assert (=> b!619010 m!595021))

(declare-fun m!595023 () Bool)

(assert (=> b!619010 m!595023))

(declare-fun m!595025 () Bool)

(assert (=> b!619010 m!595025))

(assert (=> b!619010 m!595005))

(declare-fun m!595027 () Bool)

(assert (=> b!619010 m!595027))

(declare-fun m!595029 () Bool)

(assert (=> b!619010 m!595029))

(declare-fun m!595031 () Bool)

(assert (=> b!619010 m!595031))

(declare-fun m!595033 () Bool)

(assert (=> b!619008 m!595033))

(assert (=> b!619000 m!595005))

(assert (=> b!619000 m!595007))

(assert (=> b!619000 m!595005))

(declare-fun m!595035 () Bool)

(assert (=> b!619000 m!595035))

(assert (=> b!619000 m!595005))

(declare-fun m!595037 () Bool)

(assert (=> b!619000 m!595037))

(assert (=> b!619000 m!595005))

(declare-fun m!595039 () Bool)

(assert (=> b!619000 m!595039))

(declare-fun m!595041 () Bool)

(assert (=> b!619000 m!595041))

(assert (=> b!619000 m!595005))

(declare-fun m!595043 () Bool)

(assert (=> b!619000 m!595043))

(assert (=> b!619000 m!595029))

(assert (=> b!619000 m!595031))

(assert (=> b!618999 m!595005))

(assert (=> b!618999 m!595005))

(declare-fun m!595045 () Bool)

(assert (=> b!618999 m!595045))

(declare-fun m!595047 () Bool)

(assert (=> b!619018 m!595047))

(assert (=> b!619006 m!595005))

(assert (=> b!619006 m!595005))

(assert (=> b!619006 m!595045))

(declare-fun m!595049 () Bool)

(assert (=> b!618998 m!595049))

(declare-fun m!595051 () Bool)

(assert (=> b!618998 m!595051))

(assert (=> b!618998 m!595005))

(assert (=> b!618998 m!595009))

(declare-fun m!595053 () Bool)

(assert (=> b!618998 m!595053))

(declare-fun m!595055 () Bool)

(assert (=> b!618998 m!595055))

(assert (=> b!618998 m!595005))

(declare-fun m!595057 () Bool)

(assert (=> b!618998 m!595057))

(declare-fun m!595059 () Bool)

(assert (=> b!618998 m!595059))

(assert (=> b!619020 m!595009))

(declare-fun m!595061 () Bool)

(assert (=> b!619020 m!595061))

(assert (=> b!619016 m!595009))

(assert (=> b!619016 m!595011))

(assert (=> b!619016 m!595005))

(assert (=> b!619019 m!595005))

(assert (=> b!619019 m!595005))

(declare-fun m!595063 () Bool)

(assert (=> b!619019 m!595063))

(declare-fun m!595065 () Bool)

(assert (=> b!619009 m!595065))

(declare-fun m!595067 () Bool)

(assert (=> start!56098 m!595067))

(declare-fun m!595069 () Bool)

(assert (=> start!56098 m!595069))

(push 1)

