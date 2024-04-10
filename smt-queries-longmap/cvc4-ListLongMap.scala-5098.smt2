; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69198 () Bool)

(assert start!69198)

(declare-fun b!807107 () Bool)

(declare-fun res!551235 () Bool)

(declare-fun e!446899 () Bool)

(assert (=> b!807107 (=> (not res!551235) (not e!446899))))

(declare-datatypes ((array!43898 0))(
  ( (array!43899 (arr!21026 (Array (_ BitVec 32) (_ BitVec 64))) (size!21447 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43898)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43898 (_ BitVec 32)) Bool)

(assert (=> b!807107 (= res!551235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807108 () Bool)

(declare-fun res!551231 () Bool)

(assert (=> b!807108 (=> (not res!551231) (not e!446899))))

(declare-datatypes ((List!14989 0))(
  ( (Nil!14986) (Cons!14985 (h!16114 (_ BitVec 64)) (t!21304 List!14989)) )
))
(declare-fun arrayNoDuplicates!0 (array!43898 (_ BitVec 32) List!14989) Bool)

(assert (=> b!807108 (= res!551231 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14986))))

(declare-fun b!807109 () Bool)

(declare-fun e!446903 () Bool)

(declare-fun e!446900 () Bool)

(assert (=> b!807109 (= e!446903 e!446900)))

(declare-fun res!551233 () Bool)

(assert (=> b!807109 (=> (not res!551233) (not e!446900))))

(declare-datatypes ((SeekEntryResult!8617 0))(
  ( (MissingZero!8617 (index!36836 (_ BitVec 32))) (Found!8617 (index!36837 (_ BitVec 32))) (Intermediate!8617 (undefined!9429 Bool) (index!36838 (_ BitVec 32)) (x!67645 (_ BitVec 32))) (Undefined!8617) (MissingVacant!8617 (index!36839 (_ BitVec 32))) )
))
(declare-fun lt!361550 () SeekEntryResult!8617)

(declare-fun lt!361548 () SeekEntryResult!8617)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807109 (= res!551233 (and (= lt!361548 lt!361550) (= lt!361550 (Found!8617 j!153)) (not (= (select (arr!21026 a!3170) index!1236) (select (arr!21026 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43898 (_ BitVec 32)) SeekEntryResult!8617)

(assert (=> b!807109 (= lt!361550 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21026 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43898 (_ BitVec 32)) SeekEntryResult!8617)

(assert (=> b!807109 (= lt!361548 (seekEntryOrOpen!0 (select (arr!21026 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807110 () Bool)

(declare-fun res!551240 () Bool)

(declare-fun e!446901 () Bool)

(assert (=> b!807110 (=> (not res!551240) (not e!446901))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807110 (= res!551240 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807111 () Bool)

(assert (=> b!807111 (= e!446900 false)))

(declare-fun lt!361549 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807111 (= lt!361549 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807112 () Bool)

(assert (=> b!807112 (= e!446901 e!446899)))

(declare-fun res!551238 () Bool)

(assert (=> b!807112 (=> (not res!551238) (not e!446899))))

(declare-fun lt!361553 () SeekEntryResult!8617)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807112 (= res!551238 (or (= lt!361553 (MissingZero!8617 i!1163)) (= lt!361553 (MissingVacant!8617 i!1163))))))

(assert (=> b!807112 (= lt!361553 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!551234 () Bool)

(assert (=> start!69198 (=> (not res!551234) (not e!446901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69198 (= res!551234 (validMask!0 mask!3266))))

(assert (=> start!69198 e!446901))

(assert (=> start!69198 true))

(declare-fun array_inv!16822 (array!43898) Bool)

(assert (=> start!69198 (array_inv!16822 a!3170)))

(declare-fun b!807113 () Bool)

(declare-fun res!551237 () Bool)

(assert (=> b!807113 (=> (not res!551237) (not e!446901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807113 (= res!551237 (validKeyInArray!0 (select (arr!21026 a!3170) j!153)))))

(declare-fun b!807114 () Bool)

(declare-fun res!551232 () Bool)

(assert (=> b!807114 (=> (not res!551232) (not e!446899))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!807114 (= res!551232 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21447 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21026 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21447 a!3170)) (= (select (arr!21026 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807115 () Bool)

(declare-fun res!551230 () Bool)

(assert (=> b!807115 (=> (not res!551230) (not e!446901))))

(assert (=> b!807115 (= res!551230 (validKeyInArray!0 k!2044))))

(declare-fun b!807116 () Bool)

(declare-fun res!551239 () Bool)

(assert (=> b!807116 (=> (not res!551239) (not e!446901))))

(assert (=> b!807116 (= res!551239 (and (= (size!21447 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21447 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21447 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807117 () Bool)

(assert (=> b!807117 (= e!446899 e!446903)))

(declare-fun res!551236 () Bool)

(assert (=> b!807117 (=> (not res!551236) (not e!446903))))

(declare-fun lt!361551 () array!43898)

(declare-fun lt!361552 () (_ BitVec 64))

(assert (=> b!807117 (= res!551236 (= (seekEntryOrOpen!0 lt!361552 lt!361551 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361552 lt!361551 mask!3266)))))

(assert (=> b!807117 (= lt!361552 (select (store (arr!21026 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807117 (= lt!361551 (array!43899 (store (arr!21026 a!3170) i!1163 k!2044) (size!21447 a!3170)))))

(assert (= (and start!69198 res!551234) b!807116))

(assert (= (and b!807116 res!551239) b!807113))

(assert (= (and b!807113 res!551237) b!807115))

(assert (= (and b!807115 res!551230) b!807110))

(assert (= (and b!807110 res!551240) b!807112))

(assert (= (and b!807112 res!551238) b!807107))

(assert (= (and b!807107 res!551235) b!807108))

(assert (= (and b!807108 res!551231) b!807114))

(assert (= (and b!807114 res!551232) b!807117))

(assert (= (and b!807117 res!551236) b!807109))

(assert (= (and b!807109 res!551233) b!807111))

(declare-fun m!749091 () Bool)

(assert (=> b!807108 m!749091))

(declare-fun m!749093 () Bool)

(assert (=> b!807109 m!749093))

(declare-fun m!749095 () Bool)

(assert (=> b!807109 m!749095))

(assert (=> b!807109 m!749095))

(declare-fun m!749097 () Bool)

(assert (=> b!807109 m!749097))

(assert (=> b!807109 m!749095))

(declare-fun m!749099 () Bool)

(assert (=> b!807109 m!749099))

(declare-fun m!749101 () Bool)

(assert (=> b!807117 m!749101))

(declare-fun m!749103 () Bool)

(assert (=> b!807117 m!749103))

(declare-fun m!749105 () Bool)

(assert (=> b!807117 m!749105))

(declare-fun m!749107 () Bool)

(assert (=> b!807117 m!749107))

(declare-fun m!749109 () Bool)

(assert (=> b!807107 m!749109))

(declare-fun m!749111 () Bool)

(assert (=> b!807110 m!749111))

(declare-fun m!749113 () Bool)

(assert (=> b!807115 m!749113))

(assert (=> b!807113 m!749095))

(assert (=> b!807113 m!749095))

(declare-fun m!749115 () Bool)

(assert (=> b!807113 m!749115))

(declare-fun m!749117 () Bool)

(assert (=> start!69198 m!749117))

(declare-fun m!749119 () Bool)

(assert (=> start!69198 m!749119))

(declare-fun m!749121 () Bool)

(assert (=> b!807114 m!749121))

(declare-fun m!749123 () Bool)

(assert (=> b!807114 m!749123))

(declare-fun m!749125 () Bool)

(assert (=> b!807112 m!749125))

(declare-fun m!749127 () Bool)

(assert (=> b!807111 m!749127))

(push 1)

