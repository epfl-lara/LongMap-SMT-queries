; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69386 () Bool)

(assert start!69386)

(declare-fun res!551901 () Bool)

(declare-fun e!447622 () Bool)

(assert (=> start!69386 (=> (not res!551901) (not e!447622))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69386 (= res!551901 (validMask!0 mask!3266))))

(assert (=> start!69386 e!447622))

(assert (=> start!69386 true))

(declare-datatypes ((array!43918 0))(
  ( (array!43919 (arr!21031 (Array (_ BitVec 32) (_ BitVec 64))) (size!21451 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43918)

(declare-fun array_inv!16890 (array!43918) Bool)

(assert (=> start!69386 (array_inv!16890 a!3170)))

(declare-fun b!808325 () Bool)

(declare-fun res!551908 () Bool)

(declare-fun e!447621 () Bool)

(assert (=> b!808325 (=> (not res!551908) (not e!447621))))

(declare-datatypes ((List!14901 0))(
  ( (Nil!14898) (Cons!14897 (h!16032 (_ BitVec 64)) (t!21208 List!14901)) )
))
(declare-fun arrayNoDuplicates!0 (array!43918 (_ BitVec 32) List!14901) Bool)

(assert (=> b!808325 (= res!551908 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14898))))

(declare-fun b!808326 () Bool)

(declare-fun res!551900 () Bool)

(assert (=> b!808326 (=> (not res!551900) (not e!447621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43918 (_ BitVec 32)) Bool)

(assert (=> b!808326 (= res!551900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!808327 () Bool)

(declare-fun res!551906 () Bool)

(assert (=> b!808327 (=> (not res!551906) (not e!447622))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!808327 (= res!551906 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!808328 () Bool)

(declare-fun e!447623 () Bool)

(assert (=> b!808328 (= e!447623 false)))

(declare-fun lt!362086 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!808328 (= lt!362086 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!808329 () Bool)

(declare-fun res!551910 () Bool)

(assert (=> b!808329 (=> (not res!551910) (not e!447622))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!808329 (= res!551910 (and (= (size!21451 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21451 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21451 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!808330 () Bool)

(assert (=> b!808330 (= e!447622 e!447621)))

(declare-fun res!551905 () Bool)

(assert (=> b!808330 (=> (not res!551905) (not e!447621))))

(declare-datatypes ((SeekEntryResult!8578 0))(
  ( (MissingZero!8578 (index!36680 (_ BitVec 32))) (Found!8578 (index!36681 (_ BitVec 32))) (Intermediate!8578 (undefined!9390 Bool) (index!36682 (_ BitVec 32)) (x!67652 (_ BitVec 32))) (Undefined!8578) (MissingVacant!8578 (index!36683 (_ BitVec 32))) )
))
(declare-fun lt!362089 () SeekEntryResult!8578)

(assert (=> b!808330 (= res!551905 (or (= lt!362089 (MissingZero!8578 i!1163)) (= lt!362089 (MissingVacant!8578 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43918 (_ BitVec 32)) SeekEntryResult!8578)

(assert (=> b!808330 (= lt!362089 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!808331 () Bool)

(declare-fun e!447625 () Bool)

(assert (=> b!808331 (= e!447621 e!447625)))

(declare-fun res!551903 () Bool)

(assert (=> b!808331 (=> (not res!551903) (not e!447625))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362087 () (_ BitVec 64))

(declare-fun lt!362090 () array!43918)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43918 (_ BitVec 32)) SeekEntryResult!8578)

(assert (=> b!808331 (= res!551903 (= (seekEntryOrOpen!0 lt!362087 lt!362090 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362087 lt!362090 mask!3266)))))

(assert (=> b!808331 (= lt!362087 (select (store (arr!21031 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!808331 (= lt!362090 (array!43919 (store (arr!21031 a!3170) i!1163 k0!2044) (size!21451 a!3170)))))

(declare-fun b!808332 () Bool)

(declare-fun res!551909 () Bool)

(assert (=> b!808332 (=> (not res!551909) (not e!447621))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!808332 (= res!551909 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21451 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21031 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21451 a!3170)) (= (select (arr!21031 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!808333 () Bool)

(declare-fun res!551904 () Bool)

(assert (=> b!808333 (=> (not res!551904) (not e!447622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!808333 (= res!551904 (validKeyInArray!0 (select (arr!21031 a!3170) j!153)))))

(declare-fun b!808334 () Bool)

(declare-fun res!551902 () Bool)

(assert (=> b!808334 (=> (not res!551902) (not e!447622))))

(assert (=> b!808334 (= res!551902 (validKeyInArray!0 k0!2044))))

(declare-fun b!808335 () Bool)

(assert (=> b!808335 (= e!447625 e!447623)))

(declare-fun res!551907 () Bool)

(assert (=> b!808335 (=> (not res!551907) (not e!447623))))

(declare-fun lt!362088 () SeekEntryResult!8578)

(declare-fun lt!362085 () SeekEntryResult!8578)

(assert (=> b!808335 (= res!551907 (and (= lt!362085 lt!362088) (= lt!362088 (Found!8578 j!153)) (not (= (select (arr!21031 a!3170) index!1236) (select (arr!21031 a!3170) j!153)))))))

(assert (=> b!808335 (= lt!362088 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21031 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!808335 (= lt!362085 (seekEntryOrOpen!0 (select (arr!21031 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69386 res!551901) b!808329))

(assert (= (and b!808329 res!551910) b!808333))

(assert (= (and b!808333 res!551904) b!808334))

(assert (= (and b!808334 res!551902) b!808327))

(assert (= (and b!808327 res!551906) b!808330))

(assert (= (and b!808330 res!551905) b!808326))

(assert (= (and b!808326 res!551900) b!808325))

(assert (= (and b!808325 res!551908) b!808332))

(assert (= (and b!808332 res!551909) b!808331))

(assert (= (and b!808331 res!551903) b!808335))

(assert (= (and b!808335 res!551907) b!808328))

(declare-fun m!750727 () Bool)

(assert (=> b!808333 m!750727))

(assert (=> b!808333 m!750727))

(declare-fun m!750729 () Bool)

(assert (=> b!808333 m!750729))

(declare-fun m!750731 () Bool)

(assert (=> b!808330 m!750731))

(declare-fun m!750733 () Bool)

(assert (=> b!808326 m!750733))

(declare-fun m!750735 () Bool)

(assert (=> b!808328 m!750735))

(declare-fun m!750737 () Bool)

(assert (=> b!808327 m!750737))

(declare-fun m!750739 () Bool)

(assert (=> b!808325 m!750739))

(declare-fun m!750741 () Bool)

(assert (=> start!69386 m!750741))

(declare-fun m!750743 () Bool)

(assert (=> start!69386 m!750743))

(declare-fun m!750745 () Bool)

(assert (=> b!808335 m!750745))

(assert (=> b!808335 m!750727))

(assert (=> b!808335 m!750727))

(declare-fun m!750747 () Bool)

(assert (=> b!808335 m!750747))

(assert (=> b!808335 m!750727))

(declare-fun m!750749 () Bool)

(assert (=> b!808335 m!750749))

(declare-fun m!750751 () Bool)

(assert (=> b!808332 m!750751))

(declare-fun m!750753 () Bool)

(assert (=> b!808332 m!750753))

(declare-fun m!750755 () Bool)

(assert (=> b!808334 m!750755))

(declare-fun m!750757 () Bool)

(assert (=> b!808331 m!750757))

(declare-fun m!750759 () Bool)

(assert (=> b!808331 m!750759))

(declare-fun m!750761 () Bool)

(assert (=> b!808331 m!750761))

(declare-fun m!750763 () Bool)

(assert (=> b!808331 m!750763))

(check-sat (not b!808326) (not b!808325) (not b!808327) (not start!69386) (not b!808330) (not b!808334) (not b!808328) (not b!808331) (not b!808333) (not b!808335))
(check-sat)
