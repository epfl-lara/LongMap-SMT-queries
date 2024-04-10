; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110694 () Bool)

(assert start!110694)

(declare-fun b_free!29529 () Bool)

(declare-fun b_next!29529 () Bool)

(assert (=> start!110694 (= b_free!29529 (not b_next!29529))))

(declare-fun tp!103909 () Bool)

(declare-fun b_and!47737 () Bool)

(assert (=> start!110694 (= tp!103909 b_and!47737)))

(declare-fun b!1309867 () Bool)

(declare-fun e!747332 () Bool)

(declare-fun tp_is_empty!35259 () Bool)

(assert (=> b!1309867 (= e!747332 tp_is_empty!35259)))

(declare-fun res!869533 () Bool)

(declare-fun e!747331 () Bool)

(assert (=> start!110694 (=> (not res!869533) (not e!747331))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110694 (= res!869533 (validMask!0 mask!2040))))

(assert (=> start!110694 e!747331))

(assert (=> start!110694 tp!103909))

(declare-datatypes ((array!87508 0))(
  ( (array!87509 (arr!42234 (Array (_ BitVec 32) (_ BitVec 64))) (size!42784 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87508)

(declare-fun array_inv!31913 (array!87508) Bool)

(assert (=> start!110694 (array_inv!31913 _keys!1628)))

(assert (=> start!110694 true))

(assert (=> start!110694 tp_is_empty!35259))

(declare-datatypes ((V!52115 0))(
  ( (V!52116 (val!17704 Int)) )
))
(declare-datatypes ((ValueCell!16731 0))(
  ( (ValueCellFull!16731 (v!20331 V!52115)) (EmptyCell!16731) )
))
(declare-datatypes ((array!87510 0))(
  ( (array!87511 (arr!42235 (Array (_ BitVec 32) ValueCell!16731)) (size!42785 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87510)

(declare-fun e!747329 () Bool)

(declare-fun array_inv!31914 (array!87510) Bool)

(assert (=> start!110694 (and (array_inv!31914 _values!1354) e!747329)))

(declare-fun b!1309868 () Bool)

(declare-fun res!869534 () Bool)

(assert (=> b!1309868 (=> (not res!869534) (not e!747331))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52115)

(declare-fun zeroValue!1296 () V!52115)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!22802 0))(
  ( (tuple2!22803 (_1!11412 (_ BitVec 64)) (_2!11412 V!52115)) )
))
(declare-datatypes ((List!29942 0))(
  ( (Nil!29939) (Cons!29938 (h!31147 tuple2!22802) (t!43548 List!29942)) )
))
(declare-datatypes ((ListLongMap!20459 0))(
  ( (ListLongMap!20460 (toList!10245 List!29942)) )
))
(declare-fun contains!8395 (ListLongMap!20459 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5258 (array!87508 array!87510 (_ BitVec 32) (_ BitVec 32) V!52115 V!52115 (_ BitVec 32) Int) ListLongMap!20459)

(assert (=> b!1309868 (= res!869534 (contains!8395 (getCurrentListMap!5258 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1309869 () Bool)

(declare-fun e!747328 () Bool)

(assert (=> b!1309869 (= e!747328 tp_is_empty!35259)))

(declare-fun b!1309870 () Bool)

(declare-fun mapRes!54517 () Bool)

(assert (=> b!1309870 (= e!747329 (and e!747328 mapRes!54517))))

(declare-fun condMapEmpty!54517 () Bool)

(declare-fun mapDefault!54517 () ValueCell!16731)

(assert (=> b!1309870 (= condMapEmpty!54517 (= (arr!42235 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16731)) mapDefault!54517)))))

(declare-fun mapIsEmpty!54517 () Bool)

(assert (=> mapIsEmpty!54517 mapRes!54517))

(declare-fun b!1309871 () Bool)

(declare-fun res!869536 () Bool)

(assert (=> b!1309871 (=> (not res!869536) (not e!747331))))

(assert (=> b!1309871 (= res!869536 (and (= (size!42785 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42784 _keys!1628) (size!42785 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309872 () Bool)

(declare-fun res!869530 () Bool)

(assert (=> b!1309872 (=> (not res!869530) (not e!747331))))

(assert (=> b!1309872 (= res!869530 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42784 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54517 () Bool)

(declare-fun tp!103908 () Bool)

(assert (=> mapNonEmpty!54517 (= mapRes!54517 (and tp!103908 e!747332))))

(declare-fun mapRest!54517 () (Array (_ BitVec 32) ValueCell!16731))

(declare-fun mapKey!54517 () (_ BitVec 32))

(declare-fun mapValue!54517 () ValueCell!16731)

(assert (=> mapNonEmpty!54517 (= (arr!42235 _values!1354) (store mapRest!54517 mapKey!54517 mapValue!54517))))

(declare-fun b!1309873 () Bool)

(declare-fun res!869538 () Bool)

(assert (=> b!1309873 (=> (not res!869538) (not e!747331))))

(assert (=> b!1309873 (= res!869538 (not (= (select (arr!42234 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1309874 () Bool)

(declare-fun res!869531 () Bool)

(assert (=> b!1309874 (=> (not res!869531) (not e!747331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1309874 (= res!869531 (validKeyInArray!0 (select (arr!42234 _keys!1628) from!2020)))))

(declare-fun b!1309875 () Bool)

(declare-fun res!869532 () Bool)

(assert (=> b!1309875 (=> (not res!869532) (not e!747331))))

(declare-datatypes ((List!29943 0))(
  ( (Nil!29940) (Cons!29939 (h!31148 (_ BitVec 64)) (t!43549 List!29943)) )
))
(declare-fun arrayNoDuplicates!0 (array!87508 (_ BitVec 32) List!29943) Bool)

(assert (=> b!1309875 (= res!869532 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29940))))

(declare-fun b!1309876 () Bool)

(assert (=> b!1309876 (= e!747331 (not true))))

(assert (=> b!1309876 (contains!8395 (getCurrentListMap!5258 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43316 0))(
  ( (Unit!43317) )
))
(declare-fun lt!585312 () Unit!43316)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!4 (array!87508 array!87510 (_ BitVec 32) (_ BitVec 32) V!52115 V!52115 (_ BitVec 64) (_ BitVec 32) Int) Unit!43316)

(assert (=> b!1309876 (= lt!585312 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!4 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1309877 () Bool)

(declare-fun res!869537 () Bool)

(assert (=> b!1309877 (=> (not res!869537) (not e!747331))))

(assert (=> b!1309877 (= res!869537 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1309878 () Bool)

(declare-fun res!869535 () Bool)

(assert (=> b!1309878 (=> (not res!869535) (not e!747331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87508 (_ BitVec 32)) Bool)

(assert (=> b!1309878 (= res!869535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110694 res!869533) b!1309871))

(assert (= (and b!1309871 res!869536) b!1309878))

(assert (= (and b!1309878 res!869535) b!1309875))

(assert (= (and b!1309875 res!869532) b!1309872))

(assert (= (and b!1309872 res!869530) b!1309868))

(assert (= (and b!1309868 res!869534) b!1309873))

(assert (= (and b!1309873 res!869538) b!1309874))

(assert (= (and b!1309874 res!869531) b!1309877))

(assert (= (and b!1309877 res!869537) b!1309876))

(assert (= (and b!1309870 condMapEmpty!54517) mapIsEmpty!54517))

(assert (= (and b!1309870 (not condMapEmpty!54517)) mapNonEmpty!54517))

(get-info :version)

(assert (= (and mapNonEmpty!54517 ((_ is ValueCellFull!16731) mapValue!54517)) b!1309867))

(assert (= (and b!1309870 ((_ is ValueCellFull!16731) mapDefault!54517)) b!1309869))

(assert (= start!110694 b!1309870))

(declare-fun m!1199807 () Bool)

(assert (=> b!1309875 m!1199807))

(declare-fun m!1199809 () Bool)

(assert (=> b!1309868 m!1199809))

(assert (=> b!1309868 m!1199809))

(declare-fun m!1199811 () Bool)

(assert (=> b!1309868 m!1199811))

(declare-fun m!1199813 () Bool)

(assert (=> mapNonEmpty!54517 m!1199813))

(declare-fun m!1199815 () Bool)

(assert (=> b!1309876 m!1199815))

(assert (=> b!1309876 m!1199815))

(declare-fun m!1199817 () Bool)

(assert (=> b!1309876 m!1199817))

(declare-fun m!1199819 () Bool)

(assert (=> b!1309876 m!1199819))

(declare-fun m!1199821 () Bool)

(assert (=> b!1309873 m!1199821))

(declare-fun m!1199823 () Bool)

(assert (=> b!1309878 m!1199823))

(assert (=> b!1309874 m!1199821))

(assert (=> b!1309874 m!1199821))

(declare-fun m!1199825 () Bool)

(assert (=> b!1309874 m!1199825))

(declare-fun m!1199827 () Bool)

(assert (=> start!110694 m!1199827))

(declare-fun m!1199829 () Bool)

(assert (=> start!110694 m!1199829))

(declare-fun m!1199831 () Bool)

(assert (=> start!110694 m!1199831))

(check-sat (not b!1309868) (not b!1309874) (not b!1309876) (not b!1309878) (not mapNonEmpty!54517) (not b_next!29529) b_and!47737 tp_is_empty!35259 (not start!110694) (not b!1309875))
(check-sat b_and!47737 (not b_next!29529))
