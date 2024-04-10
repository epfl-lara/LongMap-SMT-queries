; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48614 () Bool)

(assert start!48614)

(declare-fun b!533906 () Bool)

(declare-fun res!329112 () Bool)

(declare-fun e!310554 () Bool)

(assert (=> b!533906 (=> (not res!329112) (not e!310554))))

(declare-datatypes ((array!33826 0))(
  ( (array!33827 (arr!16252 (Array (_ BitVec 32) (_ BitVec 64))) (size!16616 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33826)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33826 (_ BitVec 32)) Bool)

(assert (=> b!533906 (= res!329112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533907 () Bool)

(declare-fun res!329119 () Bool)

(declare-fun e!310553 () Bool)

(assert (=> b!533907 (=> (not res!329119) (not e!310553))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533907 (= res!329119 (and (= (size!16616 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16616 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16616 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533908 () Bool)

(declare-fun res!329115 () Bool)

(assert (=> b!533908 (=> (not res!329115) (not e!310553))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533908 (= res!329115 (validKeyInArray!0 k0!1998))))

(declare-fun b!533909 () Bool)

(assert (=> b!533909 (= e!310553 e!310554)))

(declare-fun res!329117 () Bool)

(assert (=> b!533909 (=> (not res!329117) (not e!310554))))

(declare-datatypes ((SeekEntryResult!4710 0))(
  ( (MissingZero!4710 (index!21064 (_ BitVec 32))) (Found!4710 (index!21065 (_ BitVec 32))) (Intermediate!4710 (undefined!5522 Bool) (index!21066 (_ BitVec 32)) (x!50029 (_ BitVec 32))) (Undefined!4710) (MissingVacant!4710 (index!21067 (_ BitVec 32))) )
))
(declare-fun lt!245527 () SeekEntryResult!4710)

(assert (=> b!533909 (= res!329117 (or (= lt!245527 (MissingZero!4710 i!1153)) (= lt!245527 (MissingVacant!4710 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33826 (_ BitVec 32)) SeekEntryResult!4710)

(assert (=> b!533909 (= lt!245527 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!329114 () Bool)

(assert (=> start!48614 (=> (not res!329114) (not e!310553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48614 (= res!329114 (validMask!0 mask!3216))))

(assert (=> start!48614 e!310553))

(assert (=> start!48614 true))

(declare-fun array_inv!12048 (array!33826) Bool)

(assert (=> start!48614 (array_inv!12048 a!3154)))

(declare-fun b!533910 () Bool)

(declare-fun res!329113 () Bool)

(assert (=> b!533910 (=> (not res!329113) (not e!310553))))

(declare-fun arrayContainsKey!0 (array!33826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533910 (= res!329113 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533911 () Bool)

(declare-fun res!329111 () Bool)

(assert (=> b!533911 (=> (not res!329111) (not e!310553))))

(assert (=> b!533911 (= res!329111 (validKeyInArray!0 (select (arr!16252 a!3154) j!147)))))

(declare-fun b!533912 () Bool)

(declare-fun res!329120 () Bool)

(assert (=> b!533912 (=> (not res!329120) (not e!310554))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33826 (_ BitVec 32)) SeekEntryResult!4710)

(assert (=> b!533912 (= res!329120 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16252 a!3154) j!147) a!3154 mask!3216) (Intermediate!4710 false resIndex!32 resX!32)))))

(declare-fun b!533913 () Bool)

(assert (=> b!533913 (= e!310554 false)))

(declare-fun lt!245526 () SeekEntryResult!4710)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533913 (= lt!245526 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16252 a!3154) j!147) mask!3216) (select (arr!16252 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533914 () Bool)

(declare-fun res!329116 () Bool)

(assert (=> b!533914 (=> (not res!329116) (not e!310554))))

(declare-datatypes ((List!10371 0))(
  ( (Nil!10368) (Cons!10367 (h!11310 (_ BitVec 64)) (t!16599 List!10371)) )
))
(declare-fun arrayNoDuplicates!0 (array!33826 (_ BitVec 32) List!10371) Bool)

(assert (=> b!533914 (= res!329116 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10368))))

(declare-fun b!533915 () Bool)

(declare-fun res!329118 () Bool)

(assert (=> b!533915 (=> (not res!329118) (not e!310554))))

(assert (=> b!533915 (= res!329118 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16616 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16616 a!3154)) (= (select (arr!16252 a!3154) resIndex!32) (select (arr!16252 a!3154) j!147))))))

(assert (= (and start!48614 res!329114) b!533907))

(assert (= (and b!533907 res!329119) b!533911))

(assert (= (and b!533911 res!329111) b!533908))

(assert (= (and b!533908 res!329115) b!533910))

(assert (= (and b!533910 res!329113) b!533909))

(assert (= (and b!533909 res!329117) b!533906))

(assert (= (and b!533906 res!329112) b!533914))

(assert (= (and b!533914 res!329116) b!533915))

(assert (= (and b!533915 res!329118) b!533912))

(assert (= (and b!533912 res!329120) b!533913))

(declare-fun m!513695 () Bool)

(assert (=> b!533911 m!513695))

(assert (=> b!533911 m!513695))

(declare-fun m!513697 () Bool)

(assert (=> b!533911 m!513697))

(declare-fun m!513699 () Bool)

(assert (=> b!533915 m!513699))

(assert (=> b!533915 m!513695))

(declare-fun m!513701 () Bool)

(assert (=> b!533906 m!513701))

(declare-fun m!513703 () Bool)

(assert (=> start!48614 m!513703))

(declare-fun m!513705 () Bool)

(assert (=> start!48614 m!513705))

(declare-fun m!513707 () Bool)

(assert (=> b!533914 m!513707))

(declare-fun m!513709 () Bool)

(assert (=> b!533909 m!513709))

(declare-fun m!513711 () Bool)

(assert (=> b!533910 m!513711))

(declare-fun m!513713 () Bool)

(assert (=> b!533908 m!513713))

(assert (=> b!533913 m!513695))

(assert (=> b!533913 m!513695))

(declare-fun m!513715 () Bool)

(assert (=> b!533913 m!513715))

(assert (=> b!533913 m!513715))

(assert (=> b!533913 m!513695))

(declare-fun m!513717 () Bool)

(assert (=> b!533913 m!513717))

(assert (=> b!533912 m!513695))

(assert (=> b!533912 m!513695))

(declare-fun m!513719 () Bool)

(assert (=> b!533912 m!513719))

(check-sat (not b!533914) (not b!533913) (not b!533911) (not b!533912) (not start!48614) (not b!533909) (not b!533908) (not b!533910) (not b!533906))
(check-sat)
