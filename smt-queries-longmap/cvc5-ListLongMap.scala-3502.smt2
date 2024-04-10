; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48582 () Bool)

(assert start!48582)

(declare-fun b!533435 () Bool)

(declare-fun res!328645 () Bool)

(declare-fun e!310410 () Bool)

(assert (=> b!533435 (=> (not res!328645) (not e!310410))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533435 (= res!328645 (validKeyInArray!0 k!1998))))

(declare-fun b!533436 () Bool)

(declare-fun res!328642 () Bool)

(declare-fun e!310409 () Bool)

(assert (=> b!533436 (=> (not res!328642) (not e!310409))))

(declare-datatypes ((array!33794 0))(
  ( (array!33795 (arr!16236 (Array (_ BitVec 32) (_ BitVec 64))) (size!16600 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33794)

(declare-datatypes ((List!10355 0))(
  ( (Nil!10352) (Cons!10351 (h!11294 (_ BitVec 64)) (t!16583 List!10355)) )
))
(declare-fun arrayNoDuplicates!0 (array!33794 (_ BitVec 32) List!10355) Bool)

(assert (=> b!533436 (= res!328642 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10352))))

(declare-fun b!533437 () Bool)

(declare-fun res!328644 () Bool)

(assert (=> b!533437 (=> (not res!328644) (not e!310409))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4694 0))(
  ( (MissingZero!4694 (index!21000 (_ BitVec 32))) (Found!4694 (index!21001 (_ BitVec 32))) (Intermediate!4694 (undefined!5506 Bool) (index!21002 (_ BitVec 32)) (x!49973 (_ BitVec 32))) (Undefined!4694) (MissingVacant!4694 (index!21003 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33794 (_ BitVec 32)) SeekEntryResult!4694)

(assert (=> b!533437 (= res!328644 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16236 a!3154) j!147) a!3154 mask!3216) (Intermediate!4694 false resIndex!32 resX!32)))))

(declare-fun b!533438 () Bool)

(assert (=> b!533438 (= e!310409 (and (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun b!533439 () Bool)

(declare-fun res!328649 () Bool)

(assert (=> b!533439 (=> (not res!328649) (not e!310410))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533439 (= res!328649 (and (= (size!16600 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16600 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16600 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533440 () Bool)

(declare-fun res!328641 () Bool)

(assert (=> b!533440 (=> (not res!328641) (not e!310410))))

(declare-fun arrayContainsKey!0 (array!33794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533440 (= res!328641 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533441 () Bool)

(declare-fun res!328646 () Bool)

(assert (=> b!533441 (=> (not res!328646) (not e!310409))))

(assert (=> b!533441 (= res!328646 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16600 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16600 a!3154)) (= (select (arr!16236 a!3154) resIndex!32) (select (arr!16236 a!3154) j!147))))))

(declare-fun res!328643 () Bool)

(assert (=> start!48582 (=> (not res!328643) (not e!310410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48582 (= res!328643 (validMask!0 mask!3216))))

(assert (=> start!48582 e!310410))

(assert (=> start!48582 true))

(declare-fun array_inv!12032 (array!33794) Bool)

(assert (=> start!48582 (array_inv!12032 a!3154)))

(declare-fun b!533442 () Bool)

(assert (=> b!533442 (= e!310410 e!310409)))

(declare-fun res!328640 () Bool)

(assert (=> b!533442 (=> (not res!328640) (not e!310409))))

(declare-fun lt!245446 () SeekEntryResult!4694)

(assert (=> b!533442 (= res!328640 (or (= lt!245446 (MissingZero!4694 i!1153)) (= lt!245446 (MissingVacant!4694 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33794 (_ BitVec 32)) SeekEntryResult!4694)

(assert (=> b!533442 (= lt!245446 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533443 () Bool)

(declare-fun res!328647 () Bool)

(assert (=> b!533443 (=> (not res!328647) (not e!310409))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33794 (_ BitVec 32)) Bool)

(assert (=> b!533443 (= res!328647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533444 () Bool)

(declare-fun res!328648 () Bool)

(assert (=> b!533444 (=> (not res!328648) (not e!310410))))

(assert (=> b!533444 (= res!328648 (validKeyInArray!0 (select (arr!16236 a!3154) j!147)))))

(assert (= (and start!48582 res!328643) b!533439))

(assert (= (and b!533439 res!328649) b!533444))

(assert (= (and b!533444 res!328648) b!533435))

(assert (= (and b!533435 res!328645) b!533440))

(assert (= (and b!533440 res!328641) b!533442))

(assert (= (and b!533442 res!328640) b!533443))

(assert (= (and b!533443 res!328647) b!533436))

(assert (= (and b!533436 res!328642) b!533441))

(assert (= (and b!533441 res!328646) b!533437))

(assert (= (and b!533437 res!328644) b!533438))

(declare-fun m!513315 () Bool)

(assert (=> b!533443 m!513315))

(declare-fun m!513317 () Bool)

(assert (=> b!533442 m!513317))

(declare-fun m!513319 () Bool)

(assert (=> b!533437 m!513319))

(assert (=> b!533437 m!513319))

(declare-fun m!513321 () Bool)

(assert (=> b!533437 m!513321))

(declare-fun m!513323 () Bool)

(assert (=> b!533435 m!513323))

(assert (=> b!533444 m!513319))

(assert (=> b!533444 m!513319))

(declare-fun m!513325 () Bool)

(assert (=> b!533444 m!513325))

(declare-fun m!513327 () Bool)

(assert (=> start!48582 m!513327))

(declare-fun m!513329 () Bool)

(assert (=> start!48582 m!513329))

(declare-fun m!513331 () Bool)

(assert (=> b!533440 m!513331))

(declare-fun m!513333 () Bool)

(assert (=> b!533436 m!513333))

(declare-fun m!513335 () Bool)

(assert (=> b!533441 m!513335))

(assert (=> b!533441 m!513319))

(push 1)

(assert (not b!533440))

(assert (not b!533442))

(assert (not b!533437))

(assert (not b!533435))

(assert (not start!48582))

(assert (not b!533443))

(assert (not b!533436))

(assert (not b!533444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

