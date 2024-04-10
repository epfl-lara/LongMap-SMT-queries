; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86036 () Bool)

(assert start!86036)

(declare-fun b!996561 () Bool)

(declare-fun e!562243 () Bool)

(declare-fun e!562241 () Bool)

(assert (=> b!996561 (= e!562243 e!562241)))

(declare-fun res!666684 () Bool)

(assert (=> b!996561 (=> (not res!666684) (not e!562241))))

(declare-datatypes ((SeekEntryResult!9284 0))(
  ( (MissingZero!9284 (index!39507 (_ BitVec 32))) (Found!9284 (index!39508 (_ BitVec 32))) (Intermediate!9284 (undefined!10096 Bool) (index!39509 (_ BitVec 32)) (x!86944 (_ BitVec 32))) (Undefined!9284) (MissingVacant!9284 (index!39510 (_ BitVec 32))) )
))
(declare-fun lt!441260 () SeekEntryResult!9284)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996561 (= res!666684 (or (= lt!441260 (MissingVacant!9284 i!1194)) (= lt!441260 (MissingZero!9284 i!1194))))))

(declare-datatypes ((array!63041 0))(
  ( (array!63042 (arr!30352 (Array (_ BitVec 32) (_ BitVec 64))) (size!30854 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63041)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63041 (_ BitVec 32)) SeekEntryResult!9284)

(assert (=> b!996561 (= lt!441260 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996562 () Bool)

(declare-fun res!666682 () Bool)

(assert (=> b!996562 (=> (not res!666682) (not e!562241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63041 (_ BitVec 32)) Bool)

(assert (=> b!996562 (= res!666682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996563 () Bool)

(declare-fun res!666676 () Bool)

(assert (=> b!996563 (=> (not res!666676) (not e!562241))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!996563 (= res!666676 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30854 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30854 a!3219))))))

(declare-fun b!996564 () Bool)

(declare-fun res!666677 () Bool)

(assert (=> b!996564 (=> (not res!666677) (not e!562243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996564 (= res!666677 (validKeyInArray!0 k!2224))))

(declare-fun b!996565 () Bool)

(declare-fun res!666675 () Bool)

(assert (=> b!996565 (=> (not res!666675) (not e!562241))))

(declare-datatypes ((List!21028 0))(
  ( (Nil!21025) (Cons!21024 (h!22189 (_ BitVec 64)) (t!30029 List!21028)) )
))
(declare-fun arrayNoDuplicates!0 (array!63041 (_ BitVec 32) List!21028) Bool)

(assert (=> b!996565 (= res!666675 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21025))))

(declare-fun b!996566 () Bool)

(declare-fun res!666679 () Bool)

(assert (=> b!996566 (=> (not res!666679) (not e!562243))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!996566 (= res!666679 (and (= (size!30854 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30854 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30854 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996567 () Bool)

(declare-fun res!666683 () Bool)

(assert (=> b!996567 (=> (not res!666683) (not e!562243))))

(declare-fun arrayContainsKey!0 (array!63041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996567 (= res!666683 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996568 () Bool)

(declare-fun res!666680 () Bool)

(assert (=> b!996568 (=> (not res!666680) (not e!562243))))

(assert (=> b!996568 (= res!666680 (validKeyInArray!0 (select (arr!30352 a!3219) j!170)))))

(declare-fun res!666678 () Bool)

(assert (=> start!86036 (=> (not res!666678) (not e!562243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86036 (= res!666678 (validMask!0 mask!3464))))

(assert (=> start!86036 e!562243))

(declare-fun array_inv!23476 (array!63041) Bool)

(assert (=> start!86036 (array_inv!23476 a!3219)))

(assert (=> start!86036 true))

(declare-fun b!996569 () Bool)

(declare-fun res!666681 () Bool)

(assert (=> b!996569 (=> (not res!666681) (not e!562241))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63041 (_ BitVec 32)) SeekEntryResult!9284)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996569 (= res!666681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30352 a!3219) j!170) mask!3464) (select (arr!30352 a!3219) j!170) a!3219 mask!3464) (Intermediate!9284 false resIndex!38 resX!38)))))

(declare-fun b!996570 () Bool)

(assert (=> b!996570 (= e!562241 (bvslt mask!3464 #b00000000000000000000000000000000))))

(assert (= (and start!86036 res!666678) b!996566))

(assert (= (and b!996566 res!666679) b!996568))

(assert (= (and b!996568 res!666680) b!996564))

(assert (= (and b!996564 res!666677) b!996567))

(assert (= (and b!996567 res!666683) b!996561))

(assert (= (and b!996561 res!666684) b!996562))

(assert (= (and b!996562 res!666682) b!996565))

(assert (= (and b!996565 res!666675) b!996563))

(assert (= (and b!996563 res!666676) b!996569))

(assert (= (and b!996569 res!666681) b!996570))

(declare-fun m!923651 () Bool)

(assert (=> b!996564 m!923651))

(declare-fun m!923653 () Bool)

(assert (=> b!996567 m!923653))

(declare-fun m!923655 () Bool)

(assert (=> b!996568 m!923655))

(assert (=> b!996568 m!923655))

(declare-fun m!923657 () Bool)

(assert (=> b!996568 m!923657))

(declare-fun m!923659 () Bool)

(assert (=> b!996562 m!923659))

(assert (=> b!996569 m!923655))

(assert (=> b!996569 m!923655))

(declare-fun m!923661 () Bool)

(assert (=> b!996569 m!923661))

(assert (=> b!996569 m!923661))

(assert (=> b!996569 m!923655))

(declare-fun m!923663 () Bool)

(assert (=> b!996569 m!923663))

(declare-fun m!923665 () Bool)

(assert (=> b!996565 m!923665))

(declare-fun m!923667 () Bool)

(assert (=> b!996561 m!923667))

(declare-fun m!923669 () Bool)

(assert (=> start!86036 m!923669))

(declare-fun m!923671 () Bool)

(assert (=> start!86036 m!923671))

(push 1)

(assert (not start!86036))

(assert (not b!996568))

(assert (not b!996569))

(assert (not b!996565))

(assert (not b!996561))

(assert (not b!996562))

(assert (not b!996564))

(assert (not b!996567))

(check-sat)

(pop 1)

(push 1)

(check-sat)

