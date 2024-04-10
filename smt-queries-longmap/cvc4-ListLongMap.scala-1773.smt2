; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32288 () Bool)

(assert start!32288)

(declare-fun b!321764 () Bool)

(declare-fun res!175891 () Bool)

(declare-fun e!199274 () Bool)

(assert (=> b!321764 (=> (not res!175891) (not e!199274))))

(declare-datatypes ((array!16478 0))(
  ( (array!16479 (arr!7798 (Array (_ BitVec 32) (_ BitVec 64))) (size!8150 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16478)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321764 (= res!175891 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7798 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7798 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7798 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321765 () Bool)

(declare-fun res!175889 () Bool)

(declare-fun e!199275 () Bool)

(assert (=> b!321765 (=> (not res!175889) (not e!199275))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321765 (= res!175889 (and (= (size!8150 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8150 a!3305))))))

(declare-fun b!321766 () Bool)

(declare-fun res!175885 () Bool)

(assert (=> b!321766 (=> (not res!175885) (not e!199275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16478 (_ BitVec 32)) Bool)

(assert (=> b!321766 (= res!175885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!175892 () Bool)

(assert (=> start!32288 (=> (not res!175892) (not e!199275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32288 (= res!175892 (validMask!0 mask!3777))))

(assert (=> start!32288 e!199275))

(declare-fun array_inv!5761 (array!16478) Bool)

(assert (=> start!32288 (array_inv!5761 a!3305)))

(assert (=> start!32288 true))

(declare-fun b!321767 () Bool)

(declare-fun res!175887 () Bool)

(assert (=> b!321767 (=> (not res!175887) (not e!199275))))

(declare-datatypes ((SeekEntryResult!2929 0))(
  ( (MissingZero!2929 (index!13892 (_ BitVec 32))) (Found!2929 (index!13893 (_ BitVec 32))) (Intermediate!2929 (undefined!3741 Bool) (index!13894 (_ BitVec 32)) (x!32148 (_ BitVec 32))) (Undefined!2929) (MissingVacant!2929 (index!13895 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16478 (_ BitVec 32)) SeekEntryResult!2929)

(assert (=> b!321767 (= res!175887 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2929 i!1250)))))

(declare-fun b!321768 () Bool)

(declare-fun res!175893 () Bool)

(assert (=> b!321768 (=> (not res!175893) (not e!199275))))

(declare-fun arrayContainsKey!0 (array!16478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321768 (= res!175893 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321769 () Bool)

(declare-fun res!175886 () Bool)

(assert (=> b!321769 (=> (not res!175886) (not e!199275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321769 (= res!175886 (validKeyInArray!0 k!2497))))

(declare-fun b!321770 () Bool)

(declare-fun res!175890 () Bool)

(assert (=> b!321770 (=> (not res!175890) (not e!199274))))

(declare-fun lt!156255 () SeekEntryResult!2929)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16478 (_ BitVec 32)) SeekEntryResult!2929)

(assert (=> b!321770 (= res!175890 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156255))))

(declare-fun b!321771 () Bool)

(declare-fun res!175884 () Bool)

(assert (=> b!321771 (=> (not res!175884) (not e!199274))))

(assert (=> b!321771 (= res!175884 (and (= (select (arr!7798 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8150 a!3305))))))

(declare-fun b!321772 () Bool)

(assert (=> b!321772 (= e!199275 e!199274)))

(declare-fun res!175888 () Bool)

(assert (=> b!321772 (=> (not res!175888) (not e!199274))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321772 (= res!175888 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156255))))

(assert (=> b!321772 (= lt!156255 (Intermediate!2929 false resIndex!58 resX!58))))

(declare-fun b!321773 () Bool)

(assert (=> b!321773 (= e!199274 false)))

(declare-fun lt!156254 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321773 (= lt!156254 (nextIndex!0 index!1840 x!1490 mask!3777))))

(assert (= (and start!32288 res!175892) b!321765))

(assert (= (and b!321765 res!175889) b!321769))

(assert (= (and b!321769 res!175886) b!321768))

(assert (= (and b!321768 res!175893) b!321767))

(assert (= (and b!321767 res!175887) b!321766))

(assert (= (and b!321766 res!175885) b!321772))

(assert (= (and b!321772 res!175888) b!321771))

(assert (= (and b!321771 res!175884) b!321770))

(assert (= (and b!321770 res!175890) b!321764))

(assert (= (and b!321764 res!175891) b!321773))

(declare-fun m!329843 () Bool)

(assert (=> b!321768 m!329843))

(declare-fun m!329845 () Bool)

(assert (=> b!321766 m!329845))

(declare-fun m!329847 () Bool)

(assert (=> start!32288 m!329847))

(declare-fun m!329849 () Bool)

(assert (=> start!32288 m!329849))

(declare-fun m!329851 () Bool)

(assert (=> b!321769 m!329851))

(declare-fun m!329853 () Bool)

(assert (=> b!321770 m!329853))

(declare-fun m!329855 () Bool)

(assert (=> b!321771 m!329855))

(declare-fun m!329857 () Bool)

(assert (=> b!321767 m!329857))

(declare-fun m!329859 () Bool)

(assert (=> b!321772 m!329859))

(assert (=> b!321772 m!329859))

(declare-fun m!329861 () Bool)

(assert (=> b!321772 m!329861))

(declare-fun m!329863 () Bool)

(assert (=> b!321764 m!329863))

(declare-fun m!329865 () Bool)

(assert (=> b!321773 m!329865))

(push 1)

(assert (not b!321770))

(assert (not b!321768))

(assert (not start!32288))

(assert (not b!321766))

(assert (not b!321769))

(assert (not b!321772))

(assert (not b!321773))

(assert (not b!321767))

