; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48712 () Bool)

(assert start!48712)

(declare-fun b!535421 () Bool)

(declare-fun res!330631 () Bool)

(declare-fun e!311031 () Bool)

(assert (=> b!535421 (=> (not res!330631) (not e!311031))))

(declare-datatypes ((array!33924 0))(
  ( (array!33925 (arr!16301 (Array (_ BitVec 32) (_ BitVec 64))) (size!16665 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33924)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33924 (_ BitVec 32)) Bool)

(assert (=> b!535421 (= res!330631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535422 () Bool)

(declare-fun res!330628 () Bool)

(assert (=> b!535422 (=> (not res!330628) (not e!311031))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535422 (= res!330628 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16665 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16665 a!3154)) (= (select (arr!16301 a!3154) resIndex!32) (select (arr!16301 a!3154) j!147))))))

(declare-fun b!535423 () Bool)

(declare-fun res!330634 () Bool)

(declare-fun e!311030 () Bool)

(assert (=> b!535423 (=> (not res!330634) (not e!311030))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535423 (= res!330634 (validKeyInArray!0 k!1998))))

(declare-fun b!535424 () Bool)

(declare-fun res!330627 () Bool)

(assert (=> b!535424 (=> (not res!330627) (not e!311031))))

(declare-datatypes ((List!10420 0))(
  ( (Nil!10417) (Cons!10416 (h!11359 (_ BitVec 64)) (t!16648 List!10420)) )
))
(declare-fun arrayNoDuplicates!0 (array!33924 (_ BitVec 32) List!10420) Bool)

(assert (=> b!535424 (= res!330627 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10417))))

(declare-fun b!535425 () Bool)

(declare-fun res!330632 () Bool)

(assert (=> b!535425 (=> (not res!330632) (not e!311030))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535425 (= res!330632 (and (= (size!16665 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16665 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16665 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535427 () Bool)

(assert (=> b!535427 (= e!311030 e!311031)))

(declare-fun res!330633 () Bool)

(assert (=> b!535427 (=> (not res!330633) (not e!311031))))

(declare-datatypes ((SeekEntryResult!4759 0))(
  ( (MissingZero!4759 (index!21260 (_ BitVec 32))) (Found!4759 (index!21261 (_ BitVec 32))) (Intermediate!4759 (undefined!5571 Bool) (index!21262 (_ BitVec 32)) (x!50206 (_ BitVec 32))) (Undefined!4759) (MissingVacant!4759 (index!21263 (_ BitVec 32))) )
))
(declare-fun lt!245821 () SeekEntryResult!4759)

(assert (=> b!535427 (= res!330633 (or (= lt!245821 (MissingZero!4759 i!1153)) (= lt!245821 (MissingVacant!4759 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33924 (_ BitVec 32)) SeekEntryResult!4759)

(assert (=> b!535427 (= lt!245821 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535428 () Bool)

(declare-fun res!330635 () Bool)

(assert (=> b!535428 (=> (not res!330635) (not e!311031))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33924 (_ BitVec 32)) SeekEntryResult!4759)

(assert (=> b!535428 (= res!330635 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16301 a!3154) j!147) a!3154 mask!3216) (Intermediate!4759 false resIndex!32 resX!32)))))

(declare-fun b!535429 () Bool)

(declare-fun res!330629 () Bool)

(assert (=> b!535429 (=> (not res!330629) (not e!311030))))

(declare-fun arrayContainsKey!0 (array!33924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535429 (= res!330629 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535430 () Bool)

(declare-fun res!330630 () Bool)

(assert (=> b!535430 (=> (not res!330630) (not e!311030))))

(assert (=> b!535430 (= res!330630 (validKeyInArray!0 (select (arr!16301 a!3154) j!147)))))

(declare-fun res!330626 () Bool)

(assert (=> start!48712 (=> (not res!330626) (not e!311030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48712 (= res!330626 (validMask!0 mask!3216))))

(assert (=> start!48712 e!311030))

(assert (=> start!48712 true))

(declare-fun array_inv!12097 (array!33924) Bool)

(assert (=> start!48712 (array_inv!12097 a!3154)))

(declare-fun b!535426 () Bool)

(assert (=> b!535426 (= e!311031 false)))

(declare-fun lt!245820 () SeekEntryResult!4759)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535426 (= lt!245820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16301 a!3154) j!147) mask!3216) (select (arr!16301 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48712 res!330626) b!535425))

(assert (= (and b!535425 res!330632) b!535430))

(assert (= (and b!535430 res!330630) b!535423))

(assert (= (and b!535423 res!330634) b!535429))

(assert (= (and b!535429 res!330629) b!535427))

(assert (= (and b!535427 res!330633) b!535421))

(assert (= (and b!535421 res!330631) b!535424))

(assert (= (and b!535424 res!330627) b!535422))

(assert (= (and b!535422 res!330628) b!535428))

(assert (= (and b!535428 res!330635) b!535426))

(declare-fun m!515011 () Bool)

(assert (=> b!535421 m!515011))

(declare-fun m!515013 () Bool)

(assert (=> b!535430 m!515013))

(assert (=> b!535430 m!515013))

(declare-fun m!515015 () Bool)

(assert (=> b!535430 m!515015))

(declare-fun m!515017 () Bool)

(assert (=> b!535429 m!515017))

(declare-fun m!515019 () Bool)

(assert (=> b!535427 m!515019))

(declare-fun m!515021 () Bool)

(assert (=> b!535422 m!515021))

(assert (=> b!535422 m!515013))

(assert (=> b!535426 m!515013))

(assert (=> b!535426 m!515013))

(declare-fun m!515023 () Bool)

(assert (=> b!535426 m!515023))

(assert (=> b!535426 m!515023))

(assert (=> b!535426 m!515013))

(declare-fun m!515025 () Bool)

(assert (=> b!535426 m!515025))

(declare-fun m!515027 () Bool)

(assert (=> b!535423 m!515027))

(declare-fun m!515029 () Bool)

(assert (=> b!535424 m!515029))

(assert (=> b!535428 m!515013))

(assert (=> b!535428 m!515013))

(declare-fun m!515031 () Bool)

(assert (=> b!535428 m!515031))

(declare-fun m!515033 () Bool)

(assert (=> start!48712 m!515033))

(declare-fun m!515035 () Bool)

(assert (=> start!48712 m!515035))

(push 1)

(assert (not b!535424))

(assert (not b!535429))

(assert (not b!535426))

(assert (not b!535430))

(assert (not b!535428))

(assert (not b!535421))

(assert (not start!48712))

