; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86926 () Bool)

(assert start!86926)

(declare-fun b!1008221 () Bool)

(declare-fun e!567320 () Bool)

(declare-fun e!567322 () Bool)

(assert (=> b!1008221 (= e!567320 e!567322)))

(declare-fun res!677118 () Bool)

(assert (=> b!1008221 (=> (not res!677118) (not e!567322))))

(declare-datatypes ((SeekEntryResult!9540 0))(
  ( (MissingZero!9540 (index!40531 (_ BitVec 32))) (Found!9540 (index!40532 (_ BitVec 32))) (Intermediate!9540 (undefined!10352 Bool) (index!40533 (_ BitVec 32)) (x!87922 (_ BitVec 32))) (Undefined!9540) (MissingVacant!9540 (index!40534 (_ BitVec 32))) )
))
(declare-fun lt!445592 () SeekEntryResult!9540)

(declare-fun lt!445595 () SeekEntryResult!9540)

(assert (=> b!1008221 (= res!677118 (= lt!445592 lt!445595))))

(declare-datatypes ((array!63574 0))(
  ( (array!63575 (arr!30608 (Array (_ BitVec 32) (_ BitVec 64))) (size!31110 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63574)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63574 (_ BitVec 32)) SeekEntryResult!9540)

(assert (=> b!1008221 (= lt!445592 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30608 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008222 () Bool)

(declare-fun res!677121 () Bool)

(declare-fun e!567325 () Bool)

(assert (=> b!1008222 (=> (not res!677121) (not e!567325))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008222 (= res!677121 (and (= (size!31110 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31110 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31110 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008223 () Bool)

(declare-fun res!677114 () Bool)

(assert (=> b!1008223 (=> (not res!677114) (not e!567325))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008223 (= res!677114 (validKeyInArray!0 k0!2224))))

(declare-fun b!1008224 () Bool)

(declare-fun e!567323 () Bool)

(assert (=> b!1008224 (= e!567325 e!567323)))

(declare-fun res!677125 () Bool)

(assert (=> b!1008224 (=> (not res!677125) (not e!567323))))

(declare-fun lt!445590 () SeekEntryResult!9540)

(assert (=> b!1008224 (= res!677125 (or (= lt!445590 (MissingVacant!9540 i!1194)) (= lt!445590 (MissingZero!9540 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63574 (_ BitVec 32)) SeekEntryResult!9540)

(assert (=> b!1008224 (= lt!445590 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1008225 () Bool)

(declare-fun e!567324 () Bool)

(assert (=> b!1008225 (= e!567322 e!567324)))

(declare-fun res!677127 () Bool)

(assert (=> b!1008225 (=> (not res!677127) (not e!567324))))

(declare-fun lt!445594 () (_ BitVec 64))

(declare-fun lt!445589 () array!63574)

(declare-fun lt!445591 () SeekEntryResult!9540)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008225 (= res!677127 (not (= lt!445591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445594 mask!3464) lt!445594 lt!445589 mask!3464))))))

(assert (=> b!1008225 (= lt!445594 (select (store (arr!30608 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008225 (= lt!445589 (array!63575 (store (arr!30608 a!3219) i!1194 k0!2224) (size!31110 a!3219)))))

(declare-fun b!1008226 () Bool)

(declare-fun res!677126 () Bool)

(assert (=> b!1008226 (=> (not res!677126) (not e!567323))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008226 (= res!677126 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31110 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31110 a!3219))))))

(declare-fun b!1008228 () Bool)

(declare-fun res!677123 () Bool)

(assert (=> b!1008228 (=> (not res!677123) (not e!567325))))

(assert (=> b!1008228 (= res!677123 (validKeyInArray!0 (select (arr!30608 a!3219) j!170)))))

(declare-fun b!1008229 () Bool)

(declare-fun res!677115 () Bool)

(assert (=> b!1008229 (=> (not res!677115) (not e!567323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63574 (_ BitVec 32)) Bool)

(assert (=> b!1008229 (= res!677115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008230 () Bool)

(declare-fun res!677120 () Bool)

(assert (=> b!1008230 (=> (not res!677120) (not e!567323))))

(declare-datatypes ((List!21284 0))(
  ( (Nil!21281) (Cons!21280 (h!22466 (_ BitVec 64)) (t!30285 List!21284)) )
))
(declare-fun arrayNoDuplicates!0 (array!63574 (_ BitVec 32) List!21284) Bool)

(assert (=> b!1008230 (= res!677120 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21281))))

(declare-fun b!1008231 () Bool)

(declare-fun res!677119 () Bool)

(assert (=> b!1008231 (=> (not res!677119) (not e!567324))))

(assert (=> b!1008231 (= res!677119 (not (= lt!445592 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445594 lt!445589 mask!3464))))))

(declare-fun b!1008232 () Bool)

(declare-fun res!677116 () Bool)

(assert (=> b!1008232 (=> (not res!677116) (not e!567324))))

(assert (=> b!1008232 (= res!677116 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008233 () Bool)

(assert (=> b!1008233 (= e!567323 e!567320)))

(declare-fun res!677124 () Bool)

(assert (=> b!1008233 (=> (not res!677124) (not e!567320))))

(assert (=> b!1008233 (= res!677124 (= lt!445591 lt!445595))))

(assert (=> b!1008233 (= lt!445595 (Intermediate!9540 false resIndex!38 resX!38))))

(assert (=> b!1008233 (= lt!445591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30608 a!3219) j!170) mask!3464) (select (arr!30608 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008234 () Bool)

(assert (=> b!1008234 (= e!567324 false)))

(declare-fun lt!445593 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008234 (= lt!445593 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!677122 () Bool)

(assert (=> start!86926 (=> (not res!677122) (not e!567325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86926 (= res!677122 (validMask!0 mask!3464))))

(assert (=> start!86926 e!567325))

(declare-fun array_inv!23732 (array!63574) Bool)

(assert (=> start!86926 (array_inv!23732 a!3219)))

(assert (=> start!86926 true))

(declare-fun b!1008227 () Bool)

(declare-fun res!677117 () Bool)

(assert (=> b!1008227 (=> (not res!677117) (not e!567325))))

(declare-fun arrayContainsKey!0 (array!63574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008227 (= res!677117 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86926 res!677122) b!1008222))

(assert (= (and b!1008222 res!677121) b!1008228))

(assert (= (and b!1008228 res!677123) b!1008223))

(assert (= (and b!1008223 res!677114) b!1008227))

(assert (= (and b!1008227 res!677117) b!1008224))

(assert (= (and b!1008224 res!677125) b!1008229))

(assert (= (and b!1008229 res!677115) b!1008230))

(assert (= (and b!1008230 res!677120) b!1008226))

(assert (= (and b!1008226 res!677126) b!1008233))

(assert (= (and b!1008233 res!677124) b!1008221))

(assert (= (and b!1008221 res!677118) b!1008225))

(assert (= (and b!1008225 res!677127) b!1008231))

(assert (= (and b!1008231 res!677119) b!1008232))

(assert (= (and b!1008232 res!677116) b!1008234))

(declare-fun m!932999 () Bool)

(assert (=> b!1008230 m!932999))

(declare-fun m!933001 () Bool)

(assert (=> b!1008233 m!933001))

(assert (=> b!1008233 m!933001))

(declare-fun m!933003 () Bool)

(assert (=> b!1008233 m!933003))

(assert (=> b!1008233 m!933003))

(assert (=> b!1008233 m!933001))

(declare-fun m!933005 () Bool)

(assert (=> b!1008233 m!933005))

(declare-fun m!933007 () Bool)

(assert (=> b!1008234 m!933007))

(assert (=> b!1008228 m!933001))

(assert (=> b!1008228 m!933001))

(declare-fun m!933009 () Bool)

(assert (=> b!1008228 m!933009))

(declare-fun m!933011 () Bool)

(assert (=> start!86926 m!933011))

(declare-fun m!933013 () Bool)

(assert (=> start!86926 m!933013))

(assert (=> b!1008221 m!933001))

(assert (=> b!1008221 m!933001))

(declare-fun m!933015 () Bool)

(assert (=> b!1008221 m!933015))

(declare-fun m!933017 () Bool)

(assert (=> b!1008231 m!933017))

(declare-fun m!933019 () Bool)

(assert (=> b!1008229 m!933019))

(declare-fun m!933021 () Bool)

(assert (=> b!1008225 m!933021))

(assert (=> b!1008225 m!933021))

(declare-fun m!933023 () Bool)

(assert (=> b!1008225 m!933023))

(declare-fun m!933025 () Bool)

(assert (=> b!1008225 m!933025))

(declare-fun m!933027 () Bool)

(assert (=> b!1008225 m!933027))

(declare-fun m!933029 () Bool)

(assert (=> b!1008227 m!933029))

(declare-fun m!933031 () Bool)

(assert (=> b!1008224 m!933031))

(declare-fun m!933033 () Bool)

(assert (=> b!1008223 m!933033))

(check-sat (not b!1008230) (not b!1008224) (not b!1008233) (not b!1008231) (not b!1008234) (not b!1008225) (not b!1008229) (not b!1008223) (not start!86926) (not b!1008228) (not b!1008221) (not b!1008227))
(check-sat)
