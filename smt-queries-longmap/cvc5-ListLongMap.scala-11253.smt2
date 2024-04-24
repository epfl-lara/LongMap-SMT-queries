; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131608 () Bool)

(assert start!131608)

(declare-fun b!1541499 () Bool)

(declare-fun res!1056903 () Bool)

(declare-fun e!857644 () Bool)

(assert (=> b!1541499 (=> (not res!1056903) (not e!857644))))

(declare-datatypes ((array!102377 0))(
  ( (array!102378 (arr!49395 (Array (_ BitVec 32) (_ BitVec 64))) (size!49946 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102377)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541499 (= res!1056903 (validKeyInArray!0 (select (arr!49395 a!2792) i!951)))))

(declare-fun b!1541500 () Bool)

(declare-fun res!1056904 () Bool)

(assert (=> b!1541500 (=> (not res!1056904) (not e!857644))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1541500 (= res!1056904 (and (= (size!49946 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49946 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49946 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1541501 () Bool)

(declare-fun res!1056908 () Bool)

(assert (=> b!1541501 (=> (not res!1056908) (not e!857644))))

(assert (=> b!1541501 (= res!1056908 (validKeyInArray!0 (select (arr!49395 a!2792) j!64)))))

(declare-fun b!1541502 () Bool)

(declare-fun res!1056907 () Bool)

(assert (=> b!1541502 (=> (not res!1056907) (not e!857644))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1541502 (= res!1056907 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49946 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49946 a!2792)) (= (select (arr!49395 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1056905 () Bool)

(assert (=> start!131608 (=> (not res!1056905) (not e!857644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131608 (= res!1056905 (validMask!0 mask!2480))))

(assert (=> start!131608 e!857644))

(assert (=> start!131608 true))

(declare-fun array_inv!38676 (array!102377) Bool)

(assert (=> start!131608 (array_inv!38676 a!2792)))

(declare-fun b!1541503 () Bool)

(declare-fun res!1056909 () Bool)

(assert (=> b!1541503 (=> (not res!1056909) (not e!857644))))

(declare-datatypes ((SeekEntryResult!13416 0))(
  ( (MissingZero!13416 (index!56059 (_ BitVec 32))) (Found!13416 (index!56060 (_ BitVec 32))) (Intermediate!13416 (undefined!14228 Bool) (index!56061 (_ BitVec 32)) (x!137991 (_ BitVec 32))) (Undefined!13416) (MissingVacant!13416 (index!56062 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102377 (_ BitVec 32)) SeekEntryResult!13416)

(assert (=> b!1541503 (= res!1056909 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49395 a!2792) j!64) a!2792 mask!2480) (Found!13416 j!64)))))

(declare-fun b!1541504 () Bool)

(declare-fun res!1056902 () Bool)

(assert (=> b!1541504 (=> (not res!1056902) (not e!857644))))

(assert (=> b!1541504 (= res!1056902 (not (= (select (arr!49395 a!2792) index!463) (select (arr!49395 a!2792) j!64))))))

(declare-fun b!1541505 () Bool)

(declare-fun res!1056906 () Bool)

(assert (=> b!1541505 (=> (not res!1056906) (not e!857644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102377 (_ BitVec 32)) Bool)

(assert (=> b!1541505 (= res!1056906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1541506 () Bool)

(declare-fun res!1056901 () Bool)

(assert (=> b!1541506 (=> (not res!1056901) (not e!857644))))

(declare-datatypes ((List!35856 0))(
  ( (Nil!35853) (Cons!35852 (h!37315 (_ BitVec 64)) (t!50542 List!35856)) )
))
(declare-fun arrayNoDuplicates!0 (array!102377 (_ BitVec 32) List!35856) Bool)

(assert (=> b!1541506 (= res!1056901 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35853))))

(declare-fun b!1541507 () Bool)

(assert (=> b!1541507 (= e!857644 false)))

(declare-fun lt!665880 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1541507 (= lt!665880 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(assert (= (and start!131608 res!1056905) b!1541500))

(assert (= (and b!1541500 res!1056904) b!1541499))

(assert (= (and b!1541499 res!1056903) b!1541501))

(assert (= (and b!1541501 res!1056908) b!1541505))

(assert (= (and b!1541505 res!1056906) b!1541506))

(assert (= (and b!1541506 res!1056901) b!1541502))

(assert (= (and b!1541502 res!1056907) b!1541503))

(assert (= (and b!1541503 res!1056909) b!1541504))

(assert (= (and b!1541504 res!1056902) b!1541507))

(declare-fun m!1423663 () Bool)

(assert (=> b!1541499 m!1423663))

(assert (=> b!1541499 m!1423663))

(declare-fun m!1423665 () Bool)

(assert (=> b!1541499 m!1423665))

(declare-fun m!1423667 () Bool)

(assert (=> b!1541505 m!1423667))

(declare-fun m!1423669 () Bool)

(assert (=> start!131608 m!1423669))

(declare-fun m!1423671 () Bool)

(assert (=> start!131608 m!1423671))

(declare-fun m!1423673 () Bool)

(assert (=> b!1541506 m!1423673))

(declare-fun m!1423675 () Bool)

(assert (=> b!1541501 m!1423675))

(assert (=> b!1541501 m!1423675))

(declare-fun m!1423677 () Bool)

(assert (=> b!1541501 m!1423677))

(declare-fun m!1423679 () Bool)

(assert (=> b!1541507 m!1423679))

(declare-fun m!1423681 () Bool)

(assert (=> b!1541504 m!1423681))

(assert (=> b!1541504 m!1423675))

(declare-fun m!1423683 () Bool)

(assert (=> b!1541502 m!1423683))

(assert (=> b!1541503 m!1423675))

(assert (=> b!1541503 m!1423675))

(declare-fun m!1423685 () Bool)

(assert (=> b!1541503 m!1423685))

(push 1)

(assert (not b!1541507))

(assert (not b!1541499))

(assert (not b!1541506))

(assert (not start!131608))

(assert (not b!1541505))

(assert (not b!1541503))

(assert (not b!1541501))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

