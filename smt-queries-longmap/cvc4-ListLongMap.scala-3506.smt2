; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48610 () Bool)

(assert start!48610)

(declare-fun b!533846 () Bool)

(declare-fun res!329059 () Bool)

(declare-fun e!310535 () Bool)

(assert (=> b!533846 (=> (not res!329059) (not e!310535))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533846 (= res!329059 (validKeyInArray!0 k!1998))))

(declare-fun b!533847 () Bool)

(declare-fun res!329060 () Bool)

(declare-fun e!310534 () Bool)

(assert (=> b!533847 (=> (not res!329060) (not e!310534))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33822 0))(
  ( (array!33823 (arr!16250 (Array (_ BitVec 32) (_ BitVec 64))) (size!16614 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33822)

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4708 0))(
  ( (MissingZero!4708 (index!21056 (_ BitVec 32))) (Found!4708 (index!21057 (_ BitVec 32))) (Intermediate!4708 (undefined!5520 Bool) (index!21058 (_ BitVec 32)) (x!50019 (_ BitVec 32))) (Undefined!4708) (MissingVacant!4708 (index!21059 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33822 (_ BitVec 32)) SeekEntryResult!4708)

(assert (=> b!533847 (= res!329060 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16250 a!3154) j!147) a!3154 mask!3216) (Intermediate!4708 false resIndex!32 resX!32)))))

(declare-fun b!533848 () Bool)

(declare-fun res!329053 () Bool)

(assert (=> b!533848 (=> (not res!329053) (not e!310534))))

(assert (=> b!533848 (= res!329053 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16614 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16614 a!3154)) (= (select (arr!16250 a!3154) resIndex!32) (select (arr!16250 a!3154) j!147))))))

(declare-fun b!533850 () Bool)

(declare-fun res!329056 () Bool)

(assert (=> b!533850 (=> (not res!329056) (not e!310534))))

(declare-datatypes ((List!10369 0))(
  ( (Nil!10366) (Cons!10365 (h!11308 (_ BitVec 64)) (t!16597 List!10369)) )
))
(declare-fun arrayNoDuplicates!0 (array!33822 (_ BitVec 32) List!10369) Bool)

(assert (=> b!533850 (= res!329056 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10366))))

(declare-fun b!533851 () Bool)

(assert (=> b!533851 (= e!310534 false)))

(declare-fun lt!245515 () SeekEntryResult!4708)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533851 (= lt!245515 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16250 a!3154) j!147) mask!3216) (select (arr!16250 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533852 () Bool)

(declare-fun res!329057 () Bool)

(assert (=> b!533852 (=> (not res!329057) (not e!310535))))

(assert (=> b!533852 (= res!329057 (validKeyInArray!0 (select (arr!16250 a!3154) j!147)))))

(declare-fun b!533853 () Bool)

(declare-fun res!329054 () Bool)

(assert (=> b!533853 (=> (not res!329054) (not e!310534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33822 (_ BitVec 32)) Bool)

(assert (=> b!533853 (= res!329054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533854 () Bool)

(declare-fun res!329052 () Bool)

(assert (=> b!533854 (=> (not res!329052) (not e!310535))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533854 (= res!329052 (and (= (size!16614 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16614 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16614 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533855 () Bool)

(assert (=> b!533855 (= e!310535 e!310534)))

(declare-fun res!329058 () Bool)

(assert (=> b!533855 (=> (not res!329058) (not e!310534))))

(declare-fun lt!245514 () SeekEntryResult!4708)

(assert (=> b!533855 (= res!329058 (or (= lt!245514 (MissingZero!4708 i!1153)) (= lt!245514 (MissingVacant!4708 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33822 (_ BitVec 32)) SeekEntryResult!4708)

(assert (=> b!533855 (= lt!245514 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!329051 () Bool)

(assert (=> start!48610 (=> (not res!329051) (not e!310535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48610 (= res!329051 (validMask!0 mask!3216))))

(assert (=> start!48610 e!310535))

(assert (=> start!48610 true))

(declare-fun array_inv!12046 (array!33822) Bool)

(assert (=> start!48610 (array_inv!12046 a!3154)))

(declare-fun b!533849 () Bool)

(declare-fun res!329055 () Bool)

(assert (=> b!533849 (=> (not res!329055) (not e!310535))))

(declare-fun arrayContainsKey!0 (array!33822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533849 (= res!329055 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48610 res!329051) b!533854))

(assert (= (and b!533854 res!329052) b!533852))

(assert (= (and b!533852 res!329057) b!533846))

(assert (= (and b!533846 res!329059) b!533849))

(assert (= (and b!533849 res!329055) b!533855))

(assert (= (and b!533855 res!329058) b!533853))

(assert (= (and b!533853 res!329054) b!533850))

(assert (= (and b!533850 res!329056) b!533848))

(assert (= (and b!533848 res!329053) b!533847))

(assert (= (and b!533847 res!329060) b!533851))

(declare-fun m!513643 () Bool)

(assert (=> b!533849 m!513643))

(declare-fun m!513645 () Bool)

(assert (=> b!533850 m!513645))

(declare-fun m!513647 () Bool)

(assert (=> b!533848 m!513647))

(declare-fun m!513649 () Bool)

(assert (=> b!533848 m!513649))

(declare-fun m!513651 () Bool)

(assert (=> b!533853 m!513651))

(declare-fun m!513653 () Bool)

(assert (=> b!533846 m!513653))

(declare-fun m!513655 () Bool)

(assert (=> start!48610 m!513655))

(declare-fun m!513657 () Bool)

(assert (=> start!48610 m!513657))

(assert (=> b!533851 m!513649))

(assert (=> b!533851 m!513649))

(declare-fun m!513659 () Bool)

(assert (=> b!533851 m!513659))

(assert (=> b!533851 m!513659))

(assert (=> b!533851 m!513649))

(declare-fun m!513661 () Bool)

(assert (=> b!533851 m!513661))

(assert (=> b!533847 m!513649))

(assert (=> b!533847 m!513649))

(declare-fun m!513663 () Bool)

(assert (=> b!533847 m!513663))

(assert (=> b!533852 m!513649))

(assert (=> b!533852 m!513649))

(declare-fun m!513665 () Bool)

(assert (=> b!533852 m!513665))

(declare-fun m!513667 () Bool)

(assert (=> b!533855 m!513667))

(push 1)

(assert (not b!533850))

(assert (not b!533851))

(assert (not start!48610))

(assert (not b!533855))

(assert (not b!533846))

(assert (not b!533849))

(assert (not b!533853))

(assert (not b!533847))

