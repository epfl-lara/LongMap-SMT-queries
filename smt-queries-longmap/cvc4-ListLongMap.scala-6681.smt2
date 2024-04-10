; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84062 () Bool)

(assert start!84062)

(declare-fun b_free!19817 () Bool)

(declare-fun b_next!19817 () Bool)

(assert (=> start!84062 (= b_free!19817 (not b_next!19817))))

(declare-fun tp!68974 () Bool)

(declare-fun b_and!31717 () Bool)

(assert (=> start!84062 (= tp!68974 b_and!31717)))

(declare-fun mapNonEmpty!36326 () Bool)

(declare-fun mapRes!36326 () Bool)

(declare-fun tp!68973 () Bool)

(declare-fun e!554003 () Bool)

(assert (=> mapNonEmpty!36326 (= mapRes!36326 (and tp!68973 e!554003))))

(declare-datatypes ((V!35469 0))(
  ( (V!35470 (val!11483 Int)) )
))
(declare-datatypes ((ValueCell!10951 0))(
  ( (ValueCellFull!10951 (v!14045 V!35469)) (EmptyCell!10951) )
))
(declare-fun mapValue!36326 () ValueCell!10951)

(declare-fun mapRest!36326 () (Array (_ BitVec 32) ValueCell!10951))

(declare-datatypes ((array!61719 0))(
  ( (array!61720 (arr!29717 (Array (_ BitVec 32) ValueCell!10951)) (size!30196 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61719)

(declare-fun mapKey!36326 () (_ BitVec 32))

(assert (=> mapNonEmpty!36326 (= (arr!29717 _values!1278) (store mapRest!36326 mapKey!36326 mapValue!36326))))

(declare-fun b!982839 () Bool)

(declare-fun res!657720 () Bool)

(declare-fun e!553999 () Bool)

(assert (=> b!982839 (=> (not res!657720) (not e!553999))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61721 0))(
  ( (array!61722 (arr!29718 (Array (_ BitVec 32) (_ BitVec 64))) (size!30197 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61721)

(assert (=> b!982839 (= res!657720 (and (= (size!30196 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30197 _keys!1544) (size!30196 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982840 () Bool)

(declare-fun res!657716 () Bool)

(assert (=> b!982840 (=> (not res!657716) (not e!553999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61721 (_ BitVec 32)) Bool)

(assert (=> b!982840 (= res!657716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36326 () Bool)

(assert (=> mapIsEmpty!36326 mapRes!36326))

(declare-fun b!982841 () Bool)

(declare-fun e!554001 () Bool)

(assert (=> b!982841 (= e!554001 (not true))))

(declare-datatypes ((tuple2!14712 0))(
  ( (tuple2!14713 (_1!7367 (_ BitVec 64)) (_2!7367 V!35469)) )
))
(declare-datatypes ((List!20591 0))(
  ( (Nil!20588) (Cons!20587 (h!21749 tuple2!14712) (t!29358 List!20591)) )
))
(declare-datatypes ((ListLongMap!13409 0))(
  ( (ListLongMap!13410 (toList!6720 List!20591)) )
))
(declare-fun lt!436306 () ListLongMap!13409)

(declare-fun lt!436307 () tuple2!14712)

(declare-fun lt!436308 () tuple2!14712)

(declare-fun +!3017 (ListLongMap!13409 tuple2!14712) ListLongMap!13409)

(assert (=> b!982841 (= (+!3017 (+!3017 lt!436306 lt!436307) lt!436308) (+!3017 (+!3017 lt!436306 lt!436308) lt!436307))))

(declare-fun lt!436310 () V!35469)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982841 (= lt!436308 (tuple2!14713 (select (arr!29718 _keys!1544) from!1932) lt!436310))))

(declare-fun zeroValue!1220 () V!35469)

(assert (=> b!982841 (= lt!436307 (tuple2!14713 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32673 0))(
  ( (Unit!32674) )
))
(declare-fun lt!436309 () Unit!32673)

(declare-fun addCommutativeForDiffKeys!645 (ListLongMap!13409 (_ BitVec 64) V!35469 (_ BitVec 64) V!35469) Unit!32673)

(assert (=> b!982841 (= lt!436309 (addCommutativeForDiffKeys!645 lt!436306 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29718 _keys!1544) from!1932) lt!436310))))

(declare-fun b!982842 () Bool)

(declare-fun e!554002 () Bool)

(declare-fun e!554000 () Bool)

(assert (=> b!982842 (= e!554002 (and e!554000 mapRes!36326))))

(declare-fun condMapEmpty!36326 () Bool)

(declare-fun mapDefault!36326 () ValueCell!10951)

