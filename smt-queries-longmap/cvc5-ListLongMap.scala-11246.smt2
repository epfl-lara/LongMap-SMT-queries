; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131144 () Bool)

(assert start!131144)

(declare-fun b!1538442 () Bool)

(declare-fun res!1055422 () Bool)

(declare-fun e!855997 () Bool)

(assert (=> b!1538442 (=> (not res!1055422) (not e!855997))))

(declare-datatypes ((array!102209 0))(
  ( (array!102210 (arr!49319 (Array (_ BitVec 32) (_ BitVec 64))) (size!49869 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102209)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538442 (= res!1055422 (and (= (size!49869 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49869 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49869 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1055425 () Bool)

(assert (=> start!131144 (=> (not res!1055425) (not e!855997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131144 (= res!1055425 (validMask!0 mask!2480))))

(assert (=> start!131144 e!855997))

(assert (=> start!131144 true))

(declare-fun array_inv!38347 (array!102209) Bool)

(assert (=> start!131144 (array_inv!38347 a!2792)))

(declare-fun b!1538443 () Bool)

(declare-fun res!1055424 () Bool)

(assert (=> b!1538443 (=> (not res!1055424) (not e!855997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538443 (= res!1055424 (validKeyInArray!0 (select (arr!49319 a!2792) i!951)))))

(declare-fun b!1538444 () Bool)

(declare-fun res!1055421 () Bool)

(assert (=> b!1538444 (=> (not res!1055421) (not e!855997))))

(assert (=> b!1538444 (= res!1055421 (validKeyInArray!0 (select (arr!49319 a!2792) j!64)))))

(declare-fun b!1538445 () Bool)

(assert (=> b!1538445 (= e!855997 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664900 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538445 (= lt!664900 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538446 () Bool)

(declare-fun res!1055428 () Bool)

(assert (=> b!1538446 (=> (not res!1055428) (not e!855997))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13445 0))(
  ( (MissingZero!13445 (index!56175 (_ BitVec 32))) (Found!13445 (index!56176 (_ BitVec 32))) (Intermediate!13445 (undefined!14257 Bool) (index!56177 (_ BitVec 32)) (x!137914 (_ BitVec 32))) (Undefined!13445) (MissingVacant!13445 (index!56178 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102209 (_ BitVec 32)) SeekEntryResult!13445)

(assert (=> b!1538446 (= res!1055428 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49319 a!2792) j!64) a!2792 mask!2480) (Found!13445 j!64)))))

(declare-fun b!1538447 () Bool)

(declare-fun res!1055420 () Bool)

(assert (=> b!1538447 (=> (not res!1055420) (not e!855997))))

(assert (=> b!1538447 (= res!1055420 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49869 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49869 a!2792)) (= (select (arr!49319 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538448 () Bool)

(declare-fun res!1055426 () Bool)

(assert (=> b!1538448 (=> (not res!1055426) (not e!855997))))

(assert (=> b!1538448 (= res!1055426 (not (= (select (arr!49319 a!2792) index!463) (select (arr!49319 a!2792) j!64))))))

(declare-fun b!1538449 () Bool)

(declare-fun res!1055423 () Bool)

(assert (=> b!1538449 (=> (not res!1055423) (not e!855997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102209 (_ BitVec 32)) Bool)

(assert (=> b!1538449 (= res!1055423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538450 () Bool)

(declare-fun res!1055427 () Bool)

(assert (=> b!1538450 (=> (not res!1055427) (not e!855997))))

(declare-datatypes ((List!35793 0))(
  ( (Nil!35790) (Cons!35789 (h!37234 (_ BitVec 64)) (t!50487 List!35793)) )
))
(declare-fun arrayNoDuplicates!0 (array!102209 (_ BitVec 32) List!35793) Bool)

(assert (=> b!1538450 (= res!1055427 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35790))))

(assert (= (and start!131144 res!1055425) b!1538442))

(assert (= (and b!1538442 res!1055422) b!1538443))

(assert (= (and b!1538443 res!1055424) b!1538444))

(assert (= (and b!1538444 res!1055421) b!1538449))

(assert (= (and b!1538449 res!1055423) b!1538450))

(assert (= (and b!1538450 res!1055427) b!1538447))

(assert (= (and b!1538447 res!1055420) b!1538446))

(assert (= (and b!1538446 res!1055428) b!1538448))

(assert (= (and b!1538448 res!1055426) b!1538445))

(declare-fun m!1420875 () Bool)

(assert (=> b!1538448 m!1420875))

(declare-fun m!1420877 () Bool)

(assert (=> b!1538448 m!1420877))

(declare-fun m!1420879 () Bool)

(assert (=> b!1538443 m!1420879))

(assert (=> b!1538443 m!1420879))

(declare-fun m!1420881 () Bool)

(assert (=> b!1538443 m!1420881))

(declare-fun m!1420883 () Bool)

(assert (=> b!1538450 m!1420883))

(assert (=> b!1538444 m!1420877))

(assert (=> b!1538444 m!1420877))

(declare-fun m!1420885 () Bool)

(assert (=> b!1538444 m!1420885))

(assert (=> b!1538446 m!1420877))

(assert (=> b!1538446 m!1420877))

(declare-fun m!1420887 () Bool)

(assert (=> b!1538446 m!1420887))

(declare-fun m!1420889 () Bool)

(assert (=> b!1538447 m!1420889))

(declare-fun m!1420891 () Bool)

(assert (=> b!1538445 m!1420891))

(declare-fun m!1420893 () Bool)

(assert (=> start!131144 m!1420893))

(declare-fun m!1420895 () Bool)

(assert (=> start!131144 m!1420895))

(declare-fun m!1420897 () Bool)

(assert (=> b!1538449 m!1420897))

(push 1)

(assert (not b!1538450))

(assert (not b!1538443))

(assert (not b!1538445))

(assert (not start!131144))

(assert (not b!1538444))

(assert (not b!1538446))

(assert (not b!1538449))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

