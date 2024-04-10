; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86952 () Bool)

(assert start!86952)

(declare-fun b!1008767 () Bool)

(declare-fun e!567559 () Bool)

(declare-fun e!567556 () Bool)

(assert (=> b!1008767 (= e!567559 e!567556)))

(declare-fun res!677660 () Bool)

(assert (=> b!1008767 (=> (not res!677660) (not e!567556))))

(declare-datatypes ((SeekEntryResult!9553 0))(
  ( (MissingZero!9553 (index!40583 (_ BitVec 32))) (Found!9553 (index!40584 (_ BitVec 32))) (Intermediate!9553 (undefined!10365 Bool) (index!40585 (_ BitVec 32)) (x!87967 (_ BitVec 32))) (Undefined!9553) (MissingVacant!9553 (index!40586 (_ BitVec 32))) )
))
(declare-fun lt!445863 () SeekEntryResult!9553)

(declare-fun lt!445864 () SeekEntryResult!9553)

(assert (=> b!1008767 (= res!677660 (= lt!445863 lt!445864))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008767 (= lt!445864 (Intermediate!9553 false resIndex!38 resX!38))))

(declare-datatypes ((array!63600 0))(
  ( (array!63601 (arr!30621 (Array (_ BitVec 32) (_ BitVec 64))) (size!31123 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63600)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63600 (_ BitVec 32)) SeekEntryResult!9553)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008767 (= lt!445863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30621 a!3219) j!170) mask!3464) (select (arr!30621 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008768 () Bool)

(declare-fun e!567558 () Bool)

(assert (=> b!1008768 (= e!567558 false)))

(declare-fun lt!445862 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008768 (= lt!445862 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!677669 () Bool)

(declare-fun e!567554 () Bool)

(assert (=> start!86952 (=> (not res!677669) (not e!567554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86952 (= res!677669 (validMask!0 mask!3464))))

(assert (=> start!86952 e!567554))

(declare-fun array_inv!23745 (array!63600) Bool)

(assert (=> start!86952 (array_inv!23745 a!3219)))

(assert (=> start!86952 true))

(declare-fun b!1008769 () Bool)

(declare-fun res!677673 () Bool)

(assert (=> b!1008769 (=> (not res!677673) (not e!567554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008769 (= res!677673 (validKeyInArray!0 (select (arr!30621 a!3219) j!170)))))

(declare-fun b!1008770 () Bool)

(declare-fun e!567555 () Bool)

(assert (=> b!1008770 (= e!567555 e!567558)))

(declare-fun res!677672 () Bool)

(assert (=> b!1008770 (=> (not res!677672) (not e!567558))))

(declare-fun lt!445865 () (_ BitVec 64))

(declare-fun lt!445867 () array!63600)

(assert (=> b!1008770 (= res!677672 (not (= lt!445863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445865 mask!3464) lt!445865 lt!445867 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1008770 (= lt!445865 (select (store (arr!30621 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008770 (= lt!445867 (array!63601 (store (arr!30621 a!3219) i!1194 k!2224) (size!31123 a!3219)))))

(declare-fun b!1008771 () Bool)

(declare-fun res!677667 () Bool)

(assert (=> b!1008771 (=> (not res!677667) (not e!567558))))

(assert (=> b!1008771 (= res!677667 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008772 () Bool)

(declare-fun res!677666 () Bool)

(assert (=> b!1008772 (=> (not res!677666) (not e!567554))))

(assert (=> b!1008772 (= res!677666 (validKeyInArray!0 k!2224))))

(declare-fun b!1008773 () Bool)

(declare-fun res!677665 () Bool)

(assert (=> b!1008773 (=> (not res!677665) (not e!567559))))

(declare-datatypes ((List!21297 0))(
  ( (Nil!21294) (Cons!21293 (h!22479 (_ BitVec 64)) (t!30298 List!21297)) )
))
(declare-fun arrayNoDuplicates!0 (array!63600 (_ BitVec 32) List!21297) Bool)

(assert (=> b!1008773 (= res!677665 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21294))))

(declare-fun b!1008774 () Bool)

(assert (=> b!1008774 (= e!567556 e!567555)))

(declare-fun res!677662 () Bool)

(assert (=> b!1008774 (=> (not res!677662) (not e!567555))))

(declare-fun lt!445866 () SeekEntryResult!9553)

(assert (=> b!1008774 (= res!677662 (= lt!445866 lt!445864))))

(assert (=> b!1008774 (= lt!445866 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30621 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008775 () Bool)

(declare-fun res!677663 () Bool)

(assert (=> b!1008775 (=> (not res!677663) (not e!567559))))

(assert (=> b!1008775 (= res!677663 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31123 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31123 a!3219))))))

(declare-fun b!1008776 () Bool)

(declare-fun res!677661 () Bool)

(assert (=> b!1008776 (=> (not res!677661) (not e!567554))))

(declare-fun arrayContainsKey!0 (array!63600 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008776 (= res!677661 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008777 () Bool)

(declare-fun res!677670 () Bool)

(assert (=> b!1008777 (=> (not res!677670) (not e!567558))))

(assert (=> b!1008777 (= res!677670 (not (= lt!445866 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445865 lt!445867 mask!3464))))))

(declare-fun b!1008778 () Bool)

(declare-fun res!677664 () Bool)

(assert (=> b!1008778 (=> (not res!677664) (not e!567554))))

(assert (=> b!1008778 (= res!677664 (and (= (size!31123 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31123 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31123 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008779 () Bool)

(declare-fun res!677668 () Bool)

(assert (=> b!1008779 (=> (not res!677668) (not e!567559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63600 (_ BitVec 32)) Bool)

(assert (=> b!1008779 (= res!677668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008780 () Bool)

(assert (=> b!1008780 (= e!567554 e!567559)))

(declare-fun res!677671 () Bool)

(assert (=> b!1008780 (=> (not res!677671) (not e!567559))))

(declare-fun lt!445868 () SeekEntryResult!9553)

(assert (=> b!1008780 (= res!677671 (or (= lt!445868 (MissingVacant!9553 i!1194)) (= lt!445868 (MissingZero!9553 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63600 (_ BitVec 32)) SeekEntryResult!9553)

(assert (=> b!1008780 (= lt!445868 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!86952 res!677669) b!1008778))

(assert (= (and b!1008778 res!677664) b!1008769))

(assert (= (and b!1008769 res!677673) b!1008772))

(assert (= (and b!1008772 res!677666) b!1008776))

(assert (= (and b!1008776 res!677661) b!1008780))

(assert (= (and b!1008780 res!677671) b!1008779))

(assert (= (and b!1008779 res!677668) b!1008773))

(assert (= (and b!1008773 res!677665) b!1008775))

(assert (= (and b!1008775 res!677663) b!1008767))

(assert (= (and b!1008767 res!677660) b!1008774))

(assert (= (and b!1008774 res!677662) b!1008770))

(assert (= (and b!1008770 res!677672) b!1008777))

(assert (= (and b!1008777 res!677670) b!1008771))

(assert (= (and b!1008771 res!677667) b!1008768))

(declare-fun m!933467 () Bool)

(assert (=> b!1008768 m!933467))

(declare-fun m!933469 () Bool)

(assert (=> b!1008779 m!933469))

(declare-fun m!933471 () Bool)

(assert (=> b!1008772 m!933471))

(declare-fun m!933473 () Bool)

(assert (=> b!1008774 m!933473))

(assert (=> b!1008774 m!933473))

(declare-fun m!933475 () Bool)

(assert (=> b!1008774 m!933475))

(declare-fun m!933477 () Bool)

(assert (=> b!1008770 m!933477))

(assert (=> b!1008770 m!933477))

(declare-fun m!933479 () Bool)

(assert (=> b!1008770 m!933479))

(declare-fun m!933481 () Bool)

(assert (=> b!1008770 m!933481))

(declare-fun m!933483 () Bool)

(assert (=> b!1008770 m!933483))

(declare-fun m!933485 () Bool)

(assert (=> b!1008777 m!933485))

(declare-fun m!933487 () Bool)

(assert (=> b!1008776 m!933487))

(declare-fun m!933489 () Bool)

(assert (=> b!1008773 m!933489))

(assert (=> b!1008769 m!933473))

(assert (=> b!1008769 m!933473))

(declare-fun m!933491 () Bool)

(assert (=> b!1008769 m!933491))

(declare-fun m!933493 () Bool)

(assert (=> b!1008780 m!933493))

(assert (=> b!1008767 m!933473))

(assert (=> b!1008767 m!933473))

(declare-fun m!933495 () Bool)

(assert (=> b!1008767 m!933495))

(assert (=> b!1008767 m!933495))

(assert (=> b!1008767 m!933473))

(declare-fun m!933497 () Bool)

(assert (=> b!1008767 m!933497))

(declare-fun m!933499 () Bool)

(assert (=> start!86952 m!933499))

(declare-fun m!933501 () Bool)

(assert (=> start!86952 m!933501))

(push 1)

