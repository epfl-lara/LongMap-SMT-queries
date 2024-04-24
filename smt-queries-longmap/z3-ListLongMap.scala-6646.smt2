; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84016 () Bool)

(assert start!84016)

(declare-fun b_free!19657 () Bool)

(declare-fun b_next!19657 () Bool)

(assert (=> start!84016 (= b_free!19657 (not b_next!19657))))

(declare-fun tp!68413 () Bool)

(declare-fun b_and!31413 () Bool)

(assert (=> start!84016 (= tp!68413 b_and!31413)))

(declare-fun b!980444 () Bool)

(declare-fun res!655879 () Bool)

(declare-fun e!552749 () Bool)

(assert (=> b!980444 (=> (not res!655879) (not e!552749))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61348 0))(
  ( (array!61349 (arr!29527 (Array (_ BitVec 32) (_ BitVec 64))) (size!30007 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61348)

(assert (=> b!980444 (= res!655879 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30007 _keys!1544))))))

(declare-fun b!980445 () Bool)

(declare-fun res!655880 () Bool)

(assert (=> b!980445 (=> (not res!655880) (not e!552749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980445 (= res!655880 (validKeyInArray!0 (select (arr!29527 _keys!1544) from!1932)))))

(declare-fun b!980446 () Bool)

(declare-fun e!552747 () Bool)

(declare-fun tp_is_empty!22651 () Bool)

(assert (=> b!980446 (= e!552747 tp_is_empty!22651)))

(declare-fun mapIsEmpty!36005 () Bool)

(declare-fun mapRes!36005 () Bool)

(assert (=> mapIsEmpty!36005 mapRes!36005))

(declare-fun b!980447 () Bool)

(declare-fun e!552748 () Bool)

(assert (=> b!980447 (= e!552749 (not e!552748))))

(declare-fun res!655883 () Bool)

(assert (=> b!980447 (=> res!655883 e!552748)))

(assert (=> b!980447 (= res!655883 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29527 _keys!1544) from!1932)))))

(declare-datatypes ((V!35185 0))(
  ( (V!35186 (val!11376 Int)) )
))
(declare-datatypes ((tuple2!14604 0))(
  ( (tuple2!14605 (_1!7313 (_ BitVec 64)) (_2!7313 V!35185)) )
))
(declare-fun lt!434901 () tuple2!14604)

(declare-datatypes ((List!20462 0))(
  ( (Nil!20459) (Cons!20458 (h!21626 tuple2!14604) (t!29067 List!20462)) )
))
(declare-datatypes ((ListLongMap!13303 0))(
  ( (ListLongMap!13304 (toList!6667 List!20462)) )
))
(declare-fun lt!434910 () ListLongMap!13303)

(declare-fun lt!434905 () tuple2!14604)

(declare-fun lt!434908 () ListLongMap!13303)

(declare-fun +!2982 (ListLongMap!13303 tuple2!14604) ListLongMap!13303)

(assert (=> b!980447 (= (+!2982 lt!434908 lt!434901) (+!2982 lt!434910 lt!434905))))

(declare-fun lt!434903 () ListLongMap!13303)

(assert (=> b!980447 (= lt!434910 (+!2982 lt!434903 lt!434901))))

(declare-fun lt!434907 () V!35185)

(assert (=> b!980447 (= lt!434901 (tuple2!14605 (select (arr!29527 _keys!1544) from!1932) lt!434907))))

(assert (=> b!980447 (= lt!434908 (+!2982 lt!434903 lt!434905))))

(declare-fun minValue!1220 () V!35185)

(assert (=> b!980447 (= lt!434905 (tuple2!14605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32544 0))(
  ( (Unit!32545) )
))
(declare-fun lt!434902 () Unit!32544)

(declare-fun addCommutativeForDiffKeys!589 (ListLongMap!13303 (_ BitVec 64) V!35185 (_ BitVec 64) V!35185) Unit!32544)

(assert (=> b!980447 (= lt!434902 (addCommutativeForDiffKeys!589 lt!434903 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29527 _keys!1544) from!1932) lt!434907))))

