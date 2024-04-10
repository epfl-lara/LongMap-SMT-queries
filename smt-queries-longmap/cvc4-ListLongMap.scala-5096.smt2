; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69186 () Bool)

(assert start!69186)

(declare-fun b!806908 () Bool)

(declare-fun res!551031 () Bool)

(declare-fun e!446809 () Bool)

(assert (=> b!806908 (=> (not res!551031) (not e!446809))))

(declare-datatypes ((array!43886 0))(
  ( (array!43887 (arr!21020 (Array (_ BitVec 32) (_ BitVec 64))) (size!21441 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43886)

(declare-datatypes ((List!14983 0))(
  ( (Nil!14980) (Cons!14979 (h!16108 (_ BitVec 64)) (t!21298 List!14983)) )
))
(declare-fun arrayNoDuplicates!0 (array!43886 (_ BitVec 32) List!14983) Bool)

(assert (=> b!806908 (= res!551031 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14980))))

(declare-fun b!806909 () Bool)

(declare-fun res!551042 () Bool)

(declare-fun e!446811 () Bool)

(assert (=> b!806909 (=> (not res!551042) (not e!446811))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806909 (= res!551042 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806910 () Bool)

(declare-fun res!551032 () Bool)

(assert (=> b!806910 (=> (not res!551032) (not e!446811))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806910 (= res!551032 (validKeyInArray!0 (select (arr!21020 a!3170) j!153)))))

(declare-fun b!806911 () Bool)

(assert (=> b!806911 (= e!446811 e!446809)))

(declare-fun res!551036 () Bool)

(assert (=> b!806911 (=> (not res!551036) (not e!446809))))

(declare-datatypes ((SeekEntryResult!8611 0))(
  ( (MissingZero!8611 (index!36812 (_ BitVec 32))) (Found!8611 (index!36813 (_ BitVec 32))) (Intermediate!8611 (undefined!9423 Bool) (index!36814 (_ BitVec 32)) (x!67623 (_ BitVec 32))) (Undefined!8611) (MissingVacant!8611 (index!36815 (_ BitVec 32))) )
))
(declare-fun lt!361439 () SeekEntryResult!8611)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806911 (= res!551036 (or (= lt!361439 (MissingZero!8611 i!1163)) (= lt!361439 (MissingVacant!8611 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43886 (_ BitVec 32)) SeekEntryResult!8611)

(assert (=> b!806911 (= lt!361439 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!806912 () Bool)

(declare-fun res!551039 () Bool)

(assert (=> b!806912 (=> (not res!551039) (not e!446811))))

(assert (=> b!806912 (= res!551039 (validKeyInArray!0 k!2044))))

(declare-fun b!806913 () Bool)

(declare-fun e!446810 () Bool)

(declare-fun e!446813 () Bool)

(assert (=> b!806913 (= e!446810 e!446813)))

(declare-fun res!551041 () Bool)

(assert (=> b!806913 (=> (not res!551041) (not e!446813))))

(declare-fun lt!361440 () SeekEntryResult!8611)

(declare-fun lt!361444 () SeekEntryResult!8611)

(assert (=> b!806913 (= res!551041 (= lt!361440 lt!361444))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43886 (_ BitVec 32)) SeekEntryResult!8611)

(assert (=> b!806913 (= lt!361444 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21020 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806913 (= lt!361440 (seekEntryOrOpen!0 (select (arr!21020 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806914 () Bool)

(declare-fun e!446812 () Bool)

(assert (=> b!806914 (= e!446813 e!446812)))

(declare-fun res!551037 () Bool)

(assert (=> b!806914 (=> (not res!551037) (not e!446812))))

(declare-fun lt!361441 () SeekEntryResult!8611)

(assert (=> b!806914 (= res!551037 (and (= lt!361444 lt!361441) (= (select (arr!21020 a!3170) index!1236) (select (arr!21020 a!3170) j!153))))))

(assert (=> b!806914 (= lt!361441 (Found!8611 j!153))))

(declare-fun res!551033 () Bool)

(assert (=> start!69186 (=> (not res!551033) (not e!446811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69186 (= res!551033 (validMask!0 mask!3266))))

(assert (=> start!69186 e!446811))

(assert (=> start!69186 true))

(declare-fun array_inv!16816 (array!43886) Bool)

(assert (=> start!69186 (array_inv!16816 a!3170)))

(declare-fun b!806915 () Bool)

(declare-fun res!551034 () Bool)

(assert (=> b!806915 (=> (not res!551034) (not e!446811))))

(assert (=> b!806915 (= res!551034 (and (= (size!21441 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21441 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21441 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806916 () Bool)

(declare-fun res!551040 () Bool)

(assert (=> b!806916 (=> (not res!551040) (not e!446809))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!806916 (= res!551040 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21441 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21020 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21441 a!3170)) (= (select (arr!21020 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806917 () Bool)

(assert (=> b!806917 (= e!446809 e!446810)))

(declare-fun res!551038 () Bool)

(assert (=> b!806917 (=> (not res!551038) (not e!446810))))

(declare-fun lt!361443 () SeekEntryResult!8611)

(declare-fun lt!361438 () SeekEntryResult!8611)

(assert (=> b!806917 (= res!551038 (= lt!361443 lt!361438))))

(declare-fun lt!361442 () array!43886)

(declare-fun lt!361445 () (_ BitVec 64))

(assert (=> b!806917 (= lt!361438 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361445 lt!361442 mask!3266))))

(assert (=> b!806917 (= lt!361443 (seekEntryOrOpen!0 lt!361445 lt!361442 mask!3266))))

(assert (=> b!806917 (= lt!361445 (select (store (arr!21020 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!806917 (= lt!361442 (array!43887 (store (arr!21020 a!3170) i!1163 k!2044) (size!21441 a!3170)))))

(declare-fun b!806918 () Bool)

(declare-fun res!551035 () Bool)

(assert (=> b!806918 (=> (not res!551035) (not e!446809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43886 (_ BitVec 32)) Bool)

(assert (=> b!806918 (= res!551035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806919 () Bool)

(assert (=> b!806919 (= e!446812 (not (or (not (= lt!361438 lt!361441)) (= lt!361438 lt!361444))))))

(assert (=> b!806919 (= lt!361438 (Found!8611 index!1236))))

(assert (= (and start!69186 res!551033) b!806915))

(assert (= (and b!806915 res!551034) b!806910))

(assert (= (and b!806910 res!551032) b!806912))

(assert (= (and b!806912 res!551039) b!806909))

(assert (= (and b!806909 res!551042) b!806911))

(assert (= (and b!806911 res!551036) b!806918))

(assert (= (and b!806918 res!551035) b!806908))

(assert (= (and b!806908 res!551031) b!806916))

(assert (= (and b!806916 res!551040) b!806917))

(assert (= (and b!806917 res!551038) b!806913))

(assert (= (and b!806913 res!551041) b!806914))

(assert (= (and b!806914 res!551037) b!806919))

(declare-fun m!748865 () Bool)

(assert (=> b!806911 m!748865))

(declare-fun m!748867 () Bool)

(assert (=> start!69186 m!748867))

(declare-fun m!748869 () Bool)

(assert (=> start!69186 m!748869))

(declare-fun m!748871 () Bool)

(assert (=> b!806917 m!748871))

(declare-fun m!748873 () Bool)

(assert (=> b!806917 m!748873))

(declare-fun m!748875 () Bool)

(assert (=> b!806917 m!748875))

(declare-fun m!748877 () Bool)

(assert (=> b!806917 m!748877))

(declare-fun m!748879 () Bool)

(assert (=> b!806916 m!748879))

(declare-fun m!748881 () Bool)

(assert (=> b!806916 m!748881))

(declare-fun m!748883 () Bool)

(assert (=> b!806918 m!748883))

(declare-fun m!748885 () Bool)

(assert (=> b!806910 m!748885))

(assert (=> b!806910 m!748885))

(declare-fun m!748887 () Bool)

(assert (=> b!806910 m!748887))

(declare-fun m!748889 () Bool)

(assert (=> b!806914 m!748889))

(assert (=> b!806914 m!748885))

(declare-fun m!748891 () Bool)

(assert (=> b!806912 m!748891))

(declare-fun m!748893 () Bool)

(assert (=> b!806909 m!748893))

(declare-fun m!748895 () Bool)

(assert (=> b!806908 m!748895))

(assert (=> b!806913 m!748885))

(assert (=> b!806913 m!748885))

(declare-fun m!748897 () Bool)

(assert (=> b!806913 m!748897))

(assert (=> b!806913 m!748885))

(declare-fun m!748899 () Bool)

(assert (=> b!806913 m!748899))

(push 1)

(assert (not b!806908))

