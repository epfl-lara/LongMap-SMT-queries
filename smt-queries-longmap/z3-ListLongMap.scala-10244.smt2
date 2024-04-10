; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120518 () Bool)

(assert start!120518)

(declare-fun b!1403342 () Bool)

(declare-fun e!794596 () Bool)

(declare-fun e!794597 () Bool)

(assert (=> b!1403342 (= e!794596 (not e!794597))))

(declare-fun res!941856 () Bool)

(assert (=> b!1403342 (=> res!941856 e!794597)))

(declare-datatypes ((SeekEntryResult!10631 0))(
  ( (MissingZero!10631 (index!44901 (_ BitVec 32))) (Found!10631 (index!44902 (_ BitVec 32))) (Intermediate!10631 (undefined!11443 Bool) (index!44903 (_ BitVec 32)) (x!126514 (_ BitVec 32))) (Undefined!10631) (MissingVacant!10631 (index!44904 (_ BitVec 32))) )
))
(declare-fun lt!618365 () SeekEntryResult!10631)

(get-info :version)

(assert (=> b!1403342 (= res!941856 (or (not ((_ is Intermediate!10631) lt!618365)) (undefined!11443 lt!618365)))))

(declare-fun e!794595 () Bool)

(assert (=> b!1403342 e!794595))

(declare-fun res!941860 () Bool)

(assert (=> b!1403342 (=> (not res!941860) (not e!794595))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95927 0))(
  ( (array!95928 (arr!46314 (Array (_ BitVec 32) (_ BitVec 64))) (size!46864 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95927)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95927 (_ BitVec 32)) Bool)

(assert (=> b!1403342 (= res!941860 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47266 0))(
  ( (Unit!47267) )
))
(declare-fun lt!618364 () Unit!47266)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95927 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47266)

(assert (=> b!1403342 (= lt!618364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95927 (_ BitVec 32)) SeekEntryResult!10631)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403342 (= lt!618365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46314 a!2901) j!112) mask!2840) (select (arr!46314 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403343 () Bool)

(declare-fun res!941857 () Bool)

(assert (=> b!1403343 (=> (not res!941857) (not e!794596))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403343 (= res!941857 (and (= (size!46864 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46864 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46864 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403344 () Bool)

(assert (=> b!1403344 (= e!794597 true)))

(declare-fun lt!618366 () SeekEntryResult!10631)

(assert (=> b!1403344 (= lt!618366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46314 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46314 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95928 (store (arr!46314 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46864 a!2901)) mask!2840))))

(declare-fun b!1403345 () Bool)

(declare-fun res!941855 () Bool)

(assert (=> b!1403345 (=> (not res!941855) (not e!794596))))

(assert (=> b!1403345 (= res!941855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403346 () Bool)

(declare-fun res!941853 () Bool)

(assert (=> b!1403346 (=> (not res!941853) (not e!794596))))

(declare-datatypes ((List!32833 0))(
  ( (Nil!32830) (Cons!32829 (h!34077 (_ BitVec 64)) (t!47527 List!32833)) )
))
(declare-fun arrayNoDuplicates!0 (array!95927 (_ BitVec 32) List!32833) Bool)

(assert (=> b!1403346 (= res!941853 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32830))))

(declare-fun b!1403347 () Bool)

(declare-fun res!941859 () Bool)

(assert (=> b!1403347 (=> (not res!941859) (not e!794596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403347 (= res!941859 (validKeyInArray!0 (select (arr!46314 a!2901) j!112)))))

(declare-fun res!941858 () Bool)

(assert (=> start!120518 (=> (not res!941858) (not e!794596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120518 (= res!941858 (validMask!0 mask!2840))))

(assert (=> start!120518 e!794596))

(assert (=> start!120518 true))

(declare-fun array_inv!35342 (array!95927) Bool)

(assert (=> start!120518 (array_inv!35342 a!2901)))

(declare-fun b!1403348 () Bool)

(declare-fun res!941854 () Bool)

(assert (=> b!1403348 (=> (not res!941854) (not e!794596))))

(assert (=> b!1403348 (= res!941854 (validKeyInArray!0 (select (arr!46314 a!2901) i!1037)))))

(declare-fun b!1403349 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95927 (_ BitVec 32)) SeekEntryResult!10631)

(assert (=> b!1403349 (= e!794595 (= (seekEntryOrOpen!0 (select (arr!46314 a!2901) j!112) a!2901 mask!2840) (Found!10631 j!112)))))

(assert (= (and start!120518 res!941858) b!1403343))

(assert (= (and b!1403343 res!941857) b!1403348))

(assert (= (and b!1403348 res!941854) b!1403347))

(assert (= (and b!1403347 res!941859) b!1403345))

(assert (= (and b!1403345 res!941855) b!1403346))

(assert (= (and b!1403346 res!941853) b!1403342))

(assert (= (and b!1403342 res!941860) b!1403349))

(assert (= (and b!1403342 (not res!941856)) b!1403344))

(declare-fun m!1291939 () Bool)

(assert (=> b!1403342 m!1291939))

(declare-fun m!1291941 () Bool)

(assert (=> b!1403342 m!1291941))

(assert (=> b!1403342 m!1291939))

(declare-fun m!1291943 () Bool)

(assert (=> b!1403342 m!1291943))

(assert (=> b!1403342 m!1291941))

(assert (=> b!1403342 m!1291939))

(declare-fun m!1291945 () Bool)

(assert (=> b!1403342 m!1291945))

(declare-fun m!1291947 () Bool)

(assert (=> b!1403342 m!1291947))

(assert (=> b!1403349 m!1291939))

(assert (=> b!1403349 m!1291939))

(declare-fun m!1291949 () Bool)

(assert (=> b!1403349 m!1291949))

(declare-fun m!1291951 () Bool)

(assert (=> b!1403344 m!1291951))

(declare-fun m!1291953 () Bool)

(assert (=> b!1403344 m!1291953))

(assert (=> b!1403344 m!1291953))

(declare-fun m!1291955 () Bool)

(assert (=> b!1403344 m!1291955))

(assert (=> b!1403344 m!1291955))

(assert (=> b!1403344 m!1291953))

(declare-fun m!1291957 () Bool)

(assert (=> b!1403344 m!1291957))

(assert (=> b!1403347 m!1291939))

(assert (=> b!1403347 m!1291939))

(declare-fun m!1291959 () Bool)

(assert (=> b!1403347 m!1291959))

(declare-fun m!1291961 () Bool)

(assert (=> b!1403348 m!1291961))

(assert (=> b!1403348 m!1291961))

(declare-fun m!1291963 () Bool)

(assert (=> b!1403348 m!1291963))

(declare-fun m!1291965 () Bool)

(assert (=> b!1403346 m!1291965))

(declare-fun m!1291967 () Bool)

(assert (=> b!1403345 m!1291967))

(declare-fun m!1291969 () Bool)

(assert (=> start!120518 m!1291969))

(declare-fun m!1291971 () Bool)

(assert (=> start!120518 m!1291971))

(check-sat (not b!1403348) (not b!1403342) (not b!1403345) (not b!1403347) (not b!1403349) (not start!120518) (not b!1403346) (not b!1403344))
