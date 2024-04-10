; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86876 () Bool)

(assert start!86876)

(declare-fun b!1007171 () Bool)

(declare-fun e!566875 () Bool)

(declare-fun e!566873 () Bool)

(assert (=> b!1007171 (= e!566875 e!566873)))

(declare-fun res!676067 () Bool)

(assert (=> b!1007171 (=> (not res!676067) (not e!566873))))

(declare-datatypes ((array!63524 0))(
  ( (array!63525 (arr!30583 (Array (_ BitVec 32) (_ BitVec 64))) (size!31085 (_ BitVec 32))) )
))
(declare-fun lt!445065 () array!63524)

(declare-fun lt!445064 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9515 0))(
  ( (MissingZero!9515 (index!40431 (_ BitVec 32))) (Found!9515 (index!40432 (_ BitVec 32))) (Intermediate!9515 (undefined!10327 Bool) (index!40433 (_ BitVec 32)) (x!87833 (_ BitVec 32))) (Undefined!9515) (MissingVacant!9515 (index!40434 (_ BitVec 32))) )
))
(declare-fun lt!445067 () SeekEntryResult!9515)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63524 (_ BitVec 32)) SeekEntryResult!9515)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007171 (= res!676067 (not (= lt!445067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445064 mask!3464) lt!445064 lt!445065 mask!3464))))))

(declare-fun a!3219 () array!63524)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1007171 (= lt!445064 (select (store (arr!30583 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1007171 (= lt!445065 (array!63525 (store (arr!30583 a!3219) i!1194 k!2224) (size!31085 a!3219)))))

(declare-fun b!1007172 () Bool)

(declare-fun res!676069 () Bool)

(declare-fun e!566872 () Bool)

(assert (=> b!1007172 (=> (not res!676069) (not e!566872))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1007172 (= res!676069 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31085 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31085 a!3219))))))

(declare-fun b!1007173 () Bool)

(declare-fun res!676072 () Bool)

(assert (=> b!1007173 (=> (not res!676072) (not e!566873))))

(declare-fun lt!445069 () SeekEntryResult!9515)

(assert (=> b!1007173 (= res!676072 (not (= lt!445069 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445064 lt!445065 mask!3464))))))

(declare-fun b!1007174 () Bool)

(declare-fun res!676066 () Bool)

(declare-fun e!566870 () Bool)

