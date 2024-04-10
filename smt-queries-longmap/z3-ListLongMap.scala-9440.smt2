; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112250 () Bool)

(assert start!112250)

(declare-fun b_free!30645 () Bool)

(declare-fun b_next!30645 () Bool)

(assert (=> start!112250 (= b_free!30645 (not b_next!30645))))

(declare-fun tp!107572 () Bool)

(declare-fun b_and!49345 () Bool)

(assert (=> start!112250 (= tp!107572 b_and!49345)))

(declare-fun b!1329817 () Bool)

(declare-fun res!882370 () Bool)

(declare-fun e!758037 () Bool)

(assert (=> b!1329817 (=> (not res!882370) (not e!758037))))

(declare-datatypes ((V!53843 0))(
  ( (V!53844 (val!18352 Int)) )
))
(declare-datatypes ((ValueCell!17379 0))(
  ( (ValueCellFull!17379 (v!20989 V!53843)) (EmptyCell!17379) )
))
(declare-datatypes ((array!90000 0))(
  ( (array!90001 (arr!43466 (Array (_ BitVec 32) ValueCell!17379)) (size!44016 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90000)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90002 0))(
  ( (array!90003 (arr!43467 (Array (_ BitVec 32) (_ BitVec 64))) (size!44017 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90002)

(assert (=> b!1329817 (= res!882370 (and (= (size!44016 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44017 _keys!1590) (size!44016 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1329818 () Bool)

(declare-fun res!882366 () Bool)

(assert (=> b!1329818 (=> (not res!882366) (not e!758037))))

(assert (=> b!1329818 (= res!882366 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329819 () Bool)

(declare-fun res!882371 () Bool)

(assert (=> b!1329819 (=> (not res!882371) (not e!758037))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1329819 (= res!882371 (validKeyInArray!0 (select (arr!43467 _keys!1590) from!1980)))))

(declare-fun res!882369 () Bool)

(assert (=> start!112250 (=> (not res!882369) (not e!758037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112250 (= res!882369 (validMask!0 mask!1998))))

(assert (=> start!112250 e!758037))

(declare-fun e!758041 () Bool)

(declare-fun array_inv!32797 (array!90000) Bool)

(assert (=> start!112250 (and (array_inv!32797 _values!1320) e!758041)))

(assert (=> start!112250 true))

(declare-fun array_inv!32798 (array!90002) Bool)

(assert (=> start!112250 (array_inv!32798 _keys!1590)))

(assert (=> start!112250 tp!107572))

(declare-fun tp_is_empty!36555 () Bool)

(assert (=> start!112250 tp_is_empty!36555))

(declare-fun b!1329820 () Bool)

(declare-fun res!882364 () Bool)

(assert (=> b!1329820 (=> (not res!882364) (not e!758037))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53843)

(declare-fun zeroValue!1262 () V!53843)

(declare-datatypes ((tuple2!23630 0))(
  ( (tuple2!23631 (_1!11826 (_ BitVec 64)) (_2!11826 V!53843)) )
))
(declare-datatypes ((List!30781 0))(
  ( (Nil!30778) (Cons!30777 (h!31986 tuple2!23630) (t!44839 List!30781)) )
))
(declare-datatypes ((ListLongMap!21287 0))(
  ( (ListLongMap!21288 (toList!10659 List!30781)) )
))
(declare-fun contains!8823 (ListLongMap!21287 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5648 (array!90002 array!90000 (_ BitVec 32) (_ BitVec 32) V!53843 V!53843 (_ BitVec 32) Int) ListLongMap!21287)

(assert (=> b!1329820 (= res!882364 (contains!8823 (getCurrentListMap!5648 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapIsEmpty!56506 () Bool)

(declare-fun mapRes!56506 () Bool)

(assert (=> mapIsEmpty!56506 mapRes!56506))

(declare-fun b!1329821 () Bool)

(declare-fun e!758038 () Bool)

(assert (=> b!1329821 (= e!758038 tp_is_empty!36555)))

(declare-fun b!1329822 () Bool)

(declare-fun res!882365 () Bool)

(assert (=> b!1329822 (=> (not res!882365) (not e!758037))))

(assert (=> b!1329822 (= res!882365 (not (= (select (arr!43467 _keys!1590) from!1980) k0!1153)))))

(declare-fun mapNonEmpty!56506 () Bool)

(declare-fun tp!107571 () Bool)

(assert (=> mapNonEmpty!56506 (= mapRes!56506 (and tp!107571 e!758038))))

(declare-fun mapKey!56506 () (_ BitVec 32))

(declare-fun mapRest!56506 () (Array (_ BitVec 32) ValueCell!17379))

(declare-fun mapValue!56506 () ValueCell!17379)

(assert (=> mapNonEmpty!56506 (= (arr!43466 _values!1320) (store mapRest!56506 mapKey!56506 mapValue!56506))))

(declare-fun b!1329823 () Bool)

(assert (=> b!1329823 (= e!758037 (not true))))

(declare-fun lt!591016 () ListLongMap!21287)

(assert (=> b!1329823 (contains!8823 lt!591016 k0!1153)))

(declare-datatypes ((Unit!43765 0))(
  ( (Unit!43766) )
))
(declare-fun lt!591015 () Unit!43765)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!245 ((_ BitVec 64) (_ BitVec 64) V!53843 ListLongMap!21287) Unit!43765)

(assert (=> b!1329823 (= lt!591015 (lemmaInListMapAfterAddingDiffThenInBefore!245 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591016))))

(declare-fun +!4658 (ListLongMap!21287 tuple2!23630) ListLongMap!21287)

(declare-fun getCurrentListMapNoExtraKeys!6296 (array!90002 array!90000 (_ BitVec 32) (_ BitVec 32) V!53843 V!53843 (_ BitVec 32) Int) ListLongMap!21287)

(declare-fun get!21902 (ValueCell!17379 V!53843) V!53843)

(declare-fun dynLambda!3597 (Int (_ BitVec 64)) V!53843)

(assert (=> b!1329823 (= lt!591016 (+!4658 (getCurrentListMapNoExtraKeys!6296 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23631 (select (arr!43467 _keys!1590) from!1980) (get!21902 (select (arr!43466 _values!1320) from!1980) (dynLambda!3597 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1329824 () Bool)

(declare-fun res!882367 () Bool)

(assert (=> b!1329824 (=> (not res!882367) (not e!758037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90002 (_ BitVec 32)) Bool)

(assert (=> b!1329824 (= res!882367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329825 () Bool)

(declare-fun e!758040 () Bool)

(assert (=> b!1329825 (= e!758040 tp_is_empty!36555)))

(declare-fun b!1329826 () Bool)

(declare-fun res!882372 () Bool)

(assert (=> b!1329826 (=> (not res!882372) (not e!758037))))

(declare-datatypes ((List!30782 0))(
  ( (Nil!30779) (Cons!30778 (h!31987 (_ BitVec 64)) (t!44840 List!30782)) )
))
(declare-fun arrayNoDuplicates!0 (array!90002 (_ BitVec 32) List!30782) Bool)

(assert (=> b!1329826 (= res!882372 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30779))))

(declare-fun b!1329827 () Bool)

(declare-fun res!882368 () Bool)

(assert (=> b!1329827 (=> (not res!882368) (not e!758037))))

(assert (=> b!1329827 (= res!882368 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44017 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1329828 () Bool)

(assert (=> b!1329828 (= e!758041 (and e!758040 mapRes!56506))))

(declare-fun condMapEmpty!56506 () Bool)

(declare-fun mapDefault!56506 () ValueCell!17379)

(assert (=> b!1329828 (= condMapEmpty!56506 (= (arr!43466 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17379)) mapDefault!56506)))))

(assert (= (and start!112250 res!882369) b!1329817))

(assert (= (and b!1329817 res!882370) b!1329824))

(assert (= (and b!1329824 res!882367) b!1329826))

(assert (= (and b!1329826 res!882372) b!1329827))

(assert (= (and b!1329827 res!882368) b!1329820))

(assert (= (and b!1329820 res!882364) b!1329822))

(assert (= (and b!1329822 res!882365) b!1329819))

(assert (= (and b!1329819 res!882371) b!1329818))

(assert (= (and b!1329818 res!882366) b!1329823))

(assert (= (and b!1329828 condMapEmpty!56506) mapIsEmpty!56506))

(assert (= (and b!1329828 (not condMapEmpty!56506)) mapNonEmpty!56506))

(get-info :version)

(assert (= (and mapNonEmpty!56506 ((_ is ValueCellFull!17379) mapValue!56506)) b!1329821))

(assert (= (and b!1329828 ((_ is ValueCellFull!17379) mapDefault!56506)) b!1329825))

(assert (= start!112250 b!1329828))

(declare-fun b_lambda!23905 () Bool)

(assert (=> (not b_lambda!23905) (not b!1329823)))

(declare-fun t!44838 () Bool)

(declare-fun tb!11861 () Bool)

(assert (=> (and start!112250 (= defaultEntry!1323 defaultEntry!1323) t!44838) tb!11861))

(declare-fun result!24793 () Bool)

(assert (=> tb!11861 (= result!24793 tp_is_empty!36555)))

(assert (=> b!1329823 t!44838))

(declare-fun b_and!49347 () Bool)

(assert (= b_and!49345 (and (=> t!44838 result!24793) b_and!49347)))

(declare-fun m!1218535 () Bool)

(assert (=> b!1329822 m!1218535))

(declare-fun m!1218537 () Bool)

(assert (=> mapNonEmpty!56506 m!1218537))

(declare-fun m!1218539 () Bool)

(assert (=> b!1329826 m!1218539))

(declare-fun m!1218541 () Bool)

(assert (=> b!1329823 m!1218541))

(declare-fun m!1218543 () Bool)

(assert (=> b!1329823 m!1218543))

(declare-fun m!1218545 () Bool)

(assert (=> b!1329823 m!1218545))

(declare-fun m!1218547 () Bool)

(assert (=> b!1329823 m!1218547))

(assert (=> b!1329823 m!1218545))

(declare-fun m!1218549 () Bool)

(assert (=> b!1329823 m!1218549))

(assert (=> b!1329823 m!1218535))

(declare-fun m!1218551 () Bool)

(assert (=> b!1329823 m!1218551))

(assert (=> b!1329823 m!1218549))

(assert (=> b!1329823 m!1218543))

(declare-fun m!1218553 () Bool)

(assert (=> b!1329823 m!1218553))

(declare-fun m!1218555 () Bool)

(assert (=> b!1329820 m!1218555))

(assert (=> b!1329820 m!1218555))

(declare-fun m!1218557 () Bool)

(assert (=> b!1329820 m!1218557))

(assert (=> b!1329819 m!1218535))

(assert (=> b!1329819 m!1218535))

(declare-fun m!1218559 () Bool)

(assert (=> b!1329819 m!1218559))

(declare-fun m!1218561 () Bool)

(assert (=> b!1329824 m!1218561))

(declare-fun m!1218563 () Bool)

(assert (=> start!112250 m!1218563))

(declare-fun m!1218565 () Bool)

(assert (=> start!112250 m!1218565))

(declare-fun m!1218567 () Bool)

(assert (=> start!112250 m!1218567))

(check-sat (not mapNonEmpty!56506) (not b!1329826) (not b!1329824) (not start!112250) (not b!1329819) b_and!49347 (not b_next!30645) tp_is_empty!36555 (not b!1329823) (not b_lambda!23905) (not b!1329820))
(check-sat b_and!49347 (not b_next!30645))
