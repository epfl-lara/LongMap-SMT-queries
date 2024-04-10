; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32234 () Bool)

(assert start!32234)

(declare-fun b!321027 () Bool)

(declare-fun e!199049 () Bool)

(declare-fun e!199050 () Bool)

(assert (=> b!321027 (= e!199049 e!199050)))

(declare-fun res!175150 () Bool)

(assert (=> b!321027 (=> (not res!175150) (not e!199050))))

(declare-datatypes ((array!16424 0))(
  ( (array!16425 (arr!7771 (Array (_ BitVec 32) (_ BitVec 64))) (size!8123 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16424)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2902 0))(
  ( (MissingZero!2902 (index!13784 (_ BitVec 32))) (Found!2902 (index!13785 (_ BitVec 32))) (Intermediate!2902 (undefined!3714 Bool) (index!13786 (_ BitVec 32)) (x!32049 (_ BitVec 32))) (Undefined!2902) (MissingVacant!2902 (index!13787 (_ BitVec 32))) )
))
(declare-fun lt!156147 () SeekEntryResult!2902)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16424 (_ BitVec 32)) SeekEntryResult!2902)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321027 (= res!175150 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156147))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321027 (= lt!156147 (Intermediate!2902 false resIndex!58 resX!58))))

(declare-fun b!321028 () Bool)

(declare-fun res!175149 () Bool)

(assert (=> b!321028 (=> (not res!175149) (not e!199049))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321028 (= res!175149 (and (= (size!8123 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8123 a!3305))))))

(declare-fun b!321029 () Bool)

(declare-fun res!175155 () Bool)

(assert (=> b!321029 (=> (not res!175155) (not e!199049))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16424 (_ BitVec 32)) SeekEntryResult!2902)

(assert (=> b!321029 (= res!175155 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2902 i!1250)))))

(declare-fun b!321030 () Bool)

(declare-fun res!175154 () Bool)

(assert (=> b!321030 (=> (not res!175154) (not e!199050))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321030 (= res!175154 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156147))))

(declare-fun b!321031 () Bool)

(declare-fun res!175152 () Bool)

(assert (=> b!321031 (=> (not res!175152) (not e!199049))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16424 (_ BitVec 32)) Bool)

(assert (=> b!321031 (= res!175152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321032 () Bool)

(declare-fun res!175151 () Bool)

(assert (=> b!321032 (=> (not res!175151) (not e!199050))))

(assert (=> b!321032 (= res!175151 (and (= (select (arr!7771 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8123 a!3305))))))

(declare-fun b!321033 () Bool)

(declare-fun res!175153 () Bool)

(assert (=> b!321033 (=> (not res!175153) (not e!199049))))

(declare-fun arrayContainsKey!0 (array!16424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321033 (= res!175153 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!175148 () Bool)

(assert (=> start!32234 (=> (not res!175148) (not e!199049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32234 (= res!175148 (validMask!0 mask!3777))))

(assert (=> start!32234 e!199049))

(declare-fun array_inv!5734 (array!16424) Bool)

(assert (=> start!32234 (array_inv!5734 a!3305)))

(assert (=> start!32234 true))

(declare-fun b!321034 () Bool)

(declare-fun res!175147 () Bool)

(assert (=> b!321034 (=> (not res!175147) (not e!199049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321034 (= res!175147 (validKeyInArray!0 k!2497))))

(declare-fun b!321035 () Bool)

(assert (=> b!321035 (= e!199050 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7771 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (or (= (select (arr!7771 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7771 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(assert (= (and start!32234 res!175148) b!321028))

(assert (= (and b!321028 res!175149) b!321034))

(assert (= (and b!321034 res!175147) b!321033))

(assert (= (and b!321033 res!175153) b!321029))

(assert (= (and b!321029 res!175155) b!321031))

(assert (= (and b!321031 res!175152) b!321027))

(assert (= (and b!321027 res!175150) b!321032))

(assert (= (and b!321032 res!175151) b!321030))

(assert (= (and b!321030 res!175154) b!321035))

(declare-fun m!329245 () Bool)

(assert (=> b!321034 m!329245))

(declare-fun m!329247 () Bool)

(assert (=> b!321031 m!329247))

(declare-fun m!329249 () Bool)

(assert (=> b!321029 m!329249))

(declare-fun m!329251 () Bool)

(assert (=> b!321035 m!329251))

(declare-fun m!329253 () Bool)

(assert (=> b!321033 m!329253))

(declare-fun m!329255 () Bool)

(assert (=> b!321027 m!329255))

(assert (=> b!321027 m!329255))

(declare-fun m!329257 () Bool)

(assert (=> b!321027 m!329257))

(declare-fun m!329259 () Bool)

(assert (=> b!321030 m!329259))

(declare-fun m!329261 () Bool)

(assert (=> start!32234 m!329261))

(declare-fun m!329263 () Bool)

(assert (=> start!32234 m!329263))

(declare-fun m!329265 () Bool)

(assert (=> b!321032 m!329265))

(push 1)

(assert (not start!32234))

(assert (not b!321033))

(assert (not b!321030))

(assert (not b!321029))

(assert (not b!321034))

(assert (not b!321031))

(assert (not b!321027))

(check-sat)

(pop 1)

(push 1)

(check-sat)

