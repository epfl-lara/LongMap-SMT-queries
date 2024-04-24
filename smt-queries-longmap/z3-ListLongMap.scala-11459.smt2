; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133964 () Bool)

(assert start!133964)

(declare-fun b_free!31969 () Bool)

(declare-fun b_next!31969 () Bool)

(assert (=> start!133964 (= b_free!31969 (not b_next!31969))))

(declare-fun tp!113030 () Bool)

(declare-fun b_and!51451 () Bool)

(assert (=> start!133964 (= tp!113030 b_and!51451)))

(declare-fun b!1563762 () Bool)

(declare-fun res!1068415 () Bool)

(declare-fun e!871602 () Bool)

(assert (=> b!1563762 (=> (not res!1068415) (not e!871602))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104104 0))(
  ( (array!104105 (arr!50237 (Array (_ BitVec 32) (_ BitVec 64))) (size!50788 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104104)

(declare-datatypes ((V!59721 0))(
  ( (V!59722 (val!19401 Int)) )
))
(declare-datatypes ((ValueCell!18287 0))(
  ( (ValueCellFull!18287 (v!22145 V!59721)) (EmptyCell!18287) )
))
(declare-datatypes ((array!104106 0))(
  ( (array!104107 (arr!50238 (Array (_ BitVec 32) ValueCell!18287)) (size!50789 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104106)

(assert (=> b!1563762 (= res!1068415 (and (= (size!50789 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50788 _keys!637) (size!50789 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563764 () Bool)

(declare-fun e!871601 () Bool)

(declare-fun tp_is_empty!38635 () Bool)

(assert (=> b!1563764 (= e!871601 tp_is_empty!38635)))

(declare-fun b!1563765 () Bool)

(declare-fun res!1068416 () Bool)

(assert (=> b!1563765 (=> (not res!1068416) (not e!871602))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1563765 (= res!1068416 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50788 _keys!637)) (bvslt from!782 (size!50788 _keys!637))))))

(declare-fun mapNonEmpty!59328 () Bool)

(declare-fun mapRes!59328 () Bool)

(declare-fun tp!113031 () Bool)

(declare-fun e!871599 () Bool)

(assert (=> mapNonEmpty!59328 (= mapRes!59328 (and tp!113031 e!871599))))

(declare-fun mapKey!59328 () (_ BitVec 32))

(declare-fun mapValue!59328 () ValueCell!18287)

(declare-fun mapRest!59328 () (Array (_ BitVec 32) ValueCell!18287))

(assert (=> mapNonEmpty!59328 (= (arr!50238 _values!487) (store mapRest!59328 mapKey!59328 mapValue!59328))))

(declare-fun b!1563766 () Bool)

(declare-fun res!1068418 () Bool)

(assert (=> b!1563766 (=> (not res!1068418) (not e!871602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104104 (_ BitVec 32)) Bool)

(assert (=> b!1563766 (= res!1068418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59328 () Bool)

(assert (=> mapIsEmpty!59328 mapRes!59328))

(declare-fun b!1563767 () Bool)

(declare-fun e!871603 () Bool)

(assert (=> b!1563767 (= e!871603 (and e!871601 mapRes!59328))))

(declare-fun condMapEmpty!59328 () Bool)

(declare-fun mapDefault!59328 () ValueCell!18287)

(assert (=> b!1563767 (= condMapEmpty!59328 (= (arr!50238 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18287)) mapDefault!59328)))))

(declare-fun b!1563768 () Bool)

(declare-fun res!1068414 () Bool)

(assert (=> b!1563768 (=> (not res!1068414) (not e!871602))))

(declare-datatypes ((List!36458 0))(
  ( (Nil!36455) (Cons!36454 (h!37918 (_ BitVec 64)) (t!51209 List!36458)) )
))
(declare-fun arrayNoDuplicates!0 (array!104104 (_ BitVec 32) List!36458) Bool)

(assert (=> b!1563768 (= res!1068414 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36455))))

(declare-fun b!1563769 () Bool)

(assert (=> b!1563769 (= e!871602 (not true))))

(declare-datatypes ((tuple2!25118 0))(
  ( (tuple2!25119 (_1!12570 (_ BitVec 64)) (_2!12570 V!59721)) )
))
(declare-datatypes ((List!36459 0))(
  ( (Nil!36456) (Cons!36455 (h!37919 tuple2!25118) (t!51210 List!36459)) )
))
(declare-datatypes ((ListLongMap!22561 0))(
  ( (ListLongMap!22562 (toList!11296 List!36459)) )
))
(declare-fun lt!672086 () ListLongMap!22561)

(declare-fun lt!672085 () V!59721)

(declare-fun contains!10297 (ListLongMap!22561 (_ BitVec 64)) Bool)

(declare-fun +!5072 (ListLongMap!22561 tuple2!25118) ListLongMap!22561)

(assert (=> b!1563769 (not (contains!10297 (+!5072 lt!672086 (tuple2!25119 (select (arr!50237 _keys!637) from!782) lt!672085)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51829 0))(
  ( (Unit!51830) )
))
(declare-fun lt!672084 () Unit!51829)

(declare-fun addStillNotContains!523 (ListLongMap!22561 (_ BitVec 64) V!59721 (_ BitVec 64)) Unit!51829)

(assert (=> b!1563769 (= lt!672084 (addStillNotContains!523 lt!672086 (select (arr!50237 _keys!637) from!782) lt!672085 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26240 (ValueCell!18287 V!59721) V!59721)

(declare-fun dynLambda!3870 (Int (_ BitVec 64)) V!59721)

(assert (=> b!1563769 (= lt!672085 (get!26240 (select (arr!50238 _values!487) from!782) (dynLambda!3870 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59721)

(declare-fun minValue!453 () V!59721)

(declare-fun getCurrentListMapNoExtraKeys!6695 (array!104104 array!104106 (_ BitVec 32) (_ BitVec 32) V!59721 V!59721 (_ BitVec 32) Int) ListLongMap!22561)

(assert (=> b!1563769 (= lt!672086 (getCurrentListMapNoExtraKeys!6695 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563770 () Bool)

(assert (=> b!1563770 (= e!871599 tp_is_empty!38635)))

(declare-fun b!1563763 () Bool)

(declare-fun res!1068417 () Bool)

(assert (=> b!1563763 (=> (not res!1068417) (not e!871602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563763 (= res!1068417 (validKeyInArray!0 (select (arr!50237 _keys!637) from!782)))))

(declare-fun res!1068419 () Bool)

(assert (=> start!133964 (=> (not res!1068419) (not e!871602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133964 (= res!1068419 (validMask!0 mask!947))))

(assert (=> start!133964 e!871602))

(assert (=> start!133964 tp!113030))

(assert (=> start!133964 tp_is_empty!38635))

(assert (=> start!133964 true))

(declare-fun array_inv!39295 (array!104104) Bool)

(assert (=> start!133964 (array_inv!39295 _keys!637)))

(declare-fun array_inv!39296 (array!104106) Bool)

(assert (=> start!133964 (and (array_inv!39296 _values!487) e!871603)))

(assert (= (and start!133964 res!1068419) b!1563762))

(assert (= (and b!1563762 res!1068415) b!1563766))

(assert (= (and b!1563766 res!1068418) b!1563768))

(assert (= (and b!1563768 res!1068414) b!1563765))

(assert (= (and b!1563765 res!1068416) b!1563763))

(assert (= (and b!1563763 res!1068417) b!1563769))

(assert (= (and b!1563767 condMapEmpty!59328) mapIsEmpty!59328))

(assert (= (and b!1563767 (not condMapEmpty!59328)) mapNonEmpty!59328))

(get-info :version)

(assert (= (and mapNonEmpty!59328 ((_ is ValueCellFull!18287) mapValue!59328)) b!1563770))

(assert (= (and b!1563767 ((_ is ValueCellFull!18287) mapDefault!59328)) b!1563764))

(assert (= start!133964 b!1563767))

(declare-fun b_lambda!24837 () Bool)

(assert (=> (not b_lambda!24837) (not b!1563769)))

(declare-fun t!51208 () Bool)

(declare-fun tb!12505 () Bool)

(assert (=> (and start!133964 (= defaultEntry!495 defaultEntry!495) t!51208) tb!12505))

(declare-fun result!26299 () Bool)

(assert (=> tb!12505 (= result!26299 tp_is_empty!38635)))

(assert (=> b!1563769 t!51208))

(declare-fun b_and!51453 () Bool)

(assert (= b_and!51451 (and (=> t!51208 result!26299) b_and!51453)))

(declare-fun m!1439259 () Bool)

(assert (=> b!1563763 m!1439259))

(assert (=> b!1563763 m!1439259))

(declare-fun m!1439261 () Bool)

(assert (=> b!1563763 m!1439261))

(declare-fun m!1439263 () Bool)

(assert (=> mapNonEmpty!59328 m!1439263))

(declare-fun m!1439265 () Bool)

(assert (=> start!133964 m!1439265))

(declare-fun m!1439267 () Bool)

(assert (=> start!133964 m!1439267))

(declare-fun m!1439269 () Bool)

(assert (=> start!133964 m!1439269))

(declare-fun m!1439271 () Bool)

(assert (=> b!1563766 m!1439271))

(declare-fun m!1439273 () Bool)

(assert (=> b!1563769 m!1439273))

(declare-fun m!1439275 () Bool)

(assert (=> b!1563769 m!1439275))

(declare-fun m!1439277 () Bool)

(assert (=> b!1563769 m!1439277))

(declare-fun m!1439279 () Bool)

(assert (=> b!1563769 m!1439279))

(assert (=> b!1563769 m!1439259))

(declare-fun m!1439281 () Bool)

(assert (=> b!1563769 m!1439281))

(assert (=> b!1563769 m!1439273))

(assert (=> b!1563769 m!1439259))

(assert (=> b!1563769 m!1439279))

(declare-fun m!1439283 () Bool)

(assert (=> b!1563769 m!1439283))

(assert (=> b!1563769 m!1439275))

(declare-fun m!1439285 () Bool)

(assert (=> b!1563769 m!1439285))

(declare-fun m!1439287 () Bool)

(assert (=> b!1563768 m!1439287))

(check-sat (not b_lambda!24837) (not b_next!31969) (not start!133964) tp_is_empty!38635 (not b!1563769) (not b!1563763) (not mapNonEmpty!59328) (not b!1563768) (not b!1563766) b_and!51453)
(check-sat b_and!51453 (not b_next!31969))
