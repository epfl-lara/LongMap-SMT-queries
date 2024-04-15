; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87036 () Bool)

(assert start!87036)

(declare-fun b!1009296 () Bool)

(declare-fun e!567859 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1009296 (= e!567859 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvslt (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000)))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445936 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009296 (= lt!445936 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!677960 () Bool)

(declare-fun e!567857 () Bool)

(assert (=> start!87036 (=> (not res!677960) (not e!567857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87036 (= res!677960 (validMask!0 mask!3464))))

(assert (=> start!87036 e!567857))

(declare-datatypes ((array!63550 0))(
  ( (array!63551 (arr!30594 (Array (_ BitVec 32) (_ BitVec 64))) (size!31098 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63550)

(declare-fun array_inv!23737 (array!63550) Bool)

(assert (=> start!87036 (array_inv!23737 a!3219)))

(assert (=> start!87036 true))

(declare-fun b!1009297 () Bool)

(declare-fun res!677958 () Bool)

(assert (=> b!1009297 (=> (not res!677958) (not e!567857))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1009297 (= res!677958 (validKeyInArray!0 (select (arr!30594 a!3219) j!170)))))

(declare-fun b!1009298 () Bool)

(declare-fun e!567856 () Bool)

(assert (=> b!1009298 (= e!567856 e!567859)))

(declare-fun res!677966 () Bool)

(assert (=> b!1009298 (=> (not res!677966) (not e!567859))))

(declare-fun lt!445934 () array!63550)

(declare-datatypes ((SeekEntryResult!9551 0))(
  ( (MissingZero!9551 (index!40575 (_ BitVec 32))) (Found!9551 (index!40576 (_ BitVec 32))) (Intermediate!9551 (undefined!10363 Bool) (index!40577 (_ BitVec 32)) (x!87991 (_ BitVec 32))) (Undefined!9551) (MissingVacant!9551 (index!40578 (_ BitVec 32))) )
))
(declare-fun lt!445937 () SeekEntryResult!9551)

(declare-fun lt!445933 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63550 (_ BitVec 32)) SeekEntryResult!9551)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1009298 (= res!677966 (not (= lt!445937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445933 mask!3464) lt!445933 lt!445934 mask!3464))))))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1009298 (= lt!445933 (select (store (arr!30594 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1009298 (= lt!445934 (array!63551 (store (arr!30594 a!3219) i!1194 k0!2224) (size!31098 a!3219)))))

(declare-fun b!1009299 () Bool)

(declare-fun res!677963 () Bool)

(declare-fun e!567858 () Bool)

(assert (=> b!1009299 (=> (not res!677963) (not e!567858))))

(declare-datatypes ((List!21336 0))(
  ( (Nil!21333) (Cons!21332 (h!22521 (_ BitVec 64)) (t!30328 List!21336)) )
))
(declare-fun arrayNoDuplicates!0 (array!63550 (_ BitVec 32) List!21336) Bool)

(assert (=> b!1009299 (= res!677963 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21333))))

(declare-fun b!1009300 () Bool)

(declare-fun res!677953 () Bool)

(assert (=> b!1009300 (=> (not res!677953) (not e!567858))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1009300 (= res!677953 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31098 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31098 a!3219))))))

(declare-fun b!1009301 () Bool)

(declare-fun res!677954 () Bool)

(assert (=> b!1009301 (=> (not res!677954) (not e!567857))))

(assert (=> b!1009301 (= res!677954 (validKeyInArray!0 k0!2224))))

(declare-fun b!1009302 () Bool)

(declare-fun res!677955 () Bool)

(assert (=> b!1009302 (=> (not res!677955) (not e!567857))))

