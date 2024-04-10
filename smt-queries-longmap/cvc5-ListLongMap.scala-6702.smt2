; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84184 () Bool)

(assert start!84184)

(declare-fun b_free!19885 () Bool)

(declare-fun b_next!19885 () Bool)

(assert (=> start!84184 (= b_free!19885 (not b_next!19885))))

(declare-fun tp!69258 () Bool)

(declare-fun b_and!31847 () Bool)

(assert (=> start!84184 (= tp!69258 b_and!31847)))

(declare-fun b!984527 () Bool)

(declare-fun res!658799 () Bool)

(declare-fun e!555007 () Bool)

(assert (=> b!984527 (=> (not res!658799) (not e!555007))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61955 0))(
  ( (array!61956 (arr!29835 (Array (_ BitVec 32) (_ BitVec 64))) (size!30314 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61955)

(assert (=> b!984527 (= res!658799 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30314 _keys!1544))))))

(declare-fun b!984529 () Bool)

(declare-fun e!555010 () Bool)

(assert (=> b!984529 (= e!555007 e!555010)))

(declare-fun res!658795 () Bool)

(assert (=> b!984529 (=> (not res!658795) (not e!555010))))

(assert (=> b!984529 (= res!658795 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29835 _keys!1544) from!1932))))))

(declare-datatypes ((V!35633 0))(
  ( (V!35634 (val!11544 Int)) )
))
(declare-fun lt!436852 () V!35633)

(declare-datatypes ((ValueCell!11012 0))(
  ( (ValueCellFull!11012 (v!14106 V!35633)) (EmptyCell!11012) )
))
(declare-datatypes ((array!61957 0))(
  ( (array!61958 (arr!29836 (Array (_ BitVec 32) ValueCell!11012)) (size!30315 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61957)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15476 (ValueCell!11012 V!35633) V!35633)

(declare-fun dynLambda!1819 (Int (_ BitVec 64)) V!35633)

(assert (=> b!984529 (= lt!436852 (get!15476 (select (arr!29836 _values!1278) from!1932) (dynLambda!1819 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35633)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35633)

(declare-datatypes ((tuple2!14764 0))(
  ( (tuple2!14765 (_1!7393 (_ BitVec 64)) (_2!7393 V!35633)) )
))
(declare-datatypes ((List!20657 0))(
  ( (Nil!20654) (Cons!20653 (h!21815 tuple2!14764) (t!29486 List!20657)) )
))
(declare-datatypes ((ListLongMap!13461 0))(
  ( (ListLongMap!13462 (toList!6746 List!20657)) )
))
(declare-fun lt!436856 () ListLongMap!13461)

(declare-fun getCurrentListMapNoExtraKeys!3439 (array!61955 array!61957 (_ BitVec 32) (_ BitVec 32) V!35633 V!35633 (_ BitVec 32) Int) ListLongMap!13461)

(assert (=> b!984529 (= lt!436856 (getCurrentListMapNoExtraKeys!3439 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984530 () Bool)

(declare-fun e!555008 () Bool)

(declare-fun tp_is_empty!22987 () Bool)

(assert (=> b!984530 (= e!555008 tp_is_empty!22987)))

(declare-fun b!984531 () Bool)

(assert (=> b!984531 (= e!555010 (not true))))

(declare-fun lt!436854 () tuple2!14764)

(declare-fun lt!436853 () tuple2!14764)

(declare-fun +!3037 (ListLongMap!13461 tuple2!14764) ListLongMap!13461)

(assert (=> b!984531 (= (+!3037 (+!3037 lt!436856 lt!436854) lt!436853) (+!3037 (+!3037 lt!436856 lt!436853) lt!436854))))

(assert (=> b!984531 (= lt!436853 (tuple2!14765 (select (arr!29835 _keys!1544) from!1932) lt!436852))))

(assert (=> b!984531 (= lt!436854 (tuple2!14765 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32713 0))(
  ( (Unit!32714) )
))
(declare-fun lt!436855 () Unit!32713)

(declare-fun addCommutativeForDiffKeys!665 (ListLongMap!13461 (_ BitVec 64) V!35633 (_ BitVec 64) V!35633) Unit!32713)

(assert (=> b!984531 (= lt!436855 (addCommutativeForDiffKeys!665 lt!436856 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29835 _keys!1544) from!1932) lt!436852))))

(declare-fun b!984532 () Bool)

(declare-fun res!658797 () Bool)

(assert (=> b!984532 (=> (not res!658797) (not e!555007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984532 (= res!658797 (validKeyInArray!0 (select (arr!29835 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36509 () Bool)

(declare-fun mapRes!36509 () Bool)

(declare-fun tp!69259 () Bool)

(assert (=> mapNonEmpty!36509 (= mapRes!36509 (and tp!69259 e!555008))))

(declare-fun mapKey!36509 () (_ BitVec 32))

(declare-fun mapValue!36509 () ValueCell!11012)

(declare-fun mapRest!36509 () (Array (_ BitVec 32) ValueCell!11012))

(assert (=> mapNonEmpty!36509 (= (arr!29836 _values!1278) (store mapRest!36509 mapKey!36509 mapValue!36509))))

(declare-fun mapIsEmpty!36509 () Bool)

(assert (=> mapIsEmpty!36509 mapRes!36509))

(declare-fun b!984533 () Bool)

(declare-fun e!555011 () Bool)

(assert (=> b!984533 (= e!555011 tp_is_empty!22987)))

(declare-fun b!984534 () Bool)

(declare-fun e!555012 () Bool)

(assert (=> b!984534 (= e!555012 (and e!555011 mapRes!36509))))

(declare-fun condMapEmpty!36509 () Bool)

(declare-fun mapDefault!36509 () ValueCell!11012)

