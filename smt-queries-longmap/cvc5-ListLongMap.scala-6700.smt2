; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84172 () Bool)

(assert start!84172)

(declare-fun b_free!19873 () Bool)

(declare-fun b_next!19873 () Bool)

(assert (=> start!84172 (= b_free!19873 (not b_next!19873))))

(declare-fun tp!69222 () Bool)

(declare-fun b_and!31823 () Bool)

(assert (=> start!84172 (= tp!69222 b_and!31823)))

(declare-fun b!984317 () Bool)

(declare-fun res!658653 () Bool)

(declare-fun e!554899 () Bool)

(assert (=> b!984317 (=> (not res!658653) (not e!554899))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35617 0))(
  ( (V!35618 (val!11538 Int)) )
))
(declare-datatypes ((ValueCell!11006 0))(
  ( (ValueCellFull!11006 (v!14100 V!35617)) (EmptyCell!11006) )
))
(declare-datatypes ((array!61931 0))(
  ( (array!61932 (arr!29823 (Array (_ BitVec 32) ValueCell!11006)) (size!30302 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61931)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61933 0))(
  ( (array!61934 (arr!29824 (Array (_ BitVec 32) (_ BitVec 64))) (size!30303 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61933)

(assert (=> b!984317 (= res!658653 (and (= (size!30302 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30303 _keys!1544) (size!30302 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984318 () Bool)

(declare-fun res!658652 () Bool)

(assert (=> b!984318 (=> (not res!658652) (not e!554899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61933 (_ BitVec 32)) Bool)

(assert (=> b!984318 (= res!658652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36491 () Bool)

(declare-fun mapRes!36491 () Bool)

(declare-fun tp!69223 () Bool)

(declare-fun e!554902 () Bool)

(assert (=> mapNonEmpty!36491 (= mapRes!36491 (and tp!69223 e!554902))))

(declare-fun mapRest!36491 () (Array (_ BitVec 32) ValueCell!11006))

(declare-fun mapValue!36491 () ValueCell!11006)

(declare-fun mapKey!36491 () (_ BitVec 32))

(assert (=> mapNonEmpty!36491 (= (arr!29823 _values!1278) (store mapRest!36491 mapKey!36491 mapValue!36491))))

(declare-fun b!984319 () Bool)

(declare-fun e!554903 () Bool)

(assert (=> b!984319 (= e!554903 (not true))))

(declare-datatypes ((tuple2!14754 0))(
  ( (tuple2!14755 (_1!7388 (_ BitVec 64)) (_2!7388 V!35617)) )
))
(declare-datatypes ((List!20647 0))(
  ( (Nil!20644) (Cons!20643 (h!21805 tuple2!14754) (t!29464 List!20647)) )
))
(declare-datatypes ((ListLongMap!13451 0))(
  ( (ListLongMap!13452 (toList!6741 List!20647)) )
))
(declare-fun lt!436766 () ListLongMap!13451)

(declare-fun lt!436765 () tuple2!14754)

(declare-fun lt!436763 () tuple2!14754)

(declare-fun +!3034 (ListLongMap!13451 tuple2!14754) ListLongMap!13451)

(assert (=> b!984319 (= (+!3034 (+!3034 lt!436766 lt!436765) lt!436763) (+!3034 (+!3034 lt!436766 lt!436763) lt!436765))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!436762 () V!35617)

(assert (=> b!984319 (= lt!436763 (tuple2!14755 (select (arr!29824 _keys!1544) from!1932) lt!436762))))

(declare-fun minValue!1220 () V!35617)

(assert (=> b!984319 (= lt!436765 (tuple2!14755 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32707 0))(
  ( (Unit!32708) )
))
(declare-fun lt!436764 () Unit!32707)

(declare-fun addCommutativeForDiffKeys!662 (ListLongMap!13451 (_ BitVec 64) V!35617 (_ BitVec 64) V!35617) Unit!32707)

(assert (=> b!984319 (= lt!436764 (addCommutativeForDiffKeys!662 lt!436766 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29824 _keys!1544) from!1932) lt!436762))))

(declare-fun b!984320 () Bool)

(declare-fun res!658654 () Bool)

(assert (=> b!984320 (=> (not res!658654) (not e!554899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984320 (= res!658654 (validKeyInArray!0 (select (arr!29824 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36491 () Bool)

(assert (=> mapIsEmpty!36491 mapRes!36491))

(declare-fun b!984321 () Bool)

(declare-fun res!658650 () Bool)

(assert (=> b!984321 (=> (not res!658650) (not e!554899))))

(declare-datatypes ((List!20648 0))(
  ( (Nil!20645) (Cons!20644 (h!21806 (_ BitVec 64)) (t!29465 List!20648)) )
))
(declare-fun arrayNoDuplicates!0 (array!61933 (_ BitVec 32) List!20648) Bool)

(assert (=> b!984321 (= res!658650 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20645))))

(declare-fun b!984322 () Bool)

(declare-fun e!554900 () Bool)

(declare-fun tp_is_empty!22975 () Bool)

(assert (=> b!984322 (= e!554900 tp_is_empty!22975)))

(declare-fun b!984323 () Bool)

(declare-fun e!554901 () Bool)

(assert (=> b!984323 (= e!554901 (and e!554900 mapRes!36491))))

(declare-fun condMapEmpty!36491 () Bool)

(declare-fun mapDefault!36491 () ValueCell!11006)

