; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87010 () Bool)

(assert start!87010)

(declare-fun res!675701 () Bool)

(declare-fun e!567184 () Bool)

(assert (=> start!87010 (=> (not res!675701) (not e!567184))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87010 (= res!675701 (validMask!0 mask!3464))))

(assert (=> start!87010 e!567184))

(declare-datatypes ((array!63528 0))(
  ( (array!63529 (arr!30580 (Array (_ BitVec 32) (_ BitVec 64))) (size!31083 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63528)

(declare-fun array_inv!23716 (array!63528) Bool)

(assert (=> start!87010 (array_inv!23716 a!3219)))

(assert (=> start!87010 true))

(declare-fun b!1007367 () Bool)

(declare-fun res!675702 () Bool)

(assert (=> b!1007367 (=> (not res!675702) (not e!567184))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007367 (= res!675702 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007368 () Bool)

(declare-fun res!675698 () Bool)

(assert (=> b!1007368 (=> (not res!675698) (not e!567184))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007368 (= res!675698 (and (= (size!31083 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31083 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31083 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007369 () Bool)

(declare-fun res!675694 () Bool)

(declare-fun e!567186 () Bool)

(assert (=> b!1007369 (=> (not res!675694) (not e!567186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63528 (_ BitVec 32)) Bool)

(assert (=> b!1007369 (= res!675694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007370 () Bool)

(declare-fun res!675703 () Bool)

(declare-fun e!567183 () Bool)

(assert (=> b!1007370 (=> (not res!675703) (not e!567183))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9448 0))(
  ( (MissingZero!9448 (index!40163 (_ BitVec 32))) (Found!9448 (index!40164 (_ BitVec 32))) (Intermediate!9448 (undefined!10260 Bool) (index!40165 (_ BitVec 32)) (x!87724 (_ BitVec 32))) (Undefined!9448) (MissingVacant!9448 (index!40166 (_ BitVec 32))) )
))
(declare-fun lt!445180 () SeekEntryResult!9448)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63528 (_ BitVec 32)) SeekEntryResult!9448)

(assert (=> b!1007370 (= res!675703 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30580 a!3219) j!170) a!3219 mask!3464) lt!445180))))

(declare-fun b!1007371 () Bool)

(declare-fun res!675699 () Bool)

(assert (=> b!1007371 (=> (not res!675699) (not e!567184))))

(declare-fun arrayContainsKey!0 (array!63528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007371 (= res!675699 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007372 () Bool)

(assert (=> b!1007372 (= e!567186 e!567183)))

(declare-fun res!675695 () Bool)

(assert (=> b!1007372 (=> (not res!675695) (not e!567183))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007372 (= res!675695 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30580 a!3219) j!170) mask!3464) (select (arr!30580 a!3219) j!170) a!3219 mask!3464) lt!445180))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007372 (= lt!445180 (Intermediate!9448 false resIndex!38 resX!38))))

(declare-fun b!1007373 () Bool)

(assert (=> b!1007373 (= e!567183 false)))

(declare-fun lt!445181 () (_ BitVec 32))

(assert (=> b!1007373 (= lt!445181 (toIndex!0 (select (store (arr!30580 a!3219) i!1194 k0!2224) j!170) mask!3464))))

(declare-fun b!1007374 () Bool)

(assert (=> b!1007374 (= e!567184 e!567186)))

(declare-fun res!675697 () Bool)

(assert (=> b!1007374 (=> (not res!675697) (not e!567186))))

(declare-fun lt!445179 () SeekEntryResult!9448)

(assert (=> b!1007374 (= res!675697 (or (= lt!445179 (MissingVacant!9448 i!1194)) (= lt!445179 (MissingZero!9448 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63528 (_ BitVec 32)) SeekEntryResult!9448)

(assert (=> b!1007374 (= lt!445179 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007375 () Bool)

(declare-fun res!675704 () Bool)

(assert (=> b!1007375 (=> (not res!675704) (not e!567184))))

(assert (=> b!1007375 (= res!675704 (validKeyInArray!0 (select (arr!30580 a!3219) j!170)))))

(declare-fun b!1007376 () Bool)

(declare-fun res!675700 () Bool)

(assert (=> b!1007376 (=> (not res!675700) (not e!567186))))

(assert (=> b!1007376 (= res!675700 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31083 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31083 a!3219))))))

(declare-fun b!1007377 () Bool)

(declare-fun res!675696 () Bool)

(assert (=> b!1007377 (=> (not res!675696) (not e!567186))))

(declare-datatypes ((List!21227 0))(
  ( (Nil!21224) (Cons!21223 (h!22415 (_ BitVec 64)) (t!30220 List!21227)) )
))
(declare-fun arrayNoDuplicates!0 (array!63528 (_ BitVec 32) List!21227) Bool)

(assert (=> b!1007377 (= res!675696 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21224))))

(assert (= (and start!87010 res!675701) b!1007368))

(assert (= (and b!1007368 res!675698) b!1007375))

(assert (= (and b!1007375 res!675704) b!1007367))

(assert (= (and b!1007367 res!675702) b!1007371))

(assert (= (and b!1007371 res!675699) b!1007374))

(assert (= (and b!1007374 res!675697) b!1007369))

(assert (= (and b!1007369 res!675694) b!1007377))

(assert (= (and b!1007377 res!675696) b!1007376))

(assert (= (and b!1007376 res!675700) b!1007372))

(assert (= (and b!1007372 res!675695) b!1007370))

(assert (= (and b!1007370 res!675703) b!1007373))

(declare-fun m!932759 () Bool)

(assert (=> b!1007367 m!932759))

(declare-fun m!932761 () Bool)

(assert (=> start!87010 m!932761))

(declare-fun m!932763 () Bool)

(assert (=> start!87010 m!932763))

(declare-fun m!932765 () Bool)

(assert (=> b!1007375 m!932765))

(assert (=> b!1007375 m!932765))

(declare-fun m!932767 () Bool)

(assert (=> b!1007375 m!932767))

(declare-fun m!932769 () Bool)

(assert (=> b!1007377 m!932769))

(declare-fun m!932771 () Bool)

(assert (=> b!1007373 m!932771))

(declare-fun m!932773 () Bool)

(assert (=> b!1007373 m!932773))

(assert (=> b!1007373 m!932773))

(declare-fun m!932775 () Bool)

(assert (=> b!1007373 m!932775))

(declare-fun m!932777 () Bool)

(assert (=> b!1007369 m!932777))

(assert (=> b!1007372 m!932765))

(assert (=> b!1007372 m!932765))

(declare-fun m!932779 () Bool)

(assert (=> b!1007372 m!932779))

(assert (=> b!1007372 m!932779))

(assert (=> b!1007372 m!932765))

(declare-fun m!932781 () Bool)

(assert (=> b!1007372 m!932781))

(declare-fun m!932783 () Bool)

(assert (=> b!1007371 m!932783))

(declare-fun m!932785 () Bool)

(assert (=> b!1007374 m!932785))

(assert (=> b!1007370 m!932765))

(assert (=> b!1007370 m!932765))

(declare-fun m!932787 () Bool)

(assert (=> b!1007370 m!932787))

(check-sat (not b!1007370) (not b!1007375) (not b!1007373) (not b!1007377) (not b!1007372) (not b!1007369) (not b!1007367) (not b!1007371) (not b!1007374) (not start!87010))
(check-sat)
