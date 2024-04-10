; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131930 () Bool)

(assert start!131930)

(declare-fun b_free!31643 () Bool)

(declare-fun b_next!31643 () Bool)

(assert (=> start!131930 (= b_free!31643 (not b_next!31643))))

(declare-fun tp!111180 () Bool)

(declare-fun b_and!51053 () Bool)

(assert (=> start!131930 (= tp!111180 b_and!51053)))

(declare-fun b!1544893 () Bool)

(declare-fun e!859915 () Bool)

(declare-fun tp_is_empty!37919 () Bool)

(assert (=> b!1544893 (= e!859915 tp_is_empty!37919)))

(declare-fun mapNonEmpty!58582 () Bool)

(declare-fun mapRes!58582 () Bool)

(declare-fun tp!111181 () Bool)

(declare-fun e!859913 () Bool)

(assert (=> mapNonEmpty!58582 (= mapRes!58582 (and tp!111181 e!859913))))

(declare-datatypes ((V!59001 0))(
  ( (V!59002 (val!19037 Int)) )
))
(declare-datatypes ((ValueCell!18049 0))(
  ( (ValueCellFull!18049 (v!21838 V!59001)) (EmptyCell!18049) )
))
(declare-fun mapValue!58582 () ValueCell!18049)

(declare-fun mapKey!58582 () (_ BitVec 32))

(declare-datatypes ((array!103046 0))(
  ( (array!103047 (arr!49725 (Array (_ BitVec 32) ValueCell!18049)) (size!50275 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103046)

(declare-fun mapRest!58582 () (Array (_ BitVec 32) ValueCell!18049))

(assert (=> mapNonEmpty!58582 (= (arr!49725 _values!470) (store mapRest!58582 mapKey!58582 mapValue!58582))))

(declare-fun b!1544894 () Bool)

(declare-datatypes ((tuple2!24460 0))(
  ( (tuple2!24461 (_1!12241 (_ BitVec 64)) (_2!12241 V!59001)) )
))
(declare-datatypes ((List!35973 0))(
  ( (Nil!35970) (Cons!35969 (h!37414 tuple2!24460) (t!50667 List!35973)) )
))
(declare-datatypes ((ListLongMap!22069 0))(
  ( (ListLongMap!22070 (toList!11050 List!35973)) )
))
(declare-fun e!859919 () ListLongMap!22069)

(declare-fun call!69054 () ListLongMap!22069)

(assert (=> b!1544894 (= e!859919 call!69054)))

(declare-fun b!1544895 () Bool)

(assert (=> b!1544895 (= e!859913 tp_is_empty!37919)))

(declare-fun bm!69047 () Bool)

(declare-fun call!69051 () ListLongMap!22069)

(declare-fun call!69050 () ListLongMap!22069)

(assert (=> bm!69047 (= call!69051 call!69050)))

(declare-fun zeroValue!436 () V!59001)

(declare-fun call!69053 () ListLongMap!22069)

(declare-fun c!141524 () Bool)

(declare-fun c!141522 () Bool)

(declare-fun minValue!436 () V!59001)

(declare-fun bm!69048 () Bool)

(declare-fun call!69052 () ListLongMap!22069)

(declare-fun +!4886 (ListLongMap!22069 tuple2!24460) ListLongMap!22069)

(assert (=> bm!69048 (= call!69053 (+!4886 (ite c!141522 call!69050 (ite c!141524 call!69051 call!69052)) (ite (or c!141522 c!141524) (tuple2!24461 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24461 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun res!1059580 () Bool)

(declare-fun e!859920 () Bool)

(assert (=> start!131930 (=> (not res!1059580) (not e!859920))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131930 (= res!1059580 (validMask!0 mask!926))))

(assert (=> start!131930 e!859920))

(declare-datatypes ((array!103048 0))(
  ( (array!103049 (arr!49726 (Array (_ BitVec 32) (_ BitVec 64))) (size!50276 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103048)

(declare-fun array_inv!38679 (array!103048) Bool)

(assert (=> start!131930 (array_inv!38679 _keys!618)))

(assert (=> start!131930 tp_is_empty!37919))

(assert (=> start!131930 true))

(assert (=> start!131930 tp!111180))

(declare-fun e!859914 () Bool)

(declare-fun array_inv!38680 (array!103046) Bool)

(assert (=> start!131930 (and (array_inv!38680 _values!470) e!859914)))

(declare-fun b!1544896 () Bool)

(assert (=> b!1544896 (= e!859920 false)))

(declare-fun lt!666202 () ListLongMap!22069)

(declare-fun e!859916 () ListLongMap!22069)

(assert (=> b!1544896 (= lt!666202 e!859916)))

(declare-fun lt!666203 () Bool)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544896 (= c!141522 (and (not lt!666203) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1544896 (= lt!666203 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1544897 () Bool)

(declare-fun res!1059581 () Bool)

(assert (=> b!1544897 (=> (not res!1059581) (not e!859920))))

(assert (=> b!1544897 (= res!1059581 (and (= (size!50275 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50276 _keys!618) (size!50275 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun bm!69049 () Bool)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6520 (array!103048 array!103046 (_ BitVec 32) (_ BitVec 32) V!59001 V!59001 (_ BitVec 32) Int) ListLongMap!22069)

(assert (=> bm!69049 (= call!69050 (getCurrentListMapNoExtraKeys!6520 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1544898 () Bool)

(assert (=> b!1544898 (= e!859919 call!69052)))

(declare-fun b!1544899 () Bool)

(assert (=> b!1544899 (= e!859914 (and e!859915 mapRes!58582))))

(declare-fun condMapEmpty!58582 () Bool)

(declare-fun mapDefault!58582 () ValueCell!18049)

