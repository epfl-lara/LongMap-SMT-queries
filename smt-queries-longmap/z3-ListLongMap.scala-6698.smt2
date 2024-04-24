; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84328 () Bool)

(assert start!84328)

(declare-fun b_free!19861 () Bool)

(declare-fun b_next!19861 () Bool)

(assert (=> start!84328 (= b_free!19861 (not b_next!19861))))

(declare-fun tp!69188 () Bool)

(declare-fun b_and!31809 () Bool)

(assert (=> start!84328 (= tp!69188 b_and!31809)))

(declare-fun b!985010 () Bool)

(declare-fun res!658853 () Bool)

(declare-fun e!555374 () Bool)

(assert (=> b!985010 (=> (not res!658853) (not e!555374))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985010 (= res!658853 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985011 () Bool)

(declare-fun res!658855 () Bool)

(assert (=> b!985011 (=> (not res!658855) (not e!555374))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35601 0))(
  ( (V!35602 (val!11532 Int)) )
))
(declare-datatypes ((ValueCell!11000 0))(
  ( (ValueCellFull!11000 (v!14091 V!35601)) (EmptyCell!11000) )
))
(declare-datatypes ((array!61946 0))(
  ( (array!61947 (arr!29826 (Array (_ BitVec 32) ValueCell!11000)) (size!30306 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61946)

(declare-datatypes ((array!61948 0))(
  ( (array!61949 (arr!29827 (Array (_ BitVec 32) (_ BitVec 64))) (size!30307 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61948)

(assert (=> b!985011 (= res!658855 (and (= (size!30306 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30307 _keys!1544) (size!30306 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985012 () Bool)

(declare-fun e!555375 () Bool)

(declare-fun tp_is_empty!22963 () Bool)

(assert (=> b!985012 (= e!555375 tp_is_empty!22963)))

(declare-fun mapNonEmpty!36473 () Bool)

(declare-fun mapRes!36473 () Bool)

(declare-fun tp!69187 () Bool)

(declare-fun e!555373 () Bool)

(assert (=> mapNonEmpty!36473 (= mapRes!36473 (and tp!69187 e!555373))))

(declare-fun mapValue!36473 () ValueCell!11000)

(declare-fun mapRest!36473 () (Array (_ BitVec 32) ValueCell!11000))

(declare-fun mapKey!36473 () (_ BitVec 32))

(assert (=> mapNonEmpty!36473 (= (arr!29826 _values!1278) (store mapRest!36473 mapKey!36473 mapValue!36473))))

(declare-fun b!985013 () Bool)

(declare-fun e!555377 () Bool)

(assert (=> b!985013 (= e!555374 e!555377)))

(declare-fun res!658848 () Bool)

(assert (=> b!985013 (=> (not res!658848) (not e!555377))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985013 (= res!658848 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29827 _keys!1544) from!1932))))))

(declare-fun lt!437037 () V!35601)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15496 (ValueCell!11000 V!35601) V!35601)

(declare-fun dynLambda!1843 (Int (_ BitVec 64)) V!35601)

(assert (=> b!985013 (= lt!437037 (get!15496 (select (arr!29826 _values!1278) from!1932) (dynLambda!1843 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35601)

(declare-fun zeroValue!1220 () V!35601)

(declare-datatypes ((tuple2!14768 0))(
  ( (tuple2!14769 (_1!7395 (_ BitVec 64)) (_2!7395 V!35601)) )
))
(declare-datatypes ((List!20651 0))(
  ( (Nil!20648) (Cons!20647 (h!21815 tuple2!14768) (t!29448 List!20651)) )
))
(declare-datatypes ((ListLongMap!13467 0))(
  ( (ListLongMap!13468 (toList!6749 List!20651)) )
))
(declare-fun lt!437033 () ListLongMap!13467)

(declare-fun getCurrentListMapNoExtraKeys!3486 (array!61948 array!61946 (_ BitVec 32) (_ BitVec 32) V!35601 V!35601 (_ BitVec 32) Int) ListLongMap!13467)

(assert (=> b!985013 (= lt!437033 (getCurrentListMapNoExtraKeys!3486 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985014 () Bool)

(declare-fun e!555378 () Bool)

(assert (=> b!985014 (= e!555378 (and e!555375 mapRes!36473))))

(declare-fun condMapEmpty!36473 () Bool)

(declare-fun mapDefault!36473 () ValueCell!11000)

(assert (=> b!985014 (= condMapEmpty!36473 (= (arr!29826 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11000)) mapDefault!36473)))))

(declare-fun res!658851 () Bool)

(assert (=> start!84328 (=> (not res!658851) (not e!555374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84328 (= res!658851 (validMask!0 mask!1948))))

(assert (=> start!84328 e!555374))

(assert (=> start!84328 true))

(assert (=> start!84328 tp_is_empty!22963))

(declare-fun array_inv!23077 (array!61946) Bool)

(assert (=> start!84328 (and (array_inv!23077 _values!1278) e!555378)))

(assert (=> start!84328 tp!69188))

(declare-fun array_inv!23078 (array!61948) Bool)

(assert (=> start!84328 (array_inv!23078 _keys!1544)))

(declare-fun b!985015 () Bool)

(assert (=> b!985015 (= e!555377 (not true))))

(declare-fun lt!437034 () tuple2!14768)

(declare-fun lt!437036 () tuple2!14768)

(declare-fun +!3052 (ListLongMap!13467 tuple2!14768) ListLongMap!13467)

(assert (=> b!985015 (= (+!3052 (+!3052 lt!437033 lt!437034) lt!437036) (+!3052 (+!3052 lt!437033 lt!437036) lt!437034))))

(assert (=> b!985015 (= lt!437036 (tuple2!14769 (select (arr!29827 _keys!1544) from!1932) lt!437037))))

(assert (=> b!985015 (= lt!437034 (tuple2!14769 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32684 0))(
  ( (Unit!32685) )
))
(declare-fun lt!437035 () Unit!32684)

(declare-fun addCommutativeForDiffKeys!659 (ListLongMap!13467 (_ BitVec 64) V!35601 (_ BitVec 64) V!35601) Unit!32684)

(assert (=> b!985015 (= lt!437035 (addCommutativeForDiffKeys!659 lt!437033 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29827 _keys!1544) from!1932) lt!437037))))

(declare-fun b!985016 () Bool)

(declare-fun res!658850 () Bool)

(assert (=> b!985016 (=> (not res!658850) (not e!555374))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985016 (= res!658850 (validKeyInArray!0 (select (arr!29827 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36473 () Bool)

(assert (=> mapIsEmpty!36473 mapRes!36473))

(declare-fun b!985017 () Bool)

(assert (=> b!985017 (= e!555373 tp_is_empty!22963)))

(declare-fun b!985018 () Bool)

(declare-fun res!658852 () Bool)

(assert (=> b!985018 (=> (not res!658852) (not e!555374))))

(assert (=> b!985018 (= res!658852 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30307 _keys!1544))))))

(declare-fun b!985019 () Bool)

(declare-fun res!658854 () Bool)

(assert (=> b!985019 (=> (not res!658854) (not e!555374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61948 (_ BitVec 32)) Bool)

(assert (=> b!985019 (= res!658854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985020 () Bool)

(declare-fun res!658849 () Bool)

(assert (=> b!985020 (=> (not res!658849) (not e!555374))))

(declare-datatypes ((List!20652 0))(
  ( (Nil!20649) (Cons!20648 (h!21816 (_ BitVec 64)) (t!29449 List!20652)) )
))
(declare-fun arrayNoDuplicates!0 (array!61948 (_ BitVec 32) List!20652) Bool)

(assert (=> b!985020 (= res!658849 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20649))))

(assert (= (and start!84328 res!658851) b!985011))

(assert (= (and b!985011 res!658855) b!985019))

(assert (= (and b!985019 res!658854) b!985020))

(assert (= (and b!985020 res!658849) b!985018))

(assert (= (and b!985018 res!658852) b!985016))

(assert (= (and b!985016 res!658850) b!985010))

(assert (= (and b!985010 res!658853) b!985013))

(assert (= (and b!985013 res!658848) b!985015))

(assert (= (and b!985014 condMapEmpty!36473) mapIsEmpty!36473))

(assert (= (and b!985014 (not condMapEmpty!36473)) mapNonEmpty!36473))

(get-info :version)

(assert (= (and mapNonEmpty!36473 ((_ is ValueCellFull!11000) mapValue!36473)) b!985017))

(assert (= (and b!985014 ((_ is ValueCellFull!11000) mapDefault!36473)) b!985012))

(assert (= start!84328 b!985014))

(declare-fun b_lambda!14907 () Bool)

(assert (=> (not b_lambda!14907) (not b!985013)))

(declare-fun t!29447 () Bool)

(declare-fun tb!6647 () Bool)

(assert (=> (and start!84328 (= defaultEntry!1281 defaultEntry!1281) t!29447) tb!6647))

(declare-fun result!13291 () Bool)

(assert (=> tb!6647 (= result!13291 tp_is_empty!22963)))

(assert (=> b!985013 t!29447))

(declare-fun b_and!31811 () Bool)

(assert (= b_and!31809 (and (=> t!29447 result!13291) b_and!31811)))

(declare-fun m!912497 () Bool)

(assert (=> b!985019 m!912497))

(declare-fun m!912499 () Bool)

(assert (=> b!985020 m!912499))

(declare-fun m!912501 () Bool)

(assert (=> mapNonEmpty!36473 m!912501))

(declare-fun m!912503 () Bool)

(assert (=> b!985015 m!912503))

(declare-fun m!912505 () Bool)

(assert (=> b!985015 m!912505))

(declare-fun m!912507 () Bool)

(assert (=> b!985015 m!912507))

(declare-fun m!912509 () Bool)

(assert (=> b!985015 m!912509))

(assert (=> b!985015 m!912509))

(declare-fun m!912511 () Bool)

(assert (=> b!985015 m!912511))

(assert (=> b!985015 m!912503))

(declare-fun m!912513 () Bool)

(assert (=> b!985015 m!912513))

(assert (=> b!985015 m!912505))

(assert (=> b!985013 m!912503))

(declare-fun m!912515 () Bool)

(assert (=> b!985013 m!912515))

(declare-fun m!912517 () Bool)

(assert (=> b!985013 m!912517))

(declare-fun m!912519 () Bool)

(assert (=> b!985013 m!912519))

(assert (=> b!985013 m!912515))

(assert (=> b!985013 m!912519))

(declare-fun m!912521 () Bool)

(assert (=> b!985013 m!912521))

(assert (=> b!985016 m!912503))

(assert (=> b!985016 m!912503))

(declare-fun m!912523 () Bool)

(assert (=> b!985016 m!912523))

(declare-fun m!912525 () Bool)

(assert (=> start!84328 m!912525))

(declare-fun m!912527 () Bool)

(assert (=> start!84328 m!912527))

(declare-fun m!912529 () Bool)

(assert (=> start!84328 m!912529))

(check-sat (not b!985019) (not b!985016) b_and!31811 (not b!985015) (not b_next!19861) (not b_lambda!14907) tp_is_empty!22963 (not mapNonEmpty!36473) (not b!985013) (not start!84328) (not b!985020))
(check-sat b_and!31811 (not b_next!19861))
