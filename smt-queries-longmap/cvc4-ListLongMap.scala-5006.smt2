; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68550 () Bool)

(assert start!68550)

(declare-fun b!797297 () Bool)

(declare-fun e!442336 () Bool)

(declare-fun e!442338 () Bool)

(assert (=> b!797297 (= e!442336 e!442338)))

(declare-fun res!541823 () Bool)

(assert (=> b!797297 (=> (not res!541823) (not e!442338))))

(declare-datatypes ((array!43340 0))(
  ( (array!43341 (arr!20750 (Array (_ BitVec 32) (_ BitVec 64))) (size!21171 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43340)

(declare-datatypes ((SeekEntryResult!8341 0))(
  ( (MissingZero!8341 (index!35732 (_ BitVec 32))) (Found!8341 (index!35733 (_ BitVec 32))) (Intermediate!8341 (undefined!9153 Bool) (index!35734 (_ BitVec 32)) (x!66627 (_ BitVec 32))) (Undefined!8341) (MissingVacant!8341 (index!35735 (_ BitVec 32))) )
))
(declare-fun lt!355677 () SeekEntryResult!8341)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!355681 () SeekEntryResult!8341)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797297 (= res!541823 (and (= lt!355677 lt!355681) (= lt!355681 (Found!8341 j!153)) (= (select (arr!20750 a!3170) index!1236) (select (arr!20750 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43340 (_ BitVec 32)) SeekEntryResult!8341)

(assert (=> b!797297 (= lt!355681 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20750 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43340 (_ BitVec 32)) SeekEntryResult!8341)

(assert (=> b!797297 (= lt!355677 (seekEntryOrOpen!0 (select (arr!20750 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797298 () Bool)

(declare-fun res!541822 () Bool)

(declare-fun e!442339 () Bool)

(assert (=> b!797298 (=> (not res!541822) (not e!442339))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!797298 (= res!541822 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21171 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20750 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21171 a!3170)) (= (select (arr!20750 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797299 () Bool)

(declare-fun res!541818 () Bool)

(declare-fun e!442340 () Bool)

(assert (=> b!797299 (=> (not res!541818) (not e!442340))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797299 (= res!541818 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797300 () Bool)

(declare-fun res!541819 () Bool)

(assert (=> b!797300 (=> (not res!541819) (not e!442340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797300 (= res!541819 (validKeyInArray!0 k!2044))))

(declare-fun b!797301 () Bool)

(assert (=> b!797301 (= e!442339 e!442336)))

(declare-fun res!541825 () Bool)

(assert (=> b!797301 (=> (not res!541825) (not e!442336))))

(declare-fun lt!355678 () SeekEntryResult!8341)

(declare-fun lt!355676 () SeekEntryResult!8341)

(assert (=> b!797301 (= res!541825 (= lt!355678 lt!355676))))

(declare-fun lt!355682 () array!43340)

(declare-fun lt!355680 () (_ BitVec 64))

(assert (=> b!797301 (= lt!355676 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355680 lt!355682 mask!3266))))

(assert (=> b!797301 (= lt!355678 (seekEntryOrOpen!0 lt!355680 lt!355682 mask!3266))))

(assert (=> b!797301 (= lt!355680 (select (store (arr!20750 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!797301 (= lt!355682 (array!43341 (store (arr!20750 a!3170) i!1163 k!2044) (size!21171 a!3170)))))

(declare-fun b!797302 () Bool)

(declare-fun res!541821 () Bool)

(assert (=> b!797302 (=> (not res!541821) (not e!442340))))

(assert (=> b!797302 (= res!541821 (and (= (size!21171 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21171 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21171 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797303 () Bool)

(assert (=> b!797303 (= e!442340 e!442339)))

(declare-fun res!541816 () Bool)

(assert (=> b!797303 (=> (not res!541816) (not e!442339))))

(declare-fun lt!355679 () SeekEntryResult!8341)

(assert (=> b!797303 (= res!541816 (or (= lt!355679 (MissingZero!8341 i!1163)) (= lt!355679 (MissingVacant!8341 i!1163))))))

(assert (=> b!797303 (= lt!355679 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!797304 () Bool)

(declare-fun res!541826 () Bool)

(assert (=> b!797304 (=> (not res!541826) (not e!442340))))

(assert (=> b!797304 (= res!541826 (validKeyInArray!0 (select (arr!20750 a!3170) j!153)))))

(declare-fun b!797305 () Bool)

(assert (=> b!797305 (= e!442338 (not true))))

(assert (=> b!797305 (= lt!355676 (Found!8341 index!1236))))

(declare-fun res!541817 () Bool)

(assert (=> start!68550 (=> (not res!541817) (not e!442340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68550 (= res!541817 (validMask!0 mask!3266))))

(assert (=> start!68550 e!442340))

(assert (=> start!68550 true))

(declare-fun array_inv!16546 (array!43340) Bool)

(assert (=> start!68550 (array_inv!16546 a!3170)))

(declare-fun b!797306 () Bool)

(declare-fun res!541824 () Bool)

(assert (=> b!797306 (=> (not res!541824) (not e!442339))))

(declare-datatypes ((List!14713 0))(
  ( (Nil!14710) (Cons!14709 (h!15838 (_ BitVec 64)) (t!21028 List!14713)) )
))
(declare-fun arrayNoDuplicates!0 (array!43340 (_ BitVec 32) List!14713) Bool)

(assert (=> b!797306 (= res!541824 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14710))))

(declare-fun b!797307 () Bool)

(declare-fun res!541820 () Bool)

(assert (=> b!797307 (=> (not res!541820) (not e!442339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43340 (_ BitVec 32)) Bool)

(assert (=> b!797307 (= res!541820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68550 res!541817) b!797302))

(assert (= (and b!797302 res!541821) b!797304))

(assert (= (and b!797304 res!541826) b!797300))

(assert (= (and b!797300 res!541819) b!797299))

(assert (= (and b!797299 res!541818) b!797303))

(assert (= (and b!797303 res!541816) b!797307))

(assert (= (and b!797307 res!541820) b!797306))

(assert (= (and b!797306 res!541824) b!797298))

(assert (= (and b!797298 res!541822) b!797301))

(assert (= (and b!797301 res!541825) b!797297))

(assert (= (and b!797297 res!541823) b!797305))

(declare-fun m!738149 () Bool)

(assert (=> b!797304 m!738149))

(assert (=> b!797304 m!738149))

(declare-fun m!738151 () Bool)

(assert (=> b!797304 m!738151))

(declare-fun m!738153 () Bool)

(assert (=> b!797303 m!738153))

(declare-fun m!738155 () Bool)

(assert (=> b!797299 m!738155))

(declare-fun m!738157 () Bool)

(assert (=> start!68550 m!738157))

(declare-fun m!738159 () Bool)

(assert (=> start!68550 m!738159))

(declare-fun m!738161 () Bool)

(assert (=> b!797298 m!738161))

(declare-fun m!738163 () Bool)

(assert (=> b!797298 m!738163))

(declare-fun m!738165 () Bool)

(assert (=> b!797301 m!738165))

(declare-fun m!738167 () Bool)

(assert (=> b!797301 m!738167))

(declare-fun m!738169 () Bool)

(assert (=> b!797301 m!738169))

(declare-fun m!738171 () Bool)

(assert (=> b!797301 m!738171))

(declare-fun m!738173 () Bool)

(assert (=> b!797300 m!738173))

(declare-fun m!738175 () Bool)

(assert (=> b!797307 m!738175))

(declare-fun m!738177 () Bool)

(assert (=> b!797297 m!738177))

(assert (=> b!797297 m!738149))

(assert (=> b!797297 m!738149))

(declare-fun m!738179 () Bool)

(assert (=> b!797297 m!738179))

(assert (=> b!797297 m!738149))

(declare-fun m!738181 () Bool)

(assert (=> b!797297 m!738181))

(declare-fun m!738183 () Bool)

(assert (=> b!797306 m!738183))

(push 1)

