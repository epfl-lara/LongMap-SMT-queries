; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86454 () Bool)

(assert start!86454)

(declare-fun b!1000930 () Bool)

(declare-fun res!670417 () Bool)

(declare-fun e!564065 () Bool)

(assert (=> b!1000930 (=> (not res!670417) (not e!564065))))

(declare-datatypes ((array!63255 0))(
  ( (array!63256 (arr!30453 (Array (_ BitVec 32) (_ BitVec 64))) (size!30955 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63255)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9385 0))(
  ( (MissingZero!9385 (index!39911 (_ BitVec 32))) (Found!9385 (index!39912 (_ BitVec 32))) (Intermediate!9385 (undefined!10197 Bool) (index!39913 (_ BitVec 32)) (x!87333 (_ BitVec 32))) (Undefined!9385) (MissingVacant!9385 (index!39914 (_ BitVec 32))) )
))
(declare-fun lt!442435 () SeekEntryResult!9385)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63255 (_ BitVec 32)) SeekEntryResult!9385)

(assert (=> b!1000930 (= res!670417 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30453 a!3219) j!170) a!3219 mask!3464) lt!442435))))

(declare-fun b!1000931 () Bool)

(declare-fun e!564064 () Bool)

(assert (=> b!1000931 (= e!564064 e!564065)))

(declare-fun res!670409 () Bool)

(assert (=> b!1000931 (=> (not res!670409) (not e!564065))))

(declare-fun lt!442434 () SeekEntryResult!9385)

