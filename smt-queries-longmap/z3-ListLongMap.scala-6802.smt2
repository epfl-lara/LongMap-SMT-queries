; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85556 () Bool)

(assert start!85556)

(declare-fun res!664458 () Bool)

(declare-fun e!560855 () Bool)

(assert (=> start!85556 (=> (not res!664458) (not e!560855))))

(declare-datatypes ((array!62835 0))(
  ( (array!62836 (arr!30260 (Array (_ BitVec 32) (_ BitVec 64))) (size!30757 (_ BitVec 32))) )
))
(declare-fun a!4424 () array!62835)

(declare-fun from!3778 () (_ BitVec 32))

(declare-fun size!36 () (_ BitVec 32))

(assert (=> start!85556 (= res!664458 (and (= (size!30757 a!4424) size!36) (bvslt size!36 #b01111111111111111111111111111111) (= a!4424 (array!62836 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) size!36)) (bvsge from!3778 #b00000000000000000000000000000000) (bvsle from!3778 (size!30757 a!4424))))))

(assert (=> start!85556 e!560855))

(declare-fun array_inv!23384 (array!62835) Bool)

(assert (=> start!85556 (array_inv!23384 a!4424)))

(assert (=> start!85556 true))

(declare-fun b!993893 () Bool)

(declare-fun res!664456 () Bool)

(assert (=> b!993893 (=> (not res!664456) (not e!560855))))

(declare-datatypes ((List!20975 0))(
  ( (Nil!20972) (Cons!20971 (h!22133 (_ BitVec 64)) (t!29976 List!20975)) )
))
(declare-fun acc!919 () List!20975)

(declare-fun contains!5836 (List!20975 (_ BitVec 64)) Bool)

(assert (=> b!993893 (= res!664456 (not (contains!5836 acc!919 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993894 () Bool)

(declare-fun res!664457 () Bool)

(assert (=> b!993894 (=> (not res!664457) (not e!560855))))

(assert (=> b!993894 (= res!664457 (not (contains!5836 acc!919 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!993895 () Bool)

(assert (=> b!993895 (= e!560855 false)))

(declare-fun lt!440641 () Bool)

(declare-fun noDuplicate!1434 (List!20975) Bool)

(assert (=> b!993895 (= lt!440641 (noDuplicate!1434 acc!919))))

(assert (= (and start!85556 res!664458) b!993893))

(assert (= (and b!993893 res!664456) b!993894))

(assert (= (and b!993894 res!664457) b!993895))

(declare-fun m!921537 () Bool)

(assert (=> start!85556 m!921537))

(declare-fun m!921539 () Bool)

(assert (=> b!993893 m!921539))

(declare-fun m!921541 () Bool)

(assert (=> b!993894 m!921541))

(declare-fun m!921543 () Bool)

(assert (=> b!993895 m!921543))

(check-sat (not b!993894) (not start!85556) (not b!993895) (not b!993893))
(check-sat)
