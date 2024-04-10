; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49326 () Bool)

(assert start!49326)

(declare-fun b!543366 () Bool)

(declare-fun e!314277 () Bool)

(assert (=> b!543366 (= e!314277 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun lt!248153 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543366 (= lt!248153 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543367 () Bool)

(declare-fun res!337923 () Bool)

(declare-fun e!314275 () Bool)

(assert (=> b!543367 (=> (not res!337923) (not e!314275))))

(declare-datatypes ((array!34334 0))(
  ( (array!34335 (arr!16500 (Array (_ BitVec 32) (_ BitVec 64))) (size!16864 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34334)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34334 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543367 (= res!337923 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543369 () Bool)

(declare-fun res!337919 () Bool)

(assert (=> b!543369 (=> (not res!337919) (not e!314275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543369 (= res!337919 (validKeyInArray!0 k!1998))))

(declare-fun b!543370 () Bool)

(declare-fun res!337928 () Bool)

(assert (=> b!543370 (=> (not res!337928) (not e!314275))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543370 (= res!337928 (and (= (size!16864 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16864 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16864 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543371 () Bool)

(declare-fun res!337920 () Bool)

(assert (=> b!543371 (=> (not res!337920) (not e!314275))))

(assert (=> b!543371 (= res!337920 (validKeyInArray!0 (select (arr!16500 a!3154) j!147)))))

(declare-fun b!543372 () Bool)

(declare-fun res!337922 () Bool)

(declare-fun e!314274 () Bool)

(assert (=> b!543372 (=> (not res!337922) (not e!314274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34334 (_ BitVec 32)) Bool)

(assert (=> b!543372 (= res!337922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543373 () Bool)

(declare-fun res!337917 () Bool)

(assert (=> b!543373 (=> (not res!337917) (not e!314277))))

(assert (=> b!543373 (= res!337917 (and (not (= (select (arr!16500 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16500 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16500 a!3154) index!1177) (select (arr!16500 a!3154) j!147)))))))

(declare-fun b!543374 () Bool)

(declare-fun res!337925 () Bool)

(assert (=> b!543374 (=> (not res!337925) (not e!314277))))

(declare-datatypes ((SeekEntryResult!4958 0))(
  ( (MissingZero!4958 (index!22056 (_ BitVec 32))) (Found!4958 (index!22057 (_ BitVec 32))) (Intermediate!4958 (undefined!5770 Bool) (index!22058 (_ BitVec 32)) (x!50965 (_ BitVec 32))) (Undefined!4958) (MissingVacant!4958 (index!22059 (_ BitVec 32))) )
))
(declare-fun lt!248155 () SeekEntryResult!4958)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34334 (_ BitVec 32)) SeekEntryResult!4958)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543374 (= res!337925 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16500 a!3154) j!147) mask!3216) (select (arr!16500 a!3154) j!147) a!3154 mask!3216) lt!248155))))

(declare-fun b!543375 () Bool)

(declare-fun res!337926 () Bool)

(assert (=> b!543375 (=> (not res!337926) (not e!314274))))

(declare-datatypes ((List!10619 0))(
  ( (Nil!10616) (Cons!10615 (h!11570 (_ BitVec 64)) (t!16847 List!10619)) )
))
(declare-fun arrayNoDuplicates!0 (array!34334 (_ BitVec 32) List!10619) Bool)

(assert (=> b!543375 (= res!337926 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10616))))

(declare-fun res!337921 () Bool)

(assert (=> start!49326 (=> (not res!337921) (not e!314275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49326 (= res!337921 (validMask!0 mask!3216))))

(assert (=> start!49326 e!314275))

(assert (=> start!49326 true))

(declare-fun array_inv!12296 (array!34334) Bool)

(assert (=> start!49326 (array_inv!12296 a!3154)))

(declare-fun b!543368 () Bool)

(declare-fun res!337927 () Bool)

(assert (=> b!543368 (=> (not res!337927) (not e!314274))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543368 (= res!337927 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16864 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16864 a!3154)) (= (select (arr!16500 a!3154) resIndex!32) (select (arr!16500 a!3154) j!147))))))

(declare-fun b!543376 () Bool)

(assert (=> b!543376 (= e!314274 e!314277)))

(declare-fun res!337924 () Bool)

(assert (=> b!543376 (=> (not res!337924) (not e!314277))))

(assert (=> b!543376 (= res!337924 (= lt!248155 (Intermediate!4958 false resIndex!32 resX!32)))))

(assert (=> b!543376 (= lt!248155 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16500 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543377 () Bool)

(assert (=> b!543377 (= e!314275 e!314274)))

(declare-fun res!337918 () Bool)

(assert (=> b!543377 (=> (not res!337918) (not e!314274))))

(declare-fun lt!248154 () SeekEntryResult!4958)

(assert (=> b!543377 (= res!337918 (or (= lt!248154 (MissingZero!4958 i!1153)) (= lt!248154 (MissingVacant!4958 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34334 (_ BitVec 32)) SeekEntryResult!4958)

(assert (=> b!543377 (= lt!248154 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!49326 res!337921) b!543370))

(assert (= (and b!543370 res!337928) b!543371))

(assert (= (and b!543371 res!337920) b!543369))

(assert (= (and b!543369 res!337919) b!543367))

(assert (= (and b!543367 res!337923) b!543377))

(assert (= (and b!543377 res!337918) b!543372))

(assert (= (and b!543372 res!337922) b!543375))

(assert (= (and b!543375 res!337926) b!543368))

(assert (= (and b!543368 res!337927) b!543376))

(assert (= (and b!543376 res!337924) b!543374))

(assert (= (and b!543374 res!337925) b!543373))

(assert (= (and b!543373 res!337917) b!543366))

(declare-fun m!521469 () Bool)

(assert (=> b!543376 m!521469))

(assert (=> b!543376 m!521469))

(declare-fun m!521471 () Bool)

(assert (=> b!543376 m!521471))

(declare-fun m!521473 () Bool)

(assert (=> b!543366 m!521473))

(declare-fun m!521475 () Bool)

(assert (=> b!543375 m!521475))

(assert (=> b!543374 m!521469))

(assert (=> b!543374 m!521469))

(declare-fun m!521477 () Bool)

(assert (=> b!543374 m!521477))

(assert (=> b!543374 m!521477))

(assert (=> b!543374 m!521469))

(declare-fun m!521479 () Bool)

(assert (=> b!543374 m!521479))

(declare-fun m!521481 () Bool)

(assert (=> b!543368 m!521481))

(assert (=> b!543368 m!521469))

(assert (=> b!543371 m!521469))

(assert (=> b!543371 m!521469))

(declare-fun m!521483 () Bool)

(assert (=> b!543371 m!521483))

(declare-fun m!521485 () Bool)

(assert (=> b!543377 m!521485))

(declare-fun m!521487 () Bool)

(assert (=> b!543369 m!521487))

(declare-fun m!521489 () Bool)

(assert (=> b!543367 m!521489))

(declare-fun m!521491 () Bool)

(assert (=> b!543373 m!521491))

(assert (=> b!543373 m!521469))

(declare-fun m!521493 () Bool)

(assert (=> start!49326 m!521493))

(declare-fun m!521495 () Bool)

(assert (=> start!49326 m!521495))

(declare-fun m!521497 () Bool)

(assert (=> b!543372 m!521497))

(push 1)

