; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86042 () Bool)

(assert start!86042)

(declare-fun b!996649 () Bool)

(declare-fun res!666770 () Bool)

(declare-fun e!562270 () Bool)

(assert (=> b!996649 (=> (not res!666770) (not e!562270))))

(declare-datatypes ((array!63047 0))(
  ( (array!63048 (arr!30355 (Array (_ BitVec 32) (_ BitVec 64))) (size!30857 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63047)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63047 (_ BitVec 32)) Bool)

(assert (=> b!996649 (= res!666770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996650 () Bool)

(declare-fun res!666763 () Bool)

(declare-fun e!562268 () Bool)

(assert (=> b!996650 (=> (not res!666763) (not e!562268))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996650 (= res!666763 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996651 () Bool)

(declare-fun res!666764 () Bool)

(assert (=> b!996651 (=> (not res!666764) (not e!562268))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!996651 (= res!666764 (and (= (size!30857 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30857 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30857 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996652 () Bool)

(declare-fun res!666767 () Bool)

(assert (=> b!996652 (=> (not res!666767) (not e!562268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996652 (= res!666767 (validKeyInArray!0 (select (arr!30355 a!3219) j!170)))))

(declare-fun b!996653 () Bool)

(declare-fun res!666766 () Bool)

(assert (=> b!996653 (=> (not res!666766) (not e!562270))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!996653 (= res!666766 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30857 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30857 a!3219))))))

(declare-fun b!996654 () Bool)

(assert (=> b!996654 (= e!562270 false)))

(declare-datatypes ((SeekEntryResult!9287 0))(
  ( (MissingZero!9287 (index!39519 (_ BitVec 32))) (Found!9287 (index!39520 (_ BitVec 32))) (Intermediate!9287 (undefined!10099 Bool) (index!39521 (_ BitVec 32)) (x!86955 (_ BitVec 32))) (Undefined!9287) (MissingVacant!9287 (index!39522 (_ BitVec 32))) )
))
(declare-fun lt!441271 () SeekEntryResult!9287)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63047 (_ BitVec 32)) SeekEntryResult!9287)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996654 (= lt!441271 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30355 a!3219) j!170) mask!3464) (select (arr!30355 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!666769 () Bool)

(assert (=> start!86042 (=> (not res!666769) (not e!562268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86042 (= res!666769 (validMask!0 mask!3464))))

(assert (=> start!86042 e!562268))

(declare-fun array_inv!23479 (array!63047) Bool)

(assert (=> start!86042 (array_inv!23479 a!3219)))

(assert (=> start!86042 true))

(declare-fun b!996655 () Bool)

(assert (=> b!996655 (= e!562268 e!562270)))

(declare-fun res!666768 () Bool)

(assert (=> b!996655 (=> (not res!666768) (not e!562270))))

(declare-fun lt!441272 () SeekEntryResult!9287)

(assert (=> b!996655 (= res!666768 (or (= lt!441272 (MissingVacant!9287 i!1194)) (= lt!441272 (MissingZero!9287 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63047 (_ BitVec 32)) SeekEntryResult!9287)

(assert (=> b!996655 (= lt!441272 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996656 () Bool)

(declare-fun res!666765 () Bool)

(assert (=> b!996656 (=> (not res!666765) (not e!562270))))

(declare-datatypes ((List!21031 0))(
  ( (Nil!21028) (Cons!21027 (h!22192 (_ BitVec 64)) (t!30032 List!21031)) )
))
(declare-fun arrayNoDuplicates!0 (array!63047 (_ BitVec 32) List!21031) Bool)

(assert (=> b!996656 (= res!666765 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21028))))

(declare-fun b!996657 () Bool)

(declare-fun res!666771 () Bool)

(assert (=> b!996657 (=> (not res!666771) (not e!562268))))

(assert (=> b!996657 (= res!666771 (validKeyInArray!0 k!2224))))

(assert (= (and start!86042 res!666769) b!996651))

(assert (= (and b!996651 res!666764) b!996652))

(assert (= (and b!996652 res!666767) b!996657))

(assert (= (and b!996657 res!666771) b!996650))

(assert (= (and b!996650 res!666763) b!996655))

(assert (= (and b!996655 res!666768) b!996649))

(assert (= (and b!996649 res!666770) b!996656))

(assert (= (and b!996656 res!666765) b!996653))

(assert (= (and b!996653 res!666766) b!996654))

(declare-fun m!923717 () Bool)

(assert (=> b!996656 m!923717))

(declare-fun m!923719 () Bool)

(assert (=> start!86042 m!923719))

(declare-fun m!923721 () Bool)

(assert (=> start!86042 m!923721))

(declare-fun m!923723 () Bool)

(assert (=> b!996652 m!923723))

(assert (=> b!996652 m!923723))

(declare-fun m!923725 () Bool)

(assert (=> b!996652 m!923725))

(declare-fun m!923727 () Bool)

(assert (=> b!996649 m!923727))

(declare-fun m!923729 () Bool)

(assert (=> b!996657 m!923729))

(declare-fun m!923731 () Bool)

(assert (=> b!996655 m!923731))

(declare-fun m!923733 () Bool)

(assert (=> b!996650 m!923733))

(assert (=> b!996654 m!923723))

(assert (=> b!996654 m!923723))

(declare-fun m!923735 () Bool)

(assert (=> b!996654 m!923735))

(assert (=> b!996654 m!923735))

(assert (=> b!996654 m!923723))

(declare-fun m!923737 () Bool)

(assert (=> b!996654 m!923737))

(push 1)

