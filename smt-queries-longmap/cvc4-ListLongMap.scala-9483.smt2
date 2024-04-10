; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112510 () Bool)

(assert start!112510)

(declare-fun b_free!30905 () Bool)

(declare-fun b_next!30905 () Bool)

(assert (=> start!112510 (= b_free!30905 (not b_next!30905))))

(declare-fun tp!108351 () Bool)

(declare-fun b_and!49811 () Bool)

(assert (=> start!112510 (= tp!108351 b_and!49811)))

(declare-fun b!1334566 () Bool)

(declare-fun res!885741 () Bool)

(declare-fun e!760071 () Bool)

(assert (=> b!1334566 (=> (not res!885741) (not e!760071))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1334566 (= res!885741 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1334567 () Bool)

(declare-fun e!760067 () Bool)

(declare-fun tp_is_empty!36815 () Bool)

(assert (=> b!1334567 (= e!760067 tp_is_empty!36815)))

(declare-fun b!1334568 () Bool)

(declare-fun res!885739 () Bool)

(assert (=> b!1334568 (=> (not res!885739) (not e!760071))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90496 0))(
  ( (array!90497 (arr!43714 (Array (_ BitVec 32) (_ BitVec 64))) (size!44264 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90496)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1334568 (= res!885739 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44264 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56896 () Bool)

(declare-fun mapRes!56896 () Bool)

(declare-fun tp!108352 () Bool)

(assert (=> mapNonEmpty!56896 (= mapRes!56896 (and tp!108352 e!760067))))

(declare-datatypes ((V!54189 0))(
  ( (V!54190 (val!18482 Int)) )
))
(declare-datatypes ((ValueCell!17509 0))(
  ( (ValueCellFull!17509 (v!21119 V!54189)) (EmptyCell!17509) )
))
(declare-datatypes ((array!90498 0))(
  ( (array!90499 (arr!43715 (Array (_ BitVec 32) ValueCell!17509)) (size!44265 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90498)

(declare-fun mapValue!56896 () ValueCell!17509)

(declare-fun mapRest!56896 () (Array (_ BitVec 32) ValueCell!17509))

(declare-fun mapKey!56896 () (_ BitVec 32))

(assert (=> mapNonEmpty!56896 (= (arr!43715 _values!1320) (store mapRest!56896 mapKey!56896 mapValue!56896))))

(declare-fun res!885740 () Bool)

(assert (=> start!112510 (=> (not res!885740) (not e!760071))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112510 (= res!885740 (validMask!0 mask!1998))))

(assert (=> start!112510 e!760071))

(declare-fun e!760072 () Bool)

(declare-fun array_inv!32967 (array!90498) Bool)

(assert (=> start!112510 (and (array_inv!32967 _values!1320) e!760072)))

(assert (=> start!112510 true))

(declare-fun array_inv!32968 (array!90496) Bool)

(assert (=> start!112510 (array_inv!32968 _keys!1590)))

(assert (=> start!112510 tp!108351))

(assert (=> start!112510 tp_is_empty!36815))

(declare-fun b!1334569 () Bool)

(declare-fun res!885746 () Bool)

(declare-fun e!760069 () Bool)

(assert (=> b!1334569 (=> (not res!885746) (not e!760069))))

(assert (=> b!1334569 (= res!885746 (not (= k!1153 (select (arr!43714 _keys!1590) from!1980))))))

(declare-fun b!1334570 () Bool)

(declare-fun res!885744 () Bool)

(assert (=> b!1334570 (=> (not res!885744) (not e!760071))))

(declare-datatypes ((List!30971 0))(
  ( (Nil!30968) (Cons!30967 (h!32176 (_ BitVec 64)) (t!45235 List!30971)) )
))
(declare-fun arrayNoDuplicates!0 (array!90496 (_ BitVec 32) List!30971) Bool)

(assert (=> b!1334570 (= res!885744 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30968))))

(declare-fun b!1334571 () Bool)

(declare-fun res!885738 () Bool)

(assert (=> b!1334571 (=> (not res!885738) (not e!760071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334571 (= res!885738 (validKeyInArray!0 (select (arr!43714 _keys!1590) from!1980)))))

(declare-fun b!1334572 () Bool)

(assert (=> b!1334572 (= e!760071 e!760069)))

(declare-fun res!885745 () Bool)

(assert (=> b!1334572 (=> (not res!885745) (not e!760069))))

(declare-datatypes ((tuple2!23832 0))(
  ( (tuple2!23833 (_1!11927 (_ BitVec 64)) (_2!11927 V!54189)) )
))
(declare-datatypes ((List!30972 0))(
  ( (Nil!30969) (Cons!30968 (h!32177 tuple2!23832) (t!45236 List!30972)) )
))
(declare-datatypes ((ListLongMap!21489 0))(
  ( (ListLongMap!21490 (toList!10760 List!30972)) )
))
(declare-fun lt!592362 () ListLongMap!21489)

(declare-fun lt!592361 () V!54189)

(declare-fun contains!8924 (ListLongMap!21489 (_ BitVec 64)) Bool)

(declare-fun +!4729 (ListLongMap!21489 tuple2!23832) ListLongMap!21489)

(assert (=> b!1334572 (= res!885745 (contains!8924 (+!4729 lt!592362 (tuple2!23833 (select (arr!43714 _keys!1590) from!1980) lt!592361)) k!1153))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54189)

(declare-fun zeroValue!1262 () V!54189)

(declare-fun getCurrentListMapNoExtraKeys!6367 (array!90496 array!90498 (_ BitVec 32) (_ BitVec 32) V!54189 V!54189 (_ BitVec 32) Int) ListLongMap!21489)

(assert (=> b!1334572 (= lt!592362 (getCurrentListMapNoExtraKeys!6367 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22059 (ValueCell!17509 V!54189) V!54189)

(declare-fun dynLambda!3668 (Int (_ BitVec 64)) V!54189)

(assert (=> b!1334572 (= lt!592361 (get!22059 (select (arr!43715 _values!1320) from!1980) (dynLambda!3668 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!56896 () Bool)

(assert (=> mapIsEmpty!56896 mapRes!56896))

(declare-fun b!1334573 () Bool)

(declare-fun res!885747 () Bool)

(assert (=> b!1334573 (=> (not res!885747) (not e!760071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90496 (_ BitVec 32)) Bool)

(assert (=> b!1334573 (= res!885747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334574 () Bool)

(assert (=> b!1334574 (= e!760069 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(assert (=> b!1334574 (contains!8924 lt!592362 k!1153)))

(declare-datatypes ((Unit!43901 0))(
  ( (Unit!43902) )
))
(declare-fun lt!592363 () Unit!43901)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!313 ((_ BitVec 64) (_ BitVec 64) V!54189 ListLongMap!21489) Unit!43901)

(assert (=> b!1334574 (= lt!592363 (lemmaInListMapAfterAddingDiffThenInBefore!313 k!1153 (select (arr!43714 _keys!1590) from!1980) lt!592361 lt!592362))))

(declare-fun b!1334575 () Bool)

(declare-fun e!760068 () Bool)

(assert (=> b!1334575 (= e!760072 (and e!760068 mapRes!56896))))

(declare-fun condMapEmpty!56896 () Bool)

(declare-fun mapDefault!56896 () ValueCell!17509)

