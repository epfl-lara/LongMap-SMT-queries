; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45864 () Bool)

(assert start!45864)

(declare-fun b!507995 () Bool)

(declare-fun res!308957 () Bool)

(declare-fun e!297258 () Bool)

(assert (=> b!507995 (=> (not res!308957) (not e!297258))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32620 0))(
  ( (array!32621 (arr!15690 (Array (_ BitVec 32) (_ BitVec 64))) (size!16054 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32620)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507995 (= res!308957 (and (= (size!16054 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16054 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16054 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507996 () Bool)

(declare-fun res!308959 () Bool)

(assert (=> b!507996 (=> (not res!308959) (not e!297258))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507996 (= res!308959 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507997 () Bool)

(declare-fun e!297257 () Bool)

(assert (=> b!507997 (= e!297258 e!297257)))

(declare-fun res!308958 () Bool)

(assert (=> b!507997 (=> (not res!308958) (not e!297257))))

(declare-datatypes ((SeekEntryResult!4157 0))(
  ( (MissingZero!4157 (index!18816 (_ BitVec 32))) (Found!4157 (index!18817 (_ BitVec 32))) (Intermediate!4157 (undefined!4969 Bool) (index!18818 (_ BitVec 32)) (x!47806 (_ BitVec 32))) (Undefined!4157) (MissingVacant!4157 (index!18819 (_ BitVec 32))) )
))
(declare-fun lt!232137 () SeekEntryResult!4157)

(assert (=> b!507997 (= res!308958 (or (= lt!232137 (MissingZero!4157 i!1204)) (= lt!232137 (MissingVacant!4157 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32620 (_ BitVec 32)) SeekEntryResult!4157)

(assert (=> b!507997 (= lt!232137 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507998 () Bool)

(declare-fun res!308956 () Bool)

(assert (=> b!507998 (=> (not res!308956) (not e!297258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507998 (= res!308956 (validKeyInArray!0 k!2280))))

(declare-fun b!508000 () Bool)

(assert (=> b!508000 (= e!297257 false)))

(declare-fun lt!232138 () Bool)

(declare-datatypes ((List!9848 0))(
  ( (Nil!9845) (Cons!9844 (h!10721 (_ BitVec 64)) (t!16076 List!9848)) )
))
(declare-fun arrayNoDuplicates!0 (array!32620 (_ BitVec 32) List!9848) Bool)

(assert (=> b!508000 (= lt!232138 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9845))))

(declare-fun b!508001 () Bool)

(declare-fun res!308955 () Bool)

(assert (=> b!508001 (=> (not res!308955) (not e!297257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32620 (_ BitVec 32)) Bool)

(assert (=> b!508001 (= res!308955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507999 () Bool)

(declare-fun res!308954 () Bool)

(assert (=> b!507999 (=> (not res!308954) (not e!297258))))

(assert (=> b!507999 (= res!308954 (validKeyInArray!0 (select (arr!15690 a!3235) j!176)))))

(declare-fun res!308960 () Bool)

(assert (=> start!45864 (=> (not res!308960) (not e!297258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45864 (= res!308960 (validMask!0 mask!3524))))

(assert (=> start!45864 e!297258))

(assert (=> start!45864 true))

(declare-fun array_inv!11486 (array!32620) Bool)

(assert (=> start!45864 (array_inv!11486 a!3235)))

(assert (= (and start!45864 res!308960) b!507995))

(assert (= (and b!507995 res!308957) b!507999))

(assert (= (and b!507999 res!308954) b!507998))

(assert (= (and b!507998 res!308956) b!507996))

(assert (= (and b!507996 res!308959) b!507997))

(assert (= (and b!507997 res!308958) b!508001))

(assert (= (and b!508001 res!308955) b!508000))

(declare-fun m!488841 () Bool)

(assert (=> b!507996 m!488841))

(declare-fun m!488843 () Bool)

(assert (=> b!507997 m!488843))

(declare-fun m!488845 () Bool)

(assert (=> b!507999 m!488845))

(assert (=> b!507999 m!488845))

(declare-fun m!488847 () Bool)

(assert (=> b!507999 m!488847))

(declare-fun m!488849 () Bool)

(assert (=> b!508000 m!488849))

(declare-fun m!488851 () Bool)

(assert (=> b!508001 m!488851))

(declare-fun m!488853 () Bool)

(assert (=> start!45864 m!488853))

(declare-fun m!488855 () Bool)

(assert (=> start!45864 m!488855))

(declare-fun m!488857 () Bool)

(assert (=> b!507998 m!488857))

(push 1)

