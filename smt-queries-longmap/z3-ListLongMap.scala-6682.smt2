; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84232 () Bool)

(assert start!84232)

(declare-fun b_free!19819 () Bool)

(declare-fun b_next!19819 () Bool)

(assert (=> start!84232 (= b_free!19819 (not b_next!19819))))

(declare-fun tp!68980 () Bool)

(declare-fun b_and!31731 () Bool)

(assert (=> start!84232 (= tp!68980 b_and!31731)))

(declare-fun b!983777 () Bool)

(declare-fun res!658088 () Bool)

(declare-fun e!554604 () Bool)

(assert (=> b!983777 (=> (not res!658088) (not e!554604))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983777 (= res!658088 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36329 () Bool)

(declare-fun mapRes!36329 () Bool)

(declare-fun tp!68981 () Bool)

(declare-fun e!554601 () Bool)

(assert (=> mapNonEmpty!36329 (= mapRes!36329 (and tp!68981 e!554601))))

(declare-fun mapKey!36329 () (_ BitVec 32))

(declare-datatypes ((V!35473 0))(
  ( (V!35474 (val!11484 Int)) )
))
(declare-datatypes ((ValueCell!10952 0))(
  ( (ValueCellFull!10952 (v!14043 V!35473)) (EmptyCell!10952) )
))
(declare-fun mapRest!36329 () (Array (_ BitVec 32) ValueCell!10952))

(declare-datatypes ((array!61760 0))(
  ( (array!61761 (arr!29733 (Array (_ BitVec 32) ValueCell!10952)) (size!30213 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61760)

(declare-fun mapValue!36329 () ValueCell!10952)

(assert (=> mapNonEmpty!36329 (= (arr!29733 _values!1278) (store mapRest!36329 mapKey!36329 mapValue!36329))))

(declare-fun mapIsEmpty!36329 () Bool)

(assert (=> mapIsEmpty!36329 mapRes!36329))

(declare-fun res!658084 () Bool)

(assert (=> start!84232 (=> (not res!658084) (not e!554604))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84232 (= res!658084 (validMask!0 mask!1948))))

(assert (=> start!84232 e!554604))

(assert (=> start!84232 true))

(declare-fun tp_is_empty!22867 () Bool)

(assert (=> start!84232 tp_is_empty!22867))

(declare-fun e!554600 () Bool)

(declare-fun array_inv!23005 (array!61760) Bool)

(assert (=> start!84232 (and (array_inv!23005 _values!1278) e!554600)))

(assert (=> start!84232 tp!68980))

(declare-datatypes ((array!61762 0))(
  ( (array!61763 (arr!29734 (Array (_ BitVec 32) (_ BitVec 64))) (size!30214 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61762)

(declare-fun array_inv!23006 (array!61762) Bool)

(assert (=> start!84232 (array_inv!23006 _keys!1544)))

(declare-fun b!983778 () Bool)

(declare-fun e!554603 () Bool)

(assert (=> b!983778 (= e!554600 (and e!554603 mapRes!36329))))

(declare-fun condMapEmpty!36329 () Bool)

(declare-fun mapDefault!36329 () ValueCell!10952)

(assert (=> b!983778 (= condMapEmpty!36329 (= (arr!29733 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10952)) mapDefault!36329)))))

(declare-fun b!983779 () Bool)

(declare-fun res!658090 () Bool)

(assert (=> b!983779 (=> (not res!658090) (not e!554604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61762 (_ BitVec 32)) Bool)

(assert (=> b!983779 (= res!658090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983780 () Bool)

(declare-fun res!658085 () Bool)

(assert (=> b!983780 (=> (not res!658085) (not e!554604))))

(assert (=> b!983780 (= res!658085 (and (= (size!30213 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30214 _keys!1544) (size!30213 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983781 () Bool)

(assert (=> b!983781 (= e!554601 tp_is_empty!22867)))

(declare-fun b!983782 () Bool)

(declare-fun res!658086 () Bool)

(assert (=> b!983782 (=> (not res!658086) (not e!554604))))

(declare-datatypes ((List!20603 0))(
  ( (Nil!20600) (Cons!20599 (h!21767 (_ BitVec 64)) (t!29364 List!20603)) )
))
(declare-fun arrayNoDuplicates!0 (array!61762 (_ BitVec 32) List!20603) Bool)

(assert (=> b!983782 (= res!658086 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20600))))

(declare-fun b!983783 () Bool)

(assert (=> b!983783 (= e!554603 tp_is_empty!22867)))

(declare-fun b!983784 () Bool)

(declare-fun res!658087 () Bool)

(assert (=> b!983784 (=> (not res!658087) (not e!554604))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983784 (= res!658087 (validKeyInArray!0 (select (arr!29734 _keys!1544) from!1932)))))

(declare-fun b!983785 () Bool)

(declare-fun res!658083 () Bool)

(assert (=> b!983785 (=> (not res!658083) (not e!554604))))

(assert (=> b!983785 (= res!658083 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30214 _keys!1544))))))

(declare-fun b!983786 () Bool)

(declare-fun e!554602 () Bool)

(assert (=> b!983786 (= e!554604 e!554602)))

(declare-fun res!658089 () Bool)

(assert (=> b!983786 (=> (not res!658089) (not e!554602))))

(assert (=> b!983786 (= res!658089 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29734 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436682 () V!35473)

(declare-fun get!15452 (ValueCell!10952 V!35473) V!35473)

(declare-fun dynLambda!1831 (Int (_ BitVec 64)) V!35473)

(assert (=> b!983786 (= lt!436682 (get!15452 (select (arr!29733 _values!1278) from!1932) (dynLambda!1831 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35473)

(declare-fun minValue!1220 () V!35473)

(declare-datatypes ((tuple2!14730 0))(
  ( (tuple2!14731 (_1!7376 (_ BitVec 64)) (_2!7376 V!35473)) )
))
(declare-datatypes ((List!20604 0))(
  ( (Nil!20601) (Cons!20600 (h!21768 tuple2!14730) (t!29365 List!20604)) )
))
(declare-datatypes ((ListLongMap!13429 0))(
  ( (ListLongMap!13430 (toList!6730 List!20604)) )
))
(declare-fun lt!436684 () ListLongMap!13429)

(declare-fun getCurrentListMapNoExtraKeys!3472 (array!61762 array!61760 (_ BitVec 32) (_ BitVec 32) V!35473 V!35473 (_ BitVec 32) Int) ListLongMap!13429)

(assert (=> b!983786 (= lt!436684 (getCurrentListMapNoExtraKeys!3472 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983787 () Bool)

(assert (=> b!983787 (= e!554602 (not true))))

(declare-fun lt!436683 () tuple2!14730)

(declare-fun lt!436685 () tuple2!14730)

(declare-fun +!3036 (ListLongMap!13429 tuple2!14730) ListLongMap!13429)

(assert (=> b!983787 (= (+!3036 (+!3036 lt!436684 lt!436683) lt!436685) (+!3036 (+!3036 lt!436684 lt!436685) lt!436683))))

(assert (=> b!983787 (= lt!436685 (tuple2!14731 (select (arr!29734 _keys!1544) from!1932) lt!436682))))

(assert (=> b!983787 (= lt!436683 (tuple2!14731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32652 0))(
  ( (Unit!32653) )
))
(declare-fun lt!436686 () Unit!32652)

(declare-fun addCommutativeForDiffKeys!643 (ListLongMap!13429 (_ BitVec 64) V!35473 (_ BitVec 64) V!35473) Unit!32652)

(assert (=> b!983787 (= lt!436686 (addCommutativeForDiffKeys!643 lt!436684 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29734 _keys!1544) from!1932) lt!436682))))

(assert (= (and start!84232 res!658084) b!983780))

(assert (= (and b!983780 res!658085) b!983779))

(assert (= (and b!983779 res!658090) b!983782))

(assert (= (and b!983782 res!658086) b!983785))

(assert (= (and b!983785 res!658083) b!983784))

(assert (= (and b!983784 res!658087) b!983777))

(assert (= (and b!983777 res!658088) b!983786))

(assert (= (and b!983786 res!658089) b!983787))

(assert (= (and b!983778 condMapEmpty!36329) mapIsEmpty!36329))

(assert (= (and b!983778 (not condMapEmpty!36329)) mapNonEmpty!36329))

(get-info :version)

(assert (= (and mapNonEmpty!36329 ((_ is ValueCellFull!10952) mapValue!36329)) b!983781))

(assert (= (and b!983778 ((_ is ValueCellFull!10952) mapDefault!36329)) b!983783))

(assert (= start!84232 b!983778))

(declare-fun b_lambda!14871 () Bool)

(assert (=> (not b_lambda!14871) (not b!983786)))

(declare-fun t!29363 () Bool)

(declare-fun tb!6611 () Bool)

(assert (=> (and start!84232 (= defaultEntry!1281 defaultEntry!1281) t!29363) tb!6611))

(declare-fun result!13219 () Bool)

(assert (=> tb!6611 (= result!13219 tp_is_empty!22867)))

(assert (=> b!983786 t!29363))

(declare-fun b_and!31733 () Bool)

(assert (= b_and!31731 (and (=> t!29363 result!13219) b_and!31733)))

(declare-fun m!911495 () Bool)

(assert (=> b!983787 m!911495))

(declare-fun m!911497 () Bool)

(assert (=> b!983787 m!911497))

(declare-fun m!911499 () Bool)

(assert (=> b!983787 m!911499))

(declare-fun m!911501 () Bool)

(assert (=> b!983787 m!911501))

(assert (=> b!983787 m!911501))

(declare-fun m!911503 () Bool)

(assert (=> b!983787 m!911503))

(assert (=> b!983787 m!911499))

(declare-fun m!911505 () Bool)

(assert (=> b!983787 m!911505))

(assert (=> b!983787 m!911495))

(assert (=> b!983786 m!911501))

(declare-fun m!911507 () Bool)

(assert (=> b!983786 m!911507))

(declare-fun m!911509 () Bool)

(assert (=> b!983786 m!911509))

(declare-fun m!911511 () Bool)

(assert (=> b!983786 m!911511))

(assert (=> b!983786 m!911507))

(assert (=> b!983786 m!911511))

(declare-fun m!911513 () Bool)

(assert (=> b!983786 m!911513))

(assert (=> b!983784 m!911501))

(assert (=> b!983784 m!911501))

(declare-fun m!911515 () Bool)

(assert (=> b!983784 m!911515))

(declare-fun m!911517 () Bool)

(assert (=> start!84232 m!911517))

(declare-fun m!911519 () Bool)

(assert (=> start!84232 m!911519))

(declare-fun m!911521 () Bool)

(assert (=> start!84232 m!911521))

(declare-fun m!911523 () Bool)

(assert (=> b!983779 m!911523))

(declare-fun m!911525 () Bool)

(assert (=> mapNonEmpty!36329 m!911525))

(declare-fun m!911527 () Bool)

(assert (=> b!983782 m!911527))

(check-sat (not b!983779) (not start!84232) (not b!983786) (not b!983782) (not mapNonEmpty!36329) (not b!983784) tp_is_empty!22867 (not b_next!19819) (not b_lambda!14871) b_and!31733 (not b!983787))
(check-sat b_and!31733 (not b_next!19819))
