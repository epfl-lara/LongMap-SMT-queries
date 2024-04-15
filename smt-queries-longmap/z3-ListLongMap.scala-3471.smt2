; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48144 () Bool)

(assert start!48144)

(declare-fun b!530185 () Bool)

(declare-fun res!326036 () Bool)

(declare-fun e!308895 () Bool)

(assert (=> b!530185 (=> (not res!326036) (not e!308895))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33590 0))(
  ( (array!33591 (arr!16142 (Array (_ BitVec 32) (_ BitVec 64))) (size!16507 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33590)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530185 (= res!326036 (and (= (size!16507 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16507 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16507 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530188 () Bool)

(assert (=> b!530188 (= e!308895 (and (bvslt #b00000000000000000000000000000000 (size!16507 a!3154)) (bvsge (size!16507 a!3154) #b01111111111111111111111111111111)))))

(declare-fun b!530186 () Bool)

(declare-fun res!326034 () Bool)

(assert (=> b!530186 (=> (not res!326034) (not e!308895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530186 (= res!326034 (validKeyInArray!0 (select (arr!16142 a!3154) j!147)))))

(declare-fun res!326035 () Bool)

(assert (=> start!48144 (=> (not res!326035) (not e!308895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48144 (= res!326035 (validMask!0 mask!3216))))

(assert (=> start!48144 e!308895))

(assert (=> start!48144 true))

(declare-fun array_inv!12025 (array!33590) Bool)

(assert (=> start!48144 (array_inv!12025 a!3154)))

(declare-fun b!530187 () Bool)

(declare-fun res!326033 () Bool)

(assert (=> b!530187 (=> (not res!326033) (not e!308895))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!530187 (= res!326033 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48144 res!326035) b!530185))

(assert (= (and b!530185 res!326036) b!530186))

(assert (= (and b!530186 res!326034) b!530187))

(assert (= (and b!530187 res!326033) b!530188))

(declare-fun m!510295 () Bool)

(assert (=> b!530186 m!510295))

(assert (=> b!530186 m!510295))

(declare-fun m!510297 () Bool)

(assert (=> b!530186 m!510297))

(declare-fun m!510299 () Bool)

(assert (=> start!48144 m!510299))

(declare-fun m!510301 () Bool)

(assert (=> start!48144 m!510301))

(declare-fun m!510303 () Bool)

(assert (=> b!530187 m!510303))

(check-sat (not start!48144) (not b!530187) (not b!530186))
(check-sat)
(get-model)

(declare-fun d!80923 () Bool)

(assert (=> d!80923 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48144 d!80923))

(declare-fun d!80931 () Bool)

(assert (=> d!80931 (= (array_inv!12025 a!3154) (bvsge (size!16507 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48144 d!80931))

(declare-fun d!80933 () Bool)

(assert (=> d!80933 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!530187 d!80933))

(declare-fun d!80935 () Bool)

(assert (=> d!80935 (= (validKeyInArray!0 (select (arr!16142 a!3154) j!147)) (and (not (= (select (arr!16142 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16142 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!530186 d!80935))

(check-sat)
