; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64290 () Bool)

(assert start!64290)

(declare-fun b!722099 () Bool)

(declare-fun e!404808 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!722099 (= e!404808 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!722100 () Bool)

(declare-fun res!483867 () Bool)

(assert (=> b!722100 (=> (not res!483867) (not e!404808))))

(declare-fun e!404806 () Bool)

(assert (=> b!722100 (= res!483867 e!404806)))

(declare-fun c!79492 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722100 (= c!79492 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!483866 () Bool)

(declare-fun e!404809 () Bool)

(assert (=> start!64290 (=> (not res!483866) (not e!404809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64290 (= res!483866 (validMask!0 mask!3328))))

(assert (=> start!64290 e!404809))

(assert (=> start!64290 true))

(declare-datatypes ((array!40871 0))(
  ( (array!40872 (arr!19558 (Array (_ BitVec 32) (_ BitVec 64))) (size!19979 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40871)

(declare-fun array_inv!15354 (array!40871) Bool)

(assert (=> start!64290 (array_inv!15354 a!3186)))

(declare-fun b!722101 () Bool)

(declare-fun res!483862 () Bool)

(assert (=> b!722101 (=> (not res!483862) (not e!404809))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722101 (= res!483862 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722102 () Bool)

(declare-fun e!404807 () Bool)

(assert (=> b!722102 (= e!404807 e!404808)))

(declare-fun res!483858 () Bool)

(assert (=> b!722102 (=> (not res!483858) (not e!404808))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7158 0))(
  ( (MissingZero!7158 (index!31000 (_ BitVec 32))) (Found!7158 (index!31001 (_ BitVec 32))) (Intermediate!7158 (undefined!7970 Bool) (index!31002 (_ BitVec 32)) (x!62007 (_ BitVec 32))) (Undefined!7158) (MissingVacant!7158 (index!31003 (_ BitVec 32))) )
))
(declare-fun lt!320213 () SeekEntryResult!7158)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40871 (_ BitVec 32)) SeekEntryResult!7158)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722102 (= res!483858 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19558 a!3186) j!159) mask!3328) (select (arr!19558 a!3186) j!159) a!3186 mask!3328) lt!320213))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!722102 (= lt!320213 (Intermediate!7158 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722103 () Bool)

(declare-fun res!483863 () Bool)

(assert (=> b!722103 (=> (not res!483863) (not e!404808))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722103 (= res!483863 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19558 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722104 () Bool)

(declare-fun res!483860 () Bool)

(assert (=> b!722104 (=> (not res!483860) (not e!404807))))

(assert (=> b!722104 (= res!483860 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19979 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19979 a!3186))))))

(declare-fun b!722105 () Bool)

(declare-fun res!483865 () Bool)

(assert (=> b!722105 (=> (not res!483865) (not e!404807))))

(declare-datatypes ((List!13560 0))(
  ( (Nil!13557) (Cons!13556 (h!14610 (_ BitVec 64)) (t!19875 List!13560)) )
))
(declare-fun arrayNoDuplicates!0 (array!40871 (_ BitVec 32) List!13560) Bool)

(assert (=> b!722105 (= res!483865 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13557))))

(declare-fun b!722106 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40871 (_ BitVec 32)) SeekEntryResult!7158)

(assert (=> b!722106 (= e!404806 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19558 a!3186) j!159) a!3186 mask!3328) (Found!7158 j!159)))))

(declare-fun b!722107 () Bool)

(declare-fun res!483869 () Bool)

(assert (=> b!722107 (=> (not res!483869) (not e!404809))))

(assert (=> b!722107 (= res!483869 (and (= (size!19979 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19979 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19979 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722108 () Bool)

(declare-fun res!483861 () Bool)

(assert (=> b!722108 (=> (not res!483861) (not e!404809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722108 (= res!483861 (validKeyInArray!0 k0!2102))))

(declare-fun b!722109 () Bool)

(assert (=> b!722109 (= e!404806 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19558 a!3186) j!159) a!3186 mask!3328) lt!320213))))

(declare-fun b!722110 () Bool)

(declare-fun res!483868 () Bool)

(assert (=> b!722110 (=> (not res!483868) (not e!404807))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40871 (_ BitVec 32)) Bool)

(assert (=> b!722110 (= res!483868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722111 () Bool)

(declare-fun res!483864 () Bool)

(assert (=> b!722111 (=> (not res!483864) (not e!404809))))

(assert (=> b!722111 (= res!483864 (validKeyInArray!0 (select (arr!19558 a!3186) j!159)))))

(declare-fun b!722112 () Bool)

(assert (=> b!722112 (= e!404809 e!404807)))

(declare-fun res!483859 () Bool)

(assert (=> b!722112 (=> (not res!483859) (not e!404807))))

(declare-fun lt!320212 () SeekEntryResult!7158)

(assert (=> b!722112 (= res!483859 (or (= lt!320212 (MissingZero!7158 i!1173)) (= lt!320212 (MissingVacant!7158 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40871 (_ BitVec 32)) SeekEntryResult!7158)

(assert (=> b!722112 (= lt!320212 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64290 res!483866) b!722107))

(assert (= (and b!722107 res!483869) b!722111))

(assert (= (and b!722111 res!483864) b!722108))

(assert (= (and b!722108 res!483861) b!722101))

(assert (= (and b!722101 res!483862) b!722112))

(assert (= (and b!722112 res!483859) b!722110))

(assert (= (and b!722110 res!483868) b!722105))

(assert (= (and b!722105 res!483865) b!722104))

(assert (= (and b!722104 res!483860) b!722102))

(assert (= (and b!722102 res!483858) b!722103))

(assert (= (and b!722103 res!483863) b!722100))

(assert (= (and b!722100 c!79492) b!722109))

(assert (= (and b!722100 (not c!79492)) b!722106))

(assert (= (and b!722100 res!483867) b!722099))

(declare-fun m!676721 () Bool)

(assert (=> b!722103 m!676721))

(declare-fun m!676723 () Bool)

(assert (=> b!722102 m!676723))

(assert (=> b!722102 m!676723))

(declare-fun m!676725 () Bool)

(assert (=> b!722102 m!676725))

(assert (=> b!722102 m!676725))

(assert (=> b!722102 m!676723))

(declare-fun m!676727 () Bool)

(assert (=> b!722102 m!676727))

(assert (=> b!722109 m!676723))

(assert (=> b!722109 m!676723))

(declare-fun m!676729 () Bool)

(assert (=> b!722109 m!676729))

(assert (=> b!722111 m!676723))

(assert (=> b!722111 m!676723))

(declare-fun m!676731 () Bool)

(assert (=> b!722111 m!676731))

(declare-fun m!676733 () Bool)

(assert (=> b!722108 m!676733))

(declare-fun m!676735 () Bool)

(assert (=> b!722105 m!676735))

(declare-fun m!676737 () Bool)

(assert (=> b!722110 m!676737))

(assert (=> b!722106 m!676723))

(assert (=> b!722106 m!676723))

(declare-fun m!676739 () Bool)

(assert (=> b!722106 m!676739))

(declare-fun m!676741 () Bool)

(assert (=> b!722112 m!676741))

(declare-fun m!676743 () Bool)

(assert (=> start!64290 m!676743))

(declare-fun m!676745 () Bool)

(assert (=> start!64290 m!676745))

(declare-fun m!676747 () Bool)

(assert (=> b!722101 m!676747))

(check-sat (not b!722110) (not b!722112) (not b!722101) (not start!64290) (not b!722109) (not b!722105) (not b!722102) (not b!722108) (not b!722106) (not b!722111))
(check-sat)
