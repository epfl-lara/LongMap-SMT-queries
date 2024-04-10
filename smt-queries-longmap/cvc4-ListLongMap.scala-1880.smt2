; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33718 () Bool)

(assert start!33718)

(declare-fun b_free!6953 () Bool)

(declare-fun b_next!6953 () Bool)

(assert (=> start!33718 (= b_free!6953 (not b_next!6953))))

(declare-fun tp!24363 () Bool)

(declare-fun b_and!14133 () Bool)

(assert (=> start!33718 (= tp!24363 b_and!14133)))

(declare-fun res!184948 () Bool)

(declare-fun e!205774 () Bool)

(assert (=> start!33718 (=> (not res!184948) (not e!205774))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33718 (= res!184948 (validMask!0 mask!2385))))

(assert (=> start!33718 e!205774))

(assert (=> start!33718 true))

(declare-fun tp_is_empty!6905 () Bool)

(assert (=> start!33718 tp_is_empty!6905))

(assert (=> start!33718 tp!24363))

(declare-datatypes ((V!10183 0))(
  ( (V!10184 (val!3497 Int)) )
))
(declare-datatypes ((ValueCell!3109 0))(
  ( (ValueCellFull!3109 (v!5659 V!10183)) (EmptyCell!3109) )
))
(declare-datatypes ((array!17403 0))(
  ( (array!17404 (arr!8232 (Array (_ BitVec 32) ValueCell!3109)) (size!8584 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17403)

(declare-fun e!205771 () Bool)

(declare-fun array_inv!6118 (array!17403) Bool)

(assert (=> start!33718 (and (array_inv!6118 _values!1525) e!205771)))

(declare-datatypes ((array!17405 0))(
  ( (array!17406 (arr!8233 (Array (_ BitVec 32) (_ BitVec 64))) (size!8585 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17405)

(declare-fun array_inv!6119 (array!17405) Bool)

(assert (=> start!33718 (array_inv!6119 _keys!1895)))

(declare-fun b!335229 () Bool)

(declare-fun e!205772 () Bool)

(declare-fun e!205770 () Bool)

(assert (=> b!335229 (= e!205772 e!205770)))

(declare-fun res!184952 () Bool)

(assert (=> b!335229 (=> (not res!184952) (not e!205770))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3182 0))(
  ( (MissingZero!3182 (index!14907 (_ BitVec 32))) (Found!3182 (index!14908 (_ BitVec 32))) (Intermediate!3182 (undefined!3994 Bool) (index!14909 (_ BitVec 32)) (x!33404 (_ BitVec 32))) (Undefined!3182) (MissingVacant!3182 (index!14910 (_ BitVec 32))) )
))
(declare-fun lt!159756 () SeekEntryResult!3182)

(assert (=> b!335229 (= res!184952 (and (is-Found!3182 lt!159756) (= (select (arr!8233 _keys!1895) (index!14908 lt!159756)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17405 (_ BitVec 32)) SeekEntryResult!3182)

(assert (=> b!335229 (= lt!159756 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!335230 () Bool)

(declare-fun res!184953 () Bool)

(assert (=> b!335230 (=> (not res!184953) (not e!205774))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335230 (= res!184953 (and (= (size!8584 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8585 _keys!1895) (size!8584 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11754 () Bool)

(declare-fun mapRes!11754 () Bool)

(declare-fun tp!24362 () Bool)

(declare-fun e!205773 () Bool)

(assert (=> mapNonEmpty!11754 (= mapRes!11754 (and tp!24362 e!205773))))

(declare-fun mapValue!11754 () ValueCell!3109)

(declare-fun mapRest!11754 () (Array (_ BitVec 32) ValueCell!3109))

(declare-fun mapKey!11754 () (_ BitVec 32))

(assert (=> mapNonEmpty!11754 (= (arr!8232 _values!1525) (store mapRest!11754 mapKey!11754 mapValue!11754))))

(declare-fun b!335231 () Bool)

(declare-fun e!205776 () Bool)

(assert (=> b!335231 (= e!205771 (and e!205776 mapRes!11754))))

(declare-fun condMapEmpty!11754 () Bool)

(declare-fun mapDefault!11754 () ValueCell!3109)

