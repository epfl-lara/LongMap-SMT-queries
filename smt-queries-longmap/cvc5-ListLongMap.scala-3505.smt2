; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48600 () Bool)

(assert start!48600)

(declare-fun b!533696 () Bool)

(declare-fun e!310489 () Bool)

(assert (=> b!533696 (= e!310489 false)))

(declare-datatypes ((SeekEntryResult!4703 0))(
  ( (MissingZero!4703 (index!21036 (_ BitVec 32))) (Found!4703 (index!21037 (_ BitVec 32))) (Intermediate!4703 (undefined!5515 Bool) (index!21038 (_ BitVec 32)) (x!50006 (_ BitVec 32))) (Undefined!4703) (MissingVacant!4703 (index!21039 (_ BitVec 32))) )
))
(declare-fun lt!245484 () SeekEntryResult!4703)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33812 0))(
  ( (array!33813 (arr!16245 (Array (_ BitVec 32) (_ BitVec 64))) (size!16609 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33812)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33812 (_ BitVec 32)) SeekEntryResult!4703)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533696 (= lt!245484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16245 a!3154) j!147) mask!3216) (select (arr!16245 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533697 () Bool)

(declare-fun res!328906 () Bool)

(declare-fun e!310491 () Bool)

(assert (=> b!533697 (=> (not res!328906) (not e!310491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533697 (= res!328906 (validKeyInArray!0 (select (arr!16245 a!3154) j!147)))))

(declare-fun b!533698 () Bool)

(declare-fun res!328904 () Bool)

(assert (=> b!533698 (=> (not res!328904) (not e!310491))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533698 (= res!328904 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533699 () Bool)

(assert (=> b!533699 (= e!310491 e!310489)))

(declare-fun res!328901 () Bool)

(assert (=> b!533699 (=> (not res!328901) (not e!310489))))

(declare-fun lt!245485 () SeekEntryResult!4703)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533699 (= res!328901 (or (= lt!245485 (MissingZero!4703 i!1153)) (= lt!245485 (MissingVacant!4703 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33812 (_ BitVec 32)) SeekEntryResult!4703)

(assert (=> b!533699 (= lt!245485 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533700 () Bool)

(declare-fun res!328907 () Bool)

(assert (=> b!533700 (=> (not res!328907) (not e!310489))))

(declare-datatypes ((List!10364 0))(
  ( (Nil!10361) (Cons!10360 (h!11303 (_ BitVec 64)) (t!16592 List!10364)) )
))
(declare-fun arrayNoDuplicates!0 (array!33812 (_ BitVec 32) List!10364) Bool)

(assert (=> b!533700 (= res!328907 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10361))))

(declare-fun b!533701 () Bool)

(declare-fun res!328902 () Bool)

(assert (=> b!533701 (=> (not res!328902) (not e!310489))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533701 (= res!328902 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16609 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16609 a!3154)) (= (select (arr!16245 a!3154) resIndex!32) (select (arr!16245 a!3154) j!147))))))

(declare-fun b!533702 () Bool)

(declare-fun res!328905 () Bool)

(assert (=> b!533702 (=> (not res!328905) (not e!310489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33812 (_ BitVec 32)) Bool)

(assert (=> b!533702 (= res!328905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!328903 () Bool)

(assert (=> start!48600 (=> (not res!328903) (not e!310491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48600 (= res!328903 (validMask!0 mask!3216))))

(assert (=> start!48600 e!310491))

(assert (=> start!48600 true))

(declare-fun array_inv!12041 (array!33812) Bool)

(assert (=> start!48600 (array_inv!12041 a!3154)))

(declare-fun b!533703 () Bool)

(declare-fun res!328909 () Bool)

(assert (=> b!533703 (=> (not res!328909) (not e!310491))))

(assert (=> b!533703 (= res!328909 (and (= (size!16609 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16609 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16609 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533704 () Bool)

(declare-fun res!328908 () Bool)

(assert (=> b!533704 (=> (not res!328908) (not e!310491))))

(assert (=> b!533704 (= res!328908 (validKeyInArray!0 k!1998))))

(declare-fun b!533705 () Bool)

(declare-fun res!328910 () Bool)

(assert (=> b!533705 (=> (not res!328910) (not e!310489))))

(assert (=> b!533705 (= res!328910 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16245 a!3154) j!147) a!3154 mask!3216) (Intermediate!4703 false resIndex!32 resX!32)))))

(assert (= (and start!48600 res!328903) b!533703))

(assert (= (and b!533703 res!328909) b!533697))

(assert (= (and b!533697 res!328906) b!533704))

(assert (= (and b!533704 res!328908) b!533698))

(assert (= (and b!533698 res!328904) b!533699))

(assert (= (and b!533699 res!328901) b!533702))

(assert (= (and b!533702 res!328905) b!533700))

(assert (= (and b!533700 res!328907) b!533701))

(assert (= (and b!533701 res!328902) b!533705))

(assert (= (and b!533705 res!328910) b!533696))

(declare-fun m!513513 () Bool)

(assert (=> start!48600 m!513513))

(declare-fun m!513515 () Bool)

(assert (=> start!48600 m!513515))

(declare-fun m!513517 () Bool)

(assert (=> b!533701 m!513517))

(declare-fun m!513519 () Bool)

(assert (=> b!533701 m!513519))

(assert (=> b!533696 m!513519))

(assert (=> b!533696 m!513519))

(declare-fun m!513521 () Bool)

(assert (=> b!533696 m!513521))

(assert (=> b!533696 m!513521))

(assert (=> b!533696 m!513519))

(declare-fun m!513523 () Bool)

(assert (=> b!533696 m!513523))

(assert (=> b!533705 m!513519))

(assert (=> b!533705 m!513519))

(declare-fun m!513525 () Bool)

(assert (=> b!533705 m!513525))

(declare-fun m!513527 () Bool)

(assert (=> b!533704 m!513527))

(declare-fun m!513529 () Bool)

(assert (=> b!533700 m!513529))

(assert (=> b!533697 m!513519))

(assert (=> b!533697 m!513519))

(declare-fun m!513531 () Bool)

(assert (=> b!533697 m!513531))

(declare-fun m!513533 () Bool)

(assert (=> b!533699 m!513533))

(declare-fun m!513535 () Bool)

(assert (=> b!533698 m!513535))

(declare-fun m!513537 () Bool)

(assert (=> b!533702 m!513537))

(push 1)

