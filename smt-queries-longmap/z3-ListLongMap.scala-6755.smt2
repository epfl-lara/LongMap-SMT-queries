; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84716 () Bool)

(assert start!84716)

(declare-fun b_free!20089 () Bool)

(declare-fun b_next!20089 () Bool)

(assert (=> start!84716 (= b_free!20089 (not b_next!20089))))

(declare-fun tp!70067 () Bool)

(declare-fun b_and!32233 () Bool)

(assert (=> start!84716 (= tp!70067 b_and!32233)))

(declare-fun b!990649 () Bool)

(declare-fun res!662376 () Bool)

(declare-fun e!558605 () Bool)

(assert (=> b!990649 (=> (not res!662376) (not e!558605))))

(declare-datatypes ((array!62504 0))(
  ( (array!62505 (arr!30103 (Array (_ BitVec 32) (_ BitVec 64))) (size!30584 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62504)

(declare-datatypes ((List!20884 0))(
  ( (Nil!20881) (Cons!20880 (h!22042 (_ BitVec 64)) (t!29852 List!20884)) )
))
(declare-fun arrayNoDuplicates!0 (array!62504 (_ BitVec 32) List!20884) Bool)

(assert (=> b!990649 (= res!662376 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20881))))

(declare-fun b!990650 () Bool)

(declare-fun e!558607 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((V!36057 0))(
  ( (V!36058 (val!11703 Int)) )
))
(declare-datatypes ((ValueCell!11171 0))(
  ( (ValueCellFull!11171 (v!14275 V!36057)) (EmptyCell!11171) )
))
(declare-datatypes ((array!62506 0))(
  ( (array!62507 (arr!30104 (Array (_ BitVec 32) ValueCell!11171)) (size!30585 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62506)

(assert (=> b!990650 (= e!558607 (bvsge from!1932 (size!30585 _values!1278)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!36057)

(declare-fun zeroValue!1220 () V!36057)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!15004 0))(
  ( (tuple2!15005 (_1!7513 (_ BitVec 64)) (_2!7513 V!36057)) )
))
(declare-datatypes ((List!20885 0))(
  ( (Nil!20882) (Cons!20881 (h!22043 tuple2!15004) (t!29853 List!20885)) )
))
(declare-datatypes ((ListLongMap!13691 0))(
  ( (ListLongMap!13692 (toList!6861 List!20885)) )
))
(declare-fun lt!439458 () ListLongMap!13691)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMap!3830 (array!62504 array!62506 (_ BitVec 32) (_ BitVec 32) V!36057 V!36057 (_ BitVec 32) Int) ListLongMap!13691)

(assert (=> b!990650 (= lt!439458 (getCurrentListMap!3830 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!990651 () Bool)

(declare-fun res!662374 () Bool)

(assert (=> b!990651 (=> (not res!662374) (not e!558605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990651 (= res!662374 (validKeyInArray!0 (select (arr!30103 _keys!1544) from!1932)))))

(declare-fun b!990652 () Bool)

(assert (=> b!990652 (= e!558605 e!558607)))

(declare-fun res!662372 () Bool)

(assert (=> b!990652 (=> (not res!662372) (not e!558607))))

(declare-fun lt!439457 () Bool)

(assert (=> b!990652 (= res!662372 (and (or lt!439457 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!439457 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!439457))))))

(assert (=> b!990652 (= lt!439457 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!990653 () Bool)

(declare-fun e!558604 () Bool)

(declare-fun e!558602 () Bool)

(declare-fun mapRes!37010 () Bool)

(assert (=> b!990653 (= e!558604 (and e!558602 mapRes!37010))))

(declare-fun condMapEmpty!37010 () Bool)

(declare-fun mapDefault!37010 () ValueCell!11171)

(assert (=> b!990653 (= condMapEmpty!37010 (= (arr!30104 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11171)) mapDefault!37010)))))

(declare-fun b!990654 () Bool)

(declare-fun tp_is_empty!23305 () Bool)

(assert (=> b!990654 (= e!558602 tp_is_empty!23305)))

(declare-fun b!990655 () Bool)

(declare-fun res!662373 () Bool)

(assert (=> b!990655 (=> (not res!662373) (not e!558605))))

(assert (=> b!990655 (= res!662373 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30584 _keys!1544))))))

(declare-fun mapNonEmpty!37010 () Bool)

(declare-fun tp!70066 () Bool)

(declare-fun e!558606 () Bool)

(assert (=> mapNonEmpty!37010 (= mapRes!37010 (and tp!70066 e!558606))))

(declare-fun mapKey!37010 () (_ BitVec 32))

(declare-fun mapRest!37010 () (Array (_ BitVec 32) ValueCell!11171))

(declare-fun mapValue!37010 () ValueCell!11171)

(assert (=> mapNonEmpty!37010 (= (arr!30104 _values!1278) (store mapRest!37010 mapKey!37010 mapValue!37010))))

(declare-fun res!662375 () Bool)

(assert (=> start!84716 (=> (not res!662375) (not e!558605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84716 (= res!662375 (validMask!0 mask!1948))))

(assert (=> start!84716 e!558605))

(assert (=> start!84716 true))

(assert (=> start!84716 tp_is_empty!23305))

(declare-fun array_inv!23261 (array!62506) Bool)

(assert (=> start!84716 (and (array_inv!23261 _values!1278) e!558604)))

(assert (=> start!84716 tp!70067))

(declare-fun array_inv!23262 (array!62504) Bool)

(assert (=> start!84716 (array_inv!23262 _keys!1544)))

(declare-fun mapIsEmpty!37010 () Bool)

(assert (=> mapIsEmpty!37010 mapRes!37010))

(declare-fun b!990656 () Bool)

(declare-fun res!662371 () Bool)

(assert (=> b!990656 (=> (not res!662371) (not e!558605))))

(assert (=> b!990656 (= res!662371 (and (= (size!30585 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30584 _keys!1544) (size!30585 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!990657 () Bool)

(declare-fun res!662377 () Bool)

(assert (=> b!990657 (=> (not res!662377) (not e!558605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62504 (_ BitVec 32)) Bool)

(assert (=> b!990657 (= res!662377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!990658 () Bool)

(assert (=> b!990658 (= e!558606 tp_is_empty!23305)))

(assert (= (and start!84716 res!662375) b!990656))

(assert (= (and b!990656 res!662371) b!990657))

(assert (= (and b!990657 res!662377) b!990649))

(assert (= (and b!990649 res!662376) b!990655))

(assert (= (and b!990655 res!662373) b!990651))

(assert (= (and b!990651 res!662374) b!990652))

(assert (= (and b!990652 res!662372) b!990650))

(assert (= (and b!990653 condMapEmpty!37010) mapIsEmpty!37010))

(assert (= (and b!990653 (not condMapEmpty!37010)) mapNonEmpty!37010))

(get-info :version)

(assert (= (and mapNonEmpty!37010 ((_ is ValueCellFull!11171) mapValue!37010)) b!990658))

(assert (= (and b!990653 ((_ is ValueCellFull!11171) mapDefault!37010)) b!990654))

(assert (= start!84716 b!990653))

(declare-fun m!917917 () Bool)

(assert (=> mapNonEmpty!37010 m!917917))

(declare-fun m!917919 () Bool)

(assert (=> b!990651 m!917919))

(assert (=> b!990651 m!917919))

(declare-fun m!917921 () Bool)

(assert (=> b!990651 m!917921))

(declare-fun m!917923 () Bool)

(assert (=> b!990657 m!917923))

(declare-fun m!917925 () Bool)

(assert (=> b!990649 m!917925))

(declare-fun m!917927 () Bool)

(assert (=> b!990650 m!917927))

(declare-fun m!917929 () Bool)

(assert (=> start!84716 m!917929))

(declare-fun m!917931 () Bool)

(assert (=> start!84716 m!917931))

(declare-fun m!917933 () Bool)

(assert (=> start!84716 m!917933))

(check-sat (not mapNonEmpty!37010) (not b_next!20089) (not b!990657) tp_is_empty!23305 (not b!990649) b_and!32233 (not b!990651) (not start!84716) (not b!990650))
(check-sat b_and!32233 (not b_next!20089))
