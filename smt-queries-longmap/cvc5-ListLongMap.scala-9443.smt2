; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112266 () Bool)

(assert start!112266)

(declare-fun b_free!30661 () Bool)

(declare-fun b_next!30661 () Bool)

(assert (=> start!112266 (= b_free!30661 (not b_next!30661))))

(declare-fun tp!107620 () Bool)

(declare-fun b_and!49377 () Bool)

(assert (=> start!112266 (= tp!107620 b_and!49377)))

(declare-fun b!1330121 () Bool)

(declare-fun res!882580 () Bool)

(declare-fun e!758158 () Bool)

(assert (=> b!1330121 (=> (not res!882580) (not e!758158))))

(declare-datatypes ((array!90032 0))(
  ( (array!90033 (arr!43482 (Array (_ BitVec 32) (_ BitVec 64))) (size!44032 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90032)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90032 (_ BitVec 32)) Bool)

(assert (=> b!1330121 (= res!882580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330122 () Bool)

(assert (=> b!1330122 (= e!758158 (not true))))

(declare-datatypes ((V!53865 0))(
  ( (V!53866 (val!18360 Int)) )
))
(declare-datatypes ((tuple2!23642 0))(
  ( (tuple2!23643 (_1!11832 (_ BitVec 64)) (_2!11832 V!53865)) )
))
(declare-datatypes ((List!30794 0))(
  ( (Nil!30791) (Cons!30790 (h!31999 tuple2!23642) (t!44868 List!30794)) )
))
(declare-datatypes ((ListLongMap!21299 0))(
  ( (ListLongMap!21300 (toList!10665 List!30794)) )
))
(declare-fun lt!591063 () ListLongMap!21299)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8829 (ListLongMap!21299 (_ BitVec 64)) Bool)

(assert (=> b!1330122 (contains!8829 lt!591063 k!1153)))

(declare-datatypes ((Unit!43775 0))(
  ( (Unit!43776) )
))
(declare-fun lt!591064 () Unit!43775)

(declare-fun minValue!1262 () V!53865)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!250 ((_ BitVec 64) (_ BitVec 64) V!53865 ListLongMap!21299) Unit!43775)

(assert (=> b!1330122 (= lt!591064 (lemmaInListMapAfterAddingDiffThenInBefore!250 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591063))))

(declare-datatypes ((ValueCell!17387 0))(
  ( (ValueCellFull!17387 (v!20997 V!53865)) (EmptyCell!17387) )
))
(declare-datatypes ((array!90034 0))(
  ( (array!90035 (arr!43483 (Array (_ BitVec 32) ValueCell!17387)) (size!44033 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90034)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53865)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun +!4663 (ListLongMap!21299 tuple2!23642) ListLongMap!21299)

(declare-fun getCurrentListMapNoExtraKeys!6301 (array!90032 array!90034 (_ BitVec 32) (_ BitVec 32) V!53865 V!53865 (_ BitVec 32) Int) ListLongMap!21299)

(declare-fun get!21913 (ValueCell!17387 V!53865) V!53865)

(declare-fun dynLambda!3602 (Int (_ BitVec 64)) V!53865)

(assert (=> b!1330122 (= lt!591063 (+!4663 (getCurrentListMapNoExtraKeys!6301 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23643 (select (arr!43482 _keys!1590) from!1980) (get!21913 (select (arr!43483 _values!1320) from!1980) (dynLambda!3602 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!882585 () Bool)

(assert (=> start!112266 (=> (not res!882585) (not e!758158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112266 (= res!882585 (validMask!0 mask!1998))))

(assert (=> start!112266 e!758158))

(declare-fun e!758160 () Bool)

(declare-fun array_inv!32805 (array!90034) Bool)

(assert (=> start!112266 (and (array_inv!32805 _values!1320) e!758160)))

(assert (=> start!112266 true))

(declare-fun array_inv!32806 (array!90032) Bool)

(assert (=> start!112266 (array_inv!32806 _keys!1590)))

(assert (=> start!112266 tp!107620))

(declare-fun tp_is_empty!36571 () Bool)

(assert (=> start!112266 tp_is_empty!36571))

(declare-fun mapNonEmpty!56530 () Bool)

(declare-fun mapRes!56530 () Bool)

(declare-fun tp!107619 () Bool)

(declare-fun e!758161 () Bool)

(assert (=> mapNonEmpty!56530 (= mapRes!56530 (and tp!107619 e!758161))))

(declare-fun mapKey!56530 () (_ BitVec 32))

(declare-fun mapValue!56530 () ValueCell!17387)

(declare-fun mapRest!56530 () (Array (_ BitVec 32) ValueCell!17387))

(assert (=> mapNonEmpty!56530 (= (arr!43483 _values!1320) (store mapRest!56530 mapKey!56530 mapValue!56530))))

(declare-fun b!1330123 () Bool)

(declare-fun res!882586 () Bool)

(assert (=> b!1330123 (=> (not res!882586) (not e!758158))))

(assert (=> b!1330123 (= res!882586 (not (= (select (arr!43482 _keys!1590) from!1980) k!1153)))))

(declare-fun mapIsEmpty!56530 () Bool)

(assert (=> mapIsEmpty!56530 mapRes!56530))

(declare-fun b!1330124 () Bool)

(declare-fun res!882588 () Bool)

(assert (=> b!1330124 (=> (not res!882588) (not e!758158))))

(declare-fun getCurrentListMap!5653 (array!90032 array!90034 (_ BitVec 32) (_ BitVec 32) V!53865 V!53865 (_ BitVec 32) Int) ListLongMap!21299)

(assert (=> b!1330124 (= res!882588 (contains!8829 (getCurrentListMap!5653 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1330125 () Bool)

(declare-fun res!882587 () Bool)

(assert (=> b!1330125 (=> (not res!882587) (not e!758158))))

(assert (=> b!1330125 (= res!882587 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44032 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330126 () Bool)

(declare-fun res!882582 () Bool)

(assert (=> b!1330126 (=> (not res!882582) (not e!758158))))

(assert (=> b!1330126 (= res!882582 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330127 () Bool)

(declare-fun res!882584 () Bool)

(assert (=> b!1330127 (=> (not res!882584) (not e!758158))))

(assert (=> b!1330127 (= res!882584 (and (= (size!44033 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44032 _keys!1590) (size!44033 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330128 () Bool)

(assert (=> b!1330128 (= e!758161 tp_is_empty!36571)))

(declare-fun b!1330129 () Bool)

(declare-fun res!882581 () Bool)

(assert (=> b!1330129 (=> (not res!882581) (not e!758158))))

(declare-datatypes ((List!30795 0))(
  ( (Nil!30792) (Cons!30791 (h!32000 (_ BitVec 64)) (t!44869 List!30795)) )
))
(declare-fun arrayNoDuplicates!0 (array!90032 (_ BitVec 32) List!30795) Bool)

(assert (=> b!1330129 (= res!882581 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30792))))

(declare-fun b!1330130 () Bool)

(declare-fun e!758157 () Bool)

(assert (=> b!1330130 (= e!758160 (and e!758157 mapRes!56530))))

(declare-fun condMapEmpty!56530 () Bool)

(declare-fun mapDefault!56530 () ValueCell!17387)

