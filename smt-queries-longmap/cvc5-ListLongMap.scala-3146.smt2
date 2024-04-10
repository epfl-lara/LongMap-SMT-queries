; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44298 () Bool)

(assert start!44298)

(declare-fun b!487144 () Bool)

(declare-fun res!290533 () Bool)

(declare-fun e!286668 () Bool)

(assert (=> b!487144 (=> (not res!290533) (not e!286668))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31549 0))(
  ( (array!31550 (arr!15168 (Array (_ BitVec 32) (_ BitVec 64))) (size!15532 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31549)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487144 (= res!290533 (and (= (size!15532 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15532 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15532 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487145 () Bool)

(declare-fun res!290532 () Bool)

(assert (=> b!487145 (=> (not res!290532) (not e!286668))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487145 (= res!290532 (validKeyInArray!0 (select (arr!15168 a!3235) j!176)))))

(declare-fun b!487146 () Bool)

(declare-fun res!290535 () Bool)

(assert (=> b!487146 (=> (not res!290535) (not e!286668))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!487146 (= res!290535 (validKeyInArray!0 k!2280))))

(declare-fun b!487148 () Bool)

(declare-fun res!290536 () Bool)

(assert (=> b!487148 (=> (not res!290536) (not e!286668))))

(declare-fun arrayContainsKey!0 (array!31549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487148 (= res!290536 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487149 () Bool)

(declare-fun e!286667 () Bool)

(assert (=> b!487149 (= e!286668 e!286667)))

(declare-fun res!290534 () Bool)

(assert (=> b!487149 (=> (not res!290534) (not e!286667))))

(declare-datatypes ((SeekEntryResult!3635 0))(
  ( (MissingZero!3635 (index!16719 (_ BitVec 32))) (Found!3635 (index!16720 (_ BitVec 32))) (Intermediate!3635 (undefined!4447 Bool) (index!16721 (_ BitVec 32)) (x!45847 (_ BitVec 32))) (Undefined!3635) (MissingVacant!3635 (index!16722 (_ BitVec 32))) )
))
(declare-fun lt!219952 () SeekEntryResult!3635)

(assert (=> b!487149 (= res!290534 (or (= lt!219952 (MissingZero!3635 i!1204)) (= lt!219952 (MissingVacant!3635 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31549 (_ BitVec 32)) SeekEntryResult!3635)

(assert (=> b!487149 (= lt!219952 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487150 () Bool)

(declare-fun res!290537 () Bool)

(assert (=> b!487150 (=> (not res!290537) (not e!286667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31549 (_ BitVec 32)) Bool)

(assert (=> b!487150 (= res!290537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487151 () Bool)

(declare-fun res!290530 () Bool)

(assert (=> b!487151 (=> (not res!290530) (not e!286667))))

(declare-datatypes ((List!9326 0))(
  ( (Nil!9323) (Cons!9322 (h!10178 (_ BitVec 64)) (t!15554 List!9326)) )
))
(declare-fun arrayNoDuplicates!0 (array!31549 (_ BitVec 32) List!9326) Bool)

(assert (=> b!487151 (= res!290530 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9323))))

(declare-fun res!290531 () Bool)

(assert (=> start!44298 (=> (not res!290531) (not e!286668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44298 (= res!290531 (validMask!0 mask!3524))))

(assert (=> start!44298 e!286668))

(assert (=> start!44298 true))

(declare-fun array_inv!10964 (array!31549) Bool)

(assert (=> start!44298 (array_inv!10964 a!3235)))

(declare-fun b!487147 () Bool)

(assert (=> b!487147 (= e!286667 (not true))))

(assert (=> b!487147 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14216 0))(
  ( (Unit!14217) )
))
(declare-fun lt!219951 () Unit!14216)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31549 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14216)

(assert (=> b!487147 (= lt!219951 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44298 res!290531) b!487144))

(assert (= (and b!487144 res!290533) b!487145))

(assert (= (and b!487145 res!290532) b!487146))

(assert (= (and b!487146 res!290535) b!487148))

(assert (= (and b!487148 res!290536) b!487149))

(assert (= (and b!487149 res!290534) b!487150))

(assert (= (and b!487150 res!290537) b!487151))

(assert (= (and b!487151 res!290530) b!487147))

(declare-fun m!466989 () Bool)

(assert (=> b!487150 m!466989))

(declare-fun m!466991 () Bool)

(assert (=> b!487147 m!466991))

(declare-fun m!466993 () Bool)

(assert (=> b!487147 m!466993))

(declare-fun m!466995 () Bool)

(assert (=> start!44298 m!466995))

(declare-fun m!466997 () Bool)

(assert (=> start!44298 m!466997))

(declare-fun m!466999 () Bool)

(assert (=> b!487145 m!466999))

(assert (=> b!487145 m!466999))

(declare-fun m!467001 () Bool)

(assert (=> b!487145 m!467001))

(declare-fun m!467003 () Bool)

(assert (=> b!487151 m!467003))

(declare-fun m!467005 () Bool)

(assert (=> b!487146 m!467005))

(declare-fun m!467007 () Bool)

(assert (=> b!487149 m!467007))

(declare-fun m!467009 () Bool)

(assert (=> b!487148 m!467009))

(push 1)

