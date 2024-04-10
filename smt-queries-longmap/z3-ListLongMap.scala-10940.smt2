; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127976 () Bool)

(assert start!127976)

(declare-fun b!1503444 () Bool)

(declare-fun res!1024330 () Bool)

(declare-fun e!840613 () Bool)

(assert (=> b!1503444 (=> (not res!1024330) (not e!840613))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100291 0))(
  ( (array!100292 (arr!48402 (Array (_ BitVec 32) (_ BitVec 64))) (size!48952 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100291)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12600 0))(
  ( (MissingZero!12600 (index!52792 (_ BitVec 32))) (Found!12600 (index!52793 (_ BitVec 32))) (Intermediate!12600 (undefined!13412 Bool) (index!52794 (_ BitVec 32)) (x!134472 (_ BitVec 32))) (Undefined!12600) (MissingVacant!12600 (index!52795 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100291 (_ BitVec 32)) SeekEntryResult!12600)

(assert (=> b!1503444 (= res!1024330 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48402 a!2850) j!87) a!2850 mask!2661) (Found!12600 j!87)))))

(declare-fun b!1503445 () Bool)

(assert (=> b!1503445 (= e!840613 false)))

(declare-fun lt!653527 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503445 (= lt!653527 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503446 () Bool)

(declare-fun res!1024328 () Bool)

(assert (=> b!1503446 (=> (not res!1024328) (not e!840613))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1503446 (= res!1024328 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48952 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48952 a!2850)) (= (select (arr!48402 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48402 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48952 a!2850))))))

(declare-fun b!1503447 () Bool)

(declare-fun res!1024323 () Bool)

(assert (=> b!1503447 (=> (not res!1024323) (not e!840613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100291 (_ BitVec 32)) Bool)

(assert (=> b!1503447 (= res!1024323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503449 () Bool)

(declare-fun res!1024329 () Bool)

(assert (=> b!1503449 (=> (not res!1024329) (not e!840613))))

(assert (=> b!1503449 (= res!1024329 (not (= (select (arr!48402 a!2850) index!625) (select (arr!48402 a!2850) j!87))))))

(declare-fun b!1503450 () Bool)

(declare-fun res!1024324 () Bool)

(assert (=> b!1503450 (=> (not res!1024324) (not e!840613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503450 (= res!1024324 (validKeyInArray!0 (select (arr!48402 a!2850) i!996)))))

(declare-fun b!1503451 () Bool)

(declare-fun res!1024325 () Bool)

(assert (=> b!1503451 (=> (not res!1024325) (not e!840613))))

(assert (=> b!1503451 (= res!1024325 (and (= (size!48952 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48952 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48952 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503452 () Bool)

(declare-fun res!1024322 () Bool)

(assert (=> b!1503452 (=> (not res!1024322) (not e!840613))))

(declare-datatypes ((List!34894 0))(
  ( (Nil!34891) (Cons!34890 (h!36287 (_ BitVec 64)) (t!49588 List!34894)) )
))
(declare-fun arrayNoDuplicates!0 (array!100291 (_ BitVec 32) List!34894) Bool)

(assert (=> b!1503452 (= res!1024322 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34891))))

(declare-fun b!1503448 () Bool)

(declare-fun res!1024327 () Bool)

(assert (=> b!1503448 (=> (not res!1024327) (not e!840613))))

(assert (=> b!1503448 (= res!1024327 (validKeyInArray!0 (select (arr!48402 a!2850) j!87)))))

(declare-fun res!1024326 () Bool)

(assert (=> start!127976 (=> (not res!1024326) (not e!840613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127976 (= res!1024326 (validMask!0 mask!2661))))

(assert (=> start!127976 e!840613))

(assert (=> start!127976 true))

(declare-fun array_inv!37430 (array!100291) Bool)

(assert (=> start!127976 (array_inv!37430 a!2850)))

(assert (= (and start!127976 res!1024326) b!1503451))

(assert (= (and b!1503451 res!1024325) b!1503450))

(assert (= (and b!1503450 res!1024324) b!1503448))

(assert (= (and b!1503448 res!1024327) b!1503447))

(assert (= (and b!1503447 res!1024323) b!1503452))

(assert (= (and b!1503452 res!1024322) b!1503446))

(assert (= (and b!1503446 res!1024328) b!1503444))

(assert (= (and b!1503444 res!1024330) b!1503449))

(assert (= (and b!1503449 res!1024329) b!1503445))

(declare-fun m!1386695 () Bool)

(assert (=> b!1503448 m!1386695))

(assert (=> b!1503448 m!1386695))

(declare-fun m!1386697 () Bool)

(assert (=> b!1503448 m!1386697))

(declare-fun m!1386699 () Bool)

(assert (=> b!1503446 m!1386699))

(declare-fun m!1386701 () Bool)

(assert (=> b!1503446 m!1386701))

(declare-fun m!1386703 () Bool)

(assert (=> b!1503446 m!1386703))

(declare-fun m!1386705 () Bool)

(assert (=> b!1503452 m!1386705))

(declare-fun m!1386707 () Bool)

(assert (=> b!1503449 m!1386707))

(assert (=> b!1503449 m!1386695))

(declare-fun m!1386709 () Bool)

(assert (=> b!1503450 m!1386709))

(assert (=> b!1503450 m!1386709))

(declare-fun m!1386711 () Bool)

(assert (=> b!1503450 m!1386711))

(assert (=> b!1503444 m!1386695))

(assert (=> b!1503444 m!1386695))

(declare-fun m!1386713 () Bool)

(assert (=> b!1503444 m!1386713))

(declare-fun m!1386715 () Bool)

(assert (=> b!1503445 m!1386715))

(declare-fun m!1386717 () Bool)

(assert (=> b!1503447 m!1386717))

(declare-fun m!1386719 () Bool)

(assert (=> start!127976 m!1386719))

(declare-fun m!1386721 () Bool)

(assert (=> start!127976 m!1386721))

(check-sat (not b!1503445) (not b!1503444) (not b!1503450) (not start!127976) (not b!1503447) (not b!1503452) (not b!1503448))
