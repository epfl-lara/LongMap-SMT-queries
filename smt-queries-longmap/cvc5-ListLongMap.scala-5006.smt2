; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68546 () Bool)

(assert start!68546)

(declare-fun b!797231 () Bool)

(declare-fun e!442307 () Bool)

(declare-fun e!442310 () Bool)

(assert (=> b!797231 (= e!442307 e!442310)))

(declare-fun res!541754 () Bool)

(assert (=> b!797231 (=> (not res!541754) (not e!442310))))

(declare-datatypes ((SeekEntryResult!8339 0))(
  ( (MissingZero!8339 (index!35724 (_ BitVec 32))) (Found!8339 (index!35725 (_ BitVec 32))) (Intermediate!8339 (undefined!9151 Bool) (index!35726 (_ BitVec 32)) (x!66625 (_ BitVec 32))) (Undefined!8339) (MissingVacant!8339 (index!35727 (_ BitVec 32))) )
))
(declare-fun lt!355639 () SeekEntryResult!8339)

(declare-datatypes ((array!43336 0))(
  ( (array!43337 (arr!20748 (Array (_ BitVec 32) (_ BitVec 64))) (size!21169 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43336)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!355640 () SeekEntryResult!8339)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797231 (= res!541754 (and (= lt!355640 lt!355639) (= lt!355639 (Found!8339 j!153)) (= (select (arr!20748 a!3170) index!1236) (select (arr!20748 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43336 (_ BitVec 32)) SeekEntryResult!8339)

(assert (=> b!797231 (= lt!355639 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20748 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43336 (_ BitVec 32)) SeekEntryResult!8339)

(assert (=> b!797231 (= lt!355640 (seekEntryOrOpen!0 (select (arr!20748 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!541751 () Bool)

(declare-fun e!442308 () Bool)

(assert (=> start!68546 (=> (not res!541751) (not e!442308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68546 (= res!541751 (validMask!0 mask!3266))))

(assert (=> start!68546 e!442308))

(assert (=> start!68546 true))

(declare-fun array_inv!16544 (array!43336) Bool)

(assert (=> start!68546 (array_inv!16544 a!3170)))

(declare-fun b!797232 () Bool)

(declare-fun res!541753 () Bool)

(declare-fun e!442306 () Bool)

(assert (=> b!797232 (=> (not res!541753) (not e!442306))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797232 (= res!541753 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21169 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20748 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21169 a!3170)) (= (select (arr!20748 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797233 () Bool)

(declare-fun res!541756 () Bool)

(assert (=> b!797233 (=> (not res!541756) (not e!442306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43336 (_ BitVec 32)) Bool)

(assert (=> b!797233 (= res!541756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797234 () Bool)

(declare-fun res!541759 () Bool)

(assert (=> b!797234 (=> (not res!541759) (not e!442308))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797234 (= res!541759 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797235 () Bool)

(assert (=> b!797235 (= e!442308 e!442306)))

(declare-fun res!541757 () Bool)

(assert (=> b!797235 (=> (not res!541757) (not e!442306))))

(declare-fun lt!355637 () SeekEntryResult!8339)

(assert (=> b!797235 (= res!541757 (or (= lt!355637 (MissingZero!8339 i!1163)) (= lt!355637 (MissingVacant!8339 i!1163))))))

(assert (=> b!797235 (= lt!355637 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!797236 () Bool)

(assert (=> b!797236 (= e!442306 e!442307)))

(declare-fun res!541758 () Bool)

(assert (=> b!797236 (=> (not res!541758) (not e!442307))))

(declare-fun lt!355638 () SeekEntryResult!8339)

(declare-fun lt!355635 () SeekEntryResult!8339)

(assert (=> b!797236 (= res!541758 (= lt!355638 lt!355635))))

(declare-fun lt!355634 () (_ BitVec 64))

(declare-fun lt!355636 () array!43336)

(assert (=> b!797236 (= lt!355635 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355634 lt!355636 mask!3266))))

(assert (=> b!797236 (= lt!355638 (seekEntryOrOpen!0 lt!355634 lt!355636 mask!3266))))

(assert (=> b!797236 (= lt!355634 (select (store (arr!20748 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797236 (= lt!355636 (array!43337 (store (arr!20748 a!3170) i!1163 k!2044) (size!21169 a!3170)))))

(declare-fun b!797237 () Bool)

(declare-fun res!541750 () Bool)

(assert (=> b!797237 (=> (not res!541750) (not e!442308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797237 (= res!541750 (validKeyInArray!0 (select (arr!20748 a!3170) j!153)))))

(declare-fun b!797238 () Bool)

(assert (=> b!797238 (= e!442310 (not true))))

(assert (=> b!797238 (= lt!355635 (Found!8339 index!1236))))

(declare-fun b!797239 () Bool)

(declare-fun res!541752 () Bool)

(assert (=> b!797239 (=> (not res!541752) (not e!442308))))

(assert (=> b!797239 (= res!541752 (validKeyInArray!0 k!2044))))

(declare-fun b!797240 () Bool)

(declare-fun res!541760 () Bool)

(assert (=> b!797240 (=> (not res!541760) (not e!442306))))

(declare-datatypes ((List!14711 0))(
  ( (Nil!14708) (Cons!14707 (h!15836 (_ BitVec 64)) (t!21026 List!14711)) )
))
(declare-fun arrayNoDuplicates!0 (array!43336 (_ BitVec 32) List!14711) Bool)

(assert (=> b!797240 (= res!541760 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14708))))

(declare-fun b!797241 () Bool)

(declare-fun res!541755 () Bool)

(assert (=> b!797241 (=> (not res!541755) (not e!442308))))

(assert (=> b!797241 (= res!541755 (and (= (size!21169 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21169 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21169 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68546 res!541751) b!797241))

(assert (= (and b!797241 res!541755) b!797237))

(assert (= (and b!797237 res!541750) b!797239))

(assert (= (and b!797239 res!541752) b!797234))

(assert (= (and b!797234 res!541759) b!797235))

(assert (= (and b!797235 res!541757) b!797233))

(assert (= (and b!797233 res!541756) b!797240))

(assert (= (and b!797240 res!541760) b!797232))

(assert (= (and b!797232 res!541753) b!797236))

(assert (= (and b!797236 res!541758) b!797231))

(assert (= (and b!797231 res!541754) b!797238))

(declare-fun m!738077 () Bool)

(assert (=> b!797231 m!738077))

(declare-fun m!738079 () Bool)

(assert (=> b!797231 m!738079))

(assert (=> b!797231 m!738079))

(declare-fun m!738081 () Bool)

(assert (=> b!797231 m!738081))

(assert (=> b!797231 m!738079))

(declare-fun m!738083 () Bool)

(assert (=> b!797231 m!738083))

(declare-fun m!738085 () Bool)

(assert (=> b!797239 m!738085))

(declare-fun m!738087 () Bool)

(assert (=> b!797240 m!738087))

(declare-fun m!738089 () Bool)

(assert (=> b!797232 m!738089))

(declare-fun m!738091 () Bool)

(assert (=> b!797232 m!738091))

(assert (=> b!797237 m!738079))

(assert (=> b!797237 m!738079))

(declare-fun m!738093 () Bool)

(assert (=> b!797237 m!738093))

(declare-fun m!738095 () Bool)

(assert (=> start!68546 m!738095))

(declare-fun m!738097 () Bool)

(assert (=> start!68546 m!738097))

(declare-fun m!738099 () Bool)

(assert (=> b!797235 m!738099))

(declare-fun m!738101 () Bool)

(assert (=> b!797236 m!738101))

(declare-fun m!738103 () Bool)

(assert (=> b!797236 m!738103))

(declare-fun m!738105 () Bool)

(assert (=> b!797236 m!738105))

(declare-fun m!738107 () Bool)

(assert (=> b!797236 m!738107))

(declare-fun m!738109 () Bool)

(assert (=> b!797233 m!738109))

(declare-fun m!738111 () Bool)

(assert (=> b!797234 m!738111))

(push 1)

