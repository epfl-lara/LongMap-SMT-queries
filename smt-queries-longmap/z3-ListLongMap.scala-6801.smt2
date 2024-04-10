; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85550 () Bool)

(assert start!85550)

(declare-fun res!664429 () Bool)

(declare-fun e!560838 () Bool)

(assert (=> start!85550 (=> (not res!664429) (not e!560838))))

(declare-datatypes ((array!62829 0))(
  ( (array!62830 (arr!30257 (Array (_ BitVec 32) (_ BitVec 64))) (size!30754 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62829)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85550 (= res!664429 (and (= (size!30754 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62830 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30754 a!4424))))))

(assert (=> start!85550 e!560838))

(declare-fun array_inv!23381 (array!62829) Bool)

(assert (=> start!85550 (array_inv!23381 a!4424)))

(assert (=> start!85550 true))

(declare-fun b!993866 () Bool)

(declare-fun res!664431 () Bool)

(assert (=> b!993866 (=> (not res!664431) (not e!560838))))

(declare-datatypes ((List!20972 0))(
  ( (Nil!20969) (Cons!20968 (h!22130 (_ BitVec 64)) (t!29973 List!20972)) )
))
(declare-fun acc!919 () List!20972)

(declare-fun contains!5833 (List!20972 (_ BitVec 64)) Bool)

(assert (=> b!993866 (= res!664431 (not (contains!5833 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993867 () Bool)

(declare-fun res!664430 () Bool)

(assert (=> b!993867 (=> (not res!664430) (not e!560838))))

(assert (=> b!993867 (= res!664430 (not (contains!5833 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993868 () Bool)

(assert (=> b!993868 (= e!560838 false)))

(declare-fun lt!440632 () Bool)

(declare-fun noDuplicate!1431 (List!20972) Bool)

(assert (=> b!993868 (= lt!440632 (noDuplicate!1431 acc!919))))

(assert (= (and start!85550 res!664429) b!993866))

(assert (= (and b!993866 res!664431) b!993867))

(assert (= (and b!993867 res!664430) b!993868))

(declare-fun m!921513 () Bool)

(assert (=> start!85550 m!921513))

(declare-fun m!921515 () Bool)

(assert (=> b!993866 m!921515))

(declare-fun m!921517 () Bool)

(assert (=> b!993867 m!921517))

(declare-fun m!921519 () Bool)

(assert (=> b!993868 m!921519))

(check-sat (not b!993866) (not b!993867) (not start!85550) (not b!993868))
(check-sat)
