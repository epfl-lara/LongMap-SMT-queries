; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122338 () Bool)

(assert start!122338)

(declare-fun b!1418206 () Bool)

(declare-fun res!953884 () Bool)

(declare-fun e!802589 () Bool)

(assert (=> b!1418206 (=> (not res!953884) (not e!802589))))

(declare-datatypes ((array!96841 0))(
  ( (array!96842 (arr!46744 (Array (_ BitVec 32) (_ BitVec 64))) (size!47294 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96841)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1418206 (= res!953884 (validKeyInArray!0 (select (arr!46744 a!2831) j!81)))))

(declare-fun b!1418207 () Bool)

(declare-fun res!953887 () Bool)

(assert (=> b!1418207 (=> (not res!953887) (not e!802589))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96841 (_ BitVec 32)) Bool)

(assert (=> b!1418207 (= res!953887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun b!1418208 () Bool)

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1418208 (= e!802589 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47294 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47294 a!2831)) (bvsge mask!2608 #b00000000000000000000000000000000) (bvsgt mask!2608 #b00111111111111111111111111111111)))))

(declare-fun b!1418209 () Bool)

(declare-fun res!953886 () Bool)

(assert (=> b!1418209 (=> (not res!953886) (not e!802589))))

(declare-datatypes ((List!33254 0))(
  ( (Nil!33251) (Cons!33250 (h!34543 (_ BitVec 64)) (t!47948 List!33254)) )
))
(declare-fun arrayNoDuplicates!0 (array!96841 (_ BitVec 32) List!33254) Bool)

(assert (=> b!1418209 (= res!953886 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33251))))

(declare-fun b!1418210 () Bool)

(declare-fun res!953885 () Bool)

(assert (=> b!1418210 (=> (not res!953885) (not e!802589))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1418210 (= res!953885 (and (= (size!47294 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47294 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47294 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!953883 () Bool)

(assert (=> start!122338 (=> (not res!953883) (not e!802589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122338 (= res!953883 (validMask!0 mask!2608))))

(assert (=> start!122338 e!802589))

(assert (=> start!122338 true))

(declare-fun array_inv!35772 (array!96841) Bool)

(assert (=> start!122338 (array_inv!35772 a!2831)))

(declare-fun b!1418211 () Bool)

(declare-fun res!953882 () Bool)

(assert (=> b!1418211 (=> (not res!953882) (not e!802589))))

(assert (=> b!1418211 (= res!953882 (validKeyInArray!0 (select (arr!46744 a!2831) i!982)))))

(assert (= (and start!122338 res!953883) b!1418210))

(assert (= (and b!1418210 res!953885) b!1418211))

(assert (= (and b!1418211 res!953882) b!1418206))

(assert (= (and b!1418206 res!953884) b!1418207))

(assert (= (and b!1418207 res!953887) b!1418209))

(assert (= (and b!1418209 res!953886) b!1418208))

(declare-fun m!1308947 () Bool)

(assert (=> b!1418207 m!1308947))

(declare-fun m!1308949 () Bool)

(assert (=> b!1418206 m!1308949))

(assert (=> b!1418206 m!1308949))

(declare-fun m!1308951 () Bool)

(assert (=> b!1418206 m!1308951))

(declare-fun m!1308953 () Bool)

(assert (=> b!1418211 m!1308953))

(assert (=> b!1418211 m!1308953))

(declare-fun m!1308955 () Bool)

(assert (=> b!1418211 m!1308955))

(declare-fun m!1308957 () Bool)

(assert (=> start!122338 m!1308957))

(declare-fun m!1308959 () Bool)

(assert (=> start!122338 m!1308959))

(declare-fun m!1308961 () Bool)

(assert (=> b!1418209 m!1308961))

(push 1)

(assert (not start!122338))

(assert (not b!1418211))

(assert (not b!1418207))

(assert (not b!1418209))

(assert (not b!1418206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152843 () Bool)

(assert (=> d!152843 (= (validKeyInArray!0 (select (arr!46744 a!2831) j!81)) (and (not (= (select (arr!46744 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46744 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1418206 d!152843))

(declare-fun d!152845 () Bool)

(assert (=> d!152845 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122338 d!152845))

(declare-fun d!152857 () Bool)

(assert (=> d!152857 (= (array_inv!35772 a!2831) (bvsge (size!47294 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122338 d!152857))

(declare-fun d!152859 () Bool)

(assert (=> d!152859 (= (validKeyInArray!0 (select (arr!46744 a!2831) i!982)) (and (not (= (select (arr!46744 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46744 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

