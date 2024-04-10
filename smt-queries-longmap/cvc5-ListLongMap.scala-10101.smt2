; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119100 () Bool)

(assert start!119100)

(declare-fun b!1389505 () Bool)

(declare-fun res!929667 () Bool)

(declare-fun e!787064 () Bool)

(assert (=> b!1389505 (=> (not res!929667) (not e!787064))))

(declare-datatypes ((array!95037 0))(
  ( (array!95038 (arr!45884 (Array (_ BitVec 32) (_ BitVec 64))) (size!46434 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95037)

(declare-datatypes ((List!32403 0))(
  ( (Nil!32400) (Cons!32399 (h!33617 (_ BitVec 64)) (t!47097 List!32403)) )
))
(declare-fun arrayNoDuplicates!0 (array!95037 (_ BitVec 32) List!32403) Bool)

(assert (=> b!1389505 (= res!929667 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32400))))

(declare-fun b!1389506 () Bool)

(declare-fun res!929669 () Bool)

(assert (=> b!1389506 (=> (not res!929669) (not e!787064))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389506 (= res!929669 (and (= (size!46434 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46434 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46434 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!929671 () Bool)

(assert (=> start!119100 (=> (not res!929671) (not e!787064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119100 (= res!929671 (validMask!0 mask!2840))))

(assert (=> start!119100 e!787064))

(assert (=> start!119100 true))

(declare-fun array_inv!34912 (array!95037) Bool)

(assert (=> start!119100 (array_inv!34912 a!2901)))

(declare-fun b!1389507 () Bool)

(declare-fun res!929670 () Bool)

(assert (=> b!1389507 (=> (not res!929670) (not e!787064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389507 (= res!929670 (validKeyInArray!0 (select (arr!45884 a!2901) i!1037)))))

(declare-fun b!1389508 () Bool)

(declare-fun res!929668 () Bool)

(assert (=> b!1389508 (=> (not res!929668) (not e!787064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95037 (_ BitVec 32)) Bool)

(assert (=> b!1389508 (= res!929668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389509 () Bool)

(declare-fun res!929666 () Bool)

(assert (=> b!1389509 (=> (not res!929666) (not e!787064))))

(assert (=> b!1389509 (= res!929666 (validKeyInArray!0 (select (arr!45884 a!2901) j!112)))))

(declare-fun b!1389510 () Bool)

(assert (=> b!1389510 (= e!787064 false)))

(declare-datatypes ((SeekEntryResult!10201 0))(
  ( (MissingZero!10201 (index!43175 (_ BitVec 32))) (Found!10201 (index!43176 (_ BitVec 32))) (Intermediate!10201 (undefined!11013 Bool) (index!43177 (_ BitVec 32)) (x!124871 (_ BitVec 32))) (Undefined!10201) (MissingVacant!10201 (index!43178 (_ BitVec 32))) )
))
(declare-fun lt!610578 () SeekEntryResult!10201)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95037 (_ BitVec 32)) SeekEntryResult!10201)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389510 (= lt!610578 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45884 a!2901) j!112) mask!2840) (select (arr!45884 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119100 res!929671) b!1389506))

(assert (= (and b!1389506 res!929669) b!1389507))

(assert (= (and b!1389507 res!929670) b!1389509))

(assert (= (and b!1389509 res!929666) b!1389508))

(assert (= (and b!1389508 res!929668) b!1389505))

(assert (= (and b!1389505 res!929667) b!1389510))

(declare-fun m!1275147 () Bool)

(assert (=> b!1389507 m!1275147))

(assert (=> b!1389507 m!1275147))

(declare-fun m!1275149 () Bool)

(assert (=> b!1389507 m!1275149))

(declare-fun m!1275151 () Bool)

(assert (=> b!1389505 m!1275151))

(declare-fun m!1275153 () Bool)

(assert (=> b!1389510 m!1275153))

(assert (=> b!1389510 m!1275153))

(declare-fun m!1275155 () Bool)

(assert (=> b!1389510 m!1275155))

(assert (=> b!1389510 m!1275155))

(assert (=> b!1389510 m!1275153))

(declare-fun m!1275157 () Bool)

(assert (=> b!1389510 m!1275157))

(declare-fun m!1275159 () Bool)

(assert (=> b!1389508 m!1275159))

(assert (=> b!1389509 m!1275153))

(assert (=> b!1389509 m!1275153))

(declare-fun m!1275161 () Bool)

(assert (=> b!1389509 m!1275161))

(declare-fun m!1275163 () Bool)

(assert (=> start!119100 m!1275163))

(declare-fun m!1275165 () Bool)

(assert (=> start!119100 m!1275165))

(push 1)

(assert (not b!1389509))

(assert (not b!1389508))

(assert (not b!1389507))

(assert (not b!1389510))

(assert (not b!1389505))

(assert (not start!119100))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

