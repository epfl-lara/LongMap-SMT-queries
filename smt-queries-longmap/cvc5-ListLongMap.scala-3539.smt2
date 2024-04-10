; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48804 () Bool)

(assert start!48804)

(declare-fun b!537158 () Bool)

(declare-fun res!332371 () Bool)

(declare-fun e!311694 () Bool)

(assert (=> b!537158 (=> (not res!332371) (not e!311694))))

(declare-datatypes ((array!34016 0))(
  ( (array!34017 (arr!16347 (Array (_ BitVec 32) (_ BitVec 64))) (size!16711 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34016)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34016 (_ BitVec 32)) Bool)

(assert (=> b!537158 (= res!332371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537159 () Bool)

(declare-fun e!311691 () Bool)

(declare-fun e!311693 () Bool)

(assert (=> b!537159 (= e!311691 e!311693)))

(declare-fun res!332372 () Bool)

(assert (=> b!537159 (=> (not res!332372) (not e!311693))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246317 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537159 (= res!332372 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246317 #b00000000000000000000000000000000) (bvslt lt!246317 (size!16711 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537159 (= lt!246317 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537160 () Bool)

(declare-fun res!332368 () Bool)

(assert (=> b!537160 (=> (not res!332368) (not e!311691))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!537160 (= res!332368 (and (not (= (select (arr!16347 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16347 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16347 a!3154) index!1177) (select (arr!16347 a!3154) j!147)))))))

(declare-fun b!537161 () Bool)

(assert (=> b!537161 (= e!311694 e!311691)))

(declare-fun res!332367 () Bool)

(assert (=> b!537161 (=> (not res!332367) (not e!311691))))

(declare-datatypes ((SeekEntryResult!4805 0))(
  ( (MissingZero!4805 (index!21444 (_ BitVec 32))) (Found!4805 (index!21445 (_ BitVec 32))) (Intermediate!4805 (undefined!5617 Bool) (index!21446 (_ BitVec 32)) (x!50380 (_ BitVec 32))) (Undefined!4805) (MissingVacant!4805 (index!21447 (_ BitVec 32))) )
))
(declare-fun lt!246318 () SeekEntryResult!4805)

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!537161 (= res!332367 (= lt!246318 (Intermediate!4805 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34016 (_ BitVec 32)) SeekEntryResult!4805)

(assert (=> b!537161 (= lt!246318 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16347 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537162 () Bool)

(declare-fun res!332374 () Bool)

(declare-fun e!311690 () Bool)

(assert (=> b!537162 (=> (not res!332374) (not e!311690))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537162 (= res!332374 (validKeyInArray!0 k!1998))))

(declare-fun b!537163 () Bool)

(declare-fun res!332365 () Bool)

(assert (=> b!537163 (=> (not res!332365) (not e!311694))))

(declare-datatypes ((List!10466 0))(
  ( (Nil!10463) (Cons!10462 (h!11405 (_ BitVec 64)) (t!16694 List!10466)) )
))
(declare-fun arrayNoDuplicates!0 (array!34016 (_ BitVec 32) List!10466) Bool)

(assert (=> b!537163 (= res!332365 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10463))))

(declare-fun b!537164 () Bool)

(assert (=> b!537164 (= e!311690 e!311694)))

(declare-fun res!332375 () Bool)

(assert (=> b!537164 (=> (not res!332375) (not e!311694))))

(declare-fun lt!246316 () SeekEntryResult!4805)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537164 (= res!332375 (or (= lt!246316 (MissingZero!4805 i!1153)) (= lt!246316 (MissingVacant!4805 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34016 (_ BitVec 32)) SeekEntryResult!4805)

(assert (=> b!537164 (= lt!246316 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537165 () Bool)

(declare-fun res!332366 () Bool)

(assert (=> b!537165 (=> (not res!332366) (not e!311690))))

(assert (=> b!537165 (= res!332366 (validKeyInArray!0 (select (arr!16347 a!3154) j!147)))))

(declare-fun b!537166 () Bool)

(assert (=> b!537166 (= e!311693 false)))

(declare-fun lt!246319 () SeekEntryResult!4805)

(assert (=> b!537166 (= lt!246319 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246317 (select (arr!16347 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!332363 () Bool)

(assert (=> start!48804 (=> (not res!332363) (not e!311690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48804 (= res!332363 (validMask!0 mask!3216))))

(assert (=> start!48804 e!311690))

(assert (=> start!48804 true))

(declare-fun array_inv!12143 (array!34016) Bool)

(assert (=> start!48804 (array_inv!12143 a!3154)))

(declare-fun b!537167 () Bool)

(declare-fun res!332373 () Bool)

(assert (=> b!537167 (=> (not res!332373) (not e!311691))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537167 (= res!332373 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16347 a!3154) j!147) mask!3216) (select (arr!16347 a!3154) j!147) a!3154 mask!3216) lt!246318))))

(declare-fun b!537168 () Bool)

(declare-fun res!332364 () Bool)

(assert (=> b!537168 (=> (not res!332364) (not e!311690))))

(declare-fun arrayContainsKey!0 (array!34016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537168 (= res!332364 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537169 () Bool)

(declare-fun res!332370 () Bool)

(assert (=> b!537169 (=> (not res!332370) (not e!311690))))

(assert (=> b!537169 (= res!332370 (and (= (size!16711 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16711 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16711 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537170 () Bool)

(declare-fun res!332369 () Bool)

(assert (=> b!537170 (=> (not res!332369) (not e!311694))))

(assert (=> b!537170 (= res!332369 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16711 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16711 a!3154)) (= (select (arr!16347 a!3154) resIndex!32) (select (arr!16347 a!3154) j!147))))))

(assert (= (and start!48804 res!332363) b!537169))

(assert (= (and b!537169 res!332370) b!537165))

(assert (= (and b!537165 res!332366) b!537162))

(assert (= (and b!537162 res!332374) b!537168))

(assert (= (and b!537168 res!332364) b!537164))

(assert (= (and b!537164 res!332375) b!537158))

(assert (= (and b!537158 res!332371) b!537163))

(assert (= (and b!537163 res!332365) b!537170))

(assert (= (and b!537170 res!332369) b!537161))

(assert (= (and b!537161 res!332367) b!537167))

(assert (= (and b!537167 res!332373) b!537160))

(assert (= (and b!537160 res!332368) b!537159))

(assert (= (and b!537159 res!332372) b!537166))

(declare-fun m!516441 () Bool)

(assert (=> b!537167 m!516441))

(assert (=> b!537167 m!516441))

(declare-fun m!516443 () Bool)

(assert (=> b!537167 m!516443))

(assert (=> b!537167 m!516443))

(assert (=> b!537167 m!516441))

(declare-fun m!516445 () Bool)

(assert (=> b!537167 m!516445))

(assert (=> b!537166 m!516441))

(assert (=> b!537166 m!516441))

(declare-fun m!516447 () Bool)

(assert (=> b!537166 m!516447))

(declare-fun m!516449 () Bool)

(assert (=> b!537168 m!516449))

(declare-fun m!516451 () Bool)

(assert (=> b!537163 m!516451))

(assert (=> b!537165 m!516441))

(assert (=> b!537165 m!516441))

(declare-fun m!516453 () Bool)

(assert (=> b!537165 m!516453))

(declare-fun m!516455 () Bool)

(assert (=> b!537170 m!516455))

(assert (=> b!537170 m!516441))

(declare-fun m!516457 () Bool)

(assert (=> b!537160 m!516457))

(assert (=> b!537160 m!516441))

(declare-fun m!516459 () Bool)

(assert (=> start!48804 m!516459))

(declare-fun m!516461 () Bool)

(assert (=> start!48804 m!516461))

(declare-fun m!516463 () Bool)

(assert (=> b!537164 m!516463))

(declare-fun m!516465 () Bool)

(assert (=> b!537162 m!516465))

(declare-fun m!516467 () Bool)

(assert (=> b!537159 m!516467))

(assert (=> b!537161 m!516441))

(assert (=> b!537161 m!516441))

(declare-fun m!516469 () Bool)

(assert (=> b!537161 m!516469))

(declare-fun m!516471 () Bool)

(assert (=> b!537158 m!516471))

(push 1)

