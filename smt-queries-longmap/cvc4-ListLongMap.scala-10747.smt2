; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125684 () Bool)

(assert start!125684)

(declare-fun e!825590 () Bool)

(declare-fun b!1470780 () Bool)

(declare-datatypes ((array!99075 0))(
  ( (array!99076 (arr!47824 (Array (_ BitVec 32) (_ BitVec 64))) (size!48374 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99075)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12064 0))(
  ( (MissingZero!12064 (index!50648 (_ BitVec 32))) (Found!12064 (index!50649 (_ BitVec 32))) (Intermediate!12064 (undefined!12876 Bool) (index!50650 (_ BitVec 32)) (x!132226 (_ BitVec 32))) (Undefined!12064) (MissingVacant!12064 (index!50651 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99075 (_ BitVec 32)) SeekEntryResult!12064)

(assert (=> b!1470780 (= e!825590 (= (seekEntryOrOpen!0 (select (arr!47824 a!2862) j!93) a!2862 mask!2687) (Found!12064 j!93)))))

(declare-fun b!1470781 () Bool)

(declare-fun res!998871 () Bool)

(declare-fun e!825592 () Bool)

(assert (=> b!1470781 (=> (not res!998871) (not e!825592))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1470781 (= res!998871 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48374 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48374 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48374 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1470782 () Bool)

(declare-fun res!998869 () Bool)

(declare-fun e!825596 () Bool)

(assert (=> b!1470782 (=> (not res!998869) (not e!825596))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1470782 (= res!998869 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1470783 () Bool)

(declare-fun res!998874 () Bool)

(assert (=> b!1470783 (=> (not res!998874) (not e!825592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470783 (= res!998874 (validKeyInArray!0 (select (arr!47824 a!2862) j!93)))))

(declare-fun lt!643034 () SeekEntryResult!12064)

(declare-fun lt!643035 () array!99075)

(declare-fun lt!643031 () (_ BitVec 64))

(declare-fun b!1470784 () Bool)

(declare-fun e!825591 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99075 (_ BitVec 32)) SeekEntryResult!12064)

(assert (=> b!1470784 (= e!825591 (= lt!643034 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643031 lt!643035 mask!2687)))))

(declare-fun b!1470786 () Bool)

(declare-fun res!998880 () Bool)

(assert (=> b!1470786 (=> (not res!998880) (not e!825592))))

(assert (=> b!1470786 (= res!998880 (and (= (size!48374 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48374 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48374 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470787 () Bool)

(declare-fun res!998878 () Bool)

(assert (=> b!1470787 (=> (not res!998878) (not e!825592))))

(declare-datatypes ((List!34325 0))(
  ( (Nil!34322) (Cons!34321 (h!35674 (_ BitVec 64)) (t!49019 List!34325)) )
))
(declare-fun arrayNoDuplicates!0 (array!99075 (_ BitVec 32) List!34325) Bool)

(assert (=> b!1470787 (= res!998878 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34322))))

(declare-fun b!1470788 () Bool)

(declare-fun e!825595 () Bool)

(assert (=> b!1470788 (= e!825592 e!825595)))

(declare-fun res!998873 () Bool)

(assert (=> b!1470788 (=> (not res!998873) (not e!825595))))

(assert (=> b!1470788 (= res!998873 (= (select (store (arr!47824 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1470788 (= lt!643035 (array!99076 (store (arr!47824 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48374 a!2862)))))

(declare-fun b!1470789 () Bool)

(assert (=> b!1470789 (= e!825596 (not true))))

(assert (=> b!1470789 e!825590))

(declare-fun res!998875 () Bool)

(assert (=> b!1470789 (=> (not res!998875) (not e!825590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99075 (_ BitVec 32)) Bool)

(assert (=> b!1470789 (= res!998875 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49468 0))(
  ( (Unit!49469) )
))
(declare-fun lt!643033 () Unit!49468)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99075 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49468)

(assert (=> b!1470789 (= lt!643033 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1470790 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99075 (_ BitVec 32)) SeekEntryResult!12064)

(assert (=> b!1470790 (= e!825591 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643031 lt!643035 mask!2687) (seekEntryOrOpen!0 lt!643031 lt!643035 mask!2687)))))

(declare-fun b!1470791 () Bool)

(declare-fun res!998868 () Bool)

(declare-fun e!825594 () Bool)

(assert (=> b!1470791 (=> (not res!998868) (not e!825594))))

(declare-fun lt!643032 () SeekEntryResult!12064)

(assert (=> b!1470791 (= res!998868 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47824 a!2862) j!93) a!2862 mask!2687) lt!643032))))

(declare-fun b!1470792 () Bool)

(declare-fun res!998881 () Bool)

(assert (=> b!1470792 (=> (not res!998881) (not e!825592))))

(assert (=> b!1470792 (= res!998881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470793 () Bool)

(declare-fun res!998876 () Bool)

(assert (=> b!1470793 (=> (not res!998876) (not e!825592))))

(assert (=> b!1470793 (= res!998876 (validKeyInArray!0 (select (arr!47824 a!2862) i!1006)))))

(declare-fun b!1470785 () Bool)

(declare-fun res!998877 () Bool)

(assert (=> b!1470785 (=> (not res!998877) (not e!825596))))

(assert (=> b!1470785 (= res!998877 e!825591)))

(declare-fun c!135468 () Bool)

(assert (=> b!1470785 (= c!135468 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!998870 () Bool)

(assert (=> start!125684 (=> (not res!998870) (not e!825592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125684 (= res!998870 (validMask!0 mask!2687))))

(assert (=> start!125684 e!825592))

(assert (=> start!125684 true))

(declare-fun array_inv!36852 (array!99075) Bool)

(assert (=> start!125684 (array_inv!36852 a!2862)))

(declare-fun b!1470794 () Bool)

(assert (=> b!1470794 (= e!825594 e!825596)))

(declare-fun res!998872 () Bool)

(assert (=> b!1470794 (=> (not res!998872) (not e!825596))))

(assert (=> b!1470794 (= res!998872 (= lt!643034 (Intermediate!12064 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470794 (= lt!643034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643031 mask!2687) lt!643031 lt!643035 mask!2687))))

(assert (=> b!1470794 (= lt!643031 (select (store (arr!47824 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1470795 () Bool)

(assert (=> b!1470795 (= e!825595 e!825594)))

(declare-fun res!998879 () Bool)

(assert (=> b!1470795 (=> (not res!998879) (not e!825594))))

(assert (=> b!1470795 (= res!998879 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47824 a!2862) j!93) mask!2687) (select (arr!47824 a!2862) j!93) a!2862 mask!2687) lt!643032))))

(assert (=> b!1470795 (= lt!643032 (Intermediate!12064 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125684 res!998870) b!1470786))

(assert (= (and b!1470786 res!998880) b!1470793))

(assert (= (and b!1470793 res!998876) b!1470783))

(assert (= (and b!1470783 res!998874) b!1470792))

(assert (= (and b!1470792 res!998881) b!1470787))

(assert (= (and b!1470787 res!998878) b!1470781))

(assert (= (and b!1470781 res!998871) b!1470788))

(assert (= (and b!1470788 res!998873) b!1470795))

(assert (= (and b!1470795 res!998879) b!1470791))

(assert (= (and b!1470791 res!998868) b!1470794))

(assert (= (and b!1470794 res!998872) b!1470785))

(assert (= (and b!1470785 c!135468) b!1470784))

(assert (= (and b!1470785 (not c!135468)) b!1470790))

(assert (= (and b!1470785 res!998877) b!1470782))

(assert (= (and b!1470782 res!998869) b!1470789))

(assert (= (and b!1470789 res!998875) b!1470780))

(declare-fun m!1357751 () Bool)

(assert (=> b!1470789 m!1357751))

(declare-fun m!1357753 () Bool)

(assert (=> b!1470789 m!1357753))

(declare-fun m!1357755 () Bool)

(assert (=> b!1470783 m!1357755))

(assert (=> b!1470783 m!1357755))

(declare-fun m!1357757 () Bool)

(assert (=> b!1470783 m!1357757))

(declare-fun m!1357759 () Bool)

(assert (=> b!1470788 m!1357759))

(declare-fun m!1357761 () Bool)

(assert (=> b!1470788 m!1357761))

(declare-fun m!1357763 () Bool)

(assert (=> b!1470793 m!1357763))

(assert (=> b!1470793 m!1357763))

(declare-fun m!1357765 () Bool)

(assert (=> b!1470793 m!1357765))

(declare-fun m!1357767 () Bool)

(assert (=> b!1470794 m!1357767))

(assert (=> b!1470794 m!1357767))

(declare-fun m!1357769 () Bool)

(assert (=> b!1470794 m!1357769))

(assert (=> b!1470794 m!1357759))

(declare-fun m!1357771 () Bool)

(assert (=> b!1470794 m!1357771))

(declare-fun m!1357773 () Bool)

(assert (=> b!1470787 m!1357773))

(assert (=> b!1470795 m!1357755))

(assert (=> b!1470795 m!1357755))

(declare-fun m!1357775 () Bool)

(assert (=> b!1470795 m!1357775))

(assert (=> b!1470795 m!1357775))

(assert (=> b!1470795 m!1357755))

(declare-fun m!1357777 () Bool)

(assert (=> b!1470795 m!1357777))

(assert (=> b!1470780 m!1357755))

(assert (=> b!1470780 m!1357755))

(declare-fun m!1357779 () Bool)

(assert (=> b!1470780 m!1357779))

(declare-fun m!1357781 () Bool)

(assert (=> b!1470790 m!1357781))

(declare-fun m!1357783 () Bool)

(assert (=> b!1470790 m!1357783))

(declare-fun m!1357785 () Bool)

(assert (=> b!1470784 m!1357785))

(assert (=> b!1470791 m!1357755))

(assert (=> b!1470791 m!1357755))

(declare-fun m!1357787 () Bool)

(assert (=> b!1470791 m!1357787))

(declare-fun m!1357789 () Bool)

(assert (=> start!125684 m!1357789))

(declare-fun m!1357791 () Bool)

(assert (=> start!125684 m!1357791))

(declare-fun m!1357793 () Bool)

(assert (=> b!1470792 m!1357793))

(push 1)

(assert (not b!1470789))

(assert (not b!1470793))

(assert (not b!1470780))

