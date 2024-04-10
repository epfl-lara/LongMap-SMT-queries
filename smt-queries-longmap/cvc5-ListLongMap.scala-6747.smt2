; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84560 () Bool)

(assert start!84560)

(declare-fun b_free!20041 () Bool)

(declare-fun b_next!20041 () Bool)

(assert (=> start!84560 (= b_free!20041 (not b_next!20041))))

(declare-fun tp!69910 () Bool)

(declare-fun b_and!32151 () Bool)

(assert (=> start!84560 (= tp!69910 b_and!32151)))

(declare-fun b!989047 () Bool)

(declare-fun res!661498 () Bool)

(declare-fun e!557697 () Bool)

(assert (=> b!989047 (=> (not res!661498) (not e!557697))))

(declare-datatypes ((array!62473 0))(
  ( (array!62474 (arr!30090 (Array (_ BitVec 32) (_ BitVec 64))) (size!30569 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62473)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62473 (_ BitVec 32)) Bool)

(assert (=> b!989047 (= res!661498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989048 () Bool)

(declare-fun e!557693 () Bool)

(declare-fun tp_is_empty!23257 () Bool)

(assert (=> b!989048 (= e!557693 tp_is_empty!23257)))

(declare-fun b!989049 () Bool)

(declare-fun res!661503 () Bool)

(assert (=> b!989049 (=> (not res!661503) (not e!557697))))

(declare-datatypes ((V!35993 0))(
  ( (V!35994 (val!11679 Int)) )
))
(declare-datatypes ((ValueCell!11147 0))(
  ( (ValueCellFull!11147 (v!14246 V!35993)) (EmptyCell!11147) )
))
(declare-datatypes ((array!62475 0))(
  ( (array!62476 (arr!30091 (Array (_ BitVec 32) ValueCell!11147)) (size!30570 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62475)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!989049 (= res!661503 (and (= (size!30570 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30569 _keys!1544) (size!30570 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun minValue!1220 () V!35993)

(declare-fun b!989050 () Bool)

(declare-datatypes ((tuple2!14884 0))(
  ( (tuple2!14885 (_1!7453 (_ BitVec 64)) (_2!7453 V!35993)) )
))
(declare-fun lt!438698 () tuple2!14884)

(declare-fun zeroValue!1220 () V!35993)

(declare-fun e!557695 () Bool)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((List!20814 0))(
  ( (Nil!20811) (Cons!20810 (h!21972 tuple2!14884) (t!29767 List!20814)) )
))
(declare-datatypes ((ListLongMap!13581 0))(
  ( (ListLongMap!13582 (toList!6806 List!20814)) )
))
(declare-fun getCurrentListMap!3865 (array!62473 array!62475 (_ BitVec 32) (_ BitVec 32) V!35993 V!35993 (_ BitVec 32) Int) ListLongMap!13581)

(declare-fun +!3084 (ListLongMap!13581 tuple2!14884) ListLongMap!13581)

(assert (=> b!989050 (= e!557695 (not (= (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 from!1932 defaultEntry!1281) (+!3084 (getCurrentListMap!3865 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438698))))))

(declare-fun lt!438700 () ListLongMap!13581)

(declare-fun lt!438696 () tuple2!14884)

(assert (=> b!989050 (= (+!3084 (+!3084 lt!438700 lt!438696) lt!438698) (+!3084 (+!3084 lt!438700 lt!438698) lt!438696))))

(declare-fun lt!438699 () V!35993)

(assert (=> b!989050 (= lt!438698 (tuple2!14885 (select (arr!30090 _keys!1544) from!1932) lt!438699))))

(assert (=> b!989050 (= lt!438696 (tuple2!14885 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32823 0))(
  ( (Unit!32824) )
))
(declare-fun lt!438697 () Unit!32823)

(declare-fun addCommutativeForDiffKeys!707 (ListLongMap!13581 (_ BitVec 64) V!35993 (_ BitVec 64) V!35993) Unit!32823)

(assert (=> b!989050 (= lt!438697 (addCommutativeForDiffKeys!707 lt!438700 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30090 _keys!1544) from!1932) lt!438699))))

(declare-fun b!989051 () Bool)

(declare-fun res!661500 () Bool)

(assert (=> b!989051 (=> (not res!661500) (not e!557697))))

(assert (=> b!989051 (= res!661500 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!989052 () Bool)

(declare-fun e!557698 () Bool)

(declare-fun e!557696 () Bool)

(declare-fun mapRes!36927 () Bool)

(assert (=> b!989052 (= e!557698 (and e!557696 mapRes!36927))))

(declare-fun condMapEmpty!36927 () Bool)

(declare-fun mapDefault!36927 () ValueCell!11147)

