; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48378 () Bool)

(assert start!48378)

(declare-fun res!327075 () Bool)

(declare-fun e!309644 () Bool)

(assert (=> start!48378 (=> (not res!327075) (not e!309644))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48378 (= res!327075 (validMask!0 mask!3216))))

(assert (=> start!48378 e!309644))

(assert (=> start!48378 true))

(declare-datatypes ((array!33686 0))(
  ( (array!33687 (arr!16185 (Array (_ BitVec 32) (_ BitVec 64))) (size!16549 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33686)

(declare-fun array_inv!11981 (array!33686) Bool)

(assert (=> start!48378 (array_inv!11981 a!3154)))

(declare-fun b!531584 () Bool)

(declare-fun e!309643 () Bool)

(assert (=> b!531584 (= e!309644 e!309643)))

(declare-fun res!327078 () Bool)

(assert (=> b!531584 (=> (not res!327078) (not e!309643))))

(declare-datatypes ((SeekEntryResult!4643 0))(
  ( (MissingZero!4643 (index!20796 (_ BitVec 32))) (Found!4643 (index!20797 (_ BitVec 32))) (Intermediate!4643 (undefined!5455 Bool) (index!20798 (_ BitVec 32)) (x!49777 (_ BitVec 32))) (Undefined!4643) (MissingVacant!4643 (index!20799 (_ BitVec 32))) )
))
(declare-fun lt!245034 () SeekEntryResult!4643)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531584 (= res!327078 (or (= lt!245034 (MissingZero!4643 i!1153)) (= lt!245034 (MissingVacant!4643 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33686 (_ BitVec 32)) SeekEntryResult!4643)

(assert (=> b!531584 (= lt!245034 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!531585 () Bool)

(declare-fun res!327080 () Bool)

(assert (=> b!531585 (=> (not res!327080) (not e!309644))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531585 (= res!327080 (validKeyInArray!0 (select (arr!16185 a!3154) j!147)))))

(declare-fun b!531586 () Bool)

(assert (=> b!531586 (= e!309643 false)))

(declare-fun lt!245035 () Bool)

(declare-datatypes ((List!10304 0))(
  ( (Nil!10301) (Cons!10300 (h!11240 (_ BitVec 64)) (t!16532 List!10304)) )
))
(declare-fun arrayNoDuplicates!0 (array!33686 (_ BitVec 32) List!10304) Bool)

(assert (=> b!531586 (= lt!245035 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10301))))

(declare-fun b!531587 () Bool)

(declare-fun res!327076 () Bool)

(assert (=> b!531587 (=> (not res!327076) (not e!309644))))

(declare-fun arrayContainsKey!0 (array!33686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531587 (= res!327076 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531588 () Bool)

(declare-fun res!327079 () Bool)

(assert (=> b!531588 (=> (not res!327079) (not e!309644))))

(assert (=> b!531588 (= res!327079 (validKeyInArray!0 k!1998))))

(declare-fun b!531589 () Bool)

(declare-fun res!327077 () Bool)

(assert (=> b!531589 (=> (not res!327077) (not e!309643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33686 (_ BitVec 32)) Bool)

(assert (=> b!531589 (= res!327077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531590 () Bool)

(declare-fun res!327074 () Bool)

(assert (=> b!531590 (=> (not res!327074) (not e!309644))))

(assert (=> b!531590 (= res!327074 (and (= (size!16549 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16549 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16549 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48378 res!327075) b!531590))

(assert (= (and b!531590 res!327074) b!531585))

(assert (= (and b!531585 res!327080) b!531588))

(assert (= (and b!531588 res!327079) b!531587))

(assert (= (and b!531587 res!327076) b!531584))

(assert (= (and b!531584 res!327078) b!531589))

(assert (= (and b!531589 res!327077) b!531586))

(declare-fun m!511971 () Bool)

(assert (=> start!48378 m!511971))

(declare-fun m!511973 () Bool)

(assert (=> start!48378 m!511973))

(declare-fun m!511975 () Bool)

(assert (=> b!531585 m!511975))

(assert (=> b!531585 m!511975))

(declare-fun m!511977 () Bool)

(assert (=> b!531585 m!511977))

(declare-fun m!511979 () Bool)

(assert (=> b!531587 m!511979))

(declare-fun m!511981 () Bool)

(assert (=> b!531586 m!511981))

(declare-fun m!511983 () Bool)

(assert (=> b!531588 m!511983))

(declare-fun m!511985 () Bool)

(assert (=> b!531584 m!511985))

(declare-fun m!511987 () Bool)

(assert (=> b!531589 m!511987))

(push 1)

