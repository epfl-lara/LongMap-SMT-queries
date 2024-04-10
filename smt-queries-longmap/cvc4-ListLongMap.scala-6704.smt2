; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84200 () Bool)

(assert start!84200)

(declare-fun b_free!19901 () Bool)

(declare-fun b_next!19901 () Bool)

(assert (=> start!84200 (= b_free!19901 (not b_next!19901))))

(declare-fun tp!69307 () Bool)

(declare-fun b_and!31879 () Bool)

(assert (=> start!84200 (= tp!69307 b_and!31879)))

(declare-fun b!984807 () Bool)

(declare-fun e!555155 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61985 0))(
  ( (array!61986 (arr!29850 (Array (_ BitVec 32) (_ BitVec 64))) (size!30329 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61985)

(assert (=> b!984807 (= e!555155 (not (bvsle from!1932 (size!30329 _keys!1544))))))

(declare-datatypes ((V!35653 0))(
  ( (V!35654 (val!11552 Int)) )
))
(declare-datatypes ((tuple2!14776 0))(
  ( (tuple2!14777 (_1!7399 (_ BitVec 64)) (_2!7399 V!35653)) )
))
(declare-datatypes ((List!20669 0))(
  ( (Nil!20666) (Cons!20665 (h!21827 tuple2!14776) (t!29514 List!20669)) )
))
(declare-datatypes ((ListLongMap!13473 0))(
  ( (ListLongMap!13474 (toList!6752 List!20669)) )
))
(declare-fun lt!436974 () ListLongMap!13473)

(declare-fun lt!436976 () tuple2!14776)

(declare-fun lt!436975 () tuple2!14776)

(declare-fun +!3043 (ListLongMap!13473 tuple2!14776) ListLongMap!13473)

(assert (=> b!984807 (= (+!3043 (+!3043 lt!436974 lt!436976) lt!436975) (+!3043 (+!3043 lt!436974 lt!436975) lt!436976))))

(declare-fun lt!436973 () V!35653)

(assert (=> b!984807 (= lt!436975 (tuple2!14777 (select (arr!29850 _keys!1544) from!1932) lt!436973))))

(declare-fun minValue!1220 () V!35653)

(assert (=> b!984807 (= lt!436976 (tuple2!14777 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32725 0))(
  ( (Unit!32726) )
))
(declare-fun lt!436972 () Unit!32725)

(declare-fun addCommutativeForDiffKeys!671 (ListLongMap!13473 (_ BitVec 64) V!35653 (_ BitVec 64) V!35653) Unit!32725)

(assert (=> b!984807 (= lt!436972 (addCommutativeForDiffKeys!671 lt!436974 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29850 _keys!1544) from!1932) lt!436973))))

(declare-fun b!984808 () Bool)

(declare-fun res!658987 () Bool)

(declare-fun e!555151 () Bool)

(assert (=> b!984808 (=> (not res!658987) (not e!555151))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!984808 (= res!658987 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36533 () Bool)

(declare-fun mapRes!36533 () Bool)

(declare-fun tp!69306 () Bool)

(declare-fun e!555156 () Bool)

(assert (=> mapNonEmpty!36533 (= mapRes!36533 (and tp!69306 e!555156))))

(declare-datatypes ((ValueCell!11020 0))(
  ( (ValueCellFull!11020 (v!14114 V!35653)) (EmptyCell!11020) )
))
(declare-datatypes ((array!61987 0))(
  ( (array!61988 (arr!29851 (Array (_ BitVec 32) ValueCell!11020)) (size!30330 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61987)

(declare-fun mapKey!36533 () (_ BitVec 32))

(declare-fun mapValue!36533 () ValueCell!11020)

(declare-fun mapRest!36533 () (Array (_ BitVec 32) ValueCell!11020))

(assert (=> mapNonEmpty!36533 (= (arr!29851 _values!1278) (store mapRest!36533 mapKey!36533 mapValue!36533))))

(declare-fun b!984809 () Bool)

(declare-fun tp_is_empty!23003 () Bool)

(assert (=> b!984809 (= e!555156 tp_is_empty!23003)))

(declare-fun b!984810 () Bool)

(declare-fun res!658989 () Bool)

(assert (=> b!984810 (=> (not res!658989) (not e!555151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984810 (= res!658989 (validKeyInArray!0 (select (arr!29850 _keys!1544) from!1932)))))

(declare-fun b!984811 () Bool)

(declare-fun e!555152 () Bool)

(declare-fun e!555154 () Bool)

(assert (=> b!984811 (= e!555152 (and e!555154 mapRes!36533))))

(declare-fun condMapEmpty!36533 () Bool)

(declare-fun mapDefault!36533 () ValueCell!11020)

