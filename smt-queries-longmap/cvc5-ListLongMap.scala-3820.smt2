; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52406 () Bool)

(assert start!52406)

(declare-fun res!361396 () Bool)

(declare-fun e!328936 () Bool)

(assert (=> start!52406 (=> (not res!361396) (not e!328936))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52406 (= res!361396 (validMask!0 mask!3119))))

(assert (=> start!52406 e!328936))

(assert (=> start!52406 true))

(declare-datatypes ((array!35803 0))(
  ( (array!35804 (arr!17190 (Array (_ BitVec 32) (_ BitVec 64))) (size!17554 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35803)

(declare-fun array_inv!12986 (array!35803) Bool)

(assert (=> start!52406 (array_inv!12986 a!3118)))

(declare-fun b!571880 () Bool)

(declare-fun res!361392 () Bool)

(declare-fun e!328938 () Bool)

(assert (=> b!571880 (=> (not res!361392) (not e!328938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35803 (_ BitVec 32)) Bool)

(assert (=> b!571880 (= res!361392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571881 () Bool)

(declare-fun e!328933 () Bool)

(assert (=> b!571881 (= e!328933 (not true))))

(declare-fun e!328932 () Bool)

(assert (=> b!571881 e!328932))

(declare-fun res!361393 () Bool)

(assert (=> b!571881 (=> (not res!361393) (not e!328932))))

(declare-datatypes ((SeekEntryResult!5639 0))(
  ( (MissingZero!5639 (index!24783 (_ BitVec 32))) (Found!5639 (index!24784 (_ BitVec 32))) (Intermediate!5639 (undefined!6451 Bool) (index!24785 (_ BitVec 32)) (x!53660 (_ BitVec 32))) (Undefined!5639) (MissingVacant!5639 (index!24786 (_ BitVec 32))) )
))
(declare-fun lt!260855 () SeekEntryResult!5639)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!571881 (= res!361393 (= lt!260855 (Found!5639 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35803 (_ BitVec 32)) SeekEntryResult!5639)

(assert (=> b!571881 (= lt!260855 (seekEntryOrOpen!0 (select (arr!17190 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!571881 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17980 0))(
  ( (Unit!17981) )
))
(declare-fun lt!260852 () Unit!17980)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17980)

(assert (=> b!571881 (= lt!260852 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun lt!260854 () array!35803)

(declare-fun e!328937 () Bool)

(declare-fun b!571882 () Bool)

(declare-fun lt!260849 () SeekEntryResult!5639)

(declare-fun lt!260857 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35803 (_ BitVec 32)) SeekEntryResult!5639)

(assert (=> b!571882 (= e!328937 (= (seekEntryOrOpen!0 lt!260857 lt!260854 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53660 lt!260849) (index!24785 lt!260849) (index!24785 lt!260849) lt!260857 lt!260854 mask!3119)))))

(declare-fun b!571883 () Bool)

(assert (=> b!571883 (= e!328938 e!328933)))

(declare-fun res!361389 () Bool)

(assert (=> b!571883 (=> (not res!361389) (not e!328933))))

(declare-fun lt!260856 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35803 (_ BitVec 32)) SeekEntryResult!5639)

(assert (=> b!571883 (= res!361389 (= lt!260849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260856 lt!260857 lt!260854 mask!3119)))))

(declare-fun lt!260851 () (_ BitVec 32))

(assert (=> b!571883 (= lt!260849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260851 (select (arr!17190 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571883 (= lt!260856 (toIndex!0 lt!260857 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!571883 (= lt!260857 (select (store (arr!17190 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!571883 (= lt!260851 (toIndex!0 (select (arr!17190 a!3118) j!142) mask!3119))))

(assert (=> b!571883 (= lt!260854 (array!35804 (store (arr!17190 a!3118) i!1132 k!1914) (size!17554 a!3118)))))

(declare-fun b!571884 () Bool)

(declare-fun res!361397 () Bool)

(assert (=> b!571884 (=> (not res!361397) (not e!328936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571884 (= res!361397 (validKeyInArray!0 k!1914))))

(declare-fun b!571885 () Bool)

(assert (=> b!571885 (= e!328936 e!328938)))

(declare-fun res!361398 () Bool)

(assert (=> b!571885 (=> (not res!361398) (not e!328938))))

(declare-fun lt!260850 () SeekEntryResult!5639)

(assert (=> b!571885 (= res!361398 (or (= lt!260850 (MissingZero!5639 i!1132)) (= lt!260850 (MissingVacant!5639 i!1132))))))

(assert (=> b!571885 (= lt!260850 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!571886 () Bool)

(declare-fun e!328934 () Bool)

(assert (=> b!571886 (= e!328932 e!328934)))

(declare-fun res!361390 () Bool)

(assert (=> b!571886 (=> res!361390 e!328934)))

(assert (=> b!571886 (= res!361390 (or (undefined!6451 lt!260849) (not (is-Intermediate!5639 lt!260849))))))

(declare-fun b!571887 () Bool)

(declare-fun e!328935 () Bool)

(assert (=> b!571887 (= e!328935 e!328937)))

(declare-fun res!361399 () Bool)

(assert (=> b!571887 (=> (not res!361399) (not e!328937))))

(assert (=> b!571887 (= res!361399 (= lt!260855 (seekKeyOrZeroReturnVacant!0 (x!53660 lt!260849) (index!24785 lt!260849) (index!24785 lt!260849) (select (arr!17190 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571888 () Bool)

(assert (=> b!571888 (= e!328934 e!328935)))

(declare-fun res!361391 () Bool)

(assert (=> b!571888 (=> res!361391 e!328935)))

(declare-fun lt!260853 () (_ BitVec 64))

(assert (=> b!571888 (= res!361391 (or (= lt!260853 (select (arr!17190 a!3118) j!142)) (= lt!260853 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571888 (= lt!260853 (select (arr!17190 a!3118) (index!24785 lt!260849)))))

(declare-fun b!571889 () Bool)

(declare-fun res!361394 () Bool)

(assert (=> b!571889 (=> (not res!361394) (not e!328936))))

(assert (=> b!571889 (= res!361394 (and (= (size!17554 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17554 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17554 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571890 () Bool)

(declare-fun res!361395 () Bool)

(assert (=> b!571890 (=> (not res!361395) (not e!328938))))

(declare-datatypes ((List!11270 0))(
  ( (Nil!11267) (Cons!11266 (h!12293 (_ BitVec 64)) (t!17498 List!11270)) )
))
(declare-fun arrayNoDuplicates!0 (array!35803 (_ BitVec 32) List!11270) Bool)

(assert (=> b!571890 (= res!361395 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11267))))

(declare-fun b!571891 () Bool)

(declare-fun res!361400 () Bool)

(assert (=> b!571891 (=> (not res!361400) (not e!328936))))

(declare-fun arrayContainsKey!0 (array!35803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571891 (= res!361400 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571892 () Bool)

(declare-fun res!361388 () Bool)

(assert (=> b!571892 (=> (not res!361388) (not e!328936))))

(assert (=> b!571892 (= res!361388 (validKeyInArray!0 (select (arr!17190 a!3118) j!142)))))

(assert (= (and start!52406 res!361396) b!571889))

(assert (= (and b!571889 res!361394) b!571892))

(assert (= (and b!571892 res!361388) b!571884))

(assert (= (and b!571884 res!361397) b!571891))

(assert (= (and b!571891 res!361400) b!571885))

(assert (= (and b!571885 res!361398) b!571880))

(assert (= (and b!571880 res!361392) b!571890))

(assert (= (and b!571890 res!361395) b!571883))

(assert (= (and b!571883 res!361389) b!571881))

(assert (= (and b!571881 res!361393) b!571886))

(assert (= (and b!571886 (not res!361390)) b!571888))

(assert (= (and b!571888 (not res!361391)) b!571887))

(assert (= (and b!571887 res!361399) b!571882))

(declare-fun m!550785 () Bool)

(assert (=> b!571885 m!550785))

(declare-fun m!550787 () Bool)

(assert (=> b!571890 m!550787))

(declare-fun m!550789 () Bool)

(assert (=> b!571883 m!550789))

(declare-fun m!550791 () Bool)

(assert (=> b!571883 m!550791))

(declare-fun m!550793 () Bool)

(assert (=> b!571883 m!550793))

(declare-fun m!550795 () Bool)

(assert (=> b!571883 m!550795))

(declare-fun m!550797 () Bool)

(assert (=> b!571883 m!550797))

(assert (=> b!571883 m!550795))

(declare-fun m!550799 () Bool)

(assert (=> b!571883 m!550799))

(declare-fun m!550801 () Bool)

(assert (=> b!571883 m!550801))

(assert (=> b!571883 m!550795))

(assert (=> b!571887 m!550795))

(assert (=> b!571887 m!550795))

(declare-fun m!550803 () Bool)

(assert (=> b!571887 m!550803))

(declare-fun m!550805 () Bool)

(assert (=> b!571880 m!550805))

(declare-fun m!550807 () Bool)

(assert (=> b!571891 m!550807))

(declare-fun m!550809 () Bool)

(assert (=> start!52406 m!550809))

(declare-fun m!550811 () Bool)

(assert (=> start!52406 m!550811))

(assert (=> b!571888 m!550795))

(declare-fun m!550813 () Bool)

(assert (=> b!571888 m!550813))

(declare-fun m!550815 () Bool)

(assert (=> b!571882 m!550815))

(declare-fun m!550817 () Bool)

(assert (=> b!571882 m!550817))

(declare-fun m!550819 () Bool)

(assert (=> b!571884 m!550819))

(assert (=> b!571892 m!550795))

(assert (=> b!571892 m!550795))

(declare-fun m!550821 () Bool)

(assert (=> b!571892 m!550821))

(assert (=> b!571881 m!550795))

(assert (=> b!571881 m!550795))

(declare-fun m!550823 () Bool)

(assert (=> b!571881 m!550823))

(declare-fun m!550825 () Bool)

(assert (=> b!571881 m!550825))

(declare-fun m!550827 () Bool)

(assert (=> b!571881 m!550827))

(push 1)

