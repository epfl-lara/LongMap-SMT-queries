; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69238 () Bool)

(assert start!69238)

(declare-fun b!807767 () Bool)

(declare-fun res!551894 () Bool)

(declare-fun e!447201 () Bool)

(assert (=> b!807767 (=> (not res!551894) (not e!447201))))

(declare-datatypes ((array!43938 0))(
  ( (array!43939 (arr!21046 (Array (_ BitVec 32) (_ BitVec 64))) (size!21467 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43938)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43938 (_ BitVec 32)) Bool)

(assert (=> b!807767 (= res!551894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807768 () Bool)

(declare-fun e!447199 () Bool)

(assert (=> b!807768 (= e!447201 e!447199)))

(declare-fun res!551898 () Bool)

(assert (=> b!807768 (=> (not res!551898) (not e!447199))))

(declare-fun lt!361913 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361908 () array!43938)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8637 0))(
  ( (MissingZero!8637 (index!36916 (_ BitVec 32))) (Found!8637 (index!36917 (_ BitVec 32))) (Intermediate!8637 (undefined!9449 Bool) (index!36918 (_ BitVec 32)) (x!67721 (_ BitVec 32))) (Undefined!8637) (MissingVacant!8637 (index!36919 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43938 (_ BitVec 32)) SeekEntryResult!8637)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43938 (_ BitVec 32)) SeekEntryResult!8637)

(assert (=> b!807768 (= res!551898 (= (seekEntryOrOpen!0 lt!361913 lt!361908 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361913 lt!361908 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807768 (= lt!361913 (select (store (arr!21046 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807768 (= lt!361908 (array!43939 (store (arr!21046 a!3170) i!1163 k0!2044) (size!21467 a!3170)))))

(declare-fun b!807769 () Bool)

(declare-fun res!551892 () Bool)

(assert (=> b!807769 (=> (not res!551892) (not e!447201))))

(declare-datatypes ((List!15009 0))(
  ( (Nil!15006) (Cons!15005 (h!16134 (_ BitVec 64)) (t!21324 List!15009)) )
))
(declare-fun arrayNoDuplicates!0 (array!43938 (_ BitVec 32) List!15009) Bool)

(assert (=> b!807769 (= res!551892 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15006))))

(declare-fun b!807770 () Bool)

(declare-fun res!551897 () Bool)

(declare-fun e!447200 () Bool)

(assert (=> b!807770 (=> (not res!551897) (not e!447200))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807770 (= res!551897 (validKeyInArray!0 (select (arr!21046 a!3170) j!153)))))

(declare-fun b!807771 () Bool)

(declare-fun e!447203 () Bool)

(assert (=> b!807771 (= e!447199 e!447203)))

(declare-fun res!551899 () Bool)

(assert (=> b!807771 (=> (not res!551899) (not e!447203))))

(declare-fun lt!361912 () SeekEntryResult!8637)

(declare-fun lt!361909 () SeekEntryResult!8637)

(assert (=> b!807771 (= res!551899 (and (= lt!361912 lt!361909) (= lt!361909 (Found!8637 j!153)) (not (= (select (arr!21046 a!3170) index!1236) (select (arr!21046 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807771 (= lt!361909 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21046 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807771 (= lt!361912 (seekEntryOrOpen!0 (select (arr!21046 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807772 () Bool)

(declare-fun res!551896 () Bool)

(assert (=> b!807772 (=> (not res!551896) (not e!447200))))

(assert (=> b!807772 (= res!551896 (and (= (size!21467 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21467 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21467 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807773 () Bool)

(assert (=> b!807773 (= e!447200 e!447201)))

(declare-fun res!551893 () Bool)

(assert (=> b!807773 (=> (not res!551893) (not e!447201))))

(declare-fun lt!361911 () SeekEntryResult!8637)

(assert (=> b!807773 (= res!551893 (or (= lt!361911 (MissingZero!8637 i!1163)) (= lt!361911 (MissingVacant!8637 i!1163))))))

(assert (=> b!807773 (= lt!361911 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807774 () Bool)

(declare-fun res!551891 () Bool)

(assert (=> b!807774 (=> (not res!551891) (not e!447201))))

(assert (=> b!807774 (= res!551891 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21467 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21046 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21467 a!3170)) (= (select (arr!21046 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!551890 () Bool)

(assert (=> start!69238 (=> (not res!551890) (not e!447200))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69238 (= res!551890 (validMask!0 mask!3266))))

(assert (=> start!69238 e!447200))

(assert (=> start!69238 true))

(declare-fun array_inv!16842 (array!43938) Bool)

(assert (=> start!69238 (array_inv!16842 a!3170)))

(declare-fun b!807775 () Bool)

(declare-fun res!551895 () Bool)

(assert (=> b!807775 (=> (not res!551895) (not e!447200))))

(assert (=> b!807775 (= res!551895 (validKeyInArray!0 k0!2044))))

(declare-fun b!807776 () Bool)

(declare-fun res!551900 () Bool)

(assert (=> b!807776 (=> (not res!551900) (not e!447200))))

(declare-fun arrayContainsKey!0 (array!43938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807776 (= res!551900 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807777 () Bool)

(assert (=> b!807777 (= e!447203 false)))

(declare-fun lt!361910 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807777 (= lt!361910 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!69238 res!551890) b!807772))

(assert (= (and b!807772 res!551896) b!807770))

(assert (= (and b!807770 res!551897) b!807775))

(assert (= (and b!807775 res!551895) b!807776))

(assert (= (and b!807776 res!551900) b!807773))

(assert (= (and b!807773 res!551893) b!807767))

(assert (= (and b!807767 res!551894) b!807769))

(assert (= (and b!807769 res!551892) b!807774))

(assert (= (and b!807774 res!551891) b!807768))

(assert (= (and b!807768 res!551898) b!807771))

(assert (= (and b!807771 res!551899) b!807777))

(declare-fun m!749851 () Bool)

(assert (=> b!807776 m!749851))

(declare-fun m!749853 () Bool)

(assert (=> b!807777 m!749853))

(declare-fun m!749855 () Bool)

(assert (=> b!807771 m!749855))

(declare-fun m!749857 () Bool)

(assert (=> b!807771 m!749857))

(assert (=> b!807771 m!749857))

(declare-fun m!749859 () Bool)

(assert (=> b!807771 m!749859))

(assert (=> b!807771 m!749857))

(declare-fun m!749861 () Bool)

(assert (=> b!807771 m!749861))

(declare-fun m!749863 () Bool)

(assert (=> start!69238 m!749863))

(declare-fun m!749865 () Bool)

(assert (=> start!69238 m!749865))

(declare-fun m!749867 () Bool)

(assert (=> b!807774 m!749867))

(declare-fun m!749869 () Bool)

(assert (=> b!807774 m!749869))

(declare-fun m!749871 () Bool)

(assert (=> b!807767 m!749871))

(declare-fun m!749873 () Bool)

(assert (=> b!807773 m!749873))

(declare-fun m!749875 () Bool)

(assert (=> b!807768 m!749875))

(declare-fun m!749877 () Bool)

(assert (=> b!807768 m!749877))

(declare-fun m!749879 () Bool)

(assert (=> b!807768 m!749879))

(declare-fun m!749881 () Bool)

(assert (=> b!807768 m!749881))

(declare-fun m!749883 () Bool)

(assert (=> b!807769 m!749883))

(declare-fun m!749885 () Bool)

(assert (=> b!807775 m!749885))

(assert (=> b!807770 m!749857))

(assert (=> b!807770 m!749857))

(declare-fun m!749887 () Bool)

(assert (=> b!807770 m!749887))

(check-sat (not b!807767) (not b!807773) (not b!807776) (not b!807769) (not b!807771) (not b!807775) (not b!807770) (not start!69238) (not b!807777) (not b!807768))
(check-sat)
