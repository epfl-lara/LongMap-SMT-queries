; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48832 () Bool)

(assert start!48832)

(declare-fun b!537704 () Bool)

(declare-fun res!332921 () Bool)

(declare-fun e!311901 () Bool)

(assert (=> b!537704 (=> (not res!332921) (not e!311901))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34044 0))(
  ( (array!34045 (arr!16361 (Array (_ BitVec 32) (_ BitVec 64))) (size!16725 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34044)

(assert (=> b!537704 (= res!332921 (and (not (= (select (arr!16361 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16361 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16361 a!3154) index!1177) (select (arr!16361 a!3154) j!147)))))))

(declare-fun b!537706 () Bool)

(declare-fun e!311904 () Bool)

(assert (=> b!537706 (= e!311904 false)))

(declare-fun lt!246484 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4819 0))(
  ( (MissingZero!4819 (index!21500 (_ BitVec 32))) (Found!4819 (index!21501 (_ BitVec 32))) (Intermediate!4819 (undefined!5631 Bool) (index!21502 (_ BitVec 32)) (x!50426 (_ BitVec 32))) (Undefined!4819) (MissingVacant!4819 (index!21503 (_ BitVec 32))) )
))
(declare-fun lt!246487 () SeekEntryResult!4819)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34044 (_ BitVec 32)) SeekEntryResult!4819)

