; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83282 () Bool)

(assert start!83282)

(declare-fun b_free!19275 () Bool)

(declare-fun b_next!19275 () Bool)

(assert (=> start!83282 (= b_free!19275 (not b_next!19275))))

(declare-fun tp!67104 () Bool)

(declare-fun b_and!30771 () Bool)

(assert (=> start!83282 (= tp!67104 b_and!30771)))

(declare-fun b!971951 () Bool)

(declare-fun res!650575 () Bool)

(declare-fun e!547874 () Bool)

(assert (=> b!971951 (=> (not res!650575) (not e!547874))))

(declare-datatypes ((array!60393 0))(
  ( (array!60394 (arr!29060 (Array (_ BitVec 32) (_ BitVec 64))) (size!29539 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60393)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60393 (_ BitVec 32)) Bool)

(assert (=> b!971951 (= res!650575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971952 () Bool)

(declare-fun e!547878 () Bool)

(declare-fun tp_is_empty!22173 () Bool)

(assert (=> b!971952 (= e!547878 tp_is_empty!22173)))

(declare-fun b!971953 () Bool)

(declare-fun res!650577 () Bool)

(assert (=> b!971953 (=> (not res!650577) (not e!547874))))

(declare-datatypes ((V!34547 0))(
  ( (V!34548 (val!11137 Int)) )
))
(declare-datatypes ((ValueCell!10605 0))(
  ( (ValueCellFull!10605 (v!13696 V!34547)) (EmptyCell!10605) )
))
(declare-datatypes ((array!60395 0))(
  ( (array!60396 (arr!29061 (Array (_ BitVec 32) ValueCell!10605)) (size!29540 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60395)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!971953 (= res!650577 (and (= (size!29540 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29539 _keys!1717) (size!29540 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971954 () Bool)

(declare-fun e!547876 () Bool)

(assert (=> b!971954 (= e!547874 e!547876)))

(declare-fun res!650574 () Bool)

(assert (=> b!971954 (=> (not res!650574) (not e!547876))))

(declare-fun lt!431911 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971954 (= res!650574 (validKeyInArray!0 lt!431911))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!971954 (= lt!431911 (select (arr!29060 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!14280 0))(
  ( (tuple2!14281 (_1!7151 (_ BitVec 64)) (_2!7151 V!34547)) )
))
(declare-datatypes ((List!20144 0))(
  ( (Nil!20141) (Cons!20140 (h!21302 tuple2!14280) (t!28517 List!20144)) )
))
(declare-datatypes ((ListLongMap!12977 0))(
  ( (ListLongMap!12978 (toList!6504 List!20144)) )
))
(declare-fun lt!431912 () ListLongMap!12977)

(declare-fun zeroValue!1367 () V!34547)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34547)

(declare-fun getCurrentListMap!3737 (array!60393 array!60395 (_ BitVec 32) (_ BitVec 32) V!34547 V!34547 (_ BitVec 32) Int) ListLongMap!12977)

(assert (=> b!971954 (= lt!431912 (getCurrentListMap!3737 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971955 () Bool)

(declare-fun e!547877 () Bool)

(declare-fun mapRes!35269 () Bool)

(assert (=> b!971955 (= e!547877 (and e!547878 mapRes!35269))))

(declare-fun condMapEmpty!35269 () Bool)

(declare-fun mapDefault!35269 () ValueCell!10605)

(assert (=> b!971955 (= condMapEmpty!35269 (= (arr!29061 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10605)) mapDefault!35269)))))

(declare-fun b!971956 () Bool)

(declare-fun res!650579 () Bool)

(assert (=> b!971956 (=> (not res!650579) (not e!547874))))

(declare-datatypes ((List!20145 0))(
  ( (Nil!20142) (Cons!20141 (h!21303 (_ BitVec 64)) (t!28518 List!20145)) )
))
(declare-fun arrayNoDuplicates!0 (array!60393 (_ BitVec 32) List!20145) Bool)

(assert (=> b!971956 (= res!650579 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20142))))

(declare-fun mapNonEmpty!35269 () Bool)

(declare-fun tp!67103 () Bool)

(declare-fun e!547875 () Bool)

(assert (=> mapNonEmpty!35269 (= mapRes!35269 (and tp!67103 e!547875))))

(declare-fun mapValue!35269 () ValueCell!10605)

(declare-fun mapKey!35269 () (_ BitVec 32))

(declare-fun mapRest!35269 () (Array (_ BitVec 32) ValueCell!10605))

(assert (=> mapNonEmpty!35269 (= (arr!29061 _values!1425) (store mapRest!35269 mapKey!35269 mapValue!35269))))

(declare-fun b!971957 () Bool)

(declare-fun res!650578 () Bool)

(assert (=> b!971957 (=> (not res!650578) (not e!547874))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5602 (ListLongMap!12977 (_ BitVec 64)) Bool)

(assert (=> b!971957 (= res!650578 (contains!5602 (getCurrentListMap!3737 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29060 _keys!1717) i!822)))))

(declare-fun b!971958 () Bool)

(declare-fun res!650576 () Bool)

(assert (=> b!971958 (=> (not res!650576) (not e!547874))))

(assert (=> b!971958 (= res!650576 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29539 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29539 _keys!1717))))))

(declare-fun b!971959 () Bool)

(assert (=> b!971959 (= e!547876 (not true))))

(declare-fun +!2878 (ListLongMap!12977 tuple2!14280) ListLongMap!12977)

(declare-fun get!15049 (ValueCell!10605 V!34547) V!34547)

(declare-fun dynLambda!1667 (Int (_ BitVec 64)) V!34547)

(assert (=> b!971959 (= lt!431912 (+!2878 (getCurrentListMap!3737 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14281 lt!431911 (get!15049 (select (arr!29061 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1667 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32377 0))(
  ( (Unit!32378) )
))
(declare-fun lt!431910 () Unit!32377)

(declare-fun lemmaListMapRecursiveValidKeyArray!244 (array!60393 array!60395 (_ BitVec 32) (_ BitVec 32) V!34547 V!34547 (_ BitVec 32) Int) Unit!32377)

(assert (=> b!971959 (= lt!431910 (lemmaListMapRecursiveValidKeyArray!244 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971960 () Bool)

(assert (=> b!971960 (= e!547875 tp_is_empty!22173)))

(declare-fun b!971961 () Bool)

(declare-fun res!650580 () Bool)

(assert (=> b!971961 (=> (not res!650580) (not e!547874))))

(assert (=> b!971961 (= res!650580 (validKeyInArray!0 (select (arr!29060 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35269 () Bool)

(assert (=> mapIsEmpty!35269 mapRes!35269))

(declare-fun res!650573 () Bool)

(assert (=> start!83282 (=> (not res!650573) (not e!547874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83282 (= res!650573 (validMask!0 mask!2147))))

(assert (=> start!83282 e!547874))

(assert (=> start!83282 true))

(declare-fun array_inv!22483 (array!60395) Bool)

(assert (=> start!83282 (and (array_inv!22483 _values!1425) e!547877)))

(assert (=> start!83282 tp_is_empty!22173))

(assert (=> start!83282 tp!67104))

(declare-fun array_inv!22484 (array!60393) Bool)

(assert (=> start!83282 (array_inv!22484 _keys!1717)))

(assert (= (and start!83282 res!650573) b!971953))

(assert (= (and b!971953 res!650577) b!971951))

(assert (= (and b!971951 res!650575) b!971956))

(assert (= (and b!971956 res!650579) b!971958))

(assert (= (and b!971958 res!650576) b!971961))

(assert (= (and b!971961 res!650580) b!971957))

(assert (= (and b!971957 res!650578) b!971954))

(assert (= (and b!971954 res!650574) b!971959))

(assert (= (and b!971955 condMapEmpty!35269) mapIsEmpty!35269))

(assert (= (and b!971955 (not condMapEmpty!35269)) mapNonEmpty!35269))

(get-info :version)

(assert (= (and mapNonEmpty!35269 ((_ is ValueCellFull!10605) mapValue!35269)) b!971960))

(assert (= (and b!971955 ((_ is ValueCellFull!10605) mapDefault!35269)) b!971952))

(assert (= start!83282 b!971955))

(declare-fun b_lambda!14439 () Bool)

(assert (=> (not b_lambda!14439) (not b!971959)))

(declare-fun t!28516 () Bool)

(declare-fun tb!6223 () Bool)

(assert (=> (and start!83282 (= defaultEntry!1428 defaultEntry!1428) t!28516) tb!6223))

(declare-fun result!12423 () Bool)

(assert (=> tb!6223 (= result!12423 tp_is_empty!22173)))

(assert (=> b!971959 t!28516))

(declare-fun b_and!30773 () Bool)

(assert (= b_and!30771 (and (=> t!28516 result!12423) b_and!30773)))

(declare-fun m!899319 () Bool)

(assert (=> mapNonEmpty!35269 m!899319))

(declare-fun m!899321 () Bool)

(assert (=> start!83282 m!899321))

(declare-fun m!899323 () Bool)

(assert (=> start!83282 m!899323))

(declare-fun m!899325 () Bool)

(assert (=> start!83282 m!899325))

(declare-fun m!899327 () Bool)

(assert (=> b!971956 m!899327))

(declare-fun m!899329 () Bool)

(assert (=> b!971951 m!899329))

(declare-fun m!899331 () Bool)

(assert (=> b!971954 m!899331))

(declare-fun m!899333 () Bool)

(assert (=> b!971954 m!899333))

(declare-fun m!899335 () Bool)

(assert (=> b!971954 m!899335))

(declare-fun m!899337 () Bool)

(assert (=> b!971959 m!899337))

(declare-fun m!899339 () Bool)

(assert (=> b!971959 m!899339))

(declare-fun m!899341 () Bool)

(assert (=> b!971959 m!899341))

(assert (=> b!971959 m!899339))

(declare-fun m!899343 () Bool)

(assert (=> b!971959 m!899343))

(declare-fun m!899345 () Bool)

(assert (=> b!971959 m!899345))

(assert (=> b!971959 m!899341))

(assert (=> b!971959 m!899337))

(declare-fun m!899347 () Bool)

(assert (=> b!971959 m!899347))

(declare-fun m!899349 () Bool)

(assert (=> b!971961 m!899349))

(assert (=> b!971961 m!899349))

(declare-fun m!899351 () Bool)

(assert (=> b!971961 m!899351))

(declare-fun m!899353 () Bool)

(assert (=> b!971957 m!899353))

(assert (=> b!971957 m!899349))

(assert (=> b!971957 m!899353))

(assert (=> b!971957 m!899349))

(declare-fun m!899355 () Bool)

(assert (=> b!971957 m!899355))

(check-sat (not b!971951) (not b!971954) (not b!971959) (not b_next!19275) (not start!83282) (not b!971956) tp_is_empty!22173 (not b!971957) b_and!30773 (not b_lambda!14439) (not mapNonEmpty!35269) (not b!971961))
(check-sat b_and!30773 (not b_next!19275))