(assert (=> b!1000931 (= res!670409 (= lt!442434 lt!442435))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1000931 (= lt!442435 (Intermediate!9385 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1000931 (= lt!442434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30453 a!3219) j!170) mask!3464) (select (arr!30453 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!670416 () Bool)

(declare-fun e!564067 () Bool)

(assert (=> start!86454 (=> (not res!670416) (not e!564067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86454 (= res!670416 (validMask!0 mask!3464))))

(assert (=> start!86454 e!564067))

(declare-fun array_inv!23577 (array!63255) Bool)

(assert (=> start!86454 (array_inv!23577 a!3219)))

(assert (=> start!86454 true))

(declare-fun b!1000932 () Bool)

(declare-fun res!670413 () Bool)

(assert (=> b!1000932 (=> (not res!670413) (not e!564067))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1000932 (= res!670413 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1000933 () Bool)

(assert (=> b!1000933 (= e!564067 e!564064)))

(declare-fun res!670410 () Bool)

(assert (=> b!1000933 (=> (not res!670410) (not e!564064))))

(declare-fun lt!442438 () SeekEntryResult!9385)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1000933 (= res!670410 (or (= lt!442438 (MissingVacant!9385 i!1194)) (= lt!442438 (MissingZero!9385 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63255 (_ BitVec 32)) SeekEntryResult!9385)

(assert (=> b!1000933 (= lt!442438 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1000934 () Bool)

(declare-fun res!670414 () Bool)

(assert (=> b!1000934 (=> (not res!670414) (not e!564067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1000934 (= res!670414 (validKeyInArray!0 (select (arr!30453 a!3219) j!170)))))

(declare-fun b!1000935 () Bool)

(declare-fun res!670411 () Bool)

(assert (=> b!1000935 (=> (not res!670411) (not e!564064))))

(declare-datatypes ((List!21129 0))(
  ( (Nil!21126) (Cons!21125 (h!22302 (_ BitVec 64)) (t!30130 List!21129)) )
))
(declare-fun arrayNoDuplicates!0 (array!63255 (_ BitVec 32) List!21129) Bool)

(assert (=> b!1000935 (= res!670411 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21126))))

(declare-fun b!1000936 () Bool)

(declare-fun res!670418 () Bool)

(assert (=> b!1000936 (=> (not res!670418) (not e!564067))))

(assert (=> b!1000936 (= res!670418 (and (= (size!30955 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30955 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30955 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1000937 () Bool)

(declare-fun e!564063 () Bool)

(assert (=> b!1000937 (= e!564063 false)))

(declare-fun lt!442436 () array!63255)

(declare-fun lt!442437 () SeekEntryResult!9385)

(declare-fun lt!442439 () (_ BitVec 64))

(assert (=> b!1000937 (= lt!442437 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!442439 lt!442436 mask!3464))))

(declare-fun b!1000938 () Bool)

(assert (=> b!1000938 (= e!564065 e!564063)))

(declare-fun res!670415 () Bool)

(assert (=> b!1000938 (=> (not res!670415) (not e!564063))))

(assert (=> b!1000938 (= res!670415 (not (= lt!442434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!442439 mask!3464) lt!442439 lt!442436 mask!3464))))))

(assert (=> b!1000938 (= lt!442439 (select (store (arr!30453 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1000938 (= lt!442436 (array!63256 (store (arr!30453 a!3219) i!1194 k!2224) (size!30955 a!3219)))))

(declare-fun b!1000939 () Bool)

(declare-fun res!670412 () Bool)

(assert (=> b!1000939 (=> (not res!670412) (not e!564067))))

(assert (=> b!1000939 (= res!670412 (validKeyInArray!0 k!2224))))

(declare-fun b!1000940 () Bool)

(declare-fun res!670408 () Bool)

(assert (=> b!1000940 (=> (not res!670408) (not e!564064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63255 (_ BitVec 32)) Bool)

(assert (=> b!1000940 (= res!670408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1000941 () Bool)

(declare-fun res!670419 () Bool)

(assert (=> b!1000941 (=> (not res!670419) (not e!564064))))

(assert (=> b!1000941 (= res!670419 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30955 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30955 a!3219))))))

(assert (= (and start!86454 res!670416) b!1000936))

(assert (= (and b!1000936 res!670418) b!1000934))

(assert (= (and b!1000934 res!670414) b!1000939))

(assert (= (and b!1000939 res!670412) b!1000932))

(assert (= (and b!1000932 res!670413) b!1000933))

(assert (= (and b!1000933 res!670410) b!1000940))

(assert (= (and b!1000940 res!670408) b!1000935))

(assert (= (and b!1000935 res!670411) b!1000941))

(assert (= (and b!1000941 res!670419) b!1000931))

(assert (= (and b!1000931 res!670409) b!1000930))

(assert (= (and b!1000930 res!670417) b!1000938))

(assert (= (and b!1000938 res!670415) b!1000937))

(declare-fun m!927049 () Bool)

(assert (=> b!1000933 m!927049))

(declare-fun m!927051 () Bool)

(assert (=> b!1000938 m!927051))

(assert (=> b!1000938 m!927051))

(declare-fun m!927053 () Bool)

(assert (=> b!1000938 m!927053))

(declare-fun m!927055 () Bool)

(assert (=> b!1000938 m!927055))

(declare-fun m!927057 () Bool)

(assert (=> b!1000938 m!927057))

(declare-fun m!927059 () Bool)

(assert (=> start!86454 m!927059))

(declare-fun m!927061 () Bool)

(assert (=> start!86454 m!927061))

(declare-fun m!927063 () Bool)

(assert (=> b!1000934 m!927063))

(assert (=> b!1000934 m!927063))

(declare-fun m!927065 () Bool)

(assert (=> b!1000934 m!927065))

(assert (=> b!1000930 m!927063))

(assert (=> b!1000930 m!927063))

(declare-fun m!927067 () Bool)

(assert (=> b!1000930 m!927067))

(declare-fun m!927069 () Bool)

(assert (=> b!1000939 m!927069))

(assert (=> b!1000931 m!927063))

(assert (=> b!1000931 m!927063))

(declare-fun m!927071 () Bool)

(assert (=> b!1000931 m!927071))

(assert (=> b!1000931 m!927071))

(assert (=> b!1000931 m!927063))

(declare-fun m!927073 () Bool)

(assert (=> b!1000931 m!927073))

(declare-fun m!927075 () Bool)

(assert (=> b!1000937 m!927075))

(declare-fun m!927077 () Bool)

(assert (=> b!1000935 m!927077))

(declare-fun m!927079 () Bool)

(assert (=> b!1000940 m!927079))

(declare-fun m!927081 () Bool)

(assert (=> b!1000932 m!927081))

(push 1)

