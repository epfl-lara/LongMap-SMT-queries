; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53128 () Bool)

(assert start!53128)

(declare-fun b!577860 () Bool)

(declare-fun res!365752 () Bool)

(declare-fun e!332362 () Bool)

(assert (=> b!577860 (=> (not res!365752) (not e!332362))))

(declare-datatypes ((array!36074 0))(
  ( (array!36075 (arr!17313 (Array (_ BitVec 32) (_ BitVec 64))) (size!17677 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36074)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36074 (_ BitVec 32)) Bool)

(assert (=> b!577860 (= res!365752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!577861 () Bool)

(declare-fun res!365750 () Bool)

(assert (=> b!577861 (=> (not res!365750) (not e!332362))))

(assert (=> b!577861 (= res!365750 (and (bvsle #b00000000000000000000000000000000 (size!17677 a!2986)) (bvslt (size!17677 a!2986) #b01111111111111111111111111111111)))))

(declare-fun b!577862 () Bool)

(declare-fun e!332363 () Bool)

(assert (=> b!577862 (= e!332362 e!332363)))

(declare-fun res!365748 () Bool)

(assert (=> b!577862 (=> res!365748 e!332363)))

(declare-datatypes ((List!11354 0))(
  ( (Nil!11351) (Cons!11350 (h!12395 (_ BitVec 64)) (t!17582 List!11354)) )
))
(declare-fun contains!2902 (List!11354 (_ BitVec 64)) Bool)

(assert (=> b!577862 (= res!365748 (contains!2902 Nil!11351 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!577863 () Bool)

(declare-fun res!365754 () Bool)

(declare-fun e!332361 () Bool)

(assert (=> b!577863 (=> (not res!365754) (not e!332361))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577863 (= res!365754 (validKeyInArray!0 k!1786))))

(declare-fun b!577864 () Bool)

(assert (=> b!577864 (= e!332363 (contains!2902 Nil!11351 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!365756 () Bool)

(assert (=> start!53128 (=> (not res!365756) (not e!332361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53128 (= res!365756 (validMask!0 mask!3053))))

(assert (=> start!53128 e!332361))

(assert (=> start!53128 true))

(declare-fun array_inv!13109 (array!36074) Bool)

(assert (=> start!53128 (array_inv!13109 a!2986)))

(declare-fun b!577859 () Bool)

(assert (=> b!577859 (= e!332361 e!332362)))

(declare-fun res!365751 () Bool)

(assert (=> b!577859 (=> (not res!365751) (not e!332362))))

(declare-datatypes ((SeekEntryResult!5753 0))(
  ( (MissingZero!5753 (index!25239 (_ BitVec 32))) (Found!5753 (index!25240 (_ BitVec 32))) (Intermediate!5753 (undefined!6565 Bool) (index!25241 (_ BitVec 32)) (x!54150 (_ BitVec 32))) (Undefined!5753) (MissingVacant!5753 (index!25242 (_ BitVec 32))) )
))
(declare-fun lt!264097 () SeekEntryResult!5753)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577859 (= res!365751 (or (= lt!264097 (MissingZero!5753 i!1108)) (= lt!264097 (MissingVacant!5753 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36074 (_ BitVec 32)) SeekEntryResult!5753)

(assert (=> b!577859 (= lt!264097 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577865 () Bool)

(declare-fun res!365747 () Bool)

(assert (=> b!577865 (=> (not res!365747) (not e!332361))))

(declare-fun arrayContainsKey!0 (array!36074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577865 (= res!365747 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577866 () Bool)

(declare-fun res!365753 () Bool)

(assert (=> b!577866 (=> (not res!365753) (not e!332361))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577866 (= res!365753 (and (= (size!17677 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17677 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17677 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577867 () Bool)

(declare-fun res!365755 () Bool)

(assert (=> b!577867 (=> (not res!365755) (not e!332361))))

(assert (=> b!577867 (= res!365755 (validKeyInArray!0 (select (arr!17313 a!2986) j!136)))))

(declare-fun b!577868 () Bool)

(declare-fun res!365749 () Bool)

(assert (=> b!577868 (=> (not res!365749) (not e!332362))))

(declare-fun noDuplicate!228 (List!11354) Bool)

(assert (=> b!577868 (= res!365749 (noDuplicate!228 Nil!11351))))

(assert (= (and start!53128 res!365756) b!577866))

(assert (= (and b!577866 res!365753) b!577867))

(assert (= (and b!577867 res!365755) b!577863))

(assert (= (and b!577863 res!365754) b!577865))

(assert (= (and b!577865 res!365747) b!577859))

(assert (= (and b!577859 res!365751) b!577860))

(assert (= (and b!577860 res!365752) b!577861))

(assert (= (and b!577861 res!365750) b!577868))

(assert (= (and b!577868 res!365749) b!577862))

(assert (= (and b!577862 (not res!365748)) b!577864))

(declare-fun m!556627 () Bool)

(assert (=> b!577863 m!556627))

(declare-fun m!556629 () Bool)

(assert (=> b!577865 m!556629))

(declare-fun m!556631 () Bool)

(assert (=> b!577862 m!556631))

(declare-fun m!556633 () Bool)

(assert (=> start!53128 m!556633))

(declare-fun m!556635 () Bool)

(assert (=> start!53128 m!556635))

(declare-fun m!556637 () Bool)

(assert (=> b!577868 m!556637))

(declare-fun m!556639 () Bool)

(assert (=> b!577860 m!556639))

(declare-fun m!556641 () Bool)

(assert (=> b!577859 m!556641))

(declare-fun m!556643 () Bool)

(assert (=> b!577864 m!556643))

(declare-fun m!556645 () Bool)

(assert (=> b!577867 m!556645))

(assert (=> b!577867 m!556645))

(declare-fun m!556647 () Bool)

(assert (=> b!577867 m!556647))

(push 1)

(assert (not b!577864))

(assert (not b!577863))

(assert (not b!577868))

(assert (not start!53128))

(assert (not b!577862))

(assert (not b!577859))

(assert (not b!577860))

(assert (not b!577865))

(assert (not b!577867))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85643 () Bool)

(declare-fun lt!264109 () Bool)

(declare-fun content!232 (List!11354) (Set (_ BitVec 64)))

(assert (=> d!85643 (= lt!264109 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!232 Nil!11351)))))

(declare-fun e!332403 () Bool)

(assert (=> d!85643 (= lt!264109 e!332403)))

(declare-fun res!365832 () Bool)

(assert (=> d!85643 (=> (not res!365832) (not e!332403))))

(assert (=> d!85643 (= res!365832 (is-Cons!11350 Nil!11351))))

(assert (=> d!85643 (= (contains!2902 Nil!11351 #b1000000000000000000000000000000000000000000000000000000000000000) lt!264109)))

(declare-fun b!577943 () Bool)

(declare-fun e!332404 () Bool)

(assert (=> b!577943 (= e!332403 e!332404)))

(declare-fun res!365831 () Bool)

(assert (=> b!577943 (=> res!365831 e!332404)))

(assert (=> b!577943 (= res!365831 (= (h!12395 Nil!11351) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!577944 () Bool)

(assert (=> b!577944 (= e!332404 (contains!2902 (t!17582 Nil!11351) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!85643 res!365832) b!577943))

(assert (= (and b!577943 (not res!365831)) b!577944))

(declare-fun m!556699 () Bool)

(assert (=> d!85643 m!556699))

(declare-fun m!556701 () Bool)

(assert (=> d!85643 m!556701))

(declare-fun m!556703 () Bool)

(assert (=> b!577944 m!556703))

(assert (=> b!577864 d!85643))

(declare-fun d!85647 () Bool)

(declare-fun lt!264131 () SeekEntryResult!5753)

(assert (=> d!85647 (and (or (is-Undefined!5753 lt!264131) (not (is-Found!5753 lt!264131)) (and (bvsge (index!25240 lt!264131) #b00000000000000000000000000000000) (bvslt (index!25240 lt!264131) (size!17677 a!2986)))) (or (is-Undefined!5753 lt!264131) (is-Found!5753 lt!264131) (not (is-MissingZero!5753 lt!264131)) (and (bvsge (index!25239 lt!264131) #b00000000000000000000000000000000) (bvslt (index!25239 lt!264131) (size!17677 a!2986)))) (or (is-Undefined!5753 lt!264131) (is-Found!5753 lt!264131) (is-MissingZero!5753 lt!264131) (not (is-MissingVacant!5753 lt!264131)) (and (bvsge (index!25242 lt!264131) #b00000000000000000000000000000000) (bvslt (index!25242 lt!264131) (size!17677 a!2986)))) (or (is-Undefined!5753 lt!264131) (ite (is-Found!5753 lt!264131) (= (select (arr!17313 a!2986) (index!25240 lt!264131)) k!1786) (ite (is-MissingZero!5753 lt!264131) (= (select (arr!17313 a!2986) (index!25239 lt!264131)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5753 lt!264131) (= (select (arr!17313 a!2986) (index!25242 lt!264131)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!332438 () SeekEntryResult!5753)

(assert (=> d!85647 (= lt!264131 e!332438)))

(declare-fun c!66440 () Bool)

(declare-fun lt!264129 () SeekEntryResult!5753)

(assert (=> d!85647 (= c!66440 (and (is-Intermediate!5753 lt!264129) (undefined!6565 lt!264129)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36074 (_ BitVec 32)) SeekEntryResult!5753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85647 (= lt!264129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!85647 (validMask!0 mask!3053)))

(assert (=> d!85647 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!264131)))

(declare-fun e!332436 () SeekEntryResult!5753)

(declare-fun b!577991 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36074 (_ BitVec 32)) SeekEntryResult!5753)

(assert (=> b!577991 (= e!332436 (seekKeyOrZeroReturnVacant!0 (x!54150 lt!264129) (index!25241 lt!264129) (index!25241 lt!264129) k!1786 a!2986 mask!3053))))

(declare-fun b!577992 () Bool)

(declare-fun e!332437 () SeekEntryResult!5753)

(assert (=> b!577992 (= e!332437 (Found!5753 (index!25241 lt!264129)))))

(declare-fun b!577993 () Bool)

(assert (=> b!577993 (= e!332436 (MissingZero!5753 (index!25241 lt!264129)))))

(declare-fun b!577994 () Bool)

(assert (=> b!577994 (= e!332438 Undefined!5753)))

(declare-fun b!577995 () Bool)

(declare-fun c!66439 () Bool)

(declare-fun lt!264130 () (_ BitVec 64))

(assert (=> b!577995 (= c!66439 (= lt!264130 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!577995 (= e!332437 e!332436)))

(declare-fun b!577996 () Bool)

(assert (=> b!577996 (= e!332438 e!332437)))

(assert (=> b!577996 (= lt!264130 (select (arr!17313 a!2986) (index!25241 lt!264129)))))

(declare-fun c!66438 () Bool)

(assert (=> b!577996 (= c!66438 (= lt!264130 k!1786))))

(assert (= (and d!85647 c!66440) b!577994))

(assert (= (and d!85647 (not c!66440)) b!577996))

(assert (= (and b!577996 c!66438) b!577992))

(assert (= (and b!577996 (not c!66438)) b!577995))

(assert (= (and b!577995 c!66439) b!577993))

(assert (= (and b!577995 (not c!66439)) b!577991))

(declare-fun m!556737 () Bool)

(assert (=> d!85647 m!556737))

(declare-fun m!556739 () Bool)

(assert (=> d!85647 m!556739))

(declare-fun m!556741 () Bool)

(assert (=> d!85647 m!556741))

(assert (=> d!85647 m!556633))

(assert (=> d!85647 m!556739))

(declare-fun m!556743 () Bool)

(assert (=> d!85647 m!556743))

(declare-fun m!556745 () Bool)

(assert (=> d!85647 m!556745))

(declare-fun m!556747 () Bool)

(assert (=> b!577991 m!556747))

(declare-fun m!556749 () Bool)

(assert (=> b!577996 m!556749))

(assert (=> b!577859 d!85647))

(declare-fun d!85663 () Bool)

(declare-fun lt!264132 () Bool)

(assert (=> d!85663 (= lt!264132 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!232 Nil!11351)))))

(declare-fun e!332439 () Bool)

(assert (=> d!85663 (= lt!264132 e!332439)))

(declare-fun res!365850 () Bool)

(assert (=> d!85663 (=> (not res!365850) (not e!332439))))

(assert (=> d!85663 (= res!365850 (is-Cons!11350 Nil!11351))))

(assert (=> d!85663 (= (contains!2902 Nil!11351 #b0000000000000000000000000000000000000000000000000000000000000000) lt!264132)))

(declare-fun b!577997 () Bool)

(declare-fun e!332440 () Bool)

(assert (=> b!577997 (= e!332439 e!332440)))

(declare-fun res!365849 () Bool)

(assert (=> b!577997 (=> res!365849 e!332440)))

(assert (=> b!577997 (= res!365849 (= (h!12395 Nil!11351) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!577998 () Bool)

(assert (=> b!577998 (= e!332440 (contains!2902 (t!17582 Nil!11351) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!85663 res!365850) b!577997))

(assert (= (and b!577997 (not res!365849)) b!577998))

(assert (=> d!85663 m!556699))

(declare-fun m!556751 () Bool)

(assert (=> d!85663 m!556751))

(declare-fun m!556753 () Bool)

(assert (=> b!577998 m!556753))

(assert (=> b!577862 d!85663))

(declare-fun d!85665 () Bool)

(assert (=> d!85665 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53128 d!85665))

(declare-fun d!85673 () Bool)

(assert (=> d!85673 (= (array_inv!13109 a!2986) (bvsge (size!17677 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53128 d!85673))

(declare-fun d!85675 () Bool)

(declare-fun res!365865 () Bool)

(declare-fun e!332464 () Bool)

(assert (=> d!85675 (=> res!365865 e!332464)))

(assert (=> d!85675 (= res!365865 (is-Nil!11351 Nil!11351))))

(assert (=> d!85675 (= (noDuplicate!228 Nil!11351) e!332464)))

(declare-fun b!578031 () Bool)

(declare-fun e!332465 () Bool)

(assert (=> b!578031 (= e!332464 e!332465)))

(declare-fun res!365866 () Bool)

(assert (=> b!578031 (=> (not res!365866) (not e!332465))))

(assert (=> b!578031 (= res!365866 (not (contains!2902 (t!17582 Nil!11351) (h!12395 Nil!11351))))))

(declare-fun b!578032 () Bool)

(assert (=> b!578032 (= e!332465 (noDuplicate!228 (t!17582 Nil!11351)))))

(assert (= (and d!85675 (not res!365865)) b!578031))

(assert (= (and b!578031 res!365866) b!578032))

(declare-fun m!556767 () Bool)

(assert (=> b!578031 m!556767))

(declare-fun m!556769 () Bool)

(assert (=> b!578032 m!556769))

(assert (=> b!577868 d!85675))

(declare-fun d!85679 () Bool)

(assert (=> d!85679 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577863 d!85679))

(declare-fun d!85683 () Bool)

(assert (=> d!85683 (= (validKeyInArray!0 (select (arr!17313 a!2986) j!136)) (and (not (= (select (arr!17313 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17313 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577867 d!85683))

(declare-fun d!85685 () Bool)

(declare-fun res!365881 () Bool)

(declare-fun e!332483 () Bool)

(assert (=> d!85685 (=> res!365881 e!332483)))

(assert (=> d!85685 (= res!365881 (= (select (arr!17313 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!85685 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!332483)))

(declare-fun b!578053 () Bool)

(declare-fun e!332484 () Bool)

(assert (=> b!578053 (= e!332483 e!332484)))

(declare-fun res!365882 () Bool)

(assert (=> b!578053 (=> (not res!365882) (not e!332484))))

(assert (=> b!578053 (= res!365882 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17677 a!2986)))))

(declare-fun b!578054 () Bool)

(assert (=> b!578054 (= e!332484 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85685 (not res!365881)) b!578053))

(assert (= (and b!578053 res!365882) b!578054))

(declare-fun m!556785 () Bool)

(assert (=> d!85685 m!556785))

(declare-fun m!556789 () Bool)

(assert (=> b!578054 m!556789))

(assert (=> b!577865 d!85685))

(declare-fun b!578071 () Bool)

(declare-fun e!332499 () Bool)

(declare-fun e!332497 () Bool)

(assert (=> b!578071 (= e!332499 e!332497)))

(declare-fun lt!264164 () (_ BitVec 64))

(assert (=> b!578071 (= lt!264164 (select (arr!17313 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!18152 0))(
  ( (Unit!18153) )
))
(declare-fun lt!264166 () Unit!18152)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36074 (_ BitVec 64) (_ BitVec 32)) Unit!18152)

(assert (=> b!578071 (= lt!264166 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!264164 #b00000000000000000000000000000000))))

(assert (=> b!578071 (arrayContainsKey!0 a!2986 lt!264164 #b00000000000000000000000000000000)))

(declare-fun lt!264165 () Unit!18152)

(assert (=> b!578071 (= lt!264165 lt!264166)))

(declare-fun res!365891 () Bool)

