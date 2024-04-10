; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54542 () Bool)

(assert start!54542)

(declare-fun b!596068 () Bool)

(declare-fun e!340564 () Bool)

(declare-fun e!340561 () Bool)

(assert (=> b!596068 (= e!340564 e!340561)))

(declare-fun res!381905 () Bool)

(assert (=> b!596068 (=> (not res!381905) (not e!340561))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-datatypes ((array!37002 0))(
  ( (array!37003 (arr!17765 (Array (_ BitVec 32) (_ BitVec 64))) (size!18129 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37002)

(assert (=> b!596068 (= res!381905 (= (select (store (arr!17765 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!270707 () array!37002)

(assert (=> b!596068 (= lt!270707 (array!37003 (store (arr!17765 a!2986) i!1108 k!1786) (size!18129 a!2986)))))

(declare-fun b!596069 () Bool)

(declare-fun e!340557 () Bool)

(declare-fun e!340565 () Bool)

(assert (=> b!596069 (= e!340557 (not e!340565))))

(declare-fun res!381906 () Bool)

(assert (=> b!596069 (=> res!381906 e!340565)))

(declare-datatypes ((SeekEntryResult!6205 0))(
  ( (MissingZero!6205 (index!27068 (_ BitVec 32))) (Found!6205 (index!27069 (_ BitVec 32))) (Intermediate!6205 (undefined!7017 Bool) (index!27070 (_ BitVec 32)) (x!55865 (_ BitVec 32))) (Undefined!6205) (MissingVacant!6205 (index!27071 (_ BitVec 32))) )
))
(declare-fun lt!270702 () SeekEntryResult!6205)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!596069 (= res!381906 (not (= lt!270702 (Found!6205 index!984))))))

(declare-datatypes ((Unit!18738 0))(
  ( (Unit!18739) )
))
(declare-fun lt!270704 () Unit!18738)

(declare-fun e!340563 () Unit!18738)

(assert (=> b!596069 (= lt!270704 e!340563)))

(declare-fun c!67457 () Bool)

(assert (=> b!596069 (= c!67457 (= lt!270702 Undefined!6205))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun lt!270700 () (_ BitVec 64))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37002 (_ BitVec 32)) SeekEntryResult!6205)

(assert (=> b!596069 (= lt!270702 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!270700 lt!270707 mask!3053))))

(declare-fun e!340568 () Bool)

(assert (=> b!596069 e!340568))

(declare-fun res!381891 () Bool)

(assert (=> b!596069 (=> (not res!381891) (not e!340568))))

(declare-fun lt!270699 () (_ BitVec 32))

(declare-fun lt!270709 () SeekEntryResult!6205)

(assert (=> b!596069 (= res!381891 (= lt!270709 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270699 vacantSpotIndex!68 lt!270700 lt!270707 mask!3053)))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!596069 (= lt!270709 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!270699 vacantSpotIndex!68 (select (arr!17765 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!596069 (= lt!270700 (select (store (arr!17765 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!270701 () Unit!18738)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37002 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18738)

(assert (=> b!596069 (= lt!270701 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!270699 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!596069 (= lt!270699 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!596070 () Bool)

(declare-fun res!381902 () Bool)

(assert (=> b!596070 (=> (not res!381902) (not e!340564))))

(declare-datatypes ((List!11806 0))(
  ( (Nil!11803) (Cons!11802 (h!12847 (_ BitVec 64)) (t!18034 List!11806)) )
))
(declare-fun arrayNoDuplicates!0 (array!37002 (_ BitVec 32) List!11806) Bool)

(assert (=> b!596070 (= res!381902 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11803))))

(declare-fun b!596071 () Bool)

(declare-fun e!340569 () Bool)

(assert (=> b!596071 (= e!340569 true)))

(declare-fun lt!270705 () Bool)

(declare-fun contains!2941 (List!11806 (_ BitVec 64)) Bool)

(assert (=> b!596071 (= lt!270705 (contains!2941 Nil!11803 k!1786))))

(declare-fun b!596072 () Bool)

(declare-fun res!381888 () Bool)

(declare-fun e!340567 () Bool)

(assert (=> b!596072 (=> (not res!381888) (not e!340567))))

(declare-fun arrayContainsKey!0 (array!37002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!596072 (= res!381888 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!596073 () Bool)

(declare-fun res!381895 () Bool)

(assert (=> b!596073 (=> res!381895 e!340569)))

(assert (=> b!596073 (= res!381895 (contains!2941 Nil!11803 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596074 () Bool)

(declare-fun Unit!18740 () Unit!18738)

(assert (=> b!596074 (= e!340563 Unit!18740)))

(declare-fun b!596075 () Bool)

(declare-fun lt!270698 () SeekEntryResult!6205)

(assert (=> b!596075 (= e!340568 (= lt!270698 lt!270709))))

(declare-fun b!596076 () Bool)

(declare-fun e!340558 () Bool)

(declare-fun e!340562 () Bool)

(assert (=> b!596076 (= e!340558 e!340562)))

(declare-fun res!381896 () Bool)

(assert (=> b!596076 (=> res!381896 e!340562)))

(declare-fun lt!270703 () (_ BitVec 64))

(assert (=> b!596076 (= res!381896 (or (not (= (select (arr!17765 a!2986) j!136) lt!270700)) (not (= (select (arr!17765 a!2986) j!136) lt!270703)) (bvsge j!136 index!984)))))

(declare-fun b!596077 () Bool)

(assert (=> b!596077 (= e!340561 e!340557)))

(declare-fun res!381903 () Bool)

(assert (=> b!596077 (=> (not res!381903) (not e!340557))))

(assert (=> b!596077 (= res!381903 (and (= lt!270698 (Found!6205 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17765 a!2986) index!984) (select (arr!17765 a!2986) j!136))) (not (= (select (arr!17765 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!596077 (= lt!270698 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17765 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!596078 () Bool)

(assert (=> b!596078 (= e!340567 e!340564)))

(declare-fun res!381907 () Bool)

(assert (=> b!596078 (=> (not res!381907) (not e!340564))))

(declare-fun lt!270706 () SeekEntryResult!6205)

(assert (=> b!596078 (= res!381907 (or (= lt!270706 (MissingZero!6205 i!1108)) (= lt!270706 (MissingVacant!6205 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37002 (_ BitVec 32)) SeekEntryResult!6205)

(assert (=> b!596078 (= lt!270706 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!596079 () Bool)

(declare-fun res!381904 () Bool)

(assert (=> b!596079 (=> (not res!381904) (not e!340567))))

(assert (=> b!596079 (= res!381904 (and (= (size!18129 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18129 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18129 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!596080 () Bool)

(declare-fun res!381892 () Bool)

(assert (=> b!596080 (=> (not res!381892) (not e!340564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37002 (_ BitVec 32)) Bool)

(assert (=> b!596080 (= res!381892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!381894 () Bool)

(assert (=> start!54542 (=> (not res!381894) (not e!340567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54542 (= res!381894 (validMask!0 mask!3053))))

(assert (=> start!54542 e!340567))

(assert (=> start!54542 true))

(declare-fun array_inv!13561 (array!37002) Bool)

(assert (=> start!54542 (array_inv!13561 a!2986)))

(declare-fun b!596081 () Bool)

(declare-fun res!381890 () Bool)

(assert (=> b!596081 (=> (not res!381890) (not e!340567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!596081 (= res!381890 (validKeyInArray!0 (select (arr!17765 a!2986) j!136)))))

(declare-fun b!596082 () Bool)

(declare-fun res!381899 () Bool)

(assert (=> b!596082 (=> (not res!381899) (not e!340564))))

(assert (=> b!596082 (= res!381899 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17765 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!596083 () Bool)

(declare-fun res!381889 () Bool)

(assert (=> b!596083 (=> res!381889 e!340569)))

(declare-fun noDuplicate!260 (List!11806) Bool)

(assert (=> b!596083 (= res!381889 (not (noDuplicate!260 Nil!11803)))))

(declare-fun b!596084 () Bool)

(declare-fun res!381897 () Bool)

(assert (=> b!596084 (=> (not res!381897) (not e!340567))))

(assert (=> b!596084 (= res!381897 (validKeyInArray!0 k!1786))))

(declare-fun b!596085 () Bool)

(declare-fun e!340559 () Bool)

(assert (=> b!596085 (= e!340559 e!340569)))

(declare-fun res!381908 () Bool)

(assert (=> b!596085 (=> res!381908 e!340569)))

(assert (=> b!596085 (= res!381908 (or (bvsge (size!18129 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18129 a!2986))))))

(assert (=> b!596085 (arrayContainsKey!0 lt!270707 (select (arr!17765 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!270708 () Unit!18738)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37002 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18738)

(assert (=> b!596085 (= lt!270708 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!270707 (select (arr!17765 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!596086 () Bool)

(assert (=> b!596086 (= e!340565 e!340559)))

(declare-fun res!381901 () Bool)

(assert (=> b!596086 (=> res!381901 e!340559)))

(assert (=> b!596086 (= res!381901 (or (not (= (select (arr!17765 a!2986) j!136) lt!270700)) (not (= (select (arr!17765 a!2986) j!136) lt!270703)) (bvsge j!136 index!984)))))

(assert (=> b!596086 e!340558))

(declare-fun res!381898 () Bool)

(assert (=> b!596086 (=> (not res!381898) (not e!340558))))

(assert (=> b!596086 (= res!381898 (= lt!270703 (select (arr!17765 a!2986) j!136)))))

(assert (=> b!596086 (= lt!270703 (select (store (arr!17765 a!2986) i!1108 k!1786) index!984))))

(declare-fun e!340566 () Bool)

(declare-fun b!596087 () Bool)

(assert (=> b!596087 (= e!340566 (arrayContainsKey!0 lt!270707 (select (arr!17765 a!2986) j!136) index!984))))

(declare-fun b!596088 () Bool)

(declare-fun Unit!18741 () Unit!18738)

(assert (=> b!596088 (= e!340563 Unit!18741)))

(assert (=> b!596088 false))

(declare-fun b!596089 () Bool)

(declare-fun res!381900 () Bool)

(assert (=> b!596089 (=> res!381900 e!340569)))

(assert (=> b!596089 (= res!381900 (contains!2941 Nil!11803 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!596090 () Bool)

(assert (=> b!596090 (= e!340562 e!340566)))

(declare-fun res!381893 () Bool)

(assert (=> b!596090 (=> (not res!381893) (not e!340566))))

(assert (=> b!596090 (= res!381893 (arrayContainsKey!0 lt!270707 (select (arr!17765 a!2986) j!136) j!136))))

(assert (= (and start!54542 res!381894) b!596079))

(assert (= (and b!596079 res!381904) b!596081))

(assert (= (and b!596081 res!381890) b!596084))

(assert (= (and b!596084 res!381897) b!596072))

(assert (= (and b!596072 res!381888) b!596078))

(assert (= (and b!596078 res!381907) b!596080))

(assert (= (and b!596080 res!381892) b!596070))

(assert (= (and b!596070 res!381902) b!596082))

(assert (= (and b!596082 res!381899) b!596068))

(assert (= (and b!596068 res!381905) b!596077))

(assert (= (and b!596077 res!381903) b!596069))

(assert (= (and b!596069 res!381891) b!596075))

(assert (= (and b!596069 c!67457) b!596088))

(assert (= (and b!596069 (not c!67457)) b!596074))

(assert (= (and b!596069 (not res!381906)) b!596086))

(assert (= (and b!596086 res!381898) b!596076))

(assert (= (and b!596076 (not res!381896)) b!596090))

(assert (= (and b!596090 res!381893) b!596087))

(assert (= (and b!596086 (not res!381901)) b!596085))

(assert (= (and b!596085 (not res!381908)) b!596083))

(assert (= (and b!596083 (not res!381889)) b!596089))

(assert (= (and b!596089 (not res!381900)) b!596073))

(assert (= (and b!596073 (not res!381895)) b!596071))

(declare-fun m!573619 () Bool)

(assert (=> b!596089 m!573619))

(declare-fun m!573621 () Bool)

(assert (=> b!596084 m!573621))

(declare-fun m!573623 () Bool)

(assert (=> b!596070 m!573623))

(declare-fun m!573625 () Bool)

(assert (=> b!596083 m!573625))

(declare-fun m!573627 () Bool)

(assert (=> b!596082 m!573627))

(declare-fun m!573629 () Bool)

(assert (=> start!54542 m!573629))

(declare-fun m!573631 () Bool)

(assert (=> start!54542 m!573631))

(declare-fun m!573633 () Bool)

(assert (=> b!596087 m!573633))

(assert (=> b!596087 m!573633))

(declare-fun m!573635 () Bool)

(assert (=> b!596087 m!573635))

(declare-fun m!573637 () Bool)

(assert (=> b!596072 m!573637))

(assert (=> b!596085 m!573633))

(assert (=> b!596085 m!573633))

(declare-fun m!573639 () Bool)

(assert (=> b!596085 m!573639))

(assert (=> b!596085 m!573633))

(declare-fun m!573641 () Bool)

(assert (=> b!596085 m!573641))

(declare-fun m!573643 () Bool)

(assert (=> b!596071 m!573643))

(assert (=> b!596076 m!573633))

(assert (=> b!596081 m!573633))

(assert (=> b!596081 m!573633))

(declare-fun m!573645 () Bool)

(assert (=> b!596081 m!573645))

(declare-fun m!573647 () Bool)

(assert (=> b!596080 m!573647))

(declare-fun m!573649 () Bool)

(assert (=> b!596078 m!573649))

(assert (=> b!596086 m!573633))

(declare-fun m!573651 () Bool)

(assert (=> b!596086 m!573651))

(declare-fun m!573653 () Bool)

(assert (=> b!596086 m!573653))

(declare-fun m!573655 () Bool)

(assert (=> b!596069 m!573655))

(declare-fun m!573657 () Bool)

(assert (=> b!596069 m!573657))

(declare-fun m!573659 () Bool)

(assert (=> b!596069 m!573659))

(declare-fun m!573661 () Bool)

(assert (=> b!596069 m!573661))

(assert (=> b!596069 m!573633))

(assert (=> b!596069 m!573651))

(assert (=> b!596069 m!573633))

(declare-fun m!573663 () Bool)

(assert (=> b!596069 m!573663))

(declare-fun m!573665 () Bool)

(assert (=> b!596069 m!573665))

(declare-fun m!573667 () Bool)

(assert (=> b!596077 m!573667))

(assert (=> b!596077 m!573633))

(assert (=> b!596077 m!573633))

(declare-fun m!573669 () Bool)

(assert (=> b!596077 m!573669))

(assert (=> b!596090 m!573633))

(assert (=> b!596090 m!573633))

(declare-fun m!573671 () Bool)

(assert (=> b!596090 m!573671))

(declare-fun m!573673 () Bool)

(assert (=> b!596073 m!573673))

(assert (=> b!596068 m!573651))

(declare-fun m!573675 () Bool)

(assert (=> b!596068 m!573675))

(push 1)

