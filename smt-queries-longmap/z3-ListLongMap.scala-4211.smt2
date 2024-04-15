; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57698 () Bool)

(assert start!57698)

(declare-fun b!637928 () Bool)

(declare-fun e!365009 () Bool)

(declare-fun e!365003 () Bool)

(assert (=> b!637928 (= e!365009 e!365003)))

(declare-fun res!412937 () Bool)

(assert (=> b!637928 (=> (not res!412937) (not e!365003))))

(declare-datatypes ((SeekEntryResult!6799 0))(
  ( (MissingZero!6799 (index!29510 (_ BitVec 32))) (Found!6799 (index!29511 (_ BitVec 32))) (Intermediate!6799 (undefined!7611 Bool) (index!29512 (_ BitVec 32)) (x!58276 (_ BitVec 32))) (Undefined!6799) (MissingVacant!6799 (index!29513 (_ BitVec 32))) )
))
(declare-fun lt!294885 () SeekEntryResult!6799)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!637928 (= res!412937 (or (= lt!294885 (MissingZero!6799 i!1108)) (= lt!294885 (MissingVacant!6799 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-datatypes ((array!38280 0))(
  ( (array!38281 (arr!18362 (Array (_ BitVec 32) (_ BitVec 64))) (size!18727 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38280)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38280 (_ BitVec 32)) SeekEntryResult!6799)

(assert (=> b!637928 (= lt!294885 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!637929 () Bool)

(declare-fun res!412936 () Bool)

(assert (=> b!637929 (=> (not res!412936) (not e!365003))))

(declare-datatypes ((List!12442 0))(
  ( (Nil!12439) (Cons!12438 (h!13483 (_ BitVec 64)) (t!18661 List!12442)) )
))
(declare-fun arrayNoDuplicates!0 (array!38280 (_ BitVec 32) List!12442) Bool)

(assert (=> b!637929 (= res!412936 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12439))))

(declare-fun b!637930 () Bool)

(declare-fun res!412943 () Bool)

(assert (=> b!637930 (=> (not res!412943) (not e!365003))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!637930 (= res!412943 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18362 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!637931 () Bool)

(declare-fun res!412941 () Bool)

(assert (=> b!637931 (=> (not res!412941) (not e!365009))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637931 (= res!412941 (validKeyInArray!0 (select (arr!18362 a!2986) j!136)))))

(declare-fun b!637932 () Bool)

(declare-fun res!412939 () Bool)

(declare-fun e!365001 () Bool)

(assert (=> b!637932 (=> res!412939 e!365001)))

(declare-fun contains!3102 (List!12442 (_ BitVec 64)) Bool)

(assert (=> b!637932 (= res!412939 (contains!3102 Nil!12439 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637933 () Bool)

(declare-fun e!365008 () Bool)

(declare-fun e!365007 () Bool)

(assert (=> b!637933 (= e!365008 e!365007)))

(declare-fun res!412938 () Bool)

(assert (=> b!637933 (=> res!412938 e!365007)))

(declare-fun lt!294881 () (_ BitVec 64))

(declare-fun lt!294884 () (_ BitVec 64))

(assert (=> b!637933 (= res!412938 (or (not (= (select (arr!18362 a!2986) j!136) lt!294881)) (not (= (select (arr!18362 a!2986) j!136) lt!294884)) (bvsge j!136 index!984)))))

(declare-fun b!637934 () Bool)

(declare-fun e!365002 () Bool)

(assert (=> b!637934 (= e!365002 e!365001)))

(declare-fun res!412934 () Bool)

(assert (=> b!637934 (=> res!412934 e!365001)))

(assert (=> b!637934 (= res!412934 (or (bvsge (size!18727 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18727 a!2986))))))

(declare-fun lt!294878 () array!38280)

(declare-fun arrayContainsKey!0 (array!38280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637934 (arrayContainsKey!0 lt!294878 (select (arr!18362 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-datatypes ((Unit!21524 0))(
  ( (Unit!21525) )
))
(declare-fun lt!294877 () Unit!21524)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38280 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21524)

(assert (=> b!637934 (= lt!294877 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294878 (select (arr!18362 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637935 () Bool)

(declare-fun e!365011 () Unit!21524)

(declare-fun Unit!21526 () Unit!21524)

(assert (=> b!637935 (= e!365011 Unit!21526)))

(assert (=> b!637935 false))

(declare-fun b!637936 () Bool)

(declare-fun e!365006 () Bool)

(declare-fun e!365012 () Bool)

(assert (=> b!637936 (= e!365006 e!365012)))

(declare-fun res!412944 () Bool)

(assert (=> b!637936 (=> (not res!412944) (not e!365012))))

(declare-fun lt!294883 () SeekEntryResult!6799)

(assert (=> b!637936 (= res!412944 (and (= lt!294883 (Found!6799 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18362 a!2986) index!984) (select (arr!18362 a!2986) j!136))) (not (= (select (arr!18362 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38280 (_ BitVec 32)) SeekEntryResult!6799)

(assert (=> b!637936 (= lt!294883 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18362 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637937 () Bool)

(declare-fun Unit!21527 () Unit!21524)

(assert (=> b!637937 (= e!365011 Unit!21527)))

(declare-fun b!637938 () Bool)

(declare-fun res!412948 () Bool)

(assert (=> b!637938 (=> res!412948 e!365001)))

(declare-fun noDuplicate!401 (List!12442) Bool)

(assert (=> b!637938 (= res!412948 (not (noDuplicate!401 Nil!12439)))))

(declare-fun res!412942 () Bool)

(assert (=> start!57698 (=> (not res!412942) (not e!365009))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57698 (= res!412942 (validMask!0 mask!3053))))

(assert (=> start!57698 e!365009))

(assert (=> start!57698 true))

(declare-fun array_inv!14245 (array!38280) Bool)

(assert (=> start!57698 (array_inv!14245 a!2986)))

(declare-fun b!637939 () Bool)

(declare-fun e!365005 () Bool)

(assert (=> b!637939 (= e!365005 (arrayContainsKey!0 lt!294878 (select (arr!18362 a!2986) j!136) index!984))))

(declare-fun b!637940 () Bool)

(declare-fun e!365010 () Bool)

(assert (=> b!637940 (= e!365010 e!365002)))

(declare-fun res!412945 () Bool)

(assert (=> b!637940 (=> res!412945 e!365002)))

(assert (=> b!637940 (= res!412945 (or (not (= (select (arr!18362 a!2986) j!136) lt!294881)) (not (= (select (arr!18362 a!2986) j!136) lt!294884)) (bvsge j!136 index!984)))))

(assert (=> b!637940 e!365008))

(declare-fun res!412946 () Bool)

(assert (=> b!637940 (=> (not res!412946) (not e!365008))))

(assert (=> b!637940 (= res!412946 (= lt!294884 (select (arr!18362 a!2986) j!136)))))

(assert (=> b!637940 (= lt!294884 (select (store (arr!18362 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!637941 () Bool)

(assert (=> b!637941 (= e!365003 e!365006)))

(declare-fun res!412928 () Bool)

(assert (=> b!637941 (=> (not res!412928) (not e!365006))))

(assert (=> b!637941 (= res!412928 (= (select (store (arr!18362 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637941 (= lt!294878 (array!38281 (store (arr!18362 a!2986) i!1108 k0!1786) (size!18727 a!2986)))))

(declare-fun b!637942 () Bool)

(declare-fun res!412933 () Bool)

(assert (=> b!637942 (=> (not res!412933) (not e!365009))))

(assert (=> b!637942 (= res!412933 (validKeyInArray!0 k0!1786))))

(declare-fun b!637943 () Bool)

(declare-fun res!412929 () Bool)

(assert (=> b!637943 (=> (not res!412929) (not e!365009))))

(assert (=> b!637943 (= res!412929 (and (= (size!18727 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18727 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18727 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637944 () Bool)

(assert (=> b!637944 (= e!365001 true)))

(declare-fun lt!294879 () Bool)

(assert (=> b!637944 (= lt!294879 (contains!3102 Nil!12439 k0!1786))))

(declare-fun b!637945 () Bool)

(assert (=> b!637945 (= e!365012 (not e!365010))))

(declare-fun res!412932 () Bool)

(assert (=> b!637945 (=> res!412932 e!365010)))

(declare-fun lt!294886 () SeekEntryResult!6799)

(assert (=> b!637945 (= res!412932 (not (= lt!294886 (Found!6799 index!984))))))

(declare-fun lt!294880 () Unit!21524)

(assert (=> b!637945 (= lt!294880 e!365011)))

(declare-fun c!72867 () Bool)

(assert (=> b!637945 (= c!72867 (= lt!294886 Undefined!6799))))

(assert (=> b!637945 (= lt!294886 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294881 lt!294878 mask!3053))))

(declare-fun e!365004 () Bool)

(assert (=> b!637945 e!365004))

(declare-fun res!412935 () Bool)

(assert (=> b!637945 (=> (not res!412935) (not e!365004))))

(declare-fun lt!294882 () SeekEntryResult!6799)

(declare-fun lt!294887 () (_ BitVec 32))

(assert (=> b!637945 (= res!412935 (= lt!294882 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294887 vacantSpotIndex!68 lt!294881 lt!294878 mask!3053)))))

(assert (=> b!637945 (= lt!294882 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294887 vacantSpotIndex!68 (select (arr!18362 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637945 (= lt!294881 (select (store (arr!18362 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294888 () Unit!21524)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38280 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21524)

(assert (=> b!637945 (= lt!294888 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294887 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637945 (= lt!294887 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!637946 () Bool)

(assert (=> b!637946 (= e!365004 (= lt!294883 lt!294882))))

(declare-fun b!637947 () Bool)

(declare-fun res!412947 () Bool)

(assert (=> b!637947 (=> (not res!412947) (not e!365003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38280 (_ BitVec 32)) Bool)

(assert (=> b!637947 (= res!412947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!637948 () Bool)

(assert (=> b!637948 (= e!365007 e!365005)))

(declare-fun res!412940 () Bool)

(assert (=> b!637948 (=> (not res!412940) (not e!365005))))

(assert (=> b!637948 (= res!412940 (arrayContainsKey!0 lt!294878 (select (arr!18362 a!2986) j!136) j!136))))

(declare-fun b!637949 () Bool)

(declare-fun res!412930 () Bool)

(assert (=> b!637949 (=> (not res!412930) (not e!365009))))

(assert (=> b!637949 (= res!412930 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637950 () Bool)

(declare-fun res!412931 () Bool)

(assert (=> b!637950 (=> res!412931 e!365001)))

(assert (=> b!637950 (= res!412931 (contains!3102 Nil!12439 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!57698 res!412942) b!637943))

(assert (= (and b!637943 res!412929) b!637931))

(assert (= (and b!637931 res!412941) b!637942))

(assert (= (and b!637942 res!412933) b!637949))

(assert (= (and b!637949 res!412930) b!637928))

(assert (= (and b!637928 res!412937) b!637947))

(assert (= (and b!637947 res!412947) b!637929))

(assert (= (and b!637929 res!412936) b!637930))

(assert (= (and b!637930 res!412943) b!637941))

(assert (= (and b!637941 res!412928) b!637936))

(assert (= (and b!637936 res!412944) b!637945))

(assert (= (and b!637945 res!412935) b!637946))

(assert (= (and b!637945 c!72867) b!637935))

(assert (= (and b!637945 (not c!72867)) b!637937))

(assert (= (and b!637945 (not res!412932)) b!637940))

(assert (= (and b!637940 res!412946) b!637933))

(assert (= (and b!637933 (not res!412938)) b!637948))

(assert (= (and b!637948 res!412940) b!637939))

(assert (= (and b!637940 (not res!412945)) b!637934))

(assert (= (and b!637934 (not res!412934)) b!637938))

(assert (= (and b!637938 (not res!412948)) b!637950))

(assert (= (and b!637950 (not res!412931)) b!637932))

(assert (= (and b!637932 (not res!412939)) b!637944))

(declare-fun m!611397 () Bool)

(assert (=> b!637947 m!611397))

(declare-fun m!611399 () Bool)

(assert (=> b!637950 m!611399))

(declare-fun m!611401 () Bool)

(assert (=> b!637948 m!611401))

(assert (=> b!637948 m!611401))

(declare-fun m!611403 () Bool)

(assert (=> b!637948 m!611403))

(declare-fun m!611405 () Bool)

(assert (=> b!637929 m!611405))

(declare-fun m!611407 () Bool)

(assert (=> b!637945 m!611407))

(declare-fun m!611409 () Bool)

(assert (=> b!637945 m!611409))

(assert (=> b!637945 m!611401))

(declare-fun m!611411 () Bool)

(assert (=> b!637945 m!611411))

(assert (=> b!637945 m!611401))

(declare-fun m!611413 () Bool)

(assert (=> b!637945 m!611413))

(declare-fun m!611415 () Bool)

(assert (=> b!637945 m!611415))

(declare-fun m!611417 () Bool)

(assert (=> b!637945 m!611417))

(declare-fun m!611419 () Bool)

(assert (=> b!637945 m!611419))

(declare-fun m!611421 () Bool)

(assert (=> b!637936 m!611421))

(assert (=> b!637936 m!611401))

(assert (=> b!637936 m!611401))

(declare-fun m!611423 () Bool)

(assert (=> b!637936 m!611423))

(declare-fun m!611425 () Bool)

(assert (=> start!57698 m!611425))

(declare-fun m!611427 () Bool)

(assert (=> start!57698 m!611427))

(assert (=> b!637939 m!611401))

(assert (=> b!637939 m!611401))

(declare-fun m!611429 () Bool)

(assert (=> b!637939 m!611429))

(assert (=> b!637931 m!611401))

(assert (=> b!637931 m!611401))

(declare-fun m!611431 () Bool)

(assert (=> b!637931 m!611431))

(declare-fun m!611433 () Bool)

(assert (=> b!637932 m!611433))

(declare-fun m!611435 () Bool)

(assert (=> b!637930 m!611435))

(assert (=> b!637933 m!611401))

(assert (=> b!637940 m!611401))

(assert (=> b!637940 m!611415))

(declare-fun m!611437 () Bool)

(assert (=> b!637940 m!611437))

(assert (=> b!637934 m!611401))

(assert (=> b!637934 m!611401))

(declare-fun m!611439 () Bool)

(assert (=> b!637934 m!611439))

(assert (=> b!637934 m!611401))

(declare-fun m!611441 () Bool)

(assert (=> b!637934 m!611441))

(declare-fun m!611443 () Bool)

(assert (=> b!637942 m!611443))

(declare-fun m!611445 () Bool)

(assert (=> b!637928 m!611445))

(declare-fun m!611447 () Bool)

(assert (=> b!637944 m!611447))

(declare-fun m!611449 () Bool)

(assert (=> b!637949 m!611449))

(assert (=> b!637941 m!611415))

(declare-fun m!611451 () Bool)

(assert (=> b!637941 m!611451))

(declare-fun m!611453 () Bool)

(assert (=> b!637938 m!611453))

(check-sat (not b!637934) (not b!637942) (not b!637947) (not b!637932) (not b!637944) (not b!637939) (not b!637950) (not b!637928) (not start!57698) (not b!637936) (not b!637931) (not b!637929) (not b!637945) (not b!637938) (not b!637948) (not b!637949))
(check-sat)
