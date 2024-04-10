; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68846 () Bool)

(assert start!68846)

(declare-fun b!802658 () Bool)

(declare-fun res!547184 () Bool)

(declare-fun e!444820 () Bool)

(assert (=> b!802658 (=> (not res!547184) (not e!444820))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43636 0))(
  ( (array!43637 (arr!20898 (Array (_ BitVec 32) (_ BitVec 64))) (size!21319 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43636)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!802658 (= res!547184 (and (= (size!21319 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21319 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21319 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!547183 () Bool)

(assert (=> start!68846 (=> (not res!547183) (not e!444820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68846 (= res!547183 (validMask!0 mask!3266))))

(assert (=> start!68846 e!444820))

(assert (=> start!68846 true))

(declare-fun array_inv!16694 (array!43636) Bool)

(assert (=> start!68846 (array_inv!16694 a!3170)))

(declare-fun b!802659 () Bool)

(declare-fun res!547180 () Bool)

(assert (=> b!802659 (=> (not res!547180) (not e!444820))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802659 (= res!547180 (validKeyInArray!0 k!2044))))

(declare-fun b!802660 () Bool)

(declare-fun res!547182 () Bool)

(declare-fun e!444818 () Bool)

(assert (=> b!802660 (=> (not res!547182) (not e!444818))))

(declare-datatypes ((List!14861 0))(
  ( (Nil!14858) (Cons!14857 (h!15986 (_ BitVec 64)) (t!21176 List!14861)) )
))
(declare-fun arrayNoDuplicates!0 (array!43636 (_ BitVec 32) List!14861) Bool)

(assert (=> b!802660 (= res!547182 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14858))))

(declare-fun b!802661 () Bool)

(assert (=> b!802661 (= e!444820 e!444818)))

(declare-fun res!547177 () Bool)

(assert (=> b!802661 (=> (not res!547177) (not e!444818))))

(declare-datatypes ((SeekEntryResult!8489 0))(
  ( (MissingZero!8489 (index!36324 (_ BitVec 32))) (Found!8489 (index!36325 (_ BitVec 32))) (Intermediate!8489 (undefined!9301 Bool) (index!36326 (_ BitVec 32)) (x!67175 (_ BitVec 32))) (Undefined!8489) (MissingVacant!8489 (index!36327 (_ BitVec 32))) )
))
(declare-fun lt!359014 () SeekEntryResult!8489)

(assert (=> b!802661 (= res!547177 (or (= lt!359014 (MissingZero!8489 i!1163)) (= lt!359014 (MissingVacant!8489 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43636 (_ BitVec 32)) SeekEntryResult!8489)

(assert (=> b!802661 (= lt!359014 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!802662 () Bool)

(declare-fun e!444817 () Bool)

(assert (=> b!802662 (= e!444818 e!444817)))

(declare-fun res!547187 () Bool)

(assert (=> b!802662 (=> (not res!547187) (not e!444817))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!359012 () (_ BitVec 64))

(declare-fun lt!359013 () array!43636)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43636 (_ BitVec 32)) SeekEntryResult!8489)

(assert (=> b!802662 (= res!547187 (= (seekEntryOrOpen!0 lt!359012 lt!359013 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359012 lt!359013 mask!3266)))))

(assert (=> b!802662 (= lt!359012 (select (store (arr!20898 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!802662 (= lt!359013 (array!43637 (store (arr!20898 a!3170) i!1163 k!2044) (size!21319 a!3170)))))

(declare-fun b!802663 () Bool)

(declare-fun res!547179 () Bool)

(assert (=> b!802663 (=> (not res!547179) (not e!444818))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43636 (_ BitVec 32)) Bool)

(assert (=> b!802663 (= res!547179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802664 () Bool)

(declare-fun e!444821 () Bool)

(assert (=> b!802664 (= e!444821 (not true))))

(declare-fun lt!359010 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!802664 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359010 vacantAfter!23 lt!359012 lt!359013 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359010 vacantBefore!23 (select (arr!20898 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27518 0))(
  ( (Unit!27519) )
))
(declare-fun lt!359011 () Unit!27518)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43636 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27518)

(assert (=> b!802664 (= lt!359011 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359010 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802664 (= lt!359010 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!802665 () Bool)

(declare-fun res!547181 () Bool)

(assert (=> b!802665 (=> (not res!547181) (not e!444820))))

(declare-fun arrayContainsKey!0 (array!43636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802665 (= res!547181 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802666 () Bool)

(assert (=> b!802666 (= e!444817 e!444821)))

(declare-fun res!547185 () Bool)

(assert (=> b!802666 (=> (not res!547185) (not e!444821))))

(declare-fun lt!359015 () SeekEntryResult!8489)

(declare-fun lt!359009 () SeekEntryResult!8489)

(assert (=> b!802666 (= res!547185 (and (= lt!359015 lt!359009) (= lt!359009 (Found!8489 j!153)) (not (= (select (arr!20898 a!3170) index!1236) (select (arr!20898 a!3170) j!153)))))))

(assert (=> b!802666 (= lt!359009 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20898 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802666 (= lt!359015 (seekEntryOrOpen!0 (select (arr!20898 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802667 () Bool)

(declare-fun res!547178 () Bool)

(assert (=> b!802667 (=> (not res!547178) (not e!444818))))

(assert (=> b!802667 (= res!547178 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21319 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20898 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21319 a!3170)) (= (select (arr!20898 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802668 () Bool)

(declare-fun res!547186 () Bool)

(assert (=> b!802668 (=> (not res!547186) (not e!444820))))

(assert (=> b!802668 (= res!547186 (validKeyInArray!0 (select (arr!20898 a!3170) j!153)))))

(assert (= (and start!68846 res!547183) b!802658))

(assert (= (and b!802658 res!547184) b!802668))

(assert (= (and b!802668 res!547186) b!802659))

(assert (= (and b!802659 res!547180) b!802665))

(assert (= (and b!802665 res!547181) b!802661))

(assert (= (and b!802661 res!547177) b!802663))

(assert (= (and b!802663 res!547179) b!802660))

(assert (= (and b!802660 res!547182) b!802667))

(assert (= (and b!802667 res!547178) b!802662))

(assert (= (and b!802662 res!547187) b!802666))

(assert (= (and b!802666 res!547185) b!802664))

(declare-fun m!744173 () Bool)

(assert (=> b!802663 m!744173))

(declare-fun m!744175 () Bool)

(assert (=> b!802666 m!744175))

(declare-fun m!744177 () Bool)

(assert (=> b!802666 m!744177))

(assert (=> b!802666 m!744177))

(declare-fun m!744179 () Bool)

(assert (=> b!802666 m!744179))

(assert (=> b!802666 m!744177))

(declare-fun m!744181 () Bool)

(assert (=> b!802666 m!744181))

(declare-fun m!744183 () Bool)

(assert (=> b!802661 m!744183))

(declare-fun m!744185 () Bool)

(assert (=> b!802665 m!744185))

(declare-fun m!744187 () Bool)

(assert (=> b!802662 m!744187))

(declare-fun m!744189 () Bool)

(assert (=> b!802662 m!744189))

(declare-fun m!744191 () Bool)

(assert (=> b!802662 m!744191))

(declare-fun m!744193 () Bool)

(assert (=> b!802662 m!744193))

(declare-fun m!744195 () Bool)

(assert (=> b!802667 m!744195))

(declare-fun m!744197 () Bool)

(assert (=> b!802667 m!744197))

(declare-fun m!744199 () Bool)

(assert (=> b!802659 m!744199))

(declare-fun m!744201 () Bool)

(assert (=> start!68846 m!744201))

(declare-fun m!744203 () Bool)

(assert (=> start!68846 m!744203))

(assert (=> b!802668 m!744177))

(assert (=> b!802668 m!744177))

(declare-fun m!744205 () Bool)

(assert (=> b!802668 m!744205))

(declare-fun m!744207 () Bool)

(assert (=> b!802660 m!744207))

(declare-fun m!744209 () Bool)

(assert (=> b!802664 m!744209))

(declare-fun m!744211 () Bool)

(assert (=> b!802664 m!744211))

(assert (=> b!802664 m!744177))

(declare-fun m!744213 () Bool)

(assert (=> b!802664 m!744213))

(declare-fun m!744215 () Bool)

(assert (=> b!802664 m!744215))

(assert (=> b!802664 m!744177))

(push 1)

