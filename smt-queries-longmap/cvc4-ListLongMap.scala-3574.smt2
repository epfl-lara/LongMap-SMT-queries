; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49126 () Bool)

(assert start!49126)

(declare-fun b!541226 () Bool)

(declare-fun res!336118 () Bool)

(declare-fun e!313400 () Bool)

(assert (=> b!541226 (=> (not res!336118) (not e!313400))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34236 0))(
  ( (array!34237 (arr!16454 (Array (_ BitVec 32) (_ BitVec 64))) (size!16818 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34236)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!541226 (= res!336118 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16818 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16818 a!3154)) (= (select (arr!16454 a!3154) resIndex!32) (select (arr!16454 a!3154) j!147))))))

(declare-fun b!541227 () Bool)

(declare-fun res!336120 () Bool)

(assert (=> b!541227 (=> (not res!336120) (not e!313400))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34236 (_ BitVec 32)) Bool)

(assert (=> b!541227 (= res!336120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541228 () Bool)

(declare-fun e!313399 () Bool)

(assert (=> b!541228 (= e!313399 e!313400)))

(declare-fun res!336114 () Bool)

(assert (=> b!541228 (=> (not res!336114) (not e!313400))))

(declare-datatypes ((SeekEntryResult!4912 0))(
  ( (MissingZero!4912 (index!21872 (_ BitVec 32))) (Found!4912 (index!21873 (_ BitVec 32))) (Intermediate!4912 (undefined!5724 Bool) (index!21874 (_ BitVec 32)) (x!50779 (_ BitVec 32))) (Undefined!4912) (MissingVacant!4912 (index!21875 (_ BitVec 32))) )
))
(declare-fun lt!247579 () SeekEntryResult!4912)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541228 (= res!336114 (or (= lt!247579 (MissingZero!4912 i!1153)) (= lt!247579 (MissingVacant!4912 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34236 (_ BitVec 32)) SeekEntryResult!4912)

(assert (=> b!541228 (= lt!247579 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!541229 () Bool)

(declare-fun res!336121 () Bool)

(assert (=> b!541229 (=> (not res!336121) (not e!313400))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34236 (_ BitVec 32)) SeekEntryResult!4912)

(assert (=> b!541229 (= res!336121 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16454 a!3154) j!147) a!3154 mask!3216) (Intermediate!4912 false resIndex!32 resX!32)))))

(declare-fun b!541230 () Bool)

(assert (=> b!541230 (= e!313400 false)))

(declare-fun lt!247578 () SeekEntryResult!4912)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541230 (= lt!247578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16454 a!3154) j!147) mask!3216) (select (arr!16454 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541232 () Bool)

(declare-fun res!336117 () Bool)

(assert (=> b!541232 (=> (not res!336117) (not e!313399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541232 (= res!336117 (validKeyInArray!0 k!1998))))

(declare-fun b!541233 () Bool)

(declare-fun res!336113 () Bool)

(assert (=> b!541233 (=> (not res!336113) (not e!313400))))

(declare-datatypes ((List!10573 0))(
  ( (Nil!10570) (Cons!10569 (h!11518 (_ BitVec 64)) (t!16801 List!10573)) )
))
(declare-fun arrayNoDuplicates!0 (array!34236 (_ BitVec 32) List!10573) Bool)

(assert (=> b!541233 (= res!336113 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10570))))

(declare-fun res!336119 () Bool)

(assert (=> start!49126 (=> (not res!336119) (not e!313399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49126 (= res!336119 (validMask!0 mask!3216))))

(assert (=> start!49126 e!313399))

(assert (=> start!49126 true))

(declare-fun array_inv!12250 (array!34236) Bool)

(assert (=> start!49126 (array_inv!12250 a!3154)))

(declare-fun b!541231 () Bool)

(declare-fun res!336122 () Bool)

(assert (=> b!541231 (=> (not res!336122) (not e!313399))))

(assert (=> b!541231 (= res!336122 (and (= (size!16818 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16818 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16818 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541234 () Bool)

(declare-fun res!336115 () Bool)

(assert (=> b!541234 (=> (not res!336115) (not e!313399))))

(declare-fun arrayContainsKey!0 (array!34236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541234 (= res!336115 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541235 () Bool)

(declare-fun res!336116 () Bool)

(assert (=> b!541235 (=> (not res!336116) (not e!313399))))

(assert (=> b!541235 (= res!336116 (validKeyInArray!0 (select (arr!16454 a!3154) j!147)))))

(assert (= (and start!49126 res!336119) b!541231))

(assert (= (and b!541231 res!336122) b!541235))

(assert (= (and b!541235 res!336116) b!541232))

(assert (= (and b!541232 res!336117) b!541234))

(assert (= (and b!541234 res!336115) b!541228))

(assert (= (and b!541228 res!336114) b!541227))

(assert (= (and b!541227 res!336120) b!541233))

(assert (= (and b!541233 res!336113) b!541226))

(assert (= (and b!541226 res!336118) b!541229))

(assert (= (and b!541229 res!336121) b!541230))

(declare-fun m!519829 () Bool)

(assert (=> b!541232 m!519829))

(declare-fun m!519831 () Bool)

(assert (=> b!541235 m!519831))

(assert (=> b!541235 m!519831))

(declare-fun m!519833 () Bool)

(assert (=> b!541235 m!519833))

(declare-fun m!519835 () Bool)

(assert (=> b!541227 m!519835))

(assert (=> b!541230 m!519831))

(assert (=> b!541230 m!519831))

(declare-fun m!519837 () Bool)

(assert (=> b!541230 m!519837))

(assert (=> b!541230 m!519837))

(assert (=> b!541230 m!519831))

(declare-fun m!519839 () Bool)

(assert (=> b!541230 m!519839))

(declare-fun m!519841 () Bool)

(assert (=> start!49126 m!519841))

(declare-fun m!519843 () Bool)

(assert (=> start!49126 m!519843))

(declare-fun m!519845 () Bool)

(assert (=> b!541226 m!519845))

(assert (=> b!541226 m!519831))

(declare-fun m!519847 () Bool)

(assert (=> b!541233 m!519847))

(declare-fun m!519849 () Bool)

(assert (=> b!541234 m!519849))

(declare-fun m!519851 () Bool)

(assert (=> b!541228 m!519851))

(assert (=> b!541229 m!519831))

(assert (=> b!541229 m!519831))

(declare-fun m!519853 () Bool)

(assert (=> b!541229 m!519853))

(push 1)

(assert (not b!541233))

(assert (not b!541230))

(assert (not b!541229))

(assert (not b!541227))

(assert (not b!541232))

(assert (not b!541235))

(assert (not start!49126))

(assert (not b!541234))

(assert (not b!541228))

(check-sat)

(pop 1)

