; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48754 () Bool)

(assert start!48754)

(declare-fun b!536183 () Bool)

(declare-fun res!331395 () Bool)

(declare-fun e!311318 () Bool)

(assert (=> b!536183 (=> (not res!331395) (not e!311318))))

(declare-datatypes ((array!33966 0))(
  ( (array!33967 (arr!16322 (Array (_ BitVec 32) (_ BitVec 64))) (size!16686 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33966)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536183 (= res!331395 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536184 () Bool)

(declare-fun res!331390 () Bool)

(declare-fun e!311315 () Bool)

(assert (=> b!536184 (=> (not res!331390) (not e!311315))))

(declare-datatypes ((List!10441 0))(
  ( (Nil!10438) (Cons!10437 (h!11380 (_ BitVec 64)) (t!16669 List!10441)) )
))
(declare-fun arrayNoDuplicates!0 (array!33966 (_ BitVec 32) List!10441) Bool)

(assert (=> b!536184 (= res!331390 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10438))))

(declare-fun b!536185 () Bool)

(declare-fun res!331391 () Bool)

(assert (=> b!536185 (=> (not res!331391) (not e!311315))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33966 (_ BitVec 32)) Bool)

(assert (=> b!536185 (= res!331391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536186 () Bool)

(declare-fun res!331389 () Bool)

(declare-fun e!311317 () Bool)

(assert (=> b!536186 (=> (not res!331389) (not e!311317))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4780 0))(
  ( (MissingZero!4780 (index!21344 (_ BitVec 32))) (Found!4780 (index!21345 (_ BitVec 32))) (Intermediate!4780 (undefined!5592 Bool) (index!21346 (_ BitVec 32)) (x!50283 (_ BitVec 32))) (Undefined!4780) (MissingVacant!4780 (index!21347 (_ BitVec 32))) )
))
(declare-fun lt!246016 () SeekEntryResult!4780)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33966 (_ BitVec 32)) SeekEntryResult!4780)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536186 (= res!331389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16322 a!3154) j!147) mask!3216) (select (arr!16322 a!3154) j!147) a!3154 mask!3216) lt!246016))))

(declare-fun b!536187 () Bool)

(declare-fun res!331394 () Bool)

