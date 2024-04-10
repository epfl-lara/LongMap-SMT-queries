; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69206 () Bool)

(assert start!69206)

(declare-fun b!807239 () Bool)

(declare-fun res!551363 () Bool)

(declare-fun e!446959 () Bool)

(assert (=> b!807239 (=> (not res!551363) (not e!446959))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807239 (= res!551363 (validKeyInArray!0 k!2044))))

(declare-fun b!807240 () Bool)

(declare-fun res!551366 () Bool)

(assert (=> b!807240 (=> (not res!551366) (not e!446959))))

(declare-datatypes ((array!43906 0))(
  ( (array!43907 (arr!21030 (Array (_ BitVec 32) (_ BitVec 64))) (size!21451 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43906)

(declare-fun arrayContainsKey!0 (array!43906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807240 (= res!551366 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807241 () Bool)

(declare-fun e!446960 () Bool)

(assert (=> b!807241 (= e!446960 false)))

(declare-fun lt!361625 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807241 (= lt!361625 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!551364 () Bool)

(assert (=> start!69206 (=> (not res!551364) (not e!446959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69206 (= res!551364 (validMask!0 mask!3266))))

(assert (=> start!69206 e!446959))

(assert (=> start!69206 true))

(declare-fun array_inv!16826 (array!43906) Bool)

(assert (=> start!69206 (array_inv!16826 a!3170)))

(declare-fun b!807242 () Bool)

(declare-fun e!446962 () Bool)

(declare-fun e!446961 () Bool)

(assert (=> b!807242 (= e!446962 e!446961)))

(declare-fun res!551362 () Bool)

(assert (=> b!807242 (=> (not res!551362) (not e!446961))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361623 () (_ BitVec 64))

(declare-fun lt!361620 () array!43906)

(declare-datatypes ((SeekEntryResult!8621 0))(
  ( (MissingZero!8621 (index!36852 (_ BitVec 32))) (Found!8621 (index!36853 (_ BitVec 32))) (Intermediate!8621 (undefined!9433 Bool) (index!36854 (_ BitVec 32)) (x!67665 (_ BitVec 32))) (Undefined!8621) (MissingVacant!8621 (index!36855 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43906 (_ BitVec 32)) SeekEntryResult!8621)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43906 (_ BitVec 32)) SeekEntryResult!8621)

(assert (=> b!807242 (= res!551362 (= (seekEntryOrOpen!0 lt!361623 lt!361620 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361623 lt!361620 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807242 (= lt!361623 (select (store (arr!21030 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807242 (= lt!361620 (array!43907 (store (arr!21030 a!3170) i!1163 k!2044) (size!21451 a!3170)))))

(declare-fun b!807243 () Bool)

(declare-fun res!551370 () Bool)

(assert (=> b!807243 (=> (not res!551370) (not e!446959))))

(assert (=> b!807243 (= res!551370 (validKeyInArray!0 (select (arr!21030 a!3170) j!153)))))

(declare-fun b!807244 () Bool)

(declare-fun res!551368 () Bool)

(assert (=> b!807244 (=> (not res!551368) (not e!446962))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807244 (= res!551368 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21451 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21030 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21451 a!3170)) (= (select (arr!21030 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807245 () Bool)

(declare-fun res!551371 () Bool)

(assert (=> b!807245 (=> (not res!551371) (not e!446962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43906 (_ BitVec 32)) Bool)

(assert (=> b!807245 (= res!551371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807246 () Bool)

(assert (=> b!807246 (= e!446961 e!446960)))

(declare-fun res!551365 () Bool)

(assert (=> b!807246 (=> (not res!551365) (not e!446960))))

(declare-fun lt!361621 () SeekEntryResult!8621)

(declare-fun lt!361624 () SeekEntryResult!8621)

(assert (=> b!807246 (= res!551365 (and (= lt!361624 lt!361621) (= lt!361621 (Found!8621 j!153)) (not (= (select (arr!21030 a!3170) index!1236) (select (arr!21030 a!3170) j!153)))))))

(assert (=> b!807246 (= lt!361621 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21030 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807246 (= lt!361624 (seekEntryOrOpen!0 (select (arr!21030 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807247 () Bool)

(assert (=> b!807247 (= e!446959 e!446962)))

(declare-fun res!551372 () Bool)

(assert (=> b!807247 (=> (not res!551372) (not e!446962))))

(declare-fun lt!361622 () SeekEntryResult!8621)

(assert (=> b!807247 (= res!551372 (or (= lt!361622 (MissingZero!8621 i!1163)) (= lt!361622 (MissingVacant!8621 i!1163))))))

(assert (=> b!807247 (= lt!361622 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!807248 () Bool)

(declare-fun res!551367 () Bool)

(assert (=> b!807248 (=> (not res!551367) (not e!446962))))

(declare-datatypes ((List!14993 0))(
  ( (Nil!14990) (Cons!14989 (h!16118 (_ BitVec 64)) (t!21308 List!14993)) )
))
(declare-fun arrayNoDuplicates!0 (array!43906 (_ BitVec 32) List!14993) Bool)

(assert (=> b!807248 (= res!551367 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14990))))

(declare-fun b!807249 () Bool)

(declare-fun res!551369 () Bool)

(assert (=> b!807249 (=> (not res!551369) (not e!446959))))

(assert (=> b!807249 (= res!551369 (and (= (size!21451 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21451 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21451 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69206 res!551364) b!807249))

(assert (= (and b!807249 res!551369) b!807243))

(assert (= (and b!807243 res!551370) b!807239))

(assert (= (and b!807239 res!551363) b!807240))

(assert (= (and b!807240 res!551366) b!807247))

(assert (= (and b!807247 res!551372) b!807245))

(assert (= (and b!807245 res!551371) b!807248))

(assert (= (and b!807248 res!551367) b!807244))

(assert (= (and b!807244 res!551368) b!807242))

(assert (= (and b!807242 res!551362) b!807246))

(assert (= (and b!807246 res!551365) b!807241))

(declare-fun m!749243 () Bool)

(assert (=> start!69206 m!749243))

(declare-fun m!749245 () Bool)

(assert (=> start!69206 m!749245))

(declare-fun m!749247 () Bool)

(assert (=> b!807246 m!749247))

(declare-fun m!749249 () Bool)

(assert (=> b!807246 m!749249))

(assert (=> b!807246 m!749249))

(declare-fun m!749251 () Bool)

(assert (=> b!807246 m!749251))

(assert (=> b!807246 m!749249))

(declare-fun m!749253 () Bool)

(assert (=> b!807246 m!749253))

(declare-fun m!749255 () Bool)

(assert (=> b!807241 m!749255))

(declare-fun m!749257 () Bool)

(assert (=> b!807242 m!749257))

(declare-fun m!749259 () Bool)

(assert (=> b!807242 m!749259))

(declare-fun m!749261 () Bool)

(assert (=> b!807242 m!749261))

(declare-fun m!749263 () Bool)

(assert (=> b!807242 m!749263))

(declare-fun m!749265 () Bool)

(assert (=> b!807248 m!749265))

(declare-fun m!749267 () Bool)

(assert (=> b!807244 m!749267))

(declare-fun m!749269 () Bool)

(assert (=> b!807244 m!749269))

(declare-fun m!749271 () Bool)

(assert (=> b!807247 m!749271))

(assert (=> b!807243 m!749249))

(assert (=> b!807243 m!749249))

(declare-fun m!749273 () Bool)

(assert (=> b!807243 m!749273))

(declare-fun m!749275 () Bool)

(assert (=> b!807240 m!749275))

(declare-fun m!749277 () Bool)

(assert (=> b!807245 m!749277))

(declare-fun m!749279 () Bool)

(assert (=> b!807239 m!749279))

(push 1)

