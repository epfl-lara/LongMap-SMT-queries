; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45806 () Bool)

(assert start!45806)

(declare-fun b!507186 () Bool)

(declare-fun e!296822 () Bool)

(declare-fun e!296819 () Bool)

(assert (=> b!507186 (= e!296822 e!296819)))

(declare-fun res!308207 () Bool)

(assert (=> b!507186 (=> (not res!308207) (not e!296819))))

(declare-datatypes ((SeekEntryResult!4084 0))(
  ( (MissingZero!4084 (index!18524 (_ BitVec 32))) (Found!4084 (index!18525 (_ BitVec 32))) (Intermediate!4084 (undefined!4896 Bool) (index!18526 (_ BitVec 32)) (x!47666 (_ BitVec 32))) (Undefined!4084) (MissingVacant!4084 (index!18527 (_ BitVec 32))) )
))
(declare-fun lt!231578 () SeekEntryResult!4084)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507186 (= res!308207 (or (= lt!231578 (MissingZero!4084 i!1204)) (= lt!231578 (MissingVacant!4084 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32563 0))(
  ( (array!32564 (arr!15661 (Array (_ BitVec 32) (_ BitVec 64))) (size!16025 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32563)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32563 (_ BitVec 32)) SeekEntryResult!4084)

(assert (=> b!507186 (= lt!231578 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507187 () Bool)

(declare-fun e!296818 () Bool)

(declare-fun e!296820 () Bool)

(assert (=> b!507187 (= e!296818 e!296820)))

(declare-fun res!308209 () Bool)

(assert (=> b!507187 (=> res!308209 e!296820)))

(declare-fun lt!231580 () Bool)

(declare-fun lt!231584 () SeekEntryResult!4084)

(assert (=> b!507187 (= res!308209 (or (and (not lt!231580) (undefined!4896 lt!231584)) (and (not lt!231580) (not (undefined!4896 lt!231584)))))))

(get-info :version)

(assert (=> b!507187 (= lt!231580 (not ((_ is Intermediate!4084) lt!231584)))))

(declare-fun b!507188 () Bool)

(declare-fun res!308199 () Bool)

(assert (=> b!507188 (=> (not res!308199) (not e!296822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507188 (= res!308199 (validKeyInArray!0 k0!2280))))

(declare-fun b!507189 () Bool)

(assert (=> b!507189 (= e!296820 true)))

(declare-fun lt!231585 () array!32563)

(declare-fun lt!231582 () (_ BitVec 64))

(declare-fun lt!231586 () SeekEntryResult!4084)

(assert (=> b!507189 (= lt!231586 (seekEntryOrOpen!0 lt!231582 lt!231585 mask!3524))))

(assert (=> b!507189 false))

(declare-fun b!507190 () Bool)

(declare-fun res!308201 () Bool)

(assert (=> b!507190 (=> (not res!308201) (not e!296819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32563 (_ BitVec 32)) Bool)

(assert (=> b!507190 (= res!308201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507191 () Bool)

(declare-fun res!308202 () Bool)

(assert (=> b!507191 (=> (not res!308202) (not e!296822))))

(declare-fun arrayContainsKey!0 (array!32563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507191 (= res!308202 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507192 () Bool)

(declare-fun res!308208 () Bool)

(assert (=> b!507192 (=> (not res!308208) (not e!296819))))

(declare-datatypes ((List!9726 0))(
  ( (Nil!9723) (Cons!9722 (h!10599 (_ BitVec 64)) (t!15946 List!9726)) )
))
(declare-fun arrayNoDuplicates!0 (array!32563 (_ BitVec 32) List!9726) Bool)

(assert (=> b!507192 (= res!308208 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9723))))

(declare-fun b!507193 () Bool)

(declare-fun res!308200 () Bool)

(assert (=> b!507193 (=> (not res!308200) (not e!296822))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507193 (= res!308200 (validKeyInArray!0 (select (arr!15661 a!3235) j!176)))))

(declare-fun b!507194 () Bool)

(declare-fun res!308206 () Bool)

(assert (=> b!507194 (=> (not res!308206) (not e!296822))))

(assert (=> b!507194 (= res!308206 (and (= (size!16025 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16025 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16025 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507195 () Bool)

(assert (=> b!507195 (= e!296819 (not e!296818))))

(declare-fun res!308205 () Bool)

(assert (=> b!507195 (=> res!308205 e!296818)))

(declare-fun lt!231581 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32563 (_ BitVec 32)) SeekEntryResult!4084)

(assert (=> b!507195 (= res!308205 (= lt!231584 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231581 lt!231582 lt!231585 mask!3524)))))

(declare-fun lt!231583 () (_ BitVec 32))

(assert (=> b!507195 (= lt!231584 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231583 (select (arr!15661 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507195 (= lt!231581 (toIndex!0 lt!231582 mask!3524))))

(assert (=> b!507195 (= lt!231582 (select (store (arr!15661 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507195 (= lt!231583 (toIndex!0 (select (arr!15661 a!3235) j!176) mask!3524))))

(assert (=> b!507195 (= lt!231585 (array!32564 (store (arr!15661 a!3235) i!1204 k0!2280) (size!16025 a!3235)))))

(declare-fun e!296823 () Bool)

(assert (=> b!507195 e!296823))

(declare-fun res!308203 () Bool)

(assert (=> b!507195 (=> (not res!308203) (not e!296823))))

(assert (=> b!507195 (= res!308203 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15517 0))(
  ( (Unit!15518) )
))
(declare-fun lt!231579 () Unit!15517)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32563 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15517)

(assert (=> b!507195 (= lt!231579 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507196 () Bool)

(assert (=> b!507196 (= e!296823 (= (seekEntryOrOpen!0 (select (arr!15661 a!3235) j!176) a!3235 mask!3524) (Found!4084 j!176)))))

(declare-fun res!308204 () Bool)

(assert (=> start!45806 (=> (not res!308204) (not e!296822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45806 (= res!308204 (validMask!0 mask!3524))))

(assert (=> start!45806 e!296822))

(assert (=> start!45806 true))

(declare-fun array_inv!11520 (array!32563) Bool)

(assert (=> start!45806 (array_inv!11520 a!3235)))

(assert (= (and start!45806 res!308204) b!507194))

(assert (= (and b!507194 res!308206) b!507193))

(assert (= (and b!507193 res!308200) b!507188))

(assert (= (and b!507188 res!308199) b!507191))

(assert (= (and b!507191 res!308202) b!507186))

(assert (= (and b!507186 res!308207) b!507190))

(assert (= (and b!507190 res!308201) b!507192))

(assert (= (and b!507192 res!308208) b!507195))

(assert (= (and b!507195 res!308203) b!507196))

(assert (= (and b!507195 (not res!308205)) b!507187))

(assert (= (and b!507187 (not res!308209)) b!507189))

(declare-fun m!488173 () Bool)

(assert (=> b!507191 m!488173))

(declare-fun m!488175 () Bool)

(assert (=> b!507190 m!488175))

(declare-fun m!488177 () Bool)

(assert (=> start!45806 m!488177))

(declare-fun m!488179 () Bool)

(assert (=> start!45806 m!488179))

(declare-fun m!488181 () Bool)

(assert (=> b!507195 m!488181))

(declare-fun m!488183 () Bool)

(assert (=> b!507195 m!488183))

(declare-fun m!488185 () Bool)

(assert (=> b!507195 m!488185))

(declare-fun m!488187 () Bool)

(assert (=> b!507195 m!488187))

(declare-fun m!488189 () Bool)

(assert (=> b!507195 m!488189))

(assert (=> b!507195 m!488187))

(declare-fun m!488191 () Bool)

(assert (=> b!507195 m!488191))

(declare-fun m!488193 () Bool)

(assert (=> b!507195 m!488193))

(declare-fun m!488195 () Bool)

(assert (=> b!507195 m!488195))

(declare-fun m!488197 () Bool)

(assert (=> b!507195 m!488197))

(assert (=> b!507195 m!488187))

(declare-fun m!488199 () Bool)

(assert (=> b!507189 m!488199))

(declare-fun m!488201 () Bool)

(assert (=> b!507188 m!488201))

(declare-fun m!488203 () Bool)

(assert (=> b!507186 m!488203))

(assert (=> b!507193 m!488187))

(assert (=> b!507193 m!488187))

(declare-fun m!488205 () Bool)

(assert (=> b!507193 m!488205))

(assert (=> b!507196 m!488187))

(assert (=> b!507196 m!488187))

(declare-fun m!488207 () Bool)

(assert (=> b!507196 m!488207))

(declare-fun m!488209 () Bool)

(assert (=> b!507192 m!488209))

(check-sat (not b!507190) (not start!45806) (not b!507189) (not b!507195) (not b!507191) (not b!507196) (not b!507192) (not b!507188) (not b!507193) (not b!507186))
(check-sat)
