; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64392 () Bool)

(assert start!64392)

(declare-fun b!723267 () Bool)

(declare-fun e!405332 () Bool)

(assert (=> b!723267 (= e!405332 false)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!40906 0))(
  ( (array!40907 (arr!19573 (Array (_ BitVec 32) (_ BitVec 64))) (size!19993 (_ BitVec 32))) )
))
(declare-fun lt!320623 () array!40906)

(declare-fun lt!320624 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7129 0))(
  ( (MissingZero!7129 (index!30884 (_ BitVec 32))) (Found!7129 (index!30885 (_ BitVec 32))) (Intermediate!7129 (undefined!7941 Bool) (index!30886 (_ BitVec 32)) (x!62037 (_ BitVec 32))) (Undefined!7129) (MissingVacant!7129 (index!30887 (_ BitVec 32))) )
))
(declare-fun lt!320627 () SeekEntryResult!7129)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40906 (_ BitVec 32)) SeekEntryResult!7129)

(assert (=> b!723267 (= lt!320627 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320624 lt!320623 mask!3328))))

(declare-fun lt!320628 () SeekEntryResult!7129)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!723267 (= lt!320628 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320624 mask!3328) lt!320624 lt!320623 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun a!3186 () array!40906)

(assert (=> b!723267 (= lt!320624 (select (store (arr!19573 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!723267 (= lt!320623 (array!40907 (store (arr!19573 a!3186) i!1173 k0!2102) (size!19993 a!3186)))))

(declare-fun b!723268 () Bool)

(declare-fun res!484760 () Bool)

(declare-fun e!405335 () Bool)

(assert (=> b!723268 (=> (not res!484760) (not e!405335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!723268 (= res!484760 (validKeyInArray!0 (select (arr!19573 a!3186) j!159)))))

(declare-fun b!723269 () Bool)

(declare-fun res!484759 () Bool)

(declare-fun e!405334 () Bool)

(assert (=> b!723269 (=> (not res!484759) (not e!405334))))

(declare-datatypes ((List!13482 0))(
  ( (Nil!13479) (Cons!13478 (h!14535 (_ BitVec 64)) (t!19789 List!13482)) )
))
(declare-fun arrayNoDuplicates!0 (array!40906 (_ BitVec 32) List!13482) Bool)

(assert (=> b!723269 (= res!484759 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13479))))

(declare-fun b!723270 () Bool)

(assert (=> b!723270 (= e!405335 e!405334)))

(declare-fun res!484766 () Bool)

(assert (=> b!723270 (=> (not res!484766) (not e!405334))))

(declare-fun lt!320625 () SeekEntryResult!7129)

(assert (=> b!723270 (= res!484766 (or (= lt!320625 (MissingZero!7129 i!1173)) (= lt!320625 (MissingVacant!7129 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40906 (_ BitVec 32)) SeekEntryResult!7129)

(assert (=> b!723270 (= lt!320625 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!484768 () Bool)

(assert (=> start!64392 (=> (not res!484768) (not e!405335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64392 (= res!484768 (validMask!0 mask!3328))))

(assert (=> start!64392 e!405335))

(assert (=> start!64392 true))

(declare-fun array_inv!15432 (array!40906) Bool)

(assert (=> start!64392 (array_inv!15432 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!405333 () Bool)

(declare-fun b!723271 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40906 (_ BitVec 32)) SeekEntryResult!7129)

(assert (=> b!723271 (= e!405333 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19573 a!3186) j!159) a!3186 mask!3328) (Found!7129 j!159)))))

(declare-fun b!723272 () Bool)

(declare-fun res!484763 () Bool)

(assert (=> b!723272 (=> (not res!484763) (not e!405335))))

(declare-fun arrayContainsKey!0 (array!40906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!723272 (= res!484763 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!723273 () Bool)

(declare-fun res!484765 () Bool)

(assert (=> b!723273 (=> (not res!484765) (not e!405332))))

(assert (=> b!723273 (= res!484765 e!405333)))

(declare-fun c!79628 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!723273 (= c!79628 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!723274 () Bool)

(declare-fun res!484758 () Bool)

(assert (=> b!723274 (=> (not res!484758) (not e!405332))))

(assert (=> b!723274 (= res!484758 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19573 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!723275 () Bool)

(declare-fun res!484764 () Bool)

(assert (=> b!723275 (=> (not res!484764) (not e!405334))))

(assert (=> b!723275 (= res!484764 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19993 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19993 a!3186))))))

(declare-fun b!723276 () Bool)

(declare-fun lt!320626 () SeekEntryResult!7129)

(assert (=> b!723276 (= e!405333 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19573 a!3186) j!159) a!3186 mask!3328) lt!320626))))

(declare-fun b!723277 () Bool)

(declare-fun res!484757 () Bool)

(assert (=> b!723277 (=> (not res!484757) (not e!405334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40906 (_ BitVec 32)) Bool)

(assert (=> b!723277 (= res!484757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!723278 () Bool)

(declare-fun res!484762 () Bool)

(assert (=> b!723278 (=> (not res!484762) (not e!405335))))

(assert (=> b!723278 (= res!484762 (and (= (size!19993 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19993 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19993 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!723279 () Bool)

(declare-fun res!484767 () Bool)

(assert (=> b!723279 (=> (not res!484767) (not e!405335))))

(assert (=> b!723279 (= res!484767 (validKeyInArray!0 k0!2102))))

(declare-fun b!723280 () Bool)

(assert (=> b!723280 (= e!405334 e!405332)))

(declare-fun res!484761 () Bool)

(assert (=> b!723280 (=> (not res!484761) (not e!405332))))

(assert (=> b!723280 (= res!484761 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19573 a!3186) j!159) mask!3328) (select (arr!19573 a!3186) j!159) a!3186 mask!3328) lt!320626))))

(assert (=> b!723280 (= lt!320626 (Intermediate!7129 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64392 res!484768) b!723278))

(assert (= (and b!723278 res!484762) b!723268))

(assert (= (and b!723268 res!484760) b!723279))

(assert (= (and b!723279 res!484767) b!723272))

(assert (= (and b!723272 res!484763) b!723270))

(assert (= (and b!723270 res!484766) b!723277))

(assert (= (and b!723277 res!484757) b!723269))

(assert (= (and b!723269 res!484759) b!723275))

(assert (= (and b!723275 res!484764) b!723280))

(assert (= (and b!723280 res!484761) b!723274))

(assert (= (and b!723274 res!484758) b!723273))

(assert (= (and b!723273 c!79628) b!723276))

(assert (= (and b!723273 (not c!79628)) b!723271))

(assert (= (and b!723273 res!484765) b!723267))

(declare-fun m!678267 () Bool)

(assert (=> b!723274 m!678267))

(declare-fun m!678269 () Bool)

(assert (=> b!723280 m!678269))

(assert (=> b!723280 m!678269))

(declare-fun m!678271 () Bool)

(assert (=> b!723280 m!678271))

(assert (=> b!723280 m!678271))

(assert (=> b!723280 m!678269))

(declare-fun m!678273 () Bool)

(assert (=> b!723280 m!678273))

(declare-fun m!678275 () Bool)

(assert (=> b!723277 m!678275))

(declare-fun m!678277 () Bool)

(assert (=> b!723267 m!678277))

(declare-fun m!678279 () Bool)

(assert (=> b!723267 m!678279))

(declare-fun m!678281 () Bool)

(assert (=> b!723267 m!678281))

(declare-fun m!678283 () Bool)

(assert (=> b!723267 m!678283))

(assert (=> b!723267 m!678277))

(declare-fun m!678285 () Bool)

(assert (=> b!723267 m!678285))

(assert (=> b!723271 m!678269))

(assert (=> b!723271 m!678269))

(declare-fun m!678287 () Bool)

(assert (=> b!723271 m!678287))

(declare-fun m!678289 () Bool)

(assert (=> b!723269 m!678289))

(assert (=> b!723268 m!678269))

(assert (=> b!723268 m!678269))

(declare-fun m!678291 () Bool)

(assert (=> b!723268 m!678291))

(declare-fun m!678293 () Bool)

(assert (=> start!64392 m!678293))

(declare-fun m!678295 () Bool)

(assert (=> start!64392 m!678295))

(declare-fun m!678297 () Bool)

(assert (=> b!723270 m!678297))

(declare-fun m!678299 () Bool)

(assert (=> b!723272 m!678299))

(assert (=> b!723276 m!678269))

(assert (=> b!723276 m!678269))

(declare-fun m!678301 () Bool)

(assert (=> b!723276 m!678301))

(declare-fun m!678303 () Bool)

(assert (=> b!723279 m!678303))

(check-sat (not b!723272) (not start!64392) (not b!723268) (not b!723277) (not b!723279) (not b!723280) (not b!723271) (not b!723276) (not b!723267) (not b!723270) (not b!723269))
(check-sat)
