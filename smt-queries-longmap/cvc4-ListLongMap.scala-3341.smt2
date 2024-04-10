; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46042 () Bool)

(assert start!46042)

(declare-fun b!509865 () Bool)

(declare-fun res!310710 () Bool)

(declare-fun e!298113 () Bool)

(assert (=> b!509865 (=> (not res!310710) (not e!298113))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509865 (= res!310710 (validKeyInArray!0 k!2280))))

(declare-fun b!509866 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32753 0))(
  ( (array!32754 (arr!15755 (Array (_ BitVec 32) (_ BitVec 64))) (size!16119 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32753)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!298111 () Bool)

(declare-datatypes ((SeekEntryResult!4222 0))(
  ( (MissingZero!4222 (index!19076 (_ BitVec 32))) (Found!4222 (index!19077 (_ BitVec 32))) (Intermediate!4222 (undefined!5034 Bool) (index!19078 (_ BitVec 32)) (x!48039 (_ BitVec 32))) (Undefined!4222) (MissingVacant!4222 (index!19079 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32753 (_ BitVec 32)) SeekEntryResult!4222)

(assert (=> b!509866 (= e!298111 (= (seekEntryOrOpen!0 (select (arr!15755 a!3235) j!176) a!3235 mask!3524) (Found!4222 j!176)))))

(declare-fun b!509867 () Bool)

(declare-fun res!310711 () Bool)

(assert (=> b!509867 (=> (not res!310711) (not e!298113))))

(assert (=> b!509867 (= res!310711 (validKeyInArray!0 (select (arr!15755 a!3235) j!176)))))

(declare-fun b!509869 () Bool)

(declare-fun res!310713 () Bool)

(declare-fun e!298112 () Bool)

(assert (=> b!509869 (=> (not res!310713) (not e!298112))))

(declare-datatypes ((List!9913 0))(
  ( (Nil!9910) (Cons!9909 (h!10786 (_ BitVec 64)) (t!16141 List!9913)) )
))
(declare-fun arrayNoDuplicates!0 (array!32753 (_ BitVec 32) List!9913) Bool)

(assert (=> b!509869 (= res!310713 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9910))))

(declare-fun b!509870 () Bool)

(assert (=> b!509870 (= e!298113 e!298112)))

(declare-fun res!310715 () Bool)

(assert (=> b!509870 (=> (not res!310715) (not e!298112))))

(declare-fun lt!233000 () SeekEntryResult!4222)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509870 (= res!310715 (or (= lt!233000 (MissingZero!4222 i!1204)) (= lt!233000 (MissingVacant!4222 i!1204))))))

(assert (=> b!509870 (= lt!233000 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509871 () Bool)

(declare-fun res!310718 () Bool)

(assert (=> b!509871 (=> (not res!310718) (not e!298113))))

(declare-fun arrayContainsKey!0 (array!32753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509871 (= res!310718 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509872 () Bool)

(declare-fun res!310714 () Bool)

(assert (=> b!509872 (=> (not res!310714) (not e!298113))))

(assert (=> b!509872 (= res!310714 (and (= (size!16119 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16119 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16119 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509873 () Bool)

(declare-fun res!310716 () Bool)

(assert (=> b!509873 (=> (not res!310716) (not e!298112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32753 (_ BitVec 32)) Bool)

(assert (=> b!509873 (= res!310716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!310712 () Bool)

(assert (=> start!46042 (=> (not res!310712) (not e!298113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46042 (= res!310712 (validMask!0 mask!3524))))

(assert (=> start!46042 e!298113))

(assert (=> start!46042 true))

(declare-fun array_inv!11551 (array!32753) Bool)

(assert (=> start!46042 (array_inv!11551 a!3235)))

(declare-fun b!509868 () Bool)

(assert (=> b!509868 (= e!298112 (not true))))

(declare-fun lt!233004 () (_ BitVec 32))

(declare-fun lt!233003 () SeekEntryResult!4222)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32753 (_ BitVec 32)) SeekEntryResult!4222)

(assert (=> b!509868 (= lt!233003 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233004 (select (store (arr!15755 a!3235) i!1204 k!2280) j!176) (array!32754 (store (arr!15755 a!3235) i!1204 k!2280) (size!16119 a!3235)) mask!3524))))

(declare-fun lt!233001 () (_ BitVec 32))

(declare-fun lt!233005 () SeekEntryResult!4222)

(assert (=> b!509868 (= lt!233005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233001 (select (arr!15755 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509868 (= lt!233004 (toIndex!0 (select (store (arr!15755 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509868 (= lt!233001 (toIndex!0 (select (arr!15755 a!3235) j!176) mask!3524))))

(assert (=> b!509868 e!298111))

(declare-fun res!310717 () Bool)

(assert (=> b!509868 (=> (not res!310717) (not e!298111))))

(assert (=> b!509868 (= res!310717 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15702 0))(
  ( (Unit!15703) )
))
(declare-fun lt!233002 () Unit!15702)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15702)

(assert (=> b!509868 (= lt!233002 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46042 res!310712) b!509872))

(assert (= (and b!509872 res!310714) b!509867))

(assert (= (and b!509867 res!310711) b!509865))

(assert (= (and b!509865 res!310710) b!509871))

(assert (= (and b!509871 res!310718) b!509870))

(assert (= (and b!509870 res!310715) b!509873))

(assert (= (and b!509873 res!310716) b!509869))

(assert (= (and b!509869 res!310713) b!509868))

(assert (= (and b!509868 res!310717) b!509866))

(declare-fun m!490893 () Bool)

(assert (=> start!46042 m!490893))

(declare-fun m!490895 () Bool)

(assert (=> start!46042 m!490895))

(declare-fun m!490897 () Bool)

(assert (=> b!509873 m!490897))

(declare-fun m!490899 () Bool)

(assert (=> b!509868 m!490899))

(declare-fun m!490901 () Bool)

(assert (=> b!509868 m!490901))

(declare-fun m!490903 () Bool)

(assert (=> b!509868 m!490903))

(declare-fun m!490905 () Bool)

(assert (=> b!509868 m!490905))

(declare-fun m!490907 () Bool)

(assert (=> b!509868 m!490907))

(declare-fun m!490909 () Bool)

(assert (=> b!509868 m!490909))

(assert (=> b!509868 m!490907))

(declare-fun m!490911 () Bool)

(assert (=> b!509868 m!490911))

(assert (=> b!509868 m!490903))

(declare-fun m!490913 () Bool)

(assert (=> b!509868 m!490913))

(assert (=> b!509868 m!490907))

(declare-fun m!490915 () Bool)

(assert (=> b!509868 m!490915))

(assert (=> b!509868 m!490903))

(declare-fun m!490917 () Bool)

(assert (=> b!509865 m!490917))

(declare-fun m!490919 () Bool)

(assert (=> b!509871 m!490919))

(declare-fun m!490921 () Bool)

(assert (=> b!509869 m!490921))

(assert (=> b!509866 m!490907))

(assert (=> b!509866 m!490907))

(declare-fun m!490923 () Bool)

(assert (=> b!509866 m!490923))

(declare-fun m!490925 () Bool)

(assert (=> b!509870 m!490925))

(assert (=> b!509867 m!490907))

(assert (=> b!509867 m!490907))

(declare-fun m!490927 () Bool)

(assert (=> b!509867 m!490927))

(push 1)

(assert (not b!509868))

(assert (not b!509870))

(assert (not b!509867))

(assert (not b!509869))

(assert (not start!46042))

(assert (not b!509873))

(assert (not b!509865))

(assert (not b!509871))

(assert (not b!509866))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

