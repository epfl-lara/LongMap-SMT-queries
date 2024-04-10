; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131176 () Bool)

(assert start!131176)

(declare-fun b!1538874 () Bool)

(declare-fun res!1055860 () Bool)

(declare-fun e!856092 () Bool)

(assert (=> b!1538874 (=> (not res!1055860) (not e!856092))))

(declare-datatypes ((array!102241 0))(
  ( (array!102242 (arr!49335 (Array (_ BitVec 32) (_ BitVec 64))) (size!49885 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102241)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538874 (= res!1055860 (and (= (size!49885 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49885 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49885 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538875 () Bool)

(declare-fun res!1055854 () Bool)

(assert (=> b!1538875 (=> (not res!1055854) (not e!856092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538875 (= res!1055854 (validKeyInArray!0 (select (arr!49335 a!2792) j!64)))))

(declare-fun b!1538876 () Bool)

(assert (=> b!1538876 (= e!856092 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664948 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538876 (= lt!664948 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538877 () Bool)

(declare-fun res!1055859 () Bool)

(assert (=> b!1538877 (=> (not res!1055859) (not e!856092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102241 (_ BitVec 32)) Bool)

(assert (=> b!1538877 (= res!1055859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1055852 () Bool)

(assert (=> start!131176 (=> (not res!1055852) (not e!856092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131176 (= res!1055852 (validMask!0 mask!2480))))

(assert (=> start!131176 e!856092))

(assert (=> start!131176 true))

(declare-fun array_inv!38363 (array!102241) Bool)

(assert (=> start!131176 (array_inv!38363 a!2792)))

(declare-fun b!1538878 () Bool)

(declare-fun res!1055853 () Bool)

(assert (=> b!1538878 (=> (not res!1055853) (not e!856092))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1538878 (= res!1055853 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49885 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49885 a!2792)) (= (select (arr!49335 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538879 () Bool)

(declare-fun res!1055857 () Bool)

(assert (=> b!1538879 (=> (not res!1055857) (not e!856092))))

(declare-datatypes ((SeekEntryResult!13461 0))(
  ( (MissingZero!13461 (index!56239 (_ BitVec 32))) (Found!13461 (index!56240 (_ BitVec 32))) (Intermediate!13461 (undefined!14273 Bool) (index!56241 (_ BitVec 32)) (x!137970 (_ BitVec 32))) (Undefined!13461) (MissingVacant!13461 (index!56242 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102241 (_ BitVec 32)) SeekEntryResult!13461)

(assert (=> b!1538879 (= res!1055857 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49335 a!2792) j!64) a!2792 mask!2480) (Found!13461 j!64)))))

(declare-fun b!1538880 () Bool)

(declare-fun res!1055858 () Bool)

(assert (=> b!1538880 (=> (not res!1055858) (not e!856092))))

(assert (=> b!1538880 (= res!1055858 (not (= (select (arr!49335 a!2792) index!463) (select (arr!49335 a!2792) j!64))))))

(declare-fun b!1538881 () Bool)

(declare-fun res!1055856 () Bool)

(assert (=> b!1538881 (=> (not res!1055856) (not e!856092))))

(declare-datatypes ((List!35809 0))(
  ( (Nil!35806) (Cons!35805 (h!37250 (_ BitVec 64)) (t!50503 List!35809)) )
))
(declare-fun arrayNoDuplicates!0 (array!102241 (_ BitVec 32) List!35809) Bool)

(assert (=> b!1538881 (= res!1055856 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35806))))

(declare-fun b!1538882 () Bool)

(declare-fun res!1055855 () Bool)

(assert (=> b!1538882 (=> (not res!1055855) (not e!856092))))

(assert (=> b!1538882 (= res!1055855 (validKeyInArray!0 (select (arr!49335 a!2792) i!951)))))

(assert (= (and start!131176 res!1055852) b!1538874))

(assert (= (and b!1538874 res!1055860) b!1538882))

(assert (= (and b!1538882 res!1055855) b!1538875))

(assert (= (and b!1538875 res!1055854) b!1538877))

(assert (= (and b!1538877 res!1055859) b!1538881))

(assert (= (and b!1538881 res!1055856) b!1538878))

(assert (= (and b!1538878 res!1055853) b!1538879))

(assert (= (and b!1538879 res!1055857) b!1538880))

(assert (= (and b!1538880 res!1055858) b!1538876))

(declare-fun m!1421259 () Bool)

(assert (=> b!1538882 m!1421259))

(assert (=> b!1538882 m!1421259))

(declare-fun m!1421261 () Bool)

(assert (=> b!1538882 m!1421261))

(declare-fun m!1421263 () Bool)

(assert (=> b!1538876 m!1421263))

(declare-fun m!1421265 () Bool)

(assert (=> b!1538878 m!1421265))

(declare-fun m!1421267 () Bool)

(assert (=> b!1538880 m!1421267))

(declare-fun m!1421269 () Bool)

(assert (=> b!1538880 m!1421269))

(assert (=> b!1538879 m!1421269))

(assert (=> b!1538879 m!1421269))

(declare-fun m!1421271 () Bool)

(assert (=> b!1538879 m!1421271))

(assert (=> b!1538875 m!1421269))

(assert (=> b!1538875 m!1421269))

(declare-fun m!1421273 () Bool)

(assert (=> b!1538875 m!1421273))

(declare-fun m!1421275 () Bool)

(assert (=> start!131176 m!1421275))

(declare-fun m!1421277 () Bool)

(assert (=> start!131176 m!1421277))

(declare-fun m!1421279 () Bool)

(assert (=> b!1538877 m!1421279))

(declare-fun m!1421281 () Bool)

(assert (=> b!1538881 m!1421281))

(check-sat (not start!131176) (not b!1538876) (not b!1538882) (not b!1538879) (not b!1538881) (not b!1538875) (not b!1538877))
