; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36518 () Bool)

(assert start!36518)

(declare-fun b!364896 () Bool)

(declare-fun res!203964 () Bool)

(declare-fun e!223355 () Bool)

(assert (=> b!364896 (=> (not res!203964) (not e!223355))))

(declare-datatypes ((array!20777 0))(
  ( (array!20778 (arr!9866 (Array (_ BitVec 32) (_ BitVec 64))) (size!10218 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20777)

(declare-fun i!1472 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!364896 (= res!203964 (not (validKeyInArray!0 (select (arr!9866 a!4289) i!1472))))))

(declare-fun b!364897 () Bool)

(declare-fun res!203965 () Bool)

(assert (=> b!364897 (=> (not res!203965) (not e!223355))))

(declare-fun k0!2974 () (_ BitVec 64))

(assert (=> b!364897 (= res!203965 (validKeyInArray!0 k0!2974))))

(declare-fun res!203962 () Bool)

(assert (=> start!36518 (=> (not res!203962) (not e!223355))))

(assert (=> start!36518 (= res!203962 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10218 a!4289))))))

(assert (=> start!36518 e!223355))

(assert (=> start!36518 true))

(declare-fun array_inv!7308 (array!20777) Bool)

(assert (=> start!36518 (array_inv!7308 a!4289)))

(declare-fun b!364898 () Bool)

(declare-fun res!203961 () Bool)

(assert (=> b!364898 (=> (not res!203961) (not e!223355))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!364898 (= res!203961 (and (bvslt (size!10218 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10218 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!364899 () Bool)

(declare-fun e!223357 () Bool)

(assert (=> b!364899 (= e!223355 e!223357)))

(declare-fun res!203963 () Bool)

(assert (=> b!364899 (=> (not res!203963) (not e!223357))))

(declare-fun lt!168906 () (_ BitVec 32))

(declare-fun lt!168907 () (_ BitVec 32))

(assert (=> b!364899 (= res!203963 (and (= lt!168906 (bvadd #b00000000000000000000000000000001 lt!168907)) (bvsgt from!3650 #b00000000000000000000000000000000)))))

(declare-fun lt!168909 () array!20777)

(declare-fun arrayCountValidKeys!0 (array!20777 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!364899 (= lt!168906 (arrayCountValidKeys!0 lt!168909 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364899 (= lt!168907 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364899 (= lt!168909 (array!20778 (store (arr!9866 a!4289) i!1472 k0!2974) (size!10218 a!4289)))))

(declare-fun lt!168910 () (_ BitVec 32))

(declare-fun b!364900 () Bool)

(declare-fun lt!168905 () (_ BitVec 32))

(assert (=> b!364900 (= e!223357 (not (or (bvsgt (bvsub from!3650 #b00000000000000000000000000000001) (size!10218 a!4289)) (bvslt i!1472 (bvsub from!3650 #b00000000000000000000000000000001)) (not (= lt!168910 (bvadd #b00000000000000000000000000000001 lt!168905))) (bvslt (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))))

(declare-fun lt!168908 () (_ BitVec 32))

(assert (=> b!364900 (= (bvadd lt!168908 lt!168906) lt!168910)))

(assert (=> b!364900 (= lt!168910 (arrayCountValidKeys!0 lt!168909 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364900 (= lt!168908 (arrayCountValidKeys!0 lt!168909 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-datatypes ((Unit!11366 0))(
  ( (Unit!11367) )
))
(declare-fun lt!168911 () Unit!11366)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11366)

(assert (=> b!364900 (= lt!168911 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!168909 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(declare-fun lt!168913 () (_ BitVec 32))

(assert (=> b!364900 (= (bvadd lt!168913 lt!168907) lt!168905)))

(assert (=> b!364900 (= lt!168905 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472)))))

(assert (=> b!364900 (= lt!168913 (arrayCountValidKeys!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) from!3650))))

(declare-fun lt!168912 () Unit!11366)

(assert (=> b!364900 (= lt!168912 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4289 (bvsub from!3650 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1472) from!3650))))

(assert (= (and start!36518 res!203962) b!364896))

(assert (= (and b!364896 res!203964) b!364897))

(assert (= (and b!364897 res!203965) b!364898))

(assert (= (and b!364898 res!203961) b!364899))

(assert (= (and b!364899 res!203963) b!364900))

(declare-fun m!362623 () Bool)

(assert (=> b!364896 m!362623))

(assert (=> b!364896 m!362623))

(declare-fun m!362625 () Bool)

(assert (=> b!364896 m!362625))

(declare-fun m!362627 () Bool)

(assert (=> b!364897 m!362627))

(declare-fun m!362629 () Bool)

(assert (=> b!364900 m!362629))

(declare-fun m!362631 () Bool)

(assert (=> b!364900 m!362631))

(declare-fun m!362633 () Bool)

(assert (=> b!364900 m!362633))

(declare-fun m!362635 () Bool)

(assert (=> b!364900 m!362635))

(declare-fun m!362637 () Bool)

(assert (=> b!364900 m!362637))

(declare-fun m!362639 () Bool)

(assert (=> b!364900 m!362639))

(declare-fun m!362641 () Bool)

(assert (=> start!36518 m!362641))

(declare-fun m!362643 () Bool)

(assert (=> b!364899 m!362643))

(declare-fun m!362645 () Bool)

(assert (=> b!364899 m!362645))

(declare-fun m!362647 () Bool)

(assert (=> b!364899 m!362647))

(check-sat (not b!364896) (not start!36518) (not b!364899) (not b!364897) (not b!364900))
(check-sat)
