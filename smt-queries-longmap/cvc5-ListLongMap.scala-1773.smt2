; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32284 () Bool)

(assert start!32284)

(declare-fun b!321704 () Bool)

(declare-fun res!175825 () Bool)

(declare-fun e!199258 () Bool)

(assert (=> b!321704 (=> (not res!175825) (not e!199258))))

(declare-datatypes ((array!16474 0))(
  ( (array!16475 (arr!7796 (Array (_ BitVec 32) (_ BitVec 64))) (size!8148 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16474)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2927 0))(
  ( (MissingZero!2927 (index!13884 (_ BitVec 32))) (Found!2927 (index!13885 (_ BitVec 32))) (Intermediate!2927 (undefined!3739 Bool) (index!13886 (_ BitVec 32)) (x!32146 (_ BitVec 32))) (Undefined!2927) (MissingVacant!2927 (index!13887 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16474 (_ BitVec 32)) SeekEntryResult!2927)

(assert (=> b!321704 (= res!175825 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2927 i!1250)))))

(declare-fun b!321705 () Bool)

(declare-fun res!175831 () Bool)

(declare-fun e!199256 () Bool)

(assert (=> b!321705 (=> (not res!175831) (not e!199256))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321705 (= res!175831 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7796 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7796 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7796 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321706 () Bool)

(declare-fun res!175828 () Bool)

(assert (=> b!321706 (=> (not res!175828) (not e!199258))))

(assert (=> b!321706 (= res!175828 (and (= (size!8148 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8148 a!3305))))))

(declare-fun res!175830 () Bool)

(assert (=> start!32284 (=> (not res!175830) (not e!199258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32284 (= res!175830 (validMask!0 mask!3777))))

(assert (=> start!32284 e!199258))

(declare-fun array_inv!5759 (array!16474) Bool)

(assert (=> start!32284 (array_inv!5759 a!3305)))

(assert (=> start!32284 true))

(declare-fun b!321707 () Bool)

(declare-fun res!175832 () Bool)

(assert (=> b!321707 (=> (not res!175832) (not e!199258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321707 (= res!175832 (validKeyInArray!0 k!2497))))

(declare-fun b!321708 () Bool)

(declare-fun res!175833 () Bool)

(assert (=> b!321708 (=> (not res!175833) (not e!199256))))

(declare-fun lt!156242 () SeekEntryResult!2927)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16474 (_ BitVec 32)) SeekEntryResult!2927)

(assert (=> b!321708 (= res!175833 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156242))))

(declare-fun b!321709 () Bool)

(assert (=> b!321709 (= e!199258 e!199256)))

(declare-fun res!175824 () Bool)

(assert (=> b!321709 (=> (not res!175824) (not e!199256))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321709 (= res!175824 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156242))))

(assert (=> b!321709 (= lt!156242 (Intermediate!2927 false resIndex!58 resX!58))))

(declare-fun b!321710 () Bool)

(declare-fun res!175827 () Bool)

(assert (=> b!321710 (=> (not res!175827) (not e!199258))))

(declare-fun arrayContainsKey!0 (array!16474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321710 (= res!175827 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321711 () Bool)

(declare-fun res!175826 () Bool)

(assert (=> b!321711 (=> (not res!175826) (not e!199258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16474 (_ BitVec 32)) Bool)

(assert (=> b!321711 (= res!175826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321712 () Bool)

(declare-fun res!175829 () Bool)

(assert (=> b!321712 (=> (not res!175829) (not e!199256))))

(assert (=> b!321712 (= res!175829 (and (= (select (arr!7796 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8148 a!3305))))))

(declare-fun b!321713 () Bool)

(assert (=> b!321713 (= e!199256 false)))

(declare-fun lt!156243 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321713 (= lt!156243 (nextIndex!0 index!1840 x!1490 mask!3777))))

(assert (= (and start!32284 res!175830) b!321706))

(assert (= (and b!321706 res!175828) b!321707))

(assert (= (and b!321707 res!175832) b!321710))

(assert (= (and b!321710 res!175827) b!321704))

(assert (= (and b!321704 res!175825) b!321711))

(assert (= (and b!321711 res!175826) b!321709))

(assert (= (and b!321709 res!175824) b!321712))

(assert (= (and b!321712 res!175829) b!321708))

(assert (= (and b!321708 res!175833) b!321705))

(assert (= (and b!321705 res!175831) b!321713))

(declare-fun m!329795 () Bool)

(assert (=> b!321705 m!329795))

(declare-fun m!329797 () Bool)

(assert (=> b!321710 m!329797))

(declare-fun m!329799 () Bool)

(assert (=> start!32284 m!329799))

(declare-fun m!329801 () Bool)

(assert (=> start!32284 m!329801))

(declare-fun m!329803 () Bool)

(assert (=> b!321713 m!329803))

(declare-fun m!329805 () Bool)

(assert (=> b!321709 m!329805))

(assert (=> b!321709 m!329805))

(declare-fun m!329807 () Bool)

(assert (=> b!321709 m!329807))

(declare-fun m!329809 () Bool)

(assert (=> b!321707 m!329809))

(declare-fun m!329811 () Bool)

(assert (=> b!321711 m!329811))

(declare-fun m!329813 () Bool)

(assert (=> b!321712 m!329813))

(declare-fun m!329815 () Bool)

(assert (=> b!321704 m!329815))

(declare-fun m!329817 () Bool)

(assert (=> b!321708 m!329817))

(push 1)

