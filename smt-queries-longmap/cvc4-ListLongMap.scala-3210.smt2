; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45010 () Bool)

(assert start!45010)

(declare-fun b!493796 () Bool)

(declare-fun res!296372 () Bool)

(declare-fun e!289927 () Bool)

(assert (=> b!493796 (=> (not res!296372) (not e!289927))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493796 (= res!296372 (validKeyInArray!0 k!2280))))

(declare-fun b!493797 () Bool)

(declare-fun e!289929 () Bool)

(declare-fun e!289926 () Bool)

(assert (=> b!493797 (= e!289929 (not e!289926))))

(declare-fun res!296370 () Bool)

(assert (=> b!493797 (=> res!296370 e!289926)))

(declare-datatypes ((SeekEntryResult!3829 0))(
  ( (MissingZero!3829 (index!17495 (_ BitVec 32))) (Found!3829 (index!17496 (_ BitVec 32))) (Intermediate!3829 (undefined!4641 Bool) (index!17497 (_ BitVec 32)) (x!46571 (_ BitVec 32))) (Undefined!3829) (MissingVacant!3829 (index!17498 (_ BitVec 32))) )
))
(declare-fun lt!223386 () SeekEntryResult!3829)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31955 0))(
  ( (array!31956 (arr!15362 (Array (_ BitVec 32) (_ BitVec 64))) (size!15726 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31955)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!223390 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31955 (_ BitVec 32)) SeekEntryResult!3829)

(assert (=> b!493797 (= res!296370 (= lt!223386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223390 (select (store (arr!15362 a!3235) i!1204 k!2280) j!176) (array!31956 (store (arr!15362 a!3235) i!1204 k!2280) (size!15726 a!3235)) mask!3524)))))

(declare-fun lt!223388 () (_ BitVec 32))

