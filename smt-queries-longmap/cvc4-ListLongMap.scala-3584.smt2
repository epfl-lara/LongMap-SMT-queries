; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49294 () Bool)

(assert start!49294)

(declare-fun b!542790 () Bool)

(declare-fun res!337351 () Bool)

(declare-fun e!314082 () Bool)

(assert (=> b!542790 (=> (not res!337351) (not e!314082))))

(declare-datatypes ((array!34302 0))(
  ( (array!34303 (arr!16484 (Array (_ BitVec 32) (_ BitVec 64))) (size!16848 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34302)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542790 (= res!337351 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542791 () Bool)

(declare-fun res!337343 () Bool)

(declare-fun e!314084 () Bool)

(assert (=> b!542791 (=> (not res!337343) (not e!314084))))

(declare-datatypes ((List!10603 0))(
  ( (Nil!10600) (Cons!10599 (h!11554 (_ BitVec 64)) (t!16831 List!10603)) )
))
(declare-fun arrayNoDuplicates!0 (array!34302 (_ BitVec 32) List!10603) Bool)

(assert (=> b!542791 (= res!337343 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10600))))

(declare-fun b!542792 () Bool)

(declare-fun e!314083 () Bool)

(assert (=> b!542792 (= e!314083 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!248011 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542792 (= lt!248011 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542793 () Bool)

(declare-fun res!337350 () Bool)

(assert (=> b!542793 (=> (not res!337350) (not e!314084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34302 (_ BitVec 32)) Bool)

(assert (=> b!542793 (= res!337350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542794 () Bool)

(assert (=> b!542794 (= e!314084 e!314083)))

(declare-fun res!337347 () Bool)

(assert (=> b!542794 (=> (not res!337347) (not e!314083))))

(declare-datatypes ((SeekEntryResult!4942 0))(
  ( (MissingZero!4942 (index!21992 (_ BitVec 32))) (Found!4942 (index!21993 (_ BitVec 32))) (Intermediate!4942 (undefined!5754 Bool) (index!21994 (_ BitVec 32)) (x!50901 (_ BitVec 32))) (Undefined!4942) (MissingVacant!4942 (index!21995 (_ BitVec 32))) )
))
(declare-fun lt!248009 () SeekEntryResult!4942)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542794 (= res!337347 (= lt!248009 (Intermediate!4942 false resIndex!32 resX!32)))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34302 (_ BitVec 32)) SeekEntryResult!4942)

(assert (=> b!542794 (= lt!248009 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16484 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542795 () Bool)

(declare-fun res!337349 () Bool)

(assert (=> b!542795 (=> (not res!337349) (not e!314082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542795 (= res!337349 (validKeyInArray!0 (select (arr!16484 a!3154) j!147)))))

(declare-fun b!542797 () Bool)

(assert (=> b!542797 (= e!314082 e!314084)))

(declare-fun res!337341 () Bool)

(assert (=> b!542797 (=> (not res!337341) (not e!314084))))

(declare-fun lt!248010 () SeekEntryResult!4942)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542797 (= res!337341 (or (= lt!248010 (MissingZero!4942 i!1153)) (= lt!248010 (MissingVacant!4942 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34302 (_ BitVec 32)) SeekEntryResult!4942)

(assert (=> b!542797 (= lt!248010 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!542798 () Bool)

(declare-fun res!337344 () Bool)

(assert (=> b!542798 (=> (not res!337344) (not e!314083))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542798 (= res!337344 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16484 a!3154) j!147) mask!3216) (select (arr!16484 a!3154) j!147) a!3154 mask!3216) lt!248009))))

(declare-fun b!542799 () Bool)

(declare-fun res!337342 () Bool)

(assert (=> b!542799 (=> (not res!337342) (not e!314083))))

(assert (=> b!542799 (= res!337342 (and (not (= (select (arr!16484 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16484 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16484 a!3154) index!1177) (select (arr!16484 a!3154) j!147)))))))

(declare-fun b!542800 () Bool)

(declare-fun res!337346 () Bool)

(assert (=> b!542800 (=> (not res!337346) (not e!314082))))

(assert (=> b!542800 (= res!337346 (validKeyInArray!0 k!1998))))

(declare-fun b!542801 () Bool)

(declare-fun res!337348 () Bool)

(assert (=> b!542801 (=> (not res!337348) (not e!314084))))

(assert (=> b!542801 (= res!337348 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16848 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16848 a!3154)) (= (select (arr!16484 a!3154) resIndex!32) (select (arr!16484 a!3154) j!147))))))

(declare-fun res!337352 () Bool)

(assert (=> start!49294 (=> (not res!337352) (not e!314082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49294 (= res!337352 (validMask!0 mask!3216))))

(assert (=> start!49294 e!314082))

(assert (=> start!49294 true))

(declare-fun array_inv!12280 (array!34302) Bool)

(assert (=> start!49294 (array_inv!12280 a!3154)))

(declare-fun b!542796 () Bool)

(declare-fun res!337345 () Bool)

(assert (=> b!542796 (=> (not res!337345) (not e!314082))))

(assert (=> b!542796 (= res!337345 (and (= (size!16848 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16848 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16848 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49294 res!337352) b!542796))

(assert (= (and b!542796 res!337345) b!542795))

(assert (= (and b!542795 res!337349) b!542800))

(assert (= (and b!542800 res!337346) b!542790))

(assert (= (and b!542790 res!337351) b!542797))

(assert (= (and b!542797 res!337341) b!542793))

(assert (= (and b!542793 res!337350) b!542791))

(assert (= (and b!542791 res!337343) b!542801))

(assert (= (and b!542801 res!337348) b!542794))

(assert (= (and b!542794 res!337347) b!542798))

(assert (= (and b!542798 res!337344) b!542799))

(assert (= (and b!542799 res!337342) b!542792))

(declare-fun m!520989 () Bool)

(assert (=> b!542791 m!520989))

(declare-fun m!520991 () Bool)

(assert (=> b!542794 m!520991))

(assert (=> b!542794 m!520991))

(declare-fun m!520993 () Bool)

(assert (=> b!542794 m!520993))

(declare-fun m!520995 () Bool)

(assert (=> start!49294 m!520995))

(declare-fun m!520997 () Bool)

(assert (=> start!49294 m!520997))

(assert (=> b!542795 m!520991))

(assert (=> b!542795 m!520991))

(declare-fun m!520999 () Bool)

(assert (=> b!542795 m!520999))

(declare-fun m!521001 () Bool)

(assert (=> b!542790 m!521001))

(declare-fun m!521003 () Bool)

(assert (=> b!542792 m!521003))

(assert (=> b!542798 m!520991))

(assert (=> b!542798 m!520991))

(declare-fun m!521005 () Bool)

(assert (=> b!542798 m!521005))

(assert (=> b!542798 m!521005))

(assert (=> b!542798 m!520991))

(declare-fun m!521007 () Bool)

(assert (=> b!542798 m!521007))

(declare-fun m!521009 () Bool)

(assert (=> b!542801 m!521009))

(assert (=> b!542801 m!520991))

(declare-fun m!521011 () Bool)

(assert (=> b!542799 m!521011))

(assert (=> b!542799 m!520991))

(declare-fun m!521013 () Bool)

(assert (=> b!542797 m!521013))

(declare-fun m!521015 () Bool)

(assert (=> b!542793 m!521015))

(declare-fun m!521017 () Bool)

(assert (=> b!542800 m!521017))

(push 1)

(assert (not b!542791))

(assert (not b!542797))

(assert (not b!542793))

(assert (not b!542790))

(assert (not b!542798))

(assert (not b!542792))

(assert (not start!49294))

(assert (not b!542800))

(assert (not b!542795))

(assert (not b!542794))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

