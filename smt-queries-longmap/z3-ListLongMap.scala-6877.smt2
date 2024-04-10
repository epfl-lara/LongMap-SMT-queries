; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86518 () Bool)

(assert start!86518)

(declare-fun b!1002381 () Bool)

(declare-fun res!671869 () Bool)

(declare-fun e!564707 () Bool)

(assert (=> b!1002381 (=> (not res!671869) (not e!564707))))

(declare-datatypes ((array!63319 0))(
  ( (array!63320 (arr!30485 (Array (_ BitVec 32) (_ BitVec 64))) (size!30987 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63319)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1002381 (= res!671869 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1002382 () Bool)

(declare-fun e!564709 () Bool)

(declare-fun e!564706 () Bool)

(assert (=> b!1002382 (= e!564709 e!564706)))

(declare-fun res!671864 () Bool)

(assert (=> b!1002382 (=> (not res!671864) (not e!564706))))

(declare-datatypes ((SeekEntryResult!9417 0))(
  ( (MissingZero!9417 (index!40039 (_ BitVec 32))) (Found!9417 (index!40040 (_ BitVec 32))) (Intermediate!9417 (undefined!10229 Bool) (index!40041 (_ BitVec 32)) (x!87453 (_ BitVec 32))) (Undefined!9417) (MissingVacant!9417 (index!40042 (_ BitVec 32))) )
))
(declare-fun lt!443150 () SeekEntryResult!9417)

(declare-fun lt!443149 () SeekEntryResult!9417)

(assert (=> b!1002382 (= res!671864 (= lt!443150 lt!443149))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63319 (_ BitVec 32)) SeekEntryResult!9417)

(assert (=> b!1002382 (= lt!443150 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30485 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002383 () Bool)

(declare-fun e!564710 () Bool)

(assert (=> b!1002383 (= e!564707 e!564710)))

(declare-fun res!671870 () Bool)

(assert (=> b!1002383 (=> (not res!671870) (not e!564710))))

(declare-fun lt!443151 () SeekEntryResult!9417)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1002383 (= res!671870 (or (= lt!443151 (MissingVacant!9417 i!1194)) (= lt!443151 (MissingZero!9417 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63319 (_ BitVec 32)) SeekEntryResult!9417)

(assert (=> b!1002383 (= lt!443151 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1002384 () Bool)

(declare-fun e!564708 () Bool)

(declare-fun e!564711 () Bool)

(assert (=> b!1002384 (= e!564708 e!564711)))

(declare-fun res!671859 () Bool)

(assert (=> b!1002384 (=> (not res!671859) (not e!564711))))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun lt!443152 () (_ BitVec 32))

(assert (=> b!1002384 (= res!671859 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443152 #b00000000000000000000000000000000) (bvslt lt!443152 (size!30987 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002384 (= lt!443152 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1002385 () Bool)

(declare-fun res!671872 () Bool)

(assert (=> b!1002385 (=> (not res!671872) (not e!564710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63319 (_ BitVec 32)) Bool)

(assert (=> b!1002385 (= res!671872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!671873 () Bool)

(assert (=> start!86518 (=> (not res!671873) (not e!564707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86518 (= res!671873 (validMask!0 mask!3464))))

(assert (=> start!86518 e!564707))

(declare-fun array_inv!23609 (array!63319) Bool)

(assert (=> start!86518 (array_inv!23609 a!3219)))

(assert (=> start!86518 true))

(declare-fun b!1002386 () Bool)

(declare-fun res!671874 () Bool)

(assert (=> b!1002386 (=> (not res!671874) (not e!564711))))

(assert (=> b!1002386 (= res!671874 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443152 (select (arr!30485 a!3219) j!170) a!3219 mask!3464) lt!443149))))

(declare-fun b!1002387 () Bool)

(declare-fun res!671861 () Bool)

(assert (=> b!1002387 (=> (not res!671861) (not e!564707))))

(assert (=> b!1002387 (= res!671861 (and (= (size!30987 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30987 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30987 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1002388 () Bool)

(declare-fun res!671863 () Bool)

(assert (=> b!1002388 (=> (not res!671863) (not e!564707))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1002388 (= res!671863 (validKeyInArray!0 k0!2224))))

(declare-fun b!1002389 () Bool)

(assert (=> b!1002389 (= e!564706 e!564708)))

(declare-fun res!671867 () Bool)

(assert (=> b!1002389 (=> (not res!671867) (not e!564708))))

(declare-fun lt!443153 () array!63319)

(declare-fun lt!443146 () (_ BitVec 64))

(declare-fun lt!443147 () SeekEntryResult!9417)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1002389 (= res!671867 (not (= lt!443147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443146 mask!3464) lt!443146 lt!443153 mask!3464))))))

(assert (=> b!1002389 (= lt!443146 (select (store (arr!30485 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1002389 (= lt!443153 (array!63320 (store (arr!30485 a!3219) i!1194 k0!2224) (size!30987 a!3219)))))

(declare-fun b!1002390 () Bool)

(declare-fun res!671860 () Bool)

(assert (=> b!1002390 (=> (not res!671860) (not e!564710))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1002390 (= res!671860 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30987 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30987 a!3219))))))

(declare-fun b!1002391 () Bool)

(assert (=> b!1002391 (= e!564710 e!564709)))

(declare-fun res!671865 () Bool)

(assert (=> b!1002391 (=> (not res!671865) (not e!564709))))

(assert (=> b!1002391 (= res!671865 (= lt!443147 lt!443149))))

(assert (=> b!1002391 (= lt!443149 (Intermediate!9417 false resIndex!38 resX!38))))

(assert (=> b!1002391 (= lt!443147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30485 a!3219) j!170) mask!3464) (select (arr!30485 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1002392 () Bool)

(assert (=> b!1002392 (= e!564711 false)))

(declare-fun lt!443148 () SeekEntryResult!9417)

(assert (=> b!1002392 (= lt!443148 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443152 lt!443146 lt!443153 mask!3464))))

(declare-fun b!1002393 () Bool)

(declare-fun res!671862 () Bool)

(assert (=> b!1002393 (=> (not res!671862) (not e!564710))))

(declare-datatypes ((List!21161 0))(
  ( (Nil!21158) (Cons!21157 (h!22334 (_ BitVec 64)) (t!30162 List!21161)) )
))
(declare-fun arrayNoDuplicates!0 (array!63319 (_ BitVec 32) List!21161) Bool)

(assert (=> b!1002393 (= res!671862 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21158))))

(declare-fun b!1002394 () Bool)

(declare-fun res!671871 () Bool)

(assert (=> b!1002394 (=> (not res!671871) (not e!564708))))

(assert (=> b!1002394 (= res!671871 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1002395 () Bool)

(declare-fun res!671868 () Bool)

(assert (=> b!1002395 (=> (not res!671868) (not e!564707))))

(assert (=> b!1002395 (= res!671868 (validKeyInArray!0 (select (arr!30485 a!3219) j!170)))))

(declare-fun b!1002396 () Bool)

(declare-fun res!671866 () Bool)

(assert (=> b!1002396 (=> (not res!671866) (not e!564708))))

(assert (=> b!1002396 (= res!671866 (not (= lt!443150 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443146 lt!443153 mask!3464))))))

(assert (= (and start!86518 res!671873) b!1002387))

(assert (= (and b!1002387 res!671861) b!1002395))

(assert (= (and b!1002395 res!671868) b!1002388))

(assert (= (and b!1002388 res!671863) b!1002381))

(assert (= (and b!1002381 res!671869) b!1002383))

(assert (= (and b!1002383 res!671870) b!1002385))

(assert (= (and b!1002385 res!671872) b!1002393))

(assert (= (and b!1002393 res!671862) b!1002390))

(assert (= (and b!1002390 res!671860) b!1002391))

(assert (= (and b!1002391 res!671865) b!1002382))

(assert (= (and b!1002382 res!671864) b!1002389))

(assert (= (and b!1002389 res!671867) b!1002396))

(assert (= (and b!1002396 res!671866) b!1002394))

(assert (= (and b!1002394 res!671871) b!1002384))

(assert (= (and b!1002384 res!671859) b!1002386))

(assert (= (and b!1002386 res!671874) b!1002392))

(declare-fun m!928269 () Bool)

(assert (=> b!1002391 m!928269))

(assert (=> b!1002391 m!928269))

(declare-fun m!928271 () Bool)

(assert (=> b!1002391 m!928271))

(assert (=> b!1002391 m!928271))

(assert (=> b!1002391 m!928269))

(declare-fun m!928273 () Bool)

(assert (=> b!1002391 m!928273))

(declare-fun m!928275 () Bool)

(assert (=> b!1002385 m!928275))

(declare-fun m!928277 () Bool)

(assert (=> b!1002392 m!928277))

(assert (=> b!1002382 m!928269))

(assert (=> b!1002382 m!928269))

(declare-fun m!928279 () Bool)

(assert (=> b!1002382 m!928279))

(declare-fun m!928281 () Bool)

(assert (=> b!1002388 m!928281))

(declare-fun m!928283 () Bool)

(assert (=> b!1002383 m!928283))

(declare-fun m!928285 () Bool)

(assert (=> b!1002384 m!928285))

(assert (=> b!1002386 m!928269))

(assert (=> b!1002386 m!928269))

(declare-fun m!928287 () Bool)

(assert (=> b!1002386 m!928287))

(declare-fun m!928289 () Bool)

(assert (=> b!1002389 m!928289))

(assert (=> b!1002389 m!928289))

(declare-fun m!928291 () Bool)

(assert (=> b!1002389 m!928291))

(declare-fun m!928293 () Bool)

(assert (=> b!1002389 m!928293))

(declare-fun m!928295 () Bool)

(assert (=> b!1002389 m!928295))

(assert (=> b!1002395 m!928269))

(assert (=> b!1002395 m!928269))

(declare-fun m!928297 () Bool)

(assert (=> b!1002395 m!928297))

(declare-fun m!928299 () Bool)

(assert (=> b!1002393 m!928299))

(declare-fun m!928301 () Bool)

(assert (=> start!86518 m!928301))

(declare-fun m!928303 () Bool)

(assert (=> start!86518 m!928303))

(declare-fun m!928305 () Bool)

(assert (=> b!1002396 m!928305))

(declare-fun m!928307 () Bool)

(assert (=> b!1002381 m!928307))

(check-sat (not b!1002391) (not b!1002384) (not b!1002396) (not start!86518) (not b!1002388) (not b!1002392) (not b!1002395) (not b!1002381) (not b!1002382) (not b!1002385) (not b!1002393) (not b!1002389) (not b!1002383) (not b!1002386))
(check-sat)
