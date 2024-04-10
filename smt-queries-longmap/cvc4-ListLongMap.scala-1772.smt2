; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32282 () Bool)

(assert start!32282)

(declare-fun b!321674 () Bool)

(declare-fun e!199248 () Bool)

(declare-fun e!199249 () Bool)

(assert (=> b!321674 (= e!199248 e!199249)))

(declare-fun res!175800 () Bool)

(assert (=> b!321674 (=> (not res!175800) (not e!199249))))

(declare-datatypes ((array!16472 0))(
  ( (array!16473 (arr!7795 (Array (_ BitVec 32) (_ BitVec 64))) (size!8147 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16472)

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2926 0))(
  ( (MissingZero!2926 (index!13880 (_ BitVec 32))) (Found!2926 (index!13881 (_ BitVec 32))) (Intermediate!2926 (undefined!3738 Bool) (index!13882 (_ BitVec 32)) (x!32137 (_ BitVec 32))) (Undefined!2926) (MissingVacant!2926 (index!13883 (_ BitVec 32))) )
))
(declare-fun lt!156236 () SeekEntryResult!2926)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16472 (_ BitVec 32)) SeekEntryResult!2926)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321674 (= res!175800 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156236))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321674 (= lt!156236 (Intermediate!2926 false resIndex!58 resX!58))))

(declare-fun b!321675 () Bool)

(declare-fun res!175796 () Bool)

(assert (=> b!321675 (=> (not res!175796) (not e!199248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16472 (_ BitVec 32)) Bool)

(assert (=> b!321675 (= res!175796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321676 () Bool)

(declare-fun res!175802 () Bool)

(assert (=> b!321676 (=> (not res!175802) (not e!199249))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321676 (= res!175802 (and (= (select (arr!7795 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8147 a!3305))))))

(declare-fun b!321677 () Bool)

(declare-fun res!175798 () Bool)

(assert (=> b!321677 (=> (not res!175798) (not e!199248))))

(declare-fun arrayContainsKey!0 (array!16472 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321677 (= res!175798 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321678 () Bool)

(declare-fun res!175799 () Bool)

(assert (=> b!321678 (=> (not res!175799) (not e!199248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321678 (= res!175799 (validKeyInArray!0 k!2497))))

(declare-fun b!321679 () Bool)

(declare-fun res!175795 () Bool)

(assert (=> b!321679 (=> (not res!175795) (not e!199249))))

(assert (=> b!321679 (= res!175795 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7795 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7795 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7795 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321680 () Bool)

(assert (=> b!321680 (= e!199249 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun lt!156237 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321680 (= lt!156237 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!321681 () Bool)

(declare-fun res!175794 () Bool)

(assert (=> b!321681 (=> (not res!175794) (not e!199248))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16472 (_ BitVec 32)) SeekEntryResult!2926)

(assert (=> b!321681 (= res!175794 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2926 i!1250)))))

(declare-fun res!175801 () Bool)

(assert (=> start!32282 (=> (not res!175801) (not e!199248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32282 (= res!175801 (validMask!0 mask!3777))))

(assert (=> start!32282 e!199248))

(declare-fun array_inv!5758 (array!16472) Bool)

(assert (=> start!32282 (array_inv!5758 a!3305)))

(assert (=> start!32282 true))

(declare-fun b!321682 () Bool)

(declare-fun res!175797 () Bool)

(assert (=> b!321682 (=> (not res!175797) (not e!199248))))

(assert (=> b!321682 (= res!175797 (and (= (size!8147 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8147 a!3305))))))

(declare-fun b!321683 () Bool)

(declare-fun res!175803 () Bool)

(assert (=> b!321683 (=> (not res!175803) (not e!199249))))

(assert (=> b!321683 (= res!175803 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156236))))

(assert (= (and start!32282 res!175801) b!321682))

(assert (= (and b!321682 res!175797) b!321678))

(assert (= (and b!321678 res!175799) b!321677))

(assert (= (and b!321677 res!175798) b!321681))

(assert (= (and b!321681 res!175794) b!321675))

(assert (= (and b!321675 res!175796) b!321674))

(assert (= (and b!321674 res!175800) b!321676))

(assert (= (and b!321676 res!175802) b!321683))

(assert (= (and b!321683 res!175803) b!321679))

(assert (= (and b!321679 res!175795) b!321680))

(declare-fun m!329771 () Bool)

(assert (=> b!321681 m!329771))

(declare-fun m!329773 () Bool)

(assert (=> b!321678 m!329773))

(declare-fun m!329775 () Bool)

(assert (=> b!321677 m!329775))

(declare-fun m!329777 () Bool)

(assert (=> b!321683 m!329777))

(declare-fun m!329779 () Bool)

(assert (=> b!321680 m!329779))

(declare-fun m!329781 () Bool)

(assert (=> b!321679 m!329781))

(declare-fun m!329783 () Bool)

(assert (=> start!32282 m!329783))

(declare-fun m!329785 () Bool)

(assert (=> start!32282 m!329785))

(declare-fun m!329787 () Bool)

(assert (=> b!321676 m!329787))

(declare-fun m!329789 () Bool)

(assert (=> b!321674 m!329789))

(assert (=> b!321674 m!329789))

(declare-fun m!329791 () Bool)

(assert (=> b!321674 m!329791))

(declare-fun m!329793 () Bool)

(assert (=> b!321675 m!329793))

(push 1)

(assert (not start!32282))

(assert (not b!321683))

(assert (not b!321678))

(assert (not b!321680))

(assert (not b!321677))

(assert (not b!321675))

(assert (not b!321674))

(assert (not b!321681))

(check-sat)

(pop 1)

(push 1)

(check-sat)