(assert (=> b!536187 (=> (not res!331394) (not e!311318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536187 (= res!331394 (validKeyInArray!0 k!1998))))

(declare-fun b!536188 () Bool)

(assert (=> b!536188 (= e!311315 e!311317)))

(declare-fun res!331399 () Bool)

(assert (=> b!536188 (=> (not res!331399) (not e!311317))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536188 (= res!331399 (= lt!246016 (Intermediate!4780 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!536188 (= lt!246016 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16322 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536190 () Bool)

(declare-fun res!331392 () Bool)

(assert (=> b!536190 (=> (not res!331392) (not e!311318))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536190 (= res!331392 (and (= (size!16686 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16686 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16686 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536191 () Bool)

(declare-fun res!331400 () Bool)

(assert (=> b!536191 (=> (not res!331400) (not e!311317))))

(assert (=> b!536191 (= res!331400 (and (not (= (select (arr!16322 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16322 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16322 a!3154) index!1177) (select (arr!16322 a!3154) j!147)))))))

(declare-fun b!536192 () Bool)

(declare-fun e!311316 () Bool)

(assert (=> b!536192 (= e!311316 false)))

(declare-fun lt!246019 () SeekEntryResult!4780)

(declare-fun lt!246018 () (_ BitVec 32))

(assert (=> b!536192 (= lt!246019 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246018 (select (arr!16322 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536193 () Bool)

(declare-fun res!331397 () Bool)

(assert (=> b!536193 (=> (not res!331397) (not e!311318))))

(assert (=> b!536193 (= res!331397 (validKeyInArray!0 (select (arr!16322 a!3154) j!147)))))

(declare-fun b!536194 () Bool)

(assert (=> b!536194 (= e!311318 e!311315)))

(declare-fun res!331393 () Bool)

(assert (=> b!536194 (=> (not res!331393) (not e!311315))))

(declare-fun lt!246017 () SeekEntryResult!4780)

(assert (=> b!536194 (= res!331393 (or (= lt!246017 (MissingZero!4780 i!1153)) (= lt!246017 (MissingVacant!4780 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33966 (_ BitVec 32)) SeekEntryResult!4780)

(assert (=> b!536194 (= lt!246017 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536195 () Bool)

(assert (=> b!536195 (= e!311317 e!311316)))

(declare-fun res!331398 () Bool)

(assert (=> b!536195 (=> (not res!331398) (not e!311316))))

(assert (=> b!536195 (= res!331398 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246018 #b00000000000000000000000000000000) (bvslt lt!246018 (size!16686 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536195 (= lt!246018 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536189 () Bool)

(declare-fun res!331396 () Bool)

(assert (=> b!536189 (=> (not res!331396) (not e!311315))))

(assert (=> b!536189 (= res!331396 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16686 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16686 a!3154)) (= (select (arr!16322 a!3154) resIndex!32) (select (arr!16322 a!3154) j!147))))))

(declare-fun res!331388 () Bool)

(assert (=> start!48754 (=> (not res!331388) (not e!311318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48754 (= res!331388 (validMask!0 mask!3216))))

(assert (=> start!48754 e!311318))

(assert (=> start!48754 true))

(declare-fun array_inv!12118 (array!33966) Bool)

(assert (=> start!48754 (array_inv!12118 a!3154)))

(assert (= (and start!48754 res!331388) b!536190))

(assert (= (and b!536190 res!331392) b!536193))

(assert (= (and b!536193 res!331397) b!536187))

(assert (= (and b!536187 res!331394) b!536183))

(assert (= (and b!536183 res!331395) b!536194))

(assert (= (and b!536194 res!331393) b!536185))

(assert (= (and b!536185 res!331391) b!536184))

(assert (= (and b!536184 res!331390) b!536189))

(assert (= (and b!536189 res!331396) b!536188))

(assert (= (and b!536188 res!331399) b!536186))

(assert (= (and b!536186 res!331389) b!536191))

(assert (= (and b!536191 res!331400) b!536195))

(assert (= (and b!536195 res!331398) b!536192))

(declare-fun m!515641 () Bool)

(assert (=> b!536191 m!515641))

(declare-fun m!515643 () Bool)

(assert (=> b!536191 m!515643))

(assert (=> b!536193 m!515643))

(assert (=> b!536193 m!515643))

(declare-fun m!515645 () Bool)

(assert (=> b!536193 m!515645))

(assert (=> b!536186 m!515643))

(assert (=> b!536186 m!515643))

(declare-fun m!515647 () Bool)

(assert (=> b!536186 m!515647))

(assert (=> b!536186 m!515647))

(assert (=> b!536186 m!515643))

(declare-fun m!515649 () Bool)

(assert (=> b!536186 m!515649))

(declare-fun m!515651 () Bool)

(assert (=> b!536189 m!515651))

(assert (=> b!536189 m!515643))

(declare-fun m!515653 () Bool)

(assert (=> b!536185 m!515653))

(declare-fun m!515655 () Bool)

(assert (=> b!536194 m!515655))

(declare-fun m!515657 () Bool)

(assert (=> b!536195 m!515657))

(declare-fun m!515659 () Bool)

(assert (=> b!536187 m!515659))

(assert (=> b!536192 m!515643))

(assert (=> b!536192 m!515643))

(declare-fun m!515661 () Bool)

(assert (=> b!536192 m!515661))

(assert (=> b!536188 m!515643))

(assert (=> b!536188 m!515643))

(declare-fun m!515663 () Bool)

(assert (=> b!536188 m!515663))

(declare-fun m!515665 () Bool)

(assert (=> b!536184 m!515665))

(declare-fun m!515667 () Bool)

(assert (=> b!536183 m!515667))

(declare-fun m!515669 () Bool)

(assert (=> start!48754 m!515669))

(declare-fun m!515671 () Bool)

(assert (=> start!48754 m!515671))

(push 1)

(assert (not b!536188))

(assert (not b!536192))

(assert (not b!536183))

(assert (not b!536186))

(assert (not b!536185))

(assert (not b!536184))

(assert (not b!536187))

(assert (not b!536195))

