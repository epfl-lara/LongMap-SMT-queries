; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48834 () Bool)

(assert start!48834)

(declare-fun b!537706 () Bool)

(declare-fun e!311834 () Bool)

(assert (=> b!537706 (= e!311834 false)))

(declare-datatypes ((SeekEntryResult!4822 0))(
  ( (MissingZero!4822 (index!21512 (_ BitVec 32))) (Found!4822 (index!21513 (_ BitVec 32))) (Intermediate!4822 (undefined!5634 Bool) (index!21514 (_ BitVec 32)) (x!50448 (_ BitVec 32))) (Undefined!4822) (MissingVacant!4822 (index!21515 (_ BitVec 32))) )
))
(declare-fun lt!246334 () SeekEntryResult!4822)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34056 0))(
  ( (array!34057 (arr!16367 (Array (_ BitVec 32) (_ BitVec 64))) (size!16732 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34056)

(declare-fun lt!246335 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34056 (_ BitVec 32)) SeekEntryResult!4822)

(assert (=> b!537706 (= lt!246334 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246335 (select (arr!16367 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537707 () Bool)

(declare-fun e!311833 () Bool)

(declare-fun e!311831 () Bool)

(assert (=> b!537707 (= e!311833 e!311831)))

(declare-fun res!333055 () Bool)

(assert (=> b!537707 (=> (not res!333055) (not e!311831))))

(declare-fun lt!246337 () SeekEntryResult!4822)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537707 (= res!333055 (or (= lt!246337 (MissingZero!4822 i!1153)) (= lt!246337 (MissingVacant!4822 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34056 (_ BitVec 32)) SeekEntryResult!4822)

(assert (=> b!537707 (= lt!246337 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537708 () Bool)

(declare-fun res!333060 () Bool)

(declare-fun e!311835 () Bool)

(assert (=> b!537708 (=> (not res!333060) (not e!311835))))

(declare-fun lt!246336 () SeekEntryResult!4822)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537708 (= res!333060 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16367 a!3154) j!147) mask!3216) (select (arr!16367 a!3154) j!147) a!3154 mask!3216) lt!246336))))

(declare-fun b!537709 () Bool)

(declare-fun res!333059 () Bool)

(assert (=> b!537709 (=> (not res!333059) (not e!311835))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!537709 (= res!333059 (and (not (= (select (arr!16367 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16367 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16367 a!3154) index!1177) (select (arr!16367 a!3154) j!147)))))))

(declare-fun b!537710 () Bool)

(assert (=> b!537710 (= e!311831 e!311835)))

(declare-fun res!333056 () Bool)

(assert (=> b!537710 (=> (not res!333056) (not e!311835))))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!537710 (= res!333056 (= lt!246336 (Intermediate!4822 false resIndex!32 resX!32)))))

(assert (=> b!537710 (= lt!246336 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16367 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537711 () Bool)

(declare-fun res!333054 () Bool)

(assert (=> b!537711 (=> (not res!333054) (not e!311833))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537711 (= res!333054 (validKeyInArray!0 (select (arr!16367 a!3154) j!147)))))

(declare-fun b!537712 () Bool)

(declare-fun res!333064 () Bool)

(assert (=> b!537712 (=> (not res!333064) (not e!311831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34056 (_ BitVec 32)) Bool)

(assert (=> b!537712 (= res!333064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537713 () Bool)

(assert (=> b!537713 (= e!311835 e!311834)))

(declare-fun res!333057 () Bool)

(assert (=> b!537713 (=> (not res!333057) (not e!311834))))

(assert (=> b!537713 (= res!333057 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246335 #b00000000000000000000000000000000) (bvslt lt!246335 (size!16732 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537713 (= lt!246335 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537714 () Bool)

(declare-fun res!333065 () Bool)

(assert (=> b!537714 (=> (not res!333065) (not e!311831))))

(assert (=> b!537714 (= res!333065 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16732 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16732 a!3154)) (= (select (arr!16367 a!3154) resIndex!32) (select (arr!16367 a!3154) j!147))))))

(declare-fun b!537715 () Bool)

(declare-fun res!333053 () Bool)

(assert (=> b!537715 (=> (not res!333053) (not e!311831))))

(declare-datatypes ((List!10525 0))(
  ( (Nil!10522) (Cons!10521 (h!11464 (_ BitVec 64)) (t!16744 List!10525)) )
))
(declare-fun arrayNoDuplicates!0 (array!34056 (_ BitVec 32) List!10525) Bool)

(assert (=> b!537715 (= res!333053 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10522))))

(declare-fun b!537717 () Bool)

(declare-fun res!333062 () Bool)

(assert (=> b!537717 (=> (not res!333062) (not e!311833))))

(declare-fun arrayContainsKey!0 (array!34056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537717 (= res!333062 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537718 () Bool)

(declare-fun res!333063 () Bool)

(assert (=> b!537718 (=> (not res!333063) (not e!311833))))

(assert (=> b!537718 (= res!333063 (validKeyInArray!0 k0!1998))))

(declare-fun b!537716 () Bool)

(declare-fun res!333058 () Bool)

(assert (=> b!537716 (=> (not res!333058) (not e!311833))))

(assert (=> b!537716 (= res!333058 (and (= (size!16732 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16732 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16732 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!333061 () Bool)

(assert (=> start!48834 (=> (not res!333061) (not e!311833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48834 (= res!333061 (validMask!0 mask!3216))))

(assert (=> start!48834 e!311833))

(assert (=> start!48834 true))

(declare-fun array_inv!12250 (array!34056) Bool)

(assert (=> start!48834 (array_inv!12250 a!3154)))

(assert (= (and start!48834 res!333061) b!537716))

(assert (= (and b!537716 res!333058) b!537711))

(assert (= (and b!537711 res!333054) b!537718))

(assert (= (and b!537718 res!333063) b!537717))

(assert (= (and b!537717 res!333062) b!537707))

(assert (= (and b!537707 res!333055) b!537712))

(assert (= (and b!537712 res!333064) b!537715))

(assert (= (and b!537715 res!333053) b!537714))

(assert (= (and b!537714 res!333065) b!537710))

(assert (= (and b!537710 res!333056) b!537708))

(assert (= (and b!537708 res!333060) b!537709))

(assert (= (and b!537709 res!333059) b!537713))

(assert (= (and b!537713 res!333057) b!537706))

(declare-fun m!516361 () Bool)

(assert (=> start!48834 m!516361))

(declare-fun m!516363 () Bool)

(assert (=> start!48834 m!516363))

(declare-fun m!516365 () Bool)

(assert (=> b!537709 m!516365))

(declare-fun m!516367 () Bool)

(assert (=> b!537709 m!516367))

(assert (=> b!537710 m!516367))

(assert (=> b!537710 m!516367))

(declare-fun m!516369 () Bool)

(assert (=> b!537710 m!516369))

(assert (=> b!537711 m!516367))

(assert (=> b!537711 m!516367))

(declare-fun m!516371 () Bool)

(assert (=> b!537711 m!516371))

(declare-fun m!516373 () Bool)

(assert (=> b!537718 m!516373))

(assert (=> b!537706 m!516367))

(assert (=> b!537706 m!516367))

(declare-fun m!516375 () Bool)

(assert (=> b!537706 m!516375))

(declare-fun m!516377 () Bool)

(assert (=> b!537707 m!516377))

(declare-fun m!516379 () Bool)

(assert (=> b!537717 m!516379))

(declare-fun m!516381 () Bool)

(assert (=> b!537715 m!516381))

(declare-fun m!516383 () Bool)

(assert (=> b!537714 m!516383))

(assert (=> b!537714 m!516367))

(declare-fun m!516385 () Bool)

(assert (=> b!537713 m!516385))

(declare-fun m!516387 () Bool)

(assert (=> b!537712 m!516387))

(assert (=> b!537708 m!516367))

(assert (=> b!537708 m!516367))

(declare-fun m!516389 () Bool)

(assert (=> b!537708 m!516389))

(assert (=> b!537708 m!516389))

(assert (=> b!537708 m!516367))

(declare-fun m!516391 () Bool)

(assert (=> b!537708 m!516391))

(check-sat (not b!537712) (not b!537706) (not b!537717) (not start!48834) (not b!537715) (not b!537711) (not b!537710) (not b!537713) (not b!537718) (not b!537708) (not b!537707))
(check-sat)
