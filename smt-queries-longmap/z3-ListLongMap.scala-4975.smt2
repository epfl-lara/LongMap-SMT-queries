; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68484 () Bool)

(assert start!68484)

(declare-fun b!794937 () Bool)

(declare-fun res!539085 () Bool)

(declare-fun e!441487 () Bool)

(assert (=> b!794937 (=> (not res!539085) (not e!441487))))

(declare-datatypes ((array!43148 0))(
  ( (array!43149 (arr!20650 (Array (_ BitVec 32) (_ BitVec 64))) (size!21070 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43148)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794937 (= res!539085 (validKeyInArray!0 (select (arr!20650 a!3170) j!153)))))

(declare-fun b!794938 () Bool)

(declare-fun e!441486 () Bool)

(declare-fun e!441485 () Bool)

(assert (=> b!794938 (= e!441486 e!441485)))

(declare-fun res!539082 () Bool)

(assert (=> b!794938 (=> (not res!539082) (not e!441485))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354343 () (_ BitVec 64))

(declare-fun lt!354342 () array!43148)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8197 0))(
  ( (MissingZero!8197 (index!35156 (_ BitVec 32))) (Found!8197 (index!35157 (_ BitVec 32))) (Intermediate!8197 (undefined!9009 Bool) (index!35158 (_ BitVec 32)) (x!66246 (_ BitVec 32))) (Undefined!8197) (MissingVacant!8197 (index!35159 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43148 (_ BitVec 32)) SeekEntryResult!8197)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43148 (_ BitVec 32)) SeekEntryResult!8197)

(assert (=> b!794938 (= res!539082 (= (seekEntryOrOpen!0 lt!354343 lt!354342 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354343 lt!354342 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794938 (= lt!354343 (select (store (arr!20650 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794938 (= lt!354342 (array!43149 (store (arr!20650 a!3170) i!1163 k0!2044) (size!21070 a!3170)))))

(declare-fun b!794939 () Bool)

(declare-fun res!539084 () Bool)

(assert (=> b!794939 (=> (not res!539084) (not e!441487))))

(assert (=> b!794939 (= res!539084 (validKeyInArray!0 k0!2044))))

(declare-fun res!539086 () Bool)

(assert (=> start!68484 (=> (not res!539086) (not e!441487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68484 (= res!539086 (validMask!0 mask!3266))))

(assert (=> start!68484 e!441487))

(assert (=> start!68484 true))

(declare-fun array_inv!16509 (array!43148) Bool)

(assert (=> start!68484 (array_inv!16509 a!3170)))

(declare-fun b!794940 () Bool)

(declare-fun res!539083 () Bool)

(assert (=> b!794940 (=> (not res!539083) (not e!441486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43148 (_ BitVec 32)) Bool)

(assert (=> b!794940 (= res!539083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794941 () Bool)

(declare-fun res!539089 () Bool)

(assert (=> b!794941 (=> (not res!539089) (not e!441487))))

(declare-fun arrayContainsKey!0 (array!43148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794941 (= res!539089 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794942 () Bool)

(declare-fun res!539088 () Bool)

(assert (=> b!794942 (=> (not res!539088) (not e!441486))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794942 (= res!539088 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21070 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20650 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21070 a!3170)) (= (select (arr!20650 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794943 () Bool)

(assert (=> b!794943 (= e!441485 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (or (bvslt vacantBefore!23 #b00000000000000000000000000000000) (bvsge vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun b!794944 () Bool)

(declare-fun res!539087 () Bool)

(assert (=> b!794944 (=> (not res!539087) (not e!441486))))

(declare-datatypes ((List!14520 0))(
  ( (Nil!14517) (Cons!14516 (h!15651 (_ BitVec 64)) (t!20827 List!14520)) )
))
(declare-fun arrayNoDuplicates!0 (array!43148 (_ BitVec 32) List!14520) Bool)

(assert (=> b!794944 (= res!539087 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14517))))

(declare-fun b!794945 () Bool)

(declare-fun res!539090 () Bool)

(assert (=> b!794945 (=> (not res!539090) (not e!441487))))

(assert (=> b!794945 (= res!539090 (and (= (size!21070 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21070 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21070 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794946 () Bool)

(assert (=> b!794946 (= e!441487 e!441486)))

(declare-fun res!539091 () Bool)

(assert (=> b!794946 (=> (not res!539091) (not e!441486))))

(declare-fun lt!354341 () SeekEntryResult!8197)

(assert (=> b!794946 (= res!539091 (or (= lt!354341 (MissingZero!8197 i!1163)) (= lt!354341 (MissingVacant!8197 i!1163))))))

(assert (=> b!794946 (= lt!354341 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68484 res!539086) b!794945))

(assert (= (and b!794945 res!539090) b!794937))

(assert (= (and b!794937 res!539085) b!794939))

(assert (= (and b!794939 res!539084) b!794941))

(assert (= (and b!794941 res!539089) b!794946))

(assert (= (and b!794946 res!539091) b!794940))

(assert (= (and b!794940 res!539083) b!794944))

(assert (= (and b!794944 res!539087) b!794942))

(assert (= (and b!794942 res!539088) b!794938))

(assert (= (and b!794938 res!539082) b!794943))

(declare-fun m!735893 () Bool)

(assert (=> b!794939 m!735893))

(declare-fun m!735895 () Bool)

(assert (=> start!68484 m!735895))

(declare-fun m!735897 () Bool)

(assert (=> start!68484 m!735897))

(declare-fun m!735899 () Bool)

(assert (=> b!794946 m!735899))

(declare-fun m!735901 () Bool)

(assert (=> b!794937 m!735901))

(assert (=> b!794937 m!735901))

(declare-fun m!735903 () Bool)

(assert (=> b!794937 m!735903))

(declare-fun m!735905 () Bool)

(assert (=> b!794938 m!735905))

(declare-fun m!735907 () Bool)

(assert (=> b!794938 m!735907))

(declare-fun m!735909 () Bool)

(assert (=> b!794938 m!735909))

(declare-fun m!735911 () Bool)

(assert (=> b!794938 m!735911))

(declare-fun m!735913 () Bool)

(assert (=> b!794941 m!735913))

(declare-fun m!735915 () Bool)

(assert (=> b!794944 m!735915))

(declare-fun m!735917 () Bool)

(assert (=> b!794940 m!735917))

(declare-fun m!735919 () Bool)

(assert (=> b!794942 m!735919))

(declare-fun m!735921 () Bool)

(assert (=> b!794942 m!735921))

(check-sat (not b!794938) (not b!794941) (not b!794940) (not b!794946) (not b!794937) (not b!794944) (not b!794939) (not start!68484))
(check-sat)