(assert (=> b!537706 (= lt!246487 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246484 (select (arr!16361 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537707 () Bool)

(declare-fun res!332915 () Bool)

(declare-fun e!311903 () Bool)

(assert (=> b!537707 (=> (not res!332915) (not e!311903))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537707 (= res!332915 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537708 () Bool)

(declare-fun res!332916 () Bool)

(assert (=> b!537708 (=> (not res!332916) (not e!311903))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537708 (= res!332916 (and (= (size!16725 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16725 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16725 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537709 () Bool)

(declare-fun res!332919 () Bool)

(assert (=> b!537709 (=> (not res!332919) (not e!311901))))

(declare-fun lt!246486 () SeekEntryResult!4819)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537709 (= res!332919 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16361 a!3154) j!147) mask!3216) (select (arr!16361 a!3154) j!147) a!3154 mask!3216) lt!246486))))

(declare-fun b!537710 () Bool)

(declare-fun res!332920 () Bool)

(assert (=> b!537710 (=> (not res!332920) (not e!311903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537710 (= res!332920 (validKeyInArray!0 k!1998))))

(declare-fun b!537711 () Bool)

(declare-fun res!332917 () Bool)

(assert (=> b!537711 (=> (not res!332917) (not e!311903))))

(assert (=> b!537711 (= res!332917 (validKeyInArray!0 (select (arr!16361 a!3154) j!147)))))

(declare-fun b!537712 () Bool)

(declare-fun res!332910 () Bool)

(declare-fun e!311900 () Bool)

(assert (=> b!537712 (=> (not res!332910) (not e!311900))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537712 (= res!332910 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16725 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16725 a!3154)) (= (select (arr!16361 a!3154) resIndex!32) (select (arr!16361 a!3154) j!147))))))

(declare-fun b!537713 () Bool)

(assert (=> b!537713 (= e!311903 e!311900)))

(declare-fun res!332912 () Bool)

(assert (=> b!537713 (=> (not res!332912) (not e!311900))))

(declare-fun lt!246485 () SeekEntryResult!4819)

(assert (=> b!537713 (= res!332912 (or (= lt!246485 (MissingZero!4819 i!1153)) (= lt!246485 (MissingVacant!4819 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34044 (_ BitVec 32)) SeekEntryResult!4819)

(assert (=> b!537713 (= lt!246485 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537714 () Bool)

(declare-fun res!332914 () Bool)

(assert (=> b!537714 (=> (not res!332914) (not e!311900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34044 (_ BitVec 32)) Bool)

(assert (=> b!537714 (= res!332914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!332918 () Bool)

(assert (=> start!48832 (=> (not res!332918) (not e!311903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48832 (= res!332918 (validMask!0 mask!3216))))

(assert (=> start!48832 e!311903))

(assert (=> start!48832 true))

(declare-fun array_inv!12157 (array!34044) Bool)

(assert (=> start!48832 (array_inv!12157 a!3154)))

(declare-fun b!537705 () Bool)

(declare-fun res!332909 () Bool)

(assert (=> b!537705 (=> (not res!332909) (not e!311900))))

(declare-datatypes ((List!10480 0))(
  ( (Nil!10477) (Cons!10476 (h!11419 (_ BitVec 64)) (t!16708 List!10480)) )
))
(declare-fun arrayNoDuplicates!0 (array!34044 (_ BitVec 32) List!10480) Bool)

(assert (=> b!537705 (= res!332909 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10477))))

(declare-fun b!537715 () Bool)

(assert (=> b!537715 (= e!311901 e!311904)))

(declare-fun res!332913 () Bool)

(assert (=> b!537715 (=> (not res!332913) (not e!311904))))

(assert (=> b!537715 (= res!332913 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246484 #b00000000000000000000000000000000) (bvslt lt!246484 (size!16725 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537715 (= lt!246484 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537716 () Bool)

(assert (=> b!537716 (= e!311900 e!311901)))

(declare-fun res!332911 () Bool)

(assert (=> b!537716 (=> (not res!332911) (not e!311901))))

(assert (=> b!537716 (= res!332911 (= lt!246486 (Intermediate!4819 false resIndex!32 resX!32)))))

(assert (=> b!537716 (= lt!246486 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16361 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48832 res!332918) b!537708))

(assert (= (and b!537708 res!332916) b!537711))

(assert (= (and b!537711 res!332917) b!537710))

(assert (= (and b!537710 res!332920) b!537707))

(assert (= (and b!537707 res!332915) b!537713))

(assert (= (and b!537713 res!332912) b!537714))

(assert (= (and b!537714 res!332914) b!537705))

(assert (= (and b!537705 res!332909) b!537712))

(assert (= (and b!537712 res!332910) b!537716))

(assert (= (and b!537716 res!332911) b!537709))

(assert (= (and b!537709 res!332919) b!537704))

(assert (= (and b!537704 res!332921) b!537715))

(assert (= (and b!537715 res!332913) b!537706))

(declare-fun m!516889 () Bool)

(assert (=> b!537715 m!516889))

(declare-fun m!516891 () Bool)

(assert (=> b!537709 m!516891))

(assert (=> b!537709 m!516891))

(declare-fun m!516893 () Bool)

(assert (=> b!537709 m!516893))

(assert (=> b!537709 m!516893))

(assert (=> b!537709 m!516891))

(declare-fun m!516895 () Bool)

(assert (=> b!537709 m!516895))

(declare-fun m!516897 () Bool)

(assert (=> start!48832 m!516897))

(declare-fun m!516899 () Bool)

(assert (=> start!48832 m!516899))

(declare-fun m!516901 () Bool)

(assert (=> b!537705 m!516901))

(declare-fun m!516903 () Bool)

(assert (=> b!537714 m!516903))

(declare-fun m!516905 () Bool)

(assert (=> b!537713 m!516905))

(assert (=> b!537706 m!516891))

(assert (=> b!537706 m!516891))

(declare-fun m!516907 () Bool)

(assert (=> b!537706 m!516907))

(assert (=> b!537716 m!516891))

(assert (=> b!537716 m!516891))

(declare-fun m!516909 () Bool)

(assert (=> b!537716 m!516909))

(declare-fun m!516911 () Bool)

(assert (=> b!537704 m!516911))

(assert (=> b!537704 m!516891))

(declare-fun m!516913 () Bool)

(assert (=> b!537707 m!516913))

(declare-fun m!516915 () Bool)

(assert (=> b!537712 m!516915))

(assert (=> b!537712 m!516891))

(assert (=> b!537711 m!516891))

(assert (=> b!537711 m!516891))

(declare-fun m!516917 () Bool)

(assert (=> b!537711 m!516917))

(declare-fun m!516919 () Bool)

(assert (=> b!537710 m!516919))

(push 1)

(assert (not b!537716))

(assert (not b!537707))

(assert (not b!537714))

(assert (not b!537706))

(assert (not b!537711))

(assert (not b!537713))