(declare-datatypes ((ValueCell!10844 0))(
  ( (ValueCellFull!10844 (v!13935 V!35185)) (EmptyCell!10844) )
))
(declare-datatypes ((array!61350 0))(
  ( (array!61351 (arr!29528 (Array (_ BitVec 32) ValueCell!10844)) (size!30008 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61350)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15326 (ValueCell!10844 V!35185) V!35185)

(declare-fun dynLambda!1777 (Int (_ BitVec 64)) V!35185)

(assert (=> b!980447 (= lt!434907 (get!15326 (select (arr!29528 _values!1278) from!1932) (dynLambda!1777 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!434904 () ListLongMap!13303)

(declare-fun lt!434909 () tuple2!14604)

(assert (=> b!980447 (= lt!434903 (+!2982 lt!434904 lt!434909))))

(declare-fun zeroValue!1220 () V!35185)

(assert (=> b!980447 (= lt!434909 (tuple2!14605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3415 (array!61348 array!61350 (_ BitVec 32) (_ BitVec 32) V!35185 V!35185 (_ BitVec 32) Int) ListLongMap!13303)

(assert (=> b!980447 (= lt!434904 (getCurrentListMapNoExtraKeys!3415 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!655882 () Bool)

(assert (=> start!84016 (=> (not res!655882) (not e!552749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84016 (= res!655882 (validMask!0 mask!1948))))

(assert (=> start!84016 e!552749))

(assert (=> start!84016 true))

(assert (=> start!84016 tp_is_empty!22651))

(declare-fun e!552745 () Bool)

(declare-fun array_inv!22865 (array!61350) Bool)

(assert (=> start!84016 (and (array_inv!22865 _values!1278) e!552745)))

(assert (=> start!84016 tp!68413))

(declare-fun array_inv!22866 (array!61348) Bool)

(assert (=> start!84016 (array_inv!22866 _keys!1544)))

(declare-fun b!980448 () Bool)

(declare-fun res!655885 () Bool)

(assert (=> b!980448 (=> (not res!655885) (not e!552749))))

(declare-datatypes ((List!20463 0))(
  ( (Nil!20460) (Cons!20459 (h!21627 (_ BitVec 64)) (t!29068 List!20463)) )
))
(declare-fun arrayNoDuplicates!0 (array!61348 (_ BitVec 32) List!20463) Bool)

(assert (=> b!980448 (= res!655885 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20460))))

(declare-fun b!980449 () Bool)

(assert (=> b!980449 (= e!552745 (and e!552747 mapRes!36005))))

(declare-fun condMapEmpty!36005 () Bool)

(declare-fun mapDefault!36005 () ValueCell!10844)

(assert (=> b!980449 (= condMapEmpty!36005 (= (arr!29528 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10844)) mapDefault!36005)))))

(declare-fun mapNonEmpty!36005 () Bool)

(declare-fun tp!68414 () Bool)

(declare-fun e!552746 () Bool)

(assert (=> mapNonEmpty!36005 (= mapRes!36005 (and tp!68414 e!552746))))

(declare-fun mapRest!36005 () (Array (_ BitVec 32) ValueCell!10844))

(declare-fun mapKey!36005 () (_ BitVec 32))

(declare-fun mapValue!36005 () ValueCell!10844)

(assert (=> mapNonEmpty!36005 (= (arr!29528 _values!1278) (store mapRest!36005 mapKey!36005 mapValue!36005))))

(declare-fun b!980450 () Bool)

(assert (=> b!980450 (= e!552746 tp_is_empty!22651)))

(declare-fun b!980451 () Bool)

(assert (=> b!980451 (= e!552748 true)))

(assert (=> b!980451 (= lt!434910 (+!2982 (+!2982 lt!434904 lt!434901) lt!434909))))

(declare-fun lt!434906 () Unit!32544)

(assert (=> b!980451 (= lt!434906 (addCommutativeForDiffKeys!589 lt!434904 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29527 _keys!1544) from!1932) lt!434907))))

(declare-fun b!980452 () Bool)

(declare-fun res!655881 () Bool)

(assert (=> b!980452 (=> (not res!655881) (not e!552749))))

(assert (=> b!980452 (= res!655881 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980453 () Bool)

(declare-fun res!655884 () Bool)

(assert (=> b!980453 (=> (not res!655884) (not e!552749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61348 (_ BitVec 32)) Bool)

(assert (=> b!980453 (= res!655884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980454 () Bool)

(declare-fun res!655878 () Bool)

(assert (=> b!980454 (=> (not res!655878) (not e!552749))))

(assert (=> b!980454 (= res!655878 (and (= (size!30008 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30007 _keys!1544) (size!30008 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84016 res!655882) b!980454))

(assert (= (and b!980454 res!655878) b!980453))

(assert (= (and b!980453 res!655884) b!980448))

(assert (= (and b!980448 res!655885) b!980444))

(assert (= (and b!980444 res!655879) b!980445))

(assert (= (and b!980445 res!655880) b!980452))

(assert (= (and b!980452 res!655881) b!980447))

(assert (= (and b!980447 (not res!655883)) b!980451))

(assert (= (and b!980449 condMapEmpty!36005) mapIsEmpty!36005))

(assert (= (and b!980449 (not condMapEmpty!36005)) mapNonEmpty!36005))

(get-info :version)

(assert (= (and mapNonEmpty!36005 ((_ is ValueCellFull!10844) mapValue!36005)) b!980450))

(assert (= (and b!980449 ((_ is ValueCellFull!10844) mapDefault!36005)) b!980446))

(assert (= start!84016 b!980449))

(declare-fun b_lambda!14715 () Bool)

(assert (=> (not b_lambda!14715) (not b!980447)))

(declare-fun t!29066 () Bool)

(declare-fun tb!6455 () Bool)

(assert (=> (and start!84016 (= defaultEntry!1281 defaultEntry!1281) t!29066) tb!6455))

(declare-fun result!12907 () Bool)

(assert (=> tb!6455 (= result!12907 tp_is_empty!22651)))

(assert (=> b!980447 t!29066))

(declare-fun b_and!31415 () Bool)

(assert (= b_and!31413 (and (=> t!29066 result!12907) b_and!31415)))

(declare-fun m!908165 () Bool)

(assert (=> b!980451 m!908165))

(assert (=> b!980451 m!908165))

(declare-fun m!908167 () Bool)

(assert (=> b!980451 m!908167))

(declare-fun m!908169 () Bool)

(assert (=> b!980451 m!908169))

(assert (=> b!980451 m!908169))

(declare-fun m!908171 () Bool)

(assert (=> b!980451 m!908171))

(declare-fun m!908173 () Bool)

(assert (=> start!84016 m!908173))

(declare-fun m!908175 () Bool)

(assert (=> start!84016 m!908175))

(declare-fun m!908177 () Bool)

(assert (=> start!84016 m!908177))

(declare-fun m!908179 () Bool)

(assert (=> b!980447 m!908179))

(declare-fun m!908181 () Bool)

(assert (=> b!980447 m!908181))

(declare-fun m!908183 () Bool)

(assert (=> b!980447 m!908183))

(declare-fun m!908185 () Bool)

(assert (=> b!980447 m!908185))

(declare-fun m!908187 () Bool)

(assert (=> b!980447 m!908187))

(declare-fun m!908189 () Bool)

(assert (=> b!980447 m!908189))

(declare-fun m!908191 () Bool)

(assert (=> b!980447 m!908191))

(assert (=> b!980447 m!908169))

(assert (=> b!980447 m!908169))

(declare-fun m!908193 () Bool)

(assert (=> b!980447 m!908193))

(declare-fun m!908195 () Bool)

(assert (=> b!980447 m!908195))

(assert (=> b!980447 m!908179))

(assert (=> b!980447 m!908195))

(declare-fun m!908197 () Bool)

(assert (=> b!980447 m!908197))

(declare-fun m!908199 () Bool)

(assert (=> mapNonEmpty!36005 m!908199))

(declare-fun m!908201 () Bool)

(assert (=> b!980453 m!908201))

(assert (=> b!980445 m!908169))

(assert (=> b!980445 m!908169))

(declare-fun m!908203 () Bool)

(assert (=> b!980445 m!908203))

(declare-fun m!908205 () Bool)

(assert (=> b!980448 m!908205))

(check-sat (not start!84016) tp_is_empty!22651 (not b!980447) b_and!31415 (not b!980453) (not b_lambda!14715) (not b!980448) (not b_next!19657) (not b!980445) (not mapNonEmpty!36005) (not b!980451))
(check-sat b_and!31415 (not b_next!19657))
