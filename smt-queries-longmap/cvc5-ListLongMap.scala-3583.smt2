; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49284 () Bool)

(assert start!49284)

(declare-fun b!542610 () Bool)

(declare-fun res!337167 () Bool)

(declare-fun e!314025 () Bool)

(assert (=> b!542610 (=> (not res!337167) (not e!314025))))

(declare-datatypes ((array!34292 0))(
  ( (array!34293 (arr!16479 (Array (_ BitVec 32) (_ BitVec 64))) (size!16843 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34292)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542610 (= res!337167 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542611 () Bool)

(declare-fun e!314022 () Bool)

(assert (=> b!542611 (= e!314022 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!247965 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542611 (= lt!247965 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542612 () Bool)

(declare-fun e!314024 () Bool)

(assert (=> b!542612 (= e!314024 e!314022)))

(declare-fun res!337169 () Bool)

(assert (=> b!542612 (=> (not res!337169) (not e!314022))))

(declare-datatypes ((SeekEntryResult!4937 0))(
  ( (MissingZero!4937 (index!21972 (_ BitVec 32))) (Found!4937 (index!21973 (_ BitVec 32))) (Intermediate!4937 (undefined!5749 Bool) (index!21974 (_ BitVec 32)) (x!50888 (_ BitVec 32))) (Undefined!4937) (MissingVacant!4937 (index!21975 (_ BitVec 32))) )
))
(declare-fun lt!247964 () SeekEntryResult!4937)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542612 (= res!337169 (= lt!247964 (Intermediate!4937 false resIndex!32 resX!32)))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34292 (_ BitVec 32)) SeekEntryResult!4937)

(assert (=> b!542612 (= lt!247964 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16479 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542613 () Bool)

(declare-fun res!337164 () Bool)

(assert (=> b!542613 (=> (not res!337164) (not e!314025))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542613 (= res!337164 (and (= (size!16843 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16843 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16843 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542614 () Bool)

(declare-fun res!337162 () Bool)

(assert (=> b!542614 (=> (not res!337162) (not e!314022))))

(assert (=> b!542614 (= res!337162 (and (not (= (select (arr!16479 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16479 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16479 a!3154) index!1177) (select (arr!16479 a!3154) j!147)))))))

(declare-fun b!542615 () Bool)

(declare-fun res!337161 () Bool)

(assert (=> b!542615 (=> (not res!337161) (not e!314024))))

(declare-datatypes ((List!10598 0))(
  ( (Nil!10595) (Cons!10594 (h!11549 (_ BitVec 64)) (t!16826 List!10598)) )
))
(declare-fun arrayNoDuplicates!0 (array!34292 (_ BitVec 32) List!10598) Bool)

(assert (=> b!542615 (= res!337161 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10595))))

(declare-fun b!542616 () Bool)

(declare-fun res!337163 () Bool)

(assert (=> b!542616 (=> (not res!337163) (not e!314025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542616 (= res!337163 (validKeyInArray!0 (select (arr!16479 a!3154) j!147)))))

(declare-fun b!542618 () Bool)

(declare-fun res!337172 () Bool)

(assert (=> b!542618 (=> (not res!337172) (not e!314024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34292 (_ BitVec 32)) Bool)

(assert (=> b!542618 (= res!337172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542619 () Bool)

(declare-fun res!337170 () Bool)

(assert (=> b!542619 (=> (not res!337170) (not e!314025))))

(assert (=> b!542619 (= res!337170 (validKeyInArray!0 k!1998))))

(declare-fun b!542620 () Bool)

(declare-fun res!337166 () Bool)

(assert (=> b!542620 (=> (not res!337166) (not e!314022))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542620 (= res!337166 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16479 a!3154) j!147) mask!3216) (select (arr!16479 a!3154) j!147) a!3154 mask!3216) lt!247964))))

(declare-fun b!542621 () Bool)

(declare-fun res!337165 () Bool)

(assert (=> b!542621 (=> (not res!337165) (not e!314024))))

(assert (=> b!542621 (= res!337165 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16843 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16843 a!3154)) (= (select (arr!16479 a!3154) resIndex!32) (select (arr!16479 a!3154) j!147))))))

(declare-fun res!337168 () Bool)

(assert (=> start!49284 (=> (not res!337168) (not e!314025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49284 (= res!337168 (validMask!0 mask!3216))))

(assert (=> start!49284 e!314025))

(assert (=> start!49284 true))

(declare-fun array_inv!12275 (array!34292) Bool)

(assert (=> start!49284 (array_inv!12275 a!3154)))

(declare-fun b!542617 () Bool)

(assert (=> b!542617 (= e!314025 e!314024)))

(declare-fun res!337171 () Bool)

(assert (=> b!542617 (=> (not res!337171) (not e!314024))))

(declare-fun lt!247966 () SeekEntryResult!4937)

(assert (=> b!542617 (= res!337171 (or (= lt!247966 (MissingZero!4937 i!1153)) (= lt!247966 (MissingVacant!4937 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34292 (_ BitVec 32)) SeekEntryResult!4937)

(assert (=> b!542617 (= lt!247966 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!49284 res!337168) b!542613))

(assert (= (and b!542613 res!337164) b!542616))

(assert (= (and b!542616 res!337163) b!542619))

(assert (= (and b!542619 res!337170) b!542610))

(assert (= (and b!542610 res!337167) b!542617))

(assert (= (and b!542617 res!337171) b!542618))

(assert (= (and b!542618 res!337172) b!542615))

(assert (= (and b!542615 res!337161) b!542621))

(assert (= (and b!542621 res!337165) b!542612))

(assert (= (and b!542612 res!337169) b!542620))

(assert (= (and b!542620 res!337166) b!542614))

(assert (= (and b!542614 res!337162) b!542611))

(declare-fun m!520839 () Bool)

(assert (=> b!542610 m!520839))

(declare-fun m!520841 () Bool)

(assert (=> start!49284 m!520841))

(declare-fun m!520843 () Bool)

(assert (=> start!49284 m!520843))

(declare-fun m!520845 () Bool)

(assert (=> b!542611 m!520845))

(declare-fun m!520847 () Bool)

(assert (=> b!542620 m!520847))

(assert (=> b!542620 m!520847))

(declare-fun m!520849 () Bool)

(assert (=> b!542620 m!520849))

(assert (=> b!542620 m!520849))

(assert (=> b!542620 m!520847))

(declare-fun m!520851 () Bool)

(assert (=> b!542620 m!520851))

(declare-fun m!520853 () Bool)

(assert (=> b!542617 m!520853))

(assert (=> b!542612 m!520847))

(assert (=> b!542612 m!520847))

(declare-fun m!520855 () Bool)

(assert (=> b!542612 m!520855))

(declare-fun m!520857 () Bool)

(assert (=> b!542614 m!520857))

(assert (=> b!542614 m!520847))

(declare-fun m!520859 () Bool)

(assert (=> b!542615 m!520859))

(declare-fun m!520861 () Bool)

(assert (=> b!542619 m!520861))

(declare-fun m!520863 () Bool)

(assert (=> b!542621 m!520863))

(assert (=> b!542621 m!520847))

(assert (=> b!542616 m!520847))

(assert (=> b!542616 m!520847))

(declare-fun m!520865 () Bool)

(assert (=> b!542616 m!520865))

(declare-fun m!520867 () Bool)

(assert (=> b!542618 m!520867))

(push 1)

