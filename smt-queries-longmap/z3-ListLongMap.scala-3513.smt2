; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48636 () Bool)

(assert start!48636)

(declare-fun b!534145 () Bool)

(declare-fun res!329499 () Bool)

(declare-fun e!310533 () Bool)

(assert (=> b!534145 (=> (not res!329499) (not e!310533))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33858 0))(
  ( (array!33859 (arr!16268 (Array (_ BitVec 32) (_ BitVec 64))) (size!16633 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33858)

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4723 0))(
  ( (MissingZero!4723 (index!21116 (_ BitVec 32))) (Found!4723 (index!21117 (_ BitVec 32))) (Intermediate!4723 (undefined!5535 Bool) (index!21118 (_ BitVec 32)) (x!50085 (_ BitVec 32))) (Undefined!4723) (MissingVacant!4723 (index!21119 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33858 (_ BitVec 32)) SeekEntryResult!4723)

(assert (=> b!534145 (= res!329499 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16268 a!3154) j!147) a!3154 mask!3216) (Intermediate!4723 false resIndex!32 resX!32)))))

(declare-fun b!534146 () Bool)

(declare-fun res!329495 () Bool)

(assert (=> b!534146 (=> (not res!329495) (not e!310533))))

(declare-datatypes ((List!10426 0))(
  ( (Nil!10423) (Cons!10422 (h!11365 (_ BitVec 64)) (t!16645 List!10426)) )
))
(declare-fun arrayNoDuplicates!0 (array!33858 (_ BitVec 32) List!10426) Bool)

(assert (=> b!534146 (= res!329495 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10423))))

(declare-fun b!534147 () Bool)

(declare-fun res!329496 () Bool)

(declare-fun e!310531 () Bool)

(assert (=> b!534147 (=> (not res!329496) (not e!310531))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!534147 (= res!329496 (and (= (size!16633 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16633 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16633 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!534148 () Bool)

(declare-fun res!329501 () Bool)

(assert (=> b!534148 (=> (not res!329501) (not e!310533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33858 (_ BitVec 32)) Bool)

(assert (=> b!534148 (= res!329501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!534149 () Bool)

(assert (=> b!534149 (= e!310531 e!310533)))

(declare-fun res!329493 () Bool)

(assert (=> b!534149 (=> (not res!329493) (not e!310533))))

(declare-fun lt!245395 () SeekEntryResult!4723)

(assert (=> b!534149 (= res!329493 (or (= lt!245395 (MissingZero!4723 i!1153)) (= lt!245395 (MissingVacant!4723 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33858 (_ BitVec 32)) SeekEntryResult!4723)

(assert (=> b!534149 (= lt!245395 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!329492 () Bool)

(assert (=> start!48636 (=> (not res!329492) (not e!310531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48636 (= res!329492 (validMask!0 mask!3216))))

(assert (=> start!48636 e!310531))

(assert (=> start!48636 true))

(declare-fun array_inv!12151 (array!33858) Bool)

(assert (=> start!48636 (array_inv!12151 a!3154)))

(declare-fun b!534150 () Bool)

(assert (=> b!534150 (= e!310533 false)))

(declare-fun lt!245394 () SeekEntryResult!4723)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!534150 (= lt!245394 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16268 a!3154) j!147) mask!3216) (select (arr!16268 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!534151 () Bool)

(declare-fun res!329497 () Bool)

(assert (=> b!534151 (=> (not res!329497) (not e!310533))))

(assert (=> b!534151 (= res!329497 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16633 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16633 a!3154)) (= (select (arr!16268 a!3154) resIndex!32) (select (arr!16268 a!3154) j!147))))))

(declare-fun b!534152 () Bool)

(declare-fun res!329500 () Bool)

(assert (=> b!534152 (=> (not res!329500) (not e!310531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!534152 (= res!329500 (validKeyInArray!0 k0!1998))))

(declare-fun b!534153 () Bool)

(declare-fun res!329498 () Bool)

(assert (=> b!534153 (=> (not res!329498) (not e!310531))))

(declare-fun arrayContainsKey!0 (array!33858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!534153 (= res!329498 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!534154 () Bool)

(declare-fun res!329494 () Bool)

(assert (=> b!534154 (=> (not res!329494) (not e!310531))))

(assert (=> b!534154 (= res!329494 (validKeyInArray!0 (select (arr!16268 a!3154) j!147)))))

(assert (= (and start!48636 res!329492) b!534147))

(assert (= (and b!534147 res!329496) b!534154))

(assert (= (and b!534154 res!329494) b!534152))

(assert (= (and b!534152 res!329500) b!534153))

(assert (= (and b!534153 res!329498) b!534149))

(assert (= (and b!534149 res!329493) b!534148))

(assert (= (and b!534148 res!329501) b!534146))

(assert (= (and b!534146 res!329495) b!534151))

(assert (= (and b!534151 res!329497) b!534145))

(assert (= (and b!534145 res!329499) b!534150))

(declare-fun m!513385 () Bool)

(assert (=> start!48636 m!513385))

(declare-fun m!513387 () Bool)

(assert (=> start!48636 m!513387))

(declare-fun m!513389 () Bool)

(assert (=> b!534152 m!513389))

(declare-fun m!513391 () Bool)

(assert (=> b!534149 m!513391))

(declare-fun m!513393 () Bool)

(assert (=> b!534148 m!513393))

(declare-fun m!513395 () Bool)

(assert (=> b!534150 m!513395))

(assert (=> b!534150 m!513395))

(declare-fun m!513397 () Bool)

(assert (=> b!534150 m!513397))

(assert (=> b!534150 m!513397))

(assert (=> b!534150 m!513395))

(declare-fun m!513399 () Bool)

(assert (=> b!534150 m!513399))

(assert (=> b!534145 m!513395))

(assert (=> b!534145 m!513395))

(declare-fun m!513401 () Bool)

(assert (=> b!534145 m!513401))

(declare-fun m!513403 () Bool)

(assert (=> b!534146 m!513403))

(assert (=> b!534154 m!513395))

(assert (=> b!534154 m!513395))

(declare-fun m!513405 () Bool)

(assert (=> b!534154 m!513405))

(declare-fun m!513407 () Bool)

(assert (=> b!534153 m!513407))

(declare-fun m!513409 () Bool)

(assert (=> b!534151 m!513409))

(assert (=> b!534151 m!513395))

(check-sat (not b!534150) (not b!534145) (not b!534146) (not b!534153) (not b!534154) (not b!534149) (not b!534152) (not start!48636) (not b!534148))
(check-sat)
