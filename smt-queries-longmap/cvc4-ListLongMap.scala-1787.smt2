; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32426 () Bool)

(assert start!32426)

(declare-fun b!323828 () Bool)

(declare-datatypes ((Unit!10060 0))(
  ( (Unit!10061) )
))
(declare-fun e!200083 () Unit!10060)

(declare-fun Unit!10062 () Unit!10060)

(assert (=> b!323828 (= e!200083 Unit!10062)))

(declare-fun b!323829 () Bool)

(declare-fun res!177228 () Bool)

(declare-fun e!200081 () Bool)

(assert (=> b!323829 (=> (not res!177228) (not e!200081))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323829 (= res!177228 (validKeyInArray!0 k!2497))))

(declare-fun b!323830 () Bool)

(declare-fun res!177226 () Bool)

(assert (=> b!323830 (=> (not res!177226) (not e!200081))))

(declare-datatypes ((array!16565 0))(
  ( (array!16566 (arr!7840 (Array (_ BitVec 32) (_ BitVec 64))) (size!8192 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16565)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16565 (_ BitVec 32)) Bool)

(assert (=> b!323830 (= res!177226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323831 () Bool)

(declare-fun res!177220 () Bool)

(declare-fun e!200078 () Bool)

(assert (=> b!323831 (=> (not res!177220) (not e!200078))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323831 (= res!177220 (and (= (select (arr!7840 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8192 a!3305))))))

(declare-fun b!323832 () Bool)

(assert (=> b!323832 false))

(declare-fun lt!156710 () Unit!10060)

(assert (=> b!323832 (= lt!156710 e!200083)))

(declare-fun c!50934 () Bool)

(declare-datatypes ((SeekEntryResult!2971 0))(
  ( (MissingZero!2971 (index!14060 (_ BitVec 32))) (Found!2971 (index!14061 (_ BitVec 32))) (Intermediate!2971 (undefined!3783 Bool) (index!14062 (_ BitVec 32)) (x!32311 (_ BitVec 32))) (Undefined!2971) (MissingVacant!2971 (index!14063 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16565 (_ BitVec 32)) SeekEntryResult!2971)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323832 (= c!50934 (is-Intermediate!2971 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!200079 () Unit!10060)

(declare-fun Unit!10063 () Unit!10060)

(assert (=> b!323832 (= e!200079 Unit!10063)))

(declare-fun b!323833 () Bool)

(assert (=> b!323833 (= e!200081 e!200078)))

(declare-fun res!177227 () Bool)

(assert (=> b!323833 (=> (not res!177227) (not e!200078))))

(declare-fun lt!156709 () SeekEntryResult!2971)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323833 (= res!177227 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156709))))

(assert (=> b!323833 (= lt!156709 (Intermediate!2971 false resIndex!58 resX!58))))

(declare-fun b!323834 () Bool)

(declare-fun res!177224 () Bool)

(assert (=> b!323834 (=> (not res!177224) (not e!200078))))

(assert (=> b!323834 (= res!177224 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7840 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!323835 () Bool)

(declare-fun e!200080 () Unit!10060)

(assert (=> b!323835 (= e!200080 e!200079)))

(declare-fun c!50932 () Bool)

(assert (=> b!323835 (= c!50932 (or (= (select (arr!7840 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7840 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323836 () Bool)

(declare-fun res!177219 () Bool)

(assert (=> b!323836 (=> (not res!177219) (not e!200081))))

(declare-fun arrayContainsKey!0 (array!16565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323836 (= res!177219 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323837 () Bool)

(assert (=> b!323837 (= e!200078 (not (or (not (= (select (arr!7840 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsle x!1490 #b01111111111111111111111111111110))))))

(assert (=> b!323837 (= index!1840 resIndex!58)))

(declare-fun lt!156711 () Unit!10060)

(assert (=> b!323837 (= lt!156711 e!200080)))

(declare-fun c!50933 () Bool)

(assert (=> b!323837 (= c!50933 (not (= resIndex!58 index!1840)))))

(declare-fun res!177222 () Bool)

(assert (=> start!32426 (=> (not res!177222) (not e!200081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32426 (= res!177222 (validMask!0 mask!3777))))

(assert (=> start!32426 e!200081))

(declare-fun array_inv!5803 (array!16565) Bool)

(assert (=> start!32426 (array_inv!5803 a!3305)))

(assert (=> start!32426 true))

(declare-fun b!323838 () Bool)

(assert (=> b!323838 false))

(declare-fun Unit!10064 () Unit!10060)

(assert (=> b!323838 (= e!200079 Unit!10064)))

(declare-fun b!323839 () Bool)

(declare-fun Unit!10065 () Unit!10060)

(assert (=> b!323839 (= e!200080 Unit!10065)))

(declare-fun b!323840 () Bool)

(declare-fun res!177221 () Bool)

(assert (=> b!323840 (=> (not res!177221) (not e!200081))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16565 (_ BitVec 32)) SeekEntryResult!2971)

(assert (=> b!323840 (= res!177221 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2971 i!1250)))))

(declare-fun b!323841 () Bool)

(declare-fun res!177225 () Bool)

(assert (=> b!323841 (=> (not res!177225) (not e!200078))))

(assert (=> b!323841 (= res!177225 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156709))))

(declare-fun b!323842 () Bool)

(declare-fun res!177223 () Bool)

(assert (=> b!323842 (=> (not res!177223) (not e!200081))))

(assert (=> b!323842 (= res!177223 (and (= (size!8192 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8192 a!3305))))))

(declare-fun b!323843 () Bool)

(declare-fun Unit!10066 () Unit!10060)

(assert (=> b!323843 (= e!200083 Unit!10066)))

(assert (=> b!323843 false))

(assert (= (and start!32426 res!177222) b!323842))

(assert (= (and b!323842 res!177223) b!323829))

(assert (= (and b!323829 res!177228) b!323836))

(assert (= (and b!323836 res!177219) b!323840))

(assert (= (and b!323840 res!177221) b!323830))

(assert (= (and b!323830 res!177226) b!323833))

(assert (= (and b!323833 res!177227) b!323831))

(assert (= (and b!323831 res!177220) b!323841))

(assert (= (and b!323841 res!177225) b!323834))

(assert (= (and b!323834 res!177224) b!323837))

(assert (= (and b!323837 c!50933) b!323835))

(assert (= (and b!323837 (not c!50933)) b!323839))

(assert (= (and b!323835 c!50932) b!323838))

(assert (= (and b!323835 (not c!50932)) b!323832))

(assert (= (and b!323832 c!50934) b!323828))

(assert (= (and b!323832 (not c!50934)) b!323843))

(declare-fun m!331029 () Bool)

(assert (=> b!323841 m!331029))

(declare-fun m!331031 () Bool)

(assert (=> b!323832 m!331031))

(assert (=> b!323832 m!331031))

(declare-fun m!331033 () Bool)

(assert (=> b!323832 m!331033))

(declare-fun m!331035 () Bool)

(assert (=> b!323834 m!331035))

(declare-fun m!331037 () Bool)

(assert (=> b!323830 m!331037))

(declare-fun m!331039 () Bool)

(assert (=> b!323829 m!331039))

(declare-fun m!331041 () Bool)

(assert (=> b!323831 m!331041))

(declare-fun m!331043 () Bool)

(assert (=> b!323836 m!331043))

(assert (=> b!323835 m!331035))

(declare-fun m!331045 () Bool)

(assert (=> start!32426 m!331045))

(declare-fun m!331047 () Bool)

(assert (=> start!32426 m!331047))

(assert (=> b!323837 m!331035))

(declare-fun m!331049 () Bool)

(assert (=> b!323833 m!331049))

(assert (=> b!323833 m!331049))

(declare-fun m!331051 () Bool)

(assert (=> b!323833 m!331051))

(declare-fun m!331053 () Bool)

(assert (=> b!323840 m!331053))

(push 1)

(assert (not b!323836))

(assert (not b!323830))

(assert (not b!323840))

