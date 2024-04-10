; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87046 () Bool)

(assert start!87046)

(declare-fun b!1009636 () Bool)

(declare-fun e!568022 () Bool)

(declare-fun e!568026 () Bool)

(assert (=> b!1009636 (= e!568022 e!568026)))

(declare-fun res!678231 () Bool)

(assert (=> b!1009636 (=> (not res!678231) (not e!568026))))

(declare-datatypes ((SeekEntryResult!9562 0))(
  ( (MissingZero!9562 (index!40619 (_ BitVec 32))) (Found!9562 (index!40620 (_ BitVec 32))) (Intermediate!9562 (undefined!10374 Bool) (index!40621 (_ BitVec 32)) (x!88013 (_ BitVec 32))) (Undefined!9562) (MissingVacant!9562 (index!40622 (_ BitVec 32))) )
))
(declare-fun lt!446244 () SeekEntryResult!9562)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1009636 (= res!678231 (or (= lt!446244 (MissingVacant!9562 i!1194)) (= lt!446244 (MissingZero!9562 i!1194))))))

(declare-datatypes ((array!63621 0))(
  ( (array!63622 (arr!30630 (Array (_ BitVec 32) (_ BitVec 64))) (size!31132 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63621)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63621 (_ BitVec 32)) SeekEntryResult!9562)

(assert (=> b!1009636 (= lt!446244 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1009637 () Bool)

(declare-fun res!678224 () Bool)

(declare-fun e!568023 () Bool)

(assert (=> b!1009637 (=> (not res!678224) (not e!568023))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1009637 (= res!678224 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1009638 () Bool)

(declare-fun res!678236 () Bool)

(assert (=> b!1009638 (=> (not res!678236) (not e!568022))))

(declare-fun arrayContainsKey!0 (array!63621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009638 (= res!678236 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009639 () Bool)

(declare-fun res!678225 () Bool)

(assert (=> b!1009639 (=> (not res!678225) (not e!568022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009639 (= res!678225 (validKeyInArray!0 k!2224))))

(declare-fun b!1009640 () Bool)

(declare-fun e!568024 () Bool)

(declare-fun e!568027 () Bool)

(assert (=> b!1009640 (= e!568024 e!568027)))

(declare-fun res!678234 () Bool)

(assert (=> b!1009640 (=> (not res!678234) (not e!568027))))

(declare-fun lt!446239 () SeekEntryResult!9562)

(declare-fun lt!446243 () SeekEntryResult!9562)

(assert (=> b!1009640 (= res!678234 (= lt!446239 lt!446243))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63621 (_ BitVec 32)) SeekEntryResult!9562)

(assert (=> b!1009640 (= lt!446239 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30630 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009641 () Bool)

(assert (=> b!1009641 (= e!568023 false)))

(declare-fun lt!446241 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009641 (= lt!446241 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1009643 () Bool)

(declare-fun res!678237 () Bool)

(assert (=> b!1009643 (=> (not res!678237) (not e!568026))))

(declare-datatypes ((List!21306 0))(
  ( (Nil!21303) (Cons!21302 (h!22491 (_ BitVec 64)) (t!30307 List!21306)) )
))
(declare-fun arrayNoDuplicates!0 (array!63621 (_ BitVec 32) List!21306) Bool)

(assert (=> b!1009643 (= res!678237 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21303))))

(declare-fun b!1009644 () Bool)

(declare-fun res!678228 () Bool)

(assert (=> b!1009644 (=> (not res!678228) (not e!568026))))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009644 (= res!678228 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31132 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31132 a!3219))))))

(declare-fun b!1009645 () Bool)

(declare-fun res!678230 () Bool)

(assert (=> b!1009645 (=> (not res!678230) (not e!568022))))

(assert (=> b!1009645 (= res!678230 (and (= (size!31132 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31132 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31132 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009646 () Bool)

(declare-fun res!678235 () Bool)

(assert (=> b!1009646 (=> (not res!678235) (not e!568026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63621 (_ BitVec 32)) Bool)

(assert (=> b!1009646 (= res!678235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009647 () Bool)

(assert (=> b!1009647 (= e!568026 e!568024)))

(declare-fun res!678232 () Bool)

(assert (=> b!1009647 (=> (not res!678232) (not e!568024))))

(declare-fun lt!446240 () SeekEntryResult!9562)

(assert (=> b!1009647 (= res!678232 (= lt!446240 lt!446243))))

(assert (=> b!1009647 (= lt!446243 (Intermediate!9562 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009647 (= lt!446240 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30630 a!3219) j!170) mask!3464) (select (arr!30630 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009642 () Bool)

(assert (=> b!1009642 (= e!568027 e!568023)))

(declare-fun res!678233 () Bool)

(assert (=> b!1009642 (=> (not res!678233) (not e!568023))))

(declare-fun lt!446238 () array!63621)

(declare-fun lt!446242 () (_ BitVec 64))

(assert (=> b!1009642 (= res!678233 (not (= lt!446240 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!446242 mask!3464) lt!446242 lt!446238 mask!3464))))))

(assert (=> b!1009642 (= lt!446242 (select (store (arr!30630 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1009642 (= lt!446238 (array!63622 (store (arr!30630 a!3219) i!1194 k!2224) (size!31132 a!3219)))))

(declare-fun res!678229 () Bool)

(assert (=> start!87046 (=> (not res!678229) (not e!568022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87046 (= res!678229 (validMask!0 mask!3464))))

(assert (=> start!87046 e!568022))

(declare-fun array_inv!23754 (array!63621) Bool)

(assert (=> start!87046 (array_inv!23754 a!3219)))

(assert (=> start!87046 true))

(declare-fun b!1009648 () Bool)

(declare-fun res!678227 () Bool)

(assert (=> b!1009648 (=> (not res!678227) (not e!568023))))

(assert (=> b!1009648 (= res!678227 (not (= lt!446239 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!446242 lt!446238 mask!3464))))))

(declare-fun b!1009649 () Bool)

(declare-fun res!678226 () Bool)

(assert (=> b!1009649 (=> (not res!678226) (not e!568022))))

(assert (=> b!1009649 (= res!678226 (validKeyInArray!0 (select (arr!30630 a!3219) j!170)))))

(assert (= (and start!87046 res!678229) b!1009645))

(assert (= (and b!1009645 res!678230) b!1009649))

(assert (= (and b!1009649 res!678226) b!1009639))

(assert (= (and b!1009639 res!678225) b!1009638))

(assert (= (and b!1009638 res!678236) b!1009636))

(assert (= (and b!1009636 res!678231) b!1009646))

(assert (= (and b!1009646 res!678235) b!1009643))

(assert (= (and b!1009643 res!678237) b!1009644))

(assert (= (and b!1009644 res!678228) b!1009647))

(assert (= (and b!1009647 res!678232) b!1009640))

(assert (= (and b!1009640 res!678234) b!1009642))

(assert (= (and b!1009642 res!678233) b!1009648))

(assert (= (and b!1009648 res!678227) b!1009637))

(assert (= (and b!1009637 res!678224) b!1009641))

(declare-fun m!934161 () Bool)

(assert (=> b!1009643 m!934161))

(declare-fun m!934163 () Bool)

(assert (=> b!1009641 m!934163))

(declare-fun m!934165 () Bool)

(assert (=> b!1009639 m!934165))

(declare-fun m!934167 () Bool)

(assert (=> b!1009649 m!934167))

(assert (=> b!1009649 m!934167))

(declare-fun m!934169 () Bool)

(assert (=> b!1009649 m!934169))

(declare-fun m!934171 () Bool)

(assert (=> start!87046 m!934171))

(declare-fun m!934173 () Bool)

(assert (=> start!87046 m!934173))

(assert (=> b!1009647 m!934167))

(assert (=> b!1009647 m!934167))

(declare-fun m!934175 () Bool)

(assert (=> b!1009647 m!934175))

(assert (=> b!1009647 m!934175))

(assert (=> b!1009647 m!934167))

(declare-fun m!934177 () Bool)

(assert (=> b!1009647 m!934177))

(declare-fun m!934179 () Bool)

(assert (=> b!1009638 m!934179))

(declare-fun m!934181 () Bool)

(assert (=> b!1009636 m!934181))

(declare-fun m!934183 () Bool)

(assert (=> b!1009646 m!934183))

(declare-fun m!934185 () Bool)

(assert (=> b!1009642 m!934185))

(assert (=> b!1009642 m!934185))

(declare-fun m!934187 () Bool)

(assert (=> b!1009642 m!934187))

(declare-fun m!934189 () Bool)

(assert (=> b!1009642 m!934189))

(declare-fun m!934191 () Bool)

(assert (=> b!1009642 m!934191))

(declare-fun m!934193 () Bool)

(assert (=> b!1009648 m!934193))

(assert (=> b!1009640 m!934167))

(assert (=> b!1009640 m!934167))

(declare-fun m!934195 () Bool)

(assert (=> b!1009640 m!934195))

(push 1)

