; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68388 () Bool)

(assert start!68388)

(declare-fun b!794696 () Bool)

(declare-fun e!441214 () Bool)

(declare-fun e!441212 () Bool)

(assert (=> b!794696 (= e!441214 e!441212)))

(declare-fun res!539216 () Bool)

(assert (=> b!794696 (=> (not res!539216) (not e!441212))))

(declare-datatypes ((SeekEntryResult!8260 0))(
  ( (MissingZero!8260 (index!35408 (_ BitVec 32))) (Found!8260 (index!35409 (_ BitVec 32))) (Intermediate!8260 (undefined!9072 Bool) (index!35410 (_ BitVec 32)) (x!66330 (_ BitVec 32))) (Undefined!8260) (MissingVacant!8260 (index!35411 (_ BitVec 32))) )
))
(declare-fun lt!354250 () SeekEntryResult!8260)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794696 (= res!539216 (or (= lt!354250 (MissingZero!8260 i!1163)) (= lt!354250 (MissingVacant!8260 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43178 0))(
  ( (array!43179 (arr!20669 (Array (_ BitVec 32) (_ BitVec 64))) (size!21090 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43178)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43178 (_ BitVec 32)) SeekEntryResult!8260)

(assert (=> b!794696 (= lt!354250 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794698 () Bool)

(declare-fun res!539225 () Bool)

(assert (=> b!794698 (=> (not res!539225) (not e!441212))))

(declare-datatypes ((List!14632 0))(
  ( (Nil!14629) (Cons!14628 (h!15757 (_ BitVec 64)) (t!20947 List!14632)) )
))
(declare-fun arrayNoDuplicates!0 (array!43178 (_ BitVec 32) List!14632) Bool)

(assert (=> b!794698 (= res!539225 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14629))))

(declare-fun b!794699 () Bool)

(declare-fun res!539220 () Bool)

(assert (=> b!794699 (=> (not res!539220) (not e!441214))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794699 (= res!539220 (validKeyInArray!0 (select (arr!20669 a!3170) j!153)))))

(declare-fun b!794700 () Bool)

(declare-fun res!539215 () Bool)

(assert (=> b!794700 (=> (not res!539215) (not e!441212))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794700 (= res!539215 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21090 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20669 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21090 a!3170)) (= (select (arr!20669 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!539217 () Bool)

(assert (=> start!68388 (=> (not res!539217) (not e!441214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68388 (= res!539217 (validMask!0 mask!3266))))

(assert (=> start!68388 e!441214))

(assert (=> start!68388 true))

(declare-fun array_inv!16465 (array!43178) Bool)

(assert (=> start!68388 (array_inv!16465 a!3170)))

(declare-fun b!794697 () Bool)

(declare-fun res!539221 () Bool)

(assert (=> b!794697 (=> (not res!539221) (not e!441214))))

(declare-fun arrayContainsKey!0 (array!43178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794697 (= res!539221 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794701 () Bool)

(declare-fun e!441215 () Bool)

(assert (=> b!794701 (= e!441215 (bvslt mask!3266 #b00000000000000000000000000000000))))

(declare-fun b!794702 () Bool)

(declare-fun res!539218 () Bool)

(assert (=> b!794702 (=> (not res!539218) (not e!441214))))

(assert (=> b!794702 (= res!539218 (validKeyInArray!0 k!2044))))

(declare-fun b!794703 () Bool)

(declare-fun res!539219 () Bool)

(assert (=> b!794703 (=> (not res!539219) (not e!441215))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43178 (_ BitVec 32)) SeekEntryResult!8260)

(assert (=> b!794703 (= res!539219 (= (seekEntryOrOpen!0 (select (arr!20669 a!3170) j!153) a!3170 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20669 a!3170) j!153) a!3170 mask!3266)))))

(declare-fun b!794704 () Bool)

(assert (=> b!794704 (= e!441212 e!441215)))

(declare-fun res!539222 () Bool)

(assert (=> b!794704 (=> (not res!539222) (not e!441215))))

(declare-fun lt!354249 () array!43178)

(declare-fun lt!354251 () (_ BitVec 64))

(assert (=> b!794704 (= res!539222 (= (seekEntryOrOpen!0 lt!354251 lt!354249 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354251 lt!354249 mask!3266)))))

(assert (=> b!794704 (= lt!354251 (select (store (arr!20669 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794704 (= lt!354249 (array!43179 (store (arr!20669 a!3170) i!1163 k!2044) (size!21090 a!3170)))))

(declare-fun b!794705 () Bool)

(declare-fun res!539224 () Bool)

(assert (=> b!794705 (=> (not res!539224) (not e!441214))))

(assert (=> b!794705 (= res!539224 (and (= (size!21090 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21090 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21090 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794706 () Bool)

(declare-fun res!539223 () Bool)

(assert (=> b!794706 (=> (not res!539223) (not e!441212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43178 (_ BitVec 32)) Bool)

(assert (=> b!794706 (= res!539223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68388 res!539217) b!794705))

(assert (= (and b!794705 res!539224) b!794699))

(assert (= (and b!794699 res!539220) b!794702))

(assert (= (and b!794702 res!539218) b!794697))

(assert (= (and b!794697 res!539221) b!794696))

(assert (= (and b!794696 res!539216) b!794706))

(assert (= (and b!794706 res!539223) b!794698))

(assert (= (and b!794698 res!539225) b!794700))

(assert (= (and b!794700 res!539215) b!794704))

(assert (= (and b!794704 res!539222) b!794703))

(assert (= (and b!794703 res!539219) b!794701))

(declare-fun m!735253 () Bool)

(assert (=> b!794704 m!735253))

(declare-fun m!735255 () Bool)

(assert (=> b!794704 m!735255))

(declare-fun m!735257 () Bool)

(assert (=> b!794704 m!735257))

(declare-fun m!735259 () Bool)

(assert (=> b!794704 m!735259))

(declare-fun m!735261 () Bool)

(assert (=> start!68388 m!735261))

(declare-fun m!735263 () Bool)

(assert (=> start!68388 m!735263))

(declare-fun m!735265 () Bool)

(assert (=> b!794698 m!735265))

(declare-fun m!735267 () Bool)

(assert (=> b!794697 m!735267))

(declare-fun m!735269 () Bool)

(assert (=> b!794699 m!735269))

(assert (=> b!794699 m!735269))

(declare-fun m!735271 () Bool)

(assert (=> b!794699 m!735271))

(declare-fun m!735273 () Bool)

(assert (=> b!794700 m!735273))

(declare-fun m!735275 () Bool)

(assert (=> b!794700 m!735275))

(declare-fun m!735277 () Bool)

(assert (=> b!794696 m!735277))

(declare-fun m!735279 () Bool)

(assert (=> b!794702 m!735279))

(declare-fun m!735281 () Bool)

(assert (=> b!794706 m!735281))

(assert (=> b!794703 m!735269))

(assert (=> b!794703 m!735269))

(declare-fun m!735283 () Bool)

(assert (=> b!794703 m!735283))

(assert (=> b!794703 m!735269))

(declare-fun m!735285 () Bool)

(assert (=> b!794703 m!735285))

(push 1)

(assert (not b!794703))

(assert (not b!794697))

(assert (not b!794698))

(assert (not b!794704))

(assert (not b!794699))

(assert (not b!794706))

(assert (not b!794696))

(assert (not start!68388))

(assert (not b!794702))

