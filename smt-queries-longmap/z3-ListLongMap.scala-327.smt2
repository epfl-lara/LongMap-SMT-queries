; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5946 () Bool)

(assert start!5946)

(declare-fun b_free!1425 () Bool)

(declare-fun b_next!1425 () Bool)

(assert (=> start!5946 (= b_free!1425 (not b_next!1425))))

(declare-fun tp!5825 () Bool)

(declare-fun b_and!2499 () Bool)

(assert (=> start!5946 (= tp!5825 b_and!2499)))

(declare-fun b!41726 () Bool)

(declare-fun res!24858 () Bool)

(declare-fun e!26367 () Bool)

(assert (=> b!41726 (=> res!24858 e!26367)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!41726 (= res!24858 (bvslt mask!853 #b00000000000000000000000000000000))))

(declare-fun b!41725 () Bool)

(declare-fun res!24860 () Bool)

(assert (=> b!41725 (=> res!24860 e!26367)))

(declare-datatypes ((V!2179 0))(
  ( (V!2180 (val!946 Int)) )
))
(declare-datatypes ((tuple2!1546 0))(
  ( (tuple2!1547 (_1!784 (_ BitVec 64)) (_2!784 V!2179)) )
))
(declare-datatypes ((List!1114 0))(
  ( (Nil!1111) (Cons!1110 (h!1687 tuple2!1546) (t!4035 List!1114)) )
))
(declare-datatypes ((ListLongMap!1123 0))(
  ( (ListLongMap!1124 (toList!577 List!1114)) )
))
(declare-fun lt!16853 () ListLongMap!1123)

(declare-fun isEmpty!263 (List!1114) Bool)

(assert (=> b!41725 (= res!24860 (isEmpty!263 (toList!577 lt!16853)))))

(declare-fun b!41724 () Bool)

(declare-fun e!26368 () Bool)

(assert (=> b!41724 (= e!26368 (not e!26367))))

(declare-fun res!24861 () Bool)

(assert (=> b!41724 (=> res!24861 e!26367)))

(assert (=> b!41724 (= res!24861 (= lt!16853 (ListLongMap!1124 Nil!1111)))))

(declare-datatypes ((array!2715 0))(
  ( (array!2716 (arr!1301 (Array (_ BitVec 32) (_ BitVec 64))) (size!1453 (_ BitVec 32))) )
))
(declare-fun lt!16854 () array!2715)

(declare-datatypes ((ValueCell!660 0))(
  ( (ValueCellFull!660 (v!2030 V!2179)) (EmptyCell!660) )
))
(declare-datatypes ((array!2717 0))(
  ( (array!2718 (arr!1302 (Array (_ BitVec 32) ValueCell!660)) (size!1454 (_ BitVec 32))) )
))
(declare-fun lt!16856 () array!2717)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!16857 () V!2179)

(declare-datatypes ((LongMapFixedSize!300 0))(
  ( (LongMapFixedSize!301 (defaultEntry!1840 Int) (mask!5257 (_ BitVec 32)) (extraKeys!1731 (_ BitVec 32)) (zeroValue!1758 V!2179) (minValue!1758 V!2179) (_size!199 (_ BitVec 32)) (_keys!3347 array!2715) (_values!1823 array!2717) (_vacant!199 (_ BitVec 32))) )
))
(declare-fun map!740 (LongMapFixedSize!300) ListLongMap!1123)

(assert (=> b!41724 (= lt!16853 (map!740 (LongMapFixedSize!301 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16857 lt!16857 #b00000000000000000000000000000000 lt!16854 lt!16856 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1115 0))(
  ( (Nil!1112) (Cons!1111 (h!1688 (_ BitVec 64)) (t!4036 List!1115)) )
))
(declare-fun arrayNoDuplicates!0 (array!2715 (_ BitVec 32) List!1115) Bool)

(assert (=> b!41724 (arrayNoDuplicates!0 lt!16854 #b00000000000000000000000000000000 Nil!1112)))

(declare-datatypes ((Unit!1055 0))(
  ( (Unit!1056) )
))
(declare-fun lt!16859 () Unit!1055)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2715 (_ BitVec 32) (_ BitVec 32) List!1115) Unit!1055)

(assert (=> b!41724 (= lt!16859 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16854 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2715 (_ BitVec 32)) Bool)

(assert (=> b!41724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16854 mask!853)))

(declare-fun lt!16852 () Unit!1055)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2715 (_ BitVec 32) (_ BitVec 32)) Unit!1055)

(assert (=> b!41724 (= lt!16852 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16854 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2715 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41724 (= (arrayCountValidKeys!0 lt!16854 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16855 () Unit!1055)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2715 (_ BitVec 32) (_ BitVec 32)) Unit!1055)

(assert (=> b!41724 (= lt!16855 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16854 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41724 (= lt!16856 (array!2718 ((as const (Array (_ BitVec 32) ValueCell!660)) EmptyCell!660) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41724 (= lt!16854 (array!2716 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!221 (Int (_ BitVec 64)) V!2179)

(assert (=> b!41724 (= lt!16857 (dynLambda!221 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!24859 () Bool)

(assert (=> start!5946 (=> (not res!24859) (not e!26368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5946 (= res!24859 (validMask!0 mask!853))))

(assert (=> start!5946 e!26368))

(assert (=> start!5946 true))

(assert (=> start!5946 tp!5825))

(declare-fun b!41727 () Bool)

(assert (=> b!41727 (= e!26367 true)))

(declare-fun lt!16858 () Bool)

(declare-fun contains!545 (ListLongMap!1123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!338 (array!2715 array!2717 (_ BitVec 32) (_ BitVec 32) V!2179 V!2179 (_ BitVec 32) Int) ListLongMap!1123)

(declare-fun head!876 (List!1114) tuple2!1546)

(assert (=> b!41727 (= lt!16858 (contains!545 (getCurrentListMap!338 lt!16854 lt!16856 mask!853 #b00000000000000000000000000000000 lt!16857 lt!16857 #b00000000000000000000000000000000 defaultEntry!470) (_1!784 (head!876 (toList!577 lt!16853)))))))

(assert (= (and start!5946 res!24859) b!41724))

(assert (= (and b!41724 (not res!24861)) b!41725))

(assert (= (and b!41725 (not res!24860)) b!41726))

(assert (= (and b!41726 (not res!24858)) b!41727))

(declare-fun b_lambda!2149 () Bool)

(assert (=> (not b_lambda!2149) (not b!41724)))

(declare-fun t!4034 () Bool)

(declare-fun tb!907 () Bool)

(assert (=> (and start!5946 (= defaultEntry!470 defaultEntry!470) t!4034) tb!907))

(declare-fun result!1565 () Bool)

(declare-fun tp_is_empty!1815 () Bool)

(assert (=> tb!907 (= result!1565 tp_is_empty!1815)))

(assert (=> b!41724 t!4034))

(declare-fun b_and!2501 () Bool)

(assert (= b_and!2499 (and (=> t!4034 result!1565) b_and!2501)))

(declare-fun m!35235 () Bool)

(assert (=> b!41725 m!35235))

(declare-fun m!35237 () Bool)

(assert (=> b!41724 m!35237))

(declare-fun m!35239 () Bool)

(assert (=> b!41724 m!35239))

(declare-fun m!35241 () Bool)

(assert (=> b!41724 m!35241))

(declare-fun m!35243 () Bool)

(assert (=> b!41724 m!35243))

(declare-fun m!35245 () Bool)

(assert (=> b!41724 m!35245))

(declare-fun m!35247 () Bool)

(assert (=> b!41724 m!35247))

(declare-fun m!35249 () Bool)

(assert (=> b!41724 m!35249))

(declare-fun m!35251 () Bool)

(assert (=> b!41724 m!35251))

(declare-fun m!35253 () Bool)

(assert (=> start!5946 m!35253))

(declare-fun m!35255 () Bool)

(assert (=> b!41727 m!35255))

(declare-fun m!35257 () Bool)

(assert (=> b!41727 m!35257))

(assert (=> b!41727 m!35255))

(declare-fun m!35259 () Bool)

(assert (=> b!41727 m!35259))

(check-sat (not start!5946) (not b_next!1425) (not b!41725) (not b!41724) b_and!2501 (not b_lambda!2149) (not b!41727) tp_is_empty!1815)
(check-sat b_and!2501 (not b_next!1425))
