; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84890 () Bool)

(assert start!84890)

(declare-fun b!992007 () Bool)

(declare-fun res!663047 () Bool)

(declare-fun e!559560 () Bool)

(assert (=> b!992007 (=> (not res!663047) (not e!559560))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-datatypes ((V!36141 0))(
  ( (V!36142 (val!11735 Int)) )
))
(declare-datatypes ((ValueCell!11203 0))(
  ( (ValueCellFull!11203 (v!14312 V!36141)) (EmptyCell!11203) )
))
(declare-datatypes ((array!62707 0))(
  ( (array!62708 (arr!30198 (Array (_ BitVec 32) ValueCell!11203)) (size!30677 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62707)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-datatypes ((array!62709 0))(
  ( (array!62710 (arr!30199 (Array (_ BitVec 32) (_ BitVec 64))) (size!30678 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62709)

(assert (=> b!992007 (= res!663047 (and (= (size!30677 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30678 _keys!1945) (size!30677 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!992008 () Bool)

(declare-fun res!663046 () Bool)

(assert (=> b!992008 (=> (not res!663046) (not e!559560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62709 (_ BitVec 32)) Bool)

(assert (=> b!992008 (= res!663046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun mapIsEmpty!37125 () Bool)

(declare-fun mapRes!37125 () Bool)

(assert (=> mapIsEmpty!37125 mapRes!37125))

(declare-fun b!992010 () Bool)

(declare-fun e!559559 () Bool)

(declare-fun tp_is_empty!23369 () Bool)

(assert (=> b!992010 (= e!559559 tp_is_empty!23369)))

(declare-fun mapNonEmpty!37125 () Bool)

(declare-fun tp!70196 () Bool)

(declare-fun e!559562 () Bool)

(assert (=> mapNonEmpty!37125 (= mapRes!37125 (and tp!70196 e!559562))))

(declare-fun mapRest!37125 () (Array (_ BitVec 32) ValueCell!11203))

(declare-fun mapKey!37125 () (_ BitVec 32))

(declare-fun mapValue!37125 () ValueCell!11203)

(assert (=> mapNonEmpty!37125 (= (arr!30198 _values!1551) (store mapRest!37125 mapKey!37125 mapValue!37125))))

(declare-fun b!992011 () Bool)

(assert (=> b!992011 (= e!559562 tp_is_empty!23369)))

(declare-fun b!992012 () Bool)

(assert (=> b!992012 (= e!559560 false)))

(declare-fun lt!440041 () Bool)

(declare-datatypes ((List!20870 0))(
  ( (Nil!20867) (Cons!20866 (h!22028 (_ BitVec 64)) (t!29853 List!20870)) )
))
(declare-fun arrayNoDuplicates!0 (array!62709 (_ BitVec 32) List!20870) Bool)

(assert (=> b!992012 (= lt!440041 (arrayNoDuplicates!0 _keys!1945 #b00000000000000000000000000000000 Nil!20867))))

(declare-fun res!663048 () Bool)

(assert (=> start!84890 (=> (not res!663048) (not e!559560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84890 (= res!663048 (validMask!0 mask!2471))))

(assert (=> start!84890 e!559560))

(assert (=> start!84890 true))

(declare-fun e!559563 () Bool)

(declare-fun array_inv!23325 (array!62707) Bool)

(assert (=> start!84890 (and (array_inv!23325 _values!1551) e!559563)))

(declare-fun array_inv!23326 (array!62709) Bool)

(assert (=> start!84890 (array_inv!23326 _keys!1945)))

(declare-fun b!992009 () Bool)

(assert (=> b!992009 (= e!559563 (and e!559559 mapRes!37125))))

(declare-fun condMapEmpty!37125 () Bool)

(declare-fun mapDefault!37125 () ValueCell!11203)

