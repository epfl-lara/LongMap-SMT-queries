; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68604 () Bool)

(assert start!68604)

(declare-fun b!798250 () Bool)

(declare-fun res!542772 () Bool)

(declare-fun e!442807 () Bool)

(assert (=> b!798250 (=> (not res!542772) (not e!442807))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43394 0))(
  ( (array!43395 (arr!20777 (Array (_ BitVec 32) (_ BitVec 64))) (size!21198 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43394)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798250 (= res!542772 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21198 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20777 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21198 a!3170)) (= (select (arr!20777 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798251 () Bool)

(declare-fun res!542775 () Bool)

(declare-fun e!442803 () Bool)

(assert (=> b!798251 (=> (not res!542775) (not e!442803))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798251 (= res!542775 (validKeyInArray!0 k!2044))))

(declare-fun b!798252 () Bool)

(declare-fun res!542778 () Bool)

(assert (=> b!798252 (=> (not res!542778) (not e!442807))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43394 (_ BitVec 32)) Bool)

(assert (=> b!798252 (= res!542778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798253 () Bool)

(declare-fun res!542780 () Bool)

(assert (=> b!798253 (=> (not res!542780) (not e!442803))))

(declare-fun arrayContainsKey!0 (array!43394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798253 (= res!542780 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798254 () Bool)

(declare-fun res!542777 () Bool)

(assert (=> b!798254 (=> (not res!542777) (not e!442803))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798254 (= res!542777 (validKeyInArray!0 (select (arr!20777 a!3170) j!153)))))

(declare-fun b!798255 () Bool)

(declare-fun e!442804 () Bool)

(declare-fun e!442806 () Bool)

(assert (=> b!798255 (= e!442804 e!442806)))

(declare-fun res!542774 () Bool)

(assert (=> b!798255 (=> (not res!542774) (not e!442806))))

(declare-datatypes ((SeekEntryResult!8368 0))(
  ( (MissingZero!8368 (index!35840 (_ BitVec 32))) (Found!8368 (index!35841 (_ BitVec 32))) (Intermediate!8368 (undefined!9180 Bool) (index!35842 (_ BitVec 32)) (x!66726 (_ BitVec 32))) (Undefined!8368) (MissingVacant!8368 (index!35843 (_ BitVec 32))) )
))
(declare-fun lt!356297 () SeekEntryResult!8368)

(declare-fun lt!356302 () SeekEntryResult!8368)

(assert (=> b!798255 (= res!542774 (and (= lt!356302 lt!356297) (= (select (arr!20777 a!3170) index!1236) (select (arr!20777 a!3170) j!153))))))

(assert (=> b!798255 (= lt!356297 (Found!8368 j!153))))

(declare-fun b!798256 () Bool)

(declare-fun res!542776 () Bool)

(assert (=> b!798256 (=> (not res!542776) (not e!442807))))

(declare-datatypes ((List!14740 0))(
  ( (Nil!14737) (Cons!14736 (h!15865 (_ BitVec 64)) (t!21055 List!14740)) )
))
(declare-fun arrayNoDuplicates!0 (array!43394 (_ BitVec 32) List!14740) Bool)

(assert (=> b!798256 (= res!542776 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14737))))

(declare-fun res!542770 () Bool)

(assert (=> start!68604 (=> (not res!542770) (not e!442803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68604 (= res!542770 (validMask!0 mask!3266))))

(assert (=> start!68604 e!442803))

(assert (=> start!68604 true))

(declare-fun array_inv!16573 (array!43394) Bool)

(assert (=> start!68604 (array_inv!16573 a!3170)))

(declare-fun b!798257 () Bool)

(declare-fun e!442805 () Bool)

(assert (=> b!798257 (= e!442807 e!442805)))

(declare-fun res!542771 () Bool)

(assert (=> b!798257 (=> (not res!542771) (not e!442805))))

(declare-fun lt!356298 () SeekEntryResult!8368)

(declare-fun lt!356299 () SeekEntryResult!8368)

(assert (=> b!798257 (= res!542771 (= lt!356298 lt!356299))))

(declare-fun lt!356303 () (_ BitVec 64))

(declare-fun lt!356296 () array!43394)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43394 (_ BitVec 32)) SeekEntryResult!8368)

(assert (=> b!798257 (= lt!356299 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356303 lt!356296 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43394 (_ BitVec 32)) SeekEntryResult!8368)

(assert (=> b!798257 (= lt!356298 (seekEntryOrOpen!0 lt!356303 lt!356296 mask!3266))))

(assert (=> b!798257 (= lt!356303 (select (store (arr!20777 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798257 (= lt!356296 (array!43395 (store (arr!20777 a!3170) i!1163 k!2044) (size!21198 a!3170)))))

(declare-fun b!798258 () Bool)

(assert (=> b!798258 (= e!442806 (not (or (not (= lt!356299 lt!356297)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (and (bvsge vacantBefore!23 #b00000000000000000000000000000000) (bvslt vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))))

(assert (=> b!798258 (= lt!356299 (Found!8368 index!1236))))

(declare-fun b!798259 () Bool)

(declare-fun res!542779 () Bool)

(assert (=> b!798259 (=> (not res!542779) (not e!442803))))

(assert (=> b!798259 (= res!542779 (and (= (size!21198 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21198 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21198 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798260 () Bool)

(assert (=> b!798260 (= e!442805 e!442804)))

(declare-fun res!542773 () Bool)

(assert (=> b!798260 (=> (not res!542773) (not e!442804))))

(declare-fun lt!356300 () SeekEntryResult!8368)

(assert (=> b!798260 (= res!542773 (= lt!356300 lt!356302))))

(assert (=> b!798260 (= lt!356302 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20777 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798260 (= lt!356300 (seekEntryOrOpen!0 (select (arr!20777 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798261 () Bool)

(assert (=> b!798261 (= e!442803 e!442807)))

(declare-fun res!542769 () Bool)

(assert (=> b!798261 (=> (not res!542769) (not e!442807))))

(declare-fun lt!356301 () SeekEntryResult!8368)

(assert (=> b!798261 (= res!542769 (or (= lt!356301 (MissingZero!8368 i!1163)) (= lt!356301 (MissingVacant!8368 i!1163))))))

(assert (=> b!798261 (= lt!356301 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68604 res!542770) b!798259))

(assert (= (and b!798259 res!542779) b!798254))

(assert (= (and b!798254 res!542777) b!798251))

(assert (= (and b!798251 res!542775) b!798253))

(assert (= (and b!798253 res!542780) b!798261))

(assert (= (and b!798261 res!542769) b!798252))

(assert (= (and b!798252 res!542778) b!798256))

(assert (= (and b!798256 res!542776) b!798250))

(assert (= (and b!798250 res!542772) b!798257))

(assert (= (and b!798257 res!542771) b!798260))

(assert (= (and b!798260 res!542773) b!798255))

(assert (= (and b!798255 res!542774) b!798258))

(declare-fun m!739139 () Bool)

(assert (=> b!798260 m!739139))

(assert (=> b!798260 m!739139))

(declare-fun m!739141 () Bool)

(assert (=> b!798260 m!739141))

(assert (=> b!798260 m!739139))

(declare-fun m!739143 () Bool)

(assert (=> b!798260 m!739143))

(declare-fun m!739145 () Bool)

(assert (=> b!798250 m!739145))

(declare-fun m!739147 () Bool)

(assert (=> b!798250 m!739147))

(declare-fun m!739149 () Bool)

(assert (=> b!798255 m!739149))

(assert (=> b!798255 m!739139))

(declare-fun m!739151 () Bool)

(assert (=> b!798261 m!739151))

(declare-fun m!739153 () Bool)

(assert (=> b!798253 m!739153))

(declare-fun m!739155 () Bool)

(assert (=> b!798256 m!739155))

(declare-fun m!739157 () Bool)

(assert (=> b!798251 m!739157))

(declare-fun m!739159 () Bool)

(assert (=> start!68604 m!739159))

(declare-fun m!739161 () Bool)

(assert (=> start!68604 m!739161))

(declare-fun m!739163 () Bool)

(assert (=> b!798257 m!739163))

(declare-fun m!739165 () Bool)

(assert (=> b!798257 m!739165))

(declare-fun m!739167 () Bool)

(assert (=> b!798257 m!739167))

(declare-fun m!739169 () Bool)

(assert (=> b!798257 m!739169))

(assert (=> b!798254 m!739139))

(assert (=> b!798254 m!739139))

(declare-fun m!739171 () Bool)

(assert (=> b!798254 m!739171))

(declare-fun m!739173 () Bool)

(assert (=> b!798252 m!739173))

(push 1)

(assert (not b!798261))

(assert (not b!798252))

(assert (not b!798257))

(assert (not b!798260))

(assert (not b!798254))

(assert (not start!68604))

(assert (not b!798253))

(assert (not b!798251))

(assert (not b!798256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

