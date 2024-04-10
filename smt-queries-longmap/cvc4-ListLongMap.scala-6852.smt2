; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86370 () Bool)

(assert start!86370)

(declare-fun b!999455 () Bool)

(declare-fun res!668939 () Bool)

(declare-fun e!563544 () Bool)

(assert (=> b!999455 (=> (not res!668939) (not e!563544))))

(declare-datatypes ((array!63171 0))(
  ( (array!63172 (arr!30411 (Array (_ BitVec 32) (_ BitVec 64))) (size!30913 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63171)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!999455 (= res!668939 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!999456 () Bool)

(declare-fun e!563542 () Bool)

(assert (=> b!999456 (= e!563544 e!563542)))

(declare-fun res!668943 () Bool)

(assert (=> b!999456 (=> (not res!668943) (not e!563542))))

(declare-datatypes ((SeekEntryResult!9343 0))(
  ( (MissingZero!9343 (index!39743 (_ BitVec 32))) (Found!9343 (index!39744 (_ BitVec 32))) (Intermediate!9343 (undefined!10155 Bool) (index!39745 (_ BitVec 32)) (x!87179 (_ BitVec 32))) (Undefined!9343) (MissingVacant!9343 (index!39746 (_ BitVec 32))) )
))
(declare-fun lt!442032 () SeekEntryResult!9343)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!999456 (= res!668943 (or (= lt!442032 (MissingVacant!9343 i!1194)) (= lt!442032 (MissingZero!9343 i!1194))))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63171 (_ BitVec 32)) SeekEntryResult!9343)

(assert (=> b!999456 (= lt!442032 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!999457 () Bool)

(declare-fun res!668934 () Bool)

(assert (=> b!999457 (=> (not res!668934) (not e!563542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63171 (_ BitVec 32)) Bool)

(assert (=> b!999457 (= res!668934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!999458 () Bool)

(declare-fun e!563545 () Bool)

(assert (=> b!999458 (= e!563545 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!442034 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!999458 (= lt!442034 (toIndex!0 (select (store (arr!30411 a!3219) i!1194 k!2224) j!170) mask!3464))))

(declare-fun b!999459 () Bool)

(declare-fun res!668940 () Bool)

(assert (=> b!999459 (=> (not res!668940) (not e!563542))))

(declare-datatypes ((List!21087 0))(
  ( (Nil!21084) (Cons!21083 (h!22260 (_ BitVec 64)) (t!30088 List!21087)) )
))
(declare-fun arrayNoDuplicates!0 (array!63171 (_ BitVec 32) List!21087) Bool)

(assert (=> b!999459 (= res!668940 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21084))))

(declare-fun b!999460 () Bool)

(declare-fun res!668938 () Bool)

(assert (=> b!999460 (=> (not res!668938) (not e!563542))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!999460 (= res!668938 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30913 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30913 a!3219))))))

(declare-fun res!668942 () Bool)

(assert (=> start!86370 (=> (not res!668942) (not e!563544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86370 (= res!668942 (validMask!0 mask!3464))))

(assert (=> start!86370 e!563544))

(declare-fun array_inv!23535 (array!63171) Bool)

(assert (=> start!86370 (array_inv!23535 a!3219)))

(assert (=> start!86370 true))

(declare-fun b!999461 () Bool)

(assert (=> b!999461 (= e!563542 e!563545)))

(declare-fun res!668933 () Bool)

(assert (=> b!999461 (=> (not res!668933) (not e!563545))))

(declare-fun lt!442033 () SeekEntryResult!9343)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63171 (_ BitVec 32)) SeekEntryResult!9343)

(assert (=> b!999461 (= res!668933 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30411 a!3219) j!170) mask!3464) (select (arr!30411 a!3219) j!170) a!3219 mask!3464) lt!442033))))

(assert (=> b!999461 (= lt!442033 (Intermediate!9343 false resIndex!38 resX!38))))

(declare-fun b!999462 () Bool)

(declare-fun res!668941 () Bool)

(assert (=> b!999462 (=> (not res!668941) (not e!563545))))

(assert (=> b!999462 (= res!668941 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30411 a!3219) j!170) a!3219 mask!3464) lt!442033))))

(declare-fun b!999463 () Bool)

(declare-fun res!668936 () Bool)

(assert (=> b!999463 (=> (not res!668936) (not e!563544))))

(assert (=> b!999463 (= res!668936 (and (= (size!30913 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30913 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30913 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!999464 () Bool)

(declare-fun res!668935 () Bool)

(assert (=> b!999464 (=> (not res!668935) (not e!563544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!999464 (= res!668935 (validKeyInArray!0 k!2224))))

(declare-fun b!999465 () Bool)

(declare-fun res!668937 () Bool)

(assert (=> b!999465 (=> (not res!668937) (not e!563544))))

(assert (=> b!999465 (= res!668937 (validKeyInArray!0 (select (arr!30411 a!3219) j!170)))))

(assert (= (and start!86370 res!668942) b!999463))

(assert (= (and b!999463 res!668936) b!999465))

(assert (= (and b!999465 res!668937) b!999464))

(assert (= (and b!999464 res!668935) b!999455))

(assert (= (and b!999455 res!668939) b!999456))

(assert (= (and b!999456 res!668943) b!999457))

(assert (= (and b!999457 res!668934) b!999459))

(assert (= (and b!999459 res!668940) b!999460))

(assert (= (and b!999460 res!668938) b!999461))

(assert (= (and b!999461 res!668933) b!999462))

(assert (= (and b!999462 res!668941) b!999458))

(declare-fun m!925697 () Bool)

(assert (=> b!999457 m!925697))

(declare-fun m!925699 () Bool)

(assert (=> b!999459 m!925699))

(declare-fun m!925701 () Bool)

(assert (=> b!999464 m!925701))

(declare-fun m!925703 () Bool)

(assert (=> b!999461 m!925703))

(assert (=> b!999461 m!925703))

(declare-fun m!925705 () Bool)

(assert (=> b!999461 m!925705))

(assert (=> b!999461 m!925705))

(assert (=> b!999461 m!925703))

(declare-fun m!925707 () Bool)

(assert (=> b!999461 m!925707))

(declare-fun m!925709 () Bool)

(assert (=> b!999458 m!925709))

(declare-fun m!925711 () Bool)

(assert (=> b!999458 m!925711))

(assert (=> b!999458 m!925711))

(declare-fun m!925713 () Bool)

(assert (=> b!999458 m!925713))

(assert (=> b!999462 m!925703))

(assert (=> b!999462 m!925703))

(declare-fun m!925715 () Bool)

(assert (=> b!999462 m!925715))

(declare-fun m!925717 () Bool)

(assert (=> b!999455 m!925717))

(declare-fun m!925719 () Bool)

(assert (=> b!999456 m!925719))

(declare-fun m!925721 () Bool)

(assert (=> start!86370 m!925721))

(declare-fun m!925723 () Bool)

(assert (=> start!86370 m!925723))

(assert (=> b!999465 m!925703))

(assert (=> b!999465 m!925703))

(declare-fun m!925725 () Bool)

(assert (=> b!999465 m!925725))

(push 1)

(assert (not start!86370))

(assert (not b!999455))

(assert (not b!999465))

(assert (not b!999462))

(assert (not b!999457))

