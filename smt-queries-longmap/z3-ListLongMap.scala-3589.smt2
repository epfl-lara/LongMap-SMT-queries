; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49366 () Bool)

(assert start!49366)

(declare-fun b!543458 () Bool)

(declare-fun e!314367 () Bool)

(declare-fun e!314368 () Bool)

(assert (=> b!543458 (= e!314367 e!314368)))

(declare-fun res!337905 () Bool)

(assert (=> b!543458 (=> (not res!337905) (not e!314368))))

(declare-datatypes ((SeekEntryResult!4906 0))(
  ( (MissingZero!4906 (index!21848 (_ BitVec 32))) (Found!4906 (index!21849 (_ BitVec 32))) (Intermediate!4906 (undefined!5718 Bool) (index!21850 (_ BitVec 32)) (x!50908 (_ BitVec 32))) (Undefined!4906) (MissingVacant!4906 (index!21851 (_ BitVec 32))) )
))
(declare-fun lt!248236 () SeekEntryResult!4906)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543458 (= res!337905 (= lt!248236 (Intermediate!4906 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34322 0))(
  ( (array!34323 (arr!16492 (Array (_ BitVec 32) (_ BitVec 64))) (size!16856 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34322)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34322 (_ BitVec 32)) SeekEntryResult!4906)

(assert (=> b!543458 (= lt!248236 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16492 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543459 () Bool)

(declare-fun res!337904 () Bool)

(declare-fun e!314370 () Bool)

(assert (=> b!543459 (=> (not res!337904) (not e!314370))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543459 (= res!337904 (validKeyInArray!0 k0!1998))))

(declare-fun b!543460 () Bool)

(declare-fun res!337910 () Bool)

(assert (=> b!543460 (=> (not res!337910) (not e!314367))))

(declare-datatypes ((List!10518 0))(
  ( (Nil!10515) (Cons!10514 (h!11472 (_ BitVec 64)) (t!16738 List!10518)) )
))
(declare-fun arrayNoDuplicates!0 (array!34322 (_ BitVec 32) List!10518) Bool)

(assert (=> b!543460 (= res!337910 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10515))))

(declare-fun b!543462 () Bool)

(declare-fun res!337907 () Bool)

(assert (=> b!543462 (=> (not res!337907) (not e!314370))))

(assert (=> b!543462 (= res!337907 (validKeyInArray!0 (select (arr!16492 a!3154) j!147)))))

(declare-fun b!543463 () Bool)

(assert (=> b!543463 (= e!314370 e!314367)))

(declare-fun res!337909 () Bool)

(assert (=> b!543463 (=> (not res!337909) (not e!314367))))

(declare-fun lt!248235 () SeekEntryResult!4906)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543463 (= res!337909 (or (= lt!248235 (MissingZero!4906 i!1153)) (= lt!248235 (MissingVacant!4906 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34322 (_ BitVec 32)) SeekEntryResult!4906)

(assert (=> b!543463 (= lt!248235 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543464 () Bool)

(declare-fun res!337914 () Bool)

(assert (=> b!543464 (=> (not res!337914) (not e!314367))))

(assert (=> b!543464 (= res!337914 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16856 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16856 a!3154)) (= (select (arr!16492 a!3154) resIndex!32) (select (arr!16492 a!3154) j!147))))))

(declare-fun b!543465 () Bool)

(declare-fun res!337913 () Bool)

(assert (=> b!543465 (=> (not res!337913) (not e!314370))))

(assert (=> b!543465 (= res!337913 (and (= (size!16856 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16856 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16856 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543466 () Bool)

(declare-fun res!337915 () Bool)

(assert (=> b!543466 (=> (not res!337915) (not e!314368))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543466 (= res!337915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16492 a!3154) j!147) mask!3216) (select (arr!16492 a!3154) j!147) a!3154 mask!3216) lt!248236))))

(declare-fun b!543467 () Bool)

(declare-fun res!337908 () Bool)

(assert (=> b!543467 (=> (not res!337908) (not e!314368))))

(assert (=> b!543467 (= res!337908 (and (not (= (select (arr!16492 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16492 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16492 a!3154) index!1177) (select (arr!16492 a!3154) j!147)))))))

(declare-fun b!543468 () Bool)

(declare-fun res!337906 () Bool)

(assert (=> b!543468 (=> (not res!337906) (not e!314367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34322 (_ BitVec 32)) Bool)

(assert (=> b!543468 (= res!337906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543469 () Bool)

(declare-fun res!337911 () Bool)

(assert (=> b!543469 (=> (not res!337911) (not e!314370))))

(declare-fun arrayContainsKey!0 (array!34322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543469 (= res!337911 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!337912 () Bool)

(assert (=> start!49366 (=> (not res!337912) (not e!314370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49366 (= res!337912 (validMask!0 mask!3216))))

(assert (=> start!49366 e!314370))

(assert (=> start!49366 true))

(declare-fun array_inv!12351 (array!34322) Bool)

(assert (=> start!49366 (array_inv!12351 a!3154)))

(declare-fun b!543461 () Bool)

(assert (=> b!543461 (= e!314368 false)))

(declare-fun lt!248234 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543461 (= lt!248234 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(assert (= (and start!49366 res!337912) b!543465))

(assert (= (and b!543465 res!337913) b!543462))

(assert (= (and b!543462 res!337907) b!543459))

(assert (= (and b!543459 res!337904) b!543469))

(assert (= (and b!543469 res!337911) b!543463))

(assert (= (and b!543463 res!337909) b!543468))

(assert (= (and b!543468 res!337906) b!543460))

(assert (= (and b!543460 res!337910) b!543464))

(assert (= (and b!543464 res!337914) b!543458))

(assert (= (and b!543458 res!337905) b!543466))

(assert (= (and b!543466 res!337915) b!543467))

(assert (= (and b!543467 res!337908) b!543461))

(declare-fun m!521701 () Bool)

(assert (=> b!543463 m!521701))

(declare-fun m!521703 () Bool)

(assert (=> b!543469 m!521703))

(declare-fun m!521705 () Bool)

(assert (=> b!543458 m!521705))

(assert (=> b!543458 m!521705))

(declare-fun m!521707 () Bool)

(assert (=> b!543458 m!521707))

(declare-fun m!521709 () Bool)

(assert (=> b!543461 m!521709))

(declare-fun m!521711 () Bool)

(assert (=> start!49366 m!521711))

(declare-fun m!521713 () Bool)

(assert (=> start!49366 m!521713))

(declare-fun m!521715 () Bool)

(assert (=> b!543468 m!521715))

(assert (=> b!543462 m!521705))

(assert (=> b!543462 m!521705))

(declare-fun m!521717 () Bool)

(assert (=> b!543462 m!521717))

(declare-fun m!521719 () Bool)

(assert (=> b!543467 m!521719))

(assert (=> b!543467 m!521705))

(declare-fun m!521721 () Bool)

(assert (=> b!543459 m!521721))

(assert (=> b!543466 m!521705))

(assert (=> b!543466 m!521705))

(declare-fun m!521723 () Bool)

(assert (=> b!543466 m!521723))

(assert (=> b!543466 m!521723))

(assert (=> b!543466 m!521705))

(declare-fun m!521725 () Bool)

(assert (=> b!543466 m!521725))

(declare-fun m!521727 () Bool)

(assert (=> b!543460 m!521727))

(declare-fun m!521729 () Bool)

(assert (=> b!543464 m!521729))

(assert (=> b!543464 m!521705))

(check-sat (not b!543463) (not b!543459) (not b!543458) (not start!49366) (not b!543469) (not b!543461) (not b!543462) (not b!543466) (not b!543468) (not b!543460))
(check-sat)
