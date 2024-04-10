; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68472 () Bool)

(assert start!68472)

(declare-fun res!540510 () Bool)

(declare-fun e!441726 () Bool)

(assert (=> start!68472 (=> (not res!540510) (not e!441726))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68472 (= res!540510 (validMask!0 mask!3266))))

(assert (=> start!68472 e!441726))

(assert (=> start!68472 true))

(declare-datatypes ((array!43262 0))(
  ( (array!43263 (arr!20711 (Array (_ BitVec 32) (_ BitVec 64))) (size!21132 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43262)

(declare-fun array_inv!16507 (array!43262) Bool)

(assert (=> start!68472 (array_inv!16507 a!3170)))

(declare-fun b!795983 () Bool)

(declare-fun res!540504 () Bool)

(declare-fun e!441725 () Bool)

(assert (=> b!795983 (=> (not res!540504) (not e!441725))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43262 (_ BitVec 32)) Bool)

(assert (=> b!795983 (= res!540504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795984 () Bool)

(declare-fun e!441724 () Bool)

(assert (=> b!795984 (= e!441725 e!441724)))

(declare-fun res!540508 () Bool)

(assert (=> b!795984 (=> (not res!540508) (not e!441724))))

(declare-fun lt!354845 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354841 () array!43262)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8302 0))(
  ( (MissingZero!8302 (index!35576 (_ BitVec 32))) (Found!8302 (index!35577 (_ BitVec 32))) (Intermediate!8302 (undefined!9114 Bool) (index!35578 (_ BitVec 32)) (x!66484 (_ BitVec 32))) (Undefined!8302) (MissingVacant!8302 (index!35579 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43262 (_ BitVec 32)) SeekEntryResult!8302)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43262 (_ BitVec 32)) SeekEntryResult!8302)

(assert (=> b!795984 (= res!540508 (= (seekEntryOrOpen!0 lt!354845 lt!354841 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354845 lt!354841 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795984 (= lt!354845 (select (store (arr!20711 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795984 (= lt!354841 (array!43263 (store (arr!20711 a!3170) i!1163 k!2044) (size!21132 a!3170)))))

(declare-fun b!795985 () Bool)

(declare-fun res!540507 () Bool)

(assert (=> b!795985 (=> (not res!540507) (not e!441725))))

(declare-datatypes ((List!14674 0))(
  ( (Nil!14671) (Cons!14670 (h!15799 (_ BitVec 64)) (t!20989 List!14674)) )
))
(declare-fun arrayNoDuplicates!0 (array!43262 (_ BitVec 32) List!14674) Bool)

(assert (=> b!795985 (= res!540507 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14671))))

(declare-fun b!795986 () Bool)

(declare-fun e!441727 () Bool)

(assert (=> b!795986 (= e!441724 e!441727)))

(declare-fun res!540505 () Bool)

(assert (=> b!795986 (=> (not res!540505) (not e!441727))))

(declare-fun lt!354842 () SeekEntryResult!8302)

(declare-fun lt!354843 () SeekEntryResult!8302)

(assert (=> b!795986 (= res!540505 (and (= lt!354842 lt!354843) (= lt!354843 (Found!8302 j!153)) (= (select (arr!20711 a!3170) index!1236) (select (arr!20711 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20711 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!795986 (= lt!354843 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20711 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!795986 (= lt!354842 (seekEntryOrOpen!0 (select (arr!20711 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795987 () Bool)

(declare-fun res!540509 () Bool)

(assert (=> b!795987 (=> (not res!540509) (not e!441725))))

(assert (=> b!795987 (= res!540509 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21132 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20711 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21132 a!3170)) (= (select (arr!20711 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795988 () Bool)

(assert (=> b!795988 (= e!441726 e!441725)))

(declare-fun res!540506 () Bool)

(assert (=> b!795988 (=> (not res!540506) (not e!441725))))

(declare-fun lt!354844 () SeekEntryResult!8302)

(assert (=> b!795988 (= res!540506 (or (= lt!354844 (MissingZero!8302 i!1163)) (= lt!354844 (MissingVacant!8302 i!1163))))))

(assert (=> b!795988 (= lt!354844 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795989 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795989 (= e!441727 (not (validKeyInArray!0 lt!354845)))))

(declare-fun b!795990 () Bool)

(declare-fun res!540503 () Bool)

(assert (=> b!795990 (=> (not res!540503) (not e!441726))))

(assert (=> b!795990 (= res!540503 (and (= (size!21132 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21132 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21132 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795991 () Bool)

(declare-fun res!540511 () Bool)

(assert (=> b!795991 (=> (not res!540511) (not e!441726))))

(assert (=> b!795991 (= res!540511 (validKeyInArray!0 (select (arr!20711 a!3170) j!153)))))

(declare-fun b!795992 () Bool)

(declare-fun res!540512 () Bool)

(assert (=> b!795992 (=> (not res!540512) (not e!441726))))

(declare-fun arrayContainsKey!0 (array!43262 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795992 (= res!540512 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795993 () Bool)

(declare-fun res!540502 () Bool)

(assert (=> b!795993 (=> (not res!540502) (not e!441726))))

(assert (=> b!795993 (= res!540502 (validKeyInArray!0 k!2044))))

(assert (= (and start!68472 res!540510) b!795990))

(assert (= (and b!795990 res!540503) b!795991))

(assert (= (and b!795991 res!540511) b!795993))

(assert (= (and b!795993 res!540502) b!795992))

(assert (= (and b!795992 res!540512) b!795988))

(assert (= (and b!795988 res!540506) b!795983))

(assert (= (and b!795983 res!540504) b!795985))

(assert (= (and b!795985 res!540507) b!795987))

(assert (= (and b!795987 res!540509) b!795984))

(assert (= (and b!795984 res!540508) b!795986))

(assert (= (and b!795986 res!540505) b!795989))

(declare-fun m!736723 () Bool)

(assert (=> b!795983 m!736723))

(declare-fun m!736725 () Bool)

(assert (=> b!795992 m!736725))

(declare-fun m!736727 () Bool)

(assert (=> b!795985 m!736727))

(declare-fun m!736729 () Bool)

(assert (=> b!795989 m!736729))

(declare-fun m!736731 () Bool)

(assert (=> b!795986 m!736731))

(declare-fun m!736733 () Bool)

(assert (=> b!795986 m!736733))

(declare-fun m!736735 () Bool)

(assert (=> b!795986 m!736735))

(assert (=> b!795986 m!736731))

(declare-fun m!736737 () Bool)

(assert (=> b!795986 m!736737))

(assert (=> b!795986 m!736731))

(declare-fun m!736739 () Bool)

(assert (=> b!795986 m!736739))

(declare-fun m!736741 () Bool)

(assert (=> b!795986 m!736741))

(declare-fun m!736743 () Bool)

(assert (=> b!795993 m!736743))

(declare-fun m!736745 () Bool)

(assert (=> start!68472 m!736745))

(declare-fun m!736747 () Bool)

(assert (=> start!68472 m!736747))

(declare-fun m!736749 () Bool)

(assert (=> b!795987 m!736749))

(declare-fun m!736751 () Bool)

(assert (=> b!795987 m!736751))

(declare-fun m!736753 () Bool)

(assert (=> b!795988 m!736753))

(assert (=> b!795991 m!736731))

(assert (=> b!795991 m!736731))

(declare-fun m!736755 () Bool)

(assert (=> b!795991 m!736755))

(declare-fun m!736757 () Bool)

(assert (=> b!795984 m!736757))

(declare-fun m!736759 () Bool)

(assert (=> b!795984 m!736759))

(assert (=> b!795984 m!736741))

(declare-fun m!736761 () Bool)

(assert (=> b!795984 m!736761))

(push 1)

(assert (not b!795983))

(assert (not b!795989))

(assert (not start!68472))

(assert (not b!795993))

(assert (not b!795991))

