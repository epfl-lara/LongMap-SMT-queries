; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32436 () Bool)

(assert start!32436)

(declare-fun b!323938 () Bool)

(declare-fun res!177419 () Bool)

(declare-fun e!200033 () Bool)

(assert (=> b!323938 (=> (not res!177419) (not e!200033))))

(declare-datatypes ((array!16579 0))(
  ( (array!16580 (arr!7847 (Array (_ BitVec 32) (_ BitVec 64))) (size!8200 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16579)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323938 (= res!177419 (and (= (size!8200 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8200 a!3305))))))

(declare-fun b!323939 () Bool)

(declare-fun res!177420 () Bool)

(assert (=> b!323939 (=> (not res!177420) (not e!200033))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323939 (= res!177420 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323940 () Bool)

(declare-fun res!177416 () Bool)

(declare-fun e!200032 () Bool)

(assert (=> b!323940 (=> (not res!177416) (not e!200032))))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun index!1840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2977 0))(
  ( (MissingZero!2977 (index!14084 (_ BitVec 32))) (Found!2977 (index!14085 (_ BitVec 32))) (Intermediate!2977 (undefined!3789 Bool) (index!14086 (_ BitVec 32)) (x!32344 (_ BitVec 32))) (Undefined!2977) (MissingVacant!2977 (index!14087 (_ BitVec 32))) )
))
(declare-fun lt!156530 () SeekEntryResult!2977)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16579 (_ BitVec 32)) SeekEntryResult!2977)

(assert (=> b!323940 (= res!177416 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156530))))

(declare-fun b!323941 () Bool)

(assert (=> b!323941 (= e!200033 e!200032)))

(declare-fun res!177417 () Bool)

(assert (=> b!323941 (=> (not res!177417) (not e!200032))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323941 (= res!177417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156530))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323941 (= lt!156530 (Intermediate!2977 false resIndex!58 resX!58))))

(declare-fun b!323942 () Bool)

(declare-fun res!177418 () Bool)

(assert (=> b!323942 (=> (not res!177418) (not e!200033))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16579 (_ BitVec 32)) SeekEntryResult!2977)

(assert (=> b!323942 (= res!177418 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2977 i!1250)))))

(declare-fun b!323943 () Bool)

(declare-fun res!177423 () Bool)

(assert (=> b!323943 (=> (not res!177423) (not e!200032))))

(assert (=> b!323943 (= res!177423 (and (= (select (arr!7847 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8200 a!3305))))))

(declare-fun res!177415 () Bool)

(assert (=> start!32436 (=> (not res!177415) (not e!200033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32436 (= res!177415 (validMask!0 mask!3777))))

(assert (=> start!32436 e!200033))

(declare-fun array_inv!5819 (array!16579) Bool)

(assert (=> start!32436 (array_inv!5819 a!3305)))

(assert (=> start!32436 true))

(declare-fun b!323944 () Bool)

(assert (=> b!323944 (= e!200032 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7847 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvsge index!1840 (bvadd #b00000000000000000000000000000001 mask!3777))))))

(declare-fun b!323945 () Bool)

(declare-fun res!177421 () Bool)

(assert (=> b!323945 (=> (not res!177421) (not e!200033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16579 (_ BitVec 32)) Bool)

(assert (=> b!323945 (= res!177421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323946 () Bool)

(declare-fun res!177422 () Bool)

(assert (=> b!323946 (=> (not res!177422) (not e!200033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323946 (= res!177422 (validKeyInArray!0 k!2497))))

(assert (= (and start!32436 res!177415) b!323938))

(assert (= (and b!323938 res!177419) b!323946))

(assert (= (and b!323946 res!177422) b!323939))

(assert (= (and b!323939 res!177420) b!323942))

(assert (= (and b!323942 res!177418) b!323945))

(assert (= (and b!323945 res!177421) b!323941))

(assert (= (and b!323941 res!177417) b!323943))

(assert (= (and b!323943 res!177423) b!323940))

(assert (= (and b!323940 res!177416) b!323944))

(declare-fun m!330573 () Bool)

(assert (=> b!323939 m!330573))

(declare-fun m!330575 () Bool)

(assert (=> b!323940 m!330575))

(declare-fun m!330577 () Bool)

(assert (=> b!323945 m!330577))

(declare-fun m!330579 () Bool)

(assert (=> start!32436 m!330579))

(declare-fun m!330581 () Bool)

(assert (=> start!32436 m!330581))

(declare-fun m!330583 () Bool)

(assert (=> b!323942 m!330583))

(declare-fun m!330585 () Bool)

(assert (=> b!323944 m!330585))

(declare-fun m!330587 () Bool)

(assert (=> b!323941 m!330587))

(assert (=> b!323941 m!330587))

(declare-fun m!330589 () Bool)

(assert (=> b!323941 m!330589))

(declare-fun m!330591 () Bool)

(assert (=> b!323943 m!330591))

(declare-fun m!330593 () Bool)

(assert (=> b!323946 m!330593))

(push 1)

(assert (not start!32436))

(assert (not b!323946))

(assert (not b!323941))

(assert (not b!323939))

(assert (not b!323945))

(assert (not b!323942))

(assert (not b!323940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

