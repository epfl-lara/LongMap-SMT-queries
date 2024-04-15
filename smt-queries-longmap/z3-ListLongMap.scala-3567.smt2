; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49014 () Bool)

(assert start!49014)

(declare-fun b!539995 () Bool)

(declare-fun res!335191 () Bool)

(declare-fun e!312843 () Bool)

(assert (=> b!539995 (=> (not res!335191) (not e!312843))))

(declare-datatypes ((array!34185 0))(
  ( (array!34186 (arr!16430 (Array (_ BitVec 32) (_ BitVec 64))) (size!16795 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34185)

(declare-datatypes ((List!10588 0))(
  ( (Nil!10585) (Cons!10584 (h!11530 (_ BitVec 64)) (t!16807 List!10588)) )
))
(declare-fun arrayNoDuplicates!0 (array!34185 (_ BitVec 32) List!10588) Bool)

(assert (=> b!539995 (= res!335191 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10585))))

(declare-fun b!539996 () Bool)

(assert (=> b!539996 (= e!312843 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4885 0))(
  ( (MissingZero!4885 (index!21764 (_ BitVec 32))) (Found!4885 (index!21765 (_ BitVec 32))) (Intermediate!4885 (undefined!5697 Bool) (index!21766 (_ BitVec 32)) (x!50685 (_ BitVec 32))) (Undefined!4885) (MissingVacant!4885 (index!21767 (_ BitVec 32))) )
))
(declare-fun lt!247111 () SeekEntryResult!4885)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34185 (_ BitVec 32)) SeekEntryResult!4885)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539996 (= lt!247111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16430 a!3154) j!147) mask!3216) (select (arr!16430 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539997 () Bool)

(declare-fun res!335190 () Bool)

(assert (=> b!539997 (=> (not res!335190) (not e!312843))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539997 (= res!335190 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16430 a!3154) j!147) a!3154 mask!3216) (Intermediate!4885 false resIndex!32 resX!32)))))

(declare-fun b!539998 () Bool)

(declare-fun res!335183 () Bool)

(declare-fun e!312841 () Bool)

(assert (=> b!539998 (=> (not res!335183) (not e!312841))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539998 (= res!335183 (and (= (size!16795 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16795 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16795 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539999 () Bool)

(declare-fun res!335189 () Bool)

(assert (=> b!539999 (=> (not res!335189) (not e!312841))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539999 (= res!335189 (validKeyInArray!0 k0!1998))))

(declare-fun b!540000 () Bool)

(assert (=> b!540000 (= e!312841 e!312843)))

(declare-fun res!335184 () Bool)

(assert (=> b!540000 (=> (not res!335184) (not e!312843))))

(declare-fun lt!247110 () SeekEntryResult!4885)

(assert (=> b!540000 (= res!335184 (or (= lt!247110 (MissingZero!4885 i!1153)) (= lt!247110 (MissingVacant!4885 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34185 (_ BitVec 32)) SeekEntryResult!4885)

(assert (=> b!540000 (= lt!247110 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540001 () Bool)

(declare-fun res!335187 () Bool)

(assert (=> b!540001 (=> (not res!335187) (not e!312843))))

(assert (=> b!540001 (= res!335187 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16795 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16795 a!3154)) (= (select (arr!16430 a!3154) resIndex!32) (select (arr!16430 a!3154) j!147))))))

(declare-fun b!540002 () Bool)

(declare-fun res!335192 () Bool)

(assert (=> b!540002 (=> (not res!335192) (not e!312843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34185 (_ BitVec 32)) Bool)

(assert (=> b!540002 (= res!335192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540003 () Bool)

(declare-fun res!335185 () Bool)

(assert (=> b!540003 (=> (not res!335185) (not e!312841))))

(assert (=> b!540003 (= res!335185 (validKeyInArray!0 (select (arr!16430 a!3154) j!147)))))

(declare-fun res!335188 () Bool)

(assert (=> start!49014 (=> (not res!335188) (not e!312841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49014 (= res!335188 (validMask!0 mask!3216))))

(assert (=> start!49014 e!312841))

(assert (=> start!49014 true))

(declare-fun array_inv!12313 (array!34185) Bool)

(assert (=> start!49014 (array_inv!12313 a!3154)))

(declare-fun b!540004 () Bool)

(declare-fun res!335186 () Bool)

(assert (=> b!540004 (=> (not res!335186) (not e!312841))))

(declare-fun arrayContainsKey!0 (array!34185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540004 (= res!335186 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49014 res!335188) b!539998))

(assert (= (and b!539998 res!335183) b!540003))

(assert (= (and b!540003 res!335185) b!539999))

(assert (= (and b!539999 res!335189) b!540004))

(assert (= (and b!540004 res!335186) b!540000))

(assert (= (and b!540000 res!335184) b!540002))

(assert (= (and b!540002 res!335192) b!539995))

(assert (= (and b!539995 res!335191) b!540001))

(assert (= (and b!540001 res!335187) b!539997))

(assert (= (and b!539997 res!335190) b!539996))

(declare-fun m!518335 () Bool)

(assert (=> b!540001 m!518335))

(declare-fun m!518337 () Bool)

(assert (=> b!540001 m!518337))

(declare-fun m!518339 () Bool)

(assert (=> b!540004 m!518339))

(assert (=> b!540003 m!518337))

(assert (=> b!540003 m!518337))

(declare-fun m!518341 () Bool)

(assert (=> b!540003 m!518341))

(assert (=> b!539997 m!518337))

(assert (=> b!539997 m!518337))

(declare-fun m!518343 () Bool)

(assert (=> b!539997 m!518343))

(declare-fun m!518345 () Bool)

(assert (=> start!49014 m!518345))

(declare-fun m!518347 () Bool)

(assert (=> start!49014 m!518347))

(declare-fun m!518349 () Bool)

(assert (=> b!539999 m!518349))

(declare-fun m!518351 () Bool)

(assert (=> b!540002 m!518351))

(assert (=> b!539996 m!518337))

(assert (=> b!539996 m!518337))

(declare-fun m!518353 () Bool)

(assert (=> b!539996 m!518353))

(assert (=> b!539996 m!518353))

(assert (=> b!539996 m!518337))

(declare-fun m!518355 () Bool)

(assert (=> b!539996 m!518355))

(declare-fun m!518357 () Bool)

(assert (=> b!539995 m!518357))

(declare-fun m!518359 () Bool)

(assert (=> b!540000 m!518359))

(check-sat (not b!540000) (not b!540002) (not b!539995) (not b!539997) (not b!540003) (not b!540004) (not start!49014) (not b!539996) (not b!539999))
(check-sat)
