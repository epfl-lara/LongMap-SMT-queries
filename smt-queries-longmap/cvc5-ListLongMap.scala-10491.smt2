; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123522 () Bool)

(assert start!123522)

(declare-fun b!1431815 () Bool)

(declare-fun res!965680 () Bool)

(declare-fun e!808332 () Bool)

(assert (=> b!1431815 (=> (not res!965680) (not e!808332))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431815 (= res!965680 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431816 () Bool)

(declare-fun res!965692 () Bool)

(declare-fun e!808335 () Bool)

(assert (=> b!1431816 (=> (not res!965692) (not e!808335))))

(declare-datatypes ((array!97494 0))(
  ( (array!97495 (arr!47054 (Array (_ BitVec 32) (_ BitVec 64))) (size!47604 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97494)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431816 (= res!965692 (validKeyInArray!0 (select (arr!47054 a!2831) j!81)))))

(declare-fun b!1431817 () Bool)

(declare-fun res!965681 () Bool)

(assert (=> b!1431817 (=> (not res!965681) (not e!808335))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431817 (= res!965681 (validKeyInArray!0 (select (arr!47054 a!2831) i!982)))))

(declare-fun b!1431818 () Bool)

(declare-fun res!965683 () Bool)

(assert (=> b!1431818 (=> (not res!965683) (not e!808335))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97494 (_ BitVec 32)) Bool)

(assert (=> b!1431818 (= res!965683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431819 () Bool)

(declare-fun res!965687 () Bool)

(assert (=> b!1431819 (=> (not res!965687) (not e!808332))))

(declare-datatypes ((SeekEntryResult!11333 0))(
  ( (MissingZero!11333 (index!47724 (_ BitVec 32))) (Found!11333 (index!47725 (_ BitVec 32))) (Intermediate!11333 (undefined!12145 Bool) (index!47726 (_ BitVec 32)) (x!129375 (_ BitVec 32))) (Undefined!11333) (MissingVacant!11333 (index!47727 (_ BitVec 32))) )
))
(declare-fun lt!630328 () SeekEntryResult!11333)

(declare-fun lt!630330 () (_ BitVec 64))

(declare-fun lt!630329 () array!97494)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97494 (_ BitVec 32)) SeekEntryResult!11333)

(assert (=> b!1431819 (= res!965687 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630330 lt!630329 mask!2608) lt!630328))))

(declare-fun b!1431821 () Bool)

(declare-fun e!808337 () Bool)

(assert (=> b!1431821 (= e!808337 e!808332)))

(declare-fun res!965688 () Bool)

(assert (=> b!1431821 (=> (not res!965688) (not e!808332))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431821 (= res!965688 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630330 mask!2608) lt!630330 lt!630329 mask!2608) lt!630328))))

