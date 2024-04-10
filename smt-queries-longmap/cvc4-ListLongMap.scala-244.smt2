; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4150 () Bool)

(assert start!4150)

(declare-fun b_free!1055 () Bool)

(declare-fun b_next!1055 () Bool)

(assert (=> start!4150 (= b_free!1055 (not b_next!1055))))

(declare-fun tp!4584 () Bool)

(declare-fun b_and!1865 () Bool)

(assert (=> start!4150 (= tp!4584 b_and!1865)))

(declare-fun res!18921 () Bool)

(declare-fun e!19978 () Bool)

(assert (=> start!4150 (=> (not res!18921) (not e!19978))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4150 (= res!18921 (validMask!0 mask!2294))))

(assert (=> start!4150 e!19978))

(assert (=> start!4150 true))

(assert (=> start!4150 tp!4584))

(declare-datatypes ((V!1703 0))(
  ( (V!1704 (val!731 Int)) )
))
(declare-datatypes ((ValueCell!505 0))(
  ( (ValueCellFull!505 (v!1820 V!1703)) (EmptyCell!505) )
))
(declare-datatypes ((array!2041 0))(
  ( (array!2042 (arr!974 (Array (_ BitVec 32) ValueCell!505)) (size!1075 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2041)

(declare-fun e!19975 () Bool)

(declare-fun array_inv!681 (array!2041) Bool)

(assert (=> start!4150 (and (array_inv!681 _values!1501) e!19975)))

(declare-datatypes ((array!2043 0))(
  ( (array!2044 (arr!975 (Array (_ BitVec 32) (_ BitVec 64))) (size!1076 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2043)

(declare-fun array_inv!682 (array!2043) Bool)

(assert (=> start!4150 (array_inv!682 _keys!1833)))

(declare-fun tp_is_empty!1409 () Bool)

(assert (=> start!4150 tp_is_empty!1409))

(declare-fun b!31251 () Bool)

(assert (=> b!31251 (= e!19978 false)))

(declare-fun k!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!121 0))(
  ( (MissingZero!121 (index!2606 (_ BitVec 32))) (Found!121 (index!2607 (_ BitVec 32))) (Intermediate!121 (undefined!933 Bool) (index!2608 (_ BitVec 32)) (x!6615 (_ BitVec 32))) (Undefined!121) (MissingVacant!121 (index!2609 (_ BitVec 32))) )
))
(declare-fun lt!11543 () SeekEntryResult!121)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2043 (_ BitVec 32)) SeekEntryResult!121)

(assert (=> b!31251 (= lt!11543 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!31252 () Bool)

(declare-fun res!18925 () Bool)

(assert (=> b!31252 (=> (not res!18925) (not e!19978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2043 (_ BitVec 32)) Bool)

(assert (=> b!31252 (= res!18925 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31253 () Bool)

(declare-fun res!18924 () Bool)

(assert (=> b!31253 (=> (not res!18924) (not e!19978))))

(declare-datatypes ((List!791 0))(
  ( (Nil!788) (Cons!787 (h!1354 (_ BitVec 64)) (t!3484 List!791)) )
))
(declare-fun arrayNoDuplicates!0 (array!2043 (_ BitVec 32) List!791) Bool)

(assert (=> b!31253 (= res!18924 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!788))))

(declare-fun b!31254 () Bool)

(declare-fun res!18927 () Bool)

(assert (=> b!31254 (=> (not res!18927) (not e!19978))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!31254 (= res!18927 (and (= (size!1075 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1076 _keys!1833) (size!1075 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31255 () Bool)

(declare-fun res!18922 () Bool)

(assert (=> b!31255 (=> (not res!18922) (not e!19978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31255 (= res!18922 (validKeyInArray!0 k!1304))))

(declare-fun mapIsEmpty!1642 () Bool)

(declare-fun mapRes!1642 () Bool)

(assert (=> mapIsEmpty!1642 mapRes!1642))

(declare-fun b!31256 () Bool)

(declare-fun e!19979 () Bool)

(assert (=> b!31256 (= e!19979 tp_is_empty!1409)))

(declare-fun b!31257 () Bool)

(assert (=> b!31257 (= e!19975 (and e!19979 mapRes!1642))))

(declare-fun condMapEmpty!1642 () Bool)

(declare-fun mapDefault!1642 () ValueCell!505)

