; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68584 () Bool)

(assert start!68584)

(declare-fun b!797903 () Bool)

(declare-fun res!542427 () Bool)

(declare-fun e!442636 () Bool)

(assert (=> b!797903 (=> (not res!542427) (not e!442636))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43374 0))(
  ( (array!43375 (arr!20767 (Array (_ BitVec 32) (_ BitVec 64))) (size!21188 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43374)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797903 (= res!542427 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21188 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20767 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21188 a!3170)) (= (select (arr!20767 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!542432 () Bool)

(declare-fun e!442638 () Bool)

(assert (=> start!68584 (=> (not res!542432) (not e!442638))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68584 (= res!542432 (validMask!0 mask!3266))))

(assert (=> start!68584 e!442638))

(assert (=> start!68584 true))

(declare-fun array_inv!16563 (array!43374) Bool)

(assert (=> start!68584 (array_inv!16563 a!3170)))

(declare-fun b!797904 () Bool)

(declare-fun res!542430 () Bool)

(assert (=> b!797904 (=> (not res!542430) (not e!442638))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43374 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797904 (= res!542430 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797905 () Bool)

(assert (=> b!797905 (= e!442638 e!442636)))

(declare-fun res!542426 () Bool)

(assert (=> b!797905 (=> (not res!542426) (not e!442636))))

(declare-datatypes ((SeekEntryResult!8358 0))(
  ( (MissingZero!8358 (index!35800 (_ BitVec 32))) (Found!8358 (index!35801 (_ BitVec 32))) (Intermediate!8358 (undefined!9170 Bool) (index!35802 (_ BitVec 32)) (x!66692 (_ BitVec 32))) (Undefined!8358) (MissingVacant!8358 (index!35803 (_ BitVec 32))) )
))
(declare-fun lt!356071 () SeekEntryResult!8358)

(assert (=> b!797905 (= res!542426 (or (= lt!356071 (MissingZero!8358 i!1163)) (= lt!356071 (MissingVacant!8358 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43374 (_ BitVec 32)) SeekEntryResult!8358)

(assert (=> b!797905 (= lt!356071 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797906 () Bool)

(declare-fun res!542428 () Bool)

(assert (=> b!797906 (=> (not res!542428) (not e!442638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797906 (= res!542428 (validKeyInArray!0 k0!2044))))

(declare-fun b!797907 () Bool)

(declare-fun res!542422 () Bool)

(assert (=> b!797907 (=> (not res!542422) (not e!442638))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797907 (= res!542422 (and (= (size!21188 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21188 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21188 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797908 () Bool)

(declare-fun res!542431 () Bool)

(assert (=> b!797908 (=> (not res!542431) (not e!442636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43374 (_ BitVec 32)) Bool)

(assert (=> b!797908 (= res!542431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797909 () Bool)

(declare-fun e!442639 () Bool)

(declare-fun e!442637 () Bool)

(assert (=> b!797909 (= e!442639 e!442637)))

(declare-fun res!542425 () Bool)

(assert (=> b!797909 (=> (not res!542425) (not e!442637))))

(declare-fun lt!356075 () SeekEntryResult!8358)

(declare-fun lt!356074 () SeekEntryResult!8358)

(assert (=> b!797909 (= res!542425 (and (= lt!356074 lt!356075) (= lt!356075 (Found!8358 j!153)) (= (select (arr!20767 a!3170) index!1236) (select (arr!20767 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43374 (_ BitVec 32)) SeekEntryResult!8358)

(assert (=> b!797909 (= lt!356075 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20767 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797909 (= lt!356074 (seekEntryOrOpen!0 (select (arr!20767 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797910 () Bool)

(declare-fun res!542429 () Bool)

(assert (=> b!797910 (=> (not res!542429) (not e!442638))))

(assert (=> b!797910 (= res!542429 (validKeyInArray!0 (select (arr!20767 a!3170) j!153)))))

(declare-fun b!797911 () Bool)

(declare-fun res!542424 () Bool)

(assert (=> b!797911 (=> (not res!542424) (not e!442636))))

(declare-datatypes ((List!14730 0))(
  ( (Nil!14727) (Cons!14726 (h!15855 (_ BitVec 64)) (t!21045 List!14730)) )
))
(declare-fun arrayNoDuplicates!0 (array!43374 (_ BitVec 32) List!14730) Bool)

(assert (=> b!797911 (= res!542424 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14727))))

(declare-fun b!797912 () Bool)

(assert (=> b!797912 (= e!442637 (not true))))

(declare-fun lt!356069 () SeekEntryResult!8358)

(assert (=> b!797912 (= lt!356069 (Found!8358 index!1236))))

(declare-fun b!797913 () Bool)

(assert (=> b!797913 (= e!442636 e!442639)))

(declare-fun res!542423 () Bool)

(assert (=> b!797913 (=> (not res!542423) (not e!442639))))

(declare-fun lt!356073 () SeekEntryResult!8358)

(assert (=> b!797913 (= res!542423 (= lt!356073 lt!356069))))

(declare-fun lt!356070 () (_ BitVec 64))

(declare-fun lt!356072 () array!43374)

(assert (=> b!797913 (= lt!356069 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356070 lt!356072 mask!3266))))

(assert (=> b!797913 (= lt!356073 (seekEntryOrOpen!0 lt!356070 lt!356072 mask!3266))))

(assert (=> b!797913 (= lt!356070 (select (store (arr!20767 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797913 (= lt!356072 (array!43375 (store (arr!20767 a!3170) i!1163 k0!2044) (size!21188 a!3170)))))

(assert (= (and start!68584 res!542432) b!797907))

(assert (= (and b!797907 res!542422) b!797910))

(assert (= (and b!797910 res!542429) b!797906))

(assert (= (and b!797906 res!542428) b!797904))

(assert (= (and b!797904 res!542430) b!797905))

(assert (= (and b!797905 res!542426) b!797908))

(assert (= (and b!797908 res!542431) b!797911))

(assert (= (and b!797911 res!542424) b!797903))

(assert (= (and b!797903 res!542427) b!797913))

(assert (= (and b!797913 res!542423) b!797909))

(assert (= (and b!797909 res!542425) b!797912))

(declare-fun m!738779 () Bool)

(assert (=> b!797911 m!738779))

(declare-fun m!738781 () Bool)

(assert (=> b!797903 m!738781))

(declare-fun m!738783 () Bool)

(assert (=> b!797903 m!738783))

(declare-fun m!738785 () Bool)

(assert (=> b!797904 m!738785))

(declare-fun m!738787 () Bool)

(assert (=> b!797910 m!738787))

(assert (=> b!797910 m!738787))

(declare-fun m!738789 () Bool)

(assert (=> b!797910 m!738789))

(declare-fun m!738791 () Bool)

(assert (=> b!797906 m!738791))

(declare-fun m!738793 () Bool)

(assert (=> b!797909 m!738793))

(assert (=> b!797909 m!738787))

(assert (=> b!797909 m!738787))

(declare-fun m!738795 () Bool)

(assert (=> b!797909 m!738795))

(assert (=> b!797909 m!738787))

(declare-fun m!738797 () Bool)

(assert (=> b!797909 m!738797))

(declare-fun m!738799 () Bool)

(assert (=> b!797908 m!738799))

(declare-fun m!738801 () Bool)

(assert (=> b!797905 m!738801))

(declare-fun m!738803 () Bool)

(assert (=> start!68584 m!738803))

(declare-fun m!738805 () Bool)

(assert (=> start!68584 m!738805))

(declare-fun m!738807 () Bool)

(assert (=> b!797913 m!738807))

(declare-fun m!738809 () Bool)

(assert (=> b!797913 m!738809))

(declare-fun m!738811 () Bool)

(assert (=> b!797913 m!738811))

(declare-fun m!738813 () Bool)

(assert (=> b!797913 m!738813))

(check-sat (not b!797905) (not b!797904) (not start!68584) (not b!797910) (not b!797909) (not b!797908) (not b!797911) (not b!797906) (not b!797913))
(check-sat)