(assert (=> b!1431821 (= lt!630328 (Intermediate!11333 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431821 (= lt!630330 (select (store (arr!47054 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431821 (= lt!630329 (array!97495 (store (arr!47054 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47604 a!2831)))))

(declare-fun b!1431822 () Bool)

(declare-fun res!965691 () Bool)

(assert (=> b!1431822 (=> (not res!965691) (not e!808335))))

(declare-datatypes ((List!33564 0))(
  ( (Nil!33561) (Cons!33560 (h!34883 (_ BitVec 64)) (t!48258 List!33564)) )
))
(declare-fun arrayNoDuplicates!0 (array!97494 (_ BitVec 32) List!33564) Bool)

(assert (=> b!1431822 (= res!965691 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33561))))

(declare-fun b!1431823 () Bool)

(declare-fun res!965684 () Bool)

(assert (=> b!1431823 (=> (not res!965684) (not e!808335))))

(assert (=> b!1431823 (= res!965684 (and (= (size!47604 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47604 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47604 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431824 () Bool)

(declare-fun e!808333 () Bool)

(assert (=> b!1431824 (= e!808332 (not e!808333))))

(declare-fun res!965682 () Bool)

(assert (=> b!1431824 (=> res!965682 e!808333)))

(assert (=> b!1431824 (= res!965682 (or (= (select (arr!47054 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47054 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47054 a!2831) index!585) (select (arr!47054 a!2831) j!81)) (= (select (store (arr!47054 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808334 () Bool)

(assert (=> b!1431824 e!808334))

(declare-fun res!965690 () Bool)

(assert (=> b!1431824 (=> (not res!965690) (not e!808334))))

(assert (=> b!1431824 (= res!965690 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48412 0))(
  ( (Unit!48413) )
))
(declare-fun lt!630325 () Unit!48412)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97494 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48412)

(assert (=> b!1431824 (= lt!630325 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431825 () Bool)

(assert (=> b!1431825 (= e!808333 true)))

(declare-fun lt!630327 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431825 (= lt!630327 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1431826 () Bool)

(declare-fun res!965686 () Bool)

(assert (=> b!1431826 (=> (not res!965686) (not e!808332))))

(declare-fun lt!630326 () SeekEntryResult!11333)

(assert (=> b!1431826 (= res!965686 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47054 a!2831) j!81) a!2831 mask!2608) lt!630326))))

(declare-fun b!1431827 () Bool)

(assert (=> b!1431827 (= e!808335 e!808337)))

(declare-fun res!965679 () Bool)

(assert (=> b!1431827 (=> (not res!965679) (not e!808337))))

(assert (=> b!1431827 (= res!965679 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47054 a!2831) j!81) mask!2608) (select (arr!47054 a!2831) j!81) a!2831 mask!2608) lt!630326))))

(assert (=> b!1431827 (= lt!630326 (Intermediate!11333 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431828 () Bool)

(declare-fun res!965689 () Bool)

(assert (=> b!1431828 (=> (not res!965689) (not e!808335))))

(assert (=> b!1431828 (= res!965689 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47604 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47604 a!2831))))))

(declare-fun b!1431820 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97494 (_ BitVec 32)) SeekEntryResult!11333)

(assert (=> b!1431820 (= e!808334 (= (seekEntryOrOpen!0 (select (arr!47054 a!2831) j!81) a!2831 mask!2608) (Found!11333 j!81)))))

(declare-fun res!965685 () Bool)

(assert (=> start!123522 (=> (not res!965685) (not e!808335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123522 (= res!965685 (validMask!0 mask!2608))))

(assert (=> start!123522 e!808335))

(assert (=> start!123522 true))

(declare-fun array_inv!36082 (array!97494) Bool)

(assert (=> start!123522 (array_inv!36082 a!2831)))

(assert (= (and start!123522 res!965685) b!1431823))

(assert (= (and b!1431823 res!965684) b!1431817))

(assert (= (and b!1431817 res!965681) b!1431816))

(assert (= (and b!1431816 res!965692) b!1431818))

(assert (= (and b!1431818 res!965683) b!1431822))

(assert (= (and b!1431822 res!965691) b!1431828))

(assert (= (and b!1431828 res!965689) b!1431827))

(assert (= (and b!1431827 res!965679) b!1431821))

(assert (= (and b!1431821 res!965688) b!1431826))

(assert (= (and b!1431826 res!965686) b!1431819))

(assert (= (and b!1431819 res!965687) b!1431815))

(assert (= (and b!1431815 res!965680) b!1431824))

(assert (= (and b!1431824 res!965690) b!1431820))

(assert (= (and b!1431824 (not res!965682)) b!1431825))

(declare-fun m!1321593 () Bool)

(assert (=> b!1431821 m!1321593))

(assert (=> b!1431821 m!1321593))

(declare-fun m!1321595 () Bool)

(assert (=> b!1431821 m!1321595))

(declare-fun m!1321597 () Bool)

(assert (=> b!1431821 m!1321597))

(declare-fun m!1321599 () Bool)

(assert (=> b!1431821 m!1321599))

(declare-fun m!1321601 () Bool)

(assert (=> b!1431825 m!1321601))

(declare-fun m!1321603 () Bool)

(assert (=> b!1431826 m!1321603))

(assert (=> b!1431826 m!1321603))

(declare-fun m!1321605 () Bool)

(assert (=> b!1431826 m!1321605))

(assert (=> b!1431816 m!1321603))

(assert (=> b!1431816 m!1321603))

(declare-fun m!1321607 () Bool)

(assert (=> b!1431816 m!1321607))

(assert (=> b!1431820 m!1321603))

(assert (=> b!1431820 m!1321603))

(declare-fun m!1321609 () Bool)

(assert (=> b!1431820 m!1321609))

(declare-fun m!1321611 () Bool)

(assert (=> b!1431822 m!1321611))

(declare-fun m!1321613 () Bool)

(assert (=> b!1431818 m!1321613))

(assert (=> b!1431824 m!1321597))

(declare-fun m!1321615 () Bool)

(assert (=> b!1431824 m!1321615))

(declare-fun m!1321617 () Bool)

(assert (=> b!1431824 m!1321617))

(declare-fun m!1321619 () Bool)

(assert (=> b!1431824 m!1321619))

(assert (=> b!1431824 m!1321603))

(declare-fun m!1321621 () Bool)

(assert (=> b!1431824 m!1321621))

(assert (=> b!1431827 m!1321603))

(assert (=> b!1431827 m!1321603))

(declare-fun m!1321623 () Bool)

(assert (=> b!1431827 m!1321623))

(assert (=> b!1431827 m!1321623))

(assert (=> b!1431827 m!1321603))

(declare-fun m!1321625 () Bool)

(assert (=> b!1431827 m!1321625))

(declare-fun m!1321627 () Bool)

(assert (=> b!1431819 m!1321627))

(declare-fun m!1321629 () Bool)

(assert (=> start!123522 m!1321629))

(declare-fun m!1321631 () Bool)

(assert (=> start!123522 m!1321631))

(declare-fun m!1321633 () Bool)

(assert (=> b!1431817 m!1321633))

(assert (=> b!1431817 m!1321633))

(declare-fun m!1321635 () Bool)

(assert (=> b!1431817 m!1321635))

(push 1)

