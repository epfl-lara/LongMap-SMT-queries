; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54914 () Bool)

(assert start!54914)

(declare-fun b!601422 () Bool)

(declare-fun e!343884 () Bool)

(declare-fun e!343888 () Bool)

(assert (=> b!601422 (= e!343884 e!343888)))

(declare-fun res!386193 () Bool)

(assert (=> b!601422 (=> (not res!386193) (not e!343888))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6274 0))(
  ( (MissingZero!6274 (index!27353 (_ BitVec 32))) (Found!6274 (index!27354 (_ BitVec 32))) (Intermediate!6274 (undefined!7086 Bool) (index!27355 (_ BitVec 32)) (x!56145 (_ BitVec 32))) (Undefined!6274) (MissingVacant!6274 (index!27356 (_ BitVec 32))) )
))
(declare-fun lt!273799 () SeekEntryResult!6274)

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37149 0))(
  ( (array!37150 (arr!17834 (Array (_ BitVec 32) (_ BitVec 64))) (size!18198 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37149)

(assert (=> b!601422 (= res!386193 (and (= lt!273799 (Found!6274 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17834 a!2986) index!984) (select (arr!17834 a!2986) j!136))) (not (= (select (arr!17834 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37149 (_ BitVec 32)) SeekEntryResult!6274)

(assert (=> b!601422 (= lt!273799 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17834 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601423 () Bool)

(declare-datatypes ((Unit!19024 0))(
  ( (Unit!19025) )
))
(declare-fun e!343887 () Unit!19024)

(declare-fun Unit!19026 () Unit!19024)

(assert (=> b!601423 (= e!343887 Unit!19026)))

(declare-fun b!601424 () Bool)

(declare-fun e!343896 () Bool)

(declare-fun lt!273790 () SeekEntryResult!6274)

(assert (=> b!601424 (= e!343896 (= lt!273799 lt!273790))))

(declare-fun b!601425 () Bool)

(declare-fun e!343895 () Bool)

(declare-fun e!343891 () Bool)

(assert (=> b!601425 (= e!343895 e!343891)))

(declare-fun res!386184 () Bool)

(assert (=> b!601425 (=> (not res!386184) (not e!343891))))

(declare-fun lt!273795 () array!37149)

(declare-fun arrayContainsKey!0 (array!37149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601425 (= res!386184 (arrayContainsKey!0 lt!273795 (select (arr!17834 a!2986) j!136) j!136))))

(declare-fun b!601426 () Bool)

(declare-fun res!386186 () Bool)

(declare-fun e!343886 () Bool)

(assert (=> b!601426 (=> (not res!386186) (not e!343886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37149 (_ BitVec 32)) Bool)

(assert (=> b!601426 (= res!386186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601427 () Bool)

(declare-fun res!386192 () Bool)

(declare-fun e!343892 () Bool)

(assert (=> b!601427 (=> (not res!386192) (not e!343892))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601427 (= res!386192 (validKeyInArray!0 k!1786))))

(declare-fun b!601428 () Bool)

(declare-fun e!343889 () Bool)

(assert (=> b!601428 (= e!343888 (not e!343889))))

(declare-fun res!386196 () Bool)

(assert (=> b!601428 (=> res!386196 e!343889)))

(declare-fun lt!273786 () SeekEntryResult!6274)

(assert (=> b!601428 (= res!386196 (not (= lt!273786 (Found!6274 index!984))))))

(declare-fun lt!273787 () Unit!19024)

(declare-fun e!343885 () Unit!19024)

(assert (=> b!601428 (= lt!273787 e!343885)))

(declare-fun c!67987 () Bool)

(assert (=> b!601428 (= c!67987 (= lt!273786 Undefined!6274))))

(declare-fun lt!273788 () (_ BitVec 64))

(assert (=> b!601428 (= lt!273786 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273788 lt!273795 mask!3053))))

(assert (=> b!601428 e!343896))

(declare-fun res!386194 () Bool)

(assert (=> b!601428 (=> (not res!386194) (not e!343896))))

(declare-fun lt!273793 () (_ BitVec 32))

(assert (=> b!601428 (= res!386194 (= lt!273790 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273793 vacantSpotIndex!68 lt!273788 lt!273795 mask!3053)))))

(assert (=> b!601428 (= lt!273790 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273793 vacantSpotIndex!68 (select (arr!17834 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!601428 (= lt!273788 (select (store (arr!17834 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!273794 () Unit!19024)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37149 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19024)

(assert (=> b!601428 (= lt!273794 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273793 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601428 (= lt!273793 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!601429 () Bool)

(assert (=> b!601429 (= e!343886 e!343884)))

(declare-fun res!386182 () Bool)

(assert (=> b!601429 (=> (not res!386182) (not e!343884))))

(assert (=> b!601429 (= res!386182 (= (select (store (arr!17834 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!601429 (= lt!273795 (array!37150 (store (arr!17834 a!2986) i!1108 k!1786) (size!18198 a!2986)))))

(declare-fun b!601430 () Bool)

(declare-fun res!386198 () Bool)

(assert (=> b!601430 (=> (not res!386198) (not e!343886))))

(assert (=> b!601430 (= res!386198 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17834 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!601431 () Bool)

(declare-fun res!386185 () Bool)

(assert (=> b!601431 (=> (not res!386185) (not e!343892))))

(assert (=> b!601431 (= res!386185 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!601432 () Bool)

(declare-fun res!386188 () Bool)

(assert (=> b!601432 (=> (not res!386188) (not e!343892))))

(assert (=> b!601432 (= res!386188 (validKeyInArray!0 (select (arr!17834 a!2986) j!136)))))

(declare-fun b!601433 () Bool)

(declare-fun e!343890 () Bool)

(assert (=> b!601433 (= e!343889 e!343890)))

(declare-fun res!386187 () Bool)

(assert (=> b!601433 (=> res!386187 e!343890)))

(declare-fun lt!273797 () (_ BitVec 64))

(assert (=> b!601433 (= res!386187 (or (not (= (select (arr!17834 a!2986) j!136) lt!273788)) (not (= (select (arr!17834 a!2986) j!136) lt!273797))))))

(declare-fun e!343893 () Bool)

(assert (=> b!601433 e!343893))

(declare-fun res!386189 () Bool)

(assert (=> b!601433 (=> (not res!386189) (not e!343893))))

(assert (=> b!601433 (= res!386189 (= lt!273797 (select (arr!17834 a!2986) j!136)))))

(assert (=> b!601433 (= lt!273797 (select (store (arr!17834 a!2986) i!1108 k!1786) index!984))))

(declare-fun res!386183 () Bool)

(assert (=> start!54914 (=> (not res!386183) (not e!343892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54914 (= res!386183 (validMask!0 mask!3053))))

(assert (=> start!54914 e!343892))

(assert (=> start!54914 true))

(declare-fun array_inv!13630 (array!37149) Bool)

(assert (=> start!54914 (array_inv!13630 a!2986)))

(declare-fun b!601434 () Bool)

(declare-fun res!386197 () Bool)

(assert (=> b!601434 (=> (not res!386197) (not e!343892))))

(assert (=> b!601434 (= res!386197 (and (= (size!18198 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18198 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18198 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601435 () Bool)

(assert (=> b!601435 (= e!343891 (arrayContainsKey!0 lt!273795 (select (arr!17834 a!2986) j!136) index!984))))

(declare-fun b!601436 () Bool)

(declare-fun Unit!19027 () Unit!19024)

(assert (=> b!601436 (= e!343885 Unit!19027)))

(assert (=> b!601436 false))

(declare-fun b!601437 () Bool)

(declare-fun res!386190 () Bool)

(assert (=> b!601437 (=> (not res!386190) (not e!343886))))

(declare-datatypes ((List!11875 0))(
  ( (Nil!11872) (Cons!11871 (h!12916 (_ BitVec 64)) (t!18103 List!11875)) )
))
(declare-fun arrayNoDuplicates!0 (array!37149 (_ BitVec 32) List!11875) Bool)

(assert (=> b!601437 (= res!386190 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11872))))

(declare-fun b!601438 () Bool)

(assert (=> b!601438 (= e!343893 e!343895)))

(declare-fun res!386195 () Bool)

(assert (=> b!601438 (=> res!386195 e!343895)))

(assert (=> b!601438 (= res!386195 (or (not (= (select (arr!17834 a!2986) j!136) lt!273788)) (not (= (select (arr!17834 a!2986) j!136) lt!273797)) (bvsge j!136 index!984)))))

(declare-fun b!601439 () Bool)

(declare-fun Unit!19028 () Unit!19024)

(assert (=> b!601439 (= e!343885 Unit!19028)))

(declare-fun b!601440 () Bool)

(assert (=> b!601440 (= e!343890 true)))

(declare-fun lt!273792 () Unit!19024)

(assert (=> b!601440 (= lt!273792 e!343887)))

(declare-fun c!67988 () Bool)

(assert (=> b!601440 (= c!67988 (bvslt j!136 index!984))))

(declare-fun b!601441 () Bool)

(assert (=> b!601441 (= e!343892 e!343886)))

(declare-fun res!386191 () Bool)

(assert (=> b!601441 (=> (not res!386191) (not e!343886))))

(declare-fun lt!273798 () SeekEntryResult!6274)

(assert (=> b!601441 (= res!386191 (or (= lt!273798 (MissingZero!6274 i!1108)) (= lt!273798 (MissingVacant!6274 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37149 (_ BitVec 32)) SeekEntryResult!6274)

(assert (=> b!601441 (= lt!273798 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!601442 () Bool)

(declare-fun Unit!19029 () Unit!19024)

(assert (=> b!601442 (= e!343887 Unit!19029)))

(declare-fun lt!273785 () Unit!19024)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37149 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19024)

(assert (=> b!601442 (= lt!273785 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273795 (select (arr!17834 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!601442 (arrayContainsKey!0 lt!273795 (select (arr!17834 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273791 () Unit!19024)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37149 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11875) Unit!19024)

(assert (=> b!601442 (= lt!273791 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11872))))

(assert (=> b!601442 (arrayNoDuplicates!0 lt!273795 #b00000000000000000000000000000000 Nil!11872)))

(declare-fun lt!273789 () Unit!19024)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37149 (_ BitVec 32) (_ BitVec 32)) Unit!19024)

(assert (=> b!601442 (= lt!273789 (lemmaNoDuplicateFromThenFromBigger!0 lt!273795 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601442 (arrayNoDuplicates!0 lt!273795 j!136 Nil!11872)))

(declare-fun lt!273796 () Unit!19024)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37149 (_ BitVec 64) (_ BitVec 32) List!11875) Unit!19024)

(assert (=> b!601442 (= lt!273796 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273795 (select (arr!17834 a!2986) j!136) j!136 Nil!11872))))

(assert (=> b!601442 false))

(assert (= (and start!54914 res!386183) b!601434))

(assert (= (and b!601434 res!386197) b!601432))

(assert (= (and b!601432 res!386188) b!601427))

(assert (= (and b!601427 res!386192) b!601431))

(assert (= (and b!601431 res!386185) b!601441))

(assert (= (and b!601441 res!386191) b!601426))

(assert (= (and b!601426 res!386186) b!601437))

(assert (= (and b!601437 res!386190) b!601430))

(assert (= (and b!601430 res!386198) b!601429))

(assert (= (and b!601429 res!386182) b!601422))

(assert (= (and b!601422 res!386193) b!601428))

(assert (= (and b!601428 res!386194) b!601424))

(assert (= (and b!601428 c!67987) b!601436))

(assert (= (and b!601428 (not c!67987)) b!601439))

(assert (= (and b!601428 (not res!386196)) b!601433))

(assert (= (and b!601433 res!386189) b!601438))

(assert (= (and b!601438 (not res!386195)) b!601425))

(assert (= (and b!601425 res!386184) b!601435))

(assert (= (and b!601433 (not res!386187)) b!601440))

(assert (= (and b!601440 c!67988) b!601442))

(assert (= (and b!601440 (not c!67988)) b!601423))

(declare-fun m!578609 () Bool)

(assert (=> b!601422 m!578609))

(declare-fun m!578611 () Bool)

(assert (=> b!601422 m!578611))

(assert (=> b!601422 m!578611))

(declare-fun m!578613 () Bool)

(assert (=> b!601422 m!578613))

(assert (=> b!601435 m!578611))

(assert (=> b!601435 m!578611))

(declare-fun m!578615 () Bool)

(assert (=> b!601435 m!578615))

(assert (=> b!601438 m!578611))

(declare-fun m!578617 () Bool)

(assert (=> b!601437 m!578617))

(assert (=> b!601432 m!578611))

(assert (=> b!601432 m!578611))

(declare-fun m!578619 () Bool)

(assert (=> b!601432 m!578619))

(assert (=> b!601425 m!578611))

(assert (=> b!601425 m!578611))

(declare-fun m!578621 () Bool)

(assert (=> b!601425 m!578621))

(declare-fun m!578623 () Bool)

(assert (=> b!601429 m!578623))

(declare-fun m!578625 () Bool)

(assert (=> b!601429 m!578625))

(declare-fun m!578627 () Bool)

(assert (=> b!601430 m!578627))

(assert (=> b!601433 m!578611))

(assert (=> b!601433 m!578623))

(declare-fun m!578629 () Bool)

(assert (=> b!601433 m!578629))

(declare-fun m!578631 () Bool)

(assert (=> b!601427 m!578631))

(declare-fun m!578633 () Bool)

(assert (=> b!601428 m!578633))

(declare-fun m!578635 () Bool)

(assert (=> b!601428 m!578635))

(assert (=> b!601428 m!578611))

(assert (=> b!601428 m!578623))

(declare-fun m!578637 () Bool)

(assert (=> b!601428 m!578637))

(declare-fun m!578639 () Bool)

(assert (=> b!601428 m!578639))

(assert (=> b!601428 m!578611))

(declare-fun m!578641 () Bool)

(assert (=> b!601428 m!578641))

(declare-fun m!578643 () Bool)

(assert (=> b!601428 m!578643))

(declare-fun m!578645 () Bool)

(assert (=> start!54914 m!578645))

(declare-fun m!578647 () Bool)

(assert (=> start!54914 m!578647))

(declare-fun m!578649 () Bool)

(assert (=> b!601431 m!578649))

(declare-fun m!578651 () Bool)

(assert (=> b!601426 m!578651))

(assert (=> b!601442 m!578611))

(declare-fun m!578653 () Bool)

(assert (=> b!601442 m!578653))

(assert (=> b!601442 m!578611))

(declare-fun m!578655 () Bool)

(assert (=> b!601442 m!578655))

(declare-fun m!578657 () Bool)

(assert (=> b!601442 m!578657))

(assert (=> b!601442 m!578611))

(declare-fun m!578659 () Bool)

(assert (=> b!601442 m!578659))

(declare-fun m!578661 () Bool)

(assert (=> b!601442 m!578661))

(declare-fun m!578663 () Bool)

(assert (=> b!601442 m!578663))

(assert (=> b!601442 m!578611))

(declare-fun m!578665 () Bool)

(assert (=> b!601442 m!578665))

(declare-fun m!578667 () Bool)

(assert (=> b!601441 m!578667))

(push 1)

