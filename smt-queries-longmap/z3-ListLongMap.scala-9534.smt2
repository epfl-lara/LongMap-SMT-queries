; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113068 () Bool)

(assert start!113068)

(declare-fun b_free!31119 () Bool)

(declare-fun b_next!31119 () Bool)

(assert (=> start!113068 (= b_free!31119 (not b_next!31119))))

(declare-fun tp!109161 () Bool)

(declare-fun b_and!50149 () Bool)

(assert (=> start!113068 (= tp!109161 b_and!50149)))

(declare-fun b!1340163 () Bool)

(declare-fun res!889009 () Bool)

(declare-fun e!763373 () Bool)

(assert (=> b!1340163 (=> (not res!889009) (not e!763373))))

(declare-datatypes ((array!91092 0))(
  ( (array!91093 (arr!44002 (Array (_ BitVec 32) (_ BitVec 64))) (size!44552 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91092)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340163 (= res!889009 (validKeyInArray!0 (select (arr!44002 _keys!1571) from!1960)))))

(declare-fun b!1340164 () Bool)

(declare-fun e!763371 () Bool)

(declare-fun tp_is_empty!37119 () Bool)

(assert (=> b!1340164 (= e!763371 tp_is_empty!37119)))

(declare-fun mapNonEmpty!57385 () Bool)

(declare-fun mapRes!57385 () Bool)

(declare-fun tp!109162 () Bool)

(declare-fun e!763372 () Bool)

(assert (=> mapNonEmpty!57385 (= mapRes!57385 (and tp!109162 e!763372))))

(declare-datatypes ((V!54595 0))(
  ( (V!54596 (val!18634 Int)) )
))
(declare-datatypes ((ValueCell!17661 0))(
  ( (ValueCellFull!17661 (v!21282 V!54595)) (EmptyCell!17661) )
))
(declare-fun mapValue!57385 () ValueCell!17661)

(declare-fun mapRest!57385 () (Array (_ BitVec 32) ValueCell!17661))

(declare-fun mapKey!57385 () (_ BitVec 32))

(declare-datatypes ((array!91094 0))(
  ( (array!91095 (arr!44003 (Array (_ BitVec 32) ValueCell!17661)) (size!44553 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91094)

(assert (=> mapNonEmpty!57385 (= (arr!44003 _values!1303) (store mapRest!57385 mapKey!57385 mapValue!57385))))

(declare-fun b!1340165 () Bool)

(assert (=> b!1340165 (= e!763372 tp_is_empty!37119)))

(declare-fun b!1340166 () Bool)

(declare-fun res!889008 () Bool)

(assert (=> b!1340166 (=> (not res!889008) (not e!763373))))

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1340166 (= res!889008 (not (= (select (arr!44002 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1340167 () Bool)

(declare-fun e!763369 () Bool)

(assert (=> b!1340167 (= e!763369 (and e!763371 mapRes!57385))))

(declare-fun condMapEmpty!57385 () Bool)

(declare-fun mapDefault!57385 () ValueCell!17661)

(assert (=> b!1340167 (= condMapEmpty!57385 (= (arr!44003 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17661)) mapDefault!57385)))))

(declare-fun b!1340168 () Bool)

(declare-fun res!889013 () Bool)

(assert (=> b!1340168 (=> (not res!889013) (not e!763373))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1340168 (= res!889013 (and (= (size!44553 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44552 _keys!1571) (size!44553 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!889012 () Bool)

(assert (=> start!113068 (=> (not res!889012) (not e!763373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113068 (= res!889012 (validMask!0 mask!1977))))

(assert (=> start!113068 e!763373))

(assert (=> start!113068 tp_is_empty!37119))

(assert (=> start!113068 true))

(declare-fun array_inv!33177 (array!91092) Bool)

(assert (=> start!113068 (array_inv!33177 _keys!1571)))

(declare-fun array_inv!33178 (array!91094) Bool)

(assert (=> start!113068 (and (array_inv!33178 _values!1303) e!763369)))

(assert (=> start!113068 tp!109161))

(declare-fun b!1340169 () Bool)

(assert (=> b!1340169 (= e!763373 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-fun b!1340170 () Bool)

(declare-fun res!889010 () Bool)

(assert (=> b!1340170 (=> (not res!889010) (not e!763373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91092 (_ BitVec 32)) Bool)

(assert (=> b!1340170 (= res!889010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340171 () Bool)

(declare-fun res!889011 () Bool)

(assert (=> b!1340171 (=> (not res!889011) (not e!763373))))

(declare-datatypes ((List!31146 0))(
  ( (Nil!31143) (Cons!31142 (h!32351 (_ BitVec 64)) (t!45478 List!31146)) )
))
(declare-fun arrayNoDuplicates!0 (array!91092 (_ BitVec 32) List!31146) Bool)

(assert (=> b!1340171 (= res!889011 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31143))))

(declare-fun mapIsEmpty!57385 () Bool)

(assert (=> mapIsEmpty!57385 mapRes!57385))

(declare-fun b!1340172 () Bool)

(declare-fun res!889014 () Bool)

(assert (=> b!1340172 (=> (not res!889014) (not e!763373))))

(assert (=> b!1340172 (= res!889014 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44552 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340173 () Bool)

(declare-fun res!889007 () Bool)

(assert (=> b!1340173 (=> (not res!889007) (not e!763373))))

(declare-fun minValue!1245 () V!54595)

(declare-fun zeroValue!1245 () V!54595)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!23982 0))(
  ( (tuple2!23983 (_1!12002 (_ BitVec 64)) (_2!12002 V!54595)) )
))
(declare-datatypes ((List!31147 0))(
  ( (Nil!31144) (Cons!31143 (h!32352 tuple2!23982) (t!45479 List!31147)) )
))
(declare-datatypes ((ListLongMap!21639 0))(
  ( (ListLongMap!21640 (toList!10835 List!31147)) )
))
(declare-fun contains!9011 (ListLongMap!21639 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5804 (array!91092 array!91094 (_ BitVec 32) (_ BitVec 32) V!54595 V!54595 (_ BitVec 32) Int) ListLongMap!21639)

(assert (=> b!1340173 (= res!889007 (contains!9011 (getCurrentListMap!5804 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113068 res!889012) b!1340168))

(assert (= (and b!1340168 res!889013) b!1340170))

(assert (= (and b!1340170 res!889010) b!1340171))

(assert (= (and b!1340171 res!889011) b!1340172))

(assert (= (and b!1340172 res!889014) b!1340173))

(assert (= (and b!1340173 res!889007) b!1340166))

(assert (= (and b!1340166 res!889008) b!1340163))

(assert (= (and b!1340163 res!889009) b!1340169))

(assert (= (and b!1340167 condMapEmpty!57385) mapIsEmpty!57385))

(assert (= (and b!1340167 (not condMapEmpty!57385)) mapNonEmpty!57385))

(get-info :version)

(assert (= (and mapNonEmpty!57385 ((_ is ValueCellFull!17661) mapValue!57385)) b!1340165))

(assert (= (and b!1340167 ((_ is ValueCellFull!17661) mapDefault!57385)) b!1340164))

(assert (= start!113068 b!1340167))

(declare-fun m!1227969 () Bool)

(assert (=> b!1340171 m!1227969))

(declare-fun m!1227971 () Bool)

(assert (=> b!1340163 m!1227971))

(assert (=> b!1340163 m!1227971))

(declare-fun m!1227973 () Bool)

(assert (=> b!1340163 m!1227973))

(declare-fun m!1227975 () Bool)

(assert (=> b!1340170 m!1227975))

(declare-fun m!1227977 () Bool)

(assert (=> mapNonEmpty!57385 m!1227977))

(declare-fun m!1227979 () Bool)

(assert (=> start!113068 m!1227979))

(declare-fun m!1227981 () Bool)

(assert (=> start!113068 m!1227981))

(declare-fun m!1227983 () Bool)

(assert (=> start!113068 m!1227983))

(assert (=> b!1340166 m!1227971))

(declare-fun m!1227985 () Bool)

(assert (=> b!1340173 m!1227985))

(assert (=> b!1340173 m!1227985))

(declare-fun m!1227987 () Bool)

(assert (=> b!1340173 m!1227987))

(check-sat (not b!1340171) (not b!1340170) (not start!113068) (not mapNonEmpty!57385) (not b!1340163) (not b_next!31119) b_and!50149 tp_is_empty!37119 (not b!1340173))
(check-sat b_and!50149 (not b_next!31119))
