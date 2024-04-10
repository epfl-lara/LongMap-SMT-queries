; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123572 () Bool)

(assert start!123572)

(declare-fun b!1432865 () Bool)

(declare-fun res!966732 () Bool)

(declare-fun e!808787 () Bool)

(assert (=> b!1432865 (=> (not res!966732) (not e!808787))))

(declare-datatypes ((array!97544 0))(
  ( (array!97545 (arr!47079 (Array (_ BitVec 32) (_ BitVec 64))) (size!47629 (_ BitVec 32))) )
))
(declare-fun lt!630777 () array!97544)

(declare-datatypes ((SeekEntryResult!11358 0))(
  ( (MissingZero!11358 (index!47824 (_ BitVec 32))) (Found!11358 (index!47825 (_ BitVec 32))) (Intermediate!11358 (undefined!12170 Bool) (index!47826 (_ BitVec 32)) (x!129464 (_ BitVec 32))) (Undefined!11358) (MissingVacant!11358 (index!47827 (_ BitVec 32))) )
))
(declare-fun lt!630776 () SeekEntryResult!11358)

(declare-fun lt!630780 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97544 (_ BitVec 32)) SeekEntryResult!11358)

(assert (=> b!1432865 (= res!966732 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630780 lt!630777 mask!2608) lt!630776))))

(declare-fun res!966736 () Bool)

(declare-fun e!808785 () Bool)

(assert (=> start!123572 (=> (not res!966736) (not e!808785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123572 (= res!966736 (validMask!0 mask!2608))))

(assert (=> start!123572 e!808785))

(assert (=> start!123572 true))

(declare-fun a!2831 () array!97544)

(declare-fun array_inv!36107 (array!97544) Bool)

(assert (=> start!123572 (array_inv!36107 a!2831)))

(declare-fun b!1432866 () Bool)

(declare-fun res!966733 () Bool)

(assert (=> b!1432866 (=> (not res!966733) (not e!808785))))

(declare-datatypes ((List!33589 0))(
  ( (Nil!33586) (Cons!33585 (h!34908 (_ BitVec 64)) (t!48283 List!33589)) )
))
(declare-fun arrayNoDuplicates!0 (array!97544 (_ BitVec 32) List!33589) Bool)

(assert (=> b!1432866 (= res!966733 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33586))))

(declare-fun b!1432867 () Bool)

(declare-fun res!966740 () Bool)

(assert (=> b!1432867 (=> (not res!966740) (not e!808785))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432867 (= res!966740 (validKeyInArray!0 (select (arr!47079 a!2831) i!982)))))

(declare-fun b!1432868 () Bool)

(declare-fun e!808783 () Bool)

(assert (=> b!1432868 (= e!808787 (not e!808783))))

(declare-fun res!966735 () Bool)

(assert (=> b!1432868 (=> res!966735 e!808783)))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1432868 (= res!966735 (or (= (select (arr!47079 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47079 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47079 a!2831) index!585) (select (arr!47079 a!2831) j!81)) (= (select (store (arr!47079 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808784 () Bool)

(assert (=> b!1432868 e!808784))

(declare-fun res!966738 () Bool)

(assert (=> b!1432868 (=> (not res!966738) (not e!808784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97544 (_ BitVec 32)) Bool)

(assert (=> b!1432868 (= res!966738 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48462 0))(
  ( (Unit!48463) )
))
(declare-fun lt!630779 () Unit!48462)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48462)

(assert (=> b!1432868 (= lt!630779 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432869 () Bool)

(declare-fun e!808786 () Bool)

(assert (=> b!1432869 (= e!808785 e!808786)))

(declare-fun res!966739 () Bool)

(assert (=> b!1432869 (=> (not res!966739) (not e!808786))))

(declare-fun lt!630775 () SeekEntryResult!11358)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432869 (= res!966739 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47079 a!2831) j!81) mask!2608) (select (arr!47079 a!2831) j!81) a!2831 mask!2608) lt!630775))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1432869 (= lt!630775 (Intermediate!11358 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432870 () Bool)

(assert (=> b!1432870 (= e!808783 true)))

(declare-fun lt!630778 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432870 (= lt!630778 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432871 () Bool)

(declare-fun res!966729 () Bool)

(assert (=> b!1432871 (=> (not res!966729) (not e!808785))))

(assert (=> b!1432871 (= res!966729 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47629 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47629 a!2831))))))

(declare-fun b!1432872 () Bool)

(declare-fun res!966737 () Bool)

(assert (=> b!1432872 (=> (not res!966737) (not e!808785))))

(assert (=> b!1432872 (= res!966737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432873 () Bool)

(declare-fun res!966734 () Bool)

(assert (=> b!1432873 (=> (not res!966734) (not e!808785))))

(assert (=> b!1432873 (= res!966734 (validKeyInArray!0 (select (arr!47079 a!2831) j!81)))))

(declare-fun b!1432874 () Bool)

(declare-fun res!966742 () Bool)

(assert (=> b!1432874 (=> (not res!966742) (not e!808787))))

(assert (=> b!1432874 (= res!966742 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47079 a!2831) j!81) a!2831 mask!2608) lt!630775))))

(declare-fun b!1432875 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97544 (_ BitVec 32)) SeekEntryResult!11358)

