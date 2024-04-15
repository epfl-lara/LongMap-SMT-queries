; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32106 () Bool)

(assert start!32106)

(declare-fun b!319855 () Bool)

(declare-fun res!174245 () Bool)

(declare-fun e!198542 () Bool)

(assert (=> b!319855 (=> (not res!174245) (not e!198542))))

(declare-datatypes ((array!16345 0))(
  ( (array!16346 (arr!7733 (Array (_ BitVec 32) (_ BitVec 64))) (size!8086 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16345)

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!319855 (= res!174245 (and (= (size!8086 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8086 a!3305))))))

(declare-fun b!319856 () Bool)

(declare-fun res!174249 () Bool)

(assert (=> b!319856 (=> (not res!174249) (not e!198542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16345 (_ BitVec 32)) Bool)

(assert (=> b!319856 (= res!174249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319857 () Bool)

(declare-fun res!174246 () Bool)

(assert (=> b!319857 (=> (not res!174246) (not e!198542))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319857 (= res!174246 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319858 () Bool)

(declare-fun res!174244 () Bool)

(assert (=> b!319858 (=> (not res!174244) (not e!198542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319858 (= res!174244 (validKeyInArray!0 k!2497))))

(declare-fun res!174247 () Bool)

(assert (=> start!32106 (=> (not res!174247) (not e!198542))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32106 (= res!174247 (validMask!0 mask!3777))))

(assert (=> start!32106 e!198542))

(assert (=> start!32106 true))

(declare-fun array_inv!5705 (array!16345) Bool)

(assert (=> start!32106 (array_inv!5705 a!3305)))

(declare-fun b!319859 () Bool)

(declare-fun res!174248 () Bool)

(assert (=> b!319859 (=> (not res!174248) (not e!198542))))

(declare-datatypes ((SeekEntryResult!2863 0))(
  ( (MissingZero!2863 (index!13628 (_ BitVec 32))) (Found!2863 (index!13629 (_ BitVec 32))) (Intermediate!2863 (undefined!3675 Bool) (index!13630 (_ BitVec 32)) (x!31911 (_ BitVec 32))) (Undefined!2863) (MissingVacant!2863 (index!13631 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16345 (_ BitVec 32)) SeekEntryResult!2863)

(assert (=> b!319859 (= res!174248 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2863 i!1250)))))

(declare-fun b!319860 () Bool)

(assert (=> b!319860 (= e!198542 false)))

(declare-fun lt!155750 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319860 (= lt!155750 (toIndex!0 k!2497 mask!3777))))

(assert (= (and start!32106 res!174247) b!319855))

(assert (= (and b!319855 res!174245) b!319858))

(assert (= (and b!319858 res!174244) b!319857))

(assert (= (and b!319857 res!174246) b!319859))

(assert (= (and b!319859 res!174248) b!319856))

(assert (= (and b!319856 res!174249) b!319860))

(declare-fun m!327827 () Bool)

(assert (=> b!319858 m!327827))

(declare-fun m!327829 () Bool)

(assert (=> b!319859 m!327829))

(declare-fun m!327831 () Bool)

(assert (=> b!319856 m!327831))

(declare-fun m!327833 () Bool)

(assert (=> b!319857 m!327833))

(declare-fun m!327835 () Bool)

(assert (=> start!32106 m!327835))

(declare-fun m!327837 () Bool)

(assert (=> start!32106 m!327837))

(declare-fun m!327839 () Bool)

(assert (=> b!319860 m!327839))

(push 1)

(assert (not b!319859))

(assert (not b!319856))

(assert (not b!319857))

(assert (not b!319860))

(assert (not b!319858))

(assert (not start!32106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

