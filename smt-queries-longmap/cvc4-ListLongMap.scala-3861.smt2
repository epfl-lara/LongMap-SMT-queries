; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53132 () Bool)

(assert start!53132)

(declare-fun b!577919 () Bool)

(declare-fun res!365810 () Bool)

(declare-fun e!332387 () Bool)

(assert (=> b!577919 (=> (not res!365810) (not e!332387))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36078 0))(
  ( (array!36079 (arr!17315 (Array (_ BitVec 32) (_ BitVec 64))) (size!17679 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36078)

(assert (=> b!577919 (= res!365810 (and (= (size!17679 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17679 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17679 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577920 () Bool)

(declare-fun res!365812 () Bool)

(declare-fun e!332386 () Bool)

(assert (=> b!577920 (=> (not res!365812) (not e!332386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36078 (_ BitVec 32)) Bool)

(assert (=> b!577920 (= res!365812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!577922 () Bool)

(declare-fun res!365808 () Bool)

(assert (=> b!577922 (=> (not res!365808) (not e!332386))))

(assert (=> b!577922 (= res!365808 (and (bvsle #b00000000000000000000000000000000 (size!17679 a!2986)) (bvslt (size!17679 a!2986) #b01111111111111111111111111111111)))))

(declare-fun b!577923 () Bool)

(declare-fun e!332388 () Bool)

(declare-datatypes ((List!11356 0))(
  ( (Nil!11353) (Cons!11352 (h!12397 (_ BitVec 64)) (t!17584 List!11356)) )
))
(declare-fun contains!2904 (List!11356 (_ BitVec 64)) Bool)

(assert (=> b!577923 (= e!332388 (contains!2904 Nil!11353 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!577924 () Bool)

(assert (=> b!577924 (= e!332387 e!332386)))

(declare-fun res!365816 () Bool)

(assert (=> b!577924 (=> (not res!365816) (not e!332386))))

(declare-datatypes ((SeekEntryResult!5755 0))(
  ( (MissingZero!5755 (index!25247 (_ BitVec 32))) (Found!5755 (index!25248 (_ BitVec 32))) (Intermediate!5755 (undefined!6567 Bool) (index!25249 (_ BitVec 32)) (x!54152 (_ BitVec 32))) (Undefined!5755) (MissingVacant!5755 (index!25250 (_ BitVec 32))) )
))
(declare-fun lt!264103 () SeekEntryResult!5755)

(assert (=> b!577924 (= res!365816 (or (= lt!264103 (MissingZero!5755 i!1108)) (= lt!264103 (MissingVacant!5755 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36078 (_ BitVec 32)) SeekEntryResult!5755)

(assert (=> b!577924 (= lt!264103 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577925 () Bool)

(declare-fun res!365815 () Bool)

(assert (=> b!577925 (=> (not res!365815) (not e!332386))))

(declare-fun noDuplicate!230 (List!11356) Bool)

(assert (=> b!577925 (= res!365815 (noDuplicate!230 Nil!11353))))

(declare-fun b!577926 () Bool)

(declare-fun res!365809 () Bool)

(assert (=> b!577926 (=> (not res!365809) (not e!332387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577926 (= res!365809 (validKeyInArray!0 k!1786))))

(declare-fun b!577927 () Bool)

(declare-fun res!365813 () Bool)

(assert (=> b!577927 (=> (not res!365813) (not e!332387))))

(declare-fun arrayContainsKey!0 (array!36078 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577927 (= res!365813 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577928 () Bool)

(assert (=> b!577928 (= e!332386 e!332388)))

(declare-fun res!365811 () Bool)

(assert (=> b!577928 (=> res!365811 e!332388)))

(assert (=> b!577928 (= res!365811 (contains!2904 Nil!11353 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!577921 () Bool)

(declare-fun res!365814 () Bool)

(assert (=> b!577921 (=> (not res!365814) (not e!332387))))

(assert (=> b!577921 (= res!365814 (validKeyInArray!0 (select (arr!17315 a!2986) j!136)))))

(declare-fun res!365807 () Bool)

(assert (=> start!53132 (=> (not res!365807) (not e!332387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53132 (= res!365807 (validMask!0 mask!3053))))

(assert (=> start!53132 e!332387))

(assert (=> start!53132 true))

(declare-fun array_inv!13111 (array!36078) Bool)

(assert (=> start!53132 (array_inv!13111 a!2986)))

(assert (= (and start!53132 res!365807) b!577919))

(assert (= (and b!577919 res!365810) b!577921))

(assert (= (and b!577921 res!365814) b!577926))

(assert (= (and b!577926 res!365809) b!577927))

(assert (= (and b!577927 res!365813) b!577924))

(assert (= (and b!577924 res!365816) b!577920))

(assert (= (and b!577920 res!365812) b!577922))

(assert (= (and b!577922 res!365808) b!577925))

(assert (= (and b!577925 res!365815) b!577928))

(assert (= (and b!577928 (not res!365811)) b!577923))

(declare-fun m!556671 () Bool)

(assert (=> b!577924 m!556671))

(declare-fun m!556673 () Bool)

(assert (=> start!53132 m!556673))

(declare-fun m!556675 () Bool)

(assert (=> start!53132 m!556675))

(declare-fun m!556677 () Bool)

(assert (=> b!577920 m!556677))

(declare-fun m!556679 () Bool)

(assert (=> b!577923 m!556679))

(declare-fun m!556681 () Bool)

(assert (=> b!577927 m!556681))

(declare-fun m!556683 () Bool)

(assert (=> b!577926 m!556683))

(declare-fun m!556685 () Bool)

(assert (=> b!577925 m!556685))

(declare-fun m!556687 () Bool)

(assert (=> b!577928 m!556687))

(declare-fun m!556689 () Bool)

(assert (=> b!577921 m!556689))

(assert (=> b!577921 m!556689))

(declare-fun m!556691 () Bool)

(assert (=> b!577921 m!556691))

(push 1)

(assert (not b!577928))

(assert (not b!577925))

(assert (not b!577923))

(assert (not b!577921))

(assert (not b!577927))

(assert (not b!577924))

(assert (not b!577926))

(assert (not b!577920))

(assert (not start!53132))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85645 () Bool)

(declare-fun res!365833 () Bool)

(declare-fun e!332405 () Bool)

(assert (=> d!85645 (=> res!365833 e!332405)))

(assert (=> d!85645 (= res!365833 (= (select (arr!17315 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!85645 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!332405)))

(declare-fun b!577945 () Bool)

(declare-fun e!332406 () Bool)

(assert (=> b!577945 (= e!332405 e!332406)))

(declare-fun res!365834 () Bool)

(assert (=> b!577945 (=> (not res!365834) (not e!332406))))

(assert (=> b!577945 (= res!365834 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17679 a!2986)))))

(declare-fun b!577946 () Bool)

(assert (=> b!577946 (= e!332406 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85645 (not res!365833)) b!577945))

(assert (= (and b!577945 res!365834) b!577946))

(declare-fun m!556705 () Bool)

(assert (=> d!85645 m!556705))

(declare-fun m!556707 () Bool)

(assert (=> b!577946 m!556707))

(assert (=> b!577927 d!85645))

(declare-fun d!85649 () Bool)

(declare-fun lt!264112 () Bool)

(declare-fun content!233 (List!11356) (Set (_ BitVec 64)))

(assert (=> d!85649 (= lt!264112 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!233 Nil!11353)))))

(declare-fun e!332412 () Bool)

(assert (=> d!85649 (= lt!264112 e!332412)))

(declare-fun res!365840 () Bool)

(assert (=> d!85649 (=> (not res!365840) (not e!332412))))

(assert (=> d!85649 (= res!365840 (is-Cons!11352 Nil!11353))))

(assert (=> d!85649 (= (contains!2904 Nil!11353 #b1000000000000000000000000000000000000000000000000000000000000000) lt!264112)))

(declare-fun b!577951 () Bool)

(declare-fun e!332411 () Bool)

(assert (=> b!577951 (= e!332412 e!332411)))

(declare-fun res!365839 () Bool)

(assert (=> b!577951 (=> res!365839 e!332411)))

(assert (=> b!577951 (= res!365839 (= (h!12397 Nil!11353) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!577952 () Bool)

(assert (=> b!577952 (= e!332411 (contains!2904 (t!17584 Nil!11353) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!85649 res!365840) b!577951))

(assert (= (and b!577951 (not res!365839)) b!577952))

(declare-fun m!556709 () Bool)

(assert (=> d!85649 m!556709))

(declare-fun m!556711 () Bool)

(assert (=> d!85649 m!556711))

(declare-fun m!556713 () Bool)

(assert (=> b!577952 m!556713))

(assert (=> b!577923 d!85649))

(declare-fun d!85651 () Bool)

(assert (=> d!85651 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53132 d!85651))

(declare-fun d!85655 () Bool)

(assert (=> d!85655 (= (array_inv!13111 a!2986) (bvsge (size!17679 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53132 d!85655))

(declare-fun d!85657 () Bool)

(declare-fun lt!264122 () Bool)

(assert (=> d!85657 (= lt!264122 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!233 Nil!11353)))))

(declare-fun e!332423 () Bool)

(assert (=> d!85657 (= lt!264122 e!332423)))

(declare-fun res!365842 () Bool)

(assert (=> d!85657 (=> (not res!365842) (not e!332423))))

(assert (=> d!85657 (= res!365842 (is-Cons!11352 Nil!11353))))

(assert (=> d!85657 (= (contains!2904 Nil!11353 #b0000000000000000000000000000000000000000000000000000000000000000) lt!264122)))

(declare-fun b!577971 () Bool)

(declare-fun e!332422 () Bool)

(assert (=> b!577971 (= e!332423 e!332422)))

(declare-fun res!365841 () Bool)

(assert (=> b!577971 (=> res!365841 e!332422)))

(assert (=> b!577971 (= res!365841 (= (h!12397 Nil!11353) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!577972 () Bool)

(assert (=> b!577972 (= e!332422 (contains!2904 (t!17584 Nil!11353) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!85657 res!365842) b!577971))

(assert (= (and b!577971 (not res!365841)) b!577972))

(assert (=> d!85657 m!556709))

(declare-fun m!556729 () Bool)

(assert (=> d!85657 m!556729))

(declare-fun m!556731 () Bool)

(assert (=> b!577972 m!556731))

(assert (=> b!577928 d!85657))

(declare-fun d!85659 () Bool)

(declare-fun res!365847 () Bool)

(declare-fun e!332434 () Bool)

(assert (=> d!85659 (=> res!365847 e!332434)))

(assert (=> d!85659 (= res!365847 (is-Nil!11353 Nil!11353))))

(assert (=> d!85659 (= (noDuplicate!230 Nil!11353) e!332434)))

(declare-fun b!577989 () Bool)

(declare-fun e!332435 () Bool)

(assert (=> b!577989 (= e!332434 e!332435)))

(declare-fun res!365848 () Bool)

(assert (=> b!577989 (=> (not res!365848) (not e!332435))))

(assert (=> b!577989 (= res!365848 (not (contains!2904 (t!17584 Nil!11353) (h!12397 Nil!11353))))))

(declare-fun b!577990 () Bool)

(assert (=> b!577990 (= e!332435 (noDuplicate!230 (t!17584 Nil!11353)))))

(assert (= (and d!85659 (not res!365847)) b!577989))

(assert (= (and b!577989 res!365848) b!577990))

(declare-fun m!556733 () Bool)

(assert (=> b!577989 m!556733))

(declare-fun m!556735 () Bool)

(assert (=> b!577990 m!556735))

(assert (=> b!577925 d!85659))

(declare-fun b!578047 () Bool)

(declare-fun e!332480 () SeekEntryResult!5755)

(assert (=> b!578047 (= e!332480 Undefined!5755)))

(declare-fun d!85661 () Bool)

(declare-fun lt!264149 () SeekEntryResult!5755)

(assert (=> d!85661 (and (or (is-Undefined!5755 lt!264149) (not (is-Found!5755 lt!264149)) (and (bvsge (index!25248 lt!264149) #b00000000000000000000000000000000) (bvslt (index!25248 lt!264149) (size!17679 a!2986)))) (or (is-Undefined!5755 lt!264149) (is-Found!5755 lt!264149) (not (is-MissingZero!5755 lt!264149)) (and (bvsge (index!25247 lt!264149) #b00000000000000000000000000000000) (bvslt (index!25247 lt!264149) (size!17679 a!2986)))) (or (is-Undefined!5755 lt!264149) (is-Found!5755 lt!264149) (is-MissingZero!5755 lt!264149) (not (is-MissingVacant!5755 lt!264149)) (and (bvsge (index!25250 lt!264149) #b00000000000000000000000000000000) (bvslt (index!25250 lt!264149) (size!17679 a!2986)))) (or (is-Undefined!5755 lt!264149) (ite (is-Found!5755 lt!264149) (= (select (arr!17315 a!2986) (index!25248 lt!264149)) k!1786) (ite (is-MissingZero!5755 lt!264149) (= (select (arr!17315 a!2986) (index!25247 lt!264149)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5755 lt!264149) (= (select (arr!17315 a!2986) (index!25250 lt!264149)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85661 (= lt!264149 e!332480)))

(declare-fun c!66451 () Bool)

(declare-fun lt!264150 () SeekEntryResult!5755)

(assert (=> d!85661 (= c!66451 (and (is-Intermediate!5755 lt!264150) (undefined!6567 lt!264150)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36078 (_ BitVec 32)) SeekEntryResult!5755)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