(assert (=> b!1007174 (=> (not res!676066) (not e!566870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007174 (= res!676066 (validKeyInArray!0 k!2224))))

(declare-fun b!1007175 () Bool)

(declare-fun res!676073 () Bool)

(assert (=> b!1007175 (=> (not res!676073) (not e!566870))))

(declare-fun arrayContainsKey!0 (array!63524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007175 (= res!676073 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007176 () Bool)

(declare-fun res!676065 () Bool)

(assert (=> b!1007176 (=> (not res!676065) (not e!566870))))

(assert (=> b!1007176 (= res!676065 (validKeyInArray!0 (select (arr!30583 a!3219) j!170)))))

(declare-fun b!1007177 () Bool)

(assert (=> b!1007177 (= e!566870 e!566872)))

(declare-fun res!676077 () Bool)

(assert (=> b!1007177 (=> (not res!676077) (not e!566872))))

(declare-fun lt!445068 () SeekEntryResult!9515)

(assert (=> b!1007177 (= res!676077 (or (= lt!445068 (MissingVacant!9515 i!1194)) (= lt!445068 (MissingZero!9515 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63524 (_ BitVec 32)) SeekEntryResult!9515)

(assert (=> b!1007177 (= lt!445068 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1007179 () Bool)

(assert (=> b!1007179 (= e!566873 false)))

(declare-fun lt!445066 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007179 (= lt!445066 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007180 () Bool)

(declare-fun e!566871 () Bool)

(assert (=> b!1007180 (= e!566872 e!566871)))

(declare-fun res!676071 () Bool)

(assert (=> b!1007180 (=> (not res!676071) (not e!566871))))

(declare-fun lt!445070 () SeekEntryResult!9515)

(assert (=> b!1007180 (= res!676071 (= lt!445067 lt!445070))))

(assert (=> b!1007180 (= lt!445070 (Intermediate!9515 false resIndex!38 resX!38))))

(assert (=> b!1007180 (= lt!445067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30583 a!3219) j!170) mask!3464) (select (arr!30583 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007181 () Bool)

(declare-fun res!676070 () Bool)

(assert (=> b!1007181 (=> (not res!676070) (not e!566872))))

(declare-datatypes ((List!21259 0))(
  ( (Nil!21256) (Cons!21255 (h!22441 (_ BitVec 64)) (t!30260 List!21259)) )
))
(declare-fun arrayNoDuplicates!0 (array!63524 (_ BitVec 32) List!21259) Bool)

(assert (=> b!1007181 (= res!676070 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21256))))

(declare-fun b!1007182 () Bool)

(declare-fun res!676068 () Bool)

(assert (=> b!1007182 (=> (not res!676068) (not e!566870))))

(assert (=> b!1007182 (= res!676068 (and (= (size!31085 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31085 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31085 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007178 () Bool)

(declare-fun res!676075 () Bool)

(assert (=> b!1007178 (=> (not res!676075) (not e!566873))))

(assert (=> b!1007178 (= res!676075 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun res!676064 () Bool)

(assert (=> start!86876 (=> (not res!676064) (not e!566870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86876 (= res!676064 (validMask!0 mask!3464))))

(assert (=> start!86876 e!566870))

(declare-fun array_inv!23707 (array!63524) Bool)

(assert (=> start!86876 (array_inv!23707 a!3219)))

(assert (=> start!86876 true))

(declare-fun b!1007183 () Bool)

(assert (=> b!1007183 (= e!566871 e!566875)))

(declare-fun res!676074 () Bool)

(assert (=> b!1007183 (=> (not res!676074) (not e!566875))))

(assert (=> b!1007183 (= res!676074 (= lt!445069 lt!445070))))

(assert (=> b!1007183 (= lt!445069 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30583 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007184 () Bool)

(declare-fun res!676076 () Bool)

(assert (=> b!1007184 (=> (not res!676076) (not e!566872))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63524 (_ BitVec 32)) Bool)

(assert (=> b!1007184 (= res!676076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86876 res!676064) b!1007182))

(assert (= (and b!1007182 res!676068) b!1007176))

(assert (= (and b!1007176 res!676065) b!1007174))

(assert (= (and b!1007174 res!676066) b!1007175))

(assert (= (and b!1007175 res!676073) b!1007177))

(assert (= (and b!1007177 res!676077) b!1007184))

(assert (= (and b!1007184 res!676076) b!1007181))

(assert (= (and b!1007181 res!676070) b!1007172))

(assert (= (and b!1007172 res!676069) b!1007180))

(assert (= (and b!1007180 res!676071) b!1007183))

(assert (= (and b!1007183 res!676074) b!1007171))

(assert (= (and b!1007171 res!676067) b!1007173))

(assert (= (and b!1007173 res!676072) b!1007178))

(assert (= (and b!1007178 res!676075) b!1007179))

(declare-fun m!932099 () Bool)

(assert (=> b!1007183 m!932099))

(assert (=> b!1007183 m!932099))

(declare-fun m!932101 () Bool)

(assert (=> b!1007183 m!932101))

(declare-fun m!932103 () Bool)

(assert (=> b!1007175 m!932103))

(declare-fun m!932105 () Bool)

(assert (=> b!1007177 m!932105))

(declare-fun m!932107 () Bool)

(assert (=> b!1007179 m!932107))

(assert (=> b!1007176 m!932099))

(assert (=> b!1007176 m!932099))

(declare-fun m!932109 () Bool)

(assert (=> b!1007176 m!932109))

(declare-fun m!932111 () Bool)

(assert (=> b!1007173 m!932111))

(assert (=> b!1007180 m!932099))

(assert (=> b!1007180 m!932099))

(declare-fun m!932113 () Bool)

(assert (=> b!1007180 m!932113))

(assert (=> b!1007180 m!932113))

(assert (=> b!1007180 m!932099))

(declare-fun m!932115 () Bool)

(assert (=> b!1007180 m!932115))

(declare-fun m!932117 () Bool)

(assert (=> b!1007181 m!932117))

(declare-fun m!932119 () Bool)

(assert (=> b!1007171 m!932119))

(assert (=> b!1007171 m!932119))

(declare-fun m!932121 () Bool)

(assert (=> b!1007171 m!932121))

(declare-fun m!932123 () Bool)

(assert (=> b!1007171 m!932123))

(declare-fun m!932125 () Bool)

(assert (=> b!1007171 m!932125))

(declare-fun m!932127 () Bool)

(assert (=> b!1007174 m!932127))

(declare-fun m!932129 () Bool)

(assert (=> b!1007184 m!932129))

(declare-fun m!932131 () Bool)

(assert (=> start!86876 m!932131))

(declare-fun m!932133 () Bool)

(assert (=> start!86876 m!932133))

(push 1)

