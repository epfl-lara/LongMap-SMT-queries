; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49112 () Bool)

(assert start!49112)

(declare-fun b!541016 () Bool)

(declare-fun res!335905 () Bool)

(declare-fun e!313337 () Bool)

(assert (=> b!541016 (=> (not res!335905) (not e!313337))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34222 0))(
  ( (array!34223 (arr!16447 (Array (_ BitVec 32) (_ BitVec 64))) (size!16811 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34222)

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4905 0))(
  ( (MissingZero!4905 (index!21844 (_ BitVec 32))) (Found!4905 (index!21845 (_ BitVec 32))) (Intermediate!4905 (undefined!5717 Bool) (index!21846 (_ BitVec 32)) (x!50756 (_ BitVec 32))) (Undefined!4905) (MissingVacant!4905 (index!21847 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34222 (_ BitVec 32)) SeekEntryResult!4905)

(assert (=> b!541016 (= res!335905 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16447 a!3154) j!147) a!3154 mask!3216) (Intermediate!4905 false resIndex!32 resX!32)))))

(declare-fun b!541017 () Bool)

(declare-fun e!313338 () Bool)

(assert (=> b!541017 (= e!313338 e!313337)))

(declare-fun res!335904 () Bool)

(assert (=> b!541017 (=> (not res!335904) (not e!313337))))

(declare-fun lt!247537 () SeekEntryResult!4905)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541017 (= res!335904 (or (= lt!247537 (MissingZero!4905 i!1153)) (= lt!247537 (MissingVacant!4905 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34222 (_ BitVec 32)) SeekEntryResult!4905)

(assert (=> b!541017 (= lt!247537 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!541018 () Bool)

(declare-fun res!335911 () Bool)

(assert (=> b!541018 (=> (not res!335911) (not e!313338))))

(declare-fun arrayContainsKey!0 (array!34222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541018 (= res!335911 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541019 () Bool)

(declare-fun res!335907 () Bool)

(assert (=> b!541019 (=> (not res!335907) (not e!313337))))

(assert (=> b!541019 (= res!335907 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16811 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16811 a!3154)) (= (select (arr!16447 a!3154) resIndex!32) (select (arr!16447 a!3154) j!147))))))

(declare-fun b!541020 () Bool)

(declare-fun res!335910 () Bool)

(assert (=> b!541020 (=> (not res!335910) (not e!313338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541020 (= res!335910 (validKeyInArray!0 (select (arr!16447 a!3154) j!147)))))

(declare-fun res!335912 () Bool)

(assert (=> start!49112 (=> (not res!335912) (not e!313338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49112 (= res!335912 (validMask!0 mask!3216))))

(assert (=> start!49112 e!313338))

(assert (=> start!49112 true))

(declare-fun array_inv!12243 (array!34222) Bool)

(assert (=> start!49112 (array_inv!12243 a!3154)))

(declare-fun b!541021 () Bool)

(declare-fun res!335908 () Bool)

(assert (=> b!541021 (=> (not res!335908) (not e!313338))))

(assert (=> b!541021 (= res!335908 (validKeyInArray!0 k0!1998))))

(declare-fun b!541022 () Bool)

(assert (=> b!541022 (= e!313337 false)))

(declare-fun lt!247536 () SeekEntryResult!4905)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541022 (= lt!247536 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16447 a!3154) j!147) mask!3216) (select (arr!16447 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541023 () Bool)

(declare-fun res!335906 () Bool)

(assert (=> b!541023 (=> (not res!335906) (not e!313337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34222 (_ BitVec 32)) Bool)

(assert (=> b!541023 (= res!335906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541024 () Bool)

(declare-fun res!335903 () Bool)

(assert (=> b!541024 (=> (not res!335903) (not e!313338))))

(assert (=> b!541024 (= res!335903 (and (= (size!16811 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16811 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16811 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541025 () Bool)

(declare-fun res!335909 () Bool)

(assert (=> b!541025 (=> (not res!335909) (not e!313337))))

(declare-datatypes ((List!10566 0))(
  ( (Nil!10563) (Cons!10562 (h!11511 (_ BitVec 64)) (t!16794 List!10566)) )
))
(declare-fun arrayNoDuplicates!0 (array!34222 (_ BitVec 32) List!10566) Bool)

(assert (=> b!541025 (= res!335909 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10563))))

(assert (= (and start!49112 res!335912) b!541024))

(assert (= (and b!541024 res!335903) b!541020))

(assert (= (and b!541020 res!335910) b!541021))

(assert (= (and b!541021 res!335908) b!541018))

(assert (= (and b!541018 res!335911) b!541017))

(assert (= (and b!541017 res!335904) b!541023))

(assert (= (and b!541023 res!335906) b!541025))

(assert (= (and b!541025 res!335909) b!541019))

(assert (= (and b!541019 res!335907) b!541016))

(assert (= (and b!541016 res!335905) b!541022))

(declare-fun m!519647 () Bool)

(assert (=> start!49112 m!519647))

(declare-fun m!519649 () Bool)

(assert (=> start!49112 m!519649))

(declare-fun m!519651 () Bool)

(assert (=> b!541019 m!519651))

(declare-fun m!519653 () Bool)

(assert (=> b!541019 m!519653))

(assert (=> b!541020 m!519653))

(assert (=> b!541020 m!519653))

(declare-fun m!519655 () Bool)

(assert (=> b!541020 m!519655))

(declare-fun m!519657 () Bool)

(assert (=> b!541025 m!519657))

(declare-fun m!519659 () Bool)

(assert (=> b!541023 m!519659))

(declare-fun m!519661 () Bool)

(assert (=> b!541017 m!519661))

(declare-fun m!519663 () Bool)

(assert (=> b!541021 m!519663))

(assert (=> b!541022 m!519653))

(assert (=> b!541022 m!519653))

(declare-fun m!519665 () Bool)

(assert (=> b!541022 m!519665))

(assert (=> b!541022 m!519665))

(assert (=> b!541022 m!519653))

(declare-fun m!519667 () Bool)

(assert (=> b!541022 m!519667))

(assert (=> b!541016 m!519653))

(assert (=> b!541016 m!519653))

(declare-fun m!519669 () Bool)

(assert (=> b!541016 m!519669))

(declare-fun m!519671 () Bool)

(assert (=> b!541018 m!519671))

(check-sat (not b!541016) (not b!541020) (not b!541017) (not b!541021) (not b!541018) (not b!541022) (not b!541023) (not b!541025) (not start!49112))
(check-sat)
