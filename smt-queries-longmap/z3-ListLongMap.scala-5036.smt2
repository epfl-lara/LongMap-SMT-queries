; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68706 () Bool)

(assert start!68706)

(declare-fun res!544897 () Bool)

(declare-fun e!443661 () Bool)

(assert (=> start!68706 (=> (not res!544897) (not e!443661))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68706 (= res!544897 (validMask!0 mask!3266))))

(assert (=> start!68706 e!443661))

(assert (=> start!68706 true))

(declare-datatypes ((array!43513 0))(
  ( (array!43514 (arr!20837 (Array (_ BitVec 32) (_ BitVec 64))) (size!21258 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43513)

(declare-fun array_inv!16720 (array!43513) Bool)

(assert (=> start!68706 (array_inv!16720 a!3170)))

(declare-fun b!800234 () Bool)

(declare-fun e!443662 () Bool)

(assert (=> b!800234 (= e!443662 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8425 0))(
  ( (MissingZero!8425 (index!36068 (_ BitVec 32))) (Found!8425 (index!36069 (_ BitVec 32))) (Intermediate!8425 (undefined!9237 Bool) (index!36070 (_ BitVec 32)) (x!66946 (_ BitVec 32))) (Undefined!8425) (MissingVacant!8425 (index!36071 (_ BitVec 32))) )
))
(declare-fun lt!357395 () SeekEntryResult!8425)

(declare-fun lt!357400 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43513 (_ BitVec 32)) SeekEntryResult!8425)

(assert (=> b!800234 (= lt!357395 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357400 vacantBefore!23 (select (arr!20837 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800235 () Bool)

(declare-fun res!544894 () Bool)

(declare-fun e!443657 () Bool)

(assert (=> b!800235 (=> (not res!544894) (not e!443657))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800235 (= res!544894 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21258 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20837 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21258 a!3170)) (= (select (arr!20837 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800236 () Bool)

(declare-fun res!544902 () Bool)

(assert (=> b!800236 (=> (not res!544902) (not e!443661))))

(assert (=> b!800236 (= res!544902 (and (= (size!21258 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21258 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21258 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800237 () Bool)

(declare-fun e!443659 () Bool)

(declare-fun e!443660 () Bool)

(assert (=> b!800237 (= e!443659 e!443660)))

(declare-fun res!544896 () Bool)

(assert (=> b!800237 (=> (not res!544896) (not e!443660))))

(declare-fun lt!357394 () SeekEntryResult!8425)

(declare-fun lt!357398 () SeekEntryResult!8425)

(assert (=> b!800237 (= res!544896 (and (= lt!357398 lt!357394) (= lt!357394 (Found!8425 j!153)) (not (= (select (arr!20837 a!3170) index!1236) (select (arr!20837 a!3170) j!153)))))))

(assert (=> b!800237 (= lt!357394 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20837 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43513 (_ BitVec 32)) SeekEntryResult!8425)

(assert (=> b!800237 (= lt!357398 (seekEntryOrOpen!0 (select (arr!20837 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800238 () Bool)

(assert (=> b!800238 (= e!443660 e!443662)))

(declare-fun res!544899 () Bool)

(assert (=> b!800238 (=> (not res!544899) (not e!443662))))

(assert (=> b!800238 (= res!544899 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357400 #b00000000000000000000000000000000) (bvslt lt!357400 (size!21258 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800238 (= lt!357400 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800239 () Bool)

(assert (=> b!800239 (= e!443661 e!443657)))

(declare-fun res!544898 () Bool)

(assert (=> b!800239 (=> (not res!544898) (not e!443657))))

(declare-fun lt!357396 () SeekEntryResult!8425)

(assert (=> b!800239 (= res!544898 (or (= lt!357396 (MissingZero!8425 i!1163)) (= lt!357396 (MissingVacant!8425 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!800239 (= lt!357396 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800240 () Bool)

(declare-fun res!544895 () Bool)

(assert (=> b!800240 (=> (not res!544895) (not e!443661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800240 (= res!544895 (validKeyInArray!0 k0!2044))))

(declare-fun b!800241 () Bool)

(declare-fun res!544901 () Bool)

(assert (=> b!800241 (=> (not res!544901) (not e!443662))))

(declare-fun lt!357397 () array!43513)

(declare-fun lt!357401 () SeekEntryResult!8425)

(declare-fun lt!357399 () (_ BitVec 64))

(assert (=> b!800241 (= res!544901 (= lt!357401 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357400 vacantAfter!23 lt!357399 lt!357397 mask!3266)))))

(declare-fun b!800242 () Bool)

(declare-fun res!544903 () Bool)

(assert (=> b!800242 (=> (not res!544903) (not e!443661))))

(declare-fun arrayContainsKey!0 (array!43513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800242 (= res!544903 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800243 () Bool)

(declare-fun res!544904 () Bool)

(assert (=> b!800243 (=> (not res!544904) (not e!443657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43513 (_ BitVec 32)) Bool)

(assert (=> b!800243 (= res!544904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800244 () Bool)

(declare-fun res!544905 () Bool)

(assert (=> b!800244 (=> (not res!544905) (not e!443657))))

(declare-datatypes ((List!14839 0))(
  ( (Nil!14836) (Cons!14835 (h!15964 (_ BitVec 64)) (t!21145 List!14839)) )
))
(declare-fun arrayNoDuplicates!0 (array!43513 (_ BitVec 32) List!14839) Bool)

(assert (=> b!800244 (= res!544905 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14836))))

(declare-fun b!800245 () Bool)

(declare-fun res!544900 () Bool)

(assert (=> b!800245 (=> (not res!544900) (not e!443661))))

(assert (=> b!800245 (= res!544900 (validKeyInArray!0 (select (arr!20837 a!3170) j!153)))))

(declare-fun b!800246 () Bool)

(assert (=> b!800246 (= e!443657 e!443659)))

(declare-fun res!544893 () Bool)

(assert (=> b!800246 (=> (not res!544893) (not e!443659))))

(assert (=> b!800246 (= res!544893 (= lt!357401 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357399 lt!357397 mask!3266)))))

(assert (=> b!800246 (= lt!357401 (seekEntryOrOpen!0 lt!357399 lt!357397 mask!3266))))

(assert (=> b!800246 (= lt!357399 (select (store (arr!20837 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800246 (= lt!357397 (array!43514 (store (arr!20837 a!3170) i!1163 k0!2044) (size!21258 a!3170)))))

(assert (= (and start!68706 res!544897) b!800236))

(assert (= (and b!800236 res!544902) b!800245))

(assert (= (and b!800245 res!544900) b!800240))

(assert (= (and b!800240 res!544895) b!800242))

(assert (= (and b!800242 res!544903) b!800239))

(assert (= (and b!800239 res!544898) b!800243))

(assert (= (and b!800243 res!544904) b!800244))

(assert (= (and b!800244 res!544905) b!800235))

(assert (= (and b!800235 res!544894) b!800246))

(assert (= (and b!800246 res!544893) b!800237))

(assert (= (and b!800237 res!544896) b!800238))

(assert (= (and b!800238 res!544899) b!800241))

(assert (= (and b!800241 res!544901) b!800234))

(declare-fun m!740833 () Bool)

(assert (=> b!800241 m!740833))

(declare-fun m!740835 () Bool)

(assert (=> b!800244 m!740835))

(declare-fun m!740837 () Bool)

(assert (=> b!800239 m!740837))

(declare-fun m!740839 () Bool)

(assert (=> b!800245 m!740839))

(assert (=> b!800245 m!740839))

(declare-fun m!740841 () Bool)

(assert (=> b!800245 m!740841))

(declare-fun m!740843 () Bool)

(assert (=> start!68706 m!740843))

(declare-fun m!740845 () Bool)

(assert (=> start!68706 m!740845))

(declare-fun m!740847 () Bool)

(assert (=> b!800246 m!740847))

(declare-fun m!740849 () Bool)

(assert (=> b!800246 m!740849))

(declare-fun m!740851 () Bool)

(assert (=> b!800246 m!740851))

(declare-fun m!740853 () Bool)

(assert (=> b!800246 m!740853))

(declare-fun m!740855 () Bool)

(assert (=> b!800243 m!740855))

(declare-fun m!740857 () Bool)

(assert (=> b!800235 m!740857))

(declare-fun m!740859 () Bool)

(assert (=> b!800235 m!740859))

(declare-fun m!740861 () Bool)

(assert (=> b!800240 m!740861))

(declare-fun m!740863 () Bool)

(assert (=> b!800238 m!740863))

(declare-fun m!740865 () Bool)

(assert (=> b!800237 m!740865))

(assert (=> b!800237 m!740839))

(assert (=> b!800237 m!740839))

(declare-fun m!740867 () Bool)

(assert (=> b!800237 m!740867))

(assert (=> b!800237 m!740839))

(declare-fun m!740869 () Bool)

(assert (=> b!800237 m!740869))

(assert (=> b!800234 m!740839))

(assert (=> b!800234 m!740839))

(declare-fun m!740871 () Bool)

(assert (=> b!800234 m!740871))

(declare-fun m!740873 () Bool)

(assert (=> b!800242 m!740873))

(check-sat (not b!800246) (not b!800244) (not b!800241) (not b!800245) (not start!68706) (not b!800242) (not b!800239) (not b!800243) (not b!800237) (not b!800240) (not b!800238) (not b!800234))
(check-sat)