(assert (=> b!1009302 (= res!677955 (and (= (size!31098 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31098 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31098 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1009303 () Bool)

(assert (=> b!1009303 (= e!567857 e!567858)))

(declare-fun res!677964 () Bool)

(assert (=> b!1009303 (=> (not res!677964) (not e!567858))))

(declare-fun lt!445935 () SeekEntryResult!9551)

(assert (=> b!1009303 (= res!677964 (or (= lt!445935 (MissingVacant!9551 i!1194)) (= lt!445935 (MissingZero!9551 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63550 (_ BitVec 32)) SeekEntryResult!9551)

(assert (=> b!1009303 (= lt!445935 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1009304 () Bool)

(declare-fun res!677957 () Bool)

(assert (=> b!1009304 (=> (not res!677957) (not e!567857))))

(declare-fun arrayContainsKey!0 (array!63550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1009304 (= res!677957 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1009305 () Bool)

(declare-fun res!677961 () Bool)

(assert (=> b!1009305 (=> (not res!677961) (not e!567858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63550 (_ BitVec 32)) Bool)

(assert (=> b!1009305 (= res!677961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1009306 () Bool)

(declare-fun res!677965 () Bool)

(assert (=> b!1009306 (=> (not res!677965) (not e!567859))))

(declare-fun lt!445938 () SeekEntryResult!9551)

(assert (=> b!1009306 (= res!677965 (not (= lt!445938 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445933 lt!445934 mask!3464))))))

(declare-fun b!1009307 () Bool)

(declare-fun e!567855 () Bool)

(assert (=> b!1009307 (= e!567855 e!567856)))

(declare-fun res!677956 () Bool)

(assert (=> b!1009307 (=> (not res!677956) (not e!567856))))

(declare-fun lt!445939 () SeekEntryResult!9551)

(assert (=> b!1009307 (= res!677956 (= lt!445938 lt!445939))))

(assert (=> b!1009307 (= lt!445938 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30594 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009308 () Bool)

(assert (=> b!1009308 (= e!567858 e!567855)))

(declare-fun res!677959 () Bool)

(assert (=> b!1009308 (=> (not res!677959) (not e!567855))))

(assert (=> b!1009308 (= res!677959 (= lt!445937 lt!445939))))

(assert (=> b!1009308 (= lt!445939 (Intermediate!9551 false resIndex!38 resX!38))))

(assert (=> b!1009308 (= lt!445937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30594 a!3219) j!170) mask!3464) (select (arr!30594 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009309 () Bool)

(declare-fun res!677962 () Bool)

(assert (=> b!1009309 (=> (not res!677962) (not e!567859))))

(assert (=> b!1009309 (= res!677962 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(assert (= (and start!87036 res!677960) b!1009302))

(assert (= (and b!1009302 res!677955) b!1009297))

(assert (= (and b!1009297 res!677958) b!1009301))

(assert (= (and b!1009301 res!677954) b!1009304))

(assert (= (and b!1009304 res!677957) b!1009303))

(assert (= (and b!1009303 res!677964) b!1009305))

(assert (= (and b!1009305 res!677961) b!1009299))

(assert (= (and b!1009299 res!677963) b!1009300))

(assert (= (and b!1009300 res!677953) b!1009308))

(assert (= (and b!1009308 res!677959) b!1009307))

(assert (= (and b!1009307 res!677956) b!1009298))

(assert (= (and b!1009298 res!677966) b!1009306))

(assert (= (and b!1009306 res!677965) b!1009309))

(assert (= (and b!1009309 res!677962) b!1009296))

(declare-fun m!933343 () Bool)

(assert (=> b!1009299 m!933343))

(declare-fun m!933345 () Bool)

(assert (=> b!1009306 m!933345))

(declare-fun m!933347 () Bool)

(assert (=> b!1009298 m!933347))

(assert (=> b!1009298 m!933347))

(declare-fun m!933349 () Bool)

(assert (=> b!1009298 m!933349))

(declare-fun m!933351 () Bool)

(assert (=> b!1009298 m!933351))

(declare-fun m!933353 () Bool)

(assert (=> b!1009298 m!933353))

(declare-fun m!933355 () Bool)

(assert (=> b!1009307 m!933355))

(assert (=> b!1009307 m!933355))

(declare-fun m!933357 () Bool)

(assert (=> b!1009307 m!933357))

(declare-fun m!933359 () Bool)

(assert (=> b!1009304 m!933359))

(assert (=> b!1009297 m!933355))

(assert (=> b!1009297 m!933355))

(declare-fun m!933361 () Bool)

(assert (=> b!1009297 m!933361))

(declare-fun m!933363 () Bool)

(assert (=> b!1009301 m!933363))

(assert (=> b!1009308 m!933355))

(assert (=> b!1009308 m!933355))

(declare-fun m!933365 () Bool)

(assert (=> b!1009308 m!933365))

(assert (=> b!1009308 m!933365))

(assert (=> b!1009308 m!933355))

(declare-fun m!933367 () Bool)

(assert (=> b!1009308 m!933367))

(declare-fun m!933369 () Bool)

(assert (=> b!1009305 m!933369))

(declare-fun m!933371 () Bool)

(assert (=> b!1009303 m!933371))

(declare-fun m!933373 () Bool)

(assert (=> start!87036 m!933373))

(declare-fun m!933375 () Bool)

(assert (=> start!87036 m!933375))

(declare-fun m!933377 () Bool)

(assert (=> b!1009296 m!933377))

(check-sat (not b!1009303) (not b!1009298) (not b!1009308) (not b!1009304) (not b!1009306) (not start!87036) (not b!1009307) (not b!1009297) (not b!1009305) (not b!1009299) (not b!1009301) (not b!1009296))
(check-sat)
