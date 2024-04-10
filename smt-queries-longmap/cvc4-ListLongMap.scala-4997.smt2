; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68496 () Bool)

(assert start!68496)

(declare-fun b!796379 () Bool)

(declare-fun res!540906 () Bool)

(declare-fun e!441905 () Bool)

(assert (=> b!796379 (=> (not res!540906) (not e!441905))))

(declare-datatypes ((array!43286 0))(
  ( (array!43287 (arr!20723 (Array (_ BitVec 32) (_ BitVec 64))) (size!21144 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43286)

(declare-datatypes ((List!14686 0))(
  ( (Nil!14683) (Cons!14682 (h!15811 (_ BitVec 64)) (t!21001 List!14686)) )
))
(declare-fun arrayNoDuplicates!0 (array!43286 (_ BitVec 32) List!14686) Bool)

(assert (=> b!796379 (= res!540906 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14683))))

(declare-fun b!796380 () Bool)

(declare-fun e!441907 () Bool)

(assert (=> b!796380 (= e!441907 e!441905)))

(declare-fun res!540907 () Bool)

(assert (=> b!796380 (=> (not res!540907) (not e!441905))))

(declare-datatypes ((SeekEntryResult!8314 0))(
  ( (MissingZero!8314 (index!35624 (_ BitVec 32))) (Found!8314 (index!35625 (_ BitVec 32))) (Intermediate!8314 (undefined!9126 Bool) (index!35626 (_ BitVec 32)) (x!66528 (_ BitVec 32))) (Undefined!8314) (MissingVacant!8314 (index!35627 (_ BitVec 32))) )
))
(declare-fun lt!355093 () SeekEntryResult!8314)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796380 (= res!540907 (or (= lt!355093 (MissingZero!8314 i!1163)) (= lt!355093 (MissingVacant!8314 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43286 (_ BitVec 32)) SeekEntryResult!8314)

(assert (=> b!796380 (= lt!355093 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796381 () Bool)

(declare-fun res!540898 () Bool)

(assert (=> b!796381 (=> (not res!540898) (not e!441905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43286 (_ BitVec 32)) Bool)

(assert (=> b!796381 (= res!540898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796382 () Bool)

(declare-fun e!441908 () Bool)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796382 (= e!441908 (not (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!355094 () SeekEntryResult!8314)

(assert (=> b!796382 (= lt!355094 (Found!8314 index!1236))))

(declare-fun b!796383 () Bool)

(declare-fun res!540904 () Bool)

(assert (=> b!796383 (=> (not res!540904) (not e!441907))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796383 (= res!540904 (validKeyInArray!0 (select (arr!20723 a!3170) j!153)))))

(declare-fun b!796384 () Bool)

(declare-fun res!540901 () Bool)

(assert (=> b!796384 (=> (not res!540901) (not e!441907))))

(assert (=> b!796384 (= res!540901 (and (= (size!21144 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21144 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21144 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796385 () Bool)

(declare-fun res!540900 () Bool)

(assert (=> b!796385 (=> (not res!540900) (not e!441907))))

(declare-fun arrayContainsKey!0 (array!43286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796385 (= res!540900 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796386 () Bool)

(declare-fun e!441904 () Bool)

(assert (=> b!796386 (= e!441905 e!441904)))

(declare-fun res!540905 () Bool)

(assert (=> b!796386 (=> (not res!540905) (not e!441904))))

(declare-fun lt!355091 () SeekEntryResult!8314)

(assert (=> b!796386 (= res!540905 (= lt!355091 lt!355094))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!355095 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355097 () array!43286)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43286 (_ BitVec 32)) SeekEntryResult!8314)

(assert (=> b!796386 (= lt!355094 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355095 lt!355097 mask!3266))))

(assert (=> b!796386 (= lt!355091 (seekEntryOrOpen!0 lt!355095 lt!355097 mask!3266))))

(assert (=> b!796386 (= lt!355095 (select (store (arr!20723 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796386 (= lt!355097 (array!43287 (store (arr!20723 a!3170) i!1163 k!2044) (size!21144 a!3170)))))

(declare-fun res!540902 () Bool)

(assert (=> start!68496 (=> (not res!540902) (not e!441907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68496 (= res!540902 (validMask!0 mask!3266))))

(assert (=> start!68496 e!441907))

(assert (=> start!68496 true))

(declare-fun array_inv!16519 (array!43286) Bool)

(assert (=> start!68496 (array_inv!16519 a!3170)))

(declare-fun b!796387 () Bool)

(declare-fun res!540903 () Bool)

(assert (=> b!796387 (=> (not res!540903) (not e!441907))))

(assert (=> b!796387 (= res!540903 (validKeyInArray!0 k!2044))))

(declare-fun b!796388 () Bool)

(assert (=> b!796388 (= e!441904 e!441908)))

(declare-fun res!540899 () Bool)

(assert (=> b!796388 (=> (not res!540899) (not e!441908))))

(declare-fun lt!355096 () SeekEntryResult!8314)

(declare-fun lt!355092 () SeekEntryResult!8314)

(assert (=> b!796388 (= res!540899 (and (= lt!355092 lt!355096) (= lt!355096 (Found!8314 j!153)) (= (select (arr!20723 a!3170) index!1236) (select (arr!20723 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796388 (= lt!355096 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20723 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796388 (= lt!355092 (seekEntryOrOpen!0 (select (arr!20723 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796389 () Bool)

(declare-fun res!540908 () Bool)

(assert (=> b!796389 (=> (not res!540908) (not e!441905))))

(assert (=> b!796389 (= res!540908 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21144 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20723 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21144 a!3170)) (= (select (arr!20723 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68496 res!540902) b!796384))

(assert (= (and b!796384 res!540901) b!796383))

(assert (= (and b!796383 res!540904) b!796387))

(assert (= (and b!796387 res!540903) b!796385))

(assert (= (and b!796385 res!540900) b!796380))

(assert (= (and b!796380 res!540907) b!796381))

(assert (= (and b!796381 res!540898) b!796379))

(assert (= (and b!796379 res!540906) b!796389))

(assert (= (and b!796389 res!540908) b!796386))

(assert (= (and b!796386 res!540905) b!796388))

(assert (= (and b!796388 res!540899) b!796382))

(declare-fun m!737159 () Bool)

(assert (=> b!796388 m!737159))

(declare-fun m!737161 () Bool)

(assert (=> b!796388 m!737161))

(assert (=> b!796388 m!737161))

(declare-fun m!737163 () Bool)

(assert (=> b!796388 m!737163))

(assert (=> b!796388 m!737161))

(declare-fun m!737165 () Bool)

(assert (=> b!796388 m!737165))

(declare-fun m!737167 () Bool)

(assert (=> b!796387 m!737167))

(declare-fun m!737169 () Bool)

(assert (=> b!796389 m!737169))

(declare-fun m!737171 () Bool)

(assert (=> b!796389 m!737171))

(declare-fun m!737173 () Bool)

(assert (=> b!796380 m!737173))

(declare-fun m!737175 () Bool)

(assert (=> b!796385 m!737175))

(assert (=> b!796383 m!737161))

(assert (=> b!796383 m!737161))

(declare-fun m!737177 () Bool)

(assert (=> b!796383 m!737177))

(declare-fun m!737179 () Bool)

(assert (=> b!796386 m!737179))

(declare-fun m!737181 () Bool)

(assert (=> b!796386 m!737181))

(declare-fun m!737183 () Bool)

(assert (=> b!796386 m!737183))

(declare-fun m!737185 () Bool)

(assert (=> b!796386 m!737185))

(declare-fun m!737187 () Bool)

(assert (=> b!796379 m!737187))

(declare-fun m!737189 () Bool)

(assert (=> b!796381 m!737189))

(declare-fun m!737191 () Bool)

(assert (=> start!68496 m!737191))

(declare-fun m!737193 () Bool)

(assert (=> start!68496 m!737193))

(push 1)

(assert (not b!796380))

(assert (not start!68496))

(assert (not b!796383))

(assert (not b!796386))

(assert (not b!796381))

(assert (not b!796388))

(assert (not b!796387))

(assert (not b!796379))

(assert (not b!796385))

(check-sat)

(pop 1)

(push 1)

(check-sat)

