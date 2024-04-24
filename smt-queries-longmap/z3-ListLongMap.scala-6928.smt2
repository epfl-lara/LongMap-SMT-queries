; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87358 () Bool)

(assert start!87358)

(declare-fun b!1011579 () Bool)

(declare-fun res!679168 () Bool)

(declare-fun e!569204 () Bool)

(assert (=> b!1011579 (=> (not res!679168) (not e!569204))))

(declare-datatypes ((array!63687 0))(
  ( (array!63688 (arr!30655 (Array (_ BitVec 32) (_ BitVec 64))) (size!31158 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63687)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63687 (_ BitVec 32)) Bool)

(assert (=> b!1011579 (= res!679168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1011580 () Bool)

(declare-fun res!679157 () Bool)

(declare-fun e!569207 () Bool)

(assert (=> b!1011580 (=> (not res!679157) (not e!569207))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1011580 (= res!679157 (and (= (size!31158 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31158 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31158 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1011581 () Bool)

(declare-fun res!679167 () Bool)

(declare-fun e!569208 () Bool)

(assert (=> b!1011581 (=> (not res!679167) (not e!569208))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!447029 () array!63687)

(declare-fun lt!447023 () (_ BitVec 64))

(declare-fun x!1245 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9523 0))(
  ( (MissingZero!9523 (index!40463 (_ BitVec 32))) (Found!9523 (index!40464 (_ BitVec 32))) (Intermediate!9523 (undefined!10335 Bool) (index!40465 (_ BitVec 32)) (x!88029 (_ BitVec 32))) (Undefined!9523) (MissingVacant!9523 (index!40466 (_ BitVec 32))) )
))
(declare-fun lt!447025 () SeekEntryResult!9523)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63687 (_ BitVec 32)) SeekEntryResult!9523)

(assert (=> b!1011581 (= res!679167 (not (= lt!447025 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!447023 lt!447029 mask!3464))))))

(declare-fun b!1011582 () Bool)

(declare-fun e!569203 () Bool)

(assert (=> b!1011582 (= e!569203 e!569208)))

(declare-fun res!679169 () Bool)

(assert (=> b!1011582 (=> (not res!679169) (not e!569208))))

(declare-fun lt!447028 () SeekEntryResult!9523)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011582 (= res!679169 (not (= lt!447028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!447023 mask!3464) lt!447023 lt!447029 mask!3464))))))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1011582 (= lt!447023 (select (store (arr!30655 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1011582 (= lt!447029 (array!63688 (store (arr!30655 a!3219) i!1194 k0!2224) (size!31158 a!3219)))))

(declare-fun b!1011583 () Bool)

(declare-fun res!679162 () Bool)

(assert (=> b!1011583 (=> (not res!679162) (not e!569204))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1011583 (= res!679162 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31158 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31158 a!3219))))))

(declare-fun b!1011584 () Bool)

(assert (=> b!1011584 (= e!569208 false)))

