; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30978 () Bool)

(assert start!30978)

(declare-fun b!311207 () Bool)

(declare-fun res!167661 () Bool)

(declare-fun e!194206 () Bool)

(assert (=> b!311207 (=> (not res!167661) (not e!194206))))

(declare-datatypes ((array!15880 0))(
  ( (array!15881 (arr!7522 (Array (_ BitVec 32) (_ BitVec 64))) (size!7874 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15880)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15880 (_ BitVec 32)) Bool)

(assert (=> b!311207 (= res!167661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun e!194204 () Bool)

(declare-fun b!311208 () Bool)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun lt!152265 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152263 () array!15880)

(declare-datatypes ((SeekEntryResult!2662 0))(
  ( (MissingZero!2662 (index!12824 (_ BitVec 32))) (Found!2662 (index!12825 (_ BitVec 32))) (Intermediate!2662 (undefined!3474 Bool) (index!12826 (_ BitVec 32)) (x!31043 (_ BitVec 32))) (Undefined!2662) (MissingVacant!2662 (index!12827 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15880 (_ BitVec 32)) SeekEntryResult!2662)

(assert (=> b!311208 (= e!194204 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152263 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152265 k!2441 lt!152263 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311208 (= lt!152263 (array!15881 (store (arr!7522 a!3293) i!1240 k!2441) (size!7874 a!3293)))))

(declare-fun b!311209 () Bool)

(declare-fun e!194203 () Bool)

(declare-fun e!194205 () Bool)

(assert (=> b!311209 (= e!194203 e!194205)))

(declare-fun res!167663 () Bool)

(assert (=> b!311209 (=> (not res!167663) (not e!194205))))

(declare-fun lt!152262 () SeekEntryResult!2662)

(declare-fun lt!152264 () SeekEntryResult!2662)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311209 (= res!167663 (and (= lt!152264 lt!152262) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7522 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311209 (= lt!152264 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311210 () Bool)

(declare-fun res!167668 () Bool)

(assert (=> b!311210 (=> (not res!167668) (not e!194206))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311210 (= res!167668 (validKeyInArray!0 k!2441))))

(declare-fun b!311212 () Bool)

(declare-fun res!167662 () Bool)

(assert (=> b!311212 (=> (not res!167662) (not e!194206))))

(assert (=> b!311212 (= res!167662 (and (= (size!7874 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7874 a!3293))))))

(declare-fun b!311213 () Bool)

(declare-fun res!167666 () Bool)

(assert (=> b!311213 (=> (not res!167666) (not e!194206))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15880 (_ BitVec 32)) SeekEntryResult!2662)

(assert (=> b!311213 (= res!167666 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2662 i!1240)))))

(declare-fun b!311214 () Bool)

(declare-fun res!167670 () Bool)

(assert (=> b!311214 (=> (not res!167670) (not e!194206))))

(declare-fun arrayContainsKey!0 (array!15880 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311214 (= res!167670 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311215 () Bool)

(declare-fun res!167669 () Bool)

(assert (=> b!311215 (=> (not res!167669) (not e!194203))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311215 (= res!167669 (and (= (select (arr!7522 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7874 a!3293))))))

(declare-fun b!311216 () Bool)

(assert (=> b!311216 (= e!194205 (not true))))

(assert (=> b!311216 e!194204))

(declare-fun res!167667 () Bool)

(assert (=> b!311216 (=> (not res!167667) (not e!194204))))

(assert (=> b!311216 (= res!167667 (= lt!152264 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152265 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311216 (= lt!152265 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!167665 () Bool)

(assert (=> start!30978 (=> (not res!167665) (not e!194206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30978 (= res!167665 (validMask!0 mask!3709))))

(assert (=> start!30978 e!194206))

(declare-fun array_inv!5485 (array!15880) Bool)

(assert (=> start!30978 (array_inv!5485 a!3293)))

(assert (=> start!30978 true))

(declare-fun b!311211 () Bool)

(assert (=> b!311211 (= e!194206 e!194203)))

(declare-fun res!167664 () Bool)

(assert (=> b!311211 (=> (not res!167664) (not e!194203))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311211 (= res!167664 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152262))))

(assert (=> b!311211 (= lt!152262 (Intermediate!2662 false resIndex!52 resX!52))))

(assert (= (and start!30978 res!167665) b!311212))

(assert (= (and b!311212 res!167662) b!311210))

(assert (= (and b!311210 res!167668) b!311214))

(assert (= (and b!311214 res!167670) b!311213))

(assert (= (and b!311213 res!167666) b!311207))

(assert (= (and b!311207 res!167661) b!311211))

(assert (= (and b!311211 res!167664) b!311215))

(assert (= (and b!311215 res!167669) b!311209))

(assert (= (and b!311209 res!167663) b!311216))

(assert (= (and b!311216 res!167667) b!311208))

(declare-fun m!321165 () Bool)

(assert (=> b!311211 m!321165))

(assert (=> b!311211 m!321165))

(declare-fun m!321167 () Bool)

(assert (=> b!311211 m!321167))

(declare-fun m!321169 () Bool)

(assert (=> b!311209 m!321169))

(declare-fun m!321171 () Bool)

(assert (=> b!311209 m!321171))

(declare-fun m!321173 () Bool)

(assert (=> b!311216 m!321173))

(declare-fun m!321175 () Bool)

(assert (=> b!311216 m!321175))

(declare-fun m!321177 () Bool)

(assert (=> start!30978 m!321177))

(declare-fun m!321179 () Bool)

(assert (=> start!30978 m!321179))

(declare-fun m!321181 () Bool)

(assert (=> b!311213 m!321181))

(declare-fun m!321183 () Bool)

(assert (=> b!311210 m!321183))

(declare-fun m!321185 () Bool)

(assert (=> b!311207 m!321185))

(declare-fun m!321187 () Bool)

(assert (=> b!311215 m!321187))

(declare-fun m!321189 () Bool)

(assert (=> b!311214 m!321189))

(declare-fun m!321191 () Bool)

(assert (=> b!311208 m!321191))

(declare-fun m!321193 () Bool)

(assert (=> b!311208 m!321193))

(declare-fun m!321195 () Bool)

(assert (=> b!311208 m!321195))

(push 1)

(assert (not b!311209))

(assert (not b!311208))

(assert (not b!311210))

(assert (not b!311213))

(assert (not b!311211))

(assert (not b!311214))

(assert (not start!30978))

