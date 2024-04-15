; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32456 () Bool)

(assert start!32456)

(declare-fun b!324228 () Bool)

(declare-fun res!177712 () Bool)

(declare-fun e!200121 () Bool)

(assert (=> b!324228 (=> (not res!177712) (not e!200121))))

(declare-datatypes ((array!16599 0))(
  ( (array!16600 (arr!7857 (Array (_ BitVec 32) (_ BitVec 64))) (size!8210 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16599)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2987 0))(
  ( (MissingZero!2987 (index!14124 (_ BitVec 32))) (Found!2987 (index!14125 (_ BitVec 32))) (Intermediate!2987 (undefined!3799 Bool) (index!14126 (_ BitVec 32)) (x!32386 (_ BitVec 32))) (Undefined!2987) (MissingVacant!2987 (index!14127 (_ BitVec 32))) )
))
(declare-fun lt!156580 () SeekEntryResult!2987)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16599 (_ BitVec 32)) SeekEntryResult!2987)

(assert (=> b!324228 (= res!177712 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156580))))

(declare-fun b!324229 () Bool)

(declare-fun res!177714 () Bool)

(declare-fun e!200123 () Bool)

(assert (=> b!324229 (=> (not res!177714) (not e!200123))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324229 (= res!177714 (and (= (size!8210 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8210 a!3305))))))

(declare-fun b!324230 () Bool)

(declare-fun res!177706 () Bool)

(assert (=> b!324230 (=> (not res!177706) (not e!200123))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16599 (_ BitVec 32)) SeekEntryResult!2987)

(assert (=> b!324230 (= res!177706 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2987 i!1250)))))

(declare-fun b!324231 () Bool)

(declare-fun res!177713 () Bool)

(assert (=> b!324231 (=> (not res!177713) (not e!200121))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!324231 (= res!177713 (and (= (select (arr!7857 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8210 a!3305))))))

(declare-fun b!324232 () Bool)

(declare-fun res!177709 () Bool)

(assert (=> b!324232 (=> (not res!177709) (not e!200123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324232 (= res!177709 (validKeyInArray!0 k0!2497))))

(declare-fun b!324233 () Bool)

(declare-fun res!177705 () Bool)

(assert (=> b!324233 (=> (not res!177705) (not e!200123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16599 (_ BitVec 32)) Bool)

(assert (=> b!324233 (= res!177705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324234 () Bool)

(declare-fun res!177710 () Bool)

(assert (=> b!324234 (=> (not res!177710) (not e!200123))))

(declare-fun arrayContainsKey!0 (array!16599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324234 (= res!177710 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324235 () Bool)

(assert (=> b!324235 (= e!200123 e!200121)))

(declare-fun res!177707 () Bool)

(assert (=> b!324235 (=> (not res!177707) (not e!200121))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324235 (= res!177707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156580))))

(assert (=> b!324235 (= lt!156580 (Intermediate!2987 false resIndex!58 resX!58))))

(declare-fun res!177708 () Bool)

(assert (=> start!32456 (=> (not res!177708) (not e!200123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32456 (= res!177708 (validMask!0 mask!3777))))

(assert (=> start!32456 e!200123))

(declare-fun array_inv!5829 (array!16599) Bool)

(assert (=> start!32456 (array_inv!5829 a!3305)))

(assert (=> start!32456 true))

(declare-fun b!324236 () Bool)

(declare-fun res!177711 () Bool)

(assert (=> b!324236 (=> (not res!177711) (not e!200121))))

(assert (=> b!324236 (= res!177711 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7857 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324237 () Bool)

(assert (=> b!324237 (= e!200121 false)))

(declare-fun lt!156581 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324237 (= lt!156581 (nextIndex!0 index!1840 x!1490 mask!3777))))

(assert (= (and start!32456 res!177708) b!324229))

(assert (= (and b!324229 res!177714) b!324232))

(assert (= (and b!324232 res!177709) b!324234))

(assert (= (and b!324234 res!177710) b!324230))

(assert (= (and b!324230 res!177706) b!324233))

(assert (= (and b!324233 res!177705) b!324235))

(assert (= (and b!324235 res!177707) b!324231))

(assert (= (and b!324231 res!177713) b!324228))

(assert (= (and b!324228 res!177712) b!324236))

(assert (= (and b!324236 res!177711) b!324237))

(declare-fun m!330805 () Bool)

(assert (=> b!324236 m!330805))

(declare-fun m!330807 () Bool)

(assert (=> b!324237 m!330807))

(declare-fun m!330809 () Bool)

(assert (=> b!324235 m!330809))

(assert (=> b!324235 m!330809))

(declare-fun m!330811 () Bool)

(assert (=> b!324235 m!330811))

(declare-fun m!330813 () Bool)

(assert (=> b!324234 m!330813))

(declare-fun m!330815 () Bool)

(assert (=> b!324232 m!330815))

(declare-fun m!330817 () Bool)

(assert (=> b!324233 m!330817))

(declare-fun m!330819 () Bool)

(assert (=> b!324231 m!330819))

(declare-fun m!330821 () Bool)

(assert (=> b!324230 m!330821))

(declare-fun m!330823 () Bool)

(assert (=> b!324228 m!330823))

(declare-fun m!330825 () Bool)

(assert (=> start!32456 m!330825))

(declare-fun m!330827 () Bool)

(assert (=> start!32456 m!330827))

(check-sat (not start!32456) (not b!324228) (not b!324233) (not b!324230) (not b!324235) (not b!324237) (not b!324232) (not b!324234))
(check-sat)
