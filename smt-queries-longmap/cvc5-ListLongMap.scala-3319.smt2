; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45858 () Bool)

(assert start!45858)

(declare-fun b!507932 () Bool)

(declare-fun res!308894 () Bool)

(declare-fun e!297230 () Bool)

(assert (=> b!507932 (=> (not res!308894) (not e!297230))))

(declare-datatypes ((array!32614 0))(
  ( (array!32615 (arr!15687 (Array (_ BitVec 32) (_ BitVec 64))) (size!16051 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32614)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507932 (= res!308894 (validKeyInArray!0 (select (arr!15687 a!3235) j!176)))))

(declare-fun b!507933 () Bool)

(declare-fun e!297231 () Bool)

(assert (=> b!507933 (= e!297230 e!297231)))

(declare-fun res!308891 () Bool)

(assert (=> b!507933 (=> (not res!308891) (not e!297231))))

(declare-datatypes ((SeekEntryResult!4154 0))(
  ( (MissingZero!4154 (index!18804 (_ BitVec 32))) (Found!4154 (index!18805 (_ BitVec 32))) (Intermediate!4154 (undefined!4966 Bool) (index!18806 (_ BitVec 32)) (x!47795 (_ BitVec 32))) (Undefined!4154) (MissingVacant!4154 (index!18807 (_ BitVec 32))) )
))
(declare-fun lt!232120 () SeekEntryResult!4154)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507933 (= res!308891 (or (= lt!232120 (MissingZero!4154 i!1204)) (= lt!232120 (MissingVacant!4154 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32614 (_ BitVec 32)) SeekEntryResult!4154)

(assert (=> b!507933 (= lt!232120 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!308893 () Bool)

(assert (=> start!45858 (=> (not res!308893) (not e!297230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45858 (= res!308893 (validMask!0 mask!3524))))

(assert (=> start!45858 e!297230))

(assert (=> start!45858 true))

(declare-fun array_inv!11483 (array!32614) Bool)

(assert (=> start!45858 (array_inv!11483 a!3235)))

(declare-fun b!507934 () Bool)

(declare-fun res!308897 () Bool)

(assert (=> b!507934 (=> (not res!308897) (not e!297231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32614 (_ BitVec 32)) Bool)

(assert (=> b!507934 (= res!308897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507935 () Bool)

(declare-fun res!308895 () Bool)

(assert (=> b!507935 (=> (not res!308895) (not e!297230))))

(assert (=> b!507935 (= res!308895 (and (= (size!16051 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16051 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16051 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507936 () Bool)

(declare-fun res!308896 () Bool)

(assert (=> b!507936 (=> (not res!308896) (not e!297230))))

(assert (=> b!507936 (= res!308896 (validKeyInArray!0 k!2280))))

(declare-fun b!507937 () Bool)

(declare-fun res!308892 () Bool)

(assert (=> b!507937 (=> (not res!308892) (not e!297230))))

(declare-fun arrayContainsKey!0 (array!32614 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507937 (= res!308892 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507938 () Bool)

(assert (=> b!507938 (= e!297231 false)))

(declare-fun lt!232119 () Bool)

(declare-datatypes ((List!9845 0))(
  ( (Nil!9842) (Cons!9841 (h!10718 (_ BitVec 64)) (t!16073 List!9845)) )
))
(declare-fun arrayNoDuplicates!0 (array!32614 (_ BitVec 32) List!9845) Bool)

(assert (=> b!507938 (= lt!232119 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9842))))

(assert (= (and start!45858 res!308893) b!507935))

(assert (= (and b!507935 res!308895) b!507932))

(assert (= (and b!507932 res!308894) b!507936))

(assert (= (and b!507936 res!308896) b!507937))

(assert (= (and b!507937 res!308892) b!507933))

(assert (= (and b!507933 res!308891) b!507934))

(assert (= (and b!507934 res!308897) b!507938))

(declare-fun m!488787 () Bool)

(assert (=> start!45858 m!488787))

(declare-fun m!488789 () Bool)

(assert (=> start!45858 m!488789))

(declare-fun m!488791 () Bool)

(assert (=> b!507938 m!488791))

(declare-fun m!488793 () Bool)

(assert (=> b!507932 m!488793))

(assert (=> b!507932 m!488793))

(declare-fun m!488795 () Bool)

(assert (=> b!507932 m!488795))

(declare-fun m!488797 () Bool)

(assert (=> b!507936 m!488797))

(declare-fun m!488799 () Bool)

(assert (=> b!507933 m!488799))

(declare-fun m!488801 () Bool)

(assert (=> b!507937 m!488801))

(declare-fun m!488803 () Bool)

(assert (=> b!507934 m!488803))

(push 1)

