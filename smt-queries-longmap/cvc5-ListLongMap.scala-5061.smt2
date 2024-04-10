; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68876 () Bool)

(assert start!68876)

(declare-fun b!803184 () Bool)

(declare-fun e!445075 () Bool)

(declare-fun e!445076 () Bool)

(assert (=> b!803184 (= e!445075 e!445076)))

(declare-fun res!547703 () Bool)

(assert (=> b!803184 (=> (not res!547703) (not e!445076))))

(declare-datatypes ((SeekEntryResult!8504 0))(
  ( (MissingZero!8504 (index!36384 (_ BitVec 32))) (Found!8504 (index!36385 (_ BitVec 32))) (Intermediate!8504 (undefined!9316 Bool) (index!36386 (_ BitVec 32)) (x!67230 (_ BitVec 32))) (Undefined!8504) (MissingVacant!8504 (index!36387 (_ BitVec 32))) )
))
(declare-fun lt!359413 () SeekEntryResult!8504)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803184 (= res!547703 (or (= lt!359413 (MissingZero!8504 i!1163)) (= lt!359413 (MissingVacant!8504 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43666 0))(
  ( (array!43667 (arr!20913 (Array (_ BitVec 32) (_ BitVec 64))) (size!21334 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43666)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43666 (_ BitVec 32)) SeekEntryResult!8504)

(assert (=> b!803184 (= lt!359413 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803185 () Bool)

(declare-fun e!445077 () Bool)

(declare-fun e!445079 () Bool)

(assert (=> b!803185 (= e!445077 (not e!445079))))

(declare-fun res!547704 () Bool)

(assert (=> b!803185 (=> res!547704 e!445079)))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359412 () SeekEntryResult!8504)

(declare-fun lt!359418 () SeekEntryResult!8504)

(assert (=> b!803185 (= res!547704 (or (not (= lt!359418 lt!359412)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20913 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!359419 () array!43666)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!359420 () (_ BitVec 32))

(declare-fun lt!359416 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43666 (_ BitVec 32)) SeekEntryResult!8504)

(assert (=> b!803185 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359420 vacantAfter!23 lt!359416 lt!359419 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359420 vacantBefore!23 (select (arr!20913 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27548 0))(
  ( (Unit!27549) )
))
(declare-fun lt!359417 () Unit!27548)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43666 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27548)

(assert (=> b!803185 (= lt!359417 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359420 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803185 (= lt!359420 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803186 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803186 (= e!445079 (validKeyInArray!0 lt!359416))))

(declare-fun b!803188 () Bool)

(declare-fun res!547711 () Bool)

(assert (=> b!803188 (=> (not res!547711) (not e!445075))))

(assert (=> b!803188 (= res!547711 (validKeyInArray!0 (select (arr!20913 a!3170) j!153)))))

(declare-fun b!803189 () Bool)

(declare-fun e!445073 () Bool)

(assert (=> b!803189 (= e!445073 e!445077)))

(declare-fun res!547705 () Bool)

(assert (=> b!803189 (=> (not res!547705) (not e!445077))))

(declare-fun lt!359411 () SeekEntryResult!8504)

(assert (=> b!803189 (= res!547705 (and (= lt!359411 lt!359412) (not (= (select (arr!20913 a!3170) index!1236) (select (arr!20913 a!3170) j!153)))))))

(assert (=> b!803189 (= lt!359412 (Found!8504 j!153))))

(declare-fun b!803190 () Bool)

(declare-fun res!547712 () Bool)

(assert (=> b!803190 (=> (not res!547712) (not e!445075))))

(declare-fun arrayContainsKey!0 (array!43666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803190 (= res!547712 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803191 () Bool)

(declare-fun res!547706 () Bool)

(assert (=> b!803191 (=> (not res!547706) (not e!445075))))

(assert (=> b!803191 (= res!547706 (validKeyInArray!0 k!2044))))

(declare-fun b!803192 () Bool)

(declare-fun res!547709 () Bool)

(assert (=> b!803192 (=> (not res!547709) (not e!445076))))

(assert (=> b!803192 (= res!547709 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21334 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20913 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21334 a!3170)) (= (select (arr!20913 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803187 () Bool)

(declare-fun e!445078 () Bool)

(assert (=> b!803187 (= e!445078 e!445073)))

(declare-fun res!547708 () Bool)

(assert (=> b!803187 (=> (not res!547708) (not e!445073))))

(declare-fun lt!359414 () SeekEntryResult!8504)

(assert (=> b!803187 (= res!547708 (= lt!359414 lt!359411))))

(assert (=> b!803187 (= lt!359411 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20913 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803187 (= lt!359414 (seekEntryOrOpen!0 (select (arr!20913 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!547707 () Bool)

(assert (=> start!68876 (=> (not res!547707) (not e!445075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68876 (= res!547707 (validMask!0 mask!3266))))

(assert (=> start!68876 e!445075))

(assert (=> start!68876 true))

(declare-fun array_inv!16709 (array!43666) Bool)

(assert (=> start!68876 (array_inv!16709 a!3170)))

(declare-fun b!803193 () Bool)

(assert (=> b!803193 (= e!445076 e!445078)))

(declare-fun res!547710 () Bool)

(assert (=> b!803193 (=> (not res!547710) (not e!445078))))

(declare-fun lt!359415 () SeekEntryResult!8504)

(assert (=> b!803193 (= res!547710 (= lt!359415 lt!359418))))

(assert (=> b!803193 (= lt!359418 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359416 lt!359419 mask!3266))))

(assert (=> b!803193 (= lt!359415 (seekEntryOrOpen!0 lt!359416 lt!359419 mask!3266))))

(assert (=> b!803193 (= lt!359416 (select (store (arr!20913 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803193 (= lt!359419 (array!43667 (store (arr!20913 a!3170) i!1163 k!2044) (size!21334 a!3170)))))

(declare-fun b!803194 () Bool)

(declare-fun res!547714 () Bool)

(assert (=> b!803194 (=> (not res!547714) (not e!445076))))

(declare-datatypes ((List!14876 0))(
  ( (Nil!14873) (Cons!14872 (h!16001 (_ BitVec 64)) (t!21191 List!14876)) )
))
(declare-fun arrayNoDuplicates!0 (array!43666 (_ BitVec 32) List!14876) Bool)

(assert (=> b!803194 (= res!547714 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14873))))

(declare-fun b!803195 () Bool)

(declare-fun res!547715 () Bool)

(assert (=> b!803195 (=> (not res!547715) (not e!445076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43666 (_ BitVec 32)) Bool)

(assert (=> b!803195 (= res!547715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803196 () Bool)

(declare-fun res!547713 () Bool)

(assert (=> b!803196 (=> (not res!547713) (not e!445075))))

(assert (=> b!803196 (= res!547713 (and (= (size!21334 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21334 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21334 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68876 res!547707) b!803196))

(assert (= (and b!803196 res!547713) b!803188))

(assert (= (and b!803188 res!547711) b!803191))

(assert (= (and b!803191 res!547706) b!803190))

(assert (= (and b!803190 res!547712) b!803184))

(assert (= (and b!803184 res!547703) b!803195))

(assert (= (and b!803195 res!547715) b!803194))

(assert (= (and b!803194 res!547714) b!803192))

(assert (= (and b!803192 res!547709) b!803193))

(assert (= (and b!803193 res!547710) b!803187))

(assert (= (and b!803187 res!547708) b!803189))

(assert (= (and b!803189 res!547705) b!803185))

(assert (= (and b!803185 (not res!547704)) b!803186))

(declare-fun m!744839 () Bool)

(assert (=> b!803191 m!744839))

(declare-fun m!744841 () Bool)

(assert (=> b!803184 m!744841))

(declare-fun m!744843 () Bool)

(assert (=> b!803192 m!744843))

(declare-fun m!744845 () Bool)

(assert (=> b!803192 m!744845))

(declare-fun m!744847 () Bool)

(assert (=> b!803188 m!744847))

(assert (=> b!803188 m!744847))

(declare-fun m!744849 () Bool)

(assert (=> b!803188 m!744849))

(declare-fun m!744851 () Bool)

(assert (=> b!803189 m!744851))

(assert (=> b!803189 m!744847))

(declare-fun m!744853 () Bool)

(assert (=> b!803195 m!744853))

(assert (=> b!803185 m!744847))

(declare-fun m!744855 () Bool)

(assert (=> b!803185 m!744855))

(declare-fun m!744857 () Bool)

(assert (=> b!803185 m!744857))

(declare-fun m!744859 () Bool)

(assert (=> b!803185 m!744859))

(declare-fun m!744861 () Bool)

(assert (=> b!803185 m!744861))

(assert (=> b!803185 m!744847))

(declare-fun m!744863 () Bool)

(assert (=> b!803185 m!744863))

(declare-fun m!744865 () Bool)

(assert (=> b!803185 m!744865))

(declare-fun m!744867 () Bool)

(assert (=> b!803190 m!744867))

(declare-fun m!744869 () Bool)

(assert (=> b!803193 m!744869))

(declare-fun m!744871 () Bool)

(assert (=> b!803193 m!744871))

(assert (=> b!803193 m!744861))

(declare-fun m!744873 () Bool)

(assert (=> b!803193 m!744873))

(declare-fun m!744875 () Bool)

(assert (=> start!68876 m!744875))

(declare-fun m!744877 () Bool)

(assert (=> start!68876 m!744877))

(declare-fun m!744879 () Bool)

(assert (=> b!803186 m!744879))

(declare-fun m!744881 () Bool)

(assert (=> b!803194 m!744881))

(assert (=> b!803187 m!744847))

(assert (=> b!803187 m!744847))

(declare-fun m!744883 () Bool)

(assert (=> b!803187 m!744883))

(assert (=> b!803187 m!744847))

(declare-fun m!744885 () Bool)

(assert (=> b!803187 m!744885))

(push 1)

