; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48158 () Bool)

(assert start!48158)

(declare-fun b!530468 () Bool)

(declare-fun res!326176 () Bool)

(declare-fun e!309074 () Bool)

(assert (=> b!530468 (=> (not res!326176) (not e!309074))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33594 0))(
  ( (array!33595 (arr!16144 (Array (_ BitVec 32) (_ BitVec 64))) (size!16508 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33594)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530468 (= res!326176 (and (= (size!16508 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16508 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16508 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530471 () Bool)

(assert (=> b!530471 (= e!309074 (and (bvslt #b00000000000000000000000000000000 (size!16508 a!3154)) (bvsge (size!16508 a!3154) #b01111111111111111111111111111111)))))

(declare-fun b!530469 () Bool)

(declare-fun res!326174 () Bool)

(assert (=> b!530469 (=> (not res!326174) (not e!309074))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530469 (= res!326174 (validKeyInArray!0 (select (arr!16144 a!3154) j!147)))))

(declare-fun res!326177 () Bool)

(assert (=> start!48158 (=> (not res!326177) (not e!309074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48158 (= res!326177 (validMask!0 mask!3216))))

(assert (=> start!48158 e!309074))

(assert (=> start!48158 true))

(declare-fun array_inv!11940 (array!33594) Bool)

(assert (=> start!48158 (array_inv!11940 a!3154)))

(declare-fun b!530470 () Bool)

(declare-fun res!326175 () Bool)

(assert (=> b!530470 (=> (not res!326175) (not e!309074))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!530470 (= res!326175 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48158 res!326177) b!530468))

(assert (= (and b!530468 res!326176) b!530469))

(assert (= (and b!530469 res!326174) b!530470))

(assert (= (and b!530470 res!326175) b!530471))

(declare-fun m!511057 () Bool)

(assert (=> b!530469 m!511057))

(assert (=> b!530469 m!511057))

(declare-fun m!511059 () Bool)

(assert (=> b!530469 m!511059))

(declare-fun m!511061 () Bool)

(assert (=> start!48158 m!511061))

(declare-fun m!511063 () Bool)

(assert (=> start!48158 m!511063))

(declare-fun m!511065 () Bool)

(assert (=> b!530470 m!511065))

(check-sat (not b!530469) (not start!48158) (not b!530470))
(check-sat)
(get-model)

(declare-fun d!81127 () Bool)

(assert (=> d!81127 (= (validKeyInArray!0 (select (arr!16144 a!3154) j!147)) (and (not (= (select (arr!16144 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16144 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!530469 d!81127))

(declare-fun d!81129 () Bool)

(assert (=> d!81129 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48158 d!81129))

(declare-fun d!81139 () Bool)

(assert (=> d!81139 (= (array_inv!11940 a!3154) (bvsge (size!16508 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48158 d!81139))

(declare-fun d!81141 () Bool)

(assert (=> d!81141 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!530470 d!81141))

(check-sat)
