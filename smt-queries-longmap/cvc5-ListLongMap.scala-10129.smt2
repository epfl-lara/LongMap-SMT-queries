; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119430 () Bool)

(assert start!119430)

(declare-fun res!931607 () Bool)

(declare-fun e!788186 () Bool)

(assert (=> start!119430 (=> (not res!931607) (not e!788186))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119430 (= res!931607 (validMask!0 mask!2840))))

(assert (=> start!119430 e!788186))

(assert (=> start!119430 true))

(declare-datatypes ((array!95214 0))(
  ( (array!95215 (arr!45968 (Array (_ BitVec 32) (_ BitVec 64))) (size!46518 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95214)

(declare-fun array_inv!34996 (array!95214) Bool)

(assert (=> start!119430 (array_inv!34996 a!2901)))

(declare-fun b!1391885 () Bool)

(declare-fun e!788184 () Bool)

(assert (=> b!1391885 (= e!788186 (not e!788184))))

(declare-fun res!931612 () Bool)

(assert (=> b!1391885 (=> res!931612 e!788184)))

(declare-datatypes ((SeekEntryResult!10285 0))(
  ( (MissingZero!10285 (index!43511 (_ BitVec 32))) (Found!10285 (index!43512 (_ BitVec 32))) (Intermediate!10285 (undefined!11097 Bool) (index!43513 (_ BitVec 32)) (x!125197 (_ BitVec 32))) (Undefined!10285) (MissingVacant!10285 (index!43514 (_ BitVec 32))) )
))
(declare-fun lt!611385 () SeekEntryResult!10285)

(assert (=> b!1391885 (= res!931612 (or (not (is-Intermediate!10285 lt!611385)) (undefined!11097 lt!611385)))))

(declare-fun e!788183 () Bool)

(assert (=> b!1391885 e!788183))

(declare-fun res!931611 () Bool)

(assert (=> b!1391885 (=> (not res!931611) (not e!788183))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95214 (_ BitVec 32)) Bool)

(assert (=> b!1391885 (= res!931611 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46574 0))(
  ( (Unit!46575) )
))
(declare-fun lt!611383 () Unit!46574)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46574)

(assert (=> b!1391885 (= lt!611383 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95214 (_ BitVec 32)) SeekEntryResult!10285)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391885 (= lt!611385 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45968 a!2901) j!112) mask!2840) (select (arr!45968 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391886 () Bool)

(declare-fun res!931610 () Bool)

(assert (=> b!1391886 (=> (not res!931610) (not e!788186))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391886 (= res!931610 (validKeyInArray!0 (select (arr!45968 a!2901) i!1037)))))

(declare-fun b!1391887 () Bool)

(declare-fun res!931608 () Bool)

(assert (=> b!1391887 (=> (not res!931608) (not e!788186))))

(declare-datatypes ((List!32487 0))(
  ( (Nil!32484) (Cons!32483 (h!33710 (_ BitVec 64)) (t!47181 List!32487)) )
))
(declare-fun arrayNoDuplicates!0 (array!95214 (_ BitVec 32) List!32487) Bool)

(assert (=> b!1391887 (= res!931608 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32484))))

(declare-fun b!1391888 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95214 (_ BitVec 32)) SeekEntryResult!10285)

(assert (=> b!1391888 (= e!788183 (= (seekEntryOrOpen!0 (select (arr!45968 a!2901) j!112) a!2901 mask!2840) (Found!10285 j!112)))))

(declare-fun b!1391889 () Bool)

(declare-fun res!931609 () Bool)

(assert (=> b!1391889 (=> (not res!931609) (not e!788186))))

(assert (=> b!1391889 (= res!931609 (validKeyInArray!0 (select (arr!45968 a!2901) j!112)))))

(declare-fun b!1391890 () Bool)

(declare-fun res!931606 () Bool)

(assert (=> b!1391890 (=> (not res!931606) (not e!788186))))

(assert (=> b!1391890 (= res!931606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391891 () Bool)

(declare-fun res!931605 () Bool)

(assert (=> b!1391891 (=> (not res!931605) (not e!788186))))

(assert (=> b!1391891 (= res!931605 (and (= (size!46518 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46518 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46518 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391892 () Bool)

(assert (=> b!1391892 (= e!788184 (bvsge mask!2840 #b00000000000000000000000000000000))))

(declare-fun lt!611384 () (_ BitVec 32))

(assert (=> b!1391892 (= lt!611384 (toIndex!0 (select (store (arr!45968 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(assert (= (and start!119430 res!931607) b!1391891))

(assert (= (and b!1391891 res!931605) b!1391886))

(assert (= (and b!1391886 res!931610) b!1391889))

(assert (= (and b!1391889 res!931609) b!1391890))

(assert (= (and b!1391890 res!931606) b!1391887))

(assert (= (and b!1391887 res!931608) b!1391885))

(assert (= (and b!1391885 res!931611) b!1391888))

(assert (= (and b!1391885 (not res!931612)) b!1391892))

(declare-fun m!1277619 () Bool)

(assert (=> b!1391889 m!1277619))

(assert (=> b!1391889 m!1277619))

(declare-fun m!1277621 () Bool)

(assert (=> b!1391889 m!1277621))

(declare-fun m!1277623 () Bool)

(assert (=> b!1391886 m!1277623))

(assert (=> b!1391886 m!1277623))

(declare-fun m!1277625 () Bool)

(assert (=> b!1391886 m!1277625))

(declare-fun m!1277627 () Bool)

(assert (=> b!1391892 m!1277627))

(declare-fun m!1277629 () Bool)

(assert (=> b!1391892 m!1277629))

(assert (=> b!1391892 m!1277629))

(declare-fun m!1277631 () Bool)

(assert (=> b!1391892 m!1277631))

(declare-fun m!1277633 () Bool)

(assert (=> b!1391890 m!1277633))

(declare-fun m!1277635 () Bool)

(assert (=> b!1391887 m!1277635))

(assert (=> b!1391885 m!1277619))

(declare-fun m!1277637 () Bool)

(assert (=> b!1391885 m!1277637))

(assert (=> b!1391885 m!1277619))

(declare-fun m!1277639 () Bool)

(assert (=> b!1391885 m!1277639))

(assert (=> b!1391885 m!1277637))

(assert (=> b!1391885 m!1277619))

(declare-fun m!1277641 () Bool)

(assert (=> b!1391885 m!1277641))

(declare-fun m!1277643 () Bool)

(assert (=> b!1391885 m!1277643))

(declare-fun m!1277645 () Bool)

(assert (=> start!119430 m!1277645))

(declare-fun m!1277647 () Bool)

(assert (=> start!119430 m!1277647))

(assert (=> b!1391888 m!1277619))

(assert (=> b!1391888 m!1277619))

(declare-fun m!1277649 () Bool)

(assert (=> b!1391888 m!1277649))

(push 1)

