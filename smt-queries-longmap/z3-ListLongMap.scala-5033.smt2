; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68710 () Bool)

(assert start!68710)

(declare-fun res!544702 () Bool)

(declare-fun e!443670 () Bool)

(assert (=> start!68710 (=> (not res!544702) (not e!443670))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68710 (= res!544702 (validMask!0 mask!3266))))

(assert (=> start!68710 e!443670))

(assert (=> start!68710 true))

(declare-datatypes ((array!43500 0))(
  ( (array!43501 (arr!20830 (Array (_ BitVec 32) (_ BitVec 64))) (size!21251 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43500)

(declare-fun array_inv!16626 (array!43500) Bool)

(assert (=> start!68710 (array_inv!16626 a!3170)))

(declare-fun b!800172 () Bool)

(declare-fun e!443667 () Bool)

(declare-fun e!443672 () Bool)

(assert (=> b!800172 (= e!443667 e!443672)))

(declare-fun res!544692 () Bool)

(assert (=> b!800172 (=> (not res!544692) (not e!443672))))

(declare-datatypes ((SeekEntryResult!8421 0))(
  ( (MissingZero!8421 (index!36052 (_ BitVec 32))) (Found!8421 (index!36053 (_ BitVec 32))) (Intermediate!8421 (undefined!9233 Bool) (index!36054 (_ BitVec 32)) (x!66923 (_ BitVec 32))) (Undefined!8421) (MissingVacant!8421 (index!36055 (_ BitVec 32))) )
))
(declare-fun lt!357447 () SeekEntryResult!8421)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!357449 () SeekEntryResult!8421)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800172 (= res!544692 (and (= lt!357449 lt!357447) (= lt!357447 (Found!8421 j!153)) (not (= (select (arr!20830 a!3170) index!1236) (select (arr!20830 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43500 (_ BitVec 32)) SeekEntryResult!8421)

(assert (=> b!800172 (= lt!357447 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20830 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43500 (_ BitVec 32)) SeekEntryResult!8421)

(assert (=> b!800172 (= lt!357449 (seekEntryOrOpen!0 (select (arr!20830 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800173 () Bool)

(declare-fun res!544695 () Bool)

(declare-fun e!443671 () Bool)

(assert (=> b!800173 (=> (not res!544695) (not e!443671))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357442 () array!43500)

(declare-fun lt!357444 () SeekEntryResult!8421)

(declare-fun lt!357446 () (_ BitVec 32))

(declare-fun lt!357443 () (_ BitVec 64))

(assert (=> b!800173 (= res!544695 (= lt!357444 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357446 vacantAfter!23 lt!357443 lt!357442 mask!3266)))))

(declare-fun b!800174 () Bool)

(declare-fun res!544697 () Bool)

(assert (=> b!800174 (=> (not res!544697) (not e!443670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800174 (= res!544697 (validKeyInArray!0 (select (arr!20830 a!3170) j!153)))))

(declare-fun b!800175 () Bool)

(declare-fun res!544701 () Bool)

(declare-fun e!443669 () Bool)

(assert (=> b!800175 (=> (not res!544701) (not e!443669))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43500 (_ BitVec 32)) Bool)

(assert (=> b!800175 (= res!544701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800176 () Bool)

(assert (=> b!800176 (= e!443670 e!443669)))

(declare-fun res!544696 () Bool)

(assert (=> b!800176 (=> (not res!544696) (not e!443669))))

(declare-fun lt!357448 () SeekEntryResult!8421)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800176 (= res!544696 (or (= lt!357448 (MissingZero!8421 i!1163)) (= lt!357448 (MissingVacant!8421 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!800176 (= lt!357448 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800177 () Bool)

(assert (=> b!800177 (= e!443671 false)))

(declare-fun lt!357445 () SeekEntryResult!8421)

(assert (=> b!800177 (= lt!357445 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357446 vacantBefore!23 (select (arr!20830 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800178 () Bool)

(declare-fun res!544703 () Bool)

(assert (=> b!800178 (=> (not res!544703) (not e!443670))))

(assert (=> b!800178 (= res!544703 (validKeyInArray!0 k0!2044))))

(declare-fun b!800179 () Bool)

(declare-fun res!544693 () Bool)

(assert (=> b!800179 (=> (not res!544693) (not e!443669))))

(assert (=> b!800179 (= res!544693 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21251 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20830 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21251 a!3170)) (= (select (arr!20830 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800180 () Bool)

(assert (=> b!800180 (= e!443672 e!443671)))

(declare-fun res!544700 () Bool)

(assert (=> b!800180 (=> (not res!544700) (not e!443671))))

(assert (=> b!800180 (= res!544700 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357446 #b00000000000000000000000000000000) (bvslt lt!357446 (size!21251 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800180 (= lt!357446 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800181 () Bool)

(declare-fun res!544691 () Bool)

(assert (=> b!800181 (=> (not res!544691) (not e!443669))))

(declare-datatypes ((List!14793 0))(
  ( (Nil!14790) (Cons!14789 (h!15918 (_ BitVec 64)) (t!21108 List!14793)) )
))
(declare-fun arrayNoDuplicates!0 (array!43500 (_ BitVec 32) List!14793) Bool)

(assert (=> b!800181 (= res!544691 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14790))))

(declare-fun b!800182 () Bool)

(assert (=> b!800182 (= e!443669 e!443667)))

(declare-fun res!544699 () Bool)

(assert (=> b!800182 (=> (not res!544699) (not e!443667))))

(assert (=> b!800182 (= res!544699 (= lt!357444 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357443 lt!357442 mask!3266)))))

(assert (=> b!800182 (= lt!357444 (seekEntryOrOpen!0 lt!357443 lt!357442 mask!3266))))

(assert (=> b!800182 (= lt!357443 (select (store (arr!20830 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800182 (= lt!357442 (array!43501 (store (arr!20830 a!3170) i!1163 k0!2044) (size!21251 a!3170)))))

(declare-fun b!800183 () Bool)

(declare-fun res!544694 () Bool)

(assert (=> b!800183 (=> (not res!544694) (not e!443670))))

(assert (=> b!800183 (= res!544694 (and (= (size!21251 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21251 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21251 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800184 () Bool)

(declare-fun res!544698 () Bool)

(assert (=> b!800184 (=> (not res!544698) (not e!443670))))

(declare-fun arrayContainsKey!0 (array!43500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800184 (= res!544698 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68710 res!544702) b!800183))

(assert (= (and b!800183 res!544694) b!800174))

(assert (= (and b!800174 res!544697) b!800178))

(assert (= (and b!800178 res!544703) b!800184))

(assert (= (and b!800184 res!544698) b!800176))

(assert (= (and b!800176 res!544696) b!800175))

(assert (= (and b!800175 res!544701) b!800181))

(assert (= (and b!800181 res!544691) b!800179))

(assert (= (and b!800179 res!544693) b!800182))

(assert (= (and b!800182 res!544699) b!800172))

(assert (= (and b!800172 res!544692) b!800180))

(assert (= (and b!800180 res!544700) b!800173))

(assert (= (and b!800173 res!544695) b!800177))

(declare-fun m!741239 () Bool)

(assert (=> b!800178 m!741239))

(declare-fun m!741241 () Bool)

(assert (=> b!800174 m!741241))

(assert (=> b!800174 m!741241))

(declare-fun m!741243 () Bool)

(assert (=> b!800174 m!741243))

(declare-fun m!741245 () Bool)

(assert (=> start!68710 m!741245))

(declare-fun m!741247 () Bool)

(assert (=> start!68710 m!741247))

(declare-fun m!741249 () Bool)

(assert (=> b!800182 m!741249))

(declare-fun m!741251 () Bool)

(assert (=> b!800182 m!741251))

(declare-fun m!741253 () Bool)

(assert (=> b!800182 m!741253))

(declare-fun m!741255 () Bool)

(assert (=> b!800182 m!741255))

(declare-fun m!741257 () Bool)

(assert (=> b!800175 m!741257))

(declare-fun m!741259 () Bool)

(assert (=> b!800179 m!741259))

(declare-fun m!741261 () Bool)

(assert (=> b!800179 m!741261))

(declare-fun m!741263 () Bool)

(assert (=> b!800172 m!741263))

(assert (=> b!800172 m!741241))

(assert (=> b!800172 m!741241))

(declare-fun m!741265 () Bool)

(assert (=> b!800172 m!741265))

(assert (=> b!800172 m!741241))

(declare-fun m!741267 () Bool)

(assert (=> b!800172 m!741267))

(declare-fun m!741269 () Bool)

(assert (=> b!800173 m!741269))

(declare-fun m!741271 () Bool)

(assert (=> b!800180 m!741271))

(declare-fun m!741273 () Bool)

(assert (=> b!800181 m!741273))

(declare-fun m!741275 () Bool)

(assert (=> b!800176 m!741275))

(declare-fun m!741277 () Bool)

(assert (=> b!800184 m!741277))

(assert (=> b!800177 m!741241))

(assert (=> b!800177 m!741241))

(declare-fun m!741279 () Bool)

(assert (=> b!800177 m!741279))

(check-sat (not b!800178) (not b!800176) (not start!68710) (not b!800181) (not b!800177) (not b!800172) (not b!800180) (not b!800182) (not b!800174) (not b!800173) (not b!800175) (not b!800184))
(check-sat)
