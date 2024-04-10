; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69398 () Bool)

(assert start!69398)

(declare-fun b!809147 () Bool)

(declare-fun res!552880 () Bool)

(declare-fun e!447915 () Bool)

(assert (=> b!809147 (=> (not res!552880) (not e!447915))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43996 0))(
  ( (array!43997 (arr!21072 (Array (_ BitVec 32) (_ BitVec 64))) (size!21493 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43996)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!809147 (= res!552880 (and (= (size!21493 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21493 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21493 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809148 () Bool)

(declare-fun res!552881 () Bool)

(declare-fun e!447913 () Bool)

(assert (=> b!809148 (=> (not res!552881) (not e!447913))))

(declare-datatypes ((List!15035 0))(
  ( (Nil!15032) (Cons!15031 (h!16160 (_ BitVec 64)) (t!21350 List!15035)) )
))
(declare-fun arrayNoDuplicates!0 (array!43996 (_ BitVec 32) List!15035) Bool)

(assert (=> b!809148 (= res!552881 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15032))))

(declare-fun b!809149 () Bool)

(declare-fun e!447916 () Bool)

(declare-fun e!447914 () Bool)

(assert (=> b!809149 (= e!447916 e!447914)))

(declare-fun res!552884 () Bool)

(assert (=> b!809149 (=> (not res!552884) (not e!447914))))

(declare-datatypes ((SeekEntryResult!8663 0))(
  ( (MissingZero!8663 (index!37020 (_ BitVec 32))) (Found!8663 (index!37021 (_ BitVec 32))) (Intermediate!8663 (undefined!9475 Bool) (index!37022 (_ BitVec 32)) (x!67831 (_ BitVec 32))) (Undefined!8663) (MissingVacant!8663 (index!37023 (_ BitVec 32))) )
))
(declare-fun lt!362588 () SeekEntryResult!8663)

(declare-fun lt!362586 () SeekEntryResult!8663)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!809149 (= res!552884 (and (= lt!362586 lt!362588) (= lt!362588 (Found!8663 j!153)) (not (= (select (arr!21072 a!3170) index!1236) (select (arr!21072 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43996 (_ BitVec 32)) SeekEntryResult!8663)

(assert (=> b!809149 (= lt!362588 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21072 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43996 (_ BitVec 32)) SeekEntryResult!8663)

(assert (=> b!809149 (= lt!362586 (seekEntryOrOpen!0 (select (arr!21072 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809150 () Bool)

(assert (=> b!809150 (= e!447915 e!447913)))

(declare-fun res!552877 () Bool)

(assert (=> b!809150 (=> (not res!552877) (not e!447913))))

(declare-fun lt!362587 () SeekEntryResult!8663)

(assert (=> b!809150 (= res!552877 (or (= lt!362587 (MissingZero!8663 i!1163)) (= lt!362587 (MissingVacant!8663 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!809150 (= lt!362587 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!809151 () Bool)

(declare-fun res!552875 () Bool)

(assert (=> b!809151 (=> (not res!552875) (not e!447913))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!809151 (= res!552875 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21493 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21072 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21493 a!3170)) (= (select (arr!21072 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!552883 () Bool)

(assert (=> start!69398 (=> (not res!552883) (not e!447915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69398 (= res!552883 (validMask!0 mask!3266))))

(assert (=> start!69398 e!447915))

(assert (=> start!69398 true))

(declare-fun array_inv!16868 (array!43996) Bool)

(assert (=> start!69398 (array_inv!16868 a!3170)))

(declare-fun b!809152 () Bool)

(assert (=> b!809152 (= e!447914 false)))

(declare-fun lt!362589 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809152 (= lt!362589 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809153 () Bool)

(declare-fun res!552876 () Bool)

(assert (=> b!809153 (=> (not res!552876) (not e!447915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809153 (= res!552876 (validKeyInArray!0 k!2044))))

(declare-fun b!809154 () Bool)

(declare-fun res!552879 () Bool)

(assert (=> b!809154 (=> (not res!552879) (not e!447915))))

(declare-fun arrayContainsKey!0 (array!43996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809154 (= res!552879 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809155 () Bool)

(declare-fun res!552882 () Bool)

(assert (=> b!809155 (=> (not res!552882) (not e!447913))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43996 (_ BitVec 32)) Bool)

(assert (=> b!809155 (= res!552882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809156 () Bool)

(declare-fun res!552878 () Bool)

(assert (=> b!809156 (=> (not res!552878) (not e!447915))))

(assert (=> b!809156 (= res!552878 (validKeyInArray!0 (select (arr!21072 a!3170) j!153)))))

(declare-fun b!809157 () Bool)

(assert (=> b!809157 (= e!447913 e!447916)))

(declare-fun res!552874 () Bool)

(assert (=> b!809157 (=> (not res!552874) (not e!447916))))

(declare-fun lt!362591 () array!43996)

(declare-fun lt!362590 () (_ BitVec 64))

(assert (=> b!809157 (= res!552874 (= (seekEntryOrOpen!0 lt!362590 lt!362591 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362590 lt!362591 mask!3266)))))

(assert (=> b!809157 (= lt!362590 (select (store (arr!21072 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!809157 (= lt!362591 (array!43997 (store (arr!21072 a!3170) i!1163 k!2044) (size!21493 a!3170)))))

(assert (= (and start!69398 res!552883) b!809147))

(assert (= (and b!809147 res!552880) b!809156))

(assert (= (and b!809156 res!552878) b!809153))

(assert (= (and b!809153 res!552876) b!809154))

(assert (= (and b!809154 res!552879) b!809150))

(assert (= (and b!809150 res!552877) b!809155))

(assert (= (and b!809155 res!552882) b!809148))

(assert (= (and b!809148 res!552881) b!809151))

(assert (= (and b!809151 res!552875) b!809157))

(assert (= (and b!809157 res!552874) b!809149))

(assert (= (and b!809149 res!552884) b!809152))

(declare-fun m!751295 () Bool)

(assert (=> b!809154 m!751295))

(declare-fun m!751297 () Bool)

(assert (=> b!809152 m!751297))

(declare-fun m!751299 () Bool)

(assert (=> b!809151 m!751299))

(declare-fun m!751301 () Bool)

(assert (=> b!809151 m!751301))

(declare-fun m!751303 () Bool)

(assert (=> b!809149 m!751303))

(declare-fun m!751305 () Bool)

(assert (=> b!809149 m!751305))

(assert (=> b!809149 m!751305))

(declare-fun m!751307 () Bool)

(assert (=> b!809149 m!751307))

(assert (=> b!809149 m!751305))

(declare-fun m!751309 () Bool)

(assert (=> b!809149 m!751309))

(declare-fun m!751311 () Bool)

(assert (=> start!69398 m!751311))

(declare-fun m!751313 () Bool)

(assert (=> start!69398 m!751313))

(declare-fun m!751315 () Bool)

(assert (=> b!809148 m!751315))

(declare-fun m!751317 () Bool)

(assert (=> b!809155 m!751317))

(declare-fun m!751319 () Bool)

(assert (=> b!809150 m!751319))

(declare-fun m!751321 () Bool)

(assert (=> b!809153 m!751321))

(declare-fun m!751323 () Bool)

(assert (=> b!809157 m!751323))

(declare-fun m!751325 () Bool)

(assert (=> b!809157 m!751325))

(declare-fun m!751327 () Bool)

(assert (=> b!809157 m!751327))

(declare-fun m!751329 () Bool)

(assert (=> b!809157 m!751329))

(assert (=> b!809156 m!751305))

(assert (=> b!809156 m!751305))

(declare-fun m!751331 () Bool)

(assert (=> b!809156 m!751331))

(push 1)

