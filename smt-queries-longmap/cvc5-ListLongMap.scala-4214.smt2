; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57800 () Bool)

(assert start!57800)

(declare-fun b!639077 () Bool)

(declare-fun res!413660 () Bool)

(declare-fun e!365741 () Bool)

(assert (=> b!639077 (=> (not res!413660) (not e!365741))))

(declare-datatypes ((array!38302 0))(
  ( (array!38303 (arr!18372 (Array (_ BitVec 32) (_ BitVec 64))) (size!18736 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38302)

(declare-datatypes ((List!12413 0))(
  ( (Nil!12410) (Cons!12409 (h!13454 (_ BitVec 64)) (t!18641 List!12413)) )
))
(declare-fun arrayNoDuplicates!0 (array!38302 (_ BitVec 32) List!12413) Bool)

(assert (=> b!639077 (= res!413660 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12410))))

(declare-fun b!639078 () Bool)

(declare-fun e!365734 () Bool)

(declare-fun e!365736 () Bool)

(assert (=> b!639078 (= e!365734 e!365736)))

(declare-fun res!413661 () Bool)

(assert (=> b!639078 (=> (not res!413661) (not e!365736))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6812 0))(
  ( (MissingZero!6812 (index!29565 (_ BitVec 32))) (Found!6812 (index!29566 (_ BitVec 32))) (Intermediate!6812 (undefined!7624 Bool) (index!29567 (_ BitVec 32)) (x!58327 (_ BitVec 32))) (Undefined!6812) (MissingVacant!6812 (index!29568 (_ BitVec 32))) )
))
(declare-fun lt!295588 () SeekEntryResult!6812)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!639078 (= res!413661 (and (= lt!295588 (Found!6812 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18372 a!2986) index!984) (select (arr!18372 a!2986) j!136))) (not (= (select (arr!18372 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38302 (_ BitVec 32)) SeekEntryResult!6812)

(assert (=> b!639078 (= lt!295588 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18372 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!639079 () Bool)

(declare-datatypes ((Unit!21582 0))(
  ( (Unit!21583) )
))
(declare-fun e!365735 () Unit!21582)

(declare-fun Unit!21584 () Unit!21582)

(assert (=> b!639079 (= e!365735 Unit!21584)))

(declare-fun b!639080 () Bool)

(declare-fun res!413675 () Bool)

(declare-fun e!365731 () Bool)

(assert (=> b!639080 (=> (not res!413675) (not e!365731))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639080 (= res!413675 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639081 () Bool)

(declare-fun e!365740 () Bool)

(declare-fun e!365742 () Bool)

(assert (=> b!639081 (= e!365740 e!365742)))

(declare-fun res!413673 () Bool)

(assert (=> b!639081 (=> res!413673 e!365742)))

(declare-fun lt!295594 () (_ BitVec 64))

(declare-fun lt!295593 () (_ BitVec 64))

(assert (=> b!639081 (= res!413673 (or (not (= (select (arr!18372 a!2986) j!136) lt!295594)) (not (= (select (arr!18372 a!2986) j!136) lt!295593)) (bvsge j!136 index!984)))))

(declare-fun b!639082 () Bool)

(declare-fun res!413659 () Bool)

(assert (=> b!639082 (=> (not res!413659) (not e!365731))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!639082 (= res!413659 (and (= (size!18736 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18736 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18736 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639083 () Bool)

(declare-fun e!365732 () Bool)

(declare-fun lt!295583 () SeekEntryResult!6812)

(assert (=> b!639083 (= e!365732 (= lt!295588 lt!295583))))

(declare-fun res!413666 () Bool)

(assert (=> start!57800 (=> (not res!413666) (not e!365731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57800 (= res!413666 (validMask!0 mask!3053))))

(assert (=> start!57800 e!365731))

(assert (=> start!57800 true))

(declare-fun array_inv!14168 (array!38302) Bool)

(assert (=> start!57800 (array_inv!14168 a!2986)))

(declare-fun b!639084 () Bool)

(declare-fun res!413668 () Bool)

(assert (=> b!639084 (=> (not res!413668) (not e!365731))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639084 (= res!413668 (validKeyInArray!0 k!1786))))

(declare-fun b!639085 () Bool)

(assert (=> b!639085 (= e!365741 e!365734)))

(declare-fun res!413669 () Bool)

(assert (=> b!639085 (=> (not res!413669) (not e!365734))))

(assert (=> b!639085 (= res!413669 (= (select (store (arr!18372 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!295590 () array!38302)

(assert (=> b!639085 (= lt!295590 (array!38303 (store (arr!18372 a!2986) i!1108 k!1786) (size!18736 a!2986)))))

(declare-fun b!639086 () Bool)

(declare-fun res!413671 () Bool)

(assert (=> b!639086 (=> (not res!413671) (not e!365741))))

(assert (=> b!639086 (= res!413671 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18372 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639087 () Bool)

(declare-fun Unit!21585 () Unit!21582)

(assert (=> b!639087 (= e!365735 Unit!21585)))

(assert (=> b!639087 false))

(declare-fun e!365739 () Bool)

(declare-fun b!639088 () Bool)

(assert (=> b!639088 (= e!365739 (arrayContainsKey!0 lt!295590 (select (arr!18372 a!2986) j!136) index!984))))

(declare-fun b!639089 () Bool)

(declare-fun res!413674 () Bool)

(assert (=> b!639089 (=> (not res!413674) (not e!365731))))

(assert (=> b!639089 (= res!413674 (validKeyInArray!0 (select (arr!18372 a!2986) j!136)))))

(declare-fun b!639090 () Bool)

(declare-fun e!365738 () Bool)

(assert (=> b!639090 (= e!365736 (not e!365738))))

(declare-fun res!413672 () Bool)

(assert (=> b!639090 (=> res!413672 e!365738)))

(declare-fun lt!295589 () SeekEntryResult!6812)

(assert (=> b!639090 (= res!413672 (not (= lt!295589 (Found!6812 index!984))))))

(declare-fun lt!295585 () Unit!21582)

(assert (=> b!639090 (= lt!295585 e!365735)))

(declare-fun c!73076 () Bool)

(assert (=> b!639090 (= c!73076 (= lt!295589 Undefined!6812))))

(assert (=> b!639090 (= lt!295589 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295594 lt!295590 mask!3053))))

(assert (=> b!639090 e!365732))

(declare-fun res!413665 () Bool)

(assert (=> b!639090 (=> (not res!413665) (not e!365732))))

(declare-fun lt!295587 () (_ BitVec 32))

(assert (=> b!639090 (= res!413665 (= lt!295583 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295587 vacantSpotIndex!68 lt!295594 lt!295590 mask!3053)))))

(assert (=> b!639090 (= lt!295583 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295587 vacantSpotIndex!68 (select (arr!18372 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639090 (= lt!295594 (select (store (arr!18372 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!295586 () Unit!21582)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38302 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21582)

(assert (=> b!639090 (= lt!295586 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295587 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639090 (= lt!295587 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639091 () Bool)

(declare-fun res!413662 () Bool)

(assert (=> b!639091 (=> (not res!413662) (not e!365741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38302 (_ BitVec 32)) Bool)

(assert (=> b!639091 (= res!413662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639092 () Bool)

(declare-fun e!365733 () Bool)

(assert (=> b!639092 (= e!365733 true)))

(assert (=> b!639092 (arrayNoDuplicates!0 lt!295590 #b00000000000000000000000000000000 Nil!12410)))

(declare-fun lt!295584 () Unit!21582)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38302 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12413) Unit!21582)

(assert (=> b!639092 (= lt!295584 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12410))))

(assert (=> b!639092 (arrayContainsKey!0 lt!295590 (select (arr!18372 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295592 () Unit!21582)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38302 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21582)

(assert (=> b!639092 (= lt!295592 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295590 (select (arr!18372 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639093 () Bool)

(assert (=> b!639093 (= e!365742 e!365739)))

(declare-fun res!413670 () Bool)

(assert (=> b!639093 (=> (not res!413670) (not e!365739))))

(assert (=> b!639093 (= res!413670 (arrayContainsKey!0 lt!295590 (select (arr!18372 a!2986) j!136) j!136))))

(declare-fun b!639094 () Bool)

(assert (=> b!639094 (= e!365738 e!365733)))

(declare-fun res!413664 () Bool)

(assert (=> b!639094 (=> res!413664 e!365733)))

(assert (=> b!639094 (= res!413664 (or (not (= (select (arr!18372 a!2986) j!136) lt!295594)) (not (= (select (arr!18372 a!2986) j!136) lt!295593)) (bvsge j!136 index!984)))))

(assert (=> b!639094 e!365740))

(declare-fun res!413667 () Bool)

(assert (=> b!639094 (=> (not res!413667) (not e!365740))))

(assert (=> b!639094 (= res!413667 (= lt!295593 (select (arr!18372 a!2986) j!136)))))

(assert (=> b!639094 (= lt!295593 (select (store (arr!18372 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!639095 () Bool)

(assert (=> b!639095 (= e!365731 e!365741)))

(declare-fun res!413663 () Bool)

(assert (=> b!639095 (=> (not res!413663) (not e!365741))))

(declare-fun lt!295591 () SeekEntryResult!6812)

(assert (=> b!639095 (= res!413663 (or (= lt!295591 (MissingZero!6812 i!1108)) (= lt!295591 (MissingVacant!6812 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38302 (_ BitVec 32)) SeekEntryResult!6812)

(assert (=> b!639095 (= lt!295591 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(assert (= (and start!57800 res!413666) b!639082))

(assert (= (and b!639082 res!413659) b!639089))

(assert (= (and b!639089 res!413674) b!639084))

(assert (= (and b!639084 res!413668) b!639080))

(assert (= (and b!639080 res!413675) b!639095))

(assert (= (and b!639095 res!413663) b!639091))

(assert (= (and b!639091 res!413662) b!639077))

(assert (= (and b!639077 res!413660) b!639086))

(assert (= (and b!639086 res!413671) b!639085))

(assert (= (and b!639085 res!413669) b!639078))

(assert (= (and b!639078 res!413661) b!639090))

(assert (= (and b!639090 res!413665) b!639083))

(assert (= (and b!639090 c!73076) b!639087))

(assert (= (and b!639090 (not c!73076)) b!639079))

(assert (= (and b!639090 (not res!413672)) b!639094))

(assert (= (and b!639094 res!413667) b!639081))

(assert (= (and b!639081 (not res!413673)) b!639093))

(assert (= (and b!639093 res!413670) b!639088))

(assert (= (and b!639094 (not res!413664)) b!639092))

(declare-fun m!612959 () Bool)

(assert (=> b!639077 m!612959))

(declare-fun m!612961 () Bool)

(assert (=> b!639078 m!612961))

(declare-fun m!612963 () Bool)

(assert (=> b!639078 m!612963))

(assert (=> b!639078 m!612963))

(declare-fun m!612965 () Bool)

(assert (=> b!639078 m!612965))

(declare-fun m!612967 () Bool)

(assert (=> b!639092 m!612967))

(assert (=> b!639092 m!612963))

(assert (=> b!639092 m!612963))

(declare-fun m!612969 () Bool)

(assert (=> b!639092 m!612969))

(assert (=> b!639092 m!612963))

(declare-fun m!612971 () Bool)

(assert (=> b!639092 m!612971))

(declare-fun m!612973 () Bool)

(assert (=> b!639092 m!612973))

(assert (=> b!639089 m!612963))

(assert (=> b!639089 m!612963))

(declare-fun m!612975 () Bool)

(assert (=> b!639089 m!612975))

(declare-fun m!612977 () Bool)

(assert (=> b!639095 m!612977))

(declare-fun m!612979 () Bool)

(assert (=> b!639086 m!612979))

(declare-fun m!612981 () Bool)

(assert (=> b!639091 m!612981))

(assert (=> b!639088 m!612963))

(assert (=> b!639088 m!612963))

(declare-fun m!612983 () Bool)

(assert (=> b!639088 m!612983))

(assert (=> b!639093 m!612963))

(assert (=> b!639093 m!612963))

(declare-fun m!612985 () Bool)

(assert (=> b!639093 m!612985))

(declare-fun m!612987 () Bool)

(assert (=> start!57800 m!612987))

(declare-fun m!612989 () Bool)

(assert (=> start!57800 m!612989))

(declare-fun m!612991 () Bool)

(assert (=> b!639090 m!612991))

(declare-fun m!612993 () Bool)

(assert (=> b!639090 m!612993))

(declare-fun m!612995 () Bool)

(assert (=> b!639090 m!612995))

(assert (=> b!639090 m!612963))

(declare-fun m!612997 () Bool)

(assert (=> b!639090 m!612997))

(declare-fun m!612999 () Bool)

(assert (=> b!639090 m!612999))

(declare-fun m!613001 () Bool)

(assert (=> b!639090 m!613001))

(assert (=> b!639090 m!612963))

(declare-fun m!613003 () Bool)

(assert (=> b!639090 m!613003))

(assert (=> b!639081 m!612963))

(assert (=> b!639085 m!612997))

(declare-fun m!613005 () Bool)

(assert (=> b!639085 m!613005))

(declare-fun m!613007 () Bool)

(assert (=> b!639080 m!613007))

(assert (=> b!639094 m!612963))

(assert (=> b!639094 m!612997))

(declare-fun m!613009 () Bool)

(assert (=> b!639094 m!613009))

(declare-fun m!613011 () Bool)

(assert (=> b!639084 m!613011))

(push 1)

