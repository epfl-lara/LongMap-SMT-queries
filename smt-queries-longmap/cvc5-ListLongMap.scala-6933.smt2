; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87270 () Bool)

(assert start!87270)

(declare-fun b!1011655 () Bool)

(declare-fun res!679617 () Bool)

(declare-fun e!569121 () Bool)

(assert (=> b!1011655 (=> (not res!679617) (not e!569121))))

(declare-datatypes ((array!63674 0))(
  ( (array!63675 (arr!30652 (Array (_ BitVec 32) (_ BitVec 64))) (size!31154 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63674)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1011655 (= res!679617 (and (= (size!31154 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31154 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31154 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1011656 () Bool)

(declare-fun res!679605 () Bool)

(declare-fun e!569116 () Bool)

(assert (=> b!1011656 (=> (not res!679605) (not e!569116))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1011656 (= res!679605 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31154 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31154 a!3219))))))

(declare-fun b!1011657 () Bool)

(declare-fun res!679607 () Bool)

(declare-fun e!569122 () Bool)

(assert (=> b!1011657 (=> (not res!679607) (not e!569122))))

(declare-fun lt!447126 () (_ BitVec 64))

(declare-fun lt!447123 () array!63674)

(declare-datatypes ((SeekEntryResult!9584 0))(
  ( (MissingZero!9584 (index!40707 (_ BitVec 32))) (Found!9584 (index!40708 (_ BitVec 32))) (Intermediate!9584 (undefined!10396 Bool) (index!40709 (_ BitVec 32)) (x!88126 (_ BitVec 32))) (Undefined!9584) (MissingVacant!9584 (index!40710 (_ BitVec 32))) )
))
(declare-fun lt!447120 () SeekEntryResult!9584)

(declare-fun lt!447118 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63674 (_ BitVec 32)) SeekEntryResult!9584)

(assert (=> b!1011657 (= res!679607 (not (= lt!447120 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447118 lt!447126 lt!447123 mask!3464))))))

(declare-fun b!1011658 () Bool)

(declare-fun e!569118 () Bool)

(declare-fun e!569119 () Bool)

(assert (=> b!1011658 (= e!569118 e!569119)))

(declare-fun res!679618 () Bool)

(assert (=> b!1011658 (=> (not res!679618) (not e!569119))))

(declare-fun lt!447119 () SeekEntryResult!9584)

(declare-fun lt!447122 () SeekEntryResult!9584)

(assert (=> b!1011658 (= res!679618 (= lt!447119 lt!447122))))

(assert (=> b!1011658 (= lt!447119 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30652 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011659 () Bool)

(declare-fun res!679619 () Bool)

(declare-fun e!569115 () Bool)

(assert (=> b!1011659 (=> (not res!679619) (not e!569115))))

(assert (=> b!1011659 (= res!679619 (not (= lt!447119 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!447126 lt!447123 mask!3464))))))

(declare-fun b!1011660 () Bool)

(assert (=> b!1011660 (= e!569119 e!569115)))

(declare-fun res!679608 () Bool)

(assert (=> b!1011660 (=> (not res!679608) (not e!569115))))

(declare-fun lt!447125 () SeekEntryResult!9584)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011660 (= res!679608 (not (= lt!447125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!447126 mask!3464) lt!447126 lt!447123 mask!3464))))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1011660 (= lt!447126 (select (store (arr!30652 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1011660 (= lt!447123 (array!63675 (store (arr!30652 a!3219) i!1194 k!2224) (size!31154 a!3219)))))

(declare-fun b!1011661 () Bool)

(assert (=> b!1011661 (= e!569121 e!569116)))

(declare-fun res!679614 () Bool)

(assert (=> b!1011661 (=> (not res!679614) (not e!569116))))

(declare-fun lt!447121 () SeekEntryResult!9584)

(assert (=> b!1011661 (= res!679614 (or (= lt!447121 (MissingVacant!9584 i!1194)) (= lt!447121 (MissingZero!9584 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63674 (_ BitVec 32)) SeekEntryResult!9584)

(assert (=> b!1011661 (= lt!447121 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1011662 () Bool)

(declare-fun res!679613 () Bool)

(assert (=> b!1011662 (=> (not res!679613) (not e!569121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1011662 (= res!679613 (validKeyInArray!0 k!2224))))

(declare-fun b!1011663 () Bool)

(assert (=> b!1011663 (= e!569116 e!569118)))

(declare-fun res!679604 () Bool)

(assert (=> b!1011663 (=> (not res!679604) (not e!569118))))

(assert (=> b!1011663 (= res!679604 (= lt!447125 lt!447122))))

(assert (=> b!1011663 (= lt!447122 (Intermediate!9584 false resIndex!38 resX!38))))

(assert (=> b!1011663 (= lt!447125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30652 a!3219) j!170) mask!3464) (select (arr!30652 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011664 () Bool)

(declare-fun res!679615 () Bool)

(assert (=> b!1011664 (=> (not res!679615) (not e!569116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63674 (_ BitVec 32)) Bool)

(assert (=> b!1011664 (= res!679615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1011665 () Bool)

(declare-fun res!679620 () Bool)

(assert (=> b!1011665 (=> (not res!679620) (not e!569116))))

(declare-datatypes ((List!21328 0))(
  ( (Nil!21325) (Cons!21324 (h!22522 (_ BitVec 64)) (t!30329 List!21328)) )
))
(declare-fun arrayNoDuplicates!0 (array!63674 (_ BitVec 32) List!21328) Bool)

(assert (=> b!1011665 (= res!679620 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21325))))

(declare-fun b!1011666 () Bool)

(declare-fun res!679612 () Bool)

(assert (=> b!1011666 (=> (not res!679612) (not e!569115))))

(assert (=> b!1011666 (= res!679612 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1011668 () Bool)

(assert (=> b!1011668 (= e!569122 (not true))))

(assert (=> b!1011668 (= resIndex!38 i!1194)))

(declare-datatypes ((Unit!33034 0))(
  ( (Unit!33035) )
))
(declare-fun lt!447124 () Unit!33034)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!63674 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!33034)

(assert (=> b!1011668 (= lt!447124 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3219 i!1194 k!2224 j!170 lt!447118 (bvadd #b00000000000000000000000000000001 x!1245) resIndex!38 resX!38 mask!3464))))

(declare-fun b!1011669 () Bool)

(declare-fun res!679616 () Bool)

(assert (=> b!1011669 (=> (not res!679616) (not e!569121))))

(assert (=> b!1011669 (= res!679616 (validKeyInArray!0 (select (arr!30652 a!3219) j!170)))))

(declare-fun b!1011670 () Bool)

(declare-fun e!569120 () Bool)

(assert (=> b!1011670 (= e!569120 e!569122)))

(declare-fun res!679609 () Bool)

(assert (=> b!1011670 (=> (not res!679609) (not e!569122))))

(assert (=> b!1011670 (= res!679609 (= lt!447120 lt!447122))))

(assert (=> b!1011670 (= lt!447120 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447118 (select (arr!30652 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011671 () Bool)

(declare-fun res!679610 () Bool)

(assert (=> b!1011671 (=> (not res!679610) (not e!569121))))

(declare-fun arrayContainsKey!0 (array!63674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1011671 (= res!679610 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1011667 () Bool)

(assert (=> b!1011667 (= e!569115 e!569120)))

(declare-fun res!679611 () Bool)

(assert (=> b!1011667 (=> (not res!679611) (not e!569120))))

(assert (=> b!1011667 (= res!679611 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!447118 #b00000000000000000000000000000000) (bvslt lt!447118 (size!31154 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011667 (= lt!447118 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!679606 () Bool)

(assert (=> start!87270 (=> (not res!679606) (not e!569121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87270 (= res!679606 (validMask!0 mask!3464))))

(assert (=> start!87270 e!569121))

(declare-fun array_inv!23776 (array!63674) Bool)

(assert (=> start!87270 (array_inv!23776 a!3219)))

(assert (=> start!87270 true))

(assert (= (and start!87270 res!679606) b!1011655))

(assert (= (and b!1011655 res!679617) b!1011669))

(assert (= (and b!1011669 res!679616) b!1011662))

(assert (= (and b!1011662 res!679613) b!1011671))

(assert (= (and b!1011671 res!679610) b!1011661))

(assert (= (and b!1011661 res!679614) b!1011664))

(assert (= (and b!1011664 res!679615) b!1011665))

(assert (= (and b!1011665 res!679620) b!1011656))

(assert (= (and b!1011656 res!679605) b!1011663))

(assert (= (and b!1011663 res!679604) b!1011658))

(assert (= (and b!1011658 res!679618) b!1011660))

(assert (= (and b!1011660 res!679608) b!1011659))

(assert (= (and b!1011659 res!679619) b!1011666))

(assert (= (and b!1011666 res!679612) b!1011667))

(assert (= (and b!1011667 res!679611) b!1011670))

(assert (= (and b!1011670 res!679609) b!1011657))

(assert (= (and b!1011657 res!679607) b!1011668))

(declare-fun m!935613 () Bool)

(assert (=> b!1011664 m!935613))

(declare-fun m!935615 () Bool)

(assert (=> b!1011667 m!935615))

(declare-fun m!935617 () Bool)

(assert (=> b!1011660 m!935617))

(assert (=> b!1011660 m!935617))

(declare-fun m!935619 () Bool)

(assert (=> b!1011660 m!935619))

(declare-fun m!935621 () Bool)

(assert (=> b!1011660 m!935621))

(declare-fun m!935623 () Bool)

(assert (=> b!1011660 m!935623))

(declare-fun m!935625 () Bool)

(assert (=> b!1011661 m!935625))

(declare-fun m!935627 () Bool)

(assert (=> b!1011671 m!935627))

(declare-fun m!935629 () Bool)

(assert (=> b!1011657 m!935629))

(declare-fun m!935631 () Bool)

(assert (=> b!1011665 m!935631))

(declare-fun m!935633 () Bool)

(assert (=> b!1011663 m!935633))

(assert (=> b!1011663 m!935633))

(declare-fun m!935635 () Bool)

(assert (=> b!1011663 m!935635))

(assert (=> b!1011663 m!935635))

(assert (=> b!1011663 m!935633))

(declare-fun m!935637 () Bool)

(assert (=> b!1011663 m!935637))

(declare-fun m!935639 () Bool)

(assert (=> b!1011662 m!935639))

(declare-fun m!935641 () Bool)

(assert (=> start!87270 m!935641))

(declare-fun m!935643 () Bool)

(assert (=> start!87270 m!935643))

(assert (=> b!1011669 m!935633))

(assert (=> b!1011669 m!935633))

(declare-fun m!935645 () Bool)

(assert (=> b!1011669 m!935645))

(declare-fun m!935647 () Bool)

(assert (=> b!1011668 m!935647))

(declare-fun m!935649 () Bool)

(assert (=> b!1011659 m!935649))

(assert (=> b!1011658 m!935633))

(assert (=> b!1011658 m!935633))

(declare-fun m!935651 () Bool)

(assert (=> b!1011658 m!935651))

(assert (=> b!1011670 m!935633))

(assert (=> b!1011670 m!935633))

(declare-fun m!935653 () Bool)

(assert (=> b!1011670 m!935653))

(push 1)

