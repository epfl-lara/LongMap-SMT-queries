; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86942 () Bool)

(assert start!86942)

(declare-fun b!1008557 () Bool)

(declare-fun e!567467 () Bool)

(declare-fun e!567465 () Bool)

(assert (=> b!1008557 (= e!567467 e!567465)))

(declare-fun res!677457 () Bool)

(assert (=> b!1008557 (=> (not res!677457) (not e!567465))))

(declare-datatypes ((SeekEntryResult!9548 0))(
  ( (MissingZero!9548 (index!40563 (_ BitVec 32))) (Found!9548 (index!40564 (_ BitVec 32))) (Intermediate!9548 (undefined!10360 Bool) (index!40565 (_ BitVec 32)) (x!87954 (_ BitVec 32))) (Undefined!9548) (MissingVacant!9548 (index!40566 (_ BitVec 32))) )
))
(declare-fun lt!445762 () SeekEntryResult!9548)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008557 (= res!677457 (or (= lt!445762 (MissingVacant!9548 i!1194)) (= lt!445762 (MissingZero!9548 i!1194))))))

(declare-datatypes ((array!63590 0))(
  ( (array!63591 (arr!30616 (Array (_ BitVec 32) (_ BitVec 64))) (size!31118 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63590)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63590 (_ BitVec 32)) SeekEntryResult!9548)

(assert (=> b!1008557 (= lt!445762 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1008558 () Bool)

(declare-fun e!567464 () Bool)

(assert (=> b!1008558 (= e!567464 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445759 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008558 (= lt!445759 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008559 () Bool)

(declare-fun res!677463 () Bool)

(assert (=> b!1008559 (=> (not res!677463) (not e!567465))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008559 (= res!677463 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31118 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31118 a!3219))))))

(declare-fun b!1008560 () Bool)

(declare-fun res!677459 () Bool)

(assert (=> b!1008560 (=> (not res!677459) (not e!567467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008560 (= res!677459 (validKeyInArray!0 k!2224))))

(declare-fun b!1008561 () Bool)

(declare-fun res!677456 () Bool)

(assert (=> b!1008561 (=> (not res!677456) (not e!567467))))

(declare-fun arrayContainsKey!0 (array!63590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008561 (= res!677456 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008562 () Bool)

(declare-fun e!567468 () Bool)

(assert (=> b!1008562 (= e!567468 e!567464)))

(declare-fun res!677455 () Bool)

(assert (=> b!1008562 (=> (not res!677455) (not e!567464))))

(declare-fun lt!445760 () (_ BitVec 64))

(declare-fun lt!445763 () SeekEntryResult!9548)

(declare-fun lt!445758 () array!63590)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63590 (_ BitVec 32)) SeekEntryResult!9548)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008562 (= res!677455 (not (= lt!445763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445760 mask!3464) lt!445760 lt!445758 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1008562 (= lt!445760 (select (store (arr!30616 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008562 (= lt!445758 (array!63591 (store (arr!30616 a!3219) i!1194 k!2224) (size!31118 a!3219)))))

(declare-fun b!1008563 () Bool)

(declare-fun res!677461 () Bool)

(assert (=> b!1008563 (=> (not res!677461) (not e!567467))))

(assert (=> b!1008563 (= res!677461 (validKeyInArray!0 (select (arr!30616 a!3219) j!170)))))

(declare-fun b!1008564 () Bool)

(declare-fun res!677454 () Bool)

(assert (=> b!1008564 (=> (not res!677454) (not e!567465))))

(declare-datatypes ((List!21292 0))(
  ( (Nil!21289) (Cons!21288 (h!22474 (_ BitVec 64)) (t!30293 List!21292)) )
))
(declare-fun arrayNoDuplicates!0 (array!63590 (_ BitVec 32) List!21292) Bool)

(assert (=> b!1008564 (= res!677454 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21289))))

(declare-fun res!677450 () Bool)

(assert (=> start!86942 (=> (not res!677450) (not e!567467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86942 (= res!677450 (validMask!0 mask!3464))))

(assert (=> start!86942 e!567467))

(declare-fun array_inv!23740 (array!63590) Bool)

(assert (=> start!86942 (array_inv!23740 a!3219)))

(assert (=> start!86942 true))

(declare-fun b!1008565 () Bool)

(declare-fun e!567469 () Bool)

(assert (=> b!1008565 (= e!567465 e!567469)))

(declare-fun res!677451 () Bool)

(assert (=> b!1008565 (=> (not res!677451) (not e!567469))))

(declare-fun lt!445757 () SeekEntryResult!9548)

(assert (=> b!1008565 (= res!677451 (= lt!445763 lt!445757))))

(assert (=> b!1008565 (= lt!445757 (Intermediate!9548 false resIndex!38 resX!38))))

(assert (=> b!1008565 (= lt!445763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30616 a!3219) j!170) mask!3464) (select (arr!30616 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008566 () Bool)

(declare-fun res!677452 () Bool)

(assert (=> b!1008566 (=> (not res!677452) (not e!567467))))

(assert (=> b!1008566 (= res!677452 (and (= (size!31118 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31118 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31118 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008567 () Bool)

(declare-fun res!677462 () Bool)

(assert (=> b!1008567 (=> (not res!677462) (not e!567465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63590 (_ BitVec 32)) Bool)

(assert (=> b!1008567 (= res!677462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008568 () Bool)

(assert (=> b!1008568 (= e!567469 e!567468)))

(declare-fun res!677453 () Bool)

(assert (=> b!1008568 (=> (not res!677453) (not e!567468))))

(declare-fun lt!445761 () SeekEntryResult!9548)

(assert (=> b!1008568 (= res!677453 (= lt!445761 lt!445757))))

(assert (=> b!1008568 (= lt!445761 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30616 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008569 () Bool)

(declare-fun res!677460 () Bool)

(assert (=> b!1008569 (=> (not res!677460) (not e!567464))))

(assert (=> b!1008569 (= res!677460 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008570 () Bool)

(declare-fun res!677458 () Bool)

(assert (=> b!1008570 (=> (not res!677458) (not e!567464))))

(assert (=> b!1008570 (= res!677458 (not (= lt!445761 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445760 lt!445758 mask!3464))))))

(assert (= (and start!86942 res!677450) b!1008566))

(assert (= (and b!1008566 res!677452) b!1008563))

(assert (= (and b!1008563 res!677461) b!1008560))

(assert (= (and b!1008560 res!677459) b!1008561))

(assert (= (and b!1008561 res!677456) b!1008557))

(assert (= (and b!1008557 res!677457) b!1008567))

(assert (= (and b!1008567 res!677462) b!1008564))

(assert (= (and b!1008564 res!677454) b!1008559))

(assert (= (and b!1008559 res!677463) b!1008565))

(assert (= (and b!1008565 res!677451) b!1008568))

(assert (= (and b!1008568 res!677453) b!1008562))

(assert (= (and b!1008562 res!677455) b!1008570))

(assert (= (and b!1008570 res!677458) b!1008569))

(assert (= (and b!1008569 res!677460) b!1008558))

(declare-fun m!933287 () Bool)

(assert (=> b!1008565 m!933287))

(assert (=> b!1008565 m!933287))

(declare-fun m!933289 () Bool)

(assert (=> b!1008565 m!933289))

(assert (=> b!1008565 m!933289))

(assert (=> b!1008565 m!933287))

(declare-fun m!933291 () Bool)

(assert (=> b!1008565 m!933291))

(declare-fun m!933293 () Bool)

(assert (=> b!1008562 m!933293))

(assert (=> b!1008562 m!933293))

(declare-fun m!933295 () Bool)

(assert (=> b!1008562 m!933295))

(declare-fun m!933297 () Bool)

(assert (=> b!1008562 m!933297))

(declare-fun m!933299 () Bool)

(assert (=> b!1008562 m!933299))

(declare-fun m!933301 () Bool)

(assert (=> start!86942 m!933301))

(declare-fun m!933303 () Bool)

(assert (=> start!86942 m!933303))

(declare-fun m!933305 () Bool)

(assert (=> b!1008570 m!933305))

(declare-fun m!933307 () Bool)

(assert (=> b!1008560 m!933307))

(declare-fun m!933309 () Bool)

(assert (=> b!1008564 m!933309))

(assert (=> b!1008563 m!933287))

(assert (=> b!1008563 m!933287))

(declare-fun m!933311 () Bool)

(assert (=> b!1008563 m!933311))

(declare-fun m!933313 () Bool)

(assert (=> b!1008567 m!933313))

(declare-fun m!933315 () Bool)

(assert (=> b!1008561 m!933315))

(assert (=> b!1008568 m!933287))

(assert (=> b!1008568 m!933287))

(declare-fun m!933317 () Bool)

(assert (=> b!1008568 m!933317))

(declare-fun m!933319 () Bool)

(assert (=> b!1008557 m!933319))

(declare-fun m!933321 () Bool)

(assert (=> b!1008558 m!933321))

(push 1)

