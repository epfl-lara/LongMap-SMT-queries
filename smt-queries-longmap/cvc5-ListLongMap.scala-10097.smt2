; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119232 () Bool)

(assert start!119232)

(declare-fun b!1390384 () Bool)

(declare-fun res!929895 () Bool)

(declare-fun e!787678 () Bool)

(assert (=> b!1390384 (=> (not res!929895) (not e!787678))))

(declare-datatypes ((array!95124 0))(
  ( (array!95125 (arr!45927 (Array (_ BitVec 32) (_ BitVec 64))) (size!46478 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95124)

(declare-datatypes ((List!32433 0))(
  ( (Nil!32430) (Cons!32429 (h!33652 (_ BitVec 64)) (t!47119 List!32433)) )
))
(declare-fun arrayNoDuplicates!0 (array!95124 (_ BitVec 32) List!32433) Bool)

(assert (=> b!1390384 (= res!929895 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32430))))

(declare-fun b!1390385 () Bool)

(declare-fun res!929894 () Bool)

(assert (=> b!1390385 (=> (not res!929894) (not e!787678))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390385 (= res!929894 (and (= (size!46478 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46478 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46478 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390387 () Bool)

(declare-fun res!929897 () Bool)

(assert (=> b!1390387 (=> (not res!929897) (not e!787678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390387 (= res!929897 (validKeyInArray!0 (select (arr!45927 a!2901) i!1037)))))

(declare-fun b!1390388 () Bool)

(declare-fun res!929896 () Bool)

(assert (=> b!1390388 (=> (not res!929896) (not e!787678))))

(assert (=> b!1390388 (= res!929896 (validKeyInArray!0 (select (arr!45927 a!2901) j!112)))))

(declare-fun b!1390389 () Bool)

(declare-fun res!929899 () Bool)

(assert (=> b!1390389 (=> (not res!929899) (not e!787678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95124 (_ BitVec 32)) Bool)

(assert (=> b!1390389 (= res!929899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390386 () Bool)

(assert (=> b!1390386 (= e!787678 false)))

(declare-fun lt!610901 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390386 (= lt!610901 (toIndex!0 (select (arr!45927 a!2901) j!112) mask!2840))))

(declare-fun res!929898 () Bool)

(assert (=> start!119232 (=> (not res!929898) (not e!787678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119232 (= res!929898 (validMask!0 mask!2840))))

(assert (=> start!119232 e!787678))

(assert (=> start!119232 true))

(declare-fun array_inv!35208 (array!95124) Bool)

(assert (=> start!119232 (array_inv!35208 a!2901)))

(assert (= (and start!119232 res!929898) b!1390385))

(assert (= (and b!1390385 res!929894) b!1390387))

(assert (= (and b!1390387 res!929897) b!1390388))

(assert (= (and b!1390388 res!929896) b!1390389))

(assert (= (and b!1390389 res!929899) b!1390384))

(assert (= (and b!1390384 res!929895) b!1390386))

(declare-fun m!1276291 () Bool)

(assert (=> b!1390387 m!1276291))

(assert (=> b!1390387 m!1276291))

(declare-fun m!1276293 () Bool)

(assert (=> b!1390387 m!1276293))

(declare-fun m!1276295 () Bool)

(assert (=> b!1390389 m!1276295))

(declare-fun m!1276297 () Bool)

(assert (=> start!119232 m!1276297))

(declare-fun m!1276299 () Bool)

(assert (=> start!119232 m!1276299))

(declare-fun m!1276301 () Bool)

(assert (=> b!1390384 m!1276301))

(declare-fun m!1276303 () Bool)

(assert (=> b!1390388 m!1276303))

(assert (=> b!1390388 m!1276303))

(declare-fun m!1276305 () Bool)

(assert (=> b!1390388 m!1276305))

(assert (=> b!1390386 m!1276303))

(assert (=> b!1390386 m!1276303))

(declare-fun m!1276307 () Bool)

(assert (=> b!1390386 m!1276307))

(push 1)

(assert (not start!119232))

(assert (not b!1390389))

(assert (not b!1390384))

(assert (not b!1390387))

(assert (not b!1390386))

(assert (not b!1390388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

