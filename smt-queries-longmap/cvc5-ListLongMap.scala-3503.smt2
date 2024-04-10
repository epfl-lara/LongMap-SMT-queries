; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48588 () Bool)

(assert start!48588)

(declare-fun b!533525 () Bool)

(declare-fun e!310436 () Bool)

(declare-fun e!310435 () Bool)

(assert (=> b!533525 (= e!310436 e!310435)))

(declare-fun res!328734 () Bool)

(assert (=> b!533525 (=> (not res!328734) (not e!310435))))

(declare-datatypes ((SeekEntryResult!4697 0))(
  ( (MissingZero!4697 (index!21012 (_ BitVec 32))) (Found!4697 (index!21013 (_ BitVec 32))) (Intermediate!4697 (undefined!5509 Bool) (index!21014 (_ BitVec 32)) (x!49984 (_ BitVec 32))) (Undefined!4697) (MissingVacant!4697 (index!21015 (_ BitVec 32))) )
))
(declare-fun lt!245455 () SeekEntryResult!4697)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533525 (= res!328734 (or (= lt!245455 (MissingZero!4697 i!1153)) (= lt!245455 (MissingVacant!4697 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!33800 0))(
  ( (array!33801 (arr!16239 (Array (_ BitVec 32) (_ BitVec 64))) (size!16603 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33800)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33800 (_ BitVec 32)) SeekEntryResult!4697)

(assert (=> b!533525 (= lt!245455 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!328736 () Bool)

(assert (=> start!48588 (=> (not res!328736) (not e!310436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48588 (= res!328736 (validMask!0 mask!3216))))

(assert (=> start!48588 e!310436))

(assert (=> start!48588 true))

(declare-fun array_inv!12035 (array!33800) Bool)

(assert (=> start!48588 (array_inv!12035 a!3154)))

(declare-fun b!533526 () Bool)

(declare-fun res!328735 () Bool)

(assert (=> b!533526 (=> (not res!328735) (not e!310435))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533526 (= res!328735 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16603 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16603 a!3154)) (= (select (arr!16239 a!3154) resIndex!32) (select (arr!16239 a!3154) j!147))))))

(declare-fun b!533527 () Bool)

(declare-fun res!328739 () Bool)

(assert (=> b!533527 (=> (not res!328739) (not e!310435))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33800 (_ BitVec 32)) SeekEntryResult!4697)

(assert (=> b!533527 (= res!328739 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16239 a!3154) j!147) a!3154 mask!3216) (Intermediate!4697 false resIndex!32 resX!32)))))

(declare-fun b!533528 () Bool)

(assert (=> b!533528 (= e!310435 (and (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!533529 () Bool)

(declare-fun res!328730 () Bool)

(assert (=> b!533529 (=> (not res!328730) (not e!310435))))

(declare-datatypes ((List!10358 0))(
  ( (Nil!10355) (Cons!10354 (h!11297 (_ BitVec 64)) (t!16586 List!10358)) )
))
(declare-fun arrayNoDuplicates!0 (array!33800 (_ BitVec 32) List!10358) Bool)

(assert (=> b!533529 (= res!328730 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10355))))

(declare-fun b!533530 () Bool)

(declare-fun res!328732 () Bool)

(assert (=> b!533530 (=> (not res!328732) (not e!310436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533530 (= res!328732 (validKeyInArray!0 (select (arr!16239 a!3154) j!147)))))

(declare-fun b!533531 () Bool)

(declare-fun res!328733 () Bool)

(assert (=> b!533531 (=> (not res!328733) (not e!310435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33800 (_ BitVec 32)) Bool)

(assert (=> b!533531 (= res!328733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533532 () Bool)

(declare-fun res!328731 () Bool)

(assert (=> b!533532 (=> (not res!328731) (not e!310436))))

(assert (=> b!533532 (= res!328731 (validKeyInArray!0 k!1998))))

(declare-fun b!533533 () Bool)

(declare-fun res!328737 () Bool)

(assert (=> b!533533 (=> (not res!328737) (not e!310436))))

(assert (=> b!533533 (= res!328737 (and (= (size!16603 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16603 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16603 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533534 () Bool)

(declare-fun res!328738 () Bool)

(assert (=> b!533534 (=> (not res!328738) (not e!310436))))

(declare-fun arrayContainsKey!0 (array!33800 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533534 (= res!328738 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48588 res!328736) b!533533))

(assert (= (and b!533533 res!328737) b!533530))

(assert (= (and b!533530 res!328732) b!533532))

(assert (= (and b!533532 res!328731) b!533534))

(assert (= (and b!533534 res!328738) b!533525))

(assert (= (and b!533525 res!328734) b!533531))

(assert (= (and b!533531 res!328733) b!533529))

(assert (= (and b!533529 res!328730) b!533526))

(assert (= (and b!533526 res!328735) b!533527))

(assert (= (and b!533527 res!328739) b!533528))

(declare-fun m!513381 () Bool)

(assert (=> b!533529 m!513381))

(declare-fun m!513383 () Bool)

(assert (=> start!48588 m!513383))

(declare-fun m!513385 () Bool)

(assert (=> start!48588 m!513385))

(declare-fun m!513387 () Bool)

(assert (=> b!533530 m!513387))

(assert (=> b!533530 m!513387))

(declare-fun m!513389 () Bool)

(assert (=> b!533530 m!513389))

(declare-fun m!513391 () Bool)

(assert (=> b!533526 m!513391))

(assert (=> b!533526 m!513387))

(declare-fun m!513393 () Bool)

(assert (=> b!533525 m!513393))

(declare-fun m!513395 () Bool)

(assert (=> b!533532 m!513395))

(declare-fun m!513397 () Bool)

(assert (=> b!533534 m!513397))

(assert (=> b!533527 m!513387))

(assert (=> b!533527 m!513387))

(declare-fun m!513399 () Bool)

(assert (=> b!533527 m!513399))

(declare-fun m!513401 () Bool)

(assert (=> b!533531 m!513401))

(push 1)

