; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48478 () Bool)

(assert start!48478)

(declare-fun res!327931 () Bool)

(declare-fun e!310028 () Bool)

(assert (=> start!48478 (=> (not res!327931) (not e!310028))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48478 (= res!327931 (validMask!0 mask!3216))))

(assert (=> start!48478 e!310028))

(assert (=> start!48478 true))

(declare-datatypes ((array!33740 0))(
  ( (array!33741 (arr!16210 (Array (_ BitVec 32) (_ BitVec 64))) (size!16574 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33740)

(declare-fun array_inv!12069 (array!33740) Bool)

(assert (=> start!48478 (array_inv!12069 a!3154)))

(declare-fun b!532528 () Bool)

(declare-fun res!327937 () Bool)

(declare-fun e!310029 () Bool)

(assert (=> b!532528 (=> (not res!327937) (not e!310029))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4624 0))(
  ( (MissingZero!4624 (index!20720 (_ BitVec 32))) (Found!4624 (index!20721 (_ BitVec 32))) (Intermediate!4624 (undefined!5436 Bool) (index!20722 (_ BitVec 32)) (x!49838 (_ BitVec 32))) (Undefined!4624) (MissingVacant!4624 (index!20723 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33740 (_ BitVec 32)) SeekEntryResult!4624)

(assert (=> b!532528 (= res!327937 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16210 a!3154) j!147) a!3154 mask!3216) (Intermediate!4624 false resIndex!32 resX!32)))))

(declare-fun b!532529 () Bool)

(declare-fun res!327930 () Bool)

(assert (=> b!532529 (=> (not res!327930) (not e!310028))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33740 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532529 (= res!327930 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532530 () Bool)

(declare-fun res!327929 () Bool)

(assert (=> b!532530 (=> (not res!327929) (not e!310029))))

(declare-datatypes ((List!10236 0))(
  ( (Nil!10233) (Cons!10232 (h!11172 (_ BitVec 64)) (t!16456 List!10236)) )
))
(declare-fun arrayNoDuplicates!0 (array!33740 (_ BitVec 32) List!10236) Bool)

(assert (=> b!532530 (= res!327929 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10233))))

(declare-fun b!532531 () Bool)

(assert (=> b!532531 (= e!310029 false)))

(declare-fun lt!245253 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532531 (= lt!245253 (toIndex!0 (select (arr!16210 a!3154) j!147) mask!3216))))

(declare-fun b!532532 () Bool)

(declare-fun res!327934 () Bool)

(assert (=> b!532532 (=> (not res!327934) (not e!310028))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532532 (= res!327934 (and (= (size!16574 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16574 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16574 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532533 () Bool)

(declare-fun res!327932 () Bool)

(assert (=> b!532533 (=> (not res!327932) (not e!310029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33740 (_ BitVec 32)) Bool)

(assert (=> b!532533 (= res!327932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532534 () Bool)

(declare-fun res!327928 () Bool)

(assert (=> b!532534 (=> (not res!327928) (not e!310029))))

(assert (=> b!532534 (= res!327928 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16574 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16574 a!3154)) (= (select (arr!16210 a!3154) resIndex!32) (select (arr!16210 a!3154) j!147))))))

(declare-fun b!532535 () Bool)

(assert (=> b!532535 (= e!310028 e!310029)))

(declare-fun res!327933 () Bool)

(assert (=> b!532535 (=> (not res!327933) (not e!310029))))

(declare-fun lt!245254 () SeekEntryResult!4624)

(assert (=> b!532535 (= res!327933 (or (= lt!245254 (MissingZero!4624 i!1153)) (= lt!245254 (MissingVacant!4624 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33740 (_ BitVec 32)) SeekEntryResult!4624)

(assert (=> b!532535 (= lt!245254 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532536 () Bool)

(declare-fun res!327936 () Bool)

(assert (=> b!532536 (=> (not res!327936) (not e!310028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532536 (= res!327936 (validKeyInArray!0 k0!1998))))

(declare-fun b!532537 () Bool)

(declare-fun res!327935 () Bool)

(assert (=> b!532537 (=> (not res!327935) (not e!310028))))

(assert (=> b!532537 (= res!327935 (validKeyInArray!0 (select (arr!16210 a!3154) j!147)))))

(assert (= (and start!48478 res!327931) b!532532))

(assert (= (and b!532532 res!327934) b!532537))

(assert (= (and b!532537 res!327935) b!532536))

(assert (= (and b!532536 res!327936) b!532529))

(assert (= (and b!532529 res!327930) b!532535))

(assert (= (and b!532535 res!327933) b!532533))

(assert (= (and b!532533 res!327932) b!532530))

(assert (= (and b!532530 res!327929) b!532534))

(assert (= (and b!532534 res!327928) b!532528))

(assert (= (and b!532528 res!327937) b!532531))

(declare-fun m!512893 () Bool)

(assert (=> b!532529 m!512893))

(declare-fun m!512895 () Bool)

(assert (=> b!532537 m!512895))

(assert (=> b!532537 m!512895))

(declare-fun m!512897 () Bool)

(assert (=> b!532537 m!512897))

(assert (=> b!532531 m!512895))

(assert (=> b!532531 m!512895))

(declare-fun m!512899 () Bool)

(assert (=> b!532531 m!512899))

(declare-fun m!512901 () Bool)

(assert (=> start!48478 m!512901))

(declare-fun m!512903 () Bool)

(assert (=> start!48478 m!512903))

(declare-fun m!512905 () Bool)

(assert (=> b!532530 m!512905))

(declare-fun m!512907 () Bool)

(assert (=> b!532535 m!512907))

(declare-fun m!512909 () Bool)

(assert (=> b!532533 m!512909))

(assert (=> b!532528 m!512895))

(assert (=> b!532528 m!512895))

(declare-fun m!512911 () Bool)

(assert (=> b!532528 m!512911))

(declare-fun m!512913 () Bool)

(assert (=> b!532536 m!512913))

(declare-fun m!512915 () Bool)

(assert (=> b!532534 m!512915))

(assert (=> b!532534 m!512895))

(check-sat (not b!532531) (not b!532533) (not b!532536) (not b!532535) (not b!532537) (not start!48478) (not b!532530) (not b!532528) (not b!532529))
(check-sat)
