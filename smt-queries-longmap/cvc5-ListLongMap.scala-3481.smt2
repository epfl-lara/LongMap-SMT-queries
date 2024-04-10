; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48228 () Bool)

(assert start!48228)

(declare-fun b!530912 () Bool)

(declare-fun res!326620 () Bool)

(declare-fun e!309252 () Bool)

(assert (=> b!530912 (=> (not res!326620) (not e!309252))))

(declare-datatypes ((array!33653 0))(
  ( (array!33654 (arr!16173 (Array (_ BitVec 32) (_ BitVec 64))) (size!16537 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33653)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33653 (_ BitVec 32)) Bool)

(assert (=> b!530912 (= res!326620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!530913 () Bool)

(assert (=> b!530913 (= e!309252 (bvsgt #b00000000000000000000000000000000 (size!16537 a!3154)))))

(declare-fun b!530914 () Bool)

(declare-fun e!309250 () Bool)

(assert (=> b!530914 (= e!309250 e!309252)))

(declare-fun res!326624 () Bool)

(assert (=> b!530914 (=> (not res!326624) (not e!309252))))

(declare-datatypes ((SeekEntryResult!4631 0))(
  ( (MissingZero!4631 (index!20748 (_ BitVec 32))) (Found!4631 (index!20749 (_ BitVec 32))) (Intermediate!4631 (undefined!5443 Bool) (index!20750 (_ BitVec 32)) (x!49733 (_ BitVec 32))) (Undefined!4631) (MissingVacant!4631 (index!20751 (_ BitVec 32))) )
))
(declare-fun lt!244822 () SeekEntryResult!4631)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530914 (= res!326624 (or (= lt!244822 (MissingZero!4631 i!1153)) (= lt!244822 (MissingVacant!4631 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33653 (_ BitVec 32)) SeekEntryResult!4631)

(assert (=> b!530914 (= lt!244822 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530915 () Bool)

(declare-fun res!326622 () Bool)

(assert (=> b!530915 (=> (not res!326622) (not e!309250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530915 (= res!326622 (validKeyInArray!0 k!1998))))

(declare-fun b!530916 () Bool)

(declare-fun res!326618 () Bool)

(assert (=> b!530916 (=> (not res!326618) (not e!309250))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530916 (= res!326618 (and (= (size!16537 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16537 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16537 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530917 () Bool)

(declare-fun res!326621 () Bool)

(assert (=> b!530917 (=> (not res!326621) (not e!309250))))

(assert (=> b!530917 (= res!326621 (validKeyInArray!0 (select (arr!16173 a!3154) j!147)))))

(declare-fun res!326619 () Bool)

(assert (=> start!48228 (=> (not res!326619) (not e!309250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48228 (= res!326619 (validMask!0 mask!3216))))

(assert (=> start!48228 e!309250))

(assert (=> start!48228 true))

(declare-fun array_inv!11969 (array!33653) Bool)

(assert (=> start!48228 (array_inv!11969 a!3154)))

(declare-fun b!530918 () Bool)

(declare-fun res!326623 () Bool)

(assert (=> b!530918 (=> (not res!326623) (not e!309250))))

(declare-fun arrayContainsKey!0 (array!33653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530918 (= res!326623 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48228 res!326619) b!530916))

(assert (= (and b!530916 res!326618) b!530917))

(assert (= (and b!530917 res!326621) b!530915))

(assert (= (and b!530915 res!326622) b!530918))

(assert (= (and b!530918 res!326623) b!530914))

(assert (= (and b!530914 res!326624) b!530912))

(assert (= (and b!530912 res!326620) b!530913))

(declare-fun m!511449 () Bool)

(assert (=> b!530915 m!511449))

(declare-fun m!511451 () Bool)

(assert (=> b!530912 m!511451))

(declare-fun m!511453 () Bool)

(assert (=> start!48228 m!511453))

(declare-fun m!511455 () Bool)

(assert (=> start!48228 m!511455))

(declare-fun m!511457 () Bool)

(assert (=> b!530918 m!511457))

(declare-fun m!511459 () Bool)

(assert (=> b!530914 m!511459))

(declare-fun m!511461 () Bool)

(assert (=> b!530917 m!511461))

(assert (=> b!530917 m!511461))

(declare-fun m!511463 () Bool)

(assert (=> b!530917 m!511463))

(push 1)

