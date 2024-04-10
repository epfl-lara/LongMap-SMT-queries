; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113274 () Bool)

(assert start!113274)

(declare-fun b_free!31325 () Bool)

(declare-fun b_next!31325 () Bool)

(assert (=> start!113274 (= b_free!31325 (not b_next!31325))))

(declare-fun tp!109780 () Bool)

(declare-fun b_and!50547 () Bool)

(assert (=> start!113274 (= tp!109780 b_and!50547)))

(declare-fun b!1343991 () Bool)

(declare-fun res!891716 () Bool)

(declare-fun e!764917 () Bool)

(assert (=> b!1343991 (=> (not res!891716) (not e!764917))))

(declare-datatypes ((array!91494 0))(
  ( (array!91495 (arr!44203 (Array (_ BitVec 32) (_ BitVec 64))) (size!44753 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91494)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91494 (_ BitVec 32)) Bool)

(assert (=> b!1343991 (= res!891716 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343992 () Bool)

(declare-fun res!891720 () Bool)

(assert (=> b!1343992 (=> (not res!891720) (not e!764917))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1343992 (= res!891720 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44753 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343993 () Bool)

(declare-fun e!764918 () Bool)

(declare-fun tp_is_empty!37325 () Bool)

(assert (=> b!1343993 (= e!764918 tp_is_empty!37325)))

(declare-fun b!1343994 () Bool)

(declare-fun res!891719 () Bool)

(assert (=> b!1343994 (=> (not res!891719) (not e!764917))))

(declare-datatypes ((V!54869 0))(
  ( (V!54870 (val!18737 Int)) )
))
(declare-datatypes ((ValueCell!17764 0))(
  ( (ValueCellFull!17764 (v!21385 V!54869)) (EmptyCell!17764) )
))
(declare-datatypes ((array!91496 0))(
  ( (array!91497 (arr!44204 (Array (_ BitVec 32) ValueCell!17764)) (size!44754 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91496)

(assert (=> b!1343994 (= res!891719 (and (= (size!44754 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44753 _keys!1571) (size!44754 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343995 () Bool)

(declare-fun e!764914 () Bool)

(assert (=> b!1343995 (= e!764914 tp_is_empty!37325)))

(declare-fun res!891717 () Bool)

(assert (=> start!113274 (=> (not res!891717) (not e!764917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113274 (= res!891717 (validMask!0 mask!1977))))

(assert (=> start!113274 e!764917))

(assert (=> start!113274 tp_is_empty!37325))

(assert (=> start!113274 true))

(declare-fun array_inv!33313 (array!91494) Bool)

(assert (=> start!113274 (array_inv!33313 _keys!1571)))

(declare-fun e!764916 () Bool)

(declare-fun array_inv!33314 (array!91496) Bool)

(assert (=> start!113274 (and (array_inv!33314 _values!1303) e!764916)))

(assert (=> start!113274 tp!109780))

(declare-fun b!1343996 () Bool)

(declare-fun res!891718 () Bool)

(assert (=> b!1343996 (=> (not res!891718) (not e!764917))))

(declare-datatypes ((List!31297 0))(
  ( (Nil!31294) (Cons!31293 (h!32502 (_ BitVec 64)) (t!45821 List!31297)) )
))
(declare-fun arrayNoDuplicates!0 (array!91494 (_ BitVec 32) List!31297) Bool)

(assert (=> b!1343996 (= res!891718 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31294))))

(declare-fun b!1343997 () Bool)

(declare-fun mapRes!57694 () Bool)

(assert (=> b!1343997 (= e!764916 (and e!764914 mapRes!57694))))

(declare-fun condMapEmpty!57694 () Bool)

(declare-fun mapDefault!57694 () ValueCell!17764)

