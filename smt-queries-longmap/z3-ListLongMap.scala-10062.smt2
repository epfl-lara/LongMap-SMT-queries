; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118508 () Bool)

(assert start!118508)

(declare-fun b!1385640 () Bool)

(declare-fun e!785089 () Bool)

(assert (=> b!1385640 (= e!785089 false)))

(declare-fun lt!609294 () Bool)

(declare-datatypes ((array!94784 0))(
  ( (array!94785 (arr!45768 (Array (_ BitVec 32) (_ BitVec 64))) (size!46318 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94784)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94784 (_ BitVec 32)) Bool)

(assert (=> b!1385640 (= lt!609294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385639 () Bool)

(declare-fun res!926890 () Bool)

(assert (=> b!1385639 (=> (not res!926890) (not e!785089))))

(declare-datatypes ((List!32296 0))(
  ( (Nil!32293) (Cons!32292 (h!33501 (_ BitVec 64)) (t!46990 List!32296)) )
))
(declare-fun arrayNoDuplicates!0 (array!94784 (_ BitVec 32) List!32296) Bool)

(assert (=> b!1385639 (= res!926890 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32293))))

(declare-fun b!1385638 () Bool)

(declare-fun res!926889 () Bool)

(assert (=> b!1385638 (=> (not res!926889) (not e!785089))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385638 (= res!926889 (validKeyInArray!0 (select (arr!45768 a!2938) i!1065)))))

(declare-fun res!926887 () Bool)

(assert (=> start!118508 (=> (not res!926887) (not e!785089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118508 (= res!926887 (validMask!0 mask!2987))))

(assert (=> start!118508 e!785089))

(assert (=> start!118508 true))

(declare-fun array_inv!34796 (array!94784) Bool)

(assert (=> start!118508 (array_inv!34796 a!2938)))

(declare-fun b!1385637 () Bool)

(declare-fun res!926888 () Bool)

(assert (=> b!1385637 (=> (not res!926888) (not e!785089))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385637 (= res!926888 (and (= (size!46318 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46318 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46318 a!2938))))))

(assert (= (and start!118508 res!926887) b!1385637))

(assert (= (and b!1385637 res!926888) b!1385638))

(assert (= (and b!1385638 res!926889) b!1385639))

(assert (= (and b!1385639 res!926890) b!1385640))

(declare-fun m!1270929 () Bool)

(assert (=> b!1385640 m!1270929))

(declare-fun m!1270931 () Bool)

(assert (=> b!1385639 m!1270931))

(declare-fun m!1270933 () Bool)

(assert (=> b!1385638 m!1270933))

(assert (=> b!1385638 m!1270933))

(declare-fun m!1270935 () Bool)

(assert (=> b!1385638 m!1270935))

(declare-fun m!1270937 () Bool)

(assert (=> start!118508 m!1270937))

(declare-fun m!1270939 () Bool)

(assert (=> start!118508 m!1270939))

(check-sat (not b!1385638) (not b!1385639) (not start!118508) (not b!1385640))
