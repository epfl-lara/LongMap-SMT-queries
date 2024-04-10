; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131482 () Bool)

(assert start!131482)

(declare-fun res!1057618 () Bool)

(declare-fun e!857064 () Bool)

(assert (=> start!131482 (=> (not res!1057618) (not e!857064))))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131482 (= res!1057618 (validMask!0 mask!4052))))

(assert (=> start!131482 e!857064))

(assert (=> start!131482 true))

(declare-datatypes ((array!102385 0))(
  ( (array!102386 (arr!49401 (Array (_ BitVec 32) (_ BitVec 64))) (size!49951 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102385)

(declare-fun array_inv!38429 (array!102385) Bool)

(assert (=> start!131482 (array_inv!38429 a!3920)))

(declare-fun b!1541068 () Bool)

(declare-fun res!1057614 () Bool)

(assert (=> b!1541068 (=> (not res!1057614) (not e!857064))))

(declare-fun newFrom!293 () (_ BitVec 32))

(declare-fun from!3298 () (_ BitVec 32))

(assert (=> b!1541068 (= res!1057614 (and (= (size!49951 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49951 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49951 a!3920))))))

(declare-fun b!1541069 () Bool)

(declare-fun res!1057615 () Bool)

(assert (=> b!1541069 (=> (not res!1057615) (not e!857064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102385 (_ BitVec 32)) Bool)

(assert (=> b!1541069 (= res!1057615 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1541070 () Bool)

(declare-fun res!1057616 () Bool)

(assert (=> b!1541070 (=> (not res!1057616) (not e!857064))))

(assert (=> b!1541070 (= res!1057616 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun b!1541071 () Bool)

(declare-fun res!1057617 () Bool)

(assert (=> b!1541071 (=> (not res!1057617) (not e!857064))))

(assert (=> b!1541071 (= res!1057617 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49951 a!3920))))))

(declare-fun b!1541072 () Bool)

(assert (=> b!1541072 (= e!857064 (not (bvsge newFrom!293 #b00000000000000000000000000000000)))))

(assert (=> b!1541072 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51464 0))(
  ( (Unit!51465) )
))
(declare-fun lt!665575 () Unit!51464)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102385 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51464)

(assert (=> b!1541072 (= lt!665575 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(assert (= (and start!131482 res!1057618) b!1541068))

(assert (= (and b!1541068 res!1057614) b!1541070))

(assert (= (and b!1541070 res!1057616) b!1541071))

(assert (= (and b!1541071 res!1057617) b!1541069))

(assert (= (and b!1541069 res!1057615) b!1541072))

(declare-fun m!1423095 () Bool)

(assert (=> start!131482 m!1423095))

(declare-fun m!1423097 () Bool)

(assert (=> start!131482 m!1423097))

(declare-fun m!1423099 () Bool)

(assert (=> b!1541069 m!1423099))

(declare-fun m!1423101 () Bool)

(assert (=> b!1541070 m!1423101))

(declare-fun m!1423103 () Bool)

(assert (=> b!1541072 m!1423103))

(declare-fun m!1423105 () Bool)

(assert (=> b!1541072 m!1423105))

(check-sat (not b!1541069) (not b!1541070) (not start!131482) (not b!1541072))
(check-sat)
