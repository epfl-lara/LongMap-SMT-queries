; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57696 () Bool)

(assert start!57696)

(declare-fun b!637741 () Bool)

(declare-fun res!412642 () Bool)

(declare-fun e!364921 () Bool)

(assert (=> b!637741 (=> (not res!412642) (not e!364921))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!637741 (= res!412642 (validKeyInArray!0 k!1786))))

(declare-fun b!637742 () Bool)

(declare-fun e!364917 () Bool)

(declare-fun e!364922 () Bool)

(assert (=> b!637742 (= e!364917 e!364922)))

(declare-fun res!412628 () Bool)

(assert (=> b!637742 (=> (not res!412628) (not e!364922))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6796 0))(
  ( (MissingZero!6796 (index!29498 (_ BitVec 32))) (Found!6796 (index!29499 (_ BitVec 32))) (Intermediate!6796 (undefined!7608 Bool) (index!29500 (_ BitVec 32)) (x!58254 (_ BitVec 32))) (Undefined!6796) (MissingVacant!6796 (index!29501 (_ BitVec 32))) )
))
(declare-fun lt!294882 () SeekEntryResult!6796)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38267 0))(
  ( (array!38268 (arr!18356 (Array (_ BitVec 32) (_ BitVec 64))) (size!18720 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38267)

(assert (=> b!637742 (= res!412628 (and (= lt!294882 (Found!6796 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18356 a!2986) index!984) (select (arr!18356 a!2986) j!136))) (not (= (select (arr!18356 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38267 (_ BitVec 32)) SeekEntryResult!6796)

(assert (=> b!637742 (= lt!294882 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18356 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!637743 () Bool)

(declare-fun res!412623 () Bool)

(declare-fun e!364925 () Bool)

(assert (=> b!637743 (=> res!412623 e!364925)))

(declare-datatypes ((List!12397 0))(
  ( (Nil!12394) (Cons!12393 (h!13438 (_ BitVec 64)) (t!18625 List!12397)) )
))
(declare-fun noDuplicate!389 (List!12397) Bool)

(assert (=> b!637743 (= res!412623 (not (noDuplicate!389 Nil!12394)))))

(declare-fun b!637744 () Bool)

(declare-datatypes ((Unit!21518 0))(
  ( (Unit!21519) )
))
(declare-fun e!364919 () Unit!21518)

(declare-fun Unit!21520 () Unit!21518)

(assert (=> b!637744 (= e!364919 Unit!21520)))

(assert (=> b!637744 false))

(declare-fun e!364929 () Bool)

(declare-fun lt!294881 () array!38267)

(declare-fun b!637745 () Bool)

(declare-fun arrayContainsKey!0 (array!38267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!637745 (= e!364929 (arrayContainsKey!0 lt!294881 (select (arr!18356 a!2986) j!136) index!984))))

(declare-fun b!637746 () Bool)

(declare-fun res!412627 () Bool)

(declare-fun e!364920 () Bool)

(assert (=> b!637746 (=> (not res!412627) (not e!364920))))

(declare-fun arrayNoDuplicates!0 (array!38267 (_ BitVec 32) List!12397) Bool)

(assert (=> b!637746 (= res!412627 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12394))))

(declare-fun b!637747 () Bool)

(declare-fun res!412635 () Bool)

(assert (=> b!637747 (=> (not res!412635) (not e!364921))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!637747 (= res!412635 (and (= (size!18720 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18720 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18720 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!637748 () Bool)

(declare-fun e!364926 () Bool)

(declare-fun e!364927 () Bool)

(assert (=> b!637748 (= e!364926 e!364927)))

(declare-fun res!412625 () Bool)

(assert (=> b!637748 (=> res!412625 e!364927)))

(declare-fun lt!294886 () (_ BitVec 64))

(declare-fun lt!294891 () (_ BitVec 64))

(assert (=> b!637748 (= res!412625 (or (not (= (select (arr!18356 a!2986) j!136) lt!294886)) (not (= (select (arr!18356 a!2986) j!136) lt!294891)) (bvsge j!136 index!984)))))

(declare-fun e!364924 () Bool)

(assert (=> b!637748 e!364924))

(declare-fun res!412633 () Bool)

(assert (=> b!637748 (=> (not res!412633) (not e!364924))))

(assert (=> b!637748 (= res!412633 (= lt!294891 (select (arr!18356 a!2986) j!136)))))

(assert (=> b!637748 (= lt!294891 (select (store (arr!18356 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!637749 () Bool)

(assert (=> b!637749 (= e!364921 e!364920)))

(declare-fun res!412626 () Bool)

(assert (=> b!637749 (=> (not res!412626) (not e!364920))))

(declare-fun lt!294888 () SeekEntryResult!6796)

(assert (=> b!637749 (= res!412626 (or (= lt!294888 (MissingZero!6796 i!1108)) (= lt!294888 (MissingVacant!6796 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38267 (_ BitVec 32)) SeekEntryResult!6796)

(assert (=> b!637749 (= lt!294888 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!637751 () Bool)

(assert (=> b!637751 (= e!364927 e!364925)))

(declare-fun res!412632 () Bool)

(assert (=> b!637751 (=> res!412632 e!364925)))

(assert (=> b!637751 (= res!412632 (or (bvsge (size!18720 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18720 a!2986))))))

(assert (=> b!637751 (arrayContainsKey!0 lt!294881 (select (arr!18356 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!294889 () Unit!21518)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38267 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21518)

(assert (=> b!637751 (= lt!294889 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!294881 (select (arr!18356 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!637752 () Bool)

(declare-fun res!412641 () Bool)

(assert (=> b!637752 (=> (not res!412641) (not e!364921))))

(assert (=> b!637752 (= res!412641 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!637753 () Bool)

(declare-fun res!412643 () Bool)

(assert (=> b!637753 (=> res!412643 e!364925)))

(declare-fun contains!3111 (List!12397 (_ BitVec 64)) Bool)

(assert (=> b!637753 (= res!412643 (contains!3111 Nil!12394 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637754 () Bool)

(declare-fun e!364923 () Bool)

(declare-fun lt!294890 () SeekEntryResult!6796)

(assert (=> b!637754 (= e!364923 (= lt!294882 lt!294890))))

(declare-fun b!637755 () Bool)

(assert (=> b!637755 (= e!364920 e!364917)))

(declare-fun res!412631 () Bool)

(assert (=> b!637755 (=> (not res!412631) (not e!364917))))

(assert (=> b!637755 (= res!412631 (= (select (store (arr!18356 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!637755 (= lt!294881 (array!38268 (store (arr!18356 a!2986) i!1108 k!1786) (size!18720 a!2986)))))

(declare-fun b!637756 () Bool)

(declare-fun res!412636 () Bool)

(assert (=> b!637756 (=> (not res!412636) (not e!364920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38267 (_ BitVec 32)) Bool)

(assert (=> b!637756 (= res!412636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!637757 () Bool)

(declare-fun res!412639 () Bool)

(assert (=> b!637757 (=> (not res!412639) (not e!364921))))

(assert (=> b!637757 (= res!412639 (validKeyInArray!0 (select (arr!18356 a!2986) j!136)))))

(declare-fun b!637758 () Bool)

(assert (=> b!637758 (= e!364922 (not e!364926))))

(declare-fun res!412629 () Bool)

(assert (=> b!637758 (=> res!412629 e!364926)))

(declare-fun lt!294892 () SeekEntryResult!6796)

(assert (=> b!637758 (= res!412629 (not (= lt!294892 (Found!6796 index!984))))))

(declare-fun lt!294883 () Unit!21518)

(assert (=> b!637758 (= lt!294883 e!364919)))

(declare-fun c!72926 () Bool)

(assert (=> b!637758 (= c!72926 (= lt!294892 Undefined!6796))))

(assert (=> b!637758 (= lt!294892 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!294886 lt!294881 mask!3053))))

(assert (=> b!637758 e!364923))

(declare-fun res!412640 () Bool)

(assert (=> b!637758 (=> (not res!412640) (not e!364923))))

(declare-fun lt!294885 () (_ BitVec 32))

(assert (=> b!637758 (= res!412640 (= lt!294890 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294885 vacantSpotIndex!68 lt!294886 lt!294881 mask!3053)))))

(assert (=> b!637758 (= lt!294890 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!294885 vacantSpotIndex!68 (select (arr!18356 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!637758 (= lt!294886 (select (store (arr!18356 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!294887 () Unit!21518)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38267 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21518)

(assert (=> b!637758 (= lt!294887 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!294885 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!637758 (= lt!294885 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!637759 () Bool)

(assert (=> b!637759 (= e!364925 true)))

(declare-fun lt!294884 () Bool)

(assert (=> b!637759 (= lt!294884 (contains!3111 Nil!12394 k!1786))))

(declare-fun b!637760 () Bool)

(declare-fun e!364918 () Bool)

(assert (=> b!637760 (= e!364918 e!364929)))

(declare-fun res!412624 () Bool)

(assert (=> b!637760 (=> (not res!412624) (not e!364929))))

(assert (=> b!637760 (= res!412624 (arrayContainsKey!0 lt!294881 (select (arr!18356 a!2986) j!136) j!136))))

(declare-fun b!637761 () Bool)

(declare-fun res!412638 () Bool)

(assert (=> b!637761 (=> res!412638 e!364925)))

(assert (=> b!637761 (= res!412638 (contains!3111 Nil!12394 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!637750 () Bool)

(declare-fun Unit!21521 () Unit!21518)

(assert (=> b!637750 (= e!364919 Unit!21521)))

(declare-fun res!412630 () Bool)

(assert (=> start!57696 (=> (not res!412630) (not e!364921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57696 (= res!412630 (validMask!0 mask!3053))))

(assert (=> start!57696 e!364921))

(assert (=> start!57696 true))

(declare-fun array_inv!14152 (array!38267) Bool)

(assert (=> start!57696 (array_inv!14152 a!2986)))

(declare-fun b!637762 () Bool)

(assert (=> b!637762 (= e!364924 e!364918)))

(declare-fun res!412637 () Bool)

(assert (=> b!637762 (=> res!412637 e!364918)))

(assert (=> b!637762 (= res!412637 (or (not (= (select (arr!18356 a!2986) j!136) lt!294886)) (not (= (select (arr!18356 a!2986) j!136) lt!294891)) (bvsge j!136 index!984)))))

(declare-fun b!637763 () Bool)

(declare-fun res!412634 () Bool)

(assert (=> b!637763 (=> (not res!412634) (not e!364920))))

(assert (=> b!637763 (= res!412634 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18356 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!57696 res!412630) b!637747))

(assert (= (and b!637747 res!412635) b!637757))

(assert (= (and b!637757 res!412639) b!637741))

(assert (= (and b!637741 res!412642) b!637752))

(assert (= (and b!637752 res!412641) b!637749))

(assert (= (and b!637749 res!412626) b!637756))

(assert (= (and b!637756 res!412636) b!637746))

(assert (= (and b!637746 res!412627) b!637763))

(assert (= (and b!637763 res!412634) b!637755))

(assert (= (and b!637755 res!412631) b!637742))

(assert (= (and b!637742 res!412628) b!637758))

(assert (= (and b!637758 res!412640) b!637754))

(assert (= (and b!637758 c!72926) b!637744))

(assert (= (and b!637758 (not c!72926)) b!637750))

(assert (= (and b!637758 (not res!412629)) b!637748))

(assert (= (and b!637748 res!412633) b!637762))

(assert (= (and b!637762 (not res!412637)) b!637760))

(assert (= (and b!637760 res!412624) b!637745))

(assert (= (and b!637748 (not res!412625)) b!637751))

(assert (= (and b!637751 (not res!412632)) b!637743))

(assert (= (and b!637743 (not res!412623)) b!637753))

(assert (= (and b!637753 (not res!412643)) b!637761))

(assert (= (and b!637761 (not res!412638)) b!637759))

(declare-fun m!611773 () Bool)

(assert (=> start!57696 m!611773))

(declare-fun m!611775 () Bool)

(assert (=> start!57696 m!611775))

(declare-fun m!611777 () Bool)

(assert (=> b!637758 m!611777))

(declare-fun m!611779 () Bool)

(assert (=> b!637758 m!611779))

(declare-fun m!611781 () Bool)

(assert (=> b!637758 m!611781))

(declare-fun m!611783 () Bool)

(assert (=> b!637758 m!611783))

(assert (=> b!637758 m!611781))

(declare-fun m!611785 () Bool)

(assert (=> b!637758 m!611785))

(declare-fun m!611787 () Bool)

(assert (=> b!637758 m!611787))

(declare-fun m!611789 () Bool)

(assert (=> b!637758 m!611789))

(declare-fun m!611791 () Bool)

(assert (=> b!637758 m!611791))

(assert (=> b!637745 m!611781))

(assert (=> b!637745 m!611781))

(declare-fun m!611793 () Bool)

(assert (=> b!637745 m!611793))

(declare-fun m!611795 () Bool)

(assert (=> b!637743 m!611795))

(assert (=> b!637760 m!611781))

(assert (=> b!637760 m!611781))

(declare-fun m!611797 () Bool)

(assert (=> b!637760 m!611797))

(declare-fun m!611799 () Bool)

(assert (=> b!637742 m!611799))

(assert (=> b!637742 m!611781))

(assert (=> b!637742 m!611781))

(declare-fun m!611801 () Bool)

(assert (=> b!637742 m!611801))

(declare-fun m!611803 () Bool)

(assert (=> b!637761 m!611803))

(assert (=> b!637751 m!611781))

(assert (=> b!637751 m!611781))

(declare-fun m!611805 () Bool)

(assert (=> b!637751 m!611805))

(assert (=> b!637751 m!611781))

(declare-fun m!611807 () Bool)

(assert (=> b!637751 m!611807))

(declare-fun m!611809 () Bool)

(assert (=> b!637753 m!611809))

(declare-fun m!611811 () Bool)

(assert (=> b!637763 m!611811))

(assert (=> b!637748 m!611781))

(assert (=> b!637748 m!611785))

(declare-fun m!611813 () Bool)

(assert (=> b!637748 m!611813))

(assert (=> b!637757 m!611781))

(assert (=> b!637757 m!611781))

(declare-fun m!611815 () Bool)

(assert (=> b!637757 m!611815))

(declare-fun m!611817 () Bool)

(assert (=> b!637746 m!611817))

(declare-fun m!611819 () Bool)

(assert (=> b!637759 m!611819))

(declare-fun m!611821 () Bool)

(assert (=> b!637749 m!611821))

(declare-fun m!611823 () Bool)

(assert (=> b!637756 m!611823))

(declare-fun m!611825 () Bool)

(assert (=> b!637741 m!611825))

(assert (=> b!637762 m!611781))

(assert (=> b!637755 m!611785))

(declare-fun m!611827 () Bool)

(assert (=> b!637755 m!611827))

(declare-fun m!611829 () Bool)

(assert (=> b!637752 m!611829))

(push 1)

