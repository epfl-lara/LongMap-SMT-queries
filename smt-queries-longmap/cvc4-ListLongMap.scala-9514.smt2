; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112920 () Bool)

(assert start!112920)

(declare-fun mapNonEmpty!57199 () Bool)

(declare-fun mapRes!57199 () Bool)

(declare-fun tp!108898 () Bool)

(declare-fun e!762410 () Bool)

(assert (=> mapNonEmpty!57199 (= mapRes!57199 (and tp!108898 e!762410))))

(declare-datatypes ((V!54437 0))(
  ( (V!54438 (val!18575 Int)) )
))
(declare-datatypes ((ValueCell!17602 0))(
  ( (ValueCellFull!17602 (v!21222 V!54437)) (EmptyCell!17602) )
))
(declare-fun mapRest!57199 () (Array (_ BitVec 32) ValueCell!17602))

(declare-fun mapValue!57199 () ValueCell!17602)

(declare-fun mapKey!57199 () (_ BitVec 32))

(declare-datatypes ((array!90862 0))(
  ( (array!90863 (arr!43890 (Array (_ BitVec 32) ValueCell!17602)) (size!44440 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90862)

(assert (=> mapNonEmpty!57199 (= (arr!43890 _values!1303) (store mapRest!57199 mapKey!57199 mapValue!57199))))

(declare-fun b!1338807 () Bool)

(declare-fun e!762411 () Bool)

(declare-datatypes ((array!90864 0))(
  ( (array!90865 (arr!43891 (Array (_ BitVec 32) (_ BitVec 64))) (size!44441 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90864)

(assert (=> b!1338807 (= e!762411 (and (bvsle #b00000000000000000000000000000000 (size!44441 _keys!1571)) (bvsge (size!44441 _keys!1571) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!57199 () Bool)

(assert (=> mapIsEmpty!57199 mapRes!57199))

(declare-fun b!1338808 () Bool)

(declare-fun res!888226 () Bool)

(assert (=> b!1338808 (=> (not res!888226) (not e!762411))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1338808 (= res!888226 (and (= (size!44440 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44441 _keys!1571) (size!44440 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!888224 () Bool)

(assert (=> start!112920 (=> (not res!888224) (not e!762411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112920 (= res!888224 (validMask!0 mask!1977))))

(assert (=> start!112920 e!762411))

(assert (=> start!112920 true))

(declare-fun e!762412 () Bool)

(declare-fun array_inv!33097 (array!90862) Bool)

(assert (=> start!112920 (and (array_inv!33097 _values!1303) e!762412)))

(declare-fun array_inv!33098 (array!90864) Bool)

(assert (=> start!112920 (array_inv!33098 _keys!1571)))

(declare-fun b!1338809 () Bool)

(declare-fun res!888225 () Bool)

(assert (=> b!1338809 (=> (not res!888225) (not e!762411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90864 (_ BitVec 32)) Bool)

(assert (=> b!1338809 (= res!888225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1338810 () Bool)

(declare-fun tp_is_empty!37001 () Bool)

(assert (=> b!1338810 (= e!762410 tp_is_empty!37001)))

(declare-fun b!1338811 () Bool)

(declare-fun e!762413 () Bool)

(assert (=> b!1338811 (= e!762412 (and e!762413 mapRes!57199))))

(declare-fun condMapEmpty!57199 () Bool)

(declare-fun mapDefault!57199 () ValueCell!17602)

