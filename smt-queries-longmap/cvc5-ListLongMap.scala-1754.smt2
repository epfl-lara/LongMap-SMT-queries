; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32112 () Bool)

(assert start!32112)

(declare-fun b!319909 () Bool)

(declare-fun res!174303 () Bool)

(declare-fun e!198559 () Bool)

(assert (=> b!319909 (=> (not res!174303) (not e!198559))))

(declare-datatypes ((array!16351 0))(
  ( (array!16352 (arr!7736 (Array (_ BitVec 32) (_ BitVec 64))) (size!8089 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16351)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319909 (= res!174303 (and (= (size!8089 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8089 a!3305))))))

(declare-fun b!319910 () Bool)

(assert (=> b!319910 (= e!198559 false)))

(declare-fun lt!155759 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319910 (= lt!155759 (toIndex!0 k!2497 mask!3777))))

(declare-fun b!319911 () Bool)

(declare-fun res!174300 () Bool)

(assert (=> b!319911 (=> (not res!174300) (not e!198559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319911 (= res!174300 (validKeyInArray!0 k!2497))))

(declare-fun b!319912 () Bool)

(declare-fun res!174298 () Bool)

(assert (=> b!319912 (=> (not res!174298) (not e!198559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16351 (_ BitVec 32)) Bool)

(assert (=> b!319912 (= res!174298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319913 () Bool)

(declare-fun res!174302 () Bool)

(assert (=> b!319913 (=> (not res!174302) (not e!198559))))

(declare-datatypes ((SeekEntryResult!2866 0))(
  ( (MissingZero!2866 (index!13640 (_ BitVec 32))) (Found!2866 (index!13641 (_ BitVec 32))) (Intermediate!2866 (undefined!3678 Bool) (index!13642 (_ BitVec 32)) (x!31922 (_ BitVec 32))) (Undefined!2866) (MissingVacant!2866 (index!13643 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16351 (_ BitVec 32)) SeekEntryResult!2866)

(assert (=> b!319913 (= res!174302 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2866 i!1250)))))

(declare-fun res!174299 () Bool)

(assert (=> start!32112 (=> (not res!174299) (not e!198559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32112 (= res!174299 (validMask!0 mask!3777))))

(assert (=> start!32112 e!198559))

(assert (=> start!32112 true))

(declare-fun array_inv!5708 (array!16351) Bool)

(assert (=> start!32112 (array_inv!5708 a!3305)))

(declare-fun b!319914 () Bool)

(declare-fun res!174301 () Bool)

(assert (=> b!319914 (=> (not res!174301) (not e!198559))))

(declare-fun arrayContainsKey!0 (array!16351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319914 (= res!174301 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!32112 res!174299) b!319909))

(assert (= (and b!319909 res!174303) b!319911))

(assert (= (and b!319911 res!174300) b!319914))

(assert (= (and b!319914 res!174301) b!319913))

(assert (= (and b!319913 res!174302) b!319912))

(assert (= (and b!319912 res!174298) b!319910))

(declare-fun m!327869 () Bool)

(assert (=> b!319911 m!327869))

(declare-fun m!327871 () Bool)

(assert (=> b!319914 m!327871))

(declare-fun m!327873 () Bool)

(assert (=> start!32112 m!327873))

(declare-fun m!327875 () Bool)

(assert (=> start!32112 m!327875))

(declare-fun m!327877 () Bool)

(assert (=> b!319912 m!327877))

(declare-fun m!327879 () Bool)

(assert (=> b!319910 m!327879))

(declare-fun m!327881 () Bool)

(assert (=> b!319913 m!327881))

(push 1)

(assert (not b!319913))

(assert (not b!319910))

(assert (not b!319912))

(assert (not start!32112))

(assert (not b!319911))

(assert (not b!319914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

