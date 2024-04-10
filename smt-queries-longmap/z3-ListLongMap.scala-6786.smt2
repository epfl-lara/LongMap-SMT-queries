; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85456 () Bool)

(assert start!85456)

(declare-fun res!663963 () Bool)

(declare-fun e!560577 () Bool)

(assert (=> start!85456 (=> (not res!663963) (not e!560577))))

(declare-datatypes ((array!62737 0))(
  ( (array!62738 (arr!30212 (Array (_ BitVec 32) (_ BitVec 64))) (size!30709 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62737)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85456 (= res!663963 (and (= (size!30709 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62738 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30709 a!4424))))))

(assert (=> start!85456 e!560577))

(declare-fun array_inv!23336 (array!62737) Bool)

(assert (=> start!85456 (array_inv!23336 a!4424)))

(assert (=> start!85456 true))

(declare-fun b!993398 () Bool)

(declare-fun res!663961 () Bool)

(assert (=> b!993398 (=> (not res!663961) (not e!560577))))

(declare-datatypes ((List!20930 0))(
  ( (Nil!20927) (Cons!20926 (h!22088 (_ BitVec 64)) (t!29931 List!20930)) )
))
(declare-fun acc!919 () List!20930)

(declare-fun contains!5791 (List!20930 (_ BitVec 64)) Bool)

(assert (=> b!993398 (= res!663961 (not (contains!5791 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993399 () Bool)

(declare-fun res!663962 () Bool)

(assert (=> b!993399 (=> (not res!663962) (not e!560577))))

(assert (=> b!993399 (= res!663962 (not (contains!5791 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993400 () Bool)

(assert (=> b!993400 (= e!560577 false)))

(declare-fun lt!440524 () Bool)

(declare-fun noDuplicate!1389 (List!20930) Bool)

(assert (=> b!993400 (= lt!440524 (noDuplicate!1389 acc!919))))

(assert (= (and start!85456 res!663963) b!993398))

(assert (= (and b!993398 res!663961) b!993399))

(assert (= (and b!993399 res!663962) b!993400))

(declare-fun m!921123 () Bool)

(assert (=> start!85456 m!921123))

(declare-fun m!921125 () Bool)

(assert (=> b!993398 m!921125))

(declare-fun m!921127 () Bool)

(assert (=> b!993399 m!921127))

(declare-fun m!921129 () Bool)

(assert (=> b!993400 m!921129))

(check-sat (not start!85456) (not b!993400) (not b!993399) (not b!993398))
