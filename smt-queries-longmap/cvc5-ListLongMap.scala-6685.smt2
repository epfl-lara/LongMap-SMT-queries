; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84082 () Bool)

(assert start!84082)

(declare-fun b_free!19837 () Bool)

(declare-fun b_next!19837 () Bool)

(assert (=> start!84082 (= b_free!19837 (not b_next!19837))))

(declare-fun tp!69034 () Bool)

(declare-fun b_and!31757 () Bool)

(assert (=> start!84082 (= tp!69034 b_and!31757)))

(declare-fun b!983190 () Bool)

(declare-fun res!657960 () Bool)

(declare-fun e!554180 () Bool)

(assert (=> b!983190 (=> (not res!657960) (not e!554180))))

(declare-datatypes ((array!61759 0))(
  ( (array!61760 (arr!29737 (Array (_ BitVec 32) (_ BitVec 64))) (size!30216 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61759)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983190 (= res!657960 (validKeyInArray!0 (select (arr!29737 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36356 () Bool)

(declare-fun mapRes!36356 () Bool)

(declare-fun tp!69033 () Bool)

(declare-fun e!554184 () Bool)

(assert (=> mapNonEmpty!36356 (= mapRes!36356 (and tp!69033 e!554184))))

(declare-datatypes ((V!35497 0))(
  ( (V!35498 (val!11493 Int)) )
))
(declare-datatypes ((ValueCell!10961 0))(
  ( (ValueCellFull!10961 (v!14055 V!35497)) (EmptyCell!10961) )
))
(declare-fun mapValue!36356 () ValueCell!10961)

(declare-fun mapKey!36356 () (_ BitVec 32))

(declare-datatypes ((array!61761 0))(
  ( (array!61762 (arr!29738 (Array (_ BitVec 32) ValueCell!10961)) (size!30217 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61761)

(declare-fun mapRest!36356 () (Array (_ BitVec 32) ValueCell!10961))

(assert (=> mapNonEmpty!36356 (= (arr!29738 _values!1278) (store mapRest!36356 mapKey!36356 mapValue!36356))))

(declare-fun b!983191 () Bool)

(declare-fun res!657962 () Bool)

(assert (=> b!983191 (=> (not res!657962) (not e!554180))))

(assert (=> b!983191 (= res!657962 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30216 _keys!1544))))))

(declare-fun b!983192 () Bool)

(declare-fun e!554179 () Bool)

(declare-fun tp_is_empty!22885 () Bool)

(assert (=> b!983192 (= e!554179 tp_is_empty!22885)))

(declare-fun b!983193 () Bool)

(declare-fun res!657956 () Bool)

(assert (=> b!983193 (=> (not res!657956) (not e!554180))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983193 (= res!657956 (and (= (size!30217 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30216 _keys!1544) (size!30217 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983194 () Bool)

(declare-fun e!554183 () Bool)

(assert (=> b!983194 (= e!554183 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!14726 0))(
  ( (tuple2!14727 (_1!7374 (_ BitVec 64)) (_2!7374 V!35497)) )
))
(declare-datatypes ((List!20603 0))(
  ( (Nil!20600) (Cons!20599 (h!21761 tuple2!14726) (t!29390 List!20603)) )
))
(declare-datatypes ((ListLongMap!13423 0))(
  ( (ListLongMap!13424 (toList!6727 List!20603)) )
))
(declare-fun lt!436457 () ListLongMap!13423)

(declare-fun lt!436458 () tuple2!14726)

(declare-fun lt!436460 () tuple2!14726)

(declare-fun +!3024 (ListLongMap!13423 tuple2!14726) ListLongMap!13423)

(assert (=> b!983194 (= (+!3024 (+!3024 lt!436457 lt!436458) lt!436460) (+!3024 (+!3024 lt!436457 lt!436460) lt!436458))))

(declare-fun lt!436459 () V!35497)

(assert (=> b!983194 (= lt!436460 (tuple2!14727 (select (arr!29737 _keys!1544) from!1932) lt!436459))))

(declare-fun zeroValue!1220 () V!35497)

(assert (=> b!983194 (= lt!436458 (tuple2!14727 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32687 0))(
  ( (Unit!32688) )
))
(declare-fun lt!436456 () Unit!32687)

(declare-fun addCommutativeForDiffKeys!652 (ListLongMap!13423 (_ BitVec 64) V!35497 (_ BitVec 64) V!35497) Unit!32687)

(assert (=> b!983194 (= lt!436456 (addCommutativeForDiffKeys!652 lt!436457 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29737 _keys!1544) from!1932) lt!436459))))

(declare-fun b!983195 () Bool)

(declare-fun e!554182 () Bool)

(assert (=> b!983195 (= e!554182 (and e!554179 mapRes!36356))))

(declare-fun condMapEmpty!36356 () Bool)

(declare-fun mapDefault!36356 () ValueCell!10961)

