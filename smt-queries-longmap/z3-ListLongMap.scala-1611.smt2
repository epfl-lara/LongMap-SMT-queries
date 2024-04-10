; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30340 () Bool)

(assert start!30340)

(declare-fun b!303887 () Bool)

(declare-fun res!161381 () Bool)

(declare-fun e!191100 () Bool)

(assert (=> b!303887 (=> (not res!161381) (not e!191100))))

(declare-datatypes ((array!15446 0))(
  ( (array!15447 (arr!7311 (Array (_ BitVec 32) (_ BitVec 64))) (size!7663 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15446)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2451 0))(
  ( (MissingZero!2451 (index!11980 (_ BitVec 32))) (Found!2451 (index!11981 (_ BitVec 32))) (Intermediate!2451 (undefined!3263 Bool) (index!11982 (_ BitVec 32)) (x!30236 (_ BitVec 32))) (Undefined!2451) (MissingVacant!2451 (index!11983 (_ BitVec 32))) )
))
(declare-fun lt!150278 () SeekEntryResult!2451)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15446 (_ BitVec 32)) SeekEntryResult!2451)

(assert (=> b!303887 (= res!161381 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150278))))

(declare-fun b!303888 () Bool)

(declare-fun e!191099 () Bool)

(assert (=> b!303888 (= e!191099 e!191100)))

(declare-fun res!161373 () Bool)

(assert (=> b!303888 (=> (not res!161373) (not e!191100))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303888 (= res!161373 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150278))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303888 (= lt!150278 (Intermediate!2451 false resIndex!52 resX!52))))

(declare-fun b!303889 () Bool)

(declare-fun res!161380 () Bool)

(assert (=> b!303889 (=> (not res!161380) (not e!191099))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303889 (= res!161380 (and (= (size!7663 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7663 a!3293))))))

(declare-fun b!303890 () Bool)

(declare-fun res!161379 () Bool)

(assert (=> b!303890 (=> (not res!161379) (not e!191100))))

(assert (=> b!303890 (= res!161379 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7311 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7311 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7311 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303891 () Bool)

(declare-fun res!161378 () Bool)

(assert (=> b!303891 (=> (not res!161378) (not e!191099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303891 (= res!161378 (validKeyInArray!0 k0!2441))))

(declare-fun b!303892 () Bool)

(assert (=> b!303892 (= e!191100 false)))

(declare-fun lt!150279 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303892 (= lt!150279 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!303893 () Bool)

(declare-fun res!161377 () Bool)

(assert (=> b!303893 (=> (not res!161377) (not e!191100))))

(assert (=> b!303893 (= res!161377 (and (= (select (arr!7311 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7663 a!3293))))))

(declare-fun b!303895 () Bool)

(declare-fun res!161375 () Bool)

(assert (=> b!303895 (=> (not res!161375) (not e!191099))))

(declare-fun arrayContainsKey!0 (array!15446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303895 (= res!161375 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303896 () Bool)

(declare-fun res!161374 () Bool)

(assert (=> b!303896 (=> (not res!161374) (not e!191099))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15446 (_ BitVec 32)) Bool)

(assert (=> b!303896 (= res!161374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303894 () Bool)

(declare-fun res!161376 () Bool)

(assert (=> b!303894 (=> (not res!161376) (not e!191099))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15446 (_ BitVec 32)) SeekEntryResult!2451)

(assert (=> b!303894 (= res!161376 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2451 i!1240)))))

(declare-fun res!161382 () Bool)

(assert (=> start!30340 (=> (not res!161382) (not e!191099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30340 (= res!161382 (validMask!0 mask!3709))))

(assert (=> start!30340 e!191099))

(declare-fun array_inv!5274 (array!15446) Bool)

(assert (=> start!30340 (array_inv!5274 a!3293)))

(assert (=> start!30340 true))

(assert (= (and start!30340 res!161382) b!303889))

(assert (= (and b!303889 res!161380) b!303891))

(assert (= (and b!303891 res!161378) b!303895))

(assert (= (and b!303895 res!161375) b!303894))

(assert (= (and b!303894 res!161376) b!303896))

(assert (= (and b!303896 res!161374) b!303888))

(assert (= (and b!303888 res!161373) b!303893))

(assert (= (and b!303893 res!161377) b!303887))

(assert (= (and b!303887 res!161381) b!303890))

(assert (= (and b!303890 res!161379) b!303892))

(declare-fun m!315149 () Bool)

(assert (=> b!303887 m!315149))

(declare-fun m!315151 () Bool)

(assert (=> b!303893 m!315151))

(declare-fun m!315153 () Bool)

(assert (=> b!303892 m!315153))

(declare-fun m!315155 () Bool)

(assert (=> start!30340 m!315155))

(declare-fun m!315157 () Bool)

(assert (=> start!30340 m!315157))

(declare-fun m!315159 () Bool)

(assert (=> b!303891 m!315159))

(declare-fun m!315161 () Bool)

(assert (=> b!303894 m!315161))

(declare-fun m!315163 () Bool)

(assert (=> b!303896 m!315163))

(declare-fun m!315165 () Bool)

(assert (=> b!303895 m!315165))

(declare-fun m!315167 () Bool)

(assert (=> b!303888 m!315167))

(assert (=> b!303888 m!315167))

(declare-fun m!315169 () Bool)

(assert (=> b!303888 m!315169))

(declare-fun m!315171 () Bool)

(assert (=> b!303890 m!315171))

(check-sat (not b!303892) (not b!303891) (not b!303888) (not start!30340) (not b!303895) (not b!303887) (not b!303896) (not b!303894))
