; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86810 () Bool)

(assert start!86810)

(declare-fun b!1006620 () Bool)

(declare-fun e!566568 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1006620 (= e!566568 (bvslt (bvsub #b01111111111111111111111111111110 x!1245) #b00000000000000000000000000000000))))

(declare-fun b!1006621 () Bool)

(declare-fun res!675710 () Bool)

(declare-fun e!566564 () Bool)

(assert (=> b!1006621 (=> (not res!675710) (not e!566564))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006621 (= res!675710 (validKeyInArray!0 k!2224))))

(declare-fun b!1006622 () Bool)

(declare-fun res!675713 () Bool)

(assert (=> b!1006622 (=> (not res!675713) (not e!566564))))

(declare-datatypes ((array!63509 0))(
  ( (array!63510 (arr!30577 (Array (_ BitVec 32) (_ BitVec 64))) (size!31079 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63509)

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1006622 (= res!675713 (validKeyInArray!0 (select (arr!30577 a!3219) j!170)))))

(declare-fun b!1006623 () Bool)

(declare-fun res!675719 () Bool)

(declare-fun e!566569 () Bool)

(assert (=> b!1006623 (=> (not res!675719) (not e!566569))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63509 (_ BitVec 32)) Bool)

(assert (=> b!1006623 (= res!675719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!675717 () Bool)

(assert (=> start!86810 (=> (not res!675717) (not e!566564))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86810 (= res!675717 (validMask!0 mask!3464))))

(assert (=> start!86810 e!566564))

(declare-fun array_inv!23701 (array!63509) Bool)

(assert (=> start!86810 (array_inv!23701 a!3219)))

(assert (=> start!86810 true))

(declare-fun b!1006624 () Bool)

(declare-fun res!675718 () Bool)

(assert (=> b!1006624 (=> (not res!675718) (not e!566564))))

(declare-fun arrayContainsKey!0 (array!63509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006624 (= res!675718 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006625 () Bool)

(assert (=> b!1006625 (= e!566564 e!566569)))

(declare-fun res!675712 () Bool)

(assert (=> b!1006625 (=> (not res!675712) (not e!566569))))

(declare-datatypes ((SeekEntryResult!9509 0))(
  ( (MissingZero!9509 (index!40407 (_ BitVec 32))) (Found!9509 (index!40408 (_ BitVec 32))) (Intermediate!9509 (undefined!10321 Bool) (index!40409 (_ BitVec 32)) (x!87805 (_ BitVec 32))) (Undefined!9509) (MissingVacant!9509 (index!40410 (_ BitVec 32))) )
))
(declare-fun lt!444843 () SeekEntryResult!9509)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006625 (= res!675712 (or (= lt!444843 (MissingVacant!9509 i!1194)) (= lt!444843 (MissingZero!9509 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63509 (_ BitVec 32)) SeekEntryResult!9509)

(assert (=> b!1006625 (= lt!444843 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006626 () Bool)

(declare-fun e!566567 () Bool)

(assert (=> b!1006626 (= e!566567 e!566568)))

(declare-fun res!675716 () Bool)

(assert (=> b!1006626 (=> (not res!675716) (not e!566568))))

(declare-fun lt!444844 () (_ BitVec 64))

(declare-fun lt!444841 () SeekEntryResult!9509)

(declare-fun lt!444842 () array!63509)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63509 (_ BitVec 32)) SeekEntryResult!9509)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006626 (= res!675716 (not (= lt!444841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444844 mask!3464) lt!444844 lt!444842 mask!3464))))))

(assert (=> b!1006626 (= lt!444844 (select (store (arr!30577 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1006626 (= lt!444842 (array!63510 (store (arr!30577 a!3219) i!1194 k!2224) (size!31079 a!3219)))))

(declare-fun b!1006627 () Bool)

(declare-fun e!566565 () Bool)

(assert (=> b!1006627 (= e!566565 e!566567)))

(declare-fun res!675711 () Bool)

(assert (=> b!1006627 (=> (not res!675711) (not e!566567))))

(declare-fun lt!444845 () SeekEntryResult!9509)

(declare-fun lt!444840 () SeekEntryResult!9509)

(assert (=> b!1006627 (= res!675711 (= lt!444845 lt!444840))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1006627 (= lt!444845 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30577 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006628 () Bool)

(declare-fun res!675714 () Bool)

(assert (=> b!1006628 (=> (not res!675714) (not e!566569))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006628 (= res!675714 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31079 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31079 a!3219))))))

(declare-fun b!1006629 () Bool)

(assert (=> b!1006629 (= e!566569 e!566565)))

(declare-fun res!675715 () Bool)

(assert (=> b!1006629 (=> (not res!675715) (not e!566565))))

(assert (=> b!1006629 (= res!675715 (= lt!444841 lt!444840))))

(assert (=> b!1006629 (= lt!444840 (Intermediate!9509 false resIndex!38 resX!38))))

(assert (=> b!1006629 (= lt!444841 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30577 a!3219) j!170) mask!3464) (select (arr!30577 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006630 () Bool)

(declare-fun res!675709 () Bool)

(assert (=> b!1006630 (=> (not res!675709) (not e!566568))))

(assert (=> b!1006630 (= res!675709 (not (= lt!444845 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444844 lt!444842 mask!3464))))))

(declare-fun b!1006631 () Bool)

(declare-fun res!675708 () Bool)

(assert (=> b!1006631 (=> (not res!675708) (not e!566564))))

(assert (=> b!1006631 (= res!675708 (and (= (size!31079 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31079 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31079 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006632 () Bool)

(declare-fun res!675720 () Bool)

(assert (=> b!1006632 (=> (not res!675720) (not e!566569))))

(declare-datatypes ((List!21253 0))(
  ( (Nil!21250) (Cons!21249 (h!22432 (_ BitVec 64)) (t!30254 List!21253)) )
))
(declare-fun arrayNoDuplicates!0 (array!63509 (_ BitVec 32) List!21253) Bool)

(assert (=> b!1006632 (= res!675720 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21250))))

(assert (= (and start!86810 res!675717) b!1006631))

(assert (= (and b!1006631 res!675708) b!1006622))

(assert (= (and b!1006622 res!675713) b!1006621))

(assert (= (and b!1006621 res!675710) b!1006624))

(assert (= (and b!1006624 res!675718) b!1006625))

(assert (= (and b!1006625 res!675712) b!1006623))

(assert (= (and b!1006623 res!675719) b!1006632))

(assert (= (and b!1006632 res!675720) b!1006628))

(assert (= (and b!1006628 res!675714) b!1006629))

(assert (= (and b!1006629 res!675715) b!1006627))

(assert (= (and b!1006627 res!675711) b!1006626))

(assert (= (and b!1006626 res!675716) b!1006630))

(assert (= (and b!1006630 res!675709) b!1006620))

(declare-fun m!931709 () Bool)

(assert (=> b!1006622 m!931709))

(assert (=> b!1006622 m!931709))

(declare-fun m!931711 () Bool)

(assert (=> b!1006622 m!931711))

(declare-fun m!931713 () Bool)

(assert (=> b!1006624 m!931713))

(declare-fun m!931715 () Bool)

(assert (=> b!1006630 m!931715))

(declare-fun m!931717 () Bool)

(assert (=> b!1006625 m!931717))

(declare-fun m!931719 () Bool)

(assert (=> b!1006621 m!931719))

(declare-fun m!931721 () Bool)

(assert (=> b!1006626 m!931721))

(assert (=> b!1006626 m!931721))

(declare-fun m!931723 () Bool)

(assert (=> b!1006626 m!931723))

(declare-fun m!931725 () Bool)

(assert (=> b!1006626 m!931725))

(declare-fun m!931727 () Bool)

(assert (=> b!1006626 m!931727))

(declare-fun m!931729 () Bool)

(assert (=> start!86810 m!931729))

(declare-fun m!931731 () Bool)

(assert (=> start!86810 m!931731))

(declare-fun m!931733 () Bool)

(assert (=> b!1006632 m!931733))

(assert (=> b!1006627 m!931709))

(assert (=> b!1006627 m!931709))

(declare-fun m!931735 () Bool)

(assert (=> b!1006627 m!931735))

(assert (=> b!1006629 m!931709))

(assert (=> b!1006629 m!931709))

(declare-fun m!931737 () Bool)

(assert (=> b!1006629 m!931737))

(assert (=> b!1006629 m!931737))

(assert (=> b!1006629 m!931709))

(declare-fun m!931739 () Bool)

(assert (=> b!1006629 m!931739))

(declare-fun m!931741 () Bool)

(assert (=> b!1006623 m!931741))

(push 1)

