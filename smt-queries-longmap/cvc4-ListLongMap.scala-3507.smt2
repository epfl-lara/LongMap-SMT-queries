; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48602 () Bool)

(assert start!48602)

(declare-fun b!533635 () Bool)

(declare-fun res!328988 () Bool)

(declare-fun e!310379 () Bool)

(assert (=> b!533635 (=> (not res!328988) (not e!310379))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33824 0))(
  ( (array!33825 (arr!16251 (Array (_ BitVec 32) (_ BitVec 64))) (size!16616 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33824)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533635 (= res!328988 (and (= (size!16616 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16616 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16616 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533636 () Bool)

(declare-fun res!328989 () Bool)

(declare-fun e!310378 () Bool)

(assert (=> b!533636 (=> (not res!328989) (not e!310378))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4706 0))(
  ( (MissingZero!4706 (index!21048 (_ BitVec 32))) (Found!4706 (index!21049 (_ BitVec 32))) (Intermediate!4706 (undefined!5518 Bool) (index!21050 (_ BitVec 32)) (x!50020 (_ BitVec 32))) (Undefined!4706) (MissingVacant!4706 (index!21051 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33824 (_ BitVec 32)) SeekEntryResult!4706)

(assert (=> b!533636 (= res!328989 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16251 a!3154) j!147) a!3154 mask!3216) (Intermediate!4706 false resIndex!32 resX!32)))))

(declare-fun res!328985 () Bool)

(assert (=> start!48602 (=> (not res!328985) (not e!310379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48602 (= res!328985 (validMask!0 mask!3216))))

(assert (=> start!48602 e!310379))

(assert (=> start!48602 true))

(declare-fun array_inv!12134 (array!33824) Bool)

(assert (=> start!48602 (array_inv!12134 a!3154)))

(declare-fun b!533637 () Bool)

(declare-fun res!328984 () Bool)

(assert (=> b!533637 (=> (not res!328984) (not e!310379))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533637 (= res!328984 (validKeyInArray!0 k!1998))))

(declare-fun b!533638 () Bool)

(declare-fun res!328986 () Bool)

(assert (=> b!533638 (=> (not res!328986) (not e!310378))))

(assert (=> b!533638 (= res!328986 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16616 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16616 a!3154)) (= (select (arr!16251 a!3154) resIndex!32) (select (arr!16251 a!3154) j!147))))))

(declare-fun b!533639 () Bool)

(assert (=> b!533639 (= e!310378 false)))

(declare-fun lt!245293 () SeekEntryResult!4706)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533639 (= lt!245293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16251 a!3154) j!147) mask!3216) (select (arr!16251 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533640 () Bool)

(assert (=> b!533640 (= e!310379 e!310378)))

(declare-fun res!328982 () Bool)

(assert (=> b!533640 (=> (not res!328982) (not e!310378))))

(declare-fun lt!245292 () SeekEntryResult!4706)

(assert (=> b!533640 (= res!328982 (or (= lt!245292 (MissingZero!4706 i!1153)) (= lt!245292 (MissingVacant!4706 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33824 (_ BitVec 32)) SeekEntryResult!4706)

(assert (=> b!533640 (= lt!245292 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533641 () Bool)

(declare-fun res!328987 () Bool)

(assert (=> b!533641 (=> (not res!328987) (not e!310379))))

(declare-fun arrayContainsKey!0 (array!33824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533641 (= res!328987 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533642 () Bool)

(declare-fun res!328983 () Bool)

(assert (=> b!533642 (=> (not res!328983) (not e!310379))))

(assert (=> b!533642 (= res!328983 (validKeyInArray!0 (select (arr!16251 a!3154) j!147)))))

(declare-fun b!533643 () Bool)

(declare-fun res!328991 () Bool)

(assert (=> b!533643 (=> (not res!328991) (not e!310378))))

(declare-datatypes ((List!10409 0))(
  ( (Nil!10406) (Cons!10405 (h!11348 (_ BitVec 64)) (t!16628 List!10409)) )
))
(declare-fun arrayNoDuplicates!0 (array!33824 (_ BitVec 32) List!10409) Bool)

(assert (=> b!533643 (= res!328991 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10406))))

(declare-fun b!533644 () Bool)

(declare-fun res!328990 () Bool)

(assert (=> b!533644 (=> (not res!328990) (not e!310378))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33824 (_ BitVec 32)) Bool)

(assert (=> b!533644 (= res!328990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48602 res!328985) b!533635))

(assert (= (and b!533635 res!328988) b!533642))

(assert (= (and b!533642 res!328983) b!533637))

(assert (= (and b!533637 res!328984) b!533641))

(assert (= (and b!533641 res!328987) b!533640))

(assert (= (and b!533640 res!328982) b!533644))

(assert (= (and b!533644 res!328990) b!533643))

(assert (= (and b!533643 res!328991) b!533638))

(assert (= (and b!533638 res!328986) b!533636))

(assert (= (and b!533636 res!328989) b!533639))

(declare-fun m!512943 () Bool)

(assert (=> b!533637 m!512943))

(declare-fun m!512945 () Bool)

(assert (=> b!533642 m!512945))

(assert (=> b!533642 m!512945))

(declare-fun m!512947 () Bool)

(assert (=> b!533642 m!512947))

(declare-fun m!512949 () Bool)

(assert (=> b!533644 m!512949))

(assert (=> b!533639 m!512945))

(assert (=> b!533639 m!512945))

(declare-fun m!512951 () Bool)

(assert (=> b!533639 m!512951))

(assert (=> b!533639 m!512951))

(assert (=> b!533639 m!512945))

(declare-fun m!512953 () Bool)

(assert (=> b!533639 m!512953))

(declare-fun m!512955 () Bool)

(assert (=> b!533638 m!512955))

(assert (=> b!533638 m!512945))

(declare-fun m!512957 () Bool)

(assert (=> b!533643 m!512957))

(declare-fun m!512959 () Bool)

(assert (=> start!48602 m!512959))

(declare-fun m!512961 () Bool)

(assert (=> start!48602 m!512961))

(assert (=> b!533636 m!512945))

(assert (=> b!533636 m!512945))

(declare-fun m!512963 () Bool)

(assert (=> b!533636 m!512963))

(declare-fun m!512965 () Bool)

(assert (=> b!533640 m!512965))

(declare-fun m!512967 () Bool)

(assert (=> b!533641 m!512967))

(push 1)

(assert (not b!533643))

(assert (not b!533636))

(assert (not b!533644))

(assert (not b!533641))

(assert (not b!533639))

(assert (not b!533642))

(assert (not b!533640))

(assert (not b!533637))

(assert (not start!48602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

