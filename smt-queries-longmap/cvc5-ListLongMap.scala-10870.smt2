; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127392 () Bool)

(assert start!127392)

(declare-fun res!1018839 () Bool)

(declare-fun e!838675 () Bool)

(assert (=> start!127392 (=> (not res!1018839) (not e!838675))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127392 (= res!1018839 (validMask!0 mask!2661))))

(assert (=> start!127392 e!838675))

(assert (=> start!127392 true))

(declare-datatypes ((array!99854 0))(
  ( (array!99855 (arr!48191 (Array (_ BitVec 32) (_ BitVec 64))) (size!48741 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99854)

(declare-fun array_inv!37219 (array!99854) Bool)

(assert (=> start!127392 (array_inv!37219 a!2850)))

(declare-fun b!1497706 () Bool)

(declare-fun res!1018837 () Bool)

(assert (=> b!1497706 (=> (not res!1018837) (not e!838675))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497706 (= res!1018837 (validKeyInArray!0 (select (arr!48191 a!2850) j!87)))))

(declare-fun b!1497707 () Bool)

(declare-fun res!1018840 () Bool)

(assert (=> b!1497707 (=> (not res!1018840) (not e!838675))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1497707 (= res!1018840 (and (= (size!48741 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48741 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48741 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1497708 () Bool)

(assert (=> b!1497708 (= e!838675 (and (bvsle #b00000000000000000000000000000000 (size!48741 a!2850)) (bvsge (size!48741 a!2850) #b01111111111111111111111111111111)))))

(declare-fun b!1497709 () Bool)

(declare-fun res!1018838 () Bool)

(assert (=> b!1497709 (=> (not res!1018838) (not e!838675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99854 (_ BitVec 32)) Bool)

(assert (=> b!1497709 (= res!1018838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1497710 () Bool)

(declare-fun res!1018836 () Bool)

(assert (=> b!1497710 (=> (not res!1018836) (not e!838675))))

(assert (=> b!1497710 (= res!1018836 (validKeyInArray!0 (select (arr!48191 a!2850) i!996)))))

(assert (= (and start!127392 res!1018839) b!1497707))

(assert (= (and b!1497707 res!1018840) b!1497710))

(assert (= (and b!1497710 res!1018836) b!1497706))

(assert (= (and b!1497706 res!1018837) b!1497709))

(assert (= (and b!1497709 res!1018838) b!1497708))

(declare-fun m!1380793 () Bool)

(assert (=> start!127392 m!1380793))

(declare-fun m!1380795 () Bool)

(assert (=> start!127392 m!1380795))

(declare-fun m!1380797 () Bool)

(assert (=> b!1497706 m!1380797))

(assert (=> b!1497706 m!1380797))

(declare-fun m!1380799 () Bool)

(assert (=> b!1497706 m!1380799))

(declare-fun m!1380801 () Bool)

(assert (=> b!1497709 m!1380801))

(declare-fun m!1380803 () Bool)

(assert (=> b!1497710 m!1380803))

(assert (=> b!1497710 m!1380803))

(declare-fun m!1380805 () Bool)

(assert (=> b!1497710 m!1380805))

(push 1)

(assert (not start!127392))

(assert (not b!1497706))

(assert (not b!1497709))

(assert (not b!1497710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!157433 () Bool)

(assert (=> d!157433 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127392 d!157433))

(declare-fun d!157441 () Bool)

(assert (=> d!157441 (= (array_inv!37219 a!2850) (bvsge (size!48741 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127392 d!157441))

(declare-fun d!157443 () Bool)

(assert (=> d!157443 (= (validKeyInArray!0 (select (arr!48191 a!2850) j!87)) (and (not (= (select (arr!48191 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48191 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497706 d!157443))

(declare-fun bm!68046 () Bool)

(declare-fun call!68049 () Bool)

(assert (=> bm!68046 (= call!68049 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1497773 () Bool)

(declare-fun e!838712 () Bool)

(assert (=> b!1497773 (= e!838712 call!68049)))

(declare-fun b!1497774 () Bool)

(declare-fun e!838714 () Bool)

(assert (=> b!1497774 (= e!838714 e!838712)))

(declare-fun lt!652529 () (_ BitVec 64))

(assert (=> b!1497774 (= lt!652529 (select (arr!48191 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50190 0))(
  ( (Unit!50191) )
))
(declare-fun lt!652530 () Unit!50190)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99854 (_ BitVec 64) (_ BitVec 32)) Unit!50190)

(assert (=> b!1497774 (= lt!652530 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!652529 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1497774 (arrayContainsKey!0 a!2850 lt!652529 #b00000000000000000000000000000000)))

(declare-fun lt!652531 () Unit!50190)

(assert (=> b!1497774 (= lt!652531 lt!652530)))

(declare-fun res!1018888 () Bool)

(declare-datatypes ((SeekEntryResult!12425 0))(
  ( (MissingZero!12425 (index!52092 (_ BitVec 32))) (Found!12425 (index!52093 (_ BitVec 32))) (Intermediate!12425 (undefined!13237 Bool) (index!52094 (_ BitVec 32)) (x!133731 (_ BitVec 32))) (Undefined!12425) (MissingVacant!12425 (index!52095 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99854 (_ BitVec 32)) SeekEntryResult!12425)

(assert (=> b!1497774 (= res!1018888 (= (seekEntryOrOpen!0 (select (arr!48191 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12425 #b00000000000000000000000000000000)))))

(assert (=> b!1497774 (=> (not res!1018888) (not e!838712))))

(declare-fun b!1497775 () Bool)

(assert (=> b!1497775 (= e!838714 call!68049)))

(declare-fun d!157445 () Bool)

(declare-fun res!1018887 () Bool)

(declare-fun e!838713 () Bool)

(assert (=> d!157445 (=> res!1018887 e!838713)))

(assert (=> d!157445 (= res!1018887 (bvsge #b00000000000000000000000000000000 (size!48741 a!2850)))))

(assert (=> d!157445 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!838713)))

(declare-fun b!1497776 () Bool)

(assert (=> b!1497776 (= e!838713 e!838714)))

(declare-fun c!138977 () Bool)

(assert (=> b!1497776 (= c!138977 (validKeyInArray!0 (select (arr!48191 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!157445 (not res!1018887)) b!1497776))

(assert (= (and b!1497776 c!138977) b!1497774))

(assert (= (and b!1497776 (not c!138977)) b!1497775))

(assert (= (and b!1497774 res!1018888) b!1497773))

(assert (= (or b!1497773 b!1497775) bm!68046))

(declare-fun m!1380859 () Bool)

(assert (=> bm!68046 m!1380859))

(declare-fun m!1380861 () Bool)

(assert (=> b!1497774 m!1380861))

(declare-fun m!1380863 () Bool)

(assert (=> b!1497774 m!1380863))

(declare-fun m!1380865 () Bool)

(assert (=> b!1497774 m!1380865))

(assert (=> b!1497774 m!1380861))

(declare-fun m!1380867 () Bool)

(assert (=> b!1497774 m!1380867))

(assert (=> b!1497776 m!1380861))

(assert (=> b!1497776 m!1380861))

(declare-fun m!1380869 () Bool)

(assert (=> b!1497776 m!1380869))

(assert (=> b!1497709 d!157445))

(declare-fun d!157451 () Bool)

(assert (=> d!157451 (= (validKeyInArray!0 (select (arr!48191 a!2850) i!996)) (and (not (= (select (arr!48191 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48191 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497710 d!157451))

(push 1)

(assert (not b!1497776))

(assert (not bm!68046))

(assert (not b!1497774))

(check-sat)

