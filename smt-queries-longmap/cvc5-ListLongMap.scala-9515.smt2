; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112930 () Bool)

(assert start!112930)

(declare-fun res!888244 () Bool)

(declare-fun e!762444 () Bool)

(assert (=> start!112930 (=> (not res!888244) (not e!762444))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112930 (= res!888244 (validMask!0 mask!1977))))

(assert (=> start!112930 e!762444))

(assert (=> start!112930 true))

(declare-datatypes ((V!54441 0))(
  ( (V!54442 (val!18576 Int)) )
))
(declare-datatypes ((ValueCell!17603 0))(
  ( (ValueCellFull!17603 (v!21223 V!54441)) (EmptyCell!17603) )
))
(declare-datatypes ((array!90868 0))(
  ( (array!90869 (arr!43892 (Array (_ BitVec 32) ValueCell!17603)) (size!44442 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90868)

(declare-fun e!762443 () Bool)

(declare-fun array_inv!33099 (array!90868) Bool)

(assert (=> start!112930 (and (array_inv!33099 _values!1303) e!762443)))

(declare-datatypes ((array!90870 0))(
  ( (array!90871 (arr!43893 (Array (_ BitVec 32) (_ BitVec 64))) (size!44443 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90870)

(declare-fun array_inv!33100 (array!90870) Bool)

(assert (=> start!112930 (array_inv!33100 _keys!1571)))

(declare-fun b!1338847 () Bool)

(declare-fun res!888242 () Bool)

(assert (=> b!1338847 (=> (not res!888242) (not e!762444))))

(assert (=> b!1338847 (= res!888242 (and (bvsle #b00000000000000000000000000000000 (size!44443 _keys!1571)) (bvslt (size!44443 _keys!1571) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!57205 () Bool)

(declare-fun mapRes!57205 () Bool)

(declare-fun tp!108904 () Bool)

(declare-fun e!762441 () Bool)

(assert (=> mapNonEmpty!57205 (= mapRes!57205 (and tp!108904 e!762441))))

(declare-fun mapValue!57205 () ValueCell!17603)

(declare-fun mapRest!57205 () (Array (_ BitVec 32) ValueCell!17603))

(declare-fun mapKey!57205 () (_ BitVec 32))

(assert (=> mapNonEmpty!57205 (= (arr!43892 _values!1303) (store mapRest!57205 mapKey!57205 mapValue!57205))))

(declare-fun b!1338848 () Bool)

(declare-fun e!762442 () Bool)

(declare-fun tp_is_empty!37003 () Bool)

(assert (=> b!1338848 (= e!762442 tp_is_empty!37003)))

(declare-fun b!1338849 () Bool)

(assert (=> b!1338849 (= e!762441 tp_is_empty!37003)))

(declare-fun b!1338850 () Bool)

(declare-datatypes ((List!31090 0))(
  ( (Nil!31087) (Cons!31086 (h!32295 (_ BitVec 64)) (t!45422 List!31090)) )
))
(declare-fun noDuplicate!2067 (List!31090) Bool)

(assert (=> b!1338850 (= e!762444 (not (noDuplicate!2067 Nil!31087)))))

(declare-fun b!1338851 () Bool)

(declare-fun res!888241 () Bool)

(assert (=> b!1338851 (=> (not res!888241) (not e!762444))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1338851 (= res!888241 (and (= (size!44442 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44443 _keys!1571) (size!44442 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1338852 () Bool)

(declare-fun res!888243 () Bool)

(assert (=> b!1338852 (=> (not res!888243) (not e!762444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90870 (_ BitVec 32)) Bool)

(assert (=> b!1338852 (= res!888243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57205 () Bool)

(assert (=> mapIsEmpty!57205 mapRes!57205))

(declare-fun b!1338853 () Bool)

(assert (=> b!1338853 (= e!762443 (and e!762442 mapRes!57205))))

(declare-fun condMapEmpty!57205 () Bool)

(declare-fun mapDefault!57205 () ValueCell!17603)

