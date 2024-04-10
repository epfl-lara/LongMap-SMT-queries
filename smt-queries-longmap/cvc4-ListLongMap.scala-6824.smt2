; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!85896 () Bool)

(assert start!85896)

(declare-fun b!995588 () Bool)

(declare-fun res!665883 () Bool)

(declare-fun e!561801 () Bool)

(assert (=> b!995588 (=> (not res!665883) (not e!561801))))

(declare-datatypes ((array!62985 0))(
  ( (array!62986 (arr!30327 (Array (_ BitVec 32) (_ BitVec 64))) (size!30829 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62985)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62985 (_ BitVec 32)) Bool)

(assert (=> b!995588 (= res!665883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995589 () Bool)

(declare-fun res!665879 () Bool)

(assert (=> b!995589 (=> (not res!665879) (not e!561801))))

(declare-datatypes ((List!21003 0))(
  ( (Nil!21000) (Cons!20999 (h!22161 (_ BitVec 64)) (t!30004 List!21003)) )
))
(declare-fun arrayNoDuplicates!0 (array!62985 (_ BitVec 32) List!21003) Bool)

(assert (=> b!995589 (= res!665879 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21000))))

(declare-fun b!995590 () Bool)

(declare-fun res!665880 () Bool)

(declare-fun e!561800 () Bool)

(assert (=> b!995590 (=> (not res!665880) (not e!561800))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995590 (= res!665880 (validKeyInArray!0 (select (arr!30327 a!3219) j!170)))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun b!995591 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!995591 (= e!561801 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30829 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30829 a!3219)) (bvslt mask!3464 #b00000000000000000000000000000000)))))

(declare-fun res!665881 () Bool)

(assert (=> start!85896 (=> (not res!665881) (not e!561800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85896 (= res!665881 (validMask!0 mask!3464))))

(assert (=> start!85896 e!561800))

(declare-fun array_inv!23451 (array!62985) Bool)

(assert (=> start!85896 (array_inv!23451 a!3219)))

(assert (=> start!85896 true))

(declare-fun b!995592 () Bool)

(assert (=> b!995592 (= e!561800 e!561801)))

(declare-fun res!665885 () Bool)

(assert (=> b!995592 (=> (not res!665885) (not e!561801))))

(declare-datatypes ((SeekEntryResult!9259 0))(
  ( (MissingZero!9259 (index!39407 (_ BitVec 32))) (Found!9259 (index!39408 (_ BitVec 32))) (Intermediate!9259 (undefined!10071 Bool) (index!39409 (_ BitVec 32)) (x!86844 (_ BitVec 32))) (Undefined!9259) (MissingVacant!9259 (index!39410 (_ BitVec 32))) )
))
(declare-fun lt!440996 () SeekEntryResult!9259)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995592 (= res!665885 (or (= lt!440996 (MissingVacant!9259 i!1194)) (= lt!440996 (MissingZero!9259 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62985 (_ BitVec 32)) SeekEntryResult!9259)

(assert (=> b!995592 (= lt!440996 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!995593 () Bool)

(declare-fun res!665884 () Bool)

(assert (=> b!995593 (=> (not res!665884) (not e!561800))))

(assert (=> b!995593 (= res!665884 (and (= (size!30829 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30829 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30829 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995594 () Bool)

(declare-fun res!665882 () Bool)

(assert (=> b!995594 (=> (not res!665882) (not e!561800))))

(assert (=> b!995594 (= res!665882 (validKeyInArray!0 k!2224))))

(declare-fun b!995595 () Bool)

(declare-fun res!665886 () Bool)

(assert (=> b!995595 (=> (not res!665886) (not e!561800))))

(declare-fun arrayContainsKey!0 (array!62985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995595 (= res!665886 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!85896 res!665881) b!995593))

(assert (= (and b!995593 res!665884) b!995590))

(assert (= (and b!995590 res!665880) b!995594))

(assert (= (and b!995594 res!665882) b!995595))

(assert (= (and b!995595 res!665886) b!995592))

(assert (= (and b!995592 res!665885) b!995588))

(assert (= (and b!995588 res!665883) b!995589))

(assert (= (and b!995589 res!665879) b!995591))

(declare-fun m!922961 () Bool)

(assert (=> b!995595 m!922961))

(declare-fun m!922963 () Bool)

(assert (=> b!995594 m!922963))

(declare-fun m!922965 () Bool)

(assert (=> start!85896 m!922965))

(declare-fun m!922967 () Bool)

(assert (=> start!85896 m!922967))

(declare-fun m!922969 () Bool)

(assert (=> b!995589 m!922969))

(declare-fun m!922971 () Bool)

(assert (=> b!995592 m!922971))

(declare-fun m!922973 () Bool)

(assert (=> b!995588 m!922973))

(declare-fun m!922975 () Bool)

(assert (=> b!995590 m!922975))

(assert (=> b!995590 m!922975))

(declare-fun m!922977 () Bool)

(assert (=> b!995590 m!922977))

(push 1)

(assert (not b!995589))

(assert (not b!995592))

(assert (not start!85896))

(assert (not b!995588))

(assert (not b!995590))

(assert (not b!995595))

(assert (not b!995594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

