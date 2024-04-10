; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113338 () Bool)

(assert start!113338)

(declare-fun b_free!31389 () Bool)

(declare-fun b_next!31389 () Bool)

(assert (=> start!113338 (= b_free!31389 (not b_next!31389))))

(declare-fun tp!109971 () Bool)

(declare-fun b_and!50631 () Bool)

(assert (=> start!113338 (= tp!109971 b_and!50631)))

(declare-fun b!1344962 () Bool)

(declare-fun e!765413 () Bool)

(declare-fun e!765408 () Bool)

(declare-fun mapRes!57790 () Bool)

(assert (=> b!1344962 (= e!765413 (and e!765408 mapRes!57790))))

(declare-fun condMapEmpty!57790 () Bool)

(declare-datatypes ((V!54955 0))(
  ( (V!54956 (val!18769 Int)) )
))
(declare-datatypes ((ValueCell!17796 0))(
  ( (ValueCellFull!17796 (v!21417 V!54955)) (EmptyCell!17796) )
))
(declare-datatypes ((array!91618 0))(
  ( (array!91619 (arr!44265 (Array (_ BitVec 32) ValueCell!17796)) (size!44815 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91618)

(declare-fun mapDefault!57790 () ValueCell!17796)

(assert (=> b!1344962 (= condMapEmpty!57790 (= (arr!44265 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17796)) mapDefault!57790)))))

(declare-fun b!1344963 () Bool)

(declare-fun e!765412 () Bool)

(assert (=> b!1344963 (= e!765412 (not true))))

(declare-datatypes ((tuple2!24192 0))(
  ( (tuple2!24193 (_1!12107 (_ BitVec 64)) (_2!12107 V!54955)) )
))
(declare-datatypes ((List!31348 0))(
  ( (Nil!31345) (Cons!31344 (h!32553 tuple2!24192) (t!45894 List!31348)) )
))
(declare-datatypes ((ListLongMap!21849 0))(
  ( (ListLongMap!21850 (toList!10940 List!31348)) )
))
(declare-fun lt!595253 () ListLongMap!21849)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9116 (ListLongMap!21849 (_ BitVec 64)) Bool)

(assert (=> b!1344963 (contains!9116 lt!595253 k0!1142)))

(declare-datatypes ((Unit!44121 0))(
  ( (Unit!44122) )
))
(declare-fun lt!595254 () Unit!44121)

(declare-datatypes ((array!91620 0))(
  ( (array!91621 (arr!44266 (Array (_ BitVec 32) (_ BitVec 64))) (size!44816 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91620)

(declare-fun lt!595252 () V!54955)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!391 ((_ BitVec 64) (_ BitVec 64) V!54955 ListLongMap!21849) Unit!44121)

(assert (=> b!1344963 (= lt!595254 (lemmaInListMapAfterAddingDiffThenInBefore!391 k0!1142 (select (arr!44266 _keys!1571) from!1960) lt!595252 lt!595253))))

(declare-fun mapIsEmpty!57790 () Bool)

(assert (=> mapIsEmpty!57790 mapRes!57790))

(declare-fun res!892385 () Bool)

(declare-fun e!765411 () Bool)

(assert (=> start!113338 (=> (not res!892385) (not e!765411))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113338 (= res!892385 (validMask!0 mask!1977))))

(assert (=> start!113338 e!765411))

(declare-fun tp_is_empty!37389 () Bool)

(assert (=> start!113338 tp_is_empty!37389))

(assert (=> start!113338 true))

(declare-fun array_inv!33359 (array!91620) Bool)

(assert (=> start!113338 (array_inv!33359 _keys!1571)))

(declare-fun array_inv!33360 (array!91618) Bool)

(assert (=> start!113338 (and (array_inv!33360 _values!1303) e!765413)))

(assert (=> start!113338 tp!109971))

(declare-fun b!1344964 () Bool)

(declare-fun res!892380 () Bool)

(assert (=> b!1344964 (=> (not res!892380) (not e!765411))))

(declare-fun minValue!1245 () V!54955)

(declare-fun zeroValue!1245 () V!54955)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun getCurrentListMap!5894 (array!91620 array!91618 (_ BitVec 32) (_ BitVec 32) V!54955 V!54955 (_ BitVec 32) Int) ListLongMap!21849)

(assert (=> b!1344964 (= res!892380 (contains!9116 (getCurrentListMap!5894 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344965 () Bool)

(assert (=> b!1344965 (= e!765411 e!765412)))

(declare-fun res!892383 () Bool)

(assert (=> b!1344965 (=> (not res!892383) (not e!765412))))

(declare-fun +!4824 (ListLongMap!21849 tuple2!24192) ListLongMap!21849)

(assert (=> b!1344965 (= res!892383 (contains!9116 (+!4824 lt!595253 (tuple2!24193 (select (arr!44266 _keys!1571) from!1960) lt!595252)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6466 (array!91620 array!91618 (_ BitVec 32) (_ BitVec 32) V!54955 V!54955 (_ BitVec 32) Int) ListLongMap!21849)

(assert (=> b!1344965 (= lt!595253 (getCurrentListMapNoExtraKeys!6466 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22359 (ValueCell!17796 V!54955) V!54955)

(declare-fun dynLambda!3763 (Int (_ BitVec 64)) V!54955)

(assert (=> b!1344965 (= lt!595252 (get!22359 (select (arr!44265 _values!1303) from!1960) (dynLambda!3763 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1344966 () Bool)

(declare-fun res!892381 () Bool)

(assert (=> b!1344966 (=> (not res!892381) (not e!765411))))

(assert (=> b!1344966 (= res!892381 (and (= (size!44815 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44816 _keys!1571) (size!44815 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344967 () Bool)

(declare-fun res!892379 () Bool)

(assert (=> b!1344967 (=> (not res!892379) (not e!765411))))

(assert (=> b!1344967 (= res!892379 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44816 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344968 () Bool)

(declare-fun res!892387 () Bool)

(assert (=> b!1344968 (=> (not res!892387) (not e!765412))))

(assert (=> b!1344968 (= res!892387 (not (= k0!1142 (select (arr!44266 _keys!1571) from!1960))))))

(declare-fun b!1344969 () Bool)

(declare-fun res!892386 () Bool)

(assert (=> b!1344969 (=> (not res!892386) (not e!765411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91620 (_ BitVec 32)) Bool)

(assert (=> b!1344969 (= res!892386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57790 () Bool)

(declare-fun tp!109972 () Bool)

(declare-fun e!765410 () Bool)

(assert (=> mapNonEmpty!57790 (= mapRes!57790 (and tp!109972 e!765410))))

(declare-fun mapRest!57790 () (Array (_ BitVec 32) ValueCell!17796))

(declare-fun mapValue!57790 () ValueCell!17796)

(declare-fun mapKey!57790 () (_ BitVec 32))

(assert (=> mapNonEmpty!57790 (= (arr!44265 _values!1303) (store mapRest!57790 mapKey!57790 mapValue!57790))))

(declare-fun b!1344970 () Bool)

(declare-fun res!892384 () Bool)

(assert (=> b!1344970 (=> (not res!892384) (not e!765411))))

(assert (=> b!1344970 (= res!892384 (not (= (select (arr!44266 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1344971 () Bool)

(assert (=> b!1344971 (= e!765408 tp_is_empty!37389)))

(declare-fun b!1344972 () Bool)

(declare-fun res!892388 () Bool)

(assert (=> b!1344972 (=> (not res!892388) (not e!765411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344972 (= res!892388 (validKeyInArray!0 (select (arr!44266 _keys!1571) from!1960)))))

(declare-fun b!1344973 () Bool)

(assert (=> b!1344973 (= e!765410 tp_is_empty!37389)))

(declare-fun b!1344974 () Bool)

(declare-fun res!892389 () Bool)

(assert (=> b!1344974 (=> (not res!892389) (not e!765411))))

(assert (=> b!1344974 (= res!892389 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1344975 () Bool)

(declare-fun res!892382 () Bool)

(assert (=> b!1344975 (=> (not res!892382) (not e!765411))))

(declare-datatypes ((List!31349 0))(
  ( (Nil!31346) (Cons!31345 (h!32554 (_ BitVec 64)) (t!45895 List!31349)) )
))
(declare-fun arrayNoDuplicates!0 (array!91620 (_ BitVec 32) List!31349) Bool)

(assert (=> b!1344975 (= res!892382 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31346))))

(assert (= (and start!113338 res!892385) b!1344966))

(assert (= (and b!1344966 res!892381) b!1344969))

(assert (= (and b!1344969 res!892386) b!1344975))

(assert (= (and b!1344975 res!892382) b!1344967))

(assert (= (and b!1344967 res!892379) b!1344964))

(assert (= (and b!1344964 res!892380) b!1344970))

(assert (= (and b!1344970 res!892384) b!1344972))

(assert (= (and b!1344972 res!892388) b!1344974))

(assert (= (and b!1344974 res!892389) b!1344965))

(assert (= (and b!1344965 res!892383) b!1344968))

(assert (= (and b!1344968 res!892387) b!1344963))

(assert (= (and b!1344962 condMapEmpty!57790) mapIsEmpty!57790))

(assert (= (and b!1344962 (not condMapEmpty!57790)) mapNonEmpty!57790))

(get-info :version)

(assert (= (and mapNonEmpty!57790 ((_ is ValueCellFull!17796) mapValue!57790)) b!1344973))

(assert (= (and b!1344962 ((_ is ValueCellFull!17796) mapDefault!57790)) b!1344971))

(assert (= start!113338 b!1344962))

(declare-fun b_lambda!24511 () Bool)

(assert (=> (not b_lambda!24511) (not b!1344965)))

(declare-fun t!45893 () Bool)

(declare-fun tb!12349 () Bool)

(assert (=> (and start!113338 (= defaultEntry!1306 defaultEntry!1306) t!45893) tb!12349))

(declare-fun result!25789 () Bool)

(assert (=> tb!12349 (= result!25789 tp_is_empty!37389)))

(assert (=> b!1344965 t!45893))

(declare-fun b_and!50633 () Bool)

(assert (= b_and!50631 (and (=> t!45893 result!25789) b_and!50633)))

(declare-fun m!1232443 () Bool)

(assert (=> start!113338 m!1232443))

(declare-fun m!1232445 () Bool)

(assert (=> start!113338 m!1232445))

(declare-fun m!1232447 () Bool)

(assert (=> start!113338 m!1232447))

(declare-fun m!1232449 () Bool)

(assert (=> b!1344969 m!1232449))

(declare-fun m!1232451 () Bool)

(assert (=> b!1344975 m!1232451))

(declare-fun m!1232453 () Bool)

(assert (=> b!1344963 m!1232453))

(declare-fun m!1232455 () Bool)

(assert (=> b!1344963 m!1232455))

(assert (=> b!1344963 m!1232455))

(declare-fun m!1232457 () Bool)

(assert (=> b!1344963 m!1232457))

(assert (=> b!1344970 m!1232455))

(assert (=> b!1344968 m!1232455))

(declare-fun m!1232459 () Bool)

(assert (=> mapNonEmpty!57790 m!1232459))

(assert (=> b!1344972 m!1232455))

(assert (=> b!1344972 m!1232455))

(declare-fun m!1232461 () Bool)

(assert (=> b!1344972 m!1232461))

(declare-fun m!1232463 () Bool)

(assert (=> b!1344965 m!1232463))

(declare-fun m!1232465 () Bool)

(assert (=> b!1344965 m!1232465))

(declare-fun m!1232467 () Bool)

(assert (=> b!1344965 m!1232467))

(declare-fun m!1232469 () Bool)

(assert (=> b!1344965 m!1232469))

(declare-fun m!1232471 () Bool)

(assert (=> b!1344965 m!1232471))

(assert (=> b!1344965 m!1232467))

(assert (=> b!1344965 m!1232469))

(assert (=> b!1344965 m!1232463))

(declare-fun m!1232473 () Bool)

(assert (=> b!1344965 m!1232473))

(assert (=> b!1344965 m!1232455))

(declare-fun m!1232475 () Bool)

(assert (=> b!1344964 m!1232475))

(assert (=> b!1344964 m!1232475))

(declare-fun m!1232477 () Bool)

(assert (=> b!1344964 m!1232477))

(check-sat (not start!113338) b_and!50633 (not mapNonEmpty!57790) tp_is_empty!37389 (not b!1344964) (not b!1344975) (not b!1344972) (not b_next!31389) (not b_lambda!24511) (not b!1344969) (not b!1344965) (not b!1344963))
(check-sat b_and!50633 (not b_next!31389))
