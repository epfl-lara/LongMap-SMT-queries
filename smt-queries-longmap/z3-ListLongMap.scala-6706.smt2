; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84376 () Bool)

(assert start!84376)

(declare-fun b_free!19909 () Bool)

(declare-fun b_next!19909 () Bool)

(assert (=> start!84376 (= b_free!19909 (not b_next!19909))))

(declare-fun tp!69332 () Bool)

(declare-fun b_and!31905 () Bool)

(assert (=> start!84376 (= tp!69332 b_and!31905)))

(declare-fun b!985850 () Bool)

(declare-fun res!659431 () Bool)

(declare-fun e!555808 () Bool)

(assert (=> b!985850 (=> (not res!659431) (not e!555808))))

(declare-datatypes ((array!62038 0))(
  ( (array!62039 (arr!29872 (Array (_ BitVec 32) (_ BitVec 64))) (size!30352 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62038)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985850 (= res!659431 (validKeyInArray!0 (select (arr!29872 _keys!1544) from!1932)))))

(declare-fun b!985851 () Bool)

(declare-fun res!659425 () Bool)

(assert (=> b!985851 (=> (not res!659425) (not e!555808))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985851 (= res!659425 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985852 () Bool)

(declare-fun e!555806 () Bool)

(declare-fun e!555805 () Bool)

(declare-fun mapRes!36545 () Bool)

(assert (=> b!985852 (= e!555806 (and e!555805 mapRes!36545))))

(declare-fun condMapEmpty!36545 () Bool)

(declare-datatypes ((V!35665 0))(
  ( (V!35666 (val!11556 Int)) )
))
(declare-datatypes ((ValueCell!11024 0))(
  ( (ValueCellFull!11024 (v!14115 V!35665)) (EmptyCell!11024) )
))
(declare-datatypes ((array!62040 0))(
  ( (array!62041 (arr!29873 (Array (_ BitVec 32) ValueCell!11024)) (size!30353 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62040)

(declare-fun mapDefault!36545 () ValueCell!11024)

(assert (=> b!985852 (= condMapEmpty!36545 (= (arr!29873 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11024)) mapDefault!36545)))))

(declare-fun b!985853 () Bool)

(declare-fun e!555810 () Bool)

(declare-fun tp_is_empty!23011 () Bool)

(assert (=> b!985853 (= e!555810 tp_is_empty!23011)))

(declare-fun mapNonEmpty!36545 () Bool)

(declare-fun tp!69331 () Bool)

(assert (=> mapNonEmpty!36545 (= mapRes!36545 (and tp!69331 e!555810))))

(declare-fun mapValue!36545 () ValueCell!11024)

(declare-fun mapRest!36545 () (Array (_ BitVec 32) ValueCell!11024))

(declare-fun mapKey!36545 () (_ BitVec 32))

(assert (=> mapNonEmpty!36545 (= (arr!29873 _values!1278) (store mapRest!36545 mapKey!36545 mapValue!36545))))

(declare-fun b!985855 () Bool)

(declare-fun res!659428 () Bool)

(assert (=> b!985855 (=> (not res!659428) (not e!555808))))

(assert (=> b!985855 (= res!659428 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30352 _keys!1544))))))

(declare-fun b!985856 () Bool)

(declare-fun res!659430 () Bool)

(assert (=> b!985856 (=> (not res!659430) (not e!555808))))

(declare-fun mask!1948 () (_ BitVec 32))

(assert (=> b!985856 (= res!659430 (and (= (size!30353 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30352 _keys!1544) (size!30353 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985857 () Bool)

(declare-fun res!659429 () Bool)

(assert (=> b!985857 (=> (not res!659429) (not e!555808))))

(declare-datatypes ((List!20683 0))(
  ( (Nil!20680) (Cons!20679 (h!21847 (_ BitVec 64)) (t!29528 List!20683)) )
))
(declare-fun arrayNoDuplicates!0 (array!62038 (_ BitVec 32) List!20683) Bool)

(assert (=> b!985857 (= res!659429 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20680))))

(declare-fun res!659427 () Bool)

(assert (=> start!84376 (=> (not res!659427) (not e!555808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84376 (= res!659427 (validMask!0 mask!1948))))

(assert (=> start!84376 e!555808))

(assert (=> start!84376 true))

(assert (=> start!84376 tp_is_empty!23011))

(declare-fun array_inv!23111 (array!62040) Bool)

(assert (=> start!84376 (and (array_inv!23111 _values!1278) e!555806)))

(assert (=> start!84376 tp!69332))

(declare-fun array_inv!23112 (array!62038) Bool)

(assert (=> start!84376 (array_inv!23112 _keys!1544)))

(declare-fun b!985854 () Bool)

(declare-fun res!659424 () Bool)

(assert (=> b!985854 (=> (not res!659424) (not e!555808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62038 (_ BitVec 32)) Bool)

(assert (=> b!985854 (= res!659424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36545 () Bool)

(assert (=> mapIsEmpty!36545 mapRes!36545))

(declare-fun b!985858 () Bool)

(declare-fun e!555809 () Bool)

(assert (=> b!985858 (= e!555808 e!555809)))

(declare-fun res!659426 () Bool)

(assert (=> b!985858 (=> (not res!659426) (not e!555809))))

(assert (=> b!985858 (= res!659426 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29872 _keys!1544) from!1932))))))

(declare-fun lt!437396 () V!35665)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15527 (ValueCell!11024 V!35665) V!35665)

(declare-fun dynLambda!1858 (Int (_ BitVec 64)) V!35665)

(assert (=> b!985858 (= lt!437396 (get!15527 (select (arr!29873 _values!1278) from!1932) (dynLambda!1858 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35665)

(declare-datatypes ((tuple2!14802 0))(
  ( (tuple2!14803 (_1!7412 (_ BitVec 64)) (_2!7412 V!35665)) )
))
(declare-datatypes ((List!20684 0))(
  ( (Nil!20681) (Cons!20680 (h!21848 tuple2!14802) (t!29529 List!20684)) )
))
(declare-datatypes ((ListLongMap!13501 0))(
  ( (ListLongMap!13502 (toList!6766 List!20684)) )
))
(declare-fun lt!437397 () ListLongMap!13501)

(declare-fun zeroValue!1220 () V!35665)

(declare-fun getCurrentListMapNoExtraKeys!3501 (array!62038 array!62040 (_ BitVec 32) (_ BitVec 32) V!35665 V!35665 (_ BitVec 32) Int) ListLongMap!13501)

(assert (=> b!985858 (= lt!437397 (getCurrentListMapNoExtraKeys!3501 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985859 () Bool)

(assert (=> b!985859 (= e!555805 tp_is_empty!23011)))

(declare-fun b!985860 () Bool)

(assert (=> b!985860 (= e!555809 (not true))))

(declare-fun lt!437393 () tuple2!14802)

(declare-fun lt!437395 () tuple2!14802)

(declare-fun +!3067 (ListLongMap!13501 tuple2!14802) ListLongMap!13501)

(assert (=> b!985860 (= (+!3067 (+!3067 lt!437397 lt!437393) lt!437395) (+!3067 (+!3067 lt!437397 lt!437395) lt!437393))))

(assert (=> b!985860 (= lt!437395 (tuple2!14803 (select (arr!29872 _keys!1544) from!1932) lt!437396))))

(assert (=> b!985860 (= lt!437393 (tuple2!14803 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32714 0))(
  ( (Unit!32715) )
))
(declare-fun lt!437394 () Unit!32714)

(declare-fun addCommutativeForDiffKeys!674 (ListLongMap!13501 (_ BitVec 64) V!35665 (_ BitVec 64) V!35665) Unit!32714)

(assert (=> b!985860 (= lt!437394 (addCommutativeForDiffKeys!674 lt!437397 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29872 _keys!1544) from!1932) lt!437396))))

(assert (= (and start!84376 res!659427) b!985856))

(assert (= (and b!985856 res!659430) b!985854))

(assert (= (and b!985854 res!659424) b!985857))

(assert (= (and b!985857 res!659429) b!985855))

(assert (= (and b!985855 res!659428) b!985850))

(assert (= (and b!985850 res!659431) b!985851))

(assert (= (and b!985851 res!659425) b!985858))

(assert (= (and b!985858 res!659426) b!985860))

(assert (= (and b!985852 condMapEmpty!36545) mapIsEmpty!36545))

(assert (= (and b!985852 (not condMapEmpty!36545)) mapNonEmpty!36545))

(get-info :version)

(assert (= (and mapNonEmpty!36545 ((_ is ValueCellFull!11024) mapValue!36545)) b!985853))

(assert (= (and b!985852 ((_ is ValueCellFull!11024) mapDefault!36545)) b!985859))

(assert (= start!84376 b!985852))

(declare-fun b_lambda!14955 () Bool)

(assert (=> (not b_lambda!14955) (not b!985858)))

(declare-fun t!29527 () Bool)

(declare-fun tb!6695 () Bool)

(assert (=> (and start!84376 (= defaultEntry!1281 defaultEntry!1281) t!29527) tb!6695))

(declare-fun result!13387 () Bool)

(assert (=> tb!6695 (= result!13387 tp_is_empty!23011)))

(assert (=> b!985858 t!29527))

(declare-fun b_and!31907 () Bool)

(assert (= b_and!31905 (and (=> t!29527 result!13387) b_and!31907)))

(declare-fun m!913313 () Bool)

(assert (=> mapNonEmpty!36545 m!913313))

(declare-fun m!913315 () Bool)

(assert (=> b!985858 m!913315))

(declare-fun m!913317 () Bool)

(assert (=> b!985858 m!913317))

(declare-fun m!913319 () Bool)

(assert (=> b!985858 m!913319))

(declare-fun m!913321 () Bool)

(assert (=> b!985858 m!913321))

(assert (=> b!985858 m!913317))

(assert (=> b!985858 m!913321))

(declare-fun m!913323 () Bool)

(assert (=> b!985858 m!913323))

(declare-fun m!913325 () Bool)

(assert (=> b!985854 m!913325))

(declare-fun m!913327 () Bool)

(assert (=> b!985857 m!913327))

(assert (=> b!985860 m!913315))

(declare-fun m!913329 () Bool)

(assert (=> b!985860 m!913329))

(declare-fun m!913331 () Bool)

(assert (=> b!985860 m!913331))

(assert (=> b!985860 m!913329))

(assert (=> b!985860 m!913315))

(declare-fun m!913333 () Bool)

(assert (=> b!985860 m!913333))

(declare-fun m!913335 () Bool)

(assert (=> b!985860 m!913335))

(declare-fun m!913337 () Bool)

(assert (=> b!985860 m!913337))

(assert (=> b!985860 m!913335))

(declare-fun m!913339 () Bool)

(assert (=> start!84376 m!913339))

(declare-fun m!913341 () Bool)

(assert (=> start!84376 m!913341))

(declare-fun m!913343 () Bool)

(assert (=> start!84376 m!913343))

(assert (=> b!985850 m!913315))

(assert (=> b!985850 m!913315))

(declare-fun m!913345 () Bool)

(assert (=> b!985850 m!913345))

(check-sat (not b!985858) (not mapNonEmpty!36545) tp_is_empty!23011 b_and!31907 (not b!985850) (not b!985857) (not b!985860) (not start!84376) (not b_next!19909) (not b_lambda!14955) (not b!985854))
(check-sat b_and!31907 (not b_next!19909))
