; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68610 () Bool)

(assert start!68610)

(declare-fun b!796865 () Bool)

(declare-fun e!442254 () Bool)

(declare-fun e!442253 () Bool)

(assert (=> b!796865 (= e!442254 e!442253)))

(declare-fun res!541019 () Bool)

(assert (=> b!796865 (=> (not res!541019) (not e!442253))))

(declare-datatypes ((SeekEntryResult!8260 0))(
  ( (MissingZero!8260 (index!35408 (_ BitVec 32))) (Found!8260 (index!35409 (_ BitVec 32))) (Intermediate!8260 (undefined!9072 Bool) (index!35410 (_ BitVec 32)) (x!66477 (_ BitVec 32))) (Undefined!8260) (MissingVacant!8260 (index!35411 (_ BitVec 32))) )
))
(declare-fun lt!355260 () SeekEntryResult!8260)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796865 (= res!541019 (or (= lt!355260 (MissingZero!8260 i!1163)) (= lt!355260 (MissingVacant!8260 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43274 0))(
  ( (array!43275 (arr!20713 (Array (_ BitVec 32) (_ BitVec 64))) (size!21133 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43274)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43274 (_ BitVec 32)) SeekEntryResult!8260)

(assert (=> b!796865 (= lt!355260 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!796866 () Bool)

(declare-fun e!442252 () Bool)

(assert (=> b!796866 (= e!442253 e!442252)))

(declare-fun res!541016 () Bool)

(assert (=> b!796866 (=> (not res!541016) (not e!442252))))

(declare-fun lt!355261 () SeekEntryResult!8260)

(declare-fun lt!355259 () SeekEntryResult!8260)

(assert (=> b!796866 (= res!541016 (= lt!355261 lt!355259))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355258 () array!43274)

(declare-fun lt!355264 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43274 (_ BitVec 32)) SeekEntryResult!8260)

(assert (=> b!796866 (= lt!355259 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355264 lt!355258 mask!3266))))

(assert (=> b!796866 (= lt!355261 (seekEntryOrOpen!0 lt!355264 lt!355258 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796866 (= lt!355264 (select (store (arr!20713 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!796866 (= lt!355258 (array!43275 (store (arr!20713 a!3170) i!1163 k0!2044) (size!21133 a!3170)))))

(declare-fun b!796867 () Bool)

(declare-fun res!541014 () Bool)

(assert (=> b!796867 (=> (not res!541014) (not e!442254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796867 (= res!541014 (validKeyInArray!0 (select (arr!20713 a!3170) j!153)))))

(declare-fun res!541015 () Bool)

(assert (=> start!68610 (=> (not res!541015) (not e!442254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68610 (= res!541015 (validMask!0 mask!3266))))

(assert (=> start!68610 e!442254))

(assert (=> start!68610 true))

(declare-fun array_inv!16572 (array!43274) Bool)

(assert (=> start!68610 (array_inv!16572 a!3170)))

(declare-fun b!796868 () Bool)

(declare-fun e!442255 () Bool)

(assert (=> b!796868 (= e!442255 (not true))))

(assert (=> b!796868 (= lt!355259 (Found!8260 index!1236))))

(declare-fun b!796869 () Bool)

(declare-fun res!541020 () Bool)

(assert (=> b!796869 (=> (not res!541020) (not e!442254))))

(assert (=> b!796869 (= res!541020 (validKeyInArray!0 k0!2044))))

(declare-fun b!796870 () Bool)

(assert (=> b!796870 (= e!442252 e!442255)))

(declare-fun res!541017 () Bool)

(assert (=> b!796870 (=> (not res!541017) (not e!442255))))

(declare-fun lt!355262 () SeekEntryResult!8260)

(declare-fun lt!355263 () SeekEntryResult!8260)

(assert (=> b!796870 (= res!541017 (and (= lt!355262 lt!355263) (= lt!355263 (Found!8260 j!153)) (= (select (arr!20713 a!3170) index!1236) (select (arr!20713 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796870 (= lt!355263 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20713 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796870 (= lt!355262 (seekEntryOrOpen!0 (select (arr!20713 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796871 () Bool)

(declare-fun res!541018 () Bool)

(assert (=> b!796871 (=> (not res!541018) (not e!442254))))

(assert (=> b!796871 (= res!541018 (and (= (size!21133 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21133 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21133 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796872 () Bool)

(declare-fun res!541012 () Bool)

(assert (=> b!796872 (=> (not res!541012) (not e!442253))))

(declare-datatypes ((List!14583 0))(
  ( (Nil!14580) (Cons!14579 (h!15714 (_ BitVec 64)) (t!20890 List!14583)) )
))
(declare-fun arrayNoDuplicates!0 (array!43274 (_ BitVec 32) List!14583) Bool)

(assert (=> b!796872 (= res!541012 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14580))))

(declare-fun b!796873 () Bool)

(declare-fun res!541011 () Bool)

(assert (=> b!796873 (=> (not res!541011) (not e!442253))))

(assert (=> b!796873 (= res!541011 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21133 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20713 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21133 a!3170)) (= (select (arr!20713 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796874 () Bool)

(declare-fun res!541013 () Bool)

(assert (=> b!796874 (=> (not res!541013) (not e!442253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43274 (_ BitVec 32)) Bool)

(assert (=> b!796874 (= res!541013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796875 () Bool)

(declare-fun res!541010 () Bool)

(assert (=> b!796875 (=> (not res!541010) (not e!442254))))

(declare-fun arrayContainsKey!0 (array!43274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796875 (= res!541010 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68610 res!541015) b!796871))

(assert (= (and b!796871 res!541018) b!796867))

(assert (= (and b!796867 res!541014) b!796869))

(assert (= (and b!796869 res!541020) b!796875))

(assert (= (and b!796875 res!541010) b!796865))

(assert (= (and b!796865 res!541019) b!796874))

(assert (= (and b!796874 res!541013) b!796872))

(assert (= (and b!796872 res!541012) b!796873))

(assert (= (and b!796873 res!541011) b!796866))

(assert (= (and b!796866 res!541016) b!796870))

(assert (= (and b!796870 res!541017) b!796868))

(declare-fun m!738059 () Bool)

(assert (=> b!796873 m!738059))

(declare-fun m!738061 () Bool)

(assert (=> b!796873 m!738061))

(declare-fun m!738063 () Bool)

(assert (=> start!68610 m!738063))

(declare-fun m!738065 () Bool)

(assert (=> start!68610 m!738065))

(declare-fun m!738067 () Bool)

(assert (=> b!796875 m!738067))

(declare-fun m!738069 () Bool)

(assert (=> b!796867 m!738069))

(assert (=> b!796867 m!738069))

(declare-fun m!738071 () Bool)

(assert (=> b!796867 m!738071))

(declare-fun m!738073 () Bool)

(assert (=> b!796872 m!738073))

(declare-fun m!738075 () Bool)

(assert (=> b!796870 m!738075))

(assert (=> b!796870 m!738069))

(assert (=> b!796870 m!738069))

(declare-fun m!738077 () Bool)

(assert (=> b!796870 m!738077))

(assert (=> b!796870 m!738069))

(declare-fun m!738079 () Bool)

(assert (=> b!796870 m!738079))

(declare-fun m!738081 () Bool)

(assert (=> b!796874 m!738081))

(declare-fun m!738083 () Bool)

(assert (=> b!796865 m!738083))

(declare-fun m!738085 () Bool)

(assert (=> b!796869 m!738085))

(declare-fun m!738087 () Bool)

(assert (=> b!796866 m!738087))

(declare-fun m!738089 () Bool)

(assert (=> b!796866 m!738089))

(declare-fun m!738091 () Bool)

(assert (=> b!796866 m!738091))

(declare-fun m!738093 () Bool)

(assert (=> b!796866 m!738093))

(check-sat (not b!796865) (not start!68610) (not b!796875) (not b!796867) (not b!796874) (not b!796872) (not b!796870) (not b!796869) (not b!796866))
(check-sat)
