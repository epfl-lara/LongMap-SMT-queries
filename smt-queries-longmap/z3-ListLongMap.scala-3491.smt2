; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48416 () Bool)

(assert start!48416)

(declare-fun b!532025 () Bool)

(declare-fun res!327520 () Bool)

(declare-fun e!309815 () Bool)

(assert (=> b!532025 (=> (not res!327520) (not e!309815))))

(declare-datatypes ((array!33724 0))(
  ( (array!33725 (arr!16204 (Array (_ BitVec 32) (_ BitVec 64))) (size!16568 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33724)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532025 (= res!327520 (validKeyInArray!0 (select (arr!16204 a!3154) j!147)))))

(declare-fun b!532026 () Bool)

(declare-fun res!327517 () Bool)

(declare-fun e!309816 () Bool)

(assert (=> b!532026 (=> (not res!327517) (not e!309816))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!532026 (= res!327517 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16568 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16568 a!3154)) (= (select (arr!16204 a!3154) resIndex!32) (select (arr!16204 a!3154) j!147))))))

(declare-fun b!532027 () Bool)

(declare-fun mask!3216 () (_ BitVec 32))

(assert (=> b!532027 (= e!309816 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!532028 () Bool)

(declare-fun res!327519 () Bool)

(assert (=> b!532028 (=> (not res!327519) (not e!309816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33724 (_ BitVec 32)) Bool)

(assert (=> b!532028 (= res!327519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532029 () Bool)

(assert (=> b!532029 (= e!309815 e!309816)))

(declare-fun res!327524 () Bool)

(assert (=> b!532029 (=> (not res!327524) (not e!309816))))

(declare-datatypes ((SeekEntryResult!4662 0))(
  ( (MissingZero!4662 (index!20872 (_ BitVec 32))) (Found!4662 (index!20873 (_ BitVec 32))) (Intermediate!4662 (undefined!5474 Bool) (index!20874 (_ BitVec 32)) (x!49844 (_ BitVec 32))) (Undefined!4662) (MissingVacant!4662 (index!20875 (_ BitVec 32))) )
))
(declare-fun lt!245116 () SeekEntryResult!4662)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532029 (= res!327524 (or (= lt!245116 (MissingZero!4662 i!1153)) (= lt!245116 (MissingVacant!4662 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33724 (_ BitVec 32)) SeekEntryResult!4662)

(assert (=> b!532029 (= lt!245116 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532030 () Bool)

(declare-fun res!327515 () Bool)

(assert (=> b!532030 (=> (not res!327515) (not e!309815))))

(assert (=> b!532030 (= res!327515 (and (= (size!16568 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16568 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16568 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!327523 () Bool)

(assert (=> start!48416 (=> (not res!327523) (not e!309815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48416 (= res!327523 (validMask!0 mask!3216))))

(assert (=> start!48416 e!309815))

(assert (=> start!48416 true))

(declare-fun array_inv!12000 (array!33724) Bool)

(assert (=> start!48416 (array_inv!12000 a!3154)))

(declare-fun b!532031 () Bool)

(declare-fun res!327521 () Bool)

(assert (=> b!532031 (=> (not res!327521) (not e!309815))))

(assert (=> b!532031 (= res!327521 (validKeyInArray!0 k0!1998))))

(declare-fun b!532032 () Bool)

(declare-fun res!327516 () Bool)

(assert (=> b!532032 (=> (not res!327516) (not e!309816))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33724 (_ BitVec 32)) SeekEntryResult!4662)

(assert (=> b!532032 (= res!327516 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16204 a!3154) j!147) a!3154 mask!3216) (Intermediate!4662 false resIndex!32 resX!32)))))

(declare-fun b!532033 () Bool)

(declare-fun res!327518 () Bool)

(assert (=> b!532033 (=> (not res!327518) (not e!309816))))

(declare-datatypes ((List!10323 0))(
  ( (Nil!10320) (Cons!10319 (h!11259 (_ BitVec 64)) (t!16551 List!10323)) )
))
(declare-fun arrayNoDuplicates!0 (array!33724 (_ BitVec 32) List!10323) Bool)

(assert (=> b!532033 (= res!327518 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10320))))

(declare-fun b!532034 () Bool)

(declare-fun res!327522 () Bool)

(assert (=> b!532034 (=> (not res!327522) (not e!309815))))

(declare-fun arrayContainsKey!0 (array!33724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532034 (= res!327522 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48416 res!327523) b!532030))

(assert (= (and b!532030 res!327515) b!532025))

(assert (= (and b!532025 res!327520) b!532031))

(assert (= (and b!532031 res!327521) b!532034))

(assert (= (and b!532034 res!327522) b!532029))

(assert (= (and b!532029 res!327524) b!532028))

(assert (= (and b!532028 res!327519) b!532033))

(assert (= (and b!532033 res!327518) b!532026))

(assert (= (and b!532026 res!327517) b!532032))

(assert (= (and b!532032 res!327516) b!532027))

(declare-fun m!512335 () Bool)

(assert (=> b!532028 m!512335))

(declare-fun m!512337 () Bool)

(assert (=> b!532025 m!512337))

(assert (=> b!532025 m!512337))

(declare-fun m!512339 () Bool)

(assert (=> b!532025 m!512339))

(declare-fun m!512341 () Bool)

(assert (=> b!532034 m!512341))

(declare-fun m!512343 () Bool)

(assert (=> b!532031 m!512343))

(declare-fun m!512345 () Bool)

(assert (=> b!532029 m!512345))

(declare-fun m!512347 () Bool)

(assert (=> start!48416 m!512347))

(declare-fun m!512349 () Bool)

(assert (=> start!48416 m!512349))

(assert (=> b!532032 m!512337))

(assert (=> b!532032 m!512337))

(declare-fun m!512351 () Bool)

(assert (=> b!532032 m!512351))

(declare-fun m!512353 () Bool)

(assert (=> b!532026 m!512353))

(assert (=> b!532026 m!512337))

(declare-fun m!512355 () Bool)

(assert (=> b!532033 m!512355))

(check-sat (not b!532029) (not b!532034) (not b!532025) (not b!532028) (not b!532032) (not start!48416) (not b!532033) (not b!532031))
(check-sat)