(declare-fun lt!447027 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1011584 (= lt!447027 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1011585 () Bool)

(declare-fun e!569206 () Bool)

(assert (=> b!1011585 (= e!569204 e!569206)))

(declare-fun res!679160 () Bool)

(assert (=> b!1011585 (=> (not res!679160) (not e!569206))))

(declare-fun lt!447024 () SeekEntryResult!9523)

(assert (=> b!1011585 (= res!679160 (= lt!447028 lt!447024))))

(assert (=> b!1011585 (= lt!447024 (Intermediate!9523 false resIndex!38 resX!38))))

(assert (=> b!1011585 (= lt!447028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30655 a!3219) j!170) mask!3464) (select (arr!30655 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011586 () Bool)

(declare-fun res!679166 () Bool)

(assert (=> b!1011586 (=> (not res!679166) (not e!569208))))

(assert (=> b!1011586 (= res!679166 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1011587 () Bool)

(declare-fun res!679158 () Bool)

(assert (=> b!1011587 (=> (not res!679158) (not e!569207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1011587 (= res!679158 (validKeyInArray!0 k0!2224))))

(declare-fun b!1011588 () Bool)

(declare-fun res!679163 () Bool)

(assert (=> b!1011588 (=> (not res!679163) (not e!569204))))

(declare-datatypes ((List!21302 0))(
  ( (Nil!21299) (Cons!21298 (h!22499 (_ BitVec 64)) (t!30295 List!21302)) )
))
(declare-fun arrayNoDuplicates!0 (array!63687 (_ BitVec 32) List!21302) Bool)

(assert (=> b!1011588 (= res!679163 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21299))))

(declare-fun b!1011589 () Bool)

(assert (=> b!1011589 (= e!569207 e!569204)))

(declare-fun res!679164 () Bool)

(assert (=> b!1011589 (=> (not res!679164) (not e!569204))))

(declare-fun lt!447026 () SeekEntryResult!9523)

(assert (=> b!1011589 (= res!679164 (or (= lt!447026 (MissingVacant!9523 i!1194)) (= lt!447026 (MissingZero!9523 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63687 (_ BitVec 32)) SeekEntryResult!9523)

(assert (=> b!1011589 (= lt!447026 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1011590 () Bool)

(assert (=> b!1011590 (= e!569206 e!569203)))

(declare-fun res!679161 () Bool)

(assert (=> b!1011590 (=> (not res!679161) (not e!569203))))

(assert (=> b!1011590 (= res!679161 (= lt!447025 lt!447024))))

(assert (=> b!1011590 (= lt!447025 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30655 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1011591 () Bool)

(declare-fun res!679159 () Bool)

(assert (=> b!1011591 (=> (not res!679159) (not e!569207))))

(declare-fun arrayContainsKey!0 (array!63687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1011591 (= res!679159 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1011592 () Bool)

(declare-fun res!679165 () Bool)

(assert (=> b!1011592 (=> (not res!679165) (not e!569207))))

(assert (=> b!1011592 (= res!679165 (validKeyInArray!0 (select (arr!30655 a!3219) j!170)))))

(declare-fun res!679156 () Bool)

(assert (=> start!87358 (=> (not res!679156) (not e!569207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87358 (= res!679156 (validMask!0 mask!3464))))

(assert (=> start!87358 e!569207))

(declare-fun array_inv!23791 (array!63687) Bool)

(assert (=> start!87358 (array_inv!23791 a!3219)))

(assert (=> start!87358 true))

(assert (= (and start!87358 res!679156) b!1011580))

(assert (= (and b!1011580 res!679157) b!1011592))

(assert (= (and b!1011592 res!679165) b!1011587))

(assert (= (and b!1011587 res!679158) b!1011591))

(assert (= (and b!1011591 res!679159) b!1011589))

(assert (= (and b!1011589 res!679164) b!1011579))

(assert (= (and b!1011579 res!679168) b!1011588))

(assert (= (and b!1011588 res!679163) b!1011583))

(assert (= (and b!1011583 res!679162) b!1011585))

(assert (= (and b!1011585 res!679160) b!1011590))

(assert (= (and b!1011590 res!679161) b!1011582))

(assert (= (and b!1011582 res!679169) b!1011581))

(assert (= (and b!1011581 res!679167) b!1011586))

(assert (= (and b!1011586 res!679166) b!1011584))

(declare-fun m!936233 () Bool)

(assert (=> b!1011592 m!936233))

(assert (=> b!1011592 m!936233))

(declare-fun m!936235 () Bool)

(assert (=> b!1011592 m!936235))

(declare-fun m!936237 () Bool)

(assert (=> b!1011579 m!936237))

(declare-fun m!936239 () Bool)

(assert (=> b!1011589 m!936239))

(declare-fun m!936241 () Bool)

(assert (=> b!1011588 m!936241))

(declare-fun m!936243 () Bool)

(assert (=> b!1011587 m!936243))

(declare-fun m!936245 () Bool)

(assert (=> start!87358 m!936245))

(declare-fun m!936247 () Bool)

(assert (=> start!87358 m!936247))

(declare-fun m!936249 () Bool)

(assert (=> b!1011591 m!936249))

(assert (=> b!1011585 m!936233))

(assert (=> b!1011585 m!936233))

(declare-fun m!936251 () Bool)

(assert (=> b!1011585 m!936251))

(assert (=> b!1011585 m!936251))

(assert (=> b!1011585 m!936233))

(declare-fun m!936253 () Bool)

(assert (=> b!1011585 m!936253))

(assert (=> b!1011590 m!936233))

(assert (=> b!1011590 m!936233))

(declare-fun m!936255 () Bool)

(assert (=> b!1011590 m!936255))

(declare-fun m!936257 () Bool)

(assert (=> b!1011584 m!936257))

(declare-fun m!936259 () Bool)

(assert (=> b!1011581 m!936259))

(declare-fun m!936261 () Bool)

(assert (=> b!1011582 m!936261))

(assert (=> b!1011582 m!936261))

(declare-fun m!936263 () Bool)

(assert (=> b!1011582 m!936263))

(declare-fun m!936265 () Bool)

(assert (=> b!1011582 m!936265))

(declare-fun m!936267 () Bool)

(assert (=> b!1011582 m!936267))

(check-sat (not b!1011581) (not b!1011584) (not b!1011579) (not start!87358) (not b!1011589) (not b!1011588) (not b!1011592) (not b!1011591) (not b!1011590) (not b!1011587) (not b!1011582) (not b!1011585))
(check-sat)
