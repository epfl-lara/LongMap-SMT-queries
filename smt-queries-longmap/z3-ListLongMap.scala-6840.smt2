; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86308 () Bool)

(assert start!86308)

(declare-fun b!998383 () Bool)

(declare-fun res!667773 () Bool)

(declare-fun e!563223 () Bool)

(assert (=> b!998383 (=> (not res!667773) (not e!563223))))

(declare-datatypes ((array!63132 0))(
  ( (array!63133 (arr!30391 (Array (_ BitVec 32) (_ BitVec 64))) (size!30894 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63132)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!998383 (= res!667773 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30894 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30894 a!3219))))))

(declare-fun b!998384 () Bool)

(declare-fun res!667774 () Bool)

(declare-fun e!563221 () Bool)

(assert (=> b!998384 (=> (not res!667774) (not e!563221))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!998384 (= res!667774 (validKeyInArray!0 k0!2224))))

(declare-fun b!998385 () Bool)

(assert (=> b!998385 (= e!563221 e!563223)))

(declare-fun res!667772 () Bool)

(assert (=> b!998385 (=> (not res!667772) (not e!563223))))

(declare-datatypes ((SeekEntryResult!9259 0))(
  ( (MissingZero!9259 (index!39407 (_ BitVec 32))) (Found!9259 (index!39408 (_ BitVec 32))) (Intermediate!9259 (undefined!10071 Bool) (index!39409 (_ BitVec 32)) (x!86995 (_ BitVec 32))) (Undefined!9259) (MissingVacant!9259 (index!39410 (_ BitVec 32))) )
))
(declare-fun lt!441823 () SeekEntryResult!9259)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!998385 (= res!667772 (or (= lt!441823 (MissingVacant!9259 i!1194)) (= lt!441823 (MissingZero!9259 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63132 (_ BitVec 32)) SeekEntryResult!9259)

(assert (=> b!998385 (= lt!441823 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!667778 () Bool)

(assert (=> start!86308 (=> (not res!667778) (not e!563221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86308 (= res!667778 (validMask!0 mask!3464))))

(assert (=> start!86308 e!563221))

(declare-fun array_inv!23527 (array!63132) Bool)

(assert (=> start!86308 (array_inv!23527 a!3219)))

(assert (=> start!86308 true))

(declare-fun b!998386 () Bool)

(declare-fun res!667775 () Bool)

(assert (=> b!998386 (=> (not res!667775) (not e!563223))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63132 (_ BitVec 32)) SeekEntryResult!9259)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!998386 (= res!667775 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30391 a!3219) j!170) mask!3464) (select (arr!30391 a!3219) j!170) a!3219 mask!3464) (Intermediate!9259 false resIndex!38 resX!38)))))

(declare-fun b!998387 () Bool)

(declare-fun res!667780 () Bool)

(assert (=> b!998387 (=> (not res!667780) (not e!563223))))

(declare-datatypes ((List!21038 0))(
  ( (Nil!21035) (Cons!21034 (h!22208 (_ BitVec 64)) (t!30031 List!21038)) )
))
(declare-fun arrayNoDuplicates!0 (array!63132 (_ BitVec 32) List!21038) Bool)

(assert (=> b!998387 (= res!667780 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21035))))

(declare-fun b!998388 () Bool)

(declare-fun res!667779 () Bool)

(assert (=> b!998388 (=> (not res!667779) (not e!563221))))

(declare-fun arrayContainsKey!0 (array!63132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!998388 (= res!667779 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!998389 () Bool)

(declare-fun res!667781 () Bool)

(assert (=> b!998389 (=> (not res!667781) (not e!563221))))

(assert (=> b!998389 (= res!667781 (validKeyInArray!0 (select (arr!30391 a!3219) j!170)))))

(declare-fun b!998390 () Bool)

(assert (=> b!998390 (= e!563223 false)))

(declare-fun lt!441824 () SeekEntryResult!9259)

(assert (=> b!998390 (= lt!441824 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30391 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!998391 () Bool)

(declare-fun res!667776 () Bool)

(assert (=> b!998391 (=> (not res!667776) (not e!563221))))

(assert (=> b!998391 (= res!667776 (and (= (size!30894 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30894 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30894 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!998392 () Bool)

(declare-fun res!667777 () Bool)

(assert (=> b!998392 (=> (not res!667777) (not e!563223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63132 (_ BitVec 32)) Bool)

(assert (=> b!998392 (= res!667777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86308 res!667778) b!998391))

(assert (= (and b!998391 res!667776) b!998389))

(assert (= (and b!998389 res!667781) b!998384))

(assert (= (and b!998384 res!667774) b!998388))

(assert (= (and b!998388 res!667779) b!998385))

(assert (= (and b!998385 res!667772) b!998392))

(assert (= (and b!998392 res!667777) b!998387))

(assert (= (and b!998387 res!667780) b!998383))

(assert (= (and b!998383 res!667773) b!998386))

(assert (= (and b!998386 res!667775) b!998390))

(declare-fun m!925607 () Bool)

(assert (=> b!998387 m!925607))

(declare-fun m!925609 () Bool)

(assert (=> b!998388 m!925609))

(declare-fun m!925611 () Bool)

(assert (=> b!998385 m!925611))

(declare-fun m!925613 () Bool)

(assert (=> b!998389 m!925613))

(assert (=> b!998389 m!925613))

(declare-fun m!925615 () Bool)

(assert (=> b!998389 m!925615))

(declare-fun m!925617 () Bool)

(assert (=> b!998384 m!925617))

(declare-fun m!925619 () Bool)

(assert (=> start!86308 m!925619))

(declare-fun m!925621 () Bool)

(assert (=> start!86308 m!925621))

(declare-fun m!925623 () Bool)

(assert (=> b!998392 m!925623))

(assert (=> b!998386 m!925613))

(assert (=> b!998386 m!925613))

(declare-fun m!925625 () Bool)

(assert (=> b!998386 m!925625))

(assert (=> b!998386 m!925625))

(assert (=> b!998386 m!925613))

(declare-fun m!925627 () Bool)

(assert (=> b!998386 m!925627))

(assert (=> b!998390 m!925613))

(assert (=> b!998390 m!925613))

(declare-fun m!925629 () Bool)

(assert (=> b!998390 m!925629))

(check-sat (not b!998390) (not start!86308) (not b!998385) (not b!998392) (not b!998384) (not b!998387) (not b!998389) (not b!998386) (not b!998388))
(check-sat)