(assert (=> b!493797 (= lt!223386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223388 (select (arr!15362 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493797 (= lt!223390 (toIndex!0 (select (store (arr!15362 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493797 (= lt!223388 (toIndex!0 (select (arr!15362 a!3235) j!176) mask!3524))))

(declare-fun lt!223389 () SeekEntryResult!3829)

(assert (=> b!493797 (= lt!223389 (Found!3829 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31955 (_ BitVec 32)) SeekEntryResult!3829)

(assert (=> b!493797 (= lt!223389 (seekEntryOrOpen!0 (select (arr!15362 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31955 (_ BitVec 32)) Bool)

(assert (=> b!493797 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14604 0))(
  ( (Unit!14605) )
))
(declare-fun lt!223387 () Unit!14604)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14604)

(assert (=> b!493797 (= lt!223387 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493798 () Bool)

(declare-fun res!296375 () Bool)

(assert (=> b!493798 (=> (not res!296375) (not e!289929))))

(declare-datatypes ((List!9520 0))(
  ( (Nil!9517) (Cons!9516 (h!10384 (_ BitVec 64)) (t!15748 List!9520)) )
))
(declare-fun arrayNoDuplicates!0 (array!31955 (_ BitVec 32) List!9520) Bool)

(assert (=> b!493798 (= res!296375 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9517))))

(declare-fun b!493799 () Bool)

(declare-fun res!296366 () Bool)

(assert (=> b!493799 (=> (not res!296366) (not e!289927))))

(assert (=> b!493799 (= res!296366 (and (= (size!15726 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15726 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15726 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493800 () Bool)

(declare-fun res!296371 () Bool)

(assert (=> b!493800 (=> res!296371 e!289926)))

(assert (=> b!493800 (= res!296371 (or (not (is-Intermediate!3829 lt!223386)) (not (undefined!4641 lt!223386))))))

(declare-fun b!493801 () Bool)

(declare-fun res!296368 () Bool)

(assert (=> b!493801 (=> (not res!296368) (not e!289927))))

(declare-fun arrayContainsKey!0 (array!31955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493801 (= res!296368 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493802 () Bool)

(declare-fun res!296373 () Bool)

(assert (=> b!493802 (=> (not res!296373) (not e!289929))))

(assert (=> b!493802 (= res!296373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493803 () Bool)

(assert (=> b!493803 (= e!289927 e!289929)))

(declare-fun res!296367 () Bool)

(assert (=> b!493803 (=> (not res!296367) (not e!289929))))

(declare-fun lt!223385 () SeekEntryResult!3829)

(assert (=> b!493803 (= res!296367 (or (= lt!223385 (MissingZero!3829 i!1204)) (= lt!223385 (MissingVacant!3829 i!1204))))))

(assert (=> b!493803 (= lt!223385 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!296369 () Bool)

(assert (=> start!45010 (=> (not res!296369) (not e!289927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45010 (= res!296369 (validMask!0 mask!3524))))

(assert (=> start!45010 e!289927))

(assert (=> start!45010 true))

(declare-fun array_inv!11158 (array!31955) Bool)

(assert (=> start!45010 (array_inv!11158 a!3235)))

(declare-fun b!493804 () Bool)

(declare-fun res!296374 () Bool)

(assert (=> b!493804 (=> (not res!296374) (not e!289927))))

(assert (=> b!493804 (= res!296374 (validKeyInArray!0 (select (arr!15362 a!3235) j!176)))))

(declare-fun b!493805 () Bool)

(assert (=> b!493805 (= e!289926 true)))

(assert (=> b!493805 (= lt!223389 Undefined!3829)))

(assert (= (and start!45010 res!296369) b!493799))

(assert (= (and b!493799 res!296366) b!493804))

(assert (= (and b!493804 res!296374) b!493796))

(assert (= (and b!493796 res!296372) b!493801))

(assert (= (and b!493801 res!296368) b!493803))

(assert (= (and b!493803 res!296367) b!493802))

(assert (= (and b!493802 res!296373) b!493798))

(assert (= (and b!493798 res!296375) b!493797))

(assert (= (and b!493797 (not res!296370)) b!493800))

(assert (= (and b!493800 (not res!296371)) b!493805))

(declare-fun m!474711 () Bool)

(assert (=> b!493797 m!474711))

(declare-fun m!474713 () Bool)

(assert (=> b!493797 m!474713))

(declare-fun m!474715 () Bool)

(assert (=> b!493797 m!474715))

(declare-fun m!474717 () Bool)

(assert (=> b!493797 m!474717))

(assert (=> b!493797 m!474711))

(declare-fun m!474719 () Bool)

(assert (=> b!493797 m!474719))

(declare-fun m!474721 () Bool)

(assert (=> b!493797 m!474721))

(assert (=> b!493797 m!474719))

(declare-fun m!474723 () Bool)

(assert (=> b!493797 m!474723))

(assert (=> b!493797 m!474719))

(declare-fun m!474725 () Bool)

(assert (=> b!493797 m!474725))

(assert (=> b!493797 m!474711))

(declare-fun m!474727 () Bool)

(assert (=> b!493797 m!474727))

(assert (=> b!493797 m!474719))

(declare-fun m!474729 () Bool)

(assert (=> b!493797 m!474729))

(declare-fun m!474731 () Bool)

(assert (=> b!493796 m!474731))

(assert (=> b!493804 m!474719))

(assert (=> b!493804 m!474719))

(declare-fun m!474733 () Bool)

(assert (=> b!493804 m!474733))

(declare-fun m!474735 () Bool)

(assert (=> b!493802 m!474735))

(declare-fun m!474737 () Bool)

(assert (=> b!493803 m!474737))

(declare-fun m!474739 () Bool)

(assert (=> b!493801 m!474739))

(declare-fun m!474741 () Bool)

(assert (=> b!493798 m!474741))

(declare-fun m!474743 () Bool)

(assert (=> start!45010 m!474743))

(declare-fun m!474745 () Bool)

(assert (=> start!45010 m!474745))

(push 1)

(assert (not b!493804))

(assert (not b!493801))

(assert (not b!493802))

(assert (not b!493798))

