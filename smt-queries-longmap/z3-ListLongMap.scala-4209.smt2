; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57700 () Bool)

(assert start!57700)

(declare-fun b!637879 () Bool)

(declare-datatypes ((Unit!21526 0))(
  ( (Unit!21527) )
))
(declare-fun e!365001 () Unit!21526)

(declare-fun Unit!21528 () Unit!21526)

(assert (=> b!637879 (= e!365001 Unit!21528)))

(declare-fun b!637880 () Bool)

(declare-fun e!364998 () Bool)

(declare-fun e!365004 () Bool)

(assert (=> b!637880 (= e!364998 e!365004)))

(declare-fun res!412755 () Bool)

(assert (=> b!637880 (=> (not res!412755) (not e!365004))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!38271 0))(
  ( (array!38272 (arr!18358 (Array (_ BitVec 32) (_ BitVec 64))) (size!18722 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38271)

(assert (=> b!637880 (= res!412755 (= (select (store (arr!18358 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!294958 () array!38271)

(assert (=> b!637880 (= lt!294958 (array!38272 (store (arr!18358 a!2986) i!1108 k0!1786) (size!18722 a!2986)))))

(declare-fun b!637881 () Bool)

(declare-fun res!412766 () Bool)

(assert (=> b!637881 (=> (not res!412766) (not e!364998))))

(declare-datatypes ((List!12399 0))(
  ( (Nil!12396) (Cons!12395 (h!13440 (_ BitVec 64)) (t!18627 List!12399)) )
))
(declare-fun arrayNoDuplicates!0 (array!38271 (_ BitVec 32) List!12399) Bool)

(assert (=> b!637881 (= res!412766 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12396))))

(declare-fun res!412767 () Bool)

(declare-fun e!365006 () Bool)

(assert (=> start!57700 (=> (not res!412767) (not e!365006))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57700 (= res!412767 (validMask!0 mask!3053))))

(assert (=> start!57700 e!365006))

(assert (=> start!57700 true))

(declare-fun array_inv!14154 (array!38271) Bool)

(assert (=> start!57700 (array_inv!14154 a!2986)))

(declare-fun b!637882 () Bool)

(declare-fun e!364995 () Bool)

(declare-fun e!365003 () Bool)

(assert (=> b!637882 (= e!364995 (not e!365003))))

(declare-fun res!412758 () Bool)

(assert (=> b!637882 (=> res!412758 e!365003)))

(declare-datatypes ((SeekEntryResult!6798 0))(
  ( (MissingZero!6798 (index!29506 (_ BitVec 32))) (Found!6798 (index!29507 (_ BitVec 32))) (Intermediate!6798 (undefined!7610 Bool) (index!29508 (_ BitVec 32)) (x!58264 (_ BitVec 32))) (Undefined!6798) (MissingVacant!6798 (index!29509 (_ BitVec 32))) )
))
(declare-fun lt!294956 () SeekEntryResult!6798)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!637882 (= res!412758 (not (= lt!294956 (Found!6798 index!984))))))

(declare-fun lt!294957 () Unit!21526)

(assert (=> b!637882 (= lt!294957 e!365001)))

(declare-fun c!72932 () Bool)

(assert (=> b!637882 (= c!72932 (= lt!294956 Undefined!6798))))

(declare-fun lt!294960 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38271 (_ BitVec 32)) SeekEntryResult!6798)

(assert (=> b!637882 (= lt!294956 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294960 lt!294958 mask!3053))))

(declare-fun e!364996 () Bool)

(assert (=> b!637882 e!364996))

(declare-fun res!412753 () Bool)

(assert (=> b!637882 (=> (not res!412753) (not e!364996))))

(declare-fun lt!294955 () SeekEntryResult!6798)

(declare-fun lt!294963 () (_ BitVec 32))

(assert (=> b!637882 (= res!412753 (= lt!294955 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294963 vacantSpotIndex!68 lt!294960 lt!294958 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!637882 (= lt!294955 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294963 vacantSpotIndex!68 (select (arr!18358 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637882 (= lt!294960 (select (store (arr!18358 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!294964 () Unit!21526)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38271 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21526)

(assert (=> b!637882 (= lt!294964 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294963 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637882 (= lt!294963 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!637883 () Bool)

(declare-fun e!365007 () Bool)

(declare-fun e!364999 () Bool)

(assert (=> b!637883 (= e!365007 e!364999)))

(declare-fun res!412768 () Bool)

(assert (=> b!637883 (=> res!412768 e!364999)))

(declare-fun lt!294962 () (_ BitVec 64))

(assert (=> b!637883 (= res!412768 (or (not (= (select (arr!18358 a!2986) j!136) lt!294960)) (not (= (select (arr!18358 a!2986) j!136) lt!294962)) (bvsge j!136 index!984)))))

(declare-fun b!637884 () Bool)

(declare-fun res!412759 () Bool)

(assert (=> b!637884 (=> (not res!412759) (not e!365006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637884 (= res!412759 (validKeyInArray!0 k0!1786))))

(declare-fun b!637885 () Bool)

(declare-fun res!412760 () Bool)

(assert (=> b!637885 (=> (not res!412760) (not e!365006))))

(declare-fun arrayContainsKey!0 (array!38271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637885 (= res!412760 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637886 () Bool)

(declare-fun e!365000 () Bool)

(assert (=> b!637886 (= e!365003 e!365000)))

(declare-fun res!412762 () Bool)

(assert (=> b!637886 (=> res!412762 e!365000)))

(assert (=> b!637886 (= res!412762 (or (not (= (select (arr!18358 a!2986) j!136) lt!294960)) (not (= (select (arr!18358 a!2986) j!136) lt!294962)) (bvsge j!136 index!984)))))

(assert (=> b!637886 e!365007))

(declare-fun res!412754 () Bool)

(assert (=> b!637886 (=> (not res!412754) (not e!365007))))

(assert (=> b!637886 (= res!412754 (= lt!294962 (select (arr!18358 a!2986) j!136)))))

(assert (=> b!637886 (= lt!294962 (select (store (arr!18358 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!637887 () Bool)

(declare-fun res!412761 () Bool)

(assert (=> b!637887 (=> (not res!412761) (not e!365006))))

(assert (=> b!637887 (= res!412761 (validKeyInArray!0 (select (arr!18358 a!2986) j!136)))))

(declare-fun e!365002 () Bool)

(declare-fun b!637888 () Bool)

(assert (=> b!637888 (= e!365002 (arrayContainsKey!0 lt!294958 (select (arr!18358 a!2986) j!136) index!984))))

(declare-fun b!637889 () Bool)

(declare-fun lt!294953 () SeekEntryResult!6798)

(assert (=> b!637889 (= e!364996 (= lt!294953 lt!294955))))

(declare-fun b!637890 () Bool)

(assert (=> b!637890 (= e!365006 e!364998)))

(declare-fun res!412749 () Bool)

(assert (=> b!637890 (=> (not res!412749) (not e!364998))))

(declare-fun lt!294961 () SeekEntryResult!6798)

(assert (=> b!637890 (= res!412749 (or (= lt!294961 (MissingZero!6798 i!1108)) (= lt!294961 (MissingVacant!6798 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38271 (_ BitVec 32)) SeekEntryResult!6798)

(assert (=> b!637890 (= lt!294961 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!637891 () Bool)

(declare-fun res!412752 () Bool)

(declare-fun e!365005 () Bool)

(assert (=> b!637891 (=> res!412752 e!365005)))

(declare-fun contains!3113 (List!12399 (_ BitVec 64)) Bool)

(assert (=> b!637891 (= res!412752 (contains!3113 Nil!12396 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637892 () Bool)

(declare-fun res!412757 () Bool)

(assert (=> b!637892 (=> (not res!412757) (not e!364998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38271 (_ BitVec 32)) Bool)

(assert (=> b!637892 (= res!412757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!637893 () Bool)

(assert (=> b!637893 (= e!364999 e!365002)))

(declare-fun res!412751 () Bool)

(assert (=> b!637893 (=> (not res!412751) (not e!365002))))

(assert (=> b!637893 (= res!412751 (arrayContainsKey!0 lt!294958 (select (arr!18358 a!2986) j!136) j!136))))

(declare-fun b!637894 () Bool)

(assert (=> b!637894 (= e!365004 e!364995)))

(declare-fun res!412764 () Bool)

(assert (=> b!637894 (=> (not res!412764) (not e!364995))))

(assert (=> b!637894 (= res!412764 (and (= lt!294953 (Found!6798 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18358 a!2986) index!984) (select (arr!18358 a!2986) j!136))) (not (= (select (arr!18358 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!637894 (= lt!294953 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18358 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637895 () Bool)

(declare-fun res!412756 () Bool)

(assert (=> b!637895 (=> res!412756 e!365005)))

(declare-fun noDuplicate!391 (List!12399) Bool)

(assert (=> b!637895 (= res!412756 (not (noDuplicate!391 Nil!12396)))))

(declare-fun b!637896 () Bool)

(declare-fun Unit!21529 () Unit!21526)

(assert (=> b!637896 (= e!365001 Unit!21529)))

(assert (=> b!637896 false))

(declare-fun b!637897 () Bool)

(declare-fun res!412765 () Bool)

(assert (=> b!637897 (=> (not res!412765) (not e!365006))))

(assert (=> b!637897 (= res!412765 (and (= (size!18722 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18722 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18722 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637898 () Bool)

(assert (=> b!637898 (= e!365005 true)))

(declare-fun lt!294954 () Bool)

(assert (=> b!637898 (= lt!294954 (contains!3113 Nil!12396 k0!1786))))

(declare-fun b!637899 () Bool)

(assert (=> b!637899 (= e!365000 e!365005)))

(declare-fun res!412763 () Bool)

(assert (=> b!637899 (=> res!412763 e!365005)))

(assert (=> b!637899 (= res!412763 (or (bvsge (size!18722 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18722 a!2986))))))

(assert (=> b!637899 (arrayContainsKey!0 lt!294958 (select (arr!18358 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294959 () Unit!21526)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38271 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21526)

(assert (=> b!637899 (= lt!294959 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294958 (select (arr!18358 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637900 () Bool)

(declare-fun res!412750 () Bool)

(assert (=> b!637900 (=> (not res!412750) (not e!364998))))

(assert (=> b!637900 (= res!412750 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18358 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!637901 () Bool)

(declare-fun res!412769 () Bool)

(assert (=> b!637901 (=> res!412769 e!365005)))

(assert (=> b!637901 (= res!412769 (contains!3113 Nil!12396 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!57700 res!412767) b!637897))

(assert (= (and b!637897 res!412765) b!637887))

(assert (= (and b!637887 res!412761) b!637884))

(assert (= (and b!637884 res!412759) b!637885))

(assert (= (and b!637885 res!412760) b!637890))

(assert (= (and b!637890 res!412749) b!637892))

(assert (= (and b!637892 res!412757) b!637881))

(assert (= (and b!637881 res!412766) b!637900))

(assert (= (and b!637900 res!412750) b!637880))

(assert (= (and b!637880 res!412755) b!637894))

(assert (= (and b!637894 res!412764) b!637882))

(assert (= (and b!637882 res!412753) b!637889))

(assert (= (and b!637882 c!72932) b!637896))

(assert (= (and b!637882 (not c!72932)) b!637879))

(assert (= (and b!637882 (not res!412758)) b!637886))

(assert (= (and b!637886 res!412754) b!637883))

(assert (= (and b!637883 (not res!412768)) b!637893))

(assert (= (and b!637893 res!412751) b!637888))

(assert (= (and b!637886 (not res!412762)) b!637899))

(assert (= (and b!637899 (not res!412763)) b!637895))

(assert (= (and b!637895 (not res!412756)) b!637891))

(assert (= (and b!637891 (not res!412752)) b!637901))

(assert (= (and b!637901 (not res!412769)) b!637898))

(declare-fun m!611889 () Bool)

(assert (=> b!637900 m!611889))

(declare-fun m!611891 () Bool)

(assert (=> b!637899 m!611891))

(assert (=> b!637899 m!611891))

(declare-fun m!611893 () Bool)

(assert (=> b!637899 m!611893))

(assert (=> b!637899 m!611891))

(declare-fun m!611895 () Bool)

(assert (=> b!637899 m!611895))

(assert (=> b!637887 m!611891))

(assert (=> b!637887 m!611891))

(declare-fun m!611897 () Bool)

(assert (=> b!637887 m!611897))

(declare-fun m!611899 () Bool)

(assert (=> b!637895 m!611899))

(declare-fun m!611901 () Bool)

(assert (=> b!637885 m!611901))

(declare-fun m!611903 () Bool)

(assert (=> b!637891 m!611903))

(declare-fun m!611905 () Bool)

(assert (=> b!637884 m!611905))

(declare-fun m!611907 () Bool)

(assert (=> b!637880 m!611907))

(declare-fun m!611909 () Bool)

(assert (=> b!637880 m!611909))

(declare-fun m!611911 () Bool)

(assert (=> b!637901 m!611911))

(declare-fun m!611913 () Bool)

(assert (=> b!637894 m!611913))

(assert (=> b!637894 m!611891))

(assert (=> b!637894 m!611891))

(declare-fun m!611915 () Bool)

(assert (=> b!637894 m!611915))

(declare-fun m!611917 () Bool)

(assert (=> b!637882 m!611917))

(declare-fun m!611919 () Bool)

(assert (=> b!637882 m!611919))

(assert (=> b!637882 m!611907))

(declare-fun m!611921 () Bool)

(assert (=> b!637882 m!611921))

(assert (=> b!637882 m!611891))

(declare-fun m!611923 () Bool)

(assert (=> b!637882 m!611923))

(declare-fun m!611925 () Bool)

(assert (=> b!637882 m!611925))

(assert (=> b!637882 m!611891))

(declare-fun m!611927 () Bool)

(assert (=> b!637882 m!611927))

(declare-fun m!611929 () Bool)

(assert (=> b!637881 m!611929))

(declare-fun m!611931 () Bool)

(assert (=> b!637890 m!611931))

(assert (=> b!637883 m!611891))

(declare-fun m!611933 () Bool)

(assert (=> b!637898 m!611933))

(declare-fun m!611935 () Bool)

(assert (=> start!57700 m!611935))

(declare-fun m!611937 () Bool)

(assert (=> start!57700 m!611937))

(assert (=> b!637886 m!611891))

(assert (=> b!637886 m!611907))

(declare-fun m!611939 () Bool)

(assert (=> b!637886 m!611939))

(assert (=> b!637888 m!611891))

(assert (=> b!637888 m!611891))

(declare-fun m!611941 () Bool)

(assert (=> b!637888 m!611941))

(assert (=> b!637893 m!611891))

(assert (=> b!637893 m!611891))

(declare-fun m!611943 () Bool)

(assert (=> b!637893 m!611943))

(declare-fun m!611945 () Bool)

(assert (=> b!637892 m!611945))

(check-sat (not b!637884) (not b!637891) (not b!637899) (not b!637898) (not b!637881) (not b!637901) (not b!637882) (not b!637895) (not b!637890) (not b!637892) (not b!637887) (not b!637894) (not b!637893) (not b!637888) (not b!637885) (not start!57700))
(check-sat)
