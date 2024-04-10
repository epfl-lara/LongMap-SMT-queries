; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48710 () Bool)

(assert start!48710)

(declare-fun b!535391 () Bool)

(declare-fun res!330597 () Bool)

(declare-fun e!311021 () Bool)

(assert (=> b!535391 (=> (not res!330597) (not e!311021))))

(declare-datatypes ((array!33922 0))(
  ( (array!33923 (arr!16300 (Array (_ BitVec 32) (_ BitVec 64))) (size!16664 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33922)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535391 (= res!330597 (validKeyInArray!0 (select (arr!16300 a!3154) j!147)))))

(declare-fun b!535392 () Bool)

(declare-fun res!330604 () Bool)

(assert (=> b!535392 (=> (not res!330604) (not e!311021))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535392 (= res!330604 (and (= (size!16664 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16664 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16664 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535393 () Bool)

(declare-fun e!311022 () Bool)

(assert (=> b!535393 (= e!311021 e!311022)))

(declare-fun res!330596 () Bool)

(assert (=> b!535393 (=> (not res!330596) (not e!311022))))

(declare-datatypes ((SeekEntryResult!4758 0))(
  ( (MissingZero!4758 (index!21256 (_ BitVec 32))) (Found!4758 (index!21257 (_ BitVec 32))) (Intermediate!4758 (undefined!5570 Bool) (index!21258 (_ BitVec 32)) (x!50205 (_ BitVec 32))) (Undefined!4758) (MissingVacant!4758 (index!21259 (_ BitVec 32))) )
))
(declare-fun lt!245815 () SeekEntryResult!4758)

(assert (=> b!535393 (= res!330596 (or (= lt!245815 (MissingZero!4758 i!1153)) (= lt!245815 (MissingVacant!4758 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33922 (_ BitVec 32)) SeekEntryResult!4758)

(assert (=> b!535393 (= lt!245815 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!535394 () Bool)

(declare-fun res!330601 () Bool)

(assert (=> b!535394 (=> (not res!330601) (not e!311021))))

(declare-fun arrayContainsKey!0 (array!33922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535394 (= res!330601 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535395 () Bool)

(assert (=> b!535395 (= e!311022 false)))

(declare-fun lt!245814 () SeekEntryResult!4758)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33922 (_ BitVec 32)) SeekEntryResult!4758)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535395 (= lt!245814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16300 a!3154) j!147) mask!3216) (select (arr!16300 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535396 () Bool)

(declare-fun res!330600 () Bool)

(assert (=> b!535396 (=> (not res!330600) (not e!311022))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535396 (= res!330600 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16664 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16664 a!3154)) (= (select (arr!16300 a!3154) resIndex!32) (select (arr!16300 a!3154) j!147))))))

(declare-fun b!535397 () Bool)

(declare-fun res!330605 () Bool)

(assert (=> b!535397 (=> (not res!330605) (not e!311021))))

(assert (=> b!535397 (= res!330605 (validKeyInArray!0 k0!1998))))

(declare-fun b!535398 () Bool)

(declare-fun res!330602 () Bool)

(assert (=> b!535398 (=> (not res!330602) (not e!311022))))

(declare-datatypes ((List!10419 0))(
  ( (Nil!10416) (Cons!10415 (h!11358 (_ BitVec 64)) (t!16647 List!10419)) )
))
(declare-fun arrayNoDuplicates!0 (array!33922 (_ BitVec 32) List!10419) Bool)

(assert (=> b!535398 (= res!330602 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10416))))

(declare-fun b!535399 () Bool)

(declare-fun res!330598 () Bool)

(assert (=> b!535399 (=> (not res!330598) (not e!311022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33922 (_ BitVec 32)) Bool)

(assert (=> b!535399 (= res!330598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535400 () Bool)

(declare-fun res!330599 () Bool)

(assert (=> b!535400 (=> (not res!330599) (not e!311022))))

(assert (=> b!535400 (= res!330599 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16300 a!3154) j!147) a!3154 mask!3216) (Intermediate!4758 false resIndex!32 resX!32)))))

(declare-fun res!330603 () Bool)

(assert (=> start!48710 (=> (not res!330603) (not e!311021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48710 (= res!330603 (validMask!0 mask!3216))))

(assert (=> start!48710 e!311021))

(assert (=> start!48710 true))

(declare-fun array_inv!12096 (array!33922) Bool)

(assert (=> start!48710 (array_inv!12096 a!3154)))

(assert (= (and start!48710 res!330603) b!535392))

(assert (= (and b!535392 res!330604) b!535391))

(assert (= (and b!535391 res!330597) b!535397))

(assert (= (and b!535397 res!330605) b!535394))

(assert (= (and b!535394 res!330601) b!535393))

(assert (= (and b!535393 res!330596) b!535399))

(assert (= (and b!535399 res!330598) b!535398))

(assert (= (and b!535398 res!330602) b!535396))

(assert (= (and b!535396 res!330600) b!535400))

(assert (= (and b!535400 res!330599) b!535395))

(declare-fun m!514985 () Bool)

(assert (=> b!535391 m!514985))

(assert (=> b!535391 m!514985))

(declare-fun m!514987 () Bool)

(assert (=> b!535391 m!514987))

(declare-fun m!514989 () Bool)

(assert (=> start!48710 m!514989))

(declare-fun m!514991 () Bool)

(assert (=> start!48710 m!514991))

(declare-fun m!514993 () Bool)

(assert (=> b!535393 m!514993))

(declare-fun m!514995 () Bool)

(assert (=> b!535399 m!514995))

(declare-fun m!514997 () Bool)

(assert (=> b!535398 m!514997))

(declare-fun m!514999 () Bool)

(assert (=> b!535394 m!514999))

(declare-fun m!515001 () Bool)

(assert (=> b!535397 m!515001))

(declare-fun m!515003 () Bool)

(assert (=> b!535396 m!515003))

(assert (=> b!535396 m!514985))

(assert (=> b!535395 m!514985))

(assert (=> b!535395 m!514985))

(declare-fun m!515005 () Bool)

(assert (=> b!535395 m!515005))

(assert (=> b!535395 m!515005))

(assert (=> b!535395 m!514985))

(declare-fun m!515007 () Bool)

(assert (=> b!535395 m!515007))

(assert (=> b!535400 m!514985))

(assert (=> b!535400 m!514985))

(declare-fun m!515009 () Bool)

(assert (=> b!535400 m!515009))

(check-sat (not start!48710) (not b!535400) (not b!535395) (not b!535391) (not b!535398) (not b!535394) (not b!535393) (not b!535397) (not b!535399))
(check-sat)
