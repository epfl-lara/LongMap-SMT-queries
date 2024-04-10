; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44274 () Bool)

(assert start!44274)

(declare-fun b!486872 () Bool)

(declare-fun res!290262 () Bool)

(declare-fun e!286558 () Bool)

(assert (=> b!486872 (=> (not res!290262) (not e!286558))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486872 (= res!290262 (validKeyInArray!0 k!2280))))

(declare-fun b!486873 () Bool)

(declare-fun e!286559 () Bool)

(assert (=> b!486873 (= e!286559 false)))

(declare-fun lt!219880 () Bool)

(declare-datatypes ((array!31525 0))(
  ( (array!31526 (arr!15156 (Array (_ BitVec 32) (_ BitVec 64))) (size!15520 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31525)

(declare-datatypes ((List!9314 0))(
  ( (Nil!9311) (Cons!9310 (h!10166 (_ BitVec 64)) (t!15542 List!9314)) )
))
(declare-fun arrayNoDuplicates!0 (array!31525 (_ BitVec 32) List!9314) Bool)

(assert (=> b!486873 (= lt!219880 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9311))))

(declare-fun b!486874 () Bool)

(assert (=> b!486874 (= e!286558 e!286559)))

(declare-fun res!290261 () Bool)

(assert (=> b!486874 (=> (not res!290261) (not e!286559))))

(declare-datatypes ((SeekEntryResult!3623 0))(
  ( (MissingZero!3623 (index!16671 (_ BitVec 32))) (Found!3623 (index!16672 (_ BitVec 32))) (Intermediate!3623 (undefined!4435 Bool) (index!16673 (_ BitVec 32)) (x!45803 (_ BitVec 32))) (Undefined!3623) (MissingVacant!3623 (index!16674 (_ BitVec 32))) )
))
(declare-fun lt!219879 () SeekEntryResult!3623)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486874 (= res!290261 (or (= lt!219879 (MissingZero!3623 i!1204)) (= lt!219879 (MissingVacant!3623 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31525 (_ BitVec 32)) SeekEntryResult!3623)

(assert (=> b!486874 (= lt!219879 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!486875 () Bool)

(declare-fun res!290264 () Bool)

(assert (=> b!486875 (=> (not res!290264) (not e!286559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31525 (_ BitVec 32)) Bool)

(assert (=> b!486875 (= res!290264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486876 () Bool)

(declare-fun res!290258 () Bool)

(assert (=> b!486876 (=> (not res!290258) (not e!286558))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486876 (= res!290258 (and (= (size!15520 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15520 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15520 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!290260 () Bool)

(assert (=> start!44274 (=> (not res!290260) (not e!286558))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44274 (= res!290260 (validMask!0 mask!3524))))

(assert (=> start!44274 e!286558))

(assert (=> start!44274 true))

(declare-fun array_inv!10952 (array!31525) Bool)

(assert (=> start!44274 (array_inv!10952 a!3235)))

(declare-fun b!486877 () Bool)

(declare-fun res!290259 () Bool)

(assert (=> b!486877 (=> (not res!290259) (not e!286558))))

(assert (=> b!486877 (= res!290259 (validKeyInArray!0 (select (arr!15156 a!3235) j!176)))))

(declare-fun b!486878 () Bool)

(declare-fun res!290263 () Bool)

(assert (=> b!486878 (=> (not res!290263) (not e!286558))))

(declare-fun arrayContainsKey!0 (array!31525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486878 (= res!290263 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44274 res!290260) b!486876))

(assert (= (and b!486876 res!290258) b!486877))

(assert (= (and b!486877 res!290259) b!486872))

(assert (= (and b!486872 res!290262) b!486878))

(assert (= (and b!486878 res!290263) b!486874))

(assert (= (and b!486874 res!290261) b!486875))

(assert (= (and b!486875 res!290264) b!486873))

(declare-fun m!466749 () Bool)

(assert (=> b!486877 m!466749))

(assert (=> b!486877 m!466749))

(declare-fun m!466751 () Bool)

(assert (=> b!486877 m!466751))

(declare-fun m!466753 () Bool)

(assert (=> b!486875 m!466753))

(declare-fun m!466755 () Bool)

(assert (=> start!44274 m!466755))

(declare-fun m!466757 () Bool)

(assert (=> start!44274 m!466757))

(declare-fun m!466759 () Bool)

(assert (=> b!486874 m!466759))

(declare-fun m!466761 () Bool)

(assert (=> b!486878 m!466761))

(declare-fun m!466763 () Bool)

(assert (=> b!486872 m!466763))

(declare-fun m!466765 () Bool)

(assert (=> b!486873 m!466765))

(push 1)

