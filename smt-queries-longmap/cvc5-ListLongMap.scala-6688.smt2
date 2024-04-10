; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84100 () Bool)

(assert start!84100)

(declare-fun b!983392 () Bool)

(declare-fun e!554323 () Bool)

(declare-fun tp_is_empty!22903 () Bool)

(assert (=> b!983392 (= e!554323 tp_is_empty!22903)))

(declare-fun b!983393 () Bool)

(declare-fun e!554322 () Bool)

(assert (=> b!983393 (= e!554322 tp_is_empty!22903)))

(declare-fun res!658072 () Bool)

(declare-fun e!554325 () Bool)

(assert (=> start!84100 (=> (not res!658072) (not e!554325))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84100 (= res!658072 (validMask!0 mask!1948))))

(assert (=> start!84100 e!554325))

(assert (=> start!84100 true))

(declare-datatypes ((V!35521 0))(
  ( (V!35522 (val!11502 Int)) )
))
(declare-datatypes ((ValueCell!10970 0))(
  ( (ValueCellFull!10970 (v!14064 V!35521)) (EmptyCell!10970) )
))
(declare-datatypes ((array!61793 0))(
  ( (array!61794 (arr!29754 (Array (_ BitVec 32) ValueCell!10970)) (size!30233 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61793)

(declare-fun e!554324 () Bool)

(declare-fun array_inv!23005 (array!61793) Bool)

(assert (=> start!84100 (and (array_inv!23005 _values!1278) e!554324)))

(declare-datatypes ((array!61795 0))(
  ( (array!61796 (arr!29755 (Array (_ BitVec 32) (_ BitVec 64))) (size!30234 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61795)

(declare-fun array_inv!23006 (array!61795) Bool)

(assert (=> start!84100 (array_inv!23006 _keys!1544)))

(declare-fun mapNonEmpty!36383 () Bool)

(declare-fun mapRes!36383 () Bool)

(declare-fun tp!69067 () Bool)

(assert (=> mapNonEmpty!36383 (= mapRes!36383 (and tp!69067 e!554323))))

(declare-fun mapKey!36383 () (_ BitVec 32))

(declare-fun mapValue!36383 () ValueCell!10970)

(declare-fun mapRest!36383 () (Array (_ BitVec 32) ValueCell!10970))

(assert (=> mapNonEmpty!36383 (= (arr!29754 _values!1278) (store mapRest!36383 mapKey!36383 mapValue!36383))))

(declare-fun b!983394 () Bool)

(declare-fun res!658071 () Bool)

(assert (=> b!983394 (=> (not res!658071) (not e!554325))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983394 (= res!658071 (and (= (size!30233 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30234 _keys!1544) (size!30233 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983395 () Bool)

(assert (=> b!983395 (= e!554325 false)))

(declare-fun lt!436511 () Bool)

(declare-datatypes ((List!20610 0))(
  ( (Nil!20607) (Cons!20606 (h!21768 (_ BitVec 64)) (t!29401 List!20610)) )
))
(declare-fun arrayNoDuplicates!0 (array!61795 (_ BitVec 32) List!20610) Bool)

(assert (=> b!983395 (= lt!436511 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20607))))

(declare-fun mapIsEmpty!36383 () Bool)

(assert (=> mapIsEmpty!36383 mapRes!36383))

(declare-fun b!983396 () Bool)

(assert (=> b!983396 (= e!554324 (and e!554322 mapRes!36383))))

(declare-fun condMapEmpty!36383 () Bool)

(declare-fun mapDefault!36383 () ValueCell!10970)

