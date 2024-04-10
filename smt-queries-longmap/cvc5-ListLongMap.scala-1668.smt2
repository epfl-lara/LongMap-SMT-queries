; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30896 () Bool)

(assert start!30896)

(declare-fun b!309984 () Bool)

(declare-fun res!166439 () Bool)

(declare-fun e!193597 () Bool)

(assert (=> b!309984 (=> (not res!166439) (not e!193597))))

(declare-datatypes ((array!15798 0))(
  ( (array!15799 (arr!7481 (Array (_ BitVec 32) (_ BitVec 64))) (size!7833 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15798)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309984 (= res!166439 (and (= (select (arr!7481 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7833 a!3293))))))

(declare-fun b!309985 () Bool)

(declare-fun res!166441 () Bool)

(declare-fun e!193595 () Bool)

(assert (=> b!309985 (=> (not res!166441) (not e!193595))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309985 (= res!166441 (validKeyInArray!0 k!2441))))

(declare-fun b!309986 () Bool)

(declare-fun e!193596 () Bool)

(assert (=> b!309986 (= e!193597 e!193596)))

(declare-fun res!166443 () Bool)

(assert (=> b!309986 (=> (not res!166443) (not e!193596))))

(declare-datatypes ((SeekEntryResult!2621 0))(
  ( (MissingZero!2621 (index!12660 (_ BitVec 32))) (Found!2621 (index!12661 (_ BitVec 32))) (Intermediate!2621 (undefined!3433 Bool) (index!12662 (_ BitVec 32)) (x!30898 (_ BitVec 32))) (Undefined!2621) (MissingVacant!2621 (index!12663 (_ BitVec 32))) )
))
(declare-fun lt!151785 () SeekEntryResult!2621)

(declare-fun lt!151784 () SeekEntryResult!2621)

(assert (=> b!309986 (= res!166443 (and (= lt!151784 lt!151785) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7481 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15798 (_ BitVec 32)) SeekEntryResult!2621)

(assert (=> b!309986 (= lt!151784 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309987 () Bool)

(declare-fun res!166444 () Bool)

(assert (=> b!309987 (=> (not res!166444) (not e!193595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15798 (_ BitVec 32)) Bool)

(assert (=> b!309987 (= res!166444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309988 () Bool)

(assert (=> b!309988 (= e!193596 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309988 (= lt!151784 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun res!166438 () Bool)

(assert (=> start!30896 (=> (not res!166438) (not e!193595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30896 (= res!166438 (validMask!0 mask!3709))))

(assert (=> start!30896 e!193595))

(declare-fun array_inv!5444 (array!15798) Bool)

(assert (=> start!30896 (array_inv!5444 a!3293)))

(assert (=> start!30896 true))

(declare-fun b!309989 () Bool)

(assert (=> b!309989 (= e!193595 e!193597)))

(declare-fun res!166442 () Bool)

(assert (=> b!309989 (=> (not res!166442) (not e!193597))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309989 (= res!166442 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151785))))

(assert (=> b!309989 (= lt!151785 (Intermediate!2621 false resIndex!52 resX!52))))

(declare-fun b!309990 () Bool)

(declare-fun res!166446 () Bool)

(assert (=> b!309990 (=> (not res!166446) (not e!193595))))

(declare-fun arrayContainsKey!0 (array!15798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309990 (= res!166446 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309991 () Bool)

(declare-fun res!166440 () Bool)

(assert (=> b!309991 (=> (not res!166440) (not e!193595))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15798 (_ BitVec 32)) SeekEntryResult!2621)

(assert (=> b!309991 (= res!166440 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2621 i!1240)))))

(declare-fun b!309992 () Bool)

(declare-fun res!166445 () Bool)

(assert (=> b!309992 (=> (not res!166445) (not e!193595))))

(assert (=> b!309992 (= res!166445 (and (= (size!7833 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7833 a!3293))))))

(assert (= (and start!30896 res!166438) b!309992))

(assert (= (and b!309992 res!166445) b!309985))

(assert (= (and b!309985 res!166441) b!309990))

(assert (= (and b!309990 res!166446) b!309991))

(assert (= (and b!309991 res!166440) b!309987))

(assert (= (and b!309987 res!166444) b!309989))

(assert (= (and b!309989 res!166442) b!309984))

(assert (= (and b!309984 res!166439) b!309986))

(assert (= (and b!309986 res!166443) b!309988))

(declare-fun m!319871 () Bool)

(assert (=> b!309990 m!319871))

(declare-fun m!319873 () Bool)

(assert (=> start!30896 m!319873))

(declare-fun m!319875 () Bool)

(assert (=> start!30896 m!319875))

(declare-fun m!319877 () Bool)

(assert (=> b!309987 m!319877))

(declare-fun m!319879 () Bool)

(assert (=> b!309988 m!319879))

(assert (=> b!309988 m!319879))

(declare-fun m!319881 () Bool)

(assert (=> b!309988 m!319881))

(declare-fun m!319883 () Bool)

(assert (=> b!309991 m!319883))

(declare-fun m!319885 () Bool)

(assert (=> b!309989 m!319885))

(assert (=> b!309989 m!319885))

(declare-fun m!319887 () Bool)

(assert (=> b!309989 m!319887))

(declare-fun m!319889 () Bool)

(assert (=> b!309984 m!319889))

(declare-fun m!319891 () Bool)

(assert (=> b!309986 m!319891))

(declare-fun m!319893 () Bool)

(assert (=> b!309986 m!319893))

(declare-fun m!319895 () Bool)

(assert (=> b!309985 m!319895))

(push 1)

