; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130538 () Bool)

(assert start!130538)

(declare-fun b!1531957 () Bool)

(declare-fun res!1049102 () Bool)

(declare-fun e!853593 () Bool)

(assert (=> b!1531957 (=> (not res!1049102) (not e!853593))))

(declare-datatypes ((array!101717 0))(
  ( (array!101718 (arr!49079 (Array (_ BitVec 32) (_ BitVec 64))) (size!49629 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101717)

(declare-datatypes ((List!35562 0))(
  ( (Nil!35559) (Cons!35558 (h!37003 (_ BitVec 64)) (t!50256 List!35562)) )
))
(declare-fun arrayNoDuplicates!0 (array!101717 (_ BitVec 32) List!35562) Bool)

(assert (=> b!1531957 (= res!1049102 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35559))))

(declare-fun b!1531958 () Bool)

(declare-fun res!1049101 () Bool)

(assert (=> b!1531958 (=> (not res!1049101) (not e!853593))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101717 (_ BitVec 32)) Bool)

(assert (=> b!1531958 (= res!1049101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531959 () Bool)

(declare-fun res!1049098 () Bool)

(assert (=> b!1531959 (=> (not res!1049098) (not e!853593))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1531959 (= res!1049098 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49629 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49629 a!2804))))))

(declare-fun b!1531960 () Bool)

(declare-fun e!853591 () Bool)

(declare-fun e!853589 () Bool)

(assert (=> b!1531960 (= e!853591 e!853589)))

(declare-fun res!1049099 () Bool)

(assert (=> b!1531960 (=> res!1049099 e!853589)))

(declare-fun lt!663464 () (_ BitVec 32))

(assert (=> b!1531960 (= res!1049099 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663464 #b00000000000000000000000000000000) (bvsge lt!663464 (size!49629 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531960 (= lt!663464 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531961 () Bool)

(declare-fun res!1049100 () Bool)

(assert (=> b!1531961 (=> (not res!1049100) (not e!853593))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1531961 (= res!1049100 (and (= (size!49629 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49629 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49629 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531962 () Bool)

(declare-fun res!1049108 () Bool)

(declare-fun e!853592 () Bool)

(assert (=> b!1531962 (=> (not res!1049108) (not e!853592))))

(declare-datatypes ((SeekEntryResult!13244 0))(
  ( (MissingZero!13244 (index!55371 (_ BitVec 32))) (Found!13244 (index!55372 (_ BitVec 32))) (Intermediate!13244 (undefined!14056 Bool) (index!55373 (_ BitVec 32)) (x!137070 (_ BitVec 32))) (Undefined!13244) (MissingVacant!13244 (index!55374 (_ BitVec 32))) )
))
(declare-fun lt!663463 () SeekEntryResult!13244)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101717 (_ BitVec 32)) SeekEntryResult!13244)

(assert (=> b!1531962 (= res!1049108 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49079 a!2804) j!70) a!2804 mask!2512) lt!663463))))

(declare-fun res!1049105 () Bool)

(assert (=> start!130538 (=> (not res!1049105) (not e!853593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130538 (= res!1049105 (validMask!0 mask!2512))))

(assert (=> start!130538 e!853593))

(assert (=> start!130538 true))

(declare-fun array_inv!38107 (array!101717) Bool)

(assert (=> start!130538 (array_inv!38107 a!2804)))

(declare-fun b!1531963 () Bool)

(declare-fun res!1049097 () Bool)

(assert (=> b!1531963 (=> res!1049097 e!853589)))

(assert (=> b!1531963 (= res!1049097 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663464 (select (arr!49079 a!2804) j!70) a!2804 mask!2512) lt!663463)))))

(declare-fun b!1531964 () Bool)

(declare-fun res!1049107 () Bool)

(assert (=> b!1531964 (=> (not res!1049107) (not e!853593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531964 (= res!1049107 (validKeyInArray!0 (select (arr!49079 a!2804) i!961)))))

(declare-fun b!1531965 () Bool)

(assert (=> b!1531965 (= e!853589 true)))

(declare-fun lt!663465 () (_ BitVec 64))

(declare-fun lt!663466 () array!101717)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101717 (_ BitVec 32)) SeekEntryResult!13244)

(assert (=> b!1531965 (= (seekEntryOrOpen!0 (select (arr!49079 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663465 lt!663466 mask!2512))))

(declare-datatypes ((Unit!51272 0))(
  ( (Unit!51273) )
))
(declare-fun lt!663468 () Unit!51272)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51272)

(assert (=> b!1531965 (= lt!663468 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663464 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1531966 () Bool)

(declare-fun res!1049109 () Bool)

(assert (=> b!1531966 (=> (not res!1049109) (not e!853593))))

(assert (=> b!1531966 (= res!1049109 (validKeyInArray!0 (select (arr!49079 a!2804) j!70)))))

(declare-fun b!1531967 () Bool)

(declare-fun e!853588 () Bool)

(assert (=> b!1531967 (= e!853588 (not e!853591))))

(declare-fun res!1049103 () Bool)

(assert (=> b!1531967 (=> res!1049103 e!853591)))

(assert (=> b!1531967 (= res!1049103 (or (not (= (select (arr!49079 a!2804) j!70) lt!663465)) (= x!534 resX!21)))))

(declare-fun e!853590 () Bool)

(assert (=> b!1531967 e!853590))

(declare-fun res!1049110 () Bool)

(assert (=> b!1531967 (=> (not res!1049110) (not e!853590))))

(assert (=> b!1531967 (= res!1049110 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!663469 () Unit!51272)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51272)

(assert (=> b!1531967 (= lt!663469 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531968 () Bool)

(assert (=> b!1531968 (= e!853593 e!853592)))

(declare-fun res!1049106 () Bool)

(assert (=> b!1531968 (=> (not res!1049106) (not e!853592))))

(declare-fun lt!663467 () SeekEntryResult!13244)

(assert (=> b!1531968 (= res!1049106 (= lt!663467 lt!663463))))

(assert (=> b!1531968 (= lt!663463 (Intermediate!13244 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531968 (= lt!663467 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49079 a!2804) j!70) mask!2512) (select (arr!49079 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531969 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101717 (_ BitVec 32)) SeekEntryResult!13244)

(assert (=> b!1531969 (= e!853590 (= (seekEntry!0 (select (arr!49079 a!2804) j!70) a!2804 mask!2512) (Found!13244 j!70)))))

(declare-fun b!1531970 () Bool)

(assert (=> b!1531970 (= e!853592 e!853588)))

(declare-fun res!1049104 () Bool)

(assert (=> b!1531970 (=> (not res!1049104) (not e!853588))))

(assert (=> b!1531970 (= res!1049104 (= lt!663467 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663465 mask!2512) lt!663465 lt!663466 mask!2512)))))

(assert (=> b!1531970 (= lt!663465 (select (store (arr!49079 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1531970 (= lt!663466 (array!101718 (store (arr!49079 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49629 a!2804)))))

(assert (= (and start!130538 res!1049105) b!1531961))

(assert (= (and b!1531961 res!1049100) b!1531964))

(assert (= (and b!1531964 res!1049107) b!1531966))

(assert (= (and b!1531966 res!1049109) b!1531958))

(assert (= (and b!1531958 res!1049101) b!1531957))

(assert (= (and b!1531957 res!1049102) b!1531959))

(assert (= (and b!1531959 res!1049098) b!1531968))

(assert (= (and b!1531968 res!1049106) b!1531962))

(assert (= (and b!1531962 res!1049108) b!1531970))

(assert (= (and b!1531970 res!1049104) b!1531967))

(assert (= (and b!1531967 res!1049110) b!1531969))

(assert (= (and b!1531967 (not res!1049103)) b!1531960))

(assert (= (and b!1531960 (not res!1049099)) b!1531963))

(assert (= (and b!1531963 (not res!1049097)) b!1531965))

(declare-fun m!1414635 () Bool)

(assert (=> b!1531969 m!1414635))

(assert (=> b!1531969 m!1414635))

(declare-fun m!1414637 () Bool)

(assert (=> b!1531969 m!1414637))

(assert (=> b!1531963 m!1414635))

(assert (=> b!1531963 m!1414635))

(declare-fun m!1414639 () Bool)

(assert (=> b!1531963 m!1414639))

(assert (=> b!1531962 m!1414635))

(assert (=> b!1531962 m!1414635))

(declare-fun m!1414641 () Bool)

(assert (=> b!1531962 m!1414641))

(assert (=> b!1531966 m!1414635))

(assert (=> b!1531966 m!1414635))

(declare-fun m!1414643 () Bool)

(assert (=> b!1531966 m!1414643))

(assert (=> b!1531965 m!1414635))

(assert (=> b!1531965 m!1414635))

(declare-fun m!1414645 () Bool)

(assert (=> b!1531965 m!1414645))

(declare-fun m!1414647 () Bool)

(assert (=> b!1531965 m!1414647))

(declare-fun m!1414649 () Bool)

(assert (=> b!1531965 m!1414649))

(assert (=> b!1531967 m!1414635))

(declare-fun m!1414651 () Bool)

(assert (=> b!1531967 m!1414651))

(declare-fun m!1414653 () Bool)

(assert (=> b!1531967 m!1414653))

(declare-fun m!1414655 () Bool)

(assert (=> b!1531960 m!1414655))

(declare-fun m!1414657 () Bool)

(assert (=> b!1531970 m!1414657))

(assert (=> b!1531970 m!1414657))

(declare-fun m!1414659 () Bool)

(assert (=> b!1531970 m!1414659))

(declare-fun m!1414661 () Bool)

(assert (=> b!1531970 m!1414661))

(declare-fun m!1414663 () Bool)

(assert (=> b!1531970 m!1414663))

(declare-fun m!1414665 () Bool)

(assert (=> b!1531958 m!1414665))

(declare-fun m!1414667 () Bool)

(assert (=> b!1531957 m!1414667))

(declare-fun m!1414669 () Bool)

(assert (=> start!130538 m!1414669))

(declare-fun m!1414671 () Bool)

(assert (=> start!130538 m!1414671))

(declare-fun m!1414673 () Bool)

(assert (=> b!1531964 m!1414673))

(assert (=> b!1531964 m!1414673))

(declare-fun m!1414675 () Bool)

(assert (=> b!1531964 m!1414675))

(assert (=> b!1531968 m!1414635))

(assert (=> b!1531968 m!1414635))

(declare-fun m!1414677 () Bool)

(assert (=> b!1531968 m!1414677))

(assert (=> b!1531968 m!1414677))

(assert (=> b!1531968 m!1414635))

(declare-fun m!1414679 () Bool)

(assert (=> b!1531968 m!1414679))

(push 1)

