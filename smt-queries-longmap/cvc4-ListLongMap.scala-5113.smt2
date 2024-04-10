; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69396 () Bool)

(assert start!69396)

(declare-fun b!809114 () Bool)

(declare-fun res!552848 () Bool)

(declare-fun e!447900 () Bool)

(assert (=> b!809114 (=> (not res!552848) (not e!447900))))

(declare-datatypes ((array!43994 0))(
  ( (array!43995 (arr!21071 (Array (_ BitVec 32) (_ BitVec 64))) (size!21492 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43994)

(declare-datatypes ((List!15034 0))(
  ( (Nil!15031) (Cons!15030 (h!16159 (_ BitVec 64)) (t!21349 List!15034)) )
))
(declare-fun arrayNoDuplicates!0 (array!43994 (_ BitVec 32) List!15034) Bool)

(assert (=> b!809114 (= res!552848 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15031))))

(declare-fun b!809115 () Bool)

(declare-fun e!447902 () Bool)

(assert (=> b!809115 (= e!447902 false)))

(declare-fun lt!362572 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809115 (= lt!362572 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809116 () Bool)

(declare-fun res!552851 () Bool)

(declare-fun e!447898 () Bool)

(assert (=> b!809116 (=> (not res!552851) (not e!447898))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43994 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809116 (= res!552851 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809117 () Bool)

(declare-fun e!447901 () Bool)

(assert (=> b!809117 (= e!447901 e!447902)))

(declare-fun res!552849 () Bool)

(assert (=> b!809117 (=> (not res!552849) (not e!447902))))

(declare-datatypes ((SeekEntryResult!8662 0))(
  ( (MissingZero!8662 (index!37016 (_ BitVec 32))) (Found!8662 (index!37017 (_ BitVec 32))) (Intermediate!8662 (undefined!9474 Bool) (index!37018 (_ BitVec 32)) (x!67822 (_ BitVec 32))) (Undefined!8662) (MissingVacant!8662 (index!37019 (_ BitVec 32))) )
))
(declare-fun lt!362570 () SeekEntryResult!8662)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!362569 () SeekEntryResult!8662)

(assert (=> b!809117 (= res!552849 (and (= lt!362569 lt!362570) (= lt!362570 (Found!8662 j!153)) (not (= (select (arr!21071 a!3170) index!1236) (select (arr!21071 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43994 (_ BitVec 32)) SeekEntryResult!8662)

(assert (=> b!809117 (= lt!362570 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21071 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43994 (_ BitVec 32)) SeekEntryResult!8662)

(assert (=> b!809117 (= lt!362569 (seekEntryOrOpen!0 (select (arr!21071 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809119 () Bool)

(assert (=> b!809119 (= e!447900 e!447901)))

(declare-fun res!552847 () Bool)

(assert (=> b!809119 (=> (not res!552847) (not e!447901))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362573 () array!43994)

(declare-fun lt!362568 () (_ BitVec 64))

(assert (=> b!809119 (= res!552847 (= (seekEntryOrOpen!0 lt!362568 lt!362573 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362568 lt!362573 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809119 (= lt!362568 (select (store (arr!21071 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!809119 (= lt!362573 (array!43995 (store (arr!21071 a!3170) i!1163 k!2044) (size!21492 a!3170)))))

(declare-fun b!809120 () Bool)

(declare-fun res!552844 () Bool)

(assert (=> b!809120 (=> (not res!552844) (not e!447900))))

(assert (=> b!809120 (= res!552844 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21492 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21071 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21492 a!3170)) (= (select (arr!21071 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809121 () Bool)

(declare-fun res!552845 () Bool)

(assert (=> b!809121 (=> (not res!552845) (not e!447900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43994 (_ BitVec 32)) Bool)

(assert (=> b!809121 (= res!552845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809122 () Bool)

(declare-fun res!552850 () Bool)

(assert (=> b!809122 (=> (not res!552850) (not e!447898))))

(assert (=> b!809122 (= res!552850 (and (= (size!21492 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21492 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21492 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809123 () Bool)

(assert (=> b!809123 (= e!447898 e!447900)))

(declare-fun res!552841 () Bool)

(assert (=> b!809123 (=> (not res!552841) (not e!447900))))

(declare-fun lt!362571 () SeekEntryResult!8662)

(assert (=> b!809123 (= res!552841 (or (= lt!362571 (MissingZero!8662 i!1163)) (= lt!362571 (MissingVacant!8662 i!1163))))))

(assert (=> b!809123 (= lt!362571 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!809124 () Bool)

(declare-fun res!552843 () Bool)

(assert (=> b!809124 (=> (not res!552843) (not e!447898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809124 (= res!552843 (validKeyInArray!0 (select (arr!21071 a!3170) j!153)))))

(declare-fun b!809118 () Bool)

(declare-fun res!552846 () Bool)

(assert (=> b!809118 (=> (not res!552846) (not e!447898))))

(assert (=> b!809118 (= res!552846 (validKeyInArray!0 k!2044))))

(declare-fun res!552842 () Bool)

(assert (=> start!69396 (=> (not res!552842) (not e!447898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69396 (= res!552842 (validMask!0 mask!3266))))

(assert (=> start!69396 e!447898))

(assert (=> start!69396 true))

(declare-fun array_inv!16867 (array!43994) Bool)

(assert (=> start!69396 (array_inv!16867 a!3170)))

(assert (= (and start!69396 res!552842) b!809122))

(assert (= (and b!809122 res!552850) b!809124))

(assert (= (and b!809124 res!552843) b!809118))

(assert (= (and b!809118 res!552846) b!809116))

(assert (= (and b!809116 res!552851) b!809123))

(assert (= (and b!809123 res!552841) b!809121))

(assert (= (and b!809121 res!552845) b!809114))

(assert (= (and b!809114 res!552848) b!809120))

(assert (= (and b!809120 res!552844) b!809119))

(assert (= (and b!809119 res!552847) b!809117))

(assert (= (and b!809117 res!552849) b!809115))

(declare-fun m!751257 () Bool)

(assert (=> b!809121 m!751257))

(declare-fun m!751259 () Bool)

(assert (=> b!809118 m!751259))

(declare-fun m!751261 () Bool)

(assert (=> b!809115 m!751261))

(declare-fun m!751263 () Bool)

(assert (=> b!809123 m!751263))

(declare-fun m!751265 () Bool)

(assert (=> b!809116 m!751265))

(declare-fun m!751267 () Bool)

(assert (=> b!809120 m!751267))

(declare-fun m!751269 () Bool)

(assert (=> b!809120 m!751269))

(declare-fun m!751271 () Bool)

(assert (=> b!809119 m!751271))

(declare-fun m!751273 () Bool)

(assert (=> b!809119 m!751273))

(declare-fun m!751275 () Bool)

(assert (=> b!809119 m!751275))

(declare-fun m!751277 () Bool)

(assert (=> b!809119 m!751277))

(declare-fun m!751279 () Bool)

(assert (=> b!809117 m!751279))

(declare-fun m!751281 () Bool)

(assert (=> b!809117 m!751281))

(assert (=> b!809117 m!751281))

(declare-fun m!751283 () Bool)

(assert (=> b!809117 m!751283))

(assert (=> b!809117 m!751281))

(declare-fun m!751285 () Bool)

(assert (=> b!809117 m!751285))

(declare-fun m!751287 () Bool)

(assert (=> b!809114 m!751287))

(assert (=> b!809124 m!751281))

(assert (=> b!809124 m!751281))

(declare-fun m!751289 () Bool)

(assert (=> b!809124 m!751289))

(declare-fun m!751291 () Bool)

(assert (=> start!69396 m!751291))

(declare-fun m!751293 () Bool)

(assert (=> start!69396 m!751293))

(push 1)

(assert (not b!809118))

(assert (not b!809121))

