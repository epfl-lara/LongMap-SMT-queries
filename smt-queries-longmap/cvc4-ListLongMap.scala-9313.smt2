; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111318 () Bool)

(assert start!111318)

(declare-fun mapIsEmpty!55340 () Bool)

(declare-fun mapRes!55340 () Bool)

(assert (=> mapIsEmpty!55340 mapRes!55340))

(declare-fun b!1317303 () Bool)

(declare-fun e!751653 () Bool)

(declare-fun tp_is_empty!35795 () Bool)

(assert (=> b!1317303 (= e!751653 tp_is_empty!35795)))

(declare-fun b!1317304 () Bool)

(declare-fun res!874315 () Bool)

(declare-fun e!751650 () Bool)

(assert (=> b!1317304 (=> (not res!874315) (not e!751650))))

(declare-datatypes ((array!88548 0))(
  ( (array!88549 (arr!42748 (Array (_ BitVec 32) (_ BitVec 64))) (size!43298 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88548)

(declare-datatypes ((V!52829 0))(
  ( (V!52830 (val!17972 Int)) )
))
(declare-datatypes ((ValueCell!16999 0))(
  ( (ValueCellFull!16999 (v!20602 V!52829)) (EmptyCell!16999) )
))
(declare-datatypes ((array!88550 0))(
  ( (array!88551 (arr!42749 (Array (_ BitVec 32) ValueCell!16999)) (size!43299 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88550)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317304 (= res!874315 (and (= (size!43299 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43298 _keys!1609) (size!43299 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317305 () Bool)

(assert (=> b!1317305 (= e!751650 false)))

(declare-fun lt!586347 () Bool)

(declare-datatypes ((List!30301 0))(
  ( (Nil!30298) (Cons!30297 (h!31506 (_ BitVec 64)) (t!43909 List!30301)) )
))
(declare-fun arrayNoDuplicates!0 (array!88548 (_ BitVec 32) List!30301) Bool)

(assert (=> b!1317305 (= lt!586347 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30298))))

(declare-fun b!1317306 () Bool)

(declare-fun e!751654 () Bool)

(assert (=> b!1317306 (= e!751654 tp_is_empty!35795)))

(declare-fun b!1317307 () Bool)

(declare-fun e!751652 () Bool)

(assert (=> b!1317307 (= e!751652 (and e!751653 mapRes!55340))))

(declare-fun condMapEmpty!55340 () Bool)

(declare-fun mapDefault!55340 () ValueCell!16999)

