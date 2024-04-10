; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33286 () Bool)

(assert start!33286)

(declare-fun b!330956 () Bool)

(declare-fun res!182360 () Bool)

(declare-fun e!203103 () Bool)

(assert (=> b!330956 (=> (not res!182360) (not e!203103))))

(declare-datatypes ((array!16894 0))(
  ( (array!16895 (arr!7988 (Array (_ BitVec 32) (_ BitVec 64))) (size!8340 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16894)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330956 (= res!182360 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330957 () Bool)

(declare-fun res!182362 () Bool)

(assert (=> b!330957 (=> (not res!182362) (not e!203103))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3119 0))(
  ( (MissingZero!3119 (index!14652 (_ BitVec 32))) (Found!3119 (index!14653 (_ BitVec 32))) (Intermediate!3119 (undefined!3931 Bool) (index!14654 (_ BitVec 32)) (x!32943 (_ BitVec 32))) (Undefined!3119) (MissingVacant!3119 (index!14655 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16894 (_ BitVec 32)) SeekEntryResult!3119)

(assert (=> b!330957 (= res!182362 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3119 i!1250)))))

(declare-fun b!330958 () Bool)

(declare-fun res!182363 () Bool)

(declare-fun e!203102 () Bool)

(assert (=> b!330958 (=> (not res!182363) (not e!203102))))

(declare-fun lt!158684 () SeekEntryResult!3119)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16894 (_ BitVec 32)) SeekEntryResult!3119)

(assert (=> b!330958 (= res!182363 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!158684))))

(declare-fun res!182358 () Bool)

(assert (=> start!33286 (=> (not res!182358) (not e!203103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33286 (= res!182358 (validMask!0 mask!3777))))

(assert (=> start!33286 e!203103))

(declare-fun array_inv!5951 (array!16894) Bool)

(assert (=> start!33286 (array_inv!5951 a!3305)))

(assert (=> start!33286 true))

(declare-fun b!330959 () Bool)

(declare-fun res!182365 () Bool)

(assert (=> b!330959 (=> (not res!182365) (not e!203103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330959 (= res!182365 (validKeyInArray!0 k!2497))))

(declare-fun b!330960 () Bool)

(declare-fun res!182367 () Bool)

(assert (=> b!330960 (=> (not res!182367) (not e!203102))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!330960 (= res!182367 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7988 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!330961 () Bool)

(declare-fun res!182359 () Bool)

(assert (=> b!330961 (=> (not res!182359) (not e!203103))))

(assert (=> b!330961 (= res!182359 (and (= (size!8340 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8340 a!3305))))))

(declare-fun b!330962 () Bool)

(assert (=> b!330962 (= e!203103 e!203102)))

(declare-fun res!182364 () Bool)

(assert (=> b!330962 (=> (not res!182364) (not e!203102))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330962 (= res!182364 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!158684))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!330962 (= lt!158684 (Intermediate!3119 false resIndex!58 resX!58))))

(declare-fun b!330963 () Bool)

(declare-fun res!182366 () Bool)

(assert (=> b!330963 (=> (not res!182366) (not e!203103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16894 (_ BitVec 32)) Bool)

(assert (=> b!330963 (= res!182366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330964 () Bool)

(assert (=> b!330964 (= e!203102 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1490)) (bvsub #b01111111111111111111111111111110 x!1490)))))

(declare-fun lt!158685 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330964 (= lt!158685 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!330965 () Bool)

(declare-fun res!182361 () Bool)

(assert (=> b!330965 (=> (not res!182361) (not e!203102))))

(assert (=> b!330965 (= res!182361 (and (= (select (arr!7988 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8340 a!3305))))))

(assert (= (and start!33286 res!182358) b!330961))

(assert (= (and b!330961 res!182359) b!330959))

(assert (= (and b!330959 res!182365) b!330956))

(assert (= (and b!330956 res!182360) b!330957))

(assert (= (and b!330957 res!182362) b!330963))

(assert (= (and b!330963 res!182366) b!330962))

(assert (= (and b!330962 res!182364) b!330965))

(assert (= (and b!330965 res!182361) b!330958))

(assert (= (and b!330958 res!182363) b!330960))

(assert (= (and b!330960 res!182367) b!330964))

(declare-fun m!335981 () Bool)

(assert (=> b!330960 m!335981))

(declare-fun m!335983 () Bool)

(assert (=> b!330957 m!335983))

(declare-fun m!335985 () Bool)

(assert (=> b!330956 m!335985))

(declare-fun m!335987 () Bool)

(assert (=> b!330962 m!335987))

(assert (=> b!330962 m!335987))

(declare-fun m!335989 () Bool)

(assert (=> b!330962 m!335989))

(declare-fun m!335991 () Bool)

(assert (=> b!330965 m!335991))

(declare-fun m!335993 () Bool)

(assert (=> b!330963 m!335993))

(declare-fun m!335995 () Bool)

(assert (=> b!330958 m!335995))

(declare-fun m!335997 () Bool)

(assert (=> b!330964 m!335997))

(declare-fun m!335999 () Bool)

(assert (=> start!33286 m!335999))

(declare-fun m!336001 () Bool)

(assert (=> start!33286 m!336001))

(declare-fun m!336003 () Bool)

(assert (=> b!330959 m!336003))

(push 1)

(assert (not b!330959))

(assert (not b!330964))

(assert (not b!330958))

(assert (not b!330962))

(assert (not b!330963))

(assert (not b!330957))

(assert (not b!330956))

(assert (not start!33286))

(check-sat)

(pop 1)

(push 1)

(check-sat)

