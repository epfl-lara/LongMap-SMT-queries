; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25890 () Bool)

(assert start!25890)

(declare-fun res!131926 () Bool)

(declare-fun e!173015 () Bool)

(assert (=> start!25890 (=> (not res!131926) (not e!173015))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25890 (= res!131926 (validMask!0 mask!3868))))

(assert (=> start!25890 e!173015))

(declare-datatypes ((array!13007 0))(
  ( (array!13008 (arr!6154 (Array (_ BitVec 32) (_ BitVec 64))) (size!6506 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13007)

(declare-fun array_inv!4104 (array!13007) Bool)

(assert (=> start!25890 (array_inv!4104 a!3325)))

(assert (=> start!25890 true))

(declare-fun b!267658 () Bool)

(assert (=> b!267658 (= e!173015 (and (bvslt #b00000000000000000000000000000000 (size!6506 a!3325)) (bvsge (size!6506 a!3325) #b01111111111111111111111111111111)))))

(declare-fun b!267656 () Bool)

(declare-fun res!131925 () Bool)

(assert (=> b!267656 (=> (not res!131925) (not e!173015))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267656 (= res!131925 (validKeyInArray!0 k0!2581))))

(declare-fun b!267655 () Bool)

(declare-fun res!131928 () Bool)

(assert (=> b!267655 (=> (not res!131928) (not e!173015))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!267655 (= res!131928 (and (= (size!6506 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6506 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6506 a!3325))))))

(declare-fun b!267657 () Bool)

(declare-fun res!131927 () Bool)

(assert (=> b!267657 (=> (not res!131927) (not e!173015))))

(declare-datatypes ((List!3875 0))(
  ( (Nil!3872) (Cons!3871 (h!4538 (_ BitVec 64)) (t!8949 List!3875)) )
))
(declare-fun arrayNoDuplicates!0 (array!13007 (_ BitVec 32) List!3875) Bool)

(assert (=> b!267657 (= res!131927 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3872))))

(assert (= (and start!25890 res!131926) b!267655))

(assert (= (and b!267655 res!131928) b!267656))

(assert (= (and b!267656 res!131925) b!267657))

(assert (= (and b!267657 res!131927) b!267658))

(declare-fun m!284147 () Bool)

(assert (=> start!25890 m!284147))

(declare-fun m!284149 () Bool)

(assert (=> start!25890 m!284149))

(declare-fun m!284151 () Bool)

(assert (=> b!267656 m!284151))

(declare-fun m!284153 () Bool)

(assert (=> b!267657 m!284153))

(check-sat (not b!267656) (not b!267657) (not start!25890))
(check-sat)
(get-model)

(declare-fun d!64459 () Bool)

(assert (=> d!64459 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!267656 d!64459))

(declare-fun b!267693 () Bool)

(declare-fun e!173037 () Bool)

(declare-fun call!25330 () Bool)

(assert (=> b!267693 (= e!173037 call!25330)))

(declare-fun b!267694 () Bool)

(declare-fun e!173038 () Bool)

(declare-fun e!173036 () Bool)

(assert (=> b!267694 (= e!173038 e!173036)))

(declare-fun res!131960 () Bool)

(assert (=> b!267694 (=> (not res!131960) (not e!173036))))

(declare-fun e!173039 () Bool)

(assert (=> b!267694 (= res!131960 (not e!173039))))

(declare-fun res!131961 () Bool)

(assert (=> b!267694 (=> (not res!131961) (not e!173039))))

(assert (=> b!267694 (= res!131961 (validKeyInArray!0 (select (arr!6154 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!64461 () Bool)

(declare-fun res!131959 () Bool)

(assert (=> d!64461 (=> res!131959 e!173038)))

(assert (=> d!64461 (= res!131959 (bvsge #b00000000000000000000000000000000 (size!6506 a!3325)))))

(assert (=> d!64461 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3872) e!173038)))

(declare-fun b!267695 () Bool)

(assert (=> b!267695 (= e!173037 call!25330)))

(declare-fun b!267696 () Bool)

(declare-fun contains!1900 (List!3875 (_ BitVec 64)) Bool)

(assert (=> b!267696 (= e!173039 (contains!1900 Nil!3872 (select (arr!6154 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!267697 () Bool)

(assert (=> b!267697 (= e!173036 e!173037)))

(declare-fun c!45418 () Bool)

(assert (=> b!267697 (= c!45418 (validKeyInArray!0 (select (arr!6154 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25327 () Bool)

(assert (=> bm!25327 (= call!25330 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45418 (Cons!3871 (select (arr!6154 a!3325) #b00000000000000000000000000000000) Nil!3872) Nil!3872)))))

(assert (= (and d!64461 (not res!131959)) b!267694))

(assert (= (and b!267694 res!131961) b!267696))

(assert (= (and b!267694 res!131960) b!267697))

(assert (= (and b!267697 c!45418) b!267693))

(assert (= (and b!267697 (not c!45418)) b!267695))

(assert (= (or b!267693 b!267695) bm!25327))

(declare-fun m!284171 () Bool)

(assert (=> b!267694 m!284171))

(assert (=> b!267694 m!284171))

(declare-fun m!284173 () Bool)

(assert (=> b!267694 m!284173))

(assert (=> b!267696 m!284171))

(assert (=> b!267696 m!284171))

(declare-fun m!284175 () Bool)

(assert (=> b!267696 m!284175))

(assert (=> b!267697 m!284171))

(assert (=> b!267697 m!284171))

(assert (=> b!267697 m!284173))

(assert (=> bm!25327 m!284171))

(declare-fun m!284177 () Bool)

(assert (=> bm!25327 m!284177))

(assert (=> b!267657 d!64461))

(declare-fun d!64469 () Bool)

(assert (=> d!64469 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!25890 d!64469))

(declare-fun d!64475 () Bool)

(assert (=> d!64475 (= (array_inv!4104 a!3325) (bvsge (size!6506 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!25890 d!64475))

(check-sat (not b!267694) (not bm!25327) (not b!267696) (not b!267697))
(check-sat)
