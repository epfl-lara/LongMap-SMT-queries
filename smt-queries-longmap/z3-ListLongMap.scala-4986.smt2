; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68406 () Bool)

(assert start!68406)

(declare-fun b!795035 () Bool)

(declare-fun res!539697 () Bool)

(declare-fun e!441287 () Bool)

(assert (=> b!795035 (=> (not res!539697) (not e!441287))))

(declare-datatypes ((array!43213 0))(
  ( (array!43214 (arr!20687 (Array (_ BitVec 32) (_ BitVec 64))) (size!21108 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43213)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43213 (_ BitVec 32)) Bool)

(assert (=> b!795035 (= res!539697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795036 () Bool)

(declare-fun res!539695 () Bool)

(declare-fun e!441286 () Bool)

(assert (=> b!795036 (=> (not res!539695) (not e!441286))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795036 (= res!539695 (and (= (size!21108 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21108 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21108 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795037 () Bool)

(declare-fun res!539702 () Bool)

(assert (=> b!795037 (=> (not res!539702) (not e!441287))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795037 (= res!539702 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21108 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20687 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21108 a!3170)) (= (select (arr!20687 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795038 () Bool)

(declare-fun res!539700 () Bool)

(assert (=> b!795038 (=> (not res!539700) (not e!441286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795038 (= res!539700 (validKeyInArray!0 (select (arr!20687 a!3170) j!153)))))

(declare-fun b!795039 () Bool)

(declare-fun e!441289 () Bool)

(assert (=> b!795039 (= e!441287 e!441289)))

(declare-fun res!539694 () Bool)

(assert (=> b!795039 (=> (not res!539694) (not e!441289))))

(declare-fun lt!354256 () array!43213)

(declare-fun lt!354259 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8275 0))(
  ( (MissingZero!8275 (index!35468 (_ BitVec 32))) (Found!8275 (index!35469 (_ BitVec 32))) (Intermediate!8275 (undefined!9087 Bool) (index!35470 (_ BitVec 32)) (x!66396 (_ BitVec 32))) (Undefined!8275) (MissingVacant!8275 (index!35471 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43213 (_ BitVec 32)) SeekEntryResult!8275)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43213 (_ BitVec 32)) SeekEntryResult!8275)

(assert (=> b!795039 (= res!539694 (= (seekEntryOrOpen!0 lt!354259 lt!354256 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354259 lt!354256 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!795039 (= lt!354259 (select (store (arr!20687 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795039 (= lt!354256 (array!43214 (store (arr!20687 a!3170) i!1163 k0!2044) (size!21108 a!3170)))))

(declare-fun res!539696 () Bool)

(assert (=> start!68406 (=> (not res!539696) (not e!441286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68406 (= res!539696 (validMask!0 mask!3266))))

(assert (=> start!68406 e!441286))

(assert (=> start!68406 true))

(declare-fun array_inv!16570 (array!43213) Bool)

(assert (=> start!68406 (array_inv!16570 a!3170)))

(declare-fun b!795040 () Bool)

(declare-fun res!539698 () Bool)

(assert (=> b!795040 (=> (not res!539698) (not e!441286))))

(assert (=> b!795040 (= res!539698 (validKeyInArray!0 k0!2044))))

(declare-fun b!795041 () Bool)

(assert (=> b!795041 (= e!441289 false)))

(declare-fun lt!354257 () SeekEntryResult!8275)

(assert (=> b!795041 (= lt!354257 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20687 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354258 () SeekEntryResult!8275)

(assert (=> b!795041 (= lt!354258 (seekEntryOrOpen!0 (select (arr!20687 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795042 () Bool)

(assert (=> b!795042 (= e!441286 e!441287)))

(declare-fun res!539701 () Bool)

(assert (=> b!795042 (=> (not res!539701) (not e!441287))))

(declare-fun lt!354260 () SeekEntryResult!8275)

(assert (=> b!795042 (= res!539701 (or (= lt!354260 (MissingZero!8275 i!1163)) (= lt!354260 (MissingVacant!8275 i!1163))))))

(assert (=> b!795042 (= lt!354260 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795043 () Bool)

(declare-fun res!539703 () Bool)

(assert (=> b!795043 (=> (not res!539703) (not e!441287))))

(declare-datatypes ((List!14689 0))(
  ( (Nil!14686) (Cons!14685 (h!15814 (_ BitVec 64)) (t!20995 List!14689)) )
))
(declare-fun arrayNoDuplicates!0 (array!43213 (_ BitVec 32) List!14689) Bool)

(assert (=> b!795043 (= res!539703 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14686))))

(declare-fun b!795044 () Bool)

(declare-fun res!539699 () Bool)

(assert (=> b!795044 (=> (not res!539699) (not e!441286))))

(declare-fun arrayContainsKey!0 (array!43213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795044 (= res!539699 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68406 res!539696) b!795036))

(assert (= (and b!795036 res!539695) b!795038))

(assert (= (and b!795038 res!539700) b!795040))

(assert (= (and b!795040 res!539698) b!795044))

(assert (= (and b!795044 res!539699) b!795042))

(assert (= (and b!795042 res!539701) b!795035))

(assert (= (and b!795035 res!539697) b!795043))

(assert (= (and b!795043 res!539703) b!795037))

(assert (= (and b!795037 res!539702) b!795039))

(assert (= (and b!795039 res!539694) b!795041))

(declare-fun m!735157 () Bool)

(assert (=> b!795039 m!735157))

(declare-fun m!735159 () Bool)

(assert (=> b!795039 m!735159))

(declare-fun m!735161 () Bool)

(assert (=> b!795039 m!735161))

(declare-fun m!735163 () Bool)

(assert (=> b!795039 m!735163))

(declare-fun m!735165 () Bool)

(assert (=> b!795044 m!735165))

(declare-fun m!735167 () Bool)

(assert (=> start!68406 m!735167))

(declare-fun m!735169 () Bool)

(assert (=> start!68406 m!735169))

(declare-fun m!735171 () Bool)

(assert (=> b!795040 m!735171))

(declare-fun m!735173 () Bool)

(assert (=> b!795035 m!735173))

(declare-fun m!735175 () Bool)

(assert (=> b!795042 m!735175))

(declare-fun m!735177 () Bool)

(assert (=> b!795041 m!735177))

(assert (=> b!795041 m!735177))

(declare-fun m!735179 () Bool)

(assert (=> b!795041 m!735179))

(assert (=> b!795041 m!735177))

(declare-fun m!735181 () Bool)

(assert (=> b!795041 m!735181))

(declare-fun m!735183 () Bool)

(assert (=> b!795043 m!735183))

(assert (=> b!795038 m!735177))

(assert (=> b!795038 m!735177))

(declare-fun m!735185 () Bool)

(assert (=> b!795038 m!735185))

(declare-fun m!735187 () Bool)

(assert (=> b!795037 m!735187))

(declare-fun m!735189 () Bool)

(assert (=> b!795037 m!735189))

(check-sat (not b!795035) (not start!68406) (not b!795038) (not b!795039) (not b!795041) (not b!795040) (not b!795044) (not b!795043) (not b!795042))
(check-sat)
