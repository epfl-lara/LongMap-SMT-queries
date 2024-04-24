; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68676 () Bool)

(assert start!68676)

(declare-fun b!797983 () Bool)

(declare-fun res!542132 () Bool)

(declare-fun e!442775 () Bool)

(assert (=> b!797983 (=> (not res!542132) (not e!442775))))

(declare-datatypes ((array!43340 0))(
  ( (array!43341 (arr!20746 (Array (_ BitVec 32) (_ BitVec 64))) (size!21166 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43340)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797983 (= res!542132 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797984 () Bool)

(declare-fun res!542133 () Bool)

(declare-fun e!442777 () Bool)

(assert (=> b!797984 (=> (not res!542133) (not e!442777))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43340 (_ BitVec 32)) Bool)

(assert (=> b!797984 (= res!542133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!797985 () Bool)

(declare-fun res!542130 () Bool)

(assert (=> b!797985 (=> (not res!542130) (not e!442777))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!797985 (= res!542130 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21166 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20746 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21166 a!3170)) (= (select (arr!20746 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797986 () Bool)

(declare-fun e!442776 () Bool)

(declare-fun e!442779 () Bool)

(assert (=> b!797986 (= e!442776 e!442779)))

(declare-fun res!542138 () Bool)

(assert (=> b!797986 (=> (not res!542138) (not e!442779))))

(declare-datatypes ((SeekEntryResult!8293 0))(
  ( (MissingZero!8293 (index!35540 (_ BitVec 32))) (Found!8293 (index!35541 (_ BitVec 32))) (Intermediate!8293 (undefined!9105 Bool) (index!35542 (_ BitVec 32)) (x!66598 (_ BitVec 32))) (Undefined!8293) (MissingVacant!8293 (index!35543 (_ BitVec 32))) )
))
(declare-fun lt!355972 () SeekEntryResult!8293)

(declare-fun lt!355975 () SeekEntryResult!8293)

(assert (=> b!797986 (= res!542138 (= lt!355972 lt!355975))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43340 (_ BitVec 32)) SeekEntryResult!8293)

(assert (=> b!797986 (= lt!355975 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20746 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43340 (_ BitVec 32)) SeekEntryResult!8293)

(assert (=> b!797986 (= lt!355972 (seekEntryOrOpen!0 (select (arr!20746 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797987 () Bool)

(declare-fun res!542129 () Bool)

(assert (=> b!797987 (=> (not res!542129) (not e!442777))))

(declare-datatypes ((List!14616 0))(
  ( (Nil!14613) (Cons!14612 (h!15747 (_ BitVec 64)) (t!20923 List!14616)) )
))
(declare-fun arrayNoDuplicates!0 (array!43340 (_ BitVec 32) List!14616) Bool)

(assert (=> b!797987 (= res!542129 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14613))))

(declare-fun b!797989 () Bool)

(declare-fun e!442778 () Bool)

(assert (=> b!797989 (= e!442779 e!442778)))

(declare-fun res!542134 () Bool)

(assert (=> b!797989 (=> (not res!542134) (not e!442778))))

(declare-fun lt!355974 () SeekEntryResult!8293)

(assert (=> b!797989 (= res!542134 (and (= lt!355975 lt!355974) (= (select (arr!20746 a!3170) index!1236) (select (arr!20746 a!3170) j!153))))))

(assert (=> b!797989 (= lt!355974 (Found!8293 j!153))))

(declare-fun b!797990 () Bool)

(assert (=> b!797990 (= e!442775 e!442777)))

(declare-fun res!542135 () Bool)

(assert (=> b!797990 (=> (not res!542135) (not e!442777))))

(declare-fun lt!355978 () SeekEntryResult!8293)

(assert (=> b!797990 (= res!542135 (or (= lt!355978 (MissingZero!8293 i!1163)) (= lt!355978 (MissingVacant!8293 i!1163))))))

(assert (=> b!797990 (= lt!355978 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797991 () Bool)

(assert (=> b!797991 (= e!442777 e!442776)))

(declare-fun res!542136 () Bool)

(assert (=> b!797991 (=> (not res!542136) (not e!442776))))

(declare-fun lt!355977 () SeekEntryResult!8293)

(declare-fun lt!355976 () SeekEntryResult!8293)

(assert (=> b!797991 (= res!542136 (= lt!355977 lt!355976))))

(declare-fun lt!355971 () (_ BitVec 64))

(declare-fun lt!355973 () array!43340)

(assert (=> b!797991 (= lt!355976 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355971 lt!355973 mask!3266))))

(assert (=> b!797991 (= lt!355977 (seekEntryOrOpen!0 lt!355971 lt!355973 mask!3266))))

(assert (=> b!797991 (= lt!355971 (select (store (arr!20746 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797991 (= lt!355973 (array!43341 (store (arr!20746 a!3170) i!1163 k0!2044) (size!21166 a!3170)))))

(declare-fun b!797992 () Bool)

(declare-fun res!542137 () Bool)

(assert (=> b!797992 (=> (not res!542137) (not e!442775))))

(assert (=> b!797992 (= res!542137 (and (= (size!21166 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21166 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21166 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797993 () Bool)

(declare-fun res!542131 () Bool)

(assert (=> b!797993 (=> (not res!542131) (not e!442775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797993 (= res!542131 (validKeyInArray!0 k0!2044))))

(declare-fun b!797994 () Bool)

(assert (=> b!797994 (= e!442778 (not (or (not (= lt!355976 lt!355974)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(assert (=> b!797994 (= lt!355976 (Found!8293 index!1236))))

(declare-fun res!542139 () Bool)

(assert (=> start!68676 (=> (not res!542139) (not e!442775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68676 (= res!542139 (validMask!0 mask!3266))))

(assert (=> start!68676 e!442775))

(assert (=> start!68676 true))

(declare-fun array_inv!16605 (array!43340) Bool)

(assert (=> start!68676 (array_inv!16605 a!3170)))

(declare-fun b!797988 () Bool)

(declare-fun res!542128 () Bool)

(assert (=> b!797988 (=> (not res!542128) (not e!442775))))

(assert (=> b!797988 (= res!542128 (validKeyInArray!0 (select (arr!20746 a!3170) j!153)))))

(assert (= (and start!68676 res!542139) b!797992))

(assert (= (and b!797992 res!542137) b!797988))

(assert (= (and b!797988 res!542128) b!797993))

(assert (= (and b!797993 res!542131) b!797983))

(assert (= (and b!797983 res!542132) b!797990))

(assert (= (and b!797990 res!542135) b!797984))

(assert (= (and b!797984 res!542133) b!797987))

(assert (= (and b!797987 res!542129) b!797985))

(assert (= (and b!797985 res!542130) b!797991))

(assert (= (and b!797991 res!542136) b!797986))

(assert (= (and b!797986 res!542138) b!797989))

(assert (= (and b!797989 res!542134) b!797994))

(declare-fun m!739265 () Bool)

(assert (=> b!797990 m!739265))

(declare-fun m!739267 () Bool)

(assert (=> b!797991 m!739267))

(declare-fun m!739269 () Bool)

(assert (=> b!797991 m!739269))

(declare-fun m!739271 () Bool)

(assert (=> b!797991 m!739271))

(declare-fun m!739273 () Bool)

(assert (=> b!797991 m!739273))

(declare-fun m!739275 () Bool)

(assert (=> b!797984 m!739275))

(declare-fun m!739277 () Bool)

(assert (=> b!797983 m!739277))

(declare-fun m!739279 () Bool)

(assert (=> b!797985 m!739279))

(declare-fun m!739281 () Bool)

(assert (=> b!797985 m!739281))

(declare-fun m!739283 () Bool)

(assert (=> b!797986 m!739283))

(assert (=> b!797986 m!739283))

(declare-fun m!739285 () Bool)

(assert (=> b!797986 m!739285))

(assert (=> b!797986 m!739283))

(declare-fun m!739287 () Bool)

(assert (=> b!797986 m!739287))

(assert (=> b!797988 m!739283))

(assert (=> b!797988 m!739283))

(declare-fun m!739289 () Bool)

(assert (=> b!797988 m!739289))

(declare-fun m!739291 () Bool)

(assert (=> b!797989 m!739291))

(assert (=> b!797989 m!739283))

(declare-fun m!739293 () Bool)

(assert (=> b!797987 m!739293))

(declare-fun m!739295 () Bool)

(assert (=> start!68676 m!739295))

(declare-fun m!739297 () Bool)

(assert (=> start!68676 m!739297))

(declare-fun m!739299 () Bool)

(assert (=> b!797993 m!739299))

(check-sat (not b!797984) (not b!797993) (not b!797986) (not b!797983) (not b!797988) (not b!797987) (not b!797990) (not start!68676) (not b!797991))
(check-sat)
