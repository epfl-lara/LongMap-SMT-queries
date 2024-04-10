; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113270 () Bool)

(assert start!113270)

(declare-fun b_free!31321 () Bool)

(declare-fun b_next!31321 () Bool)

(assert (=> start!113270 (= b_free!31321 (not b_next!31321))))

(declare-fun tp!109768 () Bool)

(declare-fun b_and!50543 () Bool)

(assert (=> start!113270 (= tp!109768 b_and!50543)))

(declare-fun b!1343943 () Bool)

(declare-fun e!764887 () Bool)

(assert (=> b!1343943 (= e!764887 false)))

(declare-datatypes ((V!54865 0))(
  ( (V!54866 (val!18735 Int)) )
))
(declare-fun minValue!1245 () V!54865)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91486 0))(
  ( (array!91487 (arr!44199 (Array (_ BitVec 32) (_ BitVec 64))) (size!44749 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91486)

(declare-fun zeroValue!1245 () V!54865)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17762 0))(
  ( (ValueCellFull!17762 (v!21383 V!54865)) (EmptyCell!17762) )
))
(declare-datatypes ((array!91488 0))(
  ( (array!91489 (arr!44200 (Array (_ BitVec 32) ValueCell!17762)) (size!44750 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91488)

(declare-fun lt!595131 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24138 0))(
  ( (tuple2!24139 (_1!12080 (_ BitVec 64)) (_2!12080 V!54865)) )
))
(declare-datatypes ((List!31294 0))(
  ( (Nil!31291) (Cons!31290 (h!32499 tuple2!24138) (t!45818 List!31294)) )
))
(declare-datatypes ((ListLongMap!21795 0))(
  ( (ListLongMap!21796 (toList!10913 List!31294)) )
))
(declare-fun contains!9089 (ListLongMap!21795 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5869 (array!91486 array!91488 (_ BitVec 32) (_ BitVec 32) V!54865 V!54865 (_ BitVec 32) Int) ListLongMap!21795)

(assert (=> b!1343943 (= lt!595131 (contains!9089 (getCurrentListMap!5869 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1343944 () Bool)

(declare-fun res!891690 () Bool)

(assert (=> b!1343944 (=> (not res!891690) (not e!764887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91486 (_ BitVec 32)) Bool)

(assert (=> b!1343944 (= res!891690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57688 () Bool)

(declare-fun mapRes!57688 () Bool)

(assert (=> mapIsEmpty!57688 mapRes!57688))

(declare-fun b!1343945 () Bool)

(declare-fun e!764884 () Bool)

(declare-fun e!764885 () Bool)

(assert (=> b!1343945 (= e!764884 (and e!764885 mapRes!57688))))

(declare-fun condMapEmpty!57688 () Bool)

(declare-fun mapDefault!57688 () ValueCell!17762)

