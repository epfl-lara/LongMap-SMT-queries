; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30564 () Bool)

(assert start!30564)

(declare-fun b!306208 () Bool)

(declare-fun e!192096 () Bool)

(declare-fun e!192099 () Bool)

(assert (=> b!306208 (= e!192096 e!192099)))

(declare-fun res!163188 () Bool)

(assert (=> b!306208 (=> (not res!163188) (not e!192099))))

(declare-datatypes ((array!15568 0))(
  ( (array!15569 (arr!7369 (Array (_ BitVec 32) (_ BitVec 64))) (size!7721 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15568)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2509 0))(
  ( (MissingZero!2509 (index!12212 (_ BitVec 32))) (Found!2509 (index!12213 (_ BitVec 32))) (Intermediate!2509 (undefined!3321 Bool) (index!12214 (_ BitVec 32)) (x!30464 (_ BitVec 32))) (Undefined!2509) (MissingVacant!2509 (index!12215 (_ BitVec 32))) )
))
(declare-fun lt!150915 () SeekEntryResult!2509)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15568 (_ BitVec 32)) SeekEntryResult!2509)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306208 (= res!163188 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150915))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306208 (= lt!150915 (Intermediate!2509 false resIndex!52 resX!52))))

(declare-fun b!306209 () Bool)

(declare-fun res!163184 () Bool)

(assert (=> b!306209 (=> (not res!163184) (not e!192096))))

(declare-fun arrayContainsKey!0 (array!15568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306209 (= res!163184 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306210 () Bool)

(declare-fun res!163191 () Bool)

(assert (=> b!306210 (=> (not res!163191) (not e!192096))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306210 (= res!163191 (and (= (size!7721 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7721 a!3293))))))

(declare-fun b!306211 () Bool)

(declare-fun res!163185 () Bool)

(assert (=> b!306211 (=> (not res!163185) (not e!192096))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306211 (= res!163185 (validKeyInArray!0 k!2441))))

(declare-fun b!306213 () Bool)

(declare-fun res!163187 () Bool)

(assert (=> b!306213 (=> (not res!163187) (not e!192099))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!306213 (= res!163187 (and (= (select (arr!7369 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7721 a!3293))))))

(declare-fun b!306214 () Bool)

(declare-fun res!163182 () Bool)

(assert (=> b!306214 (=> (not res!163182) (not e!192099))))

(assert (=> b!306214 (= res!163182 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7369 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306215 () Bool)

(declare-datatypes ((Unit!9486 0))(
  ( (Unit!9487) )
))
(declare-fun e!192100 () Unit!9486)

(declare-fun Unit!9488 () Unit!9486)

(assert (=> b!306215 (= e!192100 Unit!9488)))

(declare-fun b!306216 () Bool)

(declare-fun e!192097 () Unit!9486)

(assert (=> b!306216 (= e!192100 e!192097)))

(declare-fun c!49116 () Bool)

(assert (=> b!306216 (= c!49116 (or (= (select (arr!7369 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7369 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306217 () Bool)

(declare-fun res!163190 () Bool)

(assert (=> b!306217 (=> (not res!163190) (not e!192096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15568 (_ BitVec 32)) Bool)

(assert (=> b!306217 (= res!163190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306218 () Bool)

(assert (=> b!306218 false))

(declare-fun Unit!9489 () Unit!9486)

(assert (=> b!306218 (= e!192097 Unit!9489)))

(declare-fun b!306219 () Bool)

(assert (=> b!306219 false))

(declare-fun lt!150913 () SeekEntryResult!2509)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306219 (= lt!150913 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9490 () Unit!9486)

(assert (=> b!306219 (= e!192097 Unit!9490)))

(declare-fun b!306220 () Bool)

(declare-fun res!163189 () Bool)

(assert (=> b!306220 (=> (not res!163189) (not e!192096))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15568 (_ BitVec 32)) SeekEntryResult!2509)

(assert (=> b!306220 (= res!163189 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2509 i!1240)))))

(declare-fun b!306221 () Bool)

(assert (=> b!306221 (= e!192099 (not true))))

(assert (=> b!306221 (= index!1781 resIndex!52)))

(declare-fun lt!150914 () Unit!9486)

(assert (=> b!306221 (= lt!150914 e!192100)))

(declare-fun c!49115 () Bool)

(assert (=> b!306221 (= c!49115 (not (= resIndex!52 index!1781)))))

(declare-fun b!306212 () Bool)

(declare-fun res!163186 () Bool)

(assert (=> b!306212 (=> (not res!163186) (not e!192099))))

(assert (=> b!306212 (= res!163186 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150915))))

(declare-fun res!163183 () Bool)

(assert (=> start!30564 (=> (not res!163183) (not e!192096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30564 (= res!163183 (validMask!0 mask!3709))))

(assert (=> start!30564 e!192096))

(declare-fun array_inv!5332 (array!15568) Bool)

(assert (=> start!30564 (array_inv!5332 a!3293)))

(assert (=> start!30564 true))

(assert (= (and start!30564 res!163183) b!306210))

(assert (= (and b!306210 res!163191) b!306211))

(assert (= (and b!306211 res!163185) b!306209))

(assert (= (and b!306209 res!163184) b!306220))

(assert (= (and b!306220 res!163189) b!306217))

(assert (= (and b!306217 res!163190) b!306208))

(assert (= (and b!306208 res!163188) b!306213))

(assert (= (and b!306213 res!163187) b!306212))

(assert (= (and b!306212 res!163186) b!306214))

(assert (= (and b!306214 res!163182) b!306221))

(assert (= (and b!306221 c!49115) b!306216))

(assert (= (and b!306221 (not c!49115)) b!306215))

(assert (= (and b!306216 c!49116) b!306218))

(assert (= (and b!306216 (not c!49116)) b!306219))

(declare-fun m!316887 () Bool)

(assert (=> b!306208 m!316887))

(assert (=> b!306208 m!316887))

(declare-fun m!316889 () Bool)

(assert (=> b!306208 m!316889))

(declare-fun m!316891 () Bool)

(assert (=> b!306209 m!316891))

(declare-fun m!316893 () Bool)

(assert (=> b!306213 m!316893))

(declare-fun m!316895 () Bool)

(assert (=> b!306219 m!316895))

(assert (=> b!306219 m!316895))

(declare-fun m!316897 () Bool)

(assert (=> b!306219 m!316897))

(declare-fun m!316899 () Bool)

(assert (=> b!306220 m!316899))

(declare-fun m!316901 () Bool)

(assert (=> b!306217 m!316901))

(declare-fun m!316903 () Bool)

(assert (=> start!30564 m!316903))

(declare-fun m!316905 () Bool)

(assert (=> start!30564 m!316905))

(declare-fun m!316907 () Bool)

(assert (=> b!306212 m!316907))

(declare-fun m!316909 () Bool)

(assert (=> b!306216 m!316909))

(declare-fun m!316911 () Bool)

(assert (=> b!306211 m!316911))

(assert (=> b!306214 m!316909))

(push 1)

