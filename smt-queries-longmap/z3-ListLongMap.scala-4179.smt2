; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56992 () Bool)

(assert start!56992)

(declare-fun b!630781 () Bool)

(declare-fun e!360682 () Bool)

(declare-fun e!360685 () Bool)

(assert (=> b!630781 (= e!360682 e!360685)))

(declare-fun res!407777 () Bool)

(assert (=> b!630781 (=> (not res!407777) (not e!360685))))

(declare-datatypes ((SeekEntryResult!6708 0))(
  ( (MissingZero!6708 (index!29122 (_ BitVec 32))) (Found!6708 (index!29123 (_ BitVec 32))) (Intermediate!6708 (undefined!7520 Bool) (index!29124 (_ BitVec 32)) (x!57862 (_ BitVec 32))) (Undefined!6708) (MissingVacant!6708 (index!29125 (_ BitVec 32))) )
))
(declare-fun lt!291358 () SeekEntryResult!6708)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!630781 (= res!407777 (or (= lt!291358 (MissingZero!6708 i!1108)) (= lt!291358 (MissingVacant!6708 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-datatypes ((array!38068 0))(
  ( (array!38069 (arr!18268 (Array (_ BitVec 32) (_ BitVec 64))) (size!18632 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38068)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38068 (_ BitVec 32)) SeekEntryResult!6708)

(assert (=> b!630781 (= lt!291358 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!630783 () Bool)

(declare-fun e!360681 () Bool)

(declare-fun e!360683 () Bool)

(assert (=> b!630783 (= e!360681 e!360683)))

(declare-fun res!407773 () Bool)

(assert (=> b!630783 (=> (not res!407773) (not e!360683))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!291357 () SeekEntryResult!6708)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!630783 (= res!407773 (and (= lt!291357 (Found!6708 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18268 a!2986) index!984) (select (arr!18268 a!2986) j!136))) (not (= (select (arr!18268 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38068 (_ BitVec 32)) SeekEntryResult!6708)

(assert (=> b!630783 (= lt!291357 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18268 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!630784 () Bool)

(declare-fun res!407772 () Bool)

(assert (=> b!630784 (=> (not res!407772) (not e!360682))))

(declare-fun arrayContainsKey!0 (array!38068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!630784 (= res!407772 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!630785 () Bool)

(assert (=> b!630785 (= e!360683 (not true))))

(declare-datatypes ((Unit!21166 0))(
  ( (Unit!21167) )
))
(declare-fun lt!291354 () Unit!21166)

(declare-fun e!360686 () Unit!21166)

(assert (=> b!630785 (= lt!291354 e!360686)))

(declare-fun lt!291353 () array!38068)

(declare-fun c!71873 () Bool)

(declare-fun lt!291355 () (_ BitVec 64))

(assert (=> b!630785 (= c!71873 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!291355 lt!291353 mask!3053) Undefined!6708))))

(declare-fun e!360687 () Bool)

(assert (=> b!630785 e!360687))

(declare-fun res!407771 () Bool)

(assert (=> b!630785 (=> (not res!407771) (not e!360687))))

(declare-fun lt!291352 () (_ BitVec 32))

(declare-fun lt!291351 () SeekEntryResult!6708)

(assert (=> b!630785 (= res!407771 (= lt!291351 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291352 vacantSpotIndex!68 lt!291355 lt!291353 mask!3053)))))

(assert (=> b!630785 (= lt!291351 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!291352 vacantSpotIndex!68 (select (arr!18268 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!630785 (= lt!291355 (select (store (arr!18268 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!291356 () Unit!21166)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38068 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21166)

(assert (=> b!630785 (= lt!291356 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!291352 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!630785 (= lt!291352 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!630786 () Bool)

(declare-fun res!407774 () Bool)

(assert (=> b!630786 (=> (not res!407774) (not e!360682))))

(assert (=> b!630786 (= res!407774 (and (= (size!18632 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18632 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18632 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!630787 () Bool)

(assert (=> b!630787 (= e!360687 (= lt!291357 lt!291351))))

(declare-fun b!630788 () Bool)

(declare-fun res!407770 () Bool)

(assert (=> b!630788 (=> (not res!407770) (not e!360685))))

(declare-datatypes ((List!12309 0))(
  ( (Nil!12306) (Cons!12305 (h!13350 (_ BitVec 64)) (t!18537 List!12309)) )
))
(declare-fun arrayNoDuplicates!0 (array!38068 (_ BitVec 32) List!12309) Bool)

(assert (=> b!630788 (= res!407770 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12306))))

(declare-fun b!630782 () Bool)

(assert (=> b!630782 (= e!360685 e!360681)))

(declare-fun res!407779 () Bool)

(assert (=> b!630782 (=> (not res!407779) (not e!360681))))

(assert (=> b!630782 (= res!407779 (= (select (store (arr!18268 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!630782 (= lt!291353 (array!38069 (store (arr!18268 a!2986) i!1108 k0!1786) (size!18632 a!2986)))))

(declare-fun res!407780 () Bool)

(assert (=> start!56992 (=> (not res!407780) (not e!360682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56992 (= res!407780 (validMask!0 mask!3053))))

(assert (=> start!56992 e!360682))

(assert (=> start!56992 true))

(declare-fun array_inv!14064 (array!38068) Bool)

(assert (=> start!56992 (array_inv!14064 a!2986)))

(declare-fun b!630789 () Bool)

(declare-fun Unit!21168 () Unit!21166)

(assert (=> b!630789 (= e!360686 Unit!21168)))

(assert (=> b!630789 false))

(declare-fun b!630790 () Bool)

(declare-fun res!407778 () Bool)

(assert (=> b!630790 (=> (not res!407778) (not e!360682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!630790 (= res!407778 (validKeyInArray!0 k0!1786))))

(declare-fun b!630791 () Bool)

(declare-fun res!407776 () Bool)

(assert (=> b!630791 (=> (not res!407776) (not e!360682))))

(assert (=> b!630791 (= res!407776 (validKeyInArray!0 (select (arr!18268 a!2986) j!136)))))

(declare-fun b!630792 () Bool)

(declare-fun res!407775 () Bool)

(assert (=> b!630792 (=> (not res!407775) (not e!360685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38068 (_ BitVec 32)) Bool)

(assert (=> b!630792 (= res!407775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!630793 () Bool)

(declare-fun Unit!21169 () Unit!21166)

(assert (=> b!630793 (= e!360686 Unit!21169)))

(declare-fun b!630794 () Bool)

(declare-fun res!407769 () Bool)

(assert (=> b!630794 (=> (not res!407769) (not e!360685))))

(assert (=> b!630794 (= res!407769 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18268 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56992 res!407780) b!630786))

(assert (= (and b!630786 res!407774) b!630791))

(assert (= (and b!630791 res!407776) b!630790))

(assert (= (and b!630790 res!407778) b!630784))

(assert (= (and b!630784 res!407772) b!630781))

(assert (= (and b!630781 res!407777) b!630792))

(assert (= (and b!630792 res!407775) b!630788))

(assert (= (and b!630788 res!407770) b!630794))

(assert (= (and b!630794 res!407769) b!630782))

(assert (= (and b!630782 res!407779) b!630783))

(assert (= (and b!630783 res!407773) b!630785))

(assert (= (and b!630785 res!407771) b!630787))

(assert (= (and b!630785 c!71873) b!630789))

(assert (= (and b!630785 (not c!71873)) b!630793))

(declare-fun m!605743 () Bool)

(assert (=> b!630792 m!605743))

(declare-fun m!605745 () Bool)

(assert (=> b!630785 m!605745))

(declare-fun m!605747 () Bool)

(assert (=> b!630785 m!605747))

(declare-fun m!605749 () Bool)

(assert (=> b!630785 m!605749))

(declare-fun m!605751 () Bool)

(assert (=> b!630785 m!605751))

(assert (=> b!630785 m!605751))

(declare-fun m!605753 () Bool)

(assert (=> b!630785 m!605753))

(declare-fun m!605755 () Bool)

(assert (=> b!630785 m!605755))

(declare-fun m!605757 () Bool)

(assert (=> b!630785 m!605757))

(declare-fun m!605759 () Bool)

(assert (=> b!630785 m!605759))

(declare-fun m!605761 () Bool)

(assert (=> b!630794 m!605761))

(declare-fun m!605763 () Bool)

(assert (=> b!630784 m!605763))

(assert (=> b!630791 m!605751))

(assert (=> b!630791 m!605751))

(declare-fun m!605765 () Bool)

(assert (=> b!630791 m!605765))

(declare-fun m!605767 () Bool)

(assert (=> start!56992 m!605767))

(declare-fun m!605769 () Bool)

(assert (=> start!56992 m!605769))

(declare-fun m!605771 () Bool)

(assert (=> b!630781 m!605771))

(assert (=> b!630782 m!605759))

(declare-fun m!605773 () Bool)

(assert (=> b!630782 m!605773))

(declare-fun m!605775 () Bool)

(assert (=> b!630790 m!605775))

(declare-fun m!605777 () Bool)

(assert (=> b!630783 m!605777))

(assert (=> b!630783 m!605751))

(assert (=> b!630783 m!605751))

(declare-fun m!605779 () Bool)

(assert (=> b!630783 m!605779))

(declare-fun m!605781 () Bool)

(assert (=> b!630788 m!605781))

(check-sat (not b!630790) (not b!630791) (not b!630788) (not b!630785) (not start!56992) (not b!630781) (not b!630784) (not b!630783) (not b!630792))
(check-sat)