(assert (=> b!1432875 (= e!808784 (= (seekEntryOrOpen!0 (select (arr!47079 a!2831) j!81) a!2831 mask!2608) (Found!11358 j!81)))))

(declare-fun b!1432876 () Bool)

(declare-fun res!966730 () Bool)

(assert (=> b!1432876 (=> (not res!966730) (not e!808787))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432876 (= res!966730 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432877 () Bool)

(assert (=> b!1432877 (= e!808786 e!808787)))

(declare-fun res!966741 () Bool)

(assert (=> b!1432877 (=> (not res!966741) (not e!808787))))

(assert (=> b!1432877 (= res!966741 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630780 mask!2608) lt!630780 lt!630777 mask!2608) lt!630776))))

(assert (=> b!1432877 (= lt!630776 (Intermediate!11358 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432877 (= lt!630780 (select (store (arr!47079 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432877 (= lt!630777 (array!97545 (store (arr!47079 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47629 a!2831)))))

(declare-fun b!1432878 () Bool)

(declare-fun res!966731 () Bool)

(assert (=> b!1432878 (=> (not res!966731) (not e!808785))))

(assert (=> b!1432878 (= res!966731 (and (= (size!47629 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47629 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47629 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123572 res!966736) b!1432878))

(assert (= (and b!1432878 res!966731) b!1432867))

(assert (= (and b!1432867 res!966740) b!1432873))

(assert (= (and b!1432873 res!966734) b!1432872))

(assert (= (and b!1432872 res!966737) b!1432866))

(assert (= (and b!1432866 res!966733) b!1432871))

(assert (= (and b!1432871 res!966729) b!1432869))

(assert (= (and b!1432869 res!966739) b!1432877))

(assert (= (and b!1432877 res!966741) b!1432874))

(assert (= (and b!1432874 res!966742) b!1432865))

(assert (= (and b!1432865 res!966732) b!1432876))

(assert (= (and b!1432876 res!966730) b!1432868))

(assert (= (and b!1432868 res!966738) b!1432875))

(assert (= (and b!1432868 (not res!966735)) b!1432870))

(declare-fun m!1322693 () Bool)

(assert (=> start!123572 m!1322693))

(declare-fun m!1322695 () Bool)

(assert (=> start!123572 m!1322695))

(declare-fun m!1322697 () Bool)

(assert (=> b!1432874 m!1322697))

(assert (=> b!1432874 m!1322697))

(declare-fun m!1322699 () Bool)

(assert (=> b!1432874 m!1322699))

(declare-fun m!1322701 () Bool)

(assert (=> b!1432867 m!1322701))

(assert (=> b!1432867 m!1322701))

(declare-fun m!1322703 () Bool)

(assert (=> b!1432867 m!1322703))

(declare-fun m!1322705 () Bool)

(assert (=> b!1432868 m!1322705))

(declare-fun m!1322707 () Bool)

(assert (=> b!1432868 m!1322707))

(declare-fun m!1322709 () Bool)

(assert (=> b!1432868 m!1322709))

(declare-fun m!1322711 () Bool)

(assert (=> b!1432868 m!1322711))

(assert (=> b!1432868 m!1322697))

(declare-fun m!1322713 () Bool)

(assert (=> b!1432868 m!1322713))

(declare-fun m!1322715 () Bool)

(assert (=> b!1432865 m!1322715))

(assert (=> b!1432873 m!1322697))

(assert (=> b!1432873 m!1322697))

(declare-fun m!1322717 () Bool)

(assert (=> b!1432873 m!1322717))

(declare-fun m!1322719 () Bool)

(assert (=> b!1432877 m!1322719))

(assert (=> b!1432877 m!1322719))

(declare-fun m!1322721 () Bool)

(assert (=> b!1432877 m!1322721))

(assert (=> b!1432877 m!1322705))

(declare-fun m!1322723 () Bool)

(assert (=> b!1432877 m!1322723))

(assert (=> b!1432875 m!1322697))

(assert (=> b!1432875 m!1322697))

(declare-fun m!1322725 () Bool)

(assert (=> b!1432875 m!1322725))

(declare-fun m!1322727 () Bool)

(assert (=> b!1432866 m!1322727))

(declare-fun m!1322729 () Bool)

(assert (=> b!1432870 m!1322729))

(declare-fun m!1322731 () Bool)

(assert (=> b!1432872 m!1322731))

(assert (=> b!1432869 m!1322697))

(assert (=> b!1432869 m!1322697))

(declare-fun m!1322733 () Bool)

(assert (=> b!1432869 m!1322733))

(assert (=> b!1432869 m!1322733))

(assert (=> b!1432869 m!1322697))

(declare-fun m!1322735 () Bool)

(assert (=> b!1432869 m!1322735))

(check-sat (not b!1432875) (not b!1432874) (not b!1432873) (not b!1432872) (not b!1432866) (not b!1432865) (not b!1432869) (not b!1432870) (not start!123572) (not b!1432877) (not b!1432868) (not b!1432867))
(check-sat)
