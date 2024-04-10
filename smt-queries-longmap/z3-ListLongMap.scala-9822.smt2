; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116602 () Bool)

(assert start!116602)

(declare-fun b!1374825 () Bool)

(declare-fun e!778841 () Bool)

(assert (=> b!1374825 (= e!778841 (not true))))

(declare-datatypes ((array!93287 0))(
  ( (array!93288 (arr!45048 (Array (_ BitVec 32) (_ BitVec 64))) (size!45598 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93287)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93287 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374825 (= (arrayCountValidKeys!0 (array!93288 (store (arr!45048 a!4142) i!1457 k0!2959) (size!45598 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45485 0))(
  ( (Unit!45486) )
))
(declare-fun lt!603900 () Unit!45485)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93287 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45485)

(assert (=> b!1374825 (= lt!603900 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1374824 () Bool)

(declare-fun res!917951 () Bool)

(assert (=> b!1374824 (=> (not res!917951) (not e!778841))))

(assert (=> b!1374824 (= res!917951 (bvslt (size!45598 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374822 () Bool)

(declare-fun res!917952 () Bool)

(assert (=> b!1374822 (=> (not res!917952) (not e!778841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374822 (= res!917952 (validKeyInArray!0 (select (arr!45048 a!4142) i!1457)))))

(declare-fun b!1374823 () Bool)

(declare-fun res!917950 () Bool)

(assert (=> b!1374823 (=> (not res!917950) (not e!778841))))

(assert (=> b!1374823 (= res!917950 (not (validKeyInArray!0 k0!2959)))))

(declare-fun res!917953 () Bool)

(assert (=> start!116602 (=> (not res!917953) (not e!778841))))

(assert (=> start!116602 (= res!917953 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45598 a!4142))))))

(assert (=> start!116602 e!778841))

(assert (=> start!116602 true))

(declare-fun array_inv!34076 (array!93287) Bool)

(assert (=> start!116602 (array_inv!34076 a!4142)))

(assert (= (and start!116602 res!917953) b!1374822))

(assert (= (and b!1374822 res!917952) b!1374823))

(assert (= (and b!1374823 res!917950) b!1374824))

(assert (= (and b!1374824 res!917951) b!1374825))

(declare-fun m!1258391 () Bool)

(assert (=> b!1374825 m!1258391))

(declare-fun m!1258393 () Bool)

(assert (=> b!1374825 m!1258393))

(declare-fun m!1258395 () Bool)

(assert (=> b!1374825 m!1258395))

(declare-fun m!1258397 () Bool)

(assert (=> b!1374825 m!1258397))

(declare-fun m!1258399 () Bool)

(assert (=> b!1374822 m!1258399))

(assert (=> b!1374822 m!1258399))

(declare-fun m!1258401 () Bool)

(assert (=> b!1374822 m!1258401))

(declare-fun m!1258403 () Bool)

(assert (=> b!1374823 m!1258403))

(declare-fun m!1258405 () Bool)

(assert (=> start!116602 m!1258405))

(check-sat (not b!1374822) (not b!1374825) (not b!1374823) (not start!116602))
