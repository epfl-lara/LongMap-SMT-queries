; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32216 () Bool)

(assert start!32216)

(declare-fun b!320794 () Bool)

(declare-fun res!174920 () Bool)

(declare-fun e!198979 () Bool)

(assert (=> b!320794 (=> (not res!174920) (not e!198979))))

(declare-datatypes ((array!16406 0))(
  ( (array!16407 (arr!7762 (Array (_ BitVec 32) (_ BitVec 64))) (size!8114 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16406)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320794 (= res!174920 (and (= (select (arr!7762 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8114 a!3305))))))

(declare-fun b!320795 () Bool)

(declare-fun res!174921 () Bool)

(assert (=> b!320795 (=> (not res!174921) (not e!198979))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16406 (_ BitVec 32)) Bool)

(assert (=> b!320795 (= res!174921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!320796 () Bool)

(declare-fun res!174916 () Bool)

(assert (=> b!320796 (=> (not res!174916) (not e!198979))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320796 (= res!174916 (validKeyInArray!0 k!2497))))

(declare-fun b!320797 () Bool)

(declare-fun res!174914 () Bool)

(assert (=> b!320797 (=> (not res!174914) (not e!198979))))

(declare-datatypes ((SeekEntryResult!2893 0))(
  ( (MissingZero!2893 (index!13748 (_ BitVec 32))) (Found!2893 (index!13749 (_ BitVec 32))) (Intermediate!2893 (undefined!3705 Bool) (index!13750 (_ BitVec 32)) (x!32016 (_ BitVec 32))) (Undefined!2893) (MissingVacant!2893 (index!13751 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16406 (_ BitVec 32)) SeekEntryResult!2893)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320797 (= res!174914 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) (Intermediate!2893 false resIndex!58 resX!58)))))

(declare-fun b!320798 () Bool)

(declare-fun res!174919 () Bool)

(assert (=> b!320798 (=> (not res!174919) (not e!198979))))

(assert (=> b!320798 (= res!174919 (and (= (size!8114 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8114 a!3305))))))

(declare-fun res!174915 () Bool)

(assert (=> start!32216 (=> (not res!174915) (not e!198979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32216 (= res!174915 (validMask!0 mask!3777))))

(assert (=> start!32216 e!198979))

(declare-fun array_inv!5725 (array!16406) Bool)

(assert (=> start!32216 (array_inv!5725 a!3305)))

(assert (=> start!32216 true))

(declare-fun b!320799 () Bool)

(declare-fun res!174918 () Bool)

(assert (=> b!320799 (=> (not res!174918) (not e!198979))))

(declare-fun arrayContainsKey!0 (array!16406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320799 (= res!174918 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320800 () Bool)

(declare-fun res!174917 () Bool)

(assert (=> b!320800 (=> (not res!174917) (not e!198979))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16406 (_ BitVec 32)) SeekEntryResult!2893)

(assert (=> b!320800 (= res!174917 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2893 i!1250)))))

(declare-fun b!320801 () Bool)

(assert (=> b!320801 (= e!198979 false)))

(declare-fun lt!156120 () SeekEntryResult!2893)

(assert (=> b!320801 (= lt!156120 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777))))

(assert (= (and start!32216 res!174915) b!320798))

(assert (= (and b!320798 res!174919) b!320796))

(assert (= (and b!320796 res!174916) b!320799))

(assert (= (and b!320799 res!174918) b!320800))

(assert (= (and b!320800 res!174917) b!320795))

(assert (= (and b!320795 res!174921) b!320797))

(assert (= (and b!320797 res!174914) b!320794))

(assert (= (and b!320794 res!174920) b!320801))

(declare-fun m!329055 () Bool)

(assert (=> b!320797 m!329055))

(assert (=> b!320797 m!329055))

(declare-fun m!329057 () Bool)

(assert (=> b!320797 m!329057))

(declare-fun m!329059 () Bool)

(assert (=> b!320799 m!329059))

(declare-fun m!329061 () Bool)

(assert (=> b!320801 m!329061))

(declare-fun m!329063 () Bool)

(assert (=> b!320800 m!329063))

(declare-fun m!329065 () Bool)

(assert (=> b!320794 m!329065))

(declare-fun m!329067 () Bool)

(assert (=> b!320795 m!329067))

(declare-fun m!329069 () Bool)

(assert (=> b!320796 m!329069))

(declare-fun m!329071 () Bool)

(assert (=> start!32216 m!329071))

(declare-fun m!329073 () Bool)

(assert (=> start!32216 m!329073))

(push 1)

