; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44306 () Bool)

(assert start!44306)

(declare-fun b!487240 () Bool)

(declare-fun res!290627 () Bool)

(declare-fun e!286703 () Bool)

(assert (=> b!487240 (=> (not res!290627) (not e!286703))))

(declare-datatypes ((array!31557 0))(
  ( (array!31558 (arr!15172 (Array (_ BitVec 32) (_ BitVec 64))) (size!15536 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31557)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487240 (= res!290627 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487241 () Bool)

(declare-fun res!290628 () Bool)

(declare-fun e!286702 () Bool)

(assert (=> b!487241 (=> (not res!290628) (not e!286702))))

(declare-datatypes ((List!9330 0))(
  ( (Nil!9327) (Cons!9326 (h!10182 (_ BitVec 64)) (t!15558 List!9330)) )
))
(declare-fun arrayNoDuplicates!0 (array!31557 (_ BitVec 32) List!9330) Bool)

(assert (=> b!487241 (= res!290628 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9327))))

(declare-fun b!487242 () Bool)

(declare-fun res!290626 () Bool)

(assert (=> b!487242 (=> (not res!290626) (not e!286703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487242 (= res!290626 (validKeyInArray!0 k0!2280))))

(declare-fun b!487243 () Bool)

(assert (=> b!487243 (= e!286702 (not true))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31557 (_ BitVec 32)) Bool)

(assert (=> b!487243 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14224 0))(
  ( (Unit!14225) )
))
(declare-fun lt!219976 () Unit!14224)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14224)

(assert (=> b!487243 (= lt!219976 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487244 () Bool)

(declare-fun res!290630 () Bool)

(assert (=> b!487244 (=> (not res!290630) (not e!286703))))

(assert (=> b!487244 (= res!290630 (validKeyInArray!0 (select (arr!15172 a!3235) j!176)))))

(declare-fun b!487245 () Bool)

(declare-fun res!290632 () Bool)

(assert (=> b!487245 (=> (not res!290632) (not e!286703))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487245 (= res!290632 (and (= (size!15536 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15536 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15536 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!290633 () Bool)

(assert (=> start!44306 (=> (not res!290633) (not e!286703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44306 (= res!290633 (validMask!0 mask!3524))))

(assert (=> start!44306 e!286703))

(assert (=> start!44306 true))

(declare-fun array_inv!10968 (array!31557) Bool)

(assert (=> start!44306 (array_inv!10968 a!3235)))

(declare-fun b!487246 () Bool)

(declare-fun res!290631 () Bool)

(assert (=> b!487246 (=> (not res!290631) (not e!286702))))

(assert (=> b!487246 (= res!290631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487247 () Bool)

(assert (=> b!487247 (= e!286703 e!286702)))

(declare-fun res!290629 () Bool)

(assert (=> b!487247 (=> (not res!290629) (not e!286702))))

(declare-datatypes ((SeekEntryResult!3639 0))(
  ( (MissingZero!3639 (index!16735 (_ BitVec 32))) (Found!3639 (index!16736 (_ BitVec 32))) (Intermediate!3639 (undefined!4451 Bool) (index!16737 (_ BitVec 32)) (x!45859 (_ BitVec 32))) (Undefined!3639) (MissingVacant!3639 (index!16738 (_ BitVec 32))) )
))
(declare-fun lt!219975 () SeekEntryResult!3639)

(assert (=> b!487247 (= res!290629 (or (= lt!219975 (MissingZero!3639 i!1204)) (= lt!219975 (MissingVacant!3639 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31557 (_ BitVec 32)) SeekEntryResult!3639)

(assert (=> b!487247 (= lt!219975 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44306 res!290633) b!487245))

(assert (= (and b!487245 res!290632) b!487244))

(assert (= (and b!487244 res!290630) b!487242))

(assert (= (and b!487242 res!290626) b!487240))

(assert (= (and b!487240 res!290627) b!487247))

(assert (= (and b!487247 res!290629) b!487246))

(assert (= (and b!487246 res!290631) b!487241))

(assert (= (and b!487241 res!290628) b!487243))

(declare-fun m!467077 () Bool)

(assert (=> b!487247 m!467077))

(declare-fun m!467079 () Bool)

(assert (=> start!44306 m!467079))

(declare-fun m!467081 () Bool)

(assert (=> start!44306 m!467081))

(declare-fun m!467083 () Bool)

(assert (=> b!487240 m!467083))

(declare-fun m!467085 () Bool)

(assert (=> b!487241 m!467085))

(declare-fun m!467087 () Bool)

(assert (=> b!487243 m!467087))

(declare-fun m!467089 () Bool)

(assert (=> b!487243 m!467089))

(declare-fun m!467091 () Bool)

(assert (=> b!487242 m!467091))

(declare-fun m!467093 () Bool)

(assert (=> b!487244 m!467093))

(assert (=> b!487244 m!467093))

(declare-fun m!467095 () Bool)

(assert (=> b!487244 m!467095))

(declare-fun m!467097 () Bool)

(assert (=> b!487246 m!467097))

(check-sat (not b!487240) (not b!487241) (not b!487246) (not b!487244) (not b!487243) (not b!487242) (not start!44306) (not b!487247))
