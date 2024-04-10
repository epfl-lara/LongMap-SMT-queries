; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32522 () Bool)

(assert start!32522)

(declare-fun b!325283 () Bool)

(declare-fun res!178622 () Bool)

(declare-fun e!200531 () Bool)

(assert (=> b!325283 (=> (not res!178622) (not e!200531))))

(declare-datatypes ((array!16661 0))(
  ( (array!16662 (arr!7888 (Array (_ BitVec 32) (_ BitVec 64))) (size!8240 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16661)

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!325283 (= res!178622 (and (= (size!8240 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8240 a!3305))))))

(declare-fun b!325284 () Bool)

(declare-fun res!178620 () Bool)

(assert (=> b!325284 (=> (not res!178620) (not e!200531))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325284 (= res!178620 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325285 () Bool)

(declare-fun res!178619 () Bool)

(assert (=> b!325285 (=> (not res!178619) (not e!200531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16661 (_ BitVec 32)) Bool)

(assert (=> b!325285 (= res!178619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325287 () Bool)

(declare-fun e!200532 () Bool)

(assert (=> b!325287 (= e!200532 false)))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun lt!156971 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325287 (= lt!156971 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325288 () Bool)

(declare-fun res!178616 () Bool)

(assert (=> b!325288 (=> (not res!178616) (not e!200531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325288 (= res!178616 (validKeyInArray!0 k!2497))))

(declare-fun b!325289 () Bool)

(declare-fun res!178618 () Bool)

(assert (=> b!325289 (=> (not res!178618) (not e!200531))))

(declare-datatypes ((SeekEntryResult!3019 0))(
  ( (MissingZero!3019 (index!14252 (_ BitVec 32))) (Found!3019 (index!14253 (_ BitVec 32))) (Intermediate!3019 (undefined!3831 Bool) (index!14254 (_ BitVec 32)) (x!32487 (_ BitVec 32))) (Undefined!3019) (MissingVacant!3019 (index!14255 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16661 (_ BitVec 32)) SeekEntryResult!3019)

(assert (=> b!325289 (= res!178618 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3019 i!1250)))))

(declare-fun b!325290 () Bool)

(declare-fun res!178615 () Bool)

(assert (=> b!325290 (=> (not res!178615) (not e!200532))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!325290 (= res!178615 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7888 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325291 () Bool)

(declare-fun res!178617 () Bool)

(assert (=> b!325291 (=> (not res!178617) (not e!200532))))

(declare-fun lt!156972 () SeekEntryResult!3019)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16661 (_ BitVec 32)) SeekEntryResult!3019)

(assert (=> b!325291 (= res!178617 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156972))))

(declare-fun b!325292 () Bool)

(assert (=> b!325292 (= e!200531 e!200532)))

(declare-fun res!178614 () Bool)

(assert (=> b!325292 (=> (not res!178614) (not e!200532))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325292 (= res!178614 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156972))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!325292 (= lt!156972 (Intermediate!3019 false resIndex!58 resX!58))))

(declare-fun b!325286 () Bool)

(declare-fun res!178621 () Bool)

(assert (=> b!325286 (=> (not res!178621) (not e!200532))))

(assert (=> b!325286 (= res!178621 (and (= (select (arr!7888 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8240 a!3305))))))

(declare-fun res!178623 () Bool)

(assert (=> start!32522 (=> (not res!178623) (not e!200531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32522 (= res!178623 (validMask!0 mask!3777))))

(assert (=> start!32522 e!200531))

(declare-fun array_inv!5851 (array!16661) Bool)

(assert (=> start!32522 (array_inv!5851 a!3305)))

(assert (=> start!32522 true))

(assert (= (and start!32522 res!178623) b!325283))

(assert (= (and b!325283 res!178622) b!325288))

(assert (= (and b!325288 res!178616) b!325284))

(assert (= (and b!325284 res!178620) b!325289))

(assert (= (and b!325289 res!178618) b!325285))

(assert (= (and b!325285 res!178619) b!325292))

(assert (= (and b!325292 res!178614) b!325286))

(assert (= (and b!325286 res!178621) b!325291))

(assert (= (and b!325291 res!178617) b!325290))

(assert (= (and b!325290 res!178615) b!325287))

(declare-fun m!332159 () Bool)

(assert (=> b!325285 m!332159))

(declare-fun m!332161 () Bool)

(assert (=> b!325290 m!332161))

(declare-fun m!332163 () Bool)

(assert (=> b!325292 m!332163))

(assert (=> b!325292 m!332163))

(declare-fun m!332165 () Bool)

(assert (=> b!325292 m!332165))

(declare-fun m!332167 () Bool)

(assert (=> start!32522 m!332167))

(declare-fun m!332169 () Bool)

(assert (=> start!32522 m!332169))

(declare-fun m!332171 () Bool)

(assert (=> b!325289 m!332171))

(declare-fun m!332173 () Bool)

(assert (=> b!325286 m!332173))

(declare-fun m!332175 () Bool)

(assert (=> b!325287 m!332175))

(declare-fun m!332177 () Bool)

(assert (=> b!325284 m!332177))

(declare-fun m!332179 () Bool)

(assert (=> b!325291 m!332179))

(declare-fun m!332181 () Bool)

(assert (=> b!325288 m!332181))

(push 1)

(assert (not start!32522))

(assert (not b!325285))

(assert (not b!325287))

(assert (not b!325292))

(assert (not b!325291))

